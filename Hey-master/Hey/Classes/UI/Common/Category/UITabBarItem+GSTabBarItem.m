//
//  UITabBarItem+GSTabBarItem.m
//  GSTabbarDemo
//
//  Created by 陈JJ on 2018/11/21.
//  Copyright © 2018年 陈JJ. All rights reserved.
//

#define IOS_VERSION ([[[UIDevice currentDevice] systemVersion] doubleValue])

#import "UITabBarItem+GSTabBarItem.h"
#import "UIBarItem+GSBarItem.h"
#import <objc/runtime.h>

@implementation UITabBarItem (GSTabBarItem)


- (UIImageView *)gs_imageView {
    return [self.class gs_imageViewInTabBarButton:self.gs_view];
}

+ (UIImageView *)gs_imageViewInTabBarButton:(UIView *)tabBarButton {
    
    if (!tabBarButton) {
        return nil;
    }
    
    for (UIView *subview in tabBarButton.subviews) {
        // iOS10及以后，imageView都是用UITabBarSwappableImageView实现的，所以遇到这个class就直接拿
        if ([NSStringFromClass([subview class]) isEqualToString:@"UITabBarSwappableImageView"]) {
            return (UIImageView *)subview;
        }
        
        if (IOS_VERSION < 10) {
            // iOS10以前，选中的item的高亮是用UITabBarSelectionIndicatorView实现的，所以要屏蔽掉
            if ([subview isKindOfClass:[UIImageView class]] && ![NSStringFromClass([subview class]) isEqualToString:@"UITabBarSelectionIndicatorView"]) {
                return (UIImageView *)subview;
            }
        }
        
    }
    return nil;
}

static char kAssociatedObjectKey_doubleTapBlock;
- (void)setGs_doubleTapBlock:(void (^)(UITabBarItem *, NSInteger))gs_doubleTapBlock {
    objc_setAssociatedObject(self, &kAssociatedObjectKey_doubleTapBlock, gs_doubleTapBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UITabBarItem *, NSInteger))gs_doubleTapBlock {
    return (void (^)(UITabBarItem *, NSInteger))objc_getAssociatedObject(self, &kAssociatedObjectKey_doubleTapBlock);
}

@end
