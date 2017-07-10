//
//  ABODisplayViewController.m
//  PackageDemo
//
//  Created by eamon on 2017/7/10.
//  Copyright © 2017年 gjk. All rights reserved.
//

#import "ABODisplayViewController.h"
#import "ABODisplayTitleView.h"
#import "ABODisplayViewHeader.h"
#import "UIView+Frame.h"

@interface ABODisplayViewController ()

/** 顶部滚动标题*/
@property(nonatomic, strong) ABODisplayTitleView *titleView;

@end

@implementation ABODisplayViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.titleView];
    self.titleView.titleArray = self.titleArray;
}


#pragma mark - Getter | Setter 

- (ABODisplayTitleView *)titleView
{
    if (!_titleView) {
        _titleView = [[ABODisplayTitleView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, ABODisplayTitleViewHeight)];
        _titleView.backgroundColor = [UIColor redColor];
    }
    
    return _titleView;
}

- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"全部", @"健康久久2.0（特惠）", @"糖尿病&甲状腺疾病", @"肝病检测", @"好孕妇儿", @"肿瘤检测", @"基因检测", @"健康检测"];
    }
    
    return _titleArray;
}


@end
