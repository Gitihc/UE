
Module MyModule
    Public Function B2A(key) As String
        Return Convert.ToBase64String(key)
    End Function

    Public Function A2B(key) As String
        Return System.Text.Encoding.GetEncoding("utf-8").GetString((Convert.FromBase64String(key)))
    End Function
End Module
