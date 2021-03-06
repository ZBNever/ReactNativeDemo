//
//  RNViewController.m
//  ReactNativeDemo
//
//  Created by Never on 2018/1/4.
//  Copyright © 2018年 Never. All rights reserved.
//

#import "RNViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>

@interface RNViewController ()

@property(nonatomic, strong) RCTRootView *rootView;

@end

@implementation RNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"RN界面";
    [self.navigationController setNavigationBarHidden:YES];
//    NSURL * jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=true"];
//    NSURL *jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
    NSURL *jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"index.ios" withExtension:@"jsbundle"];
    self.rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                moduleName:@"ReactNativeDemo"//@"eningSupplier"
                                         initialProperties:nil
                                             launchOptions:nil];
    self.view =self.rootView;
}

@end
