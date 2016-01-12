//
//  CartSkuModel.h
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/12.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CartSkuModel : NSObject

@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * description;
@property (nonatomic,strong) NSString * price;
@property (nonatomic,strong) NSNumber * number;
@property (nonatomic,strong) NSNumber * isPhoneSp; //手机专享
@property (nonatomic,strong) NSString * image;
@property (nonatomic,assign) BOOL isSelected;

@end