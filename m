Return-Path: <linux-renesas-soc+bounces-3387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C6786E57C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 17:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE5DFB25046
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 16:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A7074E3C;
	Fri,  1 Mar 2024 16:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WEp8dacT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2071.outbound.protection.outlook.com [40.107.113.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C2476025;
	Fri,  1 Mar 2024 16:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709310303; cv=fail; b=CMA/En0kKxqBlv5CsWtreU0gbmpwRhEhMRisYJ87mudQuQdIb441PDiyddFbfQ2GHkcBhpqV8heI8mzhm6K1D0ePKMKvjqXUdx2A48cECuHdmCCX2d/tKSA4J24mH/giBpJWZsdY3L32M49FGsFh5PLW+ify5H8OOsFOqRKJXzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709310303; c=relaxed/simple;
	bh=wX4C6AlXO6eC3pWRptSO/PARlpqOsILiYhGJjwpv3ao=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qEtu4Sj1vXiE6jxpxYsXKZslZiBtaU3dyL1Lsh3W0n3ki01L3xwltLiLkhyNBkns1AbGqkii1MIVe6i3Gi3f6yuFL4VJgE7T3ve1OFVoy0SPYJ25kDOt/7LV/ik8wQWk/017/4QAQLr3Ux/SY2WTT3YtnpE9KImcr3BS9GPBi20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WEp8dacT; arc=fail smtp.client-ip=40.107.113.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Aq7lFofKg4ybd/JBMyNi1ULt6+Zm/HO7dUHJYigjZfpdzM37ZgMLmhJRpxqwn6TXlN2c+0NKlWVXEP1v0G4FQm5PrixjalpL8hyF5hppo3hZSAJzoTM4tjjTPBurHPoNuM5bTMagwkcKHq66lgwRsEClz/HkfbfniumDBxNdrr7pdLPWyMXcYpnMGkGqrN2g5iBYIZWiOXkQrEJEusJk2c2alRnPgQP8fANz6kXrDEaoyAOikhw1X53dbJYrUesmwQMYvx7dR6t2M1eo/VlRWtRup4WcgQT/4dneXXvS66cprkCoZBEo30ekh0tabRe7bKgJ5L4Su5du/64r/WIelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6PPUDDueF0t9p7oyeQ3LfauMoTx5gUnRVdtWe/9LLc=;
 b=ew+RvUNPF0tPhvJfuNDcyJstkFdD02bs7FHRAVAhebU4WeOiB/tvTIbODEsHOzw7e6QlWdJ/qXjvL4vKCESK5gCAycyua6HpM/fg8A5bJvMAOhR+nkyKp/EEIQ5kfo4k5P71Z6ovy+IQ0eEVFUoahW9tSx3H3m3Bsl0uUhRoIRUiif1qFg56J+aSwfSy5dJvwVShLlBBblbh/NZdCjjS95LOLnyQoMPKtnajR2qM5ptVUhTxtu6OFjY2gWPqOek8kxT0SQPad5F/0FN41AclpYcCiNQviCuZQuaCpczhwTpTlRthfvoAHnAtNppNlQg7oPd2DvpUEwi9cOdxGyb2nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b6PPUDDueF0t9p7oyeQ3LfauMoTx5gUnRVdtWe/9LLc=;
 b=WEp8dacTtSEKbfT8wM4lnRoym00iV1BCpmrWtMXkLzXidior6cC6j0J+kd3qqRhhVrdHAQZhMyHA0AUYipfCOGQIw86QaNijJiPBhcjDj6yiaT5luHnUqgoEt8K/PZ/ck3n5vp4VWtTf+zrFz8/jQs4oGQ4p15Gq5SRWiS6nGz8=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TY3PR01MB11114.jpnprd01.prod.outlook.com
 (2603:1096:400:3d3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.32; Fri, 1 Mar
 2024 16:24:56 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7316.039; Fri, 1 Mar 2024
 16:24:55 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Russell King <linux@armlinux.org.uk>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/3] clk: Add clk_poll_disable_unprepare()
Thread-Topic: [PATCH v2 2/3] clk: Add clk_poll_disable_unprepare()
Thread-Index: AQHaY+mykIiwcxUgTUeXBuFGi92Y1bEd+OyAgAUnrPA=
Date: Fri, 1 Mar 2024 16:24:55 +0000
Message-ID:
 <TYCPR01MB11269421A563EC308871B63CF865E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240220104336.260194-1-biju.das.jz@bp.renesas.com>
 <20240220104336.260194-3-biju.das.jz@bp.renesas.com>
 <Zd2tAYNfhd6itOQr@kekkonen.localdomain>
In-Reply-To: <Zd2tAYNfhd6itOQr@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TY3PR01MB11114:EE_
x-ms-office365-filtering-correlation-id: 702fa186-1f88-4024-23f0-08dc3a0c21a7
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Rs9tvJE2P6OTXgIysAi7KoLbY1DphZN+56gOMWYgfEmf6bxLYgX/gGeAXPGmUTOl6Izu65PSJKpd+PS95S/R/vnG80P73EDR01kBqWN38SAQ08ZCduD+rrsOC/aS8jVUUwd/o6d84BnkL7bF3Crx5GYbsEjzmG/8b0peMRgT0BdTeRmJZVUsJKExV2hMAYUJT2JiaAJpehxxm3zR6KB+wNZD8ivwOlFzEfyqm9Quxqlehm7ybMTO2b5s7Ux96/5cP4qKewRSNFeHXilJZ5GYfVFb1QJblIaFQ+YvtwAnBYMZJjJVNbwyMZ0cA2zluClRsG0Wr5G0dhDyr+RK3A9/mIYPgTR/OSvdtuK3o9wzS3fGKQigrYcyRUjkJ52rhVc/hMQAdf4Ygmze8UNA/sF0PxA2lkDUxrWGlLBSVxybP7FiwWehBNeucTtz/NnGQuXqOxoG0vcSbAi6qmHXErfaa9YMYhjiEbKUTEIs7Fdq16AziqAwIpk52oyXI7doGfJtr13DRFMtsJwFlymUbXb6pwhqiOJdxn0phCRpp2sVW9ANp/5cfsPOAraysbIJ2Ih7TecGWyyiU6EImibBhZ4ezrCGPlyO5GNlQOJd8xc4hzImtXAALRdiroky9DXYrXfRsa4gdu0jQyRa7ZVS4v62QO7yTca115C9ocaxYMH61ksJxU313NLeesYRH44qNeOCBuF4S444q0IryjaYA7Fjb9Y/dZ8pfvdxmxt4idB3VnI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?gzOvxSTSnRL1TOJnUXqTHlbDRw0V4tbUkqr3U9sOUeTm7SRcID1eTmXv6u?=
 =?iso-8859-1?Q?ZwLU2a9ZBIXo+IErkUTvmjuXVyA7XkLUkAxdT3B9s7sSj3pegE/S1TpQuR?=
 =?iso-8859-1?Q?m+Rj80rGdhuofGqqo76bb1uFdJaaRKsTY0A3DJM3obamGdfloIOVN3Y3x4?=
 =?iso-8859-1?Q?xFBiQKWTB9QIGsOT6VqhyCPmS+3Msi2a9LXJlQT78OYSdju5HQjaG4y1sJ?=
 =?iso-8859-1?Q?KfZ+Bpzt39CFKB4I/1/+VhZE6eYufvWG9fLS9M++QfwWwwjUcHNPRmcSRK?=
 =?iso-8859-1?Q?pIEDZBcyTVLjArIW9qGCbWA36Dv60hz85IHX7dvDuScJ3a2/aeaYg/43E/?=
 =?iso-8859-1?Q?3jYlWJ2EAGBpG8e/Xt0XPz1C4dhd38QNKZywevzwDJQq3BbiQEfDLrpLM5?=
 =?iso-8859-1?Q?Dt2hmyKiyCkEDZrkULZT/ml7TMzVSXlAQnkSaaWf7yI4Y0517xholiJl7b?=
 =?iso-8859-1?Q?xtpyCHl2lHKuL8JthiSTbygMe4FZVR+bvPPBhBk05uPEHJnnKqGY9vftmf?=
 =?iso-8859-1?Q?B79G0TyduFimghn5WscezBex7EXcKHCRDOHteFEeAH39QQfKoMXk7YKwqu?=
 =?iso-8859-1?Q?eI3nBD4Uli9IQFLK7Jv85loYukFHjrQE5QG1NskAZjiuiqEBdLUfiilmd3?=
 =?iso-8859-1?Q?R63IoISZYlSi8LTx5PBdkvgLVybG5Ma9eZABqu4vci1a+OKPWlB6hbuzZu?=
 =?iso-8859-1?Q?T0+ncMD3TGpt33wBWHV8t524LWcL80x2QU/6gsy4sr5KJiss6iNeqpjINY?=
 =?iso-8859-1?Q?8lwdyhJmRrvu2iI8bYag7vPsN941YBEwE2eKLN0rPp4b9dJCnd1Phkr5zb?=
 =?iso-8859-1?Q?jEkJPowbFMC0VGZLlxgQYCy6fMeb9sNK/D4PHpHND3r5PWWTX4tGWeytVN?=
 =?iso-8859-1?Q?zMaHBe/cLvdhAbmxLA6d+v0rVR6cTfRpuMoMiu8JqxTpUD1AXLHG8pd0WB?=
 =?iso-8859-1?Q?HssnThubxCvNX3RSm4ZVDgnwLRrgLueu2tkPS5HhsArpQQpFKTeKpDTMeV?=
 =?iso-8859-1?Q?+UlM38ehYv8s2voHNgdurQoe1DixWVUJOUTvBABbxzsUhXBsndLsujgSKM?=
 =?iso-8859-1?Q?esXKg4PI5V9QiyoGJ2Jp7NAHIz0ZbW1QSLILSmLzFG2F/B+d5rAl6MysHx?=
 =?iso-8859-1?Q?qWCgFglfh935xWQxN0zv61rDjpzcQPDA819R1HG3VhYvH7Pp5N9smhJyLY?=
 =?iso-8859-1?Q?cBsXEz4piOhVc02viePD9yEjE/gvjZwewhAYSp8+F0hI/cGuRXdsHh8Prz?=
 =?iso-8859-1?Q?p/EWIFzrUv6ZBXYgk/2zgKGKugjzpam1Kcm5eVH7OAC20X8enO7Vv5O31M?=
 =?iso-8859-1?Q?auztk1Lok4srZ8w6QsWyQRigcIKNEaJ6pncxuZw/UBoyWhjVsh+nIlNVZK?=
 =?iso-8859-1?Q?lU+odMsW+TzBRDreZZ2Wwl0fxVzr0KuluOw8qkPPF0OsbRFS+pivkLYU+W?=
 =?iso-8859-1?Q?ttrJjxQn2J4DVNfxXrN7u/H7l6AZw0llKNEEVx6pzeSSXraRp/ozN40k4n?=
 =?iso-8859-1?Q?3qXLNA+QjBxBSNt1xjP+A6vy1Whs0dJBw9UFtbDFXvc5QCk2gIJiiktPNB?=
 =?iso-8859-1?Q?biAKfi0t1eTnvREjrZ1vurAOzENUFv+95MjagqmSvs91GJtVfBSTmxjTDd?=
 =?iso-8859-1?Q?J9nHgaouaefpABK8w16aC2UNRR7tEX+lg8UBZ0TaBx8GxXJphsWNkNtQ?=
 =?iso-8859-1?Q?=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 702fa186-1f88-4024-23f0-08dc3a0c21a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2024 16:24:55.8275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: COrAdKoij//Nm8sjf/nSEFhofLbxV+dxpLEVTHNKxzff13/s0ZMVU5yDC6oQhpLbQw5dFPPKcueuJJrx2P/O2V3nsO5b6qwrQoTw0jKCphM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11114

Hi Sakari Ailus,

Thanks for the feedback.

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Tuesday, February 27, 2024 9:36 AM
> Subject: Re: [PATCH v2 2/3] clk: Add clk_poll_disable_unprepare()
>=20
> Hi Biju,
>=20
> Thanks for the patchset.
>=20
> On Tue, Feb 20, 2024 at 10:43:35AM +0000, Biju Das wrote:
> > The clk_disable_unprepare() doesn't guarantee that a clock is gated
> > after the execution as it is driver dependent. The Renesas and most of
> > the other platforms don't wait until clock is stopped because of perfor=
mance reason.
> > But these platforms wait while turning on the clock.
> >
> > The normal case for shutting down the clock is unbind/close/suspend or
> > error paths in the driver. Not waiting for the shutting down the clock
> > will improve the suspend time.
> >
> > But on RZ/G2L Camera Data Receiving Unit (CRU) IP, initially the vclk
> > is on. Before enabling link reception, we need to wait for vclk to be
> > off and after enabling reception, we need to turn the vlck on. Special
> > cases like this requires a sync API for clock gating.
> >
> > Add clk_poll_disable_unprepare() to poll the clock gate operation that
> > guarantees gating of clk after the execution.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > RFC->v2:
> >  * Renamed clk_disable_unprepare_sync()-->clk_poll_disable_unprepare()
> >  * Redesigned to make use of __clk_is_enabled() to poll the clock gatin=
g.
> > ---
> >  drivers/clk/clk.c   | 23 +++++++++++++++++++++++
> >  include/linux/clk.h | 46
> > +++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 69 insertions(+)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c index
> > 9a09f51f4af1..0e66b7180388 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/err.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/list.h>
> >  #include <linux/slab.h>
> >  #include <linux/of.h>
> > @@ -1138,6 +1139,28 @@ void clk_disable(struct clk *clk)  }
> > EXPORT_SYMBOL_GPL(clk_disable);
> >
> > +/**
> > + * clk_poll_disabled - poll for clock gating.
> > + * @clk: the clk that is going to stop
> > + * @sleep_us: Maximum time to sleep between reads in us (0
> > + *            tight-loops).  Should be less than ~20ms since usleep_ra=
nge
> > + *            is used (see Documentation/timers/timers-howto.rst).
> > + * @timeout_us: Timeout in us, 0 means never timeout
> > + *
> > + * It polls for a clk to be stopped.
> > + */
> > +int clk_poll_disabled(struct clk *clk, unsigned long sleep_us, u64
> > +timeout_us) {
> > +	bool status;
> > +
> > +	if (IS_ERR_OR_NULL(clk))
> > +		return 0;
> > +
> > +	return read_poll_timeout(__clk_is_enabled, status, !status, sleep_us,
> > +				 timeout_us, false, clk);
>=20
> This API is a bit problematic as anything else in the system could enable=
 or disable the clock while
> polling happens. I think you should add a warning that this may only be u=
sed if the user is the sole
> user of the clock in the system (which is of course hard to guarantee in =
a general
> case) and has not increased the enable count (or has decremented it again=
 to zero).

Agreed.

>=20
> I'd perhaps go as far as do WARN_ON(enable count non-zero) and return an =
error code (-EBUSY).

OK, the below code should cover the above case and below one right?

+       if (!clk->core->ops->is_enabled)
+           return -EOPNOTSUPP;
+
+       if (WARN(__clk_get_enable_count(clk), "clk is in use\n"))
+               return -EBUSY;
+

>=20
> > +}
> > +EXPORT_SYMBOL_GPL(clk_poll_disabled);
> > +
> >  static int clk_core_enable(struct clk_core *core)  {
> >  	int ret =3D 0;
> > diff --git a/include/linux/clk.h b/include/linux/clk.h index
> > e6acec5d8dbe..2d63a12214e5 100644
> > --- a/include/linux/clk.h
> > +++ b/include/linux/clk.h
> > @@ -665,6 +665,20 @@ int __must_check clk_bulk_enable(int num_clks,
> >   */
> >  void clk_disable(struct clk *clk);
> >
> > +/**
> > + * clk_poll_disabled - inform the system whether the clock source is s=
topped.
> > + * @clk: clock source
> > + * @sleep_us: Maximum time to sleep between reads in us (0
> > + *            tight-loops).  Should be less than ~20ms since usleep_ra=
nge
> > + *            is used (see Documentation/timers/timers-howto.rst).
> > + * @timeout_us: Timeout in us, 0 means never timeout
> > + *
> > + * Poll for clock gating and Inform the system about it's status.
> > + *
> > + * Context: May sleep.
> > + */
> > +int clk_poll_disabled(struct clk *clk, unsigned long sleep_us, u64
> > +timeout_us);
> > +
> >  /**
> >   * clk_bulk_disable - inform the system when the set of clks is no
> >   *		      longer required.
> > @@ -996,6 +1010,11 @@ static inline int __must_check
> > clk_bulk_enable(int num_clks,
> >
> >  static inline void clk_disable(struct clk *clk) {}
> >
> > +static inline int clk_poll_disabled(struct clk *clk, unsigned long sle=
ep_us,
> > +				    u64 timeout_us)
> > +{
> > +	return 0;
> > +}
> >
> >  static inline void clk_bulk_disable(int num_clks,
> >  				    const struct clk_bulk_data *clks) {} @@ -1087,6 +1106,33 @@
> > static inline void clk_disable_unprepare(struct clk *clk)
> >  	clk_unprepare(clk);
> >  }
> >
> > +/**
> > + * clk_poll_disable_unprepare - Poll clk_disable_unprepare
> > + * @clk: clock source
> > + * @sleep_us: Maximum time to sleep between reads in us (0
> > + *            tight-loops).  Should be less than ~20ms since usleep_ra=
nge
> > + *            is used (see Documentation/timers/timers-howto.rst).
> > + * @timeout_us: Timeout in us, 0 means never timeout
> > + *
> > + * Context: May sleep.
> > + *
> > + * This function polls until the clock has stopped.
> > + *
> > + * Returns success (0) or negative errno.
> > + */
> > +static inline int clk_poll_disable_unprepare(struct clk *clk,
> > +					     unsigned long sleep_us,
> > +					     u64 timeout_us)
> > +{
> > +	int ret;
> > +
> > +	clk_disable(clk);
> > +	ret =3D clk_poll_disabled(clk, sleep_us, timeout_us);
> > +	clk_unprepare(clk);
>=20
> How about clocks that are generated by devices to which access always sle=
eps, such as I=B2C devices? I
> presume they're actually stopped in
> clk_unprepare() as clk_disable() may not sleep. They also can't implement=
 is_enabled as it cannot
> sleep either.
>=20
> It seems to depend on the implementation on what they do. The runtime PM =
function used is
> pm_runtime_put_sync(), so you may have a guarantee the device is powered =
off but ONLY if it had no
> other users and had runtime PM enabled.

Even in RPM case, at the end, it comes down to enable count. So, the check =
you mentioned
for enabled_could should be fine??

>=20
> So perhaps return an error if there's no is_enabled() callback?

OK, This will be taken care inside clk_poll_disabled().

Cheers,
Biju

>=20
> > +
> > +	return ret;
> > +}
> > +
> >  static inline int __must_check
> >  clk_bulk_prepare_enable(int num_clks, const struct clk_bulk_data
> > *clks)  {
>=20

