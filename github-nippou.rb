class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.2.2'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.2/github-nippou_v4.2.2_darwin_arm64.zip'
      sha256 '09925472e7cd8c096170d1db1d7f15fd546cda22210530cc6e9e7a3120cd9b8c'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.2/github-nippou_v4.2.2_darwin_amd64.zip'
      sha256 '904de0916db343c666693d23722ed28866a27e8a391415ce711987989c952437'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.2/github-nippou_v4.2.2_linux_amd64.zip'
      sha256 '602cc6bbbbb45c1cab900c997575deef1d89ec9d3a985031f74b798c76a7332e'
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
