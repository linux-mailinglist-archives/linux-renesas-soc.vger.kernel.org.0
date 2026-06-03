Return-Path: <linux-renesas-soc+bounces-33500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sP+YHNzfH2pXrgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 10:03:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D11BC6357A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 10:03:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=hHJ7vzgU;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33500-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48CA6300D6BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 08:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D9535DA78;
	Wed,  3 Jun 2026 08:02:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04A0409109;
	Wed,  3 Jun 2026 08:02:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780473769; cv=fail; b=FkCMz+abgP36uGPMrBXly0unCQ/HZYH0PMgaPmJeuR6cBZxfiB1ENmgFHF1LfvHaKHoTkSwkXGL8WV0/IX8s7CLwSrXPe6lBaS4Ol2qrXCbH96myLPN+J9DW+yJMbJkTkWxSqSIQ/0qKZXK9jM93pnEfBuxQlxNIruy+UpqJYSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780473769; c=relaxed/simple;
	bh=OJAINfHTRRTUcxgf03QPAPAYwBKaatMmFPtvqEW3H8k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kw9fXwfPOaGV/CVGm/xYpKqeB1oSSCSZvD+KzMzRDasyZdXps5YhhVGPIIUTe0LA4D8ux0K6lQo0N8yklITt+GpCK2VkcMdocdK9trhUkaEEyJDfKu5uVmHRgaYDUoN+gGC2mdjTjHFe1TIs1OxF8WRmImN4qkUePc2+Ybnf4RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hHJ7vzgU; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0aKE8bu+92QZmg+s/hZ2toeJqekBfmmOc8oPIGNCfeh6zwgcIExFBTjm092L0N7vg/CclXZeFuR+H1MVJp9bfWKC4FAmdCxOXY0NYd7dMEqnWzocEeZWNusjy4VK/leFEjNrcN4qsJDiaYVuOi9UmuQhGoQyFe9nPpaWo1Aq182HmNeCDnantHT1RlJjq3UW6DVngDfPi6/JmpZEU7wZf7RSMzkRacRvqed43ZjsZS/DfM8EjI80QZO1QaUIxBJa6CETGF6PcoZBA0Pmw+mLuIRi5B+ZtDNAbTKHnzZ9wFcD0UWHnareXcyLoHYA5qPgBhBafdqQPX6ggl49Whotg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJAINfHTRRTUcxgf03QPAPAYwBKaatMmFPtvqEW3H8k=;
 b=Jfl+T/Tkt96AXGD0z7gx3fPHCjnVIvWLBKTatsTWzIPr+oCvCuYxn/hV/GIN0dTR+wW2QAe5aPfet2f1PoXNmmYUhKG+jr4rb0GrCEBRWdtxQHeuAYBXjqI3B+6xWMXOW2q8Wef3X95uh/PCW9AFOytGyHeUjXm3vzmGZnfiXdnSeuDApG4/tWro4leMfe47a+uiv79df/PXUdoX8TyvU8fI8SVCx8+Gal+bF7GGJPANALkjoS7mc3F4PEdcQQxyKTFrsu7eNJwwjmICaz/wHOYZK/hlk638Hp6YnM1tiaXMxMc5j3Yi+X/Q547s7LC3idAK4ArRFA2cmXlR3VMXYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJAINfHTRRTUcxgf03QPAPAYwBKaatMmFPtvqEW3H8k=;
 b=hHJ7vzgUxzeHcXt7/TuHNyf4psXppmRkUuFt0z1iN5wAGetQBmHRn4iUG1SsJv/kBrv43GcY26JgnzGRpJ4mYbH6S9h6Qm+BKBEcXeLomxGkxMh+cCDui6GeG5aMmMk0mrg6iXaEOfyah2k0p/Bxu7vc2D39GkcJriQH3n/bhDo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6718.jpnprd01.prod.outlook.com (2603:1096:400:9f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 08:02:43 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 08:02:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, biju.das.au
	<biju.das.au@gmail.com>, wsa+renesas <wsa+renesas@sang-engineering.com>, Ulf
 Hansson <ulfh@kernel.org>
CC: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v17 10/17] mmc: renesas_sdhi: Add optional axis/axim reset
 controls
Thread-Topic: [PATCH v17 10/17] mmc: renesas_sdhi: Add optional axis/axim
 reset controls
Thread-Index: AQHc8yZNJ8mJXaZGPE20T7qnPa4VnbYsdA4AgAABvSA=
Date: Wed, 3 Jun 2026 08:02:42 +0000
Message-ID:
 <TY3PR01MB1134693BA5CF5A6AD97B5B32186132@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
	 <20260603065731.93243-11-biju.das.jz@bp.renesas.com>
 <75e754c3c9ffdc19b4bd953d54c4f65255d96829.camel@pengutronix.de>
In-Reply-To: <75e754c3c9ffdc19b4bd953d54c4f65255d96829.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6718:EE_
x-ms-office365-filtering-correlation-id: 933884e9-a3b9-4d9b-5145-08dec1467d6f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|6133799003|4143699003|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 etgxfSeatxxk8cwA3fUs9J9YybNHiLcNUvSXK0KCEnr876hMONny8wD0tljUtVTI+aLlSaQar1Kb8yWwf1dkgyLwpgrmiy94CJ3ohGLNc5DLndQJVEr8YWMcJjg3ND1+C+e1RStjWE8CkDkPzeP8QEL7zO9Gojz+AOpWyI51uz9G4sjZ2yjWI0focSJUfHYVZWBJ5E2ng+M1UgEUPNnVpdnylY3YTj5poBaiUoJ1BqoEUuh628GXlhL0hlw7dlAu25nDzrQ98NsvGaLXFzsrmzPw0FUTxDPs71KU3VIS7RcDYoH43NiI9bu1Jw+aAkLpOOFgDYoStaBkkCKGUwWb0ovMFlCfqOGV5XQBaJ9ejsQfsL+KRJXRtcX2H1NvgjfkHUfz5IXGNAAZkUZuoyZlv7SCYh52PpiweOYIWAscLSLgTKc6EWqAVQdOm+/O+3bFb8X6s9fe6nxMrS9gcC9U4Vd1Sb5O1FHLyiN5m0JC/DLuEt3c/gHeVPlhkR+e53wVBaIaQtdiIrw79XI3t1n6KBcBZhLozLOP//lQde7zcXsrbMgmReuog1pgLZkZjhw7EqJr6QU8mzf7NziGs7LY3SOiUrWQs9xkIfhNw32UjunNujOU4T8Vm4sc86dd7xBGG4UPygUjUQQxd65xbKSRQ5XUKpCNBNRtWTtWdjf2N+wEMZZIB3amAPYcMB2EXhhSRyuQoUoKpwwW7hz2IY/6gOIMyE7uAnEeJlLZVu1e1LFqbc26TchgqgwoxTWwOuSK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(6133799003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WHdDQUFva2dBcGhUL3dwdjZ3dmo2UTZrQlhXUnE0MGZmdXhOTkFFK1Q1YXVH?=
 =?utf-8?B?MkRhU1ArRFY3TTY4QWN6dllJa1RlQ0k1Y0V1cElqaXphUHNUQzlma3ZkT1NI?=
 =?utf-8?B?MkRxOGtTWmZaWjNzYkQwVG1Nc0hKVEQxM3ZIWnNMUWIyTHkvQWZIM0x5ZEhS?=
 =?utf-8?B?K2M2QmF6SzFMZlZQT0QrOEszY3NDWWJpYkI0eHlNZDlVY0xyOEtQekxmOE9J?=
 =?utf-8?B?V09kdVoxb2VJZTNjaVhOamt2aUEydG56UEVKakdXdmdHdlFRUVhOSzZpWXR6?=
 =?utf-8?B?VmNKTE8zZTNRQ05XaHpkOUs0dnVmTU5KQXV2THB5S05FRVl2Z3BPSWtvdWxZ?=
 =?utf-8?B?WWJBWW1Ga3V2Tk51cHFVU1NDUWxHRlBiUk5mWURxYmlkcmxWQzJKRFJwQm9h?=
 =?utf-8?B?MEwweWUyWDR3S3hGQlY5dEF3cFpzdGh6bmZXZFp4a3B2VHJXaXNrcXlzNGJl?=
 =?utf-8?B?RHpDR2lIMEtCOG5lc2VWYXJvOG1wa1cxZXBGaGNOL1FiTGVPTDMwYVBRQkRN?=
 =?utf-8?B?bjFaNmhyMUkxbVRrTU5uR2h2S25nZ3B6QW44Z2Q4bXFkdzBHV2JFRFB1SXR1?=
 =?utf-8?B?bDdFRDFoK0k3L29IdFdZS0VmWEpPTzdtQmoySS9JT2M0VCtERHk1TnRKZjlj?=
 =?utf-8?B?RE4wVlV2NHJtemJhRFJIRG5RcStVaHlzUk9EWnJ4Ky9BYUxSNXhGYmVpTjFL?=
 =?utf-8?B?U2xSV3BPblgxNmNtSTVWcVB4Q0JVR2RnWHl4RHpjekM2OHdpcFNiemJBcE9U?=
 =?utf-8?B?K3FlT2RIN1pEb2svS0NXSThkUkdrMCtBcnA4bEdWbDZYVjBTVnMrK2NpK0d2?=
 =?utf-8?B?RTNTMmhVN2dYYlVlSHRaREQyMVZrNWRvQmQvVXBrUGJmMUxodDZzaHVnSlIz?=
 =?utf-8?B?ZGlGT0E5MExESmJocXEyUzUxOHcySTIwT2k0NUoySVJTRHFwTFJVVmhGU0cr?=
 =?utf-8?B?NnlkckxZQkpYNEJyTUhQRDcyLytxY2x3NVRwOU45c2xERzhXT3dWTkJzRnd4?=
 =?utf-8?B?dnRmUmREVy9YSU1qeVpiaVJEOHBnUlE1bVlmWWRnK3RZWnVseWlkT1J4NnlP?=
 =?utf-8?B?MHU1S210Z2VZS1huYjA2WjFaTEc0ZlJDMFlGZlJjMFFsV2hhMy9lcU5qZHVK?=
 =?utf-8?B?ZEpZdUJpVCtGR1dtYWVFNURSb21nM1J1MEliUmdFVk9jVUNMc1ZXdGVjcTBY?=
 =?utf-8?B?WmVNUUtoN2ZWZVhRYTNpSDFDSnBhYTB4VlpOUTZBMWJIWElocHJnYXVoVzAz?=
 =?utf-8?B?ZlFWMlJMUmUvQ1BpcE4reGg3NFIya0VLTFk2dThtM1VJWnJ6SnJtazlJb3Mr?=
 =?utf-8?B?a3gyL3dkU1k4aUFhZ0RwMm9tOFExU1NoeGpLdjd2Y3dpYWhWOGtKc3doa3Fn?=
 =?utf-8?B?K0xDanpiYlAva2c4WFZLaElCRGZKWHBjRkRZZ3dyMFVBbWE0cU5DcnZoc3pQ?=
 =?utf-8?B?d0MwekIvRzZqMTUzam5CWjRxNmkrL0Ird3U2YSs0RFlJQ1l5ZlFocHA5U1pv?=
 =?utf-8?B?UDA3dUM2amk5Q1dCcDZneUhaMXcvaXE0N2szRkFvaTUwWGtRcU1EWllGMyt3?=
 =?utf-8?B?dEsxYUNzNVlQaCt1MU00VkYwSThRSURDNTRWWTlyK0J3YUxYem5KYnZhM2k1?=
 =?utf-8?B?M3FnRS9WelFBTjVwSDZicXltN1dNeFpmS3RuTUxCN3VPalJRU2J0ZldFd1Js?=
 =?utf-8?B?c0tRSGlFcTdPV0tWODcvUVdFMG1pOFhUZTVYckU5ZEJ1U1BlWktoR2sxTXQ1?=
 =?utf-8?B?WDZpWThpajVibXVhUkYvWmZiQURCZnB6S2F6NnBBODBrVVhvUjNoSHRVSStH?=
 =?utf-8?B?aEwyR1pKTTJIVHJzV1l2MEQzdHlIMHVVL28yU081KzM0SUhscGp3M0xsMkdh?=
 =?utf-8?B?TFdXb01oTTNPMmUwWDEwVmpUTzZFcjNFRVU0Wm44d2dXTVNqQnZrUXQ5WGFR?=
 =?utf-8?B?b0x0M2JjNGR3emJuQm9nTFcwRXF1ZTlnUDNPbUh6VDlscVl0b0ZnSU12TjJC?=
 =?utf-8?B?TkgvYkFsTVlVZFROeE9ad01wWDZtWEgyTmd2RHhsYnhST3krTVptVUFOQzM5?=
 =?utf-8?B?RlJuTzFsVWxRa0wxQWFBOERTRWMvNS9pb0VBRFF1QTNaUjRwakM1NlZwZjJC?=
 =?utf-8?B?M01yekNJbGk1QU1PV0RWLy91OVJrU1FidlhCNklrcGsvOFF1M1RxZ0szR29a?=
 =?utf-8?B?alhwcS9FUDJNUTB3d3ZQMVVtSFlhNE4wNS93MGJYQk1DU0lnZHI5NFNkT2dr?=
 =?utf-8?B?dFVxTUtqOWttSFlLZGU0RUxtYlpwVGRrMitpNFVSN3VlWThxL2x5Z055WDZ4?=
 =?utf-8?B?MUJVWGxWV0M1RUV0VDdHQ2dYT0ZBbHVJd3BZRE1SQUtLNG5RS24rUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 933884e9-a3b9-4d9b-5145-08dec1467d6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 08:02:42.9036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1vfMGkLUGLw4y7AIEPJd3tak2ULKi5l7DbKJBKQyYkA8PI/XqqUN0xWw4AIS/Fs7CfbK52Oot390s70kWe9fduTbBo0sThSwkZ9n7gQZhAg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6718
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33500-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,gmail.com,sang-engineering.com,kernel.org];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:biju.das.au@gmail.com,m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,pengutronix.de:email,bp.renesas.com:from_mime,bp.renesas.com:dkim,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D11BC6357A9

SGkgUGhpbGlwcCBaYWJlbCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT4NCj4gU2VudDogMDMgSnVuZSAyMDI2IDA4OjQ3DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjE3IDEwLzE3XSBtbWM6IHJlbmVzYXNfc2RoaTogQWRkIG9wdGlvbmFsIGF4aXMvYXhp
bSByZXNldCBjb250cm9scw0KPiANCj4gT24gTWksIDIwMjYtMDYtMDMgYXQgMDc6NTcgKzAxMDAs
IEJpanUgd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMu
Y29tPg0KPiA+DQo+ID4gVGhlIFJaL0czTCBTb0MgaGFzIGF4aXMvYXhpbSByZXNldHMgY29tcGFy
ZWQgdG8gb3RoZXIgU29Dcy4NCj4gPg0KPiA+IEFkZCB0d28gb3B0aW9uYWwgcmVzZXQgY29udHJv
bHMsIHJzdGNfYXhpcyBhbmQgcnN0Y19heGltLCB0byB0aGUNCj4gPiByZW5lc2FzX3NkaGkgc3Ry
dWN0LiBCb3RoIGFyZSBhY3F1aXJlZCBhdCBwcm9iZSB0aW1lIHVzaW5nDQo+ID4gZGV2bV9yZXNl
dF9jb250cm9sX2dldF9vcHRpb25hbF9leGNsdXNpdmVfZGVhc3NlcnRlZCgpIHdpdGggdGhlICJh
eGlzIg0KPiA+IGFuZCAiYXhpbSIgcmVzZXQgbmFtZXMgcmVzcGVjdGl2ZWx5Lg0KPiA+DQo+ID4g
SW5jbHVkZSB0aGVtIGFsb25nc2lkZSB0aGUgZXhpc3RpbmcgcnN0YyBpbiBidWxrIHJlc2V0L2Fz
c2VydC9kZWFzc2VydA0KPiA+IG9wZXJhdGlvbnM6IHRyaWdnZXJlZCB0b2dldGhlciBpbiByZW5l
c2FzX3NkaGlfcmVzZXQoKSwgYW5kIG1hbmFnZWQNCj4gPiB2aWEgcmVzZXRfY29udHJvbF9idWxr
X2Fzc2VydC9kZWFzc2VydCgpIGluIHRoZSBzdXNwZW5kIGFuZCByZXN1bWUNCj4gPiBwYXRocywg
cmVwbGFjaW5nIHRoZSBwcmV2aW91cyBzaW5nbGUtY29udHJvbCBjYWxscy4NCj4gPg0KPiA+IEJl
aW5nIG9wdGlvbmFsLCB0aGVzZSByZXNldHMgYXJlIGEgbm8tb3Agb24gcGxhdGZvcm1zIHRoYXQg
ZG8gbm90DQo+ID4gcHJvdmlkZSB0aGVtLCBzbyBleGlzdGluZyBiZWhhdmlvdXIgaXMgcHJlc2Vy
dmVkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiA+IC0tLQ0KPiA+IHYxLT52MjoNCj4gPiAgKiBObyBjaGFuZ2UuDQo+ID4g
LS0tDQo+ID4gIGRyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpLmggICAgICB8ICAyICsrDQo+
ID4gIGRyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYyB8IDI2ICsrKysrKysrKysr
KysrKysrKysrKysrLS0tDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21tYy9ob3N0L3Jl
bmVzYXNfc2RoaS5oDQo+ID4gYi9kcml2ZXJzL21tYy9ob3N0L3JlbmVzYXNfc2RoaS5oIGluZGV4
IDBjYThlYzI3YzMyMC4uNmMwMjRlN2Y2OWUxDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9tbWMvaG9zdC9yZW5lc2FzX3NkaGkuaA0KPiA+ICsrKyBiL2RyaXZlcnMvbW1jL2hvc3QvcmVu
ZXNhc19zZGhpLmgNCj4gPiBAQCAtMTExLDYgKzExMSw4IEBAIHN0cnVjdCByZW5lc2FzX3NkaGkg
ew0KPiA+ICAJdW5zaWduZWQgaW50IHRhcF9zZXQ7DQo+ID4NCj4gPiAgCXN0cnVjdCByZXNldF9j
b250cm9sICpyc3RjOw0KPiA+ICsJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdGNfYXhpczsNCj4g
PiArCXN0cnVjdCByZXNldF9jb250cm9sICpyc3RjX2F4aW07DQo+ID4gIAlzdHJ1Y3QgdG1pb19t
bWNfaG9zdCAqaG9zdDsNCj4gPiAgCXN0cnVjdCByZWd1bGF0b3JfZGV2ICpyZGV2Ow0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvcmVuZXNhc19zZGhpX2NvcmUuYw0KPiA+
IGIvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3NkaGlfY29yZS5jDQo+ID4gaW5kZXggOGUyZmIx
OWI5OTRiLi42OTk4NzI3NjZmODggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9y
ZW5lc2FzX3NkaGlfY29yZS5jDQo+ID4gKysrIGIvZHJpdmVycy9tbWMvaG9zdC9yZW5lc2FzX3Nk
aGlfY29yZS5jDQo+ID4gQEAgLTYxNSw2ICs2MTUsOCBAQCBzdGF0aWMgdm9pZCByZW5lc2FzX3Nk
aGlfcmVzZXQoc3RydWN0IHRtaW9fbW1jX2hvc3QgKmhvc3QsIGJvb2wgcHJlc2VydmUpDQo+ID4g
IAkJCQlzZF9zdGF0dXMgPSBzZF9jdHJsX3JlYWQzMihob3N0LCBDVExfU0RfU1RBVFVTKTsNCj4g
Pg0KPiA+ICAJCQlyZXNldF9jb250cm9sX3Jlc2V0KHByaXYtPnJzdGMpOw0KPiA+ICsJCQlyZXNl
dF9jb250cm9sX3Jlc2V0KHByaXYtPnJzdGNfYXhpcyk7DQo+ID4gKwkJCXJlc2V0X2NvbnRyb2xf
cmVzZXQocHJpdi0+cnN0Y19heGltKTsNCj4gDQo+IElzIHRoaXMgb3JkZXIgKHJzdGMsIGF4aXMs
IGF4aW0pIC4uLg0KDQpUaGVyZSBpcyBubyBvcmRlciBtZW50aW9uZWQgaW4gdGhlIGhhcmR3YXJl
IG1hbnVhbC4NCg0KVGhlc2UgYXJlIHRoZSBiaXQgZGVmaW5pdGlvbnMuDQoNCkJpdCAwOiByc3Rj
LCBCaXQgMzogcnN0X2F4aW0sIEJpdCA0OiByc3RfYXhpcw0KDQphbmQNCg0KQmluZGluZyBsaXN0
cyB0aGUgcmVzZXRzIGluIHRoZSBvcmRlciB7IHJzdCwgYXhpbSwgYXhpc30NCg0KDQpGb3IsIGNv
bnNpc3RlbmN5IEkgd2lsbCBrZWVwIHRoZSBvcmRlciB7IHJzdGMsIGF4aW0sIGF4aXMgfS4NCg0K
PiANCj4gPiAgCQkJLyogVW5rbm93biB3aHkgYnV0IHdpdGhvdXQgcG9sbGluZyByZXNldCBzdGF0
dXMsIGl0IHdpbGwgaGFuZyAqLw0KPiA+ICAJCQlyZWFkX3BvbGxfdGltZW91dChyZXNldF9jb250
cm9sX3N0YXR1cywgcmV0LCByZXQgPT0gMCwgMSwgMTAwLA0KPiA+ICAJCQkJCSAgZmFsc2UsIHBy
aXYtPnJzdGMpOw0KPiBbLi4uXQ0KPiA+IEBAIC0xMzUxLDEzICsxMzYxLDE4IEBAIGludCByZW5l
c2FzX3NkaGlfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gew0KPiA+ICAJc3RydWN0
IHRtaW9fbW1jX2hvc3QgKmhvc3QgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiAgCXN0cnVj
dCByZW5lc2FzX3NkaGkgKnByaXYgPSBob3N0X3RvX3ByaXYoaG9zdCk7DQo+ID4gKwlzdHJ1Y3Qg
cmVzZXRfY29udHJvbF9idWxrX2RhdGEgcmVzZXRzW10gPSB7DQo+ID4gKwkJeyAucnN0YyA9IHBy
aXYtPnJzdGMgfSwNCj4gPiArCQl7IC5yc3RjID0gcHJpdi0+cnN0Y19heGltIH0sDQo+ID4gKwkJ
eyAucnN0YyA9IHByaXYtPnJzdGNfYXhpcyB9LA0KPiANCj4gLi4uIGRpZmZlcmVudCBmcm9tIHRo
aXMgb25lIChyc3RjLCBheGltLCBheGlzKSBvbiBwdXJwb3NlPw0KPiANCg0KVGhpcyBpcyBPSy4g
V2lsbCBmaXggdGhlIGFib3ZlIHJlc2V0IG9yZGVyIGZvciBjb25zaXN0ZW5jeS4NCg0KQ2hlZXJz
LA0KQmlqdQ0K

