class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.16'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.16/github-nippou_v4.1.16_darwin_arm64.zip'
      sha256 'b0546a8ade48f5a3f12c51ce91634d2745ac0482a609997f4507a2402ed72dc8'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.16/github-nippou_v4.1.16_darwin_amd64.zip'
      sha256 '3503227e6ecd044441742f0e911524c55473600f913c2122f2affc2a56e394d5'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.16/github-nippou_v4.1.16_linux_amd64.zip'
      sha256 '1bb5b001eaa17a30f409a28f23a3d8453125fab1e9729710e1478a10bddc9ccf'
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
