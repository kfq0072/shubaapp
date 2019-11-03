//
//  UIBarItem+GSBarItem.m
//  GSTabbarDemo
//
//  Created by 陈JJ on 2018/11/21.
//  Copyright © 2018年 陈JJ. All rights reserved.
//

#import "UIBarItem+GSBarItem.h"

@implementation UIBarItem (GSBarItem)

- (UIView *)gs_view {
    return [self valueForKey:@"view"];
}

@end
