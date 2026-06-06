class YesssQuotaWidget2 < Formula
  desc "macOS menu bar app for YESSS mobile quota"
  homepage "https://github.com/bot2904/yesss-quota-widget2"
  url "https://github.com/bot2904/yesss-quota-widget2/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "50e2a73765e891147e375221ad00c31aa328c927e7370c6f167b7fd703812d9b"
  head "https://github.com/bot2904/yesss-quota-widget2.git", branch: "main"

  depends_on macos: :ventura

  def install
    system "scripts/install_app.sh", "--target", prefix/"Applications", "--no-open"
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
