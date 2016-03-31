//
//  LMFFollowModel.h
//  百思不得其姐
//
//  Created by lumf on 16/3/31.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMFFollowModel : NSObject
@property (nonatomic, copy) NSString *screen_name;
@property (nonatomic, copy) NSString *header;
@property (nonatomic, assign) NSInteger fans_count;
@property (nonatomic, assign) BOOL is_follow;
@end
