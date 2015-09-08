//
//  ProgrammeHeadView.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "ProgrammeHeadView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface ProgrammeHeadView ()

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *logoImageview;
@property (nonatomic, strong) UILabel *nicknameLabel;
@property (nonatomic, strong) UILabel *tracksLabel;

@end

@implementation ProgrammeHeadView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 160)];
        [self addSubview:_bgImageView];
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        effectView.frame = _bgImageView.bounds;
        effectView.alpha = 0.9;
        [_bgImageView addSubview:effectView];

        UIImageView *shadowView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 160)];
        shadowView.userInteractionEnabled = YES;
        shadowView.image = [UIImage imageNamed:@"shadow_albumView_header"];
        [self addSubview:shadowView];
        
        UIImageView *coverImageView = [[UIImageView alloc] init];
        coverImageView.translatesAutoresizingMaskIntoConstraints = NO;
        coverImageView.image = [UIImage imageNamed:@"album_cover_bg"];
        [shadowView addSubview:coverImageView];
        
        _leftImageView = [[UIImageView alloc] init];
        _leftImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [coverImageView addSubview:_leftImageView];
        
        _logoImageview = [[UIImageView alloc] init];
        _logoImageview.translatesAutoresizingMaskIntoConstraints = NO;
        _logoImageview.layer.masksToBounds = YES;
        _logoImageview.layer.cornerRadius = 7.5;
        [shadowView addSubview:_logoImageview];
        
        _nicknameLabel = [[UILabel alloc] init];
        _nicknameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _nicknameLabel.font = [UIFont systemFontOfSize:14];
        _nicknameLabel.textColor = [UIColor whiteColor];
        [shadowView addSubview:_nicknameLabel];
        
        _tracksLabel = [[UILabel alloc] init];
        _tracksLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _tracksLabel.font = [UIFont systemFontOfSize:12];
        _tracksLabel.textColor = [UIColor whiteColor];
        [shadowView addSubview:_tracksLabel];
        
        UIButton *subscribeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        subscribeBtn.translatesAutoresizingMaskIntoConstraints = NO;
        [subscribeBtn setBackgroundImage:[UIImage imageNamed:@"albumInfoCell_fav_n"] forState:UIControlStateNormal];
        [subscribeBtn setBackgroundImage:[UIImage imageNamed:@"albumInfoCell_fav_h"] forState:UIControlStateSelected];
        [shadowView addSubview:subscribeBtn];
        
        [coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(shadowView.mas_left).with.offset(10);
            make.bottom.equalTo(shadowView.mas_bottom).with.offset(-10);
            make.width.equalTo(@70);
            make.height.equalTo(@70);
        }];
        
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(coverImageView.mas_top).with.offset(5);
            make.bottom.equalTo(coverImageView.mas_bottom).with.offset(-5);
            make.left.equalTo(coverImageView.mas_left).with.offset(5);
            make.right.equalTo(coverImageView.mas_right).with.offset(-5);
        }];
        
        [_logoImageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_tracksLabel.mas_top).with.offset(-10);
            make.left.equalTo(coverImageView.mas_right).with.offset(15);
            make.right.equalTo(_nicknameLabel.mas_left).with.offset(-3);
            make.width.equalTo(@15);
            make.height.equalTo(@15);
        }];
        
        [_nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_tracksLabel.mas_top).with.offset(-10);
            make.left.equalTo(_logoImageview.mas_right).with.offset(3);
            make.right.equalTo(shadowView.mas_right).with.offset(0);
            make.height.equalTo(@15);
        }];
        
        [_tracksLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nicknameLabel.mas_bottom).with.offset(10);
            make.bottom.equalTo(subscribeBtn.mas_top).with.offset(-15);
            make.left.equalTo(coverImageView.mas_right).with.offset(20);
            make.right.equalTo(shadowView.mas_right).with.offset(0);
            make.height.equalTo(@15);
        }];
        
        [subscribeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_tracksLabel.mas_bottom).with.offset(15);
            make.bottom.equalTo(shadowView.mas_bottom).with.offset(-12);
            make.left.equalTo(coverImageView.mas_right).with.offset(15);
            make.width.equalTo(@70);
            make.height.equalTo(@13);
        }];
    }
    return self;
}

- (void)setModel:(ProgrammeModel *)model{
    if(_model != model){
        _model = nil;
        _model = model;
        
        [_bgImageView sd_setImageWithURL:[NSURL URLWithString:model.coverLarge] placeholderImage:[UIImage imageNamed:@"bg_albumView_header"]];
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:model.coverSmall] placeholderImage:[UIImage imageNamed:@"sound_default"]];
        [_logoImageview sd_setImageWithURL:[NSURL URLWithString:model.smallLogo] placeholderImage:[UIImage imageNamed:@"small_head_male_default"]];
        _nicknameLabel.text = [NSString stringWithFormat:@"%@ 发布", model.nickname];
        _tracksLabel.text = [NSString stringWithFormat:@"节目数：%@", model.tracks];
    }
}

@end
