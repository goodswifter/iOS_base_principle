//
//  GCDSerialQueueDemo.m
//  线程同步
//
//  Created by zhongad on 2019/12/5.
//  Copyright © 2019 zhongad. All rights reserved.
//

#import "GCDSerialQueueDemo.h"

@interface GCDSerialQueueDemo ()
@property (strong, nonatomic) dispatch_queue_t ticketQueue;
@property (strong, nonatomic) dispatch_queue_t moneyQueue;
@end

@implementation GCDSerialQueueDemo

- (instancetype)init {
    if (self = [super init]) {
        self.ticketQueue = dispatch_queue_create("ticketQueue", DISPATCH_QUEUE_SERIAL);
        self.moneyQueue = dispatch_queue_create("moneyQueue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)__drawMoney {
    dispatch_sync(self.moneyQueue, ^{
        [super __drawMoney];
    });
}

- (void)__saveMoney {
    dispatch_sync(self.moneyQueue, ^{
        [super __saveMoney];
    });
}

- (void)__saleTicket {
    dispatch_sync(self.ticketQueue, ^{
        [super __saleTicket];
    });
}
@end
