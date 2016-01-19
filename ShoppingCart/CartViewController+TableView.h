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

- (UITableViewCell *)dequeueReusableCellProcessModel:(id<CartFloorProtocol>)model indexPath:(NSIndexPath *)indexPath;
- (UITableViewHeaderFooterView *)dequeueReusableHeaderProcessModel:(id<CartFloorProtocol>)model atIndex:(NSInteger)index;

@end
