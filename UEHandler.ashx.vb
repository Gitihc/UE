Imports System.Web
Imports System.Web.Services

Public Class Handler1
    Implements System.Web.IHttpHandler
    Public hhelper As New HttpHelper

    Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
        Dim rzt As String = String.Empty
        context.Response.ContentType = "text/plain"
        Try
            Dim act As String = context.Request("Action")
            If Not String.IsNullOrEmpty(act) Then
                Select Case act.ToUpper
                    Case "UE"
                        Dim url As String = context.Request("URL")
                        Dim regex As String = context.Request("Regex")
                        If Not String.IsNullOrEmpty(url) AndAlso Not String.IsNullOrEmpty(regex) Then
                            regex = A2B(regex)
                            rzt = HandRequest(url, regex)
                        End If
                End Select
            End If
        Catch ex As Exception
            rzt = ex.ToString
        End Try
        context.Response.Write(rzt)
    End Sub

    ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

    Function HandRequest(url As String, regex As String) As String
        Try
            Dim rzt As String = hhelper.Post(url)
            Dim reg As Regex = New Regex(regex, RegexOptions.None)

            Dim match As Text.RegularExpressions.Match = reg.Match(rzt)

            Return match.ToString
        Catch ex As Exception
            Return String.Empty
        End Try
    End Function

End Class