unit uMain;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, SynHighlighterPas, Forms, Controls,
  Graphics, Dialogs, StdCtrls, EditBtn, Video;

type

  { TfMain }

  TfMain = class(TForm)
    buLoadFile: TButton;
    buFileStream: TButton;
    feFilename: TFileNameEdit;
    SynEdit1: TSynEdit;
    SynPasSyn1: TSynPasSyn;
    procedure buLoadFileClick(Sender: TObject);
    procedure buFileStreamClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

{ TfMain }

procedure TfMain.buLoadFileClick(Sender: TObject);
begin
  SynEdit1.Lines.LoadFromFile(feFilename.Text);
end;

procedure TfMain.buFileStreamClick(Sender: TObject);
Var vFileList: TStringList;
    vFileStream: TFileStream;
begin
  vFileList := TStringList.Create;
  try
    vFileStream := TFileStream.Create(feFilename.Text, fmOpenRead or fmShareDenyNone);
    try
      vFileList.LoadFromStream(vFileStream);
    finally
      vFileStream.Free;
    end;
    SynEdit1.Lines.Assign(vFileList);
  finally
    vFileList.Free;
  end;
end;

end.

