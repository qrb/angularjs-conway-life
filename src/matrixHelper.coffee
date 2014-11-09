angular.module("lifeApp").factory 'MatrixHelper', () ->

  factory =

    intToCell: (int, width) ->
      row = Math.floor int / width
      return {
      x: int - row * width
      y: row
      }

    getAdjacentCells: (int, width, height) ->
      width = parseInt(width)
      height = parseInt(height)

      [ int - width - 1
        int - width
        int - width + 1
        int - 1
        int + 1
        int + width - 1
        int + width
        int + width + 1
      ].filter (test) ->
        test > -1 and test < width * height

  factory
