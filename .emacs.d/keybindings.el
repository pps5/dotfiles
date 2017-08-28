;; C-h to BackSpace
(global-set-key [?\C-h] 'delete-backward-char)

;; windmove
(windmove-default-keybindings 'meta)

;; quickrun
(require 'quickrun)
(global-set-key (kbd "<f5>") 'quickrun)
(global-set-key (kbd "C-c <f5>") 'quickrun-with-arg)

;; run python
(require 'python)
(define-key python-mode-map (kbd "C-c C-c")
  (lambda () (interactive) (python-shell-send-buffer t)))

;; flycheck
(require 'flycheck)
(global-set-key (kbd "M-p") 'flycheck-previous-error)
(global-set-key (kbd "M-n") 'flycheck-next-error)
