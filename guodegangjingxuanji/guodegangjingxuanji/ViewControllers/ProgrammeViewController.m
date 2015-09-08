//
//  ProgrammeViewController.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "ProgrammeViewController.h"
#import "Const.h"
#import "HttpManager.h"
#import "MJRefresh.h"
#import "ProgrammeModel.h"
#import "ProgrammeHeadView.h"
#import "ProgrammeSectionView.h"
#import "ProgrammeCell.h"

@interface ProgrammeViewController ()
    <HttpManagerDelegate, UITableViewDelegate, UITableViewDataSource, SelectTabDelegate>

@property (nonatomic, strong) ProgrammeModel *programmeModel;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ProgrammeHeadView *headView;
@property (nonatomic, strong) ProgrammeSectionView *sectionView;

@property (nonatomic, assign) NSInteger curPage;
@property (nonatomic, assign) BOOL isLoading;
@property (nonatomic, assign) BOOL isList;
@property (nonatomic, assign) BOOL isAsc;

@end

@implementation ProgrammeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataArray = [NSMutableArray array];
    _sectionView = [[ProgrammeSectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 40)];
    _sectionView.delegate = self;
    _curPage = 1;
    _isLoading = NO;
    _isList = YES;
    _isAsc = YES;
    
    [self createTools];
    [self createTableView];
    [self downloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createTools{
    UIButton *backBtn = self.toolsImageView.btnsArray[0];
    [backBtn setImage:[UIImage imageNamed:@"tab_back_n"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:@"tab_back_h"] forState:UIControlStateHighlighted];
    backBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 5, -5);
    
    NSArray *images = @[@"tab_share_n", @"tab_download_n", @"tab_home_n"];
    NSArray *selects = @[@"tab_share_h", @"tab_download_h", @"tab_home_h"];
    
    for(NSInteger i = 0; i < 3; i++){
        UIButton *btn = self.toolsImageView.btnsArray[i+1];
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selects[i]] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(tabbarClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 5, -5);
        btn.tag = 300 + i;
    }
}

- (void)createTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    _headView = [[ProgrammeHeadView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 160)];
    _tableView.tableHeaderView = _headView;
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    [footer setTitle:@"上拉可以加载..." forState:MJRefreshStateIdle];
    [footer setTitle:@"松开即可加载..." forState:MJRefreshStatePulling];
    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    footer.backgroundColor = [UIColor clearColor];
    _tableView.footer = footer;
}

#pragma mark - ClickAction
- (void)tabbarClick:(UIButton *)btn{
    switch (btn.tag-300) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            [self.navigationController popToRootViewControllerAnimated:YES];
            break;
        default:
            break;
    }
}

#pragma mark - HttpManagerDelegate
- (void)loadMoreData{
    if(_isLoading){
        return ;
    }
    _curPage++;
    [self downloadData];
}

- (void)downloadData{
    _isLoading = YES;
    
    HttpManager *manager = [[HttpManager alloc] init];
    manager.delegate = self;
    if(_isAsc){
        [manager requestGet:[NSString stringWithFormat:lProgrammeUrl, _albumId, _curPage, @"true"]];
    }else{
        [manager requestGet:[NSString stringWithFormat:lProgrammeUrl, _albumId, _curPage, @"false"]];
    }
}

- (void)failure:(AFHTTPRequestOperation *)operation response:(NSError *)error{
    NSLog(@"Programme:%@", error);
    _isLoading = NO;
    [_tableView.footer endRefreshing];
}

- (void)success:(AFHTTPRequestOperation *)operation response:(id)responseObject{
    if(_curPage == 1){
        [_dataArray removeAllObjects];
    }
    
    NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];
    if(_programmeModel == nil){
        _programmeModel = [[ProgrammeModel alloc] init];
        [_programmeModel setValuesForKeysWithDictionary:rootDic[@"album"]];
        self.navigationItem.title = _programmeModel.title;
        _headView.model = _programmeModel;
    }
    
    for(NSDictionary *dic in rootDic[@"tracks"][@"list"]){
        Programme *model = [[Programme alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [_dataArray addObject:model];
    }
    
    [_tableView reloadData];
    _isLoading = NO;
    [_tableView.footer endRefreshing];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return _sectionView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(_isList){
        return _dataArray.count;
    }else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(_isList){
        return 50;
    }else{
        return 450;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(_isList){
        ProgrammeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProgrammeCellId"];
        if(cell == nil){
            cell = [[ProgrammeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProgrammeCellId"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.model = _dataArray[indexPath.row];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId"];
        if(cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellId"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor clearColor];
            
            UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, ScreenWidth-20, 430)];
            bgImageView.image = [UIImage imageNamed:@"bg_album_detail_text"];
            [cell addSubview:bgImageView];
        }
        return cell;
    }
}

#pragma maek - SelectTabDelegate
- (void)selectTabWithLeft:(BOOL)isLeft{
    if(isLeft){
        _isList = NO;
        _tableView.footer.hidden = YES;
    }else{
        _isList = YES;
        _tableView.footer.hidden = NO;
        if(_sectionView.rightBtn.selected){
            if(_isAsc){
                _isAsc = NO;
                [_sectionView.rightBtn setImage:[UIImage imageNamed:@"mark_albumsound_order"] forState:UIControlStateSelected];
            }else{
                _isAsc = YES;
                [_sectionView.rightBtn setImage:[UIImage imageNamed:@"mark_albumsound_reverse"] forState:UIControlStateSelected];
            }
            _curPage = 1;
            [self downloadData];
            return ;
        }else{
            _sectionView.leftBtn.selected = NO;
            _sectionView.rightBtn.selected = YES;
        }
    }
    [_tableView reloadData];
}

@end
