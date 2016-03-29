//
//  ViewController.m
//  多线程01_pthread
//
//  Created by Yuen on 16/3/29.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

void * run (void *param) {
    /*
     输出结果如下，此时textView可以滑动（主线程未阻塞）
     99999---<NSThread: 0x7f9403502e90>{number = 1, name = (null)}---<NSThread: 0x7f940480ad40>{number = 3, name = (null)}
     */
    for (NSUInteger i = 0; i < 100000; i++) {
        NSLog(@"%zd---%@---%@", i, [NSThread mainThread], [NSThread currentThread]);
    }
    return NULL;
}

- (IBAction)btnClicked:(id)sender {
    /*
    // 输出结果如下，并且此时textView无法滑动（主线程被阻塞）
    // 99999---<NSThread: 0x7f90e0405e70>{number = 1, name = main}---<NSThread: 0x7f90e0405e70>{number = 1, name = main}
    for (NSUInteger i = 0; i < 100000; i++) {
        NSLog(@"%zd---%@---%@", i, [NSThread mainThread], [NSThread currentThread]);
    }
     */
    pthread_t thread1;
    pthread_create(&thread1, NULL, run, NULL);
}

@end
