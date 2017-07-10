//
//  ABODisplayTitleView.m
//  PackageDemo
//
//  Created by eamon on 2017/7/10.
//  Copyright © 2017年 gjk. All rights reserved.
//

#import "ABODisplayTitleView.h"
#import "ABODisplayViewHeader.h"
#import "UIView+Frame.h"

@interface ABODisplayTitleView ()

/** 顶部滚动标题*/
@property(nonatomic, strong) UIScrollView *scrollView;

/** 用于保存标题数组*/
@property(nonatomic, copy) NSMutableArray *titleViews;
@end

@implementation ABODisplayTitleView

#pragma mark - LifeStyle
- (instancetype) initWithFrame: (CGRect)frame titleArray: (NSArray *)titleArray
{
    if (self = [super initWithFrame:frame]) {
        
        // 添加控件
        [self addSubview:self.scrollView];
        
        self.titleArray = [titleArray copy];
        
        [self initSubTitleViewsWithTitleArray:titleArray];
        
        // 默认选中第一个tab
        self.index = 0;
        
        // 标题总个数
        _numberOfTitleViews = titleArray.count;
    }
    
    return self;
}

+ (instancetype) titleViewWithFrame: (CGRect)frame titleArray: (NSArray *)titleArray
{
    return [[self alloc] initWithFrame:frame titleArray:titleArray];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置scrollView frame
    self.scrollView.frame = self.bounds;
    
    // 设置每个tab的frame
    CGFloat lastLabelWidth = 0;
    
    for (int i = 0; i < _titleViews.count; i++) {
        
        UILabel *label = _titleViews[i];
        NSString *text = _titleArray[i];
        // 计算文字宽度
        NSDictionary *attrs = @{
                                NSFontAttributeName: label.font
                                };
        CGFloat textWidth = [text boundingRectWithSize:CGSizeMake(ABOScreenW, ABOScreenH) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
        
        CGFloat labelX = lastLabelWidth + ABODisplayTitleViewMargin;
        label.frame = CGRectMake(labelX, 0, textWidth, ABODisplayTitleViewHeight);
        
        lastLabelWidth = CGRectGetMaxX(label.frame);
    }
    
    // 设置scrollView contentSize
    UILabel *lastLabel = _titleViews.lastObject;
    _scrollView.contentSize = CGSizeMake(CGRectGetMaxX(lastLabel.frame) + 5, 0);
    
}

#pragma mark - Action

- (void) tabLabelDidClick: (UITapGestureRecognizer *)tap
{
    UILabel *tapView = (UILabel *)tap.view;
    
    
}

#pragma mark - Public Methods


#pragma mark - Private Methods

/**
 添加标题的子控件

 @param titleArray 标题数组
 */
- (void) initSubTitleViewsWithTitleArray:(NSArray *) titleArray
{
    if (titleArray.count == 0) { return; }
    
    [_titleViews removeAllObjects];
    
    // 添加子控件
    for (int i = 0; i < titleArray.count; i++) {
        
        UILabel *tabLabel = [self createTabLabel];
        [tabLabel setText:titleArray[i]];
        [tabLabel viewAddTarget:self action:@selector(tabLabelDidClick:)];
        tabLabel.tag = i;
        
        [self.titleViews addObject:tabLabel];
        [self.scrollView addSubview:tabLabel];
    }
    
    [self layoutIfNeeded];
}

/**
 创建标题
 */
- (UILabel *) createTabLabel
{
    UILabel *tabLabel = [[UILabel alloc] init];
    [tabLabel setTextColor:ABODisplayTitleNormalColor];
    [tabLabel setFont:ABODisplayTitleNormalFont];
    [tabLabel setTextAlignment:NSTextAlignmentCenter];
    
    return tabLabel;
}

#pragma mark - Getter | Setter

- (void)setIndex:(NSInteger)index
{
    _index = index;
    
    if (index < 0 || index > _numberOfTitleViews) { return; }
    
}

- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = [titleArray copy];
    
    if (_titleViews.count == 0) {
        
        // 创建标题并设置text
        [self initSubTitleViewsWithTitleArray:titleArray];
    } else {
        // 先移除原先保存的，再重新创建
        for (int i = 0; i < _titleViews.count; i++) {
            
            UILabel *label = _titleViews[i];
            [label removeFromSuperview];
        }
        
        [self initSubTitleViewsWithTitleArray:titleArray];
    }
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = false;
        _scrollView.pagingEnabled = false;
    }
    
    return _scrollView;
}

- (NSMutableArray *)titleViews
{
    if (!_titleViews) {
        
        _titleViews = @[].mutableCopy;
    }
    
    return _titleViews;
}
@end

