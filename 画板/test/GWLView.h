//
//  GWLView.h
//  test
//
//  Created by GWL on 2017/2/23.
//  Copyright © 2017年 GWL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GWLView : UIView

// 清屏
- (void)clear;
// 回退
- (void)back;
// 橡皮
- (void)earser;

@property (nonatomic,assign) CGFloat lineWidth;// 线宽

@property (nonatomic,strong) UIColor *lineColor;// 颜色

@end
