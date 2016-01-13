//
//  CartViewController+TableView.m
//  ShoppingCart
//
//  Created by guochaoyang on 16/1/13.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartViewController+TableView.h"
#import "CartRenderProtocol.h"

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

- (nullable __kindof UITableViewCell *)dequeueReusableCellWithModel:(id<CartRenderProtocol>)model
{
    UITableViewCell *cell  = nil;
    NSString *cellIdentifier = [model cellIdentifier];
    cell = [self dequeueReusableCellWithIdentifier:cellIdentifier];
    return cell;
}

@end
