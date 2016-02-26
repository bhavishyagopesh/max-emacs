;;; keybindings.el --- the name is enough
;;; Commentary:
;;; Contains key bindings

;;; Code:

;; Some sane keybindings
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [(control home)] 'beginning-of-buffer)
(global-set-key [(control end)] 'end-of-buffer)

;; Custom keybindings
(define-key esc-map [right] 'kill-word)         ;; esc -> kill-word
(define-key esc-map [left] 'backward-kill-word) ;; esc <- backward-kill-word

;; Setup Alt Keys
(global-set-key [(alt b)] `buffer-menu)
(global-set-key [(alt c)] `copy-region-as-kill)        ; ESC-w
(global-set-key [(alt g)] `goto-line)

;; Resize windows
(global-set-key (kbd "C-x <up>") 'shrink-window)
(global-set-key (kbd "C-x <down>") 'enlarge-window)
(global-set-key (kbd "C-x <left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-x <right>") 'enlarge-window-horizontally)

;; Other-window is M-o
(global-set-key "\M-o" 'other-window)

;; The awesome imenu, backed by semantic mode and helm
(global-set-key (kbd "C-c i") 'imenu)

;; Open newlines above current position
(global-set-key (kbd "C-S-o") 'open-line-above)

;; From vikraman's .emacs.d
;; These depend on functions defined in functions.el
(global-set-key (kbd "M-0")
                '(lambda () (interactive)
                   (global-text-scale-adjust (- text-scale-mode-amount))
                   (global-text-scale-mode -1)))
(global-set-key (kbd "M-+")
                '(lambda () (interactive) (global-text-scale-adjust 1)))
(global-set-key (kbd "M--")
                '(lambda () (interactive) (global-text-scale-adjust -1)))

;; Misc keybindings
(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

(global-set-key (kbd "C-a") 'back-to-indentation-or-beginning)

(provide 'keybindings)
;;; keybindings.el ends here
