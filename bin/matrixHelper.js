// Generated by CoffeeScript 1.8.0
(function() {
  angular.module("lifeApp").factory('MatrixHelper', function() {
    var factory;
    factory = {
      intToCell: function(int, width) {
        var row;
        row = Math.floor(int / width);
        return {
          x: int - row * width,
          y: row
        };
      },
      getAdjacentCells: function(int, width, height) {
        width = parseInt(width);
        height = parseInt(height);
        return [int - width - 1, int - width, int - width + 1, int - 1, int + 1, int + width - 1, int + width, int + width + 1].filter(function(test) {
          return test > -1 && test < width * height;
        });
      }
    };
    return factory;
  });

}).call(this);

//# sourceMappingURL=matrixHelper.js.map
