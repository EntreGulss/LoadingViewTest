//
//  ViewController.m
//  LoadingViewTest
//
//  Created by 大竹 雅登 on 13/09/20.
//  Copyright (c) 2013年 ;. All rights reserved.
//

#import "ViewController.h"

#import "LoadingView.h"

@interface ViewController ()
{
    IBOutlet UIBarButtonItem *reloadButton1;
    IBOutlet UIBarButtonItem *reloadButton2;
    
    LoadingView *loadingView;           // 標準
    LoadingView *loadingViewWithTitle;  // カスタム
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
}

// デフォルトテキストのLoadingViewを表示
- (IBAction)reloadButtonAction1:(id)sender {
    [loadingView show];
    
    // ボタンを無効化
    reloadButton1.enabled = NO;
    reloadButton2.enabled = NO;
}
// カスタムテキストのLoadingViewを表示
- (IBAction)reloadButtonAction2:(id)sender {
    [loadingViewWithTitle show];
    
    // ボタンを無効化
    reloadButton1.enabled = NO;
    reloadButton2.enabled = NO;
}

// キャンセルボタン
- (IBAction)cancelButtonAction:(id)sender {
    [loadingView hide];
    [loadingViewWithTitle hide];
    
    // ボタンを有効化
    reloadButton1.enabled = YES;
    reloadButton2.enabled = YES;
}

@end
