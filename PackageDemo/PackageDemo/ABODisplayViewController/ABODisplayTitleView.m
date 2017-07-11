//
//  ABODisplayTitleView.m
//  PackageDemo
//
//  Created by eamon on 2017/7/10.
//  Copyright © 2017年 ;. All rights reserved.
//

#import "ABODisplayTitleView.h"
#import "ABODisplayViewHeader.h"
#import "UIView+Frame.h"

@interface ABODisplayTitleView ()

/** 顶部滚动标题*/
@property(nonatomic, strong) UIScrollView *scrollView;

/** 当前索引view*/
@property(nonatomic, strong) UIView *indexView;

/** 用于保存标题数组*/
@property(nonatomic, copy) NSMutableArray *titleViews;


@end

@implementation ABODisplayTitleView

#pragma mark - LifeStyle

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.scrollView];
        [self.scrollView addSubview:self.indexView];
        [self.scrollView bringSubviewToFront:self.indexView];
        
        // 默认选中第一个tab
        self.index = 0;
    }
    
    return self;
}

- (instancetype) initWithFrame: (CGRect)frame titleArray: (NSArray *)titleArray
{
    if (self = [super initWithFrame:frame]) {
        
        // 添加控件
        self.titleArray = [titleArray copy];
        
        [self initSubTitleViewsWithTitleArray:titleArray];
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
    
    if (_titleViews.count == 0) { return; }
    
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
    
    // 设置indexView的frame
    UILabel *firstLabel = _titleViews.firstObject;
    _indexView.frame = CGRectMake(0, 0, firstLabel.width, 2);
    _indexView.center = CGPointMake(firstLabel.center.x, self.height-10);
    
    // 设置scrollView contentSize
    UILabel *lastLabel = _titleViews.lastObject;
    _scrollView.contentSize = CGSizeMake(CGRectGetMaxX(lastLabel.frame) + 5, 0);
    
}

#pragma mark - Action

- (void) tabLabelDidClick: (UITapGestureRecognizer *)tap
{
    self.index = tap.view.tag;
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
    
    // 默认选中第一个
    UILabel *firstLabel = _titleViews.firstObject;
    firstLabel.textColor = ABODisplayTitleSelectedColor;
    
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

- (void) setupContentOffSet: (UILabel *)currentLabel
{
    /** 这里会有3种情况出现
     *   1. 当前page 小于 0.5                                        ===>  滚到最前
     *   2. 0.5 < page <= contentSize.width - scrollView.width*0.5  ===> 中间位置
     *   3. page > contentSize.width - scrollView.width*0.5         ===> 滚到最后
     */

    CGFloat contentSizeWidth = self.scrollView.contentSize.width;
    CGFloat currentOffSetX = self.scrollView.contentOffset.x;
    
    CGFloat newContentOffSetX = 0;
    
    // 获取label再self的位置
    CGFloat coverX  = [self convertRect:currentLabel.frame fromView:_scrollView].origin.x;
    
    if (coverX > self.width*0.5) {
        
        newContentOffSetX = currentOffSetX + (coverX-self.width*0.5)+currentLabel.width*0.5;
    } else {
        
        newContentOffSetX = currentOffSetX - (self.width*0.5-coverX)+currentLabel.width*0.5;
    }
    
    if (newContentOffSetX <= self.scrollView.width*0.5) {
        
        [_scrollView setContentOffset:CGPointZero animated:true];
    } else if (newContentOffSetX >= contentSizeWidth - _scrollView.width) {
        
        [_scrollView setContentOffset:CGPointMake(contentSizeWidth-_scrollView.width, 0) animated:true];
    } else {
        
        [self.scrollView setContentOffset:CGPointMake(newContentOffSetX, 0) animated:true];
    }
}

#pragma mark - Getter | Setter

- (void)setIndex:(NSInteger)index
{
    if (index < 0 || _numberOfTitleViews == 0 || index > _numberOfTitleViews ) { return; }
    
    if (_index == index) { return; }
    
    UILabel *lastlabel = _titleViews[_index];
    lastlabel.textColor = ABODisplayTitleNormalColor;
    
    UILabel *currentLabel = _titleViews[index];
    currentLabel.textColor = ABODisplayTitleSelectedColor;
    
    // 执行动画
    [UIView animateWithDuration:ABODisplayTitleViewInterval animations:^{
        self.indexView.width = currentLabel.width - ABODisplayTitleViewMargin/2;
        self.indexView.center = CGPointMake(currentLabel.center.x, self.height-10);
    }];
    
    // 设置scrollView的contentOffSet
    [self setupContentOffSet:currentLabel];
    
    _index = index;
}

- (void)setTitleArray:(NSArray *)titleArray
{
    _titleArray = [titleArray copy];
    
    // 标题总个数
    _numberOfTitleViews = titleArray.count;
    
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

- (UIView *)indexView
{
    if (!_indexView) {
        
        _indexView = [[UIView alloc] init];
        _indexView.layer.cornerRadius = 0.5;
        _indexView.backgroundColor = ABODisplayTitleSelectedColor;
    }
    
    return _indexView;
}

- (NSMutableArray *)titleViews
{
    if (!_titleViews) {
        
        _titleViews = @[].mutableCopy;
    }
    
    return _titleViews;
}
@end

