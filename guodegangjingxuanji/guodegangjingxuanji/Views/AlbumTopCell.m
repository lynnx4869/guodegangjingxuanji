//
//  AlbumTopCell.m
//  guodegangjingxuanji
//
//  Created by qianfeng on 15/9/7.
//  Copyright (c) 2015年 lyning. All rights reserved.
//

#import "AlbumTopCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface AlbumTopCell ()

@property (nonatomic, strong) UIImageView *bgImageView;

@end

@implementation AlbumTopCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:_bgImageView];
        
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(0);
            make.bottom.equalTo(self.mas_bottom).with.offset(0);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.right.equalTo(self.mas_right).with.offset(0);
        }];
        
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.translatesAutoresizingMaskIntoConstraints = NO;
        [_btn setBackgroundImage:[UIImage imageNamed:@"btn_user_info_n"] forState:UIControlStateNormal];
        [self addSubview:_btn];
        
        [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).with.offset(-15);
            make.bottom.equalTo(self.mas_bottom).with.offset(-15);
            make.width.equalTo(@50);
            make.height.equalTo(@25);
        }];
    }
    return self;
}

- (void)setLargeLogo:(NSString *)largeLogo{
    if(_largeLogo != largeLogo){
        _largeLogo = nil;
        _largeLogo = largeLogo;
        
        [_bgImageView sd_setImageWithURL:[NSURL URLWithString:_largeLogo] placeholderImage:[UIImage imageNamed:@"sound_large_default"]];
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
