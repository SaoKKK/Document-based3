//
//  DocWinC.m
//  Document-based2
//
//  Created by 河野 さおり on 2016/02/20.
//  Copyright © 2016年 河野 さおり. All rights reserved.
//

#import "DocWinC.h"

@interface DocWinC ()

@end

@implementation DocWinC

#pragma mark - Window Controller Method

- (void)windowDidLoad {
    [super windowDidLoad];
    NSLog(@"%s",__func__);
    //テキストファイルの読み込みと表示
    NSString *txt = [[NSString alloc]initWithContentsOfURL:[[self document]fileURL] encoding:NSUTF8StringEncoding error:nil];
    [_textView replaceCharactersInRange:NSMakeRange(0, [[_textView string]length]) withString:txt];
}

- (void)setDocument:(id)document{
    [super setDocument:document];
    NSLog(@"%s",__func__);
}


@end
