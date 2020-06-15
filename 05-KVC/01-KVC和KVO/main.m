//
//  main.m
//  01-KVC和KVO
//
//  Created by zhongaidong on 2020/6/15.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import "MJObserver.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MJObserver *ob = [[MJObserver alloc] init];
        MJPerson *p = [[MJPerson alloc] init];
        p.cat = [[MJCat alloc] init];
        p.cat.weight = 1;
        
        // 添加监听
        [p addObserver:ob forKeyPath:@"cat.weight" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        
        [p setValue:@10 forKeyPath:@"cat.weight"];
        
        // 移除监听
        [p removeObserver:ob forKeyPath:@"cat.weight"];
    }
    return 0;
}
