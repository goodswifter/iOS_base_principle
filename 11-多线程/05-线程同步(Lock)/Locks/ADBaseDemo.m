//
//  ADBaseDemo.m
//  线程同步
//
//  Created by zhongad on 2019/12/3.
//  Copyright © 2019 zhongad. All rights reserved.
//

#import "ADBaseDemo.h"

@interface ADBaseDemo ()
/// money
@property (nonatomic, assign) NSInteger money;
/// ticket
@property (nonatomic, assign) NSInteger ticket;
@end

@implementation ADBaseDemo

#pragma mark - 卖票
- (void)ticketTest {
    self.ticket = 30;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __saleTicket];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __saleTicket];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __saleTicket];
        }
    });
}

- (void)__saleTicket {
    NSInteger oldTicket = self.ticket;
    sleep(0.1);
    self.ticket = oldTicket -= 1;
    
    NSLog(@"卖一张票，还剩%zd张票 - %@", oldTicket, [NSThread currentThread]);
}

#pragma mark - 存取钱
/// 计算的正确结果应该是400
- (void)moneyTest {
    self.money = 100;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __saveMoney];
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 10; i++) {
            [self __drawMoney];
        }
    });
}

- (void)__saveMoney {
    NSInteger oldMoney = self.money;
    sleep(.2);
    self.money = oldMoney += 50;
    
    NSLog(@"存50，还剩%zd元 - %@", self.money, [NSThread currentThread]);
}

- (void)__drawMoney {
    NSInteger oldMoney = self.money;
    sleep(.2);
    self.money = oldMoney -= 20;
    
    NSLog(@"取20，还剩%zd元 - %@", self.money, [NSThread currentThread]);
}

- (void)otherTest {}

@end
