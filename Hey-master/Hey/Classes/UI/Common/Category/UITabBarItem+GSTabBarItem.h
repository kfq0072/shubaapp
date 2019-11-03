//
//  UITabBarItem+GSTabBarItem.h
//  GSTabbarDemo
//
//  Created by 陈JJ on 2018/11/21.
//  Copyright © 2018年 陈JJ. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBarItem (GSTabBarItem)

/**
 *  双击 tabBarItem 时的回调，默认为 nil。
 *  @arg tabBarItem 被双击的 UITabBarItem
 *  @arg index      被双击的 UITabBarItem 的序号
 */
@property(nonatomic, copy) void (^gs_doubleTapBlock)(UITabBarItem *tabBarItem, NSInteger index);

/**
 * 获取一个UITabBarItem内显示图标的UIImageView，如果找不到则返回nil
 * @warning 需要对nil的返回值做保护
 */
- (UIImageView *)gs_imageView;

+ (UIImageView *)gs_imageViewInTabBarButton:(UIView *)tabBarButton;

@end

NS_ASSUME_NONNULL_END
