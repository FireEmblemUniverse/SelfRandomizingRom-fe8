//to be included outside BL Range
#include "gbafe.h"
#include "classes.h"
#include "skills.h"
#include "items.h"
#include "randomizer.h"
#pragma long_calls
#define eventSlot gEventSlot
extern int eventSlot[];

//data
u8 static const PSkills[] = {AcrobatID, PassID, CantoPlusID, WaryFighterID, SureShotID, ProvokeID, SaviorID, MercyID, FrenzyID, AdeptID, LethalityID, LunaID, SolID, AetherID, AstraID, DisciplineID, SwordbreakerID, LancebreakerID, AxebreakerID, BowbreakerID, TomebreakerID, AegisID, PaviseID, DuelistsBlowID, DeathBlowID, DartingBlowID, WardingBlowID, CertainBlowID, ArmoredBlowID, VantageID, DesperationID, WrathID, CounterID, CounterMagicID, MiracleID, SwordfaireID, LancefaireID, AxefaireID, BowfaireID, TomefaireID, LifetakerID, GaleforceID, RenewalID, NiceThighsID, DemoiselleID, GentilhommeID, MaleficAuraID, InspirationID, CharmID, VoiceOfPeaceID, AmaterasuID, SpurStrID, SpurMagID, SpurSpdID, SpurDefID, SpurResID, NihilID, ParagonID, ImpaleID, ColossusID, RallyStrID, RallySklID, RallySpdID, RallyLukID, RallyDefID, RallyResID, RallyMovID, RallySpectrumID, StaffSavantID, LiveToServeID, IgnisID, LifeAndDeathID, LungeID, IntimidateID, CamaraderieID, SavageBlowID, ReliefID, TantivyID, FocusID, BondID, AnathemaID, LilysPoiseID, CelerityID, FieryBloodID, ElbowRoomID, NaturalCoverID, SealStrID, SealSklID, SealSpdID, SealLukID, SealDefID, SealResID, GambleID, PersonalityID, QuickDrawID, WindDiscipleID, StrongRiposteID, PatienceID, PursuitID, LightWeightID, KillingMachineID, CriticalForceID, ChivalryID, PragmaticID, ShoveID, SmiteID, BaneID, RightfulKingID, RightfulGodID, LuckySevenID, OddRhythmID, EvenRhythmID, QuickBurnID, SlowBurnID, DespoilID, PivotID, RepositionID, SwapID, BreathOfLifeID, FuryID, DazzleID, CharismaID, HeroesDeathBlowID, VantagePlusID, HawkeyeID, SolidarityID, BracingStanceID, DartingStanceID, FierceStanceID, KestrelStanceID, MirrorStanceID, ReadyStanceID, SteadyStanceID, SturdyStanceID, SwiftStanceID, WardingStanceID, SpectrumStanceID, CaptureID, BlackMagicID, FortressDefenseID, FortressResistanceID, ForesightID, AxeFaithID, ArmorMarchID, VigorDanceID, ForagerID, FullMetalBodyID, LiquidOozeID, ShadowgiftID, LuminaID, DevilsLuckID, DevilsPactID, DevilsWhimID, PoisonStrikeID, GrislyWoundID, HexID, BarricadeID, BarricadePlusID, PointBlankID};

static const ProcCode RandomOptionsProc[] = {
  PROC_SET_NAME("RandomizerOpt"),
  PROC_CALL_ROUTINE(LockGameLogic),
  PROC_END_ALL(0x8a20b1c),

  PROC_CALL_ROUTINE(RandomOptionsSetup),

    PROC_CALL_ROUTINE_ARG(NewFadeIn, 8),
    PROC_WHILE_ROUTINE(FadeInExists),
    PROC_SLEEP(1),

  PROC_LOOP_ROUTINE(RandomOptionsLoop), //wait for B button
  
  PROC_CALL_ROUTINE_ARG(NewFadeOut, 0x10),
  PROC_WHILE_ROUTINE(FadeOutExists),
  PROC_SLEEP(10),

  PROC_END
};

extern int SpinRoutine1;
extern int SpinRoutine2;

static const ProcCode SpinProc[] = {
  PROC_SET_NAME("SpinnyBoi"),
  PROC_SET_MARK(0xD),
  PROC_CALL_ROUTINE(&SpinRoutine1),
  PROC_LOOP_ROUTINE(&SpinRoutine2),
  PROC_END
};

static const ProcCode NewGameDifficultySelect[] = {
  PROC_SET_NAME("DifficultySelect"),

  PROC_SET_DESTRUCTOR(0x80ac078+1),
  PROC_CALL_ROUTINE(0x80ad5b4+1),
  PROC_YIELD,
  PROC_CALL_ROUTINE(0x80ac1a8+1),
  PROC_SLEEP(1),
  PROC_CALL_ROUTINE(EnableAllGfx),//EnableAllGfx
  PROC_CALL_ROUTINE_ARG(NewFadeIn, 8),
  PROC_WHILE_ROUTINE(FadeInExists),
  PROC_LABEL(0),
  PROC_LOOP_ROUTINE(0x80ac288+1),
  PROC_LABEL(1),
    PROC_CALL_ROUTINE_ARG(NewFadeOut, 8),
    PROC_WHILE_ROUTINE(FadeOutExists),
    PROC_SLEEP(10),
    
      PROC_NEW_CHILD(SpinProc), //one spinny boi

    PROC_NEW_CHILD_BLOCKING(RandomOptionsProc),
    PROC_SLEEP(10),

  PROC_LABEL(2),
  PROC_CALL_ROUTINE_ARG(NewFadeOut, 8),
  PROC_WHILE_ROUTINE(FadeOutExists),
  PROC_CALL_ROUTINE(nullsub_64),

  PROC_YIELD,

  PROC_CALL_ROUTINE(0x80a8c2c+1),
  PROC_YIELD,
  PROC_CALL_ROUTINE(0x80a8cd4+1),
  PROC_CALL_ROUTINE(0x80a8f04+1),
  PROC_YIELD,
  PROC_CALL_ROUTINE(UnlockGameLogic),
  PROC_END
};

static const LocationTable CursorLocationTable[] = {
  {10, 0x18},
  {10, 0x28},
  {10, 0x38},
  {10, 0x48},
  {10, 0x58},
  {10, 0x68},
  {10, 0x78},
  {10, 0x88}
};

//functions
void GenerateBGTsa(u16 *MapOffset, u32 NumberOfTiles, u8 PaletteId, u16 baseTile) {
  for(u16 i = baseTile; i < (baseTile+NumberOfTiles/2)+1; i++) {
    MapOffset[i-baseTile] = (i | (PaletteId << 12));
    MapOffset[NumberOfTiles-(i-baseTile)] = (i | (PaletteId << 12) | (3<<10)); //v and h flipped
  }
}

int FirMode(){
  if (TacticianName[0]=='F'){
    if (TacticianName[1]=='i'){
      if (TacticianName[2]=='r'){
        if (TacticianName[3]==0x0) return 1;
      }
    }
  }
  return 0; 
};

int NamedCharacter(u8 charNum){
  return ((charNum<0x45)|((64<charNum)&(charNum<111)));
};

//POIN to this at $a20164
void DifficultyTacticianSelect(ProcState* input){
  StartBlockingProc(NewGameDifficultySelect, input);
};

//Personal skill randomizer
u8 PersonalSkillGetter(u8 charNum){
  // no personal skills if option not selected
  if (FirMode()) return NiceThighsID;
  if (OptionsSaved->RandomizeSkills != 2) return 0;

  if (NamedCharacter(charNum)){
    u8 num = HashByte_N(charNum, 37, sizeof(PSkills));
    return PSkills[num];
  };
  return 0;
};

//Turn skills off
u8 SkillsOffChecker(){
  return OptionsSaved->RandomizeSkills;
}


void updateRandomOptionsPage(OptionsProc* CurrentProc){

  //clear bg font buffers
  Font_ResetAllocation();
  // ClearBG0BG1();
  FillBgMap(BG0Buffer, 0);
  EnableBgSyncByIndex(0);
  //Print Headings
  DrawTextInline(0, BGLoc(BG0Buffer, 2, 0), 4, 0, 15, "Set Randomization Options");
  //option names
  DrawTextInline(0, BGLoc(BG0Buffer, 2, 3), 3, 0, 7, "% variation:");
  DrawTextInline(0, BGLoc(BG0Buffer, 2, 5), 3, 0, 7, "Don't Change:");
  DrawTextInline(0, BGLoc(BG0Buffer, 2, 7), 3, 0, 6, "Skills:");
  DrawTextInline(0, BGLoc(BG0Buffer, 2, 9), 3, 0, 10, "Peak/Water Units:");
  DrawTextInline(0, BGLoc(BG0Buffer, 2, 11), 3, 0, 8, "Weapon Stats:");
  DrawTextInline(0, BGLoc(BG0Buffer, 2, 13), 3, 0, 8, "Random Items:");
  DrawTextInline(0, BGLoc(BG0Buffer, 2, 15), 3, 0, 5, "Mode:");
  DrawTextInline(0, BGLoc(BG0Buffer, 2, 17), 3, 0, 7, "Map Music:");

  
  //option values
  if (CurrentProc->RandomizeClasses == 0){
    DrawTextInline(0, BGLoc(BG0Buffer, 15, 5), 2, 0, 5, "None");
  }
  else if (CurrentProc->RandomizeClasses == 1){
    DrawTextInline(0, BGLoc(BG0Buffer, 15, 5), 2, 0, 5, "Thieves");
  } 
  else if (CurrentProc->RandomizeClasses == 2){
    DrawTextInline(0, BGLoc(BG0Buffer, 15, 5), 2, 0, 5, "Generics");
  }
  else DrawTextInline(0, BGLoc(BG0Buffer, 15, 5), 2, 0, 5, "Both");

  if (CurrentProc->RandomizeSkills == 0){
    DrawTextInline(0, BGLoc(BG0Buffer, 15, 7), 2, 0, 10, "Vanilla");
  }
  else if (CurrentProc->RandomizeSkills == 1){
    DrawTextInline(0, BGLoc(BG0Buffer, 15, 7), 2, 0, 10, "Class");
  }
  else DrawTextInline(0, BGLoc(BG0Buffer, 15,7), 2, 0, 10, "Class+Personal");

  if (CurrentProc->ClassByTerrain == 0){
    DrawTextInline(0, BGLoc(BG0Buffer, 15, 9), 2, 0, 10, "Pure Random");
  }
  else if (CurrentProc->ClassByTerrain == 1) DrawTextInline(0, BGLoc(BG0Buffer, 15,9), 2, 0, 10, "1 Tile Move");
  else DrawTextInline(0, BGLoc(BG0Buffer, 15,9), 2, 0, 10, "Limit Classes");

  if (CurrentProc->RandomizeItemStats == 0){
    DrawTextInline(0, BGLoc(BG0Buffer, 15, 11), 2, 0, 5, "Fixed");
  }
  else DrawTextInline(0, BGLoc(BG0Buffer, 15, 11), 2, 0, 5, "Random");

  if (CurrentProc->RandomizeChests){
    if (CurrentProc->RandomizeEventItems) DrawTextInline(0, BGLoc(BG0Buffer, 15, 13), 2, 0, 10, "Chests & Events");
    else DrawTextInline(0, BGLoc(BG0Buffer, 15, 13), 2, 0, 5, "Chests");
  }
  else if (CurrentProc->RandomizeEventItems) DrawTextInline(0, BGLoc(BG0Buffer, 15, 13), 2, 0, 5, "Events");
  else DrawTextInline(0, BGLoc(BG0Buffer, 15, 13), 2, 0, 5, "Neither");

  if (CurrentProc->CasualMode == 0){
    DrawTextInline(0, BGLoc(BG0Buffer, 15, 15), 2, 0, 5, "Classic");
  }
  else DrawTextInline(0, BGLoc(BG0Buffer, 15, 15), 2, 0, 5, "Casual");

  if (CurrentProc->RandomizeMusic == 0){
    DrawTextInline(0, BGLoc(BG0Buffer, 15, 17), 2, 0, 5, "Normal");
  }
  else DrawTextInline(0, BGLoc(BG0Buffer, 15, 17), 2, 0, 5, "Random");

  //numbers after text?
  DrawDecNumber(BGLoc(BG0Buffer, 17, 3), 2, CurrentProc->VariationPercent);

  //actually update the options
  OptionsSaved->Variation = CurrentProc->VariationPercent;
  OptionsSaved->RandomizeClasses = CurrentProc->RandomizeClasses;
  OptionsSaved->RandomizeSkills = CurrentProc->RandomizeSkills;
  OptionsSaved->ClassByTerrain = CurrentProc->ClassByTerrain;
  OptionsSaved->RandomizeItemStats = CurrentProc->RandomizeItemStats;
  OptionsSaved->RandomizeChests = CurrentProc->RandomizeChests;
  OptionsSaved->RandomizeEventItems = CurrentProc->RandomizeEventItems;
  OptionsSaved->CasualMode = CurrentProc->CasualMode;
  OptionsSaved->RandomizeMusic = CurrentProc->RandomizeMusic;
};


void RandomOptionsSetup(OptionsProc* CurrentProc){
  //set up bg graphics
  ClearBG0BG1();
  // EnableBgSyncByIndex(1);
  CpuSet(0x859ED70, (0x020228A8 + 16 * 0x20), 0x20); //ui palette


  CpuSet(0x8b1754c+0x20, (0x020228A8 + 8 * 0x20), 0x20); //bg palette

  VBlankIntrWait();
  LZ77UnCompVram(0x8b12db4, 0x6003000); //bg (changed from 0x6008000)
  GenerateBGTsa((u16*)BG1Buffer, 0x280, 8, 0x180); //was BG1Buffer
  FillBgMap(0x6006000, 0); //clear bg0 tilemap
  FillBgMap(0x6006800, 0); //clear bg1 tilemap
  VBlankIntrWait();
  *gColorSpecialEffectsSelectionBuffer = 0xA44; //blending set
  *gBg1ControlBuffer = 0xD03; //priority set
  
  //Load fonts
  // SetupDebugFontForBG(2, 0);
  // SetupDebugFontForOBJ(-1, 14);
  // SetupDebugFontForOBJ(0x6017800, 14);
  InitDefaultFont();
  // InitText(0, 0);

  //set up cursor
  CurrentProc->CursorIndex = 0;
  CurrentProc->VariationPercent = 30;
  CurrentProc->RandomizeClasses = 1;
  CurrentProc->RandomizeSkills = 2;
  CurrentProc->ClassByTerrain = 1;
  CurrentProc->RandomizeItemStats = 1;
  CurrentProc->RandomizeChests = 1;
  CurrentProc->RandomizeEventItems = 1;
  CurrentProc->CasualMode = 0;
  CurrentProc->RandomizeMusic = 1;

  updateRandomOptionsPage(CurrentProc);
  };

void RandomOptionsLoop(OptionsProc* CurrentProc){

  //make snowflakes white
  *(u32*) 0x5000262 = 0x739eFFFF; //fill in the only obj palette colour that matters lol

  // UpdateBG3HOffset();
  UpdateHandCursor(CursorLocationTable[CurrentProc->CursorIndex].x, CursorLocationTable[CurrentProc->CursorIndex].y);

  if (((sInput->newPress & InputStart) != 0)|((sInput->newPress & InputA) != 0)) { //press A or Start to continue
    BreakProcLoop((Proc *)CurrentProc);
    PlaySound(0x6B); 
  };

  if ((sInput->newPress & InputDown) != 0) {
    if (CurrentProc->CursorIndex < CursorMaxIndex) CurrentProc->CursorIndex++;
    else CurrentProc->CursorIndex = 0;
  };

  if ((sInput->newPress & InputUp) != 0) {
    if (CurrentProc->CursorIndex != 0) CurrentProc->CursorIndex--;
    else CurrentProc->CursorIndex = CursorMaxIndex;
  };

  //change variation
  if (CurrentProc->CursorIndex == 0) {
    if ((sInput->newPress & InputLeft) != 0) {
      if (CurrentProc->VariationPercent < 4){
        PlaySound(0xE7);
      }
      else {
        CurrentProc->VariationPercent-=5;
        updateRandomOptionsPage(CurrentProc);
      };
    };

    if ((sInput->newPress & InputRight) != 0) {
      if (CurrentProc->VariationPercent > 99){
        PlaySound(0xE7);
      }
      else {
        CurrentProc->VariationPercent+=5;
        updateRandomOptionsPage(CurrentProc);
      };
    };
  };

  //change thieves/generics
  //0 = None
  //1 = Thieves
  //2 = Generics
  //3 = Both
  if (CurrentProc->CursorIndex == 1) {
    if ((sInput->newPress & InputLeft) != 0) {
      if (CurrentProc->RandomizeClasses == 0) CurrentProc->RandomizeClasses = 3;
      else CurrentProc->RandomizeClasses--;
      updateRandomOptionsPage(CurrentProc);
    };
    if ((sInput->newPress & InputRight) != 0) {
      if (CurrentProc->RandomizeClasses == 3) CurrentProc->RandomizeClasses = 0;
      else CurrentProc->RandomizeClasses++;
      updateRandomOptionsPage(CurrentProc);
    };
  };

  //change personal skills
  // 0 = None
  // 1 = Class only
  // 2 = Random Personal
  if (CurrentProc->CursorIndex == 2) {
    if ((sInput->newPress & InputLeft) != 0) {
      if (CurrentProc->RandomizeSkills == 0) CurrentProc->RandomizeSkills = 2;
      else CurrentProc->RandomizeSkills -= 1;
      updateRandomOptionsPage(CurrentProc);
    };
    if ((sInput->newPress & InputRight) != 0) {
      if (CurrentProc->RandomizeSkills == 2) CurrentProc->RandomizeSkills = 0;
      else CurrentProc->RandomizeSkills += 1;
      updateRandomOptionsPage(CurrentProc);
    };
  };

    //change class by seed
  if (CurrentProc->CursorIndex == 3) {
    if ((sInput->newPress & InputLeft) != 0) {
      if (CurrentProc->ClassByTerrain == 0) CurrentProc->ClassByTerrain = 2;
      else CurrentProc->ClassByTerrain--;
      updateRandomOptionsPage(CurrentProc);
    };
    if ((sInput->newPress & InputRight) != 0) {
      if (CurrentProc->ClassByTerrain == 2) CurrentProc->ClassByTerrain = 0;
      else CurrentProc->ClassByTerrain++;
      updateRandomOptionsPage(CurrentProc);
    };
  };

  //change item stats
  if (CurrentProc->CursorIndex == 4) {
    if ((sInput->newPress & InputLeft) != 0) {
      if (CurrentProc->RandomizeItemStats == 0) CurrentProc->RandomizeItemStats = 1;
      else CurrentProc->RandomizeItemStats = 0;
      updateRandomOptionsPage(CurrentProc);
    };
    if ((sInput->newPress & InputRight) != 0) {
      if (CurrentProc->RandomizeItemStats == 0) CurrentProc->RandomizeItemStats = 1;
      else CurrentProc->RandomizeItemStats = 0;
      updateRandomOptionsPage(CurrentProc);
    };
  };

  //change chests/events
  //order is none -> chests -> events -> both -> none
  if (CurrentProc->CursorIndex == 5) {
    if ((sInput->newPress & InputLeft) != 0) {
      if (CurrentProc->RandomizeChests == 0) {
        if (CurrentProc->RandomizeEventItems == 0) { //case None, set to Both
          CurrentProc->RandomizeChests=1;
          CurrentProc->RandomizeEventItems=1;
        }
        else {//case Events only, set to chests only
          CurrentProc->RandomizeChests=1;
          CurrentProc->RandomizeEventItems=0;
        }
      }
      else CurrentProc->RandomizeChests=0;
      updateRandomOptionsPage(CurrentProc);
    };
    if ((sInput->newPress & InputRight) != 0) {
      if (CurrentProc->RandomizeChests){
        if (CurrentProc->RandomizeEventItems) { //case Both, set to None
          CurrentProc->RandomizeChests=0;
          CurrentProc->RandomizeEventItems=0;
        }
        else {//case Events only, set to chests only
          CurrentProc->RandomizeChests=0;
          CurrentProc->RandomizeEventItems=1;
        }
      }
      else CurrentProc->RandomizeChests=1;
      updateRandomOptionsPage(CurrentProc);
    };
  };

  //change casual mode
  if (CurrentProc->CursorIndex == 6) {
    if ((sInput->newPress & InputLeft) != 0) {
      if (CurrentProc->CasualMode == 0) CurrentProc->CasualMode = 1;
      else CurrentProc->CasualMode = 0;
      updateRandomOptionsPage(CurrentProc);
    };
    if ((sInput->newPress & InputRight) != 0) {
      if (CurrentProc->CasualMode == 0) CurrentProc->CasualMode = 1;
      else CurrentProc->CasualMode = 0;
      updateRandomOptionsPage(CurrentProc);
    };
  };

  //change random music
  if (CurrentProc->CursorIndex == 7) {
    if ((sInput->newPress & InputLeft) != 0) {
      if (CurrentProc->RandomizeMusic == 0) CurrentProc->RandomizeMusic = 1;
      else CurrentProc->RandomizeMusic = 0;
      updateRandomOptionsPage(CurrentProc);
    };
    if ((sInput->newPress & InputRight) != 0) {
      if (CurrentProc->RandomizeMusic == 0) CurrentProc->RandomizeMusic = 1;
      else CurrentProc->RandomizeMusic = 0;
      updateRandomOptionsPage(CurrentProc);
    };
  };
};

int GetItemMight(Item item){
  u8 itemID = (u8) item;
  const ItemData* data = GetItemData(itemID);
  int might = data->might;
  if(OptionsSaved->RandomizeItemStats) might = HashByPercentage(might, itemID);
  return might;
};

int GetItemHit(Item item){
  u8 itemID = (u8) item;
  const ItemData* data = GetItemData(itemID);
  int hit = data->hit;
  if(OptionsSaved->RandomizeItemStats) hit = (3 * HashByPercentage(hit, itemID) + HashByPercentage(hit, itemID+43))/4;
  return hit;
};

int GetItemWeight(Item item){
  u8 itemID = (u8) item;
  const ItemData* data = GetItemData(itemID);
  int weight = data->weight;
  if(OptionsSaved->RandomizeItemStats) weight = HashByPercentage(weight, itemID);
  return weight;
};

int GetItemCrit(Item item){
  u8 itemID = (u8) item;
  const ItemData* data = GetItemData(itemID);
  int crit = data->crit;
  if(OptionsSaved->RandomizeItemStats) crit = HashByPercentage(crit, itemID);
  return crit;
};

// int GetItemMaxUses(Item item){
//   return randItemMaxUses(item);
// }; //not working lol

int GetTerrainType(int x, int y){
  if((x>gMapSize.x)||(y>gMapSize.y)||(x<0)||(y<0)) return 0;//outside map
  u8 terrain = gMapTerrain[y][x];
  return terrain;
};

int CheckIfStuck(Unit* unit, const u8 MovCostTable[]){
  u16 x = unit->xPos;
  u16 y = unit->yPos;
  int t = GetTerrainType(x-1, y);
  if (MovCostTable[t]>=31){
    t = GetTerrainType(x+1,y);
    if (MovCostTable[t]>=31){
      t = GetTerrainType(x,y-1);
      if (MovCostTable[t]>=31){
        t = GetTerrainType(x,y+1);
        if (MovCostTable[t]>=31){
          return MovGetter(unit);
        }
      }
    }
  }
  return 0;
};

void StoreMovCostTable(const u8 MovCostTable[], int unk1, Unit* currentUnit){
  // extern int AcrobatID;//
  extern u8 gMovCostTableBuffer[];
  Unit* unit;
  if(&(gActiveUnit->pCharacterData)==0){ //if danger zone
    unit = currentUnit;
  }
  else unit = gActiveUnit;
  int acro = SkillCheckerThumb(unit, (u8) AcrobatID);
  int stuck = 0;
  if (OptionsSaved->ClassByTerrain) stuck =CheckIfStuck(unit, MovCostTable); //returns 0 or unit's max move

  for (int i = 0; i <= 0x40; ++i)
  {
    u8 cost = MovCostTable[i];
    if(acro && (cost>0) && (cost<31)) cost = 1;
    if(stuck && (cost==31)) cost = stuck;
    gMovCostTableBuffer[i]=cost;
  }
};

// extern Round* gpCurrentRound;

// void MakeBattle(){
//   BattleUnit* attacker;
//   BattleUnit* defender;

//   ClearRounds();
//   GetBattleUnitPointers(&attacker, &defender);

//   gpCurrentRound->startFlag=1;
//   if (MakeBattleRound(attacker,defender) == 0){
//     gpCurrentRound->counterAtkFlag=1;
//     if (MakeBattleRound(defender,attacker) == 0){
//       if (BattleCheckDoubling(attacker, defender)) {
//         gpCurrentRound->followUpFlag=1;
//         MakeBattleRound(attacker,defender);
//       }
//     }
//   }
//   gpCurrentRound->endFlag=1;
// }

#pragma long_calls_off