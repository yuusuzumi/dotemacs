;; -*- lexical-binding: t; coding: utf-8 -*-

(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("org" . "https://orgmode.org/elpa/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    (leaf hydra :ensure t)
    (leaf el-get :ensure t)
    ;; (leaf blackout :ensure t)

    :config
    (leaf-keywords-init)))

(leaf cus-edit :custom `((custom-file . ,(locate-user-emacs-file "custom.el"))))
(leaf cus-start :custom '((global-display-line-numbers-mode . t)
			  (size-indication-mode . t)
			  (tool-bar-mode . nil)))

(leaf leaf-convert :ensure t)
(leaf leaf-tree :ensure t)


(leaf all-the-icons
  :ensure t
  :if window-system)

(leaf aozora-view
  :ensure t)

(leaf auto-highlight-symbol
  :ensure t
  :custom
  (global-auto-highlight-symbol-mode . t))

(leaf color-identifiers-mode
  :ensure t
  :hook (after-init-hook . global-color-identifiers-mode))

(leaf company
  :ensure t
  :custom
  (company-backends . '(company-capf
			company-dabbrev
			company-files))
  (company-idle-delay . 0)
  (company-minimum-prefix-length . 1)
  (company-selection-wrap-around . t)
  :hook
  ((after-init-hook . company-tng-mode)
   (after-init-hook . global-company-mode)))

(leaf dashboard
  :ensure t)

(leaf doom-modeline
  :ensure t
  :custom ((doom-modeline-buffer-file-name-style . 'relative-from-project))
  :hook (after-init-hook))

(leaf doom-themes
  :ensure t
  :config
  (load-theme 'doom-wilmersdorf t))

(leaf git-modes
  :ensure t
  :mode ("\\.dockerignore$"))

(leaf gitignore-templates
  :ensure t)

(leaf highlight-indent-guides
  :ensure t
  :hook (prog-mode-hook))

(leaf highlight-numbers
  :ensure t
  :hook (prog-mode-hook))

(leaf nyan-mode
  :ensure t
  :after doom-modeline
  :custom ((nyan-animate-nyancat . t)
	   (nyan-wavy-trail . t))
  :hook (doom-modeline-mode-hook))

(leaf org
  :ensure t)

(leaf paredit
  :ensure t
  :commands enable-paredit-mode
  :custom
  (show-paren-mode . t)
  :hook ((emacs-lisp-mode-hook . enable-paredit-mode)
	 (lisp-interaction-mode-hook . enable-paredit-mode)))

(leaf rainbow-delimiters
  :ensure t
  :hook (prog-mode-hook))

(leaf ssh-config-mode
  :ensure t
  :mode ("/path-to-your-ssh/config\\$"))






(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)
(setq create-lockfiles nil)
(setq frame-title-format "%f")
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq make-backup-files nil)

