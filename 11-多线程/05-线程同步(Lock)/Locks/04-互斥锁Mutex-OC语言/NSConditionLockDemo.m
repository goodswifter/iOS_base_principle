//
//  NSConditionLockDemo.m
//  线程同步
//
//  Created by zhongad on 2019/12/5.
//  Copyright © 2019 zhongad. All rights reserved.
//

#import "NSConditionLockDemo.h"

@interface NSConditionLockDemo ()
@property (strong, nonatomic) NSConditionLock *conditionLock;
@end

/// NSConditionLock : 高级条件锁
/// 也可以叫做依赖锁
@implementation NSConditionLockDemo

#pragma mark - Life Cycle
- (instancetype)init {
    if (self = [super init]) {
        // 不设置条件, 默认条件是0
        self.conditionLock = [[NSConditionLock alloc] initWithCondition:6];
    }
    return self;
}

#pragma mark - Public Function
- (void)otherTest {
    [[[NSThread alloc] initWithTarget:self selector:@selector(__one) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__two) object:nil] start];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__three) object:nil] start];
}

#pragma mark - Private Function
- (void)__one {
    // 使用lock, 不管条件是多少, 都可以直接解锁
    [self.conditionLock lock];
    
    NSLog(@"__one");
    sleep(1);
    
    [self.conditionLock unlockWithCondition:2];
}

- (void)__two {
    [self.conditionLock lockWhenCondition:2];
    
    NSLog(@"__two");
    sleep(1);
    
    [self.conditionLock unlockWithCondition:3];
}

- (void)__three {
    [self.conditionLock lockWhenCondition:3];
    
    NSLog(@"__three");
    
    [self.conditionLock unlock];
}

@end
