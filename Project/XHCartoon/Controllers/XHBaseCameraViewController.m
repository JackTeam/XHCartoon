//
//  XHBaseCameraViewController.m
//  XHCartoon
//
//  Created by 曾 宪华 on 14-1-23.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHBaseCameraViewController.h"

@interface XHBaseCameraViewController ()

@end

@implementation XHBaseCameraViewController
@synthesize items = _items;

#pragma mark - Propertys

- (void)setFilters:(NSArray *)filters {
    if (!filters)
        return;
    _filters = filters;
}

- (void)setScenes:(NSArray *)scenes {
    if (!scenes)
        return;
    _scenes = scenes;
}

- (void)setScenesCategirys:(NSArray *)scenesCategirys {
    if (!scenesCategirys)
        return;
    _scenesCategirys = scenesCategirys;
}

- (void)setItems:(NSArray *)items {
    if (!items)
        return;
    _items = items;
    [self _setupBottomToolBar];
}

- (NSArray *)items {
    if (!_items) {
        _items = [[NSArray alloc] init];
    }
    return _items;
}

#pragma mark - UI Setup

- (void)_setupBottomToolBar {
    XHItemScrollToolBar *itemScrollToolBar = [[XHItemScrollToolBar alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(self.view.bounds) - 44, CGRectGetWidth(self.view.bounds), 44)];
    itemScrollToolBar.itemWidth = self.itemWidth;
    itemScrollToolBar.itemPaddingX = self.itemPaddingX;
    itemScrollToolBar.itemPaddingY = self.itemPaddingY;
    itemScrollToolBar.items = self.items;
    itemScrollToolBar.selectIndex = self.selectIndex;
    [self.view addSubview:itemScrollToolBar];
    
    [itemScrollToolBar reloadData];
}

#pragma mark - Life cycle

- (void)_setupBase {
    self.itemWidth = CGRectGetWidth([[UIScreen mainScreen] bounds]) / 5.0;
}

- (id)init {
    self = [super init];
    if (self) {
        [self _setupBase];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
