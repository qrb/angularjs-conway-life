app = angular.module("lifeApp", [])

app.controller 'AppController', ($scope, $interval, $document, LifeMachine) ->

  $scope.lifeMachine = LifeMachine

  $scope.playButtonLabel = "Play"
  $scope.draw = false

  $scope.onGenerate = ->
    $scope.lifeMachine.generate()

  $scope.onKill = ->
    $scope.lifeMachine.kill()

  $scope.onPollute = ->
    $scope.lifeMachine.pollute()

  $scope.onPlay = ->
    if $scope.playing?
      $scope.playButtonLabel = "Play"
      $interval.cancel $scope.playing
      $scope.playing = undefined
    else
      $scope.playButtonLabel = "Stop"
      $scope.playing = $interval $scope.onGenerate, 0

  $scope.onMouseDown = ->
    $scope.draw = true

  $scope.onMouseUp = ->
    $scope.draw = false
