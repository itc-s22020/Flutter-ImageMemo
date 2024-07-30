# image_memo
画像付きのメモを作成するアプリケーション

**[DEMO](https://flutter-image-memo.vercel.app/)**
## 1. 目的
- segbastとgetXのテストの為に実装
- pwaとsegbastの動作確認
## 2. 機能
- 画像付きのメモを作成する
## 3. 未実装
- メモの管理(編集削除)
- 処理中のロード表示
## 4. パッケージ構造
```
.
├── main.dart
├── component
│   └── image_pick.dart
├── getx
│   ├── image_controller.dart
│   ├── memo_controller.dart
│   └── navigation.dart
├── page
│   ├── home.dart
│   └── memo_add.dart
└── sembast
    ├── memo.dart
    └── memo_db.dart
```
