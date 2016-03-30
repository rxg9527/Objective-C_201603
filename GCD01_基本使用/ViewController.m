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
    [self syncMain];
}

/**
 * 同步函数 + 主队列： 程序假死
 */
- (void)syncMain
{
    /**
     *  输出结果：
     2016-03-30 22:09:33.263 GCD01_基本使用[20036:6800170] -[ViewController syncMain]
     */
    // 1.获得主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    NSLog(@"%s", __func__);
    // 2.将任务加入队列
    dispatch_sync(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"1_%@", [NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"2_%@", [NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"3_%@", [NSThread currentThread]);
        }
    });
    NSLog(@"%s", __func__);
}

/**
 * 异步函数 + 主队列：只在主线程中执行任务
 */
- (void)asyncMain
{
    /**
     *  输出结果：
     2016-03-30 22:07:43.380 GCD01_基本使用[19983:6797598] 1_<NSThread: 0x7fc7ab903890>{number = 1, name = main}
     2016-03-30 22:07:43.380 GCD01_基本使用[19983:6797598] 1_<NSThread: 0x7fc7ab903890>{number = 1, name = main}
     2016-03-30 22:07:43.380 GCD01_基本使用[19983:6797598] 2_<NSThread: 0x7fc7ab903890>{number = 1, name = main}
     2016-03-30 22:07:43.381 GCD01_基本使用[19983:6797598] 2_<NSThread: 0x7fc7ab903890>{number = 1, name = main}
     2016-03-30 22:07:43.381 GCD01_基本使用[19983:6797598] 3_<NSThread: 0x7fc7ab903890>{number = 1, name = main}
     2016-03-30 22:07:43.381 GCD01_基本使用[19983:6797598] 3_<NSThread: 0x7fc7ab903890>{number = 1, name = main}
     */
    // 1.获得主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 2.将任务加入队列
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"1_%@", [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"2_%@", [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"3_%@", [NSThread currentThread]);
        }
    });
}

/**
 *  同步函数 + 串行队列：
    同步：在当前线程中执行任务，不具备开启新线程的能力
    串行：一个任务执行完毕后，再执行下一个任务
 */
- (void)syncSerial {
    /**
     *  输出结果
     2016-03-30 21:56:08.573 GCD01_基本使用[19857:6786018] 1_<NSThread: 0x7f899c004fc0>{number = 1, name = main}
     2016-03-30 21:56:08.573 GCD01_基本使用[19857:6786018] 1_<NSThread: 0x7f899c004fc0>{number = 1, name = main}
     2016-03-30 21:56:08.574 GCD01_基本使用[19857:6786018] 2_<NSThread: 0x7f899c004fc0>{number = 1, name = main}
     2016-03-30 21:56:08.574 GCD01_基本使用[19857:6786018] 2_<NSThread: 0x7f899c004fc0>{number = 1, name = main}
     2016-03-30 21:56:08.574 GCD01_基本使用[19857:6786018] 3_<NSThread: 0x7f899c004fc0>{number = 1, name = main}
     2016-03-30 21:56:08.574 GCD01_基本使用[19857:6786018] 3_<NSThread: 0x7f899c004fc0>{number = 1, name = main}
     */
    // 1 创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("com.Yuen.queue_serial", DISPATCH_QUEUE_SERIAL);
    
    // 2 将任务加入队列
    dispatch_sync(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"1_%@", [NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"2_%@", [NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"3_%@", [NSThread currentThread]);
        }
    });
}

/**
 *  异步函数 + 串行队列： 会开启新的线程，但是任务是串行的，执行完一个任务再执行下一个任务
    异步：可以在新的线程中执行任务，具备开启新线程的能力
    串行：一个任务执行完毕后，再执行下一个任务
 */
- (void)asyncSerial {
    /**
     *  输出结果
     2016-03-30 21:46:33.023 GCD01_基本使用[19591:6772655] 1_<NSThread: 0x7f89462011f0>{number = 3, name = (null)}
     2016-03-30 21:46:33.023 GCD01_基本使用[19591:6772655] 1_<NSThread: 0x7f89462011f0>{number = 3, name = (null)}
     2016-03-30 21:46:33.023 GCD01_基本使用[19591:6772655] 2_<NSThread: 0x7f89462011f0>{number = 3, name = (null)}
     2016-03-30 21:46:33.023 GCD01_基本使用[19591:6772655] 2_<NSThread: 0x7f89462011f0>{number = 3, name = (null)}
     2016-03-30 21:46:33.023 GCD01_基本使用[19591:6772655] 3_<NSThread: 0x7f89462011f0>{number = 3, name = (null)}
     2016-03-30 21:46:33.023 GCD01_基本使用[19591:6772655] 3_<NSThread: 0x7f89462011f0>{number = 3, name = (null)}
     */
    // 1 创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("com.Yuen.queue_serial", DISPATCH_QUEUE_SERIAL);
    
    // 2 将任务加入队列
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"1_%@", [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"2_%@", [NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"3_%@", [NSThread currentThread]);
        }
    });
}

/**
 *  同步函数 + 并发队列： 不会开启新的线程
    同步：只能在当前线程中执行任务，不具备开启新线程的能力
    并发：可以让多个任务并发（同时）执行（自动开启多个线程同时执行任务）
 */
- (void)syncConcurrent {
    /**
     *  输出结果
     2016-03-30 21:39:18.124 GCD01_基本使用[19329:6760814] 1_<NSThread: 0x7fb1eb404090>{number = 1, name = main}
     2016-03-30 21:39:18.124 GCD01_基本使用[19329:6760814] 1_<NSThread: 0x7fb1eb404090>{number = 1, name = main}
     2016-03-30 21:39:18.124 GCD01_基本使用[19329:6760814] 2_<NSThread: 0x7fb1eb404090>{number = 1, name = main}
     2016-03-30 21:39:18.124 GCD01_基本使用[19329:6760814] 2_<NSThread: 0x7fb1eb404090>{number = 1, name = main}
     2016-03-30 21:39:18.124 GCD01_基本使用[19329:6760814] 3_<NSThread: 0x7fb1eb404090>{number = 1, name = main}
     2016-03-30 21:39:18.124 GCD01_基本使用[19329:6760814] 3_<NSThread: 0x7fb1eb404090>{number = 1, name = main}
     */
    // 1 获得全局的并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 2 将任务加入队列
    dispatch_sync(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"1_%@", [NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"2_%@", [NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSUInteger i = 0; i < 2; i++) {
            NSLog(@"3_%@", [NSThread currentThread]);
        }
    });
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
