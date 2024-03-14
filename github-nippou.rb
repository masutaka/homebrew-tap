class GithubNippou < Formula
  desc "Print today's your GitHub activity for issues and pull requests"
  homepage 'https://github.com/masutaka/github-nippou'
  version '4.2.14'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.14/github-nippou_v4.2.14_darwin_arm64.zip'
      sha256 '1f6933bb3578dfc91ddce808315f91462c347fbf894f3765b18cd52e9c67856c'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.14/github-nippou_v4.2.14_darwin_amd64.zip'
      sha256 'f82ac3e4a4885c104c75b4a6c602bbe8d5f08889efcdf772ddff70a800f9a8f1'
    end
  end

  on_linux do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.14/github-nippou_v4.2.14_linux_arm64.zip'
      sha256 '8057a824baa6aca42151584f408087f39d4c0f591755eeddfd46609b2659a539'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.14/github-nippou_v4.2.14_linux_amd64.zip'
      sha256 '8331f9072c3aace480ea5eac6181bc601a837355c5c5d711f6c1bd89151b22cb'
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
