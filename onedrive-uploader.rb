class OnedriveUploader < Formula
  desc "Command-line utility for uploading files to OneDrive"
  homepage "https://github.com/virtualzone/onedrive-uploader"
  url "https://github.com/virtualzone/onedrive-uploader/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "6067d12a9730ba537e4e56a80eabd04a793704e49d8c567955871f0ca456ee84"
  license "MIT"
  head "https://github.com/virtualzone/onedrive-uploader.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = ["-w -s"]
    system "go", "build", "-ldflags", ldflags.join(" "), "-o", "#{bin}/onedrive-uploader"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/onedrive-uploader version")
  end
end
