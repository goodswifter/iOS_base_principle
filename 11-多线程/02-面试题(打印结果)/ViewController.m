//
//  ViewController.m
//  02-面试题(打印结果)
//
//  Created by zhongaidong on 2020/11/5.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test2];
}

- (void)test2 {
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        NSLog(@"1");
        // 这句代码的本质是往Runloop中添加定时器
        // 子线程默认没有启动Runloop
        [self performSelector:@selector(test) withObject:nil afterDelay:1];
        
        // 子线程需要主动开启RunLoop, 才能运行
        // 同一条线程内, 顺序执行任务, 所以答案是1, 2, 3, 2
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        
        NSLog(@"3, %@", [NSThread currentThread]);
        
        [self performSelector:@selector(test) withObject:nil afterDelay:1];
        
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSThread *thread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"1, %@", [NSThread currentThread]);
        
        // 让线程保活
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }];
    [thread start];
    
    // 一运行完成Block, 线程就死掉了
    // target thread exited while waiting for the perform
    // waitUntilDone: 是否阻塞当前线程
    [self performSelector:@selector(test) onThread:thread withObject:nil waitUntilDone:YES];
    
    NSLog(@"3");
}

- (void)test {
    NSLog(@"2, %@", [NSThread currentThread]);
}

@end
