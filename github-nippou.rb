class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.2.7'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.7/github-nippou_v4.2.7_darwin_arm64.zip'
      sha256 'c7043537503f958c2967aa352c8615ab4fe527dac8eee858b51b00533c40917f'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.7/github-nippou_v4.2.7_darwin_amd64.zip'
      sha256 '46d5c30742525322ca04704e3c6aadda84f1b4adcaaea4a169f346dc25cb6feb'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.7/github-nippou_v4.2.7_linux_amd64.zip'
      sha256 '6cb9b7cc73d7d4006dd8adbb84f8ffc8739a3e3fdacd89dce7c9236c2b9d062d'
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
