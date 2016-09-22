Imports System.Net
Imports System.IO

Public Class HttpHelper

    Private Shared cc As CookieContainer = New CookieContainer
    Private Shared contentType As String = "application/x-www-form-urlencoded"
    Private Shared accept As String = "image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-shockwave-flash, application/x-silverlight, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, application/x-ms-application, application/x-ms-xbap, application/vnd.ms-xpsdocument, application/xaml+xml, application/x-silverlight-2-b1, */*"
    Private Shared userAgent As String = "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.04506.648; .NET CLR 3.5.21022)"
    Private Shared encoding As Encoding = encoding.GetEncoding("utf-8")
    Private Shared delay As Integer = 1000
    Private Shared maxTry As Integer = 300
    Private Shared currentTry As Integer = 0

#Region "公有属性"
    ''' <summary>
    ''' Cookie
    ''' </summary>
    ''' <remarks></remarks>
    Public Shared ReadOnly Property CookieContainer() As CookieContainer
        Get
            Return cc
        End Get
    End Property

    Public Shared Property NetworkDelay() As Integer
        Get
            Dim r As Random = New Random()
            Return (r.Next(delay, delay * 2))
        End Get
        Set(value As Integer)
            delay = value
        End Set
    End Property
#End Region


    Public Function GetHtml(ByVal url As String) As String
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


    Public Function Post(ByVal url As String, ByVal postData As String, Optional encodeType As String = "utf-8") As String
        Dim strRzt As String = String.Empty
        Try
            Dim encoding As Encoding = encoding.GetEncoding(encodeType)
            Dim pd() As Byte = encoding.GetBytes(postData)
            Dim req As HttpWebRequest = HttpWebRequest.Create(url)
            req.Method = "POST"
            req.ContentType = "application/x-www-form-urlencoded"
            req.ContentLength = pd.Length

            Dim sw As Stream = req.GetRequestStream
            sw.Write(pd, 0, pd.Length)
            sw.Close()

            Dim rep As HttpWebResponse = req.GetResponse
            Dim sr As StreamReader = New StreamReader(rep.GetResponseStream, encoding.Default)
            strRzt = sr.ReadToEnd
        Catch ex As Exception
            strRzt = ex.Message
        End Try
        Return strRzt
    End Function

End Class
