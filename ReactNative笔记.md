# iOS集成ReactNative中遇到的问题：

## 问题一：

```objective-c

Showing All Issues
Ld /Users/never/Library/Developer/Xcode/DerivedData/RNTest-bcuehswcjhrrwifpskhqtuwjtwio/Build/Products/Debug-iphonesimulator/RNTest.app/RNTest normal x86_64
    cd /Users/never/Desktop/RNTest
    export IPHONEOS_DEPLOYMENT_TARGET=9.0
    export PATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -arch x86_64 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator11.2.sdk -L/Users/never/Library/Developer/Xcode/DerivedData/RNTest-bcuehswcjhrrwifpskhqtuwjtwio/Build/Products/Debug-iphonesimulator -L/Users/never/Library/Developer/Xcode/DerivedData/RNTest-bcuehswcjhrrwifpskhqtuwjtwio/Build/Products/Debug-iphonesimulator/React -L/Users/never/Library/Developer/Xcode/DerivedData/RNTest-bcuehswcjhrrwifpskhqtuwjtwio/Build/Products/Debug-iphonesimulator/Yoga -F/Users/never/Library/Developer/Xcode/DerivedData/RNTest-bcuehswcjhrrwifpskhqtuwjtwio/Build/Products/Debug-iphonesimulator -filelist /Users/never/Library/Developer/Xcode/DerivedData/RNTest-bcuehswcjhrrwifpskhqtuwjtwio/Build/Intermediates.noindex/RNTest.build/Debug-iphonesimulator/RNTest.build/Objects-normal/x86_64/RNTest.LinkFileList -Xlinker -rpath -Xlinker @executable_path/Frameworks -mios-simulator-version-min=9.0 -dead_strip -Xlinker -object_path_lto -Xlinker /Users/never/Library/Developer/Xcode/DerivedData/RNTest-bcuehswcjhrrwifpskhqtuwjtwio/Build/Intermediates.noindex/RNTest.build/Debug-iphonesimulator/RNTest.build/Objects-normal/x86_64/RNTest_lto.o -Xlinker -export_dynamic -Xlinker -no_deduplicate -Xlinker -objc_abi_version -Xlinker 2 -fobjc-arc -fobjc-link-runtime -ObjC -lReact -lYoga -lstdc++ -framework JavaScriptCore -Xlinker -sectcreate -Xlinker __TEXT -Xlinker __entitlements -Xlinker /Users/never/Library/Developer/Xcode/DerivedData/RNTest-bcuehswcjhrrwifpskhqtuwjtwio/Build/Intermediates.noindex/RNTest.build/Debug-iphonesimulator/RNTest.build/RNTest.app.xcent -lYoga -lReact -lPods-RNTest -Xlinker -dependency_info -Xlinker /Users/never/Library/Developer/Xcode/DerivedData/RNTest-bcuehswcjhrrwifpskhqtuwjtwio/Build/Intermediates.noindex/RNTest.build/Debug-iphonesimulator/RNTest.build/Objects-normal/x86_64/RNTest_dependency_info.dat -o /Users/never/Library/Developer/Xcode/DerivedData/RNTest-bcuehswcjhrrwifpskhqtuwjtwio/Build/Products/Debug-iphonesimulator/RNTest.app/RNTest

Undefined symbols for architecture x86_64:
  "_JSNoBytecodeFileFormatVersion", referenced from:
      +[RCTJavaScriptLoader loadBundleAtURL:onProgress:onComplete:] in libReact.a(RCTJavaScriptLoader.o)
      +[RCTJavaScriptLoader attemptSynchronousLoadOfBundleAtURL:runtimeBCVersion:sourceLength:error:] in libReact.a(RCTJavaScriptLoader.o)
  "facebook::react::IRemoteConnection::~IRemoteConnection()", referenced from:
      RemoteConnection::~RemoteConnection() in libReact.a(RCTInspector.o)
  "facebook::react::systemJSCWrapper()", referenced from:
      -[RCTSamplingProfilerPackagerMethod handleRequest:withResponder:] in libReact.a(RCTSamplingProfilerPackagerMethod.o)
      -[RCTDevSettings isJSCSamplingProfilerAvailable] in libReact.a(RCTDevSettings.o)
      -[RCTDevSettings toggleJSCSamplingProfiler] in libReact.a(RCTDevSettings.o)
  "facebook::react::parseTypeFromHeader(facebook::react::BundleHeader const&)", referenced from:
      +[RCTJavaScriptLoader attemptSynchronousLoadOfBundleAtURL:runtimeBCVersion:sourceLength:error:] in libReact.a(RCTJavaScriptLoader.o)
  "facebook::react::customJSCWrapper()", referenced from:
      ____ZL11getInstancev_block_invoke in libReact.a(RCTInspector.o)
      -[RCTSamplingProfilerPackagerMethod handleRequest:withResponder:] in libReact.a(RCTSamplingProfilerPackagerMethod.o)
      -[RCTDevSettings isJSCSamplingProfilerAvailable] in libReact.a(RCTDevSettings.o)
      -[RCTDevSettings toggleJSCSamplingProfiler] in libReact.a(RCTDevSettings.o)
ld: symbol(s) not found for architecture x86_64
clang: error: linker command failed with exit code 1 (use -v to see invocation)


```

![QQ20180118-093132@2x](/Users/never/Desktop/QQ20180118-093132@2x.png)

### 解决方案：

pods增加：'BatchedBridge', #RN版本高于0.45之后必须导入 

在晴明网站教程里没有找到需要这个配置，只有在更新日志中说明必须增加此项



## 问题二：

'RCTBundleURLProvider.h' file not found

![nnn](nnn.png)

### 常规解决方法：

1. 打开Mac里面的终端，进入项目所在的文件夹目录；
2. 把项目里面的 **node_modules** 文件夹删除掉，然后执行 **npm install** 命令
3. **npm install**安装完成后， 执行**react-native upgrade**命令
4. 最后重新打开Xcode,clean一下，应该就没有问题了。
5. 如果依然报错，使用以下升级版解决方案：

###探索升级版解决方案：

~~~objective-c
/**更换为以下导入方式*/
#import <React/RCTBundleURLProvider.h>
~~~


## 问题三：
