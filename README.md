# flutter_bilibili_ui
> 本项目参考自教程 [Flutter高级进阶实战 仿哔哩哔哩APP](https://coding.imooc.com/class/487.html)

## 环境
- `environment`: `sdk: '>=2.12.0 <3.0.0'` **启用 `Null Safety`**
- `dio`
- `shared_preferences`
- `get`

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

- `Theme` 和 `Colors` 管理

> 教程中放到了 `lib/util/color.dart` 中

增加了 `lib/themes` 目录, 将主题相关 的静态数据放到此处, 并且放到了 `AppColors` 和 `AppThemes` 中;

## 关于 getx
> 上文提到使用 `getx` 是最大的改动, 这主要体现在依赖管理和 `widget` 编写上

首先使用 `get_cli` 创建 `page`:

```bash
get create page:registion
```

执行后就生成了以下文件

```
 registion
├──  bindings
│  └──  registion_binding.dart
├──  controllers
│  └──  registion_controller.dart
└──  views
   └──  registion_view.dart
```

`registion_controller.dart`:

```dart
import 'package:get/get.dart';

class RegistionController extends GetxController {
  //TODO: Implement LoginController

  RxString username = ''.obs;
  RxString password = ''.obs;
  RxString confirmPassword = ''.obs;
  RxString imoocID = ''.obs;
  RxString imoocOrderID = ''.obs;
  RxBool passwordFocus = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
```

在 `controller` 中包含了页面的数据层, 这也是此页面可访问的状态数据, 实际上 `controller` 替代了 `StatefullWidget` 中的 `state`, 所以 `registion_view.dart` 中的 `RegistionView` 其实是 `StatelessWidget`

`registion_view.dart`:

```dart
class RegistionView extends GetView<RegistionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ...
      body: Controller(child: Obx(() {
        String imageSuffix =
            controller.passwordFocus.value ? 'password' : 'account';
        return Image.asset(
            'assets/images/login_logo_${imageSuffix}.png');
      }))
    );
  }
}
```

## refer
- [`Flutter` 中 `shared_preferences` 同步使用](https://www.jianshu.com/p/53d753119c3c)
