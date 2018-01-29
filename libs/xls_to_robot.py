# This function file takes a filename as a parameter and returns a list of values taken from the xls document.
# writing this file is important as we are making the tests independent of logic that is not associated with the test
# Also any other test can use this file for their use.

from xlrd import open_workbook


def exls_to_robot(filename):
    workb = open_workbook(filename)
    values = []
    for sh in workb.sheets():
        for row in range(1, sh.nrows):
            col_names = sh.row(0)
            col_value = []
            for name, col in zip(col_names, range(sh.ncols)):
                value  = (sh.cell(row,col).value)
                try : value = str(int(value))
                except : pass
                col_value.append((name.value, value))
            values.append(col_value)
    return values


