//
//  TabBarViewController.m
//  Hey
//
//  Created by Ascen on 2017/1/12.
//  Copyright © 2017年 Ascen. All rights reserved.
//

#import "TabBarViewController.h"

#import "SessionViewController.h"
#import "ContactsViewController.h"
#import "StatusViewController.h"
#import "ProfileViewController.h"
#import "HBK_ShoppingCartViewController.h"

#import "UIColor+Help.h"

#define UIImageMake(img) [UIImage imageNamed:img inBundle:nil compatibleWithTraitCollection:nil]


@interface TabBarViewController ()<UINavigationControllerDelegate,UITabBarControllerDelegate>

@end

@implementation TabBarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController* sessionVC = [[SessionViewController alloc] init];
    [sessionVC setTitle:@"Hey"];
    UINavigationController *sessionNav = [[UINavigationController alloc] initWithRootViewController:sessionVC];
    sessionNav.tabBarItem.image = [UIImage imageNamed:@"icon_chat"];
    [self addChildViewController:sessionNav];
    
    UIViewController* contactsVC = [[ContactsViewController alloc] init];
    [contactsVC setTitle:@"通讯录"];
    UINavigationController *contactsNav = [[UINavigationController alloc] initWithRootViewController:contactsVC];
    contactsNav.tabBarItem.image = [UIImage imageNamed:@"icon_contact"];
    [self addChildViewController:contactsNav];
    
    UIViewController *statusVC = [[StatusViewController alloc] initWithFromMyStatus:NO];
    [statusVC setTitle:KFLocalizedString(@"main_tab_fabu")];
    UINavigationController *statusNav = [[UINavigationController alloc] initWithRootViewController:statusVC];
    statusNav.tabBarItem.image = [UIImage imageNamed:@"icon_status"];
    [self addChildViewController:statusNav];
    
    UIViewController *statusVC2 = [[HBK_ShoppingCartViewController alloc] init];
    [statusVC setTitle:KFLocalizedString(@"购物车")];
    UINavigationController *statusNav2 = [[UINavigationController alloc] initWithRootViewController:statusVC2];
    statusNav.tabBarItem.image = [UIImage imageNamed:@"icon_status"];
    [self addChildViewController:statusNav2];
    
    UIViewController* profileVC = [[ProfileViewController alloc] init];
    [profileVC setTitle:@"我"];
    UINavigationController *profileNav = [[UINavigationController alloc] initWithRootViewController:profileVC];
    profileNav.tabBarItem.image = [UIImage imageNamed:@"icon_me"];
    [self addChildViewController:profileNav];
    
    [self.tabBar setTintColor:[UIColor colorWithHex:0x4990E2]];
    [self.tabBar setUnselectedItemTintColor:[UIColor colorWithHex:0xCCC9CD]];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - system callback

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    UITabBarItem *item = self.tabBar.items[2];
    item.imageInsets = UIEdgeInsetsMake(-30, 0, 0, 0);
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

#pragma mark - private method

- (void)itemMiddleTap {
    self.selectedIndex = 2;
}

- (UITabBarItem *)tabBarItemWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage tag:(NSInteger)tag {
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image tag:tag];
    tabBarItem.selectedImage = selectedImage;
    return tabBarItem;
}

#pragma mark - UINavigationControllerDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC {
    if (UINavigationControllerOperationPush == operation) {
        toVC.hidesBottomBarWhenPushed = (navigationController.viewControllers.count >= 0);
    } else {
        fromVC.hidesBottomBarWhenPushed = (navigationController.viewControllers.count >= 1);
    }
    
    return nil;
}

#pragma mark - UITabBarControllerDelegate

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    UITabBarItem *item = tabBarController.tabBar.items[2];
    UIImageView *itemImageView  = [item gs_imageView];
    if (itemImageView && !itemImageView.isUserInteractionEnabled) {
        itemImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemMiddleTap)];
        [itemImageView addGestureRecognizer:tap];
    }
    
    NSLog(@"%p -- isUserInteractionEnabled -> %@",&itemImageView,itemImageView.isUserInteractionEnabled ? @"YES" : @"NO");
    return YES;
}



@end
