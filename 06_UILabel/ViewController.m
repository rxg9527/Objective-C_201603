//
//  ViewController.m
//  06_UILabel
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
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 75, 40)];   //声明UIlbel并指定其位置和长宽
    [self.view addSubview:label];
    
    label.backgroundColor = [UIColor clearColor];   //设置label的背景色，这里设置为透明色。
    label.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];   //设置label的字体和字体大小。
    label.text = @"helloworldhelloworldhelloworld";   //设置label所显示的文本
    label.textColor = [UIColor blueColor];    //设置文本的颜色
    label.shadowColor = [UIColor colorWithWhite:0.1f alpha:0.8f];    //设置文本的阴影色彩和透明度。
    label.shadowOffset = CGSizeMake(2.0f, 2.0f);     //设置阴影的倾斜角度。
    label.textAlignment = NSTextAlignmentCenter;     //设置文本在label中显示的位置，这里为居中。
    label.numberOfLines = 0;    // 指定label的行数
    
    label.lineBreakMode = NSLineBreakByWordWrapping;     //指定换行模式
    label.transform = CGAffineTransformMakeRotation(0.1);     //设置label的旋转角度
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
