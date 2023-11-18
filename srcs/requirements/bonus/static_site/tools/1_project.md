+++
authors = ["LTBreaKer"]
title = "Minishell"
date = "2023-11-15"
+++

Minishell is a simplified Unix shell implementation, built as a programming project. It provides a command-line interface that allows users to interact with the operating system by executing commands.

This project aims to recreate a subset of the functionalities found in a traditional Unix shell. It serves as an exercise in systems programming and provides an opportunity to understand the inner workings of a shell environment.

## Key Concepts and Learning Objectives:

-   **Processes and Forking:** Students learn about creating processes using the fork() system call. They must understand how to create child processes, which execute shell commands, and how the parent process manages them.
-   **System Calls:** This project involves using essential system calls such as fork(), execve(), wait(), pipe(), and dup2(). Students learn how these calls work and how to use them effectively.
-   **Command Parsing:** Parsing user input and breaking it down into commands and arguments is a critical part of building a shell. Students must implement a parser to handle command-line arguments and redirection.
-   **Built-in Commands:** In addition to external commands, students implement a set of built-in commands, such as cd, echo, and env, which are executed by the shell directly without invoking external programs.
-   **Redirection and Piping:** Students learn how to handle I/O redirection (e.g., <, >, >>) and piping (e.g., |) between commands.
-   **Environment Variables:** Managing environment variables (e.g., PATH, HOME, USER) is an essential part of the shell. Students must implement functions to get, set, and manage environment variables.
-   **Signal Handling:** Understanding and handling signals (e.g., Ctrl+C, Ctrl+D) is crucial for a shell. Students must ensure the shell can manage signals gracefully.
-   **Error Handling:** Effective error handling is essential to provide informative feedback to users when things go wrong.
-   **User Interaction:** The shell should provide a command-line interface where users can interact with the system, execute commands, and navigate directories.

To see the full project please visit the [github repo](https://github.com/LTBreaKer/Minishell).