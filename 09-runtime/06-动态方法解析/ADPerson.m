//
//  ADPerson.m
//  06-动态方法解析
//
//  Created by zhongaidong on 2020/9/25.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ADPerson.h"
#import <objc/runtime.h>

@implementation ADPerson

/// C语言函数
void c_other(id self, SEL _cmd) {
    NSLog(@"c_other - %@ - %@", self, NSStringFromSelector(_cmd));
}

/// OC方法
- (void)other {
    NSLog(@"%s", __func__);
}

/// 动态解析对象方法
/// @param sel 方法名称
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(test)) {
        // 动态添加test方法的实现
        // C语言函数
//        class_addMethod(self, sel, (IMP)c_other, "v16@0:8");
        
        // OC方法
        // 获取方法
        Method method = class_getInstanceMethod(self, @selector(other));
        
        // 动态添加test方法的实现
        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
        
        // 返回YES代表有动态添加方法
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

/// 动态解析对象方法
/// @param sel 方法名称
+ (BOOL)resolveClassMethod:(SEL)sel {
    if (sel == @selector(test)) {
        // 动态添加test方法的实现
        class_addMethod(object_getClass(self), sel, (IMP)c_other, "v16@0:8");
        return YES;
    }
    return [super resolveClassMethod:sel];
}

@end
