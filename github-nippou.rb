class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.19'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.19/github-nippou_v4.1.19_darwin_arm64.zip'
      sha256 '5b673122ff2c0df9e19df45bc15e833307ebd8c7590fc2fecaa990c5f8456ac3'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.19/github-nippou_v4.1.19_darwin_amd64.zip'
      sha256 '8f1eafd727e42edea0f1748d06edac9a03084fa291f815ea4b727cd26130d65c'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.19/github-nippou_v4.1.19_linux_amd64.zip'
      sha256 '03679499f72d40c1b4d59d0db471b592927a6302da608fefd10024ef1e1a2351'
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
