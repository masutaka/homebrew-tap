class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.2.9'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.9/github-nippou_v4.2.9_darwin_arm64.zip'
      sha256 '0b73c416b947b8e28d8282dfa1cad7069eefdd43583a1bde42ca146bfab3009e'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.9/github-nippou_v4.2.9_darwin_amd64.zip'
      sha256 'a0561ad69bcbf34ff89b1f80504e68a66fe8a5678f89602a4be2a55f2a4a89a0'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.9/github-nippou_v4.2.9_linux_amd64.zip'
      sha256 'c58e5df633cab1666d6877ecae51c2090e9ac28863b0aa555cc99b0bd7e5b363'
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
