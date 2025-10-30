Return-Path: <linux-renesas-soc+bounces-23908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1D5C20B27
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 15:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B46F34E28F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 14:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6E5275860;
	Thu, 30 Oct 2025 14:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qRS0jwkK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011020.outbound.protection.outlook.com [40.107.74.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B6E37A3D1;
	Thu, 30 Oct 2025 14:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761835436; cv=fail; b=Ezn6jklzKc2YH9gSxqMJUPPFJygjPjqMiI3k0nyyDfzjJpTOuujaVr5AuSQEQQwb7Fy0Un5LA2W37ANgDvneK+F2XsNvlpyl1l3Ldw/vBo53aRNl5g77zCP2fkF5y/zWSFzCUNBjOEC3lf+taxYzeOlUdTnYXCvWQNu5q8nqQwM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761835436; c=relaxed/simple;
	bh=Uh82FsvQLSDilA1zBZaR8XrBiodAWei0VSIICbWtWzw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jyfk58mfVFtIG1A/yfOMwG+811JGiv0alLWhlpYNqAu33mt3QnXMXbAyDjzlVvzQISRypkgf64SmraXE2xNxTWI7zJc5RydmUn1mP683fBiIEM/zk+vWwoLrh9MZnXBYm1sDogApMOLY5KOeR9VRk0ORnN28RK/j2vOzVZ7L/dU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qRS0jwkK; arc=fail smtp.client-ip=40.107.74.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiUfhxBKCAYXee+aU2TDMLfTIk6DnZrmPmmwMP6a6jtOm+b25KNBo0iSu0lG0shuqvNuV8TOx+vziOMxLCTvwxqe7/IR92tdbMjpc7B5RSsqLviU6qrRyuM3Q4l53yqdxWxnsrat+n1kB4bwQrtMpnQnFGMuk2AOo5TjMwCrzVy9tZNrN/wr5QYLGeeXA17KWP86rgn3iPKErui+3xLjhBLKjZFFmBQ/wQFg4SQQYQmSWEmbAd7wrEDg0oRM7a12jFwRyOgDJUIjJC3qNu8ovnkB4iQ634BWyFecNNWwg+maemEMEo1raWy9ro8lBpDB21rlogtw9Wgil99e9g7Hkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2L3E5eN2R/CBNZ2KnfmxW6dLbl5Yx+Fty8sNtedEA4=;
 b=r/AD/BhE2WkNvZsJ+zjyF0SV9o4iMs/qTF2/KmspGivzuFSs2SsaJeehr6bMrOWCRvxD60uygcixmLFnDRFwePnGPnjKFVkc1LVz2Lr/wx5hhudGqCHJuyY2bXCY/urt5fYspyY3OMippkA8bt9acOABmqY2BFQg3qfW82YoFTsZdXSaPU22z+SigxfqaKpfYd8GLX7iHbu620lDpkBMGp019CGSaB2wq534FJDx3dxD3VsBx21L6ucK7VXQkq6LbJpX4RyEflspV3LFgFk3Is1Ilb6uOPej+b9tmbMMJu8Y0a/PbNibw2GL1YdTHM9hNudJ0ohuh76W02MsLQneTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2L3E5eN2R/CBNZ2KnfmxW6dLbl5Yx+Fty8sNtedEA4=;
 b=qRS0jwkK2YpuUbBbnHJLPEYUhbBGUOn/VAAIgFyznFSB3Tdb0U3+HEj8ax85HRPBbgXjrcm1NJ+yXRJZ7QeHjAg7koYOFFrg/w/BKzpuL3kkJgyELOcX31Kljh5cXDsxvBhG701sJrp5b+GlNl7LlTVrTMw9dAsFoyGMVcSQCto=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12983.jpnprd01.prod.outlook.com (2603:1096:405:1be::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 14:43:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 14:43:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Nam Cao <namcao@linutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 06/19] serial: sh-sci: Drop extra line
Thread-Topic: [PATCH 06/19] serial: sh-sci: Drop extra line
Thread-Index: AQHcR1joEmhfH/DT9kSakwF/vQFQdLTXoXGAgAMm1dA=
Date: Thu, 30 Oct 2025 14:43:48 +0000
Message-ID:
 <TY3PR01MB1134643E5C40AE82FF1EF045F86FBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251027154615.115759-1-biju.das.jz@bp.renesas.com>
	<20251027154615.115759-7-biju.das.jz@bp.renesas.com>
 <20251028103513.a107e9765c73926ceca8454a@hugovil.com>
In-Reply-To: <20251028103513.a107e9765c73926ceca8454a@hugovil.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12983:EE_
x-ms-office365-filtering-correlation-id: 6ba9e811-94cb-4d0f-1b09-08de17c2bcaf
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?gkxunAyejIMfvuTyeqBPcMsc2HRb977h2NHbnVqFc+d4YD+e7Pl+NbeN7jiU?=
 =?us-ascii?Q?KiUiQVQ+mHjnE5YWS00FiY8pusUgwcX/DHDS90RwdHRxhHkxSy9XWH7F9IMd?=
 =?us-ascii?Q?DH6S8EyZ29pRBl9OiFtdkbXzVZVF7KudSwarGYFdOA9MwtI+zsc/KXhlmYB0?=
 =?us-ascii?Q?ZkQt21rtMEUqzykBJlu4lEbRhLZRsER2rA0WXsggDIviLuZzoTBfVmxNR8wP?=
 =?us-ascii?Q?E/cqIxZilOtuMo045DqmM1lnKQzPYU8qXNL7PX8xh0NXNXtBOpykL/S7QwlC?=
 =?us-ascii?Q?Hkhfa8bUoclorkj3LipXTi7K1IUOQTw6qjYBkOjn+rOEcJTojDnbCnLOmYEE?=
 =?us-ascii?Q?UBftM9jAPp7woeEBq34uyWe3h9lQ8NjL0rXj4LyenJzVsIC1WHJwwnNpc87w?=
 =?us-ascii?Q?rCz6SiTTd7pdTfUfp+imxmYWkDDVObZswXJKmoCI7S1JONRrmYz4vpBGYcqp?=
 =?us-ascii?Q?+PxxwFZWv9dEzRuTIV4S7/oAE51KdJEBEiafU603vVuFPT2NOSYhGmFeJqDM?=
 =?us-ascii?Q?s5kKt3aVNfrBLRxH/2X0BAsZUP6iPyd3SmeiD6hefdr5sqoJPua1JjPiy9Es?=
 =?us-ascii?Q?6yYN0AGWoobPYAY1OhiQ3+pXCGow+iL3CQWHc/x7UEpsioeI+ckPwM/lHHYX?=
 =?us-ascii?Q?yyMbE7Tq6uWSApfh9c7JtIkmmo9t0m17m2WPBI4GPh3Dd3AwDu/eJ8mmbsNG?=
 =?us-ascii?Q?xDm+OMwpLUiBpsGuF6jLFyfWZYpiPLdpPGPc/h8IJDGpD90QRHLvUkiyUwac?=
 =?us-ascii?Q?DnXRYbBQxhup5t3nQCT2KMlpaQULI9FTe1VudLk+LyCp0qUpiK4wPY6N7OtF?=
 =?us-ascii?Q?vide6VfnX/gxIOwB+IoPDz09cBJZMBkNiCuib1kYvJiwL0IOUKPlkBDfzjul?=
 =?us-ascii?Q?qAYzX39L0EIljuWB+saTAUw9KAqg8ZjsordzzaVPSzQ5kADc/Y8nQDh4J7gC?=
 =?us-ascii?Q?OUhYp3DouoUrrGztSP+Q7ZHJ+wLNsrSrNnfMVE2i0aM1+eOdAi9szjm3o8DN?=
 =?us-ascii?Q?dMQrlCGZVQ1/vK+XWN2VmQ41vjNzreKNibbIV3Btj4wOfE+1C+19Ht+UIrAe?=
 =?us-ascii?Q?4KAkcHaCT40SwVFqIyHuRyqj6OpVEaG6HXfxTMEP6oq0ZoKEkbTBWUI3QQTP?=
 =?us-ascii?Q?Tn2zr44Zqv7edDwId4WIN0a9gukYZC++a+MRWXRY6AERSFHT76VriMGsDT20?=
 =?us-ascii?Q?Mf59J3ci7p24jIrDRHe+6QjIIEqqRK/bHej/3zqZ/ZdNKgWA4JQHUUjhdFwa?=
 =?us-ascii?Q?EROPxSgotL+7qaEkSv4ZA5ts8oZFq+nKM6CCav0fGnEJV/IcnxvjhohIOiAh?=
 =?us-ascii?Q?ETBYvwwc2nBOgLwKCKCNnwDoc7tZnauEcXH8/c4kx4Z0hMS2HBJvqvR1wcAH?=
 =?us-ascii?Q?knMRIIkVtQxJX6t3duy+4dAIuAgdhtZCecSNnQucmYwUNM07leuR/gSpdHX0?=
 =?us-ascii?Q?GEd8AxTSWXGwHk2mKWhVBNhiMqwzU/+TELudl679taJPv7lwYNSqZ7X+ScM9?=
 =?us-ascii?Q?/GKWSuLBaWgx6xNGzF0WJ8Etw4P8CKRUtcep?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?5UVe6/1tUMDL1OB0nICKjqY+rVXyfmk2oUZKJubYwdxkr+7wpyQ7xuZo+k8x?=
 =?us-ascii?Q?ylBs0kdRLNLVe/qu41KRqaXFS3jJearxsgTYtIlSMPKu6v6Z4worxt61EWR+?=
 =?us-ascii?Q?XFPLuoGU44prInwor+oGaEp4z8hQaPJpSBpo3vMnTEje4Qysy9AlkoWQ6Ok3?=
 =?us-ascii?Q?3KCbf+LJr9STwzdKbdNOaAnBslcVXdMHOozOkzPOJftF7ugcqRUJ77iZtPRc?=
 =?us-ascii?Q?WNPHW+3NYGeJdUZQ02gmq2fzNgdJAKUVD8iD2OX1vy++GLScl2a+nl1LVl7m?=
 =?us-ascii?Q?VVrYM8KJcN0mWX2ubp+X+1+zysefQniQ3fhoGDg2xQELjKW9l5wJW3AsrWJj?=
 =?us-ascii?Q?ohgyWz8qVkiOSKzvkYlFy3goqOgMbNjUvQmVIrUws+yggLhON/y4BisMotY3?=
 =?us-ascii?Q?FZe6oGgy6fxDACdFGnVcZMU50J2jDPjPMU46RkJeFmhwePT2vmasfylIJm9+?=
 =?us-ascii?Q?rjnDsBrOgFToVzWqJM/Ef/r/w//nSbSxyBvxP8AH6veVPZD8EzOigzwVJAvb?=
 =?us-ascii?Q?WZvo8Oq9KmekZYceHXJB302/HUNs0GXCRI88ZqMbHFdyJoToq+Yz0g36BjUN?=
 =?us-ascii?Q?7deSNFDCQAv0YNVBIAZUCv1nCp6Lb+zaDU1GzskEroWyvMYudURoHQSeAVLa?=
 =?us-ascii?Q?ifN0rgsv2yiTmiMzV4niOBxZ4i7SqJfwItUcEJjE27+GWqdt8+XiliYJlg7Y?=
 =?us-ascii?Q?Cc5eobvKDzAibHo7FEvPr9s2oI6XVIDQ4EJ6cwIz8c2VJAQkXj5BXDznYCXG?=
 =?us-ascii?Q?Nh3X50AtQf7repu6ESpfpQDO0euhnkrK2JRlG6aYyKVY27GOvxPck/4Fu0uM?=
 =?us-ascii?Q?pEAYto0retlA8VIfi/TPXdFFJm+fLaBU8cO6FyKUV6XOS3FYIyVKC5o+MrLG?=
 =?us-ascii?Q?aZqYbrmgu97NYChHdOORIRlLVM+zrrRk/bjXLABTBA1L5s6U8CO5HD5Zn1uW?=
 =?us-ascii?Q?5W38jK1VcEDZQYD23ii5k+rHZ936MlUksODQo6CgLDGDIMgcyYACFaeqbWsQ?=
 =?us-ascii?Q?j6N57XmCrHMZcxlbpZ1CCaaRtTzJlMntNacGw75bp+HWK0SBcziPKsEgtZJh?=
 =?us-ascii?Q?lqtrSxQc40/cETbC8ApkqvmMlDuAT3cxi62zdBAeVzjJQWDfD/5plbWMQHfb?=
 =?us-ascii?Q?7awOzE1rJKz3tt5zmgp5ED5lK6+tLMr5mCcG7M/yckFitCtu27pzlOeODr+m?=
 =?us-ascii?Q?th7VQLw4JdTNwbygIShRUdA8sn7sQDLPs36e1SaVZ62x6iVN6yzrHKqsZoxM?=
 =?us-ascii?Q?PaDgAq4c+ncaIHA1EYNB6iIB0CNCjP0AvD3bkAW/amIIctzA+9dkQR+1ZsqQ?=
 =?us-ascii?Q?RSx/NMqZ5YDzReq9kuEwapur+4fW+ewghqdSWlTjLk72j+go07L3Utqci5v+?=
 =?us-ascii?Q?kX0xY6n5OJ2FsN8PTn545jOoyq6dfy2lfjYb7dv1kKiO6dFJ1wJRJMK0I/TH?=
 =?us-ascii?Q?VpWXClKSuMwwp7vsdgShhAY53lWT/OHsLvI+uyBOnfrdZiB+hHbPPTGpE2+9?=
 =?us-ascii?Q?VD9JLDglOFITh/oFGwn+nqh8rmBzP5jGB/OKXi7B1WafazTV1MvvOibkYE+2?=
 =?us-ascii?Q?WCo66iRYd/Xy/1o0P06jjX2ZUg8Yrct9UBvC11yKLiCVYXPy2HtP6q0FwQS0?=
 =?us-ascii?Q?FA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba9e811-94cb-4d0f-1b09-08de17c2bcaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 14:43:48.9326
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3t8GR8Qp4QzgwHFlhCAqgeodeM4LGNQIqC5O9ZIgQirtgD9VBsE9fDOTGmuwunsZjZ/Fxj9KJRGKK+N8Pfs0HZSUMz4E8wntDzx84cW1mmc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12983

Hi Hugo,

> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com>
> Sent: 28 October 2025 14:35
> Subject: Re: [PATCH 06/19] serial: sh-sci: Drop extra line
>=20
> Hi Biju,
>=20
> On Mon, 27 Oct 2025 15:45:53 +0000
> Biju Das <biju.das.jz@bp.renesas.com> wrote:
>=20
> > Shorten the number lines in sci_init_clocks() by fitting the error
> > message within an 80-character length limit.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/tty/serial/sh-sci.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> > index b33894d0273b..699c39b81c4b 100644
> > --- a/drivers/tty/serial/sh-sci.c
> > +++ b/drivers/tty/serial/sh-sci.c
> > @@ -3009,8 +3009,7 @@ static int sci_init_clocks(struct sci_port
> > *sci_port, struct device *dev)
> >
> >  		if (!clk && sci_port->type =3D=3D SCI_PORT_RSCI &&
> >  		    (i =3D=3D SCI_FCK || i =3D=3D SCI_BRG_INT)) {
> > -			return dev_err_probe(dev, -ENODEV,
> > -					     "failed to get %s\n",
> > +			return dev_err_probe(dev, -ENODEV, "failed to get %s\n",
> >  					     name);
>=20
> You can even put it all on one line with the now 100 columns limit.

Ok will fit into 100 columns limit.

Cheers,
Biju

