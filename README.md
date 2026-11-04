# TCA

SwiftUI と The Composable Architecture（TCA）を使って、状態管理・アクション・副作用・依存性注入を学ぶための iOS サンプルアプリです。

## 実装内容

### カウンター

アプリ起動時に表示される画面です。`+` / `-` で値を増減し、`Reset` で 0 に戻します。`CounterFeature` が状態とアクションを管理し、`CounterView` から `Store` にアクションを送ります。

### 商品一覧

`ProductFeature` と `ProductView` に、商品の非同期取得、読み込み中の表示、エラー表示を実装しています。`@Dependency` で注入する `ProductClient` は、現在 Apple（150 円）と Banana（100 円）の固定データを返します。外部 API への通信は行いません。

商品一覧は起動画面からの遷移にはまだ接続されていません。

## 主なファイル

| ファイル | 役割 |
| --- | --- |
| `TCA/TCAApp.swift` | 起動時の Store 作成とカウンター画面の表示 |
| `TCA/CounterFeature.swift` | カウンターの State・Action・Reducer |
| `TCA/CounterView.swift` | カウンター画面 |
| `TCA/CounterViewModel.swift` | Observable なクラスによるカウンター実装（起動画面では未使用） |
| `TCA/ProductFeature.swift` | 商品取得の状態管理と非同期処理 |
| `TCA/ProductClient.swift` | 商品取得の依存性定義と固定データの実装 |
| `TCA/Product.swift` | 商品モデル |
| `TCA/ProductView.swift` | 商品一覧画面 |
| `TCATests/` | ユニットテスト用ターゲット |
| `TCAUITests/` | UI テスト用ターゲット |

## テスト

現在のテストは Xcode のテンプレートを中心とした内容です。Reducer の状態遷移や商品取得の成功・失敗を検証するテストは未実装です。
