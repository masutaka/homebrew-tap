class GithubNippou < Formula
  desc "Print today's your GitHub activity for issues and pull requests"
  homepage 'https://github.com/masutaka/github-nippou'
  version '4.2.11'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.11/github-nippou_v4.2.11_darwin_arm64.zip'
      sha256 '9e04966b215dd73bc7ca95b695832a6fb4a1de0f1880929c1eaea691f324bb55'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.11/github-nippou_v4.2.11_darwin_amd64.zip'
      sha256 '85ec17135da4f5de0436bea617a02532d35a4a28710169d1db12c8eb48db83df'
    end
  end

  on_linux do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.11/github-nippou_v4.2.11_linux_arm64.zip'
      sha256 'fabe28e2e79304542fb1363573c46fe424c07224ab00ebf3ee8e1305266eebf0'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.11/github-nippou_v4.2.11_linux_amd64.zip'
      sha256 '4d61db4fad1d32c9cf4b887bd6b98b7a3f61cc74d114e28fa173276791ca2105'
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
