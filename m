Return-Path: <linux-renesas-soc+bounces-3727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48938879B09
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 19:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D3F71C22548
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 18:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FECC1386D8;
	Tue, 12 Mar 2024 18:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="R8fwTHT9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2082.outbound.protection.outlook.com [40.107.113.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278C953BE;
	Tue, 12 Mar 2024 18:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710267189; cv=fail; b=nNd68MkHzX9kpj8k0xPLcl0cC/qPgAAOyUmjr7w6AZ3dGCHNdMA9dtLrD/a4yw+Crqf85g0DSphkb1BzOGDSRxkX4M84KY8QdymMh6IxLRBOS1ll1DllP+coL8oHxQbaMEjwSc+CDbPos89rrZFMh84RoGnFjxRtXK6E1wwTR3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710267189; c=relaxed/simple;
	bh=H18TMq1aVWKHwW2yE/ne/n0elMCjYrI3bsok6HhhkKU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZotTl/Yk9Rdl+M8eh7wMAJqGABYdteowDe79NaPYItNxFeAbNQgN3TLkNtC/goWUgiucCEJsvuv83xQZRq7KeOi5211JcFFiTvLrIAcV6MVvuaeB3fpTCWajp1P6l2EnLvbQYz6B4x6E+sOq/1b8+4Dp526IbHS8Kk1HItmiwU0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=R8fwTHT9; arc=fail smtp.client-ip=40.107.113.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q4aOyi4t2Lf64NoL5LgdkmvN8Vhk05fZimjzQXyDGPDoDf6wf8Azox3enumUGzHyPr0QRV55pSLH5/7iPhmXFhupMDlsxSBdpRO1aZC4Pu70O75d7nHE8NHZilFybzyKJoAQdlCkQmhLe4vr9n/a2exRrXPxBf81rpjNDHzUYRoawtlKGdymRb/ykulUk5p45JAmmNAlsi+KvpS0CGA+bvSMgCgHBLTJMzsp/264l5KM8k1gPC858ursNxePMWzRKFXzc3o5SaDaO62FTYgcv/+4tMEaEeSw0R3IhmXiod+ysZ81kWx1pfoCxbRkEh9hl+hu+vWz85F/D0PS6GUnTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H18TMq1aVWKHwW2yE/ne/n0elMCjYrI3bsok6HhhkKU=;
 b=Vi4PdDP9LSxfzRbeiGf7/RyCTdR+9FoD+utSqVyYSM+Qm6nB8c1u9FK3qw37uJqbMDgghj/8vE/LccKmC3Xx5+ftgwV6fmcvcuYuetHOjDySh1lU9+jDLZGHNLCPLjQgMLDYLzQAGpRKmcU7XUpeBZ2ljJebIkzrMGJej6OrDxUSyrKH+PLS/Vd0Ks+gIOIReEciPytMlwmpP8w5czaQSXbdNadwkbl2HArRC2PPyxH/FgpKL8Rf9vv9A+TGUtNkSNc5mJgZr0ho2csfqQ9weqCUF4du1wVIPvDgJP6ZjnD4qz+omAgQXnEqyYlfH6MDA6BgFUvjP//vShqQgwqt8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H18TMq1aVWKHwW2yE/ne/n0elMCjYrI3bsok6HhhkKU=;
 b=R8fwTHT9X2Eawa5iJx2CPdBOipZ/iVtTZPIRvo/bv38AktZBHuz+uhIItjrm57MyJ11873m5c0fHmPzgMYuuxxZ4qUUMUOea+puXhfXNOELr2vXvjlt4VWnYg09sWSejgbFA3v4GQELMDagFMCxKNizodZ0M1UP+aajI/sRgRus=
Received: from OSBPR01MB1592.jpnprd01.prod.outlook.com (2603:1096:603:6::18)
 by OSZPR01MB6230.jpnprd01.prod.outlook.com (2603:1096:604:ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.18; Tue, 12 Mar
 2024 18:13:01 +0000
Received: from OSBPR01MB1592.jpnprd01.prod.outlook.com
 ([fe80::7e9c:afa5:f04e:a538]) by OSBPR01MB1592.jpnprd01.prod.outlook.com
 ([fe80::7e9c:afa5:f04e:a538%4]) with mapi id 15.20.7339.035; Tue, 12 Mar 2024
 18:13:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs
 family compatible
Thread-Topic: [PATCH 4/4] arm64: dts: renesas: r9a07g0{43,44,54}: Update usbhs
 family compatible
Thread-Index:
 AQHacYPMGWKOfJ8WCEqHUSv4i74FdbEvUfMAgAABIyCAAAOtAIAAADSQgAAR4gCAAto4gIABskMAgAB4lJA=
Date: Tue, 12 Mar 2024 18:13:00 +0000
Message-ID:
 <OSBPR01MB1592B18ED338BE042BF4CA56862B2@OSBPR01MB1592.jpnprd01.prod.outlook.com>
References: <20240308180919.6603-1-biju.das.jz@bp.renesas.com>
 <20240308180919.6603-5-biju.das.jz@bp.renesas.com>
 <67819907-4366-483d-b71b-2646ffb076fd@linaro.org>
 <OSAPR01MB15874E48DD2269C2593DB55A86262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <ff569d52-f68f-410d-9897-9e1102171a1b@linaro.org>
 <OSAPR01MB15874A9DB0CE13AB0440242186262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <2821f23f-aac1-4b12-ba60-bc60da153d8a@linaro.org>
 <CAMuHMdWezORx9NCdjnj5r4pGdRQX8f6vVkYRFCRUMf7e_bfdrQ@mail.gmail.com>
 <e627dbae-82b4-49ef-8c6e-8ddc989ad10c@linaro.org>
In-Reply-To: <e627dbae-82b4-49ef-8c6e-8ddc989ad10c@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSBPR01MB1592:EE_|OSZPR01MB6230:EE_
x-ms-office365-filtering-correlation-id: 210bb7da-80f0-480b-e052-08dc42c00da5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 O7I+RPnWqCvzEzCkyhzHDoOLGTJEACR5hAGqSprFvqpV/2Uznd0V4Cmiqt2gfKe3/HaMCY9JUxHtKB5U8QrgURN8M/cpjlgJ/T9N+9g0hQJnm8loPbyAD6GLn+wd1/eysxJvkU/ZGHwvwEdOJ4Cl/9Rc9XRm9c1LeuJvYHtEwdumtHiTTk0yd/7OviDNhU6SkzjbOT7kgx6ES7Wed6ictghuiS4IHh9kzG55CR/Am/LQFk+8/0ICssH5pWSkkGbErNNzjo0YmX4+I87ZQmjQl1Cokq2uezp+eL+EpI1F/9xKZypqmy4mSAbC2tOEKTORVmsm0kuiSCozVLv/QgTCv09mmh0Ap+kl+6tl7T+UlNEgalOwBf2vgVoYm1sakqaj2tMgMZErtA2Z18Nm/yZRinOE1ZTimxNm8kCWvKskv5GWEFqYHBzn/jGeEU2Dhfs7oy/PL+WNDPOzRFpWVrt1d+bBSAq1XfQxUNKSLCoR3D48StcMKIUNuo1V2VA3AloXbZS6LWGsnz+BMX149LmFeEzx6Qfc3cgb0hkxbt3OEj88ytdoBvUxXcw7vEyUIdxY8+V/psROPGfeMroCmdkfCYO4l8WZrcxw8jPtM/mJThvwuOjCmr2kgOUoqv05UW94RiioeidzZFKH9Eh3w8qX5XgpCXzia4Bkp6O4oYzn5Ms=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB1592.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WmJqYjQvY3MzRUw0bDJmdkJNUzdyYWhzTDUwekxlQWVSWk9iUSs2TldtbzY2?=
 =?utf-8?B?MURkQldoNUg4dlN0azhMWDNmR1d1SUNqdHNIbHdIcDlkMkloeExrNWhwNUkw?=
 =?utf-8?B?dXlNbjkrLzM5bHU0UTBmL1lFMmk5emptRldnN3Zmc0k4Tit3SW1HbnpWWUZm?=
 =?utf-8?B?dVoyd0huV1llL01BWkhlOWJ3K1N4bHFtOThtNHRXMXZ6RWdidSt2emVkUkI3?=
 =?utf-8?B?ZjdneUlRbFRPa3p1ZThrUG0ycGlNQWR4RWxyUWRRMnJTTGVrcldzYVFZN0xO?=
 =?utf-8?B?MFFMVS96VFVXb0ZvSHZiUWxzR0dYQ2hGVUxmc2p0cnBnTENDaWY4Q0I2c1lQ?=
 =?utf-8?B?Q2V1QUxhQmNpbndhVmE4cHZIdzEyb0M0QWJPNThOUlpnaEpDWHJLY0JjZUQ5?=
 =?utf-8?B?WlptZkVWZWI3a2c1bEJEajhHcjRXVE5YL0Q4aEdxTFpvbDJtdnhOYXIyaWhP?=
 =?utf-8?B?dTdJcWtIUXVzQ0VOYUZERkU4WE5wTkhxY1ZONVMySHUwcjU1SGdlemNXeHBs?=
 =?utf-8?B?UDhCbm9ndkpmaUNFWC8raHFKV1lVaDJDMXFXOFFNNXh3RnN1Z01vcytBKzR3?=
 =?utf-8?B?eDVxNDU3VElJNmpuUDFYeW5STzNkZjI4dHZFOWZYOTJSODF6MW5sa2xwTlkz?=
 =?utf-8?B?V0x0ZjU3Y2RpN2RnNTNaK2RQc3Z4eVY1cklvNVNyTFdlcWN3cmVyaytvc2Zx?=
 =?utf-8?B?R3IwUUthOS9wOUJZTXZDY1BSNndmNDRQNDRoK0NNTzBETUVZaEFpYjRrSEdV?=
 =?utf-8?B?bW9BUjVqNjhNVmxuenNGdEtyektNaUZaaUhWMHk1NkxqaHpTNzZrbTlISlM5?=
 =?utf-8?B?cGJzcG8rNU45dDRHRW92VFVyUmhlcnpPVjEzTTBNT3ZndlZIYVZrVHdmSG9m?=
 =?utf-8?B?MW1uMUZOU29GMXViNmdCRjJYaXMzOW1CM012cHVlWTRRTjczbElsMTErUDI1?=
 =?utf-8?B?QmU4WmszaXFEVXRlb0tFUURXcFU2M25FcnpHU1ovTzhvT096Vmo0UTcxVjZR?=
 =?utf-8?B?aUtkemNHdVFDTWZCREtlcnhuQmV6RVdZemtNY1VwWTBvSTh1ajBlZWdqay9k?=
 =?utf-8?B?RjMybmp6eFBrTXhvNEJKU2xNODBQeXREVk55ZUlWcXhQaklwQVJkRWwxY29v?=
 =?utf-8?B?cTRzcmNKNDhrWlRaVGhGV3IxVnN3aHhUNml1dEYrYWNTN3pOTW5RcXY3T3pX?=
 =?utf-8?B?ay9FSHpLV0R6UEw3UGFPVWs1RnowRHpJTnpBOGdmdE9ISzJiWjZPTmVQTXAw?=
 =?utf-8?B?SStkbUF6K0czZXg2Z29KbEREb2VnTU54b2xCb1VLdkpwdEtMbkN1TERmL3NC?=
 =?utf-8?B?cDhHOGZBQXhmYmJuS1FiV1ppSEs3clIzKzhCWWRFN0NGem50U2VXTml0cGlM?=
 =?utf-8?B?ZHZoWFpGbGN0TXZOVFVkcmhaSkQ0YmQ5ZEhLM0syd21aRGF5WTBCcXFJZEJn?=
 =?utf-8?B?aGQ4eklLOEhJNUV0dXo2TS84UXVDZVdwZkVHSCtjeXZtZWxNSGhLQnFHNjBB?=
 =?utf-8?B?MHJDWGJGWHU2U01QVWk3TmxTUEpBVEEyVWt3RnR0N2dWZFJzMjdtT2ZhejBY?=
 =?utf-8?B?d0QyRFpYODNva3NiSWYxNlVoY1NJSmNITlFqVnlzTUY4Tks0ZG9kUmd2bDdH?=
 =?utf-8?B?QUpQdldEb2h2ZkM2a1AxWTlReHlGN1dwYjUzZE9hWUFQV2Z6eEh6Zk1zMjhF?=
 =?utf-8?B?b09SRHBJYStzUVE3am9yelFxcGMyZ1ZXNHJyZDg0U0RndnFYZ2tXWGFkZXY1?=
 =?utf-8?B?WTdZcWsydjFZaDRWcmFhYnU0a0lIcnVaMVNPcVlOWDR1KzBob3JuZWo5U3h0?=
 =?utf-8?B?WEs2Z2V3SjJGSGFnUEpUK1lHMDUvTlJkUkJpK2F4TDg3RVVVa1ZhMzBMT0Nr?=
 =?utf-8?B?WS9LdXpUY0c5T0xhYVpYbUV2bUJaT1ZWUS9DQXpSVGJHS1d1VzFFdU9MaldN?=
 =?utf-8?B?Y3VTM1ZTbWIyK01QOE5UZ2NXTGJsYjNaYnlhQ2EzWUoyRXlWMXdWVDQwbG5D?=
 =?utf-8?B?dkxQT0ZPMER4K0tWTzJkQkhqQWEzelE3TWxMdUZscjlPcXZkYWdObmdSSDhn?=
 =?utf-8?B?U0xOUVE0QTdMb0k4OUFTdmJsZVN2K3JQa29SRFcxMFdNWmlQRkIxUzhJaEx1?=
 =?utf-8?B?blNQWWY0UzJvV0FGYjlzV3B3RGhsc3J2NElmK3c4dWpVSGE3aWZ4MlhvL1Nl?=
 =?utf-8?B?SVE9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB1592.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210bb7da-80f0-480b-e052-08dc42c00da5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 18:13:00.9859
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JrFLv5007vpL2qFcuSPT1juJiZ09Pr1b+FE6ljeyIU29M4lO0hq86P0gpcpqjJ0RpPJJ0ICqcllBxS+a0c8U+C2nxBDyBwvCcC/06xfMMlo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6230

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5v
cmc+DQo+IFNlbnQ6IFR1ZXNkYXksIE1hcmNoIDEyLCAyMDI0IDEwOjU4IEFNDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggNC80XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwN2cwezQzLDQ0LDU0fTog
VXBkYXRlIHVzYmhzIGZhbWlseSBjb21wYXRpYmxlDQo+IA0KPiBPbiAxMS8wMy8yMDI0IDEwOjAz
LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+ID4gSGkgS3J6eXN6dG9mLA0KPiA+DQo+ID4g
T24gU2F0LCBNYXIgOSwgMjAyNCBhdCAyOjMw4oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA+
IDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+IHdyb3RlOg0KPiA+PiBPbiAwOS8wMy8y
MDI0IDEzOjMyLCBCaWp1IERhcyB3cm90ZToNCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+Pj4+IEZyb206IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4NCj4gPj4+Pj4+IFRoaXMgbG9va3MgbGlrZSBBQkkgYnJlYWsgYW5kIGNv
bW1pdCBtc2cgaXMgcXVpdGUgdmFndWUgYWJvdXQgaXQuDQo+ID4+Pj4+DQo+ID4+Pj4+IE9LLCBX
aWxsIHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgYXMgZHJpdmVyIGlzIHRha2luZyBjYXJlIG9m
IHRoZQ0KPiA+Pj4+PiBiYWNrd2FyZCBjb21wYXRpYmlsaXR5Lg0KPiA+Pj4+DQo+ID4+Pj4gQWgs
IEkgd2FzIG5vdCBwcmVjaXNlIGhlcmUsIHlvdSBzaG91bGQgY29uc2lkZXIgdGhlIGltcGFjdCB0
aGlzIGlzDQo+ID4+Pj4gb24gRFRCIHVzZWQgb24gb3RoZXIga2VybmVscy4gWW91IGd1eXMgc2hv
dWxkIHJlYWxseSBzdG9wIHVzaW5nDQo+ID4+Pj4gaW1wcmVjaXNlL2luY29ycmVjdCBnZW5lcmlj
IGZhbGxiYWNrcyBhbmQsIHNpbmNlIGl0IGlzIHVzdWFsbHkgdHJpY2t5IHRvIGtub3cgd2hpY2gg
ZmFsbGJhY2sgaXMNCj4gY29ycmVjdCBvciBub3QsIHlvdSBzaG91bGQgc3RvcCB1c2luZyB0aGVt
IGF0IGFsbC4NCj4gPj4+DQo+ID4+PiBUaGVyZSB3aWxsIGJlIGRyaXZlciBjaGFuZ2UgdG8gaGFu
ZGxlIFNvQyBzcGVjaWZpYyBjb21wYXRpYmxlLg0KPiA+Pj4NCj4gPj4+IFNvICwNCj4gPj4+DQo+
ID4+PiBvbGQgRFRCICsgb2xkIGtlcm5lbCB3aWxsIGhhdmUgMTYgcGlwZSBidWZmZXJzIG9sZCBE
VEIgKyBuZXdlcg0KPiA+Pj4ga2VybmVsIHdpbGwgaGF2ZSA5IHBpcGUgYnVmZmVycy4NCj4gPj4+
IE5ldyBEVEIgKyBuZXcga2VybmVsIHdpbGwgaGF2ZSA5IHBpcGUgYnVmZmVyLg0KPiA+Pg0KPiA+
PiBZb3UgbWlzc2VkIG5ldyBEVEIgYW5kIG9sZCBrZXJuZWwuIFRoaXMgYnJlYWtzIGFsbCB1c2Vy
cyBvZiBEVFMuDQo+ID4+IFRoYXQncyB0aGUgZW50aXJlIHBvaW50IG9mIHlvdXIgYnJva2VuIGdl
bmVyaWMgY29tcGF0aWJsZXMgd2hpY2ggeW91DQo+ID4+IGRpZCBub3QgYWRkcmVzcy4NCj4gPg0K
PiA+IERvZXNuJ3QgRFQgZ3VhcmFudGVlIG9ubHkgZm9yd2FyZCBjb21wYXRpYmlsaXR5Pw0KPiAN
Cj4gSWYgYnkgRFQgeW91IG1lYW4gRFRTLCB0aGVuOg0KPiBUaGUgRFRTIGlzIGV4cG9ydGVkIGZy
b20ga2VybmVsIHNpbmNlIGxvbmcgdGltZSBhbmQgKG1pZ2h0IGJlfGlzIHVzZWQpIGluIG90aGVy
IHByb2plY3RzLCBsaWtlIHJlY2VudGx5DQo+IGluIFUtQm9vdC4gVGhlcmVmb3JlIGRyb3BwaW5n
IGNvbXBhdGlibGUgZnJvbSBEVFMsIHdoaWNoIGlzIHVzZWQgZm9yIGJpbmRpbmcsIG1pZ2h0IGFm
ZmVjdCB0aGVzZSAzcmQNCj4gcGFydHkgcHJvamVjdHMuDQo+IA0KPiBXaGlsZSB5b3UgYXJlIHJp
Z2h0IHRoYXQgd2UgZG8gbm90IGd1YXJhbnRlZSBzdWNoIGNvbXBhdGliaWxpdHksIHdlIGFsc28g
bWlnaHQgd2FudCB0byBoYXZlIGl0Lg0KDQpJZiB0aGF0IGlzIHRoZSBjYXNlLCB0aGUgSSB3b3Vs
ZCBsaWtlIHRvIHJldGFpbiByZW5lc2FzLHJ6ZzJsLXVzYmhzIGZvciBncm91cGluZyBzaW1pbGFy
IFJaL0cyTA0KYWxpa2UgU29DcyBhcyBpbiBbMV0uIEluIHRoZSBkcml2ZXIsIEkgd2lsbCB1c2Ug
U29DIHNwZWNpZmljIGNvbXBhdGlibGUgdG8gYXZvaWQgQUJJIGJyZWFrYWdlDQpyZWxhdGVkIHRv
IG9sZCBEVEIgICsgbmV3IGtlcm5lbC4NCg0KWzFdIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC9saW51eC1yZW5lc2FzLXNvYy9wYXRjaC8yMDI0MDMwODE4MDkxOS42NjAzLTUt
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20vDQoNCkNoZWVycywNCkJpanUNCg==

