//
//  Lock.m
//  SYLock
//
//  Created by YIXUN on 2018/8/17.
//  Copyright © 2018年 YXCUSTOM. All rights reserved.
//

#import "Lock.h"

@implementation Lock{
    dispatch_semaphore_t _semaphore;
}

- (instancetype)init {
    if (self = [super init]) {
        _semaphore = dispatch_semaphore_create(1);
    }
    return self;
}

- (void)lock {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
}

- (void)unLock {
    dispatch_semaphore_signal(_semaphore);
}

@end
