//
//  ViewController.m
//  05_UIImageView
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
    
    //1.第一种方法
    //从一个文件读取一张图片
    NSString *path = [[NSBundle mainBundle] pathForResource:@"map" ofType:@"png"];
    //每次都从文件中读取,适用于我们在程序中只使用一次的图片
    //不会存储缓存,适用于比较大的图片
    UIImage *image1 = [UIImage imageWithContentsOfFile:path];
    NSLog(@"%f,%f", image1.size.width, image1.size.height);
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image1];
    imageView.frame = CGRectMake(0, 100, image1.size.width, image1.size.height);
    [self.view addSubview:imageView];

    //2.第二种方式
    //也不会存储缓存
    //从网络下载下来的二进制数据显示
    //UIImage *image2 = [UIImage imageWithData:<#(NSData *)#>];
    
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"q" ofType:@"jpg"];
    NSData *data = [NSData dataWithContentsOfFile:path2];
    
    UIImage *image2 = [UIImage imageWithData:data scale:[UIScreen mainScreen].scale];
    NSLog(@"image2:width=%f, height=%f", image2.size.width, image2.size.height);
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:image2];
    imageView2.frame = CGRectMake(0, 300, image2.size.width, image2.size.height);
    [self.view addSubview:imageView2];

    //3.第三种方式
    //传入图片的名称
    //能够存储缓存,适用于使用多次的图片和较小的图片
    //能够自动的适配图片
    //player10.png  player10@2x.png  player10@3x.png
//    UIImage *image3 = [UIImage imageNamed:@"player10.png"];

}

@end
