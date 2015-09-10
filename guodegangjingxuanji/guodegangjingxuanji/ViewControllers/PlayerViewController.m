//
//  PlayerViewController.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/8.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "PlayerViewController.h"
#import "ToolsImageView.h"
#import "AppDelegate.h"
#import "HttpManager.h"
#import "Const.h"
#import "UIImageView+WebCache.h"
#import "ProgrammeModel.h"
#import "MyAudioPlayer.h"

@interface PlayerViewController () <HttpManagerDelegate>

@property (nonatomic, strong) Programme *model;

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"view_background"]];
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.imageView.hidden = YES;
    
    [self createTools];
    [self createViews];
    
    if(_trackId == nil){
        _model = [[MyAudioPlayer shareIntance] currentPlayer];
        [_bgImageView sd_setImageWithURL:[NSURL URLWithString:_model.coverLarge] placeholderImage:[UIImage imageNamed:@"sound_large_default"]];
        _titleLabel.text = _model.title;
    }else{
        [self downloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createTools{
    UIImageView *toolsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, ScreenHeight-49, ScreenWidth, 49)];
    toolsImageView.userInteractionEnabled = YES;
    toolsImageView.image = [UIImage imageNamed:@"tabbar_bg"];
    
    CGFloat space = (ScreenWidth - 250) / 6;
    NSArray *imageArray = @[@"np_toolbar_back_n", @"np_toolbar_alarm_n", @"np_toolbar_sleep_n", @"np_toolbar_download_n", @"np_toolbar_share_n"];
    NSArray *highArray = @[@"np_toolbar_back_h", @"np_toolbar_alarm_h", @"np_toolbar_sleep_h", @"np_toolbar_download_h", @"np_toolbar_share_h"];
    
    for(NSInteger i = 0; i < 5; i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((50+space)*i+space, 0, 50, 49);
        btn.tag = 400 + i;
        btn.imageEdgeInsets = UIEdgeInsetsMake(5, -5, 5, -5);
        [btn setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:highArray[i]] forState:UIControlStateHighlighted];
        [btn addTarget:self action:@selector(clickTools:) forControlEvents:UIControlEventTouchUpInside];
        [toolsImageView addSubview:btn];
    }
    
    [self.view addSubview:toolsImageView];
}

- (void)createViews{
    _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 300)];
    [self.view addSubview:_bgImageView];
    
    UIImageView *topView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 60)];
    topView.image = [UIImage imageNamed:@"bg_transparent"];
    [self.view addSubview:topView];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, ScreenWidth, 25)];
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.textAlignment = 1;
    [topView addSubview:_titleLabel];
    
    UIImageView *bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 240, ScreenWidth, 60)];
    bottomView.image = [UIImage imageNamed:@"bg_transparent"];
    [self.view addSubview:bottomView];
    
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.imageView.hidden = NO;
}

#pragma mark - NetWork
- (void)downloadData{
    HttpManager *manager = [[HttpManager alloc] init];
    manager.delegate = self;
    [manager requestGet:[NSString stringWithFormat:lPlayerUrl, _trackId]];
}

- (void)failure:(AFHTTPRequestOperation *)operation response:(NSError *)error{
    NSLog(@"Player:%@", error);
}

- (void)success:(AFHTTPRequestOperation *)operation response:(id)responseObject{
    NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];
    _model = [[Programme alloc] init];
    [_model setValuesForKeysWithDictionary:rootDic];
    
    [[MyAudioPlayer shareIntance] setCurrentPlayer:_model];
    [[MyAudioPlayer shareIntance] setCurrentList:_listArray];
    [[MyAudioPlayer shareIntance] setCurrentIndex:_curIndex];
    
    [_bgImageView sd_setImageWithURL:[NSURL URLWithString:_model.coverLarge] placeholderImage:[UIImage imageNamed:@"sound_large_default"]];
    _titleLabel.text = _model.title;
    
    
}

#pragma mark - ClickAction
- (void)clickTools:(UIButton *)btn{
    switch (btn.tag - 400) {
        case 0:
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        default:
            break;
    }
}

@end
