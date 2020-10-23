//
//  ADPermenantThread.m
//  05-线程保活封装
//
//  Created by zhongaidong on 2020/10/22.
//

#import "ADPermenantThread.h"

/** MJThread **/
@interface MJThread : NSThread
@end
@implementation MJThread
- (void)dealloc {
    NSLog(@"%s", __func__);
}
@end

/** ADPermenantThread **/
@interface ADPermenantThread ()
@property (strong, nonatomic) MJThread *innerThread;
@property (assign, nonatomic, getter=isStopped) BOOL stopped;
@end

@implementation ADPermenantThread

#pragma mark - Life Cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        self.stopped = NO;
        
        __weak typeof(self) weakSelf = self;
        
        self.innerThread = [[MJThread alloc] initWithBlock:^{
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
            
            while (weakSelf && !weakSelf.isStopped) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
        }];
        
        [self.innerThread start];
    }
    return self;
}

- (void)dealloc {
    NSLog(@"%s", __func__);
    
    [self stop];
}

#pragma mark - public methods
/// 在子线程执行一个任务
/// @param task 要执行的任务
- (void)executeTask:(ADPermenantThreadTask)task {
    if (!self.innerThread || !task) return;
    
    [self performSelector:@selector(__executeTask:) onThread:self.innerThread withObject:task waitUntilDone:NO];
}

/// 结束线程
- (void)stop {
    if (!self.innerThread) return;
    
    [self performSelector:@selector(__stop) onThread:self.innerThread withObject:nil waitUntilDone:YES];
}

#pragma mark - private methods
- (void)__stop {
    self.stopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.innerThread = nil;
}

- (void)__executeTask:(ADPermenantThreadTask)task {
    task();
}

@end
