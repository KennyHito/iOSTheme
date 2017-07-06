//
//  HitoViewController.m
//  HitoTheme
//
//  Created by Apple on 2017/7/6.
//  Copyright © 2017年 KennyHito. All rights reserved.
//

/***
 这里主要预习代理 delegate
 ***/
#import "HitoViewController.h"
//遵循代理方法
@interface HitoViewController ()<nextDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)UICollectionView * collectionView;

@end

@implementation HitoViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Go" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonClick:)];
    [self setCollectionView];
}

- (void)setCollectionView{
    UICollectionViewFlowLayout * layOut = [[UICollectionViewFlowLayout alloc]init];
    CGFloat width = (HitoScreenW - 80) / 3;
    layOut.itemSize = CGSizeMake(width, width);
    layOut.minimumLineSpacing = 20;
    layOut.minimumInteritemSpacing = 20;
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, HitoScreenW, HitoScreenH-64-49) collectionViewLayout:layOut];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    _collectionView.backgroundColor = [UIColor whiteColor];
    _collectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [self RandomColor];
    cell.layer.cornerRadius = 10;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"color onclick");
    UICollectionViewCell * selectCell = [collectionView cellForItemAtIndexPath:indexPath];
    
    [self Hito_setThemeColor:selectCell.backgroundColor];
    
}

/* 随机颜色 */
- (UIColor *)RandomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}

- (void)rightBarButtonClick:(UIBarButtonItem *)item{
    HitoAllocInit(nextViewController, nextVC);
    //设置代理
    nextVC.delegate = self;
    nextVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:nextVC animated:YES];
}

//实现代理方法
- (void)sendMessage:(NSString *)message {
    NSLog(@"delegate result = %@",message);
}

@end
