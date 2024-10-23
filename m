Return-Path: <linux-renesas-soc+bounces-9977-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5AC9ABF72
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 08:58:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9DF3B25013
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 06:58:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E3F1531C2;
	Wed, 23 Oct 2024 06:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cIOwMiaA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010016.outbound.protection.outlook.com [52.101.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E76B14B945;
	Wed, 23 Oct 2024 06:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729666666; cv=fail; b=A2/kd7EK4KXK3hNLQSOBmG8RpitBgGNyTPgXloycwL6P1fuGq4/nsNqoBSmYE6dBOvTEyH2d4tDZao5sd5u8YhTFl1h7/VxKIgwmno6m3/P0cKyyWee2aoB799VyF0kW0ZdA0ijIbRq48qSIp101TmWOREvcu2i2PiFiyyTtEjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729666666; c=relaxed/simple;
	bh=UXEvEl/Ft341x3Lt4g+2jjR5r6O2lOP+5NWoG3KWRYg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bNGHQyaoB/D26wwEet5Aeu2yVlYmzEsiyfGClr3bOOqmUkB0w8046+ph7Dd7RCJaG8n6IZn/PK2I/E9F2f8JRUGEFjCUu7iP6uftc3edEAB9sQ1VbIuKBL/f7LntQoDLfUsK3uPmrtasi+v2AdcvJNFuCook5XZm1b8xX8HjIoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=cIOwMiaA; arc=fail smtp.client-ip=52.101.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nj150iXDNtuaAryT5PXC6K3+sXqBqJBZt1fLaqNyCQ93y0PXDSadXLjbJXFRkjju8AjZZpZYww12wIyVkSrS6hlFJ4Ki9GaMl0JwPH4pTiuzLgGCvEhz0uv1fYA8THExWQ2tZlfvFvMNu0+CHQ9DyOF8s50Fm8XV2kMDrOk6WKudnnoI/TpJ3EbEr1CGX277LQgBwpo93nmIimvfILs8Fz69w+jjELXR7seAPoqmbwONd2LZYZ+VVlkaRX34XAH6E/XKMN9jOeqxOOb6WQqGiqv5XyQDwlHqpTLge6dciqPSHuGwDH8qgW5PZN/+ghLDMibfhb5m4l11Iev6Ddjhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5q7hD/va1DiwxafArWxB3hPR4V8JEFKZuMPVCKtgsE=;
 b=ftPeXGjk6mWw14paQngozFnbLl5tDsmUOb9BldsUWQHpbVrlcSH5yk6DAEiRnV++zuJP8RzRt8X1BFyxrY7YD0zXzpIHhxj1N2j7lUfNB19J06PyPTaj4fJ5Ff4HjpgLw48J+KspWoFL9H/4QZEwsNXxsW2U4/JeXJKJ8XJdVCLo3Pqw/vnbEDEeaMkyVG8p4DdmBFzUX1tHhiRyfHhw9nkZY7EKYdMzRdF4YZIqXxpi7ca1buDjQ6vC5GTd77KBuraxR8APAsI3j9KeWaT4WrqTlyiQuS/GFWj7W7jMgz5FWeXqebuj1qDMdbONZGGPwOOLC3RW8AHkntS/azdS9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5q7hD/va1DiwxafArWxB3hPR4V8JEFKZuMPVCKtgsE=;
 b=cIOwMiaA5aP7iKmuiap8J0Gy5+YfAtgK/n/QaStJG+sNbkWELrZu/e90NqjHJ3HIKn/kAZwwtGYzcQecTn39Q61d4K+/8uNgNqJod6nDVAwO0uaHEyTORYQJ0oD20cjpQHkJW8jLH9ogiP+DsplEL3i950uz5SZ1kUN/2pOsVDc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB12838.jpnprd01.prod.outlook.com (2603:1096:405:1ea::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Wed, 23 Oct
 2024 06:57:40 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 06:57:34 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Prabhakar
	<prabhakar.csengg@gmail.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 4/4] MAINTAINERS: Add entry for Renesas ASoC drivers
Thread-Topic: [PATCH v2 4/4] MAINTAINERS: Add entry for Renesas ASoC drivers
Thread-Index: AQHbI/XJA0OjW/PrUUyS5bSsFYwNXLKTagSAgAB+9AA=
Date: Wed, 23 Oct 2024 06:57:34 +0000
Message-ID:
 <TY3PR01MB113461595CD0E51F2F0C9CA51864D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20241021201349.395022-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <877c9zybbc.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <877c9zybbc.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB12838:EE_
x-ms-office365-filtering-correlation-id: b448cf12-9d4d-45d0-831d-08dcf32ff8d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xKVmozvn7CwIrVlQJBOtatdZW/bazuhin82ONRCbc0tz1a8EnhzXYnaCwXxq?=
 =?us-ascii?Q?AE1Unxmuw6p28OP+QAjorWXC1AbZT4tPVjsIOq9fV0LsMXTkUPpIH4idxxrT?=
 =?us-ascii?Q?Z4aN4ppf9KPKMGQi++KzRMmDCQ+w5acPN27JWytbVFQqGtirzNDtVYU0v6b2?=
 =?us-ascii?Q?ZP5aSXVnota29LoCxFY9utc/P+Oy3JaD+bliwfFyLM32Eb3eS1KvV2SxpfeN?=
 =?us-ascii?Q?mY6hxJxD7YlScTqLUIxg266P0+mspRHmmf4IVf9qzJbU61pUAhBrAK1B5nEJ?=
 =?us-ascii?Q?b5j7zc7Gj6xAaTswtuTtPmWuKvOae5wDd6vghxRWkNMr/YlscyJk5iXSDEuh?=
 =?us-ascii?Q?au0gj+/qXsYuW5/roZaromxu7lAmW+xA9XVNVX1UcbLHU0B9TmgJKBQ+BBPX?=
 =?us-ascii?Q?DcOwszGBpTgJtSNr3CbLFyKx5JIKFqGvkcW4OJliukvr2GDU01+UCSaL4/QN?=
 =?us-ascii?Q?wVJdE8DegoC3/kgGfhbIiRNCGU4B9G9hA9pdDG/8gBW5M4jX0zFGsVaI6o+V?=
 =?us-ascii?Q?f1xmeRNHeXGhT9x0EimFI2YKpl9HsWp/1ZHJE+ZAx6AVP7LXGVpLEI9efolz?=
 =?us-ascii?Q?+qGmIsuTTcnkdPSAswRotS8CDY+wo2rptuTcFtSHwl3jLJCE0TsNGx7BXtNQ?=
 =?us-ascii?Q?xodRYtv2F5NHss+2YzmC22N8zeqHpUtbASN4EMumviBJARjS2WSylg/VpdSB?=
 =?us-ascii?Q?2ZywR3qpSW64uFg6zhy5tVMcww+8MwH4D40rSIDkf6+55KOmrGXOgcigVX4v?=
 =?us-ascii?Q?N/Dd6l6gYioLxCh3PYU1P+AnzBJTtcfMeMgn50OG+mOodU6/zoqiRefTV/JV?=
 =?us-ascii?Q?xVGKcx6rFRLry8j6NzeplXNYYKBmQBlDDWaQe4u9666fueviD7Fbm9iC7rN9?=
 =?us-ascii?Q?M6GB0VWD4N2SZr0VtPSOpdzHLS12JYVWuFPV59p8zfYNwnPPSWqj/gO6c2Da?=
 =?us-ascii?Q?i7axxNRJS368FxlCL6pXRzRH77XgCuWnhL8V2nc8SSgdVzoPEIxNHEcSwyjB?=
 =?us-ascii?Q?IKaedJo09VZgQBsgy0WnYgTEswkijOeLk5XsTir6Ah++wqNjAW78IDZNsqxA?=
 =?us-ascii?Q?q3ryrRC5TAYikvGuZpkRcyK+75TA2V2FAFEgAzY3bXIe7LMZdEdsHPWKwwcG?=
 =?us-ascii?Q?eVhtiHnrE7xVK55w+Js1YLdfbyq++0w9a0AKX6WkQZfnhA8QdFf6y/3o8EPq?=
 =?us-ascii?Q?T27fpLWPiQXu+zYFDy8b/7641yy7t9k2wM3/LaKbFjw9Mv2IVjICtWogx4MY?=
 =?us-ascii?Q?BstxuCbabF4mBAiyAXKeewzIfRUI5GU/Q11aiUGLRWFhIsBdrwyNsGhN3fUh?=
 =?us-ascii?Q?YrxamkdcXycsYmvvSOUZ9VQ64Qy2PGZ/1LkozSgkEMFFpUJO0Dp84ba25qTq?=
 =?us-ascii?Q?p7cMCt8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?7tYTKPSHGBW5m/0PYehzoKMsKxZYaAuLsGXi13B9jeD0xsXNIreiR2gf2OZz?=
 =?us-ascii?Q?4PjtN9j9AIL/I/P4mRAtg+Wv36O/eMwtGJ4EKqo9c2IOgWZI3AsUv/f7vKcT?=
 =?us-ascii?Q?EOGuMhs1FlKr0M0oPVFBFeVmIpwbh6L4aDWKTwAxPnlakWTWbe1iLkPFCAGy?=
 =?us-ascii?Q?gWGUg/tZKCfevN2uOqm5si8hiQPuwtEhBI7whaIXS0FQgkXeVPWUA0mQimtY?=
 =?us-ascii?Q?jkSJ987UMdRVVY91ksdXadUC381CUvczECWsPt9/1FOKcawRlxq3f0mp/9ZD?=
 =?us-ascii?Q?oQoQ9ZYX5T6t1dsgqrlC5vTbW9oKYIxSUlXljutvJlCAUNDc6SCC4IlRj/RT?=
 =?us-ascii?Q?sqlVVELLztU5BbBOhckjL+SQD9a82sduOeOJAkOcgCIQefkQ6lyWAhxvho4m?=
 =?us-ascii?Q?sN+xZrZDaTS7JhYs2GKT4kqE6mUhCZYnS1g0fcJJW0OpWhE0aV1m1Z8AO0uE?=
 =?us-ascii?Q?WMBLsU2wBKP63Ow1JTXboSlrjoQFkwcBAJeH1GCX9qSfSzgNuQeUnFCSTL0U?=
 =?us-ascii?Q?ZPVmGNah2ZkCBwNzIpJq+9hcEWFJnpX9zk/BHYNkZy8S6WdLQqN46JmHORUX?=
 =?us-ascii?Q?Q9EHg8IVFAhg8JVW3cP1Ok1RsfwdB5/i6l4TXdz/bxBL6atPoNX8kCPa3AFv?=
 =?us-ascii?Q?D41WtWNywe+TYmd0BNLKJcpwLpm1F/K4TzsN/W6B+ie5aYdbazardMlKh9wQ?=
 =?us-ascii?Q?AUI7z9y9LTbgorOKWmKJGHOCOH0IrCmfgCWzwSVnetThRLYsVwN8B2LVB7Zy?=
 =?us-ascii?Q?ZeKeA0C5DkPuchfxEdb3/JQhkzTL5OiOuLVwlfZc7CnGIEd6bERKHDMARPtn?=
 =?us-ascii?Q?xcV8Qnpb5tO7Xsr2gwR7uH52LUqv7V+oTZxD2s2wtkOuQb2rerq1Ekk1fW6S?=
 =?us-ascii?Q?YAyPXNPy2Bn+2jBx0Erc2uPoIfWBAb/5Y2wQ5+6aU5SyY7yCbeTwruVCkzfh?=
 =?us-ascii?Q?iWLA5y+8Z2X/blkt1Uxr6yUKmvgpXfyXvC7FwoLSThqURe8r/416YGktoOdD?=
 =?us-ascii?Q?i89S+P0KpQ7OTV+3JVlNMw/Av1lLWhtgLtcAz2RWaw6fcgMomhz+Jlkw9c6C?=
 =?us-ascii?Q?vfuVM+yYuSREIQZxH+Z1QzY8hxR1t2uXiRJ+hTdT5tfj+XJKrIE8bbUonfj5?=
 =?us-ascii?Q?2I/KyHv2Wj7st6RuNn+5KOXIf29qdu6HlYlheN4nHeJY3WK6Cl3RVnXGyAHh?=
 =?us-ascii?Q?/hNeiOupphm9jJxQ/1TzHLjb71p62JmMfbJB4B1sR4MwRtxEAyQzjx94aqpI?=
 =?us-ascii?Q?/Fc0EZU0wQV4nHhqQnPvFgVaWWO0mSkRwTv8FRYEbNIk66SPoU3ghYLLJ402?=
 =?us-ascii?Q?etQtVcdZUF/isiOZ6L6XYWChRbJa2VKB3cj+XEtwj64YzT0bmR9kEZEFvlCU?=
 =?us-ascii?Q?/fYUQWEIgIpwqjW2OoqlSiRR9sXvBvZh+Fni2Uf5nEaszZacU4/H5Nf4EOtL?=
 =?us-ascii?Q?ClglqvHBn60VcJ0RXK1xW6nGDNkNZx6PoVgtpix4Zw6ymiiz0RiPW5FEnGn9?=
 =?us-ascii?Q?pZV+ZQ98qzE9AKHf0x3VBMMjKCHbIzz/zjAmn/bEOirJwBxtOdUTTvEBih/u?=
 =?us-ascii?Q?Qk3RAkvrcOXQlABaZAzWH5n6AUYySE7LTYrlf2iuFjBIi0Tivb1VRuE9N7OI?=
 =?us-ascii?Q?4Q=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b448cf12-9d4d-45d0-831d-08dcf32ff8d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 06:57:34.2972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ujcoVCUlcN3ms9Dy6XSKwLEHkBYPXgXkvzFtp1OHWDwGfurAzhMx+BbJipaPeC8SShdEmrFdt92vcW8nM6R2f6l621NR/zk3CiQ7jqqaxgA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12838

Hi Prabhakar,

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: Wednesday, October 23, 2024 12:20 AM
> Subject: Re: [PATCH v2 4/4] MAINTAINERS: Add entry for Renesas ASoC drive=
rs
>=20
>=20
> Hi Prabhakar
>=20
> Thank you for your patch
>=20
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add a new entry to the MAINTAINERS file for Renesas ASoC drivers. This
> > entry covers the Renesas R-Car, SH7760 and Migo-R audio drivers,
> > including the device tree bindings.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> (snip)
> > +RENESAS AUDIO (ASoC) DRIVERS
> > +M:	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > +L:	linux-sound@vger.kernel.org
> > +L:	linux-renesas-soc@vger.kernel.org
> > +S:	Supported
> > +F:	Documentation/devicetree/bindings/sound/renesas,rsnd.*
> > +F:	sound/soc/renesas/
> > +X:	sound/soc/renesas/rz-ssi.c
>=20
> Unfortunately, I can handle is "fsi" and "rcar"

Prabhakar, Maybe create separate Maintainers entries for SSI driver,
I don't mind you as a Maintainer or myself ?

1)Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
2)sound/soc/renesas/rz-ssi.c


Cheers,
Biju

>=20
> 	F: Documentation/devicetree/bindings/sound/renesas,rsnd.*
> 	F: Documentation/devicetree/bindings/sound/renesas,fsi.yaml
> 	F: sound/soc/renesas/rcar/
> 	F: sound/soc/renesas/fsi.c
> 	F: include/sound/sh_fsi.h
>=20
>=20
> Thank you for your help !!
>=20
> Best regards
> ---
> Kuninori Morimoto

