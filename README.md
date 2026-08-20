# 🥭 Jorind's Dotfiles

> Personal Wayland desktop configurations on Arch Linux running **MangoWM**, **Waybar**, **Rofi**, and **Foot**. Managed cleanly with GNU `stow`.

---

## 📸 Screenshots



---

## 🛠️ Components

| Component | Tool |
| :--- | :--- |
| **Window Manager** | [MangoWM](https://github.com/mangowm/mangowm) |
| **Status Bar** | [Waybar](https://github.com/Alexays/Waybar) |
| **Application Launcher** | [Rofi](https://github.com/davatorium/rofi) |
| **Terminal** | [kitty](https://codeberg.org/dnkl/foot) |
| **System Info** | [Fastfetch](https://github.com/fastfetch-cli/fastfetch) |
| **Shell** | [Fish](https://fishshell.com/) |

---

## ⚡ Core Keybindings

| Keybinding | Action |
| :--- | :--- |
| `ALT` + `SPACE` | Launch Rofi (`drun`) |
| `ALT` + `RETURN` | Open kitty Terminal |
| `ALT` + `Q` | Close Active Window |
| `SUPER` + `R` | Reload MangoWM Config |
| `SUPER` + `SHIFT` + `E` | Quit MangoWM |
| `SUPER` + `1-9` | Switch Workspaces |
| `SUPER` + `SHIFT` + `1-9` | Move Window to Workspace |

---

## 🚀 Installation & Deployment

To replicate this setup on a fresh installation:

```bash
# 1. Clone the repository
git clone [https://github.com/jorind12313/dotfiles.git](https://github.com/jorind12313/dotfiles.git) ~/.dotfiles
cd ~/.dotfiles

# 2. Install GNU Stow
sudo pacman -S stow

# 3. Stow desired configurations
stow mango
stow waybar
stow fastfetch
stow rofi
stow foot
