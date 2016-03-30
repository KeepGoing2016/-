//
//  LMFNavigationController.m
//  百思不得其姐
//
//  Created by lumf on 16/3/29.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFNavigationController.h"

@interface LMFNavigationController ()

@end

@implementation LMFNavigationController

+(void)initialize{
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    bar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:20]};
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self.childViewControllers count]>0) {
        UIButton *backBtn = [[UIButton alloc]init];
        [backBtn setTitle:NSLocalizedString(@"返回", nil) forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturn"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateHighlighted];
        [backBtn setTitleColor:LMFRGBAColor(120, 120, 120, 1.0) forState:UIControlStateNormal];
        [backBtn setTitleColor:LMFRGBColor(255, 59,48) forState:UIControlStateHighlighted];
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [backBtn addTarget:self action:@selector(popSelf) forControlEvents:UIControlEventTouchUpInside];
        backBtn.bounds = CGRectMake(0, 0, 100, 30);
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    }
    [super pushViewController:viewController animated:animated];
}

-(void)popSelf{
    [self popViewControllerAnimated:YES];
}

@end
