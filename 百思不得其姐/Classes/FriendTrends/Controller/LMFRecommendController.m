//
//  LMFRecommendController.m
//  百思不得其姐
//
//  Created by lumf on 16/3/30.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFRecommendController.h"
#import "LMFCategoryTableViewCell.h"

static NSString *const cellId = @"category";

@interface LMFRecommendController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *categoryTable;

@end

@implementation LMFRecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = LMFGlobalBg;
    self.categoryTable.backgroundColor = LMFClearColor;
    [self.categoryTable registerNib:[UINib nibWithNibName:NSStringFromClass([LMFCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:cellId];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LMFCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.textLabel.text = @"name";
    return cell;
}

@end
