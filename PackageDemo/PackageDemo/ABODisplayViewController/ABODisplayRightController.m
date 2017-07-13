//
//  ABODisplayRightController.m
//  PackageDemo
//
//  Created by eamon on 2017/7/12.
//  Copyright © 2017年 gjk. All rights reserved.
//

#import "ABODisplayRightController.h"
#import "ABODisplayViewHeader.h"
#import "ABODisplayRightTableViewCell.h"

@interface ABODisplayRightController ()<UITableViewDelegate, UITableViewDataSource>

/** 右边tableview*/
@property(nonatomic, strong) UITableView *rightTableView;

@end

@implementation ABODisplayRightController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.rightTableView];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _rightTableView.frame = self.view.bounds;
}

#pragma mark - TableViewDelegate | TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 21;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ABODisplayRightTableViewCell *cell = [ABODisplayRightTableViewCell cellWithTableView:tableView];
    return cell;
}

#pragma mark - Getter | Setter

- (UITableView *)rightTableView
{
    if (!_rightTableView) {
        
        _rightTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _rightTableView.separatorColor = UITableViewCellSelectionStyleNone;
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.rowHeight = 80;
    }
    
    return _rightTableView;
}


@end
