class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.21'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.21/github-nippou_v4.1.21_darwin_arm64.zip'
      sha256 '9872eabcd357d71cd2e40e640381b43840047ade88dc53988282d39da9b018e7'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.21/github-nippou_v4.1.21_darwin_amd64.zip'
      sha256 'f300f797f16ad8180890455b442d08b6f520a13c8e374f3fe3be42b45a4fd1c4'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.21/github-nippou_v4.1.21_linux_amd64.zip'
      sha256 '331ed3e88e7d72bd83446d7f13e392ecd2bee489fcbca1780f2c641e5f3cefdd'
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
