//
//  NSDictionary+CharlotteDic.m
//  PassbookDemo
//
//  Created by 刘春奇 on 16/8/29.
//  Copyright © 2016年 com.hc-nsqk.Charlotte. All rights reserved.
//

#import "NSDictionary+CharlotteDic.h"
#import <objc/message.h>
@implementation NSDictionary (CharlotteDic)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [objc_getClass("__NSPlaceholderDictionary") charlotteSelector:@selector(initWithObjects:forKeys:count:) withCharlotteSelector:@selector(safeObjects:forKeys:Count:)];
    });
}

- (instancetype)safeObjects:(const id _Nonnull __unsafe_unretained *)objects forKeys:(const id _Nonnull __unsafe_unretained *)keys Count:(NSInteger )count{
    BOOL containNilObjc = NO;
    BOOL containNilKey = NO;
    for (int i = 0; i < count; i ++) {
        if (objects[i] == nil && keys[i] != nil) {
            containNilObjc = YES;
            NSLog(@"CharlotteTip : object is nil(key is “%@”)",keys[i]);
        }else if(objects[i] != nil && keys[i] == nil){
            containNilKey = YES;
            NSLog(@"CharlotteTip : key is nil(object is “%@”)",objects[i]);
        }
    }
    if (containNilObjc || containNilKey) {
        NSUInteger nilCount = 0;
        for (int i = 0; i < count ; i ++) {
            if (objects[i] == nil || keys[i] == nil) {
                nilCount ++;
            }
        }
        NSUInteger length = count - nilCount;
        if (length >0) {
            NSUInteger index = 0;
            id __unsafe_unretained newObjects[length];
            id __unsafe_unretained newKeys[length];
            for (NSUInteger i = 0; i < count; i ++) {
                if (objects[i] != nil && keys[i] != nil) {
                    newObjects[index] = objects[i];
                    newKeys[index] = keys[i];
                    index ++ ;
                }
            }
            NSLog(@"fixd dictionary is %@",[self safeObjects:newObjects forKeys:newKeys Count:length]);
            return [self safeObjects:newObjects forKeys:newKeys Count:length];
        }else{
            NSLog(@"_FUNCTION_ At the intersection between objects and the keys are nil");
            return nil;
        }
       
        
    }
    return [self safeObjects:objects forKeys:keys Count:count];
}

+ (void)charlotteSelector:(SEL)originalSelector withCharlotteSelector:(SEL)charlotteSelector {
    Class class = [self class];
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method charlotteMethod = class_getInstanceMethod(class, charlotteSelector);

    BOOL didAddMethod = class_addMethod(class,
                                        originalSelector,
                                        method_getImplementation(charlotteMethod),
                                        method_getTypeEncoding(charlotteMethod));
    if (didAddMethod) {
        class_replaceMethod(class,
                            charlotteSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, charlotteMethod);
    }
    
}




@end
