Return-Path: <linux-renesas-soc+bounces-3628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF98770CB
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 12:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 392701C20A0C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 11:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F82D383A6;
	Sat,  9 Mar 2024 11:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="usArWnd2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2042.outbound.protection.outlook.com [40.107.113.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC91E86E;
	Sat,  9 Mar 2024 11:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709985287; cv=fail; b=IzY9rzNxHtWV3SH1MenHvrWPgFUZnPq/QqOzQddOgMEXKrUXHHDDfpJ8aQFpXH5M9FivCbeTJZL1aOpv4mMG3m+xBz5E/XylNJlpmpAOhxFFzc9TwjjhAopaAnZTdY4+jTbFQeYNjZfwpQ3Sgu3aaoupsM2lX5SLPJpabRmJoCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709985287; c=relaxed/simple;
	bh=YrNOjRtQGT6K+Uiz0t1jjh9kYpW+0xW+Ur7QCZl9Jng=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AH5JucoUXN0p3F+t/6qB0ZMyw3zbZRhn5wEw79E3FFFgyIPEIWl+nF8H/1byLZGPN5bvZEh4gHNociewRBHz9VPES7lzpV7fzL7te7gCVGH+6AH6QVgxkV38GHk2D6b/tXthD1OCuedp3UE40J8ZesZEX5YRx8j1kRlsCSeSNoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=usArWnd2; arc=fail smtp.client-ip=40.107.113.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBQIRcbGBu1hHsQAG43zYd6Wj6Tjev7LPui1taSJWm3XeLc5TzBcS2D0K9g5UUZcsXV4WmR5hJgiytKeMAjkVZW7Mt4nBkWVmHCq8Slus0YTlyI3ppO5Jg/gjRREraMEoIEtyoEM5V5BBrxONZz4YD3AF1t58ntbi+xWG/ASpjjT1/ICGrmtS7dWvycgvNQr8ZNRF5lUUtMytp61IqlyHT1IKtX28bfha74nvQbsG8hicuOLh1+cosrCV9nuxCED5D1ROuWX7uumczvbWb2WGqRZcFWMHkqMpnzsdfcfZD3rPG2VHlPzzj41qQn3zv/+lOK8wtaRldgtuHMy3sxseg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YrNOjRtQGT6K+Uiz0t1jjh9kYpW+0xW+Ur7QCZl9Jng=;
 b=BIvXOn5K01amDnQJvVlpVHqnEr8rZZ22CZ4N0oOQMg6qGNw9JT3UqqM4ceF63cIKHlw4iGJyR72kwtPmTAYUZY0wIsa8IRs8oyIuLlxGF8al4ShmNGcQbjVW8KIODEH6r1leUn5AqCg31WtZeDM9xEEazyYE0s40mLSMWeEbXwSUdQDKzOVS9M/DCJJNcNaNO7VmMHPtqbayqdRiP89KCaIGdy1nr/UjYDckjMHHzGQwjDVHLcokROTB0WZTiikoAIMPwYdP3gSOwlYAfi6vY2W/OJjSz7DVJWc141DoSn3oxfB9leM4IZNs/griJf7GD173pPr0Rbj+CqPvyu8YrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YrNOjRtQGT6K+Uiz0t1jjh9kYpW+0xW+Ur7QCZl9Jng=;
 b=usArWnd2KMjN9tw6YPmed5Twv0hpbwCJ/xuEYsMlbGuTbNvX2FWq/zISv6QtHUaWtyumNwFbLPWC01NWgRuXUw9Ddy/tSNR904ZvTtjlphB3shdXlA0tO34rT3a9F3cX7zbuzIg7r12T4RM2MnUIerIv0LhF1GKs2KUUb7xj5Y0=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by TYCPR01MB8915.jpnprd01.prod.outlook.com (2603:1096:400:189::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.31; Sat, 9 Mar
 2024 11:54:39 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::5ff4:8ba7:96e5:7a5b%7]) with mapi id 15.20.7362.024; Sat, 9 Mar 2024
 11:54:39 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: white-hawk: ethernet: Describe adv1
 and avb2
Thread-Topic: [PATCH] arm64: dts: renesas: white-hawk: ethernet: Describe adv1
 and avb2
Thread-Index: AQHacha3XzHQwDknXUO0oQwc/ntrlbEvTLwg
Date: Sat, 9 Mar 2024 11:54:39 +0000
Message-ID:
 <OSAPR01MB1587F0B5CABF3DDD83E00BD486262@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240309013006.723934-1-niklas.soderlund+renesas@ragnatech.se>
 <cde6ee0f-31ff-415b-8b77-47936f2a7158@linaro.org>
In-Reply-To: <cde6ee0f-31ff-415b-8b77-47936f2a7158@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|TYCPR01MB8915:EE_
x-ms-office365-filtering-correlation-id: 6420a8c2-47f9-4e3e-2e35-08dc402fb35d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yr69teOxqnhYewr9ERTpi0vkIfOfQyKGTUpeQe2oOg4xenOh3RLSTfTjsZEJ6Z4uQ8wYYHtPAE5Jl+0SNB7IR9Y7LnNnrEwX4bDP/fo1oE4zMOYynE1l/VnUV4Lq+RYY6Qn0riv7KVoSI2KMkxuo15sQl8JaAyaCQrMceDfJxa7WK6mLcsoA5N1wpMsK7T+DXv3bxjjMSRyi2rcWsQbFigFIIKARgbfvZvJXSCYlYstOlvNUjRMia0ZmD7V7lOctCRsxx3obRce9cmJXZkOssgIc6yb8duXgO2qdukHmCkYNr85v83oqi+DAEE7N5HFGQiFzJLrr4ZDmwQaQmVeY/CYF/aO5cA1JjCgIe+S6gVdzSwMM6sqMXbdrvcgY6PzgWOfkjLn26bEUtgaD6pRcb+0H+9tLAD/s2vNajU+kIJSGEU3RC1e7xtvl/uWr1exvw1vpwEN72sW7vi1/+ue6vmrsOeuvmtAH+0sDzU0/fJ0vXJap21e1n+kH/okPLTl0QDLwAkCm6sqppDAYk8IIKANADs1XJtJ7Fo2eM1/ov6VDi6D+MQ2b2GAgkvlGN4TgOwG9FjOrPPeZliZSsiBaJsLdFgC5UgQUuZsV2PVQPdBA4l8A/8Wne4UsU5Tu6chmV1iNHci1/vGASYAMfHp/NCHO679YFNDtSRQPPzf6ghqZS8EinaNiLfrU36O5wMyqxbNV42LkVRHAaGD3kWIlTEuW6ri17sDeg+ML2Zwrvs0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXAxWDh6dmdXWWIveFVDSU8xMWNFYVdHNy94anZpZ0c2bHdHS054dHVsQ00x?=
 =?utf-8?B?TlNLNTdOSS8xL0kwTStENk1NeFdLdUdEWGIrWS83d3M0STZhSE8zblZwTmpT?=
 =?utf-8?B?TC9KaFY4dnpMcE8zSld5TzJOeHlUaXdHUzE1eUg1c09QY3k5d0ZtUFkyc0tl?=
 =?utf-8?B?cURLdHR0MmNvQjZENHhlSEZxbEVxNUhzSDNQSUhpTnNpTitWUVdWVDVwbkVN?=
 =?utf-8?B?blVpM3ZmUGN5NU1sbSs1UWNqZzYwZHV1MUc5TGJaU0JiZXcvemQvVkxFRnhG?=
 =?utf-8?B?VDE2VkZYK2x5MnFQWUlqUzdNMlI3bWxlZEJWMWhtZ2U2cFBVL001dWc3dThw?=
 =?utf-8?B?alVyYTBjNm9TR1NpUmIzWGdqdjFCYldVYnhQckFIZG1DbXpwZkZ2ZUp4TEFs?=
 =?utf-8?B?cW5ZSVdlMlJ5OVRmOEx6UHR0cXVRQWdaSnNTY0lCSnY0ZFNVZE85dWVUZHpu?=
 =?utf-8?B?Nzl0RlZvcVoxVlFqYTBPWmxWc2NYVHExTHJOQ2lKZWxQektzMGZ6N3dFWnlw?=
 =?utf-8?B?NUQ0Z2UwdVpkcitEa0pEWkZLOFNSQWR6NlRxd2pQM3VhN3ZjVDNOckN1UTJm?=
 =?utf-8?B?VXRvMXJqd1ZpNVN6TGM4RjNrRzM3VW9HSHVCbng0YXZXM3RrTDE4ZWt5NVNP?=
 =?utf-8?B?NHVUZU5Fd245QWc5bFpPdTU3cWFyRTRlN1NIZWhZWm9kOVE3KytpcURvdk9G?=
 =?utf-8?B?RCtvU05RV0g2KzRiOXIvTEYyN29kcDhUb2QwM1laWktCMTdEQ1ZvNTIwU3FC?=
 =?utf-8?B?QVVxbXdld0M1RlF4UEVyeHRWbWg2eFZISVRVNldRTTJvWTUydjdUWlhZanBx?=
 =?utf-8?B?d0FqTXdsbkNPTEp6NDA4bEJSOGxNYUNpc2FINDU3bmdUVzhWNll6cUorZXdn?=
 =?utf-8?B?SEJaNkVGM1hWaTY5RThUYmFMSURSOE90N09SeXBVU0x0MVVHamFtdVBLRDZF?=
 =?utf-8?B?ZUIxazdsTEx3bS9QazZsZXd4SmZGT3RqYzhRS1BNZmZ3SENvLzN6b3NlbWFq?=
 =?utf-8?B?V3dkTEJsQlNMOWJOc2FmaTl0c2RyM1ZxSW00RUp5RllyMGdMWEtTRUgwL1Jh?=
 =?utf-8?B?ZGZHaExGeVBHWG0xdEcrbTdQS2VJa1FBcjQ3MlZKY1ZSSC9VV2g5MUVibndV?=
 =?utf-8?B?Nzg4dlNQWGFzcC9oUjIxNmxvS0xma3ZEblpHcUgvcFZBby8wMW1hbllDSFFJ?=
 =?utf-8?B?TWhMTitBd2N1UzJYdTA4ZWUzTzhxNmhnWng3eE9rVUUzcDlma1FhbWVCYTZr?=
 =?utf-8?B?ZjVPZGFLOFE1ZjZkTFFqYXVFWlFVd1phU1MxVWVNNXY4czFVTDEreWNDcGFY?=
 =?utf-8?B?a09SdlRKS21lQWlMRXlrK215K2NGY3h6QmZ2WWswRUw3NkJZT0c1U1U5S3c0?=
 =?utf-8?B?dy9yL0JoY1d3UnJlMGZqSVptaGp4UzVZOW0xUHBJSGJ2a0NIdmg0NDQvc0lv?=
 =?utf-8?B?MDdHVzN5Z1E0ekdGNHA5YnRxWEFKdnlHQzFGR3lDN1lPaGJzc0FvZGVYeFJa?=
 =?utf-8?B?MkdtaEZLWmYzT01aRnFyUEJXYUNTeUhjMUp3N1hRZlF1d0pQU0hBRFo1Zlgy?=
 =?utf-8?B?K0VVa3VGWm13cVUxT2tEZ1FWZk9MSngzRmtJTGpORU9yR243OFR0alNTRUdS?=
 =?utf-8?B?cysxRFhhK3VtOGh6SmJxZjFuS2oxbG82N3JlWUdpV1ZNNllvSngwQTdjZWhV?=
 =?utf-8?B?WGg5VklBdmtLVHZ5TXZIUG9tMlNWemdjOGl5cHlzZGxCbHB1bGIyYVZGa2xG?=
 =?utf-8?B?bEUyZ0FXdzVONGhzWjMzelpTV0VoNFR5c2FzTVJDc09JVEN2R1loMXE4L1Rn?=
 =?utf-8?B?S1JkT21DWlBkWEdiRXVNK3ZKbTUreEN6aWJOU0t2bmtCRlRsaHhEL0RodkRY?=
 =?utf-8?B?MWRsVXBZVjRidHFySlJId0tNVDlUcXBSdDdFak1WM1YrWWpSbVpGR002ZXZu?=
 =?utf-8?B?ZU5yeTNIRHhYRnAwQktQTVdpZTdnaGFPak5mOW5maWhaSWVNYnRycnhCSU94?=
 =?utf-8?B?dWNhQkZJUzhFZDFGUEVPeDhlQWEwdVRGb3dTWkhtSG4xN0VLUTJxenB3Mmx6?=
 =?utf-8?B?bnUxU0p1amh2dzNoZWpyRnY4N0FOUkV6ZXRFY0RpTHFUSTZDenFham9ZNjJn?=
 =?utf-8?B?d0txRUQrSStGb0JjclNCUE91ZzZXQUU0NEFqZ1E4eHp3OXdZQkIvbWtuK2lv?=
 =?utf-8?B?NXc9PQ==?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6420a8c2-47f9-4e3e-2e35-08dc402fb35d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2024 11:54:39.6356
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: irAZRaucuSIqNZXHClfHzgzF2dpXRElJLueix5doo/Eqqp/p9nr2QQwC/RlbdfowNptArzGdWjQU/I8IbHBIBSHqITdgHQ11fWHbCgk7XVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8915

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiBTYXR1cmRheSwg
TWFyY2ggOSwgMjAyNCAxMTo0MSBBTQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBhcm02NDogZHRz
OiByZW5lc2FzOiB3aGl0ZS1oYXdrOiBldGhlcm5ldDogRGVzY3JpYmUgYWR2MSBhbmQgYXZiMg0K
DQpUeXBvIGFkdjEtPmF2YjE/Pw0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+IE9uIDA5LzAzLzIw
MjQgMDI6MzAsIE5pa2xhcyBTw7ZkZXJsdW5kIHdyb3RlOg0KPiA+ICsNCj4gPiArJnBmYyB7DQo+
ID4gKwlhdmIxX3BpbnM6IGF2YjEgew0KPiA+ICsJCW11eCB7DQo+ID4gKwkJCWdyb3VwcyA9ICJh
dmIxX2xpbmsiLCAiYXZiMV9tZGlvIiwgImF2YjFfcmdtaWkiLA0KPiA+ICsJCQkJICJhdmIxX3R4
Y3JlZmNsayI7DQo+ID4gKwkJCWZ1bmN0aW9uID0gImF2YjEiOw0KPiA+ICsJCX07DQo+ID4gKw0K
PiA+ICsJCXBpbnNfbWRpbyB7DQo+IA0KPiBZb3Ugc2hvdWxkIG5vdCB1c2UgdW5kZXJzY29yZXMg
aW4gbm9kZSBuYW1lcy4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KDQo=

