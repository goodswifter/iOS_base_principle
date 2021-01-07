//
//  ViewController.m
//  05-线程同步(Lock)
//
//  Created by zhongaidong on 2021/1/7.
//

#import "ViewController.h"
#import "ADBaseDemo.h"
#import "OSSpinLockDemo02.h"
#import "OSUnfairLockDemo.h"
#import "MutexDemo.h"
#import "MutexDemo02.h"
#import "MutexDemo03.h"
#import "NSLockDemo.h"
#import "NSRecursiveLockDemo.h"
#import "NSConditionDemo.h"
#import "NSConditionLockDemo.h"
#import "GCDSerialQueueDemo.h"
#import "GCDSemaphoreDemo.h"
#import "SynchronizedDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ADBaseDemo *baseDemo = [[MutexDemo02 alloc] init];
    [baseDemo otherTest];
//    [baseDemo ticketTest];
//    [baseDemo moneyTest];
}

@end
