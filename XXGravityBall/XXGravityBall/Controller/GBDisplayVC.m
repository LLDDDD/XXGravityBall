//
//  GBDisplayVC.m
//  GravityBall
//
//  Created by xxg90s on 2017/7/1.
//  Copyright © 2017年 xxg90s Inc. All rights reserved.
//

#import "GBDisplayVC.h"
//View
#import "GBDisplayView.h"

@interface GBDisplayVC ()
{
    NSArray *titles;
    NSMutableArray *_labels;
}

@property (nonatomic, strong) GBDisplayView *displayView;

@end

@implementation GBDisplayVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
    
    [self createDisplayView];
    
    [self initData];
}

#pragma mark - Private Method
- (void)createUI {
    //最大值参数
    titles = [NSArray arrayWithObjects:@"弹性", @"阻力", @"摩擦力", nil];
    NSArray *maxValues = [NSArray arrayWithObjects:@"1",@"10",@"10", nil];
    NSArray *values = [NSArray arrayWithObjects:@"0.8",@"0",@"3", nil];
    _labels = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < maxValues.count; i ++) {
        UISlider *_slider = [[UISlider alloc] initWithFrame:CGRectMake(130, 100 + 40*i, self.view.frame.size.width-160, 40)];//弹性
        [_slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        _slider.minimumValue = 0.0;
        _slider.maximumValue = [maxValues[i] floatValue];
        _slider.continuous = NO;
        _slider.value = [values[i] floatValue];
        _slider.tag = i;
        [self.view addSubview:_slider];
        
        UILabel *_label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100 + 40*i, 100, 40)];
        _label.numberOfLines = 0;
        _label.textAlignment = NSTextAlignmentLeft;
        _label.font = [UIFont systemFontOfSize:13.];
        _label.text = [NSString stringWithFormat:@"%@:%@",titles[i],values[i]];
        [self.view addSubview:_label];
        
        [_labels addObject:_label];
    }
}

- (void)createDisplayView {
    self.displayView = [[GBDisplayView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height*0.6, self.view.bounds.size.width, self.view.bounds.size.height*0.4)];
    //设置背景，自行选择
    [self.displayView setBgImage:[UIImage imageNamed:@"skyBg.jpg"]];
    //设置手势，自行选择
    self.displayView.enableClick = YES;
    [self.view addSubview:self.displayView];
    
    __weak typeof(self) weakSelf = self;
    self.displayView.didClickBallBlock = ^(GBModel *item) {
        [weakSelf didClickBall:item];
    };
}

- (void)initData {
    NSArray *images = [NSArray arrayWithObjects:@"asteroid",
                       @"blackhole",
                       @"earth",
                       @"jupiter",
                       @"mars",
                       @"mercury",
                       @"moon",
                       @"neptune",
                       @"pluto",
                       @"saturn",
                       @"sun",
                       @"supernova",
                       @"thanatos",
                       @"uranus",
                       @"venus",
                       nil];
    
    NSMutableArray *dataSource = [[NSMutableArray alloc] init];
    
    for (NSInteger i = 0; i < images.count; i ++) {
        GBModel *ballModel = [[GBModel alloc] init];
        ballModel.ballName = images[i];
        ballModel.ballTag = i;
        
        GBBall *ball = [GBBall factoryBallWithModel:ballModel referenceViewSize:CGSizeMake(self.displayView.frame.size.width, self.displayView.frame.size.height)];
        
        [dataSource addObject:ball];
    }
    
    [self.displayView setBalls:dataSource];
}

- (void)didClickBall:(GBModel *)item {
    NSLog(@"点击了小球,tag = %zd",item.ballTag);
}

- (void)sliderChanged:(UISlider*)sender {
    if (sender.tag == 0) {
        //弹性
        [_displayView setDynamicItemElasticity:sender.value];
        
        UILabel *label = _labels[0];
        label.text = [NSString stringWithFormat:@"%@:%f",titles[0],sender.value];
    }
    else if (sender.tag == 1) {
        //阻力
        [_displayView setDynamicItemResistance:sender.value];
        
        UILabel *label = _labels[1];
        label.text = [NSString stringWithFormat:@"%@:%f",titles[1],sender.value];
    }
    else if (sender.tag == 2) {
        //摩擦力
        [_displayView setDynamicItemFriction:sender.value];
        
        UILabel *label = _labels[2];
        label.text = [NSString stringWithFormat:@"%@:%f",titles[2],sender.value];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
