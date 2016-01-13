//
//  CartViewController+TableView.h
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/13.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CartRenderProtocol;

@interface UITableView (tableViewCell)

- (void)registTableViewCell;

- (nullable __kindof UITableViewCell *)dequeueReusableCellWithModel:(id<CartRenderProtocol>)model;

@end
