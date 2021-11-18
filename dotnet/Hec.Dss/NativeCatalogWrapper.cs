﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace Hec.Dss
{
  public class NativeCatalogWrapper
  {
    [DllImport(@"..\..\..\PInvoke\x64\Debug\PInvoke")]
    private extern static void GetCatalogPathName(IntPtr cat, [In, Out] StringBuilder inputPathName, int pathNameLength, int pathNameIndex);
    [DllImport(@"..\..\..\PInvoke\x64\Debug\PInvoke")]
    private extern static int GetPathNameLength(IntPtr cat, int pathNameIndex);
    [DllImport(@"..\..\..\PInvoke\x64\Debug\PInvoke")]
    private extern static int GetNumberPathNames(IntPtr cat);
    [DllImport(@"..\..\..\PInvoke\x64\Debug\PInvoke")]
    private extern static IntPtr GetRecordType(IntPtr cat);

    public IntPtr TheStruct;

    public string[] PathNameList
    {
      get
      {
        int numberPaths = GetNumberPathNames(TheStruct);
        StringBuilder[] arr = new StringBuilder[numberPaths];
        string[] returnArray = new string[numberPaths];
        for (int i = 0; i < numberPaths; i++)
        {
          arr[i] = new StringBuilder(GetPathNameLength(TheStruct, i));
          GetCatalogPathName(TheStruct, arr[i], arr[i].Capacity, i);
          returnArray[i] = arr[i].ToString();
        }

        return returnArray;
      }
    }
    public int[] RecordType
    {
      get
      {
        int numberPaths = GetNumberPathNames(TheStruct);
        IntPtr ptr = GetRecordType(TheStruct);
        if (ptr != IntPtr.Zero)
        {
          int[] returnArray = new int[GetNumberPathNames(TheStruct)];
          Marshal.Copy(ptr, returnArray, 0, returnArray.Length);
          return returnArray;
        }

        return null;
      }
    }
  }
}
