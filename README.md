# flutter_bilibili_ui
> 本项目参考自教程 [Flutter高级进阶实战 仿哔哩哔哩APP](https://coding.imooc.com/class/487.html)

## 说明
### 与教程中的项目的不同之处

- 使用 `Flutter 2.x`

```bash
Flutter 2.0.5 • channel stable • https://github.com/flutter/flutter.git
Framework • revision adc687823a (2 months ago) • 2021-04-16 09:40:20 -0700
Engine • revision b09f014e96
Tools • Dart 2.12.3
```

- 启用 `null safety`

```yaml
environment: 
  sdk: '>=2.12.0 <3.0.0'
```

- 使用 [getx](https://pub.flutter-io.cn/packages/get), 并使用 [get_cli](https://pub.flutter-io.cn/packages/get_cli) 已 [getx_pattern](https://kauemurakami.github.io/getx_pattern/) 为模板创建项目; <span style="color: red;">**这也是最大的改动, `getx` 是一个简单强大且零依赖的库, 现已是 `most liked package`**</span>

## refer
- [`Flutter` 中 `shared_preferences` 同步使用](https://www.jianshu.com/p/53d753119c3c)
