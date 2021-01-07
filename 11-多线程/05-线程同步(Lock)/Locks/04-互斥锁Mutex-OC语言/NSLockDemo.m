//
//  NSLockDemo.m
//  线程同步
//
//  Created by zhongad on 2019/12/5.
//  Copyright © 2019 zhongad. All rights reserved.
//

#import "NSLockDemo.h"

@interface NSLockDemo ()
/// 票锁
@property (nonatomic, strong) NSLock *ticketLock;
/// 钱锁
@property (nonatomic, strong) NSLock *moneyLock;

@end

/// NSLock : 普通锁
@implementation NSLockDemo

#pragma mark - Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        self.ticketLock = [[NSLock alloc] init];
        self.moneyLock = [[NSLock alloc] init];
    }
    return self;
}

#pragma mark - Private Function
/// 死锁：永远拿不到锁
- (void)__saleTicket {
    [self.ticketLock lock];
    
    [super __saleTicket];
    
    [self.ticketLock unlock];
}

- (void)__saveMoney {
    [self.moneyLock lock];
    
    [super __saveMoney];
    
    [self.moneyLock unlock];
}

- (void)__drawMoney {
    [self.moneyLock lock];
    
    [super __drawMoney];
    
    [self.moneyLock unlock];
}
@end
