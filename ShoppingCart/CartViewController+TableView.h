//
//  CartViewController+TableView.h
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/13.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CartFloorProtocol;
@protocol CartRenderProtocol;
@interface UITableView (tableViewCell)

- (void)registTableViewCell;

- (UITableViewCell *)dequeueReusableCellWithModel:(id<CartRenderProtocol>)model;
- (UITableViewCell *)dequeueReusableCellWithModel:(id<CartFloorProtocol>)model indexPath:(NSIndexPath *)indexPath;

@end
