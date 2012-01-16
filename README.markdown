# .emacs.d

This emacs setup was bootstrapped with [techomancy's emacs-starter-kit](http://github.com/technomancy/emacs-starter-kit/).
It has been updated to use version 2 of the starter kit.

The goal of this project is to facilitate the sharing of a common emacs setup
within a company (or anyone really).  ELPA packages are the preferred way
to bring in dependencies but in many cases this is not possible so git submodules
or just committed files are used.  See the section on Structure for more details.

## Installation

You'll need Emacs 24, which comes with package.el. It's not hard to
compile [from source](http://github.com/emacsmirror/emacs), but
precompiled versions are readily available for
[Debian-based systems](http://emacs.naquadah.org/),
[Mac OS X](http://emacsformacosx.com/builds), and
[Windows](http://code.google.com/p/emacs-for-windows/updates/list).

Clone this project as `~/.emacs.d` and launch emacs!

## Structure and Sharing

The `init.el` file is where everything begins and is shared by everyone.
As such, this file should remain as general as possible and not include
user specific configuration at all.  Your user-specific-config should be
held in `your-user-name.el` and the Starter Kit will load it.  Additionally,
the Starter Kit also allows host-specific configuration by loading
`your-hostname.el`.  Emacs' "custom" library is configured to save it's
settings to `your-user-name-custom.el`.  The advantage of this is that it won't
clutter any of your regular configuration files. By naming it after your login
you can still commit it to a shared repo (if you want) so others can get
ideas from your customizations.

The main way to share various customizations and modes is via "initializers".
The `initializers.available` contains all the actual initializers.  An initializer
may install ELPA packages via the provided `ensure-packages-installed` function, or
append to the load-path code from the `vendor` path.  Either way, the
initializers should try to use `autoload` instead of `require` or `load.` The best
way to get an idea of what an initializer does is just to look at a few.  To enable
an initializer you need to add a corresponding symlink to it in `initializers.enabled`.
Upon startup all the initializers found in `initializers.enabled` will be loaded.
