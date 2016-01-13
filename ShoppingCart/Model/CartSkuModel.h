//
//  CartSkuModel.h
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/12.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CartRenderProtocol.h"

@interface CartSkuModel : NSObject<CartRenderProtocol>

@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * descriptions;
@property (nonatomic,strong) NSString * price;
@property (nonatomic,strong) NSNumber * number;
@property (nonatomic,strong) NSNumber * isPhoneSp; //手机专享
@property (nonatomic,strong) NSString * image;
@property (nonatomic,assign) NSNumber *isSelected;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
