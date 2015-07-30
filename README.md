# UMIACS Homebrew Tap

A [Homebrew](http://brew.sh)
[Tap](https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/brew-tap.md)
to host [UMIACS](http://www.umiacs.umd.edu) packages that do not meet the
[Acceptable Formulae](https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Acceptable-Formulae.md)
specification due to project age on Github or popularity.

**Table of Contents**

- [UMIACS Homebrew Tap](#umiacs-homebrew-tap)
    - [Quick Start](#quick-start)
    - [Why?](#why)
    - [Contributing Formulae](#contributing-formulae)
    - [Formulae on GitHub](#formulae-on-github)


## Quick Start

Once [Homebrew](http://brew.sh) is installed,
```bash
brew tap ibeekman/homebrew-umiacs git@gitlab.umiacs.umd.edu:ibeekman/homebrew-umiacs.git
```
to add the
UMIACS tap to your Homebrew. If you no longer  want to get updated
UMIACS tap formulae:

```bash
brew untap ibeekman/homebrew-umiacs
```

Please
note that this will not remove any installed packages. To accomplish
that you should run

```bash
brew rm <package_name>
```

When ready to install a formula from the UMIACS tap, prepend the
formula name with `ibeekman/umiacs`. For example, to install UMObj
[command line tools](https://gitlab.umiacs.umd.edu/staff/umobj/tree/master)
for working with
[UMIACS object store](https://obj.umiacs.umd.edu/obj/help) buckets,
run
```bash
brew install ibeekman/umiacs/umobj
```

After the UMIACS tap has been added, running `brew update` will fetch
any new or outdated formulae from the UMIACS tap, along with the
default Homebrew repository and any other taps you have added.

## Why?

This tap is maintained to allow users to easily install UMIACS
packages with Homebrew on Mac OSX. The [Homebrew](http://brew.sh)
[Acceptable Formulae](https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Acceptable-Formulae.md)
specification takes some work to meet. However, the largest impediment
to getting new Formulae added to the Homebrew repository is the
[significance and popularity requirement](https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Acce
ptable-Formulae.md).
Because most UMIACS projects are probably hosted on
[UMIACS GitLab](https://wiki.umiacs.umd.edu/umiacs/index.php/GitLab)
and only *mirrored* (at best) on [GitHub](https://github.com), it is
unlikely that they will garner the number of stars, watchers and forks
required by
```bash
brew audit --strict --online <formula-name>
```
Without
passing this automated "popularity contest" the very busy Homebrew
maintainers would need some other compelling argument to make an
exception and let the package in.

However, tools that are useful to others outside of UMIACS are good
candidates to be added to the
[main homebrew repository](https://github.com/homebrew/homebrew). Maintainers
and authors of these tools should consider mirroring or hosting their
projects on GitHub so that they become more visible and can be
candidates for addition to the official repository of Homebrew
Formulae. Please see the list below of UMIACS projects with Homebrew
formulae that are hosted on [GitHub](https://github.com), and consider
watching and staring them.

## Contributing Formulae

Please follow the same
[formula guidelines](https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Acceptable-Formulae.md)
and
[formula cookbook](https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md)
as posted in Homebrew's documentation. Furthermore, please consult
[how to open a Homebrew pull request (and get it merged)](https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/How-To-Open-a-Homebrew-Pull-Request-(and-get-it-merged).md)
for tips on writing good merge/pull requests and for considerations
should the formula be a candidate to add to the master Homebrew
repository. Of course, some of the eligibility/popularity
requirements will be relaxed, but make sure you formulae are clean,
and contain `test do` blocks, ideally with meaningful tests. (i.e.,
something better than `tool --help` or `tool --version` to test the
the software was installed and is minimally functional.)

To contribute a new formula to this tap, or to update an existing one,
start by
[forking this repository](https://gitlab.umiacs.umd.edu/ibeekman/homebrew-umiacs/fork/new)
(UMIACS users/staff only). To get up and running you can use the `brew
create` command after learning about it from the Homebrew
documentation.
```bash
brew create  <URL>
```
creates a Formula stub which is
mostly accurate from the package download URL on github. If the
package is python based, it is only a candidate for a Homebrew formula
if it is a program/app/executable. Libraries and Frameworks should be
put up on
[PyPi](https://python-packaging-user-guide.readthedocs.org/en/latest/)
instead. If the formula being added is for a Python package, please
start by creating a PyPi package, installing the latest version of the
package--from PyPi via:
```bash
pip install --upgrade <package_name>
```
and then use
[homebrew_python_poet](https://github.com/tdsmith/homebrew-pypi-poet/blob/master/poet/poet.py)
to create a Homebrew formula stub. PyPi-Poet is
[available on PyPi](https://pypi.python.org/pypi/homebrew-pypi-poet/0.5.0)
and can easily be installed with
```bash
pip install --upgrade homebrew_pypi_poet
```
Once both PyPi-poet and your formula are
installed using `pip`, run
```bash
poet -f <your_formula_name> > <your_formula_name.rb>
```
to create a Homebrew formula stub for a Python
app. For more info on Homebrew and Python, read [Homebrew's
documentation of the subject](https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Python-for-Formula-Authors.md).

## Formulae on Github

 1. [UMObj](https://gitlab.umiacs.umd.edu/staff/umobj/tree/master) |
    [GitHub page](https://github.com/UMIACS/umobj)

## Formulae only on GitLab

*none*
