class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.13'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.13/github-nippou_v4.1.13_darwin_arm64.zip'
      sha256 '0afc5ceee5aea78e3bcc55f6481cc774b326bc810f3ff06a0dea90a1f5801ce7'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.13/github-nippou_v4.1.13_darwin_amd64.zip'
      sha256 '9abad74ad9265b79998c54fc5dc709e3870f6355f5ec32ae4b31f8c3db26ab97'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.13/github-nippou_v4.1.13_linux_amd64.zip'
      sha256 '70c19b650ff7c8e0d1e82a03d2de340833ccb701404b675cc4c69c16d67bac61'
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
