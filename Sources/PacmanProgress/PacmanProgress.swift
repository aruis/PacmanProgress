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
            let dotCount:Int = Int(size.width / 15)
            ZStack{
                HStack{
                    ForEach(1...dotCount,id:\.self){ index in
                        
                        switch displayType {
                        case .standard(_,let dotColor):
                            Circle()
                                .foregroundColor(dotColor)
                                .opacity(Float(index) < (Float(dotCount) * progress ) + 2 ? 0 : 1)
                            
                        case .mini(let pacmanColor,let dotColor):
                            if Float(index) < Float(dotCount) * progress - 1 {
                                Circle()
                                    .foregroundColor(pacmanColor)
                            } else if Float(index) < Float(dotCount) * progress{
                                Pacman()
                                    .foregroundColor(pacmanColor)
                            } else if Float(index) > Float(dotCount) * progress {
                                Circle()
                                    .foregroundColor(dotColor)
                            }

                        }
                        
                        
                    }
                }
                
                switch displayType {
                case .standard(let pacmanColor,_):
                    Pacman()
                        .frame(width: pacmanSize, height: pacmanSize)
                        .foregroundColor(pacmanColor)
                        .position(x:  size.width * CGFloat(progress)  ,y:size.height/2)

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
