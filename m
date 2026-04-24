Return-Path: <linux-renesas-soc+bounces-31625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB1HEMxR62nkKwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 13:19:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABE645DA05
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 13:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A2C23002915
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 11:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EE63ACF1C;
	Fri, 24 Apr 2026 11:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="M28m1zoF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010068.outbound.protection.outlook.com [52.101.228.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F65D3ACA51;
	Fri, 24 Apr 2026 11:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029574; cv=fail; b=X5tWMeQ4Q56JsjPxZxgBh4UUuFlLoXJr/BYBN3dtNGyud2jMsBpy+oTT65vu7bdhlsyRYIURY6JjI81GV5ilZwt553cx9rz3Qrx3AToUYBKBYdHgb/+8vkzXIso9PZMmTgbUgKzK17uYer63/bQl2/0Pwv3puJR8bRxCrvlexMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029574; c=relaxed/simple;
	bh=D5gqj2J6Z2y3akMm8qs6w8IBiFPlN5OUXKglmfSbMq8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JRgcvvysJ1oJM6bXP3nucgqYRdaFXGCyhtGrqBLAHvUKJnI0mpFzxa9AxQNlOf0FGcCq729M8J7HWGTXZLNv3tiX0ONM9DAsxiwxlIfI8u8xtma+giIkqMi2OC8BVzZMLmIuiJREQSU7TOWOv6CaD6osHuiDhUk+tPzVUIWK/ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=M28m1zoF; arc=fail smtp.client-ip=52.101.228.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkSTm82NXGTZXEuLY7YqENViYYE9o0FkNFWYcZb0ysnjk5IB/dZQ/16Ql35O9h8Dxs2xlMpvMvWQiyyPoZOe+rva3y4AQmOBXT5/5ExGC+wmWVbySgsCHisbSdRSnT2dF70LSkJbEDigKM9NxxABdpeOxPTSSsPmkiJfOXeJkmIGM5o+MKv7JqXyBFzc3HPYkiUp+AY7YnFJeLLzNpKBEXg9pMei+mA9KTWEJa6N5LR8jnC2SH7oHKiJS3HANFi+FePN1LBvb9cDFfa06nyV1tQZBl1lfIdEqmXGBpXOKcpO/r2Opsb1+x/mNcKCEDmJ6j7vr0DIgQI6jb3M5FXAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5gqj2J6Z2y3akMm8qs6w8IBiFPlN5OUXKglmfSbMq8=;
 b=C1lPs0lPMf76z3jfA4csGxbf6ceBTCWTV8qp46froKIWobFQ0oyDTo9VT9Vo3s8tdl9McuGk6EEdqGM4m2SBdNdbJCz025Od+UStaf3QuCUEzcOqIdH66YMSE02xywSfMF9wWLoC2AFuWEeKi3W6Yj8ACpujWoIh+2q5cCMmd/TUUXVIEKxiYQ3v8UeeiFqPxdOk8aOAJ5YzUmKA0S13ylX13PuCiw4hhvQzotYQucRco38vyPcn4NTVNOQ8XpYpPnl3lxSyVHnbcAG/nNM5FgZ93472tAClvtr+rSoJjC60/Gx7zLRLbM9p19JMU6vsO2R+TfQZFFkg25wlyT8P6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5gqj2J6Z2y3akMm8qs6w8IBiFPlN5OUXKglmfSbMq8=;
 b=M28m1zoFKgbXfCwVTpRFWgXFWjXYFr3ct1cDu377koqLdxM35QShSDTPo8wOTWbsY0MZxQ9A2C2KkmG8WE/7GXhwowr2ZiJyoNTICEz7zPHSYQb4Ghlpz/o161k0b6tNHHXLc16cXhLdu5isgO+TXqVGDJbLlV8ydMAojl37O5E=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS9PR01MB12439.jpnprd01.prod.outlook.com (2603:1096:604:2e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 11:19:26 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 11:19:25 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, John Madieu
	<john.madieu@gmail.com>, Kuninori Morimoto
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
Thread-Index: AQHczNYNpzFcoA8mek22e6kXBBNGN7Xi7kOAgAp/f5CAAF6RAIAAHzLw
Date: Fri, 24 Apr 2026 11:19:25 +0000
Message-ID:
 <TY6PR01MB173777E9EB2A76E2F0E0455FEFF2B2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
 <20260415124731.3684773-2-john.madieu.xa@bp.renesas.com>
 <20260417-energetic-practical-frigatebird-5b93ad@quoll>
 <TY6PR01MB17377C02109A651FBCB31CFDBFF2B2@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <CAMuHMdUnbxjbj6ahebyH8VKg5RJEjoZ=bRNRv85EHyYC=Fuvow@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUnbxjbj6ahebyH8VKg5RJEjoZ=bRNRv85EHyYC=Fuvow@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS9PR01MB12439:EE_
x-ms-office365-filtering-correlation-id: 33a3e9df-04ef-4864-2859-08dea1f3578a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 eKaI45R9TFdWwMgqbgjjI2oaKwVJcHj3esmKuNNZ9DJt1VK68dzZYubfMyBrYVS/5lE2rlmAGZdNCttmVrVvBcL2VUkajPv25nw68rVZM4sqmxUUkv1+EotTSMq4rrkgNTpx79WmLtaZK6aqNoLV7pnqFORoN/kSagi3KIIaWfV6lihJZIGXohQKAo5eqMMO5KH6ayPjZ88XOp0X9AaOI1z0zHIfZjJAODPjuOoEA96SDiN8b4Pr0j9pj/xE7Z0mOq3IoGacM1RkYxcIU9dtWGj+knh6YRq18HJHgk6NfZRDEEYE3tz9M8evqk4N6nL4JPRby2fCZA9mDMi+VIk8uGafrA0Y334Fve3Wi9yrcV1FKhrEQ5VtYGZGHcKx5y5xZT22/0Vp625ST8pFUDBtINSIQ5um8ufRH/+tOz8mIJX4ggClkMxMlzlmwOyxlaDdOL+iJz/DLeFr9a2vdyrwxT8zZNMwn5ew8T9qe7p9i4br4HUdfkq8K0+h5sR5fMe77Xm8c/XcCfBt/NJfhNnwQBxArJnP+XwyTefxMCewHGX5URL37Otz5WcwhZ0p5ERiJVbWtaPVuMdkO48CJRSO7anQHqPqTFDYgYP0sPZUO+/mI6OR0XU1O6Xtv/lB5W+y1iv5gEBMFugiGfFey+pJ0T+Jm66cP03pbeE8HOQF376zkNZYR55mdc2kwpSTCpc/C+ru/HU2xcbW0eItDJ/3BApiyWLNW5WB3fXVqoqfiqCgi1r3RyA8oL8dC9GJFXnXvbZNn6adNKPcIXgKWUPW9euO1GbuUIdxOxa7Wre4qIQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MWRPMWNCRHB0MVlSU1lkci9IaXl5U2g3OGtWdzExUTIvRW50RGlwaGo0cWJH?=
 =?utf-8?B?enZ0MUdvN1JxZExTYXV5TERaWDZYWXhIa0FFQWc3VW94VmgwSUJacnFPTlha?=
 =?utf-8?B?cVA2MzdUYVJNUThZYXJEMnVKRWtKNmxINzZkc3M4Mi85VGF2NGR3Tmo1OG1E?=
 =?utf-8?B?WGk1ZVQyN1ZwYS9LQmtUTmo4aGNwYWdrNVV1eHV2aGRLREZkYkVxUVZUUUpJ?=
 =?utf-8?B?NGx0VW8wNXpUYTlUcUJqQ3c4MkhSclJjK3dYV0srNjRHRVJLQ09UT3ZLVFZY?=
 =?utf-8?B?cTI1eFVWUU9PUTRrZ01xb2Q2TDFtbHh2N0F4YVd6SWxXeGVqZEdlSWtTUUUr?=
 =?utf-8?B?QnpaU0FzbnByZ2lJZTlYcy9PYUUrOUxRbHpqbUJFT1FrZkdiQlBrSmk1czA0?=
 =?utf-8?B?Z2dTbGwxcUZBR0tVQTFLS25uOGE2LzJlM2JzZlUxVE1PZldXQmZHOW1FWGxV?=
 =?utf-8?B?TGllMGhPcFArL3dyZzRxT25KQ2taUHErQ29Ubmk4Qnh3anVnMHZOa2F0OWhO?=
 =?utf-8?B?dE5ZQWNLVStLbmM5RCtxdGpPREdwdDZpSUF5WFBmSVBHQjNXRWU5a1V5U3Zi?=
 =?utf-8?B?dVdrMmp1RWZ1cDIvcWk3Nm82Z1JNVCttZStGcVZSdFFRYlcwZTlGYzBTcDQz?=
 =?utf-8?B?Y0tPTmFUeWViaGZ6cVQ5ZGI1TXo4Vnd2enA3Q2lPMUdjRm1qRXFQdXY5UWJx?=
 =?utf-8?B?YW5YYStxQkdqaFFKWjFLMWNZUDNQeFhqUyszcjd3N3dFSEx2d0hSb1g4S2Nk?=
 =?utf-8?B?UlFxLzVGanpId2syTVNDUFYxc0lUcTBVcm1DRG4vWVNnU1dlNjQrWmdhbnFp?=
 =?utf-8?B?dkpTbDVhcTRNeHJRdmx6bkZjbElFeEJHdEtpeE04NkxCQUU2bDBMNHhxRXYw?=
 =?utf-8?B?OERhY09YN0xDV0l0eG8ybEtndFAwZnZUVTNscXJQNGw1eTZ0VkJBZjJpQnZI?=
 =?utf-8?B?K3UrMVFnbE5ZY3NzcUU0K2dQemZ3OUV5eWE4KzhNbFMwY1JldWZnU1F2RytX?=
 =?utf-8?B?ajdpdE9sMkNNRFc3dWlIM3NSY3c2U1hRVS9HZlJudE1nVjZjTHpacE42Wks5?=
 =?utf-8?B?YVZQN2VpUUJGYVVGWEFjeG5Pb3Z5K0hSaFd0MHlOOUdPdjF2NkU3R3owc05y?=
 =?utf-8?B?M2VrNTg4WHppOU8wd3FWM1pGelMrbkZNKzNiRkZkWGN1dCtEMWp2NmJZVy9v?=
 =?utf-8?B?d2NEK0ZrRFYyYktSZ0FFejlDM0dkSHAyNWE5VWQ2djlLYXorRFF1V2RvQThQ?=
 =?utf-8?B?d0RPZ2pBa05WTDRsSmUwWXB0STY1UmFUZEVqc2lMNWp0L2dIS0kwNldUdVRt?=
 =?utf-8?B?WExoZ1hMUCtrcFhFenBoM1o1bWxiZ1VHMXZoWHA0Q2RFV0xQN3ZBLy8wRGV4?=
 =?utf-8?B?bThGczhKd0ZZb2xzZ3c3SCs2Qy81MWtRVEtjMUx5czhLY0tObHcvYVZpQkpn?=
 =?utf-8?B?VGtPNUd0NDQzTlFXTWxZOURsQ2NCcFRzemg3Y0IzYzA3ZEpZanlUVVR5NFRR?=
 =?utf-8?B?c09ad1Ivcm8xOXFaSGI3bFBFcUxFaHpINUZMbDUrTDB0dGdJOUJZVWtUcEhZ?=
 =?utf-8?B?SmE2Qi8wNmNJTGpPSUR6OVpXc3FDckRHeHNzclB3VzlZU0dkVzF3dFRRSGZx?=
 =?utf-8?B?UGlnaGhLclk1M3p4VXBZVVd1V0VhdXZpb0ZjWGEveDN5VGVld0FzaDBOREwr?=
 =?utf-8?B?K1VJR2FwNkk5SEZZR3Q4Vk9veWtRQmdWa21SOTFRNU9NODVMSWR6ZERIOW5P?=
 =?utf-8?B?dUMraGM2Q3FsL2dpVTBjZDNXKzJBUXQvSk10SUJwQnJmV2E3YlpSVWxUN1Y0?=
 =?utf-8?B?OGlsdDFDNDZpVzRCcmpoVm5WcEJWVkNGN2dnbGErazdOR2VDZkJBcUNsQytr?=
 =?utf-8?B?YTZGV05tV3VheW5tcW1HNFNrVEtpU2tqYUZIQ0dhN3N6c3RJblZLZ2dxbGIw?=
 =?utf-8?B?Y3lNTCttOHdtK1BiRk96dlh0Qnd5U2FGc1JLMlFBUUR1cndMaXdkWGhXQUZt?=
 =?utf-8?B?Tk94Wm5VaGZoZnFDeDRSVXNWUmZlS3JLbEhya2FWU01aMThoR2RXa0lOdHFr?=
 =?utf-8?B?OWZBRmZ1bVV6ekN3dFZJd2VJT1QrQ2ptSFo0YzJBRitPT2dDYVQ0eWkrOWRE?=
 =?utf-8?B?T1phbmtYNmdsTElyZloySHNkTHFhSlBNWnhUL280dW5KZWdocmZIOFptcWto?=
 =?utf-8?B?SDVzN1NxT3hNNGJtWG9YejEvNG01S204c2VIT0twT0VjR3JtUHE5OEdXb0R5?=
 =?utf-8?B?OFZIa3hndC9xL0pXMVhJQnlSeVZ5M1hkN2pLNmg2Wk42djFwMHlxK0QrU294?=
 =?utf-8?B?U3o2cGRjeUtnSjNsS3F4RnU4YXVHN1VTMnZDOGdLZnE0dFc4RjhuN2MzRVRJ?=
 =?utf-8?Q?chtgBVo3wh1WYm1E=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a3e9df-04ef-4864-2859-08dea1f3578a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 11:19:25.0517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h7hGGSFOWEJRMEp79VFmb/wcx49FfGtnQBAd/IIEIoKv3gnb+w5mTYxhef8mdZzCAB44NRjhRI9Kj3KeqYeVPZ5g+W9yB6YFLShAX5MJnH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12439
X-Rspamd-Queue-Id: 3ABE645DA05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,renesas.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31625-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]

SGkgR2VlcnQsDQoNClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02
OGsub3JnPg0KPiBTZW50OiBGcmVpdGFnLCAyNC4gQXByaWwgMjAyNiAwODoyNA0KPiBUbzogSm9o
biBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHY1IDAxLzE0XSBBU29DOiBkdC1iaW5kaW5nczogc291bmQ6IEFkZCBEVCBiaW5kaW5n
IGZvcg0KPiBSWi9HM0Ugc291bmQNCj4gDQo+IEhpIEpvaG4sDQo+IA0KPiBPbiBGcmksIDI0IEFw
ciAyMDI2IGF0IDAzOjM5LCBKb2huIE1hZGlldSA8am9obi5tYWRpZXUueGFAYnAucmVuZXNhcy5j
b20+DQo+IHdyb3RlOg0KPiA+ID4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPiBPbiBXZWQsIEFwciAxNSwgMjAyNiBhdA0KPiA+ID4gMTI6NDc6MThQTSArMDAwMCwg
Sm9obiBNYWRpZXUgd3JvdGU6DQo+ID4gPiA+IEFkZCBhIHN0YW5kYWxvbmUgZGV2aWNlIHRyZWUg
YmluZGluZyBmb3IgdGhlIFJlbmVzYXMgUlovRzNFDQo+ID4gPiA+IChSOUEwOUcwNDcpIHNvdW5k
IGNvbnRyb2xsZXIuDQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBSWi9HM0Ugc291bmQgSVAgaXMgYmFz
ZWQgb24gUi1DYXIgU291bmQgYnV0IGRpZmZlcnMgaW4gc2V2ZXJhbA0KPiB3YXlzOg0KPiA+ID4g
PiAtIFVzZXMgdW5wcmVmaXhlZCBzdWItbm9kZSBuYW1lcyAoc3NpLCBzc2l1LCBzcmMsIGR2Yywg
bWl4LCBjdHUpDQo+IGluc3RlYWQNCj4gPiA+ID4gICBvZiBSLUNhcidzIHJjYXJfc291bmQseHh4
IHByZWZpeGVkIG5hbWVzLg0KPiA+ID4gPiAtIFN1cHBvcnRzIHVwIHRvIDUgRE1BIGNvbnRyb2xs
ZXJzIHBlciBkaXJlY3Rpb24sIGFsbG93aW5nIG11bHRpcGxlDQo+IERNQQ0KPiA+ID4gPiAgIGVu
dHJpZXMgd2l0aCByZXBlYXRlZCBjaGFubmVsIG5hbWVzIGluIFNTSVUsIFNSQyBhbmQgRFZDIHN1
Yi0NCj4gbm9kZXMuDQo+ID4gPiA+IC0gSGFzIDQ3IGNsb2NrcyBpbmNsdWRpbmcgcGVyLVNTSSBB
REcgY2xvY2tzIChhZGcuc3NpLjAtOSksIFNDVQ0KPiBjbG9ja3MNCj4gPiA+ID4gICAoc2N1LCBz
Y3VfeDIsIHNjdV9zdXBwbHkpLCBTU0lGIHN1cHBseSBjbG9jaywgQVVETUFDIHBlcmktcGVyaQ0K
PiBjbG9jaywNCj4gPiA+ID4gICBhbmQgQURHIGNsb2NrLg0KPiA+ID4gPiAtIEhhcyAxNCByZXNl
dCBsaW5lcyBpbmNsdWRpbmcgU0NVLCBBREcgYW5kIEFVRE1BQyBwZXJpLXBlcmkgcmVzZXRzLg0K
PiA+ID4gPiAtIFNTSSBvcGVyYXRlcyBleGNsdXNpdmVseSBpbiBCVVNJRiBtb2RlLg0KPiA+ID4g
Pg0KPiA+ID4gPiBUaGVzZSBkaWZmZXJlbmNlcyBtYWtlIHRoZSBSWi9HM0UgYmluZGluZyBpbmNv
bXBhdGlibGUgd2l0aCB0aGUNCj4gPiA+ID4gZXhpc3RpbmcgcmVuZXNhcyxyc25kLnlhbWwsIHNv
IGl0IGlzIGFkZGVkIGFzIGEgc2VwYXJhdGUNCj4gPiA+ID4gc3RhbmRhbG9uZSBiaW5kaW5nIHdp
dGggaXRzIG93biAkcmVmIHRvIGRhaS1jb21tb24ueWFtbC4NCj4gPiA+ID4NCj4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogSm9obiBNYWRpZXUgPGpvaG4ubWFkaWV1LnhhQGJwLnJlbmVzYXMuY29tPg0K
PiANCj4gPiA+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvcmVuZXNhcyxyOWEwOWcwNDctDQo+IHNvdW5kLg0KPiA+
ID4gPiArKysgeWFtbA0KPiANCj4gPiA+ID4gKyAgIiNzb3VuZC1kYWktY2VsbHMiOg0KPiA+ID4g
PiArICAgIGVudW06IFswLCAxXQ0KPiA+ID4NCj4gPiA+IFdoeSBpcyB0aGlzIGZsZXhpYmxlPyBU
aGF0J3MgYSBkZWZpbmVkIGRldmljZSBtZWFuaW5nIHlvdSBoYXZlIG9uZQ0KPiA+ID4gWE9SIG1v
cmUgREFJcy4gTm90ICIxIGFuZCBtb3JlIi4NCj4gPg0KPiA+IFRoZSBJUCBleHBvc2VzIHRlbiBp
bmRlcGVuZGVudCBTU0kgaW50ZXJmYWNlcywgYW5kIGEgYm9hcmQgY2FuDQo+ID4gcmVhc29uYWJs
eSB3aXJlIGVpdGhlciBhIHNpbmdsZSBTU0kgdG8gb25lIGNvZGVjIG9yIHNldmVyYWwgU1NJcyB0
bw0KPiA+IHNldmVyYWwgY29kZWNzLiBUaGUgY2VsbHMgdmFsdWUgZm9sbG93cyB0aGF0IHdpcmlu
ZzogMCB3aGVuIHRoZQ0KPiA+IHBoYW5kbGUgaXMgYDwmcmNhcl9zb3VuZD5gIGZvciB0aGUgc2lu
Z2xlLURBSSBjYXNlLCAxIHdoZW4gaXQgaXMNCj4gPiBgPCZyY2FyX3NvdW5kIE4+YCBzZWxlY3Rp
bmcgYSBzcGVjaWZpYyBEQUkgaW5kZXguDQo+IA0KPiBIb3cgZG9lcyB0aGlzIHdvcmsgaWYgYm90
aCB0eXBlcyBvZiB3aXJpbmcgYXJlIHByZXNlbnQ/DQo+IGUuZy4gU1NJMSB3aXJlZCB0byBvbmUg
Y29kZWMsIGFuZCBTU0kyLTQgd2lyZWQgdG8gc2V2ZXJhbCBjb2RlY3M/DQo+IA0KDQpJIGRvbid0
IHRoaW5rIGJvdGggZm9ybXMgY2FuIHJlYWxseSBjb2V4aXN0IG9uIHRoZSBzYW1lIHByb3ZpZGVy
Og0KYXMgYCNzb3VuZC1kYWktY2VsbHNgIGlzIGRlY2xhcmVkIG9uY2Ugb24gdGhlIHNvdW5kIG5v
ZGUsIHNvIG9uDQphIGdpdmVuIGJvYXJkIGFsbCByZWZlcmVuY2VzIGhhdmUgdG8gdXNlIHRoZSBz
YW1lIGNlbGwgY291bnQNCmFueXdheS4gSSBtaWdodCBiZSB3cm9uZy4gRm9yIHlvdXIgbWl4ZWQg
ZXhhbXBsZSwgdGhlIGJvYXJkIHdvdWxkDQplbmQgdXAgd2l0aCBgI3NvdW5kLWRhaS1jZWxscyA9
IDwxPmAgYW5kIGFsbCBjb25zdW1lciByZWZlcmVuY2VzDQp3b3VsZCBjYXJyeSBhbiBpbmRleCAo
dGhlIFNTSTEgb25lIGluY2x1ZGVkKS4NCg0KVGhlIHJlYXNvbiBJIGtlcHQgYm90aCB2YWx1ZXMg
aW4gdGhlIGVudW0gd2FzIG5vdCB0byBhbGxvdyBtaXhpbmcNCndpdGhpbiBhIERUUywgYnV0IHRv
IGxlYXZlIHJvb20gZm9yIHRoZSB0d28gZGlmZmVyZW50IGtpbmRzIG9mIGJvYXJkDQp0aGF0IHdp
bGwgcGxhdXNpYmx5IHVzZSB0aGlzIElQOg0KDQogIC0gYSBtaW5pbWFsIGJvYXJkIHdpdGggb25l
IFNTSSB3aXJlZCB0byBvbmUgY29kZWMsIHdoaWNoIGNhbiBwaWNrDQogICAgYCNzb3VuZC1kYWkt
Y2VsbHMgPSA8MD5gIGFuZCB3cml0ZSB0aGUgcmVmZXJlbmNlIGFzDQogICAgYDwmc25kX3J6ZzNl
PmAsIHdpdGhvdXQgYW4gaW5kZXg7DQoNCiAgLSBhIGJvYXJkIHdpdGggbXVsdGlwbGUgY29kZWNz
IChvciBvbmUgdGhhdCB3YW50cyB0byBrZWVwIHRoZSBkb29yDQogICAgb3BlbiBmb3IgbW9yZSks
IHdoaWNoIHBpY2tzIGAjc291bmQtZGFpLWNlbGxzID0gPDE+YCBhbmQgd3JpdGVzDQogICAgYWxs
IHJlZmVyZW5jZXMgYXMgYDwmc25kX3J6ZzNlIE4+YC4NCg0KU28gdGhlIGVudW0gd2FzIG1lYW50
IGFzICJwaWNrIG9uZSBhdCBib2FyZCBsZXZlbCIgcmF0aGVyIHRoYW4NCiJib3RoIGFsbG93ZWQg
YXQgb25jZSIuDQoNClRoaXMgZm9sbG93cyB3aGF0IHRoZSBleGlzdGluZyBSLUNhciBzb3VuZCBi
aW5kaW5nIGRvZXMsIGFuZCB0aGUNCmNvbnZlbnRpb24gaXMgYWxzbyBzcGVsbGVkIG91dCBhcyBh
IGNvbW1lbnQgb24gdGhlIHNvdW5kIG5vZGUgaW4gdGhlDQpTb0MgZHRzaToNCg0KICAgIC8qDQog
ICAgICogI3NvdW5kLWRhaS1jZWxscyBpcyByZXF1aXJlZA0KICAgICAqDQogICAgICogU2luZ2xl
IERBSSA6ICNzb3VuZC1kYWktY2VsbHMgPSA8MD47IDwmcmNhcl9zb3VuZD47DQogICAgICogTXVs
dGkgIERBSSA6ICNzb3VuZC1kYWktY2VsbHMgPSA8MT47IDwmcmNhcl9zb3VuZCBOPjsNCiAgICAg
Ki8NCg0KVGhhdCBzYWlkLCBJJ20gaGFwcHkgdG8gdGlnaHRlbiB0aGlzIHRvIGBjb25zdDogMWAg
aWYgeW91IChvcg0KS3J6eXN6dG9mKSB0aGluayB0aGUgZmxleGliaWxpdHkgaXNuJ3Qgd29ydGgg
a2VlcGluZy4gSXQgd291bGQNCmp1c3QgbWVhbiBzaW5nbGUtY29kZWMgYm9hcmRzIGFsc28gaGF2
ZSB0byB3cml0ZSB0aGUgaW5kZXguDQpXb3VsZCB0aGF0IGJlIHByZWZlcmFibGU/DQoNCj4gPiA+
ID4gKyAgY2xvY2stbmFtZXM6DQo+ID4gPiA+ICsgICAgaXRlbXM6DQo+ID4gPiA+ICsgICAgICAt
IGNvbnN0OiBzc2ktYWxsDQo+ID4gPiA+ICsgICAgICAtIGNvbnN0OiBzc2kuOQ0KPiA+ID4NCj4g
PiA+IFVzZSBjb25zaXN0ZW50bHkgLQ0KPiA+DQo+ID4gQWdyZWVkLCBJJ2xsIHN3aXRjaCB0byBo
eXBoZW5zIGZvciBhbGwgaW5kZXhlZCBlbnRyaWVzIGluIGJvdGggbGlzdHMNCj4gPiAoc3NpLTAu
LjksIHNyYy0wLi45LCBtaXgtMC4uMSwgY3R1LTAuLjcsIGR2Yy0wLi4xLCBhZGctc3NpLTAuLjkp
Lg0KPiA+DQo+ID4gPiA+ICsgICAgICAtIGNvbnN0OiBzc2kuOA0KPiA+ID4gPiArICAgICAgLSBj
b25zdDogc3NpLjcNCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IHNzaS42DQo+ID4gPiA+ICsgICAg
ICAtIGNvbnN0OiBzc2kuNQ0KPiA+ID4gPiArICAgICAgLSBjb25zdDogc3NpLjQNCj4gPiA+ID4g
KyAgICAgIC0gY29uc3Q6IHNzaS4zDQo+ID4gPiA+ICsgICAgICAtIGNvbnN0OiBzc2kuMg0KPiA+
ID4gPiArICAgICAgLSBjb25zdDogc3NpLjENCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IHNzaS4w
DQo+ID4gPiA+ICsgICAgICAtIGNvbnN0OiBzcmMuOQ0KPiA+ID4gPiArICAgICAgLSBjb25zdDog
c3JjLjgNCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IHNyYy43DQo+ID4gPiA+ICsgICAgICAtIGNv
bnN0OiBzcmMuNg0KPiA+ID4gPiArICAgICAgLSBjb25zdDogc3JjLjUNCj4gPiA+ID4gKyAgICAg
IC0gY29uc3Q6IHNyYy40DQo+ID4gPiA+ICsgICAgICAtIGNvbnN0OiBzcmMuMw0KPiA+ID4gPiAr
ICAgICAgLSBjb25zdDogc3JjLjINCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IHNyYy4xDQo+ID4g
PiA+ICsgICAgICAtIGNvbnN0OiBzcmMuMA0KPiA+ID4gPiArICAgICAgLSBjb25zdDogbWl4LjEN
Cj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IG1peC4wDQo+ID4gPiA+ICsgICAgICAtIGNvbnN0OiBj
dHUuMQ0KPiA+ID4gPiArICAgICAgLSBjb25zdDogY3R1LjANCj4gDQo+IFdoeSBhcmUgdGhlc2Ug
bGlzdGVkIGluIGRlc2NlbmRpbmcgb3JkZXIuLi4NCj4gDQo+ID4gPiA+ICsgICAgICAtIGNvbnN0
OiBkdmMuMA0KPiA+ID4gPiArICAgICAgLSBjb25zdDogZHZjLjENCj4gDQo+IC4uLiBhbmQgdGhl
c2UgaW4gYXNjZW5kaW5nIG9yZGVyPw0KDQpUaGF0J3MgaW5jb25zaXN0ZW50IGFuZCB0aGVyZSdz
IG5vIHJlYWwgcmVhc29uIGZvciBpdC4NCkknbGwgcmVvcmRlciBldmVyeSBibG9jayBhc2NlbmRp
bmcgKDAgLT4gTikgc28gc3NpLCBzcmMsIG1peCwNCmN0dSBhbmQgZHZjIGFsbCBmb2xsb3cgdGhl
IHNhbWUgY29udmVudGlvbg0KDQpSZWdhcmRzLA0KSm9obg0KDQo=

