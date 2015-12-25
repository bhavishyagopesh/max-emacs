;;; init.el --- Main load file for emacs
;;; Commentary: No longer do I keep a ~/.emacs file.

;;; Code:

;; Add Emacs subdirectories to load path
(setq main-src-path (concat user-emacs-directory "lib"))
(add-to-list 'load-path main-src-path)

;; Load basic tweaks file
(require 'settings.el)

;; Load custom functions
(require 'functions.el)

;; Load keybindings
(require 'keybindings.el)

;; Load settings for package manager and package list
(require 'package-management.el)

;; Installed packages settings
(require 'installed-settings.el)

;; Load appearance file
(require 'appearance.el)

;; Set up use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(setq inhibit-default-init t)

;; Language specific files
(use-package haskell-init :load-path "langs/")
(use-package tex-init     :load-path "langs/")
(use-package mode-line    :load-path "lib/")
(use-package helm-init    :load-path "lib/")

;; =========================
;; =========================
;; Package specific settings
;; =========================
;; =========================

;; ========
;; doc-view
;; ========
(require 'doc-view)

;; Continous scrolling in doc view
(setq doc-view-continuous t)

;; view docs and scroll the page while in another buffer
(fset 'doc-prev "\C-xo\C-x[\C-xo")
(fset 'doc-next "\C-xo\C-x]\C-xo")
(global-set-key (kbd "M-[") 'doc-prev)
(global-set-key (kbd "M-]") 'doc-next)

;; Zooming in doc view with control+mouse
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-wheel-up] 'text-scale-decrease)

;; =========
;; save-hist
;; =========
(require 'savehist)

;; Saving emacs history
(savehist-mode 1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))
(setq savehist-file "~/.emacs.d/savehist")

;; =====
;; mouse
;; =====
(require 'mouse)
(xterm-mouse-mode t)

(setq default-frame-alist '((font . "Source Code Pro for Powerline-12")))

;; Welcome message
(setq initial-major-mode 'lisp-interaction-mode)
(setq initial-scratch-message "\
      ___           ___           ___           ___           ___
     /  /\\         /__/\\         /  /\\         /  /\\         /  /\\
    /  /:/_       |  |::\\       /  /::\\       /  /:/        /  /:/_
   /  /:/ /\\      |  |:|:\\     /  /:/\\:\\     /  /:/        /  /:/ /\\
  /  /:/ /:/_   __|__|:|\\:\\   /  /:/~/::\\   /  /:/  ___   /  /:/ /::\\
 /__/:/ /:/ /\\ /__/::::| \\:\\ /__/:/ /:/\\:\\ /__/:/  /  /\\ /__/:/ /:/\\:\\
 \\  \\:\\/:/ /:/ \\  \\:\\~~\\__\\/ \\  \\:\\/:/__\\/ \\  \\:\\ /  /:/ \\  \\:\\/:/~/:/
  \\  \\::/ /:/   \\  \\:\\        \\  \\::/       \\  \\:\\  /:/   \\  \\::/ /:/
   \\  \\:\\/:/     \\  \\:\\        \\  \\:\\        \\  \\:\\/:/     \\__\\/ /:/
    \\  \\::/       \\  \\:\\        \\  \\:\\        \\  \\::/        /__/:/
     \\__\\/         \\__\\/         \\__\\/         \\__\\/         \\__\\/
")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "667e296942c561382fe0a8584c26be0fe7a80416270c3beede8c6d69f2f77ccc" "04d735f8b10046cbfc7a002f199cac24e3db78b2d19a5f6c8ea182493f3c0655" default)))
 '(helm-quick-update nil)
 '(send-mail-function nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
