//
//  ABODisplayLeftTableViewCell.h
//  PackageDemo
//
//  Created by eamon on 2017/7/12.
//  Copyright © 2017年 gjk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABODisplayLeftTableViewCell : UITableViewCell

/** 标题*/
@property(nonatomic, copy) NSString *title;

/** 初始化方法*/
+ (instancetype) cellWithTableView: (UITableView *)tableView;

@end
