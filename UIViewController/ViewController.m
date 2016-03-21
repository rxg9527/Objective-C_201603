//
//  ViewController.m
//  UIViewController
//
//  Created by Yuen-iMac on 16/3/21.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"
#import "SuperClass.h"

/* (1) View Management：管理View
 * (2) Data Marshalling：管理数据
 * (3) User Interactions：响应用户交互
 * (4) Resource Management：管理资源
 * (5) Adaptivity：适配不同的屏幕尺寸空间的变化
 * */
@interface ViewController ()

@end

@implementation ViewController

/*定制VC时，如果覆盖loadView方法，不需要调用[super loadView]方法*/
- (void)loadView {
    NSLog(@"%s", __func__);

    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [view setBackgroundColor:[UIColor redColor]];
    self.view = view;
}

- (void)viewDidLoad {
    NSLog(@"%s", __func__);

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
