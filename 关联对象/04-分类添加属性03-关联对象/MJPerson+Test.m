//
//  MJPerson+Test.m
//  Interview01-Category的成员变量
//
//  Created by MJ Lee on 2018/5/9.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJPerson+Test.h"
#import <objc/runtime.h>

@implementation MJPerson (Test)

// 方式一: 使用指针变量作为key
// 1. 不要用全局的指针变量, 外界可以修改, 导致数据出错
static const void *MyKey1 = &MyKey1;

// 方式二: 使用常量的地址作为key
// 为啥用char, 因为char类型的常量只有1个字节
static const char MJNameKey;
static const char MJWeightKey;

// 方式三: 使用属性名作为key
// @"property"

// 方式四(推荐): 使用getter方法的@selector作为key
// @selector(getter);
// 可以直接使用getter的隐藏参数_cmd == @selector(getter)

- (void)setName:(NSString *)name {
    NSLog(@"3 - %p", MyKey1);
    /*
     id object: 要关联的对象
     const void * key: 关联属性的key
     id value: 要关联的属性值
     objc_AssociationPolicy policy: 策略
     */
//    objc_setAssociatedObject(self, &MJNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    // 方式四
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
    // 方式二
//    return objc_getAssociatedObject(self, &MJNameKey);
    
    // 方式四
//    return objc_getAssociatedObject(self, @selector(name));
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWeight:(int)weight {
//    objc_setAssociatedObject(self, &MJWeightKey, @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, @selector(weight), @(weight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (int)weight {
//    return [objc_getAssociatedObject(self, &MJWeightKey) intValue];
    return [objc_getAssociatedObject(self, _cmd) intValue];
}

- (void)removeAssociatedObjects {
    objc_removeAssociatedObjects(self);
}

@end
