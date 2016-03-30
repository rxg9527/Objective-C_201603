//
//  ViewController.m
//  GCD01_基本使用
//
//  Created by Yuen on 16/3/30.
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self asyncConcurrent];
}

/**
 *  异步函数 + 并发队列： 可以同时开启多条线程
 */
- (void)asyncConcurrent {
    // 1 创建一个并行队列
//    dispatch_queue_t queue = dispatch_queue_create("com.Yuen.queue1", DISPATCH_QUEUE_CONCURRENT);
    
    // 1 获得全局的并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 2 将任务加入队列
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i < 10; i++) {
            NSLog(@"1_%@", [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i < 10; i++) {
            NSLog(@"2_%@", [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i < 10; i++) {
            NSLog(@"3_%@", [NSThread currentThread]);
        }
    });
}

@end
