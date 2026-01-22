Return-Path: <linux-renesas-soc+bounces-27273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Hg/Bo/ucWlKZwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27273-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 10:31:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C558D64937
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 10:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C4C9F7E7403
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 09:26:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7293238B7D1;
	Thu, 22 Jan 2026 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="X8bXaWRt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010038.outbound.protection.outlook.com [52.101.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05A638F22A;
	Thu, 22 Jan 2026 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073972; cv=fail; b=BS6s6DOdUZ5tDEbsZnfNhF4XlJh5yv+JyeRBEF7Zv04qxUlHozN6eDP0N+AylsTntecpTLiOzV0lp93SnKY7Qv6A/8hHF8QFqr4pkPjQulSJJGL/RWXGcok/1xXEraWPbLkqVLGFMeIJybFDy62Vw/9OCwGjVZAyyLh1lUqvGFs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073972; c=relaxed/simple;
	bh=hWtr3NyQMLAjvx3Sj6bIjavwcIX91fZXtH4Edjw/Z3E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R74nuZBIGLpnJt0S/53WOXFfIPX9dcPF3gytLCFwVcarpPOGZdtf4vlyhSZOQK9UQln3I7xd+JRuFTGdU1R8x7FuKuOrKJYJhzuuZlMMZDW5DqP9TxJbSpWwM3UFaE12I6g9CSt96f/JxAAms89OcsDdea7gMKxexBpqRAqFnuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=X8bXaWRt; arc=fail smtp.client-ip=52.101.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vvwK9UH92PtMsofHt0qqfok15W3a63s30bR4OK4X3xkn3wzPHrX49BO4BrIjfr1cGnLltJc2/Rxdld/R+oOyN/dmVtPHaMZ5cu0Z5ESrb96TRTXqaH3I/egn5DMyWkuYxKHTmQrzkoaGytKLnLAQ9RMDIRVloC6gOXR72aeyJ5WkV2TJI0n9AlzLMdgazkDDdXA8oG7FAabx1OLs9qGzzXEjKJ+g2JQnI8aopRupSQRgK1SrC/7UdJlX377/UlZTlYYEhwXPitai7eeV78isxB94QNUE0ura2TdpOmfH6cu9SdEeIB5C5phL4IHbMEj60jGvj0ekw2RaUggIWweFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWtr3NyQMLAjvx3Sj6bIjavwcIX91fZXtH4Edjw/Z3E=;
 b=I4Q272of/wplJGiKYChNanujijNDpBUGnjXGJjBNxRWSk/RSEoW5pPZd/TZjKf4Bu/F7nqW0iCrlhS3HJs5KVxdJAzR7nJFlxGHWACzavAfkhm3ol9cAyf1m1eDoCBSizI1Ao1yQMp0PKfWBDtD3vwjTlkjh6nahBcM9PN4dglsAFxE2MIMcAkuvgViedKVP/+XryZ2/pY0G6jRIrmO56Yp69uhKsJqgk/V/T+Ut839DCYZSiH+sBaNCEiakMPg6xOzwgwUYIhrLYDJDRyDFfyT3H2M6hZzpGFmYUKFVS3u4WjbNcL2Dbffh4r6zhE+vfssyIjjT5NIAudXhzaWcSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWtr3NyQMLAjvx3Sj6bIjavwcIX91fZXtH4Edjw/Z3E=;
 b=X8bXaWRtJYUrv0eKhcobtulH+g0JUVbvI5HQc1bQE1+RJJcKIgglU2r8OGY08Xp4aWVTJHA53d1aTVvSccIZHYMg8i2i2mWte13irJ6uZCwjJMtyrz9S7gZctng7RUPNpvwmIygBnUf/hjakw8tUgBuu5isgm9tBzkptlIFgbb8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11603.jpnprd01.prod.outlook.com (2603:1096:604:241::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 09:26:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 09:26:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 5/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and add
 SWPE trigger
Thread-Topic: [PATCH 5/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and add
 SWPE trigger
Thread-Index: AQHciubnS/5c+t9510mREMj1ku8eh7Vd2TCwgAARQQCAAAHXMA==
Date: Thu, 22 Jan 2026 09:26:00 +0000
Message-ID:
 <TY3PR01MB11346D2377E6F3D5B9B60B3F28697A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260121150137.3364865-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346DB069193A06BB45DC62A8697A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8vGJeoeDig+7FARuzF=qczFRE4TNMHqtW0ia3wzRWrmQA@mail.gmail.com>
In-Reply-To:
 <CA+V-a8vGJeoeDig+7FARuzF=qczFRE4TNMHqtW0ia3wzRWrmQA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11603:EE_
x-ms-office365-filtering-correlation-id: 7c13ce1a-5e26-4652-17e5-08de599841dc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WkozcEd1QnA1VzdZdTBCN0lVbTF1N3BackU3R0granViQmhISHNVNFNoa3k4?=
 =?utf-8?B?SzVheE1zUk5NS1hJbWNzYldDQ3hyVHdyYzJlSlZUK2w5bmdLYmJmNDN1bnhi?=
 =?utf-8?B?a0ZIUTlrM3pRWEZUUGJqaXNLZ0FNSDJqeXRlckJRUHJPUHlyQ1E4OXJqbzQv?=
 =?utf-8?B?UnJ1aS9VTU52Vmh2b0pSdFJlWXJjUnBzSjB3TlZPNmlvQU11V0MycTMzVm53?=
 =?utf-8?B?V2k5bXRlQUdFNTMyUFpYdWdBL0N4WXpMVCtQVjIxTGlLY2tvME5SVS9EV0dG?=
 =?utf-8?B?NjNzQzRWaC8yRmtFcGhSc2djZjhNcDlCTEJaS01PVm5IcW52TWhodU0yNmcw?=
 =?utf-8?B?QzRxc09QQ25zaGZTSkl0TXQzd2lDUThHbmdDR1JoN0M2dWVVNmhOVk5IYXAy?=
 =?utf-8?B?QVBBYlNweXVzc0FIdWtPbHFDclFhek1wVUFPUjlpOTl6dmJjc09xS0Q1d3Er?=
 =?utf-8?B?dWNycXJJZWRPbFZBN0xjNnNaOUxRVUEwZlBkWnpVSVdPZWZqUWF3UFFTTE5S?=
 =?utf-8?B?WWUwM2JnQitVN2F0c01rUHczeEdoYk0yTkFFb1UrQ1A1cDFUbmNRMkRJdkp2?=
 =?utf-8?B?UzBnYjRFMDNZanBnSURyWlgzVmJwQTNEWm03cVFWb3pMMGR6NWdrbDUzNlpB?=
 =?utf-8?B?QmVEMTBTaVZuWmhBbjVHNEJiWHZQNEZqQ2dlUzF4ajhWc3NWTXB2OUV6V1Bo?=
 =?utf-8?B?NG5oQXA4aUNjcURyNUZhUjd4RFZxMGpQV0JnUSt2Z3VQODZCN09Ha0NyYWl2?=
 =?utf-8?B?R2wrTmliZ3lZcFJzYVZiM2FTd214UVcxSTZSNVFPRXhERHJxdVVPSHUvZkpW?=
 =?utf-8?B?TGo2OEwvQUplZ2t4RTROam5BTU5VVmJ4OVZRY0FuS09KU2dnNnNpek8wOUZw?=
 =?utf-8?B?K0RhZytUV3pYSCs5a3BLYjdZczJXVGNkNm5HeG44UUFrUUN4Si9JUTRYU3Fn?=
 =?utf-8?B?VHRXL1BOdXFEUktDU0JOWG1pZzhMQXFpeXJSVGZNRUYzcE5ESVl0Q2dZWE0x?=
 =?utf-8?B?WkJpUnBUaG94cTBVU2U1MzNRR2JoVWJJMm1CelpLNGZQVEdubjNmYmlSdFRu?=
 =?utf-8?B?UnlkZFdWK3J6alM5d1pPYkJMVVRkemhTQzd3N0dFSDZMY1VQM0YxQ0JzSVNT?=
 =?utf-8?B?Uy83bW5aRU1PNjdjNjMvaHVjQjhnVUZYdlBlaHRZeW5DSkpIWlJOdkVTNkRq?=
 =?utf-8?B?MVUrMzhzdWlWeFhnUXhTOHB1VmJWWlVQZ0p5cEFFTUlJcTFFZUd2T25UTkF5?=
 =?utf-8?B?dDdMb0F0QWVISThDNmtFQzhWN01laHJzSFhuWUlYR0NLdzYyUHlaNkE4emRj?=
 =?utf-8?B?Wi9TcjlvR1pHUCs0R2FUanBRQmZCUjJJTDZaMWlnd29BUzU4WTdJZy9yWFpF?=
 =?utf-8?B?cFRLTzBxVG4vaHJJYzYzUG90K01vRFRYR20wSm5jR1U1VWduSmk3cEZ1Vjlu?=
 =?utf-8?B?SkEzNmJHZERQSlNUbFI1OXRZNnhoZWJibUVTRlNlQTlwTjllbVU3TjlKd2Fj?=
 =?utf-8?B?QTY3aEhNQ1d6WVl5WUZPWE5JeHRyc3YxeWxLdlFYdVgvRE5HZzFONlB6SEd3?=
 =?utf-8?B?dmE1Z0ZyelUrcFhLRlVzNytaY1grVG9BWG5YbnVUQk9ZaTVXVHZxUlZnei95?=
 =?utf-8?B?VURZMlNicGhwcUl3WkJLTkdnVXdLejd1eUZ5clNwK2VMeHk2TlAwaDZiTVh2?=
 =?utf-8?B?YW16WEkrYWs0UFMzZzc3MFV5TlpBUGhJYlhaem90T3R4SUZXSGRrS2RqT2hn?=
 =?utf-8?B?M21zVVdJOU9mSEZCN2pDY1pvTWhkVFBvNjY5TW9VcGJqb2JJTG9sNWJZWFB1?=
 =?utf-8?B?RWtXTGtNQm9SRDRxbSszRi82bHVtdnZuUW42aGRwWWwrQVl1ZENDM0JUd0t4?=
 =?utf-8?B?WmpvMURtekJDUzVZVUkxdWQvZGFUcDhBWmQ0eFpYbTZmTTMxUVRia2xFallF?=
 =?utf-8?B?YXFIc3N0NUJtR0crSFNiZ0lNdzg2dGhXNnVWMmpNWHNDeUFuenlNUjJaMmdL?=
 =?utf-8?B?K0Y1cDBRaTd3c1BmZkR3OHIxeTFVYUhRb1FlamR6dG9IM2Z3YXd5WExkRGM2?=
 =?utf-8?B?SWEvcUtwdXhmZE9IM0Ntbmw2cEI3WUZnNzg1OEdHME9VWnZvYXY4bDNiS1Vi?=
 =?utf-8?B?Yit3RXVEbkkwY2ZCS2tzajFIbi9jZWFsYlBYTUEyMDZJMVdjTk00S2dVZW9M?=
 =?utf-8?Q?Ivf2z6y/tLAfktLknFBcrfA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Tjh4bEIxN0NNK1pQUzRodDY2aWV4RGE1TEs3VytVL3hhWXJHTXlRY09zT3RN?=
 =?utf-8?B?YnUrZzZkK0dRN3plcFYrckd0Qi9lbHE1dTBycldMZjZCMFcvSlJncC8raE12?=
 =?utf-8?B?engxQ0pvYVdvR3EvaXdCTUF2TDVLdkFBMGZ0Z3ZIaDdHWGlHd1NRZVdlZi9a?=
 =?utf-8?B?ZVpFbGdKYVliMlcrVzF4MGlodlEyeDRtMDBBQWNHUE5jUzNtZ1Z3a25oZEFh?=
 =?utf-8?B?eGlUcGtvNTk0OGFqNkx0Q1RJdGlGK0pGVEJZb3R0R0ljK1g0Q1o5Y1ZhRFJh?=
 =?utf-8?B?YkdWRXJkeE91VlVhTkN6Z01LZC9uZ2J2Qys2LzUyU1FMZ1g1UEZqdXJVQ0R4?=
 =?utf-8?B?U0lnY0VKN0JjenhscHViNFp3UVVPYy9ydmxnbStuMGFMVUk1eXp5TFpSSkRU?=
 =?utf-8?B?L3JwVFQ1aC9QWlp5SzBiWTQxWmhRdGN3VEk4Yndqb2ZnSFZFT0pQRjl2RUt3?=
 =?utf-8?B?dzk2R3pkd1lqa01DQWRRUzhOTUhNOFZIb1F4V2V3eFpBQ1BYSHRwK0tiRHJF?=
 =?utf-8?B?bVVtK1VsTkVNV2ZkbUMwZ29kdmx6ejBkLzdZeXplaXQrM0FHQkZ3RHVhS1BX?=
 =?utf-8?B?V2NuUDhveG0zbTZleXNHNm9TUlAxNnpibVZYc1hjaERHc25MNkwwWmxNeExM?=
 =?utf-8?B?N29kbnJCallwY3FzdVd2SmZkREJ6Nk1YODBidHVxdHVPYVYwTzNDOVN1eGN3?=
 =?utf-8?B?MWRFbTRCczRBNUpMUEt3NGpFSWtuRWxEeGUwcEhIZE9MOEdXVUtXQ01pdUZj?=
 =?utf-8?B?TFZQUmVQZUJSQ1ZQKzk4Nm1iSVpObDVPekoydFRsTWsvS1gxV2pBYTl3cWV6?=
 =?utf-8?B?VXRvbXB0dERMMWF2REU2YmFYQ3NwK3F5OW9PUDk2TXNhOFFBMThQV2xoQkZM?=
 =?utf-8?B?bzZwL016TUhTQTIvTS9wMUp0OE56MUFEVlJvR1dlcHdzT3hEa1o3aTRYeVla?=
 =?utf-8?B?UEl2Q1dzeHVXOUN6SlZyRjYzRkpid2o5Q09Ed1oyNVhVekR1NUtCSXNseXd5?=
 =?utf-8?B?dXBJTW5INDlTaHF2azRjaHU3TnE3M24zUnEwd2VqbjJ1d0lHN1JYNGwrTEU1?=
 =?utf-8?B?M1lMNCt3Y1BXb2xxdnBXclloRENXTXU5MDZlYXpUZVR2Ni9qVTRqWjQ0cVlJ?=
 =?utf-8?B?VlVibVJpcUZnZHdQdk8veGVRS1NYcHR6USs4N2ZQdFNUckZaNkNNVEpPMi9P?=
 =?utf-8?B?dEs0a0NrVTBhQnRqekduREx5WWdUTUtTd3JJVlY5alZoRXZKdG0yWHNjemhi?=
 =?utf-8?B?RkNJQS9xYWdnem54UE53MkZQZWN2T0tYeHJRLzBnc2N6M2dyYlNSbkZCRGRP?=
 =?utf-8?B?ank3b21hWlZDdDEvSGtuT2JqdEFabTR3SU5WVElJQ2YySmxvV2cyNHY2YlNU?=
 =?utf-8?B?TjRKMEN1Z0pHTlJwN2VFbW8xSzVodCtia0thQ3NOVUliWnh6QkFqaUxHaTdD?=
 =?utf-8?B?MGREZy9xQlU5dkNSZkVQUEVRRW0rNlNtUnoyZStWb2tENmVSU1dLbTczVGhi?=
 =?utf-8?B?WTVnUEpJV0tKdE9uaGRXc0ZWWjViR29TbytGZGw3K3h3OGVzaUM5N1owK2Nk?=
 =?utf-8?B?MFJZRUVhZlZaUE56NWJ4ZUcyK2RvRUJUd0kzRjB5WDJmZWlZZm9FWTRXbVBo?=
 =?utf-8?B?S3pmeGxDeWNteWhOVmhJWW1JZm9SdFpkTEdlSjJqaUttNWZKZm1yY0JEcmVm?=
 =?utf-8?B?alRGbk1KVlBnUmZlaGVoWkMvRHpIUWZHWjVsT3JXMGJLc1pZRXFYcS9OT1d2?=
 =?utf-8?B?c2puNU9tQXloMlZ3WDFOVnlSNXMyMkw4NzhIVTVyaWNvVEFqU0NZUFF6K1FD?=
 =?utf-8?B?Q25ka1RaMHpUL2JOKzlITVlCMTZTdEljeTVvNCtSRG5BWkc4ZzBST21oaDRW?=
 =?utf-8?B?VWF1VVdHK1pldmo0UGVoaFpESkpIbmlPRlkwMndna2M0bGtGdnpaY05MZXZu?=
 =?utf-8?B?U0JPRWhtaDFCMUhXTGRGdmZ4dFU1dmZ0V21oMDJnWUx2M25vZis4WjRlL3I0?=
 =?utf-8?B?L3RpOHVkVUNpY1dTdDFJTEdxMFBENW1odk4xWkZDcHFDZStsRjFDQUw5emdP?=
 =?utf-8?B?WVhTQVl1dUZFZzhVZ1kwZTJibjk2Qlg0VWNkdWwxT3JFd3Y4dVo3UHpPK2ln?=
 =?utf-8?B?YWtTMGJ6dENyU01LNFNhSWV6V1RibVhwbWt3eVVXRllEcC9FRWt2VHhlQjV6?=
 =?utf-8?B?Q3MxdmxFdDdLeFRlM3dEdVZZRnY1SVRqcUN5UGVBcXFtMTF4WXlCMFIydTlZ?=
 =?utf-8?B?VlJmNkJyaGxHV2dpZlRLQjNCYU1rcGtyakl0YmJEQmlaYnhEODhBYVZIbXpv?=
 =?utf-8?B?WTYxMERQd3dIOXpoeGttZWN1RjJoN0lXcDFORnA4a0ZlbGJQL0lVQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c13ce1a-5e26-4652-17e5-08de599841dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 09:26:00.7982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z+B2W9+Y4Mc42pzWUnxmKx4erSCjdZEXQr86TuHDGWvOysWny0L4Ld0uBp3CqLk1v8r6UrDxhjo169MIXSWL7f6J7+ctr9iBxH5iE+TspXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11603
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27273-lists,linux-renesas-soc=lfdr.de];
	SURBL_MULTI_FAIL(0.00)[TY3PR01MB11346.jpnprd01.prod.outlook.com:query timed out];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com,vger.kernel.org,renesas.com,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: C558D64937
X-Rspamd-Action: no action

SGkgUHJhYmhha2FyLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExh
ZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4NCj4gU2VudDogMjIgSmFu
dWFyeSAyMDI2IDA5OjE5DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNS82XSBpcnFjaGlwL3JlbmVz
YXMtcnp2Mmg6IEhhbmRsZSBJQ1UgZXJyb3IgSVJRIGFuZCBhZGQgU1dQRSB0cmlnZ2VyDQo+IA0K
PiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgODoyMOKAr0FNIEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBQcmFi
aGFrYXIsDQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9t
OiBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPg0KPiA+ID4gU2VudDogMjEg
SmFudWFyeSAyMDI2IDE1OjAyDQo+ID4gPiBTdWJqZWN0OiBbUEFUQ0ggNS82XSBpcnFjaGlwL3Jl
bmVzYXMtcnp2Mmg6IEhhbmRsZSBJQ1UgZXJyb3IgSVJRIGFuZA0KPiA+ID4gYWRkIFNXUEUgdHJp
Z2dlcg0KPiA+ID4NCj4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2
LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiA+DQo+ID4gPiBIYW5kbGUgdGhlIFJaL1YySCBJ
Q1UgZXJyb3IgaW50ZXJydXB0IHRvIGhlbHAgZGlhZ25vc2UgbGF0Y2hlZCBidXMsDQo+ID4gPiBF
Q0MgUkFNLCBhbmQgQ0E1NS9JUCBlcnJvciBjb25kaXRpb25zIGR1cmluZyBicmluZy11cCBhbmQg
ZGVidWdnaW5nLg0KPiA+DQo+ID4NCj4gPiBKdXN0IGEgcXVlc3Rpb24sDQo+ID4gSWYgdGhlIGly
cSBoYW5kbGVyIGlzIG1lYW50IGZvciBkZWJ1Z2dpbmcvYnJpbmctdXAsIGNhbiB0aGlzIGlycQ0K
PiA+IGhhbmRsZXIgYWN0aXZhdGVkIG9ubHkgZm9yIGRlYnVnIHNlc3Npb24gaW5zdGVhZCBvZiB1
bmNvbmRpdGlvbmFsbHkgZW5hYmxpbmcgaXQ/DQo+ID4NCj4gVGhlIElSUSBoYW5kbGVyIGlzIHJl
Z2lzdGVyZWQgb25seSB3aGVuIGBpcnFfcmVuZXNhc19yenYyaC5kZWJ1Zz0xYCBpcyBwcmVzZW50
IGluIHRoZSBib290YXJncy4NCg0KVGhhbmtzIGZvciBjbGFyaWZpY2F0aW9uLg0KDQpDaGVlcnMs
DQpCaWp1DQo=

