//
//  ABODisplayLeftTableViewCell.m
//  PackageDemo
//
//  Created by eamon on 2017/7/12.
//  Copyright © 2017年 gjk. All rights reserved.
//

#import "ABODisplayLeftTableViewCell.h"
#import "ABODisplayViewHeader.h"
#import "UIView+Frame.h"

static NSString * _Nonnull ABODisplayLeftTableViewCellID = @"ABODisplayLeftTableViewCell";

@interface ABODisplayLeftTableViewCell ()

/** 标题*/
@property(nonatomic, strong) UILabel *titleLabel;

/** 分割线*/
@property(nonatomic, strong) UIView *borderView;

@end

@implementation ABODisplayLeftTableViewCell

#pragma mark - LifeCycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = ABODisplayLeftTableViewCellBgColor;
        
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.borderView];
    }
    
    return self;
}

+ (instancetype) cellWithTableView: (UITableView *)tableView
{
    ABODisplayLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ABODisplayLeftTableViewCellID];
    
    if (!cell) {
        
        cell = [[ABODisplayLeftTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ABODisplayLeftTableViewCellID];
    }
    
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _titleLabel.frame = self.contentView.bounds;
    
    _borderView.frame = CGRectMake(0, self.height-0.5, self.width, 0.5);
}

#pragma mark - Getter | Setter

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = ABODisplayLeftTableViewTitleFont;
        _titleLabel.textColor = ABODisplayLeftTableViewTitleNormalColor;
    }
    
    return _titleLabel;
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    
    self.titleLabel.text = title;
}

- (UIView *)borderView
{
    if (!_borderView) {
        
        _borderView = [[UIView alloc] init];
        _borderView.backgroundColor = ABODisplayTableViewBorderColor;
    }
    
    return _borderView;
}

@end
