class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.2.8'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.8/github-nippou_v4.2.8_darwin_arm64.zip'
      sha256 'cba0a63df52c41ded6401f81976f56850f970b15c561417317ea8f35c04aa270'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.8/github-nippou_v4.2.8_darwin_amd64.zip'
      sha256 '8a8afc75c4bfa8cd3bd452775818eddd68a320e33c3fcfddfb27d59510cc4465'
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.8/github-nippou_v4.2.8_linux_amd64.zip'
      sha256 '9bb08fb7c07745c3c8e0fc313cb4fcf02fb936e645eced4e3f9bd0799368b50f'
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
