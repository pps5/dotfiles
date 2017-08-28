;;=======================
;; Global
;;=======================
;; color theme
(load-theme 'wombat t)

;; transparency
(add-to-list 'default-frame-alist '(alpha . (0.9 0.9)))

;; line/column number mode
(global-linum-mode t)
(column-number-mode t)

;; highlight current line
(global-hl-line-mode t)

;; highlight color of region
(set-face-background 'region "#565864")

;; highlight parenthese
(show-paren-mode t)

;; hide menu-bar and toolbar
(menu-bar-mode 0)
(tool-bar-mode 0)


;;=======================
;; helm color
;;=======================
(require 'helm)
(set-face-attribute 'helm-selection nil
                    :background "lightgreen"
                    :foreground "black")

;;=======================
;; font settings
;;=======================
(when (equal window-system 'nil)
  (set-face-attribute 'default nil :family "Inconsolata" :height 120)
  (set-fontset-font t 'japanese-jisx0208 (font-spec :family "Noto Sans Japanese")))
(when (equal window-system 'x)
  (set-face-attribute 'default nil :family "Inconsolata" :height 160)
  (set-fontset-font t 'japanese-jisx0208 (font-spec :family "Noto Sans Japanese")))
(set-fontset-font t 'unicode (font-spec :family "Noto Emoji"))


;;=======================
;; transparency
;;=======================
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))
(add-hook 'window-setup-hook 'on-after-init)
;(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
;(add-to-list 'default-frame-alist '(alpha . (85 . 50)))

;;=======================
;; web-mode color
;;=======================
;; bracket color
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
