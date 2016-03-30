//
//  LMFMeViewController.m
//  百思不得其姐
//
//  Created by lumf on 16/3/28.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFMeViewController.h"
#import "UIBarButtonItem+LMFExtension.h"

@implementation LMFMeViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = LMFGlobalBg;
    self.navigationItem.title = NSLocalizedString(@"我的", nil);
    UIBarButtonItem *barItem1 = [UIBarButtonItem itemWithImage:@"mine-setting-icon" selectImage:@"mine-setting-icon-click" target:self method:NSSelectorFromString(@"clickSetting")];
    UIBarButtonItem *barItem2 = [UIBarButtonItem itemWithImage:@"mine-moon-icon" selectImage:@"mine-moon-icon-click" target:self method:NSSelectorFromString(@"clickMoon")];
    self.navigationItem.rightBarButtonItems = @[barItem1,barItem2];
}

-(void)clickSetting{
    LMFFunction;
}

-(void)clickMoon{
    LMFFunction;
}

@end
