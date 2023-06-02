class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.17'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.17/github-nippou_v4.1.17_darwin_arm64.zip'
      sha256 'a552f06b129118999889ed33ca847769912ae07760a11485f87fd9be9854f117'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.17/github-nippou_v4.1.17_darwin_amd64.zip'
      sha256 '19c77109f7e71515d3f57add5e28c97ce460f2a024f10a48b4a26209b99f3fb9'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.17/github-nippou_v4.1.17_linux_amd64.zip'
      sha256 'cfa076afe649afc4131d5086122c5c1d6fb6ea4cde120d2d98ed34845a55f3e1'
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
