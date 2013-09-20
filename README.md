# LoadingView

シンプルな読み込み用View

読み込み中は、ユーザーにそのことを伝えておくとストレスが軽減されるため、多くのアプリでカスタマイズされたLoadingViewを表示しています。
標準的でシンプルなLoadingViewは以下の手順で簡単に実装できます。

また、非常に単純な実装にしてあるので、自分でいじってさらにリッチにカスタマイズすることも可能です。

サンプルプロジェクトは[こちら](https://github.com/EntreGulss/LoadingViewTest)からダウンロードしてください。

## 必要なファイル
* LoadingView.h
* LoadingView.m

## LoadigViewの初期化
**インスタンス変数を定義**

```ViewController.m
@interface ViewController ()
{   
    LoadingView *loadingView;           // 標準
    LoadingView *loadingViewWithTitle;  // カスタム
}
@end
```

**初期化（標準とカスタムの2つ）**

```ViewController.m
// デフォルトテキストで初期化
    loadingView = [[LoadingView alloc] init];
    loadingView.center = CGPointMake(self.view.center.x, self.view.center.y-40);
    [self.view addSubview:loadingView];
    
    // カスタムテキストで初期化
    loadingViewWithTitle = [[LoadingView alloc] initWithTitle:@"処理中..."];
    loadingViewWithTitle.center = CGPointMake(self.view.center.x, self.view.center.y-40);
    [self.view addSubview:loadingViewWithTitle];
    // 色をカスタム
    loadingViewWithTitle.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.7];
```

**表示・非表示の切り替え**

```ViewController.m
// 表示
[loadingView show];
// 非表示
[loadingView hide];
```

※ 表示・非表示時には拡大縮小のアニメーションにより、ユーザーにとって何をしているかわかりやすいUXになっています。


