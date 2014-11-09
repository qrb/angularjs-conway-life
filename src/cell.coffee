angular.module("lifeApp").filter 'cellToPxFilter', () ->
  (cell, cellSize) -> "#{cell * cellSize}px"

angular.module("lifeApp").directive "cell", ($filter) ->

  replace: true
  template: '<div class="cell"
                  ng-class="cssClass"
                  ng-style="{left: left, top: top, height: size, width: size}"
                  ng-mousedown="toggle(life)"
                  ng-mouseenter="draw(life)"></div>'
  scope:
    life: '='
    size: '='
    drawing: '='

  link: (scope) ->

    scope.cssClass = "dead";
    scope.left = $filter('cellToPxFilter')(scope.life.position.x, scope.size)
    scope.top = $filter('cellToPxFilter')(scope.life.position.y, scope.size)

    scope.updateClass = ->
      if scope.life.alive
        scope.cssClass = "alive";
      else
        scope.cssClass = "dead";

    scope.toggle = (life) ->
      scope.life.alive = !life.alive
      scope.updateClass()

    scope.draw = (life) ->
      if scope.drawing
        scope.toggle(life)

    scope.$watch 'life', scope.updateClass

