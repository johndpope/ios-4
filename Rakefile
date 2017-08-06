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

    desc "Build core framework"
    task :core do
      command = []
      command << "xcodebuild -workspace Sourcer.xcworkspace -scheme SourcerCore"
      command << "-config Debug"
      command << "clean build"
      command << "| xcpretty && exit ${PIPESTATUS[0]}"
      system command.join(" ") || abort
    end
end

desc "Performs all necessary tasks for CI"
task :ci => ["test:app", "test:core"] do
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

    desc "Test core framework"
    task :core do
      command = []
      command << "xcodebuild -workspace Sourcer.xcworkspace -scheme SourcerCore"
      command << "-config Debug"
      command << "clean test"
      command << "| xcpretty && exit ${PIPESTATUS[0]}"
      system command.join(" ") || abort
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
