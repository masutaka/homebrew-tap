class GithubNippou < Formula
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.11'

  on_macos do
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.11/github-nippou_v4.1.11_darwin_amd64.zip'
    sha256 '2fee4c7ab15c3c55bd69e00eedd9c123b8986c7d05c88fc73c3eb7a238b2a991'
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.11/github-nippou_v4.1.11_linux_amd64.zip'
      sha256 'c8f0c178ac6b53b9d774d06b0a40bf363bb45f8090bbb90cb5cf6fa5024afbb8'
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
