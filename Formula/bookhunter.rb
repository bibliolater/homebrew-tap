# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Bookhunter < Formula
  desc "Software to download chinese ebooks from Internet."
  homepage "https://github.com/bibliolater"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/bibliolater/bookhunter/releases/download/v0.3.0/bookhunter_0.3.0_darwin_amd64.tar.gz"
      sha256 "691d4e93e9975933ccacff6ab0e414df19c43c841cd633d8feffb612f84fc3eb"

      def install
        bin.install "bookhunter"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/bibliolater/bookhunter/releases/download/v0.3.0/bookhunter_0.3.0_darwin_arm64.tar.gz"
      sha256 "47a8fc4780ff00fd789fb6f433167e33e706beb1dde415a698a1ecf7d1fb8e25"

      def install
        bin.install "bookhunter"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bibliolater/bookhunter/releases/download/v0.3.0/bookhunter_0.3.0_linux_arm64.tar.gz"
      sha256 "8ade9f626231878616d61f2f1d15bfc9b4e4022fceabd9d962b33b0f39c11dd8"

      def install
        bin.install "bookhunter"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bibliolater/bookhunter/releases/download/v0.3.0/bookhunter_0.3.0_linux_amd64.tar.gz"
      sha256 "caa7dde7756d26306f39429d87a1d43b9825b617c069f74757b9d95980754840"

      def install
        bin.install "bookhunter"
      end
    end
  end

  def post_install
    # Install shell completions
    output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "bash")
    (bash_completion/"goreleaser").write output

    output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "zsh")
    (zsh_completion/"_goreleaser").write output

    output = Utils.safe_popen_read("#{bin}/bookhunter", "completion", "fish")
    (fish_completion/"goreleaser.fish").write output
  end

  test do
    system "#{bin}/bookhunter -v"
  end
end
