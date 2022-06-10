//
//  SwiftUIView.swift
//  
//
//  Created by Liu Rui on 2022/6/9.
//

import SwiftUI

struct Demo: View {
    
    @State var progress:Float = 0
    
    var body: some View {
        VStack{
            PacmanProgress(progress: $progress,displayType: .mini(pacmanColor: .yellow,dotColor: .gray))
            
            PacmanProgress(progress: $progress,displayType: .standard(pacmanColor: .yellow,dotColor: .gray))
            Button("TEST", action: {
                progress += 0.05
            })
        }
        .frame(height: 400)
        
    }
}

struct Demo_Previews: PreviewProvider {
    static var previews: some View {
        Demo()
    }
}
