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
#import "CartHeaderTableCell.h"

@implementation UITableView (tableViewCell)

- (NSDictionary *)identifierForTableViewCells
{
    return @{
             @"CartTableViewCell" : @"CartTableViewCell",
             };
}

- (NSDictionary *)identifierForHeaderCells
{
    return @{
             @"CartHeaderTableCell":@"CartHeaderTableCell"
             };
}

- (void)registTableViewCell
{
    for (NSString * identifier in [self identifierForTableViewCells]) {
        [self registerClass:NSClassFromString(identifier) forCellReuseIdentifier:identifier];
    }
    
    for (NSString * identifier in [self identifierForHeaderCells]) {
        [self registerClass:NSClassFromString(identifier) forHeaderFooterViewReuseIdentifier:identifier];
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
    id<CartRenderProtocol> renderModel = [model modelForRowAtIndexPath:indexPath];
    cell = [self dequeueReusableCellWithModel:renderModel];
    [(id<CartProbeProtocol>)cell transferData:renderModel indexPath:indexPath];
    [(id<CartProbeProtocol>)cell processData:renderModel];
    return cell;
}

- (UITableViewHeaderFooterView *)dequeueReusableHeaderProcessModel:(id<CartFloorProtocol>)model atIndex:(NSInteger)index
{
    UITableViewHeaderFooterView * headerView = nil;
    id<CartRenderProtocol> renderModel = [model modelForHeaderAtIndexPath:index];
    headerView = [self dequeueReusableHeaderFooterViewWithIdentifier:[renderModel headerIdentifier]];
    if (headerView == nil) {
        headerView = [[CartHeaderTableCell alloc] initWithReuseIdentifier:[renderModel headerIdentifier]];
    }
    [(id<CartProbeProtocol>)headerView transferData:renderModel indexPath:nil];
    [(id<CartProbeProtocol>)headerView processData:renderModel];
    return headerView;
}

@end
