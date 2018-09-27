//
//  ViewController.m
//  test
//
//  Created by GWL on 2017/2/23.
//  Copyright © 2017年 GWL. All rights reserved.
//

#import "ViewController.h"
#import "GWLView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet GWLView *drawView;

@property (weak, nonatomic) IBOutlet UISlider *seliderValue;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.drawView.lineWidth = self.seliderValue.value;
    [self lineColorChange:self.firstButton];
}
- (IBAction)lineColorChange:(UIButton *)sender
{
    self.drawView.lineColor = sender.backgroundColor;
}

// 线宽改变
- (IBAction)lineWidth:(UISlider *)sender
{
    self.drawView.lineWidth = sender.value;
}

// 保存
- (IBAction)save:(id)sender
{
    // 开启图片类型的上下文
    UIGraphicsBeginImageContextWithOptions(self.drawView.bounds.size, NO, 0);
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 截图
    [self.drawView.layer renderInContext:ctx];
    
    // 取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图片类型上下文
    UIGraphicsEndImageContext();
    
    // 保存到相册
    UIImageWriteToSavedPhotosAlbum(image, NULL, NULL, NULL);
}
// 清屏
- (IBAction)clear:(id)sender
{
    [self.drawView clear];
}
// 回退
- (IBAction)back:(id)sender
{
    [self.drawView back];
}
// 橡皮
- (IBAction)earser:(id)sender
{
    [self.drawView earser];
}

@end
