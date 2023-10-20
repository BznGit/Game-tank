unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Effects, FMX.Ani;

type
  TForm2 = class(TForm)
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Timer4: TTimer;
    Image2: TImage;
    Layout1: TLayout;
    Layout2: TLayout;
    Image1: TImage;
    Timer5: TTimer;
    Timer6: TTimer;
    Timer7: TTimer;
    Timer9: TTimer;
    Timer8: TTimer;
    Timer10: TTimer;
    Timer11: TTimer;
    Timer12: TTimer;
    Timer13: TTimer;
    Timer14: TTimer;
    Rectangle8: TRectangle;
    Rectangle15: TRectangle;
    Rectangle18: TRectangle;
    Rectangle14: TRectangle;
    Rectangle6: TRectangle;
    Rectangle16: TRectangle;
    Rectangle17: TRectangle;
    Rectangle4: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle5: TRectangle;
    Rectangle1: TRectangle;
    Rectangle7: TRectangle;
    Rectangle9: TRectangle;
    Rectangle13: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle22: TRectangle;
    Rectangle20: TRectangle;
    Rectangle21: TRectangle;
    Rectangle25: TRectangle;
    Rectangle24: TRectangle;
    Rectangle23: TRectangle;
    Rectangle19: TRectangle;
    Image3: TImage;
    Image4: TImage;
    Timer15: TTimer;
    Button1: TButton;
    Label1: TLabel;
    Timer16: TTimer;


    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Timer6Timer(Sender: TObject);
    procedure Timer7Timer(Sender: TObject);
    procedure Timer9Timer(Sender: TObject);
    procedure Timer8Timer(Sender: TObject);
    procedure Timer10Timer(Sender: TObject);
    procedure Timer11Timer(Sender: TObject);
    procedure Timer12Timer(Sender: TObject);
    procedure Timer13Timer(Sender: TObject);
    procedure Timer14Timer(Sender: TObject);
    procedure Timer15Timer(Sender: TObject);
    procedure Sbros;
    procedure Button1Click(Sender: TObject);
    procedure Button1MouseEnter(Sender: TObject);
    procedure Button1MouseLeave(Sender: TObject);
    procedure Timer16Timer(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
  speed  = 10;
  spdsn1 = 10;
  spdsn2 = 10;
var
  Form2                                 : TForm2;
  st, st1, st2                          : Trectangle;
  bombrectf,  wallrectf                 : TrectF;
  conec1, conec2, ded, ded1, diraction,
  up, dn, lt, rt                        : boolean;
  max, snaryady, j                         : integer;
  X, Y, X1,Y1                           : single;
  stopR, stopL, stopN, stopV, stopNR,
  stopNL, stopVL, stopVR                : boolean;
implementation

{$R *.fmx}

// RESTART ---------------------------------------------------------------------
procedure TForm2.Button1Click(Sender: TObject);
begin
  Sbros;
end;

// MOUSE ENTER -----------------------------------------------------------------
procedure TForm2.Button1MouseEnter(Sender: TObject);
begin
  button1.TextSettings.Font.Style:=[TFontStyle.fsBold];
end;

// MOUSE LEAVE -----------------------------------------------------------------
procedure TForm2.Button1MouseLeave(Sender: TObject);
begin
  button1.TextSettings.Font.Style:=[];
end;

// CREATE ----------------------------------------------------------------------
procedure TForm2.FormCreate(Sender: TObject);
begin
  snaryady:=5;
  label1.Text:='SHOTS: ' + IntToStr(snaryady);
  conec1:=true;
  conec2:=false;
  max:=form2.ComponentCount;
  X:=Layout1.Position.X;
  Y:=Layout1.Position.Y;

  Layout1.Position.X:=screen.Width-Layout1.Size.Width;
  Layout1.Position.Y:=screen.Height-Layout1.Size.Height;
  ded1:=true;
  Timer5.Enabled:=true;

end;

// KEYS DOWN --------------------------------------------------------------------
procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
var
  walls, i: integer;
  pouse:boolean;
begin
  //ESCAPE ---------------------------------------------------------------------
  If Key = 27 then
  begin
    application.Terminate;
  end;

  //POUSE ---------------------------------------------------------------------
  If Key = 32 then
  begin
    Timer5.Enabled:=false;
    Timer6.Enabled:=false;
    Timer7.Enabled:=false;
    Timer9.Enabled:=false;
    Timer10.Enabled:=false;
    Timer8.Enabled:=false;
  end;

  // SHOOTING ------------------------------------------------------------------
  If Key = 17 then
  begin
    form2.Resize;
    if snaryady=0 then  exit;
    snaryady:=snaryady-1;
    label1.Text:='SHOTS: ' + IntToStr(snaryady);


    if ded=true then exit;
    // SHOOT UP ----------------------------------------------------------------
    if  Layout1.RotationAngle=0 then
    begin
      st1:=TRectangle.create(form2);
      st1.Parent:=form2;
      st1.Name:='st';
      st1.Width:=5;
      st1.Height:=10;
      st1.Fill.Color:=Talphacolorrec.Red;
      x:=Layout1.Position.x+Layout1.Width/2-2;
      y:=Layout1.Position.y-10;
      st1.Position.x:=x;
      st1.Position.y:=y;
      ded:=true;
      timer1.Enabled:=true;
    end;
    // SHOOT DOWN --------------------------------------------------------------
    if  Layout1.RotationAngle=180 then
    begin
      st1:=TRectangle.create(form2);
      st1.Parent:=form2;
      st1.Name:='st';
      st1.Width:=5;
      st1.Height:=10;
      st1.Fill.Color:=Talphacolorrec.Red;
      x:=Layout1.Position.x+Layout1.Width/2;
      y:=Layout1.Position.y+120;
      st1.Position.x:=x;
      st1.Position.y:=y;
      ded:=true;
      timer2.Enabled:=true;
    end;
    // SHOOT RIGHT -------------------------------------------------------------
    if  Layout1.RotationAngle=90 then
     begin
      st1:=TRectangle.create(form2);
      st1.Parent:=form2;
      st1.Name:='st';
      st1.Width:=10;
      st1.Height:=5;
      st1.Fill.Color:=Talphacolorrec.Red;
      y:=Layout1.Position.y+Layout1.Height/2;
      x:=Layout1.Position.x+Layout1.Width;
      st1.Position.x:=x+15;
      st1.Position.y:=y-2;
      ded:=true;
      timer3.Enabled:=true;
    end;
    // SHOOT LEFT --------------------------------------------------------------
    if  Layout1.RotationAngle=-90 then
    begin
      st1:=TRectangle.create(form2);
      st1.Parent:=form2;
      st1.Name:='st';
      st1.Width:=10;
      st1.Height:=5;
      st1.Fill.Color:=Talphacolorrec.Red;
      y:=Layout1.Position.y+Layout1.Height/2;
      x:=Layout1.Position.x;
      st1.Position.x:=x-25;
      st1.Position.y:=y-2;
      ded:=true;
      timer4.Enabled:=true;
    end;
  end;

  i:= form2.ComponentCount;
  if (form2.Components[0] is Trectangle) then
    wallrectf:=(form2.Components[0] as Trectangle).BoundsRect;

  // MOOVE UP ------------------------------------------------------------------
  If (stopV=false) and (Key = 38) then
  begin
    Layout1.Position.Y:=Layout1.Position.Y-speed ;
    Layout1.RotationAngle:=0;
    stopR:=false;
    stopL:=false;
    stopN:=false;
    for I := 0 to form2.ComponentCount-1 do
    begin
      if (form2.Components[i] is Trectangle) then  wallrectf:=(form2.Components[i] as Trectangle).BoundsRect;
      if IntersectRect(Layout1.BoundsRect, wallrectf) then
      begin
        stopV:=true;
        exit;
      end;
    end;
  end;
  // MOOVE DOWN ----------------------------------------------------------------
  If (stopN=false) and (Key = 40) then
  begin
    Layout1.Position.Y:=Layout1.Position.Y+speed ;
    Layout1.RotationAngle:=180;
    stopV:=false;
    stopR:=false;
    stopL:=false;
    for I := 0 to form2.ComponentCount-1 do
    begin
      if (form2.Components[i] is Trectangle) then  wallrectf:=(form2.Components[i] as Trectangle).BoundsRect;
      if IntersectRect(Layout1.BoundsRect, wallrectf) then
      begin
        stopN:=true;
        exit;
      end;
    end;
  end;
  // MOOVE RIGHT ---------------------------------------------------------------
  If (stopR=false) and (Key = 39) then
  begin
    Layout1.Position.X:=Layout1.Position.X+speed ;
    Layout1.RotationAngle:=90;
    stopV:=false;
    stopL:=false;
    stopN:=false;
    for I := 0 to form2.ComponentCount-1 do
    begin
      if (form2.Components[i] is Trectangle) then wallrectf:=(form2.Components[i] as Trectangle).BoundsRect;
      if IntersectRect(Layout1.BoundsRect, wallrectf) then
      begin
        stopR:=true;
        exit;
      end;
    end;
  end;
  // MOOVE LEFT ----------------------------------------------------------------
  If (stopL=false) and (Key = 37) then
  begin
    Layout1.Position.X:=Layout1.Position.X-speed ;
    Layout1.RotationAngle:=-90;
    stopV:=false;
    stopR:=false;
    stopN:=false;
    for I := 0 to form2.ComponentCount-1 do
    begin
      if (form2.Components[i] is Trectangle) then wallrectf:=(form2.Components[i] as Trectangle).BoundsRect;
      if IntersectRect(Layout1.BoundsRect, wallrectf) then
      begin
        stopL:=true;
        exit;
      end;
    end;
  end;

  if (layout1.Position.x<0-layout1.Height) then
  begin
    layout1.Position.x:=form2.Width;
  end;
  if(layout1.Position.x>form2.Width) then
  begin
    layout1.Position.x:=0;
  end;

  if (layout1.Position.y<0-layout1.Width) then
  begin
    layout1.Position.y:=form2.Height;
  end;
  if(layout1.Position.y>form2.Height) then
  begin
    layout1.Position.y:=0;
  end;

end;


// BOTSHOOTING -----------------------------------------------------------------
procedure TForm2.Timer10Timer(Sender: TObject);
begin
  if ded1=true then
  begin
    // SHOOT UP ----------------------------------------------------------------
    if  Layout2.RotationAngle=0 then
    begin
      st2:=TRectangle.create(form2);
      st2.Parent:=form2;
      st2.Name:='st1';
      st2.Width:=5;
      st2.Height:=10;
      st2.Fill.Color:=Talphacolorrec.blue;
      x:=Layout2.Position.x+Layout2.Width/2-2;
      y:=Layout2.Position.y-10;
      st2.Position.x:=x;
      st2.Position.y:=y;
      timer11.Enabled:=true;
      ded1:=false;
      up:=true;
    end;
    // SHOOT DOWN --------------------------------------------------------------
    if  Layout2.RotationAngle=180 then
    begin
      st2:=TRectangle.create(form2);
      st2.Parent:=form2;
      st2.Name:='st1';
      st2.Width:=5;
      st2.Height:=10;
      st2.Fill.Color:=Talphacolorrec.blue;
      x:=Layout2.Position.x+Layout2.Width/2;
      y:=Layout2.Position.y+120;
      st2.Position.x:=x;
      st2.Position.y:=y;
      timer12.Enabled:=true;
      ded1:=false;
      dn:=true;
    end;
    // SHOOT RIGHT -------------------------------------------------------------
    if  Layout2.RotationAngle=90 then
    begin
      st2:=TRectangle.create(form2);
      st2.Parent:=form2;
      st2.Name:='st1';
      st2.Width:=10;
      st2.Height:=5;
      st2.Fill.Color:=Talphacolorrec.blue;
      y:=Layout2.Position.y+Layout1.Height/2;
      x:=Layout2.Position.x+Layout1.Width;
      st2.Position.x:=x+15;
      st2.Position.y:=y-2;
      timer13.Enabled:=true;
      ded1:=false;
      rt:=true;
    end;
    // SHOOT LEFT --------------------------------------------------------------
   if  Layout2.RotationAngle=-90 then
    begin
      st2:=TRectangle.create(form2);
      st2.Parent:=form2;
      st2.Name:='st1';
      st2.Width:=10;
      st2.Height:=5;
      st2.Fill.Color:=Talphacolorrec.blue;
      y:=Layout2.Position.y+Layout1.Height/2;
      x:=Layout2.Position.x;
      st2.Position.x:=x-25;
      st2.Position.y:=y-2;
      timer14.Enabled:=true;
      ded1:=false;
      lt:=true;
    end;
  end;

end;

// BOT SHOOT FLY ===============================================================
procedure TForm2.Timer11Timer(Sender: TObject);
var
  i:integer;
begin
  //UP
  st2.Position.Y:= st2.Position.Y-spdsn2;
  for i := 1 to max do
  begin
    if (findcomponent('rectangle'+inttostr(i)) is Trectangle) then
    wallrectf:=(findcomponent('rectangle'+inttostr(i)) as Trectangle).BoundsRect;

    if IntersectRect(st2.BoundsRect, wallrectf) then
    begin
      ded1:=false;
      (findcomponent('rectangle'+inttostr(i)) as Trectangle).Free;

      st2.Free;
      timer11.Enabled:=false;

      exit;
    end;
  end;


  if IntersectRect(st2.BoundsRect, layout1.BoundsRect) then
  begin
    ded1:=true;
    timer11.Enabled:=false;
    image2.Visible:=false;
    image3.Visible:=true;
    st2.Free;
    exit;
  end;




  if (st2.Position.y<0) or (st2.Position.y>form2.Height)  then
  begin
    st2.Free;
    ded1:=true;
    timer11.Enabled:=false;
    exit;
  end;

end;

procedure TForm2.Timer12Timer(Sender: TObject);
var
  i:integer;
begin
  //DOWN
  st2.Position.Y:= st2.Position.Y+spdsn2;

  for i := 1 to max do
  begin
    if (findcomponent('rectangle'+inttostr(i)) is Trectangle) then
    wallrectf:=(findcomponent('rectangle'+inttostr(i)) as Trectangle).BoundsRect;

    if IntersectRect(st2.BoundsRect, wallrectf) then
    begin
      ded1:=false;
      (findcomponent('rectangle'+inttostr(i)) as Trectangle).Free;
      ded1:=true;
      st2.Free;
      timer11.Enabled:=false;

      exit;
    end;
  end;


  if IntersectRect(st2.BoundsRect, layout1.BoundsRect) then
  begin
    ded1:=true;
    timer12.Enabled:=false;
    image2.Visible:=false;
    image3.Visible:=true;
    st2.Free;
    exit;
  end;
 if (st2.Position.y<0) or (st2.Position.y>form2.Height)  then
 begin
   st2.Free;
   ded1:=true;
   timer12.Enabled:=false;
   exit;
 end;

end;

procedure TForm2.Timer13Timer(Sender: TObject);
var
  i:integer;
begin
  //RIGHT
  st2.Position.X:= st2.Position.X+spdsn2;

    for i := 1 to max do
  begin
    if (findcomponent('rectangle'+inttostr(i)) is Trectangle) then
    wallrectf:=(findcomponent('rectangle'+inttostr(i)) as Trectangle).BoundsRect;

    if IntersectRect(st2.BoundsRect, wallrectf) then
    begin
      ded1:=false;
      (findcomponent('rectangle'+inttostr(i)) as Trectangle).Free;
      ded1:=true;
      st2.Free;
      timer13.Enabled:=false;

      exit;
    end;
  end;

  if IntersectRect(st2.BoundsRect, layout1.BoundsRect) then
  begin
    ded1:=true;
    timer13.Enabled:=false;
    image2.Visible:=false;
    image3.Visible:=true;
    st2.Free;
    exit;
  end;
  if  (st2.Position.x<0) or (st2.Position.x>form2.Width)   then
  begin
    st2.Free;
    ded1:=true;
    timer13.Enabled:=false;
    exit;
  end;

end;

procedure TForm2.Timer14Timer(Sender: TObject);
var
  i:integer;
begin
  //LEFT
  st2.Position.X:= st2.Position.X-spdsn2;
    for i := 1 to max do
  begin
    if (findcomponent('rectangle'+inttostr(i)) is Trectangle) then
    wallrectf:=(findcomponent('rectangle'+inttostr(i)) as Trectangle).BoundsRect;

    if IntersectRect(st2.BoundsRect, wallrectf) then
    begin
      ded1:=false;
      (findcomponent('rectangle'+inttostr(i)) as Trectangle).Free;
      ded1:=true;
      st2.Free;
      timer14.Enabled:=false;

      exit;
    end;
  end;


  if IntersectRect(st2.BoundsRect, layout1.BoundsRect) then
  begin
    ded1:=true;
    timer14.Enabled:=false;
    image2.Visible:=false;
    image3.Visible:=true;
    st2.Free;
    exit;
  end;
  if (st2.Position.x<0) or (st2.Position.x>form2.Width)   then
  begin
    st2.Free;
    ded1:=true;
    timer14.Enabled:=false;
    exit;
  end;

end;
//==============================================================================

// MAIN ------------------------------------------------------------------------
procedure TForm2.Timer15Timer(Sender: TObject);
begin
  if image4.Visible=true then
  begin
    image4.Visible:=false;
    button1.Visible:=true;
  end;

    if image3.Visible=true then
  begin
    image3.Visible:=false;
    timer10.Enabled:=false;
    button1.Visible:=true;
    stopV:=true;
    stopR:=true;
    stopL:=true;
    stopN:=true;
  end;

end;

// RETURN ----------------------------------------------------------------------
procedure TForm2.Timer16Timer(Sender: TObject);
begin
  j:=j+1;
  if j=1 then
  begin
    timer8.Enabled:=true;
    timer16.Enabled:=false;
    j:=0;
    exit;
  end;

end;

// SHOOTING UP -----------------------------------------------------------------
procedure TForm2.Timer1Timer(Sender: TObject);
var
  i: integer;
  x1, y1,x2,y2: single;
begin

  st1.Position.x:=st1.Position.x;
  st1.Position.y:=st1.Position.y-spdsn1;
  bombrectf:=st1.BoundsRect;

  for i := 1 to max do
  begin
    if (findcomponent('rectangle'+inttostr(i)) is Trectangle) then
    wallrectf:=(findcomponent('rectangle'+inttostr(i)) as Trectangle).BoundsRect;

    if IntersectRect(bombrectf, wallrectf) then
    begin
      ded:=false;
      (findcomponent('rectangle'+inttostr(i)) as Trectangle).Free;

      st1.Free;
      timer1.Enabled:=false;

      exit;
    end;
  end;

  if IntersectRect(st1.BoundsRect, layout2.BoundsRect) then
  begin
    ded:=false;
    image1.Visible:=false;
    image4.Visible:=true;
    timer1.Enabled:=false;

    timer5.Enabled:=false;
    timer6.Enabled:=false;
    timer7.Enabled:=false;
    timer9.Enabled:=false;

    timer8.Enabled:=false;
    timer10.Enabled:=false;

    st1.Free;
    exit;
  end;

  if (st1.Position.y<0) or (st1.Position.y>form2.Height)  then
  begin
    st1.Free;
    ded:=false;
    timer1.Enabled:=false;
  end;
end;

// SHOOTING DOWN ---------------------------------------------------------------
procedure TForm2.Timer2Timer(Sender: TObject);
var
  i: integer;
  x1, y1,x2,y2: single;
begin
  st1.Position.x:=st1.Position.x;
  st1.Position.y:=st1.Position.y+spdsn1;
  bombrectf:=st1.BoundsRect;

  for I := 0 to max do
  begin
    if(findcomponent('rectangle'+inttostr(i)) is Trectangle) then
    wallrectf:=(findcomponent('rectangle'+inttostr(i)) as Trectangle).BoundsRect;

    if IntersectRect(bombrectf, wallrectf) then
    begin
      ded:=false;
      (findcomponent('rectangle'+inttostr(i)) as Trectangle).free;
      st1.Free;
      timer2.Enabled:=false;
      form2.Resize;

      exit;
    end
  end;

  if IntersectRect(st1.BoundsRect, layout2.BoundsRect) then
  begin
    ded:=false;
    image1.Visible:=false;
    image4.Visible:=true;

    timer2.Enabled:=false;
    timer5.Enabled:=false;
    timer6.Enabled:=false;
    timer7.Enabled:=false;
    timer9.Enabled:=false;

    timer8.Enabled:=false;
    timer10.Enabled:=false;

    st1.Free;
    exit;
  end;
  if (st1.Position.y<0) or (st1.Position.y>form2.Height)  then
  begin
    st1.Free;
    ded:=false;
    timer2.Enabled:=false;
  end;
end;

// SHOOTING RIGHT --------------------------------------------------------------
procedure TForm2.Timer3Timer(Sender: TObject);
var
  i: integer;
  x1, y1,x2,y2: single;
begin
  st1.Position.x:=st1.Position.x+spdsn1;
  st1.Position.y:=st1.Position.y;
  bombrectf:=st1.BoundsRect;
  max:=30;
  for I := 0 to max do
  begin
    if(findcomponent('rectangle'+inttostr(i)) is Trectangle) then
    wallrectf:=(findcomponent('rectangle'+inttostr(i)) as Trectangle).BoundsRect;

    if IntersectRect(bombrectf, wallrectf) then
    begin
      ded:=false;
      (findcomponent('rectangle'+inttostr(i)) as Trectangle).free;
      st1.Free;
      timer3.Enabled:=false;
      form2.Resize;
      exit;
    end
  end;

 if IntersectRect(st1.BoundsRect, layout2.BoundsRect) then
  begin
    ded:=false;
    image1.Visible:=false;
    image4.Visible:=true;

    timer3.Enabled:=false;
    timer5.Enabled:=false;
    timer6.Enabled:=false;
    timer7.Enabled:=false;
    timer9.Enabled:=false;

    timer8.Enabled:=false;
    timer10.Enabled:=false;

    st1.Free;
    exit;
  end;

  if (st1.Position.x<0) or (st1.Position.x>form2.Width)  then
  begin
    st1.Free;
    ded:=false;
    timer3.Enabled:=false;
  end;
end;

// SHOOTING LEFT ---------------------------------------------------------------
procedure TForm2.Timer4Timer(Sender: TObject);
var
  i: integer;
  x1, y1,x2,y2: single;
begin
  st1.Position.x:=st1.Position.x-spdsn1;
  st1.Position.y:=st1.Position.y;
  bombrectf:=st1.BoundsRect;
  max:=100;
  for I := 0 to max do
  begin
    if(findcomponent('rectangle'+inttostr(i)) is Trectangle) then
    wallrectf:=(findcomponent('rectangle'+inttostr(i)) as Trectangle).BoundsRect;

    if IntersectRect(bombrectf, wallrectf) then
    begin
      ded:=false;
      (findcomponent('rectangle'+inttostr(i)) as Trectangle).free;
      st1.Free;
      timer4.Enabled:=false;
      form2.Resize;
      exit;
    end
  end;

  if IntersectRect(st1.BoundsRect, layout2.BoundsRect) then
  begin
    ded:=false;
    image1.Visible:=false;
    image4.Visible:=true;

    timer4.Enabled:=false;
    timer5.Enabled:=false;
    timer6.Enabled:=false;
    timer7.Enabled:=false;
    timer9.Enabled:=false;

    timer8.Enabled:=false;
    timer10.Enabled:=false;

    st1.Free;
    exit;
  end;

  if (st1.Position.x<0) or (st1.Position.x>form2.Width)  then
  begin

   st1.Free;
   ded:=false;
    form2.Resize;
   timer4.Enabled:=false;
  end;
end;

// BOT DOWN --------------------------------------------------------------------
procedure TForm2.Timer5Timer(Sender: TObject);
var
  i : integer;
begin
  Layout2.Position.Y:=Layout2.Position.Y+speed ;
  Layout2.RotationAngle:=180;

  if timer16.Enabled=false then
  begin
    for I := 0 to form2.ComponentCount-1 do
    begin
      if (form2.Components[i] is Trectangle) then  wallrectf:=(form2.Components[i] as Trectangle).BoundsRect;
      if IntersectRect(Layout2.BoundsRect, wallrectf) then
      begin
        Timer5.Enabled:=false;
        if layout1.Position.x<trunc(form2.Width/2) then  Timer7.Enabled:=true
        else Timer9.Enabled:=true;
        timer8.Enabled:=false;
        j:=0;
        timer16.Enabled:=true;

      end;
    end;
  end;

  if IntersectRect(layout1.BoundsRect, layout2.BoundsRect) then
  begin
    image2.Visible:=false;
    image3.Visible:=true;

  end;

  if(layout2.Position.y>form2.Height) then
  begin
   layout2.Position.y:=0;
   //conec2:=false;
  end;

end;

// BOT UP-----------------------------------------------------------------------
procedure TForm2.Timer6Timer(Sender: TObject);
var
i, j : integer;
begin
  j:=0;
  Layout2.Position.Y:=Layout2.Position.Y-speed ;
  Layout2.RotationAngle:=0;
  if timer16.Enabled=false then
  begin
    for I := 0 to form2.ComponentCount-1 do
    begin
      if (form2.Components[i] is Trectangle) then  wallrectf:=(form2.Components[i] as Trectangle).BoundsRect;
      if IntersectRect(Layout2.BoundsRect, wallrectf) then
      begin
        Timer6.Enabled:=false;
        if layout1.Position.x<trunc(form2.Width/2) then  Timer7.Enabled:=true
        else Timer9.Enabled:=true;
        timer8.Enabled:=false;
        j:=0;
        timer16.Enabled:=true;

      end;
    end;
  end;

  if IntersectRect(layout1.BoundsRect, layout2.BoundsRect) then
  begin
    image2.Visible:=false;
    image3.Visible:=true;

  end;
  if (layout2.Position.y<0-layout2.Height) then
  begin
   layout2.Position.y:=form2.Height;
    //conec2:=false;
  end;

end;

// BOT LEFT -------------------------------------------------------------------
procedure TForm2.Timer7Timer(Sender: TObject);
var
  i : integer;
begin
  Layout2.Position.X:=Layout2.Position.X-speed ;
  Layout2.RotationAngle:=-90;

  if timer16.Enabled=false then
  begin
    for I := 0 to form2.ComponentCount-1 do
    begin
      if (form2.Components[i] is Trectangle) then  wallrectf:=(form2.Components[i] as Trectangle).BoundsRect;
      if IntersectRect(Layout2.BoundsRect, wallrectf) then
      begin
        Timer7.Enabled:=false;
        if layout1.Position.y<trunc(form2.Height/2) then  Timer6.Enabled:=true
        else Timer5.Enabled:=true;
        timer8.Enabled:=false;
        j:=0;
        timer16.Enabled:=true;

      end;
    end;
  end;

  if IntersectRect(layout1.BoundsRect, layout2.BoundsRect) then
  begin
    image2.Visible:=false;
    image3.Visible:=true;
  end;

  if(layout2.Position.x>form2.Width) then
  begin
    layout2.Position.x:=0;
    //conec1:=false;
  end;

end;

// BOT RIGHT -------------------------------------------------------------------
procedure TForm2.Timer9Timer(Sender: TObject);
var
  i : integer;
begin
  Layout2.Position.X:=Layout2.Position.X+speed ;
  Layout2.RotationAngle:=90;

  if timer16.Enabled=false then
  begin
    for I := 0 to form2.ComponentCount-1 do
    begin
      if (form2.Components[i] is Trectangle) then  wallrectf:=(form2.Components[i] as Trectangle).BoundsRect;
      if IntersectRect(Layout2.BoundsRect, wallrectf) then
      begin
        Timer9.Enabled:=false;
        if layout1.Position.y<trunc(form2.Height/2) then  Timer6.Enabled:=true
        else Timer5.Enabled:=true;
        timer8.Enabled:=false;
        j:=0;
        timer16.Enabled:=true;

      end;
    end;
  end;

  if IntersectRect(layout1.BoundsRect, layout2.BoundsRect) then
  begin
    image2.Visible:=false;
    image3.Visible:=true;
  end;

  if (layout2.Position.x<0-layout2.Height) then begin
   layout2.Position.x:=form2.Width;
   //conec1:=false;
  end;
end;

// AUTO PILOT-------------------------------------------------------------------
procedure TForm2.Timer8Timer(Sender: TObject);
var
  i : integer;
begin

  // HORIZONT ------------------------------------------------------------------
  if (conec1=false) and (abs(Layout2.Position.X-Layout1.Position.X)>10) then
  begin
    if Layout2.Position.X<Layout1.Position.X   then
    begin
      timer5.Enabled:=false;   // D
      timer6.Enabled:=false;   // U
      timer7.Enabled:=false;   // L
      timer9.Enabled:=true;    // R
    end;

    if Layout2.Position.X>Layout1.Position.X   then
    begin
      timer5.Enabled:=false;   // D
      timer6.Enabled:=false;   // U
      timer7.Enabled:=true;    // L
      timer9.Enabled:=false;   // R
    end;
  end
  else
  begin
    conec1:=true;
    conec2:=false;
  end;
  // VERTICAL ------------------------------------------------------------------
  if (conec2=false) and (abs(Layout2.Position.Y-Layout1.Position.Y)>10) then
  begin
    if Layout2.Position.Y>Layout1.Position.Y   then
    begin
      timer5.Enabled:=false;   // D
      timer6.Enabled:=true ;   // U
      timer7.Enabled:=false;   // L
      timer9.Enabled:=false;   // R
    end;

    if Layout2.Position.Y<Layout1.Position.Y   then
    begin
      timer5.Enabled:=true;    // D
      timer6.Enabled:=false;   // U
      timer7.Enabled:=false;   // L
      timer9.Enabled:=false;   // R
    end;
  end
  else
    begin
    conec2:=true;
    conec1:=false;
  end;



end;

// SBROS ------------------------------------------------------------------------
procedure TForm2.Sbros;
begin
  Layout2.Position.X:=0;
  Layout2.Position.y:=0;
  Layout2.RotationAngle:=180;
  image1.Visible:=true;
  image3.Visible:=false;

  Layout1.Position.X:=screen.Width-Layout1.Size.Width;
  Layout1.Position.Y:=screen.Height-Layout1.Size.Height;
  Layout1.RotationAngle:=0;
  image2.Visible:=true;
  image4.Visible:=false;
  stopV:=false;
  stopR:=false;
  stopL:=false;
  stopN:=false;


  snaryady:=5;
  label1.Text:='SHOTS: ' + IntToStr(snaryady);
  ded1:=true;
  Timer5.Enabled:=true;
  Timer10.Enabled:=true;
  Timer8.Enabled:=true;
  conec1:=true;
  conec2:=false;
  max:=form2.ComponentCount;
  button1.Visible:=false;
end;

end.
