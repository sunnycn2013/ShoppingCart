//
//  CartViewModel.m
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartViewModel.h"
#import "CartAPI.h"

@interface CartViewModel ()

@property (nonatomic,strong) CartAPI * fetchCartApi;
@property (nonatomic,strong) CartAPI * deleteCartApi;
@property (nonatomic,strong) CartAPI * updateCartApi;
@property (nonatomic,strong) CartAPI * adddCartApi;

@end

@implementation CartViewModel
- (void)fetchProduct
{
    _fetchCartApi = [[CartAPI alloc] initWithActionType:kCartActionTypeFetch CartID:0];
    [_fetchCartApi startWithCompletionBlockWithSuccess:^(NSDictionary *content){
    
     }
     failure:^(NSError *error){
                                               
    }];
}

- (void)deleteProductWithSku:(NSString *)skuNum
{
    
}

@end
