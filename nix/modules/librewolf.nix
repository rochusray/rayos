{ ... }:

{
  programs.librewolf = {
    enable = true;

    settings = {
      # Fingerprinting
      "privacy.resistFingerprinting.letterboxing" = true;
      "librewolf.webgl.prompt" = true;
      "librewolf.webgl.prompt.hide" = false;
    };

    languagePacks = [
      "en-GB"
      "de"
    ];

    profiles = {
      main = {
        name = "main";
        search = {
          default = "duckduckgo";
          privateDefault = "duckduckgo";
          order = [
            "duckduckgo"
            "image"
            "video"
            "maps"

            "wiki"
            "wiki-de"

            "ai"
            "ai-code"

            "torch"
            "youtube"

            "github"
            "nix-pkgs"
            "nix-options"
            "cargo"

            "icon"
            "font"
            "logo"

            "protondb"
          ];
          force = true;

          engines = {
            # Disable builtins
            ddg.metaData.hidden = true;
            mojeek.metaData.hidden = true;
            startpage.metaData.hidden = true;
            wikipedia-de.metaData.hidden = true;
            wikipedia-en.metaData.hidden = true;

            # General purpose
            duckduckgo = {
              name = "Duck Duck Go";
              urls = [ { template = "https://noai.duckduckgo.com/?q={searchTerms}"; } ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/solid/magnifying-glass.svg";
              definedAliases = [
                "@duckduckgo"
                "@ddg"
              ];
            };
            torch = {
              name = "TORCH";
              urls = [ { template = "https://torchsearch.org/?q={searchTerms}"; } ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/brands/tor-browser.svg";
              definedAliases = [
                "@torch"
                "@tor"
              ];
            };
            maps = {
              name = "Maps";
              urls = [ { template = "https://duckduckgo.com/?q={searchTerms}&iaxm=maps"; } ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/solid/map-location-dot.svg";
              definedAliases = [
                "@maps"
                "@map"
              ];
            };

            # Wikis
            wiki = {
              name = "Wikipedia";
              urls = [ { template = "https://wikipedia.org/w/index.php?search={searchTerms}"; } ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/brands/wikipedia-w.svg";
              definedAliases = [
                "@wikipedia"
                "@wp"
                "@wikipedia-en"
                "@wpen"
              ];
            };
            wiki-de = {
              name = "Wikipedia [de]";
              urls = [ { template = "https://de.wikipedia.org/w/index.php?search={searchTerms}"; } ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/brands/wikipedia-w.svg";
              definedAliases = [
                "@wikipedia-de"
                "@wpde"
              ];
            };
            nixos-wiki = {
              name = "NixOS Wiki";
              urls = [
                { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }
              ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/solid/snowflake.svg";
              definedAliases = [
                "@nixwiki"
                "@nixw"
              ];
            };
            proton-db = {
              name = "ProtonDB";
              urls = [
                { template = "https://www.protondb.com/search?q={searchTerms}"; }
              ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/brands/steam.svg";
              definedAliases = [
                "@protondb"
                "@pdb"
              ];
            };

            # AI
            ai = {
              name = "AI";
              urls = [
                { template = "https://duck.ai/chat?home=1&prompt=1&q={searchTerms}&model=gpt-oss-120b"; }
              ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/solid/hexagon-nodes.svg";
              definedAliases = [
                "@ai"
              ];
            };
            ai-code = {
              name = "AI - Code";
              urls = [
                { template = "https://duck.ai/chat?home=1&prompt=1&q={searchTerms}&model=claude"; }
              ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/solid/hexagon-nodes.svg";
              definedAliases = [
                "@aic"
                "@ai-code"
              ];
            };

            # Image
            image = {
              name = "Images";
              urls = [ { template = "https://noai.duckduckgo.com/?q={searchTerms}&ia=images&iax=images"; } ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/solid/image.svg";
              definedAliases = [
                "@image"
                "@img"
              ];
            };

            # Video
            video = {
              name = "Videos";
              urls = [ { template = "https://noai.duckduckgo.com/?q={searchTerms}&ia=videos&iax=videos"; } ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/solid/film.svg";
              definedAliases = [
                "@video"
                "@vid"
              ];
            };
            youtube = {
              name = "YouTube";
              urls = [ { template = "https://www.youtube.com/results?search_query={searchTerms}"; } ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/brands/youtube.svg";
              definedAliases = [
                "@youtube"
                "@yt"
              ];
            };

            # UI Design
            icon = {
              name = "Icons";
              urls = [
                { template = "https://fontawesome.com/search?q={searchTerms}&ic=free-collection&f=classic"; }
              ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/solid/icons.svg";
              definedAliases = [
                "@icon"
              ];
            };
            logo = {
              name = "Logos";
              urls = [
                { template = "https://fontawesome.com/search?q={searchTerms}&ic=free-collection&ip=brands"; }
              ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/solid/trademark.svg";
              definedAliases = [
                "@icon"
              ];
            };
            font = {
              name = "Fonts";
              urls = [
                { template = "https://fontsource.org/?query={searchTerms}"; }
              ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/solid/font.svg";
              definedAliases = [
                "@font"
              ];
            };

            # Languages
            nix-pkgs = {
              name = "Nix Pkgs";
              urls = [
                { template = "https://search.nixos.org/packages?channel=26.05&query={searchTerms}"; }
              ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/solid/snowflake.svg";
              definedAliases = [
                "@nix-pkgs"
                "@pkgs"
              ];
            };
            nix-options = {
              name = "Nix Options";
              urls = [
                { template = "https://search.nixos.org/options?channel=26.05&query={searchTerms}"; }
              ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/solid/snowflake.svg";
              definedAliases = [
                "@nix-options"
                "@nix"
              ];
            };
            github = {
              name = "GitHub";
              urls = [
                { template = "https://github.com/search?q={searchTerms}"; }
              ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/brands/github.svg";
              definedAliases = [
                "@github"
                "@gh"
              ];
            };
            cargo = {
              name = "Cargo";
              urls = [
                { template = "https://crates.io/search?q={searchTerms}"; }
              ];
              icon = "https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@7.3.1/svgs/brands/rust.svg";
              definedAliases = [
                "@cargo"
                "@cr"
              ];
            };
          };
        };
      };
    };
  };
}
