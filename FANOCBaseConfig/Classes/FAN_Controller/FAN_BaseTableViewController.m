//
//  FAN_BaseTableViewController.m
//  FANOCBaseConfig
//
//  Created by 王丹 on 2022/5/3.
//

#import "FAN_BaseTableViewController.h"
@interface FAN_BaseTableViewController ()

@property (nonatomic,strong)FAN_NoDataView *noDataView;


@end

@implementation FAN_BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self addHeaderRefresh];
    [self addFooterRefresh];
 //   [self addChildSubview];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)addChildSubview {


}


#pragma mark 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:self.style];
//        [self.view addSubview:_tableView];
        _tableView.backgroundColor = [UIColor fan_colorWithHexString:@"#F7F8F9"];
        _tableView.delegate     = self;
        _tableView.dataSource   = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

        // 这个是为了解决cell 上移bug
        _tableView.estimatedRowHeight=0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 20, 0);
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        if (@available(iOS 11.0,*)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }else{
            self.automaticallyAdjustsScrollViewInsets = false;
        }
    }
    return _tableView;
}


#pragma mark <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).description;
    return cell;
}

#pragma mark <UITableViewDelegate>

// 添加头部刷新
- (void)addHeaderRefresh {
    __weak FAN_BaseTableViewController *weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
    }];

}


// 添加底部刷新
- (void)addFooterRefresh {
    __weak FAN_BaseTableViewController *weakSelf = self;
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
}

// 加载更多数据
- (void)loadMoreData {

}

// 显示没有数据View
- (void)showNoDataView {

    if (!self.noDataView) {
        self.noDataView = [FAN_NoDataView noDataViewImageName:@"empty" title:@"没有课程安排哦"];
        [self.view addSubview:self.noDataView];
        [self.noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.edges.mas_equalTo(self.view).inset(UIEdgeInsetsMake(, 0, 0, 0));
            make.top.mas_equalTo(self.nvView.mas_bottom);
            make.leading.trailing.bottom.mas_equalTo(self.tableView);
        }];
    } else {
        self.noDataView.hidden = NO;
    }


}
// 显示没有数据View
- (void)removeNoDataView{

    if (_noDataView) {
        [_noDataView removeFromSuperview];
    }
}


@end
