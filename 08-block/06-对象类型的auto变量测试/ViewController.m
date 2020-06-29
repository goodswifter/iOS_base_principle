//
//  ViewController.m
//  06-对象类型的auto变量测试
//
//  Created by zhongaidong on 2020/6/25.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ViewController.h"
#import "MJPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self test1];
    NSLog(@"touchesBegan:withEvent:");
}

- (void)test2 {
    MJPerson *p = [[MJPerson alloc] init];
    __weak MJPerson *weakP = p;
    // 注意: 如何判断是否需要释放对象
    // block内部是否对对象有强引用, 没有就释放, 有就继续持有
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"1-------%@", weakP);
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"2-------%@", p);
        });
    });
}

- (void)test1 {
    MJPerson *p = [[MJPerson alloc] init];
    __weak MJPerson *weakP = p;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"1-------%@", p);
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"2-------%@", weakP);
        });
    });
}

@end
