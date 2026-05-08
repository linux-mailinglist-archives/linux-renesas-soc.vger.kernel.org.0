Return-Path: <linux-renesas-soc+bounces-32278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLQyBfi2/Wm4hwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 12:12:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A93934F4D3B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 12:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E864630041DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 10:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A45E381AFD;
	Fri,  8 May 2026 10:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GdIvr5nK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02170346FD2;
	Fri,  8 May 2026 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778235126; cv=fail; b=Sou25zBX5Wd6WTR52YTGVIdY5odxKc1iF0adhKn8Y30xhY21gdyUN5qIFHip9kER8zAwmoGQxJqkwLEzMSlzrFJJ1yVTVKnl0rAHbOhEWZEhEsn0FsunRcPoNyFPhmvSeY7ePgW/bIgTA6AoeMkjdXTCihNC/tXmF6AvEz8UKSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778235126; c=relaxed/simple;
	bh=ahGZh2mewM3k6+ih0d3uimcDLQqKsEZoPrw0NhJTSiE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q+DC1F7XpJDYUoAXeXlbkueg+a4QeiH98nYN+gIxVpKiC+2XyzxAtwV6yL11Esbdb9j+GBJDS0yuT+F2NvocHUh4blNe7QqBtW8/tXhmtQWuBJkt9CEdYmtFdKS4dPSKZeB5Na4dqLyEj4U82AvBMG+yIShQarnTOOSaWVpg76Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GdIvr5nK; arc=fail smtp.client-ip=52.101.229.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L+TK/szBMZRnt/orWlFiL9wDZ1ZAm1g2YWvhh42PF/4dNXYkXs1SANpPZ/Yf0Gv/QAv0KP2bGX880m94rIV+WOrgFxAd0CIZfkAZVqFzLmpTOzVtet9m0dtCANa8luKXK0eFRwUL1v1Bc3OJzAZYggaXp8VZ7qqght9xkjWjpYAhHEmfki38nf+Pdqtl9XupFlsFBGDJaxbUQUrbu9+Fyzp0UyYJ1MVv6ONdyjFfbKfT7S3ym30IrGnXEtgBZrdOS6rYLHopPpX2rmXvO53kegt+1GMmfI9eePBXxhYhs+qI8axGoYiL9Zed8yyM6qY0I0EMjXPsCHqFCqTGhuKgqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahGZh2mewM3k6+ih0d3uimcDLQqKsEZoPrw0NhJTSiE=;
 b=iehgAhWgn7pZVY/NK/cLVHunYyDgmbkuHVzAlGZ00OEgmWA+4ILbs4QuorQfdDuAAisEAic8ViYpB5PEAsgvEMDe6THKBv5BNi35zR4TkmAUaUlP3zvvYNBmqlIpcNHGo3mYVx2Glk5+AdVj/7EUA+KubTiN3ICiTIoackHJcwbJ0wvJyC+637uGs48I0los+lryrD1IA6rDDEcRtADtfFmTYAQntfGIcbNmVi42I6tjfZk9YuElRjN4lFI3nvArJY/3sNUZNgZ6D5qjA6qODO4+uJqJnrnxnGkCPTUbuwNUegCa4wZFOSQ4+pe8O/AXZkr4Qcka/HzNLCEIhApNEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahGZh2mewM3k6+ih0d3uimcDLQqKsEZoPrw0NhJTSiE=;
 b=GdIvr5nKIIRpvleXpK+aczzbKQelLL7odEhDpwZI7Uytif8n5XF58ToadJvKEEPsyEURyKOusezGtt6JD6wbZTh+sOTt3m8nGXuQpYPzONhdyvV97Ka/GgTfY12DdXkscQuhUBynhSdeCMrbnYRF6mDkSWjIXznF+nM+hTEGaf4=
Received: from OS7PR01MB17371.jpnprd01.prod.outlook.com (2603:1096:604:43e::6)
 by TYRPR01MB14209.jpnprd01.prod.outlook.com (2603:1096:405:21a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Fri, 8 May
 2026 10:12:00 +0000
Received: from OS7PR01MB17371.jpnprd01.prod.outlook.com
 ([fe80::7c48:4e26:72a5:7960]) by OS7PR01MB17371.jpnprd01.prod.outlook.com
 ([fe80::7c48:4e26:72a5:7960%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 10:12:00 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: John Madieu <john.madieu@gmail.com>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, Liam
 Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 01/14] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
Thread-Topic: [PATCH v5 01/14] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
Thread-Index: AQHczNYNpzFcoA8mek22e6kXBBNGN7Xi7kOAgAp/f5CAAF6RAIAAHzLwgBYdT/A=
Date: Fri, 8 May 2026 10:12:00 +0000
Message-ID:
 <OS7PR01MB17371ED1CBDF74A4F9BC0854DFF3D2@OS7PR01MB17371.jpnprd01.prod.outlook.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
 <20260415124731.3684773-2-john.madieu.xa@bp.renesas.com>
 <20260417-energetic-practical-frigatebird-5b93ad@quoll>
 <TY6PR01MB17377C02109A651FBCB31CFDBFF2B2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <CAMuHMdUnbxjbj6ahebyH8VKg5RJEjoZ=bRNRv85EHyYC=Fuvow@mail.gmail.com>
 <TY6PR01MB173777E9EB2A76E2F0E0455FEFF2B2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY6PR01MB173777E9EB2A76E2F0E0455FEFF2B2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB17371:EE_|TYRPR01MB14209:EE_
x-ms-office365-filtering-correlation-id: 413ee4c2-1714-4659-cd2b-08deacea3e4d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 9tZUyyuAmj3rCfY0j2pMbPWRot/RSFc11mgldlKK9yiEDYxQZWc0t9ty+rURzgoFm15GHa23eex519ANZnKcpjeRPwrq0rXOehr+rfz9vAJQrV4n3BLp7WTa3Q3n2CjDRvI3A9Vsy40utaobO8eIA4LYaITieabcy0L5xxIhqvCmaRVRPKMZuKRUINq7CcHqXTFF1/E++CO9FDOxIQfn1UeGHkuvC2DPQsh3XEay0jfPf/0wmWkFJsyua9Pnh7gACqZoMJ0u1vMd03I+6PkXsfaldssvgqNygPh+amr7JKVW30mt4T9E2kx7LhKpHuu0yjD6+alYzkFnIHXF/KYTlNjUUOZbPS+XdHZ1XbcYWwfI3jELcnmb32l0iMRNjcpKevmRq2SMcMQiZryEPhpFvMVlffpetAeHZQcN8mLezdrat6DsLggwU1lxDqMZMK4gBxYh9bzbLyz4JsGQr6FzwhT1KB/JVuHm+ptfcs4WDBktujBYUnuIvduT5FRyAZy07xYew9RkKtBVB6H7YN7ifIyMPkRvLUlhLHJ7qQi/7+hFLZ/I8ON7+SdfIp1xtyaHU1oMT0psRV8OqjS0s8KkRgSLsJvCQow4V+nUUnWKUaEclzcR7cuxD1h2FdjIuSSgK9+Juiio0B2cdVqCqzYcVs5hgfVPmR+1vB7jlid/E+g1SKn83O19IKkHcNDI7DY6+fgxi7kS96mPM4EyBxqsPOCGGVUSCAprsEOvvjgJiDZ+G9aaIQLlhH1jv/JREuuN
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB17371.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QklIRDVOMG03aUJReHBaTitwdUNsUGZuTUY2ZDBrd3JZd2w0OEFMNnlEeW54?=
 =?utf-8?B?ZFpEMFFncCsyaTB3bm1aSzFjb0p1WW94bldaclBmejhhdTVsY1J1T29TQU9i?=
 =?utf-8?B?S0J4cTYzWW9kS2JzZVZta1JRTlROSXB2TUF6KzJSSnVvdng2amx1ZVFHa1d6?=
 =?utf-8?B?ZFUvZVJscEYvS0lnVWhnTzhWTktVVXA4YmtrTmhpNkQrdUNmSHFsYUxISENN?=
 =?utf-8?B?a0wxV3dSZGUvUHRTYzNoNTFHdnh0bHY1SitEZDFoeVQ3YlVnU0dSQTZnRXJJ?=
 =?utf-8?B?My9UTC9RZVppaXB2TDFYaWxLS3Rqalp6NmpRK2k3Yno5TFhLWnZ6ZmZlcEU4?=
 =?utf-8?B?eTRUUUMxM3VsTmVTdUN0VFdpUVpXMXZLNVBXUThCSjdSQ09SMjhqejNmRGk2?=
 =?utf-8?B?V3RDQ3JDdk11MnI4bmxaQlBFZ2p3c3BhN29XclhidFRBSjl6Qng3dFdhcU1R?=
 =?utf-8?B?NXNRU0JzMWdxdmpRNGJJRVpnUG9lZlJ1UlZYZ1hsbW16cW1RWEFITUxxbWto?=
 =?utf-8?B?QnJQak9JaCtwZmdMSVpIS0VGaTI0d1hkK3VSYnRrRzM5aEhPbFBZSlYxTnp1?=
 =?utf-8?B?ZWJLcHNWMGdDYnhvM3l3STZEVXFGU3JFd21jREl3dWZDZXFmekRwNW1Lc2tv?=
 =?utf-8?B?Y05CZUs2UHZqSGlPdXVHVHJOaEc2dHBMOXlHVUZNVnpibWUwMk9SZURBSUtv?=
 =?utf-8?B?eFVFcWdVU2xUdEMyL3NrYVhjZEpYYlNJdW0vK3l2a3c3YWgvYlJkZTc1a1Mv?=
 =?utf-8?B?OU82WjhvV3NoRHQzcjZMeThqb1MzWm8wRFZVSklzeTloNVR4SDRwcjFQSy9x?=
 =?utf-8?B?c1VGVUI1ZnlJYkZNdjllK05FU1B0d0xLQ2FxYmJNVUFHdS9KakIzaGxzQTJZ?=
 =?utf-8?B?eTEwbDdjdVNDZU84amN4WDNRSWlPNlBITElYNS9JU05TMlBySTcvemFYaUVG?=
 =?utf-8?B?SnhMc09KV0hiOGNJK0pqWTNPcDNvUTZUZldpS0hvK01PTjUzRVk2azAwS1pm?=
 =?utf-8?B?QUVhTWV6V0pyVzJGMklWVkgzRWRuSlpTNXlpWm1LalY2NUdUdGhqSFBDcE9t?=
 =?utf-8?B?RllDUVJZdmVYZUhiUmJEWkd5cVluS3ZJcEhGNW83N3AvVThWdE14UndVTWtI?=
 =?utf-8?B?YXM0bUl3R1BFNjFZVEhhd1VXSnpieEFCRXF2WnBTVzM1aCsybkNkcUFsVzFC?=
 =?utf-8?B?OFNyeWU0ZExtbjU0V3FleW5wZ0lGOHNPSml2SkhSdWR2SW1Wb0E1eGZzQll4?=
 =?utf-8?B?OEUzTGpZOFZSK3E0Ymhoa3hqMlZVWkM5V05QSW1CaTVyeTI1V0Q5UC90REdG?=
 =?utf-8?B?dWZ2MzBTVVhacDJqdDdHQUcwNXFra3JPN1NTb296S2xIaDRqNnZxOFRBcmYz?=
 =?utf-8?B?dkI3UVJ5YUdOeXZBSXo5TUhiWjYzRnYwbFE1NjdzdmhRUTBGdE1EVEZzNGtt?=
 =?utf-8?B?Zmo4WkpNMFZQS0FpSXB1RW5yb0hzUEI0NDEweXBqRlhFT2tZNkdpQ05MN1Vy?=
 =?utf-8?B?dTZoR3BEWXk2RkRmM2dpTFlScHJoRS9jQ00rVXBEd2tka1JMV1ArcUg2dXhq?=
 =?utf-8?B?bEZMbmpYN0R5cjZqZ2Rvb1pMU0tXVkJwOVhrd1ViaTJoZDIyd2Z4TGhjWlhh?=
 =?utf-8?B?NU05WEVtU1VSOWpUTGRDVWJ6dnM4eVRDdzFZejAyUlZMeHB3ZVZWQWNGMit2?=
 =?utf-8?B?K1dtTi9uWHpYQ2dMNnBpYnQzV0dhbUxVUDhmWEdudUl3YXY5OER1ditPK2FN?=
 =?utf-8?B?cXpxblNobGMzZC9pek9mVFF1MDl1TTVtYU8ySU13UFMwbVpKeFFXcEd3TTNI?=
 =?utf-8?B?eFVwQjh1UThFTS9CbDNJYlZwWER4V1NHYzg5VHBMVm1PMEpuV3NVcGNOUHFr?=
 =?utf-8?B?eXJmWGZ4T2lNS1p1OS9mbktzTW85bXh4dUYxN29DQkVVc25NZWVvUzYrcUlp?=
 =?utf-8?B?ZjdmVXcrRUlwQnk1UVN2aHRuSG12RGpicnNYYTFKdGh3Uk0wZ1h2eVpsUDg2?=
 =?utf-8?B?aFpsMzZYK3VMVm9nVmZybWgzMzd1OTlKV3FabHZNd3AzNEFnaEVaRlp2UXFp?=
 =?utf-8?B?NzIzdmdiSGtNUWVvWll2Q3pGL1Z6MXNvek9nNWJ1SE5wTzN5ZWVJU1ZqWTRv?=
 =?utf-8?B?VllYbS9oeVVqSERSMTUwKzRKYWVpY0QyVlBzMVpKdlo4VGxsU0EwZWNhUHBN?=
 =?utf-8?B?aDA4NXFRMWJqMVdlYllPYTNGcFZKc2tJNytBTVR1WVNTa0tjbFp1N1EvcXdL?=
 =?utf-8?B?cFErVnVZN3NTbTYzWUNJbEtQVmxXc0dOY2JNSWRtTElWc1RHZ3BNclRuajdO?=
 =?utf-8?B?bkhoTzcxdzcwcnFUT0UrVGdlQ0R4dzN2aVFzOFBXalVjSWMwaGpqbFhyVGMy?=
 =?utf-8?Q?YHsOmessQn0IQfIg=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB17371.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 413ee4c2-1714-4659-cd2b-08deacea3e4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 10:12:00.0610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kAe32kEWAwU8dAIuMxENoLwclC5yQDdDXzOI/szT2SGfJm5rWYP6WDd5P7ecoDPniOqAfnuQx0NrPCRyTDkevrNs6JnpEVxo4YvMoz5P/7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB14209
X-Rspamd-Queue-Id: A93934F4D3B
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32278-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,kernel.org,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,OS7PR01MB17371.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Action: no action

SGkgR2VlcnQsIEtyenlzenRvZiwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBG
cm9tOiBKb2huIE1hZGlldQ0KPiBTZW50OiBGcmVpdGFnLCAyNC4gQXByaWwgMjAyNiAxMzoxOQ0K
PiBUbzogJ0dlZXJ0IFV5dHRlcmhvZXZlbicgPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIIHY1IDAxLzE0XSBBU29DOiBkdC1iaW5kaW5nczogc291bmQ6IEFkZCBE
VCBiaW5kaW5nIGZvcg0KPiBSWi9HM0Ugc291bmQNCj4gDQo+IEhpIEdlZXJ0LA0KPiANCj4gVGhh
bmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KPiANCj4gPg0KPiANCj4gSSBkb24ndCB0aGluayBib3Ro
IGZvcm1zIGNhbiByZWFsbHkgY29leGlzdCBvbiB0aGUgc2FtZSBwcm92aWRlcjoNCj4gYXMgYCNz
b3VuZC1kYWktY2VsbHNgIGlzIGRlY2xhcmVkIG9uY2Ugb24gdGhlIHNvdW5kIG5vZGUsIHNvIG9u
IGEgZ2l2ZW4NCj4gYm9hcmQgYWxsIHJlZmVyZW5jZXMgaGF2ZSB0byB1c2UgdGhlIHNhbWUgY2Vs
bCBjb3VudCBhbnl3YXkuIEkgbWlnaHQgYmUNCj4gd3JvbmcuIEZvciB5b3VyIG1peGVkIGV4YW1w
bGUsIHRoZSBib2FyZCB3b3VsZCBlbmQgdXAgd2l0aCBgI3NvdW5kLWRhaS0NCj4gY2VsbHMgPSA8
MT5gIGFuZCBhbGwgY29uc3VtZXIgcmVmZXJlbmNlcyB3b3VsZCBjYXJyeSBhbiBpbmRleCAodGhl
IFNTSTENCj4gb25lIGluY2x1ZGVkKS4NCj4gDQo+IFRoZSByZWFzb24gSSBrZXB0IGJvdGggdmFs
dWVzIGluIHRoZSBlbnVtIHdhcyBub3QgdG8gYWxsb3cgbWl4aW5nIHdpdGhpbiBhDQo+IERUUywg
YnV0IHRvIGxlYXZlIHJvb20gZm9yIHRoZSB0d28gZGlmZmVyZW50IGtpbmRzIG9mIGJvYXJkIHRo
YXQgd2lsbA0KPiBwbGF1c2libHkgdXNlIHRoaXMgSVA6DQo+IA0KPiAgIC0gYSBtaW5pbWFsIGJv
YXJkIHdpdGggb25lIFNTSSB3aXJlZCB0byBvbmUgY29kZWMsIHdoaWNoIGNhbiBwaWNrDQo+ICAg
ICBgI3NvdW5kLWRhaS1jZWxscyA9IDwwPmAgYW5kIHdyaXRlIHRoZSByZWZlcmVuY2UgYXMNCj4g
ICAgIGA8JnNuZF9yemczZT5gLCB3aXRob3V0IGFuIGluZGV4Ow0KPiANCj4gICAtIGEgYm9hcmQg
d2l0aCBtdWx0aXBsZSBjb2RlY3MgKG9yIG9uZSB0aGF0IHdhbnRzIHRvIGtlZXAgdGhlIGRvb3IN
Cj4gICAgIG9wZW4gZm9yIG1vcmUpLCB3aGljaCBwaWNrcyBgI3NvdW5kLWRhaS1jZWxscyA9IDwx
PmAgYW5kIHdyaXRlcw0KPiAgICAgYWxsIHJlZmVyZW5jZXMgYXMgYDwmc25kX3J6ZzNlIE4+YC4N
Cj4gDQo+IFNvIHRoZSBlbnVtIHdhcyBtZWFudCBhcyAicGljayBvbmUgYXQgYm9hcmQgbGV2ZWwi
IHJhdGhlciB0aGFuICJib3RoDQo+IGFsbG93ZWQgYXQgb25jZSIuDQo+IA0KPiBUaGlzIGZvbGxv
d3Mgd2hhdCB0aGUgZXhpc3RpbmcgUi1DYXIgc291bmQgYmluZGluZyBkb2VzLCBhbmQgdGhlDQo+
IGNvbnZlbnRpb24gaXMgYWxzbyBzcGVsbGVkIG91dCBhcyBhIGNvbW1lbnQgb24gdGhlIHNvdW5k
IG5vZGUgaW4gdGhlIFNvQw0KPiBkdHNpOg0KPiANCj4gICAgIC8qDQo+ICAgICAgKiAjc291bmQt
ZGFpLWNlbGxzIGlzIHJlcXVpcmVkDQo+ICAgICAgKg0KPiAgICAgICogU2luZ2xlIERBSSA6ICNz
b3VuZC1kYWktY2VsbHMgPSA8MD47IDwmcmNhcl9zb3VuZD47DQo+ICAgICAgKiBNdWx0aSAgREFJ
IDogI3NvdW5kLWRhaS1jZWxscyA9IDwxPjsgPCZyY2FyX3NvdW5kIE4+Ow0KPiAgICAgICovDQo+
IA0KPiBUaGF0IHNhaWQsIEknbSBoYXBweSB0byB0aWdodGVuIHRoaXMgdG8gYGNvbnN0OiAxYCBp
ZiB5b3UgKG9yDQo+IEtyenlzenRvZikgdGhpbmsgdGhlIGZsZXhpYmlsaXR5IGlzbid0IHdvcnRo
IGtlZXBpbmcuIEl0IHdvdWxkIGp1c3QgbWVhbg0KPiBzaW5nbGUtY29kZWMgYm9hcmRzIGFsc28g
aGF2ZSB0byB3cml0ZSB0aGUgaW5kZXguDQo+IFdvdWxkIHRoYXQgYmUgcHJlZmVyYWJsZT8NCj4g
DQoNCkdlbnRsZSBwaW5nIG9uIHRoaXMgdG9waWMsIHdvdWxkIHlvdSBwcmVmZXIgbWUgdG8gZml4
IGl0IHRvICcxJyA/DQoNClJlZ2FyZHMsDQpKb2huLg0K

