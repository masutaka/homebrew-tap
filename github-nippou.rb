class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.18'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.18/github-nippou_v4.1.18_darwin_arm64.zip'
      sha256 'eaaeb55e1bb3672695a848e113208453c548e5b489eca9758b5222daf9e29cd6'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.18/github-nippou_v4.1.18_darwin_amd64.zip'
      sha256 'b7c6c6deb1b869dd3c2ae6a813f63d1e3169e6854592040ceabb53c158ec32c3'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.18/github-nippou_v4.1.18_linux_amd64.zip'
      sha256 'a05956a2c84247574fd9d1d45bbeea29655b6b8323b5601e3b8ec965bfaef4a6'
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
