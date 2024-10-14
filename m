Return-Path: <linux-renesas-soc+bounces-9723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E38499C77D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 12:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4AF2B2242A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Oct 2024 10:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A192315DBAB;
	Mon, 14 Oct 2024 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TDFAR4e8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010033.outbound.protection.outlook.com [52.101.229.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437E6158D6A;
	Mon, 14 Oct 2024 10:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728903008; cv=fail; b=V4Wm3Pzxg16ww5EPYG+tVfamuwmmScnNwY/c/Ky0G40GSdgYtKyjlQdSL8buehZES88cVQL6qNjJcAwHfNgcI2nzeuOl0qscihkan+oe+U3YMECenwrSgnspj0u5givO+PpDf1Y7lSbwHQ9dBl4wr/dxTo/ebZZUmefBphkNXTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728903008; c=relaxed/simple;
	bh=TcvbR96wyamcdhmkCb+fc6taem1HOT83KZMBHVbdDuA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eaNQV+DPmWvR/60zQGF4aIfkk9SCDEuiC7uV8BOkFYM0fq50cEKRN491mAMAVOlRaUooFDRn15J/4Wn/0lhrp4OISbZ/SvlMUL4OcSCKti5QEFxawz755BUF5CSCUbFRlg9kliAStPH/6aN7fFtcYdmE26oAJMcw1TdD01DPixo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TDFAR4e8; arc=fail smtp.client-ip=52.101.229.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=as1s71iBWtTehlAN0Ac1BJUXlE4eGNWA+YmBdCP9Z13uEh/6DU56mxz7d1RqSme7B53Xfk1t1Y934UF7ogCg3US/DPY5go5+C6GLnPcX+9VUQtZW44tSay85KeGVQwvPiO9PpV4pwh6yVwYVyycRfRBYPJrAwUwY8FrNzTmXYT74T8M5vMSkKuxSOsKA7qjHcCgERmDoRJWRZISGB1lVwc4+gNZYm4ISqC03OMuLD2QnaETxk80AGZOBiX3VoaINkTHwKjmE2Z4oFvEzKwz/AkuMLoHVQQfGrCXpCk673by1sszAJVWvpTc3TcC+8a8ab8apgQhT2ZITziaW3sffvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcvbR96wyamcdhmkCb+fc6taem1HOT83KZMBHVbdDuA=;
 b=t8KJCZfvFfRVxPydcM7d6pQMykENgrynvDqXcXbpPSL4Vfessxi+tTMcGZ/8Tk8JiNqBB3zA1dmOqhVrtT1bujUhzAeg9Q5I0rEvg/2QhFScVwj/ynOJGz6mdkkVYhWoa6QWjqbQTgjCrp+smB5agZV/dsT0OHJDkzDNkftBne4OdU75JzRWqeqUZ8VGAueJwuyPU29ARSddo98iNJNwjaP4Q7wQ3w1KMcj5vZZj33Dcp2f+/hL/1yPvBxVGQZ36q7diP9gGJ2GXY5AaMkS2fCCZZoL7p2SkEQyFio8Fht9PQC040AakMP6+Phx2wyf/z/rCIlC27vF4B55ISMLZKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcvbR96wyamcdhmkCb+fc6taem1HOT83KZMBHVbdDuA=;
 b=TDFAR4e8qUWEsellvjfSbQohK+7AjIZZBNNOMt5mjXvI0UzzcQiU+t+C6qFUIijIIzEa8jYqpYmbsGHBwPDh27L7HKNCD/m89ikaVru7PMhQdxXjDIl/qj/wPv7emdwBFbDelVrw31zN7Je1QAxCETFBVKw6apoHCcQtvoFvZqA=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB9745.jpnprd01.prod.outlook.com (2603:1096:400:22e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 10:50:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 10:50:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Hien Huynh <hien.huynh.px@renesas.com>
Subject: RE: [PATCH v2] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Thread-Topic: [PATCH v2] clk: renesas: rzg2l: Fix FOUTPOSTDIV clk
Thread-Index: AQHbG/mHKVM27/WiLEqb195bZnu0obKF4ZgAgAAhcpCAAAp3AIAAB8wA
Date: Mon, 14 Oct 2024 10:50:00 +0000
Message-ID:
 <TY3PR01MB11346F50A04BD6C7B5859F5F586442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241011162030.104489-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXM8KCd7Fi9dzQt=YUEu_bdwfZGEkaRS1_PaN7ECNFEGA@mail.gmail.com>
 <TY3PR01MB11346125FF19898F34BD7137F86442@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdUii5NfFWOC-4KNMq5Hz-DXnUtYZNuu+=BDDBgNtTq40Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUii5NfFWOC-4KNMq5Hz-DXnUtYZNuu+=BDDBgNtTq40Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB9745:EE_
x-ms-office365-filtering-correlation-id: a6ea1148-4911-406c-a79f-08dcec3df3dc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OFZTaDNrdGJzdjF4K0tuMkRNaDV0Tk1CdnJTNlZaRHovekZ0NjNpcWx6TTF5?=
 =?utf-8?B?T0JLVkE3bzN4cU1jRXBmc3k5cXpKRFhiL1p1endMYWdEcGFzeVcwcFdwMnAw?=
 =?utf-8?B?clB0MEthSFJ6R0xlRmNScy82anM1Y0xvclQzTjYyaWhMKzYzRjF1Snk5c2d0?=
 =?utf-8?B?bUYreS92cEUwbVdyZ2dObldrRzhUQTZiOXpBaW1WczZGM0hmTW1PV1lKZG5S?=
 =?utf-8?B?a0ZJbllTMzE4MnJDSFR3WVNOZzdkaU5TUWR6SUZzNi9wZEYzSThFaWY1Tjh0?=
 =?utf-8?B?bDRLOWc5bFJYS3pmSjZ1bmg3bjIwaVNYZ3dKUHhaaWxhNUo4RGJBTkVQTnVK?=
 =?utf-8?B?V1RNYy8wL2Yrei9JcUhscDl5dG40WkNyNW9xQkdXZUhNd0JJT05mVGk4QTY3?=
 =?utf-8?B?d05rME43ckt5VDZveERiRU5tditFRGl3SHlDcWc3Yk9aandMeWJkQ2drZDls?=
 =?utf-8?B?cDRJUzh5WjNReG1hWGJBSVVnZCsrZ3prRVdPVDJ2bzNGSEtraERmOHN3RHVC?=
 =?utf-8?B?VUlzYWIzc0x0TlRZZnZqSFRIZDVvaGxSdmxVMnJ6QWE1Tk4vWE12dGtKNlJE?=
 =?utf-8?B?VlRyUXIwQUhlUFBLQ01lanlIMDUvU0w1dUxWUHFMakl2S1Z2bElVdlJLem8v?=
 =?utf-8?B?ZFRNeC9VWFBub1FXbkwxRlJZck1xUGI5TmNHZTZKT0Q4TWpPMnJCdENTYmo3?=
 =?utf-8?B?VFFkNW1EMjlNSmRQMkgybTZXTGJuVDZZRnU4eEJuR0dPRENsbm1OZFpIWCtC?=
 =?utf-8?B?UWpjMU9zOVYySklaelJIcGN0Lzlzdm55RlQrL2p6Qjg3TEFOVElFTTAvRTNL?=
 =?utf-8?B?Zm16dmpkUTZnNTZZck1VTjBxVmFsUVJVVW1rRVZ1Tkp3U015d3pXb2RpQ1E3?=
 =?utf-8?B?T0FpTTVld1hHUzVva3ptcjFHUTY3dnJJZzVtWmQ4VU5Kc3pxQ05uais3RVho?=
 =?utf-8?B?Z1BPRUNaNnYrOXowUVExNUlod2pnRjJRQmVWT3BVVzlDdUQxcCtsT0RNS2h2?=
 =?utf-8?B?RXpOTlAxOHovRE91b05WcmViaklUZXA0bzlxQnN2MktOZmEvdy9wekg0cnNH?=
 =?utf-8?B?bkFVT0tscysrbXlpaXBGS2tNbXJNdUNzMlJYV21qcnVBWkxCTmk3MnRHeWFy?=
 =?utf-8?B?MjhjKzJxakdlNnVxSy9BN2NQTDN4NmF5RW80OFZmM0IraE84N3kzYloxcG5H?=
 =?utf-8?B?bi9uNGFJNUpDTVE4RnBKamVGSjF5ZVNHd2NqN0JIQkU0VDdZUTBYQ1FqQlpF?=
 =?utf-8?B?SU1iYnZUYWZiR3h4ZTZwU1hYZk5JNUdTSzhsMkNkaHh1NFhSM2YzNDUwTHpE?=
 =?utf-8?B?S1ZtVzM4TlRaZDhXZTFlaVZjeGJuY05qNDVqZVN5NEVJaDlUT0Z5L3NuWlU3?=
 =?utf-8?B?OElKb21zOTJOeWcycU5Ba0JwY2VpOFY0NmpQKzFFYkk0U1UzOEFWS2dvZ2NV?=
 =?utf-8?B?Y09zTU9NbmFVajZ6dmJtcmtOVHA4R092ZzduUStyZUpZWVFjQzc0ME1hYnF5?=
 =?utf-8?B?UkJBVlBOQThvMFVIUUlGalljZm9vRUZ5SktWSUtabVRRK1pMTzEyc2JYZWVv?=
 =?utf-8?B?YzhLOXBmWmcyTSt0ZGZkWmRNanEvWWtMaDZOZE1Lc3ZkQklFcXgvaWl6alY1?=
 =?utf-8?B?MWFTd3YwRUxaZlYwSklPK05XdHJZS0xkd0QvTnVodnhpcHgreEpNWmtUTEJm?=
 =?utf-8?B?Um1CbXQxdlY4VjdBUHpIVW8wNnN5dDRsWUxmeDN5T2hHUllxL1o1ajF1Qy93?=
 =?utf-8?Q?gLQs+VMVFnHAm1MmNs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RUh4MnI3Q1RoNC96NHYzK1ViMk9GTms2aFV3Mkl0Skp1NVZRczA3NitkWFp5?=
 =?utf-8?B?WThkVG1Lb3RDMUpBS29kWjhoVFZjWFBjVmRqSDBJaDBhejU1aFhVOHZoenBF?=
 =?utf-8?B?ZzI1UnlHTjY3eHFnbG55UnlMbFRHTVA4ZVlYaWwrbEU2R0o3RVo1a3ZZODZP?=
 =?utf-8?B?bUt4SkMyR1FSOXVvME1RZUNaU2RUMHBsd2dlZm56MTdLcTMwMEVwQkFJbHIv?=
 =?utf-8?B?TTRrdlhwMForbTd6ZzdXV1RCMGtVcG41ZTlrZnNSMXY4bmhFQmhtVEFFTm8x?=
 =?utf-8?B?VXJ2MnFUbmNzdndXRk51OC84dEFCcFpLSmpMdUpYVEVTT3pDVzUzWFBMb0cx?=
 =?utf-8?B?YktzUU1SUXVQcTVzRkZwSWI5UzFzYVA2SkQ1RG44RmJmRGdPMHpXeXZSbTVN?=
 =?utf-8?B?ZEZ2ZlJJQm15VnNHVS9aK3BNVGgyRHhZSEJSNitTWThjRjlWenRyVVErVVcw?=
 =?utf-8?B?Y2lqd2JlTkw5aGVZWE9aMzV0UWlkYjhtdno5MXk3ZGdIZXc4TjlrL08vQzQ3?=
 =?utf-8?B?Ri9pbFJZNEN0dHBZNEVmRDk2QStwM005SktkMmJlZW5SMld1RDU3QXdhRHBS?=
 =?utf-8?B?MEZrYk9nQ29MREJxcE56Z3E5ZEdyelY2UmJEWHFRa3hMUkVSV1pOMUxzWi9m?=
 =?utf-8?B?WWFrb1RKakJrQW1lOVh6R3A4S0gvRjhmMjdtWUFLRjI3ZFF3ZDVJanU1R1dF?=
 =?utf-8?B?aHlRaENwdlFYRTY5OUROZU5LdUR5L0lZWmFxUVJmdGx2OC94OWpaSTZoRS9N?=
 =?utf-8?B?N09jcllVcHcrRE4zM0I2Q3kyVUVCVG1xUHdwd2R6bjR1WGk4SHpGcDdlV3Va?=
 =?utf-8?B?bTN4K1pVM3ZhNFdPYUxMcWFDdXowQlF4dWJqWW11M1p1NE1oWWVmcFFoT1Ir?=
 =?utf-8?B?Unk5YjA1d3A3RHd0K0ZHTGpaRzZEWlo0NVE4SHIwOGNlWEltbVRNZUtWSC82?=
 =?utf-8?B?dEVYMkg3TlBWSDZFamt4Vk1wNFVnV2NvenFtOSswRTZLeWJId1hvaCthb3Fl?=
 =?utf-8?B?Y0JDeTgvd0d1NW5QdnVmcXVybFNaamhuZXM4bTN4YWRVOWI5cHJnL1JvVnVX?=
 =?utf-8?B?WFNWQlhHMVBKNGc1OE5kMVIvenZUOWpFWk0vL09VMk51QWk5MnB1VkJhYjVH?=
 =?utf-8?B?K2dCVVlCeVo1YzFIekk5d0hhU3BhZ2VBMmZFeFVZZUNEMnhCYzd5RnBOVldh?=
 =?utf-8?B?a1NSUzlYQWNqYXBXL0ZVZVZFVUt5STc3Y08zQXNUdVF1TnBZVGhtL2cvdndv?=
 =?utf-8?B?R2I4bjJKQUMrRkJRNHhNdnJzNlF6TGMzdGt0b08vWHVDTzdYTU5QWHg4WDRM?=
 =?utf-8?B?YXBDK3lkTlRZS1plTUh1UGVvTWt0YmY4ZHEzbzUxU0lDTmx3Yk9CVzhWNUR1?=
 =?utf-8?B?N3dqZ0R6MHNCT2lsM21LbmNQL2RjeC9Ib0pubmliRG5nVmZqc1IzRGpjaDY2?=
 =?utf-8?B?L1N3d25HVDFvTnU3OXMvSDlHeHVIcEgvdDhNSUt4cXdJc3kvZXNWWkxCeDl6?=
 =?utf-8?B?dE14YjhqbkM4amRpSER2aktvc3NPZVpEWktta1VhZmFjSVBmbGdHTGY5OC8y?=
 =?utf-8?B?SEZZczc1UXkvdFg1QzF0d2dDNVQ5S3YwUE9rRVg1VEJHWDlyZWtCZkEwZ2tG?=
 =?utf-8?B?Z3JMVVJobllObEJSa0c0VXVHSFg2ZnlFcDM5Y0tEeG1kUEZpZmdjam5CZzcv?=
 =?utf-8?B?YlhMNVI2Vkg0Q1VlRy9XMU1BbjVpN1FjQUZBMHp3bk9ZQkdzeUpnWnBBUXlx?=
 =?utf-8?B?Ly8wV1hrME8xZUN2bGRENDFFU3pxRXQyOEFleGlsSlUzdEZGMmdFMWY3T1RU?=
 =?utf-8?B?eEhUVEFJRzlNekg4K2s3c0M4Q3cwRkp0ZUZBaGliOEk5VmFLeFo4b3AwUThx?=
 =?utf-8?B?cjZTZFc3VkkzOUZXQWh3enVtdlhvSnNKNGVnTWJNMUZ2Q2xzSWdsQXFuNzhC?=
 =?utf-8?B?djVCb2NYVzZtRG5aRUt3dUpGU2x5OGFvVHprR2Frb1ROTG1ZbGorQXgyM2pU?=
 =?utf-8?B?d3RUVmEzUTZKVVc1UU9NeUxCVkRjMFRkQnl0czJhTU9GV3FaMXFvTDRBN3Z4?=
 =?utf-8?B?Y3BSRUJ3Y1h3R2Rhc3BReHBpQStTRENaVXI0OXFiNUp5SnVVMTJZQXJWVy9H?=
 =?utf-8?B?Y0ZQN1hsQ0EvckdzRUZxWU1vTkVqZkYxVHJkVDRIVXoySVZ3OUptRHVXOFpD?=
 =?utf-8?B?d0E9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ea1148-4911-406c-a79f-08dcec3df3dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 10:50:00.7632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EFHXsEbmLUbl6koncR3Q+etEVkSYGGIJyJjv9/sx76URJ0c95WPrTYMSpG6/wsrAe6FdqQ9GGJO8uV7QTpRDSPfpZE2Gu0ydeix9xv7txjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9745

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogTW9uZGF5LCBPY3RvYmVyIDE0LCAy
MDI0IDExOjIxIEFNDQo+IFRvOiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
DQo+IENjOiBNaWNoYWVsIFR1cnF1ZXR0ZSA8bXR1cnF1ZXR0ZUBiYXlsaWJyZS5jb20+OyBTdGVw
aGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+OyBsaW51eC1yZW5lc2FzLQ0KPiBzb2NAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnOyBQcmFiaGFrYXIgTWFoYWRldiBM
YWQgPHByYWJoYWthci5tYWhhZGV2LQ0KPiBsYWQucmpAYnAucmVuZXNhcy5jb20+OyBiaWp1LmRh
cy5hdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPjsgSGllbiBIdXluaCA8aGllbi5odXluaC5weEBy
ZW5lc2FzLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gY2xrOiByZW5lc2FzOiByemcy
bDogRml4IEZPVVRQT1NURElWIGNsaw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgT2N0
IDE0LCAyMDI0IGF0IDExOjU14oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPiB3cm90ZToNCj4gPiA+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgt
bTY4ay5vcmc+IE9uIEZyaSwgT2N0IDExLCAyMDI0DQo+ID4gPiBhdCA2OjIw4oCvUE0gQmlqdSBE
YXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gV2hpbGUgY29t
cHV0aW5nIGZvdXRwb3N0ZGl2X3JhdGUsIHRoZSB2YWx1ZSBvZiBwYXJhbXMtPnBsNV9mcmFjaW4N
Cj4gPiA+ID4gaXMgZGlzY2FyZGVkLCB3aGljaCByZXN1bHRzIGluIHRoZSB3cm9uZyByZWZyZXNo
IHJhdGUuIEZpeCB0aGUNCj4gPiA+ID4gZm9ybXVsYSBmb3IgY29tcHV0aW5nIGZvdXRwb3N0ZGl2
X3JhdGUuDQo+ID4gPiA+DQo+ID4gPiA+IEZpeGVzOiAxNTYxMzgwZWU3MmYgKCJjbGs6IHJlbmVz
YXM6IHJ6ZzJsOiBBZGQgRk9VVFBPU1RESVYgY2xrDQo+ID4gPiA+IHN1cHBvcnQiKQ0KPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBIaWVuIEh1eW5oIDxoaWVuLmh1eW5oLnB4QHJlbmVzYXMuY29tPg0K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5j
b20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiB2MS0+djI6DQo+ID4gPiA+ICAqIEltcHJvdmVkIHRo
ZSBwcmVjaXNpb24gYnkgZGl2aXNpb24gb2YgcGFyYW1zLT5wbDVfcmVmZGl2DQo+ID4gPiA+ICAg
IGRvbmUgYWZ0ZXIgYWxsIG11bHRpcGxpY2F0aW9uLg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRy
aXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3BnLmMgfCAxMiArKysrKysrLS0tLS0NCj4gPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4gPiA+
DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jDQo+
ID4gPiA+IGIvZHJpdmVycy9jbGsvcmVuZXNhcy9yemcybC1jcGcuYyBpbmRleCA4OGJmMzllOGM3
OWMuLmExZTIyZDM1MzY4OQ0KPiA+ID4gPiAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9j
bGsvcmVuZXNhcy9yemcybC1jcGcuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2Fz
L3J6ZzJsLWNwZy5jDQo+ID4gPiA+IEBAIC01NDgsNyArNTQ4LDcgQEAgc3RhdGljIHVuc2lnbmVk
IGxvbmcNCj4gPiA+ID4gcnpnMmxfY3BnX2dldF9mb3V0cG9zdGRpdl9yYXRlKHN0cnVjdCByemcy
bF9wbGw1X3BhcmFtICpwYXJhbXMsDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIHJhdGUpICB7DQo+ID4gPiA+IC0gICAgICAgdW5zaWduZWQgbG9u
ZyBmb3V0cG9zdGRpdl9yYXRlOw0KPiA+ID4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgZm91dHBv
c3RkaXZfcmF0ZSwgZm91dHZjb19yYXRlOw0KPiA+ID4NCj4gPiA+IFdoaWxlIHRoZSByZXN1bHRp
bmcgNjQtYml0IHZhbHVlIGZpdHMgaW4gZm91dHZjb19yYXRlIGJlY2F1c2UNCj4gPiA+IHVuc2ln
bmVkIGxvbmcgaXMgNjQtYml0IG9uIHRoZSB0YXJnZXQgcGxhdGZvcm0sIEknZCByYXRoZXIgcGxh
eSBpdA0KPiA+ID4gc2FmZQ0KPiA+ID4gKHJldXNlISkgYW5kIHVzZSB1NjQgZXhwbGljaXRseS4N
Cj4gPg0KPiA+IE9LIHdpbGwgdXNlIHU2NC4NCj4gPg0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4g
ICAgICAgICBwYXJhbXMtPnBsNV9pbnRpbiA9IHJhdGUgLyBNRUdBOw0KPiA+ID4gPiAgICAgICAg
IHBhcmFtcy0+cGw1X2ZyYWNpbiA9IGRpdl91NjQoKCh1NjQpcmF0ZSAlIE1FR0EpIDw8IDI0LA0K
PiA+ID4gPiBNRUdBKTsgQEAgLTU1NywxMCArNTU3LDEyIEBAIHJ6ZzJsX2NwZ19nZXRfZm91dHBv
c3RkaXZfcmF0ZShzdHJ1Y3QgcnpnMmxfcGxsNV9wYXJhbSAqcGFyYW1zLA0KPiA+ID4gPiAgICAg
ICAgIHBhcmFtcy0+cGw1X3Bvc3RkaXYyID0gMTsNCj4gPiA+ID4gICAgICAgICBwYXJhbXMtPnBs
NV9zcHJlYWQgPSAweDE2Ow0KPiA+ID4gPg0KPiA+ID4gPiAtICAgICAgIGZvdXRwb3N0ZGl2X3Jh
dGUgPQ0KPiA+ID4gPiAtICAgICAgICAgICAgICAgRVhUQUxfRlJFUV9JTl9NRUdBX0haICogTUVH
QSAvIHBhcmFtcy0+cGw1X3JlZmRpdiAqDQo+ID4gPiA+IC0gICAgICAgICAgICAgICAoKCgocGFy
YW1zLT5wbDVfaW50aW4gPDwgMjQpICsgcGFyYW1zLT5wbDVfZnJhY2luKSkgPj4gMjQpIC8NCj4g
PiA+ID4gLSAgICAgICAgICAgICAgIChwYXJhbXMtPnBsNV9wb3N0ZGl2MSAqIHBhcmFtcy0+cGw1
X3Bvc3RkaXYyKTsNCj4gPiA+ID4gKyAgICAgICBmb3V0dmNvX3JhdGUgPQ0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgKEVYVEFMX0ZSRVFfSU5fTUVHQV9IWiAqIE1FR0EgKg0KPiA+ID4gPiArICAg
ICAgICAgICAgICAgKChwYXJhbXMtPnBsNV9pbnRpbiA8PCAyNCkgKyBwYXJhbXMtPnBsNV9mcmFj
aW4pIC8NCj4gPiA+ID4gKyAgICAgICAgICAgICAgIHBhcmFtcy0+cGw1X3JlZmRpdikgPj4gMjQ7
DQo+ID4gPg0KPiA+ID4gU2hvdWxkbid0IHRoaXMgdXNlIG11bF91MzJfdTMyKEVYVEFMX0ZSRVFf
SU5fTUVHQV9IWiAqIE1FR0EsDQo+ID4gPiAoKHBhcmFtcy0+cGw1X2ludGluIDw8IDI0KSArIHBh
cmFtcy0+cGw1X2ZyYWNpbikpIGluc3RlYWQgb2YgYSBwbGFpbg0KPiA+ID4gbXVsdGlwbGljYXRp
b24/DQo+ID4gPiBTZWUgYWxzbyB0aGUgY29tbWVudCBmb3IgbXVsX3UzMl91MzIoKSBpbiA8bGlu
dXgvbWF0aDY0Lmg+Lg0KPiA+DQo+ID4gT0suIFdpbGwgdXNlIG11bF91MzJfdTMyKCkuDQo+ID4N
Cj4gPiA+DQo+ID4gPiA+ICsgICAgICAgZm91dHBvc3RkaXZfcmF0ZSA9IERJVl9ST1VORF9DTE9T
RVNUX1VMTChmb3V0dmNvX3JhdGUsDQo+ID4gPiA+ICsNCj4gPiA+ID4gKyBwYXJhbXMtPnBsNV9w
b3N0ZGl2MSAqIHBhcmFtcy0+cGw1X3Bvc3RkaXYyKTsNCj4gPiA+DQo+ID4gPiBVbmZvcnR1bmF0
ZWx5IHdlIGRvbid0IGhhdmUgYSBoZWxwZXIgbWFjcm8geWV0IHRvIHJvdW5kIHRoZSByZXN1bHQN
Cj4gPiA+IG9mIGRpdl91NjQoKSwgc28geW91IHdpbGwgaGF2ZSB0byBvcGVuLWNvZGUgdGhhdCAo
Zm9yIG5vdykuDQo+ID4NCj4gPiBBcyBwZXIgWzFdLCByb3VuZF9jbG9zZXN0KHgseSkgd2hlcmUg
eCBpcyB1NjQgYW5kIHkgaXMgdTMyDQo+ID4NCj4gPiBJbiB0aGlzIGNhc2UgbWF4IHZhbHVlIG9m
IHggaXMgMzAwME1IeiA8IDJeMzINCj4gDQo+IEJ1dCB0aGF0IGlzIG5vdCBvYnZpb3VzIGZyb20g
dGhlIGNvZGUgKGFuZCBmb3V0dmNvX3JhdGUgaXMgdTY0IHNvb24/KS4NCj4gQWxzbywgaXMgdGhh
dCBndWFyYW50ZWVkPyBXaGF0IGlmIHRoZSB1c2VyIHBsdWdzIGluIGEgNEsgb3IgOEsgSERNSSBk
aXNwbGF5Pw0KPiANCj4gPg0KPiA+IGFuZA0KPiA+DQo+ID4geSA8IDUwDQo+ID4NCj4gPg0KPiA+
IFNvLCBkbyB3ZSBuZWVkIG9wZW4tY29kZT8gQW0gSSBtaXNzaW5nIGFueXRoaW5nIGhlcmU/DQo+
ID4NCj4gPg0KPiA+IFsxXQ0KPiA+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2
LjAtcmM0L3NvdXJjZS9pbmNsdWRlL2xpbnV4L21hdGguaCMNCj4gPiBMMTAxDQo+IA0KPiBZb3Ug
bWVhbg0KPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4wLXJjNC9zb3VyY2Uv
ZHJpdmVycy9ncHUvaXB1LXYzL2lwdS1pbWFnZS1jb252ZXJ0LmMjTDQ3Nw0KPiA/DQoNClNvcnJ5
LCBJIG1lYW50IGZvciBESVZfUk9VTkRfQ0xPU0VTVF9VTEwsIEkgaW5jb3JyZWN0bHkgd3JvdGUg
aXQgYXMgcm91bmRfY2xvc2VzdCh4LHkpDQoNCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y2LjAtcmM0L3NvdXJjZS9pbmNsdWRlL2xpbnV4L21hdGguaCNMMTAxDQoNCkNoZWVycywN
CkJpanUNCg==

