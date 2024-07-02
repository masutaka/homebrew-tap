class GithubNippou < Formula
  desc "Print today's your GitHub activity for issues and pull requests"
  homepage 'https://github.com/masutaka/github-nippou'
  version '4.2.21'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.21/github-nippou_v4.2.21_darwin_arm64.zip'
      sha256 '1d1c4f227f679ea5713006109f3c85e1e90d3da3ba68d73db0482e94306ab381'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.21/github-nippou_v4.2.21_darwin_amd64.zip'
      sha256 '5b19f63b10012c48ebc4aaf77de0cf08f660673a211df0203a0e4ce7886a7bc0'
    end
  end

  on_linux do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.21/github-nippou_v4.2.21_linux_arm64.zip'
      sha256 '6e84402c7743fa8027f18c4af6ed14e92766a05eec6d3e15dcd899b616e9bca7'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.21/github-nippou_v4.2.21_linux_amd64.zip'
      sha256 '52739b2e102b671efe591ff9c0338fb1a40cb6095c3a7f7f69396d6860daf84a'
    end
  end

  def install
    bin.install 'github-nippou'

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'bash')
    (bash_completion/'github-nippou').write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'fish')
    (fish_completion/'github-nippou.fish').write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/github-nippou", 'completion', 'zsh')
    (zsh_completion/'_github-nippou').write output
  end

  test do
    system 'github-nippou', 'version'
  end
end
