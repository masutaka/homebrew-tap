class GithubNippou < Formula
  desc "Print today's your GitHub activity for issues and pull requests"
  homepage 'https://github.com/masutaka/github-nippou'
  version '4.2.13'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.13/github-nippou_v4.2.13_darwin_arm64.zip'
      sha256 '18b36f80aacdbb51b2fdb190a1ad685fb9226c8670d3d41415e84b44c08217b1'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.13/github-nippou_v4.2.13_darwin_amd64.zip'
      sha256 'f56c02f0cd64da81ac385176b7c42da0dcf3d62ebbb6982d713c17a854f4e6a6'
    end
  end

  on_linux do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.13/github-nippou_v4.2.13_linux_arm64.zip'
      sha256 '8a64c6fe8093591ec33d9b871fe1e3d7a200ea674eec6420b6aaf6b4135d32e8'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.13/github-nippou_v4.2.13_linux_amd64.zip'
      sha256 'ff3a00953034951133521d9231d2fdc9e06c6ff8c2f420c0afbddd13c6a034a2'
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
