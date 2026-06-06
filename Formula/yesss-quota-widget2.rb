class YesssQuotaWidget2 < Formula
  desc "macOS menu bar app for YESSS mobile quota"
  homepage "https://github.com/bot2904/yesss-quota-widget2"
  url "https://github.com/bot2904/yesss-quota-widget2/releases/download/v0.1.2/YESSS-Quota-Tray-v0.1.2-macos.zip"
  sha256 "c296b386b2fcf840cdd3e00d0daf24c1b7e4a151f27198bbed3a3c2e0b8408a1"

  depends_on macos: :ventura

  def install
    (prefix/"Applications").install "YESSS Quota Tray.app"
    (bin/"yesss-quota-tray").write <<~SH
      #!/bin/sh
      exec "#{prefix}/Applications/YESSS Quota Tray.app/Contents/MacOS/YesssTrayApp" "$@"
    SH
    chmod 0755, bin/"yesss-quota-tray"
  end

  def caveats
    <<~EOS
      YESSS Quota Tray was installed to:
        #{prefix}/Applications/YESSS Quota Tray.app

      Open it with:
        open #{prefix}/Applications/YESSS\\ Quota\\ Tray.app
    EOS
  end

  test do
    assert_path_exists prefix/"Applications/YESSS Quota Tray.app/Contents/MacOS/YesssTrayApp"
  end
end
