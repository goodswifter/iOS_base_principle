//
//  MutexDemo02.m
//  线程同步
//
//  Created by zhongad on 2019/12/4.
//  Copyright © 2019 zhongad. All rights reserved.
//

#import "MutexDemo02.h"
#import <pthread.h>

@interface MutexDemo02 ()
/// 票锁
@property (nonatomic, assign) pthread_mutex_t mutex;

@end

/// pthread_mutex_t : 递归锁
/// 允许同一个线程对一把锁进行重复加锁
@implementation MutexDemo02

#pragma mark - Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        [self __initMutex:&_mutex];
    }
    return self;
}

- (void)dealloc {
    pthread_mutex_destroy(&_mutex);
}

#pragma mark - Private Function
/// 初始化锁
- (void)__initMutex:(pthread_mutex_t *)mutex {
    // 静态初始化
//    pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    
    /**
     mutex的类型
     #define PTHREAD_MUTEX_NORMAL        普通锁
     #define PTHREAD_MUTEX_ERRORCHECK    错误锁
     #define PTHREAD_MUTEX_RECURSIVE     递归锁
     #define PTHREAD_MUTEX_DEFAULT       PTHREAD_MUTEX_NORMAL
     */
    
    // 1. 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    // 设置Mutex类型
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_RECURSIVE);
    
    // 2. 初始化锁
    pthread_mutex_init(mutex, &attr);
    
    // 3. 销毁属性
    pthread_mutexattr_destroy(&attr);
}

// 递归
- (void)otherTest {
    pthread_mutex_lock(&_mutex);

    NSLog(@"%s", __func__);

    static int count = 0;
    if (count++ < 10) {
        [self otherTest];
    }

    pthread_mutex_unlock(&_mutex);
}

// 对一把锁重复加锁
- (void)otherTest2 {
    pthread_mutex_lock(&_mutex);
    
    [super moneyTest];
    
    pthread_mutex_lock(&_mutex);
    
    [super ticketTest];
    
    pthread_mutex_unlock(&_mutex);
    
    pthread_mutex_unlock(&_mutex);
}

@end
