//
//  ABODisplayTitleView.h
//  PackageDemo
//
//  Created by eamon on 2017/7/10.
//  Copyright © 2017年 gjk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABODisplayTitleView : UIView

/***********************【属性】***********************/

/** 当前索引*/
@property(nonatomic, assign) NSInteger index;

/** 标题数组*/
@property(nonatomic, copy) NSArray *titleArray;

/** 标题数量*/
@property(nonatomic, assign, readonly) NSInteger numberOfTitleViews;

/***********************【方法】***********************/

/** 初始化方法*/
- (instancetype) initWithFrame: (CGRect)frame titleArray: (NSArray *)titleArray;

+ (instancetype) titleViewWithFrame: (CGRect)frame titleArray: (NSArray *)titleArray;


@end
