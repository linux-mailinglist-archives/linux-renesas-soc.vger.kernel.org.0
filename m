Return-Path: <linux-renesas-soc+bounces-33806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4t28AHM0KWpjSQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 11:54:59 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8811E6680AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 11:54:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=renesas.com header.s=selector1 header.b=jP6wgsJs;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D69E330D2EC9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D687A3BE645;
	Wed, 10 Jun 2026 09:49:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011063.outbound.protection.outlook.com [52.101.125.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00BB3E44EB;
	Wed, 10 Jun 2026 09:49:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781084976; cv=fail; b=X+nXhiJRPyi3zGdXrGG7S3w6HxqegO5KAi5K+V7qhAdFiTmY1LGFmoBx5sg1a8pfqS055y7PTo83/h+qqXPep3GcKIhiNYQPbvLixG6jii0MkGhveYmQQbv4pbJz/BFYxw2pMf25dZCJabf4RjnHKOHgwUO3i9W+5KGHDZy741w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781084976; c=relaxed/simple;
	bh=zesTToswfYfZR+cJD+iinnvP/G1wAxJ79k6r7S9tA88=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AwsD6F2g6TzbnfGC8IlRxvP4Zi0ejnz2ybrtO1terhpV9lUxiphLBP7XAWbdkxKIDnQ/TPmTdBXJk1yr7CQ09CDTrJvXLLyKOUBSy/TJIDuGkWujH1KqvAHCQGCXYh+OoCCcZYOGTjMF2GKF7v9CB+IO2BrYws+2jhYaeXjVaZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jP6wgsJs; arc=fail smtp.client-ip=52.101.125.63
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HvFHIYDw+45l1KGkspG9rCRZkDrc43Dua8hMKfRHSfTcxZuSlXJaVCajHS3ZVBGScAHDN3MKB/zCXq+XlYHblk3SRMRqVgDDRDbWNSM5p46eDExiSONkLb+pnY6FmpccWhh5o0M+YTL7LOFjVZ/pyGTBMYi80eszj1Jcwe1fgUWbIFvmN1W3G52qpYgeUk4ytVLNuJ8QiUdtJGYD3PKcrorLui1XKyv/bIbV+ffQzsOkuK2opyiCkogTTGO0uAuufmCmYvvvSREYlCOegrUmwFpzv0JmADa9d+FVcE6rPiXnnATZ1tSbiSlnMNTAD8KR/EJu2oybgiuZUS/wDUJLEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zesTToswfYfZR+cJD+iinnvP/G1wAxJ79k6r7S9tA88=;
 b=a1ZRXKJ8UPW4xo2J5HRxTyaocM2MRmuLvZS1VGji9of678JTb3Z6PKwLHZ8pHBERw99z2OiPJx7ET9N/VJwYB/nm4hfM4HWsbrSLnW0hKKPdxA1RAJzhEhqNg4jY90ZRLDfnbHFYmkC7UUsnE2M/wEg5ykzYKrQ6jkSwB7JGfGstSG/cFnbhiVRRXY264KCbUb3ypdS4IQxAsaKtnRzKCLouWyolL33/vVVCrt5eATAMXGFix7gLYUU1QODBsrrzeBmLEWcaVhEUII34kVS90pHzrXkNKskKQKeeAXqG89cf0CDQakCs82m6xa9pACbXbfhHOh8kAN6qD5nS+HQ1yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zesTToswfYfZR+cJD+iinnvP/G1wAxJ79k6r7S9tA88=;
 b=jP6wgsJsbVI/LLK/yK96/Vcbv8UJQw4CBGdZr7N5RjLyRBUTrN5IQ4VRbx3YDwMdPwzRnUr5Bj2Dxsrlr1tPcxlV3oaj+HoiTZOivxHaBsUKe/x6p5qZ4XfyFjk1HMq8CMv0OQaaKlelp0xYBZpaHJUxIIANNKkVKDVQo2lmqbM=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYYPR01MB12581.jpnprd01.prod.outlook.com (2603:1096:405:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 09:49:29 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 09:49:29 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Felix Gu <ustc.gu@gmail.com>, Mark Brown <broonie@kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] spi: rzv2h-rspi: fix incorrect readl() accessor for 8-bit
 RX path
Thread-Topic: [PATCH] spi: rzv2h-rspi: fix incorrect readl() accessor for
 8-bit RX path
Thread-Index:
 AQHc9P7Eab5Y7kkD5UeXXTy9jf9gGLY0Tm0AgAH8IQCAAAP9gIAAaiewgAC5wYCAACA/UA==
Date: Wed, 10 Jun 2026 09:49:29 +0000
Message-ID:
 <TYCPR01MB1209380EC9615D0D080183A95C21A2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260605-rzv2h-rspi-v1-1-c1d5ed562249@gmail.com>
 <CAMuHMdVEYciUYq6savTuOqDUQp6AqHGkeP30s6Z7PoZ3q-Pqvg@mail.gmail.com>
 <CAN4SLj0o+3Bjq0aBJUYbKU-YkXUeM9aPgRxiwmOHX_Fz-_Hq+A@mail.gmail.com>
 <CAMuHMdVX4ZJkXe1if=iHu5dt=Xtka=C9y8hxKYKc_7=bysycog@mail.gmail.com>
 <TYCPR01MB12093C33B2C33D80117F79D96C21D2@TYCPR01MB12093.jpnprd01.prod.outlook.com>
 <CAMuHMdUvY2iVM=sRq5+qFm1N4ksWsEMW3kFy1pLFeUbM6zsqsg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUvY2iVM=sRq5+qFm1N4ksWsEMW3kFy1pLFeUbM6zsqsg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYYPR01MB12581:EE_
x-ms-office365-filtering-correlation-id: 7949c017-95d3-414f-dd54-08dec6d590be
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|22082099003|18002099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info:
 watvniBEz7rDBy9BRccybMrKEtWs8EebgI/cy8lCk35IsvAaXvvvuuhnR9brm429plf8gm8N4H2iFH62pU0DMMyxa/Kov7UKYiKAVSxHWIwAGvz5/eSUN5hCrCgzaNS2W7Fcjd08IQSx9ncwcNX7S8c3xn6HLo/zLotNQWnsDWUVevTJX7DY0C9kVAOAhC1lpSuHTKf7w2tJKA8agtbLfrBYrPLIu3suYQX30CmodFkm3+wEqS+aYK6zzMPdxZvaxCdAVWms1uDlR9HF/uY7YIib1BVYpkTVZAGtl/UHbTmXzST3rMKYHNDnA9w0PSidV8BNsdAT3MeHvjP/A0Tgx5MF/Qlyiyy/IFTkBSpMqPb8bkdGkbooAM56B3riGzlb7REBSlOiuspZTkUIyaXYl4two4LW1j/egnWoJYfU6Y9v1rCaODKhXOH2StpQe9gCmT/tTPyOMcDUFynEAzVmgsRCmgykNYr0VXS5Fd7eLWYKDL1cPzzHYpBdByuZk37CQ7JAsM4R/NB0Sk4oximbbaLuP2SaRpQaOpIvgxYoXIC42QNhHHFjxyrC+R4oF+fX0wrQmn7nkEUprq3+Y8+TSCWke4VCHqw4kiBq940bDmy2Ozw56OKdAfq7aQRhpdwONZ2WBZ9hH0CkyRs88CN254iDL9JGa0bSTR5l/tU2qnN+SDLzQZM32nSWL+bm5i0Z5YqAPCfx/BQCyicmECNkkHO35jtdwtnMGxj0LcncrZnV4RA7pEcSE8ZkxWqLwLM7
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U2RtR0IwVWM0b2tiWW9XVWVKZWQzS1JDaVN3M091MFltVDVsYU9GSWc4SjZp?=
 =?utf-8?B?aXl1c2kxR1BWWjhETk9ud0k4V0dDaGdZQUlvc2hCMlVDUXM1WDJoT0ZHL2Rv?=
 =?utf-8?B?b21MV2xiVWdxcG9NL0tBcWVIVWdrTFNzN1NOR1VUUE0rR0VpUjBRTjZ5aVpV?=
 =?utf-8?B?d0ZXY1lxbTk2Zk93MGpsV0ZFdFVvc2N1aXE3M0tCNjZUUGgwM2ptcHQvY1RO?=
 =?utf-8?B?bmp0V0RwR2JWRFFMeVNhbGpmYU1BWUc0MkQ4U3BLRHFjdU42ZG5FVHplY2ta?=
 =?utf-8?B?eE9WQWRYbUNOVW5Qd1RNWlFrRlFhdk5NcDRRdkdjUkR3eFU2TDN0LzVFc0hF?=
 =?utf-8?B?ck13L09Bcy9WYmdFS3lxTVQzNHovaUh2MVAwOW1YYzR5L2pyWGU4KzNNcHVC?=
 =?utf-8?B?ZWl0RUxVR2VJL1Y2VlBONDlTTExPVncrb29oQjdGNE9yOFEwYkZZQnRrdW1n?=
 =?utf-8?B?eFl3elNMMFhrQ2F4UUQ2RW9nNVZaWnJQak5oby9lZUM3cGZFdVdUalFRMVRu?=
 =?utf-8?B?Y3ZDNjZNUVU4UTJIajZmTWUxTXlWN2l6SzExMGp6NG1TYmk3TXA1S0dTMHd0?=
 =?utf-8?B?dXZZc3B5bjIxczVuNFBhYVA3L2VYSHk0VWlZNVVwMVE2c2lSWmVGWjlONVNQ?=
 =?utf-8?B?WUsyZ0pjSDMzZW1iU1dKSnpOWWllL1JrWkRqUzIzV3VqbnYwNStXeEVFS2lX?=
 =?utf-8?B?bWZzNW1XN0pOS1BIWXNXNlhjdmRqd3R0cWhKZm12YkR6WDM5ZW54R0YzSDEy?=
 =?utf-8?B?RUZFVkhqRTFSeTBmUGNvVFkzZG9HRHkvV2VsNFZFNjFFbmEzSE9DcEhNR0E2?=
 =?utf-8?B?RmUvSzhoNk9SUktFbCtTVDZ5SGFRL2lVbC94V2s2TmZxWjVXcHdDeFBiekIw?=
 =?utf-8?B?NUNpQTZydmV1NU1uNzhKV3dBUFBiTVg4YUlOM1NqalNhMnJBQlUzaXFuVjYr?=
 =?utf-8?B?dUg2SFlBaGhGTTRiWFU3ZnJ4T3ROeXorMDJyOVJBZFlwdDJ3RWM4UWhEcTRv?=
 =?utf-8?B?cHk4Um9vZjhmUGtHWHErc3hrOHVzdVRWK002azhvYXg2ZEcwTWhUZUJzY2Zi?=
 =?utf-8?B?N0RnYWV6UHdTWWNBZ3ZzMFc4SkRQWU9kRkJuY0VhVm9RRmVHUXBTYXhtUUxT?=
 =?utf-8?B?U3B2VzFaWlgrZDdnMEhtdDJhTXFpS0NhRThzYUY0L1NxbzJ4VXlKVU8yYUVl?=
 =?utf-8?B?enZOTlFqZnp3R2RmcU5pVC94U3ZQWGdPVktBNVk0ZkhnVHhOL0VXbnFvN21L?=
 =?utf-8?B?TWkzZG5nVkFXZnFpQTBZMUhqQ01XdnEwN3JVMUY5c0pqS2JEVzNOWlgxdkhM?=
 =?utf-8?B?enRUWDlEdTIraks2SG5VNWwxaG9IbjA4eEszNVdXdktLTkdnTGVTSklzelNp?=
 =?utf-8?B?NmVraHFQYjlHMWpRMlFpOFN0S3ZycE1kQXlQWkd5ZHVMaytOS0VZaVRQSEd2?=
 =?utf-8?B?OXQ5ZDAwZnBBOGI3Y2pNSWNNVDhwNXdyVDFVTG1LZUNEWUV5Ry9FL0hzYnVN?=
 =?utf-8?B?UkU5UnArTDBmbExNUk1JNjhodDZjMklNbDZ3R215ajFIOGUvdklYck9xcnUw?=
 =?utf-8?B?bEdHVkZ1bkI5ZHVyMFIzdGg0bWVyNVdQRWNlWWo4NDhYM0RVOVphakY1S2Ny?=
 =?utf-8?B?bEpLK1lMYXJHSzB2SzNBSkdBMmJxYnpuUks2bFZBQXAzRVdKZHducUxlRVgr?=
 =?utf-8?B?QzByRTlpV1AwYURJeVVqNzV5a2xSN2lhSDFORTlsbjZOMWFxT0tYeVVKOG8z?=
 =?utf-8?B?NWR5UjVCRUV3R2NWdEpqTERicjduWDcvTlA3aHVKSVhoWkltSDJiTTdIdlBu?=
 =?utf-8?B?NzhiSCtxRjJJZisyMjV4Umx5MzVFZTRaWVlTdzM1SWI3S05zcWp4UmZ3THdt?=
 =?utf-8?B?ckJNdHB4cVdnOUNoZThyT2w2Q0tZZ3JoT2hsRVEwc2I5YnZ4L1pSK1JnRWdW?=
 =?utf-8?B?V1R2VnNrdzZrdUUxbzRsQ1ZiNnBkU29VZEthR0pIMStSQ2dTZENOdnJWRWtk?=
 =?utf-8?B?N2lyaUpVNUpCY0ZwNUN6eG0xMHAxWHcrNUVmSE9tdE8zVk9RMFllNUhSYmJw?=
 =?utf-8?B?Qy9uTjZ0UEhiVnhneFExaFN3amF1bXoxVHI1UjZHRmlZQ1RITm9VVlRoOEhG?=
 =?utf-8?B?RVdUV1BNeUNIWHZnSzB4SklmcXBaK3VJcW91WVpOTW1rRk1SaldGMjhqMllD?=
 =?utf-8?B?QVVRdjNjL1A1clpvQWV5bE9TMllKZ1VrVW1Uc0ZDQkFlUGFhYUdHMkFNNDk3?=
 =?utf-8?B?ZUtpV3lhY1J0SFRHMWcvVk4rLzN2Uzd3WEc3aFJSUElwT1Z2ZmkrdWJMZHky?=
 =?utf-8?B?aFNkZHl4aVl5UWd0TGNVRkxjcmRaL0RSYjdhelFuYnppUDRDOFBOdjNySksy?=
 =?utf-8?Q?D7NDpKWGN0tcpA2k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7949c017-95d3-414f-dd54-08dec6d590be
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 09:49:29.1377
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W8jYUjVc9u3SlfyWX2QPuudp22s3T3q7XiFp2pKd6qwlFspW58lZyxoMN9ABTcQrX4m13M/YdfA7yUay5+pl0F4X14Ho7NQlciBjH2+oeJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12581
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33806-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:ustc.gu@gmail.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[renesas.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,linux-m68k.org:email,TYCPR01MB12093.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8811E6680AF

SGkgR2VlcnQsDQoNCj4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4NCj4gU2VudDogMTAgSnVuZSAyMDI2IDA4OjUzDQo+IFRvOiBGYWJyaXppbyBDYXN0cm8g
PGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4NCj4gQ2M6IEZlbGl4IEd1IDx1c3RjLmd1
QGdtYWlsLmNvbT47IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz47IGxpbnV4LXNwaUB2
Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiByZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc7IGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gc3BpOiBy
enYyaC1yc3BpOiBmaXggaW5jb3JyZWN0IHJlYWRsKCkgYWNjZXNzb3IgZm9yIDgtYml0IFJYIHBh
dGgNCj4gDQo+IEhpIEZhYnJpemlvLA0KPiANCj4gT24gVHVlLCA5IEp1biAyMDI2IGF0IDIzOjA0
LCBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNhc3Ryby5qekByZW5lc2FzLmNvbT4gd3Jv
dGU6DQo+ID4gPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3Jn
Pg0KPiA+ID4gT24gVHVlLCA5IEp1biAyMDI2IGF0IDE2OjE0LCBGZWxpeCBHdSA8dXN0Yy5ndUBn
bWFpbC5jb20+IHdyb3RlOg0KPiA+ID4gIE9uIE1vbiwgSnVuIDgsIDIwMjYgYXQgMzo1NeKAr1BN
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdyb3RlOg0KPiA+ID4g
PiA+IE9uIEZyaSwgNSBKdW4gMjAyNiBhdCAxNzoyNiwgRmVsaXggR3UgPHVzdGMuZ3VAZ21haWwu
Y29tPiB3cm90ZToNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBGaXhlczogOGI2MWM4OTE5ZGZm
ICgic3BpOiBBZGQgZHJpdmVyIGZvciB0aGUgUlovVjJIKFApIFJTUEkgSVAiKQ0KPiA+ID4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogRmVsaXggR3UgPHVzdGMuZ3VAZ21haWwuY29tPg0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gQWNjb3JkaW5nIHRvIENoYXB0ZXIgNy41IFNlcmlhbCBQZXJpcGhlcmFsIElu
dGVyZmFjZSAoUlNQSSkgU3Vic2VjdGlvbg0KPiA+ID4gPiA+IDcuNS4yLjEgTGlzdCBvZiBSZWdp
c3RlcnMsIHRoZSBTUEkgRGF0YSBSZWdpc3RlciBzdXBwb3J0cyBhY2Nlc3Mgc2l6ZXMNCj4gPiA+
ID4gPiBvZiA4LCAxNiwgYW5kIDMyIGJpdHMuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBIb3dldmVy
LCB0aGUgIkFjY2VzcyBTaXplIFtiaXRzXSoxIiBjb2x1bW4gaGVhZGVyIGhhcyBhIGZvb3Qgbm90
ZToNCj4gPiA+ID4gPg0KPiA+ID4gPiA+ICAgICAiTm90ZSAxLiAgVGhlIHJlYWQgYWNjZXNzIHNp
emUgaXMgZml4ZWQgYXQgMzIgYml0cy4iDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBIZW5jZSB0aGF0
IG1lYW5zIHRoZSByenYyaF9yc3BpX3J4X3U4KCkgZnVuY3Rpb24gYXMgZ2VuZXJhdGVkIGJ5IHRo
ZQ0KPiA+ID4gPiA+IFJaVjJIX1JTUElfUlgoKSBtYWNybyBpcyBjb3JyZWN0LCBidXQgcnp2Mmhf
cnNwaV9yeF91MTYoKSBpcyBub3Q/DQo+ID4NCj4gPiBUcnVlLCBpdCBsb29rcyBsaWtlIHJ6djJo
X3JzcGlfcnhfdTgoKSBpcyBjb3JyZWN0IGJ1dCByenYyaF9yc3BpX3J4X3UxNigpDQo+ID4gaXMg
bm90LCBhbmQgY291bGQgdXNlIGltcHJvdmluZy4NCj4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
QWxzbywgcmVhZHcoKSBpbiByenYyaF9yeF9pcnFfaGFuZGxlcigpIGlzIHdyb25nLCB0b28/DQo+
ID4NCj4gPiBUaGF0IGxvb2tzIGNvcnJlY3QgdG8gbWUuIFRoZSBhY2Nlc3Mgc2l6ZSBmb3IgU1BT
UiBpcyA4IG9yIDE2IGJpdA0KPiA+IChhcyBzcGVjaWZpZWQgaW4gdGhlIGxpc3Qgb2YgcmVnaXN0
ZXJzIGZyb20gc2VjdGlvbiA3LjUuMi4xLCBhbmQgYWxzbw0KPiA+IHJlcGVhdGVkIGluIHNlY3Rp
b24gNy41LjIuMi4xOCksIGFuZCB3ZSBhcmUgcmVhZGluZyBpdCB3aXRoIHJlYWR3Pw0KPiANCj4g
VGhlIGNvbmZ1c2lvbiBwYXJ0IGlzIHRoYXQgdGhlIGZvb3Rub3RlIGluIHRoZSBjb2x1bW4gaGVh
ZGVyIG9mIHNlY3Rpb24NCj4gNy41LjIuMSBhcHBlYXJzIHRvIGFwcGx5IHRvIGFsbCByZWdpc3Rl
cnMsIHdoaWxlIGFwcGFyZW50bHkgaXQgZG9lcw0KPiBub3QgYXBwbHkgdG8gZS5nLiBTUFNSIChh
bmQgZS5nLiBTUERDUj8pLg0KPiANCj4gQlRXLCBlLmcuIFNQRENSIGFuZCBTUERDUjIgYWxzbyBz
dXBwb3J0XCBvbmx5IGFjY2VzcyBzaXplcyBvZiA4IGFuZCAxNg0KPiBiaXRzLCBidXQgNy41LjIu
Mi4xNiBzdGlsbCBzdGF0ZXMgdGhhdCByZWFkIGFjY2VzcyBzaXplIG9mIFNQRENSMiBpcw0KPiBm
aXhlZCBhdCAzMiBiaXRzLiB3aGlsZSA3LjUuMi4yLjE1IGRvZXMgbm90IGhhdmUgc3VjaCBhIG5v
dGUgZm9yIFNQRENSLg0KPiBUaG9zZSByZWdpc3RlcnMgYXJlIGFsaWduZWQgdG8gNC1ieXRlIGJv
dW5kYXJpZXMsIHRob3VnaCwgdW5saWtlIFNQU1IuDQo+IA0KPiBTbyB0aGVyZSBpcyByb29tIGZv
ciBpbXByb3ZlbWVudCBpbiB0aGUgZG9jdW1lbnRhdGlvbi4NCg0KSW5kZWVkLg0KDQpLaW5kIHJl
Z2FyZHMsDQpGYWINCg0KPiANCj4gPiA+ID4gVGhhbmtzIGZvciB0aGUgZGV0YWlsZWQgZXhwbGFu
YXRpb24uDQo+ID4gPiA+IEkgZGlkbid0IGNoZWNrIHRoZSByZWZlcmVuY2UsIGp1c3QgdGhvdWdo
dCBpdCdzIGEgbGl0dGxlIHdlaXJkIGhlcmUuDQo+ID4gPiA+DQo+ID4gPiA+IEFsdGhvdWdoIHRo
ZSBjb2x1bW4gaGVhZGVyIGhhcyBhIGZvb3Rub3RlIHRvIGluZGljYXRlIHRoZSBhY2Nlc3MNCj4g
PiA+ID4gc2l6ZSBpcyBmaXhlZCBhdCAzMmJpdHMuDQo+ID4gPiA+IEJ1dCBpbiA3LjUuMi4yIHJl
Z2lzdGVyIGRlc2NyaXB0aW9uLCBpdCBzcGVjaWZpZXMgdGhhdCBmb3IgcmVnaXN0ZXJzIGxpa2UN
Cj4gPiA+ID4gU1BEUiwgU1BDUiwgU1BTQ1IsIFNQQ01ELCBTUERDUjIsIFNQU1NSLCB0aGVpciBh
Y2Nlc3MNCj4gPiA+ID4gc2l6ZSBhcmUgZml4ZWQgYXQgMzJiaXRzLCBidXQgZm9yIFNQU1IsIHRo
ZXJlIGlzIG5vIGZvb3Rub3RlIHRvIHNwZWNpZnkNCj4gPiA+ID4gdGhlIGFjY2VzcyBzaXplLg0K
PiA+ID4NCj4gPiA+IFRydWUuDQo+ID4gPg0KPiA+ID4gPiBBbmQgU1BTUiBpcyAweDUyLCByZWFk
bCBvbiB0aGUgcmVnaXN0ZXIgY2F1c2UgYWxpZ25tZW50IGlzc3VlPw0KPiA+ID4NCj4gPiA+IEdv
b2QgcG9pbnQuIExldCdzIHdhaXQgZm9yIEZhYnJpemlvJ3MgcmVzcG9uc2UuLi4NCj4gDQo+IEdy
e29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4g
DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5
b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZl
cnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBC
dXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=

