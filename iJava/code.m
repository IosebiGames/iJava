#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {

        NSLog(@"Hello iOS experiment!");

        NSError *error = nil;

        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDir = [paths firstObject];

        NSString *filePath = [documentsDir stringByAppendingPathComponent:@"myExperiment.txt"];
        NSString *content = @"GUI-less Java logic running on iOS!";

        BOOL success = [content writeToFile:filePath
                                 atomically:YES
                                   encoding:NSUTF8StringEncoding
                                      error:&error];

        if (success) {
            NSLog(@"File written at: %@", filePath);
        } else {
            NSLog(@"Error writing file: %@", error.localizedDescription);
        }
    }
    return 0;
}