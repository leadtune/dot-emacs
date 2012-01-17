# dot-emacs

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

Clone this project as `~/.emacs.d`, checkout the git submodules, and launch emacs!

## Structure and Sharing

The layout of your `.emacs.d` will look something like this:

    .emacs.d
    |-- init.el
    |-- initializers.available
    |   |-- some-framework.el
    |    -- some-language.el
    |   initializers.enabled
    |    -- some-language.el -> ../initializers.available/some-language.el
    |-- my-host-name.el (optional)
    |-- my-user-name
    |   |-- custom.el
    |   |-- my-super-config.el (optional)
    |    -- random-function.el (optional)
    |-- vendor
        |-- some-git-submodule
         -- some-shared-file.el
        
The `init.el` file is where everything begins and is shared by everyone.
As such, this file should remain as general as possible and not include
user specific configuration at all.  

The main way to share various customizations and modes is via "initializers".
The `initializers.available` contains all the actual initializers.  An initializer
may install ELPA packages via the provided `ensure-packages-installed` function, or
append to the load-path code from the `vendor` path.  Either way, the
initializers should try to use `autoload` instead of `require` or
`load` (unless it is bringing in an autoload file). The best
way to get an idea of what an initializer does is just to look at a few.  To enable
an initializer you need to add a corresponding symlink to it in `initializers.enabled`.
Upon startup all the initializers found in `initializers.enabled` will be loaded.

Your user-specific-config should be
held in either `~/.emacs.d/your-user-name.el` or in files located in
`~/.emacs.d/your-user-name`.  Additionally, the Starter Kit also
allows host-specific configuration by loading
`~/.emacs.d/your-hostname.el`. Emacs' "custom" library is configured to save its settings to
`~/.emcas.d/your-user-name/custom.el`. The advantage of this is that it won't
clutter any of your regular configuration files.  Having all of your
personal customizations namespaced by your login and hostnames allows
for easy sharing and keeping in sync with the main repository.
