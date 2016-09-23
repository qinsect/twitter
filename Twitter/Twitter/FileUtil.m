//
//  FileUtil.m
//  Twitter
//
//  Created by Yanfeng Ma on 9/20/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import "FileUtil.h"

@implementation FileUtil

+ (void)writeStringToFile:(NSString*)aString fileName:(NSString*) fileName{
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileAtPath]) {
        [[NSFileManager defaultManager] createFileAtPath:fileAtPath contents:nil attributes:nil];
    }
    
    [[aString dataUsingEncoding:NSUTF8StringEncoding] writeToFile:fileAtPath atomically:NO];
}

+ (NSString*)readStringFromFile:(NSString*) fileName {
    NSString* filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* fileAtPath = [filePath stringByAppendingPathComponent:fileName];
    
    return [[NSString alloc] initWithData:[NSData dataWithContentsOfFile:fileAtPath] encoding:NSUTF8StringEncoding];
}

+ (BOOL) saveToDisk:(NSArray*) array fileName:(NSString*) fileName {
    return [NSKeyedArchiver archiveRootObject:array toFile:fileName];
}

+ (NSArray*) getFromDisk:(NSString*) fileName {
    NSArray* array = [NSKeyedUnarchiver unarchiveObjectWithFile:fileName];
    return array;
}
@end
