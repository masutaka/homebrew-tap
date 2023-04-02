class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.15'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.15/github-nippou_v4.1.15_darwin_arm64.zip'
      sha256 '902152906e3559e35fc7a4df3cbb19d6dc6530ab09d72cf12d27e55832d3b21c'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.15/github-nippou_v4.1.15_darwin_amd64.zip'
      sha256 '6a49830e30f1287ba3bb5da3476b00e46db2016c1341dad8e93e8d3a02fd533b'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.15/github-nippou_v4.1.15_linux_amd64.zip'
      sha256 'a61265a224ba4a6b116b300cc3ad899656f3725a6112bb6edb8796b8237f7278'
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
