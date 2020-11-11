#import "FlutterScrollToIndexPlugin.h"
#if __has_include(<flutter_scroll_to_index/flutter_scroll_to_index-Swift.h>)
#import <flutter_scroll_to_index/flutter_scroll_to_index-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_scroll_to_index-Swift.h"
#endif

@implementation FlutterScrollToIndexPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterScrollToIndexPlugin registerWithRegistrar:registrar];
}
@end
