(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)
(el-get 'sync)

;; ----------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
