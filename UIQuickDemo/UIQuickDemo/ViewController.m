//
//  ViewController.m
//  UIQuickDemo
//
//  Created by 蔡联庆 on 2019/7/24.
//  Copyright © 2019 蔡联庆. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    NSString *testStr = @"是两地分居手里的荆防颗粒时代峻峰莱胜收到了非技术砥砺奋进乐山大佛技术大佬开发加手里的,收到了废旧塑料看点风景收到了开发叫啥浪蝶狂蜂加速度快了房价手里的空间放螺丝孔";
    UILabel *a = [[UILabel alloc]init];
    a.numberOfLines = 2;
    a.lineBreakMode = NSLineBreakByCharWrapping;
    [a sizeToFit];
    a.frame = CGRectMake(100, 100,200, 100);
    a.text = testStr;
    [self.view addSubview:a];
    
    NSArray *b = [self getSeparatedLinesFromLabel:a];
//    if (b.count == 2) {
//        NSString *first = b.firstObject;
//        NSString *last = b.lastObject;
//        if (first.length < last.length
//            && (last.length - first.length)>=3) {
//            NSString *subStr = [testStr substringFromIndex:2];
//            NSString *tempStr = [@"..." stringByAppendingString:subStr];
//            a.text = tempStr;
//        }
//    }
    
    if (b.count >= 3) {
        NSString *first = b.firstObject;
        NSString *third = [b objectAtIndex:2];
        if (third.length <= 3) {
            NSString *subStr = [testStr substringFromIndex:1];
            NSString *tempStr = [@"..." stringByAppendingString:subStr];
            a.text = tempStr;
        }else {
            NSString *subStr = [testStr substringFromIndex:(testStr.length - first.length*2)];
            NSString *subStr1 = [subStr substringFromIndex:1];
            NSString *tempStr = [@"..." stringByAppendingString:subStr1];
            a.text = tempStr;
        }
    }
}


- (NSArray *)getSeparatedLinesFromLabel:(UILabel *)label {
    NSString *text = [label text];
    UIFont *font = [label font];
    CGRect rect = [label frame];
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,rect.size.width,MAXFLOAT));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    for (id line in lines)
    {
        CTLineRef lineRef = (__bridge CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    return (NSArray *)linesArray;
}


- (void)injected {
    

}

@end
