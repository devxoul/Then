require "xcodeproj"

PACKAGE_NAME = "Then"

module Pod
  class OS
    attr_accessor :deployment_target
  end

  class Spec
    attr_accessor :version
    attr_accessor :ios
    attr_accessor :osx
    attr_accessor :tvos
    attr_accessor :watchos

    def initialize
      @ios = OS.new
      @osx = OS.new
      @tvos = OS.new
      @watchos = OS.new
      yield self if block_given?
    end

    def method_missing(*args)
    end
  end
end

def read_podspec
  podspec_path = "#{PACKAGE_NAME}.podspec"
  podspec_content = open(podspec_path).read
  podspec = eval podspec_content
  return podspec
end

def run(command)
  puts command
  r = `#{command} 2>&1`.strip
  puts r if r and r.length > 0
  return r
end

def prepare_xcconfig
  @config = "Config.xcconfig"
  podspec = read_podspec()
  ios_version = podspec.ios.deployment_target
  macos_version = podspec.osx.deployment_target
  tvos_version = podspec.tvos.deployment_target
  watchos_version = podspec.watchos.deployment_target

  def add_config(key, value)
    run "echo '#{key} = #{value}' >> #{@config}"
  end

  run "test -e #{@config} && rm #{@config}"
  add_config("IPHONEOS_DEPLOYMENT_TARGET", ios_version) if ios_version
  add_config("MACOSX_DEPLOYMENT_TARGET", macos_version) if macos_version
  add_config("TVOS_DEPLOYMENT_TARGET", tvos_version) if tvos_version
  add_config("WATCHOS_DEPLOYMENT_TARGET", watchos_version) if watchos_version
end

def modify_info
  def plistbuddy(info, command)
    return "PlistBuddy -c \"#{command}\" #{info}"
  end

  def plist_set(info, key, value)
    r = run plistbuddy(info, "Set #{key} #{value}")
    if r.include? "Not Exist"
      run plistbuddy(info, "Add #{key} string #{value}")
    end
  end

  podspec = read_podspec()
  version = podspec.version
  ios_version = podspec.ios.deployment_target
  macos_version = podspec.osx.deployment_target
  tvos_version = podspec.tvos.deployment_target
  watchos_version = podspec.watchos.deployment_target

  framework = "#{PACKAGE_NAME}.framework"
  ios_info = "./Carthage/Build/iOS/#{framework}/Info.plist"
  macos_info = "./Carthage/Build/Mac/#{framework}/Resources/Info.plist"
  tvos_info = "./Carthage/Build/tvOS/#{framework}/Info.plist"
  watchos_info = "./Carthage/Build/watchOS/#{framework}/Info.plist"

  plist_set(ios_info, "CFBundleVersion", version) if ios_version
  plist_set(macos_info, "CFBundleVersion", version) if macos_version
  plist_set(tvos_info, "CFBundleVersion", version) if tvos_version
  plist_set(watchos_info, "CFBundleVersion", version) if watchos_version
end

case ARGV.first
when "prepare_xcconfig"
  prepare_xcconfig()

when "modify_info"
  modify_info()
end
