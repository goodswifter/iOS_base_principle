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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.thread = [[MJThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [self.thread start];
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

/// 这个方法的目的: 线程保活
- (void)run {
    NSLog(@"%s %@", __func__, [NSThread currentThread]);
    
    // 往RunLoop中添加Source\Timer\Observer
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
    // 让当前子线程不断地运行
    [[NSRunLoop currentRunLoop] run];
    
    NSLog(@"%s ----end----", __func__);
}

@end
