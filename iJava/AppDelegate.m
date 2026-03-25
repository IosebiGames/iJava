#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

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

    return YES;
}

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
}

@end