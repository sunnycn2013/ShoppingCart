//
//  CartViewController+TableView.m
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/13.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartViewController+TableView.h"
#import "CartRenderProtocol.h"
#import "CartFloorProtocol.h"
#import "CartProbeProtocol.h"

@implementation UITableView (tableViewCell)

- (NSDictionary *)identifierForTableViewCells
{
    return @{
             @"CartTableViewCell" : @"CartTableViewCell",
             @"CartHeaderTableCell":@"CartHeaderTableCell"
             };
}

- (void)registTableViewCell
{
    for (NSString * identifier in [self identifierForTableViewCells]) {
        [self registerClass:NSClassFromString(identifier) forCellReuseIdentifier:identifier];
    }
}

- (UITableViewCell *)dequeueReusableCellWithModel:(id<CartRenderProtocol>)model
{
    UITableViewCell *cell  = nil;
    NSString *cellIdentifier = [model cellIdentifier];
    cell = [self dequeueReusableCellWithIdentifier:cellIdentifier];
    return cell;
}

- (UITableViewCell *)dequeueReusableCellProcessModel:(id<CartFloorProtocol>)model indexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    id<CartRenderProtocol> renderModel = [model cartModelForRowIndexPath:indexPath];
    cell = [self dequeueReusableCellWithModel:renderModel];
    [(id<CartProbeProtocol>)cell transferData:renderModel indexPath:indexPath];
    [(id<CartProbeProtocol>)cell processData:renderModel];
    return cell;
}

- (UITableViewCell *)dequeueReusableCellTransferModel:(id<CartFloorProtocol>)model indexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    id<CartRenderProtocol> renderModel = [model cartModelForRowIndexPath:indexPath];
    cell = [self dequeueReusableCellWithModel:renderModel];
    return cell;
}

@end
