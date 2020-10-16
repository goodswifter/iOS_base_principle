//
//  main.m
//  11-isKindOfClass和isMemberOfClass
//
//  Created by zhongaidong on 2020/10/15.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import <objc/runtime.h>

//- (BOOL)isMemberOfClass:(Class)cls {
//    return [self class] == cls;
//}
//
//- (BOOL)isKindOfClass:(Class)cls {
//    for (Class tcls = [self class]; tcls; tcls = tcls->superclass) {
//        if (tcls == cls) return YES;
//    }
//    return NO;
//}
//
//+ (BOOL)isMemberOfClass:(Class)cls {
//    return object_getClass((id)self) == cls;
//}
//
//+ (BOOL)isKindOfClass:(Class)cls {
//    for (Class tcls = object_getClass((id)self); tcls; tcls = tcls->superclass) {
//        if (tcls == cls) return YES;
//    }
//    return NO;
//}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        /*
         - isMemberOfClass : 是否是当前类的实例对象
         - isKindOfClass : 是否是当前类以及其父类的实例对象
         + isMemberOfClass : 是否是当前元类的类对象
         + isKindOfClass : 是否是当前元类以及其父类的类对象
         */
        
        // 这句代码的方法调用者不管是哪个类（只要是NSObject体系下的），都返回YES
        // [XXX类 isKindOfClass:[NSObject class]]
        // NSObject == [NSObject class]
//        NSLog(@"%d", [NSObject isKindOfClass:[NSObject class]]); // 1
//        NSLog(@"%d", [NSObject isMemberOfClass:[NSObject class]]); // 0
//        NSLog(@"%d", [NSObject isMemberOfClass:object_getClass([NSObject class])]);
//        NSLog(@"%d", [MJPerson isKindOfClass:[MJPerson class]]); // 0
//        NSLog(@"%d", [MJPerson isMemberOfClass:[MJPerson class]]); // 0
//
//        NSLog(@"%p - %p", [NSObject class], object_getClass([NSObject class]));
        
        id person = [[MJPerson alloc] init];
        
        NSLog(@"%d", [person isMemberOfClass:[MJPerson class]]);
        NSLog(@"%d", [person isMemberOfClass:[NSObject class]]);
        
        NSLog(@"%d", [person isKindOfClass:[MJPerson class]]);
        NSLog(@"%d", [person isKindOfClass:[NSObject class]]);
    }
    return 0;
}
