//
//  ViewController.m
//  KVO_基本原理
//
//  Created by Yuen on 16/3/30.
//  Copyright © 2016年 Yuen. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.person = [Person new];
    
    // KVO底层实现:
    // 1.动态创建NSKVONotifying_Person,NSKVONotifying_Person是Person子类,做KVO
    // 2.修改当前对象的isa指针->NSKVONotifying_Person
    // 3.只要调用对象的set,就会调用NSKVONotifying_Person的set方法
    // 4.重写NSKVONotifying_Person的set方法：1.[super set:] 2.通知观察者,告诉你属性改变
    /**
     *  在『[self.person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];』代码上打断点，会发现
     *  self->_person->isa的值由Person变为NSKVONotifying_Person
     */
    [self.person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.person.age++;
    /**
     *  不调用set方法，无法触发KVO
     */
    self.person->_age++;
}

// 监听的属性只要一改变就调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSLog(@"%zd", self.person.age);
}

@end
