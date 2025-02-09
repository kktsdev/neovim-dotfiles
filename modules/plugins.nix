{pkgs, ...}: {
  mini = {
    comment.enable = true;
    diff.enable = true;
    jump.enable = true;
    pairs.enable = true;
    splitjoin.enable = true;
    surround.enable = true;
    trailspace.enable = true;
  };
  visuals = {
    highlight-undo.enable = true;
    nvim-cursorline.enable = true;
    nvim-web-devicons.enable = true;
  };
  extraPlugins = with pkgs.vimPlugins; {
    undotree.package = undotree;
    vim-smoothie.package = vim-smoothie;
    vim-sort-motion.package = vim-sort-motion;
    vim-tmux-navigator.package = vim-tmux-navigator;
  };
  maps.normal = {
    "<leader>u" = {
      lua = true;
      action = "vim.cmd.UndotreeToggle";
    };
    "<leader>tws" = {
      lua = true;
      action = ''
        function()
          require('mini.trailspace').trim()
          require('mini.trailspace').trim_last_lines()
        end
      '';
    };
  };
}
