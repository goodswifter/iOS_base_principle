//
//  ViewController.m
//  01-GCD死锁
//
//  Created by zhongaidong on 2020/10/22.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 同步异步: 控制是否开启新线程
 并发串行: 决定了任务的执行方式
 */

// 使用sync函数往当前串行队列中添加任务，会卡住当前的串行队列（产生死锁）

// 问题：以下代码是在主线程执行的，会不会产生死锁?

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test03];
    NSLog(@"1");
    dispatch_queue_t queue = dispatch_queue_create("que", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        NSLog(@"2");
        NSLog(@"%@", [NSThread currentThread]);
        dispatch_sync(queue, ^{
            NSLog(@"4");
            NSLog(@"%@", [NSThread currentThread]);
        });
    });
    NSLog(@"3");
}

// 不会
- (void)test05 {
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");
        
        dispatch_sync(queue, ^{ // 1
            NSLog(@"执行任务3");
        });
        
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

// 不会
- (void)test04 {
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myqueu", DISPATCH_QUEUE_SERIAL);
//    dispatch_queue_t queue2 = dispatch_queue_create("myqueue2", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue2 = dispatch_queue_create("myqueu2", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");
        
        dispatch_sync(queue2, ^{ // 1
            NSLog(@"执行任务3");
        });
        
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

/// 会
- (void)test03 {
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_queue_create("myqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{ // 0
        NSLog(@"执行任务2");

        NSLog(@"%@", [NSThread currentThread]);
        dispatch_sync(queue, ^{ // 1
            NSLog(@"执行任务3");
        });
    
        NSLog(@"执行任务4");
    });
    
    NSLog(@"执行任务5");
}

/// 主队列 + 异步函数: 不会
- (void)test02 {
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        NSLog(@"执行任务2");
        NSLog(@"%@", [NSThread currentThread]);
    });
    
    NSLog(@"执行任务3");
}

/// 主队列 + 同步函数: 会
- (void)test01 {
    NSLog(@"执行任务1");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"执行任务2");
    });
    
    NSLog(@"执行任务3");
}

@end
