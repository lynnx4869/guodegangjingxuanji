//
//  HomeCell.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/6.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "HomeCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface HomeCell ()

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UILabel *nicknameLabel;
@property (nonatomic, strong) UILabel *personDescribeLabel;
@property (nonatomic, strong) UILabel *albumsLabel;

@end

@implementation HomeCell

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
            make.width.equalTo(@75);
        }];
        
        _nicknameLabel = [[UILabel alloc] init];
        _nicknameLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _nicknameLabel.font = [UIFont systemFontOfSize:14];
        [bgView addSubview:_nicknameLabel];
        
        _personDescribeLabel = [[UILabel alloc] init];
        _personDescribeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _personDescribeLabel.textColor = [UIColor grayColor];
        _personDescribeLabel.font = [UIFont systemFontOfSize:12];
        [bgView addSubview:_personDescribeLabel];
        
        _albumsLabel = [[UILabel alloc] init];
        _albumsLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _albumsLabel.textColor = [UIColor grayColor];
        _albumsLabel.font = [UIFont systemFontOfSize:11];
        [bgView addSubview:_albumsLabel];
        
        [_nicknameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView.mas_top).with.offset(5);
            make.bottom.equalTo(_personDescribeLabel.mas_top).with.offset(-3);
            make.left.equalTo(_leftImageView.mas_right).with.offset(10);
            make.right.equalTo(bgView.mas_right).with.offset(0);
        }];
        
        [_personDescribeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_nicknameLabel.mas_bottom).with.offset(3);
            make.bottom.equalTo(_albumsLabel.mas_top).with.offset(-3);
            make.left.equalTo(_leftImageView.mas_right).with.offset(10);
            make.right.equalTo(bgView.mas_right).with.offset(0);
            make.height.equalTo(@15);
        }];
        
        [_albumsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_personDescribeLabel.mas_bottom).with.offset(3);
            make.bottom.equalTo(self.mas_bottom).with.offset(-20);
            make.left.equalTo(_leftImageView.mas_right).with.offset(10);
            make.right.equalTo(bgView.mas_right).with.offset(0);
            make.height.equalTo(@15);
        }];
    }
    return self;
}

- (void)setModel:(HomeModel *)model{
    if(_model != model){
        _model = nil;
        _model = model;
        
        [_leftImageView sd_setImageWithURL:[NSURL URLWithString:model.mediumLogo] placeholderImage:[UIImage imageNamed:@"sound_default"]];
        _nicknameLabel.text = model.nickname;
        _personDescribeLabel.text = model.personDescribe;
        _albumsLabel.text = [NSString stringWithFormat:@"专辑数 %@", model.albums];
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
