class GithubNippou < Formula
  desc "Print today's your GitHub activity for issues and pull requests"
  homepage 'https://github.com/masutaka/github-nippou'
  version '4.2.18'
  license 'MIT'

  on_macos do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.18/github-nippou_v4.2.18_darwin_arm64.zip'
      sha256 '739ebcdc02adee10431cd0d3d4b13edb8494aecb30b03751d581ebc38b947285'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.18/github-nippou_v4.2.18_darwin_amd64.zip'
      sha256 'dc3212c253f8a962b5ba55c3f6392711890b06e69ce58822a83fd58954ca5838'
    end
  end

  on_linux do
    case
    when Hardware::CPU.arm?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.18/github-nippou_v4.2.18_linux_arm64.zip'
      sha256 'ab7747bc4d90d3bfe9e8c6a24696b31ab640ced24aafccc6a8832719ca905b78'
    when Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.2.18/github-nippou_v4.2.18_linux_amd64.zip'
      sha256 '7fef660390d94b54fb403d825e63ae6ecb34f707276b455846fcecbca0a76bd0'
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
