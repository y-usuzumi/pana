-- a "Hello world" grammar
abstract Hello = {
  flags startcat = Greeting ;

  cat Greeting ; Recipient ;

  fun
    Hello : Recipient -> Greeting;
    World, Mum, Friends : Recipient;
}
