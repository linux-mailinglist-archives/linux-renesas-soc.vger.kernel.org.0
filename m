Return-Path: <linux-renesas-soc+bounces-34401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SGamMKHaO2rqeAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 15:24:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAEC6BE915
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 15:24:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b="R0hk/diV";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA2A73043F7F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 13:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706013B811F;
	Wed, 24 Jun 2026 13:24:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D87A286409;
	Wed, 24 Jun 2026 13:24:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782307466; cv=fail; b=hJs2hNoLc0hFoxwze8yM5w5WJz7wIky+J5rX9eITfdR/sZWZRJSfRAHwo1zQXtrmg3Jlev1zZDtKyhPqtyYyI1x/c/5q+tKlcYZntbLQmfR8utRaDShR9teI+9aRBPe/I1ASlMKtd1oIWE2rpFCcYyCEGfbiVl5uqR3tKYD6PPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782307466; c=relaxed/simple;
	bh=qTyZIdbD2NyMp/QW0ftOxBr+4QrtOqT6tps8R24ffcQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nd6vfWjjIMpQM2p2MnTlEC4dTnmg+EAc2OqPAkMlSVfEuLyt/fL612+ijD9nV49C1k59dMK7+g9Sr14zGEEyaxssclktQ2IrjNHPjYf4t7z2Ru1aCyUsCc5uP56FcFH4fJ0/WCXtK4XTvJZ726ARNnjlQsVE5yTZb1EJJaXQQjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=R0hk/diV; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKn2P3h/0NZtzApPs7CGBDpz3BeGzsE97ofi2nbZVxaShGAv07PQjW8tYk5zkIIdx3HQU/wIAM7gaILl+eH46UDWwPb6//fdhFaivSdw0GZVgQIQGIzCivDhzydq8/bNXpw8yGuWvUhweYCZoiE2cFunfALMgCwU2J/qypisjCvRPGBB+5yaaZHAFo1DEIHNQm4AkgjtLkKU4xGhYnqsXkV27vViT+MCxInLh9gQtt6BVj62IGrNhFhzoUTznrzTWZ93Yq8QRo4XiRdGWGz+GH5RlYixKm4BYxTeFmN/j0qURrN51xJneI03q6ChJH8wIB0tHDMvTwHPcDtT8u2Rdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTyZIdbD2NyMp/QW0ftOxBr+4QrtOqT6tps8R24ffcQ=;
 b=kIPUgRZtFiXYaNqrsam6vo4JlEx/digX+vrp+52pVJ9KHhiMe4KHEzsxR5hE4hKbxwLY0qbbCVvYH5qP8KKH9dERuqRKC/s/2Lm/YI5kJeehm/BzBhY1BN/Dng2lLfwxA8ilgQz9DP1yeWsyVZjRjt45vBR8wnBYip3PRYMAzGh8nq1i7JWDZGSzSEvpWFgYscBH/XGiWhwoVbXCmLTlhjFwI27OMsIhsCB+2eSDFH8oNB+A1+/aR8rhyJgO2qLwHjVyfpMo9GMFqmLz9cCKtAOo6jWpSYdIobrTaPsWyrqF+C/4hgx+VPrmGMraVE/lqyOQ/UETZ3swwz6Covq0tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTyZIdbD2NyMp/QW0ftOxBr+4QrtOqT6tps8R24ffcQ=;
 b=R0hk/diVescRXYi6AhtoRBfNkusVgun/kSmZ8Wbqi/8NB9QOSZtmGXPV5rN8ANfRHhXDkCNrm/+radIVRuA0+UEpT9CM4hK71ODQs/G3XkBOVwnsXDneYftc4YyqAdWIU2oNE5EbUc3r9/b9bloPw3upOiKQFkszSy0itWPWD+A=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12490.jpnprd01.prod.outlook.com (2603:1096:405:1ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Wed, 24 Jun
 2026 13:24:21 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 13:24:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Alex
 Helms <alexander.helms.jy@renesas.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>, Brian Masney
	<bmasney@redhat.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
 maintainer
Thread-Topic: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
 maintainer
Thread-Index:
 AQHdAyw/4ueLfPD53keQC6SpXGUnQbZNdPEAgAABB+CAAAHdgIAAAMkwgAA4QICAAAIIMA==
Date: Wed, 24 Jun 2026 13:24:21 +0000
Message-ID:
 <TY3PR01MB11346ECE254A2F8BC1B66716086ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
 <20260624-advanced-pink-dinosaur-ebe720@quoll>
 <TY3PR01MB11346659E1A238C232E29946686ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <77976912-b0b0-4e08-ad9c-5080c4d8adcc@kernel.org>
 <TY3PR01MB11346A6077B4F7380078EA3B486ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdV67ZuhpSjiu-rWrgyPAMafEDVALD5b0k_bFMYkfQnP8A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV67ZuhpSjiu-rWrgyPAMafEDVALD5b0k_bFMYkfQnP8A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12490:EE_
x-ms-office365-filtering-correlation-id: 205d7317-dd9d-48d8-4add-08ded1f3e701
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|376014|23010399003|1800799024|38070700021|18002099003|22082099003|4143699003|3023799007|11063799006|56012099006;
x-microsoft-antispam-message-info:
 TdGAISVjhvXlUzMjnkWfDJ1gihGfkZmj72hQdziipLU48TrXijan10RAJeMmYojaVmNUpTTWDhqLtx0lQ+W9ehrHyamNSkA6s9ZorkS1NdK5XRntapKm2JVIGd/rCUltjuvRq6VyPMqkhb7L5u3mS/y8JYRYYwmBdYwXGWLti6Tl3B0fsqjNUjAaz6JWHU8XzbLQPYWioZgUeB+ui9TkZgCyfs/BXh1e6O0+IePpKJu8VxJIe8LOtE2X7zjBQ2RSYplet7hUs0cxRY1LblcmazzbKB0L/uup3uABwubB1T13xEM9uIiqNPsG5KROzJmcFgfXX7I8CdxmkQPzSKgmWjRvGswCF3smoymzFnhb+G8g/y4I/Ste5MLd6zSig2EGSC+437MJm+XQBSCY3koWXBlGRPxnaPxWZc2aQRGBmnSRkkDBWFG8kSpwWUjVzeZvaprToPzI+wOuIJgIqE/WEasaYF5bRWXlcUBZxDL/0fzkkTJzxWJtU7/cE1lxoZyQWjOwdK7z/8NEDXNauJtrn8Nm0T8urnh+LtMQhx2NaYi4X5M/jzp4mfYkFZdm4tsNQ8rCgxpzRDiXArGXCe0ofnddGRxsRIbdXe3pPndNiKxqHvwUxt5XBTI3DbiNKC1ooyFCXVs0L+an+nr7K4b1K9xuNKyD6AIFxEWAr6DdQXr2wdJLD4DsKCqZTxPBcNBGJ7YuayQexmAhLZUcpsaMkGdc+R+TJ54k70ELZW5WFQs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(23010399003)(1800799024)(38070700021)(18002099003)(22082099003)(4143699003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TkFjYTVLTjdZaFczY3VJRzBOZ3AwbDNBc0RXZXhOMlBQOXlqQUc0SW9BeHVk?=
 =?utf-8?B?WkdSTkpReFpLdHozQ0pYNy9JalVCdXRFYjd0UXE1dzlrMEhzd2Z2MWo3OXY5?=
 =?utf-8?B?aW05YlVPOVo4ZkNxK2RlUTVrdVByaEU0TTM5bGdRd0gyOTFVUUk2enpzMkEr?=
 =?utf-8?B?WGxQeTlVeXlRT0cvU0V4NzQ5eUtLWE1ZcGZMSi82NVp1aG5XTG4yZ3lGRWda?=
 =?utf-8?B?bm9vK2MwY3hFNkpCOXJjZzhDMWJVNVRLbGZHQmZ6MkVtVkl4Sm5qa3crc1lF?=
 =?utf-8?B?YkZMNy9RaTlIc3d6cEZOZ0p5V2tTNnVSNHVzc1o3Yndyd3pVRXc5MXJXallj?=
 =?utf-8?B?NC9Pa0hEWEU4TTJ5TUw4bElTc09tZGx0YmhYbTNqYWR0N1ZkVTQ4SHFEY3ow?=
 =?utf-8?B?SnMvSWZ5M0UvZTVib2phUjE1TmdJYlhvd0wxd09na1Juby9FbmY2bkRyUEtj?=
 =?utf-8?B?NHJ6Z0pwMWJhSXl2RUVUMG5MYTFieU94VlZOMGN6NldSNjFFQUU2R3lkby9H?=
 =?utf-8?B?YnplRWNQZWNYOGJEWjU3djcwUks4ZUVsYnRGYXFBSmRvK0Rnd1YyMkRNVEU4?=
 =?utf-8?B?d3V2UGlVUjFzK2hMWjFmd3hPOGJqd25tWU5aaDFoTmo0RnpjSGJMQlNaU1pK?=
 =?utf-8?B?dk4wMkY4eDVYRVZQUlF0N2xyT01nYVZnTHltQVJhdjF1T3duOUN2bkRld1Vx?=
 =?utf-8?B?WTZYSFdYTGE4Y2xaKzVIMDkvQ2IyVU1PNTB3OG5MOTdJNVVpOWZNU0R2Nk42?=
 =?utf-8?B?MWV5UlpQZU5jMlp3L05LR0FINFRDZGpVMy9hR3FvNDJTT3pURDZJckdNWThW?=
 =?utf-8?B?cHI4Y0hxWVcrNUViOTJIKy82aTZrTDNlUStBTEhQUHVrNTNPV09ielVaWCt1?=
 =?utf-8?B?NWhscWtyeVh0QUYweHJsREp6NVA2dkIwcWkyMlV3MVV2cStkTTZqd2V0TEgr?=
 =?utf-8?B?OHEwbFFuOVA1TWJudVltMjNTWTBZL3d4NCtsaUp3K3k3eGFDZllOMy9WaWNq?=
 =?utf-8?B?K01kalFCTlRMM2gxY2VabmRHcWdveWNYWXVHT2FsbXJvbzZHb3dneW5yZFlR?=
 =?utf-8?B?ZzBjYzByQURaUU1ZaGJJb0EvZm5IT3drbzFSeFFXSUhPZWxvWnUxMzlPSk9h?=
 =?utf-8?B?NTRqbFA5TlZRc0ZxZ2p2dE44SnRQT1FLVmUvMjc3eUtxNllSbThqYStkRldw?=
 =?utf-8?B?Qm82MGU3WjRrZmk3Q29Lb0tYcjUyV0p3Q3ZhekF4UTZFWEozTDZocGlXTlU1?=
 =?utf-8?B?eVdMTU9OM1lyUW9sdlVSdzZxZVZFeXZoNEZUbXRZWWtoemZ6bjFHcTE1cnhZ?=
 =?utf-8?B?Znc2QjNsaEtVSjV0Q2hlNmpMOFZ1Vkl2bFlId09teVB0M3hEVkJESkxKU0NN?=
 =?utf-8?B?cHBUdDUzRlkyL2tpWFVhR0VQL2NSOGwwTDUvWnRaT2VoWnVTcDIyR2xqU1R6?=
 =?utf-8?B?ckVBdGVLVWhnV0xxYmhVZ3hHQkZuOEE4N3NNdzF5QitXTWgxUk5SUWF6WURZ?=
 =?utf-8?B?a1A5emdKKzhPenM5TklXQ28wOFNPT2lreVlvTFNZUlNQT0VNNE5yMVE2Mlk2?=
 =?utf-8?B?VGEvaTlIcDk3d1Uwd3BiSm9raFhpNW44WEd3S05sTkNLeDRrT1k0TnkvaEF0?=
 =?utf-8?B?SlBMR3NTSDQwQzljUS9OQWtaMTlrdW1pWmhYMkdkalFJVW1oYVdIOVNBeXM1?=
 =?utf-8?B?WFFwTk02RFZUUW1SQms2RGhIU1FTV1o0K25HOUlxTjgwbUV4eWFGV3EwOWRy?=
 =?utf-8?B?d3ZPckFmb1pxRHl2K2R1TzV4Ym5KcjhBR2k3ZSt6RmFRd3c3dGJIZHhnbDVx?=
 =?utf-8?B?bjNGVTl6N2tGSjdnVGpaVGdsbGxRYm9MYVg4WHRIZUF3bUhWWHFqQmtJdzc1?=
 =?utf-8?B?SkxYMGNUbnNyZnlhcE5HRWhYZkQwSHRaUStRWWxrckpvckdobG5ydGVBMXBi?=
 =?utf-8?B?SFU1Nm1HYWNwaE1UeDB2V3JpQ0hpcDRrZHZLLzh2aUNjYnM2d1ZabXo3QTk0?=
 =?utf-8?B?NkFsY1QzcjN2NWhnMFJBc3d5UmVhbEREUkZIUGlVUURIRDRTS0ExSUdDR2lk?=
 =?utf-8?B?TjRvYTdQR0x5Rjh0V3RrYXAxOW9nNWFMNzlhQjZEdndHeHF5YnBjcnNrZlVD?=
 =?utf-8?B?ZnZHUlEvRkJsY1lVQkFWOUczL3pmdnAyMkZJUGgvcEJyM1JBQ1dtcU5HSyt1?=
 =?utf-8?B?NGlyenpxY2pWVVFFZTR1U0tMZ2tTdlhJNUNIVDNtQk5BdVdBWHpqa1hOZjRn?=
 =?utf-8?B?ZmtkOTFyaC9rbnNoaUNLTC9wQkZOeDRuakpOK1lhQWV3SkwyRnpDcVlrelAr?=
 =?utf-8?B?OUxNSkFobXk5aEh2bm1qS1dIOWJuU3lXQjR2MlluQjNKbHZna2phdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 205d7317-dd9d-48d8-4add-08ded1f3e701
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2026 13:24:21.5644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4ZlEoF2Jtd5ywlSo/4ohtRfho3sYm9kwCWozxtj0vAT1c6zig7RZgulU9y0lCJTT17X243Iud/TfpJdo3vyqlCwTMc/QPRHh4gMIGe5CT7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12490
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34401-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:krzk@kernel.org,m:biju.das.au@gmail.com,m:geert+renesas@glider.be,m:alexander.helms.jy@renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,renesas.com,baylibre.com,redhat.com,vger.kernel.org,bp.renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,renesas.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linux-m68k.org:email,bp.renesas.com:dkim,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5DAEC6BE915

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjQgSnVuZSAyMDI2
IDE0OjE2DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGR0LWJpbmRpbmdzOiBjbG9jazogcmVuZXNh
cyx2ZXJzYWNsb2NrNzogVXBkYXRlIG1haW50YWluZXINCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBP
biBXZWQsIDI0IEp1biAyMDI2IGF0IDExOjU5LCBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0Br
ZXJuZWwub3JnPiBPbiAyNC8wNi8yMDI2IDExOjQ2LA0KPiA+ID4gQmlqdSBEYXMgd3JvdGU6DQo+
ID4gPiA+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+ID4g
PiA+PiBTZW50OiAyNCBKdW5lIDIwMjYgMTA6NDINCj4gPiA+ID4+IFN1YmplY3Q6IFJlOiBbUEFU
Q0hdIGR0LWJpbmRpbmdzOiBjbG9jazogcmVuZXNhcyx2ZXJzYWNsb2NrNzoNCj4gPiA+ID4+IFVw
ZGF0ZSBtYWludGFpbmVyDQo+ID4gPiA+Pg0KPiA+ID4gPj4gT24gVHVlLCBKdW4gMjMsIDIwMjYg
YXQgMDU6MjA6MzdQTSArMDEwMCwgQmlqdSB3cm90ZToNCj4gPiA+ID4+PiBGcm9tOiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiBBbGV4
J3MgZW1haWwgaXMgYm91bmNpbmcuIFVwZGF0ZSB0aGUgbWFpbnRhaW5lcnMgbGlzdCB3aXRoIG15
DQo+ID4gPiA+Pj4gY29udGFjdCBkZXRhaWxzIHRvIHRha2Ugb3ZlciB0aGUgc2NoZW1hIG1haW50
ZW5hbmNlLg0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJp
anUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPj4+IC0tLQ0KPiA+ID4gPj4+IFJlZiBb
MV0NCj4gPiA+ID4+PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2FqcVdldm9mRUoz
ZnY4NTZAcmVkaGF0LmNvbS8NCj4gPiA+ID4+PiAtLS0NCj4gPiA+ID4+PiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvY2xvY2svcmVuZXNhcyx2ZXJzYWNsb2NrNy55YW1sICAgICAgICAgIHwgMiAr
LQ0KPiA+ID4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gPiA+ID4+DQo+ID4gPiA+PiBQbGVhc2UgYWxzbyB1cGRhdGUgTUFJTlRBSU5FUlMgZmls
ZS4NCj4gPiA+ID4NCj4gPiA+ID4gSXQgaXMgdGFrZW4gY2FyZSBpbiBbMV0NCj4gPiA+ID4NCj4g
PiA+ID4gWzFdDQo+ID4gPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQU11SE1kVzAt
V3NadXVjN1BvVk5DNURCVW9ZOWRQK1VMbUdUUQ0KPiA+ID4gPiA3NlZXDQo+ID4gPiA+IE1PX1Nq
cGJ1UUBtYWlsLmdtYWlsLmNvbS8NCj4gPiA+DQo+ID4gPiBKdXN0IHNxdWFzaCB0aGVtIHRvZ2V0
aGVyLg0KPiA+ID4NCj4gPiA+IFdoZW4geW91IGZpeCBzdWNoIGlzc3VlIGxpa2Ugd3JvbmcgZW1h
aWwsIGZpeCBpdCBldmVyeXdoZXJlLCBub3QNCj4gPiA+IGp1c3Qgb25lLWJ5LW9uZSB3aGVyZSB0
aGUgbWFpbnRhaW5lcnMgbmVlZCB0byBwb2tlIHlvdSB0byBmaXggaW4NCj4gPiA+IG90aGVyIHBs
YWNlcyBhcyB3ZWxsLiBJdCBpcyBnZW5lcmljIHJ1bGUgZm9yIGJ1Z3MgYXMgd2VsbC4gVGhlIHdy
b25nIGVtYWlsIGFkZHJlc3MgaXMgdGhlIG1vc3QNCj4gb2J2aW91cyBleGFtcGxlIGhlcmUsIGJl
Y2F1c2UgaXQgaXMgYWxzbyBleHRyZW1lbHkgZWFzeS4gSnVzdCB1c2UgZ2l0IGdyZXAuDQo+ID4N
Cj4gPiBPaywgYnV0IGJvdGggcGF0Y2hlcyB3ZXJlIGFscmVhZHkgcXVldWVkIGJ5IEdlZXJ0IGZv
ciA3LjMuDQo+IA0KPiBJIHdpbGwgc3F1YXNoIHRoZW0gd2hpbGUgY29tbWl0dGluZy4NCg0KVGhh
bmsgeW91IGZvciBoYW5kbGluZyB0aGlzLg0KDQpDaGVlcnMsDQpCaWp1DQo=

