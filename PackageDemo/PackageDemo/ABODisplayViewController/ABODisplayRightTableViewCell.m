//
//  ABODisplayRightTableViewCell.m
//  PackageDemo
//
//  Created by eamon on 2017/7/12.
//  Copyright © 2017年 gjk. All rights reserved.
//

#import "ABODisplayRightTableViewCell.h"
#import "ABODisplayViewHeader.h"
#import "UIView+Frame.h"

static NSString * _Nonnull ABODisplayRightTableViewCellID = @"ABODisplayRightTableViewCellID";

@interface ABODisplayRightTableViewCell ()

/** 图片*/
@property(nonatomic, strong) UIImageView *mediaImageView;

/** 标题*/
@property(nonatomic, strong) UILabel *titleLabel;

/** 当前价格*/
@property(nonatomic, strong) UILabel *currentPrice;

/** 原价*/
@property(nonatomic, strong) UILabel *originalPrice;

/** 分割线*/
//@property(nonatomic, strong) UIView *borderView;
@end

@implementation ABODisplayRightTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.layer.borderColor = ABODisplayTableViewBorderColor.CGColor;
        self.layer.borderWidth = 0.5;
        
        [self.contentView addSubview:self.mediaImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.currentPrice];
        [self.contentView addSubview:self.originalPrice];
    }
    
    return self;
}

+ (instancetype) cellWithTableView:(UITableView *)tableView
{
    ABODisplayRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ABODisplayRightTableViewCellID];
    
    if (!cell) {
        
        cell = [[ABODisplayRightTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ABODisplayRightTableViewCellID];
    }
    
    return cell;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat margin = 10;
    _mediaImageView.frame = CGRectMake(margin, margin, self.height-2*margin, self.height-2*margin);
    
    CGFloat titleLabelWidth = self.width - CGRectGetMaxX(_mediaImageView.frame)-2*margin;
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(_mediaImageView.frame) + margin, margin, titleLabelWidth, 40);
    
    CGFloat currentPriceHeight = 20;
    _currentPrice.frame = CGRectMake(_titleLabel.x, self.height - currentPriceHeight - margin, 70, currentPriceHeight);
    
    _originalPrice.frame = CGRectMake(CGRectGetMaxX(_currentPrice.frame) + margin, self.height - currentPriceHeight - margin, 70, currentPriceHeight);

}

#pragma mark - Getter | Setter

- (UIImageView *)mediaImageView
{
    if (!_mediaImageView) {
        
        _mediaImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"index"]];
        _mediaImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    
    return _mediaImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"地中海贫血基因分型检测";
        _titleLabel.textColor = ABODisplayTitleNormalColor;
        _titleLabel.font = ABODisplayTitleNormalFont;
        _titleLabel.numberOfLines = 0;
    }
    
    return _titleLabel;
}

- (UILabel *)currentPrice
{
    if (!_currentPrice) {
        
        _currentPrice = [[UILabel alloc] init];
        _currentPrice.text = @"￥1265";
        _currentPrice.textColor = ABODisplayColor(248, 68, 28);
        _currentPrice.font = ABODisplayTitleNormalFont;
    }
    
    return _currentPrice;
}

- (UILabel *)originalPrice
{
    if (!_originalPrice) {
        
        _originalPrice = [[UILabel alloc] init];
        _originalPrice.font = ABODisplayTitleNormalFont;
        _originalPrice.textColor = ABODisplayColor(161, 169, 181);
        
        NSDictionary *attributes = @{
                                     NSFontAttributeName: ABODisplayTitleNormalFont,
                                     NSForegroundColorAttributeName: ABODisplayColor(161, 169, 181),
                                     NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle|NSUnderlinePatternSolid), NSStrikethroughColorAttributeName:ABODisplayColor(161, 169, 181)};
        
        NSAttributedString *attrStr = [[NSAttributedString alloc] initWithString:@"3999" attributes:attributes];
        _originalPrice.attributedText = attrStr;
    }
    
    return _originalPrice;
}

//- (UIView *)borderView
//{
//    if (!_borderView) {
//        
//        _borderView = [[UIView alloc] init];
//        _borderView.backgroundColor = ABODisplayTableViewBorderColor;
//    }
//    
//    return _borderView;
//}

@end
