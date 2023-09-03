class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.2.1'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.1/github-nippou_v4.2.1_darwin_arm64.zip'
      sha256 '60cb30130882e4ede6c117d80c99a8121f40dd7a71dcae51efd7c548681a6f8a'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.1/github-nippou_v4.2.1_darwin_amd64.zip'
      sha256 '0d4c0ccac389418a3adb2ef6d3059bd409d663ec9c662929de75897b936cd516'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.1/github-nippou_v4.2.1_linux_amd64.zip'
      sha256 'a32d15d62b77fdfc288530fecf8bae8dbb1684a1a7628741cc8715d659829628'
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
