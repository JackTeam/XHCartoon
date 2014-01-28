//
//  XHPhotoEditorViewController.m
//  XHCartoon
//
//  Created by 曾 宪华 on 14-1-23.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507 本人QQ群（142557668）. All rights reserved.
//

#import "XHPhotoEditorViewController.h"

#import "XHShareAndSvaePhotoViewController.h"

@interface XHPhotoEditorViewController ()

@end

@implementation XHPhotoEditorViewController

#pragma mark - Action

- (void)_pushXHShareViewController {
    XHShareAndSvaePhotoViewController *shareViewController = [[XHShareAndSvaePhotoViewController alloc] init];
    [self.navigationController pushViewController:shareViewController animated:YES];
}

- (void)_filterItemSelect:(NSInteger)index {
    NSLog(@"index : %d", index);
}

- (UIImage *)_getImageForIndex:(NSInteger )index {
    NSString *imageName = nil;
    UIImage *filterImage = nil;
    switch (self.cameraType) {
        case kXHSceces: {
            imageName = [NSString stringWithFormat:@"Sceces%d", index];
            break;
        }
        case kXHFilter: {
            imageName = [NSString stringWithFormat:@"Filter%d", index];
            break;
        }
        default:
            break;
    }
    filterImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]];
    return filterImage;
}

- (NSString *)_getTextForIndex:(NSInteger)index {
    switch (self.cameraType) {
        case kXHSceces:
            return @"漫画场景";
            break;
        case kXHFilter:
            return nil;
            break;
        case kXHElements:
            return @"漫画布景";
            break;
        case kXHDialogBox:
            return @"对话框";
            break;
        default:
            break;
    }
}

#pragma mark - Setup UI

- (void)_setupItemScrollToolBar {
    if (self.items.count)
        return;
    
    __weak typeof(self) weakSelf = self;
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:5];
    XHItem *backToRootItem = [[XHItem alloc] initWithNormalImage:[UIImage imageNamed:@"tabBar-camera"] selectedImage:[UIImage imageNamed:@"tabBar-camera-on"] title:nil itemSelectedBlcok:^(XHItemView *itemView) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
        NSLog(@"index : %d", itemView.item.index);
    }];
    backToRootItem.unHieghtSelect = YES;
    [items addObject:backToRootItem];
    
    XHItem *scenesItem = [[XHItem alloc] initWithNormalImage:[UIImage imageNamed:@"tabBar-camera"] selectedImage:[UIImage imageNamed:@"tabBar-camera-on"] title:nil itemSelectedBlcok:^(XHItemView *itemView) {
        NSInteger index = itemView.item.index;
        NSLog(@"index : %d", index);
        [weakSelf _filterEdting:index];
    }];
    [items addObject:scenesItem];
    
    XHItem *elementsItem = [[XHItem alloc] initWithNormalImage:[UIImage imageNamed:@"tabBar-camera"] selectedImage:[UIImage imageNamed:@"tabBar-camera-on"] title:nil itemSelectedBlcok:^(XHItemView *itemView) {
        NSInteger index = itemView.item.index;
        NSLog(@"index : %d", index);
        [weakSelf _filterEdting:index];
    }];
    [items addObject:elementsItem];
    
    XHItem *dialogBoxItem = [[XHItem alloc] initWithNormalImage:[UIImage imageNamed:@"tabBar-camera"] selectedImage:[UIImage imageNamed:@"tabBar-camera-on"] title:nil itemSelectedBlcok:^(XHItemView *itemView) {
        NSInteger index = itemView.item.index;
        NSLog(@"index : %d", index);
        [weakSelf _filterEdting:index];
    }];
    [items addObject:dialogBoxItem];
    
    XHItem *gotoNextSetpItem = [[XHItem alloc] initWithNormalImage:[UIImage imageNamed:@"tabBar-camera"] selectedImage:[UIImage imageNamed:@"tabBar-camera-on"] title:@"title5" itemSelectedBlcok:^(XHItemView *itemView) {
        [weakSelf _pushXHShareViewController];
        NSLog(@"index : %d", itemView.item.index);
    }];
    gotoNextSetpItem.unHieghtSelect = YES;
    [items addObject:gotoNextSetpItem];
    self.items = items;
}

#pragma mark - Life cycle

- (void)_setup {
    self.cameraType = kXHSceces;
    self.selectIndex = 1;
}

- (id)init {
    self = [super init];
    if (self) {
        [self _setup];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self _setupItemScrollToolBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
