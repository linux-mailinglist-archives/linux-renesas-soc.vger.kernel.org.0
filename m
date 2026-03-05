Return-Path: <linux-renesas-soc+bounces-28871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFkhBz1oqWkp7AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 12:25:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E702108CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 12:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6A24306BD05
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 11:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2575938425F;
	Thu,  5 Mar 2026 11:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OAEdPZy2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1167B23D7E3;
	Thu,  5 Mar 2026 11:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709928; cv=fail; b=VXyLNoKTQyxowgyQUkpvBXE+CTvXt/Oc1EGgf4fvEXY1il5c30cj486avJQenlIz6BqlslO/nShX5CFdVA6rtVnx9rkdf0DXaqAvs3PITRNNgCqGSW6HUkVGlR888x3KQEOvVML/fXahfES10YFPIkEyuSPJscttFy/wC1Wv4ag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709928; c=relaxed/simple;
	bh=beAaldgcAUaWSb0pdVxN1bUecJgDRMl8JACDt+JGBFU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PywMAhOIM305Lty9TP1AyB1vCbuPiZE0IjRY+UlYoRj4nlJjOC7gpNrJ1k/NikZ9OKtXBDWyWXXO39dM0rPXHse7zXnnL2HW2X5m8cTpNGjIdfOMryRlxHgHx2AoKkBEMyclJvAeGrTGURY9Ukbus040plqGj6MjRCgTCYoy9b4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OAEdPZy2; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csSjoA46y2VSdWK6GoBo+itYKHedZq2HeLQ8v+89dfGV1PxI3umA1iux1cbsHTUjuv5AB56+L8SiWyli3amUK6QErBIwteDqOFCRKvBMGlso/Bt9ac2/X/JYDq8CqGxwmztHTK4CPmZzTM9bJvVTuWr2Zj2yxWyJ27jjQGQdKIlmslJ/6Ik0GtRLKOnBSKzHBd1EJbkDX195UQAho0Sx1lah6vhh+sCg9GPSRkutH2+m2NemFabh1Zbat5bVhC2q5tryPVo9Md8yz+IYnLu/POAArBe3cYRPPJMqHzzSYCO+8mWSeHoRg1S+Y7g6eDXZWCSDVhypHNnu3gTNxlQ81A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lQ4vExV58mTZfpKPDtd1O68AvqN7WqinrfZuswS5WU=;
 b=jjC2nZvDEJeTm3f9L4HVVAH9odNWOCNX/LRB3g9tphLrxGccX1lkPSEnGfVOGhYYEYop4uohIR9+Ntx6rDaYEMvN1Jfu0l1s6aTGFNn0mOh9l6qLqtR3cPnsjsoS4qAZh9IM5h+KuoOWNrPG9ia3vX8C2D9QGpnTC34eEIopt7rNgQB5+job/gFRerEgeDmCwTr0H1Xm+W+D9Mxf96VfN3n6iYN/vCpwJKOBwHir0L7wzXzTSFA7oebRTX48odSPoVbFjU07ZPq/t3zXdF4sdkVWQhOEQQtneQFMh6/igrc1J6OyB/v1YFmFk2DpIsNsV5UoMsjelNWuwu2F3Ive+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lQ4vExV58mTZfpKPDtd1O68AvqN7WqinrfZuswS5WU=;
 b=OAEdPZy2oHEI3sG11lcXSBO2o/5r/vnYdOzsORprhb3P/Dl/ToK0eiYDO4r19+kERG4mklkaXXSW7aoOVIRUslJNtNub/ItG7d1lyRCTgJdBtGibmjzB5jKSdSoLTE1SfVSmyYG7AF4u/2w8fA70avHS0TUcGfwzweJ4TS5t0Tc=
Received: from OSCPR01MB14315.jpnprd01.prod.outlook.com (2603:1096:604:39f::5)
 by OS3PR01MB10407.jpnprd01.prod.outlook.com (2603:1096:604:1ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 11:25:22 +0000
Received: from OSCPR01MB14315.jpnprd01.prod.outlook.com
 ([fe80::66f:fac9:2ef6:9796]) by OSCPR01MB14315.jpnprd01.prod.outlook.com
 ([fe80::66f:fac9:2ef6:9796%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 11:25:22 +0000
From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Jonathan Cameron
	<jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
	=?iso-8859-1?Q?Nuno_S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
	<andy@kernel.org>
CC: "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] iio: adc: rzg2l: Convert to FIELD_MODIFY()
Thread-Topic: [PATCH] iio: adc: rzg2l: Convert to FIELD_MODIFY()
Thread-Index: AQHcrIjLFfhqgmI65U23BWHkYu5ThrWfzAWQ
Date: Thu, 5 Mar 2026 11:25:22 +0000
Message-ID:
 <OSCPR01MB14315890194F50E0B51EBFF48AA7DA@OSCPR01MB14315.jpnprd01.prod.outlook.com>
References:
 <d42ba403c1fb1aca88b82ba3020ad0ec442a455f.1772705608.git.geert+renesas@glider.be>
In-Reply-To:
 <d42ba403c1fb1aca88b82ba3020ad0ec442a455f.1772705608.git.geert+renesas@glider.be>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSCPR01MB14315:EE_|OS3PR01MB10407:EE_
x-ms-office365-filtering-correlation-id: c3dc1d13-366e-4f56-987f-08de7aa9e3ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 s7CE1IOGDLwtJZaEZLuKVAiXEMnNQFYUwlOe5NOvWcp28wXHp0xDgWKIo9zn90NkDTlSxj8xg2EnoudUYFRmlIvY8J9HOTPTFo53KCvGpZS0Ra4NK/8uYsi9XJWGrxUdirMGv0New6kj4W0MQ5rV+lB/AeR33Ku8c3066U2ET/Fw+LmWXHNEKPaX6g7b/IXQBMr0WKYAOB0cI+0aWHSxpd0Bz5UHDBdTcNIqgrVjX8O8XXIiJGjmYKlqTdnfcMWRQKC67E3DYReoclQ3JwWLbpzxd6zjf5yz177ymNl9Fr4HfWqw2bEJ6RE9Zmhy0V/m53BdVDUJvSNfnSwX+1U9EcssfTKPE9VmL+rAQkLqC1Jd33bGfejDTf0BM47aYJLpS3/tFCdSzCBUCwOM3AM4anNeMPhR/mGk2b/mUgygzERDu06fYRYJ8FyWvQJhp3q9tMWQF4kB9ehiLsG+spGkyBBPRgdf+6RdYw1kzxQHCzCYGVR4LgIxOuRk0NaykmVYhPheHGCVm9lojqEItiwFn97Ms6IRjAtrOo5Zah7xtwRdHVoc8ZggfR23hwa/nfNW/dVCi4BYF+P2Cr+P241F84+wRTqfpiv8vvi1PwDZiUMRiULzNpAIWjqq7GEIxCZbPpesTi+ZbMu/ELg3+0hfCR3iq79a+9Q23B7o9z6g80rxy2VIEOqXInWsUbbysGo7dwh1brTdt17ja8cEfxporvRIp1frPj0oVUTW5tYagjMfvNTOI5gW1Y3xHYeqNvlUUw0zLWtong6ZJwJ+P9K659YtJcxrXMALnYNTI3ARB/U=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSCPR01MB14315.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ghOcru2YySu/6jZLNsCSX/1/0bNllCOZlZhfJTz7Cxv4DSdZ8ZWcTLTn5x?=
 =?iso-8859-1?Q?rWDP5IPaFQSP2rA/FXw5N1pBacyVVkcj8lydeIXg4UQF2CX/RPqwcDX8ca?=
 =?iso-8859-1?Q?xjh31zvueQNoI8z+S3ylcy1qkN7f1W796xjY/AN+LwlKTA/nykh7GamjxV?=
 =?iso-8859-1?Q?z07AGAvFx07XAtnQU3xmrz1kBFTRdV5/tDW6RmLQrXc0d37S3b1J7175Vw?=
 =?iso-8859-1?Q?drYmW3IomalEiJwJlNuW0YzEopV1//DFs4Qzcc/PmhNRrCjKPojvJFwhC3?=
 =?iso-8859-1?Q?2/SltxPX91wPHWKTuzAD06xazkNcmowKhANiMpxRlHHvn85VdkgdIx7Hiz?=
 =?iso-8859-1?Q?5RxlQC5ary5Q2X/bXF+Nshn1iRdvcWEOq7wqhhpKMzeoFaL4HHhLafJA2D?=
 =?iso-8859-1?Q?fDrg+OZqHoPTxaBhgB6BfcpydfZWBCTf/pAk4Al05daJtNLqCiX1ceCUov?=
 =?iso-8859-1?Q?ktmd7OKgNrC9q4a9eXxYGsOBh83Ku0xu38xuHd+QB/1cdCLS9/eCyeYrlX?=
 =?iso-8859-1?Q?BzYt94SaDy/AAvKKuMf+wSNvjIqdjlKziDGFM2y1zR9QUDWDzMkH668EjO?=
 =?iso-8859-1?Q?58FJJOOkJm5ZzEQr9LCSOMjiSlLkxMVPcmwGOHpNqNwS7m6yUE2Jrkz6WL?=
 =?iso-8859-1?Q?9BmpWObHx6PlUjpdojvSzf+XsBHK3Wzgrc843d4+U7Qh7QW9+1m58o5rbE?=
 =?iso-8859-1?Q?9uGAMQy6Kpw8pTGNUhGm6WqV/MBjrwqW44fh/jEpOyW20LkPqoo4pW+s2P?=
 =?iso-8859-1?Q?mHG+pgszCB3lQiwIgAYikukXyStQnQWD0VvsAh8aBdqq2TSfVzsNONQgDV?=
 =?iso-8859-1?Q?V7sFYJy6yK7FQDJJp8nhUcL6hxRe/UEdgRFV1yozqyRPz0pRGiTP9Sfegy?=
 =?iso-8859-1?Q?TANDTxzDsB10scoBNxgQKMKaPtn6wCzvpLHqcG2ETrZ8TX6ELDn74YrfYt?=
 =?iso-8859-1?Q?TKEwP3fpuFAgklZcqczdIGFM57lQgQll5u/OZ7hJAErPDls/lEtbAne/GJ?=
 =?iso-8859-1?Q?nbDf7OUAX5tLZwTxb02mZhvdfJmkTDTnROh03Qp4qjM8pSsaKSd1fCylX6?=
 =?iso-8859-1?Q?zhl4I4qhYCLjro1IEQPWsviKs6oIX1AOllpswa3qjToAUv3o1QHWWOqHkM?=
 =?iso-8859-1?Q?B/9oD1UQKmRX5A7IakqU4SdkpivDDPNR/ck03lsyA6ZzWjGslQNJB3CgVM?=
 =?iso-8859-1?Q?EiK4LkUeMSal6mATWyQFQcOyGY9k7NutoGlRzAp790nLf4PVkjdrqc8v6T?=
 =?iso-8859-1?Q?Q3iMnb3K9bzA+NsnQYKZECEjzTDY0Pdx8cgjHlDXlEIzWkS7aOpXDydNIr?=
 =?iso-8859-1?Q?yjKAxW9OCkH8dCyfU3oA+g+Lc4vmAQKe2f9xNaRXgfVCGhuaERoMbi0f3+?=
 =?iso-8859-1?Q?qTkItTMkgYKSmmaOL/MSAbTLXVpnF6PX05i0e0oneUvLA+sz/GBadVdMfn?=
 =?iso-8859-1?Q?o+YcwwH+b9wLuOVgUEALFqHhLFupmVgDl3uOhDo9K86y/297XNg2uruScD?=
 =?iso-8859-1?Q?y/eLq0FpIwtD8clM/a6KHlmmr5fAPvDHw0LBOoIItTnnGKwT5ktuxs9dpF?=
 =?iso-8859-1?Q?7qqz4Lf5VDsoNOgAhc/nbC+uxayYBq0mrGBFl4hxAP4TLyKXShCb5b6OXs?=
 =?iso-8859-1?Q?eMgKnGdXPPQWjU3Cd38tKjrEgBgCIY2An2QK828TXMbjcqBC2wLIRkvpGp?=
 =?iso-8859-1?Q?vIUnt84tHekLQTTvA5NAPKXwG2LlecQowUt8NdW/ICz2KYcmr8KlLQVkuK?=
 =?iso-8859-1?Q?l4seyIeqTyiZDlOgMt+9v256cogfK6Rl4iozuRe5zTi0NunfTwuCqBISlO?=
 =?iso-8859-1?Q?xkM8cJXPXC0oVbmIIZnLEycU+j4gw6oZ1X2rmCC+2eJ5zDXngdcl?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSCPR01MB14315.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3dc1d13-366e-4f56-987f-08de7aa9e3ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 11:25:22.0520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: chh2nx03N4WxyoNrNFkDlAWMRXufwr1FyoUzl9uXX5PJwSmYxdHwqgvH9nZ0OkOFPIzfepMCDQXghreVsBIbLBofJI22uUYB0bdIt2vYTB2MUrcz7VNq55+8V5YZiD49
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10407
X-Rspamd-Queue-Id: 14E702108CC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28871-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakar.mahadev-lad.rj@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email,OSCPR01MB14315.jpnprd01.prod.outlook.com:mid,glider.be:email,bp.renesas.com:dkim]
X-Rspamd-Action: no action

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 05 March 2026 10:14
> To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>;
> Jonathan Cameron <jic23@kernel.org>; David Lechner
> <dlechner@baylibre.com>; Nuno S=E1 <nuno.sa@analog.com>; Andy Shevchenko
> <andy@kernel.org>
> Cc: linux-iio@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Geert
> Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH] iio: adc: rzg2l: Convert to FIELD_MODIFY()
>=20
> Use the FIELD_MODIFY() helper instead of open-coding the same operation.
> This requires splitting the double OR operation.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/iio/adc/rzg2l_adc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
> index 1010e0511b3e09c1..dcbe112efa863419 100644
> --- a/drivers/iio/adc/rzg2l_adc.c
> +++ b/drivers/iio/adc/rzg2l_adc.c
> @@ -401,10 +401,9 @@ static int rzg2l_adc_hw_init(struct device *dev,
> struct rzg2l_adc *adc)
>  	 */
>  	reg =3D rzg2l_adc_readl(adc, RZG2L_ADM(3));
>  	reg &=3D ~RZG2L_ADM3_ADIL_MASK;
> -	reg &=3D ~RZG2L_ADM3_ADCMP_MASK;
> +	FIELD_MODIFY(RZG2L_ADM3_ADCMP_MASK, &reg, hw_params->default_adcmp);
>  	reg &=3D ~hw_params->adsmp_mask;
> -	reg |=3D FIELD_PREP(RZG2L_ADM3_ADCMP_MASK, hw_params->default_adcmp) |
> -	       hw_params->default_adsmp[0];
> +	reg |=3D hw_params->default_adsmp[0];
>=20
>  	rzg2l_adc_writel(adc, RZG2L_ADM(3), reg);
>=20
> --
> 2.43.0


