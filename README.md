# PacmanProgress

一个长得像吃豆人的进度条

## 使用

File > Swift Packages > Add Package Dependency: https://github.com/aruis/PacmanProgress.git

![CleanShot-2022-06-09-22 11 43](https://user-images.githubusercontent.com/1785495/172867898-36ff3bca-c4b2-4bce-8c27-ce3b7e15db4f.png)

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
