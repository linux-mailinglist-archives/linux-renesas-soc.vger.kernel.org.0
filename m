Return-Path: <linux-renesas-soc+bounces-29356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH6wNOEktGl7hwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29356-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 15:53:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B61285581
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 15:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2DE11306FD22
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 14:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D973A6B69;
	Fri, 13 Mar 2026 14:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jL4bcvtq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C2A372B22;
	Fri, 13 Mar 2026 14:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773412550; cv=fail; b=KmgzItHZigdD9ovs1xrSEHz6vLVPC8i6EdSIc1GtjWnAiVsq2QokU0D8B2UoMIz9LoOMzOmN5nC5ZELFg9+zSwumrZ/Hq3tA8Zmg5HCA/iMfNudmu4yLV7ONYbkCBdaUWX3DRLwbFyRiWWcCOHNqQf5krU5NJKOBY3TsREkDl2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773412550; c=relaxed/simple;
	bh=61EdyhMT9LOM70zf1ZPIDuoEiqeBUbftdWrm+cD0tRk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XkXMJ1vSir5xljiQucs6OxdJcyYn83gksEnUFUQqh8OKSnJP56Tq6oyB/WuXqgOHENKUgZZX/2oo/uQGu+JtbyNKT3O0KK3b8/Qk/cLozF5ZtwbxWszAXLhqdhICFyghZXU+RKoITb1BlYFK2RNcPI4QRI29legJzmp6MMYSSGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jL4bcvtq; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3DFSlwD5MDSqnxyJzvNpmFEHzk7lppGGgKttqRvNJOhT5i/Dbl1J9B5I9HmsMidVyYFpEOy9c8lDnKfv7aYWhceTld/6XPaOKJsfvbw2W2TFwAhqLJOEsRu2+mAJVrew/Yzo4AI3jZz5ScbD1rg0gF6CiQqq2e8ZsDZ/0Oa1hLOWQiZuJ/80UCAwPhj7e4mNfyN9MBRk7uMMYStcTHrEhtfuDgt4G9sxUGVqk/PM1ux+psdKUc/V0quRBRzfItZH11d2unMg6QcKdov9Wg2OnoEcVKZzPiadIwDzQCDSMl1rHnbfLRKd64YNv5HYLMAe/vLbgXmd8ZBTXBBasDn1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=61EdyhMT9LOM70zf1ZPIDuoEiqeBUbftdWrm+cD0tRk=;
 b=y6RjK+fZ8VlY2JmqnYjC9lac26pAjDOG+yetf7iXq5C4kNJ1Zzuy85scJrplytGTAyvM/BTs1VymEEbMCNDNk4kVWq1Z61AQ8z+Shv43LBMsltdFn/6Wvf/lG8jYs9QfT7K5tFQr1xaaLqIuOXuA0lxOuMCT62VCwWB1zUjTm9ozWD/4MBKMpLso6woigZHtmZmGM0zo6Hj5CRpcAlZjXCSmvuCPtzi1Uosa0ayQy4kid4eS3B/+0kwzLNRfGgcX/kctDJcJWZyiYjHbeHNYC76d86aJ2kkNUXHIDWbo9h7phZftd/p0aAcRVCzOTDgTZxA3I4AGgJSeSG7YxZgdSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=61EdyhMT9LOM70zf1ZPIDuoEiqeBUbftdWrm+cD0tRk=;
 b=jL4bcvtq3m4fsCaIonb+5zi835jgDbbPw8DIkNhUzevBnvmvpnXATQUDi+AuQQo5nHWHmk3O+A9SRDEKkMQUG34biTwkUFrn9KHMSZf4v4LsI3ryWmCXsezlb1k1l45JahPbZ7wpbTItvIWmf8kXQzMSSpfpyeejDG30k/vQcHk=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS7PR01MB14682.jpnprd01.prod.outlook.com (2603:1096:604:38f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Fri, 13 Mar
 2026 14:35:44 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 14:35:36 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: biju.das.au <biju.das.au@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, magnus.damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v3 05/10] dt-bindings: clock: Document RZ/G3L SoC
Thread-Topic: [PATCH v3 05/10] dt-bindings: clock: Document RZ/G3L SoC
Thread-Index: AQHclPgnnEkoF8XdO06GH+Sodqqfy7WgLMSAgAACCtCADIxGgIAAAdjA
Date: Fri, 13 Mar 2026 14:35:36 +0000
Message-ID:
 <TYCPR01MB113329C33FF3CF8832B9FB1498645A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com>
 <20260203103031.247435-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdXPuBEODa0Uyhuv7u9ERY+YajsECTa0=XKY6WcE-VnaGA@mail.gmail.com>
 <TY3PR01MB113464F7D135B2CB24B91140F867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdWtBRHKSd6wb7Q-YmCPSnBGk_pETp7q-eCUJi3t8ERS5Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWtBRHKSd6wb7Q-YmCPSnBGk_pETp7q-eCUJi3t8ERS5Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS7PR01MB14682:EE_
x-ms-office365-filtering-correlation-id: 5931d039-4f9d-4482-c035-08de810dcaad
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 nwJMXDYqdqvlHh7C/LR4vXYGrilKtqPa2pnfKiRn7WWrRokQzwBrvJ+s69ov/PL2/d+KgVjOvoo3xg/K6haix2f/jcjSqxquoEqecbUE/Q3vFbE/6Dc0cD2Cvk4MxuplAGMz/rRTH071/Vuc9awb0tkmTLII4EQnNLPxvNntgKUTyehcGzxnRpn7Q7nNIGZJZNZ/C1nFfJp09ZSEObL3SA6I/YjhrnPPaEhYG+avmvbncnbFDavwLBo8BzQqi9kxbnuf/O0C1bvBFIoMcH1huLnPdOcm61S6OVrOZ1yO1b2eGFhtZaNbKc0WYII7kBUp71B6UQiYTlUaqFpBrBjt163BaD8al0I8sU79INYraTsRVaZV3GMk8SUBjHBzSj0c5sOJsqWzlt2Rzyv39kUSeTU/Y8mxwGLb1aluz2wt+WF4NHQjWCzhHYV0kHWuyEsoMKqBB2txCIbBPI3yb+8hnVnPhWhDT1cRHFp6n1HxtT3gX9sYE5EYBECQsrCSAeSlvAjWOS+c0BDdo16bvoxpsnYAEGHs5pqZPrWHLlIN7rgsPjoIgmXJNsNRzbxgFzKB/rFISS/3aqZa4Pp7C6CkxaQCVXp1vGJyEP+BVde76xvyYbBk9lpf8/mfaKmAWIR6KrvQEOBserEUwVtVVpf6AOa9JDpNnikcg5SuUv/xB8Bc+hFVisduxuWxkfZR+LgH4DuoeMV08QemGmH6dDaOXkK7lw/SPBtEY5Y8A0Hf3jCJ4Rwk8JeZQ4Sr+xFxFAc8kZKMmawfqgPV02+HH1YRyxa9sb6Hce2oikgzT9PLT8s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cjRBYlduUmdOV0crSi9DTTRPZE9mQWZSaGlaNXhPbGJvSUFtRnROYkRzUTlq?=
 =?utf-8?B?R0lvNURQZjNKZGpVNk5EMEFNVFoySzBiNlVDSWpCVENxNmQ4U0RxRm5EL3hQ?=
 =?utf-8?B?K3FjdXJUODdJTmh5Z29vbzFvbEx3ckxrMVp4Tmd4Vno3SXk1NW16UkVHbTBt?=
 =?utf-8?B?K0pXMjFrdnYvZ0JwNnloU1FobFc0RTNocW9DdWZrQkZmQ0lCNFF5L1FzNWU3?=
 =?utf-8?B?MXkydHBUOVYvMm5qaml6QmJQclluTE9ndC9NKzF0ZWY0alFTbmRwOWRJOXZN?=
 =?utf-8?B?Z29DQ2xkTWNKMXplZ2FjN2VtYWF2dU9DWmJ6ZitERVoyVFNhUGZFVUwrcld2?=
 =?utf-8?B?WU9UaHZhRjJnZHk2TlAvV0ZLaTlKazR3S2liWGN1ajFTYmtKczlBNTVnVWlj?=
 =?utf-8?B?OE0yUUI2ei96OCs0bmIxOFFUWWVmbmlBN0c1ZFNwbU1aUkhaSHNyUkVxYUNn?=
 =?utf-8?B?WE1MN2JuSFlaREhreUJlQW8xUmVlZ3Q1OHI3UUN6Z3RaM2N5aC9SR1hoRzhj?=
 =?utf-8?B?NWhKMGZOT2VPaGJKcFoyakcyL2xrcTJucEJRR0RqRGQ5SjlPdjJndFJZdysz?=
 =?utf-8?B?MVJvMlNiaGNmYm1ZMzhnZW96a2ZndFk3cTZ5ZVQrK0Vma3pTM3dlb1NpSEgv?=
 =?utf-8?B?d1VZdTBjdG1tVVNiNXZOQTc1eDJGUjMvbmxEWXV5bUdTVUM5UnJUaXcvTEdV?=
 =?utf-8?B?QXd5bHZ5STJkcHRsNUNwZkEvSHUxOTMyZHZKd0ptSUJycldZa21iZ2JHZHdM?=
 =?utf-8?B?cGhmMXptQU9CckVmMXpmUnVIM1M0T0dENVVpSmc4SHFVYWd1bW82a3ZCclR0?=
 =?utf-8?B?clM4N2pEdTY4MFFHVmtSRm52VVpvL29Wek1xVG55dVR4ZTBiZ0Y3RUxVbnpX?=
 =?utf-8?B?bjc1dUNXVWs5TjdxT2pXYTNTdnFsOEd3SmNUVldXK0ZKak5YZHc4c252VVRC?=
 =?utf-8?B?WTF1WmJxRC9IT2Z0czgwTXN5STZwcEpDTFo1VVgvYjRZcU1lUElGQ1JFeTZz?=
 =?utf-8?B?UzVpUnBibUFJV0IxYTZWY2JKc0QzeHE3YWtOL3d5VGZpZGQ0US9nbXJuRXVW?=
 =?utf-8?B?U3FyaHl4THIvZE1malhIcVIzWkpici9PWi96NnBtUjFWbjBqSVJCTlh4NURI?=
 =?utf-8?B?REtmQmUrcVhSL0FLN3dSOGhrTUtHZnVWNlZjU2RwUUphbTB0UVZ2M055MFRZ?=
 =?utf-8?B?K3NPT094UzVRUVNQajNWTi80a1JSelNXalFDUFpNQndDNXVPaHA3cm1sUDZW?=
 =?utf-8?B?ZnFOSGZDekpKOVdCM3YyaXREdTBnczhXS1M0dDU1UVhlR0I2NmdrNzd3eGdl?=
 =?utf-8?B?bHd3QytjbUU0OFZoeVlkZkxCUEVPZWM5OWxDYkJ0UGhiZzN3ZHZUL3hweVcx?=
 =?utf-8?B?by9tSDd6aCtFVHVoelFjTEhPak9hOHFxekN1UmxkWXB2VHc1ZFdGSDNMSEE2?=
 =?utf-8?B?bVRXVkkwS1Fob1BwSmhnTTlMdEwvdVAzY0t0eXI3QzZLZEsvWEhPZFpzQXhK?=
 =?utf-8?B?QUowbzNLUmlRd2o0Rm5GVFhLcU5QRUQyQUxvYVIvWGNQOXh4V1B4alpxdDBy?=
 =?utf-8?B?RkZ5UUdPSDVOSjltZS9uK09HMDduRUkydXJaM2pGdUVXd0tGcG5xcGczUldL?=
 =?utf-8?B?Z1VjYy82TGsxZzh6c1VSQ2JPVXhBTitjUEZoTkZibndxcWViVng5dVp2SWxx?=
 =?utf-8?B?SUpRV0pVVm9jTGZBbWhWUjUzbnIzS1hQRUNERE00SXNVektQaW9XdHBuNHZt?=
 =?utf-8?B?cDlJcGtxbDNsalJhOUxDYUJuR3VWWi9sTmYxMWYyZlRtRTNJOFBxV3ozTkdZ?=
 =?utf-8?B?YWloSVh2RnlING5Sa05PdURndXRSK0R3aWVIR3NHdjVBNlJFOFFtR3JLN2Jt?=
 =?utf-8?B?cTFxWWE4Wk1xRDJrOVJHL0pMdnlOckpRZjJGMmJ1eXhtZzRGQVZDQkNrSThy?=
 =?utf-8?B?RXIxS3JSQWpieUE5VmZMMWtKTExZNit6SHFEYm1xNmh5Vks4M2N4dWJkNHdq?=
 =?utf-8?B?OEx5cEt5YlplUFdmcHdzTUxPM0VKWHp1dGxNajh0WFF2c0RuT2YralVSM1Y4?=
 =?utf-8?B?VTJ6OStnVUR1Q2JDZWtWNmY2aklSeDZtT1VsaVRJZ3h4Y043K0ZmUjVsWHpE?=
 =?utf-8?B?MVQ0Wm5YTGpJb0pDNGNwSVhWbG5NVWxlTXhzZ2xWVFN5K1BZWFZhNEdDSC9E?=
 =?utf-8?B?NlBNT200RVVHME5pclFTN3dPN2FIWmJoRUE3aFFmejVoTStuN2pubXBTKzlN?=
 =?utf-8?B?L1JNMEo5bmt0YVVUcDRLRHpZRm9GTFZjWjNsZThrTDFvQzVCUzViSUJWejR0?=
 =?utf-8?B?RXIyNys2SjdIUzEvdDAzM2x2dkFMTGRYNTl3aDZ2UWxLaGNRUjUzUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5931d039-4f9d-4482-c035-08de810dcaad
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 14:35:36.7611
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sYYIUySM5Y8bklDGkuqfYcEkGsTVXjhA3LWBBGiGCRn8dMLEZ76kwXIraH5EFbGbYwJU8kLG5F8fhquRi+RkpDI/zGyTw6WKexK7HdpjvO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14682
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29356-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[gmail.com,baylibre.com,kernel.org,vger.kernel.org,bp.renesas.com,microchip.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,microchip.com:email]
X-Rspamd-Queue-Id: D3B61285581
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDEzIE1hcmNoIDIwMjYgMTQ6MDYNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAwNS8xMF0gZHQtYmluZGluZ3M6IGNsb2NrOiBEb2N1bWVudCBSWi9HM0wgU29DDQo+IA0K
PiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCA1IE1hciAyMDI2IGF0IDE2OjE4LCBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+ID4gRnJvbTogR2VlcnQgVXl0
dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gT24gVHVlLCAzIEZlYiAyMDI2DQo+ID4g
PiBhdCAxMTozMCwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiA+ID4g
RnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+ID4gPg0KPiA+
ID4gPiBEb2N1bWVudCB0aGUgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBSZW5lc2FzIFJa
L0czTCBTb0MgQ2xvY2sNCj4gPiA+ID4gUHVsc2UgR2VuZXJhdG9yIChDUEcpLiBSWi9HM0wgQ1BH
IGlzIHNpbWlsYXIgdG8gUlovRzJMIENQRyBidXQgaGFzDQo+ID4gPiA+IDUgY2xvY2tzIGNvbXBh
cmVkIHRvIDEgY2xvY2sgb24gb3RoZXIgU29Dcy4NCj4gPiA+ID4NCj4gPiA+ID4gQWxzbyBkZWZp
bmUgUlovRzNMIChSOUEwOEcwNDYpIENsb2NrIFB1bHNlIEdlbmVyYXRvciBDb3JlIENsb2NrLA0K
PiA+ID4gPiBtb2R1bGUgY2xvY2sgb3V0cHV0cywgYXMgbGlzdGVkIGluIHNlY3Rpb24gNC40LjIg
KCJDbG9jayBMaXN0DQo+ID4gPiA+IHIxLjAwIikgYW5kIGFkZCBSZXNldCBkZWZpbml0aW9ucyBy
ZWZlcnJpbmcgdG8gcmVnaXN0ZXJzIENQR19SU1RfKg0KPiA+ID4gPiBpbiBTZWN0aW9uIDQuNC4z
DQo+ID4gPiA+ICgiUmVnaXN0ZXIiKSBvZiB0aGUgUlovRzNMIEhhcmR3YXJlIFVzZXIncyBNYW51
YWwgKFJldi4xLjAwIE9jdCwgMjAyNSkuDQo+ID4gPiA+DQo+ID4gPiA+IEFja2VkLWJ5OiBDb25v
ciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gPg0KPiA+ID4g
PiAtLS0NCj4gPiA+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2sv
cmVuZXNhcyxyemcybC1jcGcueWFtbA0KPiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvY2xvY2svcmVuZXNhcyxyemcybC1jcGcueWENCj4gPiA+ID4gKysrIG1s
DQo+ID4gPiA+IEBAIC0yOCwxOSArMjgsMzAgQEAgcHJvcGVydGllczoNCj4gPiA+ID4gICAgICAg
IC0gcmVuZXNhcyxyOWEwN2cwNDQtY3BnICMgUlovRzJ7TCxMQ30NCj4gPiA+ID4gICAgICAgIC0g
cmVuZXNhcyxyOWEwN2cwNTQtY3BnICMgUlovVjJMDQo+ID4gPiA+ICAgICAgICAtIHJlbmVzYXMs
cjlhMDhnMDQ1LWNwZyAjIFJaL0czUw0KPiA+ID4gPiArICAgICAgLSByZW5lc2FzLHI5YTA4ZzA0
Ni1jcGcgIyBSWi9HM0wNCj4gPiA+ID4gICAgICAgIC0gcmVuZXNhcyxyOWEwOWcwMTEtY3BnICMg
UlovVjJNDQo+ID4gPiA+DQo+ID4gPiA+ICAgIHJlZzoNCj4gPiA+ID4gICAgICBtYXhJdGVtczog
MQ0KPiA+ID4gPg0KPiA+ID4gPiAgICBjbG9ja3M6DQo+ID4gPiA+IC0gICAgbWF4SXRlbXM6IDEN
Cj4gPiA+ID4gKyAgICBtaW5JdGVtczogMQ0KPiA+ID4gPiArICAgIGl0ZW1zOg0KPiA+ID4gPiAr
ICAgICAgLSBkZXNjcmlwdGlvbjogQ2xvY2sgc291cmNlIHRvIENQRyBjYW4gYmUgZWl0aGVyIGZy
b20gZXh0ZXJuYWwgY2xvY2sNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlucHV0IChF
WENMSykgb3IgY3J5c3RhbCBvc2NpbGxhdG9yIChYSU4vWE9VVCkuDQo+ID4gPiA+ICsgICAgICAt
IGRlc2NyaXB0aW9uOiBFVEgwIFRYQyBjbG9jayBpbnB1dA0KPiA+ID4gPiArICAgICAgLSBkZXNj
cmlwdGlvbjogRVRIMCBSWEMgY2xvY2sgaW5wdXQNCj4gPiA+ID4gKyAgICAgIC0gZGVzY3JpcHRp
b246IEVUSDEgVFhDIGNsb2NrIGlucHV0DQo+ID4gPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBF
VEgxIFJYQyBjbG9jayBpbnB1dA0KPiA+ID4gPg0KPiA+ID4gPiAgICBjbG9jay1uYW1lczoNCj4g
PiA+ID4gLSAgICBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gLSAgICAgIENsb2NrIHNvdXJjZSB0byBD
UEcgY2FuIGJlIGVpdGhlciBmcm9tIGV4dGVybmFsIGNsb2NrIGlucHV0IChFWENMSykgb3INCj4g
PiA+ID4gLSAgICAgIGNyeXN0YWwgb3NjaWxsYXRvciAoWElOL1hPVVQpLg0KPiA+ID4gPiAtICAg
IGNvbnN0OiBleHRhbA0KPiA+ID4gPiArICAgIG1pbkl0ZW1zOiAxDQo+ID4gPiA+ICsgICAgaXRl
bXM6DQo+ID4gPiA+ICsgICAgICAtIGNvbnN0OiBleHRhbA0KPiA+ID4gPiArICAgICAgLSBjb25z
dDogZXRoMF90eGNfdHhfY2xrDQo+ID4gPiA+ICsgICAgICAtIGNvbnN0OiBldGgwX3J4Y19yeF9j
bGsNCj4gPiA+ID4gKyAgICAgIC0gY29uc3Q6IGV0aDFfdHhjX3R4X2Nsaw0KPiA+ID4gPiArICAg
ICAgLSBjb25zdDogZXRoMV9yeGNfcnhfY2xrDQo+ID4gPg0KPiA+ID4gQXJlIHlvdSBzdXJlIGFi
b3V0IHRoZXNlIGZvdXIgY2xvY2tzPyBPbiB3aGljaCBwaW5zIGFyZSB0aGV5IGlucHV0Pw0KPiA+
DQo+ID4gRnJvbSBGaWd1cmUgNC40LTUgQmxvY2sgRGlhZ3JhbSBvZiB0aGUgRGVmb3JtZWQgQ2xv
Y2sgU3lzdGVtICg0KSwgcGFnZQ0KPiA+IDc4OQ0KPiA+DQo+ID4gVGhlc2UgY2xrcyBhcmUgZXh0
ZXJuYWwgc291cmNlIGNsa3MgY29ubmVjdGVkIHRvIENQR19FVEhfU1NFTCBtdXggZm9yDQo+ID4g
c2VsZWN0aW5nIHJ4L3R4IGNsa3MuDQo+ID4NCj4gPiBJbiBSR01JSSBjYXNlLCBjdXJyZW50bHkg
b24gUlovRzNMIFNNQVJDIEVWSzoNCj4gPg0KPiA+IEZvciBUeDogd2Ugc2VsZWN0IERJVl9FVEgw
X1RSIChTRUxfRVRIMEFfU0VUKSBGb3IgUng6IHdlIHNlbGVjdA0KPiA+IEVUSDBfUlhDX1JYX0NM
S19JTiAoU0VMX0VUSDBCX1NFVCkNCj4gDQo+IFN1cmUsIHRoZXNlIGNsb2NrcyBhcmUgaW5kZWVk
IHNob3duIGluIHRoYXQgRmlndXJlLCBhbmQgcmVmZXJlbmNlZCBpbiB0aGUgQ1BHX0VUSF9TU0VM
IHJlZ2lzdGVyDQo+IGRvY3VtZW50YXRpb24sIGJ1dCB3aGVyZSBkbyB0aGV5IG9yaWdpbmF0ZSBm
cm9tPyBPbiB3aGljaCBwaW5zIGFyZSB0aGV5IHN1cHBsaWVkPw0KDQpGaWd1cmUgNi4zLTEgQmxv
Y2sgRGlhZ3JhbSBvZiB0aGUgRXRoZXJuZXQgSW50ZXJmYWNlIA0KDQphbmQNCg0KMS4zLjMgQ2xv
Y2sgUGluIFNwZWNpZmljYXRpb25zDQpUYWJsZSAxLjMtMyBMaXN0IG9mIFBpbiBGdW5jdGlvbnMg
KDEvMikNCg0KRm9yIFJ4IHRoaXMgY2xvY2sgaXMgc3VwcGxpZWQgYnkgUEhZIG9uIHRoZSBSWi9H
M0wgU01BUkMgU29NIE1vZHVsZS4NClJaX0VUSDBfUlhDIGlzIHRoZSBwaW4uDQogDQpGb3IgVHgg
dGhpcyBjbG9jayBpcyBzdXBwbGllZCBieSB0aGUgU29DKFJaX0VUSDBfVFhDKQ0KDQpDaGVlcnMs
DQpCaWp1DQo=

