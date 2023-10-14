class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.2.3'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.3/github-nippou_v4.2.3_darwin_arm64.zip'
      sha256 '27dcbf1d65d43bb0ead03e1ce456c0bb27c4c83d42788262675b06f80d06e388'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.3/github-nippou_v4.2.3_darwin_amd64.zip'
      sha256 '7a3c9571452664b592da5376a4299ccd4a507254d3c5d1c9ccaf22e24d5024dc'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.3/github-nippou_v4.2.3_linux_amd64.zip'
      sha256 '3b95225e83bb390f04c27ca4f4ab3be50830cb9a83cdd37de87b54d111cd1c44'
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
