//
//  MutexDemo.m
//  线程同步
//
//  Created by zhongad on 2019/12/4.
//  Copyright © 2019 zhongad. All rights reserved.
//

#import "MutexDemo.h"
#import <pthread.h>

@interface MutexDemo ()
/// 票锁
@property (nonatomic, assign) pthread_mutex_t ticketMutex;
/// 钱锁
@property (nonatomic, assign) pthread_mutex_t moneyMutex;

@end

/// pthread_mutex_t : 普通锁
@implementation MutexDemo

#pragma mark - Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        [self __initMutex:&_ticketMutex];
        [self __initMutex:&_moneyMutex];
    }
    return self;
}

- (void)dealloc {
    pthread_mutex_destroy(&_moneyMutex);
    pthread_mutex_destroy(&_ticketMutex);
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
    
    // 方式一
    // 1. 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    // 设置Mutex锁的类型
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    
    // 2. 初始化锁
    pthread_mutex_init(mutex, &attr);
    
    // 3. 销毁属性
    pthread_mutexattr_destroy(&attr);
    
    // 方式二 : 与方式一是一样的, 普通锁可以使用NULL代替
//    pthread_mutex_init(mutex, NULL);
}

- (void)__saleTicket {
    // 4. 加锁
    pthread_mutex_lock(&_ticketMutex);
    
    [super __saleTicket];
    
    // 5. 解锁
    pthread_mutex_unlock(&_ticketMutex);
}

- (void)__saveMoney {
    pthread_mutex_lock(&_moneyMutex);
    
    [super __saveMoney];
    
    pthread_mutex_unlock(&_moneyMutex);
}

- (void)__drawMoney {
    pthread_mutex_lock(&_moneyMutex);
    
    [super __drawMoney];
    
    pthread_mutex_unlock(&_moneyMutex);
}

@end
