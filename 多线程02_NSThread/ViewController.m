//
//  ViewController.m
//  多线程02_NSThread
//
//  Created by Yuen on 16/3/29.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"
#import "XGThread.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self createThread2];
}

- (void)createThread3 {
    // 隐式创建并启动线程
    [self performSelectorInBackground:@selector(run:) withObject:@""];
}

- (void)createThread2 {
    // 无法命名线程
    // 创建线程后自动启动线程
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"Yuen"];
}

- (void)createThread1 {
    /*
     1、 简单使用NSThread
     // 创建线程
     NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"Yuen"];
     // 启动线程
     [thread start];
     */
    
    /*2、 验证XGThread生命周期*/
    XGThread *thread = [[XGThread alloc] initWithTarget:self selector:@selector(run:) object:@"XG"];
    thread.name = @"XG-Thread";
    NSLog(@"%d", [thread isMainThread]);
    [thread start];
}

- (void)run:(NSString *)parameter {
    /*输出结果：run---Yuen---<NSThread: 0x7ff540406760>{number = 1, name = (null)}---<NSThread: 0x7ff5421334f0>{number = 3, name = (null)}*/
    for (NSUInteger i = 0; i < 10000; i++) {
        NSLog(@"run---%@---%@---%@", parameter, [NSThread mainThread], [NSThread currentThread].name);
    }
    NSLog(@"%d", [NSThread isMainThread]);
}

@end
