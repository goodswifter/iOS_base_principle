//
//  OSUnfairLockDemo.m
//  线程同步
//
//  Created by zhongad on 2019/12/3.
//  Copyright © 2019 zhongad. All rights reserved.
//

#import "OSUnfairLockDemo.h"
#import <os/lock.h>

API_AVAILABLE(ios(10.0))
@interface OSUnfairLockDemo ()
/// money锁
@property (nonatomic, assign) os_unfair_lock moneyLock;
/// ticket锁
@property (nonatomic, assign) os_unfair_lock ticketLock;
@end

/// os_unfair_lock
@implementation OSUnfairLockDemo

- (instancetype)init {
    self = [super init];
    if (self) {
        // 1. 初始化锁
        self.moneyLock = OS_UNFAIR_LOCK_INIT;
        self.ticketLock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)__drawMoney {
    // 加锁
    os_unfair_lock_lock(&_moneyLock);
    
    [super __drawMoney];
    
    // 解锁
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)__saveMoney {
    // 加锁
    os_unfair_lock_lock(&_moneyLock);
    
    [super __saveMoney];
    
    // 解锁
    os_unfair_lock_unlock(&_moneyLock);
}

- (void)__saleTicket {
    // 加锁
    os_unfair_lock_lock(&_ticketLock);
    
    [super __saleTicket];
    
    // 解锁
    os_unfair_lock_unlock(&_ticketLock);
}

@end
