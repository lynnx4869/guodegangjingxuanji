//
//  AlbumCell.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "AlbumCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface AlbumCell ()

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *tracksLabel;

@end

@implementation AlbumCell

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
        
        UIImageView *albumView = [[UIImageView alloc] init];
        albumView.translatesAutoresizingMaskIntoConstraints = NO;
        albumView.image = [UIImage imageNamed:@"sound_album"];
        [bgView addSubview:albumView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.font = [UIFont systemFontOfSize:12];
        [bgView addSubview:_titleLabel];
        
        _tracksLabel = [[UILabel alloc] init];
        _tracksLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _tracksLabel.font = [UIFont systemFontOfSize:10];
        [bgView addSubview:_tracksLabel];
        
        [albumView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.mas_top).with.offset(0);
            make.bottom.equalTo(_tracksLabel.mas_top).with.offset(0);
            make.left.equalTo(_leftImageView.mas_right).with.offset(10);
            make.right.equalTo(_titleLabel.mas_left).with.offset(-5);
            make.width.equalTo(@20);
        }];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.mas_top).with.offset(0);
            make.bottom.equalTo(_tracksLabel.mas_top).with.offset(0);
            make.left.equalTo(albumView.mas_right).with.offset(5);
            make.right.equalTo(bgView.mas_right).with.offset(0);
        }];
        
        [_tracksLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).with.offset(0);
            make.bottom.equalTo(bgView.mas_bottom).with.offset(-5);
            make.left.equalTo(_leftImageView.mas_right).with.offset(10);
            make.right.equalTo(bgView.mas_right).with.offset(0);
            make.height.equalTo(@15);
        }];
    }
    return self;
}

- (void)setModel:(Album *)model{
    if(_model != model){
        _model = nil;
        _model = model;
        
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:model.coverSmall] placeholderImage:[UIImage imageNamed:@"sound_default"]];
        _titleLabel.text = model.title;
        _tracksLabel.text = [NSString stringWithFormat:@"节目数 %@", model.tracks];
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
