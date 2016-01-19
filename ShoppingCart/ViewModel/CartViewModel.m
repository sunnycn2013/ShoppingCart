//
//  CartViewModel.m
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartViewModel.h"
#import "CartFloorModel.h"
#import "CartAPI.h"

@interface CartViewModel ()

@property (nonatomic,strong) CartAPI * fetchCartApi;
@property (nonatomic,strong) CartAPI * deleteCartApi;
@property (nonatomic,strong) CartAPI * updateCartApi;
@property (nonatomic,strong) CartAPI * adddCartApi;

@end

@implementation CartViewModel

#pragma mark - Private Method

#pragma mark - API Method

- (NSDictionary *)mockDataFromlocal
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cart.geojson" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return dic;
}

- (void)fetchProduct
{
    __weak typeof(self) weakself = self;
    _fetchCartApi = [[CartAPI alloc] initWithActionType:kCartActionTypeFetch CartID:0];
    [_fetchCartApi startWithCompletionBlockWithSuccess:^(NSDictionary *content){
        NSDictionary *dic = [weakself mockDataFromlocal];
        NSArray *array = JSON_PARSE(dic[@"content"], [NSArray class]);
        
        NSMutableArray<CartFloorProtocol> *listArray = [NSMutableArray<CartFloorProtocol> array];
        for (NSDictionary *dic in array) {
            @autoreleasepool {
                CartFloorModel *floor = [[CartFloorModel alloc] initWithDic:dic];
                [listArray addObject:floor];
            }
        }
        weakself.list = listArray;
     }
     failure:^(NSError *error){
         NSLog(@"failure");
    }];
}

- (void)deleteProductWithSku:(NSString *)skuNum
{
    //通过sku删除server端数据
}

- (void)updateProductWithSku:(NSString *)skuNum
{
    //通过sku更新server端数据
}

- (BOOL)removeObjectAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL result = NO;
    NSInteger section = indexPath.section;
    NSInteger index = indexPath.row;
    
    NSLog(@"section : %ld, index : %ld",section,index);
    
    [(CartFloorModel *)self.list[section] removeObjectAtIndexPath:index];
    
    for (NSInteger i = 0; i < self.list.count; i++) {
        CartFloorModel *floor = self.list[i];
        if (!([floor count] > 0)) {
            [self.list removeObjectAtIndex:i];
        }
    }
    return result;
}

- (BOOL)removeObjectAtIndexPath:(NSIndexPath *)indexPath completionBlock:(void (^)(BOOL deleteSection))completion
{
    NSInteger section = indexPath.section;
    NSInteger index = indexPath.row;
    [(CartFloorModel *)self.list[section] removeObjectAtIndexPath:index];
    
    for (NSInteger i = 0; i < self.list.count; i++) {
        CartFloorModel *floor = self.list[i];
        if (![floor count]) {
            [self.list removeObjectAtIndex:i];
            completion(YES);
        }
    }
    return YES;
}

#pragma mark - set get Method
- (NSInteger)productCount
{
    return self.list.count;
}



@end
