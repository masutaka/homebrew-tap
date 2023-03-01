class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.14'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.14/github-nippou_v4.1.14_darwin_arm64.zip'
      sha256 '7aef19e214dcd03351937124265e9e7444faabc05f36d1007bb33b52feb243ef'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.14/github-nippou_v4.1.14_darwin_amd64.zip'
      sha256 'd8f33d63b0ca14cc9f57df5fe4a010c7b6ecb41011f74342f2c7b455452a8f56'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.14/github-nippou_v4.1.14_linux_amd64.zip'
      sha256 'a9d1fe53f85f6f04a3fa6b07e4e590119e01e7fcb35c2d1a2b2283ef5db1bd11'
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
