//
//  AlbumViewController.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/6.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "AlbumViewController.h"
#import "Const.h"
#import "HttpManager.h"
#import "AlbumModel.h"
#import "AlbumCell.h"
#import "AlbumTopCell.h"
#import "SynopsisViewController.h"
#import "ProgrammeViewController.h"

@interface AlbumViewController () <HttpManagerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) AlbumModel *model;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createTableView];
    [self downloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-113)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
}

#pragma mark - NetWork
- (void)downloadData{
    HttpManager *manager = [[HttpManager alloc] init];
    manager.delegate = self;
    [manager requestGet:[NSString stringWithFormat:lAlbumUrl, _uid]];
}

- (void)failure:(AFHTTPRequestOperation *)operation response:(NSError *)error{
    NSLog(@"Album:%@", error);
}

- (void)success:(AFHTTPRequestOperation *)operation response:(id)responseObject{
    _model = [[AlbumModel alloc] init];
    
    NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
    [_model setValuesForKeysWithDictionary:rootDic];
    
    for(NSDictionary *dic in rootDic[@"list"]){
        Album *album = [[Album alloc] init];
        [album setValuesForKeysWithDictionary:dic];
        [_model.albumsArray addObject:album];
    }
    
    self.navigationItem.title = _model.nickname;
    
    [_tableView reloadData];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _model.albumsArray.count+1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        return 300;
    }
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        AlbumTopCell *topCell = [tableView dequeueReusableCellWithIdentifier:@"AlbumTopCellId"];
        if(topCell == nil){
            topCell = [[AlbumTopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AlbumTopCellId"];
            topCell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        topCell.largeLogo = _model.largeLogo;
        [topCell.btn addTarget:self action:@selector(gotoSynopsis) forControlEvents:UIControlEventTouchUpInside];
        return topCell;
    }else{
        AlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumCellId"];
        if(cell == nil){
            cell = [[AlbumCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AlbumCellId"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.model = _model.albumsArray[indexPath.row-1];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0){
        return ;
    }
    
    ProgrammeViewController *pvc = [[ProgrammeViewController alloc] init];
    pvc.albumId = ((Album *)_model.albumsArray[indexPath.row-1]).albumId;
    [self.navigationController pushViewController:pvc animated:YES];
}

#pragma mark - ClickAction
- (void)gotoSynopsis{
    SynopsisViewController *svc = [[SynopsisViewController alloc] init];
    svc.navTitle = @"简介";
    svc.synopsis = _model.personalSignature;
    [self.navigationController pushViewController:svc animated:YES];
}

@end
