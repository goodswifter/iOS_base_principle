//
//  NSRecursiveLockDemo.m
//  线程同步
//
//  Created by zhongad on 2019/12/5.
//  Copyright © 2019 zhongad. All rights reserved.
//

#import "NSRecursiveLockDemo.h"

@interface NSRecursiveLockDemo ()
/// NSRecursiveLock : 递归锁
@property (nonatomic, strong) NSRecursiveLock *recursiveLock;

@end

/// NSRecursiveLock : 递归锁
/// 允许同一个线程对一把锁进行重复加锁
@implementation NSRecursiveLockDemo

#pragma mark - Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        self.recursiveLock = [[NSRecursiveLock alloc] init];
    }
    return self;
}

- (void)otherTest {
    [self.recursiveLock lock];
    
    NSLog(@"%s", __func__);
    
    static int count = 0;
    if (count++ < 10) {
        [self otherTest];
    }
    
    [self.recursiveLock unlock];
}
@end
