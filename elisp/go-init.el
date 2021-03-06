;;; go-init.el -- Go!
;;; Commentary:

;;; Code:

(require 'use-package)

(use-package go-mode
  :ensure t
  :mode ("\\.go\\'" . go-mode)
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'makefile-tabs-are-less-evil)

  (use-package company-go
    :ensure t
    :config
    (add-to-list 'company-backends 'company-go)
    (setq company-tooltip-limit 20) ; bigger popup window
    (setq company-idle-delay .3)    ; decrease delay before autocompl popup shows
    (setq company-echo-delay 0)     ; remove annoying blinking

    (add-hook 'go-mode-hook
              (lambda ()
                (set (make-local-variable 'company-backends) '(company-go))
                (company-mode))))
  (use-package go-eldoc
    :ensure t
    :config
    (add-hook 'go-mode-hook 'go-eldoc-setup))

  ;; Call Gofmt before saving
  (defun my-go-mode-hook ()
    (add-hook 'before-save-hook 'gofmt-before-save)
    ;; Godef jump key binding
    (local-set-key (kbd "C-c C-f C-f") 'helm-projectile-find-file)
    (local-set-key (kbd "M-.") 'godef-jump)
    (local-set-key (kbd "M-,") 'pop-tag-mark))
  (add-hook 'go-mode-hook 'my-go-mode-hook)
  (sp-pair "{" nil :post-handlers '(("||\n[i]" "RET"))))

(provide 'go-init)
;;; go-init.el ends here
