//
//  XHBaseCameraViewController.h
//  XHCartoon
//
//  Created by 曾 宪华 on 14-1-23.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XHBaseCameraViewController : XHBaseViewController
// 各种滤镜
@property (nonatomic, strong) NSArray *filters;
// 各种场景
@property (nonatomic, strong) NSArray *scenes;
// 各种场景分类
@property (nonatomic, strong) NSArray *scenesCategirys;
// 底部按钮
@property (nonatomic, strong) NSArray *itemViews;
@end
