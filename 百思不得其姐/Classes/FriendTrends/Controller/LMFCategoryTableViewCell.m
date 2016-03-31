//
//  LMFCategoryTableViewCell.m
//  百思不得其姐
//
//  Created by lumf on 16/3/30.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFCategoryTableViewCell.h"

@interface LMFCategoryTableViewCell()
@property (weak, nonatomic) IBOutlet UIView *leftRedView;

@end
@implementation LMFCategoryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.textLabel.textColor = LMFRGBColor(120, 120, 120);
    self.textLabel.font = [UIFont systemFontOfSize:15];
    self.leftRedView.backgroundColor = LMFRGBColor(218, 44, 21);
    self.leftRedView.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
    [super setSelected:selected animated:animated];

    self.textLabel.textColor = selected? LMFRGBColor(218, 44, 21):LMFRGBColor(120, 120, 120);
    self.leftRedView.hidden = !selected;
    // Configure the view for the selected state
    
}

-(void)setCategoryModel:(LMFRecommendCategoryModel *)categoryModel{
    _categoryModel = categoryModel;
    self.textLabel.text = categoryModel.name;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height-2*self.textLabel.y;
}

@end
