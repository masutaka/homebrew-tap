class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.2.5'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.5/github-nippou_v4.2.5_darwin_arm64.zip'
      sha256 'd6578547d43292e51af3e4257caf7824d2cb6538f3cd2c72847dc4c2924f63e6'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.5/github-nippou_v4.2.5_darwin_amd64.zip'
      sha256 '258e1e75b0c8cca04e806cabe0a459bc00ce178d846154f19e1a1a5b78e505f3'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.5/github-nippou_v4.2.5_linux_amd64.zip'
      sha256 '8e8446e5daa778cbaca00077e7a41638a4d84aeb75a7cacb49e6de78874e7cc9'
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
