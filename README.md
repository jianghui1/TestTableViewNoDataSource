平时开发中，一般涉及到内容比较多的，都会使用列表（UITableView/UICollectionView）来实现。前几天遇到一个需求，做一个筛选界面，但是条目只有两个，算是非常简单的 UI 了。但是，我还是选择了使用 `UITableView` 来实现，因为未免以后会增加更多的条目，以后就可以方便扩展了。

其实，到这里，并没有什么奇葩可言，一切还算正常。重点是接下来对 `UITableView` 的使用，我不想要设置 `UITableView` 的数据源方法，只想要把 `UITableView` 当成简单的 `UIScrollView` 使用，这样既可以方便以后扩展，也可以快速做出目前的需求，瞬间觉得自己想法太好了。

接下来就是具体实施。直接上代码，首先创建两个 `UITableViewCell` 代表两个条目，由于使用的 xib，这里就直接上截图：

![FirstTableViewCell](https://github.com/jianghui1/TestTableViewNoDataSource/blob/master/pics/first.png?raw=true)

这是第一个 `cell` ，里面包含一个 `UILabel` 和 `UIImageView` 。

![SecondTableViewCell](https://github.com/jianghui1/TestTableViewNoDataSource/blob/master/pics/second.png?raw=true)

这是第二个 `cell` ，里面包含两个 `UITextField` 。

再看下 `ViewController` 中的代码：

    - (void)viewDidLoad {
        [super viewDidLoad];
        
        [self addTableView];
        [self addFirstTableViewCell];
        [self addSecondTableViewCell];
    }
    
    - (void)addTableView
    {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.backgroundColor = [UIColor colorWithRed:233 / 255.0 green:233 / 255.0 blue:233 / 255.0 alpha:1];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
    }
    
    - (void)addFirstTableViewCell
    {
        FirstTableViewCell *firstCell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([FirstTableViewCell class])
                                                                       owner:nil
                                                                     options:nil]
                                         firstObject];
        firstCell.frame = CGRectMake(0, 100, self.view.frame.size.width, 60);
        [_tableView addSubview:firstCell];
    }
    
    - (void)addSecondTableViewCell
    {
        SecondTableViewCell *secondCell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SecondTableViewCell class])
                                                                         owner:nil
                                                                       options:nil]
                                           firstObject];
        secondCell.frame = CGRectMake(0, 200, self.view.frame.size.width, 60);
        [_tableView addSubview:secondCell];
    }
    
这里不管是 `UITableView` 还是两个 `cell` 的添加都是直接使用的 frame ，然后看下运行效果：

![clickBefore](https://github.com/jianghui1/TestTableViewNoDataSource/blob/master/pics/clickBefore.png?raw=true)

完美呀，没有任何问题。

稍等，待我点击完 `UITextField` 之后，如果 `UITextField` 取消响应（resignFirstResponder），就会看到第二个 `cell` 不见了，通过 `dealloc` 方法可以知道这个 `cell` 被释放了。
见效果图：

![clickAfter](https://github.com/jianghui1/TestTableViewNoDataSource/blob/master/pics/clickAfter.png?raw=true)

这是什么原因呢，搜了一些并没有什么答案，看了官方 api 也没有什么收获。其实这种情况，应该只能看源码来解释了，不过，我没法看到具体的源码，所以只能乖乖的继续使用 `UITableView` 的标准方法，设置 `dataSoure` 来完成需求了。

其实，这里我不觉得自己的思想有多奇葩，只是结果确实是出乎意料。可能这就是 Apple 设计的初衷吧。

上面用到的代码在[这里](https://github.com/jianghui1/TestTableViewNoDataSource)。



