# PacmanProgress

一个长得像吃豆人的进度条

## 使用

File > Swift Packages > Add Package Dependency: https://github.com/aruis/PacmanProgress.git

![CleanShot-2022-06-09-22 13 29](https://user-images.githubusercontent.com/1785495/172868303-34730d79-8a6b-4b43-977f-7386daad3590.gif)

## 例子

```swift
import SwiftUI

struct Demo: View {
    
    @State var procress:Float = 0.1
    
    var body: some View {
        VStack{
            PacmanProgress(progress: $procress)
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

```
