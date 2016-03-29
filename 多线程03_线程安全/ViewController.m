//
//  ViewController.m
//  多线程03_线程安全
//
//  Created by Yuen on 16/3/29.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** 售票员01 */
@property (nonatomic, strong) NSThread *thread01;
/** 售票员02 */
@property (nonatomic, strong) NSThread *thread02;
/** 售票员03 */
@property (nonatomic, strong) NSThread *thread03;

/** 票的总数 */
@property (nonatomic, assign) NSInteger ticketCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.ticketCount = 100;
    
    self.thread01 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread01.name = @"售票员01";
    
    self.thread02 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread02.name = @"售票员02";
    
    self.thread03 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread03.name = @"售票员03";
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.thread01 start];
    [self.thread02 start];
    [self.thread03 start];
}

- (void)saleTicket
{
    /**
     *  输出结果可以看出线程是不安全的
     2016-03-29 23:27:12.990 多线程03_线程安全[16691:6542564] 售票员01卖了一张票，还剩下99张
     2016-03-29 23:27:12.990 多线程03_线程安全[16691:6542565] 售票员02卖了一张票，还剩下98张
     2016-03-29 23:27:12.990 多线程03_线程安全[16691:6542564] 售票员01卖了一张票，还剩下96张
     2016-03-29 23:27:12.990 多线程03_线程安全[16691:6542565] 售票员02卖了一张票，还剩下95张
     2016-03-29 23:27:12.990 多线程03_线程安全[16691:6542566] 售票员03卖了一张票，还剩下97张

     */
    while (1) {
        // 先取出总数
        NSInteger count = self.ticketCount;
        if (count > 0) {
            self.ticketCount = count - 1;
            NSLog(@"%@卖了一张票，还剩下%zd张", [NSThread currentThread].name, self.ticketCount);
        } else {
            NSLog(@"票已经卖完了");
            break;
        }
    }
}

@end
