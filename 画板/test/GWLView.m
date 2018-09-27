//
//  GWLView.m
//  test
//
//  Created by GWL on 2017/2/23.
//  Copyright © 2017年 GWL. All rights reserved.
//

#import "GWLView.h"
#import "GWLBezierPath.h"

@interface GWLView()

@property (nonatomic,strong) NSMutableArray *paths;

@end

@implementation GWLView

-(NSMutableArray *)paths
{
    if (!_paths)
    {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取出没对象
    UITouch *t = touches.anyObject;
    // 获取出没位置
    CGPoint p = [t locationInView:t.view];
    
    GWLBezierPath *path = [GWLBezierPath bezierPath];
    
    // 设置起点
    [path moveToPoint:p];
    
    // 设置线宽
    [path setLineWidth:self.lineWidth];
    
    // 设置颜色
    [path setLineColor:self.lineColor];
    
    // 把每一条创建的路径 添加到数组中
    [self.paths addObject:path];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 获取出没对象
    UITouch *t = touches.anyObject;
    // 获取出没位置
    CGPoint p = [t locationInView:t.view];
    
    // 将路径添加到最新的手指的位置
    [[self.paths lastObject] addLineToPoint:p];
    
    // 重绘
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    for (int i = 0; i < self.paths.count; i ++)
    {
        // 获取路径
        GWLBezierPath *path = self.paths[i];
        
        // 设置不同路径的颜色
        [path.lineColor set];
        
        // 设置连接处的样式
        [path setLineJoinStyle:kCGLineJoinRound];
        
        // 设置头尾的样式
        [path setLineCapStyle:kCGLineCapRound];
        
        // 渲染
        [path stroke];
    }
}

// 清屏
- (void)clear
{
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}
// 回退
- (void)back
{
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}
// 橡皮
- (void)earser
{
    self.lineColor = self.backgroundColor;
}

@end
