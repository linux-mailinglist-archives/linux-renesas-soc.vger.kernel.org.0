Return-Path: <linux-renesas-soc+bounces-33991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h8p2A2upL2oMEQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 09:27:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5766F68432F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 09:27:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=W9yYi2u9;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD92C301589C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 07:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E9A63BCD3A;
	Mon, 15 Jun 2026 07:26:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B8C3B52F4;
	Mon, 15 Jun 2026 07:26:21 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508383; cv=fail; b=Mty7vuCb5yqP0xSA8dwS92vCSXRQXdCL6CpD1/0iFBOZPpOxKI1A1LsFjtKwwWuwcpkQcbYZajk+9ddcTNod3xDib11EPkXEF3QISgURSLrOVLxSvLp2atKNeMXlWz/pVQVtKXgsb08CXxC+2x5i6hsplvTkv8YY2DDOaWJj1rQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508383; c=relaxed/simple;
	bh=iIIjoUw8p9kkt2TqkhXMJDU/70szeMRDHjtmF8gtfwI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ssqkWzXJz3Km5CECYpzS5d4ZndU6T19X+p4hCJwFF9ecsZ6rpUVW0z2Wud/IkEAhxgYBEkv8OMxYDOcII0Qde5YgAoJv+qLko+7/uni4FB26noFoJDmhuOr5xKnMiznZ3qVF0+Vq2GeCZiB3wTL3juvj2W3gNszu+G32xFouulU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=W9yYi2u9; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrZy0h3d7MYtOMoYrOrDrqkjrOHXXC0itJivB9dB72OznzKDlhoc/MEt9NqUpIwOG7c1w0VN9Wxz/FdceVRo2oeKegQTpiLn5Y/kSaGzoVLhl96Ntfm9bdyb/r3x8/dQcnFLbYxk0rAld0TXuEplB6POGg3h9IALpnecyCCTuEgAbjLjnuLmY1qGTJ8Re4EEjlr8N4DNfVlaCSEjPb0B39dBvfoxqG2hkLS5FlfgCv+GIYDrVJNHprCWoIsDpSqys/AUaEJUxYMa3cb8s+3r90/sQ7VilFoSqpEwnZRBL2/ioQrfglyMiuM307swiWJA9lwaJ09G5+6TExJHPjlGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIIjoUw8p9kkt2TqkhXMJDU/70szeMRDHjtmF8gtfwI=;
 b=ksqoXeQyfaeySkpgRzqMsTCQuMFonnXzZuw9wSeL8kNJProvGvqSgyuFPH2hc91nILeN2lM8qwxU05S8RWNIEw/m0BorVB5wKM1fh8D4RsCo2toU01UTvwDDCLQG0TgcJJJ3mPVXUf+8Yy7pePSU+EzmxmcdCihcGKkeTs/fY5b0yYLcLtjKqv5/lcJ9PU2WLi9l7uluLaReOM5dmtFJZ9fZ+jnzQClRI7+GrY+r7tOlwEqaPES81wxdTJvbuHeyV0ixBJyKtSBKBOCK3NGHd/7ahXMxp3lC1zVzLCMP1r7brHcGn5xzWjLhrjMynlVmhNnStnxt0N/SUQkb/AY0KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIIjoUw8p9kkt2TqkhXMJDU/70szeMRDHjtmF8gtfwI=;
 b=W9yYi2u9zgRzHsFwnsDb9GCBMJzIN3jR4qFWIShe16r0sqOs3quB5fLjpke6qaqEShIjM+M9L9FHBFisPW/PKDrdoNIyIQtMIdSpIzW6d/IhYzBiLctBdq3Jbgh+Mw/Fm4qYJaHYouHMtfZhxh85Xpa7TIsEgyu8iy/oTb3oNNY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9974.jpnprd01.prod.outlook.com (2603:1096:400:1ea::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 07:26:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 07:26:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 01/11] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Thread-Topic: [PATCH 01/11] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
 Document RZ/G3L support
Thread-Index: AQHc+ngVs5qSMKYB5kKgjE5jir9ylLY8TRyAgALssQA=
Date: Mon, 15 Jun 2026 07:26:19 +0000
Message-ID:
 <TY3PR01MB11346830B87BD9A619F05572686E62@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
 <20260612143048.317907-2-biju.das.jz@bp.renesas.com>
 <20260613-careful-vehement-loon-7e808b@quoll>
In-Reply-To: <20260613-careful-vehement-loon-7e808b@quoll>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9974:EE_
x-ms-office365-filtering-correlation-id: 79876f2f-3b71-48a5-f66d-08decaaf64b5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|38070700021|3023799007|22082099003|18002099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 nYLPXzQr5d7OrPhOLN0w2vYEeqoHtkDQDr7VSzxadZ8OlH2cdhEuaVXHv5qT6diZ9Jxd56rRU8WWrCsdfsFVh75RFbxUs5CKMY1XhJXZ3IRCCB33vKeiXHyedgFJ0womshK0z6DBhdBLJaQ7zDvcO4R6o8QR9U4Tm2rhh9TRmI2IZrtAwMxZBTBw7+qnOpZayl08eq+on+oZ3a3MpSSsV/dBtBMb8tvV4SpqWSeAB0JIibhDe/SdfdYMRtC/euornsTsHB+PliNUNotAHijsrSw4+PB+4zmlFK2b++5u4JzLTwucsDRh+WCGer4f7QPJoGiVq++C++/hld5NtiIQypMDr4hzH+sLAkvVwFew0Y7/m+FeptwNkmdm5YW3vnfKnMPqpeAjDoLbvBGCzDWHIiIiyv6c6P4EGNRdU3McY69sfyjmeCI0cUPnA9qhDX7X5/jJ5fngJtPmYVbxXi+KKV4OofS50SMMhIsP4Q/jIbhBeXICQfXIvUP0BMsVmV0WdAYBUe++kxcQ7QPG21k//UkIQhRbXA09iKBjaykevKwq4oHDb7CObkPqpcCMLBhirrzjRx247YdoCRwix8nxCNvo0z7+AcMmu31LWOVPbhJHnbgAxLsOgqQqhcb4u56ED7n+sutMDUcn0bPtkxAN+CTf8KGT0T/U3lO3lulLh3KpqvzByT2AH/62SiGWGMpxHUYKf6LpRawDrVb/0PxwV52ddkc52SECqrWt6GAWFzzAK9ZP70ln6fpeMuFH1mYb
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(38070700021)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2Q4NVdZeTNvZFF3MzhjOFZsZTdOUnMwdS90U3g0YXFRYmRYRjRYdFhyMTdF?=
 =?utf-8?B?bUpzTXpoeWNzM29meXBpVHJScXhtbnVlK2txNGJhZ0VuRHdBLzFwQTI1MjM2?=
 =?utf-8?B?NGcvc2dNbnlRQnJaWTJJWHNZSHhTM1NPWkMvR0FuWUhWMjRTUExESGlJTFpQ?=
 =?utf-8?B?R2pHcHprNG85OE9oMFhSSUpWU0ZQZEJwclJxL0tHZDNIaUZWS2JzNjFUaXRz?=
 =?utf-8?B?VXJVZWFYY0J0cGRkUDRTeVdrSGFabGlyaDBLREZVbm5IUTA3RUJjSTRmOGFD?=
 =?utf-8?B?UXlHQmFUQ0NsZXF4QVlrMm5Ua21vTlBZYVF0cmJsMW9Ld1Via2VWTithcnlE?=
 =?utf-8?B?ZUVHMzl2UVFFTVV4bHhrRlgrZEFYRXIvYlhUN2hxTDQ1RHVYbnBqUHYwYStO?=
 =?utf-8?B?Y3VjT3JGQXE0QWthZkZZNzZJN0h4dkJWUTZMUE5HTjhHaGNpdXlrNmtrYUVL?=
 =?utf-8?B?MGZmUDdJMzIyeEpSUERrcHFFTTBpY1NVbVZnYzZFcHdWNFpDUmdMZ2ZIeFJy?=
 =?utf-8?B?UmsrLzBoVk5PNnBaOHZjSlJUOFljWEhZUnlpQWJLSEMyTVhtWjd3L1dGaVlU?=
 =?utf-8?B?YWNOZEtnb2M0QXJXRUkvL3FsVjQ2bENnMGJHVzdVUkNJWmw4ekRQeHdxbUN6?=
 =?utf-8?B?MVBEc2ZBM2V6RVFzOW9tOFJ2bEJkVzdhMkd5QUtPUURuNWh2SnpkTnhzUFVG?=
 =?utf-8?B?RG1EaUkwWDNhamo5N1hEY0xNanFieDliaVhQdkhxaHVIbXIvNCsvNXU2d2Q0?=
 =?utf-8?B?YUVlSHUxZEtGRlZkVDk2NzZvYXhQSmcrTVZ0NkN2Tm5QZXFWbi90eDM4OVFD?=
 =?utf-8?B?QmJZMkh6eWxMdkl4dDJkQUlyRHppSHI5c3BQWWdLd0twaXFlU1A5UzVuTWhm?=
 =?utf-8?B?dFVFcWRMZEIrbjYwenQrL0c1RCt2SkdaUS9NWGkzYm95b05wVFUzSXFwR1NP?=
 =?utf-8?B?bWdSYVRzTUt5cVd0MkdiUXBkTWtTbE9JMkhIcjZXMnE3TXQ1SnVVVldEdVdi?=
 =?utf-8?B?MzhERnVGaFJuMVV5azhscGk2NTJobllIVXk5b1QxVEs3SW4xaFVvUkVzS0Mv?=
 =?utf-8?B?YWowaWRKbnRmdm1Wd21rdlZqWTQ4U0xmTFZUbXd4ZVkrY0lScHNOeGZEcWpH?=
 =?utf-8?B?bFNDZ01JY0Y4MURJQmhrai84YzBsT3Q1dFBUaXFKbVAwaEhUdU9RSldMTU15?=
 =?utf-8?B?RzV1QTkwaDMzMDJJU1lNYitYbHVvZVdYM2RZWFR6VmhyMGpBUmdHMnRLa0p0?=
 =?utf-8?B?REt2V29VT0ltMWxEWmRneFZjbEdHVmtyU0puZEsyRW9RU0V2MW52OFYweFhG?=
 =?utf-8?B?VUFnTU9ZdkF0VEl0WDVISllpVGdCMGhuUGdITnVHVk1yOXZXNjNzYlJhRTFB?=
 =?utf-8?B?TVQrNk5DYVZQZExNQ3NxdjJhT3NyNmRtQmdlRFVTYzR3bGtDOEVuNG5IS0Zh?=
 =?utf-8?B?QUN1MkpmODFZTG9wcXJOZ1NxTllBLzNpMStJOFFHVVN2YjZ4eGlFUmNDalNz?=
 =?utf-8?B?Y0JsWmt3TStUc25DOEJ5WE1IaFdjVk1lbFQyQ1ZtUmt2NG1tRUxjOCtCaVNB?=
 =?utf-8?B?V3pEdXJRQ0N1M3FIeXcyOVV5TEJKL3VUdUlFQ1AvdEY0L3dEOGk2QU9tZWRO?=
 =?utf-8?B?VEJod0ticDd2a3d2SkdocUw0eWN5eE5MV1JTZE1TQ3RMWExXdXd0L1JBREQw?=
 =?utf-8?B?VzYwSmhaQkdyVUVpQzVaR3A1TGZuVWFlQ3BLTzY3N01FYlJkTjFvQjVzV1l4?=
 =?utf-8?B?blhzRTF5Z2k5OUZ1QlR5Z2hwb2Z6ck02QWVvTndOdDVzU3R0Q1JWVkpwZFox?=
 =?utf-8?B?V2d0M2dlQjYyMHcyTUNXUGdFUmJGd0xRTlFqbDBhdmJuRjFJMDRjMXVhU1pL?=
 =?utf-8?B?Tkc5dDZmSk1abmtVOWRkdGZRNXFKMnhCeTU5STUxNUlMcVVrWXJxZzdjR3BS?=
 =?utf-8?B?T25KTDdUemtVbkduTUtHSmN1N3UzSHVBdzhHOHZkb3M4YWM3U2xFSUh1eHVv?=
 =?utf-8?B?cUNISjkvaFQ3Y3E5dFFzNXkxNVlNY2c0WWVUWVdSOE5FcExFb1ZPTkF6SDFp?=
 =?utf-8?B?RHpZTnBIaXBmdXlrdHpXYXloMTdMdlliRVhNUkltL0c3YUZvamU1OTRsNUg5?=
 =?utf-8?B?ZEN3NmVYak1sZkxUQzY3T2hFZmpKUnRYTitqYmQ4SlAxZ1NJVm5mOE42d1ZD?=
 =?utf-8?B?b296MFN1NFBLTjFsWU1XdS9PanZXODRDY0dHc0I1SnY4OEo5VUYvWGdlUVFk?=
 =?utf-8?B?ZTNBMXVTWGQ0ckZlUzZyNnZKYTdPUW04RlhTdzV3b3Z4M1l5c3VrMGJWWVl3?=
 =?utf-8?B?OHpUSkpwQ0tORXI1dXZadW5iTTBTaXBSRXZjRnlvKy9sMGVGZWZ5UT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 79876f2f-3b71-48a5-f66d-08decaaf64b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2026 07:26:19.0866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DZSUTRxlFPYslpo7BuA/VMNhJ3V59cbAkzTxjYa0hI8MbWbTUfYoMfL/esYgZhXSnBDN7TJb4kkmUYqBARPsUT4WAQS9vn8e/+PJHNVFRyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9974
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33991-lists,linux-renesas-soc=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:biju.das.au@gmail.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:dkim,bp.renesas.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5766F68432F

SGkgS3J6eXN6dG9mIEtvemxvd3NraSwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8
a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiAxMyBKdW5lIDIwMjYgMTE6NDANCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAwMS8xMV0gZHQtYmluZGluZ3M6IHJlc2V0OiByZW5lc2FzLHJ6ZzJsLXVzYnBo
eS1jdHJsOiBEb2N1bWVudCBSWi9HM0wgc3VwcG9ydA0KPiANCj4gT24gRnJpLCBKdW4gMTIsIDIw
MjYgYXQgMDM6MzA6MjlQTSArMDEwMCwgQmlqdSB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgZGV2aWNlIHRyZWUgYmlu
ZGluZyBzdXBwb3J0IGZvciB0aGUgUlovRzNMIChyOWEwOGcwNDYpIFVTQiBQSFkNCj4gPiBjb250
cm9sbGVyLiBUaGUgUlovRzNMIFVTQiBQSFkgYmxvY2sgaXMgc2ltaWxhciB0byBSWi9HM1MsIGJ1
dCBlYWNoDQo+ID4gcG9ydCBoYXMgYW4gT1RHIGNvbnRyb2xsZXIsIHVubGlrZSBSWi9HM1MsIHdo
aWNoIGhhcyBhbiBPVEcgY29udHJvbGxlcg0KPiA+IG9ubHkgb24gcG9ydCAxLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+
IC0tLQ0KPiA+ICAuLi4vcmVzZXQvcmVuZXNhcyxyemcybC11c2JwaHktY3RybC55YW1sICAgICAg
fCAyMCArKysrKysrKysrKysrKysrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVzZXQvcmVuZXNhcyxyemcybC11c2JwaHktY3Ry
bC55YQ0KPiA+IG1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVz
ZXQvcmVuZXNhcyxyemcybC11c2JwaHktY3RybC55YQ0KPiA+IG1sIGluZGV4IGM4MzQ2OWExYjM3
OS4uNzg4ZTQ2N2IzOGRiIDEwMDY0NA0KPiA+IC0tLQ0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jlc2V0L3JlbmVzYXMscnpnMmwtdXNicGh5LWN0cmwueWENCj4gPiBt
bA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZXNldC9yZW5l
c2FzLHJ6ZzJsLXVzYnBoeS1jdHINCj4gPiArKysgbC55YW1sDQo+ID4gQEAgLTIzLDYgKzIzLDcg
QEAgcHJvcGVydGllczoNCj4gPiAgICAgICAgICAgICAgICAtIHJlbmVzYXMscjlhMDdnMDU0LXVz
YnBoeS1jdHJsICMgUlovVjJMDQo+ID4gICAgICAgICAgICAtIGNvbnN0OiByZW5lc2FzLHJ6ZzJs
LXVzYnBoeS1jdHJsDQo+ID4gICAgICAgIC0gY29uc3Q6IHJlbmVzYXMscjlhMDhnMDQ1LXVzYnBo
eS1jdHJsICMgUlovRzNTDQo+ID4gKyAgICAgIC0gY29uc3Q6IHJlbmVzYXMscjlhMDhnMDQ2LXVz
YnBoeS1jdHJsICMgUlovRzNMDQo+IA0KPiBUaGVzZSBsYXN0IHR3byBzaG91bGQgYmUganVzdCBl
bnVtLCBieSBjb252ZW50aW9uLg0KDQpPSy4NCj4gDQo+ID4NCj4gPiAgICByZWc6DQo+ID4gICAg
ICBtYXhJdGVtczogMQ0KPiA+IEBAIC01MCw2ICs1MSwxMiBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAg
ICAgJHJlZjogL3NjaGVtYXMvcmVndWxhdG9yL3JlZ3VsYXRvci55YW1sIw0KPiA+ICAgICAgdW5l
dmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+DQo+ID4gKyAgcmVndWxhdG9yMS12YnVzOg0K
PiA+ICsgICAgdHlwZTogb2JqZWN0DQo+ID4gKyAgICBkZXNjcmlwdGlvbjogUG9ydCAyIFVTQiBW
QlVTIHJlZ3VsYXRvcg0KPiA+ICsgICAgJHJlZjogL3NjaGVtYXMvcmVndWxhdG9yL3JlZ3VsYXRv
ci55YW1sIw0KPiA+ICsgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiANCj4gSW5z
dGVhZCBncm91cCB0aGVtIHVuZGVyICdyZWd1bGF0b3JzJyBub2RlIGFuZCB1c2UgbmFtZXMgbWF0
Y2hpbmcgdGhlIGRhdGFzaGVldC4NCg0KT0suIFdpbGwgdXNlIHZidXMwIGFuZCB2YnVzMSBmb3Ig
dGhlc2UgcmVndWxhdG9ycy4NCg0KPiANCj4gPiArDQo+ID4gICAgcmVuZXNhcyxzeXNjLXB3cnJk
eToNCj4gPiAgICAgIGRlc2NyaXB0aW9uOg0KPiA+ICAgICAgICBUaGUgc3lzdGVtIGNvbnRyb2xs
ZXIgUFdSUkRZIGluZGljYXRlcyB0byB0aGUgVVNCIFBIWSBpZiB0aGUNCj4gPiBwb3dlciBzdXBw
bHkgQEAgLTc4LDcgKzg1LDkgQEAgYWxsT2Y6DQo+ID4gICAgICAgIHByb3BlcnRpZXM6DQo+ID4g
ICAgICAgICAgY29tcGF0aWJsZToNCj4gPiAgICAgICAgICAgIGNvbnRhaW5zOg0KPiA+IC0gICAg
ICAgICAgICBjb25zdDogcmVuZXNhcyxyOWEwOGcwNDUtdXNicGh5LWN0cmwNCj4gPiArICAgICAg
ICAgICAgZW51bToNCj4gPiArICAgICAgICAgICAgICAtIHJlbmVzYXMscjlhMDhnMDQ1LXVzYnBo
eS1jdHJsDQo+ID4gKyAgICAgICAgICAgICAgLSByZW5lc2FzLHI5YTA4ZzA0Ni11c2JwaHktY3Ry
bA0KPiA+ICAgICAgdGhlbjoNCj4gPiAgICAgICAgcmVxdWlyZWQ6DQo+ID4gICAgICAgICAgLSBy
ZW5lc2FzLHN5c2MtcHdycmR5DQo+ID4gQEAgLTg2LDYgKzk1LDE1IEBAIGFsbE9mOg0KPiA+ICAg
ICAgICBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgIHJlbmVzYXMsc3lzYy1wd3JyZHk6IGZhbHNl
DQo+ID4NCj4gPiArICAtIGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAg
IGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgICBjb250YWluczoNCj4gPiArICAgICAgICAgICAg
Y29uc3Q6IHJlbmVzYXMscjlhMDhnMDQ2LXVzYnBoeS1jdHJsDQo+ID4gKyAgICB0aGVuOg0KPiA+
ICsgICAgICByZXF1aXJlZDoNCj4gPiArICAgICAgICAtIHJlZ3VsYXRvcjEtdmJ1cw0KPiANCj4g
ZWxzZToNCj4gICBwcm9wZXJ0aWVzOg0KPiAgICAgcmVndWxhdG9yczogZmFsc2UNCg0KQWdyZWVk
Lg0KDQpDaGVlcnMsDQpCaWp1DQo=

