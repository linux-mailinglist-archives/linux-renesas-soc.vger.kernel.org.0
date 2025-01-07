Return-Path: <linux-renesas-soc+bounces-11915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F611A03FE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 13:54:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 631DF188145B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 12:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAA21F12FD;
	Tue,  7 Jan 2025 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qRb0+Ro2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F601E515;
	Tue,  7 Jan 2025 12:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254320; cv=fail; b=F0k940eE7Gj9bs+y2zEKml0fRCN4WXK6bWcNc2fHFyHnUNj4psLm8Ek+oLShLBKqOEW9tQ/Xky7p8LynJXQzAqH8jhs+Nbv5wvTMm+uNOvhi0Zdo/RQ2VaNZFI33VBEytkOQCuqQGNz79Pf+rmzyXdqPFCDKv+sipys+PN9IhUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254320; c=relaxed/simple;
	bh=R5izBSv8IrpJfRuSRDA0/zW876OaLtxQ3FRJCMt6bw4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sI7t1UVbCuAIlnvzK1zmEu8O9sc3NNxj9YV4oCKRfmWnz7Um3Zs9rN0os3dARjjQ7LTQlz9GifmQ49Kt6GrptvWsGPzVbcVBQs9snXwiXpAWA/URVB1nJfc/MFAalLMMJyJNmwXBxFuzZmqtF8Q28PajdSGN0mc0G1w/Mslym2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qRb0+Ro2; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I66dvdc3Dg3pGUzLQf+y1eesO8VHvW8nN0r6kjjcG3D3hwwW55TLyY/JDnFg6VZdr9sK40vNvNr0H+g4n30nWOcsF9it3M3bmk/FD36NYC6THG3InPljNhi2+kpdi3jJ8Heuzr1prYothi001HLam7BjoP9bY1j7xvqD3hrpu+KML79sxzc8Vpkua6SyfmubHkvU7ynEdPdfQzIyr7/x3anD0/yaAwQhTs+oaGW/FEeGHetleMHeQ2xVAsfoJ2cqZH5web8RwctI7oXauaM9DkH4IWxitq7l5EHfqzeJPORKHwyF3L/VuLe48D6zDOXMC4oM3DV3SlyNIS6olMcP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5izBSv8IrpJfRuSRDA0/zW876OaLtxQ3FRJCMt6bw4=;
 b=P1O4WPdQz3HJ1K2wwsqjRlHE1b9OareptbMiOiKKJFppJXq1mG9DcpQ/3RCkdsug9v00xQPQD5ZRDg2M9oMbDJy9SXCSgvL1rjGOQC5R1WdAojPVJEqohpbEQ27OxsX9uhrz5I9OahKaszCToYhvplvJD0H7oLNygxWyeYKBQZ5GyDMx3QEs3UxgzYsuQc9fIkfyDcQbCL3a2hwcjUMcBV3T28ijaDhcGhcz8FNooPVCywOa/y74MZ7PDmmftp8lKzv376QumBKpv152JrfMy7U4jqUZJWmO5syDmDXY562DFd2z823EB1oGEsYmTwWYArp4LFsO8RdRPcMufH9XXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R5izBSv8IrpJfRuSRDA0/zW876OaLtxQ3FRJCMt6bw4=;
 b=qRb0+Ro2cZISESQu9KDKWwZr1Vy9TXfD3I2r6Fvcvr+27QLkfYDJ8aJvOs3/8BJS4x0WHTJRQLC78ksKZVHVEOKlk1aA1oPKb8LAK9ZphmPFh9l3Rh3xgGniIz3BALmZky6JpQnLP2FBMNBVAxycOo3/d0dpzMmIsAdUL4KegVo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14909.jpnprd01.prod.outlook.com (2603:1096:405:252::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.18; Tue, 7 Jan
 2025 12:51:54 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 12:51:54 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
Thread-Topic: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration
 to per-bit basis
Thread-Index:
 AQHbXULKeQyg6OXyX0+NSgiIE5q337MLMU7ggAAHlgCAAAnwoIAAAssAgAAA56CAAAQ9AIAAAGOQ
Date: Tue, 7 Jan 2025 12:51:54 +0000
Message-ID:
 <TY3PR01MB1134643EE2C9CC8599E0BCBAC86112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346C123E18F61A009F6F0F586112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tO-d35+aPLYoCmC4xKW4cMoNyzM_Vmyw6CzOJjyjj=_g@mail.gmail.com>
 <TY3PR01MB11346C6E247A83F6835F0C7A686112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v3wdwEk9zu26MeQVmOnWKm=RdHJzdH6tLKrvRLeoQ2DA@mail.gmail.com>
 <TY3PR01MB11346E9B6CD4CDB6EF93B99C986112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdXqF6SbU3ScXLUt7e5LGckouX6fQqg0sJ3+3cYeFtpN4A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXqF6SbU3ScXLUt7e5LGckouX6fQqg0sJ3+3cYeFtpN4A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14909:EE_
x-ms-office365-filtering-correlation-id: 9c04d21a-2641-4982-374b-08dd2f1a1072
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?VThPSXhwQllqMHJ2VCtxNS9WNXhibUJ5ZTd6eXcramxjUk5EdGtwWDNKbWxw?=
 =?utf-8?B?dWxKY0luaUxqRHdDNzNIbmtyQ0swckZaZS91TGZEOWVvZzA3M1hrSFAvbzBR?=
 =?utf-8?B?eTVYOEJIVUhIcVNzRDg2Y3QxeHFBb0hlZmFHS2hKcXFaY1QrZDg2TVJOaFlL?=
 =?utf-8?B?eXA5eklySC9XSzFKajI1MC9WMW9hNERhTmx1c1JQS0V6ZzMrTEVqN2dDNEJz?=
 =?utf-8?B?OUcyU0pYUmplbzBSN1FyN0JnTkhnbG0rSUMxd0FKMUxjWXNZUlVPUFhMem9r?=
 =?utf-8?B?KzNrb291ZVdVNVQvZkNMelBZY2ordGxWV0pMWHBqTUI1LytoTmZqY3BZME1L?=
 =?utf-8?B?dU1uU1ZkOXdVNDZiS2k2SVhOM2liUGtCN0o3RjdabHgyb2FyVXhMZDVrc09Q?=
 =?utf-8?B?NTEzQVkzazhBeVdKK0d5SmJMZWlST1l1ekhNOTJRZUpnSEl5RWNxMHpyYWRl?=
 =?utf-8?B?ZVFEOE54N05HcjQ0eXRJbERuWkNDQy9OMVZtMUZzSEFyUVFEM3F3RkRLaS95?=
 =?utf-8?B?ZmtBa1F2TEV6TXhTUkJVTzFDMjk4N3M1Vjhtdk44eDNBNWRGRXM2OEVKTHFJ?=
 =?utf-8?B?UER1WHI4R1owSFJ5S2Y2NWpDbXJJd1NJNEVhYUwxeVFpTVNHRzNhdVdXV3BI?=
 =?utf-8?B?UWUwK3NId1plenJlN0xqUXN5cVRVR1FydG9OelZSeGo4U3FZbUtjNTdHTnVV?=
 =?utf-8?B?NktvNW92dE4xUHRPMU93SUJUejVScWthcElTcjRyT004YURFenYyZ0s4L0Zo?=
 =?utf-8?B?NnIyajZNa1NlNWpPeXk5eDU5d2puVWkvT1EvTndDYlNSYXZ3OVBjbDRjamVo?=
 =?utf-8?B?cXFzQjBhOEZ6alN1Z3VqM3JIZy9SUWRBcnY0dVc5WmRzd0gyMVZMQllBZjhU?=
 =?utf-8?B?WVQwQ2F0aHZkTlk3Qzgrck1WYjIzenVzNUNpTURtenE0M0FWYUxxcWNnRnpO?=
 =?utf-8?B?dXZ0THFweG5Dby9WNjFpZ1VDZjRpMC9ieWNTamZJSFplYktXdkpJMWRJWWdZ?=
 =?utf-8?B?alpYSWhOU2dXSzZqa1Y1Q2ZBYTZxWFNocjVrZVFBWmdNNit4ZjhOYkRjZGli?=
 =?utf-8?B?R2ZJY3ViQ0d6SDNCNUN6SU9Lb094UzAvSUJXWmJqck1MTUJhcnpxcEpFRnMy?=
 =?utf-8?B?V2YvRVRjMGUvQjd5TFUxeENlNEZZQW13QUhaL3VIdEhUSWRmbDNnQ3RlcFNW?=
 =?utf-8?B?L2FHMEpGNkQ5anJxTXp2aTJBQUkvdHlWKzV0eG50Q3dWVlhIajJ0VklQRUxZ?=
 =?utf-8?B?d2xoNkh1MDY4eUFacXczYVkxc0dveVY1ZVltZHlBTitEUXl1Q21TMEhGRXFh?=
 =?utf-8?B?VkpoQkUyVm94TkVTeklYdFlqZDUwNXAzNWl3ZmY1aEdiWm5RaDY0aWJEOGlv?=
 =?utf-8?B?UUxoWUszemFBOTV2R2Q4UWVxNnpRZ1RNSXVJMDBrcjZ1ci85N0s4UzRzOTgw?=
 =?utf-8?B?RG1RSVhWNWVsWUN2OWl4QUs2QStzM1VKd1BMLy8rMUdDc096VGdGQTB1UG9J?=
 =?utf-8?B?VWdJWlcwUUdCcmVuUDBjMEFjSDRtOTgyQUNSaGxIVm05azBkVFJKME12T3RI?=
 =?utf-8?B?ZU5MRGpwME9qSFdoZ21Oa0pjMytXK29LMFFoUzlBN0NLVWtGQnYxV0JWejZT?=
 =?utf-8?B?dEVKbDIzM004cXBWNmpPRHZ0a2REaGhqbWVzWkVVOFppUVpUUHlCakdNaGN4?=
 =?utf-8?B?TCt3VllPZ2thN00yV2pTUmxMdzFraWhMTXRPcGVqUFdzMVBDdXp6L3JTSFRp?=
 =?utf-8?B?QjB2RDQ2d3ljNDRVVTNyWjZBeFZaQ1J2aGZCMk96RHVacE5CK2QrS0U4N00r?=
 =?utf-8?B?TFl5RG43akhFS3h0YitWRDR1dThVUVpHbXRUYTZOaG9TRDVaNFZSU0NmK3Vo?=
 =?utf-8?B?K1RYcHpUUzVWM2pITzN1dHFLM2pwR0xocVRTOC82NjFnVTZEdkUxWEVId1Rq?=
 =?utf-8?Q?U4aKCpM5AHjjztzycYIzBUEFTMZEv2OE?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bVJ1cjR2bTczQlE1NDkzaTFHbjNnVUt1N0R3c2RRYlpkV3dJRERYR1FmNEIr?=
 =?utf-8?B?VXFtbVFlekpmUGdPL3MzOEJXWUtQRU5mL0ZCZ0cxdC84MjBsQ3BqQkJxeGFs?=
 =?utf-8?B?VmF3YjVjdnZONlpVNFVhNDJpdHNuTnI5SnQySThKSk90aGpnd2tmL2tvc0Ft?=
 =?utf-8?B?aGZBdUlmZFQrQjYrSlozZXFSemNyVW5oalk4SDRSNjBBd2h4RzBBazFIVjEv?=
 =?utf-8?B?Nng1djZ5bkJENjdibUdsR0RMTnlLdlZqQzNKaklrSU14S0ZOY2w4SUpPWXlC?=
 =?utf-8?B?VHp1dVdCYzlUS3ArbTRxOE1ZVVBTbVhhK0JVR2d1MlhUOXgxZlFHaU5YT3Fa?=
 =?utf-8?B?d05zeUNsRXlVbGQxVTBmdTV6UFJxaCtEWmkrWHZQZjVYVnN3VzZHZWlCT3Bo?=
 =?utf-8?B?eFIyQnZzVGozVlVMLzkrTUhPYjVDSUZacUZUaXhxV1hhS1RTamNvYm9uQnVt?=
 =?utf-8?B?SWJlN2wzbmF1TmRsV25SUEdMUzY0VW5oR3pGYVorcXVnaDlFbDc1RGFCNHNU?=
 =?utf-8?B?RVJ1bThwNDQ5MmVXN0swVG03SGYyck93WTgwdDVudE8vM3l6ZkNUUm9EVlU1?=
 =?utf-8?B?WW84VXJOVnR0Q0UxT2hFNWF3NVhRSzlpTDA1VFVMU1VJYUxvMlR6VUNtaTNZ?=
 =?utf-8?B?aFN3OGtoa1pHZGdJZjJia2NlMmpYSkRPblZVekVTZ2JiUGFxK3JCcFlmbzIw?=
 =?utf-8?B?Z05aWFM3UkljV3NWa3E0c2pSUnJCZnBZTmU1UWVzdG9pV3RyQlVBZWp3N0R6?=
 =?utf-8?B?SWVRcFBQTHFuKzNCbXpIYy9zOFFhbjBmZG1XZ25wRkgzL0NsM2pRUHRIZnNq?=
 =?utf-8?B?NlZxQng4a3Q4amhWd09MVmg2S1UveTFmeTdsbVh4YndhcXppMS9iNXgzdnAr?=
 =?utf-8?B?Y3pqb0VOcU1aNmFjQ3ZuZENkRVZxZ0VUVzNJV3h2YTg3cWs4LzBvWWlodk5q?=
 =?utf-8?B?cnJ3QStsWHdkQ05tbjNLSTJrV1NpRW5zT2pVMGI4cDdTU2djMGFtcFpQZk1D?=
 =?utf-8?B?Y2w4RnRhSWpJNGJ5ZUVKVEpCL3BSNjRqZVhCR2Jidkx0cXNlWEVNWHZDZWt2?=
 =?utf-8?B?dGltcVU3cHdBVFd0S1ZrZG5jNThNaFlEWk4zSnJ0SURzWUtRZzZMcHczMnY0?=
 =?utf-8?B?T3UzQ1A5MzBJSVgwZDl1eDFraStYNzNwUWlscVBDcWhIRnZwc1AzeklqLzJ0?=
 =?utf-8?B?NjJHaXY0eXVlMDljWThMczIzWk5RTlVHSGliTnJsdVQ4YkN2L2xDalBHTXF5?=
 =?utf-8?B?Wkw0MHd6ejRVS29uU00zekFIdWFiMW1YdHRYQlVBNlR3aEV6eDlBYmYxYm1x?=
 =?utf-8?B?Q1BMZmJsaXg3VGxhZFZqVTZ0ZWtrMjZpbkJSL1VIYnF2TW9neWVkTHpOOU50?=
 =?utf-8?B?QVFQU3Z2Z1FPaWtIczlrblRaM1YwVHBiQkxSdEZsUnhUUXkxSkthLzhxQXYr?=
 =?utf-8?B?V0VBN3plc2RSbnZqZDdqUnc4TVlmamYxdXczOER0T1p2WlBpMDQvdWdSaHVW?=
 =?utf-8?B?K1QyazRvWWpOdU0xay94N2FxRHN0R2dnemduMm9qeDE5SVJoelFjTUtzSXp3?=
 =?utf-8?B?RzVFbm9NVnAySzkzVFZKYUpPZi9pdGZTMG9zWFRuRGRoSCtVaExNZklINEow?=
 =?utf-8?B?aVpQOXlYTzUycGlDTysrMktudzNIQXhkcE5rZFlTVDF0ZHJWSE5DQWxUdDRK?=
 =?utf-8?B?MEZqaWRkb3VncFBTK3BaUUI4bWxZSkZjeXhOVEI5YjJ3Z2VFRitZMUE3V3pl?=
 =?utf-8?B?eHZRY0UrckRZOHdEcTg0N21WcHNoakNSdngzRnpraFQ2Q0tWVXBuMGRCa3pl?=
 =?utf-8?B?Y1h1RWVIbnRSdzZZdjQ1QS9LMGVRdllOT2NnczVaajhCY2VmeUYvcW9oWElZ?=
 =?utf-8?B?ZVBVZVhVSW50UkhsZkp5TXZiT210aFdCQWNXSy9LMkRmSWo0ekdoUjhJd2Nk?=
 =?utf-8?B?bEt2ekRibmk2RVpESEYxRVdtUS95UFgwVWl1NHArajN1K1JpMTV2VFRFZkhu?=
 =?utf-8?B?Q2JoNFlsTWVFWGV6WTN6L29QT2xQd3BRYWtRUzQ3aWdaSnhRVnNndjRVb05s?=
 =?utf-8?B?Tm84eU9TWHJJWlJrRDQ2eHViYnhJeUk3eTduTUQ2OFEzK3U5blFZdCtLa2I1?=
 =?utf-8?B?bGFrSEJjRXhLMk9wNzlsdlNMb0JsNFN3OGhOMTBiV29JdlhWcnY0UXM4N0NE?=
 =?utf-8?B?dnc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c04d21a-2641-4982-374b-08dd2f1a1072
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2025 12:51:54.8026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: erL1IU7osx1nkynGPXrNEZ1g3f95xMUHhQ6sIsFfukwFgxIaY7inWTVr2RqDTE5j5OkT41H6GWyfXtbrVADB8Jmm2k0sZtuQWxVcMQePIuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14909

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMDcgSmFudWFyeSAy
MDI1IDEyOjUwDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgNC82XSBjbGs6IHJlbmVzYXM6IHJ6
djJoOiBTd2l0Y2ggTVNUT1AgY29uZmlndXJhdGlvbiB0byBwZXItYml0IGJhc2lzDQo+IA0KPiBI
aSBCaWp1LA0KPiANCj4gT24gVHVlLCBKYW4gNywgMjAyNSBhdCAxOjM44oCvUE0gQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IEZyb206IExhZCwgUHJh
Ymhha2FyIDxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gT24gVHVlLCBKYW4gNywNCj4gPiA+
IDIwMjUgYXQgMTI6MjXigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+
IHdyb3RlOg0KPiA+ID4gPiA+IEZyb206IExhZCwgUHJhYmhha2FyIDxwcmFiaGFrYXIuY3Nlbmdn
QGdtYWlsLmNvbT4gT24gVHVlLCBKYW4gNywNCj4gPiA+ID4gPiAyMDI1IGF0IDExOjI04oCvQU0g
QmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+
ID4gRnJvbTogTGFkIFByYWJoYWthcg0KPiA+ID4gPiA+ID4gPiA8cHJhYmhha2FyLm1haGFkZXYt
bGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBTd2l0
Y2ggTVNUT1AgaGFuZGxpbmcgZnJvbSBncm91cC1iYXNlZCB0byBwZXItYml0DQo+ID4gPiA+ID4g
PiA+IGNvbmZpZ3VyYXRpb24gdG8gYWRkcmVzcyBpc3N1ZXMgd2l0aCBzaGFyZWQgZGVwZW5kZW5j
aWVzDQo+ID4gPiA+ID4gPiA+IGJldHdlZW4gbW9kdWxlIGNsb2Nrcy4gSW4gdGhlIGN1cnJlbnQg
Z3JvdXAtYmFzZWQNCj4gPiA+ID4gPiA+ID4gY29uZmlndXJhdGlvbiwgbXVsdGlwbGUgbW9kdWxl
IGNsb2NrcyBtYXkgcmVseSBvbiBhIHNpbmdsZQ0KPiA+ID4gPiA+ID4gPiBNU1RPUCBiaXQuIFdo
ZW4gYm90aCBjbG9ja3MgYXJlIHR1cm5lZCBPTiBhbmQgb25lIGlzDQo+ID4gPiA+ID4gPiA+IHN1
YnNlcXVlbnRseSB0dXJuZWQgT0ZGLCB0aGUgc2hhcmVkIE1TVE9QIGJpdCB3aWxsIHN0aWxsIGJl
DQo+ID4gPiA+ID4gPiA+IHNldCwgd2hpY2ggaXMgaW5jb3JyZWN0IHNpbmNlIHRoZQ0KPiA+ID4g
PiA+IG90aGVyIGRlcGVuZGVudCBtb2R1bGUgY2xvY2sgcmVtYWlucyBPTi4NCj4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiBJIGd1ZXNzIHRoaXMgc3RhdGVtZW50IGlzIGluY29ycmVjdC4gU3RpbGwg
aW4gZ3JvdXAtYmFzZWQsDQo+ID4gPiA+ID4gPiBtc3RvcCBiaXQgaXMgY29udHJvbGxlZCBieSB1
c2FnZQ0KPiA+ID4gPiA+IGNvdW50KHJlZl9jbnQpLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiBJ
dCBpcyB2YWxpZCwgY29uc2lkZXIgYW4gZXhhbXBsZSBzYXkgSVAtQSByZXVpcXJlcyBNU1RPUCBi
aXRzIDgNCj4gPiA+ID4gPiB8IDkNCj4gPiA+ID4gPiB8DQo+ID4gPiA+ID4gMTAgYW5kIGNvbnNp
ZGVyIElQLUIgcmVxdWlyZXMgTVNUT1AgYml0cyAxMCB8IDExIHwgMTIgKG9mIHRoZQ0KPiA+ID4g
PiA+IHNhbWUgTVNUT1AgcmVnaXN0ZXIgc2F5IE1TVE9QMSkuIE5vdyB0aGlzIHdpbGwgYmUgc2Vw
ZXJhdGUNCj4gPiA+ID4gPiBncm91cHMgaGF2aW5nIHNlcGFyYXRlIGNvdW50KHJlZl9jbnQpLiBT
YXkgeW91IHR1cm4gT04gSVAtQQ0KPiA+ID4gPiA+IG1vZHVsZSBjbG9jayBhbmQgY29ycmVzcG9u
ZGluZ2x5IGNsZWFyIHRoZSBNU1RPUCBiaXRzIGFuZA0KPiA+ID4gPiA+IHNpbWlsYXJseSBub3cg
bGV0cyB0dXJuIE9OIG1vZHVsZSBjbG9ja3MgZm9yIElQLUIgYW5kIGNsZWFyIHRoZQ0KPiA+ID4g
PiA+IE1TVE9QIGJpdHMuIE5vdyBsZXQncyBzYXkgeW91IHdhbnQgdG8gdHVybiBPRkYgSVAtQSBz
byB5b3UgdHVybg0KPiA+ID4gPiA+IE9GRiBtb2R1bGUgY2xvY2sgYW5kIHNldCB0aGUgTVNUT1Ag
Yml0cyA4IHwgOSB8IDEwLiBJbiB0aGlzIGNhc2UNCj4gPiA+IHlvdSB3aWxsIG5vdyBzZWUgaXNz
dWVzIHdpdGggSVAtQiBhcyBNU1RPUCBCSVQoMTApIGhhcyBiZWVuIHNldCB3aGVuDQo+ID4gPiB3
ZSB0dXJuZWQgT0ZGIElQLUEgYmxvY2suICBUaGlzIGNhc2UgaXMgaGFuZGxlZCBieSBzd2l0Y2hp
bmcgcmVmY291bnQgb24gcGVyIG1zdG9wIGJpdCBieSB0aGlzDQo+IHBhdGNoLg0KPiA+ID4gPg0K
PiA+ID4gPiBJIGFncmVlLCBEbyB3ZSBoYXZlIHN1Y2ggdXNlIGNhc2U/DQo+ID4gPiA+DQo+ID4g
PiBZZXMsIGZvciBVU0IyLjAgb24gUlovVjJILg0KPiA+DQo+ID4gT0ssIHRoZW4gaXQgbWFrZSBz
ZW5zZSBmb3IgcGVyLWJpdCBjb25maWd1cmF0aW9uLg0KPiA+DQo+ID4gPiA+IENvbnNpZGVyIGFu
b3RoZXIgdXNlIGNhc2UsIGluZGV4IDAsIGJpdCA4fCBpbmRleCAwLCBiaXQ5fCBpbmRleDAsDQo+
ID4gPiA+IGJpdDEwIGFuZCBpbmRleCAwLCBiaXQ4IHwgaW5kZXgxLA0KPiA+ID4gYml0IDAgfCBp
bmRleDEgMTAgaXMgYWRkcmVzc2VkIGluIGN1cnJlbnQgcGF0Y2ggc2VyaWVzPw0KPiA+ID4gPg0K
PiA+ID4gQ2FuIHlvdSBwbGVhc2UgZWxhYm9yYXRlLCB0aGUgYWJvdmUgaXNuJ3QgY2xlYXIgdG8g
bWUuDQo+ID4NCj4gPiBJIGp1c3QgcHJvdmlkZSBhIHJhbmRvbSBleGFtcGxlIGZvciBhIGZ1dHVy
ZSBJUCwgd2hlcmUNCj4gPg0KPiA+IElQX0EgcmVxdWlyZXMgbXN0b3AxIHs4LDksMTB9DQo+ID4g
QW5kDQo+ID4gSVBfQiByZXF1aXJlcyBtc3RvcDEgezh9IGFuZCBtc3RvcDIgezksIDEwfQ0KPiA+
DQo+ID4gTm90ZTogSSBoYXZlbid0IHNlZW4gdGhpcyBzY2VuYXJpbyBpbiBoYXJkd2FyZSBtYW51
YWwuDQo+IA0KPiBUaGF0IGNhc2UgaXMgaW5kZWVkIG5vdCBoYW5kbGVkLCBhbmQgSSBoYWQgYWxy
ZWFkeSBjaGVja2VkIGJlZm9yZSBpdCBpcyBub3QgbmVlZGVkIGZvciB0aGUgY3VycmVudA0KPiBT
b0NzICh1bnRpbCB3ZSBkaXNjb3ZlciBlLmcuIGEgZGVwZW5kZW5jeSBiZXR3ZWVuIGRpZmZlcmVu
dCBHVE0gY2hhbm5lbHMgOy0pICBJZiBpdCBpcyBldmVyIG5lZWRlZCBmb3INCj4gZnV0dXJlIFNv
Q3MsIHRoZSBzeXN0ZW0gaGFzIHRvIGJlIGFkYXB0ZWQuLi4NCg0KSSBhZ3JlZS4NCg0KQ2hlZXJz
LA0KQmlqdQ0K

