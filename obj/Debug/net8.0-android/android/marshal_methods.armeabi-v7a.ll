; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [314 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [622 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 234
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 268
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 6: Newtonsoft.Json.dll => 0x254c520 => 192
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 10: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 309
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 191
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 252
	i32 117431740, ; 15: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 16: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 252
	i32 122350210, ; 17: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 18: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 272
	i32 142721839, ; 19: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 208
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 254
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 306
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 307
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 206
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 31: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 228
	i32 230752869, ; 32: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 33: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 34: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 35: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 261689757, ; 36: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 211
	i32 276479776, ; 37: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 38: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 230
	i32 280482487, ; 39: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 227
	i32 280992041, ; 40: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 278
	i32 291076382, ; 41: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 42: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 43: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 306
	i32 318968648, ; 44: Xamarin.AndroidX.Activity.dll => 0x13031348 => 197
	i32 321597661, ; 45: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 46: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 291
	i32 342366114, ; 47: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 229
	i32 356389973, ; 48: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 290
	i32 360082299, ; 49: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 50: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 51: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 52: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 53: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 54: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 55: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 56: _Microsoft.Android.Resource.Designer => 0x17969339 => 310
	i32 403441872, ; 57: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 58: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 302
	i32 441335492, ; 59: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 212
	i32 442565967, ; 60: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 61: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 225
	i32 451504562, ; 62: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 63: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 64: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 65: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 66: System.dll => 0x1bff388e => 164
	i32 476646585, ; 67: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 227
	i32 486930444, ; 68: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 240
	i32 498788369, ; 69: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 70: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 289
	i32 503918385, ; 71: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 283
	i32 513247710, ; 72: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 185
	i32 526420162, ; 73: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 74: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 272
	i32 530272170, ; 75: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 76: Microsoft.Extensions.Logging => 0x20216150 => 181
	i32 540030774, ; 77: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 78: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 79: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 80: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 81: Jsr305Binding => 0x213954e7 => 265
	i32 569601784, ; 82: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 263
	i32 577335427, ; 83: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 84: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 297
	i32 597488923, ; 85: CommunityToolkit.Maui => 0x239cf51b => 173
	i32 601371474, ; 86: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 87: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 88: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 89: Xamarin.AndroidX.CustomView => 0x2568904f => 217
	i32 627931235, ; 90: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 295
	i32 639843206, ; 91: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 223
	i32 643868501, ; 92: System.Net => 0x2660a755 => 81
	i32 662205335, ; 93: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 94: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 259
	i32 666292255, ; 95: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 204
	i32 672442732, ; 96: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 97: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 98: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 277
	i32 690569205, ; 99: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 100: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 274
	i32 693804605, ; 101: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 102: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 103: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 269
	i32 700358131, ; 104: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 105: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 292
	i32 709557578, ; 106: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 280
	i32 718649069, ; 107: DuwademyMobile => 0x2ad5b6ed => 0
	i32 720511267, ; 108: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 273
	i32 722857257, ; 109: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 110: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 111: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 112: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 194
	i32 759454413, ; 113: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 114: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 115: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 116: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 301
	i32 789151979, ; 117: Microsoft.Extensions.Options => 0x2f0980eb => 184
	i32 790371945, ; 118: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 218
	i32 804715423, ; 119: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 120: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 232
	i32 823281589, ; 121: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 122: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 123: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 124: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 125: Xamarin.AndroidX.Print => 0x3246f6cd => 245
	i32 873119928, ; 126: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 127: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 128: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 129: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 130: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 926902833, ; 131: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 304
	i32 928116545, ; 132: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 268
	i32 952186615, ; 133: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 134: Newtonsoft.Json => 0x38f24a24 => 192
	i32 956575887, ; 135: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 273
	i32 966729478, ; 136: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 266
	i32 967690846, ; 137: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 229
	i32 975236339, ; 138: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 139: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 140: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 141: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 142: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 143: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 1001831731, ; 144: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 145: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 249
	i32 1019214401, ; 146: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 147: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 180
	i32 1029334545, ; 148: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 279
	i32 1031528504, ; 149: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 267
	i32 1035644815, ; 150: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 202
	i32 1036536393, ; 151: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 152: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 153: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 236
	i32 1067306892, ; 154: GoogleGson => 0x3f9dcf8c => 176
	i32 1082857460, ; 155: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 156: Xamarin.Kotlin.StdLib => 0x409e66d8 => 270
	i32 1098259244, ; 157: System => 0x41761b2c => 164
	i32 1118262833, ; 158: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 292
	i32 1121599056, ; 159: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 235
	i32 1127624469, ; 160: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 183
	i32 1149092582, ; 161: Xamarin.AndroidX.Window => 0x447dc2e6 => 262
	i32 1168523401, ; 162: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 298
	i32 1170634674, ; 163: System.Web.dll => 0x45c677b2 => 153
	i32 1175144683, ; 164: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 258
	i32 1178241025, ; 165: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 243
	i32 1203215381, ; 166: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 296
	i32 1204270330, ; 167: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 204
	i32 1208641965, ; 168: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1214827643, ; 169: CommunityToolkit.Mvvm => 0x4868cc7b => 175
	i32 1219128291, ; 170: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1234928153, ; 171: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 294
	i32 1243150071, ; 172: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 263
	i32 1253011324, ; 173: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 174: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 278
	i32 1264511973, ; 175: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 253
	i32 1267360935, ; 176: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 257
	i32 1273260888, ; 177: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 209
	i32 1275534314, ; 178: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 274
	i32 1278448581, ; 179: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 201
	i32 1293217323, ; 180: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 220
	i32 1309188875, ; 181: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1322716291, ; 182: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 262
	i32 1324164729, ; 183: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 184: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 185: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 186: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 308
	i32 1376866003, ; 187: Xamarin.AndroidX.SavedState => 0x52114ed3 => 249
	i32 1379779777, ; 188: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 189: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 190: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 213
	i32 1408764838, ; 191: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 192: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 193: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 194: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 276
	i32 1434145427, ; 195: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 196: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 266
	i32 1439761251, ; 197: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 198: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 199: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1457743152, ; 200: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 201: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 202: es\Microsoft.Maui.Controls.resources => 0x57152abe => 282
	i32 1461234159, ; 203: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 204: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 205: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 206: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 203
	i32 1470490898, ; 207: Microsoft.Extensions.Primitives => 0x57a5e912 => 185
	i32 1479771757, ; 208: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 209: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 210: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 211: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 250
	i32 1493001747, ; 212: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 286
	i32 1514721132, ; 213: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 281
	i32 1536373174, ; 214: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 215: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 216: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1550322496, ; 217: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 218: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 301
	i32 1565862583, ; 219: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 220: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 221: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 222: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 223: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 219
	i32 1592978981, ; 224: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 225: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 267
	i32 1601112923, ; 226: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 227: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 228: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 229: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 239
	i32 1622358360, ; 230: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 231: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 261
	i32 1634654947, ; 232: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 174
	i32 1635184631, ; 233: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 223
	i32 1636350590, ; 234: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 216
	i32 1639515021, ; 235: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 236: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 237: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 238: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 239: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 255
	i32 1658251792, ; 240: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 264
	i32 1670060433, ; 241: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 211
	i32 1675553242, ; 242: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 243: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 244: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 245: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 246: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 247: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 248: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 271
	i32 1701541528, ; 249: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 250: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 232
	i32 1726116996, ; 251: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 252: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 253: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 207
	i32 1736233607, ; 254: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 299
	i32 1743415430, ; 255: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 277
	i32 1744735666, ; 256: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746316138, ; 257: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 258: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 259: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1763938596, ; 260: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 261: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 262: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 254
	i32 1770582343, ; 263: Microsoft.Extensions.Logging.dll => 0x6988f147 => 181
	i32 1776026572, ; 264: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 265: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 266: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 267: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 293
	i32 1788241197, ; 268: Xamarin.AndroidX.Fragment => 0x6a96652d => 225
	i32 1793755602, ; 269: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 285
	i32 1808609942, ; 270: Xamarin.AndroidX.Loader => 0x6bcd3296 => 239
	i32 1813058853, ; 271: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 270
	i32 1813201214, ; 272: Xamarin.Google.Android.Material => 0x6c13413e => 264
	i32 1818569960, ; 273: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 244
	i32 1818787751, ; 274: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 275: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 276: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 277: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 182
	i32 1842015223, ; 278: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 305
	i32 1847515442, ; 279: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 194
	i32 1853025655, ; 280: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 302
	i32 1858542181, ; 281: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 282: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 283: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 284
	i32 1879696579, ; 284: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 285: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 205
	i32 1888955245, ; 286: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 287: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1898237753, ; 288: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 289: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 290: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 291: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 292: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 293: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 251
	i32 1968388702, ; 294: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 177
	i32 1983156543, ; 295: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 271
	i32 1985761444, ; 296: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 196
	i32 2003115576, ; 297: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 281
	i32 2011961780, ; 298: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 299: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 236
	i32 2025202353, ; 300: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 276
	i32 2031763787, ; 301: Xamarin.Android.Glide => 0x791a414b => 193
	i32 2045470958, ; 302: System.Private.Xml => 0x79eb68ee => 88
	i32 2055257422, ; 303: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 231
	i32 2060060697, ; 304: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 305: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 280
	i32 2070888862, ; 306: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2079903147, ; 307: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 308: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 309: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 310: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 311: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 312: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 313: Microsoft.Maui => 0x80bd55ad => 189
	i32 2169148018, ; 314: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 288
	i32 2181898931, ; 315: Microsoft.Extensions.Options.dll => 0x820d22b3 => 184
	i32 2192057212, ; 316: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 182
	i32 2193016926, ; 317: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2201107256, ; 318: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 275
	i32 2201231467, ; 319: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 320: it\Microsoft.Maui.Controls.resources => 0x839595db => 290
	i32 2217644978, ; 321: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 258
	i32 2222056684, ; 322: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 323: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 240
	i32 2252106437, ; 324: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 325: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 326: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 327: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 178
	i32 2267999099, ; 328: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 195
	i32 2270573516, ; 329: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 284
	i32 2279755925, ; 330: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 247
	i32 2293034957, ; 331: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 332: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 333: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 334: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 294
	i32 2305521784, ; 335: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 336: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 199
	i32 2320631194, ; 337: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 338: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 339: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 340: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 341: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 342: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 177
	i32 2378619854, ; 343: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 344: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 345: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 289
	i32 2401565422, ; 346: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 347: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 222
	i32 2421380589, ; 348: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 349: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 209
	i32 2427813419, ; 350: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 286
	i32 2435356389, ; 351: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 352: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 353: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 354: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 355: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 356: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 212
	i32 2471841756, ; 357: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 358: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 359: Microsoft.Maui.Controls => 0x93dba8a1 => 187
	i32 2483903535, ; 360: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 361: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 362: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 363: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 364: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 234
	i32 2522472828, ; 365: Xamarin.Android.Glide.dll => 0x9659e17c => 193
	i32 2538310050, ; 366: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 367: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 287
	i32 2562349572, ; 368: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 369: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2581783588, ; 370: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 235
	i32 2581819634, ; 371: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 257
	i32 2585220780, ; 372: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 373: System.Net.Ping => 0x9a20430d => 69
	i32 2589602615, ; 374: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2593496499, ; 375: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 296
	i32 2605712449, ; 376: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 275
	i32 2615233544, ; 377: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 226
	i32 2616218305, ; 378: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 183
	i32 2617129537, ; 379: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 380: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 381: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 216
	i32 2624644809, ; 382: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 221
	i32 2626831493, ; 383: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 291
	i32 2627185994, ; 384: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 385: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 386: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 230
	i32 2663391936, ; 387: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 195
	i32 2663698177, ; 388: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 389: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 390: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 391: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 392: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2693849962, ; 393: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 394: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 255
	i32 2715334215, ; 395: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 396: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 397: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 398: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 399: Xamarin.AndroidX.Activity => 0xa2e0939b => 197
	i32 2735172069, ; 400: System.Threading.Channels => 0xa30769e5 => 139
	i32 2737747696, ; 401: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 203
	i32 2740948882, ; 402: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 403: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 404: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 297
	i32 2758225723, ; 405: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 188
	i32 2764765095, ; 406: Microsoft.Maui.dll => 0xa4caf7a7 => 189
	i32 2765824710, ; 407: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 408: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 269
	i32 2778768386, ; 409: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 260
	i32 2779977773, ; 410: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 248
	i32 2785988530, ; 411: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 303
	i32 2788224221, ; 412: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 226
	i32 2801831435, ; 413: Microsoft.Maui.Graphics => 0xa7008e0b => 191
	i32 2803228030, ; 414: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 415: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 282
	i32 2810250172, ; 416: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 213
	i32 2819470561, ; 417: System.Xml.dll => 0xa80db4e1 => 163
	i32 2821205001, ; 418: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 419: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 248
	i32 2824502124, ; 420: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 421: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 295
	i32 2838993487, ; 422: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 237
	i32 2849599387, ; 423: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 424: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 260
	i32 2855708567, ; 425: Xamarin.AndroidX.Transition => 0xaa36a797 => 256
	i32 2861098320, ; 426: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 427: Microsoft.Maui.Essentials => 0xaa8a4878 => 190
	i32 2868488919, ; 428: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 174
	i32 2870099610, ; 429: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 198
	i32 2875164099, ; 430: Jsr305Binding.dll => 0xab5f85c3 => 265
	i32 2875220617, ; 431: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 432: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 224
	i32 2887636118, ; 433: System.Net.dll => 0xac1dd496 => 81
	i32 2899753641, ; 434: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 435: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 436: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 437: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 438: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2916838712, ; 439: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 261
	i32 2919462931, ; 440: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 441: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 200
	i32 2936416060, ; 442: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 443: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 444: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 445: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 446: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 447: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 448: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 220
	i32 2987532451, ; 449: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 251
	i32 2996846495, ; 450: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 233
	i32 3016983068, ; 451: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 253
	i32 3023353419, ; 452: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 453: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 228
	i32 3038032645, ; 454: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 310
	i32 3056245963, ; 455: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 250
	i32 3057625584, ; 456: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 241
	i32 3059408633, ; 457: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 458: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 459: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 460: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 288
	i32 3090735792, ; 461: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 462: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 463: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 464: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 465: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 466: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 467: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 468: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 469: GoogleGson.dll => 0xbba64c02 => 176
	i32 3159123045, ; 470: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 471: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 472: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 242
	i32 3192346100, ; 473: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 474: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 475: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 476: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 477: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 219
	i32 3220365878, ; 478: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 479: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 480: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3258312781, ; 481: Xamarin.AndroidX.CardView => 0xc235e84d => 207
	i32 3265493905, ; 482: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 483: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 484: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 485: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 486: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 487: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 488: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 489: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 490: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 283
	i32 3316684772, ; 491: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 492: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 217
	i32 3317144872, ; 493: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 494: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 205
	i32 3345895724, ; 495: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 246
	i32 3346324047, ; 496: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 243
	i32 3357674450, ; 497: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 300
	i32 3358260929, ; 498: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 499: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 198
	i32 3362522851, ; 500: Xamarin.AndroidX.Core => 0xc86c06e3 => 214
	i32 3366347497, ; 501: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 502: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 247
	i32 3381016424, ; 503: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 279
	i32 3395150330, ; 504: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 505: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 506: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 218
	i32 3428513518, ; 507: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 179
	i32 3429136800, ; 508: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 509: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 510: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 221
	i32 3445260447, ; 511: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 512: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 186
	i32 3463511458, ; 513: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 287
	i32 3471940407, ; 514: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 515: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 516: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 300
	i32 3484440000, ; 517: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 299
	i32 3485117614, ; 518: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 519: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 520: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 210
	i32 3509114376, ; 521: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 522: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 523: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 524: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 525: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 526: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 527: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 307
	i32 3597029428, ; 528: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 196
	i32 3598340787, ; 529: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 530: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 531: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 532: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 245
	i32 3633644679, ; 533: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 200
	i32 3638274909, ; 534: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 535: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 231
	i32 3643446276, ; 536: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 304
	i32 3643854240, ; 537: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 242
	i32 3645089577, ; 538: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 539: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 178
	i32 3660523487, ; 540: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 541: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 542: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 206
	i32 3684561358, ; 543: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 210
	i32 3697841164, ; 544: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 309
	i32 3700866549, ; 545: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 546: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 215
	i32 3716563718, ; 547: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 548: Xamarin.AndroidX.Annotation => 0xdda814c6 => 199
	i32 3724971120, ; 549: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 241
	i32 3732100267, ; 550: System.Net.NameResolution => 0xde7354ab => 67
	i32 3737834244, ; 551: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 552: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 553: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3786282454, ; 554: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 208
	i32 3792276235, ; 555: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 556: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 186
	i32 3802395368, ; 557: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3817368567, ; 558: CommunityToolkit.Maui.dll => 0xe3886bf7 => 173
	i32 3819260425, ; 559: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 560: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 561: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 562: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 180
	i32 3844307129, ; 563: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 564: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 565: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 566: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 567: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 568: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 569: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 256
	i32 3888767677, ; 570: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 246
	i32 3889960447, ; 571: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 308
	i32 3896106733, ; 572: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 573: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 214
	i32 3901907137, ; 574: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 575: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 576: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 259
	i32 3928044579, ; 577: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 578: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 579: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 244
	i32 3945713374, ; 580: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 581: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3955647286, ; 582: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 202
	i32 3959773229, ; 583: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 233
	i32 3980434154, ; 584: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 303
	i32 3987592930, ; 585: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 285
	i32 4003436829, ; 586: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 587: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 201
	i32 4025784931, ; 588: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 589: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 188
	i32 4054681211, ; 590: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 591: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 592: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4094352644, ; 593: Microsoft.Maui.Essentials.dll => 0xf40add04 => 190
	i32 4099507663, ; 594: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 595: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 596: Xamarin.AndroidX.Emoji2 => 0xf479582c => 222
	i32 4102112229, ; 597: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 298
	i32 4125707920, ; 598: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 293
	i32 4126470640, ; 599: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 179
	i32 4127667938, ; 600: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 601: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 602: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 603: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 305
	i32 4151237749, ; 604: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 605: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 606: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4162161943, ; 607: DuwademyMobile.dll => 0xf8158d17 => 0
	i32 4164802419, ; 608: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 609: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 610: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 238
	i32 4185676441, ; 611: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 612: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 613: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 614: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 215
	i32 4258378803, ; 615: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 237
	i32 4260525087, ; 616: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 617: Microsoft.Maui.Controls.dll => 0xfea12dee => 187
	i32 4274623895, ; 618: CommunityToolkit.Mvvm.dll => 0xfec99597 => 175
	i32 4274976490, ; 619: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 620: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 238
	i32 4294763496 ; 621: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 224
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [622 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 234, ; 3
	i32 268, ; 4
	i32 48, ; 5
	i32 192, ; 6
	i32 80, ; 7
	i32 145, ; 8
	i32 30, ; 9
	i32 309, ; 10
	i32 124, ; 11
	i32 191, ; 12
	i32 102, ; 13
	i32 252, ; 14
	i32 107, ; 15
	i32 252, ; 16
	i32 139, ; 17
	i32 272, ; 18
	i32 77, ; 19
	i32 124, ; 20
	i32 13, ; 21
	i32 208, ; 22
	i32 132, ; 23
	i32 254, ; 24
	i32 151, ; 25
	i32 306, ; 26
	i32 307, ; 27
	i32 18, ; 28
	i32 206, ; 29
	i32 26, ; 30
	i32 228, ; 31
	i32 1, ; 32
	i32 59, ; 33
	i32 42, ; 34
	i32 91, ; 35
	i32 211, ; 36
	i32 147, ; 37
	i32 230, ; 38
	i32 227, ; 39
	i32 278, ; 40
	i32 54, ; 41
	i32 69, ; 42
	i32 306, ; 43
	i32 197, ; 44
	i32 83, ; 45
	i32 291, ; 46
	i32 229, ; 47
	i32 290, ; 48
	i32 131, ; 49
	i32 55, ; 50
	i32 149, ; 51
	i32 74, ; 52
	i32 145, ; 53
	i32 62, ; 54
	i32 146, ; 55
	i32 310, ; 56
	i32 165, ; 57
	i32 302, ; 58
	i32 212, ; 59
	i32 12, ; 60
	i32 225, ; 61
	i32 125, ; 62
	i32 152, ; 63
	i32 113, ; 64
	i32 166, ; 65
	i32 164, ; 66
	i32 227, ; 67
	i32 240, ; 68
	i32 84, ; 69
	i32 289, ; 70
	i32 283, ; 71
	i32 185, ; 72
	i32 150, ; 73
	i32 272, ; 74
	i32 60, ; 75
	i32 181, ; 76
	i32 51, ; 77
	i32 103, ; 78
	i32 114, ; 79
	i32 40, ; 80
	i32 265, ; 81
	i32 263, ; 82
	i32 120, ; 83
	i32 297, ; 84
	i32 173, ; 85
	i32 52, ; 86
	i32 44, ; 87
	i32 119, ; 88
	i32 217, ; 89
	i32 295, ; 90
	i32 223, ; 91
	i32 81, ; 92
	i32 136, ; 93
	i32 259, ; 94
	i32 204, ; 95
	i32 8, ; 96
	i32 73, ; 97
	i32 277, ; 98
	i32 155, ; 99
	i32 274, ; 100
	i32 154, ; 101
	i32 92, ; 102
	i32 269, ; 103
	i32 45, ; 104
	i32 292, ; 105
	i32 280, ; 106
	i32 0, ; 107
	i32 273, ; 108
	i32 109, ; 109
	i32 129, ; 110
	i32 25, ; 111
	i32 194, ; 112
	i32 72, ; 113
	i32 55, ; 114
	i32 46, ; 115
	i32 301, ; 116
	i32 184, ; 117
	i32 218, ; 118
	i32 22, ; 119
	i32 232, ; 120
	i32 86, ; 121
	i32 43, ; 122
	i32 160, ; 123
	i32 71, ; 124
	i32 245, ; 125
	i32 3, ; 126
	i32 42, ; 127
	i32 63, ; 128
	i32 16, ; 129
	i32 53, ; 130
	i32 304, ; 131
	i32 268, ; 132
	i32 105, ; 133
	i32 192, ; 134
	i32 273, ; 135
	i32 266, ; 136
	i32 229, ; 137
	i32 34, ; 138
	i32 158, ; 139
	i32 85, ; 140
	i32 32, ; 141
	i32 12, ; 142
	i32 51, ; 143
	i32 56, ; 144
	i32 249, ; 145
	i32 36, ; 146
	i32 180, ; 147
	i32 279, ; 148
	i32 267, ; 149
	i32 202, ; 150
	i32 35, ; 151
	i32 58, ; 152
	i32 236, ; 153
	i32 176, ; 154
	i32 17, ; 155
	i32 270, ; 156
	i32 164, ; 157
	i32 292, ; 158
	i32 235, ; 159
	i32 183, ; 160
	i32 262, ; 161
	i32 298, ; 162
	i32 153, ; 163
	i32 258, ; 164
	i32 243, ; 165
	i32 296, ; 166
	i32 204, ; 167
	i32 29, ; 168
	i32 175, ; 169
	i32 52, ; 170
	i32 294, ; 171
	i32 263, ; 172
	i32 5, ; 173
	i32 278, ; 174
	i32 253, ; 175
	i32 257, ; 176
	i32 209, ; 177
	i32 274, ; 178
	i32 201, ; 179
	i32 220, ; 180
	i32 85, ; 181
	i32 262, ; 182
	i32 61, ; 183
	i32 112, ; 184
	i32 57, ; 185
	i32 308, ; 186
	i32 249, ; 187
	i32 99, ; 188
	i32 19, ; 189
	i32 213, ; 190
	i32 111, ; 191
	i32 101, ; 192
	i32 102, ; 193
	i32 276, ; 194
	i32 104, ; 195
	i32 266, ; 196
	i32 71, ; 197
	i32 38, ; 198
	i32 32, ; 199
	i32 103, ; 200
	i32 73, ; 201
	i32 282, ; 202
	i32 9, ; 203
	i32 123, ; 204
	i32 46, ; 205
	i32 203, ; 206
	i32 185, ; 207
	i32 9, ; 208
	i32 43, ; 209
	i32 4, ; 210
	i32 250, ; 211
	i32 286, ; 212
	i32 281, ; 213
	i32 31, ; 214
	i32 138, ; 215
	i32 92, ; 216
	i32 93, ; 217
	i32 301, ; 218
	i32 49, ; 219
	i32 141, ; 220
	i32 112, ; 221
	i32 140, ; 222
	i32 219, ; 223
	i32 115, ; 224
	i32 267, ; 225
	i32 157, ; 226
	i32 76, ; 227
	i32 79, ; 228
	i32 239, ; 229
	i32 37, ; 230
	i32 261, ; 231
	i32 174, ; 232
	i32 223, ; 233
	i32 216, ; 234
	i32 64, ; 235
	i32 138, ; 236
	i32 15, ; 237
	i32 116, ; 238
	i32 255, ; 239
	i32 264, ; 240
	i32 211, ; 241
	i32 48, ; 242
	i32 70, ; 243
	i32 80, ; 244
	i32 126, ; 245
	i32 94, ; 246
	i32 121, ; 247
	i32 271, ; 248
	i32 26, ; 249
	i32 232, ; 250
	i32 97, ; 251
	i32 28, ; 252
	i32 207, ; 253
	i32 299, ; 254
	i32 277, ; 255
	i32 149, ; 256
	i32 169, ; 257
	i32 4, ; 258
	i32 98, ; 259
	i32 33, ; 260
	i32 93, ; 261
	i32 254, ; 262
	i32 181, ; 263
	i32 21, ; 264
	i32 41, ; 265
	i32 170, ; 266
	i32 293, ; 267
	i32 225, ; 268
	i32 285, ; 269
	i32 239, ; 270
	i32 270, ; 271
	i32 264, ; 272
	i32 244, ; 273
	i32 2, ; 274
	i32 134, ; 275
	i32 111, ; 276
	i32 182, ; 277
	i32 305, ; 278
	i32 194, ; 279
	i32 302, ; 280
	i32 58, ; 281
	i32 95, ; 282
	i32 284, ; 283
	i32 39, ; 284
	i32 205, ; 285
	i32 25, ; 286
	i32 94, ; 287
	i32 89, ; 288
	i32 99, ; 289
	i32 10, ; 290
	i32 87, ; 291
	i32 100, ; 292
	i32 251, ; 293
	i32 177, ; 294
	i32 271, ; 295
	i32 196, ; 296
	i32 281, ; 297
	i32 7, ; 298
	i32 236, ; 299
	i32 276, ; 300
	i32 193, ; 301
	i32 88, ; 302
	i32 231, ; 303
	i32 154, ; 304
	i32 280, ; 305
	i32 33, ; 306
	i32 116, ; 307
	i32 82, ; 308
	i32 20, ; 309
	i32 11, ; 310
	i32 162, ; 311
	i32 3, ; 312
	i32 189, ; 313
	i32 288, ; 314
	i32 184, ; 315
	i32 182, ; 316
	i32 84, ; 317
	i32 275, ; 318
	i32 64, ; 319
	i32 290, ; 320
	i32 258, ; 321
	i32 143, ; 322
	i32 240, ; 323
	i32 157, ; 324
	i32 41, ; 325
	i32 117, ; 326
	i32 178, ; 327
	i32 195, ; 328
	i32 284, ; 329
	i32 247, ; 330
	i32 131, ; 331
	i32 75, ; 332
	i32 66, ; 333
	i32 294, ; 334
	i32 172, ; 335
	i32 199, ; 336
	i32 143, ; 337
	i32 106, ; 338
	i32 151, ; 339
	i32 70, ; 340
	i32 156, ; 341
	i32 177, ; 342
	i32 121, ; 343
	i32 127, ; 344
	i32 289, ; 345
	i32 152, ; 346
	i32 222, ; 347
	i32 141, ; 348
	i32 209, ; 349
	i32 286, ; 350
	i32 20, ; 351
	i32 14, ; 352
	i32 135, ; 353
	i32 75, ; 354
	i32 59, ; 355
	i32 212, ; 356
	i32 167, ; 357
	i32 168, ; 358
	i32 187, ; 359
	i32 15, ; 360
	i32 74, ; 361
	i32 6, ; 362
	i32 23, ; 363
	i32 234, ; 364
	i32 193, ; 365
	i32 91, ; 366
	i32 287, ; 367
	i32 1, ; 368
	i32 136, ; 369
	i32 235, ; 370
	i32 257, ; 371
	i32 134, ; 372
	i32 69, ; 373
	i32 146, ; 374
	i32 296, ; 375
	i32 275, ; 376
	i32 226, ; 377
	i32 183, ; 378
	i32 88, ; 379
	i32 96, ; 380
	i32 216, ; 381
	i32 221, ; 382
	i32 291, ; 383
	i32 31, ; 384
	i32 45, ; 385
	i32 230, ; 386
	i32 195, ; 387
	i32 109, ; 388
	i32 158, ; 389
	i32 35, ; 390
	i32 22, ; 391
	i32 114, ; 392
	i32 57, ; 393
	i32 255, ; 394
	i32 144, ; 395
	i32 118, ; 396
	i32 120, ; 397
	i32 110, ; 398
	i32 197, ; 399
	i32 139, ; 400
	i32 203, ; 401
	i32 54, ; 402
	i32 105, ; 403
	i32 297, ; 404
	i32 188, ; 405
	i32 189, ; 406
	i32 133, ; 407
	i32 269, ; 408
	i32 260, ; 409
	i32 248, ; 410
	i32 303, ; 411
	i32 226, ; 412
	i32 191, ; 413
	i32 159, ; 414
	i32 282, ; 415
	i32 213, ; 416
	i32 163, ; 417
	i32 132, ; 418
	i32 248, ; 419
	i32 161, ; 420
	i32 295, ; 421
	i32 237, ; 422
	i32 140, ; 423
	i32 260, ; 424
	i32 256, ; 425
	i32 169, ; 426
	i32 190, ; 427
	i32 174, ; 428
	i32 198, ; 429
	i32 265, ; 430
	i32 40, ; 431
	i32 224, ; 432
	i32 81, ; 433
	i32 56, ; 434
	i32 37, ; 435
	i32 97, ; 436
	i32 166, ; 437
	i32 172, ; 438
	i32 261, ; 439
	i32 82, ; 440
	i32 200, ; 441
	i32 98, ; 442
	i32 30, ; 443
	i32 159, ; 444
	i32 18, ; 445
	i32 127, ; 446
	i32 119, ; 447
	i32 220, ; 448
	i32 251, ; 449
	i32 233, ; 450
	i32 253, ; 451
	i32 165, ; 452
	i32 228, ; 453
	i32 310, ; 454
	i32 250, ; 455
	i32 241, ; 456
	i32 170, ; 457
	i32 16, ; 458
	i32 144, ; 459
	i32 288, ; 460
	i32 125, ; 461
	i32 118, ; 462
	i32 38, ; 463
	i32 115, ; 464
	i32 47, ; 465
	i32 142, ; 466
	i32 117, ; 467
	i32 34, ; 468
	i32 176, ; 469
	i32 95, ; 470
	i32 53, ; 471
	i32 242, ; 472
	i32 129, ; 473
	i32 153, ; 474
	i32 24, ; 475
	i32 161, ; 476
	i32 219, ; 477
	i32 148, ; 478
	i32 104, ; 479
	i32 89, ; 480
	i32 207, ; 481
	i32 60, ; 482
	i32 142, ; 483
	i32 100, ; 484
	i32 5, ; 485
	i32 13, ; 486
	i32 122, ; 487
	i32 135, ; 488
	i32 28, ; 489
	i32 283, ; 490
	i32 72, ; 491
	i32 217, ; 492
	i32 24, ; 493
	i32 205, ; 494
	i32 246, ; 495
	i32 243, ; 496
	i32 300, ; 497
	i32 137, ; 498
	i32 198, ; 499
	i32 214, ; 500
	i32 168, ; 501
	i32 247, ; 502
	i32 279, ; 503
	i32 101, ; 504
	i32 123, ; 505
	i32 218, ; 506
	i32 179, ; 507
	i32 163, ; 508
	i32 167, ; 509
	i32 221, ; 510
	i32 39, ; 511
	i32 186, ; 512
	i32 287, ; 513
	i32 17, ; 514
	i32 171, ; 515
	i32 300, ; 516
	i32 299, ; 517
	i32 137, ; 518
	i32 150, ; 519
	i32 210, ; 520
	i32 155, ; 521
	i32 130, ; 522
	i32 19, ; 523
	i32 65, ; 524
	i32 147, ; 525
	i32 47, ; 526
	i32 307, ; 527
	i32 196, ; 528
	i32 79, ; 529
	i32 61, ; 530
	i32 106, ; 531
	i32 245, ; 532
	i32 200, ; 533
	i32 49, ; 534
	i32 231, ; 535
	i32 304, ; 536
	i32 242, ; 537
	i32 14, ; 538
	i32 178, ; 539
	i32 68, ; 540
	i32 171, ; 541
	i32 206, ; 542
	i32 210, ; 543
	i32 309, ; 544
	i32 78, ; 545
	i32 215, ; 546
	i32 108, ; 547
	i32 199, ; 548
	i32 241, ; 549
	i32 67, ; 550
	i32 63, ; 551
	i32 27, ; 552
	i32 160, ; 553
	i32 208, ; 554
	i32 10, ; 555
	i32 186, ; 556
	i32 11, ; 557
	i32 173, ; 558
	i32 78, ; 559
	i32 126, ; 560
	i32 83, ; 561
	i32 180, ; 562
	i32 66, ; 563
	i32 107, ; 564
	i32 65, ; 565
	i32 128, ; 566
	i32 122, ; 567
	i32 77, ; 568
	i32 256, ; 569
	i32 246, ; 570
	i32 308, ; 571
	i32 8, ; 572
	i32 214, ; 573
	i32 2, ; 574
	i32 44, ; 575
	i32 259, ; 576
	i32 156, ; 577
	i32 128, ; 578
	i32 244, ; 579
	i32 23, ; 580
	i32 133, ; 581
	i32 202, ; 582
	i32 233, ; 583
	i32 303, ; 584
	i32 285, ; 585
	i32 29, ; 586
	i32 201, ; 587
	i32 62, ; 588
	i32 188, ; 589
	i32 90, ; 590
	i32 87, ; 591
	i32 148, ; 592
	i32 190, ; 593
	i32 36, ; 594
	i32 86, ; 595
	i32 222, ; 596
	i32 298, ; 597
	i32 293, ; 598
	i32 179, ; 599
	i32 50, ; 600
	i32 6, ; 601
	i32 90, ; 602
	i32 305, ; 603
	i32 21, ; 604
	i32 162, ; 605
	i32 96, ; 606
	i32 0, ; 607
	i32 50, ; 608
	i32 113, ; 609
	i32 238, ; 610
	i32 130, ; 611
	i32 76, ; 612
	i32 27, ; 613
	i32 215, ; 614
	i32 237, ; 615
	i32 7, ; 616
	i32 187, ; 617
	i32 175, ; 618
	i32 110, ; 619
	i32 238, ; 620
	i32 224 ; 621
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
