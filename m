Return-Path: <linux-renesas-soc+bounces-31015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM2DK7xg1mmDEwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:05:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 169EE3BD64B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 16:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33BEB305DEE3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 13:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89F373D170B;
	Wed,  8 Apr 2026 13:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RdnjDCv6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010020.outbound.protection.outlook.com [52.101.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D0C2F39B4;
	Wed,  8 Apr 2026 13:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775656674; cv=fail; b=M13dsHUafasD4vQSxZvmCe7JQsJx4aiFGLxN00utyLwTSadkxvkcwGdNL68/ZSK/xkSv2zsRt5RAJfuRQqb1M2NkgQduN1Sqfx2tkOeAelKStOnLcU/T4j35u8CTcXwLsYo9PAmSmMK25jmKy1g9tU3fZ3lxHq3B5AngizzoBU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775656674; c=relaxed/simple;
	bh=PGDeJRB/UT1ELcvYWKKsKbqwsq2rY8WaZrRH+3K3CgE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IF5tQ4LWjBbbwhOIAsWIa+tgTAUx4/uEpjSMAJHTZTn2aRJg8OYL6yxACMvwvB5bjU58RROS4CZfPc3oAuFb57D0zv3RiX0UxJehey0XNoLM1MaW8iZMNxxxrt9uoyXTrWFPmSpFI2LHeQtgos5KmxQGb254BToCQPty123J9uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RdnjDCv6; arc=fail smtp.client-ip=52.101.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJoMVqr3ph8UorpJGkqrCPLDYq2FaImpQCS5eJuiZeU3C+YzQq0KeZeHxTnwVtzncJ831njJaDtHnoNi7yD9V115uEOvg/c3oAZ6jTDJuZuDMRMBSHQEd0x3CHWdXdyJRK8WG29aJ7KY/3n5SLbP8eoBVyqDO+LLXaiWshhyqIupepRnJMYtdcqAVxR1xR/RgWslY0/YQt2OfWYIznE1WZbZdqJ7PFw2VZ1KLX8ddlTyAuDEtLvrJp3Irq7gdQLvVREHvOz0wyMOeci+a/v8nwoVuwGbjnrFWagZAzI8TrKBxLsNUu1NZnxK65SsaF4kj20fVGn6gRuzisMK8psaGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PGDeJRB/UT1ELcvYWKKsKbqwsq2rY8WaZrRH+3K3CgE=;
 b=CjePZYGyi8z/aB/Q2tXlMKFOc86Xz8/IUIYM2FnEYo8gNnJzM8JikhAJNSHnkZHb4cHNl+Lg05ZuQXSG2udoW8e8lpkHT7m1DjwyDCQovSy11Ndh/xoku4HhiRkrUNqMJXfP8C2lCW6qhtGolxKIwKIPBJuhRV42R0sQ8dKldH7cRKcpOfnfqjU8aZkNWORbrECzh6b8ZV9l8Do9HwG4z5S3EXxumPe8KTxEaXgB5tO7TU2GNary7PeE6DS8qgrDSBUOqW0OKa5RUdfu9b4FQ89KmQGsL2yhBGzzg7dB1BJQcFqB/R5jZPKiutT0+7mI//SyeIN3wvz1dO6hmHQSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PGDeJRB/UT1ELcvYWKKsKbqwsq2rY8WaZrRH+3K3CgE=;
 b=RdnjDCv6mNiUucU8f//lVs9QOml8DIK+nQvCFbHlQ4LQnq1O4QOZP27Qid7lhjXvl79AqENpcKqcvlcqa9rmud9SuAwL5Am+mCtHCwBjwktnyx1068771oGGJ47OkInOXJkvAUylk//Lt3noBClusrysfDs1pywxHGmccT8GfaU=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS9PR01MB17318.jpnprd01.prod.outlook.com (2603:1096:604:44b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Wed, 8 Apr
 2026 13:57:50 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9769.020; Wed, 8 Apr 2026
 13:57:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Thierry Bultel
	<thierry.bultel.yh@bp.renesas.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Pavel Machek <pavel@nabladev.com>
Subject: RE: [PATCH] serial: rsci: Remove goto and refactor baud rate clock
 selection
Thread-Topic: [PATCH] serial: rsci: Remove goto and refactor baud rate clock
 selection
Thread-Index: AQHcxqDt2+U24C0cukCY0FbfTclzAbXU1FiAgABdT+A=
Date: Wed, 8 Apr 2026 13:57:50 +0000
Message-ID:
 <TYCPR01MB11332A192C5117BCCE94C2231865BA@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260407151210.102693-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVXRKHuV0F4gSu+SsyWAS6RYxhd-XBCjXD1jbYznXup1w@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVXRKHuV0F4gSu+SsyWAS6RYxhd-XBCjXD1jbYznXup1w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS9PR01MB17318:EE_
x-ms-office365-filtering-correlation-id: 28791318-9b04-43d3-f039-08de9576d280
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 p4FapVAiB2kZgS/edFcNUioKgwicFVOHROnYqIxrgwknppPx0HVbdqzAuudD52Vz7evdyA4mGO0mICgkaBkKxiavBOH+vg82IsQPYCs8VdK7HKDtX93nbkQT8ozoWepUHjcX5K5vAHNi7i1gRMrCbSuw2lP65/oAtQM1FtZxlkOW+AkBn60jUI/i+BU/P4kepWnaNERRM55gxYlfOrN/5tEGPXjBtGpZ9bCm5znBwH99Gf6QdUv8L1EjW9Tk2JIXWBDU0FApBJEPD2dpoAnnRjlSL6wzWCrQ5T/Cw5Dl7EVhG5KC/G5xkI7gQGw0gD+oK+S6H2Qv0Cdn507BmM4T0mKLD01/PaKd8rcEzD30RHORWEm1qsy32GUjhBJx9bXmNYMyBkbWKCT44famZs1+VWbz8NcgWxuE+IIjKu6/EVikmq7RoWKX/Sm7+0uZO4xxIsIyw/6MLTbibaWNTn50zX0GSfHsZridSBatykgoL0n5/d3qAWY2cy3SMsKjfENkFKzk5aL6h+UNylYIERIlyu7GWNJHZQ9RRf0ZzemeczUc/bEFmzz2q8GiQXVx9DIXipddH6P00N0q4nOYYe9ujavdorCclyjPoo2ZeCyfv1CI+eioRFGzy6n2+dMLMwxHvz5qvU849M3uAtGEc29w+yT6b2o1kxswg9W+CgygsIjUQvs7+YJ3DGgOAWyzFTrpsEYpsxwvr6PzRSOADlCqP6Z86r+MR+CZGSElXcZ6gm7uJIPPoB6z07CUMo4U3ttMDILxFjbP3R2HkbRQl95kA6yWN2/tRb9W20wUlPXdBh0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z0NvVW5pRFRWd1phT3ZYRXJCVlFDcXJ3bGk1SWxSRXVkNlRMaURpRlpRSm5R?=
 =?utf-8?B?YmNGY1F2TlF0eXB1YnhkMjBaTEJYMmxPNThZSE9Ya0tJTC9ON2FnalNaL0p2?=
 =?utf-8?B?V2djUHd5MmlXeW1DdUtMcm9Cbml5Uk1GMVJvVEUzVHAxUm91djNoQXdEUUFT?=
 =?utf-8?B?bDJ1djFDRXJzYUxoTkNQT1p6RVhVYnVhVFlWNHdyQ1NyY25UTHlqd0kyZW5C?=
 =?utf-8?B?K1hVenZQbWU4d01pTmgzWXdROGhIUUVBWjA3ajFFRDhZelpreTROYVJyT01u?=
 =?utf-8?B?QWo0S3RmaTl5MkJ4R3JXd1UyOENvSHJ6eVJxcGF3ekxFOHQ4YU42eElucHpT?=
 =?utf-8?B?cHpTUzVyS2VmcldvQ3pmMGpiKzBJVWowSXpvdmNqVmVETUtTNytuZThVMCtt?=
 =?utf-8?B?NzFSdE1yUm1qSnViUldMVitDQU00b2RiMnB3Wi9CbkxtR1RBZ1BjUGZwVU8v?=
 =?utf-8?B?MFV6azJmSDBRbFMyUGxOQUhCWUk0dTJYVXYvNzhieXRTRGErYUVBcW9sbVNt?=
 =?utf-8?B?VUdlWmhzeWdFa2ZhUjY1TGkzU2F0clFWUEdxb3FhY1o2SzlWYnBMai9qYVc3?=
 =?utf-8?B?RzNCSWJSR24vK3IwRElVaDFqRjlBTDloYnFFOHJ4OVhZTHNGU0prNnczWjV4?=
 =?utf-8?B?RUl3dkFab1Bhc3JYRnFVS0xBVHdUL1pVbit1N21GNmZBRU91NlRPblBTN0l0?=
 =?utf-8?B?ayt2Z1NlbTRnNWsrYmFjN1JBandsTDRzZ2NLZmxrS2sxRzBUT3dMTGpNdGJw?=
 =?utf-8?B?d09pWTdUQnJWRENuTlRkTk9OZUl3KzFabnRhWit3d1lkejFLZUkrK29EbFdy?=
 =?utf-8?B?OGVFQVNZdTU2TVZFSlFQdkRHM3I0czFIYzN6UzRyVVZlZk0rV2pKdjZHNEhP?=
 =?utf-8?B?MW9Ddm83QTd2Q3Z3ZzMyQzJVNFU1OTFQR0VqME5DMEFCZm1MVitYSnF2M3pT?=
 =?utf-8?B?UVNkTEplQzJqSllYNXg2WnRqd29LRnQ5QXNSMDRQQ2hmUVRvTHRkZUZTVnFR?=
 =?utf-8?B?SXRad1FTbkZGWVA0OFRzeGdMemhkSVRTbzFDalZ4Vnd3TXJGTjVtRDNEdDZi?=
 =?utf-8?B?NThzWm5RYmFVMURPQUlpUU1WeElJSVA5SkR6MjhXTlJocnExeExDQThObE1W?=
 =?utf-8?B?bkVMRjlIcGZBRTYwSDd1Wmcrdm5zQy9aVWpaU2wvdm52b3l5TllhUm90QnY2?=
 =?utf-8?B?RVc4Ly9wczJRUHNMTE1nZUNpUEZLKzI4QnJoeW9BM2F4ZHdJYTFLSWJWSVZL?=
 =?utf-8?B?UXlrMmFtSkV1T0UzdkE5ZE13Y1lwaG9BWnYyUXJKUUhoU3NlaWVjK3V2NWY5?=
 =?utf-8?B?NjY3SSthWkdxNlVBT3pBMUduam14cVJZU0RqRFp5Y2orS0hlWGdpc2s0VDJP?=
 =?utf-8?B?djRPL2NiNExWVVBSMFAyY1R3dCt2UUtrL2UwUWMwaHFzcWlmcytxTTRrQk9B?=
 =?utf-8?B?eWRyaFEzOTBHamhWUWY1TldSVHNNc0J2NytaUnNSZlJvR0dkUU1GZGlkT0Jv?=
 =?utf-8?B?QnVWQTlQYXlRTCtZVmZVL3ZobUJnZ2dVU3Z5N1lxa1VFWWdhZTFYeG95U0Nr?=
 =?utf-8?B?enFNT3c0SVkzS0xmYTVXMk1VZHBWcEVkSm5TU1lpYVM4eWhERkdFbDI0WkNX?=
 =?utf-8?B?MVJtcjBZZWVCZFhXczBqOFhqdzd3TFIyRCtOMmg5aDA4bWcvYlp5TVA1dmt5?=
 =?utf-8?B?cngyQVhMWHFUUUltZ3JFTnpXQjRETm5QS1M2eUs5WW5iY0haRG9WNVBzalp5?=
 =?utf-8?B?VnZ6SStLT0h5N0VTSC9Tall4Y01SV3VmNHNzblNDZjZzVWVZTE0vaWwvOFdV?=
 =?utf-8?B?SzY5R2V2L3VOT1NaYmNrYzFNeU9ZbWRYSU9hdnZUZ1hPWTdud1JxTVdOdHZM?=
 =?utf-8?B?L0xBK0lvSllLOTMxN3RlTjAycFVXTmNnd2NVT1hpZCtvcGdTVHlQRnE2UEhC?=
 =?utf-8?B?S2E2V3NJM09RSGVoTkFsRGx3VGVhb2pXaGpYS2N6bmJudG02N3JsS09WUFFX?=
 =?utf-8?B?dkFocDRLWUZKalhuQjBVaTlzQWY4WmhQY0UvRnVxTFhVTi9zNjBJS1pjMmRr?=
 =?utf-8?B?d2VkeVJRNkF4SVFYVnJRek4yMlpndWpxOWNYOHMyR1NHQ2ZTRXZiRXZGSXY2?=
 =?utf-8?B?R1Y5UEFyZFJWQ3lMYUFGbGNNYS9xVFZLeHpYT2FPQ3gyOTBoRENobzFvVHN6?=
 =?utf-8?B?cFROVk5tcWd2Y2pCTVBCbCtQa0ZlWUVmM0F3ckV6OGNkQ25aRUp3K2hGUktq?=
 =?utf-8?B?cmNHYXZiMUVIMjdTSWNUN3FNVG9CN1lVRE5ZMmkwOFlZMmxiNm1La0VqN0tj?=
 =?utf-8?B?Uk1WZUN4QjNWZFF0Zk5rUUFsZ2grSTloZXA3bEFRVjduY3N1NzVyUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 28791318-9b04-43d3-f039-08de9576d280
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 13:57:50.3288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rr6raHeZ+6cucOeWy2z4MNEtztCefe4QtpntxING7ktX7DoHP3+DjO3A4htO50tqh1V+dQOm1lyCSeW7EznyMlLOWb2k66FD+A73FtVUW5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17318
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
	TAGGED_FROM(0.00)[bounces-31015-lists,linux-renesas-soc=lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nabladev.com:email,renesas.com:email]
X-Rspamd-Queue-Id: 169EE3BD64B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDA4IEFwcmlsIDIwMjYgMDk6MjINCj4gU3ViamVjdDogUmU6IFtQQVRD
SF0gc2VyaWFsOiByc2NpOiBSZW1vdmUgZ290byBhbmQgcmVmYWN0b3IgYmF1ZCByYXRlIGNsb2Nr
IHNlbGVjdGlvbg0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgNyBBcHIgMjAyNiBhdCAx
NzoxMiwgQmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBSZXBsYWNlIHRoZSBl
YXJseS1leGl0IGdvdG8gcGF0dGVybiBpbiByc2NpX3NldF90ZXJtaW9zKCkgd2l0aCBhDQo+ID4g
cG9zaXRpdmUgY29uZGl0aW9uYWwgYmxvY2suIFdoZW4gYmF1ZCByYXRlIGlzIHplcm8sIHRoZSBj
bG9jaw0KPiA+IHNlbGVjdGlvbiBsb2dpYyBpcyBub3cgc2ltcGx5IHNraXBwZWQgcmF0aGVyIHRo
YW4ganVtcGluZyB0byBhICdkb25lJw0KPiA+IGxhYmVsLCBlbGltaW5hdGluZyB0aGUgZ290byBl
bnRpcmVseS4NCj4gPg0KPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLg0KPiA+DQo+
ID4gUmVwb3J0ZWQtYnk6IFBhdmVsIE1hY2hlayA8cGF2ZWxAbmFibGFkZXYuY29tPg0KPiA+IENs
b3NlczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2FiUHBaVUxzWGhSbVhUWDlAZHVvLnVj
dy5jei8NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL2RyaXZl
cnMvdHR5L3NlcmlhbC9yc2NpLmMNCj4gPiArKysgYi9kcml2ZXJzL3R0eS9zZXJpYWwvcnNjaS5j
DQo+ID4gQEAgLTI2NSwyMCArMjY1LDE4IEBAIHN0YXRpYyB2b2lkIHJzY2lfc2V0X3Rlcm1pb3Mo
c3RydWN0IHVhcnRfcG9ydCAqcG9ydCwgc3RydWN0IGt0ZXJtaW9zICp0ZXJtaW9zLA0KPiA+ICAg
ICAgICAgfQ0KPiA+DQo+ID4gICAgICAgICBiYXVkID0gdWFydF9nZXRfYmF1ZF9yYXRlKHBvcnQs
IHRlcm1pb3MsIG9sZCwgMCwgbWF4X2ZyZXEpOw0KPiA+IC0gICAgICAgaWYgKCFiYXVkKQ0KPiA+
IC0gICAgICAgICAgICAgICBnb3RvIGRvbmU7DQo+IA0KPiBBcyBSU0NJIGhhcyBvbmx5IGEgc2lu
Z2xlIHBvc3NpYmxlIGlucHV0IGNsb2NrIGZvciBiaXQgcmF0ZSBzZWxlY3Rpb24sIHRoZXJlIGlz
IGluZGVlZCBubyBuZWVkIGZvciB0aGUNCj4gImRvbmUiIGxhYmVsLg0KPiANCj4gPiAtDQo+ID4g
LSAgICAgICAvKiBEaXZpZGVkIEZ1bmN0aW9uYWwgQ2xvY2sgdXNpbmcgc3RhbmRhcmQgQml0IFJh
dGUgUmVnaXN0ZXIgKi8NCj4gPiAtICAgICAgIGVyciA9IHNjaV9zY2Jycl9jYWxjKHMsIGJhdWQs
ICZicnIxLCAmc3JyMSwgJmNrczEpOw0KPiA+IC0gICAgICAgaWYgKGFicyhlcnIpIDwgYWJzKG1p
bl9lcnIpKSB7DQo+ID4gLSAgICAgICAgICAgICAgIGJlc3RfY2xrID0gU0NJX0ZDSzsNCj4gPiAt
ICAgICAgICAgICAgICAgY2NyMF92YWwgPSAwOw0KPiA+IC0gICAgICAgICAgICAgICBtaW5fZXJy
ID0gZXJyOw0KPiA+IC0gICAgICAgICAgICAgICBicnIgPSBicnIxOw0KPiA+IC0gICAgICAgICAg
ICAgICBja3MgPSBja3MxOw0KPiA+ICsgICAgICAgaWYgKGJhdWQpIHsNCj4gPiArICAgICAgICAg
ICAgICAgLyogRGl2aWRlZCBGdW5jdGlvbmFsIENsb2NrIHVzaW5nIHN0YW5kYXJkIEJpdCBSYXRl
IFJlZ2lzdGVyICovDQo+ID4gKyAgICAgICAgICAgICAgIGVyciA9IHNjaV9zY2Jycl9jYWxjKHMs
IGJhdWQsICZicnIxLCAmc3JyMSwgJmNrczEpOw0KPiA+ICsgICAgICAgICAgICAgICBpZiAoYWJz
KGVycikgPCBhYnMobWluX2VycikpIHsNCj4gDQo+IFRoaXMgY2hlY2sgaXMgYWx3YXlzIHRydWUu
DQoNCk9rIHdpbGwgZHJvcCB0aGlzLg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGJlc3RfY2xrID0gU0NJX0ZDSzsNCj4gDQo+IGJlc3RfY2xrIGNhbiBiZSByZW1vdmVkLi4uDQoN
Ck9LLg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNjcjBfdmFsID0gMDsNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBtaW5fZXJyID0gZXJyOw0KPiANCj4gLi4uIGp1c3Qg
bGlrZSBtaW5fZXJyLi4uDQpPSy4NCj4gDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJy
ID0gYnJyMTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBja3MgPSBja3MxOw0KPiANCj4g
YW5kIHRoZSBicnIxLCBzcnIxLCBhbmQgY2tzMSBpbnRlcm1lZGlhcmllcy4NCg0KT0suDQoNCj4g
DQo+ID4gKyAgICAgICAgICAgICAgIH0NCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+IC1kb25lOg0K
PiA+ICAgICAgICAgaWYgKGJlc3RfY2xrID49IDApDQo+ID4gICAgICAgICAgICAgICAgIGRldl9k
YmcocG9ydC0+ZGV2LCAiVXNpbmcgY2xrICVwQyBmb3IgJXUlK2QgYnBzXG4iLA0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHMtPmNsa3NbYmVzdF9jbGtdLCBiYXVkLCBtaW5fZXJyKTsNCj4g
DQo+IFRoaXMgZGV2X2RiZygpIGNhbiBiZSBtb3ZlZCBpbnNpZGUgdGhlICJpZiAoYmF1ZCkiIGNo
ZWNrLg0KDQpBZ3JlZWQuDQoNCldpbGwgc2VuZCB2MiwgZml4aW5nIHRoZXNlLg0KDQpDaGVlcnMs
DQpCaWp1DQo=

