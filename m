Return-Path: <linux-renesas-soc+bounces-29758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDoTN16JumnSXgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:15:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D61F2BAA4E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 058AC31650EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 11:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E221B3A3E82;
	Wed, 18 Mar 2026 11:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="I7gGrmq6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B073C5DB9;
	Wed, 18 Mar 2026 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831637; cv=fail; b=h/nkr/fp59gudxWGyrJgztMMEwhTsrtD6dc5mhKZpTt00QBw60Ugdw/0ToWPEj5WpAwPyQ7IlloAUvWXEotRAryUqC0AjT8ZXu1HR7hMq+KCDFxNNIC29sHH0l+waxjf5EiwMEgy9pov+sa5XRlCHZa6pWi1xPmAOE3UTEsQRGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831637; c=relaxed/simple;
	bh=DPH5p/YqzDHDHxz8ZJXYY+sfyyWTZ6r++rBRj0Qf3PA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Re1qi+3k4wfAIKaObjwF23iMl355l85t/BEz7AEAa45JpJwuph7HG8wbIdBQOXOstvZrNk5T1Cygkbtu79Ml/KUI9UvYglBUaqXtKbMZ9gAOncCDxjXYnnRrs+5ZWyCDn19SWavSn/9dZQTvg2abKHgCdFKvZuDMmGYWMDb1vhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=I7gGrmq6; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sk1BtdCaU9RIXvzxlNyTbR86HG360hZFuHwhdIapbaP/MA5N76jNNPFx0CB+xJt0gItonn1nGc6C1rmhWXZqezf62EfnzeI8CTjYz/OJqwqXkCUbgG8eF9+q5PBwGc+VgC3ZpkN6akyAS8E+3mpRoRuWaCjCrEhBWisUgkyiBH/QVNliGFxxsNFDl6jOLic0qotS1B6LBavlH6j62lcJI7tzF33R1hH47GIDIzSriwHmwIQOgb2CZn9iQEaLtlFfmmuT072M9166zcppvrtCc7HdTUwYyPvAqQiG5yETHaQ5OKtg1rhPRP2mEYjRgsNZnKQza0epWp96ssMGT0INUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DPH5p/YqzDHDHxz8ZJXYY+sfyyWTZ6r++rBRj0Qf3PA=;
 b=sEATqJifcjHaHk6vs7HHo4GiZEOAc8ga7oiz7BhI7T0OmP0yfiLh1TE6O0Xq11yv6CEzuMlFNx0u8uqGNocXb+nGxCiWA2wjAexp4VLjHiM18goCEXX+rHOomWe/ROHlTkWgviiC2vym3ZTbX1njZS5KtHVwz3DM8pmLDGuvpRzqT/OnWt+0odbxfY5Eu6du1XCGAROLr3tigOYByMesnxUsAmTv6J0Hrnh7W2s1SGBUxOQodGdOVlxFXdhoCDgB9VM0ANkyDBq6o6aMhb59EzRj798TwSnkdZanVdnmcbwIuWO0LMmiWMLLLdJXsqPP92Cklk+WPr0l6WXHqCWeWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DPH5p/YqzDHDHxz8ZJXYY+sfyyWTZ6r++rBRj0Qf3PA=;
 b=I7gGrmq6T28uDTWEKorIgl5XsZQsgAHdrshesaafpD/WRjSeSj8WXWH6YGSwkQl21tbZvT4/jUcuI3CdAnQPTge1O7paqPVjzZ6RDC68/nyy0n7uAxkGyp6rFeOgeraKIADkFeb3T0ZOie8KWJ+bCQxonuMoybv3o25IHP27JB0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10361.jpnprd01.prod.outlook.com (2603:1096:400:249::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 11:00:27 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 11:00:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 0/3] Add critical resets support to RZ/G2L SoC family
Thread-Topic: [PATCH 0/3] Add critical resets support to RZ/G2L SoC family
Thread-Index: AQHcrW8X6748Qie190a8qQTwkJpbpLW0ME2AgAABJUA=
Date: Wed, 18 Mar 2026 11:00:26 +0000
Message-ID:
 <TY3PR01MB113460EE762D3E93802243A1F864EA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260306134228.871815-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdW1O=UMekx1YUmYYOJRSKG2cRV2fNCOH9dMeLh3Yvihrw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdW1O=UMekx1YUmYYOJRSKG2cRV2fNCOH9dMeLh3Yvihrw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10361:EE_
x-ms-office365-filtering-correlation-id: 39ffc253-ba33-4f73-a719-08de84dd8feb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|18002099003|56012099003|22082099003|7053199007;
x-microsoft-antispam-message-info:
 wyUWVeQN6JzlAfwuTpZsQUVqayKgTTSGCiql7qgCqN693dS9KakIJSMb4s9xpjqDilEFmuQR/nkwwrSkEeiXtHcCcY7nTbQGtI1x43rZpn7SRBZQJANjCwdW9dC7Oi12ZwJPLT0R2qEh2qMWvU4eYBjhKZtxQpMWkxrTNqCpay53wNzuZ25RNEdItTQeNuBPL6HXUvDVKVYgroZANIxfK/svwhwAJd8wg4HIPF2qqfzm1yYCHzX1auy/I5RciJHh5LFeS2XzgSqgdJzTTSoSZ+4/mYtq577YzErA324WpCV71yASZO2kJ/GVdN0/D1xuzU2JhZbMo1WcN8wac65nEPrvfWh4rpdBD/wYmkUFxINk06qv+xdXH6Qf2pqt8S/nSsHFtqou6aS3M9EIMyXsyjwUXOxcU2mILVa/y9dEBNgMiBxDKdB/eohJbGKPyjcOo2D8ZQOrYXSC2HOP09PfuYuuoknUj4IZyaiSQnwhxwgWozQKfKgJwBJn6TnZ+NjO3Yn927X2pRadKrorL5Fap54nKtIf8sZgs8NCIDxRfxXlPc6Ykz/op3orB6fbRX8fkr+P60cLYDV4udjh/IKlWWu2rM4H+Ym1BKKDDTeFJLEzRiAA94EyHyKZ/3F30hJog8+gL3W/FRhSyei3FIrH3j7dk+OX6yu5nk8dyVnSMCSoP2P23iHBOPifZdzan6AmnzI4gvIUlDAm7hXNlls/+E/MNWirTAVtOeA04q4ESImaH0GSc+7rX7NrJB12LBUv9c/FBrYAAjfkpXd6xw78Ek1hp42pIaPTmoQk3lmbY2s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2RXd2oydzRFQm9ZcE82NUkvSFVtS2l4V1BJeVdiNUhCUy9UOEMvUk9tODMy?=
 =?utf-8?B?bVJST0JoeURuc0hUL3dabmZNY2lJZ3FnS3JxZGd3UnNVNm41UDUwVkZtU092?=
 =?utf-8?B?Ui9aOWJqVEpiS1lFT0NjR0dLaEJxQzhtMWYvTEsxcDNPVUJNK3lVTjFKN2xa?=
 =?utf-8?B?VUs2V1ZUNE9nZlJoaHRxV0pGeEVTSnlBOFZjMzhXNGNBN2c2WHNuL2V4blUx?=
 =?utf-8?B?YzVqYSsvSUY0Szkyb1pqdHNtWjBYa0RRN21IN2VGeGhBZUZINjR6MmlDUlMz?=
 =?utf-8?B?U3RXczUrV1NScytPVzNacjBrOXIwTWlwdzc5ejJsdHpoeDVIOFhpVUZmb05t?=
 =?utf-8?B?ZFJoNXNQczFQYU5kRldFMVMwUzFhQkpVY0lqeFNWTmhGb0JlekhVQ0dldWtq?=
 =?utf-8?B?bEhVNDh2VnNaSG1xWjluQjN2a2RGaDR5L2RqblV2S2pDWFlUclRpaUNTQTRO?=
 =?utf-8?B?Uk5XaldyZDl1VmUvVEZUY2hZWnk1endINjhPZ0dkbWttbUNUcUNtYjNLd2o3?=
 =?utf-8?B?VERKQzhZc2dWNE9hRVBNbFFUN3Vtc1UveTNsTmF6TzhEWUdkRXNVcDdHRk9M?=
 =?utf-8?B?Q2wrYWo3emlQTzFvRW5PczIrN0lYM3AzK3RPWGhJOEd6MU1WL09OcTJTdWFG?=
 =?utf-8?B?UVpYR3NnOC8zRENTZjhwNVg0TGdsMzE4NjlHNUxXZ2w4dTVQRWhqNFZHOXdy?=
 =?utf-8?B?a0FWYUtZMFlGdVlGV0JxdDJKcVRBYUdoQ3hKUEc2dyt4ajl0elNTWHRLL2FH?=
 =?utf-8?B?VnkwZlp4OXFDUXRqbThXTGhTbERIaFhHVERzK1FqSXpPWEN4Q1JQdW9MTnJS?=
 =?utf-8?B?MERxVGkrUkZaTzN1SXV2b0llWE1WQkJaaWlmS0xrR1lqL3Uwamk2bHNMZXgx?=
 =?utf-8?B?S0lkd0NhSnl6ZUpKQVlBWUNoTzN5NlI3WnNqcytaMURjTGVmSk9JQk1qRkJ3?=
 =?utf-8?B?c2JtTk5CME9RYVJyeVlRYTJ3bWlpZ3hhL2lEN0dIUDE0cXlGQ09aYlJSZ0c5?=
 =?utf-8?B?VUpUWjVYYlhYYlZpTDVwZk0zSHVzTGhkTjBxT1RENENCZHZ4a3hXU3Zoc0Ez?=
 =?utf-8?B?ZEZCUVV4UGo1eVppcGRpZmdMYU5KTmFBbjF0OGExVWZISHA3SUZTL0lHbXNG?=
 =?utf-8?B?VFBpWkFoVmh1Y0szQXpLQ3RYM0tnZEYrQndadktocWc3engzcnhiS1hQVU5q?=
 =?utf-8?B?dTVXTXlqdS95ZkFOeWtqTmpENzdIdCtCeXJXT0hQTzNyb1RPMG1OelhjcnBo?=
 =?utf-8?B?NnhNeVRqcjFCOUp5S1ZYZEllQlhmWFpkenNUVlpuc2FZZ29STVk3TFppZU54?=
 =?utf-8?B?TEg5NUxqa3VCNXRSQkJ3OHpIcy8rNThMcjI3djdQaUYrYkJiMFBzeGJIQTBD?=
 =?utf-8?B?ZFc2SUduOXhGQXFHdUIzczhGNnZBSTJHUWxHS3ZZdVR6ZXRSZGcxdVFnT21G?=
 =?utf-8?B?ODhEOFFmVkQ1ZEQrN0cyMGdvUHpwQllRc0pQNFBxLzYzTDFEV1ppcXJhS0tn?=
 =?utf-8?B?WDU1L1lGQkN5OU9JUFF1aTJKcVRkeU9TQVRLQ2ZhVEo2Q0VJWUt2WlBLQ2NV?=
 =?utf-8?B?RnFIVXBTaHNNcjRUR2tiTU5taTh4bW53TDJtOFFrQlVncEJMY0JrZnhXNEh2?=
 =?utf-8?B?YzM5ZEt4ckMvUkJ0cDViQUdtNG50dFBDZk9Lb0h1ZlhIUGw5cjhDdElpUWNH?=
 =?utf-8?B?ekU0UTRqNkVJU1o1MDV2L0dKdkRHV3B6T2VnbWJnRU1BaGU4azhFSXR5NHJV?=
 =?utf-8?B?aXUyS3pURCtralpkUHN2a1RWQzJCb0toVldMOXlPR3MvdEJBRncwd0x4NzlZ?=
 =?utf-8?B?L0djSE5kcVNsVk9lY080ZzhPQ1dPUThXQ0lieVVPbmFGaisvZmdEdko2aXpp?=
 =?utf-8?B?cEY0Q3pENjdQM1pYUGlmR2o3cmYyb0VWcUtkejExYmp0NEN4ZUp4R2ZaRzMv?=
 =?utf-8?B?NCt3cUlBVzBKa1d4WlZTcklaeDd6aGo3aUlKTHBNQXN5b2h4cHArSHh1b25I?=
 =?utf-8?B?OUd5NG4rWExGWkEvTmNEeC81TjRTYzdTeWlXL2NmWkE4UHBZRDdjK1dRRHJR?=
 =?utf-8?B?NGtwWFVseERKVTZoLytNdjVETWFMckxqd05BY0Faa0o0OCtERDZQNWxnY2Fv?=
 =?utf-8?B?SWJ2aWVCTENqOGxsVCt4MHAyaGljN01Vc0ZONng2VVpmeXRQYUFoSE50ejRx?=
 =?utf-8?B?YXJkM09VREptbzlGd2xyNngyclBJWFViQkpER2RSRVZBUktBVHprZk56Sjh1?=
 =?utf-8?B?aUFnV0RqZ280SVdOcGJ0Um5nUW5wNGlHci8xaWFqYk1HL3M2c1V6QkJwZC9U?=
 =?utf-8?B?aWM4SEJGMmV0T0VtcGZSWk1rME9CL1I0Wit6QUpSbGpLU2xWNnpIZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ffc253-ba33-4f73-a719-08de84dd8feb
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 11:00:26.6886
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BGJNAJcatAjtF2doA7bUetYGa+vlpBNxfbbukmPWVbREJFN+AKKeqeZlrsUhrqM3TepZ79KDiIYY1xuY1uHUR4ufdXqXNmgsrKLoYSjQb5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10361
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29758-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 4D61F2BAA4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50OiAxOCBNYXJjaCAy
MDI2IDEwOjU0DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMC8zXSBBZGQgY3JpdGljYWwgcmVzZXRz
IHN1cHBvcnQgdG8gUlovRzJMIFNvQyBmYW1pbHkNCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBG
cmksIDYgTWFyIDIwMjYgYXQgMTQ6NDIsIEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3Jv
dGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+
DQo+ID4gU29tZSByZXNldCBsaW5lcyBtdXN0IHJlbWFpbiBkZWFzc2VydGVkIGF0IGFsbCB0aW1l
cyBhZnRlciBib290LCBhcw0KPiA+IGFzc2VydGluZyB0aGVtIHdvdWxkIGRpc2FibGUgY3JpdGlj
YWwgc3lzdGVtIGZ1bmN0aW9uYWxpdHkgd2l0aCBubw0KPiA+IG93bmluZyBkcml2ZXIgdG8gcmVz
dG9yZSB0aGVtLiBUaGlzIG1pcnJvcnMgdGhlIGV4aXN0aW5nIGNyaXRfbW9kX2Nsa3MNCj4gPiBt
ZWNoYW5pc20gd2hpY2ggcHJvdGVjdHMgY3JpdGljYWwgbW9kdWxlIGNsb2NrcyBmcm9tIGJlaW5n
IGRpc2FibGVkLg0KPiA+DQo+ID4gT24gUlovRzJMIGZhbWlseSBTb0NzLCBETUEgcmVzZXQgdG8g
YmUgZGVhc3NldGVkIGZvciByb3V0aW5nIHNvbWUNCj4gPiBwZXJpcGhlcmFsIGludGVycnVwdHMg
dG8gQ1BVLg0KPiA+DQo+ID4gQWZ0ZXIgYSBzdXNwZW5kL3Jlc3VtZSBjeWNsZSwgY3JpdGljYWwg
bW9kdWxlIGNsb2NrcyBtYXkgYmUgbGVmdA0KPiA+IGRpc2FibGVkIGFzIHRoZSBoYXJkd2FyZSBz
dGF0ZSBpcyBub3QgYXV0b21hdGljYWxseSByZXN0b3JlZC4gVW5saWtlDQo+ID4gcmVndWxhciBj
bG9ja3Mgd2hpY2ggYXJlIHJlLWVuYWJsZWQgYnkgdGhlaXIgcmVzcGVjdGl2ZSBkcml2ZXJzLA0K
PiA+IGNyaXRpY2FsIGNsb2NrcyAoQ0xLX0lTX0NSSVRJQ0FMKSBoYXZlIG5vIG93bmluZyBkcml2
ZXIgdG8gcmVzdG9yZQ0KPiA+IHRoZW0sIHNvIHRoZSBDUEcgZHJpdmVyIG11c3QgdGFrZSByZXNw
b25zaWJpbGl0eSBmb3IgcmUtZW5hYmxpbmcgdGhlbSBvbiByZXN1bWUuDQo+ID4NCj4gPiBCaWp1
IERhcyAoMyk6DQo+ID4gICBjbGs6IHJlbmVzYXM6IHJ6ZzJsLWNwZzogQWRkIHN1cHBvcnQgZm9y
IGNyaXRpY2FsIHJlc2V0cw0KPiA+ICAgY2xrOiByZW5lc2FzOiByOWEwN2cwNHszLDR9L3I5YTA4
ZzA0NS1jcGc6IEFkZCBjcml0aWNhbCByZXNldCBlbnRyaWVzDQo+ID4gICBjbGs6IHJlbmVzYXM6
IHJ6ZzJsLWNwZzogUmUtZW5hYmxlIGNyaXRpY2FsIG1vZHVsZSBjbG9ja3MgZHVyaW5nDQo+ID4g
ICAgIHJlc3VtZQ0KPiANCj4gSSBhc3N1bWUgdGhpcyBzZXJpZXMgc3VwZXJzZWRlcyAiW1BBVENI
XSBjbGs6IHJlbmVzYXM6IHJ6ZzJsOiBEcm9wIERNQSBkcml2ZXIgZGVwZW5kZW5jeSBmb3Igc3lz
dGVtDQo+IGJvb3QiWzFdPw0KDQpZZXMsIHRoYXQgaXMgY29ycmVjdC4gVGhlIHNhbWUgcGF0Y2gg
c2VyaWVzIGlzIG5vdyBwYXJ0IG9mIFsyXSBhcyBpdCBpcyBib290IGRlcGVuZGVudC4NCg0KWzJd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDMxODA4NDE1MS4xMjI2NzQtMS1iaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbS8NCg0KDQpDaGVlcnMsDQpCaWp1DQoNCg0KPiANCj4gWzFd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnLzIwMjYwMTMwMTQzNDU2LjI1NjgxMy0xLWJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsu
b3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3Bs
ZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0IHdoZW4gSSdtIHRhbGtpbmcgdG8NCj4gam91
cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4N
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

