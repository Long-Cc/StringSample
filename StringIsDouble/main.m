//
//  main.m
//  StringIsDouble
//
//  Created by LongCh on 2017/10/21.
//  Copyright © 2017年 LongCh. All rights reserved.
//


//判断集合中NSString类型中‘.’的个数
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arrayStr = [NSArray arrayWithObjects:@"4.5.6",@"45..6",@"",@"45...56",@"45",nil];
        
        for (int i = 0; i < [arrayStr count]; ++i) {
            int count = 0;
            NSString *str = [arrayStr objectAtIndex:i];
            for (int j = 0; j < str.length; ++j) {
                if([str characterAtIndex:j] == '.') {
                    count++;
                }
            }
            if(count > 1){
                NSLog(@"cout:%d   %@ error",count,str);
            }
        }
//        NSString *str = @"hello world";
//        if ([str containsString:@"world"]) {
//            NSLog(@"str 包含 world");
//        } else {
//            NSLog(@"str 不存在 world");
//        }
        
        
       
    }
    return 0;
}
