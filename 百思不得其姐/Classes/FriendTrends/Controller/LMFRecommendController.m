//
//  LMFRecommendController.m
//  百思不得其姐
//
//  Created by lumf on 16/3/30.
//  Copyright © 2016年 cn.com.LMF.WMJ. All rights reserved.
//

#import "LMFRecommendController.h"
#import "LMFCategoryTableViewCell.h"
#import "AFNetworking.h"
#import "LMFRecommendCategoryModel.h"
#import "MJExtension.h"
#import "SVProgressHUD.h"
#import "LMFFollowTableViewCell.h"
#import "LMFFollowModel.h"
#import <MJRefresh.h>

static NSString *const categoryCellId = @"category";
static NSString *const followCellId = @"follow";

#define LMFSelectedCategoryTableRow self.categoryTable.indexPathForSelectedRow.row

@interface LMFRecommendController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *categoryTable;
@property (nonatomic, strong) NSMutableArray *categoryArrayM;
@property (nonatomic, strong) NSMutableArray *followArrayM;

@property (weak, nonatomic) IBOutlet UITableView *followTable;

@end

@implementation LMFRecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSLocalizedString(@"推荐关注", nil);
    self.view.backgroundColor = LMFGlobalBg;
    
    [self setupTableView];
    
    [self addRefresh];
    
    [self loadCategoryData];
}

-(void)setupTableView{
    self.categoryTable.backgroundColor = LMFClearColor;
    self.followTable.backgroundColor = LMFGlobalBg;
    
    [self.categoryTable registerNib:[UINib nibWithNibName:NSStringFromClass([LMFCategoryTableViewCell class]) bundle:nil] forCellReuseIdentifier:categoryCellId];
    
    [self.followTable registerNib:[UINib nibWithNibName:NSStringFromClass([LMFFollowTableViewCell class]) bundle:nil] forCellReuseIdentifier:followCellId];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTable.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.followTable.contentInset = self.categoryTable.contentInset;
}

-(void)addRefresh{
    
    __weak typeof(self) weakSelf = self;
    self.followTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        LMFRecommendCategoryModel *categoryModel = weakSelf.categoryArrayM[LMFSelectedCategoryTableRow];
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        categoryModel.currenPage = 1;
        params[@"a"] = @"list";
        params[@"c"] = @"subscribe";
        params[@"category_id"] = categoryModel.id;
//        __weak typeof(self) weakSelf = self;
        [[AFHTTPSessionManager manager] GET:@"https://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
            [weakSelf.followTable.mj_header endRefreshing];
            [weakSelf.followArrayM removeAllObjects];
            weakSelf.followArrayM = [LMFFollowModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
            categoryModel.total_page = [responseObject[@"total_page"] integerValue];
//            categoryModel.total_page = 4;
            categoryModel.follows = weakSelf.followArrayM;
            [weakSelf.followTable reloadData];
            
//            if (categoryModel.total_page>categoryModel.currenPage) {
//                [weakSelf.followTable.mj_footer endRefreshing];
//            }else{
//                [weakSelf.followTable.mj_footer endRefreshingWithNoMoreData];
//            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            if (categoryModel.total_page>categoryModel.currenPage) {
//                [weakSelf.followTable.mj_footer endRefreshing];
//            }else{
//                [weakSelf.followTable.mj_footer endRefreshingWithNoMoreData];
//            }
            [weakSelf.followTable.mj_header endRefreshing];
        }];

    }];
    
    /////////////////////////////
//    self.followTable.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        LMFRecommendCategoryModel *categoryModel = weakSelf.categoryArrayM[LMFSelectedCategoryTableRow];
//        if (categoryModel.total_page>categoryModel.currenPage) {
//            NSMutableDictionary *params = [NSMutableDictionary dictionary];
//            params[@"a"] = @"list";
//            params[@"c"] = @"subscribe";
//            params[@"category_id"] = categoryModel.id;
//            params[@"page"] = @(++categoryModel.currenPage);
////            __weak typeof(self) weakSelf = self;
//            [[AFHTTPSessionManager manager] GET:@"https://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//                if (categoryModel.total_page>categoryModel.currenPage) {
//                    [weakSelf.followTable.mj_footer endRefreshing];
//                }else{
//                    [weakSelf.followTable.mj_footer endRefreshingWithNoMoreData];
//                }
//                [weakSelf.followArrayM addObjectsFromArray:[LMFFollowModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]];
//                categoryModel.follows = weakSelf.followArrayM;
//                [weakSelf.followTable reloadData];
//                
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                [weakSelf.followTable.mj_footer endRefreshing];
//            }];
//        }else{
//            [weakSelf.followTable.mj_footer endRefreshingWithNoMoreData];
//        }
//        
//
//    }];
}

-(void)loadCategoryData{
//    [SVProgressHUD showWithStatus:@"加载中。。。" maskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"category";
    params[@"c"] = @"subscribe";
    
    __weak typeof(self) weakSelf = self;
    [[AFHTTPSessionManager manager] GET:@"https://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        [SVProgressHUD dismiss];
        weakSelf.categoryArrayM = [LMFRecommendCategoryModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [weakSelf.categoryTable reloadData];
        [weakSelf.categoryTable selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        [weakSelf tableView:weakSelf.categoryTable didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD dismiss];
    }];
}

-(NSMutableArray *)categoryArrayM{
    if (!_categoryArrayM) {
        _categoryArrayM = [NSMutableArray array];
    }
    return _categoryArrayM;
}

-(NSMutableArray *)followArrayM{
    if (!_followArrayM) {
        _followArrayM = [NSMutableArray array];
    }
    return _followArrayM;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==self.categoryTable) {
        
        return [self.categoryArrayM count];
    }else{
        return [self.followArrayM count];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.categoryTable) {
        return 44;
    }else{
        return 60;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.categoryTable) {
        LMFCategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryCellId];
        cell.categoryModel = self.categoryArrayM[indexPath.row];
        return cell;
    }else{
        LMFFollowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:followCellId];
        cell.followModel = self.followArrayM[indexPath.row];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.categoryTable) {
        
        LMFRecommendCategoryModel *categoryModel = self.categoryArrayM[indexPath.row];
        if ([categoryModel.follows count]>0) {
            self.followArrayM = categoryModel.follows;
            [self.followTable reloadData];
        }else{
            //清除缓存数据
            [self.followTable reloadData];
            
            [self.followTable.mj_header beginRefreshing];
            
//            NSMutableDictionary *params = [NSMutableDictionary dictionary];
//            params[@"a"] = @"list";
//            params[@"c"] = @"subscribe";
//            params[@"category_id"] = categoryModel.id;
//            [self.followTable.mj_header beginRefreshing];
//            __weak typeof(self) weakSelf = self;
//            [[AFHTTPSessionManager manager] GET:@"https://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
//                LMFDEBUGLOG(@"responseObject:%@",responseObject);
//                [weakSelf.followTable.mj_header endRefreshing];
//                weakSelf.followArrayM = [LMFFollowModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
//                categoryModel.follows = weakSelf.followArrayM;
//                [weakSelf.followTable reloadData];
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                [weakSelf.followTable.mj_header endRefreshing];
//                LMFDEBUGLOG(@"error:%@",error);
//            }];
        }
        
        
    }
}

@end
