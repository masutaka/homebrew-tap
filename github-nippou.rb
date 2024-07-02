class GithubNippou < Formula
  desc "Print today's your GitHub activity for issues and pull requests"
  homepage 'https://github.com/masutaka/github-nippou'
  version '4.2.22'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.22/github-nippou_v4.2.22_darwin_arm64.zip'
      sha256 '39f40e45f5422de9c4da9ceb2a681dc8afdccfb3008af265b8c93ea46ce50ccf'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.22/github-nippou_v4.2.22_darwin_amd64.zip'
      sha256 'ac870db0f2f5ca53b3d5a98a3d223b5ecc72f6019d7e356efb39660764327363'
    end
  end

  on_linux do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.22/github-nippou_v4.2.22_linux_arm64.zip'
      sha256 '29f0ff7e443848adea202c99d4fd6c5caecf5bcd81a793385616edcbb583974e'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.22/github-nippou_v4.2.22_linux_amd64.zip'
      sha256 'c941cd8a44dc8bb2582674ae659a206b1cddc7e6965c36143b361cda617319fc'
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
