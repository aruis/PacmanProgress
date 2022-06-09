//
//  SwiftUIView.swift
//  
//
//  Created by Liu Rui on 2022/6/8.
//

import SwiftUI

struct Pacman: View {
    
    @State var eat = true
    
    var body: some View {
        GeometryReader{geometry in
            let size = geometry.size
            ZStack{
                Circle()
                    .trim(from: 0.5, to: 1)
                    .rotation(.degrees(eat ? 0 :  -45))
                Circle()
                    .trim(from: 0, to: 0.5)
                    .rotation(.degrees(eat ? 0 :45))
            }
            .animation(.easeInOut(duration: 0.5).repeatForever(), value: eat)
            .onAppear{
                eat.toggle()
            }
            
        }
    }
}

struct Pacman_Previews: PreviewProvider {
    static var previews: some View {
        Pacman().foregroundColor(.blue)
    }
}
