//
//  LMFRecommendCategoryModel.m
//  百思不得其姐
//
//  Created by lumf on 16/3/31.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFRecommendCategoryModel.h"

@implementation LMFRecommendCategoryModel
-(NSMutableArray *)follows{
    if (!_follows) {
        _follows = [NSMutableArray array];
    }
    return _follows;
}
@end
