//
//  UIBarItem+GSBarItem.h
//  GSTabbarDemo
//
//  Created by 陈JJ on 2018/11/21.
//  Copyright © 2018年 陈JJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarItem (GSBarItem)

@property(nullable, nonatomic, weak, readonly) UIView *gs_view;

@end

NS_ASSUME_NONNULL_END
