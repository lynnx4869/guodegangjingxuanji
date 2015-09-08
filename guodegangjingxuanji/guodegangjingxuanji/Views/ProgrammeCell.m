//
//  ProgrammeCell.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "ProgrammeCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "MyUtil.h"

@interface ProgrammeCell ()

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *playLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *sizeLabel;
@property (nonatomic, strong) UILabel *ageLabel;

@end

@implementation ProgrammeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView *bgView = [[UIImageView alloc] init];
        bgView.translatesAutoresizingMaskIntoConstraints = NO;
        bgView.image = [UIImage imageNamed:@"cell_bg_n"];
        [self addSubview:bgView];
        
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(5);
            make.bottom.equalTo(self.mas_bottom).with.offset(-5);
            make.left.equalTo(self.mas_left).with.offset(10);
            make.right.equalTo(self.mas_right).with.offset(-10);
        }];
        
        _leftImageView = [[UIImageView alloc] init];
        _leftImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [bgView addSubview:_leftImageView];
        
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.mas_top).with.offset(0);
            make.bottom.equalTo(bgView.mas_bottom).with.offset(-5);
            make.left.equalTo(bgView.mas_left).with.offset(0);
            make.width.equalTo(@35);
        }];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        [bgView addSubview:_titleLabel];
        
        UIImageView *playImageView = [[UIImageView alloc] init];
        playImageView.translatesAutoresizingMaskIntoConstraints = NO;
        playImageView.image = [UIImage imageNamed:@"sound_playtimes"];
        [bgView addSubview:playImageView];
        
        _playLabel = [[UILabel alloc] init];
        _playLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _playLabel.font = [UIFont systemFontOfSize:7];
        [bgView addSubview:_playLabel];
        
        UIImageView *timeImageView = [[UIImageView alloc] init];
        timeImageView.translatesAutoresizingMaskIntoConstraints = NO;
        timeImageView.image = [UIImage imageNamed:@"sound_duration"];
        [bgView addSubview:timeImageView];
        
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _timeLabel.font = [UIFont systemFontOfSize:7];
        [bgView addSubview:_timeLabel];
        
        UIImageView *sizeImageView = [[UIImageView alloc] init];
        sizeImageView.translatesAutoresizingMaskIntoConstraints = NO;
        sizeImageView.image = [UIImage imageNamed:@"sound_size"];
        [bgView addSubview:sizeImageView];
        
        _sizeLabel = [[UILabel alloc] init];
        _sizeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _sizeLabel.font = [UIFont systemFontOfSize:7];
        [bgView addSubview:_sizeLabel];
        
        _ageLabel = [[UILabel alloc] init];
        _ageLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _ageLabel.font = [UIFont systemFontOfSize:7];
        [bgView addSubview:_ageLabel];
        
        UIButton *downloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        downloadBtn.translatesAutoresizingMaskIntoConstraints = NO;
        [downloadBtn setBackgroundImage:[UIImage imageNamed:@"btn_sound_download_n"] forState:UIControlStateNormal];
        [downloadBtn setBackgroundImage:[UIImage imageNamed:@"btn_sound_download_h"] forState:UIControlStateHighlighted];
        [bgView addSubview:downloadBtn];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.mas_top).with.offset(0);
            make.bottom.equalTo(playImageView.mas_top).with.offset(-4);
            make.left.equalTo(_leftImageView.mas_right).with.offset(10);
            make.right.equalTo(_ageLabel.mas_left).with.offset(0);
        }];
        
        [_ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.mas_top).with.offset(0);
            make.bottom.equalTo(downloadBtn.mas_top).with.offset(0);
            make.left.equalTo(_titleLabel.mas_right).with.offset(0);
            make.right.equalTo(bgView.mas_right).with.offset(0);
            make.width.equalTo(@25);
        }];
        
        [playImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).with.offset(4);
            make.bottom.equalTo(bgView.mas_bottom).with.offset(-9);
            make.left.equalTo(_leftImageView.mas_right).with.offset(10);
            make.right.equalTo(_playLabel.mas_left).with.offset(0);
            make.width.equalTo(@7);
            make.height.equalTo(@7);
        }];
        
        [_playLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).with.offset(4);
            make.bottom.equalTo(bgView.mas_bottom).with.offset(-9);
            make.left.equalTo(playImageView.mas_right).with.offset(0);
            make.right.equalTo(timeImageView.mas_left).with.offset(0);
            make.width.equalTo(@50);
            make.height.equalTo(@7);
        }];
        
        [timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).with.offset(4);
            make.bottom.equalTo(bgView.mas_bottom).with.offset(-9);
            make.left.equalTo(_playLabel.mas_right).with.offset(0);
            make.right.equalTo(_timeLabel.mas_left).with.offset(0);
            make.width.equalTo(@7);
            make.height.equalTo(@7);
        }];
        
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).with.offset(4);
            make.bottom.equalTo(bgView.mas_bottom).with.offset(-9);
            make.left.equalTo(timeImageView.mas_right).with.offset(0);
            make.right.equalTo(sizeImageView.mas_left).with.offset(0);
            make.width.equalTo(@50);
            make.height.equalTo(@7);
        }];
        
        [sizeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).with.offset(4);
            make.bottom.equalTo(bgView.mas_bottom).with.offset(-9);
            make.left.equalTo(_timeLabel.mas_right).with.offset(0);
            make.right.equalTo(_sizeLabel.mas_left).with.offset(0);
            make.width.equalTo(@7);
            make.height.equalTo(@7);
        }];
        
        [_sizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).with.offset(4);
            make.bottom.equalTo(bgView.mas_bottom).with.offset(-9);
            make.left.equalTo(sizeImageView.mas_right).with.offset(0);
            make.right.equalTo(downloadBtn.mas_left).with.offset(-10);
            make.height.equalTo(@7);
        }];
        
        [downloadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_ageLabel.mas_bottom).with.offset(0);
            make.bottom.equalTo(bgView.mas_bottom).with.offset(-8);
            make.left.equalTo(_sizeLabel.mas_right).with.offset(10);
            make.right.equalTo(bgView.mas_right).with.offset(-15);
            make.width.equalTo(@10);
            make.height.equalTo(@15);
        }];
    }
    return self;
}

- (void)setModel:(Programme *)model{
    if(_model != model){
        _model = nil;
        _model = model;
        
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:model.coverSmall] placeholderImage:[UIImage imageNamed:@"sound_default"]];
        _titleLabel.text = model.title;
        _playLabel.text = [NSString stringWithFormat:@"%@", model.playtimes];
        _timeLabel.text = [MyUtil getTimeFromTime:model.duration];
        _sizeLabel.text = [NSString stringWithFormat:@"%.2lf M", model.mp3size_64.doubleValue/(1024*1024)];
        _ageLabel.text = [MyUtil getDateFromTime:model.createdAt];
    }
}

@end
