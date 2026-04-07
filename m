Return-Path: <linux-renesas-soc+bounces-30935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOJ7IUAM1WlQzwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:53:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F533AF829
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Apr 2026 15:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C5953020180
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 13:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA6673BAD8F;
	Tue,  7 Apr 2026 13:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VeHt4k7c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BEF3B8BC5;
	Tue,  7 Apr 2026 13:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775569929; cv=fail; b=ixkmpk9tmTy8V7nfMqXxyK/avGP2L1G2H0ebHm8SDHmtOaY0Qi6qzsjf3Rwen8aB5ojUJGzRuXm4plob3FRFPMXmB0fwgJWp7eGA6HPc/7+NIb08U/juhTUoT2XW2ugTgPaJaS8b08MoKQ2iThP0VqXqD3jzhYuMzpJbT+b1XWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775569929; c=relaxed/simple;
	bh=2DTW0BdgVpuBnn4PiXdAZ04dq4rG2zatLuNsMLiRssU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u5zS1NEf6lMIlwqvK/CLz7VwVHLrHJojulFX9Rq/AphBfF/c33le5cbdH4uBZdVQ9Em+OXVELX0Vi/ZWeg/kGq1ymprhFcpHATv89tmM30RpEj9UahkMiI24BxLg7YXABTeDEtRy8Mc2qLAE+9d1BuP7QDDg5s8pSz+zDrPei1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VeHt4k7c; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cj9shBDLcBcyy5JbXsuceOA9GLT1Lq1UtSGBHtcqcA7lpNkaUZR/ZQBALHZlR0Qze2EAYeD16D6VnulXrVeplOuNn60DxfpbQ7xd72Y8USqYli3ADS6MBO3eS+PxpS4CP2YoBwPaKEcEn3CToK29V7J8PI7VbjNi5ZY4m7buT+kKbsFGgsbncDqJRJc+qHwhUQHUzmCLgD8S1KTdHdRBMzcCcXXE5j4qUOIEnxicDY7pbp/LyxC7xyh2PE8hHpjcd4A/WnYTr0Upy/ebbPlMwRB9NcmSv8heYp9IIwBqyIeZ3PYpvWlQnvqRssIT/zGF9tmhXuUNXfUKzxTt3Cwipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DTW0BdgVpuBnn4PiXdAZ04dq4rG2zatLuNsMLiRssU=;
 b=a4fZ4E+rOZ4SVhIDQ/NT9Bl6RzjC9FBjZeqtN59LTDv2cNEhEpPQqTuJosmMH3Ex42ptQTsQhyPKEuwxEvOiUXlCkTOwlQJIesNFsR6G5pJ5xeMGUjNusFLfU6BFB5VTzv4CGq9bDYBD9RG//gf03VWaYurDQq0WiBVXy92GZuw0jaugAzmHLFpBGU94gxCQHTLwATm7b62WW1XGWxPJdzsjQIlUIzlvRdD6KRVTSz0yLDz3IL87cBzjffwm2mcVrSwfmaygTT/wm1gohSu4dr333nbL5xDNRPMvGYkSYxaA9DmHsjit4b3yaDv8mNNHL7SMweK0j/H+VpHIiQW8WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2DTW0BdgVpuBnn4PiXdAZ04dq4rG2zatLuNsMLiRssU=;
 b=VeHt4k7csS+pT5B6XBXoB9vy3aZ0rcjG+DrOQ2hkucHCbb1NdfQ1W+wvlDl6uydud162CboIOE6e9tC0nwo4NG2YnlHLl9LxUQHYAmsxAJR+/FCLZnbCA8gbNOPc+GiqZ5swIn0VCQCnNvkj5A6a3TuJWsr8OC0/1OhEHtReQGQ=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS9PR01MB17250.jpnprd01.prod.outlook.com (2603:1096:604:40f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 7 Apr
 2026 13:51:58 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Tue, 7 Apr 2026
 13:51:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/G3L
 SoC
Thread-Topic: [PATCH 1/2] dt-bindings: spi: renesas,rzv2h-rspi: Document
 RZ/G3L SoC
Thread-Index:
 AQHcq6tl0kg0H5FQ2EeOkUiXc+QUbbWeeNkAgAABc7CAAAmVgIAtdw+QgARiWQCAA3YREA==
Date: Tue, 7 Apr 2026 13:51:58 +0000
Message-ID:
 <TYCPR01MB1133240E6A08628EE70D4610F865AA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260304074907.9697-1-biju.das.jz@bp.renesas.com>
 <20260304074907.9697-2-biju.das.jz@bp.renesas.com>
 <13d4fd79-784e-407a-9f2b-41cd9a86f232@kernel.org>
 <TY3PR01MB11346B3A18D2EDE88B8A45C1B867CA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <dde6b95c-2d18-4a44-9127-bce26c99901e@kernel.org>
 <TY3PR01MB113461341DE0677746358F5BD8651A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <c5a8ba40-1315-4654-b188-1c7a5f744d03@kernel.org>
In-Reply-To: <c5a8ba40-1315-4654-b188-1c7a5f744d03@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS9PR01MB17250:EE_
x-ms-office365-filtering-correlation-id: 83da7e34-bc19-4260-0929-08de94acd67c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 7xHGZF6dvc1VUG9YocRCtRPA2PUEVAi47chmv3xGodIuj60dWwcrozHne6CIU1iN7lMwXH1PyBaAp/oG3HsdMoASURaBJrFRDdQeC6ihj+8JC6H4seBteysf3/s5BP83cA0mDd6UO64lIfDCCqyVxU2rMWS4XIG/hBFMcsxK3/lNHJNq3m2XeVkJcWLRA+XqQ+6BG/5sdviV3l+xEONqyqyP39B65g9ler9FsmJM8yVxTjO7ikqpJKxIFLkrBVe/5FLS6Qc5mqbob5yR8p08V+WqThIu1ophR526uhh6nGfwKafJ6OY6+o7+tDFgq4PNpMQHFFVe+kymbArtXW3lXTZY1A7jLD9tUNhlAnOPYCwJiNan84n1HjtzKl4ru8K64NO5hGmz9FUHhtY0LebiCSwY3BAbM4VfXVEs6Dv/xhW9rKKzbVm93fB3TwQNO6Ylm9zesPlB9hc4qVQ6h3CDn5CjEgUxDPb84d/ZD9fhukFLnRQcxc5Q7uHPOE3IWz9qJiHmrcmw/WYtjJwunACNAj3MHYbQq55ctz2iIyAao7pk5gw2oXpIus+f2MzO3BMEn+pm2ibG1tCziqCBvnijrQidIEEOs16VfEW803I2TS7NhN1TYDfcfrLaJK75zJB5tDR3GERepDbHKgjXwwl5S40wldOTZ7AXPx1bAd+Y3S07EXbsCc52jozYgH41wx6q0XnbbRThnZlrIHFwAfM3Xujfm9Bsugv1VUE1XiMnQAljAJw5eEMAIyQ9EJYKFISK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MHNic0wvQmhucDl3QndXWFpuN1JoTUprN0NxQjVqVlBqUzJwTGVLNzJneDJk?=
 =?utf-8?B?eVh2OXJDWjVUTHlJSXlVL1o5U3UzK0lWSVNvQVdlcnJISGM4VnQrRDNlbFI5?=
 =?utf-8?B?V0hPalBTQ3pBdWp3Q2R3Q2xoL2MzRGF1OEV5elI5d0VWR05UbHBJU1hkdzZX?=
 =?utf-8?B?NUt4bE9tV3FmaERZbTR4Z2o0bGcyQS82YUhIN25lRDIrZVBjZ1ZKUTNhM0pr?=
 =?utf-8?B?dTdBUW42MWE1L1dGSGpJZmdUU0JZd2V5dHVPdzlRSzIycnBDUXhaMDNISlNp?=
 =?utf-8?B?cFJ3QUp6cCtQaUdvcktuVXVRTUM3WWozMk1aNS8vZEx5UWRrUmUyZ0hFQjJ0?=
 =?utf-8?B?cmlsSnNWb1FRS3JsREhKYzVqbEZxakU2V29vQ29HbnVxZkRKUWpTU3RLUFFs?=
 =?utf-8?B?TzZMaWNPVmswaVN2bCszZ1NoWGJaWnJEZjNQUFRUUmFQUWJOdml0TmsvQ3R6?=
 =?utf-8?B?dno5a2grV1QxaE1wKytEeDlGRlJDaVdWV1hjemxUMXV1OFJ6ZFFiY09aZ0NF?=
 =?utf-8?B?V3Fzd3VrK3FCdGhyamhPQW1EM0VucnZ3TDJvelRsRkhveXdKRmtPSDZzVHkx?=
 =?utf-8?B?bWh1ejZLcE9yaUdSR2pkaTVXOVlDVEpWeWN3SFhYczJDSFVqam55Z3hBdWRU?=
 =?utf-8?B?RXoxOU5qQ2hvYjZPQTlUT1RPNW1sWk94U3ZTVHBlNDQxZ3VTNFphNnVoc1pD?=
 =?utf-8?B?Q1ZuS2hWNHFYRjlvaysrYkJ5dkltU1JhNndURkx5QVZYMGZRSllyWFB4cTRv?=
 =?utf-8?B?UHlnbi85dzhTY2VEb3Bha01Yc2ZxZTd1d283WFlueEZBYWxwNmVTZzJiZEpO?=
 =?utf-8?B?clEySFVJRmhPWXUxTWp5YUw0R0VxbXZNTEI1QVdXcHI2a21qT1hTK0xLK0dx?=
 =?utf-8?B?a0JTUGJKV3dybzlZamZDMU1zTzRXTzlNV0dJeXhvOEV0MFVQdGRCcDdtVDdp?=
 =?utf-8?B?aUdnNFlUT290a1BYT01tZEIvUHd1VUdTYzlJVnZUaVdLUWhTSm0yS25QS0Za?=
 =?utf-8?B?QVovUThEeTdQNE9CV202MkY0ZHAwMUNqcG42SzZOaTN1RTdrei8vWXhDWm5K?=
 =?utf-8?B?WllVUENMT3VwL2U5dGJGYU02Z0hjZWl3VktFcVhpTWE4ak1tYTJSMFk3Nkc3?=
 =?utf-8?B?NHNYQ08yYzAvT2U3SmxwbTEzaTNZSTFpTjZpVWNqYlhKWC9UNTg0Yy9MdWg0?=
 =?utf-8?B?QjE1S1VudldoSHNqVForYnhvMDB1aTlwZkt6NWJ2cnFKRUJLQ05MSGxvdCt4?=
 =?utf-8?B?WU1UT04ydk1MdkszYzZJT042aXZVOUZoTGVzT29IR2QrNUlqUnY2Z0Y5N01S?=
 =?utf-8?B?U2hiRVVNMlZEY3FLMEJLcThteDg3VnNFMW1jbkpLZkZmQXRxczhZRk1SaTRZ?=
 =?utf-8?B?bnM0UlN2Z2EzZ2JZdCtGNFpub0tDS095YmVCMmpLYzZXZnY0Q1Jrd1JNVVVv?=
 =?utf-8?B?QlcxejlXVFZvUy8wRDZoL3E0L2JBR0FUMmY4aGwrSTdJN21RV2hIUWFWbEtT?=
 =?utf-8?B?MDhMMzZyNDdaWE9USjNMUXpiM2ZzSVVMaXN1MlozRjZoQ256am5wRkR0QTBT?=
 =?utf-8?B?MjBLM2xFS1NIUXVQS21rbG8yVUdhQU0xL1RJRWVWNm00cWRMK2ZrVnhDaXpt?=
 =?utf-8?B?ZnRkSFRaZm1kWUJvL3Flc0s0Y0Z4bDVzUzEzZEdzNTBuSXZKMU00TFdKNGZl?=
 =?utf-8?B?MTd0MGJCZnpONFpnMzJ3OGV3RGRLbW1TQU5NQ21HK1JQQmxIdXBaOUpyZGti?=
 =?utf-8?B?RitPbDMwbk9EdWYvTDFsRG9zWkhyYjFjdlluMHpBa1MvOUpaaktubWJFaVBH?=
 =?utf-8?B?ZWxYZlRCVnk3ZEc4MFp4UjZmQzY2VDZhejQ0Ti9Yajd4NzhwY2FKYW04N0Nx?=
 =?utf-8?B?SitMYVlqaUY5QU4xV1FYYmR0c2JIdEdnSnN4K3dqalFJSzdydGVsTHpEczNX?=
 =?utf-8?B?dW9OWnNZNUxXaDhEQTdMaHZYbDY5NGNVamJZanZObUlwWXBDQTc3U2hmNmV2?=
 =?utf-8?B?UDBBMVA4NGpFZDU4K25HWTNQcm13V1VNa1E4Y1p2SDRoT0V3T3JUSHpQU0Fl?=
 =?utf-8?B?dUJrcTRLRStEMFJJaytmSGxZeUhNc2JQNkNYeEUrcUZLTDk2RXp5TVQxbEo2?=
 =?utf-8?B?Z2ZYeVJwZ2VPNWp4TngxQ3lQMDRVd2s3VkFuWkJiekYwbzZhMXdiUlFnQnJp?=
 =?utf-8?B?djE4Sm5HdXZ4dWtyWHhFaHRkVnBuNFpKWWRHQzlEOU8vanIxdW5nRWU2MzlB?=
 =?utf-8?B?UnhkVVl3eEpRbTFqSGYwK3UvNG1Kc2laR3NCbnFiQ1pIUFloRURGeHVHR3dU?=
 =?utf-8?B?WlZDTmp5N3k5U1lwM1JFQ3Q3UXFOMTJvRkY4N1Y1bEhrK2NCazVsUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 83da7e34-bc19-4260-0929-08de94acd67c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 13:51:58.6827
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LMjyDKXPQ0OLZsPI9kRZcClEVRVOROZYTKiF89s80mmFoJ6oj0PGuTWMIY7w7w0JVAbMh8R4odbvUgwY463gOvDoE+TvEGalWeDqkUpsxAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17250
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-30935-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,renesas.com,glider.be];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,el.org:url]
X-Rspamd-Queue-Id: 17F533AF829
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAwNSBBcHJpbCAyMDI2IDA5OjU4DQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggMS8yXSBkdC1iaW5kaW5nczogc3BpOiByZW5lc2FzLHJ6djJoLXJzcGk6IERv
Y3VtZW50IFJaL0czTCBTb0MNCj4gDQo+IE9uIDAyLzA0LzIwMjYgMTY6MTAsIEJpanUgRGFzIHdy
b3RlOg0KPiA+Pj4+DQo+ID4+Pj4gU28gZXZlbiBhZnRlciBteSBvYmplY3Rpb25zIGhlcmU6DQo+
ID4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzlkMDhkZGRhLTQwM2UtNDU4ZC05NWU0
LTRlNzY5MTVkZjg1ZEBrZQ0KPiA+Pj4+IHJuDQo+ID4+Pj4gZWwub3JnLw0KPiA+Pj4+DQo+ID4+
Pj4gdGhpcyB3YXMgbm90IGZpeGVkIGFuZCBSZW5lc2FzIGRpZCBub3QgcHJvdmlkZSBhY3R1YWwg
Y3Jvc3MtcGF0Y2ggcmV2aWV3Lg0KPiA+Pj4NCj4gPj4+IFRoYXQgcGF0Y2ggaXMgbm90IGNvcnJl
Y3QuIFNlZSBiZWxvdy4NCj4gPj4+DQo+ID4+Pj4NCj4gPj4+PiBUaGlzIGlzIHN0aWxsIHByb2Jh
Ymx5IHdyb25nIGFzIHBvaW50ZWQgb3V0IGJ5IG90aGVyIHBhdGNoZXMgYnkgUmVuZXNhcy4NCj4g
Pj4+PiBBbHNvLCB5b3UgY2Fubm90IGhhdmUgZmxleGlibGUgbmFtZXMuDQo+ID4+Pg0KPiA+Pj4g
WW91IGNhbiBoYXZlICJyeCIsICJ0eCIgaW4gYW55IG9yZGVyIGFuZCB7cngsIHR4fSBzaG91bGQg
YmUgdW5pcXVlDQo+ID4+PiBkbWEgc3BlY2lmaWVyDQo+ID4+DQo+ID4+IE5vLiBZb3UgY2Fubm90
LiBJIGp1c3QgdG9sZCB5b3Ugc28uIFBsZWFzZSByZWFkIHdyaXRpbmctYmluZGluZ3MgZm9yIGFy
Z3VtZW50cy4NCj4gPg0KPiA+IDxzbmlwcGV0IGZyb20gd3JpdGluZy1iaW5kaW5ncyA+DQo+ID4g
LSBETyBkZWZpbmUgcHJvcGVydGllcyBpbiB0ZXJtcyBvZiBjb25zdHJhaW50cy4gSG93IG1hbnkg
ZW50cmllcz8gV2hhdCBhcmUNCj4gPiAgIHBvc3NpYmxlIHZhbHVlcz8gV2hhdCBpcyB0aGUgb3Jk
ZXI/IEFsbCB0aGVzZSBjb25zdHJhaW50cyByZXByZXNlbnQgdGhlIEFCSQ0KPiA+ICAgYXMgd2Vs
bC4NCj4gPiA8L3NuaXBwZXQ+DQo+ID4NCj4gPiBJcyB0aGF0IHRoZSByZWFzb24geW91J3JlIHNh
eWluZyB3ZSBjYW5ub3QgaGF2ZSBmbGV4aWJsZSBuYW1lcyBmb3IgRE1Bcz8NCj4gDQo+IFllcw0K
PiANCj4gPg0KPiA+IEFyZSB5b3UgZXhwZWN0aW5nIHRoZSBSWi9HM0wgRE1BIGVudHJpZXMgdG8g
YmUgbGlrZSBiZWxvdz8gUGxlYXNlIGxldCBtZSBrbm93Lg0KPiA+DQo+ID4gVGhpcyBpcyBub3Qg
ZmxleGlibGUg4oCUIHRoZSB1c2VyIGFsd2F5cyBuZWVkcyB0byBzcGVjaWZ5IFJYIGZpcnN0LCBm
b2xsb3dlZCBieSBUWC4NCj4gPg0KPiA+ICsgIGRtYXM6DQo+ID4gKyAgICBtYXhJdGVtczogMg0K
PiA+ICsNCj4gPiArICBkbWEtbmFtZXM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBj
b25zdDogcngNCj4gPiArICAgICAgLSBjb25zdDogdHgNCj4gDQo+IA0KPiBZZXMNCg0KT2ssIHdp
bGwgc2VuZCBuZXh0IHZlcnNpb24gbWFraW5nIGl0IG5vdCBmbGV4aWJsZSBmb3Igc2luZ2xlIERN
QUMuDQoNCkkgYWNjaWRlbnRseSBzZW50IHYyLCBzbyB0aGUgbmV4dCB2ZXJzaW9uIHdpbGwgYmUg
djMuDQoNCkNoZWVycywNCkJpanUNCg==

