import os
import sys
import time
import tkinter as tk
from tkinter import messagebox

def prompt_restart():
    root = tk.Tk()
    root.withdraw()
    response = messagebox.askyesno("Shutdown Windows", "Do you want to shutdown Windows?")
    root.destroy()
    return response

def restart_windows():
    print("Shutting down Windows...")
    os.system("shutdown /s /t 0")

def main():
    response = prompt_restart()

    if response:
        restart_windows()
    else:
        print("shutdown aborted.")

if __name__ == "__main__":
    main()