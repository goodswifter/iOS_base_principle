//
//  MJPerson.m
//  Interview01-Runtime
//
//  Created by MJ Lee on 2018/5/17.
//  Copyright © 2018年 MJ Lee. All rights reserved.
//

#import "MJPerson.h"

//#define MJTallMask (1<<0)
//#define MJRichMask (1<<1)
//#define MJHandsomeMask (1<<2)

@interface MJPerson()
{
    // 位域
    struct {
        char tall : 1;
        char rich : 1;
        char handsome : 1;
    } _tallRichHandsome;
}
@end

@implementation MJPerson

- (void)setTall:(BOOL)tall
{
    _tallRichHandsome.tall = tall;
}

- (BOOL)isTall
{
    // 为什么取两次反?
    // 因为_tallRichHandsome.tall是一个字节, 传的值是1
    //   1个字节的1转换成8个字节的BOOL值, 就会变成0b1111 1111, 值为-1或255
    // 如果位域是1位, 0b1 -> 0b1111 1111
    // 如果位域是2位, 0b01 -> 0b0000 0001
    return !!_tallRichHandsome.tall;
}

- (void)setRich:(BOOL)rich
{
    _tallRichHandsome.rich = rich;
}

- (BOOL)isRich
{
    return !!_tallRichHandsome.rich;
}

- (void)setHandsome:(BOOL)handsome
{
    _tallRichHandsome.handsome = handsome;
}

- (BOOL)isHandsome
{
    return !!_tallRichHandsome.handsome;
}

@end
