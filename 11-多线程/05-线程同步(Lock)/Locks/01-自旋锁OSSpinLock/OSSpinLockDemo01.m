//
//  OSSpinLockDemo01.m
//  线程同步
//
//  Created by zhongad on 2019/12/3.
//  Copyright © 2019 zhongad. All rights reserved.
//  自旋锁, 忙等 while(1);

#import "OSSpinLockDemo01.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockDemo01 ()
/// money锁
@property (nonatomic, assign) OSSpinLock moneyLock;
/// ticket锁
@property (nonatomic, assign) OSSpinLock ticketLock;
@end

/// OSSpinLock
@implementation OSSpinLockDemo01

- (instancetype)init {
    self = [super init];
    if (self) {
        // 1. 初始化锁
        self.moneyLock = OS_SPINLOCK_INIT;
        self.ticketLock = OS_SPINLOCK_INIT;
    }
    return self;
}

/*
 自旋锁和互斥锁的区别:
 
 自旋锁: 一直在忙等, 死循环监测锁的标志位, 直到锁被打开
 互斥锁: 让CPU休眠等待
 */

/*
 优先级反转问题:
 
 简单从字面上来说, 就是低优先级的任务先于高优先级的任务执行了, 优先级搞反了。那在什么情况下会生这种情况呢？
 假设三个任务准备执行, A, B, C, 优先级依次是A>B>C；
 首先：C处于运行状态, 获得CPU正在执行, 同时占有了某种资源；
 其次：A进入就绪状态, 因为优先级比C高, 所以获得CPU, A转为运行状态；C进入就绪状态；
 第三：执行过程中需要使用资源, 而这个资源又被等待中的C占有的, 于是A进入阻塞状态, C回到运行状态；
 第四：此时B进入就绪状态, 因为优先级比C高, B获得CPU, 进入运行状态；C又回到就绪状态；
 第五：如果这时又出现B2, B3等任务, 他们的优先级比C高, 但比A低, 那么就会出现高优先级任务的A不能执行, 反而低优先级的B, B2, B3等任务可以执行的奇怪现象, 而这就是优先级反转。
 */
- (void)__drawMoney {
    // 加锁
    OSSpinLockLock(&_moneyLock);
    // OSSpinLock存在的优先级反转问题
    /*
     假设三条线程准备运行, A, B, C, 优先级依次是A>B>C
     如果C先加锁, A再进行加锁的时候就会阻塞, 此时B进入准备运行, 因为优先级比C高, B进入运行状态, C回到就绪状态; 又因为B优先级比A低, 所以就会出现高优先级的A不能执行, 反而低优先级的B可以执行的奇怪现象, 这就是优先级反转
     */

//    while (1) ;
    
    [super __drawMoney];
    
    // 解锁
    OSSpinLockUnlock(&_moneyLock);
}

- (void)__saveMoney {
    // 加锁
    OSSpinLockLock(&_moneyLock);
    
    [super __saveMoney];
    
    // 解锁
    OSSpinLockUnlock(&_moneyLock);
}

- (void)__saleTicket {
    // 加锁
    OSSpinLockLock(&_ticketLock);
    
    [super __saleTicket];
    
    // 解锁
    OSSpinLockUnlock(&_ticketLock);
}

@end
