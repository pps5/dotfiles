;;; init.el -- Emacs Configuration

;;; Commentary:

;;; Code:

(require 'package)
(add-to-list 'package-archives
             (lambda ()
               '("melpa-stable" . "https://stable.melpa.org/packages/") t
               '("melpa" . "https://melpa.org/packages/") t))

;;=======================
;; load
;;=======================
;; load cask
;;(package-initialize)
(require 'cask "/usr/share/cask/cask.el")
(cask-initialize)

;;=======================
;; misc settings
;;=======================
;; ignore low level warnings
(setq warning-minimum-level :emergency)

;; scroll
(setq scroll-conservatively 1)

;; encoding
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; auto refresh
(global-auto-revert-mode t)

;; tab
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; startup
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message nil)

;; remove trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; yes or no to y or n
(fset 'yes-or-no-p 'y-or-n-p)

;; ignore case when completion
(setq read-file-name-completion-ignore-case t)

;; open *scratch* buffer with blank
(setq initial-scratch-message nil)

;; do not create auto save file(#filename#) and backup
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)
(setq auto-save-list-file-prefix nil)
(setq delete-auto-save-files t)
(setq backup-inhibited t)

;; add final new line if no line
(setq require-final-newline t)

;; enable mouse
(xterm-mouse-mode t)

;;=======================
;; Appearance
;;=======================
;;load theme
(load-theme 'nord t)
(set-face-foreground 'font-lock-comment-face "#98a1b5")
(set-face-foreground 'font-lock-comment-delimiter-face "#98a1b5")

;; line/column number mode
(global-linum-mode t)
(column-number-mode t)

;; highlight current line
(global-hl-line-mode t)

;; highlight color of region
(set-face-background 'region "#565864")

;; highlight parenthese
(show-paren-mode t)
(rainbow-delimiters-mode-enable)

;; hide menu-bar, toolbar and scroll bar
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)

;; font settings
(set-face-attribute 'default nil :family "Cica" :height 100)

;; web-mode bracket color
(add-hook 'web-mode-hook
          '(lambda ()
             (set-face-attribute 'web-mode-html-tag-face nil :foreground "#4A8ACA")
             (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#87CEEB")
             (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#FFFFFF")
             (set-face-attribute 'web-mode-css-at-rule-face nil :foreground "#DFCF44")
             (set-face-attribute 'web-mode-comment-face nil :foreground "#587F35")
             (set-face-attribute 'web-mode-css-selector-face nil :foreground "#DFCF44")
             (set-face-attribute 'web-mode-css-pseudo-class-face nil :foreground "#DFCF44")
             (set-face-attribute 'web-mode-css-property-name-face nil :foreground "#87CEEB")
             (set-face-attribute 'web-mode-css-string-face nil :foreground "#D78181")))

;; indent-guide
(require 'indent-guide)
(indent-guide-global-mode)
(set-face-background 'indent-guide-face nil)
(set-face-foreground 'indent-guide-face "white")
(setq indent-guide-delay 0)
(setq indent-guide-char "|")

;; powerline
(require 'powerline)
(powerline-center-theme)

;;=======================
;; Global Keybinds
;;=======================
;; C-h to BackSpace
(global-set-key [?\C-h] 'delete-backward-char)

;; flycheck
(require 'flycheck)
(global-set-key (kbd "M-p") 'flycheck-previous-error)
(global-set-key (kbd "M-n") 'flycheck-next-error)

;;=======================
;; popwin
;;=======================
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;;=======================
;; multiple-cursors
;;=======================
(require 'multiple-cursors)
(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)
(global-unset-key "\C-t")

(require 'smartrep)
(smartrep-define-key global-map "C-t"
  '(("C-t" . 'mc/mark-next-like-this)
    ("n"   . 'mc/mark-next-like-this)
    ("p"   . 'mc/mark-previous-like-this)
    ("m"   . 'mc/mark-more-like-this)
    ("u"   . 'mc/unmark-next-like-this)
    ("U"   . 'mc/unmark-previous-like-this)
    ("s"   . 'mc/skip-to-next-like-this)
    ("*"   . 'mc/mark-all-like-this)
    ("d"   . 'mc/mark-all-like-this-dwim)
    ("i"   . 'mc/insert-numbers)
    ("o"   . 'mc/sort-regions)
    ("O"   . 'mc/reverse-regions)))

;;=======================
;; flycheck
;;=======================
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(python-flake8))
(setq flycheck-check-syntax-automatically '(mode-enabled save))

;;=======================
;; company-mode
;;=======================
(require 'company)
(global-company-mode +1)
(setq company-minimum-prefix-length 1)
(setq company-selection-wrap-around t)

;;=======================
;; Swiper
;;=======================
(setq ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minubuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

;;=======================
;; PHP
;;=======================
(add-hook 'php-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq c-basic-offset 4)))

;;=======================
;; HTML, CSS, JavaScript
;;=======================
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tag\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

;; emmet settings
(require 'emmet-mode)
(setq emmet-move-cursor-between-quotes t)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook
          (lambda()
            (setq web-mode-markup-indent-offset 2)
            (emmet-mode t)))
;; js-mode indent
(add-hook 'js-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

;;=======================
;; TypeScript
;;=======================
(require 'tide)
(setq typescript-indent-level 2)
(add-hook 'typescript-mode-hook
          (lambda ()
            (interactive)
            (tide-setup)
            (flycheck-mode t)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (eldoc-mode t)
            (tide-hl-identifier-mode t)
            (company-mode t)))

;;=======================
;; treemacs
;;=======================
(require 'treemacs)
(require 'all-the-icons)

;;=======================
;; shell pop
;;=======================
(require 'shell-pop)
(add-hook 'term-mode-hook (lambda () (setq show-trailing-whitespace nil)))
(custom-set-variables
 '(shell-pop-shell-type (quote ("ansi-term" "*shell-pop-ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "C-`")
 '(shell-pop-window-height 40)
 '(shell-pop-window-position "bottom"))

;;=======================
;; windmove
;;=======================
(setq windmove-wrap-around t)
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)

;;; init.el ends here
