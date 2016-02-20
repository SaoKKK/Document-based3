//
//  DocWinC.m
//  Document-based3
//
//  Created by 河野 さおり on 2016/02/20.
//  Copyright © 2016年 河野 さおり. All rights reserved.
//

#import "DocWinC.h"
#import "Document.h"

@interface DocWinC ()

@end

@implementation DocWinC

@synthesize _textView;

#pragma mark - Window Controller Method

- (void)windowDidLoad {
    [super windowDidLoad];
    Document *doc = [self document];
    //テキストビューにテキストをセット
    if (doc.strFromFile) {
        [_textView replaceCharactersInRange:NSMakeRange(0, [[_textView string]length]) withString:doc.strFromFile];
    }
}

@end
