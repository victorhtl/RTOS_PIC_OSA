#line 1 "C:/Users/Fernando/Desktop/osa/RTOS_PROJETOS_CODIGO_FONTES_osa_110306 (4)/osa_110306/osa/apps/03_PROJETO_SEMAFORO_BINARIO COM LCD/lcd.c"
#line 1 "c:/users/fernando/desktop/osa/rtos_projetos_codigo_fontes_osa_110306 (4)/osa_110306/osa/apps/03_projeto_semaforo_binario com lcd/lcd.h"



sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

void InitLCD(void);
#line 3 "C:/Users/Fernando/Desktop/osa/RTOS_PROJETOS_CODIGO_FONTES_osa_110306 (4)/osa_110306/osa/apps/03_PROJETO_SEMAFORO_BINARIO COM LCD/lcd.c"
void InitLCD(void)
{
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

}
