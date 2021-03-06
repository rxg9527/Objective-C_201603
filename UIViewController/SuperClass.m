//
// Created by Yuen-iMac on 16/3/21.
// Copyright (c) 2016 Yuen. All rights reserved.
//

#import "SuperClass.h"

/*
 * 输出结果:
 * 2016-03-21 16:46:56.648 UIViewController[12001:415914] SuperClass +[SuperClass initialize]
 * 2016-03-21 16:46:56.649 UIViewController[12001:415914] SuperClass +[SuperClass load]
 * 2016-03-21 16:46:56.649 UIViewController[12001:415914] +[InsideInitialize load]
 *
 * 输出中，我们还发现SuperClass的+(void)initialize也被调用了，而且是在+(void)load之前被执行.
 * 符合文档中对+(void)initialize的说明：在类的第一个方法被调用前调用。同时也说明runtime对+(void)load的调用并不视为类的第一个方法
*/
@implementation SuperClass

/* load是只要类所在文件被引用就会被调用，
 * 而initialize是在类或者其子类的第一个方法被调用前调用。
 *
 * 如果类没有被引用进项目，就不会有load调用；
 * 但即使类文件被引用进来，但是没有使用，那么initialize也不会被调用。
 *
 * 相同点在于：方法只会被调用一次*/
+ (void)initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end

@implementation ChildClass

+ (void)load {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end

/**
 *  2016-03-21 17:21:10.695 UIViewController[12671:447686] MainClass +[MainClass(OtherCategory) initialize]
 *  2016-03-21 17:21:10.695 UIViewController[12671:447686] MainClass +[MainClass load]
 *  2016-03-21 17:21:10.695 UIViewController[12671:447686] MainClass +[MainClass(Category) load]
 *  2016-03-21 17:21:10.695 UIViewController[12671:447686] MainClass +[MainClass(OtherCategory) load]
 *  只有最后一个类别(Category)的+(void)initialize执行，其他两个都被隐藏。
 *  而对于+(void)load，三个都执行.
 *  Apple的文档中介绍顺序一样：先执行类自身的实现，再执行类别(Category)中的实现。
 */
@implementation MainClass (Category)

+ (void)load {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void)initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end

@implementation MainClass (OtherCategory)

+ (void)load {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void)initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end

@implementation MainClass

+ (void)load {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

+ (void)initialize {
    NSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end