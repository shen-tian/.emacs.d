;;; -*- lexical-binding: t -*-
;; Changes all yes/no questions to y/n type
(setq use-short-answers t)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

;; Make find-file more useful
(defun make-directory-maybe (filename &rest _)
  "Create parent directory if not exists while visiting FILENAME."
  (unless (file-exists-p filename)
    (let ((dir (file-name-directory filename)))
      (unless (file-exists-p dir)
        (make-directory dir t)))))

(advice-add 'find-file :before #'make-directory-maybe)
