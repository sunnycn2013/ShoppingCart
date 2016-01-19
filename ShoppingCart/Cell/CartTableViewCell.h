//
//  CartTableViewCell.h
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CartProbeProtocol.h"

@class CartTableViewCell;
@protocol CartTableViewCellDelegate <NSObject>

- (void)cartView:(CartTableViewCell *)cartView didTagSelectedAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface CartTableViewCell : UITableViewCell<CartProbeProtocol>

@property (nonatomic,weak) id<CartTableViewCellDelegate> delegate;

@end
