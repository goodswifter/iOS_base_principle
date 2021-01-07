//
//  NSConditionDemo.m
//  线程同步
//
//  Created by zhongad on 2019/12/5.
//  Copyright © 2019 zhongad. All rights reserved.
//

#import "NSConditionDemo.h"

@interface NSConditionDemo ()
@property (strong, nonatomic) NSCondition *condition;
@property (strong, nonatomic) NSMutableArray *data;
@end

/// NSCondition : 条件锁(pthread_cond_t)
@implementation NSConditionDemo

#pragma mark - Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        self.condition = [[NSCondition alloc] init];
        
        self.data = [NSMutableArray array];
    }
    return self;
}

#pragma mark - Private Function
- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__remove) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__add) object:nil] start];
}

/// 生产者-消费者模式

/// 线程1
/// 删除数组中的元素
- (void)__remove {
    // 加锁
    [self.condition lock];
    NSLog(@"__remove - begin");
    
    if (self.data.count == 0) {
        // 等待
        // 1. 解锁
        // 2. 让当前线程休眠
        // 3. 接收到信号, 唤醒线程, 等到锁被解开之后, 加锁
        // 注意 : 不是说一接收到信号, 就加锁, 因为锁可能还没有解开
//        pthread_cond_wait(&_cond, &_mutex);
        [self.condition wait];
    }
    
    [self.data removeLastObject];
    NSLog(@"删除了元素");
    
    [self.condition unlock];
}

/// 线程2
/// 往数组中添加元素
- (void)__add {
    [self.condition lock];
    
    sleep(1);
    
    [self.data addObject:@"Test"];
    NSLog(@"添加了元素");
    
    // 信号
    [self.condition signal];
//    pthread_cond_signal(&_cond);
    // 广播
//    [self.condition broadcast];
//    pthread_cond_broadcast(&_cond);
    
    sleep(2);
    
    [self.condition unlock];
}

@end
