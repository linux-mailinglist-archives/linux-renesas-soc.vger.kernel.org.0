Return-Path: <linux-renesas-soc+bounces-33688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5TcDDYzfJmqqmAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 17:28:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DE56580D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 17:28:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=eYpAzVMm;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F878307D1DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 15:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A62D37DEAA;
	Mon,  8 Jun 2026 14:46:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81F633343B;
	Mon,  8 Jun 2026 14:46:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929963; cv=fail; b=XQFAEj8GFuaYyqxyerFAgF6rpkGzeuPosbdK20pExUMBYMNpVzsxN5o4m1JVxGL5mD6eOuFYN4cfBz9czCVAZMvWhYNzeh7rnpGWpXB+z942vMQpFzsLWcplZuioWMTLCmxnsXdvTTJjOOy8fg+WnHTW8XC2IQYXkZfHtxkVW/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929963; c=relaxed/simple;
	bh=2tRw9nKLWvzEWgdhdGLYB89BzG3ftRApAPn8e7hm1UY=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oqgRF5ulHE1S9JhfBx6bdHjQ4cvqLdmU1bsoKlaPJIWf21v4Yrgksky47AXV3nUG30r0d8FuZGu0n4M1AYvn4gdfWAk44mmnFuTN5d/kEyJOaN8m8yLd56KCVf800hcCdBte9aHKiDTj44I1KBY5084PD8Ouy7Te8I4Qbh8vGz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eYpAzVMm; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuffrHC8BwDtwVBnPJE9BL3i3BxQ7Istlt85GbPRJ+Pya1oa9lJZCOnUI1yoKzVa2A6LIQ9VHsb8Fe6+IAMTC1g2BhYxBKMmEAf9IhiOZXHQ7khyJPL/fS2jt2GRzTfDiGi4q33zx6u/S1yTMI6xxsbLPrPQA9WBiV7/LAIdFufgDpVx5cywRom9Pm4U00BTSO54PFQlmt6WZ2vIIhrgBbADgR662ZElZjxuP3LQgQbBUdpFLCZPWAwB0sRJKYg34UetNHqIPmsKM8s97HKffATsNuSBv4Yo+m3diZblJPFL3iwk9HH9uqHaxH6X4YqcDmF+YYA4FOY167AuLZjoFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tRw9nKLWvzEWgdhdGLYB89BzG3ftRApAPn8e7hm1UY=;
 b=X+B9Cfe+mTGbUSccOvYVqkU8LerM5ndFBEFGyS6W344koSi7xjnwgzw4dGZTtbypsLB3CTFX1LKGv7nSR5gUK6fSfwtCZB8crz5tBF+BCXL2fCtC65d2j/IbILIHygWA0GinpNh1jWNmb+wHoHaWOIa3HoX0dFT4tvsakW3/FDdhFjM5xZ6pwugBnpql9PStS5bsYNF5kcDhKXVMgM1ue82aLMalD0A8AA9f3c3RPVOXXGexvZdNhsK5BkWPoO3NE2JWWNvht6DtzLIKME+cpkD8FSNJvmRSs2myGyUG9QppEYR+fNcC3GvjEfsfIXFcFu1Ca0nouOcEoryKt3IInw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tRw9nKLWvzEWgdhdGLYB89BzG3ftRApAPn8e7hm1UY=;
 b=eYpAzVMmUaj0mTiSJukWLya0XSXFdPXCkFxfdV241Akk7bgtX7RSv8anbrB9UPtvDNNKlmguczgixpl9bV3ZSj0NU5vx0V+WDc5YahgncInX+Bj80+1I3DeD4N40WsubZybSFi+D/iad4KEiz8STZSzXkptiYslFoGGAPrjL9vc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10038.jpnprd01.prod.outlook.com (2603:1096:400:1ea::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Mon, 8 Jun 2026
 14:45:59 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 14:45:59 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: mfd: syscon: Revert
 renesas,r9a08g046-lvds-cmn
Thread-Topic: [PATCH] dt-bindings: mfd: syscon: Revert
 renesas,r9a08g046-lvds-cmn
Thread-Index:
 AQHc9z2t0rzHysclGU226VvULbQLWLY0jbuggAAD0ACAAACVgIAAApEAgAAID7CAABIzgIAAAYPAgAAA3YCAAAsBwA==
Date: Mon, 8 Jun 2026 14:45:59 +0000
Message-ID:
 <TY3PR01MB11346B66B60E6EDC7911E65E7861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260608115507.134969-2-krzysztof.kozlowski@oss.qualcomm.com>
 <TY3PR01MB113460B7F122E23FAC4D35502861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <c4ae68b7-d423-4714-8415-679671467ac5@kernel.org>
 <TY3PR01MB113461D43EFBA56BAE7C8F403861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <5f1b0d7d-3105-4371-a603-7e7bacd5f112@kernel.org>
 <TY3PR01MB113466F579F4093217DAA6B70861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ae311746-b395-403b-bacc-33a52438d704@kernel.org>
 <TY3PR01MB113466CBF5A413E7B432C19C8861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <47930db6-dcaa-4292-a21b-b489a1b51800@kernel.org>
In-Reply-To: <47930db6-dcaa-4292-a21b-b489a1b51800@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10038:EE_
x-ms-office365-filtering-correlation-id: 34675fa2-e185-49e0-eec7-08dec56ca79e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|11063799006|4143699003|3023799007|56012099006|38070700021|18002099003|22082099003;
x-microsoft-antispam-message-info:
 regsHnO78v0kjgCZyg6NJ2mxVZ95qaoXdYmdkWPdkAIrRHAgUxDsGuSLRa20+0rY3L+92r9V7BrbQWoUWcksSCz4YcDR63IVo431jrOMpxBrGZt3qCcCR6YmadLQdU5QxjkTyUVmUn1qPvvYAdzMv9USgN98yI/4erL1udMcWN6EUtTaGfPrFABTHcwXR+3gmemd9z+KGtCG+gLfs6En6NRS2my6lYtoak7IRo2b3O5diCgVOtPSE+J+d00v1rsOP8QmkeBxqNM3MjZ/6uZGpQ46JWMQ2J1ex39W68qGcS4UdVhl4wkTEBVnOmpGed307LlRMoTuH50cwwFIXk83HrkNy53AzBCmjjDPQQL3xsTTOKr9/zyTiIVV7ycxz9GrhkJOgznC5HkXV2sr4k/YAIrt8ZOLFA1I6MgCa4FOxnYjsw1Xxuhi2y9qoUxvzmyVu9JTBGqQrhEavMriQ9O0pspz1j2GRdRg7bIfl7zMUMgn+pO40Mu524b/3BdQ3PGLtTVJEkJFwqQyaYU6p+kWdwXc0/Ga6QSLjKFeEyuV+EFgXW0Y2ZzGC5WsazE9z65VlW8k3XVWPApoMZQJCDntguOhxUowBfek+PS9w1MJoCk9aQ4RCMaygU8wqayaa464C+uslPvaSysajwiPbK9o19HbxSpD1DWsV7DM6WrWzaoHhX73UuJq22FiaG8B8NiIcyyO7MYD5WUfX8b7niERfiSh0wXyoBGgfw3wZjLsP57TUUejsmW5hb2iEHGrAnZQerXMsEJdmpLx2kgpTVVQ6A==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(11063799006)(4143699003)(3023799007)(56012099006)(38070700021)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WEJRSnNlcExXcWFlVm9wVEhtaExRYW0rd0cvOHYvQkxxTVVnK0c3MldWV3V6?=
 =?utf-8?B?aUV4OTBYQkZ2VGwzaHdKekVNUW4xbFFwWFRHZUl5UVdOSm01WjlrYVNBSUhN?=
 =?utf-8?B?Mk9kU21YQVE1dzRzU2hkem91SkxMeWNBeUwrWG9UTDJzeEFsNjhjK3JNRG53?=
 =?utf-8?B?R3VuTmZNNko1cjhkWFd2aG9GT1kyTnRIeW1TSkd5cnNXWGtxMURHRkpjLzJw?=
 =?utf-8?B?aDN1YWpRM2h0eWhBU2F4R3dZTWJ1bW8yUEhYRllLR01uOUlTUjN1ZGRCTGZx?=
 =?utf-8?B?dUdYYkFkenRvZ1c3elphRGYwZHg1RU4wZUhTbTdwcUJIZ0xpZTdtNk53TmZq?=
 =?utf-8?B?eXJ2Um9QWUFJMGM4LzRKdVMvQS9zeWlva0JqYW1ISEZ0Z0RTSmhwSXNEU01n?=
 =?utf-8?B?TlcyZnZTRE5jNHRlSmcwYnpFSDJrZDhxNHNEU3FKb0t5OUN2K050djNxa2pH?=
 =?utf-8?B?dmxPMEZRZk82N1FoYStWMVpHUWRucHFQc0szVjQzTndwcVhWYkdnaVlac2hM?=
 =?utf-8?B?ZExQWWhnc2s2WERJZWV2L2RSZFVmdFhkeDc3bkpqc2lmWjdxNnBvbXJrak53?=
 =?utf-8?B?YzNoTXRYeUhHU3dtNVhpMFlVTzRTZytXZmM2S3NpTjRBVUZtZ3hZMkk3NHlY?=
 =?utf-8?B?WEVMSmo5V3Z3MVNLa3E1cllqNDRzSGgyajBCdURZMnVCVys5RkJIYmdHaFBW?=
 =?utf-8?B?YUxSQjQ3d081T1FKbncralV2N2VSL3lWWm1SWSt2N05Fb09NbktPSzR0RWhv?=
 =?utf-8?B?VER6aUdwYXV1cTFlQzZhdG1HTjdBMXJNdHFNcXN6cGpQYVRIRjd2MVo0ZXJh?=
 =?utf-8?B?cWdaNGVRUDZnakpYV3RMbDZiNjVJNDd3dUpwQks5MEMzRjFpNFg1eDVVYlkx?=
 =?utf-8?B?TWhtdkRyd0ozYmFEcXd2NjU5bUFEL1JOUEs5NXVMeDdnOUNoa0MwZWJyazRl?=
 =?utf-8?B?UDExTUpLZkQxUkE5NTF3ajNGUEF3YkdBSENmTzBBVmg4TC9sclZQdkN1d1dr?=
 =?utf-8?B?ZjRhbUYweTV2OWFoMVA1T2pBTG9BajFTdGpoa25jT25uMUZOdXJ0ZFRmd1ky?=
 =?utf-8?B?dmtud3NBT0d2dEFaREo3dm9hWjM0eGNmMmVBa0FIYVVpeGRuTllyVzBldXVt?=
 =?utf-8?B?b2JVY2Fza3gyeG1LdER2eDl5Qy9HUkViZWg5ZCt1U2o2Vjd6aTFlaHNvWEl4?=
 =?utf-8?B?MkJJcjNKOUUycUhhWE54VnZzd1VJWVliRE1NTkN0cDZzTEJWVG9LQ09zU0JF?=
 =?utf-8?B?MGVVaThES3hPRy9uM2xzMlF5MFBDRUw4RG5Ed3hneXdJZ2M3RFJBQjc4UWoy?=
 =?utf-8?B?WHVMbHoxaE95VHVMZWZBSGd1U1E3THBiV3VlQXpTTG5UREZMZWRpd3JNYTlI?=
 =?utf-8?B?QjkxcjRiSWF3NmJFcE4vOHdxWVZiRmdNeEtPays3TTV3a1c3bkg4RlkxMG8r?=
 =?utf-8?B?ZlA0Q3NCb0h4L002c0hpYXQ2ci9hVTU3Z0hPWGhQMFd0ME9sU1VqMFFBMXlQ?=
 =?utf-8?B?cmxDRkdMTGpreUlaQlJ2bHR2R09La1VGZk82SG43QnBod1Byb3VnY2p1RGlX?=
 =?utf-8?B?T0RnREVFVWxrR2xOSVNMNHczMTY5ZFAxRGh0WFY0L0VkTjBlL2JJLzJPLzc1?=
 =?utf-8?B?QjV1WmQ3VFVlR3NlR3FDYTRZSHR2VUIxSGQ2OTJqYmRLOG1QNUNGekVHb2lU?=
 =?utf-8?B?SjFVNDlpeXN2dnViSlpPZ0FCZTZUZXIvc0hodVBQYWpOVThndm1ZUmFZUGZL?=
 =?utf-8?B?eWVNczdnbmJwci9YMkhxeThNQVFrakhaNDJCMHBTdzcrNFVPNFNYbUc5WXow?=
 =?utf-8?B?TWFxcW5TYWtVOE1LQVJwZWhsT2dkVjF5QjJ4KzZVY2gwTjY1cWplMkVZZWxC?=
 =?utf-8?B?MG1rcUhnajlvQmJGeTJ2dTlSL2NBMUhVYnB0RVY3YWNoSkV3dEVzNk9rZWNG?=
 =?utf-8?B?Q3h0SmFVQm5Kd202L1V2dktSQnYrcDZRa0JRVE5GU1BsUmNXZmdTK3gvRC9z?=
 =?utf-8?B?V056Y3VCeS9zazIrTVFBcWpxVmswZ3VnK3VOZi9jWDZ0eEl1V2J1Tm1BdDJF?=
 =?utf-8?B?UXdSazhoWi9TeVRRZG1HWU9rUzlSK2I5VEw0Z0JEU3dsUEFmdnZGYUw2dDIy?=
 =?utf-8?B?WDdXejZaaHFCOGNMbktrM3lHMnBBWTZmZ0hReHk5cmFZK1AySmRESFRHT1Jt?=
 =?utf-8?B?MXovRmNWTGVtTWIweDdoVGdoT0ZSclI1QTFsT1RVZkVyejBoZERaMk9zdktS?=
 =?utf-8?B?eXhpY1lOd0hKVVZEMGlROHNKeGQ4SHhJNlRvWmVDby9RVW16QVpvLzI4SXVU?=
 =?utf-8?B?VTM4NWN0U3lUd040aG4xdHc4SHozMVBvR1BUM3RZNjRlVCtObDhPZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 34675fa2-e185-49e0-eec7-08dec56ca79e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 14:45:59.2139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vWFF+j5WzBmI6XVAi/kPHw4HA9wjn6GqA8OEi0VvkDysXd58kPbdgpT53nJO91Gu41TObfq1z9dg4JuVAQ96zFtWCKasi+7w78XH5IscbRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10038
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33688-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:tommaso.merciai.xr@bp.renesas.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 64DE56580D7

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDA4
IEp1bmUgMjAyNiAxNTowNg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogbWZk
OiBzeXNjb246IFJldmVydCByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbg0KPiANCj4gT24gMDgv
MDYvMjAyNiAxNjowNCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgS3J6eXN6dG9mIEtvemxvd3Nr
aSwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+ID4+IFNlbnQ6IDA4IEp1bmUgMjAy
NiAxNDo1Nw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogbWZkOiBzeXNj
b246IFJldmVydA0KPiA+PiByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbg0KPiA+Pg0KPiA+PiBP
biAwOC8wNi8yMDI2IDE1OjUzLCBCaWp1IERhcyB3cm90ZToNCj4gPj4+DQo+ID4+PiAgIHJlZzoN
Cj4gPj4+ICAgICBtYXhJdGVtczogMQ0KPiA+Pj4NCj4gPj4+ICAgIiNhZGRyZXNzLWNlbGxzIjog
dHJ1ZQ0KPiA+Pj4NCj4gPj4+ICAgIiNzaXplLWNlbGxzIjogdHJ1ZQ0KPiA+Pj4NCj4gPj4+ICAg
cmFuZ2VzOiB0cnVlDQo+ID4+Pg0KPiA+Pj4gcGF0dGVyblByb3BlcnRpZXM6DQo+ID4+PiAgICJe
bHZkc0BbMC05YS1mXSskIjoNCj4gPj4+ICAgICAkcmVmOiAvc2NoZW1hcy9kaXNwbGF5L2JyaWRn
ZS9yZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLnlhbWwjDQo+ID4+DQo+ID4+IEkgY29tbWVudGVkIG9u
IHBhdGNoIHRoZXJlIGFib3V0IHRoaXMgLSB0aGlzIHByb2JhYmx5IHNob3VsZCBiZQ0KPiA+PiBz
cXVhc2hlZCBpbnRvIG9uZSBkZXZpY2Ugbm9kZSwgdGh1cyBubyBuZWVkIGZvciBzaW1wbGUtbWZk
Lg0KPiA+DQo+ID4gUlovRzNMIGhhcyBvbmUgTFZEUyBjaGFubmVsDQo+ID4NCj4gPiBSWi9HM0Ug
aGFzIHR3byBMVkRTIGNoYW5uZWwgc2hhcmluZyBjb21tb24gYmxvY2suDQo+ID4NCj4gPiBGb3Ig
c2NhbGFiaWxpdHkgd2UgbmVlZCBzaW1wbGUtbWZkLg0KPiANCj4gSWYgeW91IGhhdmUgaGVyZSBv
bmx5IExWRFMgdGhlbiB5b3UgZG8gbm90IG5lZWQgc2ltcGxlLW1mZC4gWW91ciBjb2RlIHdpbGwg
YmUgZXhhY3RseSB0aGUgc2FtZSwgbm8/DQo+IHNpbXBsZS1tZmQgaXMgd2hlbiB5b3UgaGF2ZSBt
dWx0aXBsZSBjaGlsZHJlbiwgdXN1YWxseSBkaWZmZXJlbnQuIExWRFMgLSBvbmUgb3IgdHdvIGNo
YW5uZWwgLSBpcw0KPiBiYXNpY2FsbHkgb25lIGZlYXR1cmUsIHNvIG5vdCByZWFsbHkgc3VpdGFi
bGUgZm9yIHNpbXBsZS1tZmQuDQoNCk9LLCBXaWxsIGRyb3Agc2ltcGxlLW1mZC4NCg0KQ2hlZXJz
LA0KQmlqdQ0K

