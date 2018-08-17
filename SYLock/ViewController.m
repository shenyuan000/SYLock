//
//  ViewController.m
//  SYLock
//
//  Created by YIXUN on 2018/8/17.
//  Copyright © 2018年 YXCUSTOM. All rights reserved.
//

#import "ViewController.h"
#import "Lock.h"

@interface ViewController ()

@property (nonatomic, assign) int ticketCount;
@property(nonatomic, strong) Lock *mLock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mLock = [[Lock alloc] init];
    [self testTicket];
}

/** 卖票 */

- (void)saleTicket
{
    [self.mLock lock];
    int oldTicketsCount = self.ticketCount;
    sleep(0.2);
    oldTicketsCount--;
    self.ticketCount = oldTicketsCount;
    NSLog(@"还剩%d张票 - %@",oldTicketsCount,[NSThread currentThread]);
    [self.mLock unLock];
}

/** 卖票演示 */

- (void)testTicket {
    self.ticketCount = 15;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 5; i++) {
            [self saleTicket];
        }
    });
    
}


@end
