//
//  UIBarButtonItem+LMFExtension.h
//  百思不得其姐
//
//  Created by lumf on 16/3/30.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LMFExtension)
+(instancetype)itemWithImage:(NSString *)imageStr selectImage:(NSString *)selectImageStr target:(id)target method:(SEL)method;
@end
