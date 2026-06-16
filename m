Return-Path: <linux-renesas-soc+bounces-34060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zWP+LekWMWrebQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 11:27:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5DC68D85A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 11:27:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=i+wiV0Ik;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87D7B30BC482
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 09:26:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6310D407574;
	Tue, 16 Jun 2026 09:26:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9AD416CE3;
	Tue, 16 Jun 2026 09:25:59 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601961; cv=fail; b=QaMLexAPDZNCGA83mwowRnRTJ3uacUYnEwmKLalsR7HbHr5TRGL+Eaw7mm722XKzcoKX2zB2iubdFR76JHBpVF3433Q/EMUaLU2jBsUMKqueeKcdTj0wYlcHxZrAy+EzYl2vVKihVW8m4cFofG96tiOqS/AEFmjWP7UKZswP9lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601961; c=relaxed/simple;
	bh=/J1UtrWRpkTlcrpx6VH9N7/nCEHqS+W0ecD163tfi0o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e3F7Ng+bB8BJni3smamea0NpYMvb/mo7WKQGXFnrr8plGx1R0PmSaMoVyNznFnV2XS8zYZPIRBXLYXmRBIGnC1YpZEqFBsYrqzdiyhB1ApEDuGGzjKYSNayV7BUtyApBF8rKxINH/BfujkDX7dGyVqug6ibivqkN78iF6FhrwWg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=i+wiV0Ik; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xRTAhGjtvfx5x+CoNHvZ577QvwJ9BjNwSeso3AqnQ4hqsnK9YcCKuO0VWqDpnjM6//sjzJazK05DmyFjKuxAYmn780X8U6YGtmHiYelXt3al58o1qwwTl50jhod6mDZCyJTnyv2ggQPNcYUgcksNChT9fC2ZNftpYxXB6UC/9nX9Og1WmRSH8Hk+jyOnxTtj3/nAvFpuJeqUg5XLYNzMBxSMPWz48iDr5lhx2ZrdYG/ilopZEL/AV4KKkualmS6lSTrcwBl/gBEz9XWgADugpCsoA+l18fzQ1SXttxfnQpfidoCIzIdSc7O3H25mWkLZI2t9BoxL85Cdn43vwC+XRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/J1UtrWRpkTlcrpx6VH9N7/nCEHqS+W0ecD163tfi0o=;
 b=NJDW19QvW2aJP8CfwGecxGbqcnxEPQhxLx6Pl/gYuk1R7ypmpS7NHI7OPItw7f7Z/b/dJFYEpDedaOnCgm6cwRjlbocYh9ccDbkDNa5Z9UKDjJeiTDsoPIUkUWNGtX0ie4DytGBKSgk54882NC4cN/+0ku6okEJGki76XVD+8E8/Do3h9sN7bHYXZ6wLZhBJrkRIFx3A//6iXZxPZFs21qHmzMgPZ01CbOE40h5Nfzin34a0nlMlx1ERdUHuwwKMnTwZ13xmg/eozYqsULdZ4TkP6iocCLbNSIXdPyKCwgACOlXDB0HziwMvu5cmrArmU6x+DXkdnDmT9nN4yjCscQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/J1UtrWRpkTlcrpx6VH9N7/nCEHqS+W0ecD163tfi0o=;
 b=i+wiV0IksnTpl5t+B7FjYP5cH3urkzmkLmyj1VMCTAvIncBaTYxDs9p6/G9iuHNfi7tmLSwc0QdTg36+TfIMBg9MSeXLmG5uP8BhH8ADxN3DozFNGLLL4tDd+UwH1vb6hxVcCJsPtC+yt5m4aJqUjdldwyxujAJOSemijNTHOws=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9641.jpnprd01.prod.outlook.com (2603:1096:400:195::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 09:25:56 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 09:25:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, biju.das.au
	<biju.das.au@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Fan Wu
	<fanwu01@zju.edu.cn>, Vinod Koul <vkoul@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] usb: renesas_usbhs: Fix power-off ordering on unbind
Thread-Topic: [PATCH] usb: renesas_usbhs: Fix power-off ordering on unbind
Thread-Index: AQHc/O3llYTx0wsMLEaUVpR5NWczJrZA4oKAgAAHd1A=
Date: Tue, 16 Jun 2026 09:25:52 +0000
Message-ID:
 <TY3PR01MB1134606FECF599FD27D2BDB3A86E52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260615173912.336408-1-biju.das.jz@bp.renesas.com>
 <a6be40ce-975f-4c7f-a261-18a447e6aeca@tuxon.dev>
In-Reply-To: <a6be40ce-975f-4c7f-a261-18a447e6aeca@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9641:EE_
x-ms-office365-filtering-correlation-id: ad492b62-39a2-41d1-8e84-08decb894301
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|56012099006|4143699003|11063799006|22082099003|18002099003|6133799003|38070700021;
x-microsoft-antispam-message-info:
 OKFeLtOVGFpTuAbXvrGrgtbpxxdmTH1h6Wj8Dqk9L3KoSjdtKHODZzWLV1jmkdBXOGa5rLXHr18Uk61PboMFxm8uOB71+8cYOjmhPdvT0/oZgAwTajpREHAZpFp91+mV/DwqtGlKDafyYp8ZK6HW66CBdiMZEuCXz/iRaPbiq4A5NHwszND5Zt34XCJcmecIvJA/t077dz0WQLH4c66blEwB1WDcCCuPXMDQOm2ACzNbiSPsqfV7vxg0MIC0mY6SIPn37vNzeFP0wmQXBtCq9lTR7IY3RiqomSpWUoPQ7mfQlw44kOtqBgyxAtwg9YYD0MO46D613snwG1LUNmlc7SDuaBCWmEIigwzEVK3JFY/l2311L4Y162B1Kug8o+0i5bEhOrPlfe/E+YneRnSdkeZWLN5mvbbn4+f6xEcS2hLvNdY3YcFZbd/aY1JR5e9IUFPfANLqEGijQGUBOt0K95RtcLLPQmS7M2LTcTsM77L1ReToRizYzZ655yRdKQ76izUr84/ved7N0Dw8gi2F7yWyPUn6rqeNLdhhEwujDCImID9zUKb9mI0gRJBuRMDoSl0Z7tH/F5+N5cCTjxFZO/DegD9H+7B95TQOWFDHgzLkna5Awkuh4A5uqGiysbGA2huYiQN9V7iZmdE5vNQKRuYpqb6PZnE7l2ueYxmkHeuDbc+i0/sauabEkGAJEJt+Qfz2m9jb0lrywHlz7e0qNvbq92h8Wg/2QD5PWPi+vh2YFubzeTI8pjU5Qcb0yzia
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(6133799003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q042R3MxL2pYRHkxR2M5a2RzMGFsaTJoYi94ZVo5ZFRnQmhLVmRCdzZYQTZs?=
 =?utf-8?B?TkFheGhhUTZYbWdaY3lMZ1VMYkxObHpQV0liUjcxQy9QSFlLMXZXVUhGRE5o?=
 =?utf-8?B?akpIcmhRellMaFZEMU9kUitpS0pGMi9YekdPZDdEU2hncEhwM2czN0ZoTHBh?=
 =?utf-8?B?d2t1a1h6WjA3bElNTnRlVUJIUmpBbHRiYTIzaGRCU08ydGxWWStGd3lVQ1gz?=
 =?utf-8?B?QmVSdGJnQnM1U05PUHhrMGxOdVF0VzdqNjhJUkQrRzY1WjFVaVpNZjhrcFN0?=
 =?utf-8?B?eDBTakZJTWdCdThRVHNRMEtBQTREMjBWZHZZb01BVWtYQjY3S3RzK2Y5ZStx?=
 =?utf-8?B?VTJsNmFMeGx3aloxc3FLdVVyQ0dMWnRIbWd0UjBVNzU4UlNHVGFwWUNtZTYz?=
 =?utf-8?B?a201UHNFQjVHN05DVVFBaERSNHhNa01LOHlKOHprRk1iZVpheitycTVDSERL?=
 =?utf-8?B?VFI3WHM3WUFoZjYrdGw5WjRLM09Xb2laSWVMZFRzd1ZyVmt4N25iYUsvWlV3?=
 =?utf-8?B?T1dXdlpSdTFnNit1QU9mdk1wV2dhNXdRLzhVdHRvU3JUOXNLdTRyUzV2dVJH?=
 =?utf-8?B?RGhnTGFxR1hWTk1scVhzc3NBYTNiRGNjd3p2RWozWEJSYmFpRnp2d2VUQm5t?=
 =?utf-8?B?ajR1VGpDNTlscFVza1RreXczSXhOVmViZzcwVVY0TEgvdG1qUmNsR0tvTGxI?=
 =?utf-8?B?aytCQzBKK3BDN0tNcmNHQ1I5N3JZNFp6Y1Q0OFRkSjBUOUZTMGZHKzJPaHB6?=
 =?utf-8?B?OGdNY0grRTRTSm5FNVdQbXRDbURmZGp6eDJ3NGt4MEdkK2hVK04zWWNLTlJa?=
 =?utf-8?B?TDlSTmVxZThsNENxSlZYRGxSOHpoZHRSVTRnb1krN1A5WmFjQ2xLb0krWVBX?=
 =?utf-8?B?RytlZ1FPRXMxM3Uvc21qK2FxQklzV1BjTkJxVnpSNDFnalQ4Z3ZaVVN4NTZs?=
 =?utf-8?B?U2NuMFlPNyswOUt5dmQ3bHZ0VkJjVUplRFBpY202blRWRDJSY3BzT0dmNThi?=
 =?utf-8?B?Q1IvWmV4a25lT3JDVEZ6SXpXWjhwY1cveVYxSjVxVG5tNTdFTlBWcmtaOEtO?=
 =?utf-8?B?WDQxeEg3ak5WMTU0alh0bTBaSW1EUldBM3d5amo1YU5acFJ2dUlIRGFEeUtH?=
 =?utf-8?B?SEhETUFRZGJJcXRIZCtSVm16QTRuU0hhV0hsM0RwSlNCQzMrVkhMQkxnTDY2?=
 =?utf-8?B?U2cxZHpKRGNHNk90NFhjWnFYYU8zRE1YUGZPVi9aZXdxcC9TWlRkdVFxRm1a?=
 =?utf-8?B?K0ZmMGczbUtYSXp2cVNRVGtOY0Jzbk9uQ0tnQXlIcTdUTksxenRUM29ud0VS?=
 =?utf-8?B?ckVEenZjM3czdnF2WTl4dFRNOFErcGM2SVpuck9aTk4zMXpmanhTK0oxdXlF?=
 =?utf-8?B?d041ZnNEelp6amJNVm5wMDI0djh4eTFUNXBBNUY5MWlhOXJmc3g1M01qL21Z?=
 =?utf-8?B?ZDYyc1BDMXNVMWhDa3FaZDBuWjA2RnRSNXIwU05ZM1gyMHNiRFBpMk9QVHcx?=
 =?utf-8?B?ZmNkeVg2YVY2L2I4MTh3STNKcXh0OHltMnBMTklMMnRib1NHRjlwckt6ckI0?=
 =?utf-8?B?VFlCS0ZhT1YxZE5qL09uSjF5TUtCazNqY2Y5MVVVRlVqekJJR2dESzI0dUdr?=
 =?utf-8?B?bHlNWXQzZzNJNkZ1ejZhNXdGSUVGTEcwZU13dHlyMCtXM3FrOTlTOXcwbS8x?=
 =?utf-8?B?V2EwcVpNelg0dU5JNXZSMzZRWXNrcmlIRTkyQkVuR1VIZUhjb0FRUmcyREhM?=
 =?utf-8?B?YnhKOXowcEJrQWJORmFmbFZVM3hTUmRNWko2YXJ0MS8xbDVBV0NKNnZIdC9L?=
 =?utf-8?B?OEp2WGRod0VwcGd3WFR0L0dLTDVscEk3SDZVQ0h5dFhOTDNCSDhnUzJZeVdT?=
 =?utf-8?B?RjVMNE15TTFhV2tzcC9XZExGQ3NwQmc1KzZoYzExK0lVYjBjVVdvYUFadnBY?=
 =?utf-8?B?ekR2ZTZ1bTNQYkc4dnM4bTU3WGVzclBZVTFtb2l0dnJxUFRISE1GUkJ6dzh1?=
 =?utf-8?B?VjRBWkMreloxQkx4M3c3ck9UMXloVUdXVGNTZlIvRHhmVS9IL1ZRMmNZenF2?=
 =?utf-8?B?Wk1kV3pRVWpyd2x5aGxhallNOWNSRU5aN3drK1NlSmJYRFRwaHRiTkhYUTcv?=
 =?utf-8?B?ckVKc0RGT05NSVdqSGUvd0N3MUtqWWMzcXlUZmFUSFBRNC9GeDQxVklRdkJO?=
 =?utf-8?B?dzJ3di9OUlBLMFRCRzlJN1c3b0ZKd2NTYW9lbHNCUitNTVJXZnRHWjBIcXBJ?=
 =?utf-8?B?MnlLZ3dpZHA3MEVGYVVSbkJhbkhDVVdReGpLKytWQ2dnVjNKblRaeDJzQU1H?=
 =?utf-8?B?aUU1MDN1L2RiWFhwbzROcldRZ0FIQWhqRStvbzdpcFJ5VFhMUCtrUT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ad492b62-39a2-41d1-8e84-08decb894301
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 09:25:52.7948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LGTIC8Kw1WVIcxDy7iPF3rS9LQ/CpDlIQYGDZcwPU/iEx9k7vX51hmxmlNq3Yri0VIwdJjZ1pZq+6wv+le6I1/NLJKkMX39vuYwZIKy/Umo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9641
X-Rspamd-Action: no action
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
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:biju.das.au@gmail.com,m:gregkh@linuxfoundation.org,m:claudiu.beznea.uj@bp.renesas.com,m:fanwu01@zju.edu.cn,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34060-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[tuxon.dev,gmail.com,linuxfoundation.org];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,tuxon.dev:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,vger.kernel.org:from_smtp,bp.renesas.com:dkim,bp.renesas.com:from_mime,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F5DC68D85A

SGkgQ2xhdWRpdSwNCg0KVGhhbmtzIGZvciB0ZXN0aW5nLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5k
ZXY+DQo+IFNlbnQ6IDE2IEp1bmUgMjAyNiAwOTo1OA0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSB1
c2I6IHJlbmVzYXNfdXNiaHM6IEZpeCBwb3dlci1vZmYgb3JkZXJpbmcgb24gdW5iaW5kDQo+IA0K
PiBIaSwgQmlqdSwNCj4gDQo+IE9uIDYvMTUvMjYgMjA6MzksIEJpanUgd3JvdGU6DQo+ID4gRnJv
bTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gTW92ZSB0
aGUgdXNiaHNjX3Bvd2VyX2N0cmwoKSBjYWxsIHRvIGJlZm9yZSB1c2Joc18qX2hhcmR3YXJlX2V4
aXQoKSwNCj4gPiBzbyB0aGF0IHVzYmhzXypfaGFyZHdhcmVfZXhpdCgpIHNldHMgcHJpdi0+cGh5
IHRvIE5VTEwgb25seSBhZnRlcg0KPiA+IHVzYmhzY19wb3dlcl9jdHJsKCkgaGFzIGV4ZWN1dGVk
LCB3aGljaCBjb250cm9scyB0aGUgUEhZIHBvd2VyLg0KPiA+DQo+ID4gRml4ZXM6IGViOWFjNzc5
ODMwYiAoInVzYjogcmVuZXNhc191c2JoczogRml4IHN5bmNocm9ub3VzIGV4dGVybmFsDQo+ID4g
YWJvcnQgb24gdW5iaW5kIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMu
anpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL3VzYi9yZW5lc2FzX3Vz
YmhzL2NvbW1vbi5jIHwgOCArKysrLS0tLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Vz
Yi9yZW5lc2FzX3VzYmhzL2NvbW1vbi5jDQo+ID4gYi9kcml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhz
L2NvbW1vbi5jDQo+ID4gaW5kZXggOGM5M2JkZTRiODE2Li42MTRiNzI0YTBlNTIgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24uYw0KPiA+ICsrKyBiL2Ry
aXZlcnMvdXNiL3JlbmVzYXNfdXNiaHMvY29tbW9uLmMNCj4gPiBAQCAtODEzLDYgKzgxMywxMCBA
QCBzdGF0aWMgdm9pZCB1c2Joc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiA+ICpw
ZGV2KQ0KPiA+DQo+ID4gICAJZmx1c2hfZGVsYXllZF93b3JrKCZwcml2LT5ub3RpZnlfaG90cGx1
Z193b3JrKTsNCj4gPg0KPiA+ICsJLyogcG93ZXIgb2ZmICovDQo+ID4gKwlpZiAoIXVzYmhzX2dl
dF9kcGFyYW0ocHJpdiwgcnVudGltZV9wd2N0cmwpKQ0KPiA+ICsJCXVzYmhzY19wb3dlcl9jdHJs
KHByaXYsIDApOw0KPiA+ICsNCj4gDQo+IE1vdmluZyB0aGlzIGJhY2sgaGVyZSB3aWxsIGxlYWQg
dG8gdGhlIGlzc3VlIGRlc2NyaWJlZCBpbiBjb21taXQgZWI5YWM3Nzk4MzBiDQo+ICgidXNiOiBy
ZW5lc2FzX3VzYmhzOiBGaXggc3luY2hyb25vdXMgZXh0ZXJuYWwgYWJvcnQgb24gdW5iaW5kIikg
YmVpbmcgcmVwcm9kdWNpYmxlIGFnYWluLiBJJ3ZlIGNoZWNrZWQNCj4gaXQgb24gUlovRzJMLg0K
PiANCj4gSW5zdGVhZCwgdGhlIGJlbG93IGRpZmYgZml4ZXMgYm90aCB0aGUgVVNCIFBIWSByZWd1
bGF0b3IgV0FSTl9PTigpIHN0YWNrIHRyYWNlIGFuZCBzdGlsbCBrZWVwcyBhd2F5IHRoZQ0KPiBj
cmFzaCBmaXhlZCBieSBlYjlhYzc3OTgzMGIgKCJ1c2I6IHJlbmVzYXNfdXNiaHM6IEZpeCBzeW5j
aHJvbm91cyBleHRlcm5hbCBhYm9ydCBvbiB1bmJpbmQiKS4NCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL2NvbW1vbi5jIGIvZHJpdmVycy91c2IvcmVuZXNhc191
c2Jocy9jb21tb24uYw0KPiBpbmRleCA4YzkzYmRlNGI4MTYuLjg0MzQ2OGQ0Mjc4NiAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy91c2IvcmVuZXNhc191c2Jocy9jb21tb24uYw0KPiArKysgYi9kcml2
ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL2NvbW1vbi5jDQo+IEBAIC04MTMsNyArODEzLDYgQEAgc3Rh
dGljIHZvaWQgdXNiaHNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+IA0K
PiAgICAgICAgICBmbHVzaF9kZWxheWVkX3dvcmsoJnByaXYtPm5vdGlmeV9ob3RwbHVnX3dvcmsp
Ow0KPiANCj4gLSAgICAgICB1c2Joc19wbGF0Zm9ybV9jYWxsKHByaXYsIGhhcmR3YXJlX2V4aXQs
IHBkZXYpOw0KPiAgICAgICAgICByZXNldF9jb250cm9sX2Fzc2VydChwcml2LT5yc3RzKTsNCj4g
DQo+ICAgICAgICAgIC8qDQo+IEBAIC04MzIsNiArODMxLDggQEAgc3RhdGljIHZvaWQgdXNiaHNf
cmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAgIGlmICghdXNi
aHNfZ2V0X2RwYXJhbShwcml2LCBydW50aW1lX3B3Y3RybCkpDQo+ICAgICAgICAgICAgICAgICAg
dXNiaHNjX3Bvd2VyX2N0cmwocHJpdiwgMCk7DQo+IA0KPiArICAgICAgIHVzYmhzX3BsYXRmb3Jt
X2NhbGwocHJpdiwgaGFyZHdhcmVfZXhpdCwgcGRldik7DQo+ICsNCj4gICAgICAgICAgdXNiaHNj
X2Nsa19wdXQocHJpdik7DQo+ICAgICAgICAgIHBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2
KTsNCj4gICB9DQo+IA0KPiBBbG9uZyB3aXRoIGl0LCB0aGUgcmVzZXRfY29udHJvbF9hc3NlcnQo
KSBjb3VsZCBhbHNvIGJlIG1vdmVkIGFzIGZvbGxvd3MgdG8gYXZvaWQgYWNjZXNzaW5nIHJlZ2lz
dGVycyBJUHMNCj4gd2l0aCB0aGUgcmVzZXQgbGluZSBhc3NlcnRlZC4gVGhlIGZvbGxvd2luZyB3
YXMgYWxzbyB0ZXN0ZWQgb24gUlovRzJMOg0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNi
L3JlbmVzYXNfdXNiaHMvY29tbW9uLmMgYi9kcml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL2NvbW1v
bi5jDQo+IGluZGV4IDhjOTNiZGU0YjgxNi4uNTFkMzAzNWY4MmJlIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3VzYi9yZW5lc2FzX3VzYmhzL2NvbW1vbi5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL3Jl
bmVzYXNfdXNiaHMvY29tbW9uLmMNCj4gQEAgLTgxMyw5ICs4MTMsNiBAQCBzdGF0aWMgdm9pZCB1
c2Joc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gDQo+ICAgICAgICAg
IGZsdXNoX2RlbGF5ZWRfd29yaygmcHJpdi0+bm90aWZ5X2hvdHBsdWdfd29yayk7DQo+IA0KPiAt
ICAgICAgIHVzYmhzX3BsYXRmb3JtX2NhbGwocHJpdiwgaGFyZHdhcmVfZXhpdCwgcGRldik7DQo+
IC0gICAgICAgcmVzZXRfY29udHJvbF9hc3NlcnQocHJpdi0+cnN0cyk7DQo+IC0NCj4gICAgICAg
ICAgLyoNCj4gICAgICAgICAgICogRXhwbGljaXRseSBmcmVlIHRoZSBJUlEgdG8gZW5zdXJlIHRo
ZSBpbnRlcnJ1cHQgaGFuZGxlciBpcw0KPiAgICAgICAgICAgKiBkaXNhYmxlZCBhbmQgc3luY2hy
b25pemVkIGJlZm9yZSBmcmVlaW5nIHJlc291cmNlcy4NCj4gQEAgLTgzMiw2ICs4MjksOSBAQCBz
dGF0aWMgdm9pZCB1c2Joc19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4g
ICAgICAgICAgaWYgKCF1c2Joc19nZXRfZHBhcmFtKHByaXYsIHJ1bnRpbWVfcHdjdHJsKSkNCj4g
ICAgICAgICAgICAgICAgICB1c2Joc2NfcG93ZXJfY3RybChwcml2LCAwKTsNCj4gDQo+ICsgICAg
ICAgdXNiaHNfcGxhdGZvcm1fY2FsbChwcml2LCBoYXJkd2FyZV9leGl0LCBwZGV2KTsNCj4gKyAg
ICAgICByZXNldF9jb250cm9sX2Fzc2VydChwcml2LT5yc3RzKTsNCj4gKw0KDQpPSyB3aWxsIG1v
dmUgdGhlIGNvZGUgbGlrZSB0aGlzIGluIG5leHQgdmVyc2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0K

