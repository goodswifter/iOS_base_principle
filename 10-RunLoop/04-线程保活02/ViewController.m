//
//  ViewController.m
//  03-线程保活01
//
//  Created by zhongaidong on 2020/10/22.
//

#import "ViewController.h"
#import "MJThread.h"

@interface ViewController ()
/// 指定子线程
@property (nonatomic, strong) MJThread *thread;
@property (assign, nonatomic, getter=isStopped) BOOL stopped;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.stopped = NO;
    
    // NSRunLoop的run方法是无法停止的，它专门用于开启一个永不销毁的线程（NSRunLoop）
    //        [[NSRunLoop currentRunLoop] run];
    /*
     it runs the receiver in the NSDefaultRunLoopMode by repeatedly invoking runMode:beforeDate:.
     In other words, this method effectively begins an infinite loop that processes data from the run loop’s input sources and timers
     */
    __weak typeof(self) weakSelf = self;
    self.thread = [[MJThread alloc] initWithBlock:^{
        NSLog(@"%@----begin----", [NSThread currentThread]);
        
        // 往RunLoop里面添加Source\Timer\Observer
        [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
        while (weakSelf && !weakSelf.isStopped) {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        }
        
        NSLog(@"%@----end----", [NSThread currentThread]);
    }];
    [self.thread start];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    
    [self stop];
}

- (IBAction)stop {
    if (!self.thread) return;
    
    // 在子线程中停止RunLoop
    [self performSelector:@selector(stopThread) onThread:self.thread withObject:nil waitUntilDone:YES];
}

/// 用于停止子线程的RunLoop
- (void)stopThread {
    // 设置标记为YES
    self.stopped = YES;
    
    // 停止RunLoop
    CFRunLoopStop(CFRunLoopGetCurrent());
    
    // 清空线程
    self.thread = nil;
    
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // waitUntilDone:
    // YES: 等当前子线程的任务完成之后再回到主线程执行任务, 串行执行
    // NO: 子线程和主线程的任务并发执行
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:YES];
    
    NSLog(@"123");
}

// 子线程需要执行的任务
- (void)test {
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
}

@end
