class YesssQuotaWidget2 < Formula
  desc "macOS menu bar app for YESSS mobile quota"
  homepage "https://github.com/bot2904/yesss-quota-widget2"
  url "https://github.com/bot2904/yesss-quota-widget2/releases/download/v0.1.1/YESSS-Quota-Tray-v0.1.1-macos.zip"
  sha256 "f6fa4f1560bb605be03983ca89d32b520d8ace28ac6797cf621f832d1d402437"

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
