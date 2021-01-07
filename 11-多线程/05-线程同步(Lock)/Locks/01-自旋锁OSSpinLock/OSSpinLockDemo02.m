//
//  OSSpinLockDemo02.m
//  线程同步
//
//  Created by zhongad on 2019/12/3.
//  Copyright © 2019 zhongad. All rights reserved.
//

#import "OSSpinLockDemo02.h"
#import <libkern/OSAtomic.h>

@interface OSSpinLockDemo02 ()

@end

/// OSSpinLock
@implementation OSSpinLockDemo02

// 1. 初始化锁
static int moneyLock_ = 0;
- (void)__drawMoney {
    // 加锁
    OSSpinLockLock(&moneyLock_);
    
    [super __drawMoney];
    
    // 解锁
    OSSpinLockUnlock(&moneyLock_);
}

- (void)__saveMoney {
    // 加锁
    OSSpinLockLock(&moneyLock_);
    
    [super __saveMoney];
    
    // 解锁
    OSSpinLockUnlock(&moneyLock_);
}

- (void)__saleTicket {
    static int ticketLock_ = OS_SPINLOCK_INIT;
    // 加锁
    OSSpinLockLock(&ticketLock_);
    
    [super __saleTicket];
    
    // 解锁
    OSSpinLockUnlock(&ticketLock_);
}
@end
