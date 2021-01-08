//
//  ViewController.m
//  07-读写安全(GCD-barrier)
//
//  Created by zhongaidong on 2021/1/8.
//

#import "ViewController.h"

@interface ViewController ()
/// 队列
@property (nonatomic, strong) dispatch_queue_t queue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // dispatch_barrier_async
    // 这个函数传入的队列必须是自己通过dispatch_queue_create创建的并发队列
    self.queue = dispatch_queue_create("concurrent", DISPATCH_QUEUE_CONCURRENT);
    
    // 如果传入的是一个串行或是一个全局的并发队列, 那dispatch_barrier_async函数便等同于dispatch_sync函数的效果
//    self.queue = dispatch_queue_create("serial", DISPATCH_QUEUE_SERIAL);
    
    // 如果传入的是一个全局的并发队列, 那dispatch_barrier_async函数便等同于dispatch_async函数的效果
//    self.queue = dispatch_get_global_queue(0, 0);
    
    for (int i = 0; i < 10; i++) {
        [self read];
        [self read];
        [self read];
        [self read];
        [self write];
        [self write];
        [self write];
        [self read];
        [self read];
        [self read];
    }
}

- (void)read {
    dispatch_async(self.queue, ^{
        sleep(1);
        NSLog(@"%s", __func__);
    });
}

- (void)write {
    dispatch_barrier_async(self.queue, ^{
        sleep(1);
        NSLog(@"%s", __func__);
    });
}

@end
