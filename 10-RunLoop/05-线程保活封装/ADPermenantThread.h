//
//  ADPermenantThread.h
//  05-线程保活封装
//
//  Created by zhongaidong on 2020/10/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ADPermenantThreadTask)(void);

@interface ADPermenantThread : NSObject

/// 在子线程执行一个任务
/// @param task 要执行的任务
- (void)executeTask:(ADPermenantThreadTask)task;

/// 结束线程
- (void)stop;

@end

NS_ASSUME_NONNULL_END
