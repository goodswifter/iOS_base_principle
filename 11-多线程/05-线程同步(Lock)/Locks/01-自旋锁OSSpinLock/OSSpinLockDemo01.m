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

- (void)__drawMoney {
    // 加锁
    OSSpinLockLock(&_moneyLock);
    // OSSpinLock存在的优先级反转问题
    // 假如优先级低的线程是t01, 优先级高的线程是t02
    // 如果t01先加锁, t02再进行加锁的时候就会忙等, 这时t02可能会消耗大量的CPU资源, 从而导致没有CPU资源去处理t01, 所以t01就不会解锁, 然后t02就一直在那忙等, 导致线程死锁
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
