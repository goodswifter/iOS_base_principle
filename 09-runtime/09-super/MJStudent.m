//
//  MJStudent.m
//  Interview05-super
//
//  Created by MJ Lee on 2018/5/26.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJStudent.h"
#import <objc/runtime.h>

@implementation MJStudent

/*
 [super message]的底层实现
 1. 消息接收者仍然是子类对象
 2. 从父类开始查找方法的实现
 */

struct objc_super {
    __unsafe_unretained _Nonnull id receiver; // 消息接收者
    __unsafe_unretained _Nonnull Class super_class; // 消息接收者的父类
};

- (void)run
{
    // super调用的receiver仍然是MJStudent对象
    // super 调用objc_super, 从父类开始找方法
    [super run];
    
    
//    struct objc_super arg = {self, [MJPerson class]};
//
//    objc_msgSendSuper(arg, @selector(run));
//
//
//    NSLog(@"MJStudet.......");
    
}

- (instancetype)init
{
    if (self = [super init]) {
        // 因为receiver都是MJStudent, 所以返回的类也是MJStudent
        // 从当前类开始往上找class方法 --> [NSObject class]
        NSLog(@"[self class] = %@", [self class]); // MJStudent
        NSLog(@"[self superclass] = %@", [self superclass]); // MJPerson

        NSLog(@"--------------------------------");

        // objc_msgSendSuper({self, [MJPerson class]}, @selector(class));
        // 从父类开始往上找class方法 --> [NSObject class]
        NSLog(@"[super class] = %@", [super class]); // MJStudent
        NSLog(@"[super superclass] = %@", [super superclass]); // MJPerson
    }
    return self;
}

@end

//@implementation NSObject
//
//- (Class)class
//{
//    return object_getClass(self);
//}
//
//- (Class)superclass
//{
//    return class_getSuperclass(object_getClass(self));
//}
//
//@end
