//
//  LoadingView.h
//  PlantsnoteDemo
//
//  Created by 大竹 雅登 on 13/06/15.
//  Copyright (c) 2013年 Masato Otake. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface LoadingView : UIView

- (void)show;
- (void)hide;

- (id)initWithTitle:(NSString *)title;

@end
