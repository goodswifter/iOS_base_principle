//
//  main.m
//  13-Runtime应用02-字典转模型
//
//  Created by zhongaidong on 2020/10/21.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJPerson.h"
#import "NSObject+Json.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // 字典转模型
        NSDictionary *json = @{
                               @"id" : @20,
                               @"age" : @20,
                               @"weight" : @60,
                               @"name" : @"Jack"
//                               @"no" : @30
                               };
        
        MJPerson *person = [MJPerson mj_objectWithJson:json];
        
        NSLog(@"Hello, World!");
    }
    return 0;
}
