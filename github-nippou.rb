class GithubNippou < Formula
  desc "Print today's your GitHub activity for issues and pull requests"
  homepage 'https://github.com/masutaka/github-nippou'
  version '4.2.17'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.17/github-nippou_v4.2.17_darwin_arm64.zip'
      sha256 '8454dc04697744a6a3e3293c932938befc7c7338519f19f247ba0a1eba747634'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.17/github-nippou_v4.2.17_darwin_amd64.zip'
      sha256 '00d3b7c1809c5f366a1ef653206e241b693560e1d118004aaa1b4a84f34849b2'
    end
  end

  on_linux do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.17/github-nippou_v4.2.17_linux_arm64.zip'
      sha256 'fea186931b822b90da3d5669e4cd8d602d0a47df054a8b09d27da3f3e2a640c9'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.17/github-nippou_v4.2.17_linux_amd64.zip'
      sha256 'f7d7ca98d8763af6734a539498bcb21da5b0008bf70bde5862b989f1a2506580'
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
