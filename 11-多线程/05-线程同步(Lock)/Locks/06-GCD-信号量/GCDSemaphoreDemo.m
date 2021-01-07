//
//  GCDSemaphoreDemo.m
//  线程同步
//
//  Created by zhongad on 2019/12/5.
//  Copyright © 2019 zhongad. All rights reserved.
//

#import "GCDSemaphoreDemo.h"

@interface GCDSemaphoreDemo ()
/// 测试信号量
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (strong, nonatomic) dispatch_semaphore_t ticketSemaphore;
@property (strong, nonatomic) dispatch_semaphore_t moneySemaphore;
@end

/// GCD : 信号量Semaphore, 最大线程数
@implementation GCDSemaphoreDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        self.semaphore = dispatch_semaphore_create(5);
        self.ticketSemaphore = dispatch_semaphore_create(1);
        self.moneySemaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)__drawMoney {
    dispatch_semaphore_wait(self.moneySemaphore, DISPATCH_TIME_FOREVER);
    
    [super __drawMoney];
    
    dispatch_semaphore_signal(self.moneySemaphore);
}

- (void)__saveMoney {
    dispatch_semaphore_wait(self.moneySemaphore, DISPATCH_TIME_FOREVER);
    
    [super __saveMoney];
    
    dispatch_semaphore_signal(self.moneySemaphore);
}

- (void)__saleTicket {
    dispatch_semaphore_wait(self.ticketSemaphore, DISPATCH_TIME_FOREVER);
    
    [super __saleTicket];
    
    dispatch_semaphore_signal(self.ticketSemaphore);
}

/// 允许最多5个线程同时工作
- (void)otherTest {
    for (int i = 0; i < 20; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(__test) object:nil] start];
    }
}

- (void)__test {
    
    
    // 第二个参数 : dispatch_time_t timeout, 比较的时间什么时候超时
    // DISPATCH_TIME_NOW : 立刻比较, 设置之后不起作用
    // DISPATCH_TIME_FOREVER : 很长时间内比较都有效

    // 如果信号量的值 > 0, 就让信号量的值减1, 然后继续往下执行代码
    // 如果信号量的值 <= 0, 就会休眠等待, 直到信号量的值变成>0, 就让信号量的值减1, 然后继续往下执行代码
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    
    
    sleep(2);
    NSLog(@"%s", __func__);
    
    // 让信号量的值+1
    dispatch_semaphore_signal(self.semaphore);
}

@end
