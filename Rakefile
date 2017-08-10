require "colorize"

namespace :build do
    desc "Build app"
    task :app do
      command = []
      command << "xcodebuild -workspace Sourcer.xcworkspace -scheme Sourcer"
      command << "-config Debug"
      command << "clean build"
      command << "| xcpretty && exit ${PIPESTATUS[0]}"
      system command.join(" ") || abort
    end

    desc "Build Open framework for macOS"
    task :open_macos do
      command = []
      command << "xcodebuild -workspace Sourcer.xcworkspace -scheme Open-macOS"
      command << "-config Debug"
      command << "clean build"
      command << "| xcpretty && exit ${PIPESTATUS[0]}"
      system command.join(" ") || abort
    end

    desc "Build Open framework for iOS"
    task :open_ios do
      command = []
      command << "xcodebuild -workspace Sourcer.xcworkspace -scheme Open-iOS"
      command << "-config Debug"
      command << "clean build"
      command << "| xcpretty && exit ${PIPESTATUS[0]}"
      system command.join(" ") || abort
    end

    desc "Build Open framework for watchOS"
    task :open_watchos do
      command = []
      command << "xcodebuild -workspace Sourcer.xcworkspace -scheme Open-watchOS"
      command << "-config Debug"
      command << "clean build"
      command << "| xcpretty && exit ${PIPESTATUS[0]}"
      system command.join(" ") || abort
    end

    desc "Build Open framework for all platforms"
    task :open_all do
      Rake::Task["build:open_macos"].invoke
      Rake::Task["build:open_ios"].invoke
      Rake::Task["build:watchos"].invoke
    end
end

desc "Performs all necessary tasks for CI"
task :ci => ["build:open_all", "test:open_all", "test:app"] do
  system "swiftlint" || abort
end

namespace :test do
    desc "Test app"
    task :app do
      command = []
      command << "xcodebuild -workspace Sourcer.xcworkspace -scheme Sourcer"
      command << "-config Debug"
      command << "clean test"
      command << "| xcpretty && exit ${PIPESTATUS[0]}"
      system command.join(" ") || abort
    end

    desc "Test Open framework for macOS"
    task :open_macos do
      command = []
      command << "xcodebuild -workspace Sourcer.xcworkspace -scheme Open-macOS"
      command << "-config Debug"
      command << "clean test"
      command << "| xcpretty && exit ${PIPESTATUS[0]}"
      system command.join(" ") || abort
    end

    desc "Test Open framework for iOS"
    task :open_ios do
      command = []
      command << "xcodebuild -workspace Sourcer.xcworkspace -scheme Open-iOS"
      command << "-destination 'platform=iOS Simulator,name=iPhone 6,OS=11.0'"
      command << "-config Debug"
      command << "clean test"
      command << "| xcpretty && exit ${PIPESTATUS[0]}"
      system command.join(" ") || abort
    end

    desc "Test Open framework for all platforms"
    task :open_all do
      Rake::Task["test:open_macos"].invoke
      Rake::Task["test:open_ios"].invoke
    end
end

namespace :release do

  ZIP_PATH = "Sourcer.zip"

  desc "Generates a zip with the binary"
  task :zip do
    puts "Building Sourcer".colorize(:yellow)
    command = []
    command << "xcodebuild -workspace Sourcer.xcworkspace -scheme Sourcer"
    command << "-config Release"
    command << "-derivedDataPath build"
    command << "build archive"
    command << "| xcpretty && exit ${PIPESTATUS[0]}"
    system command.join(" ") || abort
    app_path = File.join(Dir.pwd, "build/Build/Products/Release/Sourcer.app")
    puts "Archiving Sourcer".colorize(:yellow)
    File.delete(ZIP_PATH) if File.exist?(ZIP_PATH)
    system "ditto -c -k --sequesterRsrc --keepParent #{app_path} #{ZIP_PATH}"
  end

  desc "Signs the zip to be distributed using Sparkle"
  task :sign, :cert do |t, args|
    abort("Specify the certificate used for signing: bundle exec rake release:sign[\"mycert.pem\"]") unless args.cert
    dsa_signature = `script/sign_update #{ZIP_PATH} #{args.cert}`
    size = File.size(ZIP_PATH)
    puts "Signature: #{dsa_signature}File size: #{size}"
  end
end
