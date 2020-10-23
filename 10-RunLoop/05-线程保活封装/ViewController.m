//
//  ViewController.m
//  05-线程保活封装
//
//  Created by zhongaidong on 2020/10/22.
//

#import "ViewController.h"
#import "ADPermenantThread.h"

@interface ViewController ()
@property (strong, nonatomic) ADPermenantThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.thread = [[ADPermenantThread alloc] init];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.thread executeTask:^{
        NSLog(@"执行任务 - %@", [NSThread currentThread]);
    }];
}

- (IBAction)stop {
    [self.thread stop];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
