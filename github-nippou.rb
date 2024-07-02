class GithubNippou < Formula
  desc "Print today's your GitHub activity for issues and pull requests"
  homepage 'https://github.com/masutaka/github-nippou'
  version '4.2.24'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.24/github-nippou_v4.2.24_darwin_arm64.zip'
      sha256 '5b7e1cde764eb3e1e3b258b05861fe416c7ece1f588037e7d928e6bc57add057'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.24/github-nippou_v4.2.24_darwin_amd64.zip'
      sha256 'c9d800ded7827c67deb62df2405fc90ad1853a53a1c87ab6f61212cac3273b18'
    end
  end

  on_linux do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.24/github-nippou_v4.2.24_linux_arm64.zip'
      sha256 '1add559c5b8d95ffa0a29912d64dc4bfee0e03a900df98755465e44d812f37f8'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.24/github-nippou_v4.2.24_linux_amd64.zip'
      sha256 '15c9ff525743f041922fb25b182a8b2f90f514165a4babde8fbb1d6178c88d58'
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
