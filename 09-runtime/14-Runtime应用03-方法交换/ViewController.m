//
//  ViewController.m
//  14-Runtime应用03-方法交换
//
//  Created by zhongaidong on 2020/10/21.
//  Copyright © 2020 jingshonline. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
//    NSMutableArray *arr = [NSMutableArray array];
//    [arr addObject:nil];
//    NSLog(@"%@", arr);
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@""] = @"哈哈";
    NSLog(@"%@", dict);
}

- (IBAction)click1:(id)sender {
}

- (IBAction)click2:(id)sender {
}

- (IBAction)click3:(id)sender {
}

@end
