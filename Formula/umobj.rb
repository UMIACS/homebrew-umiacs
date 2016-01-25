class Umobj < Formula
  desc "Command-line utilties for S3-compatible Object Storage"
  homepage "https://gitlab.umiacs.umd.edu/staff/umobj"
  url "https://pypi.python.org/packages/source/u/umobj/umobj-1.3.4.tar.gz"
  sha256 "62dd2737a4aec3b42ee6f1d423449b9d5aba02d0a36c91bb944616a986158a2c"

  head "https://gitlab.umiacs.umd.edu/staff/umobj.git"

  bottle do
    root_url "https://obj.umiacs.umd.edu/homebrew-umiacs-bottles"
      cellar :any_skip_relocation
    sha256 "52b2bab374ad84f6a9a7694190d1a631d830945ce5e408bad08ddf98d67eadca" => :yosemite
  end

  depends_on :python if MacOS.version <= :snow_leopard

  resource "netaddr" do
    url "https://pypi.python.org/packages/source/n/netaddr/netaddr-0.7.15.tar.gz"
    sha256 "d5b5bb3f4e9a94f93d232bb876e567517d8fb59e5bebb5339483b44df5529d11"
  end

  resource "qav" do
    url "https://pypi.python.org/packages/source/q/qav/qav-0.3.2.tar.gz"
    sha256 "4e16d4544451f200689a2ae6908b14669f9f2a4a8881368d78e609196fbdee84"
  end

  resource "boto" do
    url "https://pypi.python.org/packages/source/b/boto/boto-2.38.0.tar.gz"
    sha256 "d9083f91e21df850c813b38358dc83df16d7f253180a1344ecfedce24213ecf2"
  end

  resource "filechunkio" do
    url "https://pypi.python.org/packages/source/f/filechunkio/filechunkio-1.6.tar.gz"
    sha256 "163948052cd274daddfcde9cec9cb5e04ac19d7bb91606cdc6a305b0428a0e70"
  end

  resource "progressbar" do
    url "https://pypi.python.org/packages/source/p/progressbar/progressbar-2.3.tar.gz"
    sha256 "b2d38a729785149e65323381d2e6fca0a5e9615a6d8bcf10bfa8adedfc481254"
  end

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python2.7/site-packages"
    %w[netaddr qav boto filechunkio progressbar].each do |r|
      resource(r).stage do
        system "python", *Language::Python.setup_install_args(libexec/"vendor")
      end
    end

    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
    system "python", *Language::Python.setup_install_args(libexec)

    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "#{bin}/lsobj", "--version"
    system "#{bin}/mkobj", "--version"
    system "#{bin}/cpobj", "--version"
    system "#{bin}/rmobj", "--version"
    system "#{bin}/chobj", "--version"
    system "#{bin}/catobj", "--version"
    system "#{bin}/syncobj", "--version"
  end
end
