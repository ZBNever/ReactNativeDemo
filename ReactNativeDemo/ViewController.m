//
//  ViewController.m
//  ReactNativeDemo
//
//  Created by Never on 2018/1/4.
//  Copyright © 2018年 Never. All rights reserved.
//

#import "ViewController.h"
#import "RNViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"原生页面";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 100, 300, 30);
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"点击去RN界面" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(gotoRNVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}
- (void)gotoRNVC:(UIButton *)sender{
    RNViewController *RNVC = [[RNViewController alloc] init];
    [self.navigationController pushViewController:RNVC animated:YES];
}


@end
