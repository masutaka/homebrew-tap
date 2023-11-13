class GithubNippou < Formula
  desc "Print today's your GitHub activity for issues and pull requests"
  homepage 'https://github.com/masutaka/github-nippou'
  version '4.2.10'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.10/github-nippou_v4.2.10_darwin_arm64.zip'
      sha256 'dcbc2cdd3286c16aea0f2d557b510d823abafbbe20d5ba9f86724ebb5cfb8bf1'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.10/github-nippou_v4.2.10_darwin_amd64.zip'
      sha256 'bb899e023a334e80a0de7f123be5982a2f55de22e5d9cddab789034368bab12c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.10/github-nippou_v4.2.10_linux_amd64.zip'
      sha256 'a23df2b5ee9451b94e9cbda4e6fcbdbaccedc0e567d31bceef789c8fdf24287c'
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
