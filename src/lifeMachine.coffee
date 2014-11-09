angular.module("lifeApp").factory 'LifeMachine', (MatrixHelper) ->

  class LifeMachine
    world: []
    height: 20
    width: 30
    worldSize: 600

    constructor: -> @makeWorld()

    init: (@width, @height) ->
      @worldSize = @height * @width
      @makeWorld()
      @

    makeWorld: ->
      @world = []
      for i in [0...@worldSize]
        @world.push
          position: MatrixHelper.intToCell(i, @width)
          alive: false

    generate: -> @_generator (nextLife, lastLife, neighbours) ->
      if lastLife.alive and neighbours < 2 then nextLife.alive = false
      if lastLife.alive and (neighbours == 2 or neighbours == 3) then nextLife.alive = true
      if lastLife.alive and neighbours > 3 then nextLife.alive = false
      if !lastLife.alive and neighbours == 3 then nextLife.alive = true
      nextLife

    kill: -> @_generator (nextLife) ->
      nextLife.alive = false
      nextLife

    pollute: -> @_generator (nextLife) ->
      if Math.random()<.1
        nextLife.alive = true
      nextLife

    _generator: (morph) ->
      future = []
      for i in [0...@worldSize]
        future.push morph(_.clone(@world[i]), @world[i], @_countLivingNeighbours(i))

      @world = future

    _countLivingNeighbours: (index) ->
      count = 0
      for n in MatrixHelper.getAdjacentCells index, @width, @height
        count = count + 1 if @world[n].alive

      count

  new LifeMachine()
