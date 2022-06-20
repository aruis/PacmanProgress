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
    
    
    public init (progress:Binding<Float> , displayType:DisplayType ){
        self._progress = progress
        self.displayType = displayType
    }
    
    public var body: some View {
        GeometryReader{ geometry in
            let size = geometry.size
            let pacmanSize = size.width / 10
            let dotCount:Int = Int(size.width / 17)
            
            
            HStack{
                ForEach(0...dotCount,id:\.self){ index in
                    
                    switch displayType {
                    case .standard(_,let dotColor):
                        Circle()
                            .foregroundColor(dotColor)
                            .opacity(Float(index) < (Float(dotCount) * progress ) + 1 ? 0 : 1)
                        
                    case .mini(let pacmanColor,let dotColor):
                        if Float(index) < Float(dotCount) * progress  {
                            Circle()
                                .foregroundColor(pacmanColor)
                        } else if Float(index) < Float(dotCount) * progress + 1{
                            Pacman()
                                .foregroundColor(pacmanColor)
                        } else if Float(index) > Float(dotCount) * progress {
                            Circle()
                                .foregroundColor(dotColor)
                        }
                        
                    }
                    
                    
                }
            }
            .frame(height: pacmanSize)
            .overlay(alignment: .center){
                switch displayType {
                case .standard(let pacmanColor,_):
                    Pacman()
                        .frame(width: pacmanSize, height: pacmanSize)
                        .foregroundColor(pacmanColor)
                        .offset(x: size.width * CGFloat(progress) - size.width/2  )
                    
                default:
                    EmptyView()
                }
                
            }
            .animation(.default, value: progress)
            
        }
        
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
