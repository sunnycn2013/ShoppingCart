//
//  ViewController.m
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong,nullable) UITableView *tablView;

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = [self cartTitle];
    [self initUI];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGFLOAT_MIN)];
    view.backgroundColor = [UIColor whiteColor];
    [self.tablView setTableHeaderView:view];
}

- (void)initUI
{
    [self.view addSubview:self.tablView];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = @"cell";
    return cell;
}

#pragma mark - set get method

- (UITableView *)tablView
{
    if (!_tablView) {
        _tablView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tablView.delegate = self;
        _tablView.dataSource = self;
    }
    return _tablView;
}

- (NSString *)cartTitle
{
    return @"购物车";
}

@end
