class GithubNippou < Formula
  desc "Print today's your GitHub activity for issues and pull requests"
  homepage 'https://github.com/masutaka/github-nippou'
  version '4.2.15'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.15/github-nippou_v4.2.15_darwin_arm64.zip'
      sha256 'e34a21efb5b2a13f975532e95ca7e3fc6155fcfc2cf9b979512b388ac4d0df25'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.15/github-nippou_v4.2.15_darwin_amd64.zip'
      sha256 '1e2340702e247ad3385635aaeb60a8437f92cd6620e6ba62092dd8974d45e882'
    end
  end

  on_linux do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.15/github-nippou_v4.2.15_linux_arm64.zip'
      sha256 '49d4525a8e060c9293639a41b94091b1fafe2e82f6ba2cd390a937b9ee35b85f'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.15/github-nippou_v4.2.15_linux_amd64.zip'
      sha256 'b0ef0f88e5c690ec987183c095d7bb118aee4775a1876a0ade89489ff32f5e3c'
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
