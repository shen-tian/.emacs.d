;; Move these keys one row down.

(global-unset-key (kbd "C-x 1"))
(global-unset-key (kbd "C-x 2"))
(global-unset-key (kbd "C-x 3"))
(global-unset-key (kbd "C-x 0"))

(global-set-key (kbd "C-x q") 'delete-other-frames)
(global-set-key (kbd "C-x w") 'split-window-below)
(global-set-key (kbd "C-x e") 'split-window-right)
(global-set-key (kbd "C-x p") 'delete-window)
