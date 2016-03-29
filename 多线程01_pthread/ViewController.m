//
//  ViewController.m
//  多线程01_pthread
//
//  Created by Yuen on 16/3/29.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnClicked:(id)sender {
    // 输出结果如下，并且此时textView无法滑动（主线程被阻塞）
    // 99999---<NSThread: 0x7f90e0405e70>{number = 1, name = main}---<NSThread: 0x7f90e0405e70>{number = 1, name = main}
    for (NSUInteger i = 0; i < 100000; i++) {
        NSLog(@"%zd---%@---%@", i, [NSThread mainThread], [NSThread currentThread]);
    }
}

@end
