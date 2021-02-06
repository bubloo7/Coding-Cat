public class MyListener implements NativeKeyListener {

  void nativeKeyTyped(NativeKeyEvent a) {
 
  if(!Coding_Cat.player.isPlaying()&&Coding_Cat.fxb){

  Coding_Cat.player.rewind();
  Coding_Cat.player.play();

  }

  Coding_Cat.f = !Coding_Cat.f;

  }


void nativeKeyReleased(NativeKeyEvent a) {

}
void nativeKeyPressed(NativeKeyEvent a) {

}

}
