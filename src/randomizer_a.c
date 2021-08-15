//to be included outside BL Range
#include "gbafe.h"
#include "classes.h"
#include "skills.h"
#include "items.h"
#include "randomizer.h"
#pragma long_calls
#define eventSlot gEventSlot
extern int eventSlot[];
extern int WATP_ID;

//data
u8 static const Weapons[] = {itemIronSword, itemSlimSword, itemSteelSword, itemSilverSword, itemIronBlade, itemSteelBlade, itemSilverBlade, itemPoisonSword, itemBraveSword, itemShamshir, itemKillingEdge, itemArmourslayer, itemWyrmslayer, itemLightBrand, itemRunesword, itemLancereaver, itemLongsword, itemIronLance, itemSlimLance, itemSteelLance, itemSilverLance, itemPoisonLance, itemBraveLance, itemKillerLance, itemHorseslayer, itemJavelin, itemSpear, itemAxereaver, itemIronAxe, itemSteelAxe, itemSilverAxe, itemPoisonAxe, itemBraveAxe, itemKillerAxe, itemHalberd, itemHammer, itemDevilAxe, itemHandAxe, itemTomahawk, itemSwordreaver, itemSwordslayer, itemHatchet, itemIronBow, itemSteelBow, itemSilverBow, itemPoisonBow, itemKillerBow, itemBraveBow, itemShortBow, itemLongbow, itemBallista, itemIronBallista, itemKillerBallista, itemFire, itemThunder, itemElfire, itemBolting, itemFimbulvetr, itemLightning, itemShine, itemDivine, itemPurge, itemAura, itemFlux, itemLuna, itemNosferatu, itemEclipse, itemFenrir, itemHeal, itemMend, itemRecover, itemPhysic, itemFortify, itemRestore, itemSilence, itemSleep, itemBerserk, itemWarp, itemRescue, itemTorchStaff, itemHammerne, itemUnlock, itemBarrier, itemDragonAxe, itemShadowKiller, itemBrightLance, itemFiendCleaver, itemBeaconBow, itemBattleAxe, itemDragonSpear, itemHeavySpear, itemShortSpear, itemWindSword};
u8 static const WeaponsRare[] = {itemGleipnir, itemExcalibur,itemIvaldi, itemLatona, itemVidofnir, itemNaglfar, itemAudomra, itemGarm, itemNidhogg, itemHolyDragonStone};
u8 static const Items[] = {itemAngelicRobe, itemEnergyRing, itemSecretBook, itemSpeedwings, itemGoddessIcon, itemDragonshield, itemTalisman, itemBoots, itemBodyRing, itemHeroCrest, itemKnightCrest, itemOrionBolt, itemElysianWhip, itemGuidingRing, itemMasterProof, itemMoonBracelet, itemSunBracelet, itemSkillScroll, itemAmnesiaScroll};
u8 static const ItemsRare[] = {itemLockpick, itemVulnerary, itemElixir, itemPureWater, itemAntidote, itemTorch, itemDelphiShield, itemMemberCard, itemSilverCard, itemWhiteGem, itemBlueGem, itemRedGem, itemMine, itemLightRune, itemHoplonShield, itemFillasMight, itemNinissGrace, itemThorsIre, itemSetsLitany, itemBlackGem, itemGoldGem};
u8 static const T1Classes[] = {Thief, EphraimLord, EirikaLord, Cavalier, Cavalier_F, Knight, Knight_F, Mercenary, Mercenary_F, Myrmidon, Myrmidon_F, Archer, Archer_F, WyvernRider, WyvernRider_F, Mage, Mage_F, Shaman, Shaman_F, Recruit_2, Fighter, Brigand, Pirate, Monk, Priest, PegasusKnight, Cleric, Bard, Troubadour, Dancer, Soldier, Revenant, Bonewalker, Bonewalker_Bow, Bael, Mauthedoog, Tarvos, Mogall, Gargoyle, Journeyman_2, Pupil_2};
u8 static const T2Classes[] = {EphraimMasterLord, EirikaMasterLord, Paladin, Paladin_F, General, General_F, Hero, Hero_F, Swordmaster, Swordmaster_F, Assassin, Assassin_F, Sniper, Sniper_F, Ranger, Ranger_F, WyvernLord, WyvernLord_F, WyvernKnight, WyvernKnight_F, Sage, Sage_F, MageKnight, MageKnight_F, Bishop, Bishop_F, Druid, Druid_F, Summoner, Summoner_F, Rogue, GreatKnight, GreatKnight_F, Journeyman_3, Pupil_3, Recruit_3, Warrior, Berserker, FalcoKnight, Valkyrie, Entombed, Wight, Wight_Bow, ElderBael, Cyclops, Gwyllgi, Maelduin, ArchMogall, Gorgon, Deathgoyle};
u8 static const T1Peakwalkers[] = {Brigand, Bael, Brigand, Bael, Brigand, Bael, PegasusKnight, WyvernRider, WyvernRider_F, Gargoyle, Mogall};
u8 static const T1Fliers[] = {PegasusKnight, WyvernRider, WyvernRider_F, Gargoyle, Mogall};
u8 static const T1Waterwalkers[] = {Pirate, Pirate, Pirate, Pirate, PegasusKnight, WyvernRider, WyvernRider_F, Gargoyle, Mogall};
u8 static const T2Peakwalkers[] = {Berserker, ElderBael, Berserker, ElderBael, Berserker, ElderBael, FalcoKnight, WyvernKnight, WyvernKnight_F, WyvernLord, WyvernLord_F, Deathgoyle, ArchMogall};
u8 static const T2Fliers[] = {FalcoKnight, WyvernKnight, WyvernKnight_F, WyvernLord, WyvernLord_F, Deathgoyle, ArchMogall};
u8 static const T2Waterwalkers[] = {Berserker, Berserker, Berserker, Berserker, FalcoKnight, WyvernKnight, WyvernKnight_F, WyvernLord, WyvernLord_F, Deathgoyle, ArchMogall};

//nomonster versions
u8 static const NM_T1Classes[] = {Thief, EphraimLord, EirikaLord, Cavalier, Cavalier_F, Knight, Knight_F, Mercenary, Mercenary_F, Myrmidon, Myrmidon_F, Archer, Archer_F, WyvernRider, WyvernRider_F, Mage, Mage_F, Shaman, Shaman_F, Recruit_2, Fighter, Brigand, Pirate, Monk, Priest, PegasusKnight, Cleric, Bard, Troubadour, Dancer, Soldier, Journeyman_2, Pupil_2};
u8 static const NM_T2Classes[] = {EphraimMasterLord, EirikaMasterLord, Paladin, Paladin_F, General, General_F, Hero, Hero_F, Swordmaster, Swordmaster_F, Assassin, Assassin_F, Sniper, Sniper_F, Ranger, Ranger_F, WyvernLord, WyvernLord_F, WyvernKnight, WyvernKnight_F, Sage, Sage_F, MageKnight, MageKnight_F, Bishop, Bishop_F, Druid, Druid_F, Summoner, Summoner_F, Rogue, GreatKnight, GreatKnight_F, Journeyman_3, Pupil_3, Recruit_3, Warrior, Berserker, FalcoKnight, Valkyrie};
u8 static const NM_T1Peakwalkers[] = {Brigand, Brigand, Brigand, PegasusKnight, WyvernRider, WyvernRider_F};
u8 static const NM_T1Fliers[] = {PegasusKnight, PegasusKnight, WyvernRider, WyvernRider_F};
u8 static const NM_T1Waterwalkers[] = {Pirate, Pirate, Pirate, Pirate, PegasusKnight, PegasusKnight, WyvernRider, WyvernRider_F};
u8 static const NM_T2Peakwalkers[] = {Berserker, Berserker, Berserker, FalcoKnight, WyvernKnight, WyvernKnight_F, WyvernLord, WyvernLord_F};
u8 static const NM_T2Fliers[] = {FalcoKnight, FalcoKnight, WyvernKnight, WyvernKnight_F, WyvernLord, WyvernLord_F};
u8 static const NM_T2Waterwalkers[] = {Berserker, Berserker, Berserker, Berserker, FalcoKnight, FalcoKnight, WyvernKnight, WyvernKnight_F, WyvernLord, WyvernLord_F};


u8 static const MapMusicList[] = {4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,36,37,38,49,50,55,69,84, 0xC0}; //0xc0 is WATP_ID
//functions

//hook at 801096c
// rather, 8030e28
void ClearDebuffsBeforePrepScreen(int something){
  for (int i = 0; i < 100; ++i)
  {
    *(Debuff_Table+i) = 0;
  };
  // HideAllUnits(something);
  ClearLocalEvents(something);
};

//take number and modify by 25%, using RNG 
u8 RandomizeByPercentage(u8 number){
  int variation = OptionsSaved->Variation;
  if (variation==0) return number;
  int percentage = NextRN_N(variation*2) + (100-variation); //75-125%
  int ret = ((number * percentage)/100);
  if (ret < 0) ret = 0;
  return (u8) ret;
};

u8 HashByte_N(u8 number, u8 noise, int max){
  if (max==0) return 0;
  u32 hash = 5381;
  for (int i = 0; i < 9; ++i){
    if (TacticianName[i]==0) break;
    hash = (hash ^ TacticianName[i]) * 33;
  };
  hash = (hash ^ number) * 33;
  hash = (hash ^ noise) * 0x7FFFFFFF;
  
  return (u16) hash % max;
};

s8 HashByPercentage(s8 number, u8 noise){
  if (number < 0) number = 0;
  int variation = OptionsSaved->Variation;
  int percentage = HashByte_N(number, noise, variation*2); //rn up to 150 e.g. 125
  percentage += (100-variation); // 125 + 25 = 150
  int ret = percentage * number / 100; //1.5 * 120 (we want to negate this)
  if (ret > 127) ret = (200 - percentage) * number / 100;
  if (ret < 0) ret = 0;
  return ret;
};

//TODO: support metis boosts and teq stuff

u8 Get_Hp_Growth(Unit* unit){
  CharacterData* charData = unit->pCharacterData;
  u8 baseGrowth = charData->growthHP;
  int unrounded = (int) HashByPercentage(baseGrowth, 37);
  unrounded = (unrounded+2)/5;
  return 5*unrounded;
};

u8 Get_Str_Growth(Unit* unit){
  CharacterData* charData = unit->pCharacterData;
  u8 baseGrowth = charData->growthPow;
  int unrounded = (int) HashByPercentage(baseGrowth, 43);
  unrounded = (unrounded+2)/5;
  return 5*unrounded;
};

u8 Get_Skl_Growth(Unit* unit){
  CharacterData* charData = unit->pCharacterData;
  u8 baseGrowth = charData->growthSkl;
  int unrounded = (int) HashByPercentage(baseGrowth, 53);
  unrounded = (unrounded+2)/5;
  return 5*unrounded;
};

u8 Get_Spd_Growth(Unit* unit){
  CharacterData* charData = unit->pCharacterData;
  u8 baseGrowth = charData->growthSpd;
  int unrounded = (int) HashByPercentage(baseGrowth, 17);
  unrounded = (unrounded+2)/5;
  return 5*unrounded;
};

u8 Get_Def_Growth(Unit* unit){
  CharacterData* charData = unit->pCharacterData;
  u8 baseGrowth = charData->growthDef;
  int unrounded = (int) HashByPercentage(baseGrowth, 23);
  unrounded = (unrounded+2)/5;
  return 5*unrounded;
};

u8 Get_Res_Growth(Unit* unit){
  CharacterData* charData = unit->pCharacterData;
  u8 baseGrowth = charData->growthRes;
  int unrounded = (int) HashByPercentage(baseGrowth, 11);
  unrounded = (unrounded+2)/5;
  return 5*unrounded;
};

u8 Get_Luk_Growth(Unit* unit){
  CharacterData* charData = unit->pCharacterData;
  u8 baseGrowth = charData->growthLck;
  int unrounded = (int) HashByPercentage(baseGrowth, 19);
  unrounded = (unrounded+2)/5;
  return 5*unrounded;
};

//randomize unit bases
void LoadUnitStats_Randomized(Unit* unit, CharacterData* charData){
  ClassData* class = unit->pClassData;
  s8 baseHP = class->baseHP + charData->baseHP;
  unit->maxHP = (HashByPercentage(baseHP, 43) + HashByPercentage(baseHP, 3)*3)/4 + 1; //1.5RN HP, +1 in case 0 hp lol
  s8 basePow = class->basePow + charData->basePow;
  unit->pow = HashByPercentage(basePow, 5);
  s8 baseSkl = class->baseSkl + charData->baseSkl;
  unit->skl = HashByPercentage(baseSkl, 7);
  s8 baseSpd = class->baseSpd + charData->baseSpd; //TODO: handle negative base spd
  unit->spd = HashByPercentage(baseSpd, 11);
  s8 baseDef = class->baseDef + charData->baseDef;
  unit->def = HashByPercentage(baseDef, 13);
  s8 baseRes = class->baseRes + charData->baseRes;
  unit->res = HashByPercentage(baseRes, 17);
  s8 baseLck = charData->baseLck;
  unit->lck = HashByPercentage(baseLck, 19);
  unit->conBonus = 0;

  //skipping unit wranks, class only
  int i;
  for (i=0; i<8; i++){
    unit->ranks[i] = class->ranks[i];
  };
  if (unit->index & 0xc0){ //enemies and npcs have -- exp
    unit->exp = 0xFF;
  };
  if (unit->level == 20){ //units with lv20 have -- exp
    unit->exp = 0xFF;
  };
};

int IsT2(u8 classID){
  for (int i=0; i < sizeof(T2Classes); i++){
    if (T2Classes[i] == classID) return 1;
  };
  return 0;
};

int IsT1(u8 classID){
  for (int i=0; i < sizeof(T1Classes); i++){
    if (T1Classes[i] == classID) return 1;
  };
  return 0;
};

Unit* LoadUnitWrapper(EventUnit* eventdata){
  //basically if it's a (non-monster) generic and we're not randomizing generics
  if (eventdata->monsterFlag){
    return LoadUnit(eventdata);
  }
  else if (NamedCharacter(eventdata->charIndex)) {
    return LoadUnit(eventdata);
  }
  else if (FirMode()) {
    return LoadUnit(eventdata);
  }
  else if (OptionsSaved->RandomizeClasses & 2) {
    return LoadNormalUnit(eventdata);
  }
  else return LoadUnit(eventdata);
}

int RandomizeUnitClass(EventUnit* eventdata){
  u8 originalClass = eventdata->classIndex;
  int a;
  int r = 0;
  int named = NamedCharacter(eventdata->charIndex);

  r = NextRN_N(2); //2 choices of class!

  if (named) r = 0; //named characters don't randomize
  //lol
  if (FirMode()){
    if (IsT2(originalClass)) return Sniper_F;
    return Archer_F;
  }

  if(originalClass==GhostFighter) return originalClass; //hardcode phantoms to be phantoms

  //if random monster and don't randomize generics option is on:
  if ((eventdata->monsterFlag) & (OptionsSaved->RandomizeClasses & 2)) {
    return GenerateMonsterClass(eventdata->classIndex);
  }
  else {
    //handle units on mountains/seas?
    if (OptionsSaved->ClassByTerrain==2){
      int terrain = GetTerrainType(eventdata->xPosition, eventdata->yPosition);
      switch(terrain){
        case Thicket:
        case Bridge_2:
        case Fence_1:
        case Cliff:
        case Building_2:
        case Fence_2:
        case Sky:
        case Deeps:
        case Barrel:
        case Bone:
        case Dark:
        case Gunnels:
          if (IsT2(originalClass)){
            if (named & (OptionsSaved->PlayableMonsters==0)) return NM_T2Fliers[HashByte_N(originalClass+(*chapNum), 29+r, sizeof(NM_T2Fliers))];
            else return  T2Fliers[HashByte_N(originalClass+(*chapNum), 29+r, sizeof(T2Fliers))];
          }
          else {
            if (named & (OptionsSaved->PlayableMonsters==0)) return NM_T1Fliers[HashByte_N(originalClass+(*chapNum), 13+r, sizeof(NM_T1Fliers))];
            else return T1Fliers[HashByte_N(originalClass+(*chapNum), 13+r, sizeof(T1Fliers))];
          }
        case Sea:
        case Lake:
        case Water:
          if (IsT2(originalClass)){
            if (named & (OptionsSaved->PlayableMonsters==0)) return NM_T2Waterwalkers[HashByte_N(originalClass+(*chapNum), 7+r, sizeof(NM_T2Waterwalkers))];
            else return  T2Waterwalkers[HashByte_N(originalClass+(*chapNum), 7+r, sizeof(T2Waterwalkers))];
          }
          else {
            if (named & (OptionsSaved->PlayableMonsters==0)) return NM_T1Waterwalkers[HashByte_N(originalClass+(*chapNum), 31+r, sizeof(NM_T1Waterwalkers))];
            else return T1Waterwalkers[HashByte_N(originalClass+(*chapNum), 31+r, sizeof(NM_T1Waterwalkers))];
          }
        case Peak:
          if (IsT2(originalClass)){
            if (named & (OptionsSaved->PlayableMonsters==0)) return NM_T2Peakwalkers[HashByte_N(originalClass+(*chapNum), 17+r, sizeof(NM_T2Peakwalkers))];
            else return  T2Peakwalkers[HashByte_N(originalClass+(*chapNum), 17+r, sizeof(T2Peakwalkers))];
          }
          else {
            if (named & (OptionsSaved->PlayableMonsters==0)) return NM_T1Peakwalkers[HashByte_N(originalClass+(*chapNum), 37+r, sizeof(NM_T1Peakwalkers))];
            else return T1Peakwalkers[HashByte_N(originalClass+(*chapNum), 37+r, sizeof(T1Peakwalkers))];
          }
      }
    }

    //handle trainees & myrrh
    switch(originalClass){
      case Thief:
        if (OptionsSaved->RandomizeClasses & 1) return originalClass; //randomize thieves or both
      case Manakete_2_F:
      case Manakete:
      case Recruit_1:
      case Pupil_1:
      case Journeyman_1:
      case 0:
        if (named & (OptionsSaved->PlayableMonsters==0)) a = NM_T1Classes[HashByte_N(originalClass+(*chapNum), 29+r, sizeof(NM_T1Classes))];
        else a = T1Classes[HashByte_N(originalClass+(*chapNum), 29+r, sizeof(T1Classes))];
        return a;
      case Rogue:
        if (OptionsSaved->RandomizeClasses & 1) return originalClass; //
      default:
        //check if original is t1
        if (IsT1(originalClass)){
          if (named & (OptionsSaved->PlayableMonsters==0)) return NM_T1Classes[HashByte_N(originalClass+(*chapNum), 17+r, sizeof(NM_T1Classes))]; 
          else return T1Classes[HashByte_N(originalClass+(*chapNum), 17+r, sizeof(T1Classes))];
        };
        if (IsT2(originalClass)){
          if (named & (OptionsSaved->PlayableMonsters==0)) return NM_T2Classes[HashByte_N(originalClass+(*chapNum), 23+r, sizeof(NM_T2Classes))]; 
          else return T2Classes[HashByte_N(originalClass+(*chapNum), 23+r, sizeof(T2Classes))];
        };
        //else just the original
        return (int) originalClass;
    };
  }
};

int NewPortraitGetter(int mugID){
  int num = mugID; //return offset of portrait in table (or fir)
  if (FirMode()){
   if (0x64 < mugID && mugID < 0x69) num = 0xac; //shopfir
   else num = 1; //fir
  }
  //if randomize units - hash num i guess
  return 0x88acbc4 + (28*num);
};

int NameStringWrapper(int textID){
  int num = textID;
  extern int FirName;
  if (FirMode()) num = (u16) (&FirName);
  //if randomize units also hash num again??? shit this won't work
  return GetStringFromIndex(num);
};

char* TactNameStringWrapper(){
  static char* const textBuffer = (char* const) (0x0202a6ac);
  for (int i = 0; i < 10; ++i)
  {
    if (TacticianName[i]){
      textBuffer[i] = TacticianName[i];
    }
    else {
      textBuffer[i] = 0;
      break;
    }
  }
  return textBuffer;
};

int CasualModeCheck(){
  return OptionsSaved->CasualMode;
};


///bl at 839a8 and nop 8 times
int NewCheckCHES(u8 num, u8 unk1, LOCAstack* stack, LOCAdata* LOCA){
  stack->unk2 = num;
  stack->EventID = LOCA->EventID;
  stack->CommandID = LOCA->CommandID;
  enum itemGroup {
    chestGold=0,
    chestWeapons=25, 
    chestWeaponsRare=50, 
    chestItems=55, 
    chestItemsRare=80};    

  if (OptionsSaved->RandomizeChests) {
    int chance = NextRN_N(100);
    if(chance<chestWeapons){
      //give gold
      stack->ItemID = 0x77;
      stack->GoldAmount = (NextRN_N(15)+5)*1000;
    }
    else if (chance < chestWeaponsRare){
      //give weapon
      stack->ItemID = Weapons[NextRN_N(sizeof(Weapons))];
      stack->GoldAmount = 0;
    }
    else if (chance < chestItems){
      //give legendary weapon
      stack->ItemID = WeaponsRare[NextRN_N(sizeof(WeaponsRare))];
      stack->GoldAmount = 0;
    }
    else if (chance < chestItemsRare){
      //give item
      stack->ItemID = Items[NextRN_N(sizeof(Items))];
      stack->GoldAmount = 0;
    }
    else {
      //give rare item
      stack->ItemID = ItemsRare[NextRN_N(sizeof(ItemsRare))];
      stack->GoldAmount = 0;
    }
  }
  else {
    stack->ItemID = LOCA->ItemID;
    stack->GoldAmount = LOCA->GoldAmount;
  };
  return 1;
};

void RandomizeEventItem(ProcState* CurrentProc, Unit* CurrentUnit, int ItemID){
  int give = ItemID;
  enum evItemsGroup {
    eventWeapons=0, 
    eventWeaponsRare=35, 
    eventItems=40, 
    eventItemsRare=85};
  if (OptionsSaved->RandomizeEventItems){
    int chance = NextRN_N(100);
    if(chance<eventWeaponsRare){
      //give weapon
      give = Weapons[NextRN_N(sizeof(Weapons))];
    }
    else if (chance < eventItems){
      //give legendary weapon
      give = WeaponsRare[NextRN_N(sizeof(WeaponsRare))];
    }
    else if (chance < eventItemsRare){
      //give item
      give = Items[NextRN_N(sizeof(Items))];
    }
    else {
      //give rare item
      give = ItemsRare[NextRN_N(sizeof(ItemsRare))];
    }
  };
  NewItemGot(CurrentProc, CurrentUnit, give);
};

int Roll2RNWrapper(int num){
  if(ThraciaMode()) return Roll1RN(num);
  return Roll2RN(num);
};

void ThraciaHitCapping(int unused, u16* finalHit, s16 hit){
  if(ThraciaMode()){
    if(hit<1) hit = 1;
    if(hit>99) hit = 99;
  } else {
    if(hit<0) hit = 0;
    if(hit>100) hit = 100;
  }
  *finalHit = hit;
};

int FirMusicWrapper(){
  if(FirMode()) return (u16) &WATP_ID;
  // else if (OptionsSaved->RandomizeMusic) return SoundRoomTable[HashByte_N(*chapNum, *turnNum + *currentPhase, 0x44)].songID;
  else if (OptionsSaved->RandomizeMusic) return MapMusicList[HashByte_N(*chapNum, *turnNum ^ (*currentPhase >> 6), sizeof(MapMusicList))]; //we have to limit this to map music
  else return GetCurrentMapMusicIndex();
};

int RandomizeBattleMusic(u8 isDefending){ //passes result to RandomizeBattleMusicWrapper which puts it in r6
  if(OptionsSaved->RandomizeMusic) return SoundRoomTable[NextRN_N(0x44)].songID;
  else if (isDefending) return 0x1A;
  else return 0x19;
};

int SpeedUpAnims(u16 AISPointer[], u16 duration){
  u16 ret = duration-1;
  if(sInput->currentPress & InputB) ret++;
  else if(sInput->currentPress & InputA) ret = 0;
  AISPointer[3] = ret;
  return ret;
};

int DevilEffectVanillaFix(u16 item){
  if(OptionsSaved->RandomizeSkills==0) return GetItemWeaponEffect(item);
  //if not, the devil mode flag will already be set
  asm("ldr r0, =0x203a608\n\
       ldr r3, [r0]\n\
       ldr r2, [r3]\n\
       lsl r1, r2, #0xD\n\
       lsr r1, r1, #0xD\n\
       pop {r0}\n\
       pop {r0}\n\
       mov r0, #0x80\n\
       and r1, r0\n\
       cmp r1, #0x0\n\
       bne goto_2b713\n\
       ldr r0, =0x802b6f1\n\
       bx r0\n\
       goto_2b713:\n\
       ldr r0, =0x802b713\n\
       bx r0");
  return 0;
};


#pragma long_calls_off