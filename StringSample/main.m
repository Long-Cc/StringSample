//
//  main.m
//  StringSample
//
//  Created by LongCh on 2017/10/21.
//  Copyright © 2017年 LongCh. All rights reserved.
//
//计算集合中数学运算式计算结果

#import <Foundation/Foundation.h>
#import "Stack.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arrayStr = [NSArray arrayWithObjects:@"56.",@"+",@".74",@"-",@"1.2",@"×",@"8.3",@"÷",@"4",nil];
//        for (NSString *str in arrayStr) {
//            NSLog(@"%@",str);
//        }
        Stack *stack = [Stack new];
        NSString *m = [arrayStr objectAtIndex:0];
        [stack push:m];
        for (int i = 0; i < [arrayStr count]; ++i) {
            if(i % 2 == 1){
                if([[arrayStr objectAtIndex:i] isEqualToString:@"+"]){
                    NSString *help = [arrayStr objectAtIndex:i+1];
                    [stack push:help];
                }
                if([[arrayStr objectAtIndex:i] isEqualToString:@"-"]){
                    NSString *temphelp = [arrayStr objectAtIndex:i+1];
                    NSString *help = [NSString stringWithFormat:@"-%@",temphelp];
                    [stack push:help];
                }
                if([[arrayStr objectAtIndex:i] isEqualToString:@"×"]){
                    NSString *help = [arrayStr objectAtIndex:i+1];
                    NSString *ans = [stack topElemet];
                    [stack popTopElement];
                    double dhelp = [help doubleValue];
                    double dans = [ans doubleValue];
                    dans = dans * dhelp;
                    NSString *ansStr = [NSString stringWithFormat:@"%f",dans];
                    [stack push:ansStr];
                }
                if([[arrayStr objectAtIndex:i] isEqualToString:@"÷"]){
                    NSString *help = [arrayStr objectAtIndex:i+1];
                    NSString *ans = [stack topElemet];
                    [stack popTopElement];//消栈
                    double dhelp = [help doubleValue];
                    double dans = [ans doubleValue];
                    dans /= dhelp;
                    NSString *ansStr = [NSString stringWithFormat:@"%f",dans];
                    [stack push:ansStr];
                }
            }
        }
        double result = 0.0;
        while ([stack isEmpty]) {
           NSString *temp = [stack TopElement];
            double dtemp = [temp doubleValue];
            result += dtemp;
            [stack popTopElement];
        }
        NSLog(@"result:%f",result);
    }
    return 0;
    
}
