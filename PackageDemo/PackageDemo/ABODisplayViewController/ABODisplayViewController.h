//
//  ABODisplayViewController.h
//  PackageDemo
//
//  Created by eamon on 2017/7/10.
//  Copyright © 2017年 gjk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABODisplayViewController : UIViewController

/** 顶部标题数组*/
@property(nonatomic, strong) NSArray *titleArray;

/** 是否显示菜单页*/
@property(nonatomic, assign) BOOL isSHowBannerView;
@end
