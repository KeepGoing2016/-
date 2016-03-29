//
//  LMFNewViewController.m
//  百思不得其姐
//
//  Created by lumf on 16/3/28.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFNewViewController.h"

@implementation LMFNewViewController
-(instancetype)init{
    if (self=[super init]) {
        self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"MainTitle"]];
    }
    return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = LMFRandomColor;
}
@end
