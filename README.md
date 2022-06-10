# PacmanProgress

一个长得像吃豆人的进度条

## 使用

File > Swift Packages > Add Package Dependency: https://github.com/aruis/PacmanProgress.git

两种模式：
* 简约模式
* 标准模式

![CleanShot-2022-06-10-15 40 53](https://user-images.githubusercontent.com/1785495/173015912-7a2d23e2-0faa-4bac-8814-8f83c569a21e.gif)


## 例子

```swift
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


```
