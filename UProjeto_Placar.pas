unit UProjeto_Placar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Menus;

type
  TFrmPlacar = class(TForm)
    btnInsercao: TButton;
    Placar: TStringGrid;
    lblplacar: TLabel;
    CbPlacar: TComboBox;
    lbljogo: TLabel;
    btnPontuacao: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnInsercaoClick(Sender: TObject);
    procedure btnPontuacaoClick(Sender: TObject);
  private
  // function XlsToStringGrid(XStringGrid: TStringGrid; xFileXLS: string): Boolean;
    { Private declarations }
  public
    { Public declarations }
    Procedure utConfiguraGrade(aGrade : TStringGrid);
  end;

var
  FrmPlacar: TFrmPlacar;
  num:integer;

implementation

{$R *.dfm}


{Function TForm1.XlsToStringGrid(xStringGrid: TStringGrid; xFileXLS: string): Boolean;
const
   xlCellTypeLastCell = $0000000B;
var
   XLSAplicacao, AbaXLS: OLEVariant;
   RangeMatrix: Variant;
   x, y, k, r: Integer;
begin
   Result := False;
   // Cria Excel- OLE Object
   XLSAplicacao := CreateOleObject('Excel.Application');
   try
   // Esconde Excel
      XLSAplicacao.Visible := False;
      // Abre o Workbook
      XLSAplicacao.Workbooks.Open(xFileXLS);

      {Selecione aqui a aba que voc� deseja abrir primeiro - 1,2,3,4....}
      //XLSAplicacao.WorkSheets[1].Activate;
      {Selecione aqui a aba que voc� deseja ativar - come�ando sempre no 1 (1,2,3,4) }
     // AbaXLS := XLSAplicacao.Workbooks[ExtractFileName(xFileXLS)].WorkSheets[1];

     // AbaXLS.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
      // Pegar o n�mero da �ltima linha
     // x := XLSAplicacao.ActiveCell.Row;
      // Pegar o n�mero da �ltima coluna
     // y := XLSAplicacao.ActiveCell.Column;
      // Seta xStringGrid linha e coluna
      //XStringGrid.RowCount := x;
     // XStringGrid.ColCount := y;
      // Associaca a variant WorkSheet com a variant do Delphi
     // RangeMatrix := XLSAplicacao.Range['A1', XLSAplicacao.Cells.Item[x, y]].Value;
      // Cria o loop para listar os registros no TStringGrid
    //  k := 1;
     // repeat
     //    for r := 1 to y do
          //  XStringGrid.Cells[(r - 1), (k - 1)] := RangeMatrix[k, r];
        // Inc(k, 1);
     // until k > x;
     // RangeMatrix := Unassigned;
     // finally
            // Fecha o Microsoft Excel
         //   if not VarIsEmpty(XLSAplicacao) then
           // begin
               //   XLSAplicacao.Quit;
                //  XLSAplicacao := Unassigned;
                //  AbaXLS := Unassigned;
                  //Result := True;
           // end;
     // end;
//end; }

procedure TFrmPlacar.utConfiguraGrade(aGrade : TStringGrid);
//Ricardo
//25/02/2010
var
  i : integer;
  j : integer;
  x : array of integer;
begin
  // Vetor x com o total de colunas da grade
  SetLength(x, aGrade.ColCount);

  // Zero todas as posi��es do vetor x
  for i:= 0 to aGrade.ColCount -1 do
    x[i]:= 0;

  // Varrendo todas as linhas da Grade
  for i:= 0 to aGrade.RowCount-1 do
    begin
      // Varrendo todas as Colunas da grade
      for j:= 0 to aGrade.ColCount -1 do
        begin
          // Verificando se a coluna na posi��o j � maior que o vetor x na posi��o j
          // se for maior guardo o valor da coluna na posi��o j no vetor x na posi��o j
          if aGrade.Canvas.TextWidth(aGrade.Cells[j,i]) > x[j] then
            x[j]:= aGrade.Canvas.TextWidth(aGrade.Cells[j,i]);
        end;
    end;

  // Verifico se a posi��o i do Vetor x � igual a 0
  // se o vetor x na posi��o i for igual a 0
  // estou tribuindo 89 para o vetor x na posi��o i
  for i:= 0 to aGrade.ColCount -1 do
    begin
      if x[i] = 0 then
        x[i]:= 89;
    end;

  // Varrendo todas as Colunas da Grade
  // e Atribuindo o valor do vetor x na posi��o j
  // para a propiedade colWidths da coluna na posi��o j
  // com o valor do vetor x na posi��o j
  for i:= 0 to aGrade.RowCount-1 do
    begin
      for j:= 0 to aGrade.ColCount -1 do
        aGrade.ColWidths[j]:= x[j] + 5;
    end;
end;

procedure TFrmPlacar.btnInsercaoClick(Sender: TObject);
begin
  Placar.RowCount := Placar.RowCount +1;
  num:=num +1;
  Placar.Cells[0,num]:=IntToStr(num);
  btnInsercao.Enabled :=false;
  btnPontuacao.Enabled:=true;
end;

procedure TFrmPlacar.btnPontuacaoClick(Sender: TObject);
var
  min,max,placares:integer;
begin
  Placar.Cells[1,num]:=CbPlacar.Text;
  btnInsercao.Enabled :=true;
  btnPontuacao.Enabled:=false;

  min:= StrToInt(Placar.Cells[2,num -1]);
  max:= StrToInt(Placar.Cells[3,num -1]);
  placares:=StrToInt(CbPlacar.Text);

   if (min>=placares) or (max>placares) then
   begin
   if (min>placares) then
   begin
     Placar.Cells[2,num]:=IntToStr(placares);
     Placar.Cells[3,num]:=Placar.Cells[3,num -1];
     Placar.Cells[5,num]:=Placar.Cells[5,num -1];
   end
   else
     begin
        Placar.Cells[2,num]:=Placar.Cells[2,num -1];
        Placar.Cells[3,num]:=Placar.Cells[3,num -1];
        Placar.Cells[5,num]:=Placar.Cells[5,num -1];
     end;

    if not((min=placares) or (min<placares)) then
        Placar.Cells[4,num]:=IntToStr(1 + StrToInt(Placar.Cells[4,num -1]))
    else
        Placar.Cells[4,num]:=Placar.Cells[4,num -1];

   end
     else
        begin
          Placar.Cells[3,num]:=IntToStr(placares);
          Placar.Cells[2,num]:=Placar.Cells[2,num-1];
          Placar.Cells[4,num]:=Placar.Cells[4,num -1];

          if not(max=placares) then
            Placar.Cells[5,num]:=IntToStr(1 + StrToInt(Placar.Cells[5,num -1]))
          else
            Placar.Cells[5,num]:=Placar.Cells[5,num -1];
        end;


end;

procedure TFrmPlacar.FormCreate(Sender: TObject);
begin
    
    lblplacar.Caption:='Placar de jogos de Basquete';
    lblplacar.Font.Size:=30;
    Placar.Cells[0,0]:='Jogo';
    Placar.Cells[1,0]:='Placar';
    Placar.Cells[2,0]:='M�nimo da temporada';
    Placar.Cells[3,0]:='M�ximo da temporada';
    Placar.Cells[4,0]:='Quebra de recorde min.';
    Placar.Cells[5,0]:='Quebra de recorde m�x.';
    Placar.Cells[0,1]:='1';
    Placar.Cells[1,1]:='12';
    Placar.Cells[2,1]:='12';
    Placar.Cells[3,1]:='12';
    Placar.Cells[4,1]:='0';
    Placar.Cells[5,1]:='0';
    Placar.Cells[0,2]:='2';
    Placar.Cells[1,2]:='24';
    Placar.Cells[2,2]:='12';
    Placar.Cells[3,2]:='24';
    Placar.Cells[4,2]:='0';
    Placar.Cells[5,2]:='1';
    Placar.Cells[0,3]:='3';
    Placar.Cells[1,3]:='10';
    Placar.Cells[2,3]:='10';
    Placar.Cells[3,3]:='24';
    Placar.Cells[4,3]:='1';
    Placar.Cells[5,3]:='1';
    Placar.Cells[0,4]:='4';
    Placar.Cells[1,4]:='24';
    Placar.Cells[2,4]:='10';
    Placar.Cells[3,4]:='24';
    Placar.Cells[4,4]:='1';
    Placar.Cells[5,4]:='1';

    num:=4;
    utConfiguraGrade(Placar);
    btnPontuacao.Enabled:=false;


end;

end.
