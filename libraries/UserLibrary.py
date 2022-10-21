from typing import Optional
from robot.api import logger


class UserLibrary:
    def example_python_keyword(self, echo: Optional[str] = None):
        """This keyword is an example from a Python shared library.
        
        This docstring represents an example docstring. Generally,
        docstrings should include 3 main parts: summary, parameters, and
        examples. This docstring also includes additional information
        which is represented by this paragraph. This docstring is
        formatted using `Sphinx`_.

        .. _Sphinx: https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html

        :param echo: Optional. The string to log to console.

        .. code-block: robotframework

            *** Tasks ***
            Use example keyword from shared library
                Example python keyword    This will be logged to console.
        """
        if echo is None:
            logger.info("This is Python from Shared library!")
        else:
            logger.info(f"From shared library: {echo}", also_console=True)
