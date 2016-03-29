//
//  ViewController.m
//  多线程04_线程间通信
//
//  Created by Yuen on 16/3/29.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self download2];
}

- (void)download2 {
    // 图片的网络路径
    NSURL *url = [NSURL URLWithString:@"http://map.onegreen.net/%E4%B8%AD%E5%9B%BD%E6%94%BF%E5%8C%BA2500.jpg"];
    
    CFAbsoluteTime begin = CFAbsoluteTimeGetCurrent();
    NSLog(@"%f", begin);
//    NSDate *beginDate = [NSDate date];
    // 根据图片的网络路径去下载图片数据
    NSData *data = [NSData dataWithContentsOfURL:url];
    CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
//    NSDate *endDate = [NSDate date];
//    NSLog(@"%f", [endDate timeIntervalSinceDate:beginDate]);
    NSLog(@"%f %f", end, end - begin);
    
    // 显示图片
    self.imageView.image = [UIImage imageWithData:data];
}

/*主线程下载图片，耗时11.622523*/
- (void)download {
    // 图片的网络路径
    NSURL *url = [NSURL URLWithString:@"http://map.onegreen.net/%E4%B8%AD%E5%9B%BD%E6%94%BF%E5%8C%BA2500.jpg"];
    
    NSDate *beginDate = [NSDate date];
    // 根据图片的网络路径去下载图片数据
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDate *endDate = [NSDate date];
    
    NSLog(@"%f", [endDate timeIntervalSinceDate:beginDate]);
    
    // 显示图片
    self.imageView.image = [UIImage imageWithData:data];
}

@end
