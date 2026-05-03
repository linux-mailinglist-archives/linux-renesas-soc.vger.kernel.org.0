Return-Path: <linux-renesas-soc+bounces-31892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JZc4MWYU92lcbwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 11:24:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D394B50D6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 11:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF3D2300916D
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 09:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0465F3ACF19;
	Sun,  3 May 2026 09:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TR09Vcrr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011023.outbound.protection.outlook.com [40.107.74.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4ACA30E0CC;
	Sun,  3 May 2026 09:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777800291; cv=fail; b=lFm++7JG5JOeHsl0ARGuUr9rCyrmxyurFmvn8DdUlGnEKsI38XYIR2V1NjBJ2yhQox7oW0EUerkmYlvvvazS32YeVrCCB08w3VDSfsItRnmOJXMEw6S2SvB5BaUCMFmr3SXd5OaCNv9GYGC8xuWugva/FgqOo6SMnk6Nh4dxfoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777800291; c=relaxed/simple;
	bh=3Fr/AlpUEUHlieV6pyx923zYiU703DkIlE9cB7uGPhY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pZp+NODznifRrEsgnNj+YNsllE8h86b8vvpN0x9B00qP94/Apcm4Fgh48Ik8UVmHSSLxnxDzCsR4+xlQTBe3k/rXdwDijHVH1Iv7gYxijgXo3+6zWt/yFVJZmhOBKfRirpNzWJUCZk3e3MNzCMEInFmscnyPcvbeI3qSZRApORY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TR09Vcrr; arc=fail smtp.client-ip=40.107.74.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdkRz07d8LVU/32rTtq7r1dQu16jrl8Z7Xsr3gaQ9D6a5Agp0HA5MJAs960TWxs8k2+IIeVSagMl13mOiSRSoIY4XZPg+chiqdUlBmdUvFsfYtht3oBfQkDgGRlFZRV5La9SUINsATVUf1t01aK1qPUGypy9f8GoeyYolHEzkvGnX6oz5lr+TEmX5DhJAnF1Uf2dB6lsns+oM98quyYzs/trXXpNxPi0EuRrzANfUBCcfM+iY/LyWr8pbeDc+dQCTtEZce1J178LXho8Q+Ir+c6SoroM7R6YlmAhPrJNbba5ParZROkE6kj6SKpyan/GBlbdrniCnZT40cgHSPArFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Fr/AlpUEUHlieV6pyx923zYiU703DkIlE9cB7uGPhY=;
 b=kTtb0BmsQq8TlRFWOkTqxlb4HL/n5utz5xuiYoXufuYiVcTrTJPgDkTi0pz1ISw/x6LWl5pp6Yvw2EGvEjnf3kyDSGZeAGiSbWLX5CX4KKx7U2i9NnvfhKo/2ci++yD/U2tdHnUpvSxAIwfWBdhI537oY/OrOtf37dfj2c5yeIj3RtRsnlDQE7dUmDUMWw83fo3e0N1KwNaFJdtf9XjtoSFocHMDvYJ9H1x1VM3+kBxj+ZK+8gmBMfsVXFbVRLIbduY29yavJl5WsANhdYVOmtLQhYT7P4U182CQaWZ8eZabjYcwiKoDT59x/pa0spabBkErswUzy/TEsFuzq5Qu2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Fr/AlpUEUHlieV6pyx923zYiU703DkIlE9cB7uGPhY=;
 b=TR09VcrrakdRR3/LBdczU8ebsA7SmgChV52iFHcyqjgJ7nd3pB3atC2nFd17aqpJPNYEVIzUx61WzPNeSdkZy/gmaNDeU9hOCJlpuaxaueWWmaFRW/SByz5m1hRITHayej7dMebu0sIfYiKL4IU4WtFSRIAj7KST01XH4SywRXo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9418.jpnprd01.prod.outlook.com (2603:1096:400:197::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Sun, 3 May
 2026 09:24:28 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9870.023; Sun, 3 May 2026
 09:24:13 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Josua Mayer <josua@solid-run.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>
CC: Jon Nettleton <jon@solid-run.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 0/2] regulator: raa215300: add support for
 configurable 32kHz clock output
Thread-Topic: [PATCH RFC 0/2] regulator: raa215300: add support for
 configurable 32kHz clock output
Thread-Index: AQHc2k3KnSEKAXB8J0ylNkZwLvu1irX8A5CA
Date: Sun, 3 May 2026 09:24:13 +0000
Message-ID:
 <TY3PR01MB113461362FA13333641F6EB4A86302@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
In-Reply-To: <20260502-raa215300-clkout-v1-0-fd1c2a240963@solid-run.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9418:EE_
x-ms-office365-filtering-correlation-id: 804fd87e-8c6e-4f9b-4533-08dea8f5bdcc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|22082099003|18002099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 aQFBYIykwRKl+lagAbwROukxjROFq3u2BSprHg7wzx3BaUYW4tJbP3BpKdaISbBDSp7oJX5c6XSDDGclUsmM5AynBLIpKsHDXNIKS4LWUkqMtTC1u1M9AJht0RDGHN59zrb2mNm8RZyRNo+nXFOnGq6FyuCQU94PEDxsJtmGcYvJSq+GEvZLCO4RZ07a0NCXcAeUBQd6df+hGSikpDZPouNR1J7PGfKQwCHozLgWKQQdPvPPZpdWhVK129hAz/7/gtb8bn2CAf8wDKrB6whLO62dfanBBDEwhxNybM1XRAQoWJXc85HCdsusp7tpwWWvi/+SPrud1scOp6CdSanayEF6W+JCPClJf8x2IkxF5JIHUz0UvpfCKeT/gEn5FKKND8QmBjnMcv8uw0L7z/42rbxUEfdvx/UOzJ4F5Ig0wmLduETr78yxOPy5DhpzQXkOAQEFM1rJ8TvH24fDB/u4gk9aQsfbsPC4fAlL6jJgbKGvRNrCCx79Xa8pT5y8JHbXqcYOr+x2fOas0S1cRQ271leSxKOire1Kdx0crnYG3MxkPrBMPCtQUku9wqrJZDS4OsnVHSnPGRQWjfA88DIKxXb/ylwhFobWq6fS5qNKhz5FLhERwYdXtd7a+fjf0apMgUkGECBY10VNBKKaW5U3UxMAU4uHPmSnqJYhh5sflUnS/AFtJ27cg6xAQeeB8EGxCKHLPJxHLiaGo+AKGidCymc3ooIg5YyxVivgTun6XTYtOGHWlsNRi/XDeYuMDSJ9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(22082099003)(18002099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N1RKdmc1Z3FDZXFqR0VyZ2Rwc3hmN0lodnJoVnUvNkd0Q1JZb1pVVFFkc0lt?=
 =?utf-8?B?Qk14eW55UEZTVVdMelhGNWtsMmJsemtzT2lPZ2syNis0WmZXQ3E2UjRlV2NK?=
 =?utf-8?B?MGNLYUtUNjZBT0xqRldiUlgyN0VpNlI3V3pyMXdmTDdVMHJKTG5HNThGV0xp?=
 =?utf-8?B?TFMyRjdxUzBLc1hkUTRjTmo0RVJaV0x0N29adVhFMFlVVnhrVDM1MDREbENU?=
 =?utf-8?B?REVHTUkzbGVPcllKUi9hZHlDRWVhTmMyTFY4OGFQOVdXOE9TZ2x0bXlNVHpB?=
 =?utf-8?B?b09JamxZdFhwYWxqVDY2VC9vcUtwNkZNMVo0aElma0J5SXpWSVUwd0JSTlZV?=
 =?utf-8?B?cVFpOXBTU1E2NUVaS1FRRnZQeTAwek03MFNvVldGZG5CUEo5QkFCVnFNRDU3?=
 =?utf-8?B?TittV2s2Z3NyTEdka2oraFR3elduY25KbGRjdTFCYnE1YVFBY051T0ovcmR0?=
 =?utf-8?B?bzd1dXo5ekhZUmtycmFUTXRKeGdXdDExeFUxY1Vtb2Zsd0pldithOVpsaXNk?=
 =?utf-8?B?ZE5SRkNGRG9pTGlqWTFaRndPbktwL1VRazFSc2ppWkNEVklDdTNUenY1cEJy?=
 =?utf-8?B?Y2NOelZoTFdoWnFWSzdJb3hvMVRaUVZGaU5UK2cyUkZ4VVVJK0FIUENaaEZJ?=
 =?utf-8?B?NkxhcFpQVzlrTHBhcko1SW56QlY2VHZUWHpTVytNZTFoRHpOV3dBMWNZOURK?=
 =?utf-8?B?MU5aVFp5TFJ1UmlBWUVDdUN6NjVvblV6NXZNS1AvK1h5TlZCZm51ZGhhdnVk?=
 =?utf-8?B?MmRQaWRXUW9qN21NQTlBdFZBcHpqVElKcnlVNWQwV01CUnF4OWdrZW44ZFNp?=
 =?utf-8?B?eHdMeWtab285bFYweUtJN2dTakZQNVNJL1JRRFp5cXJGYlpsak1NQVRCY1pI?=
 =?utf-8?B?Wlk2RG5BNnNnejJFSE9QYmljQ2M2NFFlb1hvMHgyZTVWZC9rMEtzUWxNUW41?=
 =?utf-8?B?ZEY2aXFBVkZvSTZJT2RWMGRJbTdNRkc4K3hxNjJvbjUzTGR5WE85cHRhSFY3?=
 =?utf-8?B?dWVUZEFEUHQvMlYxMVVGSFBEeDlPMC93WlRHazRYa0lQNWxYTjJSL1d0TGdE?=
 =?utf-8?B?VFdOQjFKMjloa3ZpcCtQQ0FLUmkxQUcxS2NpYmtVM3UvZEM5OUZxa3R2eGNV?=
 =?utf-8?B?K1kvWHlVdE5ocEdSZ00zVDAzVG5IWjN5SUo0ZG5QZVV3TUx4Y3FEOWg2MWZp?=
 =?utf-8?B?RDAzQkRXL21mUHozWVB2Q1ZPSWd1dlF5Nmg4dTY5VHB1SUNTTWZoN3AwNjlX?=
 =?utf-8?B?OW5tR1FDQitZdHhTcW1RSUNaaXRaOXd3NGFmV2wrSlRQZkFwNmRYM2VlbVh6?=
 =?utf-8?B?QTgwaitoZGlWRWFlWXZrRnBZNWh0NW1lVjZTd3RBRk5PejNSUGpMUS8xMjVw?=
 =?utf-8?B?bndPcEo4ZW9URXo4VjQ3d3JXOHZkREN0OWpUejZkSUNRNzRjVUVwdktmVGd4?=
 =?utf-8?B?SkpjV2tUa2VNNVR3ZG9OVDR4cDFUVWVXSkVCT3ZBVnd1T2kvaFFZRW1XbzJs?=
 =?utf-8?B?WUFOMzUxakE0TlZ4b040TVRWdVc5b0VuTSs1enhwTzNMMmYxbzllZStFS3M3?=
 =?utf-8?B?dW5mdE5QRDJJcTF4d01CVVI2OUVPdjFneGxxVGYwdk5LY3AvdC9KVXRiSGRv?=
 =?utf-8?B?eXVvSzAvdVM4aFBCcDh0VTFoekM1V2FVT2pzeUtWWk96aTFqbDR1T01PSWtv?=
 =?utf-8?B?blJDbHVjVHVPMGhkY0ttS2FiWkgrRlJ3cHNJOWJNSHNBMU1pMSs3NFI2N01N?=
 =?utf-8?B?Wlc0TUZWZ1kySElvdXNtYndTWUczTTdIemM3UjNTT0VuYzY2NE5HS3pQenJo?=
 =?utf-8?B?S3dNUVQ4M3AwTU1aUHNpTlUwRjNKb2svejJXRnV1RldmMC84QUhPU2V0ZkFi?=
 =?utf-8?B?bEtuT2hwQ2J2dGZGaTBaWHJ6Mm1vSEcxcWZIc3VIQTdhTmh1VU5sNENlMG01?=
 =?utf-8?B?Zk8rVVpSQk1uajJpUFd6b2tFczZvbnhMOEFPSm1JMmV6OENwRmZhdkdVbVVO?=
 =?utf-8?B?WnNleCtBazZMd0F0eUIvL3dSLzlYWmtPTGFxZkFEWGxZUUNCZ2FaTGNlcHE2?=
 =?utf-8?B?TVU1UU5tZHRBaEZNNGZLOHZEaU9nYmNKd0FKcWhreUZIc25TcjJ5TmlFTWpV?=
 =?utf-8?B?ck5qNjdnMnhKWW5Zd1lrUU9yZ0plWUkySjl1TTVOT2Zxa0RBZWU2YlAzVUUy?=
 =?utf-8?B?KytEYjk0ZjI4SE5OWi82eUtHUytTNlJCWGdtQkhjdEh5MVF3TFlZTS9RWVJ1?=
 =?utf-8?B?eWJHVHhoZFd4alJ0SUQ1UHVaL3lqV3d3MDd1QXJIUmtuVWgrVWdYdG1VUEMx?=
 =?utf-8?B?NkgvSllZcVVhaitjYWp4UjNYWXhYT0crR0p6VEFlV0xXUWNWS0dQdz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 804fd87e-8c6e-4f9b-4533-08dea8f5bdcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2026 09:24:13.7438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nlZsurgLaa1skixIIko6paeb7d+nLmWYiZG9MzcPRS0ceETmJ1jn6zKwRt/W57qnbUxjox0/uc89uCowrFRAD2hRjZX4bqKqxnFfi/74ySs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9418
X-Rspamd-Queue-Id: 45D394B50D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31892-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[solid-run.com,gmail.com,kernel.org,glider.be];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,solid-run.com:email]

SGkgSm9zdWEgTWF5ZXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
Sm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+IFNlbnQ6IDAyIE1heSAyMDI2IDE3
OjA3DQo+IFN1YmplY3Q6IFtQQVRDSCBSRkMgMC8yXSByZWd1bGF0b3I6IHJhYTIxNTMwMDogYWRk
IHN1cHBvcnQgZm9yIGNvbmZpZ3VyYWJsZSAzMmtIeiBjbG9jayBvdXRwdXQNCj4gDQo+IEFkZCBk
cml2ZXIgc3VwcG9ydCBhbmQgZXh0ZW5kIGJpbmRpbmdzIGZvciBSZW5lc2FzIFJBQTIxNTMwMCBQ
TUlDIDMya0h6IGNsb2NrIG91dHB1dCBmZWF0dXJlIG9uIHBpbg0KPiBNUElPMi4NCg0KDQpTbmlw
cGV0IGZyb20gaGFyZHdhcmUgTUFOVUFMIFsxXQ0KDQpOb3Qgc3VyZSwgZG9lcyBpdCBuZWVkIHRv
IGJlIHBhcnQgb2YgYSByYWEyMTUzMDAgcGluY29udHJvbCBkcml2ZXI/DQoNCkZyb20gWzFdIHRo
aXMgY2xvY2sgZ2VuZXJhdG9yIGRlcGVuZGluZyB1cCBvbiB0aGUgcGlubXV4IHNlbGVjdGlvbiBv
Zg0KTVBJTzI/DQoNCg0KWzFdIA0KDQowMDA6IERpc2FibGVkDQowMDE6IDMyS19DTEsNCjAxMDog
RXh0ZXJuYWwgVlIgUEdvb2QgaW5wdXQNCjAxMTogSW5wdXQgdG8gSTJDIHJlZ2lzdGVyDQoxMDA6
IFBHb29kIG91dHB1dA0KMTAxOiBSZXNldCBvdXRwdXQNCjExMDogRXh0ZXJuYWwgVlIgRU4gb3V0
cHV0DQoxMTE6IE91dHB1dCBmcm9tIEkyQyBvdXRwdXQNCg0KMzJrSHogQ2xvY2sgKDMyS19DTEsp
DQoNCk9ubHkgTVBJTzIgc3VwcG9ydHMgdGhpcyBmdW5jdGlvbi4gVGhlIGZ1bmN0aW9uIHByb3Zp
ZGVzIGEgZHJpdmVuIGNsb2NrIHNpZ25hbCBvdXRwdXQgZm9yIGV4dGVybmFsIGRldmljZXMuIFRo
ZQ0KY2xvY2sgZnJlcXVlbmN5IGlzIHByb2dyYW1tYWJsZSB3aXRoIGEgbWF4aW11bSBzZXR0aW5n
IG9mIDMyLjc2OGtIeiwgd2hpY2ggaXMgdGhlIFJUQyBjcnlzdGFsIG9zY2lsbGF0b3INCmZyZXF1
ZW5jeS4gVGhlIFJUQyBuZWVkcyB0byBiZSBlbmFibGVkIGJ5IHRoZSBSVENfRU4gYml0IHRvIG91
dHB1dCB0aGlzIGNsb2NrIHNpZ25hbC4gSWYgdGhlIHVzZXIgZG9lcyBub3QgaGF2ZQ0KYW4gZXh0
ZXJuYWwgcHVsbC11cCB2b2x0YWdlLCB0aGUgTVBJTzIgbmVlZHMgdG8gYmUgY29uZmlndXJlZCBh
cyBhIEZ1bGwgQ01PUyBvdXRwdXQuDQpXaGVuIHRoaXMgZnVuY3Rpb24gaXMgc2VsZWN0ZWQsIHRo
ZSBNUElPMiBQb3dlci1PZmYgRGVsYXkgcmVnaXN0ZXIgQml0cyBbMzowXSBhcmUgdXNlZCB0byBz
ZWxlY3QgdGhlIGNsb2NrDQpmcmVxdWVuY3kuIEluIHRoaXMgY2FzZSwgQml0cyBbNjowXSBpbiB0
aGlzIHJlZ2lzdGVyIGFyZSBubyBsb25nZXIgdXNlZCBhcyBhIHBvd2VyLW9mZiBkZWxheS4NCg0K
Q2hlZXJzLA0KQmlqdQ0KDQoNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvc3VhIE1heWVyIDxqb3N1
YUBzb2xpZC1ydW4uY29tPg0KPiAtLS0NCj4gSm9zdWEgTWF5ZXIgKDIpOg0KPiAgICAgICByZWd1
bGF0b3I6IGR0LWJpbmRpbmdzOiByYWEyMTUzMDA6IGFkZCBjbG9jayBvdXRwdXQNCj4gICAgICAg
cmVndWxhdG9yOiByYWEyMTUzMDA6IGFkZCBzdXBwb3J0IGZvciBjb25maWd1cmFibGUgMzJrSHog
Y2xvY2sgb3V0cHV0DQo+IA0KPiAgLi4uL2JpbmRpbmdzL3JlZ3VsYXRvci9yZW5lc2FzLHJhYTIx
NTMwMC55YW1sICAgICAgfCAgIDYgKw0KPiAgZHJpdmVycy9yZWd1bGF0b3IvcmFhMjE1MzAwLmMg
ICAgICAgICAgICAgICAgICAgICAgfCAxMzIgKysrKysrKysrKysrKysrKysrKysrDQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDEzOCBpbnNlcnRpb25zKCspDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogMjU0
ZjQ5NjM0ZWUxNmE3MzExNzRkMmFlMzRiYzUwYmQ1ZjQ1ZTczMQ0KPiBjaGFuZ2UtaWQ6IDIwMjYw
NTAyLXJhYTIxNTMwMC1jbGtvdXQtYzNlZDg0MDI0ODg4DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+
IC0tDQo+IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0KDQo=

