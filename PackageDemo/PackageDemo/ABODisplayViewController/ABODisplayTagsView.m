//
//  ABODisplayTagsView.m
//  PackageDemo
//
//  Created by eamon on 2017/7/11.
//  Copyright © 2017年 gjk. All rights reserved.
//

#import "ABODisplayTagsView.h"
#import "ABODisplayViewHeader.h"
#import "UIView+Frame.h"

typedef NS_ENUM(NSInteger, ABOTagsViewTableViewType) {
    ABOTagsViewTableViewTypeCategory = 100,   // 左边分类tableView
    ABOTagsViewTableViewTypeContent = 101,  // 右边内容tableView
};

@interface ABODisplayTagsView ()<UITableViewDelegate, UITableViewDataSource>

/** 顶部广告图片*/
@property(nonatomic, strong) UIImageView *bannerView;

/** 左边tags分类*/
@property(nonatomic, strong) UITableView *categroyTableView;

/** 右边每个分类内容*/
@property(nonatomic, strong) UITableView *contentTableView;
@end

@implementation ABODisplayTagsView

#pragma mark - LifeCycle
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.bannerView];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 图片4：3
    CGFloat bannerViewHeight = self.width/3;
    _bannerView.frame = CGRectMake(0, 0, self.width, bannerViewHeight);
    
    // 左边分类tags TableView Frame
    CGFloat ABOTagsLeftTableViewWidth = self.width*0.12;
    _categroyTableView.frame = CGRectMake(0, bannerViewHeight, ABOTagsLeftTableViewWidth, self.height - bannerViewHeight);
}

#pragma mark - UITableViewDelegate | UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == ABOTagsViewTableViewTypeCategory) {
        
        return 8;
    }
    
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == ABOTagsViewTableViewTypeCategory) {
        
        UIT
    }
}



#pragma mark - Getter | Setter 

- (UIImageView *)bannerView
{
    if (!_bannerView) {
        
        _bannerView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banner"]];
        _bannerView.layer.masksToBounds = true;
        _bannerView.contentMode = UIViewContentModeScaleAspectFill;
    }
    
    return _bannerView;
}

- (UITableView *)categroyTableView {
    
    if (!_categroyTableView) {
        
        _categroyTableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _categroyTableView.delegate = self;
        _categroyTableView.dataSource = self;
        _categroyTableView.tag = ABOTagsViewTableViewTypeCategory;
    }
    
    return _categroyTableView;
}

- (UITableView *)contentTableView {
    
    if (!_contentTableView) {
        
        _contentTableView = [[UITableView alloc] initWithFrame:CGRectZero];
        _contentTableView.delegate = self;
        _contentTableView.dataSource = self;
        _contentTableView.tag = ABOTagsViewTableViewTypeContent;
    }
    
    return _contentTableView;
}

@end
