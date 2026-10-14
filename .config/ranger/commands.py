# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# A simple command for demonstration purposes follows.
# -----------------------------------------------------------------------------

from __future__ import (absolute_import, division, print_function)

# You can import any python module as needed.
import os

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import Command


# Any class that is a subclass of "Command" will be integrated into ranger as a
# command.  Try typing ":my_edit<ENTER>" in ranger!
class my_edit(Command):
    # The so-called doc-string of the class will be visible in the built-in
    # help that is accessible by typing "?c" inside ranger.
    """:my_edit <filename>

    A sample command for demonstration purposes that opens a file in an editor.
    """

    # The execute method is called when you run this command in ranger.
    def execute(self):
        # self.arg(1) is the first (space-separated) argument to the function.
        # This way you can write ":my_edit somefilename<ENTER>".
        if self.arg(1):
            # self.rest(1) contains self.arg(1) and everything that follows
            target_filename = self.rest(1)
        else:
            # self.fm is a ranger.core.filemanager.FileManager object and gives
            # you access to internals of ranger.
            # self.fm.thisfile is a ranger.container.file.File object and is a
            # reference to the currently selected file.
            target_filename = self.fm.thisfile.path

        # This is a generic function to print text in ranger.
        self.fm.notify("Let's edit the file " + target_filename + "!")

        # Using bad=True in fm.notify allows you to print error messages:
        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        # This executes a function from ranger.core.acitons, a module with a
        # variety of subroutines that can help you construct commands.
        # Check out the source, or run "pydoc ranger.core.actions" for a list.
        self.fm.edit_file(target_filename)

    # The tab method is called when you press tab, and should return a list of
    # suggestions that the user will tab through.
    # tabnum is 1 for <TAB> and -1 for <S-TAB> by default
    def tab(self, tabnum):
        # This is a generic tab-completion function that iterates through the
        # content of the current directory.
        return self._tab_directory_content()

from collections import deque

class fd_search(Command):
    """
    :fd_search [-d<depth>] <query>
    Executes "fd -d<depth> <query>" in the current directory and focuses the
    first match. <depth> defaults to 1, i.e. only the contents of the current
    directory.

    See https://github.com/sharkdp/fd
    """

    SEARCH_RESULTS = deque()

    def execute(self):
        import re
        import subprocess
        from ranger.ext.get_executables import get_executables

        self.SEARCH_RESULTS.clear()

        executables = get_executables()
        if 'fdfind' in executables:
            executable = 'fdfind'
        elif 'fd' in executables:
            executable = 'fd'
        else:
            self.fm.notify("Couldn't find fd in the PATH.", bad=True)
            return

        if not self.arg(1):
            self.fm.notify(":fd_search needs a query.", bad=True)
            return

        depth = '-d1'
        if self.arg(1).startswith('-d'):
            depth = self.arg(1)
            if not re.fullmatch(r'-d[0-9]+', depth):
                self.fm.notify("Invalid depth; use -d<number>.", bad=True)
                return
            target = self.rest(2)
        else:
            target = self.rest(1)

        if not target:
            self.fm.notify(":fd_search needs a query.", bad=True)
            return

        args = [executable, '--follow', depth, '--no-ignore-vcs',
                '--exclude', '.git', '--exclude', '*.py[co]',
                '--exclude', '__pycache__', '--print0']
        if self.fm.settings.show_hidden:
            args.append('--hidden')
        # `--` prevents a query beginning with '-' from becoming an fd option.
        args.extend(['--', target])

        # No shell: spaces and shell metacharacters are search text, not code.
        result = subprocess.run(args, cwd=self.fm.thisdir.path,
                                stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                                universal_newlines=True)
        if result.returncode != 0:
            self.fm.notify(result.stderr.strip() or 'fd search failed.', bad=True)
            return

        results = filter(None, result.stdout.split('\0'))
        if not self.fm.settings.show_hidden and self.fm.settings.hidden_filter:
            hidden_filter = re.compile(self.fm.settings.hidden_filter)
            results = filter(lambda res: not hidden_filter.search(os.path.basename(res)), results)
        results = map(lambda res: os.path.abspath(os.path.join(self.fm.thisdir.path, res)), results)
        self.SEARCH_RESULTS.extend(sorted(results, key=str.lower))
        if self.SEARCH_RESULTS:
            count = len(self.SEARCH_RESULTS)
            self.fm.notify('Found {} result{}.'.format(count, 's' if count != 1 else ''))
            self.fm.select_file(self.SEARCH_RESULTS[0])
        else:
            self.fm.notify('No results found.')

class fd_next(Command):
    """
    :fd_next
    Selects the next match from the last :fd_search.
    """

    def execute(self):
        if len(fd_search.SEARCH_RESULTS) > 1:
            fd_search.SEARCH_RESULTS.rotate(-1)  # rotate left
            self.fm.select_file(fd_search.SEARCH_RESULTS[0])
        elif len(fd_search.SEARCH_RESULTS) == 1:
            self.fm.select_file(fd_search.SEARCH_RESULTS[0])

class fd_prev(Command):
    """
    :fd_prev
    Selects the next match from the last :fd_search.
    """

    def execute(self):
        if len(fd_search.SEARCH_RESULTS) > 1:
            fd_search.SEARCH_RESULTS.rotate(1)  # rotate right
            self.fm.select_file(fd_search.SEARCH_RESULTS[0])
        elif len(fd_search.SEARCH_RESULTS) == 1:
            self.fm.select_file(fd_search.SEARCH_RESULTS[0])
