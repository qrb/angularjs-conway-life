// Generated by CoffeeScript 1.8.0
(function() {
  angular.module("lifeApp").filter('cellToPxFilter', function() {
    return function(cell, cellSize) {
      return "" + (cell * cellSize) + "px";
    };
  });

  angular.module("lifeApp").directive("cell", function($filter) {
    return {
      replace: true,
      template: '<div class="cell" ng-class="cssClass" ng-style="{left: left, top: top, height: size, width: size}" ng-mousedown="toggle(life)" ng-mouseenter="draw(life)"></div>',
      scope: {
        life: '=',
        size: '=',
        drawing: '='
      },
      link: function(scope) {
        scope.cssClass = "dead";
        scope.left = $filter('cellToPxFilter')(scope.life.position.x, scope.size);
        scope.top = $filter('cellToPxFilter')(scope.life.position.y, scope.size);
        scope.updateClass = function() {
          if (scope.life.alive) {
            return scope.cssClass = "alive";
          } else {
            return scope.cssClass = "dead";
          }
        };
        scope.toggle = function(life) {
          scope.life.alive = !life.alive;
          return scope.updateClass();
        };
        scope.draw = function(life) {
          if (scope.drawing) {
            return scope.toggle(life);
          }
        };
        return scope.$watch('life', scope.updateClass);
      }
    };
  });

}).call(this);

//# sourceMappingURL=cell.js.map