# Apricot

### SwiftGit2

Instructions on building SwiftGit2 are described as follows:

1. Clone `SwiftGit2`: `git clone git://github.com/SwiftGit2/SwiftGit2.git`.
2. Go to the folder and fetch the dependencies: `git submodule update --init --recursive`.
3. Run `./script/bootstrap` to install external dependencies.
4. Open `SwiftGit2.xcworkspace`.
5. Modify the build settings to use Homebrew libraries for Crypto, SSL, and SSH (for example: https://github.com/donny/Apricot/commit/4a16def966c09b0eb1a9f3c121a3c598433b5206).
6. Add `SwiftGit2.xcodeproj` and `Result.xcodeproj` to your project’s Xcode project or workspace.
7. On the "Build Phases" tab of your application target, add `SwiftGit2.framework` to the "Link Binary With Libraries" phase. SwiftGit2 must also be added to a "Copy Frameworks" build phase.
8. If you added SwiftGit2 to a project (not a workspace), you will also need to add the appropriate SwiftGit2 target to the "Target Dependencies" of your application.
