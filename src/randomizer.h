#ifndef __RANDOMIZEH__
#define __RANDOMIZEH__

#pragma long_calls
#include "terrain.h"
char* GetTacticianNameString(); //0x80314E5
int NextRN_N(int max);
void HideAllUnits(int something);
u32* const Debuff_Table = (u32*) 0x203f100;
u8* const chapNum = (u8*) 0x202bcfe;
u8* const currentPhase = (u8*) 0x202bcff;
#define PLAYER_PHASE 0;
#define ALLY_PHASE 0x40;
#define ENEMY_PHASE 0x80;
u16* const turnNum = (u16*) 0x202bd00;
void LoadBgConfig(u8 Value);
extern int SkillCheckerThumb(Unit* unit, u8 skillID);

// extern int gMapTerrain;

typedef struct Round {
  u32 critFlag: 1; //1
  u32 missFlag: 1; //2
  u32 followUpFlag: 1; //4
  u32 counterAtkFlag: 1; //8
  u32 braveFlag: 1; //10
  u32 unk0_5: 1; //20
  u32 poisonFlag: 1; //40
  u32 devilFlag: 1; //80
  u32 stealHPFlag: 1; //1 00 also used for updating attacker's hp
  u32 unk1_1: 1; //2 00
  u32 triAtkFlag: 1; //4 00
  u32 lethalityFlag: 1; //8 00
  u32 unk1_4: 1; //10 00 no counter???
  u32 stoneFlag: 1; //20 00
  u32 sureShotFlag: 1; //40 00 also used for offensive skills
  u32 greatShieldFlag: 1; //80 00 also used for defensive skills
  u32 pierceFlag: 1; //1 00 00
  u32 unk2_1: 2; //20000, 4 00 00
  u32 startFlag: 4; //8 00 00
  u32 endFlag: 1;
  // u32 unk2_3: 4; //10 00 00, 20 00 00, 40 00 00, 80 00 00
  u32 dmg: 8; //FF 00 00 00
  /// end of original round data
  u8 activeSkill; //skill ID
  s8 HPChange; //+- HP for attacker or number of Astra attacks???
  u8 AstraAttacks; //could probably be used for sth else too
  u8 padding;
} Round;

typedef struct SoundRoomData {
  int songID;
  int songLength;
  int displayCondition;
  int songName;
} SoundRoomData;

typedef struct { //used for chests
  u16 EventCode;//0
  u16 EventID;//2
  u16 ItemID;//4
  u16 GoldAmount;//6
  u8  xPos; //8
  u8  yPos; //9
  u16 CommandID; //0a
} LOCAdata;

typedef struct { //used for chests
  u32 unk1; //0 pointer to locadata?
  u32 unk2; //4 set to 1
  u32 EventID; //8
  u32 CommandID; //c
  u32 GoldAmount; //10
  u32 ItemID; //14
} LOCAstack;

typedef struct {
  u32 x;
  u32 y;
} LocationTable;

typedef struct {
  u8 Variation;
  
  u8 Unused0:1; //1
  u8 RandomizeSkills:2;//2
  u8 ClassByTerrain:2;//8
  u8 RandomizeItemStats:1;//20
  u8 RandomizeChests:1;//40
  u8 RandomizeEventItems:1;//80

  u16 CasualMode:1;//1
  u16 RandomizeMusic:1;//2
  u16 RandomizeClasses:2; //2
  u16 UnusedShort:12;
} OptionsStruct;

typedef struct {
  Proc Header;
  u8 CursorIndex;
  u8 VariationPercent;
  u8 RandomizeClasses;
  u8 RandomizeSkills;
  u8 ClassByTerrain;
  u8 RandomizeItemStats;
  u8 RandomizeChests;
  u8 RandomizeEventItems;
  u8 CasualMode;
  u8 RandomizeMusic;
  //more options here
} OptionsProc;

u8 static const Weapons[];
u8 static const WeaponsRare[];
u8 static const Items[];
u8 static const ItemsRare[];
u8 static const PSkills[];
u8 static const T1Classes[];
u8 static const T2Classes[];

//80ac3f0 is a pointer to the new game ProcCode.
void EnableAllGfx();
void NewFadeIn();
void NewFadeOut();
void FadeInExists();
void FadeOutExists();
void nullsub_64();
void Loop6C_savemenu();
void NewNewGameDifficultySelect();
void NewFadeInBlack(int duration);
void NewFadeOutBlack(int duration);
void PlaySound(int sound);
void SetPrimaryHBlankCallback();
void ClearOAMBuffer();
void BlockGameGraphicsLogic();
void LZ77UnCompVram();
void DBG_BG_Print();
void DrawTextInline();
void RandomOptionsSetup(OptionsProc* CurrentProc);
void RandomOptionsLoop(OptionsProc* CurrentProc);
void SetupDebugFontForBG();
void CpuSet();
void SetupDebugFontForOBJ();
void PrintDebugNumberDec();
void PrintDebugNumberHex();
void DrawDecNumber();
void Font_ResetAllocation(); 
void UpdateHandCursor();
void ClearBG0BG1();
void FillBgMap();
void EnableBgSyncByIndex();
int GetStringFromIndex();
void NewItemGot();
int GetCurrentMapMusicIndex();
int MakeBattleRound(BattleUnit*, BattleUnit*);
int BattleCheckDoubling(BattleUnit*, BattleUnit*);

//fron randomizer_a
u8 RandomizeByPercentage(u8 number);
u8 HashByte_N(u8 number, u8 noise, int max);
s8 HashByPercentage(s8 number, u8 noise);
u8 Get_Hp_Growth(Unit* unit);
u8 Get_Str_Growth(Unit* unit);
u8 Get_Skl_Growth(Unit* unit);
u8 Get_Spd_Growth(Unit* unit);
u8 Get_Def_Growth(Unit* unit);
u8 Get_Res_Growth(Unit* unit);
u8 Get_Luk_Growth(Unit* unit);
void LoadUnitStats_Randomized(Unit* unit, CharacterData* charData);
Unit* LoadUnitWrapper(EventUnit*);
Unit* LoadNormalUnit(EventUnit*);
int RandomizeUnitClass(EventUnit* eventdata);
int GenerateMonsterClass(u8);
int NewPortraitGetter(int mugID);
int NameStringWrapper(int textID);
int CasualModeCheck();
int NewCheckCHES(u8 num, u8 unk1, LOCAstack* stack, LOCAdata* LOCA);
void RandomizeEventItem(ProcState* CurrentProc, Unit* CurrentUnit, int ItemID);
int FirMusicWrapper();
int RandomizeBattleMusic(u8);
void ClearRounds();
void GetBattleUnitPointers(BattleUnit**, BattleUnit**);

//from randomizer_b
void GenerateBGTsa(u16 *MapOffset, u32 NumberOfTiles, u8 PaletteId, u16 baseTile);
void VBlankIntrWait();
int FirMode();
int NamedCharacter(u8 charNum);
void DifficultyTacticianSelect(ProcState* input);
void ClearDebuffsBeforePrepScreen(int something);
u8 PersonalSkillGetter(u8 charNum);
u8 SkillAdderWrapper(Unit* unit, u8 skillID);
u8 pSkillAdder(Unit* unit, u8 skillID); //this is the asm one
u8 SkillGetterHelper(Unit* unit, u8 skillID);
void updateRandomOptionsPage(OptionsProc* CurrentProc);
void RandomOptionsSetup(OptionsProc* CurrentProc);
void RandomOptionsLoop(OptionsProc* CurrentProc);
int GetItemMaxUses(Item item);
int GetItemMight(Item item);
int GetItemHit(Item item);
int GetItemWeight(Item item);
int GetItemCrit(Item item) ;
int GetTerrainType(int x, int y);
void prLearnNewSkill(Unit* unit, u8 skill, Proc* parent);
void PrepItemEffectWrapper(Proc* parent);


//Action Struct
typedef struct {
  u8 pad1[0xC];
  u8 currentAllegiance;
  u8 targetAllegiance;
  u8 newX;
  u8 newY;
  u8 squaresMoved;
  u8 actionTaken;
  u8 invSlot;
  u8 targetX;
  u8 targetY;
  u8 snagHP;
}ActionStruct;
#define sAction ((ActionStruct*)0x203A958)

#define BGLoc(BGOffset, x, y) (BGOffset + 0x2 * x + 0x40 * y)
#define BG0Buffer 0x02022CA8
#define BG1Buffer 0x020234A8
#define BG2Buffer 0x02023CA8
#define BG3Buffer 0x020244A8 
#define BG0Offset 0x6006000
#define gColorSpecialEffectsSelectionBuffer (u16*) 0x030030BC
#define gBg1ControlBuffer (u16*) 0x03003090
#define SoundRoomTable ((struct SoundRoomData*) 0x8A20E74)
#define SetFont ((void (*)(u32 fontStructPointer))(0x8003D38+1))
#define LoadFontUI ((void (*))(0x80043A8+1))
#define InitDefaultFont ((void (*)())(0x8003C94+1))
#define InitText ((void (*)(int TextStruct, int TextTileWidth))(0x8003D5C+1))
#define ClearText ((void (*)(int TextStruct))(0x08003DC8+1))
#define PrintInline ((void (*)(int TextStruct, int TilePointerRoot, int ColorID, int localX, int TileWidth, char *Text))(0x0800443C+1))
#define UncompTID ((void (*)(u16 TID, char *Buffer))(0x800A280+1))
#define UpdateBG3HOffset ((void (*)())(0x8086B7C+1))
#define CursorMaxIndex sizeof(CursorLocationTable)/sizeof(CursorLocationTable[0])-1
#define MovGetter ((int (*)(Unit* unit))(0x8019224+1))
// u32* const seed_value = (u32*) 0x3005264; //last 4 bytes of event ids (unused)
static OptionsStruct* const OptionsSaved = (OptionsStruct* const) (0x3005264); //last 4 bytes of event ids (unused)
static char* const TacticianName = (char* const) (0x202bd10); //8 bytes long

#pragma long_calls_off
#endif