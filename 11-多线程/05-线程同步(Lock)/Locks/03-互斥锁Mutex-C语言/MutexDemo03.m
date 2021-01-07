//
//  MutexDemo03.m
//  线程同步
//
//  Created by zhongad on 2019/12/4.
//  Copyright © 2019 zhongad. All rights reserved.
//

#import "MutexDemo03.h"
#import <pthread.h>

@interface MutexDemo03 ()
@property (assign, nonatomic) pthread_mutex_t mutex;
@property (assign, nonatomic) pthread_cond_t cond;
@property (strong, nonatomic) NSMutableArray *data;
@end

/// pthread_mutex_t : 条件锁(pthread_cond_t)
@implementation MutexDemo03

#pragma mark - Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        [self __initMutex:&_mutex];
        
        self.data = [NSMutableArray array];
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
    
    // 方式一
    // 1. 初始化属性
    pthread_mutexattr_t attr;
    pthread_mutexattr_init(&attr);
    // 设置Mutex类型
    pthread_mutexattr_settype(&attr, PTHREAD_MUTEX_DEFAULT);
    
    // 2. 初始化锁
    pthread_mutex_init(mutex, &attr);
    
    // 3. 销毁属性
    pthread_mutexattr_destroy(&attr);

    // 4. 初始化条件
    pthread_cond_init(&_cond, NULL);
}

- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
}

/// 生产者-消费者模式

/// 线程1
/// 删除数组中的元素
- (void)__remove {
    // 加锁
    pthread_mutex_lock(&_mutex);
    NSLog(@"__remove - begin");
    
    if (self.data.count == 0) {
        // 等待
        // 1. 解锁
        // 2. 让当前线程休眠
        // 3. 接收到信号, 唤醒线程, 等到锁被解开之后, 加锁
        // 注意 : 不是说一接收到信号, 就加锁, 因为锁可能还没有解开
        pthread_cond_wait(&_cond, &_mutex);
    }
    
    [self.data removeLastObject];
    NSLog(@"删除了元素");
    
    pthread_mutex_unlock(&_mutex);
}

/// 线程2
/// 往数组中添加元素
- (void)__add {
    pthread_mutex_lock(&_mutex);
    
    sleep(1);
    
    [self.data addObject:@"Test"];
    NSLog(@"添加了元素");
    
    // 信号
    pthread_cond_signal(&_cond);
    // 广播
//    pthread_cond_broadcast(&_cond);
    
    sleep(2);
    
    pthread_mutex_unlock(&_mutex);
}

@end
