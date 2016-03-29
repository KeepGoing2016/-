//
//  LMFTabBarController.m
//  百思不得其姐
//
//  Created by lumf on 16/3/28.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFTabBarController.h"
#import "LMFEssenceViewController.h"
#import "LMFFriendTrendsViewController.h"
#import "LMFNewViewController.h"
#import "LMFMeViewController.h"
#import "LMFTabBar.h"
#import "LMFNavigationController.h"

@implementation LMFTabBarController
-(void)viewDidLoad{
    [super viewDidLoad];
    
//    self.tabBar = [[LMFTabBar alloc]init];
    [self setValue:[[LMFTabBar alloc]init] forKey:@"tabBar"];
    [self setupChildenViews];
}

-(void)setupChildenViews{
//    LMFDEBUGLOG(@"%@",self.tabBar);
    //1、精华
    [self addChildVIewController:[[LMFEssenceViewController alloc]init] itemTitle:NSLocalizedString(@"精华", nil) image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon"];
    //1、新帖
    [self addChildVIewController:[[LMFNewViewController alloc]init] itemTitle:NSLocalizedString(@"新帖", nil) image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon"];
    //1、关注
    [self addChildVIewController:[[LMFFriendTrendsViewController alloc]init] itemTitle:NSLocalizedString(@"关注", nil) image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon"];
    //1、我
    [self addChildVIewController:[[LMFMeViewController alloc]init] itemTitle:NSLocalizedString(@"我", nil) image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
}

-(void)addChildVIewController:(UIViewController *)vc itemTitle:(NSString *)title image:(NSString *)imageStr selectedImage:(NSString *)selectImageStr{
    
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSForegroundColorAttributeName]= [UIColor grayColor];
    [vc.tabBarItem setTitleTextAttributes:dictM forState:UIControlStateSelected];
    vc.tabBarItem.image = [UIImage imageNamed:imageStr];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImageStr];
    LMFNavigationController *nav = [[LMFNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nav];

}

@end
