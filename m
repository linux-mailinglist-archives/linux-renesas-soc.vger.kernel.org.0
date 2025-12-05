Return-Path: <linux-renesas-soc+bounces-25597-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 214B9CA7219
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Dec 2025 11:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0FD73129CC5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Dec 2025 10:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B2E748F;
	Fri,  5 Dec 2025 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Mw584tCW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C1A1DB54C;
	Fri,  5 Dec 2025 10:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764929881; cv=fail; b=Pd+uvTRmFki6/mgkVpisvyIZw0zXi5SkNwf3+zEBUWMGLLrFSxfl+p8N9pQuOLo25bdze82qqXChLW4uSDER5ZMfWB2LrVffBGApMY3KCRdIdrN5sNfaNzbprNJoMKjQp+w6Ja82Umw+AEcaVsp19mntd4mWykgINhV4MsBhJoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764929881; c=relaxed/simple;
	bh=Dxcr+JnrvFjrgQltLXiMuVxSj0dWoaOEyUWexK69z1s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fAD2PvCcooEwfABKdZC35ovvg3Z4CRbifvTQSGs/Xz3Cq5bYOnJARYiMhnhctqPhpj3k4AaJpTikDT4H+I9y7RDbbiTNz4W7nALS7xvYhoI2posJ9K+qGWUXPn9n0aAtJmu+BcBS/73Ty0AKo8hiqvj/PHg5iu/uDizYWPNJyjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Mw584tCW; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0nymKpur97hnzNWuIgm+gG6nyifGLhhaSjp78i/KlNMR0r0kxWAv8JXqhHeGytEZhuO0wOHu/8vT2NhQSIg8Q53/3tSDYPIQ/ZnDW0CxyOHBJE3vMV9ZW34OREL4ScrAkkudhe1vg0cOMMFZwLPzLUMJbFvW4moqGnlSisdjJxsTeAs0ThGGUZ0RDVNdmvSqvbMFnAqnoCklPY2I31M90qBwahjmu07Vc1EVTOaXiKXTyIk72aZJcOOLIhEy6cRyneCKQggBPaO5G40xEkx7GvE9ly0Rv7K7reEnC4HkL/N3JK+xikMwh1AliXQ+YoLFGb9KzR/Tt53BCvclYvI6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dxcr+JnrvFjrgQltLXiMuVxSj0dWoaOEyUWexK69z1s=;
 b=D3ThNbGRabk1lNrqG4wqu8wYYyewVMsWg53KChkAV3SMrF8y80OZJKSlZcYtEUNuQxSqbH65OT49j2vNh2pcrjPJO48ZHJtHZxwAgCf2ELoUp31crd3lw/i2kfb2JFJhW6+bT7g+Zg+Wa04a7t8Q4fJ05LuU0XUfmvRacn6Zndarpbu6YUJ5GZtahfWiqrNZ1OB6z98whXYctmMDtvQFm2LiMwLqUmECV01WCo47jPhUg3AzmagZgTuqi3nOSFKEWQT/Lba4ZOfFy4+GWALU7eR+k6R2z82/xhPTS7qaWehxhlClpy9TUqMBp4c48u+Ij/RYKkagsoKGEZ/tx5Y4iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dxcr+JnrvFjrgQltLXiMuVxSj0dWoaOEyUWexK69z1s=;
 b=Mw584tCWtz4gpvtlwObedodYiijMkhLfBjb0UZhk82h0k3gSYK0LSY2lBNxkKOUelrgGFIodFrLvqrm2fBghP8XbVuLU8n2MpRi4GPIJR1btwIZWasXros14DgAUwOfX0hQTK1+pYYwHl5dYShuOt1pP261OveSknnj6E774pX4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB8297.jpnprd01.prod.outlook.com (2603:1096:400:166::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.3; Fri, 5 Dec
 2025 10:17:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 10:17:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Topic: [PATCH v2 0/2] reset: rzg2l-usbphy-ctrl: Add suspend to RAM
 support
Thread-Index: AQHcUkXayA+E33hY1EmsX/GuWX+dybUR8j8AgADxDfCAABPzgIAAA2hg
Date: Fri, 5 Dec 2025 10:17:45 +0000
Message-ID:
 <TY3PR01MB11346625CD598704CC36C63AE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251110132715.724084-1-claudiu.beznea.uj@bp.renesas.com>
 <19fda177-6c11-45d6-9dab-3f75edceda4e@tuxon.dev>
 <TY3PR01MB11346F5E49BF172AE78C55EAE86A7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
In-Reply-To: <50937606-46fd-4202-ad4b-9ede5bff76fc@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB8297:EE_
x-ms-office365-filtering-correlation-id: f5828079-8907-49ff-43a0-08de33e788e2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZVZzcUlHOS8zNlQwY2k3bHdKRDMwWTJnM0ZQRS9aZXNJdWNhNEVBOHhxRWpi?=
 =?utf-8?B?dUJrYVZHTGxJa2ZkOE1nT3YzM3YwWE1CTGs4QmFwcnJOYzcvbVdhRGZaSVZl?=
 =?utf-8?B?dGJhM0tBRlNlangyRkhOMVZud0hzUFJoeUQ5ak9rN3lSSmd2dnhEb0NHbEtU?=
 =?utf-8?B?ODd5cXRWRFFDZXhFaFMrSENqa3I3dXVjWkx4WE9VL0s2blgzM1VPUVQ3T1VS?=
 =?utf-8?B?TGZMZjUxUjU2OE9BZTZ3VjRkSVhXYlNFL0lJYkhMUVpqb0ltOU5Zb2FWYTlN?=
 =?utf-8?B?N3NEbU43SHZxa3Z0cUd2VHNTbk9yVWFxNE4yTUNEbE5ES2F1OWFKbmFLOW5C?=
 =?utf-8?B?QjZwbE1uSEVQUEVna01YV0Irb0wzYm5NRytjano4UElhTmlFN0N5NktGN0JK?=
 =?utf-8?B?TXpvWm9RcHpwWkxwaldRVlJJaTEwR1VYRXlxcHA3QzUveWoyanBPWldqVHdx?=
 =?utf-8?B?c0xTTVljdjIwU01yQWRJYUpCS3dsSUZSajgyZzQxRk43dm4zNHZSYk1FUXFP?=
 =?utf-8?B?VUw0TWQ4TE15eDNmK0Z0QlJyWXAwcFZGc09RVGtkM0h3TVBYcHc2SDRxZkFE?=
 =?utf-8?B?dU5vZnQ2eElWS0RwdUZrK09pTnFiQnhLbk9lSVpCRGlHdi9aV1NuRG5zVVZo?=
 =?utf-8?B?RmZ6dXNOS2pUK1kwTmhQTFhZWURsODZyQ1o4a2lNOHhmUHBWS25WNS9RL3dI?=
 =?utf-8?B?NGM0WGdiVkxSc1UzQ0Nsc0dpWm5Hc2h2KzdUcy92dHIyZ2FlbnhYakJidTF2?=
 =?utf-8?B?R0dCVitkUlF0SEFDWUhuUHBYL0FoRW1qUmJ0NWtEWUgySjdmY1FrbG90dG11?=
 =?utf-8?B?MWg3ZSttMkhzS2VHYkRBTXpBNVFkWFliTG9xcE5CaDd4eE5KOTU5aEJIUmNC?=
 =?utf-8?B?Y3hVekVWK29ZN3YzZkFLY0trQjhsQUI4ZzY5UXA3UUMxQnNFSUFoODlEd3ZH?=
 =?utf-8?B?eWthRWZNeEFuRmY5RTZHeDVqcm40RmdZVWIvLzBRbHdGZnI2ZERrY09ScHJB?=
 =?utf-8?B?bDlsczhJbzg1Y1R2WWxRRVdsSnpnZmVadWlGY3lZbm5YeXFONGo1Z3dOc3h2?=
 =?utf-8?B?Mm1LbGY5N2c1Y2dMdVhaS0QzaFhTTjVHcVdDZVBpdVZtY1Bad1BLb0liVnp5?=
 =?utf-8?B?ZjhhVjRGc3EwYzdzYnE3UXoyc3JpQllwV1doMTNkV2tXeUVsdCtHVGpoMjBr?=
 =?utf-8?B?ck5MNXJONXdZYWdndzJOeDhybytzbVhzNnI3T21ML2pTVXBUYXBmZnpuSEJl?=
 =?utf-8?B?YkdxMkxYdnViWWsyTkp2cy9BaW9CTXdZbUI4amFpNUZJbnJjejJUSFViNlYv?=
 =?utf-8?B?TlFRb1pvbEYrTzR0elZmMklNNFFxdWt5dGIxRXJLOFpDY0s3Sk9tQ0NWNUkr?=
 =?utf-8?B?VmhubFJOVFptaElZaFFmWlNqaFJNbmIvRmVCaExlVHg3R0VxVlJVdm8zNmU4?=
 =?utf-8?B?dVZ3RUsrOHQ2d3pwQlZtbDRIK0VVRDZGUVlQVnZ2TzFJSThXdWpRcUwvU3Nq?=
 =?utf-8?B?WGV6OHFMd1FOQll1ZTFTcW5nZzFDZktsakNrSDBGT25kelRUQWRjNzlmenBN?=
 =?utf-8?B?RmNwbFkzaXBCWTcwcy85ZGV6NlRnYTRGL1AwZHJCZXhERmc5bjNxTGRPSStn?=
 =?utf-8?B?QXhTbzFpTHBmR00zRVNuakFqVkZEOWZsK25xbHJwME9PcmpIRUxHV0JuQjhz?=
 =?utf-8?B?Qld2d1pnUUp5WGl3M3JTc05pelRmV2VZbmdtYkcrWXhaWUY0S2I2YzhZZTR3?=
 =?utf-8?B?QkdTbExzNjRjTENhNHJQWDAzVWdoR0lUUkRSNmdycnRpc0RsMGtzQTk1SUJo?=
 =?utf-8?B?NlFVOVJUS2hHeWdxSFhNTzJSZkNKOVJOUzVwd1hJOHBtYjJLaE1nTm11b3Jo?=
 =?utf-8?B?U3Jwc2pFTmtCWXJGZ2RCVGp1cWp0QnhTSlk1aG9xNFpta1ByUHVWa29hbFhK?=
 =?utf-8?B?Zm90M016OVQveTZSL3FoL1RDZWRlMjFkK3lZMjdmUHY5cTVvcEZiQ2FHSTZ5?=
 =?utf-8?B?VUpMdUVFbXAyYk16V0hydXlDU2Y0T29YZndqWDU0aTNDbEFPcEFiZlpHU1Ux?=
 =?utf-8?Q?CyszBQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHlTNVlSTzl6UVRWRFJLQVdjOUIyTXpVWkVER3lpUEd2bkExSjA1MEMwdVV1?=
 =?utf-8?B?aHZCcU5nUkRTY2E0WXh4MGhveFdsZkNsZW9wMmxTOCtnNk03bWFWWWZzazJN?=
 =?utf-8?B?bGtZRE9XNW1UQmZNRStmNWpnZmgwekQxNVI0Q3FrbkZMN0Q1aEVnajFNL1R5?=
 =?utf-8?B?OXYzK0tYTXdmMlpsTG5pNllUaVo3eXE5aUs0TmVPNHpoQkhaeG9UZmM4bnp1?=
 =?utf-8?B?MWd0RGdST0FiaFZHelpHREp6NHVCUHdWdGJyN1NxeGhMa0xnaVNtRHNydnJw?=
 =?utf-8?B?MmdPenc1dWkvU09DaklRdlhKNHNCTTkxaHkwMm9FbnBhYjJNWkhvMXA5RnRk?=
 =?utf-8?B?eTMvQmk5QkxkM3FsdlFOVm5PZTZUbnZIRFQ1bm1JUlFqVHd3ZFRGR3BMQVF1?=
 =?utf-8?B?b215SkFoanJ2aUh4Y3NGcVF5eXdoYTlOelVjbGhTVVl0ci9SanN0K2ZKK0Ri?=
 =?utf-8?B?Y2RFZEZMWUphMXFFS0x1elA3SmduM2hPbEJBQWlpMktiUlMrU3FNSnNWa0ov?=
 =?utf-8?B?VkpiNWNtb1plM0dqR1BRQ09rRmNBcTNnbjFEeHR2VFNRMjZDY1hYRkUvejBC?=
 =?utf-8?B?NEw5L2taaFdCNWRNNTBLRWtSd2JhRSt1SnYwd1BwMnp5TUc4RTMwNFY3dmZX?=
 =?utf-8?B?OHh6clVCQXlOZWlPaUJtejl2QjQzOTFyWDlPUk4xSE04Zk5tR3hLU0dMY3Jq?=
 =?utf-8?B?N3I0OXBnMXlCRFdiMWhNMWlOTWwvbHRjNnV5NUEzM3BWVGRvTkVTVmRZTitw?=
 =?utf-8?B?aWNDemlvQXZDNHc3Qkt4a0lGV0NzN1c5MXQrVkdtN1RqblNzR3ZaQThnaVJt?=
 =?utf-8?B?WE1Md2pDRUczWERDaWk2RHRqSytoa3hKbmtYc2VhR1B1eStubFZNdmViWU5O?=
 =?utf-8?B?SGdROVlnWXFSSXVuVytEZXhBcXJmd1p6S3M0SklGNk4zNStNNDBVZURNVGpE?=
 =?utf-8?B?MmpMZmdkckNaK0dQN3A3em9JalpkdkJyOXpmcXhDZ0ZxT3hFWUpjeWhTUlpm?=
 =?utf-8?B?ZHY2ejBqVU9LUXA0cXc0cXMvZ243ZWp0enBCWFl1dHRXNlVBZUhGMTlxSzdv?=
 =?utf-8?B?ZjdZQUJLOE8xcWpqMUFxL1FrcjRoWnlSbUlZOGZYUURsMWQ5MUtXMDAvdFlq?=
 =?utf-8?B?STBwMDVYWUVoeEVhNkxnc0JTSEpwMmdwZ2ZIY3BQMExianU0ZWFWSmxINXhB?=
 =?utf-8?B?SVhPNVFaaFl3UTBaSGQ1SUNpK2RyNE40My9YSGRINWk3RUhQNTRJc1dqTWdq?=
 =?utf-8?B?VmZOdjhobURsMHhCTEtGM1pDRjJtUEEzcVAwK2hJcnNyeHpmVXBRdWxGWFRV?=
 =?utf-8?B?VGJTcHpzSEgrRm9YUVZwait4UHFicDBneFhRUnFFbjhQSHJlN0ROZzBmQndB?=
 =?utf-8?B?R0Ryb2dSNTJLa1BkK3ptQXBiMXFnRHlyRmQ3SCt0MnRmTDFMMGVKTWJBZXhi?=
 =?utf-8?B?ZXN4U0JnVklseTVVeWZ6NVozUHZNMXc2bVltWmJDTXRoRjE3NWxuTHNRM0FE?=
 =?utf-8?B?Nlg2RzhJeXBoUzA5NTZpaGFwTmtZTm5pL2FJMHJ6QkZxbFlSVDg0d3czUnVG?=
 =?utf-8?B?Rjc4clJPM0hEWHhOSlV0OGRaQ1E2TUxld2tSd3gwckdRcThtOWlmbGdIeGxP?=
 =?utf-8?B?L29ZaHNmekRZRVlXdHkvdmh4WE1zM1BoaytlSGZiRVp2UXhRelpJYWtyZVpO?=
 =?utf-8?B?VUZ0WDRoUkozbkJoSEZTVHZTSmV2L092OWRwZnJES1Q3QXAwcDRRSVExQitN?=
 =?utf-8?B?NnFxWlZkdjNYRDBLWjJQOHd1bGJ3UDF5SVVPVHl3R3dhMlVFQVVHVUg5KzdH?=
 =?utf-8?B?UExiVld2cUdyYUxwcnI2c2dJMGZQSExEUW1EcVRLRVR5YUhRNDdpTzZCaUZP?=
 =?utf-8?B?U2owWUZhU2VPblB4RlZaWVRIYzRzaDlZQTRlSWJpSEE2RVRRRTh3N1NDcnBG?=
 =?utf-8?B?UFl4cFRkeWFaUVZjOE5OMFREcWUxdGcyZW5tL3VvMFJ0ckpUWFMzYUwwZHRF?=
 =?utf-8?B?dTFRekZ3NldRQ3Jxd0N4ZWJ2US9yODY3QitBOEpFUzQxbE1nKzRveS9wUW9o?=
 =?utf-8?B?MXZWKzgwaUdYbUpKRHQxalVRbXgrOE85T0k4aEx2Zm1MUXJTMEdJVjcxeUNy?=
 =?utf-8?B?b0wveUc2WEZvbzl6ekZxSnFOQWpZaXhtQmJRWVJ4UVBTTTZod3laUmRTOHhT?=
 =?utf-8?B?ZXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f5828079-8907-49ff-43a0-08de33e788e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 10:17:45.9731
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lB7s3xVkmgMh1hY228RTI0hXHfl+c1BDeD7UPtDBw/DMbR32M2L/Cu5EzCKX96zB5HqYmK4E6WHewk5z5SeuwgZIh1FcxlkFTrTUKtY80mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8297

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2xhdWRpdSBCZXpuZWEg
PGNsYXVkaXUuYmV6bmVhQHR1eG9uLmRldj4NCj4gU2VudDogMDUgRGVjZW1iZXIgMjAyNSAxMDow
MA0KPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPjsgcC56YWJlbEBw
ZW5ndXRyb25peC5kZQ0KPiBDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgt
cmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOyBDbGF1ZGl1IEJlem5lYQ0KPiA8Y2xhdWRpdS5i
ZXpuZWEudWpAYnAucmVuZXNhcy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC8yXSBy
ZXNldDogcnpnMmwtdXNicGh5LWN0cmw6IEFkZCBzdXNwZW5kIHRvIFJBTSBzdXBwb3J0DQo+IA0K
PiBIaSwgQmlqdSwNCj4gDQo+IE9uIDEyLzUvMjUgMTA6NTMsIEJpanUgRGFzIHdyb3RlOg0KPiA+
DQo+ID4NCj4gPiBIaSBDbGF1ZGl1LA0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+ID4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+
DQo+ID4+IFNlbnQ6IDA0IERlY2VtYmVyIDIwMjUgMTg6MjYNCj4gPj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAwLzJdIHJlc2V0OiByemcybC11c2JwaHktY3RybDogQWRkIHN1c3BlbmQgdG8NCj4g
Pj4gUkFNIHN1cHBvcnQNCj4gPj4NCj4gPj4gSGksIFBoaWxpcHAsDQo+ID4+DQo+ID4+IENvdWxk
IHlvdSBwbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUncyBhbnl0aGluZyBJIHNob3VsZCBkbyBm
b3IgdGhpcyBzZXJpZXM/DQo+ID4NCj4gPiBJZiByemcybF91c2JwaHlfY3RybF9zdXNwZW5kKCkg
ZmFpbHMsIFdoYXQgaXMgdGhlIHByb2JhYmlsaXR5IHRoYXQgaXQNCj4gPiB3aWxsIHN1c3BlbmQg
YWdhaW4gd2l0aG91dCBhbnkgaXNzdWUNCj4gDQo+IEhvdyBjYW4gSSBtZWFzdXJlIHRoaXM/DQo+
IA0KPiBUaGUgaWRlYSB3aXRoIHRoaXMgY29kZSB3YXMgdGhlIGZvbGxvd2luZzogaWYgYW55IGlu
c3RydWN0aW9uIG9mIHN1c3BlbmQgZmFpbHMsIHRoZSBzdXNwZW5kIGlzDQo+IGFib3J0ZWQsIHRo
dXMgY29kZSBpbiByemcybF91c2JwaHlfY3RybF9zdXNwZW5kKCkgaXMgdHJ5aW5nIHRvIHJlc3Rv
cmUgdGhlIHJ1bnRpbWUgc3RhdGUgb2YgdGhlIEhXIHNvDQo+IHRoYXQgbm8gcnVudGltZSB1c2Vy
cyBvZiBpdCB0byBiZSBhZmZlY3RlZC4gVGhpcyBpcyBhbHNvIGhvdyBjb3JlIHN1c3BlbmQgY29k
ZSBpcyBkb2luZywgZS5nLg0KPiBzdXNwZW5kX2RldmljZXNfYW5kX2VudGVyKCkuDQoNClRoZSBl
bnRpcmUgc3lzdGVtIHN1c3BlbmQgaXMgYWJvcnRlZC4gU2VlIHRoZSBjYXNlIDIgaW4gbG9nc1sx
XSBhbmQgc3lzdGVtIGtlZXBzIGRyYWluaW5nIHRoZSBwb3dlci4NCg0KQWdhaW4sIGlmIHN5c3Rl
bSB0cmllcyB0byBkbyBzaHV0IGRvd24gdGhlIHNhbWUgZGV2aWNlIHdpbGwgZmFpbCBhZ2FpbiBp
biBzaW1pbGFyIHdheSBhbmQgDQpUaGUgc3lzdGVtIHdpbGwgbmV2ZXIgZW50ZXIgaW50byBzdXNw
ZW5kIHN0YXRlLg0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1RZM1BSMDFNQjEx
MzQ2QTdCMTZDQjMyNjdGMUE1NzMwMkI4NkRCQUBUWTNQUjAxTUIxMTM0Ni5qcG5wcmQwMS5wcm9k
Lm91dGxvb2suY29tLw0KDQoNCg0KPiANCj4gPiBhcyBjdXJyZW50bHkgd2UgYWJvcnQgc3lzdGVt
IHN1c3BlbmQNCj4gPiBhbmQgZW5hYmxlIGNsb2Nrcy9kZWFzc2VydCByZXNldCB3aGljaCBrZWVw
IGRyYWluaW5nIHRoZSBwb3dlci4NCj4gVGhlIGNvZGUgaXMgcmVzdG9yaW5nIHRoZSBjbG9ja3Mg
YW5kIHJlc2V0cyB0byB0aGVpciBwcmV2aW91cyBydW50aW1lIHN0YXRlIHNvIHRoYXQgYW55IHVz
ZXJzIG9mIGl0IHRvDQo+IG5vdCBiZSBhZmZlY3RlZC4gTGF0ZXIsIGF0IHJ1bnRpbWUsIGlmIGFu
eSBwb3dlciBuZWVkcyB0byBiZSBzYXZlZCB0aGUgcnVudGltZSBQTSBmcmFtZXdvcmsgd2lsbCBk
bw0KPiBpdHMgam9iLg0KDQpUaGUgc3lzdGVtIGlzIGVudGVycyBpbnRvIHN1c3BlbmQgc3RhdGUg
Zm9yIHNhdmluZyBwb3dlci4gTm90IHRvIGNvbnN1bWUgYmVjYXVzZSBvZiBmYWlsdXJlLg0KT3Vy
IFNvQ3Mgd2lsbCBwb3dlciBkb3duIGR1cmluZyBzdXNwZW5kIGFuZCBkZXZpY2UgcmVzZXQgd2ls
bCBoYXBwZW4gZHVyaW5nIHdha2V1cA0KU28gZXZlcnl0aGluZyB3aWxsIHdvcmsgYXMgdXN1YWwg
aWYgdGhlcmUgaXMgZGV2aWNlIHNwZWNpZmljIGZhaWx1cmVzIGR1cmluZyBzdXNwZW5kLg0KU2Vl
IGNhc2UgMyBpbiBsb2dzWzFdDQoNCkNoZWVycywNCkJpanUNCg==

