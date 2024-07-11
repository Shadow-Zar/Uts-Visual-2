unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    lbl3: TLabel;
    edt3: TEdit;
    dbgrd1: TDBGrid;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    con1: TZConnection;
    ZQuery1: TZQuery;
    ds1: TDataSource;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('INSERT INTO satuan (nama, deskripsi)');
  ZQuery1.SQL.Add('VALUES (:nama, :deskripsi)');
  ZQuery1.ParamByName('nama').AsString := edt1.Text;
  ZQuery1.ParamByName('deskripsi').AsString := edt2.Text;
  ZQuery1.ExecSQL;

  ZQuery1.SQL.Text := 'SELECT * FROM satuan';
  ZQuery1.Open;

  edt1.Clear;
  edt2.Clear;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
  ZQuery1.SQL.Clear;
  ZQuery1.SQL.Add('UPDATE satuan SET nama = :nama, deskripsi = :deskripsi WHERE id = :id');
  ZQuery1.ParamByName('nama').AsString := edt1.Text;
  ZQuery1.ParamByName('deskripsi').AsString := edt2.Text;
  ZQuery1.ParamByName('id').AsInteger := StrToInt(edt3.Text);
  ZQuery1.ExecSQL;

  ZQuery1.SQL.Text := 'SELECT * FROM satuan';
  ZQuery1.Open;

end;

procedure TForm1.btn3Click(Sender: TObject);
begin
  ZQuery1.Delete;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
  edt1.Clear;
  edt2.Clear;

end;

end.
