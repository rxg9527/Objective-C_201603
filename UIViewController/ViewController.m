//
//  ViewController.m
//  UIViewController
//
//  Created by Yuen-iMac on 16/3/21.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"
#import "SuperClass.h"

/* (1) View Management：管理View
 * (2) Data Marshalling：管理数据
 * (3) User Interactions：响应用户交互
 * (4) Resource Management：管理资源
 * (5) Adaptivity：适配不同的屏幕尺寸空间的变化
 * */
@interface ViewController ()

@end

@implementation ViewController

/*定制VC时，如果覆盖loadView方法，不需要调用[super loadView]方法*/
- (void)loadView {
//    NSLog(@"%s", __func__);

    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [view setBackgroundColor:[UIColor redColor]];
    self.view = view;
}

- (void)viewDidLoad {
//    NSLog(@"%s", __func__);

    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    /*+(void)load和+(void)initialize可当做普通类方法(Class Method)被调用*/
//    /* 输出结果
//     * 前面三个结果跟之前一样，不过之后ChildClass的+(void)initialize也被自动执行调用，并且我们可以在其中安全创建出InsideInitialize类并使用它，
//     * 而InsideInitialize因为调用alloc方法是第一次使用类方法， 所以激发了InsideInitialize的+(void)initialize。
//     * 另一个方面，ChildClass继承下了+(void)load而且可以被安全地当做普通类方法(Class Method)被使用。
//     * 这也就是load和initialize被调用一次是相对runtime而言（比如SuperClass的initialize不会因为自身load方法调用一次，又因为子类调用了load又执行一次），我们依然可以直接去反复调用这些方法*/
//    [ChildClass load];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
