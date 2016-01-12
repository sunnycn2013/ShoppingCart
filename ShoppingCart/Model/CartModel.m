//
//  CartModel.m
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartModel.h"

@interface CartModel ()

@property (nonatomic,strong) NSMutableArray *list;

@end
@implementation CartModel

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setWithDic:dic];
    }
    return self;
}

- (void)setWithDic:(NSDictionary *)dic
{
    
}

#pragma mark - CartFloorProtocol
- (NSInteger)numberOfModelInFloor
{
    return 0;
}

- (id<CartRenderProtocol>)modelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - CartRenderProtocol
- (NSString *)cellIdentifier
{
    return @"";
}

#pragma mark - CartActionProtocol
- (id<CartActionProtocol>)actionForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}


@end
