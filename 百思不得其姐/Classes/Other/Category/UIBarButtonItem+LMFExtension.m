//
//  UIBarButtonItem+LMFExtension.m
//  百思不得其姐
//
//  Created by lumf on 16/3/30.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "UIBarButtonItem+LMFExtension.h"

@implementation UIBarButtonItem (LMFExtension)
+(instancetype)itemWithImage:(NSString *)imageStr selectImage:(NSString *)selectImageStr target:(id)target method:(SEL)method{
    UIButton *customView = [[UIButton alloc]init];
    [customView setBackgroundImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
    [customView setBackgroundImage:[UIImage imageNamed:selectImageStr] forState:UIControlStateHighlighted];
//    customView.bounds = CGRectMake(0, 0, customView.currentBackgroundImage.size.width, customView.currentBackgroundImage.size.height);
    customView.size = customView.currentBackgroundImage.size;
    [customView addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc]initWithCustomView:customView];
}
@end
