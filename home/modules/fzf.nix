{
  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--highlight-line"
      "--info=inline-right"
      "--ansi"
      "--reverse"
      "--border=none"
    ];
    colors = {
      "bg+" = "#283457";
      # bg = "#16161e";
      fg = "#c0caf5";
      border = "#27a1b9";
      gutter = "#16161e";
      header = "#ff9e64";
      "hl+" = "#2ac3de";
      hl = "#2ac3de";
      info = "#545c7e";
      marker = "#ff007c";
      pointer = "#ff007c";
      prompt = "#2ac3de";
      query = "#c0caf5";
      scrollbar = "#27a1b9";
      separator = "#ff9e64";
      spinner = "#ff007c";
    };
  };
}
