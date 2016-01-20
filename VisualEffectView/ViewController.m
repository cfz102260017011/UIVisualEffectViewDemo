//
//  ViewController.m
//  VisualEffectView
//
//  Created by 陈 奋柱 on 15/6/29.
//  Copyright (c) 2015年 CFZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic , strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*********只适用于 iOS 8 以上***********/
    
    //  UIVisualEffectView  能及时炫染图片  效果非常好
    
    //添加展示背景 用以显示动态模糊
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    UIImageView *imagev = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"meinv"]];
    self.scrollView.contentSize = imagev.image.size;
    self.scrollView.bounces = NO;
    [self.scrollView addSubview:imagev];
    [self.view addSubview:self.scrollView];
    
    /**添加模糊效果**/
    
    // 1.创建模糊view
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    
    // 2.设定尺寸
    effectView.frame = CGRectMake(0, 100, 320, 200);
    
    // 3.添加到view中
    [self.view addSubview:effectView];
    
    /**添加显示文本**/
    UILabel *lable = [[UILabel alloc]initWithFrame:effectView.bounds];
    lable.text = @"极客学院";
    lable.font = [UIFont systemFontOfSize:50.f];
    lable.textAlignment = NSTextAlignmentCenter;
    
    /**添加模糊view的UIVisualEffectView**/
    
    // 1.创建出字模糊view
    UIVisualEffectView *subEffectView = [[UIVisualEffectView alloc]initWithEffect:[UIVibrancyEffect effectForBlurEffect:(UIBlurEffect*)effectView.effect]];
    
    // 2.设定尺寸
    subEffectView.frame = effectView.bounds;
    
    // 3.将子模糊view添加到effectView的contentView才能生效
    [effectView.contentView addSubview:subEffectView ];
    
    // 4.添加要显示的view来达到特殊效果
    [subEffectView.contentView addSubview:lable];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
