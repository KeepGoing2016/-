//
//  LMFFollowTableViewCell.m
//  百思不得其姐
//
//  Created by lumf on 16/3/31.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFFollowTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface LMFFollowTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLable;
@property (weak, nonatomic) IBOutlet UIButton *followBtn;

@end
@implementation LMFFollowTableViewCell

-(void)setFollowModel:(LMFFollowModel *)followModel{
    _followModel = followModel;
//    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:@"http://wimg.spriteapp.cn/profile/large/2016/03/08/56dedca02c60f_mini.jpg"] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:followModel.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        LMFFunction;
    }];
    self.titleLabel.text = followModel.screen_name;
    self.descLable.text = [NSString stringWithFormat:NSLocalizedString(@"%d人关注", nil),followModel.fans_count];
}

- (void)awakeFromNib {

}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.iconImage.layer.cornerRadius = self.iconImage.width/2.0;
    self.iconImage.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
