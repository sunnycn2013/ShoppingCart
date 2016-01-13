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
- (instancetype)init
{
    self = [super init];
    if (self) {
        _list = [NSMutableArray array];
    }
    return self;
}

#pragma mark - API Method

- (void)fetchProduct
{
    __weak typeof(self) weakself = self;
    _fetchCartApi = [[CartAPI alloc] initWithActionType:kCartActionTypeFetch CartID:0];
    [_fetchCartApi startWithCompletionBlockWithSuccess:^(NSDictionary *content){
        NSDictionary *dic = [weakself mockDataFromlocal];
        NSArray *array = JSON_PARSE(dic[@"content"], [NSArray class]);
        
        NSMutableArray *listArray = [NSMutableArray array];
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
    
}

- (NSDictionary *)mockDataFromlocal
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cart.geojson" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return dic;
}

@end
