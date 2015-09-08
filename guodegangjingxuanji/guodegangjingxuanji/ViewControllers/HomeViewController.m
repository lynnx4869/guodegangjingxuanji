//
//  HomeViewController.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/2.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "HomeViewController.h"
#import "CategoryViewController.h"
#import "Const.h"
#import "MJRefresh.h"
#import "HttpManager.h"
#import "HomeModel.h"
#import "HomeCell.h"
#import "AlbumViewController.h"

@interface HomeViewController () <UITableViewDelegate, UITableViewDataSource, HttpManagerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, assign) BOOL isLoading;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    TabBarButtomView *btn = self.tabbarBgImageView.btnsArray[0];
    btn.isSelected = YES;
    
    _dataArray = [NSMutableArray array];
    _isLoading = NO;
    
    [self createNav];
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNav{
    self.navigationItem.title = @"郭德纲精选集";
}

- (void)createTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-113) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    [_tableView registerClass:[HomeCell class] forCellReuseIdentifier:@"HomeCellId"];
    [self.view addSubview:_tableView];
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"下拉可以刷新..." forState:MJRefreshStateIdle];
    [header setTitle:@"松开即可刷新..." forState:MJRefreshStatePulling];
    [header setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    header.backgroundColor = [UIColor clearColor];
    _tableView.header = header;
    
    [_tableView.header beginRefreshing];
}

#pragma mark - NetWork
- (void)loadNewData{
    if(_isLoading){
        return ;
    }
    
    _isLoading = YES;
    
    HttpManager *manager = [[HttpManager alloc] init];
    manager.delegate = self;
    [manager requestGet:lHomeUrl];
}

- (void)failure:(AFHTTPRequestOperation *)operation response:(NSError *)error{
    NSLog(@"Home:%@", error);
    _isLoading = NO;
    [_tableView.header endRefreshing];
}

- (void)success:(AFHTTPRequestOperation *)operation response:(id)responseObject{
    [_dataArray removeAllObjects];
    
    NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    for(NSDictionary *dic in rootDic[@"list"]){
        HomeModel *model = [[HomeModel alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [_dataArray addObject:model];
    }
    [_tableView reloadData];
    
    _isLoading = NO;
    [_tableView.header endRefreshing];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCellId" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AlbumViewController *avc = [[AlbumViewController alloc] init];
    avc.uid = ((HomeModel *)_dataArray[indexPath.row]).uid;
    [self.navigationController pushViewController:avc animated:YES];
}

@end
