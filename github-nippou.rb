class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.20'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.20/github-nippou_v4.1.20_darwin_arm64.zip'
      sha256 '0fed2bf735327b2585eea3a6c1024cbe0c61c150373a2559ad2717d1e2549f06'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.20/github-nippou_v4.1.20_darwin_amd64.zip'
      sha256 '1142659258078a912abc8a4cba36ddefc0217bce0cdd43104713b0baca0a5e4f'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.20/github-nippou_v4.1.20_linux_amd64.zip'
      sha256 '2edb24801de760415d4bac74d54a342c1c473c7d44365b4ca74e6d29f71adda7'
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
