<%
Function GetPage(url) 
    Dim Retrieval
	Set Retrieval = CreateObject("Microsoft.XMLHTTP") 
	With Retrieval 
	.Open "Get", url, False, "", "" 
	.Send 
	GetPage = BytesToBstr(.ResponseBody)
	End With 
	Set Retrieval = Nothing 
End Function

Function BytesToBstr(body)
	dim objstream
	set objstream = Server.CreateObject("adodb.stream")
	objstream.Type = 1
	objstream.Mode =3
	objstream.Open
	objstream.Write body
	objstream.Position = 0
	objstream.Type = 2
	objstream.Charset = "gb2312"
	'objstream.Charset = "UTF-8"
	BytesToBstr = objstream.ReadText 
	objstream.Close
	set objstream = nothing
End Function

Function GetContent(str,start,last,n)

	If Instr(lcase(str),lcase(start))>0 and Instr(lcase(str),lcase(last))>0 then
		select case n
		case 0	'���Ҷ���ȡ����ȡǰ�棩��ȥ���ؼ��֣�
		GetContent=Right(str,Len(str)-Instr(lcase(str),lcase(start))-Len(start)+1) 
		GetContent=Left(GetContent,Instr(lcase(GetContent),lcase(last))-1)
		case 1	'���Ҷ���ȡ����ȡǰ�棩�������ؼ��֣�
		GetContent=Right(str,Len(str)-Instr(lcase(str),lcase(start))+1)
		GetContent=Left(GetContent,Instr(lcase(GetContent),lcase(last))+Len(last)-1)
		case 2	'ֻ���ҽ�ȡ��ȡǰ��ģ���ȥ���ؼ��֣�
		GetContent=Right(str,Len(str)-Instr(lcase(str),lcase(start))-Len(start)+1)
		case 3	'ֻ���ҽ�ȡ��ȡǰ��ģ��������ؼ��֣�
		GetContent=Right(str,Len(str)-Instr(lcase(str),lcase(start))+1)
		case 4	'ֻ�����ȡ��ȡ����ģ��������ؼ��֣�
		GetContent=Left(str,InstrRev(lcase(str),lcase(start))+Len(start)-1)
		case 5	'ֻ�����ȡ��ȡ����ģ���ȥ���ؼ��֣�
		GetContent=Left(str,InstrRev(lcase(str),lcase(start))-1)
		case 6	'ֻ�����ȡ��ȡǰ��ģ��������ؼ��֣�
		GetContent=Left(str,Instr(lcase(str),lcase(start))+Len(start)-1)
		case 7	'ֻ���ҽ�ȡ��ȡ����ģ��������ؼ��֣�
		GetContent=Right(str,Len(str)-InstrRev(lcase(str),lcase(start))+1)
		case 8	'ֻ�����ȡ��ȡǰ��ģ���ȥ���ؼ��֣�
		GetContent=Left(str,Instr(lcase(str),lcase(start))-1)
		case 9	'ֻ���ҽ�ȡ��ȡ����ģ��������ؼ��֣�
		GetContent=Right(str,Len(str)-InstrRev(lcase(str),lcase(start)))
		end select
	Else
		GetContent=""
	End if
	
End function

Function toUTF8(szInput)
Dim wch, uch, szRet
Dim x
Dim nAsc, nAsc2, nAsc3

If szInput = "" Then
toUTF8 = szInput
Exit Function
End If
For x = 1 To Len(szInput)
  wch = Mid(szInput, x, 1)
  nAsc = AscW(wch)
  If nAsc < 0 Then nAsc = nAsc + 65536

  If (nAsc And &HFF80) = 0 Then
     szRet = szRet & wch
  Else
      If (nAsc And &HF000) = 0 Then
         uch = "%" & Hex(((nAsc \ 2 ^ 6)) or &HC0) & Hex(nAsc And &H3F or &H80)
         szRet = szRet & uch
       Else
          uch = "%" & Hex((nAsc \ 2 ^ 12) or &HE0) & "%" & _
          Hex((nAsc \ 2 ^ 6) And &H3F or &H80) & "%" & _
          Hex(nAsc And &H3F or &H80)
          szRet = szRet & uch
       End If
  End If
Next

toUTF8 = szRet
End Function
%>