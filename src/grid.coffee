angular.module("lifeApp").directive "grid", () ->

  replace: true
  template: '<div>
      <div class="grid">
        <cell ng-repeat="life in lifeMachine.world" life="life" size="cellSize" drawing="drawing"></cell>
      </div>
    </div>'

  scope:
    gridWidth: '@'
    gridHeight: '@'
    cellSize: '@'
    lifeMachine: '='
    drawing: '='

  link: (scope) ->
    scope.lifeMachine.init scope.gridWidth, scope.gridHeight