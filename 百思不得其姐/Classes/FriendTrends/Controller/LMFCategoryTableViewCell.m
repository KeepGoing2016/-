//
//  LMFCategoryTableViewCell.m
//  百思不得其姐
//
//  Created by lumf on 16/3/30.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFCategoryTableViewCell.h"

@implementation LMFCategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textLabel.textColor = LMFRGBColor(120, 120, 120);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.textLabel.textColor = selected? LMFRGBColor(218, 44, 21):LMFRGBColor(120, 120, 120);
    // Configure the view for the selected state
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height-2*self.textLabel.y;
}

@end
