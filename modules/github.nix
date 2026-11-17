{ username, email, ... }:

{
  programs.ssh.enableDefaultConfig = false;
  programs.ssh.settings = {
    "github.com" = {
      HostName = "github.com";
      User = "git";
      IdentityFile = "~/.ssh/github";
    };
  };
  programs.git.settings = {
    user.name = username;
    user.email = email;
  };
}
