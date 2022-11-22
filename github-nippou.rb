class GithubNippou < Formula
  desc "github-nippou prints today's your GitHub action"
  homepage 'https://github.com/masutaka/github-nippou'
  version 'v4.1.12'
  license 'MIT'

  on_macos do
    url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.12/github-nippou_v4.1.12_darwin_amd64.zip'
    sha256 '29a35a5cb02c6a600c114b800da5e5fb8c98a09f8f30334c08b93815390130f8'
  end

  on_linux do
    if Hardware::CPU.intel?
      url 'https://github.com/masutaka/github-nippou/releases/download/v4.1.12/github-nippou_v4.1.12_linux_amd64.zip'
      sha256 'ef8c4d592cf343c157440ab51c19291cf52a8aa7f1109bffb575a20c50b5d257'
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
