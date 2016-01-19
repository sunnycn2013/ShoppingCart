//
//  CartFloorModel.m
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/12.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartFloorModel.h"

@implementation CartFloorModel

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setWithDic:dic];
        [self setObserve];
    }
    return self;
}

- (void)setWithDic:(NSDictionary *)dic
{
    NSDictionary *headerDic = JSON_PARSE(dic[@"head"], [NSDictionary class]);
    NSArray *skuList = JSON_PARSE(dic[@"skuList"], [NSArray class]);
    _headerModel = [[CartHeaderModel alloc] initWithDic:headerDic];
    _list = [NSMutableArray array];
    for (NSDictionary *dic in skuList) {
        @autoreleasepool
        {
            CartSkuModel * model = [[CartSkuModel alloc] initWithDic:dic];
            [_list addObject:model];
        }
    }
}

- (void)setObserve
{
    [self.headerModel addObserver:self forKeyPath:@"isSelected" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSNumber * oldValue = change[@"old"];
    NSNumber * newValue = change[@"new"];
    if ([oldValue boolValue] != [newValue boolValue]) {
        for (int i = 0 ; i < self.list.count; i++) {
            self.list[i].isSelected = newValue;
        }
    }
}

#pragma mark - CartFloorProtocol
- (NSInteger)numberOfModelInFloor
{
    NSInteger row = 0;
    if(self.headerModel) row ++;
    if (self.list.count) row += self.list.count;
    
    return row;
}

- (id<CartRenderProtocol>)cartModelForRowIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    
    if (self.headerModel && index == 0) {
        return self.headerModel;
    }
    if (self.headerModel && index < [self numberOfModelInFloor]) {
        return self.list[index - 1];
    }
    return nil;
}

- (id<CartRenderProtocol>)modelForRowAtIndexPath:(NSInteger)index
{
    if (self.headerModel && index == 0) {
        return self.headerModel;
    }
    if (self.headerModel && index < [self numberOfModelInFloor]) {
        return self.list[index - 1];
    }
    return nil;
}

#pragma mark - API

- (NSInteger)count
{
    return self.list.count;
}

- (void)removeObjectAtIndexPath:(NSInteger)index
{
    if (index > 0 && index < self.list.count) {
        [self.list removeObjectAtIndex:index];
    }
}
@end
