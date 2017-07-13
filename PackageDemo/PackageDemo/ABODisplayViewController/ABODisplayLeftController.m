//
//  ABODisplayLeftController.m
//  PackageDemo
//
//  Created by eamon on 2017/7/12.
//  Copyright © 2017年 gjk. All rights reserved.
//

#import "ABODisplayLeftController.h"
#import "UIView+Frame.h"
#import "ABODisplayLeftTableViewCell.h"
#import "ABODisplayRightController.h"

@interface ABODisplayLeftController ()<UITableViewDataSource, UITableViewDelegate>

/** 左边tableView*/
@property(nonatomic, strong) UITableView *leftTableView;

/** 右边控制器*/
@property(nonatomic, strong) ABODisplayRightController *rightController;

@property(nonatomic, strong) NSArray *leftDataArr;

@end

@implementation ABODisplayLeftController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.leftTableView];
    
    // 添加右边控制器
    self.rightController = [[ABODisplayRightController alloc] init];
    [self addChildViewController:_rightController];
    [self.view addSubview:_rightController.view];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    // 左边分类tags TableView Frame
    CGFloat ABOLeftTableViewWidth = self.view.width*4/15;
    _leftTableView.frame = CGRectMake(0, 0, ABOLeftTableViewWidth, self.view.height);
    
    CGFloat rightControllerViewX = CGRectGetMaxX(_leftTableView.frame) + 10;
    _rightController.view.frame = CGRectMake(rightControllerViewX, _leftTableView.y + 10, self.view.width - rightControllerViewX-10, self.view.height-20);
}

#pragma mark - TableViewDelegate | TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.leftDataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ABODisplayLeftTableViewCell *cell = [ABODisplayLeftTableViewCell cellWithTableView:tableView];
    cell.title = self.leftDataArr[indexPath.row];
    return cell;
}

#pragma mark - Getter | Setter

- (UITableView *)leftTableView
{
    if (!_leftTableView) {
        
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _leftTableView.showsVerticalScrollIndicator = false;
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
    }
    
    return _leftTableView;
}

- (NSArray *)leftDataArr
{
    if (!_leftDataArr) {
        
        _leftDataArr = @[
                         @"第一类", @"第二类", @"第三类", @"第四类", @"第五类", @"第六类", @"第七类", @"第八类", @"第九类", @"第十类", @"第十一类", @"第十二类", @"第十三类", @"第十四类", @"第十五类", @"第十六类", @"第十七类", @"第十八类", @"第十九类", @"第二十类", @"第二十一类"
                         ];
    }
    
    return _leftDataArr;
}

@end
