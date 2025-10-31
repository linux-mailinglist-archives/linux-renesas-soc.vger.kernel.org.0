Return-Path: <linux-renesas-soc+bounces-23946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 777ADC237E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 08:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 625DE189B8CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 07:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB83331A06F;
	Fri, 31 Oct 2025 07:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="pu1CpcOc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010007.outbound.protection.outlook.com [52.101.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0518731986C;
	Fri, 31 Oct 2025 07:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761894409; cv=fail; b=ccVjzLSk7gJv73SOwMnMN3cgTZ8eCXRqF0dXGO/NRgNLH0lFLgXpa5DH6Y85bjHv1ovb2WNea7sovOu2oz4hiqevPOZsjp3YDFi2Z/7C9GqzGnsC4ZO+7HaIIDrdBjKmZGP/eKviU+QF13imgMbNVCGu+U7QaiInUxd1+VqQHiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761894409; c=relaxed/simple;
	bh=C7Vd0ZO+nLF30ck/f9vVkTJhVdcnuonKXjSBcEG5/Fs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TAZILR3oKgpg2meM7OWOuaDVQxJyYoEBv9iAEgCOMyERTMycthUOUVFvdZpv1oZyGSYIPbsHRSj2XZRCfjLEKcmvSsNjbBjdNDtQygqKRisBy2U3V3Pf+3hBDWDUDpo+FTTqLVYt9MqC1e0pis2EWyxuwTSrtNrFv23lv5Mgx7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pu1CpcOc; arc=fail smtp.client-ip=52.101.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAaDyJBzWFTUOZnkoS26qok47g4ULjT070MBsk7SGJQZ2P5F5C/N8OmtqImPVSmPnbPSqiYCdo6dZAVKfcfubxT71rkRYbtsQp3ol9nvzVnisjZusnfk8t7AKgcQ+BbBCqPmUcYefEFee0FlKtzD2EGSEFxNPkgHtO9Uv2tMo3GohSnUmngNe2C1oMSzw6CiIimssAnCA5yDiMXA6Mu1TrW9WJYcF/bQp0as+BkfCUb/Hqv3egorEgbVE76PX+Z0rrmS+7KfT4WvAWRJ5FuTch4z+CYgFYCPjNJ1Sa4BGs6UwdhsyvTlT8IPfHK/6wCHO0zVPKXAy2DinfVeFjlM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5B8bbRbOFnDfM8d+qbPCG90/gHdvr7xEp2JbqwJEn9Q=;
 b=sfRH6nOoQYsqdj5nQxD69bM96fvvxh2OrzsTN4B8gRWnjE9URG2WoH3ebMjBFg2t0/d3cM7WMiGi1jAZ13+WSLeGGwx18vMpQWwjZJn4YhEzxkVQGp1ghR4LW9N/Gr5UPNDaAY0ObgCuxHZLfDJTAZx8oBimfW+E5/JjKzfuJDfGCQF5ijh19Oib5eKNkgewWPRhAcbKKkiLs+HYFr5TPuyas9Kla+bV0h7ufbKRMLQGQowUwk6L8WVsBqoDx+qIp2JUHT/etXnKFar20XhS6h1EeNiCvLyDb/ZqkprFzeVjods5DWW9S6RwOqSZlYoaJhucMDlR6TkFwIqZ6czLLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5B8bbRbOFnDfM8d+qbPCG90/gHdvr7xEp2JbqwJEn9Q=;
 b=pu1CpcOcJHjNbltTpXYQ4mG/ktGnzo0tsG05FoJbReQ9r/QGXJbQ9eh1r07Nyp6k6x/mDLjRPgUpJfW4aE/9pdZ+2JQqBDhluQ3Ab2QGA7ocylK3NC37t9TcZXYywKyFJF+gvfCTLOhL++lZYfpRACAGoPAHUNy9Sg9kRF7nkmg=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB16876.jpnprd01.prod.outlook.com (2603:1096:604:40e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 07:06:42 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 07:06:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>, biju.das.au <biju.das.au@gmail.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, wsa+renesas <wsa+renesas@sang-engineering.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org"
	<linux-serial@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 03/13] serial: sh-sci: Drop extra lines
Thread-Topic: [PATCH v2 03/13] serial: sh-sci: Drop extra lines
Thread-Index: AQHcScbHPfJOAc7lOEG5P8xJhHQqn7TbIh2AgACzrMA=
Date: Fri, 31 Oct 2025 07:06:42 +0000
Message-ID:
 <TY3PR01MB1134686842EA2A6EF864E1ABD86F8A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251030175811.607137-1-biju.das.jz@bp.renesas.com>
	<20251030175811.607137-4-biju.das.jz@bp.renesas.com>
 <20251030162155.d08e9d6fd3100092be2ade80@hugovil.com>
In-Reply-To: <20251030162155.d08e9d6fd3100092be2ade80@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB16876:EE_
x-ms-office365-filtering-correlation-id: 986f62a6-3193-4939-2af5-08de184c0bd2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?zn9B92vAwofJa7dkgeoKNb9AkgWLN7z/zQygkgHg3BdROwrJatpM021/1fxr?=
 =?us-ascii?Q?hymsTImrY0ZLRQbF8tAsvkDp235ZfdJqXEYgXzpQHCgGfHMAHF994NiBoIDL?=
 =?us-ascii?Q?Zqp6za1IFgi35Tspff1fmB+qqIqYhkCSaJHAzwZuegzVAIu78nHc7sAVEflq?=
 =?us-ascii?Q?3g18TXWqau+Vx2zAbDMy0fkhGUBCdL8if+yAdjRPUHES8wzy0razu66xjL1K?=
 =?us-ascii?Q?+DQswsOaoycmMkCd4qtLHkncWF9pfSSRGmrzuhyXoaTeAK96o+SJdfpaPimQ?=
 =?us-ascii?Q?RGpcpkm/McO81+95f/wmnkbrIaMfw9loWxKuVLastL53w9m7lvv0F87fSCGB?=
 =?us-ascii?Q?UB9wJ5sFu+/PHmko9bglSLMP70nRnP5SEwSnuoeabAe4EtbsdA6CwT2LWIvF?=
 =?us-ascii?Q?Sr24Kf6s7CII3KRv8sxE5+gXhf6NnpoS00rhXcGMdEnDqSW1NGLjbR8AJ2nG?=
 =?us-ascii?Q?ELzqlNP+OYVceXBbAz7NavDdeOlUEaAdHH3RaD1uYwqaEmC5Ol+qJ1XMqEuY?=
 =?us-ascii?Q?XmVsvybGdwuwRxmKhVa/QKG/UiuGOfjX6CqUmLIwDh/qL6IERRD6F8AfOyHZ?=
 =?us-ascii?Q?rPZMssLMEaPk9oRqkNe2w521nLWSe1Yl2rBaoLblT95iiwodP/Pk85SsBoJb?=
 =?us-ascii?Q?N921oWX1k1iZ6Iiu69gKlT2SlcRWqyZm8L86uc1BMbpHBuk/gYUG6N6FIouF?=
 =?us-ascii?Q?qDBHtE3e1B5Qb002raFTLYeeAP4toVZxTzBg5BBYG80ZyJxEBmp0uKUG483R?=
 =?us-ascii?Q?fhz4MkV7F03CGE59M3WB1YGDLCV+vbXsFoczk2taNhvs+p31CyxSp2MMsK8Z?=
 =?us-ascii?Q?AyN/ZWU0zw7nvfaOQBQQm79tQnD4jJw0KRjb29hoox5G3EGJEFMjLf99loMt?=
 =?us-ascii?Q?7l14Tv9APhMhI+TU4jdcV0RfflTB5Len60bHxKi0w+03qPTe8m1fbXME014E?=
 =?us-ascii?Q?xdUQ0UjmN1NoxqdDJZS7bCsYsx771CcsUArIgLRb4Y52jJrNLYTFyPCi/Q83?=
 =?us-ascii?Q?ofGdzmYaXvKFi3m3nd7cCNDQSMtxoZKoLLHM5ibl8csSuXqnwTkZs5KZ3T0G?=
 =?us-ascii?Q?MxV8gN0ahzHw88EVemK2l9aw95NanOUGOLf/KfeDaRKAtlcqr3qUXRyeP4dP?=
 =?us-ascii?Q?Dnfnd0IfrVbR8BKCm/XX05/wu9Mj67gDMZRhWBNTgE0g7fzwEZbNnUuoWxWU?=
 =?us-ascii?Q?BK13BhzL+AV9b1NQ6K8LXGsZ0rsvElIdLvVC3uttMMPJWJhKhqmKxAhWaIZY?=
 =?us-ascii?Q?TX7sY95einMVT19yn3/j7o2WJc9xblQHUdEqrU9R4duH7l0NdnSZXt0C3zcG?=
 =?us-ascii?Q?E0hOVAle2Y8OUdeVkVybJSm4hlnTbCiFG5CthYhHgOZnI43Xc62BPs6uCFmE?=
 =?us-ascii?Q?bL8UzlaXNUbG+XbfggW5H0rpoAGQWgcTm4dRj/t9bpzBJOqLqJYC6I/RrWsx?=
 =?us-ascii?Q?B8njG/uV9zd+6uVDUo/IRhc/T3a/YsfHgzb6O0Cj8RQFcQPf9EKMrv+m4rbI?=
 =?us-ascii?Q?mVBaY6SdUqboO+8EkcbLZX8Hug43a0gcwCaK?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qmWQw3YuHxy/stIU9KLkCvl52A4jKrgwSst7wAWWNmdExg2nrmQO+qrk73ed?=
 =?us-ascii?Q?U8QfjYQ8JRVBXgrpX8xYk5/g4+8v/DpuU9W7Nu4r9fuFFKPD+mu3VHhH5y43?=
 =?us-ascii?Q?0mEH4fNjWEJJnp0V19ehFokRGooVlMbXhi4TLgQ2zt76vl9mOFrckRL1YVWQ?=
 =?us-ascii?Q?kL1a23C9YvRZ0a8/pOhmB7BiqxlXIFlrM4YjjKmjftL9bUVj7KzaM1QQMxxA?=
 =?us-ascii?Q?Cb4LSNhtKeliDHO8mZk7ShczFLoz51T/ZGIYGheJEMic9y8/GHOAv22WnBMH?=
 =?us-ascii?Q?wWdUPYc7Q69un9YcqLw9mC8qPGJsyqX0u2461Yk8Z0+cPv4NZPNffd9Qgiwk?=
 =?us-ascii?Q?38JVp+blrDbdMDr0CRYVsUpMisnVxLbdATT9rBYBR0e4g3qyzc0HQPS5Rn4F?=
 =?us-ascii?Q?9sP3HBxTS7JDSVZl9dAjpAkgeUl80Zw/BkPVWGTIFgfoL8I9BI8Y7cZ//sB7?=
 =?us-ascii?Q?Q1jWl2FFeyn/U9lZD6CCw/Kqsz57CAxg3Nm874a0KFuJiV/Z1efKIh13gveO?=
 =?us-ascii?Q?+D3twd1aWTGDnFJP9nZrip5mR9egiqHgd7iD440TqEfBNtey7I2/d/ax2geg?=
 =?us-ascii?Q?THXFte2PHM82u9BEtQ40Z2r8EoQJQ3gRrMTjx9NRS6K7iqUufSW/xf4CrAbA?=
 =?us-ascii?Q?bXunI2bfARCGdUxqDrEDNDm/bcgCKU0ytn0uLIWZvRnURIct8BZHJLj1lZGm?=
 =?us-ascii?Q?xTIfpkqI0cwKBOaQwnCzBYbMHnjxU9oUarLJQdLM8ZGbZUoPd8crLjis6CHO?=
 =?us-ascii?Q?x1b8TJd0r/FU9BGEMEfFZKpZKZBGurIdK8cHbZJIx6hOw9+ig1I6c22OgKlD?=
 =?us-ascii?Q?d/pkWOKMZXkzTliI0fXZiRjgt6rs8qcl4PtfCcb8zDE1ntmeo5UZUxxyVvXm?=
 =?us-ascii?Q?PWRFrT5Y4Zkkd92dQAhiY2ZPUlfyA4iFnyjSEFZtp/MXZBliojT9a/8DpXMD?=
 =?us-ascii?Q?E1yAtclw+Z2WpywWw3W37zOX+DDRPa4XxV++OKm5k3gfwjKv7UOsBLT3f1ih?=
 =?us-ascii?Q?GXlB0O1XiRGEMA9VVwxMT7uFISywSeX37QKWNqLn7z/kRu95Wl/t8O1ma+4X?=
 =?us-ascii?Q?d7Ddxsv6XPrSpYfWS8/IRfks4NTASl2Uge4+KMApiF7rLmmo1qvUSbdkvc2J?=
 =?us-ascii?Q?FmFUrEwH4C/F/t65MkTH/IJ7EGslIrYRsZjW9YBANVqet6bdPJXiO6ETHY2y?=
 =?us-ascii?Q?ja4UFH4EP8GdvfjjbnLLxWxCeIGfNADVA9gSsMFQO38WW8g3JfAbatCyseWS?=
 =?us-ascii?Q?IOF7MJUs47Cw3Dmwad11KL5LUX+YYAAX71NJcJpq1WBscPzJDViUcvGvAGPt?=
 =?us-ascii?Q?FjIC7hSjgiSfGBLA7BLySbe2BCQwbdJmY2Esl6RweVDY57FIYFfdV3i3qK09?=
 =?us-ascii?Q?wbU/KIJtC7EeMeDhPa5loK7Tpa3X9OsMy5ZMzVtx+AJ8Nqn7MKeCweZ3N1TI?=
 =?us-ascii?Q?NNk95/AgEBghwIRMJnSrBcZoQBStCBhhqke11f8dwWfPq79JEtaM2ljRkoIX?=
 =?us-ascii?Q?WHyKgskeQ5L39acaBpmZy3ENStxqPqrTm0w4Pmb6grlzJsqcGz/ui/NArWPT?=
 =?us-ascii?Q?lk44Mlm2mS1wQVyw9D3KcqNZWTwfrtIt6uB2NT9VvJlSXhZLQQG16wYIjAWh?=
 =?us-ascii?Q?Ig=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 986f62a6-3193-4939-2af5-08de184c0bd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 07:06:42.7508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xM+D8IZ3c9fzkRbcZE2c1zRsCCKy2GaGCB7O6IIKiJmqw4M5tT5/UZJPz4eXtMwkzogTf5d0gMaqNifJtzO9Mv2HUeZY5GJ7QehA13z9sUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16876

Hi Hugo,

> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: 30 October 2025 20:22
> Subject: Re: [PATCH v2 03/13] serial: sh-sci: Drop extra lines
>=20
> Hi Biju,
>=20
> On Thu, 30 Oct 2025 17:57:51 +0000
> Biju <biju.das.au@gmail.com> wrote:
>=20
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Shorten the number lines in sci_init_clocks() by fitting the error
> > messages within an 100-character length limit.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * Updated commit message 80-character->100-character.
> >  * Increased line limit for error messages to 100-column limit.
> > ---
> >  drivers/tty/serial/sh-sci.c | 13 ++++---------
> >  1 file changed, 4 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > index b33894d0273b..e9345f898224 100644
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -3008,11 +3008,8 @@ static int sci_init_clocks(struct sci_port *sci_=
port, struct device *dev)
> >  			return PTR_ERR(clk);
> >
> >  		if (!clk && sci_port->type =3D=3D SCI_PORT_RSCI &&
> > -		    (i =3D=3D SCI_FCK || i =3D=3D SCI_BRG_INT)) {
> > -			return dev_err_probe(dev, -ENODEV,
> > -					     "failed to get %s\n",
> > -					     name);
> > -		}
> > +		    (i =3D=3D SCI_FCK || i =3D=3D SCI_BRG_INT))
> > +			return dev_err_probe(dev, -ENODEV, "failed to get %s\n", name);
> >
> >  		if (!clk && i =3D=3D SCI_FCK) {
> >  			/*
> > @@ -3022,16 +3019,14 @@ static int sci_init_clocks(struct sci_port *sci=
_port, struct device *dev)
> >  			 */
> >  			clk =3D devm_clk_get(dev, "peripheral_clk");
> >  			if (IS_ERR(clk))
> > -				return dev_err_probe(dev, PTR_ERR(clk),
> > -						     "failed to get %s\n",
> > +				return dev_err_probe(dev, PTR_ERR(clk), "failed to get %s\n",
> >  						     name);
>=20
> This one can also be on one line (99 characters).

It is 101 characters.

Cheers,
Biju

