Return-Path: <linux-renesas-soc+bounces-25065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC41C8097C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 13:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86A563A77BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 12:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9979E301036;
	Mon, 24 Nov 2025 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AawwaXM0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F63301016;
	Mon, 24 Nov 2025 12:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988662; cv=fail; b=oPzGvmWipgQebTZPqOQ6kTI4h/3CcwuZBRU8Q2PkqiUtLE8+YhbVgElWCFndZcu+ueQGbHZfM8EzAAmJemcWIYxmf/O3hUdIdAS8vYKfeb8kDscR2GLnPK5TPZ7aAZYcMfQvbrjmjggmKsOi8bw8NW1FOASTvg1+w4vCYHiKL2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988662; c=relaxed/simple;
	bh=fNiG0e/ekYWtXcYm3+ToiG6585QPOOM3r8X++ZZ1aMs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H3zus62rapFB58D7LQT+vo7DzHJiOtYJdql+rRowtpVGi0HfdBs9eoPaXCOo3/Qg+ON1WxFiHnrYTVcWni51BHeNj7pXgp9rUr6dDpSOYxL/bH+ETRD0wFpFiwjtJKxdeUuGiNzLNpMxgqElMND8Xitacstkr7KTw+yLAXBnHME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AawwaXM0; arc=fail smtp.client-ip=40.107.74.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzNQsIFcFIqCXQGgXvqGobffPtri01esIYQBzFq9BSEkXjthaKHeI4Z4B8QsM0aN1fXWrgb7QE9ji2yaRnDOHjxVLBAIlcE4CjUK2Py/2RegIKtH+tdavC8sAWDo1E6wFoJ4Dsih2W+R2iuRKuAoAhtI49tBqt0Q8z88/3I4kxryuyTKDUy3a+qMxwnEUV1nY+EJcoHLMl5Qr5D8OHEsCZZHBgKDUuv1zwsNNlnVoUr/UTJRsWKCNJQsChgXsPaJi6YKj4IHCWN+AgRd5iMwWSqoli/XFwtuAI2/dgIbDN3Uy1lYtT3A+GWSXChpkQunTmkeH1Ts/dmVFZ7Gms5v9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ode0K18MOaNTda/AkMRAODdu7O1wi40S/YUwSLuLGYU=;
 b=et1v0yb5ultbRhfX6nvjht0VpatIzHt5BLCU+7+2Y8xhD503CXSFA9eVmcUhuqgbFNjKUFBDjIZql4FjaxR4C32xuiQbWS4GzaSxaHBBqHHzkRFIc8+qboraMmqstiOjhDGZFECGxGvV7BFsWu4lKLjYh9N1Ufkj+K67x0ZfAp6Im7P/K0xJwexdFZP5qQQw4bN0p96+pwV4dJ1zeNWrcPMDyHrTOBIGl5He/3Wnnoo7vM8UtUvr6HyxFdszYtrEIXq6DbwcZsvflDB52lWmZrOiHtqRqZsSm/W+y52xo6U3QL5WvwyLx6v7b/cjIyDHFHCyykc55ZWTmbSV5xjN+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ode0K18MOaNTda/AkMRAODdu7O1wi40S/YUwSLuLGYU=;
 b=AawwaXM0o+cXTu/MoW9TtbUU1O+/oKZ18Ysj9knQZYdukcTG6jp4wQRXX7Cj0NJuaLY7gZHerW8Ngct0b9PI7YXUmZ2lyd1JeU6QIfW7mVokblaOCEuhGKzAJGNH73VUif/Hmp7O+XCw74Wq6IW8UFtj049d1JlryD/xm+bBEUs=
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com (2603:1096:405:1a6::6)
 by OSZPR01MB7793.jpnprd01.prod.outlook.com (2603:1096:604:1b2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.9; Mon, 24 Nov
 2025 12:50:54 +0000
Received: from TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29]) by TYYPR01MB13955.jpnprd01.prod.outlook.com
 ([fe80::52be:7d7a:35ec:4b29%7]) with mapi id 15.20.9366.009; Mon, 24 Nov 2025
 12:50:46 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller (ICU)
 driver
Thread-Topic: [PATCH 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller (ICU)
 driver
Thread-Index: AQHcWtghbawqYjnook+9mPCVu+E0SLT+2zEAgALiuHA=
Date: Mon, 24 Nov 2025 12:50:46 +0000
Message-ID:
 <TYYPR01MB139556A313B1377F9306A7F6485D0A@TYYPR01MB13955.jpnprd01.prod.outlook.com>
References: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251121111423.1379395-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <87see6hxjb.ffs@tglx>
In-Reply-To: <87see6hxjb.ffs@tglx>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB13955:EE_|OSZPR01MB7793:EE_
x-ms-office365-filtering-correlation-id: 1d016a3b-b8a8-4b06-24e2-08de2b581652
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?svFy5grp1eL0S7KMweWaxLxhn2exBScMYUITImADq3pwMqMbYVhEdImsYP6K?=
 =?us-ascii?Q?Yimmd8fayUqzMdSEDpmmWo4D+LiMNnWuLXcmUV2jOyhCmVdMqDpUtyvP7iNp?=
 =?us-ascii?Q?a8PuHmkGPap7aGSrSI0blO1CL7j/IFnBAEH/4T+a3xJQ8/MeGovcrzqVWyTc?=
 =?us-ascii?Q?XHk4g5HOWxfGYuSXCKcsBH0kSabtbkwQ4BlucnO+oUZDZsKLCVmTzczDbiQo?=
 =?us-ascii?Q?1D9cZcfDBOfPy6uYTxnuv/B7ekv0fzUSRnv6tyd7iSiPXH+leTrXRASpv/Ts?=
 =?us-ascii?Q?v6CJFJSBrLlyTDE7oyIRzS2hPtPv5+yHOLw6ImP2WykpcB+sRcIqkew1ONtt?=
 =?us-ascii?Q?hNkO3F98Ls10rziCdbHkf1IXz+9Eft5G6z4nJfZX0YWxIY23GaMFBqeLxrkq?=
 =?us-ascii?Q?cNPR1JAZmyVo5DCR1yQgxePB3S7oYFF5YkHC7OONab1o33SAc25uizO5qVuE?=
 =?us-ascii?Q?d6yODOhIu1VHvXnYoMMfuopluvOpA2PdKeY+tWykKECq0ByJtOubrDPgprtW?=
 =?us-ascii?Q?Sv4W5WA6yJ8mrXQWmCtdakNAlol1S3Pdp1cCbiNELD/d2Ikih2WltmPG14uQ?=
 =?us-ascii?Q?zTRiypfS0KtkMu0sGFYBptFbC4lS7+G5qBRki7Bax1VJ+kaZ8oUCpmTB5HTC?=
 =?us-ascii?Q?qS6ETOoKuzPlhM4ae56OEtdPX+6OUfMiDAUff7nLLQeYaDHgKK3k++uZDLeS?=
 =?us-ascii?Q?j20JFM27/FF4XhxjQeFpNm2skoaO0zjwIGJXhquZio4zd1mA+pPqGP8ZgLz2?=
 =?us-ascii?Q?uQONnFCAhyGQF+kObV9o1LY28cYG6uGWrHWBRFTyURtgoxszm3GMdz8ErWFR?=
 =?us-ascii?Q?RjfYC0BbGd7b6njjLOoTYnQ+eH7bzOICflxWt6GghixceBLkKaKGDC5n6C8a?=
 =?us-ascii?Q?phNTRPUWlouMA9092pr5h6utLaZVFQRgmRHipwaNlKLNcWAz/ASzPFz44qQY?=
 =?us-ascii?Q?RKvPNjPeURlvUsI9FLzoh/2J4ZWt8/Ljo1U3qm24LXvitmLxC6FaBXalBHAC?=
 =?us-ascii?Q?cLz5jC+Izg3Fq4iKXSifSZw28S91zg6KuJwVbP2y9fTJquTQuAOh2Q/NkPYU?=
 =?us-ascii?Q?PF8kltadq6ZpOsw79CaEV5u9vi9lTmBemElAdC9hGXJ8gcawvRitO3O5iA8M?=
 =?us-ascii?Q?Hz5GurRRJlfv6q/Enek01qZZH2s5rBIsu2n2qNnWWSyyu89ybPhI7hlTX8xV?=
 =?us-ascii?Q?E/lZs0ohTtxxB7F9xg5lzboDFbIWMRVTN0YMG2dkJ5UwxQPUXcN9Xw5b0Uqy?=
 =?us-ascii?Q?G/gv1F+BeTkFSUri9ijo3jvnvGUiWi09RmvvB5brChnXe0P3eJ9029VE2xvq?=
 =?us-ascii?Q?3prv5Z9ao8FOz2MEI/cOvn8pnjlCMNcpKAQxsRQACZ+9DR5f6udZs6qdqEWS?=
 =?us-ascii?Q?+A2NmKkZnnnY7vCCAgs2RuuYF31JsXHWxCnnZqd2oI334hRgl3MIeptFMBCF?=
 =?us-ascii?Q?Uos52u35ICk9omE4G3tNArYcyXXRaSk/fzowrMouCJnumcjG9unAeSf+ajpy?=
 =?us-ascii?Q?Rs9dOhyTuwYEZT7qc8OP2SH9msth5mF5KRSp?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13955.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?uBkc8jDq/4jQRmK00Kr3idSPvdUbNxq58jaKxQclMwaAIbx0JOwWAEVPiaqp?=
 =?us-ascii?Q?729/XE0u05iQzePTEf3TxJ6zrj3q0WC3Hh5B4TlVGEZfJYaAX/oDKWcDKUA8?=
 =?us-ascii?Q?BofPJvGbKbFxWN8nCJBLrq4fQxzD/zCuj1wEiKSunHpFld051OX+qgGBGAo/?=
 =?us-ascii?Q?wi4/1Dzs5IQ9wSQow+mZaQI9ngZLiC480km4YxHJrpb65jPeA+Kga0s4gEi3?=
 =?us-ascii?Q?MXkq41Z9MMb/WxqXhTfNwQMvKdphexCHCEOzhFscya+7LPpVIkX4fFAPyvOQ?=
 =?us-ascii?Q?n3FVfjBcd1hJVjDJ3kkoe/5uU3SFJFK3k70O9BMdCHr1+Wsdo8MebMZ6rjxA?=
 =?us-ascii?Q?DBXVmm4nKsUMbk6mveFS19kf+UjNU/TiK9Z7Gdn0PU7MfFj+Q1gy7QKR7/T0?=
 =?us-ascii?Q?D7GhbPfCPPdAOO69KpziekW3UX+gocaWvKnonntlNuE5CgbSc61p2fXjp/Kr?=
 =?us-ascii?Q?6CG+nbXSc9LLCr7fs+Sp5ABG18QCt+4EsGCZPLOBV3ZqYBx85fTNqmHAVu6x?=
 =?us-ascii?Q?T/WM+zEueSZt5dumKq/VZRjvXxmrOHGx/6nAVAkOc6A8aMILxWSLAR68qlv0?=
 =?us-ascii?Q?RsXe20kyfuz8UdIxqlD9UgfD9G/3SAKk3/u19XreFt3iDJ3R5+u8EyhRLVwI?=
 =?us-ascii?Q?9KKkeHddv67JlLcCSRo6LDPN9Nzh2oBCVlg5uiwjWxph8gLLorVvvMNIQpgS?=
 =?us-ascii?Q?ttsPjvIIYq2xUwRtScD1dDFiMkLHqFZgMYPoUBTLME6HMiZnLHduhjPpgneL?=
 =?us-ascii?Q?y74pbmDZ8M5QQjfnRkvFAPGB3infuW30+YdD6+o0EDKjzYb/HpRzHmaL1AJY?=
 =?us-ascii?Q?dtASRG90ULgQ1RYGqEvF11qpoBlEZwUyB6gc8F+9h1O7S6NdhyikqxIPSbam?=
 =?us-ascii?Q?onbpe/z6+aSlotVSrfhEImqQigWMrVCUzVBVKRyDsf1KQaPyupJARmKYZoX1?=
 =?us-ascii?Q?ez0R2wGdfK5I/kQGeqoIuJVnWwtb3bQ8EvgTf3xKooKF6/A9ldqiwrUEd3TJ?=
 =?us-ascii?Q?7RGhZbUyt7KlFnLtcek1urTF9EXYOu1WJS0IQaBxup2oTRFxnxOqGu5Xyf+i?=
 =?us-ascii?Q?TcNI1VEQNjKVUCVxuB7ncL3iIv4hYKfuEzZUWjibkZXwY5fo2T13vuqCPhbM?=
 =?us-ascii?Q?mI1PpHr4ksEM2Oda/bw6y0QTmo++OIBJ4182vUlLtQ84cT7xwCg4dAE+pDpI?=
 =?us-ascii?Q?HA3S+khaondkAn6JFfTOtUG3SD6mJ4f9Ott9+OE+dkA/hEh8Zl7p105Tb+c+?=
 =?us-ascii?Q?0h+0wbCnf+0/nUFbQi2fjS5iTLcb5fJFwQBc2kXQXCBqWzCqJyjlyr+qlH7c?=
 =?us-ascii?Q?nZnTC1DV6A5dNUHVCIBJ9Vt/QaTQMFZMBYQEM9adj/nOTiNH39dzpZzUGzWW?=
 =?us-ascii?Q?mAtr0QaSjmyLY2hHr3avGFvFmfm29FSRmXkyjv84855pJGMgK/EephxdSTzb?=
 =?us-ascii?Q?tbvfeTesRmt86m8sQ20v3gppGCWVYN+Vxma2NcAztab46GP8o7ZqAr8kkRBn?=
 =?us-ascii?Q?TDttPjNHl0cZ5z7GbI+FsSI3I9Duzk77Dy4P/mhZDGkj/VkaUFkogUHqvLIo?=
 =?us-ascii?Q?l15KH6t6zHtxwyIFgPRhm6kPHD5Q6hARrZIN3OHHiqZ/pqBBY+e/HARbWFhZ?=
 =?us-ascii?Q?hOlGFXAckPSLwcZaQ24u0Pk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13955.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d016a3b-b8a8-4b06-24e2-08de2b581652
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 12:50:46.4498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nr0d8qjFTFybyPf27ms/CiFp9DAEu++o5iXxI9Ezx8CEWgW9ws7IDfsLTVv/t5WFiA1aNV+V+oPPLJhHXUFiOXjOBwy1kcL8jgk7lwRqjx91KtL3SB35FcIdgfqOsC3K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7793

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: Saturday, November 22, 2025 5:56 PM
> To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>; Rob=
 Herring <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.o=
rg>; Geert Uytterhoeven
> <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>; Cosmin-Ga=
briel Tanislav <cosmin-
> gabriel.tanislav.xa@renesas.com>
> Cc: linux-kernel@vger.kernel.org; devicetree@vger.kernel.org; linux-renes=
as-soc@vger.kernel.org
> Subject: Re: [PATCH 2/4] irqchip: add RZ/{T2H,N2H} Interrupt Controller (=
ICU) driver
>
> On Fri, Nov 21 2025 at 13:14, Cosmin Tanislav wrote:
> > +static inline int rzt2h_icu_irq_to_offset(struct irq_data *d, void __i=
omem **base,
> > +                                     unsigned int *offset)
> > +{
> > +   struct rzt2h_icu_priv *priv =3D irq_data_to_priv(d);
> > +   unsigned int hwirq =3D irqd_to_hwirq(d);
> > +
> > +   if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_NS)) {
> > +           *offset =3D hwirq - RZT2H_ICU_IRQ_NS_START;
> > +           *base =3D priv->base_ns;
> > +   } else if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_S) ||
> > +              /* SEI follows safety IRQs in registers and in IRQ numbe=
rs. */
> > +              RZT2H_ICU_IRQ_IN_RANGE(hwirq, SEI)) {
>
> This nested commend in the condition is really unreadable.
>

Would this read better in your opinion?

        /*
         * Safety IRQs and SEI use a separate register space from the non-s=
afety IRQs.
         * SEI interrupt number follows immediately after the safety IRQs.
         */
        if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_NS)) {
                *offset =3D hwirq - RZT2H_ICU_IRQ_NS_START;
                *base =3D priv->base_ns;
        } else if (RZT2H_ICU_IRQ_IN_RANGE(hwirq, IRQ_S) ||
                   RZT2H_ICU_IRQ_IN_RANGE(hwirq, SEI)) {
                *offset =3D hwirq - RZT2H_ICU_IRQ_S_START;
                *base =3D priv->base_s;
        } else {
                return -EINVAL;
        }

One more thing, for the above cases where the same macro is used twice
in a condition, is it okay to keep it split across two lines to align
them with each other, or do you want them on a single line up to 100
columns?

> > +           *offset =3D hwirq - RZT2H_ICU_IRQ_S_START;
> > +           *base =3D priv->base_s;
> > +   } else {
> > +           return -EINVAL;
> > +   }
> > +
> > +   return 0;
> > +}
> > +
> > +static int rzt2h_icu_irq_set_type(struct irq_data *d, unsigned int typ=
e)
> > +{
> > +   struct rzt2h_icu_priv *priv =3D irq_data_to_priv(d);
> > +   unsigned int parent_type;
> > +   unsigned int offset;
>
> Combine same data types into one line please.
>

Ack.

> > +   void __iomem *base;
> > +   u32 val, md;
> > +   int ret;
>
>
> > +   guard(raw_spinlock)(&priv->lock);
> > +   val =3D readl_relaxed(base + RZT2H_ICU_PORTNF_MD);
> > +   val &=3D ~RZT2H_ICU_PORTNF_MDi_MASK(offset);
> > +   val |=3D RZT2H_ICU_PORTNF_MDi_PREP(offset, md);
> > +   writel_relaxed(val, base + RZT2H_ICU_PORTNF_MD);
> > +
>
> This looks wrong. guard() holds the lock across the set_parent()
> call. If you really need that then this needs a comment explaining the
> why. Otherwise use scoped_guard().
>

Ack.

> > +   return irq_chip_set_type_parent(d, parent_type);
> > +}
> > +static const struct irq_chip rzt2h_icu_chip =3D {
> > +   .name =3D "rzt2h-icu",
> > +   .irq_mask =3D irq_chip_mask_parent,
> > +   .irq_unmask =3D irq_chip_unmask_parent,
> > +   .irq_eoi =3D irq_chip_eoi_parent,
> > +   .irq_set_type =3D rzt2h_icu_set_type,
> > +   .irq_set_wake =3D irq_chip_set_wake_parent,
> > +   .irq_set_affinity =3D irq_chip_set_affinity_parent,
> > +   .irq_retrigger =3D irq_chip_retrigger_hierarchy,
> > +   .irq_get_irqchip_state =3D irq_chip_get_parent_state,
> > +   .irq_set_irqchip_state =3D irq_chip_set_parent_state,
> > +   .flags =3D IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SET_TYPE_MASKED |
> > +            IRQCHIP_SKIP_SET_WAKE,
>
> https://www.kernel.org/doc/html/latest%25
> 2Fprocess%2Fmaintainer-tip.html%23struct-declarations-and-initializers&da=
ta=3D05%7C02%7Ccosmin-
> gabriel.tanislav.xa%40renesas.com%7C377460d2de2a4899c85f08de29df9604%7C53=
d82571da1947e49cb4625a166a4a2a
> %7C0%7C0%7C638994237471295714%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnR=
ydWUsIlYiOiIwLjAuMDAwMCIsIlAiO
> iJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DK%2FjQlj=
7d2xbeyIrYLSmDoI90CNwyndz%2B0nkU
> j%2Bu6fn0%3D&reserved=3D0
>
> And please read and follow the rest of the documentation too.
>

Ack.

> > +};
> > +
> > +static int rzt2h_icu_alloc(struct irq_domain *domain, unsigned int vir=
q,
> > +                      unsigned int nr_irqs, void *arg)
> > +{
> > +   struct rzt2h_icu_priv *priv =3D domain->host_data;
> > +   irq_hw_number_t hwirq;
> > +   unsigned int type;
> > +   int ret;
> > +
> > +   ret =3D irq_domain_translate_twocell(domain, arg, &hwirq, &type);
> > +   if (ret)
> > +           return ret;
> > +
> > +   ret =3D irq_domain_set_hwirq_and_chip(domain, virq, hwirq, &rzt2h_i=
cu_chip,
> > +                                       NULL);
>
> Get rid of the line breaks all over the place. You have 100 characters.
>

Ack.

> > +   if (ret)
> > +           return ret;
> > +
> > +   return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
> > +                                       &priv->fwspec[hwirq]);
> > +}
>
>
> > +static int rzt2h_icu_init(struct platform_device *pdev,
> > +                     struct device_node *parent)
> > +{
> > +   struct irq_domain *irq_domain, *parent_domain;
> > +   struct device_node *node =3D pdev->dev.of_node;
> > +   struct device *dev =3D &pdev->dev;
> > +   struct rzt2h_icu_priv *priv;
> > +   int ret;
> > +
> > +   parent_domain =3D irq_find_host(parent);
> > +   if (!parent_domain)
> > +           return dev_err_probe(dev, -ENODEV, "cannot find parent doma=
in\n");
> > +
> > +   priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +   if (!priv)
> > +           return -ENOMEM;
> > +
> > +   platform_set_drvdata(pdev, priv);
> > +
> > +   priv->base_ns =3D devm_of_iomap(dev, dev->of_node, 0, NULL);
> > +   if (IS_ERR(priv->base_ns))
> > +           return PTR_ERR(priv->base_ns);
> > +
> > +   priv->base_s =3D devm_of_iomap(dev, dev->of_node, 1, NULL);
> > +   if (IS_ERR(priv->base_s))
> > +           return PTR_ERR(priv->base_s);
> > +
> > +   ret =3D rzt2h_icu_parse_interrupts(priv, node);
> > +   if (ret)
> > +           return dev_err_probe(dev, ret,
> > +                                "cannot parse interrupts: %d\n", ret);
> > +
> > +   ret =3D devm_pm_runtime_enable(dev);
> > +   if (ret)
> > +           return dev_err_probe(dev, ret,
> > +                                "devm_pm_runtime_enable failed: %d\n",=
 ret);
> > +
> > +   ret =3D pm_runtime_resume_and_get(dev);
> > +   if (ret)
> > +           return dev_err_probe(dev, ret,
> > +                                "pm_runtime_resume_and_get failed: %d\=
n", ret);
> > +
> > +   raw_spin_lock_init(&priv->lock);
> > +
> > +   irq_domain =3D irq_domain_create_hierarchy(parent_domain, 0, RZT2H_=
ICU_NUM_IRQ,
> > +                                            dev_fwnode(dev),
> > +                                            &rzt2h_icu_domain_ops, pri=
v);
> > +   if (!irq_domain) {
> > +           pm_runtime_put(dev);
> > +           return -ENOMEM;
> > +   }
>
> The mix of 'return $ERR' and 'return dev_err_probe()' is confusing at bes=
t.
>

For ENOMEM, dev_err_probe() doesn't really print anything. ENOMEM is
what other drivers seem to use for a NULL irq_domain_create_hierarchy()
result.

Do you want me to use a different error code and switch to
dev_err_probe(), or keep ENOMEM and switch to dev_err_probe() for
uniformity anyway?

What should be done for the devm_kzalloc() failure case at the top of
rzt2h_icu_init()?

> Thanks,
>
>         tglx

