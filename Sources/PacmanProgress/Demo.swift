//
//  SwiftUIView.swift
//  
//
//  Created by Liu Rui on 2022/6/9.
//

import SwiftUI

struct Demo: View {
    
    @State var procress:Float = 0.1
    
    var body: some View {
        VStack{
            PacmanProgress(progress: $procress,displayType: .mini(pacmanColor: .yellow,dotColor: .gray))
            
            PacmanProgress(progress: $procress,displayType: .standard(pacmanColor: .yellow,dotColor: .gray))
            Button("TEST", action: {
                procress += 0.05
            })
        }.frame(width: 400, height: 400)
        
    }
}

struct Demo_Previews: PreviewProvider {
    static var previews: some View {
        Demo()
    }
}
