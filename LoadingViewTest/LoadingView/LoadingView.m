//
//  LoadingView.m
//  PlantsnoteDemo
//
//  Created by 大竹 雅登 on 13/06/15.
//  Copyright (c) 2013年 Masato Otake. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView ()

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@property (nonatomic, strong) UILabel *loadingLabel;

@end

@implementation LoadingView

//--------------------------------------------------------------//
#pragma mark - 初期化
//--------------------------------------------------------------//
- (id)init
{
    self = [super init];
    if (self) {
        // 共通処理
        [self _init];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    // サイズを固定（120）
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 120, 120)];
    if (self) {
        // 共通処理
        [self _init];
    }
    return self;
}
- (id)initWithTitle:(NSString *)title {
    self = [super initWithFrame:CGRectMake(0, 0, 120, 120)];
    if (self) {
        // 共通処理
        [self _init];
        // 指定したテキスト
        _loadingLabel.text = title;
    }
    return self;
}

// 共通初期化処理
- (void)_init
{
    // はじめは透明で非表示
    self.alpha = 0;
    
    // 背景色（透過の黒）
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    
    // ラベルの設定
    _loadingLabel = [UILabel new];
    _loadingLabel.textColor = [UIColor whiteColor];
    _loadingLabel.backgroundColor = [UIColor clearColor];
    _loadingLabel.font = [UIFont boldSystemFontOfSize:18.0f];
    _loadingLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_loadingLabel];
    
    // インジケーターの設定
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self addSubview:_activityIndicatorView];
}


//--------------------------------------------------------------//
#pragma mark - 描画
//--------------------------------------------------------------//
- (void)drawRect:(CGRect)rect
{
    // self
    self.layer.cornerRadius = 10;
    self.clipsToBounds = YES;
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    
    // Indicator
    _activityIndicatorView.frame = CGRectMake(0, 0, self.frame.size.width, 90);
    [_activityIndicatorView startAnimating];

    // LoadingLabel
    if ([_loadingLabel.text isEqualToString:@""] || _loadingLabel.text == nil) {
        _loadingLabel.text = @"Loading...";
    }
    _loadingLabel.frame = CGRectMake(0, self.frame.size.height-50, self.frame.size.width, 23);
}

//--------------------------------------------------------------//
#pragma mark - 表示・非表示
//--------------------------------------------------------------//
- (void)show
{
    // くるくるさせる
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    // 透明度
    [UIView animateWithDuration:0.15 animations:^(void){
        self.alpha = 1;
    }completion:nil];
    
    // 拡大縮小を設定
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animation.duration = 0.15; // アニメーション速度
    animation.repeatCount = 1; // 繰り返し回数
    animation.fromValue = [NSNumber numberWithFloat:0.7]; // 開始時の倍率
    animation.toValue = [NSNumber numberWithFloat:1]; // 終了時の倍率
    [self.layer addAnimation:animation forKey:@"scale-layer"];
}

- (void)hide
{
    // くるくるを消す
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    // 透明度
    [UIView animateWithDuration:0.15 animations:^(void){
        self.alpha = 0;
    }completion:nil];
    
    // 拡大縮小を設定
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.duration = 0.15; // アニメーション速度
    animation.repeatCount = 1; // 繰り返し回数
    animation.fromValue = [NSNumber numberWithFloat:1]; // 開始時の倍率
    animation.toValue = [NSNumber numberWithFloat:0.7]; // 終了時の倍率
    [self.layer addAnimation:animation forKey:@"scale-layer"];
}

@end
