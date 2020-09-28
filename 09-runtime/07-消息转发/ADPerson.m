//
//  ADPerson.m
//  07-消息转发
//
//  Created by zhongaidong on 2020/9/28.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ADPerson.h"
#import "ADCat.h"
#import <objc/runtime.h>

@implementation ADPerson

#pragma mark - 对象方法
/// 方式一:
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(test)) {
//        // objc_msgSend([[MJCat alloc] init], aSelector)
//        return [ADCat new];
////        return [[ADCat alloc] init];
//    }
//    return  [super forwardingTargetForSelector:aSelector];
//}

/// 方式二
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(test)) {
//        // 这里返回nil和不写当前方法效果一样
//        return nil;
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

// 返回方法签名: 返回值类型, 参数类型
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(test2:)) {
        // - (void)test;
//        NSMethodSignature *sign1 = [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
//        NSMethodSignature *sign2 = [NSMethodSignature signatureWithObjCTypes:"v@:"];
//        NSMethodSignature *sign3 = [[[ADCat alloc] init] methodSignatureForSelector:@selector(test)];
        // 如果有返回值, 就会调用forwardInvocation:方法
//        return sign3;
        
        // - (int)test2:(int)age;
        return [NSMethodSignature signatureWithObjCTypes:"i@:i"];
        
    }
    return [super methodSignatureForSelector:aSelector];
}


/// NSInvocation封装了一个方法调用，包括：方法调用者、方法名、方法参数
/// @param anInvocation 调用管理者
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    // - (void)test;
    // 方式一: 不推荐
//    anInvocation.target = [[ADCat alloc] init];
//    [anInvocation invoke];
    
    // 方式二
//    [anInvocation invokeWithTarget:[[ADCat alloc] init]];
    
    // - (int)test2:(int)age;
    // 获取返回值
//    int ret;
//    [anInvocation getReturnValue:&ret];
//
//    NSLog(@"%d", ret);
    
    // 方式三
    NSLog(@"11111");
}

#pragma mark - 类方法
/// 类方法名字和对象方法名一模一样, 只要将-改为+即可
+ (id)forwardingTargetForSelector:(SEL)aSelector {
    if (aSelector == @selector(test3)) {
        return [ADCat class];
    }
    return [super forwardingTargetForSelector:aSelector];
}

@end
