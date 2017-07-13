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
#import "ABODisplayLeftController.h"
#import "UIView+Frame.h"

@interface ABODisplayViewController ()

/** 顶部滚动标题*/
@property(nonatomic, strong) ABODisplayTitleView *titleView;

/** 顶部广告图片*/
@property(nonatomic, strong) UIImageView *bannerView;

/** 左边tableView控制器*/
@property(nonatomic, strong) ABODisplayLeftController *leftController;

@end

@implementation ABODisplayViewController

#pragma mark - LifeCycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = ABODisplayColor(250, 250, 250);
    
    // 添加标题栏
    [self.view addSubview:self.titleView];
    self.titleView.titleArray = self.titleArray;
    
    // 添加中间广告图片
    [self.view addSubview:self.bannerView];
    
    // 添加左边控制器
    [self addChildViewController:self.leftController];
    [self.view addSubview:_leftController.view];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    // 顶部标题
    _titleView.frame = CGRectMake(0, 64, self.view.width, ABODisplayTitleViewHeight);
    
    // 广告图片4：3
    CGFloat bannerViewHeight = self.view.width/3;
    _bannerView.frame = CGRectMake(0, CGRectGetMaxY(_titleView.frame), self.view.width, bannerViewHeight);
    
    // 左边控制器
    CGFloat leftControllerViewY = CGRectGetMaxY(_bannerView.frame);
    _leftController.view.frame = CGRectMake(0, leftControllerViewY, self.view.width, self.view.height-leftControllerViewY);
}


#pragma mark - Getter | Setter 

- (ABODisplayTitleView *)titleView
{
    if (!_titleView) {
        
        _titleView = [[ABODisplayTitleView alloc] init];
    }
    
    return _titleView;
}

- (NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = @[@"全部", @"健康久久2.0", @"糖尿病&甲状腺疾病", @"肝病检测", @"好孕妇儿", @"肿瘤检测", @"基因检测", @"健康检测"];
    }
    
    return _titleArray;
}

- (UIImageView *)bannerView
{
    if (!_bannerView) {
        
        _bannerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banner"]];
        _bannerView.layer.masksToBounds = true;
        _bannerView.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    return _bannerView;
}

- (ABODisplayLeftController *)leftController
{
    if (!_leftController) {
        _leftController = [[ABODisplayLeftController alloc] init];
    }
    
    return _leftController;
}


@end
