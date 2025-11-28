Return-Path: <linux-renesas-soc+bounces-25331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A95FAC92782
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 16:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0609F34B351
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 15:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAE5264A9D;
	Fri, 28 Nov 2025 15:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="moh/6Ju+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DC922578A;
	Fri, 28 Nov 2025 15:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764344602; cv=fail; b=YifTaGiYgFnEU5ILF/0SoITD+E4weC/kOyGuoFI+39XZGTL+gpJEOXORMz07bk2rxWoSuIAYogTrXbxYkbJ8NcLzApWWq9H+kJmMdo6MyxUo0oBDhT6i5MnSpJ66XMa32QbmztJzPDiv3XLpWSTB10kGe/peDIcBBS/ojMclzKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764344602; c=relaxed/simple;
	bh=BXwyKbyv9FepJ9TE8KC5yZc7ZUcwRCa/D8XrhtSZVik=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=otbTxPvftxwtNSU41rfD+bIsxBP62ZpaxG4mqJersOBISTnu//N+ic7ZKkeJyUV8hg7gRbf3GFsnL87fTty9gLdW0PNDRq9/BTF+ic+6IGNSQcTFKPeJP9UU1BTJX3+CbEv+o13B6UyLf28iARL0PPULqbp0z+6rBov/lP8MpOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=moh/6Ju+; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oPRuBGPygTYS9enXimi4YIybsuQ0HQ7dRLLp5UOVvg1uJS2nfEEQHnbtsBW3/nFZWPypQO5ZiSMW7rOt2dfYaiQsm7Pri4P9pBMCr3kQJGl3jPT5MyhGhkNZ+6TqXay3ZutCx3dXy7GgxxnL3pIKU7h2mF4nHcjIKjs44mRuatQF5LmHokYUe+4staL5DRQLBcBAjQyLXOeehjBwfpck36UrOR0+2/ocGibhl7m8cSJIyCZGAj90VhaWDxIwdwkBncg6zfMaNozYNjyfwiv5A4NAplFMDveB+Y0r8iNl3dWG6itMHCcPa1HgKauvjFvjg7HWeZl7pCH3Dylenxm2EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BXwyKbyv9FepJ9TE8KC5yZc7ZUcwRCa/D8XrhtSZVik=;
 b=HPAQndDHNWNF8LmBTf0/NgIW05gEElkT+XHCyq9tPb2rc+AYg69aDdI2bwrQP+AJ/3aSyp20yZ77+1Cb4VPpv3N+TcavyYeaJNNfYUOLRcB8llRHuJgg643kMuwQ9WxifFkX9qopkvhdJkAgCANLyOwCBFJSPKfBjU1zUa6CduZue0yZ+lxBBDOZ9DenO1ZbE6MLK0lJVIi1YYQeFA4GN2ARNi8oDcQwWd8VIGE/+Jw2xHNHWnhqaPdrpKdWJBvT8UwSeVMU4yleZRfS+JYazeZQEYIK1DCji+lxPD4jPfSbnP3rrSuGedoWeGIYTbsupD6yOPX8ay7xQVlbQy+TOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BXwyKbyv9FepJ9TE8KC5yZc7ZUcwRCa/D8XrhtSZVik=;
 b=moh/6Ju+897Wzt7eB8eISx5WwaBqOEdaf6oWXa8UepCgsF/QISFe9MiRCSlwXV6Ti4zPsC3Z1piXbOt9YaHAUJhy58jA81jw2RBfcnAxi8qZWT43Dc8gNt2ENh6XbL0ccxUPfEBJWr+V9qSOIrxK5ZQXHxhAlINpnZvblEt3A5c=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10773.jpnprd01.prod.outlook.com (2603:1096:400:2a5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.5; Fri, 28 Nov
 2025 15:43:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.003; Fri, 28 Nov 2025
 15:43:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: magnus.damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 19/19] arm64: dts: renesas: renesas-smarc2: Enable
 rsci{2,4,9} nodes
Thread-Topic: [PATCH 19/19] arm64: dts: renesas: renesas-smarc2: Enable
 rsci{2,4,9} nodes
Thread-Index: AQHcR1kGGMqikw/5eUatAgNBHQCnJLUISpeAgAAaAAA=
Date: Fri, 28 Nov 2025 15:43:15 +0000
Message-ID:
 <TY3PR01MB1134698C3462DBE86ABA1597B86DCA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
 <20251027154615.115759-20-biju.das.jz@bp.renesas.com>
 <CAMuHMdVWMMaUV92mGF8u4E+FsyKQ5_JbQhm9pbUwzSr58ZgNHw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVWMMaUV92mGF8u4E+FsyKQ5_JbQhm9pbUwzSr58ZgNHw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10773:EE_
x-ms-office365-filtering-correlation-id: d54e333f-bef4-4a97-f287-08de2e94d84d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WE5kZW9JeEN5czllWE5GblJQQUFldFZNTGVyT0Z4TzdmVHdZanMxR2NmZ3Bp?=
 =?utf-8?B?SnErQXNRaWtsLzVtYUc2OGREUjBXSGRaWUppMlE0dzdIeE45TDZWV0Q1a2h6?=
 =?utf-8?B?RVNrUFdjWDVOSjZZTE43eU5KL1owZGk1enZscDNCL2dQUWkvcThSQ05aZm9v?=
 =?utf-8?B?RnY2VVJLeGx3dmFNL0hmVHRCNlNSajRyb3dnUnNhSnU1SUlUbmN1SUZ3Z1Fo?=
 =?utf-8?B?NWQrRDB3RXhkaHBKVWEwNnRSNFhoVlhUUnhZRDV3a0lNUEcxM240S3NMUnJ0?=
 =?utf-8?B?YkhuQWhPdCtrY0N5bXBZWXR4QVQzSHN1c1VRWGNmYzNKUWplMStKMEFLbEUw?=
 =?utf-8?B?T2JheVZ6UnpoMitwWUFLNE9ENklVNXlncDNFMzBBZURqdUNPNzJjYlJ1eTRr?=
 =?utf-8?B?M2VRWjdKclEwdGUrY1g4aUhLL3huWlJGbnJFWW01ZUVWUWo1SjdjTlczN28r?=
 =?utf-8?B?VFpwOTRFK3l3eE1qaFErVSt1cXkwbmpBejN5NEMrcjR3NkJSa0FUeTV0eTNB?=
 =?utf-8?B?dTlYSDlaYlN6SUtNSGtRRm95eE50cXBYSjZYRVNlSzJCcEI3S2JCekZCUVNt?=
 =?utf-8?B?VHl2YzZnUk5CTzVWbldHc1l2SHlpbGZWclZHZXZrVWsvNG1NYytBZG5qbklj?=
 =?utf-8?B?dW9qOW84SWgxeEk2WWxXMi9LWlplLzk5bUo1QWtwclNmdTk5NmpXdXBaS3RZ?=
 =?utf-8?B?WTJjamF0SVZnYXZCOTRQc1h5dWdRSS9yc0IrTXZiNTRabXBUby9EZTlNcjBI?=
 =?utf-8?B?TzhSWVp0bFQvZ2VLeEtNYmVRcVY3Q1JLTUhQUjJkRFA2dHRXNGZsRStNdm1a?=
 =?utf-8?B?dzM4dkFTcFhNR05NellJamZXZ1E3Wk1JT3Z6N1JoRlFVaFpGSVFQUStTV1RQ?=
 =?utf-8?B?YVhhSnl0Vm04dHlBQlUzdVlFODV4STNiTlRybUJ5bXVxRlFWdXZVdTMxOUJy?=
 =?utf-8?B?dEt4SkdLZUN1Tndka2xERDFycjJEajVzTWZ5V2RYOWxHazF1OUc3ZHoxaFd4?=
 =?utf-8?B?Yi85a09TNFpTQUhxU0F1UVpZVm1rMHVCdi9rZWFROWxZQlBuaVlPWW15RGU0?=
 =?utf-8?B?R3R4ZjRDMVlxSEtweVhXY1pVeHp0ZTlMbE0xaXJIYmNhL3E3RU1zWWNOMExo?=
 =?utf-8?B?dDNBQ1BWL3hxeHU2b3ZxMkhLQWo0WWFrR2lrNVlsYkNlVWFMQUJ1V1pMWnRh?=
 =?utf-8?B?QW9RWExDVlR5Q1JNeUowTVdtUFA3R1dmRmJWZ3N4SlQrOXlQWmEyNVpyMkNE?=
 =?utf-8?B?dnhtRzQ1eUJNd2k1YjhkOUhDRVN4Qm9pYlVlZzY0eGNrUlVia1RXZXdZT0Ru?=
 =?utf-8?B?QUFiNWxmWmR4aXpDZEY2bTNVZlNyalpoRVhJOGRBMGV5ZFlJdEpBZVo3NU02?=
 =?utf-8?B?WUEzWjIxUFZlVVc5ZFlTMVpvK1lrWDk1NEdDdnhUM05qWEppdDViLzFLTy8r?=
 =?utf-8?B?aURJQ2xoVUVyV2w5VFBHRngvZ1Q0aitWNXhjNGpNZVR5WHBVWE5PZE5YaHdH?=
 =?utf-8?B?b29oQU9DaXE1TDFKbHROT1BlbmFuRXlmY1ZaM1BhNUk4bGhCNXdCVmlLTDNa?=
 =?utf-8?B?dUgzN0IrdXJ4UUR2bTZERWpaenpFdlBsZWx1VlBwNWxGR21OMi9CSE5iTG5r?=
 =?utf-8?B?UEg1N2VCNmJ5Y1c4Z3htUDJwMXMxN2Z3U0dpSXhQRmFNcHhkbFN4enphL2pY?=
 =?utf-8?B?K3J2SzJFdXBZQWZwVGFHK3ZnbHpGSmNCOWFxbWRoR2h6blZkY1V0OW5VYU1V?=
 =?utf-8?B?RFI4czQva1hpK3lqRWJhM2tpdWhMeDUwOXdCMGR4dktseVJqOVVSR0E2SkNL?=
 =?utf-8?B?NWs0Y2YvZytobzVVNXhXcU9nQ2RqUy9ERkY1aXNkKzU0YkNLaXl4bTBWMUp1?=
 =?utf-8?B?eUpVMStTelVjcEFvUjBGb1VWam9pRiszNnVpMzNiam40eFJySWR2d00wdklk?=
 =?utf-8?B?cFRVVklEYXdJMVZEL1Jnbk91ZXlTNkFWNzFBMVB5amYva1BicVlMNmRxWjVr?=
 =?utf-8?B?YzFKYjh6cUNhc3JMblozd256YXJOSDJkTVpueVByVCs1R1hyRnlvdTFnSnU2?=
 =?utf-8?Q?doU3P2?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SnluRWNuNk91U2hhUEkwRW85bVFPekhLUmw0Nm1xVklJMnM4dEI3Wk5pVnBI?=
 =?utf-8?B?NE5MN0xzYXAyK2tjR3Z3MGV6TmJnRlNtWTV2MzR4Vm9zSTB1RHVRYlBpcTVW?=
 =?utf-8?B?YjQxSUlPUE5tQzMzaysrdDlWOTJSUXVBalh3WGR4aHdpZTJiRnpIOXYxTWJJ?=
 =?utf-8?B?dTl6K3B6MmwrWTZJTjJTNzRZb1hEVnVZZ0NoUWh0azFkVzVUWlNFalNhYWJZ?=
 =?utf-8?B?S3ZHb3NzWm1tRDR2aFJXQm1zQVVQZG5kWUhweENNVWVXVWJmbjliaG5OZXZ4?=
 =?utf-8?B?TjRHOGY3R1hSd0tYUEp3RlVTTkZqWHgyV3AreUROZnIwZ3JKaVZnSlcvcEk0?=
 =?utf-8?B?SUJ4bnoxeStTU2t0WWpZbU91N3ovMXFEMGY1SnlLS3BkN3oyM3JmNGF3QXZr?=
 =?utf-8?B?dmk1ejV6dG56MTBEN2J6b2IzZ2xXM0didFI2S0VBa1NFaEtsSDV0ck9xUkJD?=
 =?utf-8?B?N1k1OEl1M3M2RzNjbTduTmpOOUh5M3VJOS9KQ2QyVFh4cHlsWGdDSTZoWUl1?=
 =?utf-8?B?NTFyUWlNNW1QVENtVEpzK3pMUHlzbW9mSGJGeVJVL2N0SjBJQ0d6SjQvSkFY?=
 =?utf-8?B?VDhhRDduWWZPLytPNGE4Ky9xOXJsWTRQYnFWRkpSdEVIRUlpK0xldEZPcDNK?=
 =?utf-8?B?T0ZJV3FIMWJsSmt0aTNySmFpUDBGeWJaeTN5Ykdid0swcWIwelpuZmxQWTZI?=
 =?utf-8?B?c3E0cWEyWGI1aXhRZjM4Rnl4Z2JBN3BEVEd1ejhjVmhRbXBXNTlhb0VERWFx?=
 =?utf-8?B?bDNFcG0yTWI5Y1ZvdEpaT3kzS0poWVZDUkxmSmltTFBUL1YxM05Sd05NU0Fp?=
 =?utf-8?B?NWR2NXQ1endOL0t2S09zdVFPUExlUDlodTVlUXhwdkZ1bkplMG1TM1pablIx?=
 =?utf-8?B?eXJtRC8rd0Y2YzVMVnM4YTFaYnJvejZ0SmpJczR1TEVPRzAzMHBYM0xmK0ZV?=
 =?utf-8?B?biszaFB5RzVRUWxBNGYxSlpIc2tEcGtieU9hYkxiUW96OFRIZmFFQ1NOLy9V?=
 =?utf-8?B?WjcrN2U3NHlpSysyVWEzN2FXZ1ZHd0UzeFdwUmxZMXVlZi93VTcyeGR4THRT?=
 =?utf-8?B?eS9RMXdlNTVoNGp6eDhGNjhneW1sWjhYT2JpSDllZG5FeFZKaVowUDUwdkV3?=
 =?utf-8?B?Mm90bDRnOFRPYWh1cFhjM1NTM2hreHVYamtReHZTRnB2WG5sQU1yUVlWMVdi?=
 =?utf-8?B?UCtrUDIzdUN6R05LSGhRNTZRNnpGZGo1V3o0OTlsWXFiSUFBN280STlodUlR?=
 =?utf-8?B?RHFVZ1RPSVNDSm92N2F3VWZ1OEZoUVN4bE55dkhCQm93Wnk2Wm1kT1h6bk4z?=
 =?utf-8?B?UEVYZE1nc2RCa2RObmt6bGZFaEF1Rjc4OVdvV2RKSGlxd1JIc3ZjM0I0N3kx?=
 =?utf-8?B?UmZ5Z3F6bFhmZDU1M01wczVtMCttRzRNK0t6Qkova1B2UTNhNnQyN253SFQ4?=
 =?utf-8?B?MzZmdTJkVHNJSWZWdjJ6SzkveWdOTXpOVWFkeVpBaEtHK2pDb3F4T0pqTXpX?=
 =?utf-8?B?THBXSjJ0VFM2QVMyd09QNlFRUXl5eUR1em9KSGJCY0twdzBDc0pOTDBaL0FI?=
 =?utf-8?B?YmtEeDlRcjhUbmcwMzdWWXE1V0tHaFJyMzZJOUliYWx1SVJEQVBHLzh5aXRL?=
 =?utf-8?B?UGM2TzBINzhGbTl2YkM3RHJNMFA3T3JnSzlmMytIdkZxTWt4NCtHNmpkWFIx?=
 =?utf-8?B?MTVpSzJnVzFRWndLT0lSWFFzY0lEcjNqcjU1aFkzbGJ6UFp5bDRhQTl2R084?=
 =?utf-8?B?OThFTUpTb3ZlNzJnS0t6aE5zYjlxczRmQWFQMnhybkk4U2JJNUwxN1NjM05J?=
 =?utf-8?B?UExCRk5abVcvTlF4dHNrSXFlRGlMUlhFY28rQWYxL3ZUNkliRWt6cVNyeGor?=
 =?utf-8?B?ZUNaUUZQVFZaTkJVL283akRNb0Q5TW5YZGJRTGR6TDdRSUFrcnMzdGV4bC85?=
 =?utf-8?B?bSs2SWFldTNxTG5aYnhMM2tSekwvMTBDa3V1U1loMHlURHVkci9EZGF1a1RD?=
 =?utf-8?B?MDcwREpaRy9NaEczaXdJUk82UnlSR2hsN3dTbElHTzV0L3c0NXl1Z2p0alJT?=
 =?utf-8?B?b3VGTmJLSVpaN1prWXZBOUEwMU0rYktXaG5WOHphZ3cvc2VqQ2JTVXN6RVRq?=
 =?utf-8?B?NHlmRW90M0dtc2NHWUlVNHd3ek01MVJDNlZGdXI0T3VYQVVVRnltSmwzNTM4?=
 =?utf-8?B?dWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54e333f-bef4-4a97-f287-08de2e94d84d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2025 15:43:15.2135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yiU0JlPI4uq3tvn4ygmJJL4lu2P7usqsevjGBhPhMrDdKkjMFmSIcNHOIV82OfpIBHlm8j6dEU7I4t4GLhUYW25vepXNNDQXGcSIx/odZog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10773

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogMjggTm92ZW1iZXIgMjAyNSAxMzo0MQ0KPiBTdWJqZWN0OiBSZTogW1BB
VENIIDE5LzE5XSBhcm02NDogZHRzOiByZW5lc2FzOiByZW5lc2FzLXNtYXJjMjogRW5hYmxlIHJz
Y2l7Miw0LDl9IG5vZGVzDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gTW9uLCAyNyBPY3QgMjAy
NSBhdCAxNjo0NywgQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToN
Cj4gPiBFbmFibGUgZGV2aWNlIHJzY2l7Miw0LDl9IG5vZGVzIGZvciB0aGUgUlogU01BUkMgQ2Fy
cmllci1JSSBCb2FyZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCENCj4gDQo+
ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5YTA5ZzA0N2U1Ny1zbWFyYy5k
dHMNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjlhMDlnMDQ3ZTU3LXNt
YXJjLmR0cw0KPiA+IEBAIC0zOCw2ICszOCw5IEBAIC8gew0KPiA+DQo+ID4gICAgICAgICBhbGlh
c2VzIHsNCj4gPiAgICAgICAgICAgICAgICAgaTJjMCA9ICZpMmMwOw0KPiA+ICsgICAgICAgICAg
ICAgICBzZXJpYWwwID0gJnJzY2k0Ow0KPiA+ICsgICAgICAgICAgICAgICBzZXJpYWwxID0gJnJz
Y2k5Ow0KPiA+ICsgICAgICAgICAgICAgICBzZXJpYWwyID0gJnJzY2kyOw0KPiA+ICAgICAgICAg
ICAgICAgICBzZXJpYWwzID0gJnNjaWYwOw0KPiA+ICAgICAgICAgICAgICAgICBtbWMxID0gJnNk
aGkxOw0KPiA+ICAgICAgICAgfTsNCj4gPiBAQCAtMTQxLDYgKzE0NCwyNiBAQCBubWlfcGluczog
bm1pIHsNCj4gPiAgICAgICAgICAgICAgICAgaW5wdXQtc2NobWl0dC1lbmFibGU7DQo+ID4gICAg
ICAgICB9Ow0KPiA+DQo+ID4gKyAgICAgICByc2NpMl9waW5zOiByc2NpMiB7DQo+ID4gKyAgICAg
ICAgICAgICAgIHBpbm11eCA9IDxSWkczRV9QT1JUX1BJTk1VWCgxLCAxLCAxKT4sIC8qIFNFUjJf
VFggKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNFX1BPUlRfUElOTVVYKDEs
IDAsIDEpPiwgLyogU0VSMl9SWCAqLw0KPiANCj4gV2h5IG5vdCBvcmRlciBieSBwb3J0IG51bWJl
cj8NCg0KSXQgaXMgbWlzdGFrZSwgd2lsbCBmaXggaXQuDQoNCj4gDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWCgxLCAyLCA2KT4sIC8qIFNFUjJfQ1RTIyAq
Lw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICA8UlpHM0VfUE9SVF9QSU5NVVgoMSwgMywg
MSk+OyAvKiBTRVIyX1JUUyMgKi8NCj4gDQo+IFRoZXNlIGNvbW1lbnRzIHJlZmxlY3QgdGhlIGJv
YXJkIHNpZ25hbHM/ICBVc3VhbGx5IHdlIHB1dCB0aGUgcGluIGZ1bmN0aW9ucyAoIlRYRDIiLCAi
UlhEMiIsICJDVFMyTiIsDQo+ICJSVFMyTiIpIGluIHRoZSBjb21tZW50cy4NCg0KT0suDQoNCj4g
DQo+ID4gKyAgICAgICAgICAgICAgIGJpYXMtcHVsbC11cDsNCj4gPiArICAgICAgIH07DQo+ID4g
Kw0KPiA+ICsgICAgICAgcnNjaTRfcGluczogcnNjaTQgew0KPiA+ICsgICAgICAgICAgICAgICBw
aW5tdXggPSA8UlpHM0VfUE9SVF9QSU5NVVgoNywgNywgNSk+LCAvKiBTRVIwX1RYICovDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgIDxSWkczRV9QT1JUX1BJTk1VWCg3LCA2LCA1KT47IC8q
IFNFUjBfUlggKi8NCj4gDQo+IFdoeSBub3Qgb3JkZXIgYnkgcG9ydCBudW1iZXI/DQo+IA0KPiBQ
aW4gZnVuY3Rpb25zIGFyZSAiVFhENCIgYW5kICJSWEQ0Ii4NCj4gDQoNCk9LLg0KDQo+IENUUzRO
IGFuZCBSVFM0TiBzZWVtIHRvIGJlIHdpcmVkLCB0b28/DQoNCk9LLCBXaWxsIGFkZC4NCg0KPiAN
Cj4gPiArICAgICAgICAgICAgICAgYmlhcy1wdWxsLXVwOw0KPiA+ICsgICAgICAgfTsNCj4gPiAr
DQo+ID4gKyAgICAgICByc2NpOV9waW5zOiByc2NpOSB7DQo+ID4gKyAgICAgICAgICAgICAgIHBp
bm11eCA9IDxSWkczRV9QT1JUX1BJTk1VWCg4LCAzLCA1KT4sIC8qIFNFUjFfVFggKi8NCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgPFJaRzNFX1BPUlRfUElOTVVYKDgsIDIsIDUpPjsgLyog
U0VSMV9SWCAqLw0KPiANCj4gV2h5IG5vdCBvcmRlciBieSBwb3J0IG51bWJlcj8NCj4gDQo+IFBp
biBmdW5jdGlvbnMgYXJlICJUWEQ5IiBhbmQgIlJYRDkiLg0KDQpPSywgd2lsbCBmaXggdGhpcy4N
Cg0KPiANCj4gPiArICAgICAgICAgICAgICAgYmlhcy1wdWxsLXVwOw0KPiA+ICsgICAgICAgfTsN
Cj4gPiArDQo+ID4gICAgICAgICBzY2lmX3BpbnM6IHNjaWYgew0KPiA+ICAgICAgICAgICAgICAg
ICBwaW5zID0gIlNDSUZfVFhEIiwgIlNDSUZfUlhEIjsNCj4gPiAgICAgICAgICAgICAgICAgcmVu
ZXNhcyxvdXRwdXQtaW1wZWRhbmNlID0gPDE+OyBAQCAtMTcyLDYgKzE5NSwyMyBAQA0KPiA+IHNk
MS1kYXRhIHsNCj4gPiAgICAgICAgIH07DQo+ID4gIH07DQo+ID4NCj4gPiArJnJzY2kyIHsNCj4g
PiArICAgICAgIHBpbmN0cmwtMCA9IDwmcnNjaTJfcGlucz47DQo+ID4gKyAgICAgICBwaW5jdHJs
LW5hbWVzID0gImRlZmF1bHQiOw0KPiA+ICsNCj4gPiArICAgICAgIHVhcnQtaGFzLXJ0c2N0czsN
Cj4gPiArfTsNCj4gDQo+IFNob3VsZG4ndCB0aGlzIGJlIHdyYXBwZWQgaW5zaWRlIGFuICNpZmRl
ZiBjb250cm9sbGVkIGJ5IG5ldyBkZWZpbmVzIFNXX1NFUjJfRU4gYW5kIFNXX1NFUjBfUE1PRD8N
Cg0KT0ssIFdpbGwgYWRkIHRoaXMgbWFjcm9zLg0KDQpTV19TRVIyX0VOIGJ5IGRlZmF1bHQgT04N
ClNXX1NFUjBfUE1PRCBieSBkZWZhdWx0IE9OLg0KDQo+IA0KPiA+ICsNCj4gPiArJnJzY2k0IHsN
Cj4gPiArICAgICAgIHBpbmN0cmwtMCA9IDwmcnNjaTRfcGlucz47DQo+ID4gKyAgICAgICBwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiANCj4gdWFydC1oYXMtcnRzY3RzPw0KDQpPSywgV2ls
bCBhZGQuDQoNCj4gDQo+ID4gK307DQo+IA0KPiBTaG91bGRuJ3QgdGhpcyBiZSB3cmFwcGVkIGlu
c2lkZSBhbiAjaWZkZWYgY29udHJvbGxlZCBieSBTV19MQ0RfRU4/DQoNClllcy4gV2UgY2Fubm90
IHVzZSB0aGlzIHNpZ25hbCBpZiBEUEkgdHVybmVkIG9uLg0KDQo+IFRoZSBwb3J0IHNlZW1zIHRv
IGJlIGF2YWlsYWJsZSBpcnJlc3BlY3RpdmUgb2YgdGhlIHNldHRpbmcgb2YgU1dfU0VSMF9QTU9E
LCB3aGljaCBtZXJlbHkgY29udHJvbHMNCj4gcm91dGluZyB0byBlaXRoZXIgdGhlIFBNT0Qgb3Ig
dGhlDQo+IE0uMiBjb25uZWN0b3IuDQoNCkkgYWdyZWUsIFNXX09QVF9NVVguNCB3aWxsIGJlIGFs
d2F5cyBvbiBmb3IgdGhhdA0KKFNNQVJDIFNFUjAgc2lnbmFscyBjb25uZWN0IHRvIFBNT0QsIFNN
QVJDIFNFUjIgc2lnbmFscyBjb25uZWN0IHRvIE0uMiBLZXktRSkNCg0KPiANCj4gPiArDQo+ID4g
KyZyc2NpOSB7DQo+ID4gKyAgICAgICBwaW5jdHJsLTAgPSA8JnJzY2k5X3BpbnM+Ow0KPiA+ICsg
ICAgICAgcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsNCj4gPiArfTsNCj4gPiArDQo+ID4gICZz
Y2lmMCB7DQo+ID4gICAgICAgICBwaW5jdHJsLTAgPSA8JnNjaWZfcGlucz47DQo+ID4gICAgICAg
ICBwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiOw0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0
L2Jvb3QvZHRzL3JlbmVzYXMvcmVuZXNhcy1zbWFyYzIuZHRzaQ0KPiA+IGIvYXJjaC9hcm02NC9i
b290L2R0cy9yZW5lc2FzL3JlbmVzYXMtc21hcmMyLmR0c2kNCj4gPiBpbmRleCBhMjk2YzJjMWM3
YWIuLjMwNTIxNWNkYWViMyAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcmVuZXNhcy1zbWFyYzIuZHRzaQ0KPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cmVuZXNhcy9yZW5lc2FzLXNtYXJjMi5kdHNpDQo+ID4gQEAgLTg5LDYgKzg5LDE4IEBAICZpMmMw
IHsNCj4gPiAgICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDw0MDAwMDA+Ow0KPiA+ICB9Ow0KPiA+
DQo+ID4gKyZyc2NpMiB7DQo+ID4gKyAgICAgICBzdGF0dXMgPSAib2theSI7DQo+ID4gK307DQo+
ID4gKw0KPiA+ICsmcnNjaTQgew0KPiA+ICsgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KPiA+ICt9
Ow0KPiA+ICsNCj4gPiArJnJzY2k5IHsNCj4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCj4g
PiArfTsNCj4gDQo+IEdpdmVuICJbUEFUQ0ggMTgvMTldIGFybTY0OiBkdHM6IHJlbmVzYXM6IHJl
bmVzYXMtc21hcmMyOiBNb3ZlIGFsaWFzZXMgdG8gYm9hcmQgRFRTIiBiZWNhdXNlIFJaL0czUw0K
PiBkb2VzIG5vdCBoYXZlIFJTQ0kgaW50ZXJmYWNlcywgd2h5IGFyZSB0aGVzZSBhZGRlZCBoZXJl
IGluc3RlYWQgb2YgdG8gcjlhMDlnMDQ3ZTU3LXNtYXJjLmR0cz8NCg0KQWdyZWVkLg0KDQoNCkNo
ZWVycywNCkJpanUNCg==

