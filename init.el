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

(leaf leaf-convert :ensure t)
(leaf leaf-tree :ensure t)


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

(leaf doom-modeline
  :ensure t)

(leaf doom-themes
  :ensure t
  :config
  (load-theme 'doom-wilmersdorf t))

(leaf git-modes
  :ensure t
  :mode ("\\.dockerignore$"))

(leaf gitignore-templates
  :ensure t)

(leaf paredit
  :ensure t
  :hook ((emacs-lisp-mode-hook lisp-interaction-mode-hook . enable-paredit-mode)))










(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)
(setq create-lockfiles nil)
(setq make-backup-files nil)

