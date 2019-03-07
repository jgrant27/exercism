class Matrix(object):
    def __init__(self, matrix_string):
        self._matrix = [[int(n) for n in line.split()]
                        for line in matrix_string.split('\n')]

    def row(self, index):
        return self._matrix[index-1]

    def column(self, index):
        return [row[index-1] for row in self._matrix]
