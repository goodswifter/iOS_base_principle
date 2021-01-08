//
//  ViewController.m
//  06-读写安全(rwlock)
//
//  Created by zhongaidong on 2021/1/8.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()
/// 读写锁
@property (nonatomic, assign) pthread_rwlock_t rwlock;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化读写锁 : 多读单写
    pthread_rwlock_init(&_rwlock, NULL);
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    for (int i = 0; i < 10; i++) {
        dispatch_async(queue, ^{
            [self read];
        });
        dispatch_async(queue, ^{
            [self read];
        });
        dispatch_async(queue, ^{
            [self read];
        });
        dispatch_async(queue, ^{
            [self read];
        });
        dispatch_async(queue, ^{
            [self write];
        });
        dispatch_async(queue, ^{
            [self write];
        });
        dispatch_async(queue, ^{
            [self write];
        });
        dispatch_async(queue, ^{
            [self write];
        });
    }
}

- (void)dealloc {
    // 销毁读写锁
    pthread_rwlock_destroy(&_rwlock);
}

#pragma mark - Private Function
- (void)read {
    pthread_rwlock_rdlock(&_rwlock);
    
    NSLog(@"%s", __func__);
    sleep(1);
    
    pthread_rwlock_unlock(&_rwlock);
}

- (void)write {
    pthread_rwlock_wrlock(&_rwlock);
    
    NSLog(@"%s", __func__);
    sleep(1);
    
    pthread_rwlock_unlock(&_rwlock);
}

@end
