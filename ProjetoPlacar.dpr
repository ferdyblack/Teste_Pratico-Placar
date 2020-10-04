program ProjetoPlacar;

uses
  Forms,
  UProjeto_Placar in 'UProjeto_Placar.pas' {FrmPlacar};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPlacar, FrmPlacar);
  Application.Run;
end.
