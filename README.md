# TCA

SwiftUI と The Composable Architecture（TCA）を使って、状態管理・アクション・副作用・依存性注入を学ぶための iOS サンプルアプリです。

## 実装内容

### カウンター

アプリ起動時に表示される画面です。`+` / `-` で値を増減し、`Reset` で 0 に戻します。`CounterFeature` が状態とアクションを管理し、`CounterView` から `Store` にアクションを送ります。

### 商品一覧

`ProductFeature` と `ProductView` に、商品の非同期取得、読み込み中の表示、エラー表示を実装しています。`@Dependency` で注入する `ProductClient` は、現在 Apple（150 円）と Banana（100 円）の固定データを返します。外部 API への通信は行いません。

商品一覧は起動画面からの遷移にはまだ接続されていません。

## 開発環境

- macOS / Xcode（プロジェクトの iOS 26.5 SDK・ビルド設定に対応する環境）
- 実行対象: iOS 26.5 以降の iPhone / iPad またはシミュレーター
- Swift / SwiftUI（プロジェクトの Swift 言語モードは 5）
- The Composable Architecture: `Package.resolved` での解決済みバージョンは 1.26.2

依存パッケージは Swift Package Manager で管理しています。

## 実行方法

1. リポジトリをクローンして、Xcode プロジェクトを開きます。非公開リポジトリのため、アクセス権のある GitHub アカウントで認証してください。

   ```sh
   git clone https://github.com/Tomoaki-g/TCA.git
   cd TCA
   open TCA.xcodeproj
   ```

2. Xcode でパッケージの解決が完了するまで待ちます。
3. スキーム `TCA` と、iOS 26.5 以降のシミュレーターを選択します。
4. `⌘R` で起動します。カウンター画面が表示されます。

実機で実行する場合は、ターゲットの **Signing & Capabilities** で自身の開発チームと、必要に応じて Bundle Identifier を設定してください。

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

Xcode でスキーム `TCA` と対応するシミュレーターを選び、`⌘U` でテストを実行できます。

現在のテストは Xcode のテンプレートを中心とした内容です。Reducer の状態遷移や商品取得の成功・失敗を検証するテストは未実装です。
