//
//  LMFRecommendCategoryModel.h
//  百思不得其姐
//
//  Created by lumf on 16/3/31.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMFRecommendCategoryModel : NSObject
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSMutableArray *follows;
@property (nonatomic, assign) NSInteger currenPage;
@property (nonatomic, assign) NSInteger total_page;

@end
