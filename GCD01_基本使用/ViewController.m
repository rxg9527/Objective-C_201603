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
    // 1 创建一个并行队列
    dispatch_queue_t queue = dispatch_queue_create("com.Yuen.queue1", DISPATCH_QUEUE_CONCURRENT);
    
    // 2 将任务加入队列
    /**
     *  输出结果
     2016-03-30 21:24:55.918 GCD01_基本使用[18828:6739963] <NSThread: 0x7feb21d507a0>{number = 5, name = (null)}
     2016-03-30 21:24:55.918 GCD01_基本使用[18828:6739966] <NSThread: 0x7feb21e452b0>{number = 6, name = (null)}
     2016-03-30 21:24:55.918 GCD01_基本使用[18828:6739961] <NSThread: 0x7feb21d16820>{number = 4, name = (null)}
     2016-03-30 21:24:55.918 GCD01_基本使用[18828:6739964] <NSThread: 0x7feb238056b0>{number = 7, name = (null)}
     2016-03-30 21:24:55.918 GCD01_基本使用[18828:6739965] <NSThread: 0x7feb21c34d90>{number = 8, name = (null)}
     2016-03-30 21:24:55.918 GCD01_基本使用[18828:6739967] <NSThread: 0x7feb21e3fe20>{number = 9, name = (null)}
     */
    dispatch_async(queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"%@", [NSThread currentThread]);
    });
}

@end
