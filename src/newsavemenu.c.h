

static const ProcCode NewSaveMenu[]={
  //setup stuff
    PROC_SET_NAME("savemenu"),              //01 00 00 00 B8 17 3B 08 //THESE ARE THE BETA VALUES
    PROC_LABEL(0),                          //0B 00 00 00 00 00 00 00
    PROC_YIELD,                             //0E 00 00 00 00 00 00 00
    PROC_CALL_ROUTINE(0x80a8c2c+1),         //02 00 00 00 65 BA 0B 08
    PROC_YIELD,                             //0E 00 00 00 00 00 00 00
    PROC_CALL_ROUTINE(0x80a8cd4+1),         //02 00 00 00 31 BB 0B 08 //THIS ONE SETS UP THE GRAPHICS
    PROC_CALL_ROUTINE(0x80a8f04+1),         //02 00 00 00 5D BD 0B 08
    PROC_YIELD,                             //0E 00 00 00 00 00 00 00
    PROC_CALL_ROUTINE_ARG(NewFadeIn, 8),    //18 00 08 00 3D 29 0C 08
    PROC_WHILE_ROUTINE(FadeInExists),       //14 00 00 00 0D 29 0C 08
    PROC_YIELD,                             //0E 00 00 00 00 00 00 00
    PROC_WHILE_ROUTINE(0x8002a6c+1),        //14 00 00 00 B5 43 00 08
    PROC_CALL_ROUTINE(0x80a9014+1),         //02 00 00 00 6D BE 0B 08
  //main loop?
    PROC_LABEL(2),                          //0B 00 02 00 00 00 00 00
    PROC_LOOP_ROUTINE(Loop6C_savemenu),     //03 00 00 00 7D BE 0B 08 //THIS ONE UPDATES THE SPIN
    PROC_GOTO(0xF),                         //0C 00 0F 00 00 00 00 00
  //what happens if new game
    PROC_LABEL(1),                          //0B 00 01 00 00 00 00 00
      PROC_CALL_ROUTINE(0x80aa1ec+1),
      PROC_CALL_ROUTINE_ARG(NewFadeOut, 8),
      PROC_WHILE_ROUTINE(FadeOutExists),
      PROC_CALL_ROUTINE(0x80ad5b4+1),
      PROC_CALL_ROUTINE(NewNewGameDifficultySelect),
      PROC_YIELD,
      PROC_CALL_ROUTINE(0x80aa30c+1),
      PROC_CALL_ROUTINE(0x80aa1ec+1),
      PROC_CALL_ROUTINE_ARG(NewFadeIn, 8),
      PROC_WHILE_ROUTINE(FadeInExists),
      PROC_CALL_ROUTINE(0x80aa458+1),
  //when choosing a slot to save new game in?
    PROC_LABEL(5),
      PROC_CALL_ROUTINE(0x80aa47c+1),
      PROC_YIELD,
      PROC_LOOP_ROUTINE(0x80a9494+1),
      PROC_GOTO(0xF),
  //sth
    PROC_LABEL(7),
      PROC_SLEEP(5),
      PROC_CALL_ROUTINE(0x80a9d60+1),
      PROC_GOTO(5),
  //update savedata?
    PROC_LABEL(6),
      PROC_SLEEP(1),
      PROC_CALL_ROUTINE(0x80a96dc+1),
      PROC_SLEEP(1),
      PROC_LOOP_ROUTINE(0x80a96ec+1),
      PROC_GOTO(5),
  //
    PROC_LABEL(3),
      PROC_LOOP_ROUTINE(0x80a99c0+1),
      PROC_GOTO(5),
  //
    PROC_LABEL(4),
      PROC_CALL_ROUTINE(0x80aa4b4+1),
      PROC_LOOP_ROUTINE(0x80a9a18+1),
      PROC_GOTO(2),
  //
    PROC_LABEL(8),
      PROC_LOOP_ROUTINE(0x80a9a68+1),
    PROC_LABEL(9),
      PROC_LOOP_ROUTINE(0x80a9ab0+1),
    PROC_LABEL(0xC),
      PROC_CALL_ROUTINE(0x80a9a08+1),
      PROC_LOOP_ROUTINE(0x80a9af4+1),
    PROC_LABEL(0xD),
      PROC_LOOP_ROUTINE(0x80a9b44+1),
    PROC_LABEL(0xA),
      PROC_LOOP_ROUTINE(0x80a9b90+1),
    PROC_LABEL(0xB),
      PROC_CALL_ROUTINE(0x80aa49c+1),
      PROC_YIELD,
      PROC_LOOP_ROUTINE(0x80a9e1c+1),
    PROC_LABEL(0xE),
      PROC_CALL_ROUTINE_ARG(NewFadeOut, 8),
      PROC_WHILE_ROUTINE(FadeOutExists),
      PROC_WHILE_ROUTINE(0x8002950+1),
      PROC_CALL_ROUTINE(0x80aa158+1),
      PROC_YIELD,
      PROC_CALL_ROUTINE(0x80a8c2c+1),
      PROC_YIELD,
      PROC_CALL_ROUTINE(0x80a8cd4+1),
      PROC_CALL_ROUTINE(0x80a8f04+1),
      PROC_YIELD,
      PROC_CALL_ROUTINE_ARG(NewFadeIn, 8),
      PROC_WHILE_ROUTINE(FadeInExists),
      PROC_WHILE_ROUTINE(0x8002950+1),
      PROC_CALL_ROUTINE(0x80aa1bc+1),
    PROC_LABEL(0x15),
      PROC_BLOCK,
    PROC_LABEL(0x12),
      PROC_CALL_ROUTINE_ARG(NewFadeOut, 4),
      PROC_WHILE_ROUTINE(FadeOutExists),
      PROC_GOTO(0xF),
    PROC_LABEL(0x11),
      PROC_CALL_ROUTINE_ARG(NewFadeOut, 8),
      PROC_WHILE_ROUTINE(FadeOutExists),
    PROC_LABEL(0xF),
      PROC_YIELD,
      PROC_CALL_ROUTINE(0x80aa030+1),
      PROC_YIELD,
      PROC_END
};