//
//  LMFNewViewController.m
//  百思不得其姐
//
//  Created by lumf on 16/3/28.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFNewViewController.h"

@implementation LMFNewViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = LMFGlobalBg;
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    UIBarButtonItem *leftBarButtonItem = [UIBarButtonItem itemWithImage:@"MainTagSubIcon" selectImage:@"MainTagSubIconClick" target:self method:NSSelectorFromString(@"clickLeftBarButtonItem")];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
}

-(void)clickLeftBarButtonItem{
    LMFFunction;
}

@end
