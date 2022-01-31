 (defun dotspacemacs/layers ()
  "Layer configuration:
   This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; emacs for writing : https://out-of-cheese-error.netlify.app/spacemacs-config
     ;; Org-kanban
     ;; org-noter ;; (annotating pdf) https://github.com/weirdNox/org-noter/tree/9ead81d42dd4dd5074782d239b2efddf9b8b7b3d
     ;; nov.el https://github.com/wasamasa/nov.el/tree/fa3887970ebde430aaf8a39dbf801566238c0973
     ;; wc mode ;; count words, displays in modeline
     ;; https://github.com/mhayashi1120/Emacs-langtool/
     ;;
     ;; pop up frame ;; https://github.com/muffinmad/emacs-mini-frame#emacs-mini-frame
     ;;
     ;; javascript
     ;; php
     ;; lua
     ;; html
     ;; git
     ;; markdown
     ;; version-control
     ;; treemacs
     ;; python
     ;;
     ranger
     search-engine ;; https://develop.spacemacs.org/layers/+web-services/search-engine/README.html
     helpful ;; This layer replaces the existing emacs related help buffers with more detailed ones.
     ;; (tabs :variables
     ;;       tabs-auto-hide t
     ;;       tabs-auto-hide-delay 3
     ;;       )
     emacs-lisp
     spacemacs-defaults ;; better defaults for naitive emacs pkgs
     spacemacs-editing
     spacemacs-editing-visual
     spacemacs-language ;; adds define-word , google-translate
     (nixos :variables
            nixos-format-on-save t
            )
     fzf ;; git clone git@github.com:ashyisme/fzf-spacemacs-layer.git ~/.emacs.d/private/fzf
     (helm :variables
           spacemacs-helm-rg-max-column-number 1024
           )

     (syntax-checking :variables
                      syntax-checking-enable-tooltips t ;; nil
                      syntax-checking-enable-by-default t ;; nil
                      syntax-checking-auto-hide-tooltips nil ;;
                      )
     (deft :variables
           deft-zetteldeft t
           )

     (org :variables
          org-enable-roam-support t
          org-want-todo-bindings t
          ;; get ;; Insertion of images via org-download

          )
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            )
     ;; (multiple-cursors :variables
     ;;                   multiple-cursors-backend 'evil-mc)
     ;; exwm , first git clone exwm repo first https://github.com/timor/spacemacsOS/tree/d8ce7d6c8fab42bffeb157f850a36b258f6a8934
     ;; (elfeed :variables ;; https://github.com/remyhonig/elfeed-org/tree/77b6bbf222487809813de260447d31c4c59902c9
     ;;         rmh-elfeed-org-files (list "C:/Users/chris/dropbox/orgFiles/rss.org")
     ;;         elfeed-enable-web-interface t
     ;;         elfeed-enable-goodies nil
     ;;         elfeed-feeds '(
     ;;                        ;("" london futurists)
     ;;                        ;("http://www.50ply.com/atom.xml" )  ; no autotagging
     ;;                         ))
     ;; twitter                           ;  ; nitter . twitter rss feed
     ;; lsp
     djvu
     epub
     pdf
     ;; real time latex in org ;; https://github.com/yangsheng6810/org-latex-impatient/tree/39f22dc98cb8268af67c6df71778ec5784d2b683
     (latex :variables ;; latex-extra, latex-unicode-math-mode, cdlatex, auctex, bibtex
            latex-backen 'company-auctex ;; default='company-auctex nil 'lsp (if lsp layer) 'company-auctex
            latex-build-command 'latex ;; 'latex 'latexmk
            latex-build-engine 'default ;; - 'default - 'luatex - 'omega - 'xetex
            latex-enable-auto-fil t ;; default=t nil
            latex-enable-folding nil ;; default=nil t 'tex-fold-mode
            latex-refresh-preview nil ;; default=nil t
            latex-enable-magic nil ;; default=nil
            latex-view-with-pdf-tools	nil ;; default=t (only works if pdf layer installed)
           ; latex-nofill-en
           ; magic-latex-enable-block-highlight t ;; show font properties like \large
           ; magic-latex-enable-block-align t ;; reflect block alignment such as \center (default nil)
           ; magic-latex-enable-pretty-symbols t ;; substitute symbols in place of code, e.g. greek letters (default t)
           ; magic-latex-enable-suscript  t ;; how subscripts and superscripts (default t)
           ; magic-latex-enable-inline-image t ;; show images inline (default nil)
            )
     (spell-checking :variables
                     enable-flyspell-auto-completion nil
                     spell-checking-enable-auto-dictionary t
                     spell-checking-enable-by-default nil ;; major mode SPC t S
                     ;; use aspell, it makes better suggestions
                     ;; back up own dictionary
                     ;; writing: proselint in flychec
                     )
;;   (auto-completion :variables
;;                    ;;auto-completion-return-key-behavior 'complete
;;                    auto-completion-tab-key-behavior 'complete ;; cycle
;;                    auto-completion-complete-with-key-sequence nil ;; burst of 2 keys is hotstring
;;                    ;;auto-completion-complete-with-key-sequence-delay 0.1
;;                    auto-completion-idle-delay 0.5
;;                    auto-completion-private-snippets-directory nil
;;                    auto-completion-enable-snippets-in-popup t ;; shows snippets in popup
;;                    auto-completion-enable-help-tooltip t ;; t=auto , 'manual , press M-h
;;                    auto-completion-enable-sort-by-usage t
;;                    ;;spacemacs-default-company-backends '(company-files company-capf) ;; add completion frameworks per mode basis
;;                    )
     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(beacon delight dim org-bullets visual-fill-column google-this smart-mode-line mini-modeline powerthesaurus)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(spaceline smartparens evil-escape)

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5



   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner nil

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   ;; (recents . 5) (projects . 7)
   dotspacemacs-startup-lists '()

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'org-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent t

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(adwaita gruvbox grandshell)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   ;; spacemacs :separator arrow :separator-scale 1.2
   dotspacemacs-mode-line-theme '(custom)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Pragmata Pro Mono" :size 12.0)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names t

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 500

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.5

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols nil

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling nil

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "emacs"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)

;; SAVE WINDOW AND RESTORES  WHEN REOPENING SPACEMACS ____________________________________
(defun save-framegeometry ()
  "Gets the current frame's geometry and saves to ~/.emacs.d/framegeometry."
  (let (
        (framegeometry-left (frame-parameter (selected-frame) 'left))
        (framegeometry-top (frame-parameter (selected-frame) 'top))
        (framegeometry-width (frame-parameter (selected-frame) 'width))
        (framegeometry-height (frame-parameter (selected-frame) 'height))
        (framegeometry-file (expand-file-name "~/.emacs.d/framegeometry")))

    (when (not (number-or-marker-p framegeometry-left))
      (setq framegeometry-left 0))
    (when (not (number-or-marker-p framegeometry-top))
      (setq framegeometry-top 0))
    (when (not (number-or-marker-p framegeometry-width))
      (setq framegeometry-width 0))
    (when (not (number-or-marker-p framegeometry-height))
      (setq framegeometry-height 0))

    (with-temp-buffer
      (insert
       ";;; This is the previous emacs frame's geometry.\n"
       ";;; Last generated " (current-time-string) ".\n"
       "(setq initial-frame-alist\n"
       "      '(\n"
       (format "        (top . %d)\n" (max framegeometry-top 0))
       (format "        (left . %d)\n" (max framegeometry-left 0))
       (format "        (width . %d)\n" (max framegeometry-width 0))
       (format "        (height . %d)))\n" (max framegeometry-height 0)))
      (when (file-writable-p framegeometry-file)
        (write-file framegeometry-file)))))

;;  SAVE WINDOW AND RESTORES WHEN REOPENING SPACEMACS ____________________________________
(defun load-framegeometry ()
  "Loads ~/.emacs.d/framegeometry which should load the previous frame's geometry."
  (let ((framegeometry-file (expand-file-name "~/.emacs.d/framegeometry")))
    (when (file-readable-p framegeometry-file)
      (load-file framegeometry-file)))))

(defun dotspacemacs/user-init ()
  "Initialization for user code: This function is called immediately after `dotspacemacs/init', before layer configuration. It is mostly for variables that should be set before packages are loaded. If you are unsure, try setting them in `dotspacemacs/user-config' first."

  (defun my-horizontal-recenter ()
    "make the point horizontally centered in the window"
    (interactive)
    (let ((mid (/ (window-width) 2))
          (line-len (save-excursion (end-of-line) (current-column)))
          (cur (current-column)))
      (if (< mid cur)
          (set-window-hscroll (selected-window)
                              (- cur mid)))))

  (if window-system ;; Restore Frame size and location, if we are using gui emacs
      (progn
        (add-hook 'after-init-hook 'load-framegeometry)
        (add-hook 'kill-emacs-hook 'save-framegeometry))))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first.")

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."


  (setq deft-directory "~/4 write/orgFiles")

;; IMAGES ________________________________________________________________________
;;  (use-package image+
;;                                        ;    :load-path "~/elisp/Emacs-imagex"
;;    :commands (imagex-global-sticky-mode imagex-auto-adjust-mode)
;;    :init (progn (imagex-global-sticky-mode) (imagex-auto-adjust-mode)))

;; ORG-MODE ________________________________________________________________________

(with-eval-after-load 'org
  ;; here goes your Org config to not conflict with org shipped w vanilla emacs  :)

  (setq org-todo-keywords
        '((sequence "TODO(t)" "|" "DONE(d)")
          (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
          (sequence "|" "CANCELED(c)")))
  ;;    (setq org-todo-keywords
  ;;          '((sequence "TODO" "PRO" "VERIFY" "|" "DONE" "DELEGATED")))
  ;;
  ;;    (setq org-todo-keyword-faces
  ;;          '(("TODO" . org-warning) ("STARTED" . "yellow")
  ;;            ("CANCELED" . (:foreground "blue" :weight bold))))
    (prefer-coding-system       'utf-8)
    (set-default-coding-systems 'utf-8)
    (set-terminal-coding-system 'utf-8)
    (set-keyboard-coding-system 'utf-8)
    (set-language-environment 'utf-8)
    (setq default-buffer-file-coding-system 'utf-8)
    (setq locale-coding-system 'utf-8)
    (setq org-pretty-entities t)
    (setq org-startup-with-inline-images t)
    (setq org-superstar-headline-bullets-list '("★" "☄" "⎔" "⍟" "◉" "◎" "◼" "◻" "▲" "△" "◆" "◇" "▶" "⚡"))
    (setq org-ellipsis " ↓")
    (set-face-underline 'org-ellipsis nil) ;; otherwise a ugly underline will be under ↓
    (setq org-hide-emphasis-markers t)
    (setq org-startup-folded t)
    (setq org-image-actual-width nil)
    (setq org-toggle-inline-images t)
    ;;(spaceline-toggle-org-clock-on)
    ;;(add-hook 'org-mode 'visual-line-mode)
    ;;(setq org-hierarchical-todo-statistics t)

    (defun my/org-checkbox-todo ()
      "Switch header TODO state to DONE when all checkboxes are ticked, to TODO otherwise"
      (let ((todo-state (org-get-todo-state)) beg end)
        (unless (not todo-state)
          (save-excursion
            (org-back-to-heading t)
            (setq beg (point))
            (end-of-line)
            (setq end (point))
            (goto-char beg)
            (if (re-search-forward "\\[\\([0-9]*%\\)\\]\\|\\[\\([0-9]*\\)/\\([0-9]*\\)\\]"
                                   end t)
                (if (match-end 1)
                    (if (equal (match-string 1) "100%")
                        (unless (string-equal todo-state "DONE")
                          (org-todo 'done))
                      (unless (string-equal todo-state "TODO")
                        (org-todo 'todo)))
                  (if (and (> (match-end 2) (match-beginning 2))
                           (equal (match-string 2) (match-string 3)))
                      (unless (string-equal todo-state "DONE")
                        (org-todo 'done))
                    (unless (string-equal todo-state "TODO")
                      (org-todo 'todo)))))))))
    (add-hook 'org-checkbox-statistics-hook 'my/org-checkbox-todo))

;; LATEX BIBTEX ________________________________________________________________________

 (require 'tex)
 (TeX-global-PDF-mode t)
 (setq TeX-PDF-mode t)
 (setq TeX-source-correlate-mode t)
 (setq TeX-source-correlate-method 'synctex)

;;;; (add-hook 'LaTeX-mode-hook
;;;;           (lambda ()
;;;;             ;;(assq-delete-all 'output-pdf TeX-view-program-selection)
;;;;             (add-to-list 'TeX-view-program-selection '(output-pdf "SumatraPDF"))))
;;;; (setq TeX-view-program-selection '(output-pdf "SumatraPDF"))
;; (setq TeX-view-program-list
;;       '(("SumatraPDF"
;;          (""C:\Users\chris\AppData\Local\SumatraPDF\SumatraPDF.exe" -reuse-instance" (mode-io-correlate " -forward-search %b %n ")
;;           " %o"))))
;;
;; (server-start)
;; ;;  If you want to make AUCTeX aware of style files and multi-file documents right away, insert the following in your ‘.emacs’ file.
;; (setq TeX-save-query nil)
 (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
 (add-hook 'LaTeX-mode-hook 'visual-line-mode)
 (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode) ; turn on math-mode by default

;; ;;(setq-default TeX-master nil)

;; (setq reftex-file-extensions
;;       '(("nw" "tex" ".tex" ".ltx") ("bib" ".bib")))
;; (setq TeX-file-extensions
;;       '( "nw" "tex" "sty" "cls" "ltx" "texi" "texinfo"))

;; ;; So that RefTeX finds my bibliography
;; (setq reftex-default-bibliography '("c:/Users/chris/Dropbox/latexFiles/ref"))

;; ;; So that RefTeX also recognizes \bibliography{Ref.bib} , \addbibresource{Ref.bib} , \addbibresource{Ref.bib}.
;; (setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))

;; ;; Turn on RefTeX in AUCTeX
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; ;; interface between RefTeX and AUCTeX, Instead of using RefTeX's commands directly, you can then also use them indirectly as part of the AUCTeX environment
;; (setq reftex-plug-into-AUCTeX t)
;;
;;;; (setenv "PATH" (concat (getenv "PATH") "e:/Program Files/MiKTeX 2.9/miktex/bin/x64"))
;;;; (setq exec-path (append exec-path '("e:/Program Files/MiKTeX 2.9/miktex/bin/x64")))

;; NIXOS ________________________________________________________________________

 (require 'nix-mode)
 (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
 (use-package nix-mode
   :mode "\\.nix\\'")

; OTHER ________________________________________________________________________

 (setq ns-pop-up-frames nil)
 (require 'google-this)
 ;;(require 'powerthesarus) ;; broke emacs
 ;(google-this-mode 1)
 ; Setting and showing the 80-character column width
 ;(toggle-fill-column-indicator 1)
 ;(set-fill-column 80)
 ;; (auto-fill-mode t)
 ;;(toggle-truncate-lines 1)
 ;; (spacemacs/toggle-golden-ratio-on)

;; (with-eval-after-load 'visual-fill-column
;;   (add-hook 'visual-fill-column-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
;;   (setq split-window-preferred-function 'visual-fill-column-split-window-sensibly)
;;   (advice-add 'text-scale-adjust :after 'visual-fill-column-adjust))

 ;; (require 'tablist)
 ;; (add-hook 'doc-view-mode-hook 'auto-revert-mode)
 ;; (setq spacemacs/toggle-auto-fill-mode-on)
 ;; (setq spacemacs/toggle-truncate-lines-on)
 ;; (add-hook 'hack-local-variables-hook (lambda () (setq truncate-lines t)))

 ;;(set-fontset-font t nil (font-spec :size 20 :name "Cambria Math")) ; Unsuported glyps are rendered in this font
 ;;(set-fontset-font t nil (font-spec :size 20 :name "Unifont"))
 ;;(set-fontset-font t nil (font-spec :size 20 :name "Symbola"))

 ;; THEME ________________________________________________________________________
 ;;(beacon-mode 1)
 (setq-default evil-insert-state-cursor '(box "#66cd00")) ; "chartreuse3"
 (setq-default cursor-type 'Box)

 "Sets the hl-line face to have no foregorund and a background that is 10% darker than the default face's background."
 (require 'color)
 (defun set-hl-line-color-based-on-theme ()
   (set-face-attribute 'hl-line nil
                       :foreground nil
                       :background (color-darken-name (face-background 'default) 10)))
 (add-hook 'global-hl-line-mode-hook 'set-hl-line-color-based-on-theme)

 ;;(set-face-background 'hl-line "#FFF3D9") ; #3e4446 #505050
 ;;(evil-normal-state-cursor ' (box "#000000")) ; black
 ; (set-face-background 'hl-line "#FFF3D9") ; #3e4446 #505050
 ;; (spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)

 (custom-set-faces
  '(company-tooltip-common
    ((t (:inherit company-tooltip :weight bold :underline nil))))
  '(company-tooltip-common-selection
    ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))

; (set-face-attribute 'hl-line nil :inherit nil :background "gray80") ;; highlight line with the cursor, preserving the colours.;; highlight line with the cursor, preserving the colours.;; highlight line with the cursor, preserving the colours.;; highlight line with the cursor, preserving the colours.
; (global-hl-line-mode 1)

  (require 'dim) ;; this has to be loaded before sml
  (dim-major-names '(
     (emacs-lisp-mode " λ" elisp-mode)
     ;(inferior-emacs-lisp-mode  " ⋘λ")
    ; (calendar-mode " cal" calendar)
    ; (ahk-mode " ahk" ahk-mode)
     ))
  (dim-minor-names
   '(
     (anzu-mode " ᵃⁿᶻ" anzu)
     (elisp-slime-nav-mode "" elisp-slime-nav)
     (which-key-mode " ʷₖ" which-key)
     (google-this-mode " g" google-this)
     (projectile-mode " ⌒" projectile)
     (company-mode " c" company)
     (helm-mode " ℎ" helm-mode)
     (undo-tree-mode " ←" undo-tree)
     (auto-highlight-symbol-mode "" auto-highlight-symbol)
     (hs-minor-mode "" hideshow)
     ;(smartparens-mode "" smartparens)
     ;(highligt-parenthesis-mode "" highlight-parentheses)
     (yas-minor-mode " ʸᵃˢ" yasnippet)
     (golden-ratio-mode " ¹φ⁶" golden-ratio)
     (google-this-mode " g" google-this)
     (page-break-lines-mode "" page-break-lines)
     (evil-org-mode "" evil-org)
     (follow-mode " ⇔" follow)
     (purpose-mode ""window-purpose)
     (persp-mode " #" persp-mode)
     (editorconfig-mode " ᶜᵒⁿᶠ" editorconfig)
     (visual-line-mode   " ↩" simple)
     (auto-fill-function " ↵" simple)
     (eldoc-mode  ""    eldoc)
     (whitespace-mode    " ·"  whitespace)
     ;(paredit-mode       " (" paredit)
     ))
  (setq sml/no-confirm-load-theme t)
  (setq size-indication-mode t)
  (require 'smart-mode-line)
  (sml/setup)
  ;; (setq powerline-arrow-shape 'curve)
  ;; (setq powerline-default-separator-dir '(right . left))
  ;; (setq sml/theme 'powerline)
;;  (setq sml/no-confirm-load-theme t)
;;  (sml/setup)
;;  (setq sml/replacer-regexp-list '((".+" "")))
;;  (setq sml/theme 'dark)

  ;;  ;; I'm activating mini-modeline after smart-mode-line
  ;;  (use-package mini-modeline
  ;;    :quelpa (mini-modeline :repo "kiennq/emacs-mini-modeline" :fetcher github)
  ;;    :after smart-mode-line
  ;;    :config
  ;;    )
    (require 'mini-modeline)
    ;;(setq mini-modeline-mode t)
    (mini-modeline-mode 1)

  ;;  (sml/show-frame-identification nil)
  ;;(add-to-list 'sml/replacer-regexp-list '("C:/users/chris/Dropbox/orgFiles/" ":orgFiles:") t)
  ;;(add-to-list 'sml/replacer-regexp-list '("C:/users/chris/Dropbox/ahkFiles/" ":ahkFiles:") t)
  ;;(add-to-list 'sml/replacer-regexp-list '("C:/users/chris/Dropbox/nixFiles/" ":nixFiles:") t)
  ;;(add-to-list 'sml/replacer-regexp-list '("C:/users/chris/Dropbox/latexFiles/" ":texFiles:") t)
  ;;(add-to-list 'sml/replacer-regexp-list '("C:/users/chris/Dropbox/" ":db:") t)
  ;;(add-to-list 'sml/replacer-regexp-list '("C:/users/chris/google drive/" ":gd:") t)


  ;;(setq ns-pop-up-frames nil) ;; ¬open new instance of emacs with ‘open with...’
  ;;(custom-set-variables '(pop-up-frames nil))
  ;;(add-to-list 'display-buffer-alist
  ;;            '("^[^\\*].*[^\\*]$" display-buffer-same-window) t)
  ;; (spaceline-workspace-numbers-unicode t)
  ;; (spaceline-window-numbers-unicode t)

;; USER BINDINGS ________________________________________________________________________

  ;; wanting tab to behave properly, but no
;;  (setq-default indent-tabs-mode nil)
;;  (setq-default tab-width 4)
;;  (setq indent-line-function 'insert-tab)

  (spacemacs/declare-prefix "o" "custom")
  (spacemacs/set-leader-keys "or" 'recover-this-file)
  (spacemacs/set-leader-keys "og" 'helm-google-suggest)
  (spacemacs/set-leader-keys "on" 'google-this-noconfirm)
  (spacemacs/set-leader-keys "ov" 'visual-line-mode)
  ;; (spacemacs/set-leader-keys "oc" 'my-horizontal-recenter)
  (spacemacs/set-leader-keys "op" 'spacemacs/org-agenda-transient-state/org-agenda-priority)
  (global-set-key (kbd "C-S-l") 'my-horizontal-recenter)
  ;(global-set-key (kbd "M-,") 'comment-dwim)
  ;; (global-set-key (kbd "C-c C-c") 'google-this-word) ; ¬in org, needs to be unbound first?
  ;;(global-set-key (kbd "backTAB") 'hippie-expand) ;; makes yas expand with s-tab

  ; Revert vim-surround's `s' and `S' to act like Vim defaults
  ;(evil-define-key 'visual evil-surround-mode-map "s" 'evil-substitute)
  ;(evil-define-key 'visual evil-surround-mode-map "S" 'evil-surround-region)


  ;; Multiple cursors
  ;; (evil-define-key 'normal global-map (kbd "") 'mc/mark-next-like-this)
  ;; (evil-define-key 'normal global-map (kbd "") 'mc/mark-previous-like-this)
  ;; (evil-define-key 'normal global-map (kbd "") 'mc/mark-all-like-this)
  ;; EDITING ________________________________________________________________________
  ;; (autoload 'enable-paredit-mode "paredit")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))
 '(package-selected-packages
   '(mini-modeline ranger nov esxml kv engine-mode djvu3 djvu zetteldeft helpful elisp-refs flycheck-pos-tip deft centaur-tabs pdf-view-restore pdf-tools tablist math-symbol-lists auctex fzf powerthesaurus elfeed-org elfeed-goodies ace-jump-mode noflet elfeed web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode prettier-js impatient-mode simple-httpd helm-css-scss haml-mode emmet-mode counsel-css company-web web-completion-data add-node-modules-path yapfify stickyfunc-enhance sphinx-doc pytest pyenv-mode pydoc py-isort poetry transient pippel pipenv pyvenv pip-requirements nose lsp-python-ms lsp-pyright live-py-mode importmagic epc ctable concurrent deferred helm-pydoc helm-gtags helm-cscope xcscope ggtags dap-mode lsp-treemacs bui lsp-mode markdown-mode cython-mode counsel-gtags counsel swiper ivy company-anaconda blacken anaconda-mode pythonic persistent-scratch unfill mwim flyspell-popup flyspell-correct-helm flyspell-correct auto-dictionary yasnippet-snippets helm-company helm-c-yasnippet fuzzy company-statistics company-quickhelp pos-tip company-nixos-options company auto-yasnippet yasnippet ac-ispell auto-complete org-rich-yank org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-contrib org-cliplink htmlize helm-org-rifle gnuplot evil-org ws-butler writeroom-mode visual-fill-column winum volatile-highlights vi-tilde-fringe uuidgen undo-tree treemacs-projectile treemacs-persp treemacs-icons-dired treemacs-evil treemacs cfrs pfuture posframe toc-org symon symbol-overlay string-inflection string-edit spaceline-all-the-icons memoize all-the-icons spaceline powerline restart-emacs request rainbow-delimiters quickrun popwin persp-mode password-generator paradox spinner overseer org-superstar open-junk-file nameless multi-line shut-up macrostep lorem-ipsum link-hint inspector info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-xref helm-themes helm-swoop helm-purpose window-purpose imenu-list helm-projectile helm-org helm-mode-manager helm-make helm-ls-git helm-flx helm-descbinds helm-ag google-translate golden-ratio flycheck-package package-lint flycheck pkg-info epl flycheck-elsa flx-ido flx fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired f evil-tutor evil-textobj-line evil-surround evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-easymotion evil-collection annalist evil-cleverparens smartparens evil-args evil-anzu anzu eval-sexp-fu emr iedit clang-format projectile paredit list-utils elisp-slime-nav editorconfig dumb-jump s drag-stuff dired-quick-sort define-word column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol ht dash auto-compile packed aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core popup which-key use-package pcre2el hydra lv hybrid-mode font-lock+ evil goto-chg dotenv-mode diminish bind-map bind-key async))
 '(warning-suppress-types '(((evil-collection)) ((evil-collection)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
