Imports System.Net
Imports System.IO

Public Class HttpHelper

    Public Function Post(ByVal url As String) As String
        Try
            Dim req As HttpWebRequest = HttpWebRequest.Create(url)

            Dim rep As HttpWebResponse = req.GetResponse

            Dim sr As Stream = rep.GetResponseStream

            Dim rd As StreamReader = New StreamReader(sr)

            Dim rzt As String = rd.ReadToEnd
            Return rzt
        Catch ex As Exception
            Return String.Empty
        End Try
    End Function

End Class
