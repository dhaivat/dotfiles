;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.dotfiles/layers/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     html
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t)
     better-defaults
     emacs-lisp
     git
     markdown
     (org :variables
          org-enable-github-support t)
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     plantuml
     syntax-checking
     version-control
     go
     themes-megapack
     osx
     python
     mods
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      puml-mode
                                     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers "relative"
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all',
   ;; `trailing', `changed' or `nil'. Default is `changed' (cleanup whitespace
   ;; on changed lines) (default 'changed)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost any
user code here.  The exception is org related code, which should be placed in
`dotspacemacs/user-config'."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (load-file "~/.private.el")
  (setq org-plantuml-jar-path "/usr/local/lib/plantuml.jar")
  (setq helm-locate-fuzzy-match nil)
  (setq golden-ratio-mode t)
  (setq gofmt-command "goimports")
  (setq uniquify-buffer-name-style 'reverse)
  (setq helm-locate-command
        (case system-type
          ('gnu/linux "locate -i -r %s")
          ('berkeley-unix "locate -i %s")
          ('windows-nt "es %s")
          ('darwin "mdfind -name %s %s")
          (t "locate %s")))
  (setenv "WORKON_HOME"
          (concat
           (getenv "HOME")
           "/.venvs/webapp"))
  (set-default 'truncate-lines t)
  (setq golden-ratio-mode t)
  ;; Define the location of the file to hold tasks
  (setq org-default-notes-file (concat (getenv "HOME") "/Dropbox/todo-list.org"))

  ;; Define a kanban style set of stages for todo tasks
  (setq org-todo-keywords
        '((sequence "TODO" "DOING" "BLOCKED" "REVIEW" "|" "DONE" "ARCHIVED")))

  ;; Setting Colours (faces) for todo states to give clearer view of work
  (setq org-todo-keyword-faces
        '(("TODO" . org-warning)
          ("DOING" . "yellow")
          ("BLOCKED" . "red")
          ("REVIEW" . "orange")
          ("DONE" . "green")
          ("ARCHIVED" .  "blue")))

  ;; Progress Logging
  ;; When a TODO item enters DONE, add a CLOSED: property with current date-time stamp
  (setq org-log-done 'time)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-trello-current-prefix-keybinding "C-c o")
 '(package-selected-packages
   (quote
    (yapfify uuidgen py-isort pug-mode spinner ox-gfm osx-dictionary dash-functional request-deferred deferred org-projectile org alert log4e gntp org-download mwim live-py-mode link-hint parent-mode request haml-mode gitignore-mode git-link fringe-helper git-gutter+ epl flx eyebrowse evil-visual-mark-mode evil-unimpaired magit-popup evil-ediff anzu highlight eshell-z dumb-jump diminish darkokai-theme web-completion-data pos-tip column-enforce-mode bind-map bind-key yasnippet packed pythonic dash s avy async popup zenburn-theme ws-butler web-mode tao-theme spaceline persp-mode organic-green-theme org-plus-contrib open-junk-file omtose-phellack-theme neotree monokai-theme moe-theme material-theme leuven-theme indent-guide help-fns+ helm-themes helm-pydoc helm-projectile helm-descbinds helm-ag gruvbox-theme grandshell-theme google-translate evil-surround evil-search-highlight-persist evil-matchit evil-iedit-state iedit diff-hl darktooth-theme color-theme-sanityinc-tomorrow badwolf-theme ample-theme ace-link ace-jump-helm-line auto-complete anaconda-mode smartparens flycheck git-gutter go-mode company projectile helm helm-core markdown-mode magit git-commit with-editor hydra f package-build which-key evil spacemacs-theme zonokai-theme zen-and-art-theme xterm-color window-numbering volatile-highlights vi-tilde-fringe use-package undo-tree underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs rainbow-delimiters railscasts-theme quelpa pyvenv pytest pyenv-mode py-yapf purple-haze-theme puml-mode professional-theme powerline popwin planet-theme pkg-info pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme pcre2el pbcopy pastels-on-dark-theme paradox page-break-lines osx-trash orgit org-trello org-repo-todo org-present org-pomodoro org-bullets oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme multi-term move-text monochrome-theme molokai-theme mmm-mode minimal-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum linum-relative light-soap-theme less-css-mode launchctl jbeans-theme jazz-theme jade-mode ir-black-theme inkpot-theme info+ ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-swoop helm-mode-manager helm-make helm-gitignore helm-flx helm-css-scss helm-company helm-c-yasnippet hc-zenburn-theme gruber-darker-theme goto-chg gotham-theme golden-ratio go-eldoc gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ gh-md gandalf-theme flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-numbers evil-nerd-commenter evil-mc evil-magit evil-lisp-state evil-indent-plus evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu espresso-theme eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dracula-theme django-theme define-word darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-statistics company-quickhelp company-go company-anaconda colorsarenice-theme color-theme-sanityinc-solarized clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
