Return-Path: <linux-renesas-soc+bounces-2874-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0317A8577FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 09:51:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E98A81F21FD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Feb 2024 08:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C1E1C695;
	Fri, 16 Feb 2024 08:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ASzWjDtn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2061.outbound.protection.outlook.com [40.107.113.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512391C68F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2024 08:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708073231; cv=fail; b=fRvZoOkRK3LPW0c/ochK6Dsqw7FPiVK+rQbkXUvV18dAz0UycH7tnCOMpncsXChgzKJcIE4OATNn1q2EMJuCq/ZWNDPJGCa0XQFOuu2k2ayk2VN3j9xulBmzykYNAlRKQPJjtxCQuvfS7F5v+POuIxbKhqpNyMI2Wz1NjmJ+PXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708073231; c=relaxed/simple;
	bh=206IxfQbSqiHBYJtOMxgtZHrETdS5vW0IBji2F8lrDo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L2cQzqe/9is+OhTqfCqwSB9QP2LoeifktkvzUUDEjsbKOfg9Bnhi1yLUb4kGjsnF4q5BbCzwu5Vc+2BbkaUyPSAsUKp7EkuDAxE48kVqHZNkkEj2m8Ymnk23BL7U7u6oImkD8tepjvmpvY1ie5eOOiA6PV8bVeIU4m1OBtPvbyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ASzWjDtn; arc=fail smtp.client-ip=40.107.113.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wv6d9TcgZ5O7Q56phV+U4iq7qA9u3hKviTay+MHRMjjerx8MHZo9dLEYNUJpYMQxL7qCTihIjRMgS8ytNud8fD0+I7NQwt8b4v0Z5BrIvQVC9BQhEO9Xc3IqmToogBQLDCRsFyew1mCd4lexo2L0MTgEy32kwT+oZx6v6tqLvIPnlox+2V8882rX6Vs3FJPS7s+cotTHjVfvlQl0HizBLVuK5Zm5Pu1WnNPuN1xrlZxzUd6l/xYmvu5KSaBOrL0FeeY/KoGXlVRPQHwQ0r3PQXmzn/2SsndE7ronFSEWvN8VANHL0qC+shDOlwHN8vdnki5816q74gm5Vx7hlEfzkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8fjqCU1zBt0kaw2k73p8RiEk4i45HhQUPpIDIzPMctc=;
 b=Ne+aC41ltbdjW4K8EsKStmsvRp5b2jm3BO5X3UsViDk2aU2YrQg3yDBCvgq6pIKt8cknv0qdwu8dPEvE4aF1dvY1of07/1zfwZE58cXqy7fPA21GZQkcNk8TdapXpHazKop9mvZ68hbVggeF8QzS8Z6VaEfxuQC5G57LEM1toq6fuV9XQ+kFpFsfaK8xMQOV1fJE2/SmK39CWy2aL0VxvPrYy9Wig712skpeYxXBRISP5iq9EFGWfMzhLe3gixQW1DgXZSNJmMrZC5C88KtqRQuF+DDLdqxuGGozBMq8eushsJEeLbNl2SGL2c3h1QVsn7pnkZe8aCIsGUnNtP4x4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8fjqCU1zBt0kaw2k73p8RiEk4i45HhQUPpIDIzPMctc=;
 b=ASzWjDtnSBQSLWZlE78WYuIX0tA0c1ZeGHWP4sTg0XKLak6FUEEL47JskRvw/UrMbMpRLqP4auCiv81swViylN6ILNgBCwDlQRy5HZyHj+QdLQ2qkhD2Au/TmxJBxuqe8S6aPkphoJjY+wfe7aTuCKHxUyq5skxczM6ZCoq6NL0=
Received: from OSZPR01MB8611.jpnprd01.prod.outlook.com (2603:1096:604:18e::7)
 by TY3PR01MB11888.jpnprd01.prod.outlook.com (2603:1096:400:407::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Fri, 16 Feb
 2024 08:47:04 +0000
Received: from OSZPR01MB8611.jpnprd01.prod.outlook.com
 ([fe80::fc15:b39e:64d6:a1ea]) by OSZPR01MB8611.jpnprd01.prod.outlook.com
 ([fe80::fc15:b39e:64d6:a1ea%3]) with mapi id 15.20.7292.029; Fri, 16 Feb 2024
 08:47:04 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Marc Zyngier <maz@kernel.org>
CC: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
	<will@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>
Subject: RE: [PATCH] irqchip/gic-v3-its: Workaround Renesas R-Car GICv3 ITS
Thread-Topic: [PATCH] irqchip/gic-v3-its: Workaround Renesas R-Car GICv3 ITS
Thread-Index: AQHaXwWWBgwHldb+hEuciEuHRZB8L7EJq1+AgALxyoA=
Date: Fri, 16 Feb 2024 08:47:04 +0000
Message-ID:
 <OSZPR01MB86117352CF6EAB68ACBFF791D84C2@OSZPR01MB8611.jpnprd01.prod.outlook.com>
References: <20240214052050.1966439-1-yoshihiro.shimoda.uh@renesas.com>
 <865xyr5n3s.wl-maz@kernel.org>
In-Reply-To: <865xyr5n3s.wl-maz@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB8611:EE_|TY3PR01MB11888:EE_
x-ms-office365-filtering-correlation-id: 72d72d63-8ed3-44a2-6dec-08dc2ecbd977
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 qfNW19sfDLyMoLjiUVDWH7u72H89yonS8JB2Sio5FsXoS4xpEyUs/cifACy9gDCsx97xvX/R4bupZTuvVSInB2FynarggK+xRE9LipYAdcZpsdyL2N6rL8ACsJkIC+G8x+dr6tsVyPJF1auSg8vGdIlkgoJNPCXDdEiTZDKlvi1M7T5Xy1C3Cn5ls2Q0JJf23IDPnlPacekNDkOieAMKp7CoXM1pfGece6wzN7QQ+WdVJXnnFizv+/wwAOQyulwIBzd49aWJx7Uq4wgD3+bEoZrAASE7sNsi1w3ABck7EvFmx/EwL30XIJYxAW/hXlpzR4GRD5WG7lOzfK1+pb5il8yDu3CPj2bn9gjN3C+/74lKjbp4whLWkaE095awD0eAto3WvZtPmBZpo2NDcVGBEJ+rbkekna5qGmJDQGvXGfvftjHhVMap/PZbUve0JArbIwJX6vs82JmQ9CnhYw8yUF3AnVTvBZiWrkGTd/1xDpl05NXBt0FLhTtyUbHddaGG2piRFla/MiE5oJm7dRsgpd3AlVny/Sj0cx2epzpqbyewbCyxeDToYnUqpA5vBFa8H8bZt8VO2KeUldB/1sJv/G/iKrDPOiIG+AFQwrTlBus=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB8611.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(376002)(136003)(346002)(366004)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(55016003)(38070700009)(2906002)(66899024)(30864003)(52536014)(33656002)(4326008)(76116006)(6916009)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(8936002)(41300700001)(5660300002)(316002)(6506007)(7696005)(478600001)(9686003)(966005)(38100700002)(54906003)(86362001)(71200400001)(83380400001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?W8sIPUp1FPX5MU7+RXWMXHHLf9BL7Q9FUOBzRUzZyre4Q/UhzUwtp41wYXMQ?=
 =?us-ascii?Q?/txvXJKXhHaqqUef01q2CpI91j25M4LR3T4oqJXIq5gRqf71xn6Xsvo0OAkl?=
 =?us-ascii?Q?kyWJGnBxu05eflAR6Z7oli6SMTuORVeNp6D8fpYZCp63UMmSMYkwc77Us+w9?=
 =?us-ascii?Q?I6bQvFIWhFwyaBsrwpFDqJgdgZpiqkyLg64g3E+pZ617SZ30TxYHrE0sGtcP?=
 =?us-ascii?Q?wsG7MZ/tgCPiMRKbK5Dh23P29O6+i6teLAI+2f8swqNP5xPglYzgLS/ion0T?=
 =?us-ascii?Q?Ok6OHCJdrfHf2QSvDOjoqBpc3P74JXXGCNymx1IAgkCYp2lJcuqNwxPpFZBI?=
 =?us-ascii?Q?qmXAjQvBgrio2XsqmyKR8lvoiMSQYWhkOBdudRjTkdTQAlPhVe/9nDJQasPr?=
 =?us-ascii?Q?pPGGcauFtvk5Yt6eiVkMReLT77RXiMxBQ+om5TRD2ph3rxLgwwZFKK1Yh6yd?=
 =?us-ascii?Q?Lz9yc1DZE8N0t2B4eMmAsOEynRMWZpHqaM5+fhwTdFZzjih2wym9IQLtFQnz?=
 =?us-ascii?Q?7q660AFrvlFdAnLBEYOvK6vs5xs9qeftlM5diEKhWcU+eHdZL5zBBhZRQyuz?=
 =?us-ascii?Q?Zq4EBZHK/9r7HqMIafdO5RiETA+h6OxnpyF9rlls9HsL6zERxnIH6gEYElFu?=
 =?us-ascii?Q?pIxNEhQ1G5vqKtJjvFiq0137gGK0z/89AzkM7vzei2EQdvoPN771rIsqFlLK?=
 =?us-ascii?Q?sFgWPFor5WHcmpge0zjlUWWrVhteVwvG8ona6i3l+m53uZJHCzGkZIIaggjD?=
 =?us-ascii?Q?rHmZxbb/OPDdTO+LQJnGajeoun9z86dGfubCt5Ga0Am0YeFPIVUX/R8loIUC?=
 =?us-ascii?Q?SLb+sV+s2RBYOx+etiB/FbYdfBKI3+KstgyCGWgGvV8qXjkSvAg2qENO9UL9?=
 =?us-ascii?Q?XTnuytwgZU1jvVQFKAvPh2JvOtGRldhCq/afNzf9lqWyz4g8bD8dEeRNXIdz?=
 =?us-ascii?Q?F0mfPFP4RJ+K7Sej/LUMLUpPqdKBzTWm2TlKp/UjUQxIMaFxptCBwGpo3fdu?=
 =?us-ascii?Q?ove9rL93+W6witqnoveVVQGHhaEi2gDfKXgUsjqFWMWI63XilMCeZbNVacLz?=
 =?us-ascii?Q?DoN5JKmKZ2ii7nMvjBZ9dufWXQLbgRKdSSDjvjLd4l9ga4VSFlA02TVwsYrd?=
 =?us-ascii?Q?8xjWTYu0c0pAhVHWx05UODeNIQNN5wVXGRbIUK0ZoxCnhK027fLuY06L/9W4?=
 =?us-ascii?Q?brcqLtzGKqk+T6FYNSqCWpUgojxedg9I2xvcKWVlySVknymOr97kGmCPNUW0?=
 =?us-ascii?Q?DAGS31i5laeSJ44Dx3zS+JFGZOFwGSZ7IV2NNBCC2cY3e4J3JHCrSek3UuW7?=
 =?us-ascii?Q?GCbxxiSFQznG/6H6V9GJLd0ubaRUNx5L+87kuiG8XR91cpJlVKqsqkT3EZ0U?=
 =?us-ascii?Q?mp8kNo9ZFe8s8BxnWdWbh49RB0L9A4i4TdKvKb2YApiLXSWoM2nLoOee1q5p?=
 =?us-ascii?Q?scoEag9hcdsvw2/bfvSkth42GC/mjGu9FuLGJc0NR22zHZoI2zGSE143u/HK?=
 =?us-ascii?Q?cLA83ywYQl8P0bU41Gyt75rqKw/CpySxFO1udw/CylY25aeNwKPdRybbUg0o?=
 =?us-ascii?Q?Fx0xqbEAqpd3I+gA+w/tGG6tRUorwaKIQ9sMV0GVz2tppZhQufHYI6cFt5pE?=
 =?us-ascii?Q?LOW6RIapKG9MWzaWnSw00f/Bfd0VXm0RC91GjzOpfnIF8VHuiGTgiGdGxU0a?=
 =?us-ascii?Q?FLFQLQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB8611.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d72d63-8ed3-44a2-6dec-08dc2ecbd977
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2024 08:47:04.0893
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JkGwlYnK80NXdpAiaAWJg0+lWFkqQwkgVJNZw7yQATTFu0X941bWB4tZfER7+qRxmosUQWwjBlXQLuo63ad5sZweoJu0jkc669ZBLCYQLNun1/zvbFg2hzw1vTJm3hse
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11888

Hi Marc,

Thank you for your review!

> From: Marc Zyngier, Sent: Wednesday, February 14, 2024 7:58 PM
>=20
> [+ Geert, who deals with Renesas SoCs on a daily basis]
>=20
> Hi Yoshihiro,
>=20
> On Wed, 14 Feb 2024 05:20:50 +0000,
> Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com> wrote:
> >
> > The GICv3 ITS on Renesas R-Car has limitations:
> >  - It can access lower 32-bits memory area only.
> >  - It cannot use Sharable/cache attributes.
> >
> > So, set ITS_FLAGS_FORCE_NON_SHAREABLE flag, and set GFP_DMA to all
> > memory allocation APIs for getting lower 32-bits memory area on
> > the R-Car. Note that GFP_DMA32 cannot work correctly because
> > the environment doens't have DMA32 zone like below:
>=20
> nit: doesn't

Oops. I'll fix it.

> >
> > [    0.000000] Zone ranges:
> > [    0.000000]   DMA      [mem 0x0000000048000000-0x00000000ffffffff]
> > [    0.000000]   DMA32    empty
> > [    0.000000]   Normal   [mem 0x0000000100000000-0x00000004ffffffff]
>=20
> Unfortunately, none of that is a universal truth. The way DMA and
> DMA32 are expressed is pretty variable. See this for example:
>=20
> https://lore.kernel.org/all/cover.1703683642.git.baruch@tkos.co.il/
>=20
> So I can't see how you can reliably rely on this layout. It may work
> today on your platform, but I wouldn't take this as a guarantee.

So, IIUC, I should use DMA API for it instead.

> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  arch/arm64/Kconfig               |  9 +++++
> >  drivers/irqchip/irq-gic-v3-its.c | 59 +++++++++++++++++++++-----------
> >  2 files changed, 48 insertions(+), 20 deletions(-)
> >
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index c1a16a9dae72..49fe3006e142 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1250,6 +1250,15 @@ config SOCIONEXT_SYNQUACER_PREITS
> >
> >  	  If unsure, say Y.
> >
> > +config RENESAS_RCAR_GIC_ITS
> > +	bool "Renesas R-Car: Workaround for GICv3 ITS"
> > +	default n
> > +	help
> > +	  Renesas R-Car Gen4 SoCs has a limitation about GICv3 ITS which can
> > +	  access lower 32-bits memory address range only.
> > +
> > +	  If unsure, say Y.
>=20
> Either this should be 'default y', or you should drop this last line.
> Being 'default n' and saying 'if you don't know, say y' is
> counterproductive.

I got it. I'll fix it.

> Also:
>=20
> - This must carry an official erratum number
>=20
> - You must document it in Documentation/arch/arm64/silicon-errata.rst

I got it.

> > +
> >  endmenu # "ARM errata workarounds via the alternatives framework"
> >
> >  choice
> > diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic=
-v3-its.c
> > index d097001c1e3e..e0e672b561b9 100644
> > --- a/drivers/irqchip/irq-gic-v3-its.c
> > +++ b/drivers/irqchip/irq-gic-v3-its.c
> > @@ -186,6 +186,7 @@ static LIST_HEAD(its_nodes);
> >  static DEFINE_RAW_SPINLOCK(its_lock);
> >  static struct rdists *gic_rdists;
> >  static struct irq_domain *its_parent;
> > +static gfp_t its_gfp_quirk;
>=20
> Why is that global? Why isn't this computed on a per-ITS basis? Since
> you are introducing a generic mechanism here, you shouldn't assume
> that all ITSs are subjected to the same issue.

Since some functions doesn't have struct its_node, I think adding the argum=
ent
makes complex the code.  I'll avoid to use a global value somehow.

> >
> >  static unsigned long its_list_map;
> >  static u16 vmovp_seq_num;
> > @@ -1846,7 +1847,7 @@ static int its_vlpi_map(struct irq_data *d, struc=
t its_cmd_info *info)
> >  		struct its_vlpi_map *maps;
> >
> >  		maps =3D kcalloc(its_dev->event_map.nr_lpis, sizeof(*maps),
> > -			       GFP_ATOMIC);
> > +			       GFP_ATOMIC | its_gfp_quirk);
>=20
> This data structure is never exposed to the GIC. Why do we need to
> constraint this allocation?

I'm sorry, I didn't understand that. I'll drop this.

> >  		if (!maps) {
> >  			ret =3D -ENOMEM;
> >  			goto out;
> > @@ -2044,7 +2045,7 @@ static struct lpi_range *mk_lpi_range(u32 base, u=
32 span)
> >  {
> >  	struct lpi_range *range;
> >
> > -	range =3D kmalloc(sizeof(*range), GFP_KERNEL);
> > +	range =3D kmalloc(sizeof(*range), GFP_KERNEL | its_gfp_quirk);
>=20
> Same thing.

I'll drop this.

> >  	if (range) {
> >  		range->base_id =3D base;
> >  		range->span =3D span;
> > @@ -2169,7 +2170,7 @@ static unsigned long *its_lpi_alloc(int nr_irqs, =
u32 *base, int *nr_ids)
> >  	if (err)
> >  		goto out;
> >
> > -	bitmap =3D bitmap_zalloc(nr_irqs, GFP_ATOMIC);
> > +	bitmap =3D bitmap_zalloc(nr_irqs, GFP_ATOMIC | its_gfp_quirk);
>=20
> Same thing.

I'll drop this.

> >  	if (!bitmap)
> >  		goto out;
> >
> > @@ -2201,7 +2202,7 @@ static struct page *its_allocate_prop_table(gfp_t=
 gfp_flags)
> >  {
> >  	struct page *prop_page;
> >
> > -	prop_page =3D alloc_pages(gfp_flags, get_order(LPI_PROPBASE_SZ));
> > +	prop_page =3D alloc_pages(gfp_flags | its_gfp_quirk, get_order(LPI_PR=
OPBASE_SZ));
>=20
> This only affects the redistributors. Why should we constraint it?

To be honest, I don't know why, but this is required on my environment.
Otherwise, the MSI interrupt never happens.
Anyway, I should have learned the hardware bug in detail...

> >  	if (!prop_page)
> >  		return NULL;
> >
> > @@ -2335,7 +2336,7 @@ static int its_setup_baser(struct its_node *its, =
struct its_baser *baser,
> >  		order =3D get_order(GITS_BASER_PAGES_MAX * psz);
> >  	}
> >
> > -	page =3D alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO, or=
der);
> > +	page =3D alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO | i=
ts_gfp_quirk, order);
> >  	if (!page)
> >  		return -ENOMEM;
> >
> > @@ -2808,7 +2809,7 @@ static bool allocate_vpe_l2_table(int cpu, u32 id=
)
> >
> >  	/* Allocate memory for 2nd level table */
> >  	if (!table[idx]) {
> > -		page =3D alloc_pages(GFP_KERNEL | __GFP_ZERO, get_order(psz));
> > +		page =3D alloc_pages(GFP_KERNEL | __GFP_ZERO | its_gfp_quirk, get_or=
der(psz));
> >  		if (!page)
> >  			return false;
> >
> > @@ -2860,7 +2861,7 @@ static int allocate_vpe_l1_table(void)
> >  	if (val & GICR_VPROPBASER_4_1_VALID)
> >  		goto out;
> >
> > -	gic_data_rdist()->vpe_table_mask =3D kzalloc(sizeof(cpumask_t), GFP_A=
TOMIC);
> > +	gic_data_rdist()->vpe_table_mask =3D kzalloc(sizeof(cpumask_t), GFP_A=
TOMIC | its_gfp_quirk);
>=20
> This is a cpumask allocation, not exposed to the GIC. What is the
> reason for constraining it?

I'm sorry, I didn't understand the specification.
I'll drop this.

> >  	if (!gic_data_rdist()->vpe_table_mask)
> >  		return -ENOMEM;
> >
> > @@ -2927,7 +2928,7 @@ static int allocate_vpe_l1_table(void)
> >
> >  	pr_debug("np =3D %d, npg =3D %lld, psz =3D %d, epp =3D %d, esz =3D %d=
\n",
> >  		 np, npg, psz, epp, esz);
> > -	page =3D alloc_pages(GFP_ATOMIC | __GFP_ZERO, get_order(np * PAGE_SIZ=
E));
> > +	page =3D alloc_pages(GFP_ATOMIC | __GFP_ZERO | its_gfp_quirk, get_ord=
er(np * PAGE_SIZE));
> >  	if (!page)
> >  		return -ENOMEM;
> >
> > @@ -2957,7 +2958,7 @@ static int its_alloc_collections(struct its_node =
*its)
> >  	int i;
> >
> >  	its->collections =3D kcalloc(nr_cpu_ids, sizeof(*its->collections),
> > -				   GFP_KERNEL);
> > +				   GFP_KERNEL | its_gfp_quirk);
>=20
> Same thing.

I'll drop this.

> >  	if (!its->collections)
> >  		return -ENOMEM;
> >
> > @@ -2971,7 +2972,7 @@ static struct page *its_allocate_pending_table(gf=
p_t gfp_flags)
> >  {
> >  	struct page *pend_page;
> >
> > -	pend_page =3D alloc_pages(gfp_flags | __GFP_ZERO,
> > +	pend_page =3D alloc_pages(gfp_flags | __GFP_ZERO | its_gfp_quirk,
> >  				get_order(LPI_PENDBASE_SZ));
>=20
> This is a redistributor-private allocation. If it is the ITSs that are
> affected by this bug, why are the pending tables constrained?

Thank you for the comment. This is not needed on my environment.
So, I'll drop it.

> >  	if (!pend_page)
> >  		return NULL;
> > @@ -3319,7 +3320,7 @@ static bool its_alloc_table_entry(struct its_node=
 *its,
> >
> >  	/* Allocate memory for 2nd level table */
> >  	if (!table[idx]) {
> > -		page =3D alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO,
> > +		page =3D alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO | =
its_gfp_quirk,
> >  					get_order(baser->psz));
> >  		if (!page)
> >  			return false;
> > @@ -3415,7 +3416,7 @@ static struct its_device *its_create_device(struc=
t its_node *its, u32 dev_id,
> >  	if (WARN_ON(!is_power_of_2(nvecs)))
> >  		nvecs =3D roundup_pow_of_two(nvecs);
> >
> > -	dev =3D kzalloc(sizeof(*dev), GFP_KERNEL);
> > +	dev =3D kzalloc(sizeof(*dev), GFP_KERNEL | its_gfp_quirk);
> >  	/*
> >  	 * Even if the device wants a single LPI, the ITT must be
> >  	 * sized as a power of two (and you need at least one bit...).
> > @@ -3423,14 +3424,14 @@ static struct its_device *its_create_device(str=
uct its_node *its, u32 dev_id,
> >  	nr_ites =3D max(2, nvecs);
> >  	sz =3D nr_ites * (FIELD_GET(GITS_TYPER_ITT_ENTRY_SIZE, its->typer) + =
1);
> >  	sz =3D max(sz, ITS_ITT_ALIGN) + ITS_ITT_ALIGN - 1;
> > -	itt =3D kzalloc_node(sz, GFP_KERNEL, its->numa_node);
> > +	itt =3D kzalloc_node(sz, GFP_KERNEL | its_gfp_quirk, its->numa_node);
> >  	if (alloc_lpis) {
> >  		lpi_map =3D its_lpi_alloc(nvecs, &lpi_base, &nr_lpis);
> >  		if (lpi_map)
> >  			col_map =3D kcalloc(nr_lpis, sizeof(*col_map),
> > -					  GFP_KERNEL);
> > +					  GFP_KERNEL | its_gfp_quirk);
>=20
> This is kernel-private memory, not visible by the GIC.

I'll drop this.

> >  	} else {
> > -		col_map =3D kcalloc(nr_ites, sizeof(*col_map), GFP_KERNEL);
> > +		col_map =3D kcalloc(nr_ites, sizeof(*col_map), GFP_KERNEL | its_gfp_=
quirk);
>=20
> Same thing.

I'll drop this.

> >  		nr_lpis =3D 0;
> >  		lpi_base =3D 0;
> >  	}
> > @@ -4754,6 +4755,16 @@ static bool __maybe_unused its_enable_rk3588001(=
void *data)
> >  	return true;
> >  }
> >
> > +static bool __maybe_unused its_enable_renesas_rcar_gic_its(void *data)
> > +{
> > +	struct its_node *its =3D data;
> > +
> > +	its->flags |=3D ITS_FLAGS_FORCE_NON_SHAREABLE;
> > +	its_gfp_quirk =3D GFP_DMA;
> > +
> > +	return true;
> > +}
> > +
> >  static bool its_set_non_coherent(void *data)
> >  {
> >  	struct its_node *its =3D data;
> > @@ -4815,6 +4826,14 @@ static const struct gic_quirk its_quirks[] =3D {
> >  		.mask   =3D 0xffffffff,
> >  		.init   =3D its_enable_rk3588001,
> >  	},
> > +#endif
> > +#ifdef CONFIG_RENESAS_RCAR_GIC_ITS
> > +	{
> > +		.desc   =3D "ITS: Renesas R-Car Gen4 GICv3 ITS",
> > +		.iidr   =3D 0x0201743b,
> > +		.mask   =3D 0xffffffff,
> > +		.init   =3D its_enable_renesas_rcar_gic_its,
> > +	},
>=20
> Huh. This describes a GIC600 implemented by ARM. Which means your are
> actively forcing your quirk on *every* implementations, including
> those that are not affected by this hardware issue. Definitely not
> acceptable.

I understood it. I'll add a condition like its_enable_rk3588001() to
affect this quirk for my environment only. I believe that such adding
condition is acceptable because the CONFIG_ROCKCHIP_ERRATUM_3588001
is the same iidr value of my environment.

> >  #endif
> >  	{
> >  		.desc   =3D "ITS: non-coherent attribute",
> > @@ -4974,7 +4993,7 @@ static int its_init_domain(struct its_node *its)
> >  	struct irq_domain *inner_domain;
> >  	struct msi_domain_info *info;
> >
> > -	info =3D kzalloc(sizeof(*info), GFP_KERNEL);
> > +	info =3D kzalloc(sizeof(*info), GFP_KERNEL | its_gfp_quirk);
>=20
> Kernel memory only.

I'll drop it.

> >  	if (!info)
> >  		return -ENOMEM;
> >
> > @@ -5011,7 +5030,7 @@ static int its_init_vpe_domain(void)
> >
> >  	entries =3D roundup_pow_of_two(nr_cpu_ids);
> >  	vpe_proxy.vpes =3D kcalloc(entries, sizeof(*vpe_proxy.vpes),
> > -				 GFP_KERNEL);
> > +				 GFP_KERNEL | its_gfp_quirk);
> >  	if (!vpe_proxy.vpes)
> >  		return -ENOMEM;
> >
> > @@ -5108,7 +5127,7 @@ static int __init its_probe_one(struct its_node *=
its)
> >  		}
> >  	}
> >
> > -	page =3D alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO,
> > +	page =3D alloc_pages_node(its->numa_node, GFP_KERNEL | __GFP_ZERO | i=
ts_gfp_quirk,
> >  				get_order(ITS_CMD_QUEUE_SZ));
> >  	if (!page) {
> >  		err =3D -ENOMEM;
> > @@ -5352,7 +5371,7 @@ static struct its_node __init *its_node_init(stru=
ct resource *res,
> >
> >  	pr_info("ITS %pR\n", res);
> >
> > -	its =3D kzalloc(sizeof(*its), GFP_KERNEL);
> > +	its =3D kzalloc(sizeof(*its), GFP_KERNEL | its_gfp_quirk);
>=20
> Kernel memory only.

I'll drop it.

> >  	if (!its)
> >  		goto out_unmap;
> >
> > @@ -5520,7 +5539,7 @@ static void __init acpi_table_parse_srat_its(void=
)
> >  		return;
> >
> >  	its_srat_maps =3D kmalloc_array(count, sizeof(struct its_srat_map),
> > -				      GFP_KERNEL);
> > +				      GFP_KERNEL | its_gfp_quirk);
>=20
> Kernel memory only.

I'll drop it.

> >  	if (!its_srat_maps)
> >  		return;
> >
>=20
> I suggest that you start reading the architecture spec and understand
> what is the memory that is accessible by the GIC, because at least
> half of this patch is completely unnecessary.
>=20
> You also need to be clear about what is affected by this bug: ITS
> only? or also the RDs?  If both are affected, they need to be handled
> separately.
>=20
> In any case, you must not assume that all ITSs in a system are
> subjected to this bug, which means that you must have per-ITS tracking
> of the GFP flags.
>=20
> Finally, the DMA story itself needs to be sorted out, because you are
> relying on something that is incredibly fragile.

Thank you very much for your suggestion. I'll learn the architecture spec
and reconsider the implementation, especially DMA related.

Best regards,
Yoshihiro Shimoda

> HTH,
>=20
> 	M.
>=20
> --
> Without deviation from the norm, progress is not possible.

