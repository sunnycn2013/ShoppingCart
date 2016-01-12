//
//  CartFloorModel.m
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/12.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartFloorModel.h"

@implementation CartFloorModel
- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setWithDic:dic];
    }
    return self;
}

- (void)setWithDic:(NSDictionary *)dic
{
    NSDictionary *headerDic = JSON_PARSE(dic[@"header"], [NSDictionary class]);
    NSArray *skuList = JSON_PARSE(dic[@"skuList"], [NSArray class]);
    _headerModel = [[CartHeaderModel alloc] initWithDic:headerDic];
    _list = [NSMutableArray array];
    for (NSDictionary *dic in skuList) {
        @autoreleasepool {
            CartSkuModel * model = [[CartSkuModel alloc] initWithDic:dic];
            [_list addObject:model];
        }
    }
}

#pragma mark - CartFloorProtocol
- (NSInteger)numberOfModelInFloor
{
    return self.list.count;
}

- (id<CartRenderProtocol>)modelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
