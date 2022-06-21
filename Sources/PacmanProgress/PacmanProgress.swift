//
//  SwiftUIView.swift
//  
//
//  Created by Liu Rui on 2022/6/8.
//

import SwiftUI

public struct PacmanProgress: View {
    
    @Binding var progress:Float
    
    var displayType:DisplayType
    
    let pacmanSize = 35.0
    let dotSize = 10.0
    
    var frameHeight:CGFloat
    
    public init (progress:Binding<Float> , displayType:DisplayType ){
        self._progress = progress
        self.displayType = displayType
        
        switch displayType {
        case .standard(_,_):
            frameHeight = pacmanSize
        case .mini(_,_):
            frameHeight = dotSize
        }
        
    }
    
    public var body: some View {
        GeometryReader{ geometry in
            let size = geometry.size
            
            let dotCount:Int = ( Int(size.width / dotSize ) - 1)/2
            let spacing = (size.width - CGFloat(dotCount) * dotSize)/(CGFloat(dotCount)-1)
            
            
            HStack(spacing: spacing ){
                ForEach(0..<dotCount,id:\.self){ index in
                    
                    switch displayType {
                    case .standard(_,let dotColor):
                        Circle()
                            .frame(width: dotSize, height: dotSize)
                            .foregroundColor(dotColor)
                            .opacity( CGFloat(index) * dotSize + CGFloat(index-1)*CGFloat(spacing) - dotSize/2  < size.width * CGFloat(progress) + pacmanSize/2 ? 0 : 1)
                            .animation(.default.delay(0.35), value: progress)
                        
                    case .mini(let pacmanColor,let dotColor):
                        if Float(index) < Float(dotCount) * progress  {
                            Circle()
                                .frame(width: dotSize, height: dotSize)
                                .foregroundColor(pacmanColor)
                        } else if Float(index) < Float(dotCount) * progress + 1{
                            Pacman()
                                .frame(width: dotSize, height: dotSize)
                                .foregroundColor(pacmanColor)
                        } else if Float(index) > Float(dotCount) * progress {
                            Circle()
                                .frame(width: dotSize, height: dotSize)
                                .foregroundColor(dotColor)
                                
                        }
                        
                    }
                    
                    
                }
            }
            .animation(.default, value: progress)
            .position(x: size.width/2 ,y: size.height/2)
            .overlay(alignment: .center){
                switch displayType {
                case .standard(let pacmanColor,_):
                    Pacman()
                        .frame(width: pacmanSize, height: pacmanSize)
                        .foregroundColor(pacmanColor)
                        .offset(x: size.width * CGFloat(progress) - size.width/2 + pacmanSize / 2 )
                        .animation(.default, value: progress)
                    
                default:
                    EmptyView()
                }
                
            }
        }
        .frame(height: frameHeight)
        .clipped()
        
    }
}

public enum DisplayType{
    
    case standard(pacmanColor:Color,dotColor:Color)
    case mini(pacmanColor:Color,dotColor:Color)
}

struct PacmanProgress_Preview: PreviewProvider {
    static var previews: some View {
        PacmanProgress(progress: .constant(0.2),displayType: .mini(pacmanColor:.yellow,dotColor:.gray))
        PacmanProgress(progress: .constant(0.2),displayType: .standard(pacmanColor:.yellow,dotColor:.gray))
        
    }
}
