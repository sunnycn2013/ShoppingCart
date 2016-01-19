//
//  CartHeaderCell.h
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartProbeProtocol.h"

@class CartHeaderTableCell;
@protocol CartHeaderTableCellDelegate <NSObject>

- (void)cartHeader:(CartHeaderTableCell *)cartHeader didTagSelectedAtIndexPath:(NSIndexPath *)indexPath;

@end
@interface CartHeaderTableCell : UITableViewHeaderFooterView<CartProbeProtocol>

@property (nonatomic,weak) id<CartHeaderTableCellDelegate> delegate;

@end
