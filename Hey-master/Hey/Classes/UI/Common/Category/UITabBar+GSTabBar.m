//
//  UITabBar+GSTabBar.m
//  GSTabbarDemo
//
//  Created by 陈JJ on 2018/11/21.
//  Copyright © 2018年 陈JJ. All rights reserved.
//

#import "UITabBar+GSTabBar.h"

#import "UITabBarItem+GSTabBarItem.h"

@implementation UITabBar (GSTabBar)

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.isUserInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    
    if (self.items.count < 2) {
        return [super hitTest:point withEvent:event];
    }
    
    UITabBarItem *item = self.items[2];
    UIImageView *itemImageView  = [item gs_imageView];
    
    if (!itemImageView) {
        return [super hitTest:point withEvent:event];
    }
    
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil){
        //转换坐标
        CGPoint tempPoint = [itemImageView convertPoint:point fromView:self];
        //判断点击的点是否在按钮区域内
        if (CGRectContainsPoint(itemImageView.bounds, tempPoint)){
            //返回按钮
            return itemImageView;
        }
        
        //******************    或者使用这个方法     ****************
        
        //判断如果这个新的点是在发布按钮身上，那么处理点击事件最合适的view就是发布按钮
        if ([itemImageView pointInside:point withEvent:event]) {
            return itemImageView;
        }else{//如果点不在发布按钮身上，直接让系统处理就可以了
            return [super hitTest:point withEvent:event];
        }
    }
    return view;
}

@end
