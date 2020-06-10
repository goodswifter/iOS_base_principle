//
//  main.m
//  Interview
//
//  Created by zhongaidong on 2020/6/10.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

// NSObject Implementation
struct NSObject_IMPL {
    Class isa; // 8个字节
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
        
        // 获取NSObject类对象的成员变量所占用的内存大小 = 8
        NSLog(@"%zd", class_getInstanceSize([NSObject class]));
        
        // 获取NSObject实例对象所占内存的大小 == 16
        // iOS堆内存中最小的内存为16个字节
        NSLog(@"%zd", malloc_size((__bridge const void *)(obj)));
    }
    return 0;
}
