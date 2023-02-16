# Documentation: https://docs.brew.sh/Formula-Cookbook
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
class Goku < Formula
  depends_on "candid82/brew/joker"
  # depends_on "https://raw.githubusercontent.com/candid82/homebrew-brew/2491ed79f9733e6d58b41eef0a771659a0eed162/joker.rb"
  desc "karabiner configurator"
  homepage "https://github.com/yqrashawn/GokuRakuJoudo"
  url "file://Users/seren/t/goku.zip"
  sha256 "ef7fc7ad8afbbbc965042f0c6c41adb45001fd8fe18d04a27c11da062a44dee6"

  def install
    bin.install "goku"
    bin.install "gokuw"
    inreplace "service.plist", "$PLIST-NAME$", plist_name
    inreplace "service.plist", "$OPT-BIN-PATH$", opt_bin
    inreplace "service.plist", "$HOME-PATH$", ENV["HOME"]
    prefix.install "service.plist"
    prefix.install_symlink "service.plist" => "#{plist_name}.plist"
  end

  # service do
  #   run [opt_bin/"goku"]
  #   environment_variables {"GOKU_EDN_CONFIG_FILE" => ENV["HOME"]}/.config/karabiner.edn}
  #   error_log_path "#{ENV["HOME"]}/Library/Logs/goku.log"
  #   log_path "#{ENV["HOME"]}/Library/Logs/goku.log"
  #   run_type :interval

  #   # watch_paths: ["#{ENV["HOME"]}/.config/karabiner.edn"]
  # end

  test do
    system "#{bin}/goku", "--help"
  end
end
