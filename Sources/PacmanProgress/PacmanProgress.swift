//
//  SwiftUIView.swift
//  
//
//  Created by Liu Rui on 2022/6/8.
//

import SwiftUI

public struct PacmanProgress: View {
    
    @Binding var progress:Float
        
    
    public init (progress:Binding<Float>){
        self._progress = progress
    }
    
    public var body: some View {
        GeometryReader{ geometry in
            let size = geometry.size
            let pacmanSize = size.width / 10
            let dotCount:Int = Int(size.width / 15)
            ZStack{
                HStack{
                    ForEach(1...dotCount,id:\.self){ index in
                        Circle()
                            .foregroundColor(.gray)
                            .opacity(Float(index) < (Float(dotCount) * progress ) + 2 ? 0 : 1)
                    }
                }
                
                Pacman()
                    .frame(width: pacmanSize, height: pacmanSize)
                    .foregroundColor(.yellow)
                    .position(x:  size.width * CGFloat(progress)  ,y:size.height/2)
                  
            }
            .animation(.default, value: progress)
            
        }
        
    }
}

struct PacmanProgress_Preview: PreviewProvider {
    static var previews: some View {
        PacmanProgress(progress: .constant(0.2))
    }
}
