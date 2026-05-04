Return-Path: <linux-renesas-soc+bounces-31941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0J42GQyN+GkVwgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 14:11:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C39964BCC38
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 14:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A52E530137B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 12:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347F13B9600;
	Mon,  4 May 2026 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aXWeB99v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011019.outbound.protection.outlook.com [40.107.74.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415D3C1419;
	Mon,  4 May 2026 12:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777896712; cv=fail; b=u0d/hV6WL4UTzRUz79CfXblyWxZvUecVYPK6y2kJ4jOGvWlkSLia1htn7tj+E/V+bRQbL4lVp20vDflKaXcX/5h4ZN9LsUmkV2GZTdqX+lN2m7zZ53oViCxRzLHEYFA+7teXXz3PwtgEKFrmd8Zn3IJws9gR+JoQXVP9f3sL75Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777896712; c=relaxed/simple;
	bh=wHFBxq+Pm/79WR+XYa5JYmgY9/k9NZqLfjP88Lh+qIQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HKkvNc5uhNTUPe/1xlm5Sj7A6+fsw44aioaJ9bvvRT6CeV3IHdcHguhQb0fc9p5JenM2d6yx26jWB+jKSE/UgdJbEe6Fb1SZiI8bIB0gw/+jN/Epvez4rFoB56uIMcpUzflz4zcDPViIrz5Ydxln1DOx2UC8BEhqtWgknb0LpSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aXWeB99v; arc=fail smtp.client-ip=40.107.74.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pipyjWjVOO4NViGXRMUf3OXmHqWPHJbysganEInOU9AoQJ36u7DKqYz7JZohMFKrcJcVblb3wMznt/ibeGkpYU+peOgh4ptEp6wp70t7vHU2sDvtzeIBSNZ5f34/U5xhr8Kq3tvci/wyqm7kn2FC8LbwitcZML0NgSUUTQaeg88jCm6LdoK03+QdiBVVzsgctouGbWiAJVGHnlL5exYPzX2gcfV3c87zWJt1ukY0sdpktf6c/UzLZc78Yx11QO73DeVmodmxmiRp9YLHqIKFhZEcPd/kTc5YkTQpfUdxVwkgPWPtjuHjkBpPThl5hYjHqdtQDpI6sb9t0qtjTo0UdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHFBxq+Pm/79WR+XYa5JYmgY9/k9NZqLfjP88Lh+qIQ=;
 b=N4m9TsbIAGWG0qY+oA71S4gA4Bl0ThCbtiLoJwFfMwPZXfX1RNe0csVjgI3Y+uwwt1wNHP1WOCqt4JJW2RBcWShMHMlwzk0uYqYXYVKsEe99DMgi6oujqVyePPGB1s++pbfy9fzo8O60VJNJUE7Ov3yat3ToxUt1JS9oQTqnvFBMDBKDq1uFDffeNqT1/VjoGxfj3TxzPgxV18TVmmYtUaRGRFotKAGUUK21D/q3wzYegwcMb2iNTAwA1n0vm1kYGnDYvMXkqyYrLSJOrYyjHTQ8FyNczlA1jyZhQUdBC9J4Aw0xqi4HdY1y7mUuTQIa2grQEY5rkYkrSLqeTGoQAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHFBxq+Pm/79WR+XYa5JYmgY9/k9NZqLfjP88Lh+qIQ=;
 b=aXWeB99vMj+JGqc65E6g+NDuol8h4cBmFQJcx4MzfnD4iRqfuyNEAXMPRL2XJhxlfZOcJtD94MephSTgw4hTM/QohLEHMpLTW9IOPcR1GQ3zZGMY8Sg0FldzBl9AJ9mQ35wmplOMMorp0iMnHTclyCVw8t68q21CX0sk2ZPABq0=
Received: from OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM (2603:1096:604:465::6)
 by TYRP301MB1306.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:305::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 12:11:45 +0000
Received: from OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM
 ([fe80::888:6ace:31a0:180]) by OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM
 ([fe80::888:6ace:31a0:180%4]) with mapi id 15.20.9870.016; Mon, 4 May 2026
 12:11:44 +0000
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Vinod Koul <vkoul@kernel.org>, "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underflow
 during suspend
Thread-Topic: [PATCH] phy: renesas: phy-rzg3e-usb3: Fix runtime PM underflow
 during suspend
Thread-Index: AQHc1n7ANECNPwe9y0+ScapReaOqMbX8jucAgAEpLoCAABHIAIAAA3PA
Date: Mon, 4 May 2026 12:11:44 +0000
Message-ID:
 <OSOP301MB197608A7EC2A58F91BD98F2ED3312@OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM>
References: <20260427194741.161533-1-ovidiu.panait.rb@renesas.com>
 <afd-gj-F3OYDfCwJ@vaman>
 <OSOP301MB19766FF764E6626FF1CD6771D3312@OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM>
 <CAMuHMdWT+hv37gxi-5fbLVc16Fk4SKsXuBis5Fg6_zm7TS6hkQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWT+hv37gxi-5fbLVc16Fk4SKsXuBis5Fg6_zm7TS6hkQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSOP301MB1976:EE_|TYRP301MB1306:EE_
x-ms-office365-filtering-correlation-id: 534c4cde-7a42-4e52-2ad5-08dea9d64f0e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003|38070700021;
x-microsoft-antispam-message-info:
 CR6179bRMUQmmDNJ04N5wedJ9UaSz+cPYh4M+XLpfgp3Cu9L4AN7zAr6sV8PhKpY9e4Bw3OtPp86r8Ga8jlplZkZ0uQftq9H1NgLpGLLAFSx8HHi1HC8qQuzel5kwoOeAqdGwAZv2ai/X7G5VO6vDco0kl2c5ITWar+/vJpG89sFVq5KfSeQno4Bjkv82omrkw3Mik2qqLCnKWMpjtBNHQEd4iP67h8D3l/cy8L4EAeyt1h1IrHgcviwnIN1P72jgtaqKDLiJxId4fMm5uv3kZcN2hcYxs2UIT40Kw1drqBhhKGTOmEC5m+X02585aV5pvZJ6agYa7bMyR6ZimpIaCGG/U0DVh9by3pGrnBpLgVegV4lu3yKfgJTXCQiLbH98gAiqivlawc32UXnyoJ1ymRg3YOuixIgrMMEjsWcOysFdm0cGqLToy62I9pNc0UnVm6+zfz+wxeiPmw+goAFa30cVLid9lW/j58cUzFkFkumyyks7Jwuv7rGzMWNskeVLot2uOb0a3qmp+poEz3eH/lMNfhEG6VbTXWySOuIP0VuiGaDc11OBaXiKl4/IMY8xKE99oEXMGQiPqPEQZKC0rc44Hx5t7PfqlceSvTGzOJHdYXEmDxF7sqW4RT9n/OV8cjWFINdPDTucUYrC8LcyC7pVedWQAucVaiPlOp+wBAy48CJfXM8wyCcv0BhiN7H
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1E1Vm5paGxkQW5MYmNuanNqQWVmOXVPM2JuV1NDZk9NRE1iWkw1anF5aTBv?=
 =?utf-8?B?RWJSVjdNK0swaFlpalJMTjBFcmtlS3kwZ3JaQ3lVOFZUMFFjVTF6U1dKOU43?=
 =?utf-8?B?OG5YZTVCVTN0L0dyYnZkU2QwQjM2NzRRNHdBdmR0cHdZU2NHTVBWUkpTZ2lu?=
 =?utf-8?B?SE1FQ3VGeVNyS2NRbFFJMW05MVZSVkNwM1cwZDl4TE44b0lrRGxyeXJXZ2hr?=
 =?utf-8?B?WldBK1FnSStzOHlETks5dWg4cVRtVDJCL0FOeGtYQytVSHpUSmFVbi9oRGls?=
 =?utf-8?B?dzM0eXorWklETU15SkhRbnp6K1BTM2lhNjgrVTFhbmtIMWlkajZHZmcrZW1B?=
 =?utf-8?B?RnRXQmZuMTdNbDhkWU5DckJuNVArUGV6RjF6TzdVUVpCRkZZWVpXQVl3VE5a?=
 =?utf-8?B?cVpocDV4YXZ2RWg0dzI2RzVpTnJRdmZ2cTNPaTdIWVk2T0tidXNlNWZkUXRs?=
 =?utf-8?B?VVRPSTlNTGtmWU52VTJ5VVc2b2YyejNRSU4vTEJRNVJyS0JsZkkrc0dLam5F?=
 =?utf-8?B?Y2R0dXN5Z21RRDdGUkZXaDBuRVhodWMwWkswS3lXTm55Zk1iTEROblRqajRt?=
 =?utf-8?B?WGN5Rzl1TUpDRkVuNVgrRlJRV3ErRGVXRm1IbEFwSFBUUlg2cmE0aVVEUFpG?=
 =?utf-8?B?bFc2RmNWTnN2NDE2UVhaaVVJL3ozNFcwZ0czL0ZDd0x1Z2RxRWZpYklFT1NK?=
 =?utf-8?B?RUwrSDVkMGhzMGFKRTJFOHY3WDR6OTZZcGFLTEF0ZzVMUS9ESU9KRUtSZWFq?=
 =?utf-8?B?b0J3RUo4dDg1SmtwZXhDdm9GR1V6MVJ1dUkrUjRtdUdYc0E3TTRiV1F1bzlK?=
 =?utf-8?B?RVNHWnlUK1k5b001ZDlqMmlJb0RHSjZ1OFFOc3orZ1VVamkwZ2dBTHRHeVNO?=
 =?utf-8?B?RVR5T3pBak9icnJRclk3YmF1QXhjSUMrUXdYUis5Y3Ywa3c1bDlkNGREaXlD?=
 =?utf-8?B?WnhGQjhTcytucFVPWmZxT096ZG00V3A1Z013cFB3aWFqaXVxdElxaHMxWlBt?=
 =?utf-8?B?UXNnSjAyQ0IvcEFJTGFHaHIvcmw2dVFWZVRCUWhPQTEzWXVrTDhNQTN3ckFS?=
 =?utf-8?B?ellDNW1wWDN6VWFVZ21xcVduZjZVMWlPekFDYjhoUGpVazgremorZmVFSDE5?=
 =?utf-8?B?aWhqWFk1dmV6TnIrZDVLZmlNQzJYRkhURzdBb3dEb1FRK0JFNFpVME9kYWlS?=
 =?utf-8?B?Znd5Nyt1OFNla1N6SERqaGErenZwVisvOUU5QWlSQjltWmt5QnBaQmRIaFFk?=
 =?utf-8?B?Wkx6Q2NGTmVNb0Q1QW9EaTh5Rk5McXpxOUcxekluTDJneW5TTWF2YXVRbXZB?=
 =?utf-8?B?cWEvdkhyTnB2Wk45cE5BQ2tZS1BuNk5ZZVhEdHZjRlBkT2JHOTZ2MitLbndK?=
 =?utf-8?B?VUtBMnJaTzZKR1U5alVUZ281cUhtOThmODNHQTRscndHcDhtK3JZTkdxam10?=
 =?utf-8?B?Wjl5WGVWeVl4ajVaRldMenlvMkc1dkFGcmg3aGdlYXBoSWJ4T3VmNEpyWlhS?=
 =?utf-8?B?YWZWekUvNUNtcWhwTTVKY1k2Z045NUhwaWdzeVRxNDRpWlpjNVQ0a0xTaTJT?=
 =?utf-8?B?SFZoZ2VvdFhUYVZvcytGWXY3OUp4UFJnTlkxTXhNaU9RaC9mQ3c5dTd2d1Bq?=
 =?utf-8?B?QmlDY1p1cENDSldqb3VJS1B6eXpkTEh5ci9seGRBK0E1dzhTbmpPQzJDbEV3?=
 =?utf-8?B?S3hXRExBT0VqcElxdWl0MlIzaFcxbVkwTlJTL0JOanRmVk0vWEdrNysxbmxZ?=
 =?utf-8?B?L0x1ZDNUWUJoeTJWaS9ldlZCSTNETzJCQlZoc2t1ZUJaQ09MTHFxaksya0tj?=
 =?utf-8?B?K3ZyUHpxYm9oZTJiTzQ3RXVZaDNxa0tHek5TSlNxVUdKSmtpenc4WDQ1N1hk?=
 =?utf-8?B?OHJzRDU2WWFreWtkWXdJZ2dRN2QvUVhVTjVhcVRxZUdHV25SSVdWaXpqT3dq?=
 =?utf-8?B?YzAxMi9BUTZRNENYSGIrVUFSVzM1UDBkODVmaVZab1BLb3dHNFBsVEpzOVBL?=
 =?utf-8?B?MFZWOWEveDZ4L0UxV2t0eGM1RlBwYmhqRzkvK29sTVZ6UkdrczZCZUg2MUZC?=
 =?utf-8?B?dmF6b3JWMVZvb3BSSzdsUGg5SkVHdm9hNk1vKzRUMUIzbWt5VThtY3hkVzUv?=
 =?utf-8?B?VENDZzhBajZ5N2ljcHlkS1ZDdkg5T0VpU1Y5aEV1ZnJyc2YyWEd2bTQ5dGFH?=
 =?utf-8?B?b3VLcThDNzZpY2FWU2F4ZXl3YXlGamlLam1MWjlicllzMy9hM2ZJbHdDN0dD?=
 =?utf-8?B?eVhDKytoczBwMG0vTGFPclp2ZXlsVlNOZUY1VVFPZmIxN1JFM2dhK0ZKTndG?=
 =?utf-8?B?VXFxa0Y3QjU1OE9yUmFMT3h6TVAveFVkUVBtVkRqOS9SeWhQWUxpL2RXb3J0?=
 =?utf-8?Q?Ywt1XlyShBPQs/bE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSOP301MB1976.JPNP301.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 534c4cde-7a42-4e52-2ad5-08dea9d64f0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2026 12:11:44.7367
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0sVVv2KQx2AAiyA0BvglPm+8FackBANW7vum5MC33DwNhxd5c8W0CLl65MNB9OYywFFWBSGHKkrYuLqs5l9zbfOdP+784+uQvwF5t+bZNZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP301MB1306
X-Rspamd-Queue-Id: C39964BCC38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31941-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:dkim,renesas.com:email]

SGkgR2VlcnQsDQoNCj4gDQo+IEhpIE92aWRpdSwNCj4gDQo+IE9uIE1vbiwgNCBNYXkgMjAyNiBh
dCAxMzoxMSwgT3ZpZGl1IFBhbmFpdCA8b3ZpZGl1LnBhbmFpdC5yYkByZW5lc2FzLmNvbT4NCj4g
d3JvdGU6DQo+ID4gPiBPbiAyNy0wNC0yNiwgMTk6NDcsIE92aWRpdSBQYW5haXQgd3JvdGU6DQo+
ID4gPiA+IE9uIHRoZSBSZW5lc2FzIFJaL1YySCBwbGF0Zm9ybSwgaWYgdGhlIHhoY2QgZHJpdmVy
IGlzIHVuYm91bmQgYW5kDQo+IHRoZQ0KPiA+ID4gPiBzeXN0ZW0gaXMgc3VzcGVuZGVkIGFmdGVy
d2FyZHMsIGEgUE0gdW5kZXJmbG93IGVycm9yIHdpbGwgb2NjdXI6DQo+ID4gPiA+DQo+ID4gPiA+
ICAjIGVjaG8gMTU4NTAwMDAudXNiID4gL3N5cy9idXMvcGxhdGZvcm0vZHJpdmVycy94aGNpLXJl
bmVzYXMtDQo+IGhjZC91bmJpbmQNCj4gPiA+ID4gICMgc3lzdGVtY3RsIHN1c3BlbmQNCj4gPiA+
ID4gIDE1ODcwMDAwLnVzYi1waHk6IFBNOiBkcG1fcnVuX2NhbGxiYWNrKCk6IGdlbnBkX3Jlc3Vt
ZV9ub2lycQ0KPiByZXR1cm5zIC0NCj4gPiA+IDEzDQo+ID4gPiA+ICAxNTg3MDAwMC51c2ItcGh5
OiBQTTogZmFpbGVkIHRvIHJlc3VtZSBub2lycTogZXJyb3IgLTEzDQo+ID4gPiA+ICAxNTg3MDAw
MC51c2ItcGh5OiBSdW50aW1lIFBNIHVzYWdlIGNvdW50IHVuZGVyZmxvdyENCj4gPiA+ID4NCj4g
PiA+ID4gU2luY2UgdGhlIFBIWSBmcmFtZXdvcmsgaXMgbWFuYWdpbmcgdGhlIHJ1bnRpbWUgUE0g
b2YgdGhlIFBIWSB2aWENCj4gPiA+ID4gcGh5X3Bvd2VyX29uKCkvcGh5X3Bvd2VyX29mZigpLCB0
aGVyZSBpcyBubyBuZWVkIGZvciB0aGUgUEhZIGRyaXZlcg0KPiB0bw0KPiA+ID4gPiBtYW5pcHVs
YXRlIHRoZSBydW50aW1lIFBNIHN0YXRlIGR1cmluZyBzdXNwZW5kLg0KPiA+ID4gPg0KPiA+ID4g
PiBUbyBmaXggdGhpcywgcmVtb3ZlIHRoZSBydW50aW1lIFBNIGNhbGxzIGZyb20gdGhlIHN1c3Bl
bmQvcmVzdW1lDQo+IHBhdGhzDQo+ID4gPiA+IGFuZCBhZGQgYSBnZXQvcHV0IHBhaXIgaW5zaWRl
IHJ6ZzNlX3BoeV91c2IzX2luaXRfaGVscGVyKCkgdG8gbWFrZQ0KPiBzdXJlDQo+ID4gPiA+IHRo
ZSBjbG9jayBpcyBlbmFibGVkIGR1cmluZyBpbml0LCBldmVuIHdoZW4gdGhlcmUgaXMgbm8gY29u
c3VtZXIgZm9yDQo+ID4gPiA+IHRoZSBQSFkuDQo+ID4gPg0KPiA+ID4gPiBBbHNvLCBjaGFuZ2Ug
dGhlIHN1c3BlbmQgb3BzIGZyb20gTk9JUlFfU1lTVEVNX1NMRUVQX1BNX09QUyB0bw0KPiA+ID4g
PiBTWVNURU1fU0xFRVBfUE1fT1BTIGJlY2F1c2UgcnVudGltZSBQTSBpcyBkaXNhYmxlZCBkdXJp
bmcgdGhlIG5vaXJxDQo+ID4gPiBwaGFzZQ0KPiA+ID4gPiBhbmQgcG1fcnVudGltZV9yZXN1bWVf
YW5kX2dldCgpIHdvdWxkIG5vdCBhY3R1YWxseSBlbmFibGUgdGhlIGRldmljZQ0KPiA+ID4gY2xv
Y2suDQo+ID4gPg0KPiA+ID4gPiBGaXhlczogZWU1ZjFhM2Y5MGE0ICgicGh5OiByZW5lc2FzOiBB
ZGQgUmVuZXNhcyBSWi9HM0UgVVNCMy4wIFBIWQ0KPiA+ID4gZHJpdmVyIikNCj4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogT3ZpZGl1IFBhbmFpdCA8b3ZpZGl1LnBhbmFpdC5yYkByZW5lc2FzLmNvbT4N
Cj4gDQo+ID4gPiA+IGluZGV4IDZiMzQ1M2VhMDAwNC4uMDU1Nzc1ZTFhMGY3IDEwMDY0NA0KPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yemczZS11c2IzLmMNCj4gPiA+ID4g
KysrIGIvZHJpdmVycy9waHkvcmVuZXNhcy9waHktcnpnM2UtdXNiMy5jDQo+IA0KPiA+ID4gPiBA
QCAtMjE1LDI3ICsyMjYsMjEgQEAgc3RhdGljIGludCByemczZV9waHlfdXNiM19yZXN1bWUoc3Ry
dWN0IGRldmljZQ0KPiA+ID4gKmRldikNCj4gPiA+ID4gICAgIGlmIChyZXQpDQo+ID4gPiA+ICAg
ICAgICAgICAgIHJldHVybiByZXQ7DQo+ID4gPiA+DQo+ID4gPiA+IC0gICByZXQgPSBwbV9ydW50
aW1lX3Jlc3VtZV9hbmRfZ2V0KGRldik7DQo+ID4gPiA+ICsgICByZXQgPSByemczZV9waHlfdXNi
M19pbml0X2hlbHBlcihyKTsNCj4gPiA+ID4gICAgIGlmIChyZXQpDQo+ID4gPiA+ICAgICAgICAg
ICAgIGdvdG8gcmVzZXRfYXNzZXJ0Ow0KPiA+ID4gPg0KPiA+ID4gPiAtICAgcmV0ID0gcnpnM2Vf
cGh5X3VzYjNfaW5pdF9oZWxwZXIoci0+YmFzZSk7DQo+ID4gPiA+IC0gICBpZiAocmV0KQ0KPiA+
ID4gPiAtICAgICAgICAgICBnb3RvIHBtX3B1dDsNCj4gPiA+ID4gLQ0KPiA+ID4gPiAgICAgci0+
c2tpcF9yZWluaXQgPSB0cnVlOw0KPiA+ID4NCj4gPiA+IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC8yMDI2MDQyNzE5NDc0MS4xNjE1MzMtMS0NCj4gPiA+IG92aWRpdS5wYW5haXQucmIl
NDByZW5lc2FzLmNvbQ0KPiA+ID4NCj4gPg0KPiA+IEkgdGhpbmsgdGhpcyBpcyBub3QgYXBwbGlj
YWJsZSBmb3Igb3VyIHBsYXRmb3JtcywgYXMgdGhlIHBvd2VyIGRvbWFpbg0KPiBvbmx5DQo+ID4g
Z2F0ZXMgdGhlIGNsb2NrIGR1cmluZyBydW50aW1lIHN1c3BlbmQsIHNvIHRoZSByZWdpc3RlciBz
dGF0ZSBpcyBub3QNCj4gbG9zdA0KPiA+IGFjcm9zcyBydW50aW1lIHN1c3BlbmQvcmVzdW1lLg0K
PiA+DQo+ID4gVGhlIHBvd2VyIGRvbWFpbiAoZHJpdmVycy9jbGsvcmVuZXNhcy9yenYyaC1jcGcu
YykgaXMgbWFya2VkIGFzDQo+ID4gR0VOUERfRkxBR19BTFdBWVNfT04uDQo+IA0KPiBXb24ndCB0
aGUgU29DIGJlIHBvd2VyZWQgZG93biBkdXJpbmcgczJyYW0/DQo+IA0KDQpZZXMsIHRoZSBTb0Mg
d2lsbCBiZSBwb3dlcmVkIGRvd24gZHVyaW5nIHMycmFtIGFuZCB0aGUgVVNCMyBQSFkgaXMNCnJl
aW5pdGlhbGl6ZWQgaW4gdGhlIHJlc3VtZSBjYWxsYmFjazoNCg0Kc3RhdGljIGludCByemczZV9w
aHlfdXNiM19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0Kew0KLi4uDQoJcmV0ID0gcnpnM2Vf
cGh5X3VzYjNfaW5pdF9oZWxwZXIoci0+YmFzZSk7DQoJaWYgKHJldCkNCgkJZ290byBwbV9wdXQ7
DQoNCk15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCBTYXNoaWtvJ3MgY29tbWVudCAoWzFdKSBpcyBh
Ym91dCBydW50aW1lIFBNIGFuZA0Kd2hldGhlciB0aGUgUE0gZG9tYWluIHdpbGwgYmUgcG93ZXJl
ZCBvZmYgYWZ0ZXIgdGhlIHJlZmNvdW50IHJlYWNoZXMgMCwNCmRlc3Ryb3lpbmcgdGhlIFBIWSBz
dGF0ZS4gV2hpY2ggZG9lcyBub3QgaGFwcGVuIG9uIG91ciBwbGF0Zm9ybXMsIGFzIHRoZQ0KQ1BH
IGRyaXZlciBzZXRzIEdFTlBEX0ZMQUdfQUxXQVlTX09OIGFuZCBpdCBvbmx5IGdhdGVzL3VuZ2F0
ZXMgdGhlIGNsb2NrDQphY3Jvc3MgcnVudGltZSBzdXNwZW5kL3Jlc3VtZSwgcHJlc2VydmluZyB0
aGUgc3RhdGUuDQoNClsxXSBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA0Mjcx
OTQ3NDEuMTYxNTMzLTEtb3ZpZGl1LnBhbmFpdC5yYiU0MHJlbmVzYXMuY29tDQoNClRoYW5rcywN
Ck92aWRpdQ0KDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxv
dHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0K
PiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxs
IG15c2VsZiBhIGhhY2tlci4NCj4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UNCj4gdGhhdC4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

