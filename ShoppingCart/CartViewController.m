//
//  ViewController.m
//  ShoppingCart
//
//  Created by ccguo on 16/1/11.
//  Copyright © 2016年 ccguo. All rights reserved.
//

#import "CartViewController.h"
#import "CartViewModel.h"
#import "CartViewController+TableView.h"
#import "CartProbeProtocol.h"

@interface CartViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong,nullable) UITableView   *tablView;
@property (nonatomic,strong,nullable) CartViewModel *cartViewModel;

@end

@implementation CartViewController

- (void)dealloc{
    [self removeObsever];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"购物车";//[self cartTitle];
    
    [self initUI];
}

- (void)initUI
{
    [self.view addSubview:self.tablView];
//    [self setHeader];
    [self setObserver];
    [self.tablView registTableViewCell];

    [self fetchData];
}

- (void)setHeader
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CGFLOAT_MIN)];
    view.backgroundColor = [UIColor whiteColor];
    [self.tablView setTableHeaderView:view];
}

- (void)setObserver
{
    [self.cartViewModel addObserver:self forKeyPath:@"list" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)removeObsever
{
    [self.cartViewModel removeObserver:self.cartViewModel.list forKeyPath:@"list" context:nil];
}

#pragma mark - Data

- (void)fetchData
{
    [self.cartViewModel fetchProduct];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [self.tablView reloadData];
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return [self.cartViewModel.list count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id<CartFloorProtocol> floor = self.cartViewModel.list[section];
    return [floor numberOfModelInFloor];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    id<CartFloorProtocol> floor = self.cartViewModel.list[indexPath.section];
    cell = [tableView dequeueReusableCellWithModel:floor indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"willDisplayCell");
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 25)];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id<CartFloorProtocol> floor = self.cartViewModel.list[indexPath.section];
    id<CartRenderProtocol> renderModel = [floor cartModelForRowIndexPath:indexPath];
    Class<CartProbeProtocol> cellClass = NSClassFromString([renderModel cellIdentifier]);
    return [cellClass calculateSizeWithData:renderModel];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TRUE;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:indexPath.section];
        [self.cartViewModel removeObjectAtIndexPath:indexPath completionBlock:^(BOOL deleteSection){
            if (deleteSection) {
                [_tablView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
            }else{
                [_tablView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            }
        }];
        // Delete the row from the data source.
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 15.0;
}

#pragma mark - set get method

- (UITableView *)tablView
{
    if (!_tablView) {
        _tablView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tablView.delegate = self;
        _tablView.dataSource = self;
        _tablView.sectionFooterHeight = 0.0;
        _tablView.sectionHeaderHeight = 0;
    }
    return _tablView;
}

- (CartViewModel *)cartViewModel
{
    if (!_cartViewModel) {
        _cartViewModel = [[CartViewModel alloc] init];
    }
    return _cartViewModel;
}

- (NSString *)cartTitle
{
    return @"购物车";
}

@end
