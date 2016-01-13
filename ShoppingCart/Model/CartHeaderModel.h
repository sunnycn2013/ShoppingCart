//
//  CartHeaderModel.h
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/12.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartRenderProtocol.h"

@interface CartHeaderModel : NSObject<CartRenderProtocol>

@property (nonatomic,strong) NSNumber *isSelected;
@property (nonatomic,strong) NSString *title;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
