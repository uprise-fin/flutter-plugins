#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LevelPlayNativeAdElementStyle : NSObject <NSCopying>

@property (nonatomic, strong, nullable) NSNumber *backgroundColor;
@property (nonatomic, strong, nullable) NSNumber *textSize;
@property (nonatomic, strong, nullable) NSNumber *textColor;
@property (nonatomic, strong, nullable) NSString *fontStyle;
@property (nonatomic, strong, nullable) NSNumber *cornerRadius;

- (instancetype)initWithBackgroundColor:(NSNumber *)backgroundColor
                      textSize:(NSNumber *)textSize
                     textColor:(NSNumber *)textColor
                     fontStyle:(NSString *)fontStyle
                  cornerRadius:(NSNumber *)cornerRadius;

@end

        NS_ASSUME_NONNULL_END
