Return-Path: <linux-renesas-soc+bounces-3746-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C70487AAFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 17:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4CB81F224AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Mar 2024 16:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F01482C9;
	Wed, 13 Mar 2024 16:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RSfaMS0n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515F6481CD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2024 16:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710346878; cv=fail; b=kKtJLb1DzvGafHINAofqmnQyBCWi7Sso5iqZ2nsJ7PGiLB3v+Kvx+H47YkCNEOW2tHLd6TbkWYqx0xqoKjJF3ENLVnAH4/7Usd8Q4vE9AlkS6smr4Z00U00nGf+zVENPczTCdWQWz0ppZQGkqWAK93xysHXEIgJAkgls3ojWWFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710346878; c=relaxed/simple;
	bh=cuzX744ddPmtJpVa2lduy+3YA6YiK0ChK6GxO4eE0hc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VeTLY6aNoGzxJq7dJf5+V3Vw5fpS0OTeQvEDCXk7rbbOTBgX/Mfq4/XWyEYW9wTgMFeKF5R+HHNNHJkwSjii76oux+Go0IzYmqIpOR7IxonNYu5jQGuQC3sMFQfTtypkLsCQ2imX7qPfbNNLpsaTQULdQ7zqZjBaHZ1P4h2bDH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RSfaMS0n; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGrxS7fIkAFcVrQgAh9YwZtQJKshAiQEknt5xe1nOgN+fj1aDRcSp5emVU1MV9MJTxhWuo9rSQOAp/kWN8OykRq98vPYd7NzAR4gjUi/dr23PmjEr5VAljaL/slNHiDnv/Fjp7vBxBzcOzTjSLGqNFPhJuDiZp5C71Ku0jUv8xLceuCDby+ibewdbjFizgYgn0Nso6FCoPML5j31ew4kGe0INRtXD2JmAdLbHLwrI6Q1GZ5jVZR8MI0QKqgvTcU8Hn9Ni+bpApQaeeqFBZ0yMCdkEI6pFfCKu6JKbfIC3sHltZw6fIWXyKATMhksDFHVusLGtnOA37Rr7jz/DwmuBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kI4pXIgvBVGpblFQzAIcnKBab1kJKPBwZ/5IB3LYebw=;
 b=fGTW8Wrht95x3f4Gy6vO0hkgeP/XGH4Xwy9hPJX3309eNED11dDgSAVUsHH7P31AtJt6alCgZj90G5tr806GLtxD5Y5riIfFHWkUuG/PWjp6AZNGZJJCs2dXRerurgDjsXvYBgGXGnHylIuWmp5qwB0QDWvdCmmgbZ3YC9TjWb+UbPiJQZeQRe0YqbSdS9nLRnTEoyJFclIZGuLAMON+2Mh9wUC+ZYcZ0wJB4qjUWH4IcxQdfsobpyAZw9MqhopRkQ4WX6hED4/3hO04iISi4+lui/nlJshHwfZld8da4bnaKYl96+yO1uh8UKyM2F+lO07KVyjBxKKej81dpD1veA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kI4pXIgvBVGpblFQzAIcnKBab1kJKPBwZ/5IB3LYebw=;
 b=RSfaMS0n/cdQ3AsQv5UzzLLwainFbqTzRZMRGAqv4p9NEPFhJT41oB5bZAD3HugNpema19nrB/K8399SCPT0u5AmVX9+bBd2ovI8kDSf7/yEa67PV4+YHyYY9sKAfJZyz2KRJKc6SHBRLg3vXjJiKZxQO7ezJ0KIF/tzU3+kJ64=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by OSAPR01MB7351.jpnprd01.prod.outlook.com (2603:1096:604:11c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 16:21:12 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f%5]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 16:21:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Marc Zyngier <maz@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 4/5] irqchip/renesas-rzg2l: Fix spurious IRQ
Thread-Topic: [PATCH v2 4/5] irqchip/renesas-rzg2l: Fix spurious IRQ
Thread-Index: AQHabyx8poIaYi8ZeUWg+/I7PNCPMrE1yeGAgAACTKCAAA+lAIAACmLQ
Date: Wed, 13 Mar 2024 16:21:12 +0000
Message-ID:
 <OSAPR01MB158787857468CE5F8C34B102862A2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240305183922.138727-1-biju.das.jz@bp.renesas.com>
 <20240305183922.138727-5-biju.das.jz@bp.renesas.com> <87msr2nqmy.ffs@tglx>
 <OSAPR01MB1587D16D699155C52A240E5B862A2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <87edcennnx.ffs@tglx>
In-Reply-To: <87edcennnx.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|OSAPR01MB7351:EE_
x-ms-office365-filtering-correlation-id: 539d8c1b-c11f-4f7e-e8a7-08dc43799943
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 AX0K4RfmqsQyVF/fr24yvVrrlF3iIGbr9BV+wEsfMeaOFJ8BUuDK+HRWWFd2AltJHJzSqFyiwacpCcBMbhCJ08a8iMJl+W+E9WpugLLvUfGsuJecsTiUoeILBsjlHe3VxtqpS9lklP46hLPhsJEWjVeQB11/x4eUFeHiPtZpFAssfq1T/RQsnW9PFTQwmDxpDccPENjTjVUNE2cqsHvDcIlD2ckJKyU4QdOLMEoCSFc/+1nUbdjfmhY6F2CNTwZhKddzHTpUiiCUSZO5i4Oh9h97tpOUuOCp84eB2lFVC7E3CokpTFdz0apaYB/LpEF/lidffbBW7CbZlWHlNeogtJiv9r1//FhqRfRqTCbCiQujT8KWjnBzw6cGrTzBGEv0tpF+UcOSyx8lcDDvYeqQSqj+GaXh7NXTdgf1OnrxnHrOIuJNDaNpbEijOAnNz9nA2MCos66szVaMEVYxaIJo0zo47TXfRDdPXqzxmVtLLHzVM/4q2W2VQJXtKMIvjfLUyuR955Zy6l7fvbFyJBi2hb8ioZCehsoGHZlXo9mL1JGof/1IZT5WtsiCjB9PYi7zOP5mqZechoj4zOqSyl0ASpCdxpKDnXMAFy1bjEBq0OOR1jiFBwwpo18oengA+MMBuSUfiVGSWzN73zO2aWBBWc9X0zgUrQN8A/zb60xYaOFBqaPLubkDrLEvuAIqeZmK580hFrj4ZBD16UItfsCm5HulMtNuxpK2ROtkEkdLT2Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ju77X5NdiDNOry1X39xCDVfsiQ6dTCyoJKEcl9gmsTHA7iFik/u7qa9cvhn7?=
 =?us-ascii?Q?JMQj3MI1Sf8qtIr+S/+io0I9GGouo7xOPEYb90iUtBwrt0ctfRZA3+B9+oaK?=
 =?us-ascii?Q?7NHALbAaL3WCiqkyds9gq+QdGIWc1/nfu1gMCtmNE+5tALvqDKkcyjTZeoJu?=
 =?us-ascii?Q?EfGADGEG38WvQnjJvJULF5aHXtvXkk6M67VTKs7+UWW8p+KpNH/lkgQDjKsx?=
 =?us-ascii?Q?jKHqkn2YbFQ12e1n/8VwpyJBNtcQxglhdlULtTB+86+F95NNpngEOOBHdnkN?=
 =?us-ascii?Q?i1GuRnpDtwbdDHYSkn5Cps+S1Tk+9PXNoSpefsyDYY2VuH/ii7oUGRbpJggp?=
 =?us-ascii?Q?uULxoP41zOEVatrCl5ghdt1sSr6yBDTOUoGsJ9oGiCqDaZnH7bOneteGWVUt?=
 =?us-ascii?Q?Jeqx3otBx8vzfcdZVwKzKsYlPnuJ8ve5uGx/hcf8jnP+FF6ns2Lj+ZRtuOTB?=
 =?us-ascii?Q?e6gXAhbJyEBg8B39RVh1n58F1K7W82NuAawZZ4DCm168u3bFDHaNQWudUyiJ?=
 =?us-ascii?Q?hoORg8GVaRdRW2Xr/3kz70nL47n7Y6iLN04tv+9qc0NHMShsauwWQxDp8Zbv?=
 =?us-ascii?Q?LecYK6P6t0Ylw1JJ/S0Qc38Ul71hsu5zVg79ve1VMqiOIkCgLjNRw0xKmc8Z?=
 =?us-ascii?Q?mVflgCpZ78MBg/QGyI9JJwpoYLmaPhFZh/3+OcItd2ljtWPH6CjAupqea1L1?=
 =?us-ascii?Q?ZhuozJEfZlNffH7lTUsqfOKxEiuHJ17tPHu+3GEkPiLXt90lhZqsVFGnzPLM?=
 =?us-ascii?Q?3nHj9TCHWeYB/8u6mBCWULOsaKneVFVaRS45F21P4rV/N5uyVXCsNXenm94+?=
 =?us-ascii?Q?MeCmnOdDrMoAy4UJ40lDBSH9HdeQLxyCOuBhfMOk/DVG6FELtzRgVPcfRKXh?=
 =?us-ascii?Q?HY6V5bDR+l5oVRztnybvZ8wGA21NLjKWiL3gwqJniHDsU+7khkzlWWdukuEL?=
 =?us-ascii?Q?TW99OeWEjSNQjJFF/1Z/2UXQfvLpaOa0TGSdDVEkWHqFk4+sddySA4w829bT?=
 =?us-ascii?Q?5CXG5n14ltHqdpNqDL/R/dzSEUMkm56QUbNy0Ca9cPJSu1o6F8lvuIyxLaL5?=
 =?us-ascii?Q?yGjayRk1vMnDmwu/veBoR1q349CIeDLDl7BiQW19GHzf+BoXPXXCsys7aD3E?=
 =?us-ascii?Q?rgg+zFVxz12BPPSw4gEoR7Q7dJEOYIFVEoA8wOw/tUkTP93NPyIV25wU19T2?=
 =?us-ascii?Q?IjYXGfOSJBWSuWs4Bemax6z51ocT1NNkZQM4BXn66IYuYiJidvnrtczlCulW?=
 =?us-ascii?Q?V8RNXTX6tl1f+pl/H49P8jmOmdC2wsjmP6dC1YkF1N4ZZkypFaBDHIlIu89C?=
 =?us-ascii?Q?p8iWSX9rWwCZ8XI34vOGhED4G/NM4XGiwslWg0F+D4Dsp539QSmUPKWqQkCy?=
 =?us-ascii?Q?qlSTd96mVl3NO9A4lwaNYT3NI1Jh2wp18vQDoKdHxNIqI9SZxpFVMi6NwweK?=
 =?us-ascii?Q?zfeJQ1pT31/Fov9+7v3NpXWtQcYcUnkc6fc7lC+w6ZQip2KSuKglg5AH2XiN?=
 =?us-ascii?Q?wHeAoPdrKkJNCf98tTRiKk5MQcKweHGn44OmUyNDw5GOMiJ/eNlIvZgTbekz?=
 =?us-ascii?Q?h5FgQNJx+HghxSQqN82C5lzIbrCM1ECDfpl7pB/2cO1BpZEmFm7tyXijdxTV?=
 =?us-ascii?Q?Cw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB1587.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539d8c1b-c11f-4f7e-e8a7-08dc43799943
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 16:21:12.0963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6y0aATgzs7P4lWQ/syRIpiDwO6qzXW+MpSKqx0NZGqAy7GoQXgnaaYXywN150zmai/1WoLV3MG8Ok7Sk+Na7U5sZPzJj7TO5hNfi5ahJ6AM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7351

Hi Thomas,

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: Wednesday, March 13, 2024 3:43 PM
> Subject: RE: [PATCH v2 4/5] irqchip/renesas-rzg2l: Fix spurious IRQ
>=20
> On Wed, Mar 13 2024 at 14:58, Biju Das wrote:
> >> > -	raw_spin_lock(&priv->lock);
> >> > +	raw_spin_lock_irqsave(&priv->lock, flags);
> >>
> >> irq_set_type() is always called with irq_desc::lock held and
> >> interrupts disabled. What's exactly the point of this change?
> >
> > Oops, in that case this change is not needed.
> >
> > HW manual mentions, interrupt should be disabled while setting the valu=
e.
> >
> > I will drop this change in next version.
>=20
> I fixed it up locally already. I'm going to merge 1-4 because those are f=
ixes (2/3 are preparatory). #5
> wants a change log matching reality though.

Thanks. I will sent #5 updating the change log.

Cheers,
Biju

