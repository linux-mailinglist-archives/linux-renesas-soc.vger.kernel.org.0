Return-Path: <linux-renesas-soc+bounces-31637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPUqKfJu62mFMwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:24:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E457245EF26
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 15:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF2D9300CFF8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 13:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0113CAE84;
	Fri, 24 Apr 2026 13:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="GWLLdqGo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA713290A6;
	Fri, 24 Apr 2026 13:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777037038; cv=fail; b=Z/PJT4X+X0qu2H20bolpzWTPjOvvEZI03LPCNKCGuzXCEoWg4/ftjf/eVks0VKWn7iYetFUA4BxeKMZasL9VDUjAEivGHP6Xl4puAW9tfopY+oDpZUJRN3Hy7OTMGA6Hyw93PDDU2YF8rp0ShFY8vWFn0G6+cbqywMLx2luCBpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777037038; c=relaxed/simple;
	bh=oPdp4OldMaCdlIScWj+FeUmXkV6lX9fZafYft7M58vc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Bws/gHiJ6M+HpA3QTWnpv9YhoOqTPFgSD+CdpGZ5c4WfcZxpr+vLXqFjE11LOQZBgYMVpyIR1+9eH/YGesPpw8+Q7li5QWPnEcUJbIh9mDyUAnP/ynzDUM5guU2pAJH49az80oHdgdObf2LG13iuITTB5RGPmtIm5loNmjJjqBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=GWLLdqGo; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dOXRuiE7VexWZt4yp2kkS+IR4WTNdVnJPSMhSt1nOOkiUZK/7bXAb/TvhC7bgijTa5MUAqmg3oDcRybCxlaQ0GvsYkKKe41WUFWmq26xf/Pe3MlresPBmHztkU7nIncOA8JzkyatX8PTWxLPhwlAnenh14uyVS6NueeT3STc+bWPIK+5YKoNTo5Y1moCdQNx35ejx8cdmXq/ygA1ti8ZpI5SZ/2IoF6PrFcetOvptumrgwc6JGtm512aKHEi71a3YujfbjkS3a+ivlCtt91n+r9O03+k2yENseoDhqqdQGUSNPHO0/FXGknONQE7B8xDiG31oE8s/Wdy4Yb2wAVTcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPdp4OldMaCdlIScWj+FeUmXkV6lX9fZafYft7M58vc=;
 b=EG0c3p5E6Kt0VbE4ESbaRzQ0Igcm3iaBJR+9moP5YWdv/c2h9KVsmnEJudhpwp+YkAiTz/QEhs028i6HlZ3vASYU3gqow8xjDZ4yHqBSBQ1A2k8KhOu+L6Y66wolbWvO+aVr6zMpPUqgWkT4yp3jsytiq6YKumNVFoesb4J6S5HVmYXz3evYfBRukt065+GSAwDX/HCKDQjtMxcAYih4LXiLRQCprKD+iR+PusQTY/eAvBjYhWjl8ivwWB7WQgTTUTg0GSNKTlIzz4NFHq3FmH8l4+D/SrpJi/YlwwkLq8RWTZdbCfr0Z57F9wa8+97vdjZhaZj/AGGAc8TFp8Ty8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oPdp4OldMaCdlIScWj+FeUmXkV6lX9fZafYft7M58vc=;
 b=GWLLdqGo+YMbsaSorW62cN8OZtLQxdWnBhdsP1qfn5Ca1CE3Sk2Ny4Um5iJoQ+IM2RHoVWDVvjPVgfFoB/kF6BWSB5LAGkyri9xtGeUVGRhCkPwykqQD69dYN6g8EvzTbcj88Pqj/cyVJCPss53iOJ3eCJRMmRpEnv60fVBs//g=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB17031.jpnprd01.prod.outlook.com (2603:1096:405:328::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 13:23:52 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 13:23:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 2/5] clk: renesas: r9a08g046: Add CA55 core clocks
Thread-Topic: [PATCH 2/5] clk: renesas: r9a08g046: Add CA55 core clocks
Thread-Index: AQHcwEh3zVvYbMah3k6X/UHTJWc3V7XuUiIAgAADxvA=
Date: Fri, 24 Apr 2026 13:23:52 +0000
Message-ID:
 <TY3PR01MB11346170F9CFA9DA98539A3F5862B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
 <20260330132349.149391-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVr8FKx-n7OEgFf6vufzPRK-XrYDEPn_Ki0siknT57DOw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVr8FKx-n7OEgFf6vufzPRK-XrYDEPn_Ki0siknT57DOw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB17031:EE_
x-ms-office365-filtering-correlation-id: d89db80e-1090-4c9a-bd87-08dea204ba3c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 LLIkTSvymq5pWG0SqrcJVqMKtpzpT1Lx/ORgutAbACjq4jpE3UF/CMO5qOFjJApIFmLw7P25phV4/IJ39+fwMY0HMBv6gQPQSpJEhzjiw8l1IZOpfu0L80++TcTYSWkkzi73TcQUUyZZfTwfz1HgctpVQeXaQtip6jJof7ReAemkH3tv3cRO/0ZX1K82lQyJrnlWLFdqbvD/Ve7NSqvTDpP/ZKJPbIyjPfbNTTnuzh5+0unOWeYKPx6clDOrtwfljpqBbyck0ezEnF7Lm+oZeYjCMYoUt4q+Bk247UP7c9s4ALNTo+Nop6Z4IYu6Rt3HzCWFp8q6TqcF2POxW2Splr5CwVm/bw2b5eqvmSsR+bVL3edZuEIww8Bdds7g3pMEgn92MxFDgY0fCHPJY78zPd4TWUirUOSvXx6S7Gc522URd6yt9/hDO93vyCLZZdq/XA/NIFYrKQxHra1QRSLAE4/igL3S0QgmIptIlTgdj8qIVVx8TO9pGWQjmBkV4gC8Iw9B/SHVz7L3pgt9AfoqmbeubtZvP/iiAw1Kig75dKpQkYqoMJxYC+3uHKWJJoeKUWn8Q7uJo+IJ5qye/jdhvZ9voq302VQcxQCTF6Sjp6ia0wVsENgENA5w0oet55FbUhCBeFnZj95ZpNElcMQPe49CrQTpw5fpByxD0/j1qU7BPnXyjp15nFIR5ruPxCUfwlL/MgBN+yW78YAEQY4Ygqt+V6V+2LwHIvxJzLM44IgcvEafzDS0FpDWSn6NTIOwefY9W80WiDCOJ7O+OCpR9xCqMcEcAlGWdeWSYHr1NdY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WVcva2d3WEpTOWhIbytRQUdWZUFKT2ZmWnp0UXU5SUt4ekwxcEpUdVR4T21i?=
 =?utf-8?B?R0tENlhic3RuVVZyMk9nK3B1U3lWSUFBM2JOTytSRlhjU3RhQmZOaDUzY2x5?=
 =?utf-8?B?azcvcXFZbk1WOFJESjBZa3lHK2E4VFZEeExZaDVROHdrbUoxbVVoUW9CRkxs?=
 =?utf-8?B?K29JbGZoZmx4RXVPcDgxSy8wbituUEJkTGs3MDgxSzJBRys4SnF1TUg4cGR5?=
 =?utf-8?B?YXhnTzlTL1J5anJER29GKy9FbFUralFFclJ3NXVUSXZDMXhCR1pPa2JGdkxn?=
 =?utf-8?B?MUhhTVVaNE56MzU4cVlYUUdRRmdEeU55Tjc0U2JpakZLekNZVm1USGRGbnNF?=
 =?utf-8?B?akF5b0t5MzMrVXo3aWJRbnVHZFhqOWFvOUR1cjBOY0UxYmorUjQxV2VtUU1F?=
 =?utf-8?B?eEdlZTFLRG5WWThnVVdUeXFHTUNrd25WOCtLNk1ZK3FBZnowS2VKRnNqV29V?=
 =?utf-8?B?ajU0YUtISzhNaWQ4aUwycVpOVGN2WGRvaTY0UEtmY0hxSEkyaVlrM0xBWG1h?=
 =?utf-8?B?US9xb0RtbFNRMmlwK05SbDcwN3BIZFpnNEFEYjEyWDQzMm5JczRDRDVJRFNY?=
 =?utf-8?B?ZGFodEE1OG44M3ZBKzJrZkMycyt2dDIvREdPNjFUM1A2Z0F3UmJOU0tPa0Rq?=
 =?utf-8?B?YXJrZVhESEhCMWwyRzZUVDdpZTR6Z0lEclh6cDUwR0tQQVdsZS91N0xTVUNo?=
 =?utf-8?B?SEswc0x3YkJVT0lNSG5MYkZBMHNSR3VlWTRtV3BvK24zT1NMMkVjRmxjSFl4?=
 =?utf-8?B?TDZiOVowY3JTK295U0FaS213a2U5dUdkQWt2WDRKVkxIeVNwaVdTUktCM3lr?=
 =?utf-8?B?Q0JkOUxEUkxiTFlwSGVQTmVRZU95QnFmSnJlZndsQ1o1cU1DY25mWnpaSGN6?=
 =?utf-8?B?S1N1M3JEdkh1cHdIcGp4eVlMaFdWSW12ZFpIaWdzaUROekRodUtrVU1ReFdH?=
 =?utf-8?B?MjlZVHBqQ2VrLzBFb1VoRW5DOVJHYm8xOUZGd2cva1B2YUhKVDFYVU5rZjlp?=
 =?utf-8?B?U1BzZWgxNVFQT0tEWUtRWnN0UGFiMXUyQjlKdnNXa3h3c0xmaEpERGRNRnZQ?=
 =?utf-8?B?eEdCLzRNMEc4MmdVUS9nRDhLVDdJNVU3WTNVSzd2blJSajNQSS9ieEVWM2l5?=
 =?utf-8?B?RTMxZEFXNVI5RmdkQldxTzNuWGtBN09RRjIydGRMV0cxL2ZLejhMQU1vQm8w?=
 =?utf-8?B?SnNuUDFTMitWb01UcExiTDhSMVE3WHpyUlFndFgrREtsZDlkaHVKNGljdzlU?=
 =?utf-8?B?SDJZYXZWYlBvNis4NmY2THpiNWZ5UzJzQ2M1QXhORndYWWJOYzZncDYzMHBv?=
 =?utf-8?B?Y3gyN2x1eVdaUUtIN3JtelBla1hWWVphdE0weFpiNVI5TG5ZSjRETGw1WUIy?=
 =?utf-8?B?MzV4alZrcjQ4d3EvUjJsMzdtRC9SUUhXdkpUTDlHR1djQksxZVQ0ZkZiMmI5?=
 =?utf-8?B?SWZ2dEFjQitJWm1aNkl3ZEoyV3U4cWJGVTBPMTRIdVpYL0owZXNHR1pFVzNx?=
 =?utf-8?B?WmtHR3hCbkVaVFhUVHhBekhzdEdsMEtwNDdpNnpGVVRtY3RzVUlxMERHL3Z6?=
 =?utf-8?B?VzUvUFhrYmhOQmtGYS91a3BNOGR0UUcxSUQ1bytYeVZmRTJJQTNiNHRxWU05?=
 =?utf-8?B?Q1dacWJ4UkJjZHJpQ0NRVVg1SE9Dam56cU9ORTJHdlA3T24xQ3o5SXJSdSt3?=
 =?utf-8?B?aTJRYmRGN2lFUU5qRzFJMW1BRVNmTDVTZzNaT2JRZHBFR3o0RlpGdHh3eDFO?=
 =?utf-8?B?QlBrVitjWnY5OWk3L3dvc0h6QjVtMVIzYVNtWTkwYU44d0p0aC9ncWFPa1c2?=
 =?utf-8?B?dHEzRWkwbm10YmJNcjBzcTY1UVVJcVczeDYzNGk1ODlqdlZ0Mm1jZXFSSEsy?=
 =?utf-8?B?ejVONmFTbFNUYTdnYTRobDZOcU9iTjc5ZnlZclc5azBVZFRmczZsUXpYVWlk?=
 =?utf-8?B?UDU1RXNFZERHTElmbC81Tmh1U1VjSUYzc0paWEExUFFiNXA2dUwwWG1rR016?=
 =?utf-8?B?N25mTDI0S2dpWi9DR0NhSVBFTlJRMlJvS3RXQ29zWW5sVkI4Sll3VTBrMnhK?=
 =?utf-8?B?MktKRTNLZ3VhTldjSVhIWXBENFJHRlhFYy90L0F5eUpZc1J2d2RkK0R6anZs?=
 =?utf-8?B?cFp0TTRSREplSUFxR2lZZFNQOWdzeS8raDlpMUVaL2lidm1DUkh6Q0huNXRX?=
 =?utf-8?B?TzFPUHhoMWxGMTZUYVl6K3dwbEVjcmkwanpOcDhlamh6UEZpK1htQldKdndk?=
 =?utf-8?B?R2VsTHZ3K2M2OEtYMWtlZTJTS21qTlZONDY4d0ViK0J2ZjVBK0NuTkZwVDNY?=
 =?utf-8?B?bGRXVGFkVi9lRmxjSjB4aHpNZm14UlM5Yzd1aVRVdnd4U2Z5WEdjZz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d89db80e-1090-4c9a-bd87-08dea204ba3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 13:23:52.0791
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c7Ckgw28PMAUCAZVYNoN6ryU0mvZmGtOK1Fr/qGjVrHGfPY78bnJvTqSI44a1CvFwq6Us/sx0+4XtW45Vy5A/bxR4KH6PBZXL9KTN1Y7E+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB17031
X-Rspamd-Queue-Id: E457245EF26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31637-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,glider.be:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI0IEFwcmlsIDIwMjYgMTM6NTQNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCAyLzVdIGNsazogcmVuZXNhczogcjlhMDhnMDQ2OiBBZGQgQ0E1NSBjb3JlIGNsb2Nrcw0KPiAN
Cj4gSGkgQmlqdSwNCj4gDQo+IE9uIE1vbiwgMzAgTWFyIDIwMjYgYXQgMTU6MjMsIEJpanUgPGJp
anUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMgPGJpanUuZGFz
Lmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gQWRkIENBNTUgY29yZSBjbG9jayBlbnRyaWVz
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2
ZXJzL2Nsay9yZW5lc2FzL3I5YTA4ZzA0Ni1jcGcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3Jl
bmVzYXMvcjlhMDhnMDQ2LWNwZy5jDQo+IA0KPiA+IEBAIC0yNSwxNSArMjYsMjQgQEANCj4gPiAg
I2RlZmluZSBHM0xfRElWUEwyQSAgICAgICAgICAgIERESVZfUEFDSyhHM0xfQ1BHX1BMMl9ERElW
LCAwLCAyKQ0KPiA+ICAjZGVmaW5lIEczTF9ESVZQTDJCICAgICAgICAgICAgRERJVl9QQUNLKEcz
TF9DUEdfUEwyX0RESVYsIDQsIDIpDQo+ID4gICNkZWZpbmUgRzNMX0RJVlBMM0EgICAgICAgICAg
ICBERElWX1BBQ0soRzNMX0NQR19QTDNfRERJViwgMCwgMikNCj4gPiArI2RlZmluZSBHM0xfRElW
X0NBNTVfQ09SRTAgICAgIERESVZfUEFDSyhHM0xfQ1BHX0NBNTVDT1JFX0RESVYsIDAsIDMpDQo+
ID4gKyNkZWZpbmUgRzNMX0RJVl9DQTU1X0NPUkUxICAgICBERElWX1BBQ0soRzNMX0NQR19DQTU1
Q09SRV9ERElWLCA0LCAzKQ0KPiA+ICsjZGVmaW5lIEczTF9ESVZfQ0E1NV9DT1JFMiAgICAgRERJ
Vl9QQUNLKEczTF9DUEdfQ0E1NUNPUkVfRERJViwgOCwgMykNCj4gPiArI2RlZmluZSBHM0xfRElW
X0NBNTVfQ09SRTMgICAgIERESVZfUEFDSyhHM0xfQ1BHX0NBNTVDT1JFX0RESVYsIDEyLCAzKQ0K
PiA+ICAjZGVmaW5lIEczTF9TRElWX0VUSF9BICAgICAgICAgRERJVl9QQUNLKEczTF9DUEdfRVRI
X1NESVYsIDAsIDIpDQo+ID4gICNkZWZpbmUgRzNMX1NESVZfRVRIX0IgICAgICAgICBERElWX1BB
Q0soRzNMX0NQR19FVEhfU0RJViwgNCwgMSkNCj4gPiAgI2RlZmluZSBHM0xfU0RJVl9FVEhfQyAg
ICAgICAgIERESVZfUEFDSyhHM0xfQ1BHX0VUSF9TRElWLCA4LCAyKQ0KPiA+ICAjZGVmaW5lIEcz
TF9TRElWX0VUSF9EICAgICAgICAgRERJVl9QQUNLKEczTF9DUEdfRVRIX1NESVYsIDEyLCAxKQ0K
PiA+DQo+ID4gIC8qIFJaL0czTCBDbG9jayBzdGF0dXMgY29uZmlndXJhdGlvbi4gKi8NCj4gPiAr
I2RlZmluZSBHM0xfRElWUEwxX1NUUyAgICAgICAgIERESVZfUEFDSyhHM0xfQ0xLRElWU1RBVFVT
LCAwLCAxKQ0KPiANCj4gRzNMX0RJVlBMMV9TVFMgaXMgdW51c2VkLiAgUGVyaGFwcyB5b3Ugd2Fu
dGVkIHRvIGFkZCB0aGUgSS1jbG9jaywgdG9vPw0KPiBJZiBub3QsIHBsZWFzZSBsZXQgbWUga25v
dywgYW5kIEkgY2FuIGRyb3AgdGhpcyB3aGlsZSBhcHBseWluZy4NCg0KUGxlYXNlIGRyb3AgaXQu
DQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gVGhlIHJlc3QgTEdUTSwgc28NCj4gUmV2aWV3ZWQt
Ynk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiA+
ICAjZGVmaW5lIEczTF9ESVZQTDJBX1NUUyAgICAgICAgICAgICAgICBERElWX1BBQ0soRzNMX0NM
S0RJVlNUQVRVUywgNCwgMSkNCj4gPiAgI2RlZmluZSBHM0xfRElWUEwyQl9TVFMgICAgICAgICAg
ICAgICAgRERJVl9QQUNLKEczTF9DTEtESVZTVEFUVVMsIDUsIDEpDQo+ID4gICNkZWZpbmUgRzNM
X0RJVlBMM0FfU1RTICAgICAgICAgICAgICAgIERESVZfUEFDSyhHM0xfQ0xLRElWU1RBVFVTLCA4
LCAxKQ0KPiA+ICsjZGVmaW5lIEczTF9ESVZfQ0E1NV9DT1JFMF9TVFMgRERJVl9QQUNLKEczTF9D
TEtESVZTVEFUVVMsIDEyLCAxKQ0KPiA+ICsjZGVmaW5lIEczTF9ESVZfQ0E1NV9DT1JFMV9TVFMg
RERJVl9QQUNLKEczTF9DTEtESVZTVEFUVVMsIDEzLCAxKQ0KPiA+ICsjZGVmaW5lIEczTF9ESVZf
Q0E1NV9DT1JFMl9TVFMgRERJVl9QQUNLKEczTF9DTEtESVZTVEFUVVMsIDE0LCAxKQ0KPiA+ICsj
ZGVmaW5lIEczTF9ESVZfQ0E1NV9DT1JFM19TVFMgRERJVl9QQUNLKEczTF9DTEtESVZTVEFUVVMs
IDE1LCAxKQ0KPiA+DQo+ID4gIC8qIFJaL0czTCBTcGVjaWZpYyBjbG9ja3Mgc2VsZWN0LiAqLw0K
PiA+ICAjZGVmaW5lIEczTF9TRUxfRVRIMF9UWCAgICAgICAgICAgICAgICBTRUxfUExMX1BBQ0so
RzNMX0NQR19FVEhfU1NFTCwgMCwgMSkNCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhv
ZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgt
bTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwg
cGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0bw0K
PiBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
DQo=

