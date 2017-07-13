//
//  ABODisplayViewHeader.h
//  PackageDemo
//
//  Created by eamon on 2017/7/10.
//  Copyright © 2017年 gjk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#ifndef ABODisplayViewHeader_h
#define ABODisplayViewHeader_h


#endif /* ABODisplayViewHeader_h */

/*********************** ABODisplayTitleView ***********************/

/** 字体颜色*/

// RGB颜色
#define ABODisplayColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

// 标题默认颜色
#define ABODisplayTitleNormalColor ABODisplayColor(50, 55, 65)

// 标题选中颜色
#define ABODisplayTitleSelectedColor ABODisplayColor(49, 180, 104)


/** 字体大小 */

// 标题默认字体大小
#define ABODisplayTitleNormalFont [UIFont systemFontOfSize: 15]

// 标题选中字体大小
#define ABODisplayTitleSelectedFont [UIFont systemFontOfSize: 16]

// 屏幕宽高
#define ABOScreenW [UIScreen mainScreen].bounds.size.width
#define ABOScreenH [UIScreen mainScreen].bounds.size.height

// 标题总高度
UIKIT_EXTERN const CGFloat ABODisplayTitleViewHeight;

// 标题之间的间隔
UIKIT_EXTERN const CGFloat ABODisplayTitleViewMargin;

// 点击每个title切换动画的时间
UIKIT_EXTERN const NSTimeInterval ABODisplayTitleViewInterval;


/*********************** ABODisplayTagsView ***********************/

// 左边tableView cell背景色
#define ABODisplayLeftTableViewCellBgColor ABODisplayColor(246, 248, 249)

// 左边tableView 分割线颜色
#define ABODisplayTableViewBorderColor ABODisplayColor(233, 236, 239)

// 左边tableView 标题文字
#define ABODisplayLeftTableViewTitleFont [UIFont systemFontOfSize: 14]

// 左边tableView 标题默认字体颜色
#define ABODisplayLeftTableViewTitleNormalColor ABODisplayColor(119, 128, 140)

// 左边tableView 标题选中字体颜色
#define ABODisplayLeftTableViewTitleSelectedColor ABODisplayColor(50, 55, 65)
