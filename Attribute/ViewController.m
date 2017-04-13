//
//  ViewController.m
//  Attribute
//
//  Created by mac mini on 2017/4/13.
//  Copyright © 2017年 mac mini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor grayColor];
    
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    NSString *str = @"富文本";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 40)];
    label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
    /*
     NSFontAttributeName(字体)
     该属性所对应的值是一个 UIFont 对象。该属性用于改变一段文本的字体。如果不指定该属性，
     则默认为12-point Helvetica(Neue)。
     */
    
//    [dic setObject:[UIFont systemFontOfSize:20] forKey:NSFontAttributeName];
    [dic setObject:[UIFont fontWithName:@"futura" size:24] forKey:NSFontAttributeName];

    
    /*
     NSParagraphStyleAttributeName(段落)
     该属性所对应的值是一个 NSParagraphStyle 对象。该属性在一段文本上应用多个属性。如果不指定该属性，
     则默认为 NSParagraphStyle 的defaultParagraphStyle 方法返回的默认段落属性。
     */
    NSMutableParagraphStyle *paragaph = [[NSMutableParagraphStyle alloc] init];
    paragaph.alignment = NSTextAlignmentCenter;
    [dic setObject:paragaph forKey:NSParagraphStyleAttributeName];
    
    
    /*
     NSForegroundColorAttributeName(字体颜色)
     该属性所对应的值是一个 UIColor 对象。该属性用于指定一段文本的字体颜色。如果不指定该属性，则默认为黑色。
     
     注意：
     NSForegroundColorAttributeName 设置的颜色与 UILabel 的 textColor 属性设置的颜色在地位上是相等的，
     与 NSBackgroundColorAttributeName 地位上也相等，谁最后赋值，最终显示的就是谁的颜色，
     但是textColor属性可以与 NSBackgroundColorAttributeName 属性可叠加。
     */
    
    [dic setObject:[UIColor orangeColor] forKey:NSForegroundColorAttributeName];
    
    
    /*
     NSBackgroundColorAttributeName(字体背景色)
     该属性所对应的值是一个 UIColor 对象。该属性用于指定一段文本的背景颜色。如果不指定该属性，则默认无背景色。
     */
    [dic setObject:[UIColor blueColor] forKey:NSBackgroundColorAttributeName];
    
    /*
     NSLigatureAttributeName(连字符)
     该属性所对应的值是一个 NSNumber 对象(整数)。连体字符是指某些连在一起的字符，它们采用单个的图元符号。
     0 表示没有连体字符。1 表示使用默认的连体字符。2表示使用所有连体符号。默认值为 1（注意，iOS 不支持值为 2）
     */
    
//    str = @"flush";
    [dic setObject:[NSNumber numberWithInt:0] forKey:NSLigatureAttributeName];
    
    /*
     NSKernAttributeName(字间距)
     NSKernAttributeName 设定字符间距，取值为 NSNumber 对象（整数），正值间距加宽，负值间距变窄
     */
    
    [dic setObject:@(5) forKey:NSKernAttributeName];
    

    
    
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:str attributes:dic];
    
    /*
     NSStrikethroughStyleAttributeName(删除线)
     NSStrikethroughStyleAttributeName 设置删除线，取值为 NSNumber 对象（整数），枚举常量 NSUnderlineStyle中的值：
     NSUnderlineStyleNone 不设置删除线
     NSUnderlineStyleSingle 设置删除线为细单实线
     NSUnderlineStyleThick 设置删除线为粗单实线
     NSUnderlineStyleDouble 设置删除线为细双实线
     默认值是NSUnderlineStyleNone。
     
     可以看出，中文和英文删除线的位置有所不同
     另外，删除线属性取值除了上面的4种外，其实还可以取其他整数值，有兴趣的可以自行试验，
     取值为 0 - 7时，效果为单实线，随着值得增加，单实线逐渐变粗，取值为 9 - 15时，效果为双实线，取值越大，双实线越粗。
     */
    
    //必须给rang
    [attribute addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleDouble) range:NSMakeRange(0, str.length)];
    
    /*
     NSStrikethroughColorAttributeName
     NSStrikethroughColorAttributeName 设置删除线颜色，取值为 UIColor 对象，默认值为黑色
     */
    [attribute addAttribute:NSStrikethroughColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, str.length)];

    /*
     NSUnderlineStyleAttributeName(下划线)
     该属性所对应的值是一个 NSNumber 对象(整数)。该值指定是否在文字上加上下划线，该值参考“Underline Style Attributes”。默认值是NSUnderlineStyleNone。
     下划线除了线条位置和删除线不同外，其他的都可以完全参照删除线设置。
     */
    
    [attribute addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(0, str.length)];
    
    /*
     NSStrokeColorAttributeName(边线颜色) 和 NSStrokeWidthAttributeName(边线宽度)
     设置文字描边颜色，需要和NSStrokeWidthAttributeName设置描边宽度，这样就能使文字空心.
     NSStrokeWidthAttributeName 这个属性所对应的值是一个 NSNumber 对象(小数)。该值改变笔画宽度（相对于字体 size 的百分比），负值填充效果，正值中空效果，默认为 0，即不改变。正数只改变描边宽度。负数同时改变文字的描边和填充宽度。例如，对于常见的空心字，这个值通常为 3.0。
     同时设置了空心的两个属性，并且 NSStrokeWidthAttributeName 属性设置为整数，文字前景色就无效果了
     NSStrokeColorAttributeName 填充部分颜色，不是字体颜色，取值为 UIColor 对象
     */
    
    
    /*
     NSShadowAttributeName(阴影)
     该属性所对应的值是一个 NSShadow 对象。默认为 nil。单独设置不好使，和这三个任一个都好使，NSVerticalGlyphFormAttributeName，NSObliquenessAttributeName，NSExpansionAttributeName
     */
    
    /*
     NSVerticalGlyphFormAttributeName(横竖排版)
     
     该属性所对应的值是一个 NSNumber 对象(整数)。0 表示横排文本。1 表示竖排文本。在 iOS 中，总是使用横排文本，0 以外的值都未定义。
     */
    
    /*
     NSObliquenessAttributeName(字体倾斜)
     */
    
    /*
     NSExpansionAttributeName (文本扁平化)
     */
    
    
    
    // 创建图片图片附件
    
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"220338710357"];
    attach.bounds = CGRectMake(0, 0, 15, 15);
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
    
    [attribute appendAttributedString:attachString];
    [attribute appendAttributedString:[[NSAttributedString alloc] initWithString:@"附件"]];
    
    
    label.attributedText = attribute;

    
    
#pragma mark -- label计算方法

    UILabel *label_2 = [[UILabel alloc] initWithFrame:CGRectMake(40, 200, 200, 40)];
    label_2.backgroundColor = [UIColor whiteColor];
    label_2.numberOfLines = 0;
    CGSize size;
    CGRect rect;

    //自适应宽度
    label_2.text = @"你你你你你你我我我哦哦inion哦哦";
    label_2.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label_2];
    
    
//    size = [label_2.text boundingRectWithSize:CGSizeMake(MAXFLOAT, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :label_2.font} context:nil].size;
//    
//    rect = label_2.frame;
//    rect.size.width = size.width;
//    label_2.frame = rect;

    //自适应高度
    
    label_2.text = @"你你你你你你我我我哦哦inion哦哦你你\n你你你你我我我哦哦inion哦哦你你你你你你我我我哦哦inion哦哦你你你你我我我哦哦inion哦哦你你你你你你我我我哦哦inion哦哦";

    size = [label_2.text boundingRectWithSize:CGSizeMake(200, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName :label_2.font} context:nil].size;
    
    rect = label_2.frame;
    rect.size = size;
    label_2.frame = rect;
    
    
#if 0
    
    //mas显示多行，自适应高度
    
    UILabel *label3 = [[UILabelalloc] initWithFrame:CGRectZero];
    
    [self.viewaddSubview:label3];
    
    label3.backgroundColor =[UIColorredColor];
    
    label3.text =@"我爱北京天安门！天安门上太阳升！我爱北京天安门！天安门上太阳升！我爱北京天安门！天安门上太阳升！我爱北京天安门！天安门上太阳升！我爱北京天安门！天安门上太阳升！我爱北京天安门！天安门上太阳升！我爱北京天安门！天安门上太阳升！我爱北京天安门！天安门上太阳升！我爱北京天安门！天安门上太阳升！我爱北京天安门！天安门上太阳升！我爱北京天安门！天安门上太阳升！我爱北京天安门！天安门上太阳升！";
    
    label3.preferredMaxLayoutWidth = (self.view.frame.size.width -10.0 * 2);
    
    [label3 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    label3.numberOfLines =0;
    
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(10.0);
        
        make.right.mas_equalTo(-10.0);
        
        make.top.mas_equalTo(100.0);
        
    }];
    
    
    //iOS 设置UILabel 的内边距
    
    - (void
       )drawTextInRect:(CGRect)rect {
        UIEdgeInsets insets
        = {0, 5, 0, 5
        };
        [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
    }
    
#endif
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
