(when (configuration-layer/layer-usedp 'spacemacs-cmake-ide)
  (add-hook 'c++-mode-hook 'flycheck-mode)
  (add-hook 'c++-mode-hook 'ycmd-mode)

  ;; rtags
  (push "/usr/local/share/emacs/site-lisp/rtags" load-path)

  ;; cmake flags for completion
  (setq cmake-ide-flags-c "-v -imultiarch x86_64-linux-gnu -mtune=generic -march=x86-64 -fsyntax-only -fstack-protector-strong -Wformat -Wformat-security -Wall -Wextra")
  (setq cmake-ide-flags-c++ cmake-ide-flags-c)

  (setq-default dotspacemacs-configuration-layers
                '(((c-c++ :variables c-c++-enable-clang-support t)))))

(when (configuration-layer/package-usedp 'ycmd)
  (setq ycmd-server-command '("python" "/usr/local/lib/ycmd/ycmd"))
  (setq ycmd-extra-conf-whitelist '("~/*"))
  (setq ycmd-force-semantic-completion t))

(when (configuration-layer/package-usedp 'eclim)
  (setq eclim-eclipse-dirs '("~/.local/share/eclim")
        eclim-executable   '("~/.emacs.d/.cache/quelpa/melpa/recipes/eclim")))
