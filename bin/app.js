// Generated by CoffeeScript 1.8.0
(function() {
  var app;

  app = angular.module("lifeApp", []);

  app.controller('AppController', function($scope, $interval, $document, LifeMachine) {
    $scope.lifeMachine = LifeMachine;
    $scope.playButtonLabel = "Play";
    $scope.draw = false;
    $scope.onGenerate = function() {
      return $scope.lifeMachine.generate();
    };
    $scope.onKill = function() {
      return $scope.lifeMachine.kill();
    };
    $scope.onPollute = function() {
      return $scope.lifeMachine.pollute();
    };
    $scope.onPlay = function() {
      if ($scope.playing != null) {
        $scope.playButtonLabel = "Play";
        $interval.cancel($scope.playing);
        return $scope.playing = void 0;
      } else {
        $scope.playButtonLabel = "Stop";
        return $scope.playing = $interval($scope.onGenerate, 0);
      }
    };
    $scope.onMouseDown = function() {
      return $scope.draw = true;
    };
    return $scope.onMouseUp = function() {
      return $scope.draw = false;
    };
  });

}).call(this);

//# sourceMappingURL=app.js.map