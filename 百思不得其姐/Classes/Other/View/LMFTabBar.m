//
//  LMFTabBar.m
//  百思不得其姐
//
//  Created by lumf on 16/3/28.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFTabBar.h"

@interface LMFTabBar()
/*中间加号按钮*/
@property (nonatomic, weak) UIButton *addBtn;
@end
@implementation LMFTabBar

+(void)initialize{
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
        UIButton *addBtn = [[UIButton alloc]init];
        [addBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [addBtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        addBtn.bounds = CGRectMake(0, 0, addBtn.currentBackgroundImage.size.width, addBtn.currentBackgroundImage.size.height);
        self.addBtn = addBtn;
        [self addSubview:addBtn];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.addBtn.center = CGPointMake(LMFSreenW/2.0, self.bounds.size.height/2.0);
    int index = 0;
    CGFloat childViewW = LMFSreenW/5.0;
    CGFloat childViewH = self.bounds.size.height;
    for (UIView *childView in self.subviews) {
        if ([childView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            childView.frame = CGRectMake((index>1? (index+1):index)*childViewW, 0, childViewW, childViewH);
            index++;
        }
    }
}

@end
