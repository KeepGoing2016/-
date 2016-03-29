//
//  LMFFriendTrendsViewController.m
//  百思不得其姐
//
//  Created by lumf on 16/3/28.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFFriendTrendsViewController.h"

@implementation LMFFriendTrendsViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = NSLocalizedString(@"我的关注", nil);
    }
    return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = LMFRandomColor;
}
@end
