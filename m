Return-Path: <linux-renesas-soc+bounces-27323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDL6IWRqc2l/vgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27323-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:32:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D84E375D8B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B1EF3008D75
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 12:32:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246761FF5F9;
	Fri, 23 Jan 2026 12:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ti7/ZBzB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEB08834;
	Fri, 23 Jan 2026 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171553; cv=fail; b=HeFPIUyVYmLMQAV9+ny8lCGJ1TiSxbzOC91wqscVRH+RRxV5GZHxZTjw716pQVp3SrJ2WOXbUJ8JOZORPCOISP+hVqRIrOys3mx2pPVldHLV/XcnfAUEBmndfQHEv4a2LlxJA2t4ydrtdy0Ep7Es+c6ZUuRXJVKQP8tphCkUcVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171553; c=relaxed/simple;
	bh=CRqQdiNp2luXByx0DRJl5mXmng61EsgFDQ/FbCvKB3M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GYKjz2Rmh52fB6SW8aBqdvqS8fv8tUdArIEPj1ZKfi4w0m29iZ0a600kx0pJS4tXkR3DJl+DfVOnPx4Zh0bbsk4X5BGwJL8IWRRGq1PGCX9g6WqIt746wseNcoGt2yHvCT2CPi6MtwDQFGS5X2HIhFTGPZeZ43p6mnVChl+VGFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ti7/ZBzB; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCAkpLJQfj2PzTQVFgS1dv8apwH5N5RaJ56uYoUQ5Y3dmFiIH9NkVXdr40HPBprTc409/9MiNrLsgVzcAeJPs1e9ZuWneZfElAhthykNfLnD16+/7xboC0tTfknEfYhtjPXpL20aEgCtuI+fXJ+VLUNJh7vjUB1Uz+FHaRhgPInsMPBxr1sT6c4JqoeO3tsZx2NLWNckv5n+1QLzmHvAdTQQ7Rpi3z1OqAGVyrCLFzC87MyHwKf6n253Jrf7T/PLVaGjuABDBeQE/mf72Q+wazbRwfXXcr528OAZTJXGUNvBPH0HTyLtL1UT9FaNk18/1zMen3rTEsbPSn4jE2iXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CRqQdiNp2luXByx0DRJl5mXmng61EsgFDQ/FbCvKB3M=;
 b=cKIqyCYXDNxrpgcwwJu300dshEQnhxNObCo+8mnh+0qwYzGNIzgtuy44HA8hDC91ucX4BVuiuqPlP75d8C8SHcjEWCETRZB8fgn3dMP5Ploewv3aHZ/SwC3Y6UnKDx58mSbnvYIn6cFP9AjqcfYAc7q4HhTJqPymI9lm8I3xydPJWWS/GxFI/0+mSeiXLd1oqzWP+YvXqYKGw4A3MAaHb/aP0aJmfmKQoqHMzaDmd4f4o2C7eeLDr0zhK+4hX63jsS0IuoL92U8F5SmInPmul+F9/2u5MVSmSFyJoygdjRoB79IP2XL64UcdgcMa13BlQfz1zZpt2Usg7YcCXg9pNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRqQdiNp2luXByx0DRJl5mXmng61EsgFDQ/FbCvKB3M=;
 b=Ti7/ZBzBqL3RVxWwEuIaOwpFoJZvZkMoOM64s+9ibJOzpxCPHAbmOftyt7DvHhOve8LpaGe1JOaorjC888mBviT7PsEhR+LlTL8a0d+dsfFnotXvCSa7oYEdcX2twLC9OXzzMhSCkZ6x3Iqpf/bl/jLbFOLh4/RCSqTQFCpgEKc=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSCPR01MB14368.jpnprd01.prod.outlook.com (2603:1096:604:3a4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 12:32:25 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::aa7e:1460:f303:3fd8%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 12:32:25 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: geert <geert@linux-m68k.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"bhelgaas@google.com" <bhelgaas@google.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Biju Das
	<biju.das.jz@bp.renesas.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for init_off
 clocks
Thread-Topic: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for init_off
 clocks
Thread-Index:
 AQHchWt8/8Xcc6HpdkiYg0CMgbNe6bVa6hMAgACLVYCAAvSbMIAAA6yAgAE7e9CAAAXFgIAAAHNw
Date: Fri, 23 Jan 2026 12:32:24 +0000
Message-ID:
 <TY6PR01MB17377A22D83B7846EA7A6889FFF94A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-4-john.madieu.xa@bp.renesas.com>
 <CAMuHMdXAAUe_0kboQ9C0AMPn5re-1kCagecp1fMCGramDpXGRA@mail.gmail.com>
 <TY6PR01MB17377AE5807504FFB6594471AFF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <TY6PR01MB1737738E302D0BA716AAA2650FF97A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <CAMuHMdXk6A2-isnLQCgrjjWRX=pYKbUvVz-nfDwy72i1qo1-rA@mail.gmail.com>
 <TY6PR01MB173770856BD4044A79150F6E8FF94A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <CA+V-a8uNpNPCyePQrRDQxaGfN2gZE3-2VvCMs3FOqFaU3mKjLw@mail.gmail.com>
In-Reply-To:
 <CA+V-a8uNpNPCyePQrRDQxaGfN2gZE3-2VvCMs3FOqFaU3mKjLw@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OSCPR01MB14368:EE_
x-ms-office365-filtering-correlation-id: 6623debe-7a90-436a-c3d8-08de5a7b7697
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?d1J4djRQaXoyTE1NcXIvam9RcnhHeFRwYWRqZG1uVi9NWjRmVU5vcVgwbWtk?=
 =?utf-8?B?b3NaRkdMd2t3dnhpUlIvT2ZvOU14c25UTUJHVHk2Q3MyblM4L3A5MWJEM1Rq?=
 =?utf-8?B?SjNNVzJZR3c5ZHhXNnVqWWN6dXFEVTJqc3NoTUpoWjFNeWswbVlSRldFNktX?=
 =?utf-8?B?alJhQjJvMmFHR1VwdUhCQlVPcCtDR1UwQ3VTamlYMGtCM2ZIby85OEhaV2Vw?=
 =?utf-8?B?VkNwS3NVekZVUEdJZmwvM1dCbU5LQmZCeFlIUDhZdS9TVERSdWFtK1BQdW40?=
 =?utf-8?B?cjVMNmdRSDRXT0ZEbVRCL1RoOU5SQmdwWUFkQmg2TTFkN3I1d3ZwOHNpYnVJ?=
 =?utf-8?B?cnlFdEZjaDd0NzNxZjVEZWFVUGZKNFlwK1A4Vm4wb0UySFBLcFRtWExia1gr?=
 =?utf-8?B?NnFWRmNHZnQxRGRxQzEramY4aDdzT3FPL0dKQjdhVERYZlg4bkFzOGU1aFU4?=
 =?utf-8?B?Y21IUTRyeW00V1FFU0JwR0VSVktCZjllS0FjK1JkS2ltL21keW5VcW9jb3Jt?=
 =?utf-8?B?Q2ltVGhrdWVlMDJsSHc4Z0JVWFJzeTVrVlJxUUcrMXY1czVJQy9jMVBsbVVq?=
 =?utf-8?B?QkpPRHNLbE1GNGhPUnkvbzlyRmxFQUNybFBNTWpQRTR1Y1pwV296U0RqK1lR?=
 =?utf-8?B?UDdHblJESlBnVE94bnBiSjdTVDVZb3RZSUhoejBtelV5cGZrenVlaWNpcUY1?=
 =?utf-8?B?TUMzYVIvQXJCRjY2WDVlRVJXUHRkMVduN0ZGRHdsZXRKREF0WFk2WkROblZW?=
 =?utf-8?B?R2ZDU1RNbC9mbThUMGI0RTE2aEl5S3FVbUNiRWEyV2tERktaSTFZQS85N1h1?=
 =?utf-8?B?enR5Z1RNbGNsSkltc1lYb3JwOW9QVmxDU0krNE5Hb2xVRDJJRXFxaG5qZS9Z?=
 =?utf-8?B?WmZpckNnU0lSaEpHYjU3bldpa013WWdDYlZxNGRFQnVjOEZVODY4UHVmVE9U?=
 =?utf-8?B?NEJiUlAxdW5zVGdSTGVieXRpeThzUCtWUHp6QnlzR05vaHZsbW5GZHBmTUIw?=
 =?utf-8?B?TVBqbE04c1RWZGRvOUwyUzcwdm1OZWRydTE1eTMyRUpxWjJ6NXVpSlY5dlhE?=
 =?utf-8?B?eHd5SERpN1h4QTVPYTZEMy9BMjhPV3pqbThWbXFLUHd0c082UDNrYXNCVHVu?=
 =?utf-8?B?MWFsR2M2WUc5WEJIMHN5bndISjAvNkxoY3pBL2VXNWRYVnJrY2NycUZSOVFN?=
 =?utf-8?B?WnREcU5tdEYvSTRSL2xlQkEzS1hQdHVub1piUk80bUE3NWMrTWdpdHdWVVBu?=
 =?utf-8?B?RlhRUHpOKzV2TTZOYTZRdGdvKy9jQTFtV2NJM1ZMSlF4cmlaQldRM3FjQVN2?=
 =?utf-8?B?RmE1RnlKaTNxMTVvKyt0enprYVo4czlKa2EzWGpXU1pUcENmcEZEbWQ1Wktr?=
 =?utf-8?B?WmtUL1BMSENBVGZtb0JlOTBSZ1QydGlrODRYVHExajFNR3BBL2Y3dDVYWWlD?=
 =?utf-8?B?R3R1aHM3aTFWa3BGUzhVMmxtZEFqcWQzL283enhwczJkTGFGR3p3ZUtxQXAv?=
 =?utf-8?B?c3B6a2UrbmpVN0lLSlcvTmVaY2JFd0M4d001VEgwdGc0Ym9hTDJZdVQ3V09S?=
 =?utf-8?B?UHQ0NElQUHJudGpVTC9NUzUyOStIeEFENE9aZHh2Z2oyTGh0YktxR3h6ZDdU?=
 =?utf-8?B?MUtKUVBKY3pwalN0NUlFazNFMnFOTGZGcVhucHlNSlBoaWlhcEdpYkFlRStl?=
 =?utf-8?B?WGoyblorQ2RmN1I5d21NeEQ4eDVDL2krVENLVGoxNTJoa241ZlliejE3aE1z?=
 =?utf-8?B?dXYxdnl4ck5oVzdYbHQrdEw4elJiUUdCcm5kU1ZKUkU3ZVlQcGg4RHVjcGZX?=
 =?utf-8?B?Y0RjNGxpdG8zSituSHpDNHc4MVpnMnR0L1VoWE1ka25mc3hOdVMrbW51T2Q2?=
 =?utf-8?B?bTQ2SGdsSytGOGd5TXNLM055bzNhOFFHSXhsRjdXZEhUL1ZxOGcvNkZVb3hK?=
 =?utf-8?B?UitCMjNiam1uR2lUZ0dVYlY2c3E4Y3hZVlllaVlkdER1d1B3THZlWGF4anBZ?=
 =?utf-8?B?eUdQUUphS1Ira0xmTW9QUVV1dmdpYk1NNnlJL056YklnTERpUWhQUDdGQ3BK?=
 =?utf-8?B?TGtwWFdkTmxOWUdQdXg3cXp5K3JFNlROTmFCTnNweENoZ0t3UUllczVWTmdP?=
 =?utf-8?B?QndoS29WV0FZUjd2Q3lhRndZb3F1clJnUWRLbG43b1YrMVVJeWZ2aTJXYzJw?=
 =?utf-8?Q?tWdGMuG0DkBT1u3lkghdEeQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Tml1UUdCK3l0SUs5R0VwV0lKNnJwWW8yS2hiVDJ4RC9hSkw5L1NLQXVCMCta?=
 =?utf-8?B?bXFOak9FdDBMU3FsWkU0ZTFJei9CSGp4WTU2SEJsNDVKdjJ6djBmc2pDU3NC?=
 =?utf-8?B?NmEzd2paYS9BY09KL0NnQUJ1YnNHeHg4b01wRlAyS2lTSzd6YVVkeE85ME5u?=
 =?utf-8?B?dGFvbjV2U3BCRHRPN2tXWThpQ3FkaHh6bG9udkMzKzMrOUZwYXBRMU80Z1hV?=
 =?utf-8?B?OHdQRWpyd0JDcVVMb0V0blNVUG5uVWIzbWdodG5wdkpaZ0MzK3dtT3hMRW5a?=
 =?utf-8?B?ZmJJOHJZMVBveVNFQTZneEF2dmdXblJaemtrZGJPc1ExZE85YWdrN1h1RDJm?=
 =?utf-8?B?ZXllSnpsYkI3M2c1amRBcTJ3dXl3TkZnY2hDT2ZSY2RhUG9xWk9lL0tFdzRt?=
 =?utf-8?B?dGRxdHFBM3JzT3prOG16bjhHUlcwYWVtNlBaV0tlWExNNHJtNlBSOU1IeHo0?=
 =?utf-8?B?TWFPZ3owSjdHR0MzSlhYYjZkdmFudFZTbWpWZHpzT1dIZ3FZc01DOGpBWjdL?=
 =?utf-8?B?ZWJvUUJ4UWQ3UGZMV1QzTWM4VjBscjM2bEt5NkN4R1hOdTVJWFU4S200Qkl3?=
 =?utf-8?B?RWlpU01aVyt3eDhianU3ZVJDZmRSYnNnNTdqdXIvcmovRm81VThXRHhTbGVq?=
 =?utf-8?B?WXpXNmUyVGVkOWNPengydmlVSjcyZEQ4NzJsaUtzYU4reEdrLzR0VjBxelB0?=
 =?utf-8?B?ZUhFaVg4T0JUZU9xTC9xelR4M0gycGhTM0U0VUJyZWlJTjV5dVZSZFlmK3pH?=
 =?utf-8?B?RXpsL2Q0S3pmdkRMYzZ5RDFDVzBkSnBQbHNxVE5WSzJSdHZ2b1hnOVg2UHB2?=
 =?utf-8?B?UEtkSzNVYTZTekxXT0ZFOWdneU1CVFpGR0g0d3hxODNjU21vam9ZaURBRnVo?=
 =?utf-8?B?ajUwUFR5dXJRd014SmxZUDBnbEdWbG42R2Q0cGZldHcvSTdVL0NqRm9xLytS?=
 =?utf-8?B?eVZEd2gxZm5aQ2dBZXB3Q04rRDNpTmJpZjJUQWN2VGM0WEc1NVFVMk5CdEVl?=
 =?utf-8?B?ODR4TmxhbFBSQ1p2d29LNDREV1hVTXpmdlJkUTRMZ2l3OUczeE1mQUlwNVBq?=
 =?utf-8?B?UU9kWGkrVFdOU3FITFVtbnhIZ0V1WDkrd0pzbzFtMEhna3JCUkFyQXFFZTc2?=
 =?utf-8?B?VDNiSXNFbjY0enRES2VqQjFNRnJRTHhuTkxKN2FxQVZKZDhqcVlEaVZiN2RV?=
 =?utf-8?B?UXRYOFRDREZzalg3eUVjcUhDOGJNWDh4aWRNVEFUK0FVV1NMSDRmYXFVSElO?=
 =?utf-8?B?LzhUZFFzdnlGMy9CYitUUGV1UGJWeVl4azZ5elVYU0EwYjl4VW1YVkJoQmVo?=
 =?utf-8?B?dWxIUmZjVTNJeWFkd2Y0RDUxM1pSWUFiTklPQ3lUVTdYUURvZjV4UUNPd3lY?=
 =?utf-8?B?S2djR1lwR3hSbkxoZGxqdG1yVXVVazRqRFMyVDdCbVJwazZuVUVJVjhvbkVN?=
 =?utf-8?B?UDVjc290bWF0YSsyQkJCRGVrY1VDNmUvOFpBS2d0RkZFRUJ1cDZFcFhSdjcx?=
 =?utf-8?B?VkdRRUF2QktlQXlqaEV4WmJ4RFVpdkYyeFRNRGM4SngxUUZ0ZE5mQkFjWVdQ?=
 =?utf-8?B?NHZ5bFlkVSt2L2FYZzB3eWNnRi9CbllPZ2YrQ2dGdTVaNTQwV2RNbmdpSmQ5?=
 =?utf-8?B?VndTUHl2VGh3THZWalhob2xvR1hwNjg0YUhFN3R2Yk1sdXhYOHZqOGVMSDdE?=
 =?utf-8?B?WjdJTkVNaG0xbUpLUmd0S3M5ZjRlVm5oRVViOUNOUlc3Vk16RmovdE12U1py?=
 =?utf-8?B?VFptUmVaRmxOZXc2S24rUDNUdG5ucVF6UkVSVU1RRm5RajZSWktwYzRDNTRF?=
 =?utf-8?B?TkJVS0ZtanpkZ1l1OGVaam1pM0ZqNVpsSktuRmRqM25ybVBLVDF2Qm54ZUxF?=
 =?utf-8?B?N1RkL01KeWFqWjZRVzBjNHFVZVJ2UitXUk5GcWRiZXZXb2syeWpsNW5xYUQ0?=
 =?utf-8?B?N2ZqU2VnSlcvQ2NlVFdXZFozSGR2aENQWVc0UzQvcDZNRkZscHI3aWtpanp5?=
 =?utf-8?B?dzFLS2JVa2hDTjZ0UXBzeWgzNnRMTGdCTmdOVUdKNXZoU2cvaUZlZkdMVUJU?=
 =?utf-8?B?TGFRTHNWM0Y4eWdkQzhKUXg4ZFF5RHdTenZmdEFpaktJU1I4Q1dMOXMxMGMx?=
 =?utf-8?B?SG9jOEt0djhDK0RyVFMvajVKSzdBbGZCVjhPd3RGWC91VHA4QXUwMzFlajlF?=
 =?utf-8?B?akpjUkxRcnpLMnBLdGVTbjlVYTU4T0FYY01DK0ZBdXMyZjFMdlVZbGNZVjRn?=
 =?utf-8?B?eWp5VGMzb0x6T09uKzc2YjNCbzQ5ZE80UmE5N0tORzUvV1RaVlNoNEV2TkFo?=
 =?utf-8?B?Z0hIeGhVc3FrSEthd1VhcUdJSnQ0bVphcGQwZ2xsa0VOMjNMYXI3bmtlcDA4?=
 =?utf-8?Q?7Od5gGnwSe5Ze6Hk=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6623debe-7a90-436a-c3d8-08de5a7b7697
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 12:32:24.9851
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q+Qjfg8/6GEWZjAc3k+qo1si4tp+mV63xiWDm8Y8SzOTKmBZqrubzE1VE2rrMCsRzl73c02GilMED6S2eBVoAb7z67A2q+ijQIQoKC7Zivc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14368
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27323-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-m68k.org,bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:dkim,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: D84E375D8B
X-Rspamd-Action: no action

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogRnJpZGF5
LCBKYW51YXJ5IDIzLCAyMDI2IDEyOjM5IFBNDQo+IFRvOiBKb2huIE1hZGlldSA8am9obi5tYWRp
ZXUueGFAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDMvMTZdIGNsazog
cmVuZXNhczogcnp2MmgtY3BnOiBBZGQgc3VwcG9ydCBmb3INCj4gaW5pdF9vZmYgY2xvY2tzDQo+
IA0KPiBIaSBKb2huLA0KPiANCj4gT24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgMTE6MjnigK9BTSBK
b2huIE1hZGlldQ0KPiA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
DQo+ID4gSGkgR2VlcnQsDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiA+
ID4gU2VudDogVGh1cnNkYXksIEphbnVhcnkgMjIsIDIwMjYgNToyOSBQTQ0KPiA+ID4gVG86IEpv
aG4gTWFkaWV1IDxqb2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMDMvMTZdIGNsazogcmVuZXNhczogcnp2MmgtY3BnOiBBZGQgc3VwcG9ydCBm
b3INCj4gPiA+IGluaXRfb2ZmIGNsb2Nrcw0KPiA+ID4NCj4gPiA+IEhpIEpvaG4sDQo+ID4gPg0K
PiA+ID4gT24gVGh1LCAyMiBKYW4gMjAyNiBhdCAxNzoyMSwgSm9obiBNYWRpZXUNCj4gPiA+IDxq
b2huLm1hZGlldS54YUBicC5yZW5lc2FzLmNvbT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+IEZy
b206IEpvaG4gTWFkaWV1DQo+ID4gPiA+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0QGxpbnV4LW02OGsub3JnPiBPbiBXZWQsIDE0IEphbg0KPiA+ID4gPiA+ID4gMjAyNiBhdCAx
NjozNiwgSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4g
PiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+IFNvbWUgcGVyaXBoZXJhbHMgbWF5IGJlIGxlZnQg
ZW5hYmxlZCBieSB0aGUgYm9vdGxvYWRlciBidXQNCj4gPiA+ID4gPiA+ID4gc2hvdWxkIGJlIGV4
cGxpY2l0bHkgZGlzYWJsZWQgYnkgdGhlIGtlcm5lbCB0byBlbnN1cmUgYQ0KPiA+ID4gPiA+ID4g
PiBrbm93bg0KPiA+ID4gaW5pdGlhbCBzdGF0ZS4NCj4gPiA+ID4gPiA+ID4gVGhpcyBpcyBwYXJ0
aWN1bGFybHkgaW1wb3J0YW50IGZvciBQQ0llIHdoaWNoIHJlcXVpcmVzDQo+ID4gPiA+ID4gPiA+
IHByb3BlciBpbml0aWFsaXphdGlvbiBzZXF1ZW5jaW5nLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gPiBBZGQgbmV3IG1hY3JvcyBERUZfTU9EX0lOSVRfT0ZGKCkgdG8gZGVjbGFyZSBtb2R1
bGUgY2xvY2tzDQo+ID4gPiA+ID4gPiA+IHRoYXQgc2hvdWxkIGJlIHR1cm5lZCBvZmYgZHVyaW5n
IENQRyBwcm9iZSBpZiBmb3VuZCBpbiB0aGUNCj4gPiA+ID4gPiA+ID4gb3Bwb3NpdGUNCj4gPiA+
IHN0YXRlLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb2hu
IE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+ID4gPg0KPiA+
ID4gPiA+ID4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
IExHVE0sIHNvDQo+ID4gPiA+ID4gPiBSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBIb3dldmVy
LCBJIGFtIHN0aWxsIHdvbmRlcmluZyBpZiB0aGVyZSBhcmUgYW55IHBvc3NpYmxlIGJhZA0KPiA+
ID4gPiA+ID4gc2lkZSBlZmZlY3RzIG9mIGRpc2FibGluZyB0aGUgUENJZSBjbG9ja3MsIGUuZy4g
d2hlbiBQQ0llIGlzDQo+ID4gPiA+ID4gPiBpbiB1c2UgKG5ldHdvcmsgY2FyZCwgU0FUQSBjYXJk
LCAuLi4pPw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSdsbCB0ZXN0IGFuZCBsZXQgeW91IGtub3cu
DQo+ID4gPiA+DQo+ID4gPiA+IEkgZmluYWxseSBkaWQgdGhlIHRlc3QsIGRpc2FibGluZyB0aGUg
UENJZSBjbG9ja3Mgd2hpbGUgYSBXaUZpDQo+ID4gPiA+IG1vZHVsZSBjb25uZWN0ZWQgd2FzIHBl
cmZvcm1pbmcgcGluZ3MuIFN5c3RlbSBnb3Qgc3R1Y2ssIHVudXNhYmxlDQo+ID4gPiA+IHVudGls
IG5leHQgcmVib290Lg0KPiA+ID4gPg0KPiA+ID4gPiBXYXMgdGhhdCB0aGUga2luZCBvZiB0ZXN0
IHlvdSB3ZXJlIGV4cGVjdGluZyBvciBkaWQgeW91IGhhdmUgYQ0KPiA+ID4gPiBzcGVjaWZpYyBz
Y2VuYXJpbyB5b3UgY2FuIHNoYXJlLg0KPiA+ID4NCj4gPiA+IE5vdCByZWFsbHkuIEkgd2FzIHRo
aW5raW5nIGFib3V0IGEgc2NlbmFyaW8gd2hlcmUgdGhlIGJvb3Rsb2FkZXINCj4gPiA+IHdvdWxk
IGNvbmZpZ3VyZSBhbmQgdXNlIHRoZSBQQ0llIGRldmljZSwgdGhlbiB0cmFuc2ZlciBjb250cm9s
IHRvDQo+IExpbnV4Lg0KPiA+ID4NCj4gPg0KPiA+IEkgY2FuJ3QgYW5zd2VyIHRvIHRoaXMgZXhh
Y3Qgc2NlbmFyaW8gcmlnaHQgbm93Lg0KPiA+DQo+ID4gVGhlIGlkZWEgb2YgdGhlc2UgaW5pdF9v
ZmYgd2FzIGZyb20gdGhlIFBDSWUgaG9zdCBIVyBtYW51YWwsDQo+ID4gRXhwbGljaXRseSByZXF1
aXJpbmcgdHVuaW5nIHRoZSBjbG9jayBvZmYgYW5kIGFzc2VydGluZyB0aGUgcmVzZXQgYXMNCj4g
PiBwYXJ0IG9mIGl0cyBzdGVwcywgd2hpbGUgdGhpcyBpcyBub3QgdGhlIGNhc2UgZm9yIG90aGVy
IElQcy4NCj4gPg0KPiBDYW4gdGhlIFBDSWUgZHJpdmVyIG5vdCBoYW5kbGUgaXQ/IGllIGluIHRo
ZSBwcm9iZSBleHBsaWNpdGx5IHR1cm4gb2ZmIHRoZQ0KPiBjbG9ja3MgKyBhc3NlcnQgcmVzZXQg
KyBjb250aW51ZSBmdXJ0aGVyIChkbyB5b3Ugc2VlIGFueSBpc3N1ZSB3aGlsZSBkb2luZw0KPiB0
aGlzIGZyb20gdGhlIFBDSWUgZHJpdmVyKT8NCg0KRnJvbSBQQ0llIGRyaXZlciwgaXQncyBhIGJp
dCB1Z2x5LiBGb3IgZXhhbXBsZSwgY2xvY2sgaGFuZGxpbmcgcmVxdWlyZXMNCmNoZWNraW5nIGN1
cnJlbnQgZW5hYmxlbWVudCBzdGF0ZSBhbmQgYWN0IGFjY29yZGluZ2x5LCB3aGljaCB3b3VsZCBy
ZXF1aXJlDQp1c2luZyBjbG9jayBwcm92aWRlciBBUEkuDQoNClJlZ2FyZHMsDQpKb2huDQoNCj4g
DQo+IENoZWVycywNCj4gUHJhYmhha2FyDQo=

