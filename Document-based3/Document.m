//
//  Document.m
//  Document-based3
//
//  Created by 河野 さおり on 2016/02/19.
//  Copyright © 2016年 河野 さおり. All rights reserved.
//

#import "Document.h"
#import "DocWinC.h"

@interface Document ()

@end

@implementation Document

@synthesize strFromFile;

- (instancetype)init {
    self = [super init];
    if (self) {
        strFromFile = nil;
    }
    return self;
}

//オートセーブ機能のON/OFF
+ (BOOL)autosavesInPlace {
    return NO;
}

- (NSString *)windowNibName {
    return @"Document";
}

- (void)makeWindowControllers{
    //ドキュメントウインドウコントローラのインスタンスを作成
    DocWinC *_docWinC = [[DocWinC alloc]initWithWindowNibName:[self windowNibName]];
    [self addWindowController:_docWinC];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError {
    //サポートするタイプのドキュメントデータをNSDataオブジェクトにパッケージして返す
    DocWinC *winCtr = [[self windowControllers]objectAtIndex:0];
    NSString *txt = winCtr._textView.string;
    NSData *data = [txt dataUsingEncoding:NSUTF8StringEncoding];
    return data;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError {
    //ドキュメントデータを読み込みドキュメントウインドウに表示
    //ファイルからテキストを読み込み
    NSString *txt = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    if (! txt){
        *outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
        return NO;
    } else {
        if ([self windowControllers].count != 0) {
            //復帰のための読み込みの場合（既存のテキストビューに直接読み込む）
            DocWinC *winCtr = [[self windowControllers]objectAtIndex:0];
            [winCtr._textView replaceCharactersInRange:NSMakeRange(0, [[winCtr._textView string]length]) withString:txt];
        } else {
            //ファイルを開く場合
            strFromFile = txt;
        }
    }
    return YES;
}

@end
