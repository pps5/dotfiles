(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


;;=======================
;; load
;;=======================
;; load cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; ui
(load-file "~/.emacs.d/interface.el")

;; keybindings
(load-file "~/.emacs.d/keybindings.el")

;; load path recursive
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
;;(add-to-load-path "elpa")
;;(add-to-load-path "~/.emacs.d/.cask")


;;=======================
;; Basic settings
;;=======================

;; ignore low level warnings
(setq warning-minimum-level :emergency)

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
;; multiple-cursors
;;=======================
(require 'multiple-cursors)
(require 'smartrep)
(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)
(global-unset-key "\C-t")

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

;; global flycheck mode
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(python-flake8))
(setq flycheck-check-syntax-automatically '(mode-enabled save))


;;=======================
;; auto-complete
;;=======================
(require 'auto-complete-config)
(ac-config-default)
(setq ac-auto-show-menu 0.8)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'fundamental-mode)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'python-mode)


;;=======================
;; helm
;;=======================
(helm-mode t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)


;;=======================
;; Java
;;=======================
(require `java-imports)
(define-key java-mode-map (kbd "M-i") `java-imports-add-import)
(add-hook 'java-mode-hook 'java-imports-scan-file)


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
;; virtualenvwrapper
(require 'virtualenvwrapper)
(setq venv-location '("/home/inab/python/rogue_like/env"
                      "/home/inab/python/syncdrive"
                      "/home/inab/workspace/Positioning"))

;(require 'epc)
(require 'python)
(jedi:setup)
(setq jedi:complete-on-dot t)
(add-to-list 'ac-sources 'ac-source-filename)
(add-to-list 'ac-sources 'ac-source-jedi-direct)


(add-hook 'python-mode-hook
          '(lambda()
            ;(flycheck-mode 1)
            (setq flycheck-checker 'python-pylint
                  flycheck-checker-error-threshold 900
                  ;flycheck-python-pylint-executable (getenv "PYLINT_EXECUTABLE")
                  flycheck-pylintrc "~/.pylintrc")
            (setq-default show-trailing-whitespace t)
            #'auto-virtualenvwrapper-activate))

;; quickrun
(setq-default quickrun-timeout-seconds nil)
(require 'popwin)
(push '("*quickrun*" :stick t) popwin:special-display-config)


;;=======================
;; HTML, CSS
;;=======================
(require 'web-mode)
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ein auto-virtualenv virtualenvwrapper yasnippet web-mode use-package smex smartrep smartparens projectile prodigy popwin pallet nyan-mode multiple-cursors magit lua-mode idle-highlight-mode htmlize flycheck-cask expand-region exec-path-from-shell emmet-mode drag-stuff auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
