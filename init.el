;;; init.el --- Where all the magic begins
;;; Commentary:
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;

;;; Code:
(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name)))
(setq dotfiles-dir (file-name-directory (or load-file-name (buffer-file-name))))
(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))
(add-to-list 'load-path (expand-file-name
                         "lisp" (expand-file-name
                                 "org" (expand-file-name
                                        "src" dotfiles-dir))))

;; Common Lisp compatability
(require 'cl-lib)

;; Package Locations
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/.myemacs.d/")
           (default-directory my-lisp-dir))
      (normal-top-level-add-subdirs-to-load-path)))

(require 'server)
(unless (server-running-p)
        (server-start))

;; Load up Org Mode and Babel load up the main file org-mode windmove compatibility
(setq org-replace-disputed-keys t)
(require 'org)
(org-babel-load-file (expand-file-name "starter-kit.org" dotfiles-dir))

;;; Higher garbage collection threshold
(setq gc-cons-threshold 20000000)

;;; init.el ends here
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
