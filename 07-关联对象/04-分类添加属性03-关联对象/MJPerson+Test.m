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

// 方式一: 使用
// 1. 不要用全局的变量, 全局的变量都可以访问, 也可以修改
// 外界是否可以修改 ???
// const void *Mykey = &Mykey;
// static const void *MyKey = &MyKey;
// 使用MyKey

// 方式二: 使用常量地址作为key
// 为啥用char, 因为char类型的变量只有1个字节
// 外界是否可以修改 ???
static char MyKey;
static const char MJNameKey;
static const char MJWeightKey;

// 方式三:
// 使用属性名作为key
// @"property", 这种需要维护

// 方式四(推荐): 使用getter方法的@selector作为key
// @selector(getter);
// 可以直接使用getter的隐藏参数_cmd == @selector(getter)

- (void)setName:(NSString *)name {
    /*
     id object: 要关联的对象
     const void * key: 关联属性的key
     id value: 要关联的属性值
     objc_AssociationPolicy policy: 策略
     */
//    objc_setAssociatedObject(self, &MJNameKey, name, OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)name {
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

@end
