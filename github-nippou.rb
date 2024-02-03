class GithubNippou < Formula
  desc "Print today's your GitHub activity for issues and pull requests"
  homepage 'https://github.com/masutaka/github-nippou'
  version '4.2.12'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.12/github-nippou_v4.2.12_darwin_arm64.zip'
      sha256 'b2874d18c8cf137f5475e9906c56491ef3640008756f2285a3aa068f72513bcd'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.12/github-nippou_v4.2.12_darwin_amd64.zip'
      sha256 'c716ea89ef005794707626cb5c70f85f6725fc0f2070a7e2771022288bf24650'
    end
  end

  on_linux do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.12/github-nippou_v4.2.12_linux_arm64.zip'
      sha256 '9e39e2bec3bd225d7e0541a9d36655c1a3125fafe3ca40a2a7a540a10780f381'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.12/github-nippou_v4.2.12_linux_amd64.zip'
      sha256 'c461d1837fb487bbe300143236e8bd3589f1a1fab94cd644e6b98ff839233bfe'
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
