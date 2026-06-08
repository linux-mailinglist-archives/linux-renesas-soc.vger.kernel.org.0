Return-Path: <linux-renesas-soc+bounces-33665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k9bCLc6zJmrkbQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 14:21:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA88656195
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 14:21:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=eESipM5l;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB9643019179
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 12:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F86B377016;
	Mon,  8 Jun 2026 12:15:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7ED230BE9;
	Mon,  8 Jun 2026 12:15:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920933; cv=fail; b=f80UCh55QuXcOVt57rRTybFh4tPD4F91nZ82m10pCEZGhD0CnRxoBuuxb0e0bKWqdkYVxbNWuhj6T50QS+PTuZ+axnWzilIGYDkJIH7Y+TQEYLpappvmnLUVJkrtCpLYURBPDQ/mWyyv9bpA3In0FjVPAhhFBtdrTBLJpPzuMbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920933; c=relaxed/simple;
	bh=N0uhiFuEBRWTX4FMGt8TcX9snpFEwR4rZ8ec7Yi+MrE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XHwTEo1OUbFyUTnAR9XjCIOSMwzZQXPfmTriSTQIkzkSMfW1Eu72aXPhyPIgb1ydzGJuVnj5WYfcQ9urEjcql4dmaeYnF8cp4b8bX0wgGqUjRFrkV6EASb5btOEmcjfSm895pWAnkBRhcw0HcilSDFrrLt0NKS8QOgk6ZNhjvD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eESipM5l; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dUA/538tPlLhZD6GSs2XA+rT4pFR+CfRcBluZgdnJtLoar4CpOcyyqUy6/3se/nOWU82kJM28LMlkdczpIfJYHFP62yMhY/d+2fjhzrZgNG82GBBN7eydyxxl7Fr+7by6Rc5WunY+5kmdQK4nudBD+TpLNsmnncN8xMSQjs+9D+vEMmEqkVd6xzrDaem3lrCnLAoWDceVWYKiHl8Tx4RcOImUalETro3Vhe7ZJg6CC9odkz3f5scFlF/71wCcSlZ17J6dMc6P6LVMrMUjcLDEALGfRGXDOD2JG1RbS38Oz11F8RoA6dEFtDOdVEXILNRuKLF83GrStnE4zmhho+7mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N0uhiFuEBRWTX4FMGt8TcX9snpFEwR4rZ8ec7Yi+MrE=;
 b=RoeipY/QChCHL3WyQx9DqIqRv0I1ln6QTF/JBZLhFp84gszJ1zxC4C49iAgOIEVO3bR91CH1LNon86Qd8ACwPt7W57DmHgL5YAtfhdCUp4LeS/WM4wAz5rcrkvhNILjAHLHnB3q3eeDxWuqXrjcX1q60bAETuG/Tr/42yL/E0s5026uF3I70E1qinpQ8p38JYSIWkqIc5bJr7sLz713Okjl+1Qqud3CJoVkko8uqu18ncosXe8JPpExjkDL3yYwdkch8rTj4p0o08SjVMnopTeMUr+p26n4EcLx5SuQa43hnZcbgTnk1yyENLIoHh5HMEs0SFnpo+IQQ4jqO3R4Miw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N0uhiFuEBRWTX4FMGt8TcX9snpFEwR4rZ8ec7Yi+MrE=;
 b=eESipM5l//N2/oljYyOHsOrgfDXXg8XuoDxCJKzOf1OUPesWNpiDQQIgAYGzZ7A3g0esK0QEZgMd8pxgtub21jufUUzt/aqqbkI0uEYSUI/oi1WZh04mJytj/qOnf0IbqKmJ8dfi4CoMRoOikDeZerOyZH2R1iTOnGMFWE9W1Ro=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7009.jpnprd01.prod.outlook.com (2603:1096:400:bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 12:15:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 12:15:24 +0000
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
Thread-Index: AQHc9z2t0rzHysclGU226VvULbQLWLY0jbuggAAD0ACAAACVgA==
Date: Mon, 8 Jun 2026 12:15:24 +0000
Message-ID:
 <TY3PR01MB113461D43EFBA56BAE7C8F403861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260608115507.134969-2-krzysztof.kozlowski@oss.qualcomm.com>
 <TY3PR01MB113460B7F122E23FAC4D35502861C2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <c4ae68b7-d423-4714-8415-679671467ac5@kernel.org>
In-Reply-To: <c4ae68b7-d423-4714-8415-679671467ac5@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7009:EE_
x-ms-office365-filtering-correlation-id: 3e2e67ac-5410-4450-6248-08dec5579e8f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|22082099003|18002099003|921020|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info:
 sXKULtjmhFkFgBJzQ0gn/FTcihzQWhhjsJIPFLf9pTr7ZCT+8MAl2zNbplsfrizWjWR2mZ6mUlPFOUlYFeG8xrAo5aGAl5Vb6W4iGJAdT25KR/5tomyHz4SrtLzKhkGEYsnHKVq7GwOZDsbSBFNvBAUf2QqAa5C1OaKbfhc8WWSrEo7fPC5mvFYnoekZd1C2dIpYAtSQBau3PkpXHG679jmPNFP7UOMsd+g2AFQdp/ANU1QEkf/5TVX6VzmuW2cg0vHVZC9K1xudhoRaVJ1wtFmWS3M3Z6vuorG25FyLMEHiQ+wdQREhBPqNEZF5SHwWpHcDpWsP/hLCkCx1HYfYmpmC0MF69ljgy/KYwq0u8nWnBXk13dlz1LHXrkYhOBTqCbITGde+n02UUYcJAGvTbXVe4UnVlLdUNAtM2PPOeKlIzfpOOoJ97Eh1aCrY3tX10zhIwICiq65qUAXP3GwUBGADfLeVv0g5lMWK07ZoStQ/V39lBwk920Fxicmb7b18yiGQrHm/Z7+STEq/Oja7rT7dm/uKi8SnjOn/mDltji8OHa/rQrCkJLj+sRt8Xz8nj4Bn1MUN/p2wV7ixodoiLIfyIRbJlNCsPM3HsOWVUAggDjvIAUx+MtryOfIdDCTtoRRVNJKfd8cjzM2PvV3rPsjz+UfsI66qPrD9MW989ctB99lt/33/3nhFT/ak+P5N1Bi5TgRV6C3TKv8ybWivUGa1GoPfKbc5lmNfiizelVMEwvIEFO+Lii2AWoVaCYgsP5sZJ3fV9bY1zP8QQ62H/w==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(22082099003)(18002099003)(921020)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SUZnQUhwcEtWVEU0dVdTMG4yTE9jZGdrY2o2YlpNM0ZqTnRLaXE4ZHFDeVFG?=
 =?utf-8?B?OFo0S21RY1dtZ1NoNktRTjcrVytlQmZtbnVlckhhSy9LYjBRUW5ZWGxCUm1u?=
 =?utf-8?B?VU8xQkRaRkVUaWdISWphNW0rOFZIcTBCc2NxYXk4TEg2bGhXVU0zMCtyZkdS?=
 =?utf-8?B?RkhHRTZZSVZRN0hDTjdhK2xOWGRjQ2VRcmRjMkVld2w2RmtmUWZEZ1ZqbURh?=
 =?utf-8?B?ZHFRSGpaVSs2S25rRG5CbjBQMTFvT3U4U1dIMzBpcDFmakxXYnIxYlJGNEV4?=
 =?utf-8?B?WnhxTU05T3RNTVh2Tmt0QjNFVzJmbnB0NG9TZnpmYzFVbXBkbll5b1ovYm5Z?=
 =?utf-8?B?ODZ4S0xQcjBBdWRIakJtc1Q2YWI2akg3NVNJVjdUSVdBS0l1bHlQc2VhUy9p?=
 =?utf-8?B?RStnT2pQYXRsTkwzbDNrQncrUmVZUWNvdk5yY0pmdVBTaWtqOUhCTDNpYjNL?=
 =?utf-8?B?eG96UE5EQVQ2L3h3VTRIcFJwd2lxUXNQcG9hdXFWTTdBN25obzYxV0wxVEln?=
 =?utf-8?B?WXZhT0k4QlpQbklmN3dRaFdsUWNRL1Axb1VoOGFiaERpWGZkb095YTdTUUZI?=
 =?utf-8?B?aTdDVDk5UWIyOWFZM0k3Q0xNYVBuYXhrNGxWQ3p6T0dWTzBtL2xXSm9ZRGlV?=
 =?utf-8?B?ZjRqMUdMdVArU2VyOXlkRnZvU3ZBZ3R0Wm9kTXBUMHVlcHdHSXEySFFqUjNN?=
 =?utf-8?B?dG1EeHFnczdOZXBvZE04MmM2eXpkMWQxRlE5VlVPemZrTnEzenp4Q0E1MEJ3?=
 =?utf-8?B?ZTVMZC9JU0QyWm5PMFdVM1E2WjJjYnZSZjdjNGFtdks0ZUtyVURYNTZVZnZG?=
 =?utf-8?B?NHZ4UGp5QnNlWnFDOWt1TG1scUxwYlZHU2c1Zm1jMEVnOFpqNmE2T2dISGN6?=
 =?utf-8?B?ZXZQTTdSZldEZm4weHlsYUp1VVd1SkhGdG50YXBtRFRsWXdYSzRSVmpndHpq?=
 =?utf-8?B?T2EyVy9sbm04TEpjWlhKckZrSCtlSGRIMUhIMTJaOUpvTVZ3MjVQVmNGMm9n?=
 =?utf-8?B?dHRQbUFmYlZma0t2NFRaN1hlTDE5dWxwdjE2RmZIV0xNbXJzVjZVUWduejRH?=
 =?utf-8?B?QlRSZktvTUg0VU1NZDRtWllaQ1l5b25ERW5iQk9kOExZQUlHelRMSkxvMDRR?=
 =?utf-8?B?MkpmbVgxS2N2Q2RPT3ZIaXE1RUY3N1JHQlRoekJBdkVFMStEbVhMTVlEWnpv?=
 =?utf-8?B?YmhnZWp1d2RsaGNRbE81SXhWeXoxTVVlMzgydU84MHh5dCtNOUN1MzBRa1lO?=
 =?utf-8?B?NVo1OERVM2pocnphK0pnV2FRNFlFRFpHbDdra01LMFNFbnhyMTJzc0lRTG9m?=
 =?utf-8?B?U2lzbG0wOWdjZzlCUm9ibTByK0E3UTA3Z3Q2emptb085Nkc3clptdkdncTFj?=
 =?utf-8?B?WU0xeFdEcXFuQXU5MmRIVklyY1pqbEd5Z0hXZU1FWGFzLzdSUUlWWVd2dTdh?=
 =?utf-8?B?Uyt3c3RrdTZFYjlKOUI4bG1obzNPU3Z4ZHhEaklSVEo4dTZmWlQrUTJOM1VP?=
 =?utf-8?B?cEdYUWxtMWhXTWxoRjMyK2JzU0hnVzFQV0FGMmNuOEVXUmNDV1JVTWVWeCtx?=
 =?utf-8?B?Y3BRaWFqSkc0UUVORHZMLzhFZDl6Y1dPcmw4eGlsRUlpcktENXV6T2hZc1dM?=
 =?utf-8?B?TlVodlo1Zysyc2hpZk5QSjZCeW45bDExMXJwRGFJbS9KbXVJRXVGeWo4R3d1?=
 =?utf-8?B?VjdwQ1kwb1p4cGgrL09lRGFEa3BuZzd4NGFzRVNwSUFSMEluWHpCZjBVZ3JR?=
 =?utf-8?B?eXdiNGxCN1dVaFJ1M2dmT2FUYXJpQjVNV2FwZUFJSzNJemFFTndHUFhibzVJ?=
 =?utf-8?B?LzZobWJ1S3BTakN6MUY0MjZBcVRRT09NZGUwRHQyTzUvdjhnelhJdkkvNERX?=
 =?utf-8?B?eDNBVG0rNGZnQU5PRjlCamVCOHlmb1lSc0wxTXBzQTdBUmNrS0xwUUJmSkFB?=
 =?utf-8?B?eXpNRDFDV2l6cHZvL2pOS01EQXFIMVh0cDhIeURLZUtGVzJXeENIL3QrckNZ?=
 =?utf-8?B?RFdqNlpYaGZ2TFVrSExYTzdUbVhXRG04aWcvTEZKSXB5enZGaVRUUFU1ek5G?=
 =?utf-8?B?aS8wOHptSkxTT1Fiam5FbUJKZmZ1SVNhbVBldXoreDJpT1NRWUdJekhQbXIy?=
 =?utf-8?B?bkdBUWttcjRORW5kcnRHZFJqTXhIRTVQN2JuWDZ1Wkx5dnFXbE84enVCVjNY?=
 =?utf-8?B?bXJ5UGhHaUkvQzB4MjhrU05FZFJvKzF5ajN4Y2VIRkZIMThtSENrbzB6eEtT?=
 =?utf-8?B?clJjQS9BWHZIVG1udHdVa0NNOEV6L3RPUUNZNlVXNHdocngwZWZ3Z1A4bW9K?=
 =?utf-8?B?dXVVeDFYTVhUZ0xoZGNWbUkvejZubis1N21GZ2lEUGw1cE5UUVdVZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2e67ac-5410-4450-6248-08dec5579e8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2026 12:15:24.6121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j3GcRxc7D1U6Cf7C5ggn23fDmJl0aGiYmjbbOXRjvHCulQYakKFj9ZmnlgXFGSgLAkqrDT0dz4Y0ul6YUidI1TLKiQIQBVA6nYxZjc9TPOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7009
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33665-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:from_mime,bp.renesas.com:dkim,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2AA88656195

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IDA4
IEp1bmUgMjAyNiAxMzoxMg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkdC1iaW5kaW5nczogbWZk
OiBzeXNjb246IFJldmVydCByZW5lc2FzLHI5YTA4ZzA0Ni1sdmRzLWNtbg0KPiANCj4gT24gMDgv
MDYvMjAyNiAxMzo1OSwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgS3J6eXN6dG9mIEtvemxvd3Nr
aSwNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBLcnp5
c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQG9zcy5xdWFsY29tbS5jb20+DQo+
ID4+IFNlbnQ6IDA4IEp1bmUgMjAyNiAxMjo1NQ0KPiA+PiBTdWJqZWN0OiBbUEFUQ0hdIGR0LWJp
bmRpbmdzOiBtZmQ6IHN5c2NvbjogUmV2ZXJ0DQo+ID4+IHJlbmVzYXMscjlhMDhnMDQ2LWx2ZHMt
Y21uDQo+ID4+DQo+ID4+IFJldmVydCBjb21taXQgNTEyODRkOGIxZGJjICgiZHQtYmluZGluZ3M6
IG1mZDogc3lzY29uOiBEb2N1bWVudCB0aGUNCj4gPj4gTFZEU19DTU4gc3lzY29uIGZvciB0aGUg
UlovRzNMIikgYmVjYXVzZSBpdCBpcyBjb21wbGV0ZWx5IG5vdA0KPiA+PiBtYXRjaGluZyByZWFs
aXR5IGFuZCBjbGVhcmx5IGluY29ycmVjdCBpbiByZXNwZWN0IG9mIHJlbmVzYXMscjlhMDhnMDQ2
LSBsdmRzLWNtbi4NCj4gPj4NCj4gPj4gSXQgd2Fzbid0IGV2ZXIgYnVpbGQtdGVzdGVkIGJ5IGF1
dGhvciBvbiB0aGVpciBEVFMsIGVpdGhlci4NCj4gPg0KPiA+IFlvdSBhcmUgd3JvbmcgaGVyZS4N
Cj4gPg0KPiA+IEl0IGlzIHRlc3RlZCB3aXRoIGJlbG93IERUUywNCj4gDQo+IFN1cmUsIEkgYmVs
aWV2ZSB5b3UuIEJpbmRpbmcgaXMgc3RpbGwgb2J2aW91c2x5IHdyb25nIGFuZCBkb2VzIG5vdCBt
YXRjaCB0aGUgRFRTIGF0IGFsbC4NCg0KWW91IGFyZSBub3QgYWN0dWFsbHkgcG9pbnRpbmcgdG8g
dGhlIG1pc3Rha2UgaW4gdGhlIGJpbmRpbmdzLiBJdCBpcyByZXZpZXdlZCBieSBDb25vci4NCg0K
Q2hlZXJzLA0KQmlqdQ0K

