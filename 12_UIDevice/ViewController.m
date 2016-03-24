//
//  ViewController.m
//  12_UIDevice
//
//  Created by Yuen on 16/3/24.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"设备名——%@，\n系统版本号——%@，\n屏幕旋转方向——%@，\n区分iPad还是iPhone——%@", [UIDevice currentDevice].name, [UIDevice currentDevice].systemVersion, @([UIDevice currentDevice].orientation), @([UIDevice currentDevice].userInterfaceIdiom));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
