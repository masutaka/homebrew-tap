class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.2.4'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.4/github-nippou_v4.2.4_darwin_arm64.zip'
      sha256 '7ac3527987aff66f976eb8c0068faad00d0e904be7073bcf18957dab27f892f6'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.4/github-nippou_v4.2.4_darwin_amd64.zip'
      sha256 'cf11ec4e749ff39ff292f4b45b1521e068a789b3f9e1532101b922044ac65247'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.4/github-nippou_v4.2.4_linux_amd64.zip'
      sha256 '4bd0154957ff21f392e8d782a81edb29c25f68e811920d1903cc24b9f5ddec4c'
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
