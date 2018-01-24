;;; init.el -- Emacs Configuration

;;; Commentary:

;;; Code:

(require 'package)
(add-to-list 'package-archives
             (lambda ()
               '("melpa-stable" . "https://stable.melpa.org/packages/") t
               '("melpa" . "https://melpa.org/packages/") t))
(add-to-list 'custom-theme-load-path "~/.emacs.d/atom-one-dark-theme/")

;;=======================
;; load
;;=======================
;; load cask
;;(package-initialize)
(require 'cask "~/.cask/cask.el")
(cask-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (edit-indirect ein auto-virtualenv virtualenvwrapper yasnippet web-mode use-package smex smartrep smartparens projectile prodigy popwin pallet nyan-mode multiple-cursors magit lua-mode idle-highlight-mode htmlize flycheck-cask expand-region exec-path-from-shell emmet-mode drag-stuff auto-complete))))

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

;;=======================
;; Appearance
;;=======================
;;load theme
(if (display-graphic-p)
    (progn (load-theme 'atom-one-dark t)) ; x11
  (load-theme 'wombat t)) ; console

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

;; helm color
(require 'helm)
(set-face-attribute 'helm-selection nil
                    :background "lightgreen"
                    :foreground "black")

;; font settings
(set-face-attribute 'default nil :family "Ricty" :height 125)
(set-fontset-font t 'unicode (font-spec :family "Noto Emoji"))

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
(set-face-background 'indent-guide-face "color-200")
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
;; helm
;;=======================
(require 'helm)
(helm-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;;=======================
;; PHP
;;=======================
(add-hook 'php-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq c-basic-offset 4)))

;;=======================
;; Python
;;=======================
(require 'virtualenvwrapper)
(require 'auto-virtualenvwrapper)
(add-hook 'python-mode-hook #'auto-virtualenvwrapper-activate)
(add-to-list 'company-backends 'company-jedi)
(add-hook 'python-mode-hook
          '(lambda()
            (setq flycheck-checker 'python-pylint
                  flycheck-checker-error-threshold 900
                  flycheck-pylintrc "~/.pylintrc")
            'jedi:setup
            (setq-default show-trailing-whitespace t)))

;;=======================
;; HTML, CSS
;;=======================
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tag\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))

;; emmet settings
(require 'emmet-mode)
(setq emmet-move-cursor-between-quotes t)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook
          (lambda()
            (setq web-mode-markup-indent-offset 2)
            (emmet-mode t)))

;;=======================
;; Rust
;;=======================
(require 'rust-mode)
(require 'racer)
(add-to-list 'exec-path (expand-file-name "~/.cargo/bin/"))
(eval-after-load "rust-mode"
  '(setq-default rust-format-on-save t))
(add-hook 'rust-mode-hook (lambda ()
                           (racer-mode)
                           (flycheck-rust-setup)))
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook (lambda ()
                             (set (make-variable-buffer-local 'company-idle-delay) 0.5)
                             (set (make-variable-buffer-local 'company-minimum-prefix-length) 2)))

;;=======================
;; neotree
;;=======================
(require 'all-the-icons)
(require 'neotree)
(setq neo-show-hidden-files t)
(setq neo-create-file-auto-open t)
(setq neo-persist-show t)
(setq neo-keymap-style 'concise)
(setq neo-smart-open t)
(global-set-key [f8] 'neotree-toggle)
(when neo-persist-show
  (add-hook 'popwin:before-popup-hook
            (lambda () (setq neo-persist-show nil)))
  (add-hook 'popwin:after-popup-hook
            (lambda () (setq neo-persist-show t))))
(setq neo-theme (if (display-graphic-p) 'icons 'arrows))

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
(windmove-default-keybindings)

;;; init.el ends here
