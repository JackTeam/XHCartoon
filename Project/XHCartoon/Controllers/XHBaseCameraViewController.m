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

#pragma mark - Life cycle

- (id)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
