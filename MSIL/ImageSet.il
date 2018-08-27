.namespace CellarTrackerAddIn2
{
  .class public auto ansi ImageSet
       extends [mscorlib]System.Object
       implements [mscorlib]System.IDisposable
  {
    .field private string m_stDefaultImageName
    .field private class [mscorlib]System.Collections.IDictionary m_dictValues
    .field private static class [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.McmlLoadResult s_resultImages

    .method public hidebysig specialname rtspecialname instance void .ctor() cil managed 
    {
      .maxstack 8
      
      IL_0000:  ldarg.0    
      IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
      IL_0006:  ldarg.0    
      IL_0007:  newobj     instance void [mscorlib]System.Collections.Hashtable::.ctor()
      IL_000c:  stfld      class [mscorlib]System.Collections.IDictionary Microsoft.MediaCenter.Shell.ImageSet::m_dictValues
      IL_0011:  ret        
    }

    .method private hidebysig specialname rtspecialname static void .cctor() cil managed 
    {
      .maxstack 8
      
      IL_0000:  ldstr      "res://Microsoft.MediaCenter.Shell!Images.mcml"
      IL_0005:  call       class [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.McmlLoadResult [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.Application::LoadMcml(string)
      IL_000a:  stsfld     class [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.McmlLoadResult Microsoft.MediaCenter.Shell.ImageSet::s_resultImages
      IL_000f:  ret        
    }

    .method public final virtual hidebysig newslot instance void Dispose() cil managed 
    {
      .maxstack 1
      .locals init (object,class [mscorlib]System.IDisposable,class [mscorlib]System.Collections.IDictionaryEnumerator,class [mscorlib]System.IDisposable)

      IL_0000:  ldarg.0    
      IL_0001:  call       void [mscorlib]System.GC::SuppressFinalize(object)
      IL_0006:  ldarg.0    
      IL_0007:  call       instance class [mscorlib]System.Collections.IDictionary Microsoft.MediaCenter.Shell.ImageSet::get_Values()
      IL_000c:  callvirt   instance class [mscorlib]System.Collections.IDictionaryEnumerator [mscorlib]System.Collections.IDictionary::GetEnumerator()
      IL_0011:  stloc.2    
      IL_0012:  br.s       IL_002b
      IL_0014:  ldloc.2    
      IL_0015:  callvirt   instance object [mscorlib]System.Collections.IEnumerator::get_Current()
      IL_001a:  stloc.0    
      IL_001b:  ldloc.0    
      IL_001c:  isinst     [mscorlib]System.IDisposable
      IL_0021:  stloc.1    
      IL_0022:  ldloc.1    
      IL_0023:  brfalse.s  IL_002b
      IL_0025:  ldloc.1    
      IL_0026:  callvirt   instance void [mscorlib]System.IDisposable::Dispose()
      IL_002b:  ldloc.2    
      IL_002c:  callvirt   instance bool [mscorlib]System.Collections.IEnumerator::MoveNext()
      IL_0031:  brtrue.s   IL_0014
      IL_0033:  leave.s    IL_0046
      IL_0035:  ldloc.2    
      IL_0036:  isinst     [mscorlib]System.IDisposable
      IL_003b:  stloc.3    
      IL_003c:  ldloc.3    
      IL_003d:  brfalse.s  IL_0045
      IL_003f:  ldloc.3    
      IL_0040:  callvirt   instance void [mscorlib]System.IDisposable::Dispose()
      IL_0045:  endfinally 
      IL_0046:  ldarg.0    
      IL_0047:  ldfld      class [mscorlib]System.Collections.IDictionary Microsoft.MediaCenter.Shell.ImageSet::m_dictValues
      IL_004c:  callvirt   instance void [mscorlib]System.Collections.IDictionary::Clear()
      IL_0051:  ret        

      .try IL_0012 to IL_0035
        finally handler IL_0035 to IL_0046
    }

    .method public hidebysig static class Microsoft.MediaCenter.Shell.ImageSet FromImage(class [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.Drawing.BaseImage imgDefault) cil managed 
    {
      .maxstack 2
      .locals init (class Microsoft.MediaCenter.Shell.ImageSet)

      IL_0000:  ldarg.0    
      IL_0001:  brtrue.s   IL_0005
      IL_0003:  ldnull     
      IL_0004:  ret        
      IL_0005:  newobj     instance void Microsoft.MediaCenter.Shell.ImageSet::.ctor()
      IL_000a:  stloc.0    
      IL_000b:  ldloc.0    
      IL_000c:  ldstr      "Default"
      IL_0011:  callvirt   instance void Microsoft.MediaCenter.Shell.ImageSet::set_DefaultImageName(string)
      IL_0016:  ldloc.0    
      IL_0017:  ldarg.0    
      IL_0018:  callvirt   instance void Microsoft.MediaCenter.Shell.ImageSet::set_DefaultImage(class [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.Drawing.BaseImage)
      IL_001d:  ldloc.0    
      IL_001e:  ret        
    }

    .method public hidebysig static class Microsoft.MediaCenter.Shell.ImageSet FromName(string stImageSetName) cil managed 
    {
      .maxstack 8
      
      IL_0000:  ldsfld     class [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.McmlLoadResult Microsoft.MediaCenter.Shell.ImageSet::s_resultImages
      IL_0005:  ldarg.0    
      IL_0006:  call       class Microsoft.MediaCenter.Shell.ImageSet Microsoft.MediaCenter.Shell.ImageSet::FromName(class [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.McmlLoadResult, string)
      IL_000b:  ret        
    }

    .method public hidebysig static class Microsoft.MediaCenter.Shell.ImageSet FromName(class [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.McmlLoadResult loadResult, string stImageSetName) cil managed 
    {
      .maxstack 2
      .locals init (object,class Microsoft.MediaCenter.Shell.ImageSet)

      IL_0000:  ldarg.0    
      IL_0001:  brtrue.s   IL_000e
      IL_0003:  ldstr      "loadResult"
      IL_0008:  newobj     instance void [mscorlib]System.ArgumentNullException::.ctor(string)
      IL_000d:  throw      
      IL_000e:  ldarg.0    
      IL_000f:  ldarg.1    
      IL_0010:  callvirt   instance object [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.McmlLoadResult::GetGlobal(string)
      IL_0015:  stloc.0    
      IL_0016:  ldloc.0    
      IL_0017:  pop        
      IL_0018:  ldloc.0    
      IL_0019:  isinst     Microsoft.MediaCenter.Shell.ImageSet
      IL_001e:  stloc.1    
      IL_001f:  ldloc.1    
      IL_0020:  pop        
      IL_0021:  ldloc.1    
      IL_0022:  ret        
    }

    .method public hidebysig specialname instance class [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.Drawing.BaseImage get_DefaultImage() cil managed 
    {
      .maxstack 2
      .locals init (object)

      IL_0000:  ldarg.0    
      IL_0001:  ldfld      string Microsoft.MediaCenter.Shell.ImageSet::m_stDefaultImageName
      IL_0006:  brtrue.s   IL_000a
      IL_0008:  ldnull     
      IL_0009:  ret        
      IL_000a:  ldarg.0    
      IL_000b:  ldfld      class [mscorlib]System.Collections.IDictionary Microsoft.MediaCenter.Shell.ImageSet::m_dictValues
      IL_0010:  ldarg.0    
      IL_0011:  ldfld      string Microsoft.MediaCenter.Shell.ImageSet::m_stDefaultImageName
      IL_0016:  callvirt   instance object [mscorlib]System.Collections.IDictionary::get_Item(object)
      IL_001b:  stloc.0    
      IL_001c:  ldloc.0    
      IL_001d:  isinst     [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.Drawing.BaseImage
      IL_0022:  ret        
    }

    .method public hidebysig specialname instance void set_DefaultImage(class [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.Drawing.BaseImage 'value') cil managed 
    {
      .maxstack 8
      
      IL_0000:  ldarg.0    
      IL_0001:  ldfld      string Microsoft.MediaCenter.Shell.ImageSet::m_stDefaultImageName
      IL_0006:  brtrue.s   IL_0013
      IL_0008:  ldstr      "Cannot set DefaultImage without having first specified DefaultImageName."
      IL_000d:  newobj     instance void [mscorlib]System.InvalidOperationException::.ctor(string)
      IL_0012:  throw      
      IL_0013:  ldarg.0    
      IL_0014:  ldfld      class [mscorlib]System.Collections.IDictionary Microsoft.MediaCenter.Shell.ImageSet::m_dictValues
      IL_0019:  ldarg.0    
      IL_001a:  ldfld      string Microsoft.MediaCenter.Shell.ImageSet::m_stDefaultImageName
      IL_001f:  ldarg.1    
      IL_0020:  callvirt   instance void [mscorlib]System.Collections.IDictionary::set_Item(object, object)
      IL_0025:  ret        
    }

    .method public hidebysig specialname instance string get_DefaultImageName() cil managed 
    {
      .maxstack 8
      
      IL_0000:  ldarg.0    
      IL_0001:  ldfld      string Microsoft.MediaCenter.Shell.ImageSet::m_stDefaultImageName
      IL_0006:  ret        
    }

    .method public hidebysig specialname instance void set_DefaultImageName(string 'value') cil managed 
    {
      .maxstack 8
      
      IL_0000:  ldarg.0    
      IL_0001:  ldarg.1    
      IL_0002:  stfld      string Microsoft.MediaCenter.Shell.ImageSet::m_stDefaultImageName
      IL_0007:  ret        
    }

    .method public hidebysig specialname instance class [mscorlib]System.Collections.IDictionary get_Values() cil managed 
    {
      .maxstack 8
      
      IL_0000:  ldarg.0    
      IL_0001:  ldfld      class [mscorlib]System.Collections.IDictionary Microsoft.MediaCenter.Shell.ImageSet::m_dictValues
      IL_0006:  ret        
    }

    .method public virtual hidebysig instance string ToString() cil managed 
    {
      .maxstack 5
      .locals init (class [mscorlib]System.Text.StringBuilder,valuetype [mscorlib]System.Collections.DictionaryEntry,class [mscorlib]System.Collections.IDictionaryEnumerator,object[],class [mscorlib]System.IDisposable)

      IL_0000:  newobj     instance void [mscorlib]System.Text.StringBuilder::.ctor()
      IL_0005:  stloc.0    
      IL_0006:  ldloc.0    
      IL_0007:  ldarg.0    
      IL_0008:  call       instance class [mscorlib]System.Type [mscorlib]System.Object::GetType()
      IL_000d:  callvirt   instance string [mscorlib]System.Reflection.MemberInfo::get_Name()
      IL_0012:  callvirt   instance class [mscorlib]System.Text.StringBuilder [mscorlib]System.Text.StringBuilder::Append(string)
      IL_0017:  pop        
      IL_0018:  ldloc.0    
      IL_0019:  ldstr      "("
      IL_001e:  callvirt   instance class [mscorlib]System.Text.StringBuilder [mscorlib]System.Text.StringBuilder::Append(string)
      IL_0023:  pop        
      IL_0024:  ldarg.0    
      IL_0025:  ldfld      string Microsoft.MediaCenter.Shell.ImageSet::m_stDefaultImageName
      IL_002a:  brfalse.s  IL_0051
      IL_002c:  ldloc.0    
      IL_002d:  ldstr      "DefaultImageName=\""
      IL_0032:  callvirt   instance class [mscorlib]System.Text.StringBuilder [mscorlib]System.Text.StringBuilder::Append(string)
      IL_0037:  pop        
      IL_0038:  ldloc.0    
      IL_0039:  ldarg.0    
      IL_003a:  ldfld      string Microsoft.MediaCenter.Shell.ImageSet::m_stDefaultImageName
      IL_003f:  callvirt   instance class [mscorlib]System.Text.StringBuilder [mscorlib]System.Text.StringBuilder::Append(string)
      IL_0044:  pop        
      IL_0045:  ldloc.0    
      IL_0046:  ldstr      "\", "
      IL_004b:  callvirt   instance class [mscorlib]System.Text.StringBuilder [mscorlib]System.Text.StringBuilder::Append(string)
      IL_0050:  pop        
      IL_0051:  ldarg.0    
      IL_0052:  ldfld      class [mscorlib]System.Collections.IDictionary Microsoft.MediaCenter.Shell.ImageSet::m_dictValues
      IL_0057:  callvirt   instance class [mscorlib]System.Collections.IDictionaryEnumerator [mscorlib]System.Collections.IDictionary::GetEnumerator()
      IL_005c:  stloc.2    
      IL_005d:  br.s       IL_0098
      IL_005f:  ldloc.2    
      IL_0060:  callvirt   instance object [mscorlib]System.Collections.IEnumerator::get_Current()
      IL_0065:  unbox.any  [mscorlib]System.Collections.DictionaryEntry
      IL_006a:  stloc.1    
      IL_006b:  ldloc.0    
      IL_006c:  ldstr      "(\"{0}\", {1})"
      IL_0071:  ldc.i4.2   
      IL_0072:  newarr     [mscorlib]System.Object
      IL_0077:  stloc.3    
      IL_0078:  ldloc.3    
      IL_0079:  ldc.i4.0   
      IL_007a:  ldloca.s   1
      IL_007c:  call       instance object [mscorlib]System.Collections.DictionaryEntry::get_Key()
      IL_0081:  stelem.ref 
      IL_0082:  ldloc.3    
      IL_0083:  ldc.i4.1   
      IL_0084:  ldloca.s   1
      IL_0086:  call       instance object [mscorlib]System.Collections.DictionaryEntry::get_Value()
      IL_008b:  stelem.ref 
      IL_008c:  ldloc.3    
      IL_008d:  call       string [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.InvariantString::Format(string, object[])
      IL_0092:  callvirt   instance class [mscorlib]System.Text.StringBuilder [mscorlib]System.Text.StringBuilder::Append(string)
      IL_0097:  pop        
      IL_0098:  ldloc.2    
      IL_0099:  callvirt   instance bool [mscorlib]System.Collections.IEnumerator::MoveNext()
      IL_009e:  brtrue.s   IL_005f
      IL_00a0:  leave.s    IL_00b6
      IL_00a2:  ldloc.2    
      IL_00a3:  isinst     [mscorlib]System.IDisposable
      IL_00a8:  stloc.s    4
      IL_00aa:  ldloc.s    4
      IL_00ac:  brfalse.s  IL_00b5
      IL_00ae:  ldloc.s    4
      IL_00b0:  callvirt   instance void [mscorlib]System.IDisposable::Dispose()
      IL_00b5:  endfinally 
      IL_00b6:  ldloc.0    
      IL_00b7:  ldstr      ")"
      IL_00bc:  callvirt   instance class [mscorlib]System.Text.StringBuilder [mscorlib]System.Text.StringBuilder::Append(string)
      IL_00c1:  pop        
      IL_00c2:  ldloc.0    
      IL_00c3:  callvirt   instance string [mscorlib]System.Object::ToString()
      IL_00c8:  ret        

      .try IL_005d to IL_00a2
        finally handler IL_00a2 to IL_00b6
    }

    .property instance class [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.Drawing.BaseImage DefaultImage()
    {
      .get instance class [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.Drawing.BaseImage Microsoft.MediaCenter.Shell.ImageSet::get_DefaultImage()
      .set instance void Microsoft.MediaCenter.Shell.ImageSet::set_DefaultImage(class [Microsoft.MediaCenter.UI]Microsoft.MediaCenter.UI.Drawing.BaseImage)
    }

    .property instance string DefaultImageName()
    {
      .get instance string Microsoft.MediaCenter.Shell.ImageSet::get_DefaultImageName()
      .set instance void Microsoft.MediaCenter.Shell.ImageSet::set_DefaultImageName(string)
    }

    .property instance class [mscorlib]System.Collections.IDictionary Values()
    {
      .get instance class [mscorlib]System.Collections.IDictionary Microsoft.MediaCenter.Shell.ImageSet::get_Values()
    }
  }

}
