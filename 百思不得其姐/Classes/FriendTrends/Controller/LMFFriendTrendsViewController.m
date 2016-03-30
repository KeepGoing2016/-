//
//  LMFFriendTrendsViewController.m
//  百思不得其姐
//
//  Created by lumf on 16/3/28.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFFriendTrendsViewController.h"
#import "LMFRecommendController.h"


@implementation LMFFriendTrendsViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = LMFGlobalBg;
    self.navigationItem.title = NSLocalizedString(@"我的关注", nil);
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImage:@"friendsRecommentIcon" selectImage:@"friendsRecommentIcon-click" target:self method:NSSelectorFromString(@"clickFollow")];
    self.navigationItem.leftBarButtonItem = leftItem;
}

-(void)clickFollow{
    LMFFunction;
    LMFRecommendController *recommendController = [[LMFRecommendController alloc]init];
    recommendController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:recommendController animated:YES];
}

@end
