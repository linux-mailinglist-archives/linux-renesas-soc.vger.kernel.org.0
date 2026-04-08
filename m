Return-Path: <linux-renesas-soc+bounces-31041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uO96D/qD1mmwFwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 18:36:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A653BEE76
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 18:36:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53EF1301CD90
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 16:35:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7DD3D1CD5;
	Wed,  8 Apr 2026 16:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="geDNvMwf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010043.outbound.protection.outlook.com [52.101.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939C83CE4AD;
	Wed,  8 Apr 2026 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666149; cv=fail; b=r331uoFZYl3DQ7cPm5vmM+XVOom3AtgxmxiHTl58+J32uAPPqUPgyyuGIEeFFc8KSpx17pcmv/3nhZA3ViC6ODINToF9BnGowpe4iqdWFKxEb7liocrW2jLZtL+CZxFSPpi4RPAzVOwreI/1p0BH0VzJiC+wh7tbVtJ3rnN9FDg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666149; c=relaxed/simple;
	bh=qcrAI61eyPzezwf7EOfGlOdv1Lm8ksbvePcBSpatkFY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u8ctr9euKHx6RKjYQuy/mML5GmAJlQX8i9FBCLbdKuOhYwdv7LrdcXV5c5X2JNovzdSJdpUkLZ6QqnVGjzCk34YPUeEqlUpm81ji3GCe2+M0DBcVCIpraqhrSgr0nexuMgoRuKaiLaK1Q4Dr/r1jDj5/bUUzWLCQzXyD6mXcIjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=geDNvMwf; arc=fail smtp.client-ip=52.101.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEZ8dRwEGnhCSlH+IFO9bGr2PrIjoLe/PbQuhz0rb2jyzf8PwZDDp1Q2I6pc53l8dRAgZGyGO+b3AfvTYZ4AC7js8/T33A23dYTU572eLQqsKKo2p11beMwYG+4YK8SKorHlIMotFYD7VQ5xjJ9bdgz4/s5qjDNgVcexXTErHqyGwgQxst3YA5OntH8CYMOzDs+CU4WPdDo6yoWJIQ4I+5BZQ47iUE9xYIRq+NAca6BmPyQZlMqcNyke++LTsLKu5f+uQ7C0ueOQo/++4+C9UdwswFL4ElFtlZkZwNu7NznUnGcaaBXW2n4W0/p55p9hfo6/28Fq0akPsrMy/pGnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcrAI61eyPzezwf7EOfGlOdv1Lm8ksbvePcBSpatkFY=;
 b=GultWIQ3rLQIsDmJy34GTl1iexCv4sfLDDnrujuYjBLZUFMpOLp50u6uBKJK/3yzSekktZgUX1pEsdlzaYz0PnmhwNnQP5WonUmf9/ATxJNWSRpCbyodo5sQLOlBEulJddHboJHSwhqmGGu3VAam24VKdd9q0hVnnr4kF7KRG1/LgTKGk+ATFlqBEvWrRQKBCt+xkckzxbEk2d3fRVhW3+gjSq9ZVXtvYdqt0xzWinLcEwpzmFJfUV+ztuDPB8ikh2xfQ7xBl7pOZplK9DMfQCvvf+Y1q8Wrb7tonXiq1X/fEI6jNTmdY0ZQK0NdL7NI0xkmimK7e6JyshYr5piGOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcrAI61eyPzezwf7EOfGlOdv1Lm8ksbvePcBSpatkFY=;
 b=geDNvMwfw+/UFKxK02hrYI70TXpbjg6GRvMWC7abvbiNk7v6lOBsD5o+0a7JrITEAuf8XsmrFRZmhjuxCq8vGQmHe3ENckC306u+lwunyzlYHsRBwCblbVYhBLJxdWgXwibBv78mUrjubF4fGgZ2jTERYLX2wx+FGIqtTk2dzMQ=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TY3PR01MB9713.jpnprd01.prod.outlook.com (2603:1096:400:223::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Wed, 8 Apr
 2026 16:35:44 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 16:35:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Thierry
 Bultel <thierry.bultel.yh@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
Thread-Topic: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
Thread-Index: AQHcx2L1WxU/Wbm0ZkuvgJVMedankLXVW0yAgAAAwXA=
Date: Wed, 8 Apr 2026 16:35:44 +0000
Message-ID:
 <TYCPR01MB11332B594964DDF0763499184865B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com>
	<20260408142105.310210-2-biju.das.jz@bp.renesas.com>
 <20260408123039.922a75327fd7672df3bd61da@hugovil.com>
In-Reply-To: <20260408123039.922a75327fd7672df3bd61da@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TY3PR01MB9713:EE_
x-ms-office365-filtering-correlation-id: a91971fc-f607-4c1a-d63d-08de958ce152
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 5g7S3goMdpS778F+mc70X6C7A6sMyZO5yRQOulLkZ/DQJ3y+pK8lmQHTg2pv2wFDGJho3u3KNq+VLhOLZMsSzqiGJhmGmAEbT+EvKMN+V9myJm2NtGKm5ELlWXmAJfbyEIvL3JPjeQ576XHaTIx5fojn17Ltiw2EMKi3iLOwtVuJCqSr540Z4EGRuCK3Cdu93NQkHMrCrB3rmW45pMJlkJDCb9k5ySVL5USNfmNFuCEJ0LEG/hMzGPeS/b226IeJoEM7ENKKHreTm5OoIjpxy27sKAh9YAJkhmcbik6w3fARHZc7RrIN3DJCJ5qAK0frJ+jVrc9oGECBQJh+4OOGhyLrgS1w1yrtxwO73vtPognOIcUoxFIbDr4Lc5BjZd4rECR9v1D+i9Ek2SP1sKizXyJFaFSZKJGoR+OVobbeojkGBKEB9Y1M1TtGCUwWbaXlsqndrIQFtGvIwlH3vGeP1h+CrYdtSpk/zDO3Czy2rvjqha9tcucrS13H6bICPDPdBhW3owpQ59hcDCgErev7uitRRofZ7q8lImqgMlF8RJrael3rlnURO9VwCkrMsYJfMgeH4DcPaZgA7elTouGz5quCJCgdtjt01DDzk42CHl8l8el8KZyUoFK5i7sEo8sX/rWbH4LDM0nTqtLII6Ob1Dej5ZOLZOlKOzNKPls2mDHGKtb1stNe3iZ7JSDNrCMaOUDWU5XKviq2hxOInXuT9KXk2aUk0nJjv5ubHV6JlNVBPX4nh+meUHfniBDgFewvIuPOgSq6aymM9+G88N5eNadxKicBFFozR0PZhU6nPww=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QjZZcitIaDRKaTFFR2hBaW54TGFrdzlBMXNlVWE1OFcvRjBleEdvWE5vQXZu?=
 =?utf-8?B?ajM2WWhIN2I5SHdsSzFSaHVuMzZseU16QU5FMkl5b3NsRU9tRUUvZVdsSVNv?=
 =?utf-8?B?ZDNYOVhZOGVUeUg0cWppUTJqelBNU1hYa0Mza0tlN1lKZ1N2TlJwZXVJcyti?=
 =?utf-8?B?Q1c1bnJEVkJIeUd4ckMrT1pFdVVkT3hieVkvS3lGOFJuZi82SS9WUW14TEdY?=
 =?utf-8?B?ZzQrRlh0YW42b2l1M29pei9jUjhqQXpaOFVmZXBvOVNxM3VTaW1iSUZEeUtI?=
 =?utf-8?B?NFZ1aWpxV0hVUlNGWU05bDQ5MFBCTzNaTmUzdEF2Y0M1YmxqYlptbXFyVkhx?=
 =?utf-8?B?N0hkeDJVUnMxNXY4bi91L1lEeTQ0K2EvbHBmaEk3WmJFb0NXMmRrUE5YMmJP?=
 =?utf-8?B?bEF2ZFlFMDYyRlN0Ni9Ea2pRTkZxZ2tpVmVjdDF5NUR0Rm9uQUowZWszb3Vm?=
 =?utf-8?B?TlV1NDRaLzN5M2pmb0ZpTDlJOGRPOGlQbElsSnhBWTZhZFJnNXhnMElENTRN?=
 =?utf-8?B?M3VFOFNXaThuVk44VEh2cTc5Ykd2bENPSkRnaFFQT25IWURrdlFJSkNpUjV5?=
 =?utf-8?B?Y0wrSnkxWlNKQlVqVnN5NWtBWDBKZ1JyMVBjSHcrVGkxVTFlQXduMis0WEdl?=
 =?utf-8?B?K1lEUGdBdFM1Qjk2emUySjRtZDEwQzI0MXF5NjRka241WFhlMVNqZlF2MHZP?=
 =?utf-8?B?YllKbEtzVmRVM0JQV0RyMHo0YXlEMWN0UG5XTmtpV1VKSHpJZWkrOFBqaUxR?=
 =?utf-8?B?bHZPNFBYUC9ZWVhVTmg2ZXQ0aWlUY2FTWmN0NTRvdnBOWis3bnFPNE4wZkZC?=
 =?utf-8?B?UlNhTzVVNWJYb2Q3SXp3U0pJZjRVTE5oYjlDWFQxSUhEZ2xZQzF0Yi96TXY4?=
 =?utf-8?B?dkpCUlhDYU5rdFJiZ3IzZ3VtT0MzSjNXV2ZiZ1Q1cnJzK3JtSmpKU1VGZ0k5?=
 =?utf-8?B?a2cweEs3UlVBK04zb0prWXBrVFRrTDBtM2RMVjlHaXJYMmphVDN1QVJEc0tn?=
 =?utf-8?B?Tk1UemRwb21SRHhScVFUMDhrZW1QbUdRSThENlZYdkRLcTRlQ1BzWDg4czkw?=
 =?utf-8?B?dFFscElxT0p0MWprb1VXU3AzOW1sRGR1SWIwVFhqZEtNRy9jcVpaeVZRMkJR?=
 =?utf-8?B?dTVuNXc5NDl4clZQMVlMU1pRbzIyVVZGU2dncVBpa1Z4b1JaWGFHWitXSzVt?=
 =?utf-8?B?UVI3c1ZCOVNySjZLeWtPYnZ3d0RyNE0yeEtFQ0xDS2dTTUFHZmdaK0ptRlQy?=
 =?utf-8?B?R2V3MkZBTVZlckNWY1ZoVlRPZnNlSU12akN5MnY4QksvTWpIM1JzY09YOHVB?=
 =?utf-8?B?R2F0eEtzZDZpS0NvWjZiMzlqWDNmcWh1c0hMSThiYm9RdGVTbmdBYVVXdFBH?=
 =?utf-8?B?L2lIMHhwZUFaU3N5OHhPR1YvSGRxNWdRTm1vVmJFT3p5VW90aXI3azBoQ0Fr?=
 =?utf-8?B?MWFjeGRnb2dMcEpYb05DY1NnT01pSzFVQVlIYUtGVGR2NnozTElEc2R0VU9Q?=
 =?utf-8?B?bnlRWVE0bXVTeHVVK2ZBSUZhQWFYazJEWXRMYk1hYkt5dzArbUJRZzN6UHBh?=
 =?utf-8?B?MjN6dzBnODhvcDh1ZUhZQXQ1cGE4UkttK2I4cTFheXg0SkVlYm45bDQrTDNT?=
 =?utf-8?B?TUl2VGFhWWN1U3VjaU41b3VrTTlBdmJhVExlVnJoeGdRN2c5K2YvVGV2OVZN?=
 =?utf-8?B?T00xaFpHdXlwclNYNi80VU0vQzhXamkxNjZ6ZUV2ZHR4Z3RyL0EvaVRsZ1hW?=
 =?utf-8?B?RGpNVVQ2MEtVRVlSK042QVdadmprQ2JBamFEOWFieUt3WXlLRTdUN2FKajFD?=
 =?utf-8?B?Rzl0WDlKcCtvZWJ5RE02ZnprZ3AxelFVMm0wSFlaUTRqQldSVjBJbkFSdWJl?=
 =?utf-8?B?dUl4VmxkRSs2cXYyTzdrc2lDckgrSEQ4ZTNDSkNnNHV6bThYTUVzclhRVVRC?=
 =?utf-8?B?OGp4Z1ZQazdxVUxOZ0dEQytjRC9jUEFDaW5BNzJoc3JWek80SXNmdS82SHZY?=
 =?utf-8?B?eFhFbXhiM3JWZ05GeWtRbUM3VHZhUWNaU004d1p4UklOWlB5TlpNSkhFK2pz?=
 =?utf-8?B?elJKWmlzVHU5MkVocy9EU3d6azJTQXpDbXhKQ21tR2Fsc085aWhld2s4ZWc0?=
 =?utf-8?B?Tkx5eVdZRnlNYzJkSkZPY0JWaFJnS2Rqbmo0RWFrTnRzdHM4U0RQRkVMWmhp?=
 =?utf-8?B?ZXh3cEN1Q2lqY3VGV2JDRElZY2NVcm5KTEFaNUlUdWcwM1hlUFAraWpIS1A5?=
 =?utf-8?B?QjFmWjZmUE1ZaE9UOW1aK3J1NXpuY0R2MUVtUUs2ZHhJQ2Z5UXNvck5SQzda?=
 =?utf-8?B?SEFLL2Z2OWVpNEtpaU9GYk40Zm9OVWZoZ1g2RCtWVDFLL1g1QnlPUT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a91971fc-f607-4c1a-d63d-08de958ce152
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 16:35:44.0918
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TAjjvoVurtYDIPm7O5LKMYKFxgHs+LUmsLIH3mi9tKIBkvqUZtqq18WIURkF3LaFQzZnOpnQFnghZzEPEXZPBiOqzbq4ZQcmfRkszl8uCsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9713
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31041-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[hugovil.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,hugovil.com:email]
X-Rspamd-Queue-Id: A5A653BEE76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgSHVnbywNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gRnJvbTogSHVnbyBWaWxsZW5ldXZlIDxodWdvQGh1Z292aWwuY29tPg0K
PiBTZW50OiAwOCBBcHJpbCAyMDI2IDE3OjMxDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS8y
XSBzZXJpYWw6IHNoLXNjaTogQXZvaWQgZGl2aWRlLWJ5LXplcm8gZmF1bHQNCj4gDQo+IEhpIEJp
anUsDQo+IA0KPiBPbiBXZWQsICA4IEFwciAyMDI2IDE1OjIwOjU4ICswMTAwDQo+IEJpanUgPGJp
anUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IHVhcnRfdXBkYXRlX3RpbWVvdXQoKSBj
b21wdXRlcyBhIHRpbWVvdXQgdmFsdWUgYnkgZGl2aWRpbmcgYnkgdGhlIGJhdWQNCj4gPiByYXRl
LiBJZiBiYXVkIGlzIHplcm8g4oCUIHdoaWNoIGNhbiBvY2N1ciB3aGVuIHRoZSBoYXJkd2FyZSBy
ZXR1cm5zIGFuDQo+ID4gdW5zdXBwb3J0ZWQgb3IgaW52YWxpZCByYXRlIOKAlCB0aGlzIHJlc3Vs
dHMgaW4gYSBkaXZpZGUtYnktemVybyBmYXVsdC4NCj4gDQo+IGJhdWQgaXMgcmV0dXJuZWQgYnkg
dWFydF9nZXRfYmF1ZF9yYXRlKCksIHNvIHRoaXMgaXMgbm90IHJldHVybmVkIGJ5IHRoZSBoYXJk
d2FyZT8NCg0KWW91IGFyZSB0aWdodCwgV2lsbCB1cGRhdGUgY29tbWl0IGRlc2NyaXB0aW9uLg0K
PiANCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+IA0KPiBNaXNzaW5nIEZpeGVzIHRhZz8NCg0KSSB3aWxsIHNwbGl0IHBh
dGNoIGludG8gMiBhZGRpbmcgRml4ZXMgdGFnLg0KDQo+IA0KPiANCj4gPiAtLS0NCj4gPiB2MjoN
Cj4gPiAgKiBOZXcgcGF0Y2gNCj4gPiAtLS0NCj4gPiAgZHJpdmVycy90dHkvc2VyaWFsL3JzY2ku
YyAgIHwgMyArKy0NCj4gPiAgZHJpdmVycy90dHkvc2VyaWFsL3NoLXNjaS5jIHwgMyArKy0NCj4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsL3JzY2kuYyBiL2RyaXZlcnMvdHR5
L3NlcmlhbC9yc2NpLmMNCj4gPiBpbmRleCBiMDBjOWUzODUxNjkuLmEwODU4YmFiMDgyMiAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvcnNjaS5jDQo+ID4gKysrIGIvZHJpdmVy
cy90dHkvc2VyaWFsL3JzY2kuYw0KPiA+IEBAIC0yODYsNyArMjg2LDggQEAgc3RhdGljIHZvaWQg
cnNjaV9zZXRfdGVybWlvcyhzdHJ1Y3QgdWFydF9wb3J0ICpwb3J0LCBzdHJ1Y3Qga3Rlcm1pb3Mg
KnRlcm1pb3MsDQo+ID4gIAlzY2lfcG9ydF9lbmFibGUocyk7DQo+ID4gIAl1YXJ0X3BvcnRfbG9j
a19pcnFzYXZlKHBvcnQsICZmbGFncyk7DQo+ID4NCj4gPiAtCXVhcnRfdXBkYXRlX3RpbWVvdXQo
cG9ydCwgdGVybWlvcy0+Y19jZmxhZywgYmF1ZCk7DQo+ID4gKwlpZiAoYmF1ZCkNCj4gPiArCQl1
YXJ0X3VwZGF0ZV90aW1lb3V0KHBvcnQsIHRlcm1pb3MtPmNfY2ZsYWcsIGJhdWQpOw0KPiA+DQo+
ID4gIAlyc2NpX3NlcmlhbF9vdXQocG9ydCwgQ0NSMCwgY2NyMF92YWwpOw0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYyBiL2RyaXZlcnMvdHR5L3Nlcmlh
bC9zaC1zY2kuYw0KPiA+IGluZGV4IDZjODE5YjZiMjQyNS4uNDI5ZTg5MTA2ZWUzIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zaC1zY2kuYw0KPiA+ICsrKyBiL2RyaXZlcnMv
dHR5L3NlcmlhbC9zaC1zY2kuYw0KPiA+IEBAIC0yODA1LDcgKzI4MDUsOCBAQCBzdGF0aWMgdm9p
ZCBzY2lfc2V0X3Rlcm1pb3Moc3RydWN0IHVhcnRfcG9ydA0KPiA+ICpwb3J0LCBzdHJ1Y3Qga3Rl
cm1pb3MgKnRlcm1pb3MsDQo+ID4NCj4gPiAgCXNjaV9yZXNldChwb3J0KTsNCj4gPg0KPiA+IC0J
dWFydF91cGRhdGVfdGltZW91dChwb3J0LCB0ZXJtaW9zLT5jX2NmbGFnLCBiYXVkKTsNCj4gPiAr
CWlmIChiYXVkKQ0KPiA+ICsJCXVhcnRfdXBkYXRlX3RpbWVvdXQocG9ydCwgdGVybWlvcy0+Y19j
ZmxhZywgYmF1ZCk7DQo+IA0KPiBBZnRlciB0aGlzIHBhdGNoLCBoYXZlIHlvdSByZS10ZXN0ZWQg
aWYgaGF2aW5nIGJhdWQgPSAwIHByb2R1Y2VzIGFueSBvdGhlciBlcnJvcnM/IEEgbGl0bGUgYml0
IGxhdGVyIGluDQo+IHRoZSBzYW1lIGZ1bmN0aW9uLCB0aGVyZSBpcyB0aGlzDQo+IGNvZGU6DQoN
CisJLyogQXZvaWQgZGl2aWRlLWJ5LXplcm8gZmF1bHQgaW4gZGl2aWRlciBvcGVyYXRpb25zICov
DQorCWlmICghYmF1ZCkNCisJCWJhdWQgPSAxMDA7DQorDQoNClBsYW4gaXMgdG8gdXBkYXRlIHRo
ZSBjb2RlIHdpdGggdGhlIGFib3ZlIGNoYW5nZSwgdGhhdCB3aWxsIGNvdmVyDQpBbGwgZGl2aWRl
LWJ5LXplcm8gY2FzZSBpbiB0aGlzIGZ1bmN0aW9uLg0KDQpDaGVlcnMsDQpCaWp1DQo=

