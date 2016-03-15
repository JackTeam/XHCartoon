//
//  XHCartoonCameraViewController.m
//  XHCartoon
//
//  Created by 曾 宪华 on 14-1-23.
//  Copyright (c) 2014年 嗨，我是曾宪华(@xhzengAIB)，曾加入YY Inc.担任高级移动开发工程师，拍立秀App联合创始人，热衷于简洁、而富有理性的事物 QQ:543413507 主页:http://zengxianhua.com All rights reserved.
//

#import "XHCartoonCameraViewController.h"

#import "XHPhotoEditorViewController.h"

#import "QBImagePickerController.h"

@interface XHCartoonCameraViewController () <QBImagePickerControllerDelegate>

@end

@implementation XHCartoonCameraViewController

#pragma mark - Action

- (void)_pushLibrarySelectViewController {
    QBImagePickerController *imagePickerController = [[QBImagePickerController alloc] init];
    imagePickerController.delegate = self;
    [self.navigationController presentModalViewController:[[UINavigationController alloc] initWithRootViewController:imagePickerController] animated:YES];
}

- (void)_pushPhotoEditorViewController {
    XHPhotoEditorViewController *photoEditorViewController = [[XHPhotoEditorViewController alloc] init];
    [self.navigationController pushViewController:photoEditorViewController animated:YES];
}

- (void)_filterItemSelect:(NSInteger)index {
    NSLog(@"index : %d", index);
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
    
    XHItem *libraryItem = [[XHItem alloc] initWithNormalImage:[UIImage imageNamed:@"tabBar-camera"] selectedImage:[UIImage imageNamed:@"tabBar-camera-on"] title:nil itemSelectedBlcok:^(XHItemView *itemView) {
        NSLog(@"index : %d", itemView.item.index);
        [weakSelf _pushLibrarySelectViewController];
    }];
    libraryItem.unHieghtSelect = YES;
    [items addObject:libraryItem];
    
    XHItem *capturePhotoItem = [[XHItem alloc] initWithNormalImage:[UIImage imageNamed:@"tabBar-camera"] selectedImage:[UIImage imageNamed:@"tabBar-camera-on"] title:nil itemSelectedBlcok:^(XHItemView *itemView) {
        [weakSelf _pushPhotoEditorViewController];
        NSLog(@"index : %d", itemView.item.index);
    }];
    capturePhotoItem.unHieghtSelect = YES;
    [items addObject:capturePhotoItem];
    
    XHItem *scenesItem = [[XHItem alloc] initWithNormalImage:[UIImage imageNamed:@"tabBar-camera"] selectedImage:[UIImage imageNamed:@"tabBar-camera-on"] title:nil itemSelectedBlcok:^(XHItemView *itemView) {
        NSInteger index = itemView.item.index;
        NSLog(@"index : %d", index);
        [weakSelf _filterEdting:index - 3];
    }];
    [items addObject:scenesItem];
    
    XHItem *filterItem = [[XHItem alloc] initWithNormalImage:[UIImage imageNamed:@"tabBar-camera"] selectedImage:[UIImage imageNamed:@"tabBar-camera-on"] title:@"title5" itemSelectedBlcok:^(XHItemView *itemView) {
        NSInteger index = itemView.item.index;
        NSLog(@"index : %d", index);
        [weakSelf _filterEdting:index - 3];
    }];
    [items addObject:filterItem];
    self.items = items;
}

#pragma mark - Life cycle

- (void)_setup {
    self.selectIndex = 4;
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

#pragma mark - QBImagePickerControllerDelegate

- (void)_dismissImagePickerController
{
    if (self.presentedViewController) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    } else {
        [self.navigationController popToViewController:self animated:YES];
    }
}

- (void)imagePickerController:(QBImagePickerController *)imagePickerController didSelectAssets:(NSArray *)assets {
    [self _dismissImagePickerController];
}

- (void)imagePickerController:(QBImagePickerController *)imagePickerController didSelectAsset:(ALAsset *)asset {
    [self _dismissImagePickerController];
}

- (void)imagePickerControllerDidCancel:(QBImagePickerController *)imagePickerController {
    [self _dismissImagePickerController];
}

@end
