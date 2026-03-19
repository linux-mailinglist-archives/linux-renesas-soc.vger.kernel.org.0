Return-Path: <linux-renesas-soc+bounces-29904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MhDAxL3u2kQqwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:16:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1716E2CBC74
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 14:16:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C768F302F71A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 13:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A091376493;
	Thu, 19 Mar 2026 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oyu5KrLv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8663D47D3;
	Thu, 19 Mar 2026 13:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926158; cv=fail; b=nvec9OhTfeI+duyMvAvKblIrWC1CmVy+fgF8v0Qb4p0RULsIHnykunPRYVnKoPl8zyJU/EI6QlfOhdI1m9cRHn/12Pqb8QxOL+bRsDGx3lBSaKI7CVCsHjbToKFC41izeoE9pRISlPmSajJW+GZ6T2TET5AHUic2AwB7mg/BGXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926158; c=relaxed/simple;
	bh=6FKwHw7fwV/KT4iXBSJKCiCMYFDTb15uy2jRcvMMHWw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aTVQ2zrVC3dKwRqoIIdC3zRzNilXz9pLFfSBV1HrCCkjrYVtu7YpHcMVEvg1uzwLwcxW0EdgVFTnzbcgdcTls2+YrigPCI2zQ0jjiRqZntlsgGIX+6UmkO5kG1Bs/YLzCtpS/KGmzZ0jidFByLXUttAxDZqmBrGPwnVZvEr32ig=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oyu5KrLv; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMEc1NM4E3K4e0A98beIIJI9cqH7sdUe4ezuvJAok74U1gQ3pm0J+0soNRSAQPsa3Mq8zveDCG4mAXC8ytvVlw6k/yYa2Etw7SDCiuLae+nReNeTckaG742r5L6mNOxfaJxayvUEQnel8KJ7e1BYF17p5f/C9LTCYFWXbSVnOwBRuBDOmffi4mHmWMBBiCVsGoieVgoYCJ2DDneuVd4mWzsmBSnNUsiekHYN1iWRU7lUa2LxuGzB5XDHZpQptz+hyLX9kd3ozQSaLQgssAmucMgQyyNsEOWigmjuVUxo5EpaChQQIlMlGg4Lc3kGXnEuC8XloXMQID2KmdpL6jmP2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FKwHw7fwV/KT4iXBSJKCiCMYFDTb15uy2jRcvMMHWw=;
 b=Nj0VJFcHsyAgtNIjGLK+uQOcKF3ptpsRHd8c7+JxaqAtGXywdN50GorGclkkXgPHDUxPyusL528e7ik+vBR9Xq3JNdA92r919xMihJWSodrE9lbcufsA5u2IA1Zqxr93eRuAEPcWBqOexjOsEnICstLKbaEd1RBnsOyzgpKLz14b4Q1QP3FljV2ulLRHMUC0+NbvDScDd44yjcnRjlf1WV5tlE3mZObzgQ7uRiRHiwm1KZ+N8b1azo5Qu53Rs3dBnOgKK628qT6dbvk1vXBCDHOaYnwPjyX18mUuPYo4zttf/3BRMGUOeB3htmQPE55s22g88hXg1YFwv62uc/E+Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FKwHw7fwV/KT4iXBSJKCiCMYFDTb15uy2jRcvMMHWw=;
 b=oyu5KrLvJNnhV48laNv/Mw8/3fvfV+rrdYBeqbCz5tPlZYhiZy4FKTjydXfp3TWh7evhRuAHG9icTEERur/3eFvS3d6Ayoq53TkQ8m7Eju6k/KDPRT1541RY3XQGx/qAAOo1BSfet9Zt/i2YhYyYqKU6X+UHX8b+1Tslll0zkFI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11991.jpnprd01.prod.outlook.com (2603:1096:400:37b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.21; Thu, 19 Mar
 2026 13:15:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.019; Thu, 19 Mar 2026
 13:15:40 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v6 03/10] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add
 critical reset entries
Thread-Topic: [PATCH v6 03/10] clk: renesas: r9a07g04{3,4}/r9a08g045-cpg: Add
 critical reset entries
Thread-Index: AQHct58qq4zGRvA1vUW0IsyxSa/fC7W104oAgAABwtA=
Date: Thu, 19 Mar 2026 13:15:40 +0000
Message-ID:
 <TY3PR01MB11346855EB82FE8F913B7173F864FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260319125143.230377-1-biju.das.jz@bp.renesas.com>
 <20260319125143.230377-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdUOU7fZS0eShPJon4z6v_fea7YjP19rX+Z57b+acJ0Hrg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUOU7fZS0eShPJon4z6v_fea7YjP19rX+Z57b+acJ0Hrg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11991:EE_
x-ms-office365-filtering-correlation-id: 7aceb133-7f2b-4a2d-5ca7-08de85b99e41
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 DC0V4LI/pfOfZ2C6TmUAzw6GLkpk3OCZ2/pSef3IPxfTArK09ONkNQiUXeZvqQblOHgyAZnkVZcql6Q+KCfc5w9gFmwqq6hFgLfz6rXVVxo84Mrg4Cleq3TN8+uk71lnLSYbYO/vLe3YRBIVyBzneMTJ+ogrBxe4wGBoWM95ml8ZuxAs436Ou3Q4RzsyKlMoS57xud1pGgVS++kLHzM1xAuIeIxNEDHofAbLsy9hf6UHWmSit/DgbX1Q4fZUN8LlJvxIRSAhmW3yPqnWQAqBjpscqwZrwhWbWmSKrm19/tpNzWiMKb8CTTEDrXa2mzjq//+xwsfSomL93YM8htICCc/eqCxokG/As92sYJUyqqyn2vsgVN3ntWsFKJDADUUFatwSgpmODPy5GQdMAExI34l3XBbqOGOTLPin86NWTvAgUcVmATlMz3uA3F33Y4PNw3RZORjL5ahpae/hbi1aL5ivs3+56lVhKJmmOvPQ0Rfa1uTMuwxd2BqnLGDcjvhUKkcodbnCVzvGUKMtMXn3urYhy0VuMwHtP2hGF85X+DL5An9QrXpvc0v39IA6nVCyVK3GufhavoMR8qno62URrpktrcEYxdURikWG1c4poiGIqVTJ4COH6ywY4hYVDze863jRy8yVH/n/4uNHuibARKzRz4KC28Xgy2z/9fPHwtCcaQFyygwWzvx4cnOW2QPwKcuh1rS9m73sN09l6yL4GPHDoCqd3Z5+ODRJfGxzSTOPiAN5qVYxzqlNseqeCnHVMCYjzZUTBFifbGw6R+9Jj2QwWZ2cCORBMBG2kqPhNlY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dlFHT2ljMFl1STR2Z2thM3hWcE5KVDRoUi9tSVZDa0NDTWt0VHZyejNlRDNl?=
 =?utf-8?B?N2o0ZXlFVzI0ZmZ4NGd3SWk1eVBNclRkcDlUb3IvYm0yT1ZlS2FxQmlLNlRi?=
 =?utf-8?B?TXZGRVFxNHkyQjNMNmQ4elIzU28rWVdFWjN1US80RHF0TGRXN1JjU0pnZWxs?=
 =?utf-8?B?cFF2VnlXUkpOY2RLanNIdWQ5RzRNVjR2ZkdIWC96Z3hTQXFUUWFVZFRwMHEr?=
 =?utf-8?B?LzZVTFRoY0syaVMyTVMzK1d6NDM0OWFFOXdyaml1U2l0U0NYa3NRTmxOR0Nv?=
 =?utf-8?B?Z0FKQm1odFZCaFQ2WWNNNEdqRVFSLzlJREU2WGpiZUdQTlVvOStGN1VLcW95?=
 =?utf-8?B?eCtzQnh2RER1OFpHSUdENGgrK0tva3FtRXdKZXVzdGVtYk5oUXVVeUNrd1BV?=
 =?utf-8?B?Q2Q3dDY2L0FHVVg1Q2NJeWlKR0hHUEVnajdyZVVwZjBDS3hPT29xbU1paERK?=
 =?utf-8?B?cEdDMXR0N3pMbTQ4NHZvSDNMYzhIak85ZWh4a1NCK3lndjNPREYrT2QycExI?=
 =?utf-8?B?c1FiVTRWQk9CTXovalA1Q3FFRkdmRWUvbWJzdTFxZDJ3aE9DSnFZNUErMWNO?=
 =?utf-8?B?NTZwc1VONmFvcyt3OFRmYk5UZFpqM0YrTmM4Qi9iWUxEQnhnd0kvSTRRekh2?=
 =?utf-8?B?UGVpc3VvWitxMFdCNFRSQURIWFdqN1ZsdzJkRncreitJc0RrU1A2M2dYWFZB?=
 =?utf-8?B?d0ZlNzdLZ3Y2cGZxemY3TjdWSFJ6VzUrVlFYOFprenVWcWdNby9jQWpPNG0z?=
 =?utf-8?B?eU0wRlFkRWZvRmx1MVo0WDlyeVNldEJMajNhc0gxdmNTam9uT0FWc3ZnSU1B?=
 =?utf-8?B?YzVrYm5CUk1zUk5rTkZTN0FGZHovQnd2V3A2ZXlNbmhRM3RWVHI4QmE5d0J0?=
 =?utf-8?B?alJyWnNQUW1RVTUrbGhZWi9NeHhoY3JPMUFBbEk0UExyZngxeG95N0RVV3NM?=
 =?utf-8?B?OEVpbmpxenFJR2U2cGJhNnZUUWpmbmlHaDVwaW04ZUZvbHYxdkxXdTRZNVVm?=
 =?utf-8?B?ejI0UXVaUk5Va0o3MEQwZ1BUTmF1Tml2S09GQlBlVkFZQXpnYnBOaHpmbyt2?=
 =?utf-8?B?K0VDTko1bSsvdnN2T2xtRGZHVWdHdWt3Q2RQMExDTlpKZVJEenhSbEw5eUNl?=
 =?utf-8?B?R1FtREhXNUpNeEp1UWl3OStpeGpWa0FRZTU2a3FPekl3cHk1S1RhUjVPUkRR?=
 =?utf-8?B?U2xpT0RKRXZzTjhaeEdialFUVzE0MWFnWnVUYVlNdnhpbStZcnltL1oyc0J0?=
 =?utf-8?B?MHVVcThNYjM2T1M5dDNtcVFZK1IzNU9UeU9BWEk2ODl3NmxwTE1ZWTdtZ0NB?=
 =?utf-8?B?cDd1dFh4NVJyZllVTzAvc3hhRTR3R1ZxemZEam04NWl6QVgrY3dwUnF3ay9T?=
 =?utf-8?B?MDd4VytjT2tNbFFaaHVBVjRBVDg3ell1QUVTVnFyc0tIem4vS0Z6UHIvaUEx?=
 =?utf-8?B?Y0dKUWp1OUErVVl5RGFteUtvbndWc3hXZXJSSUNzclFHdkZkOEtNUEN2VnJ0?=
 =?utf-8?B?Mzh6Tmw0bXRSem1uZTQyQmw0UEF4bmt2UFRvdEtlQU50TjV3bVZIaTlJeTBQ?=
 =?utf-8?B?RWFmL2hCNlVPNUI5VFJJVm82ajNBQnhHaU85UDBWaTlYbUMzeDNVNjhXaytL?=
 =?utf-8?B?amw3SUNJUnptR3ZzeUoxV3VaVEFuSVJreGxDNXYrbTFVMkJkL3AzWTN4MmR3?=
 =?utf-8?B?TXFXU3BqL1l6aGJVdjdnbHdsZ2d3UGo4ZTFCckM5ZWlhVElkNElEZUtEeFI2?=
 =?utf-8?B?alM1TmV6c2M1Rk5iSjZ1enQ0alEzUDloMUxZZ2dxZWljQmhya1hna0F1aktq?=
 =?utf-8?B?TmVKVXpoOUtpVEtvVEdzcGxNU1NiMDgxa3VGNGtSejRGandxSnZwUFZIalVM?=
 =?utf-8?B?cW9tUE81OVpERzNEMnM5TTdiSFBsbDR6WVhqbW1MSEJNdzNZSlJNZVVMMFRF?=
 =?utf-8?B?anh3aWJ0RmxoWURwaWhxVVhnYk4xUlB6V0FGQXRxRTBBK3o5aXVCT25WRy85?=
 =?utf-8?B?MW5LRUZXY0VZM2JzREY0T3BMY25wTVI0ek95ZXdqSkkrcDVjRzhQMGFSZXM5?=
 =?utf-8?B?aFhJaFdLT0drVFhZUVNURVNoSUdqd3Z1NDU3eis3RVZTR1pJcUg0ZlAyM3hV?=
 =?utf-8?B?ZldMdE5NeUY4bUE5WVFVb0RTb3FIQTNidXFqUEF6VCt0aFlpam1jRmYyQ0Rq?=
 =?utf-8?B?YUtXdVRaZHdtejFPZzE3dWtId0RyL3VmbjUzMEtjcUVMWGVmYTFqUFpiQmln?=
 =?utf-8?B?bFR3cXczQ1ZjMVl6OVMwS1hRazhBcHppMGRxb3lGalBtV2pjQVhyY3VxT3Ju?=
 =?utf-8?B?ZFIwRm9KUkhseVJVbHdncE9iQmNPNFBGREd2Z3BXaUxHWUZPcUdvUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aceb133-7f2b-4a2d-5ca7-08de85b99e41
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2026 13:15:40.3253
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HcKGAWAFQYVxGqAmf+MXvzVgWlshJDwNNvxgRJQsQZ1LW+Ini46idb8Uhq68pCeMw0fLoEM0EG1lU9khsETuoSTrqAydG7uv3+kcvDzfZ2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11991
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-29904-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,linux-m68k.org:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 1716E2CBC74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMTkgTWFyY2ggMjAy
NiAxMzowOA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDAzLzEwXSBjbGs6IHJlbmVzYXM6IHI5
YTA3ZzA0ezMsNH0vcjlhMDhnMDQ1LWNwZzogQWRkIGNyaXRpY2FsIHJlc2V0IGVudHJpZXMNCj4g
DQo+IEhpIEJpanUsDQo+IA0KPiBPbiBUaHUsIDE5IE1hciAyMDI2IGF0IDEzOjUxLCBCaWp1IDxi
aWp1LmRhcy5hdUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IFRoZSBSWi9HMkwgU29DIGZhbWlseSByZXF1
aXJlcyBETUEgcmVzZXRzIHRvIGJlIGRlYXNzZXJ0ZWQgZm9yIHJvdXRpbmcNCj4gPiBzb21lIHBl
cmlwaGVyYWwgaW50ZXJydXB0cyB0byB0aGUgQ1BVLiBBc3NlcnRpbmcgdGhlc2UgcmVzZXRzIGFm
dGVyDQo+ID4gYm9vdCB3b3VsZCBzaWxlbnRseSBicmVhayBpbnRlcnJ1cHQgZGVsaXZlcnkgd2l0
aCBubyBkcml2ZXIgdG8gcmVzdG9yZSB0aGVtLg0KPiA+DQo+ID4gTWFyayB0aGUgRE1BIHJlc2V0
cyBhcyBjcml0aWNhbCBieSBhZGRpbmcgdGhlbSB0byB0aGUgY3JpdF9yZXNldHMNCj4gPiB0YWJs
ZSBpbiB0aGUgU29DLXNwZWNpZmljIHJ6ZzJsX2NwZ19pbmZvIGZvciByOWEwN2cwNDMsIHI5YTA3
ZzA0NCwgYW5kDQo+ID4gcjlhMDhnMDQ1LCBwcmV2ZW50aW5nIF9fcnpnMmxfY3BnX2Fzc2VydCgp
IGZyb20gYXNzZXJ0aW5nIHRoZW0gYW5kDQo+ID4gZW5zdXJpbmcgdGhleSBhcmUgZGVhc3NlcnRl
ZCBkdXJpbmcgcHJvYmUgYW5kIHJlc3VtZS4NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBHZWVydCBV
eXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2NS0+
djY6DQo+ID4gICogUmVwbGFjZWQgcjlhMDdnMDQzX2NyaXRpY2FsX3Jlc2V0c1tdIC0+IHI5YTA3
ZzA0M19jcml0X3Jlc2V0c1tdIGZvcg0KPiA+ICAgIGNvbnNpc3RlbmN5DQo+ID4gICogQ29sbGVj
dGVkIHRhZw0KPiANCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlIQ0KPiANCj4gPiAtLS0gYS9kcml2
ZXJzL2Nsay9yZW5lc2FzL3I5YTA3ZzA0NC1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3Jl
bmVzYXMvcjlhMDdnMDQ0LWNwZy5jDQo+ID4gQEAgLTQ4OSw2ICs0ODksMTEgQEAgc3RhdGljIGNv
bnN0IHVuc2lnbmVkIGludCByOWEwN2cwNDRfY3JpdF9tb2RfY2xrc1tdIF9faW5pdGNvbnN0ID0g
ew0KPiA+ICAgICAgICAgTU9EX0NMS19CQVNFICsgUjlBMDdHMDQ0X0RNQUNfQUNMSywgIH07DQo+
ID4NCj4gPiArc3RhdGljIGNvbnN0IHVuc2lnbmVkIGludCByOWEwN2cwNDRfY3JpdGljYWxfcmVz
ZXRzW10gPSB7DQo+IA0KPiBXaXRoICJldmVyeXdoZXJlIiwgb2YgY291cnNlIEkgbWVhbnQgZm9y
IGFsbCBTb0NzIDstKSBObyBuZWVkIHRvIHJlc2VuZCBqdXN0IGZvciB0aGlzLg0KDQpNeSBiYWQs
IEkgbWlzc2VkIGNoZWNraW5nIG90aGVyIDIgU29Dcy4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQoNCg==

