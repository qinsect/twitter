//
//  FileUtil.h
//  Twitter
//
//  Created by Yanfeng Ma on 9/20/16.
//  Copyright © 2016 Yanfeng Ma. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileUtil : NSObject

+ (void)writeStringToFile:(NSString*)aString fileName:(NSString*) fileName;
+ (NSString*)readStringFromFile:(NSString*) fileName;
+ (BOOL) saveToDisk:(NSArray*) array fileName:(NSString*) fileName;
+ (NSArray*) getFromDisk:(NSString*) fileName;

@end
