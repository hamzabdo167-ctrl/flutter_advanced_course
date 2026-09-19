# Keep Flutter classes
-keep class io.flutter.** { *; }

# Keep Freezed & Json Serializable Models
-keepattributes *Annotation*
-keepclassmembers class * {
    @json_annotation.** <fields>;
    @json_annotation.** <methods>;
}

# Keep Retrofit & Dio
-keep class com.squareup.retrofit2.** { *; }
-keep interface retrofit2.** { *; }

# Keep GetIt
-keep class get_it.** { *; }