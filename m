Return-Path: <linux-renesas-soc+bounces-3260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC5C868F9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 13:02:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7590D1F2742A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 12:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044FC13A24E;
	Tue, 27 Feb 2024 12:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YSj4YiKO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2077.outbound.protection.outlook.com [40.107.114.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86D613956D
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709035374; cv=fail; b=aafV+RkjGeuyNoRnawTzUUWCHfprPA//xiYcbnaTWZnmi2vV4yfhzi1pxrT/9OsO2AS+7Qyrc4DIvwxcA6WlSuaSGmaBuFWswh7fxhw9uZmoowv6+6nM1bxHpQVIuXFyQiqQ4zZDqrF68jELioyAfThggF0eO4O9L+qAK5vDyBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709035374; c=relaxed/simple;
	bh=3RPjFvctOa2r+FGFMWTk0PMyt3mydzVrn6yg9op6L7Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JLdZUdTRpm5I5sgLmWjK8TuuNib8UMCELWXYG7RytZc56mkiBJrf3YJ4r4cLzEzVJHTHR7+KoJlN4le5oesjisJFNFcK/xwb1iZkhy8G3/34NrwykTvz23qXvuo/pYySYfcJtZ3Y/59PQV/8iCzGQRuH7Akp4rocFq824vi6SrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YSj4YiKO; arc=fail smtp.client-ip=40.107.114.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUovh3pES8xOXm7yt67fO6G5fsBesln3rbP0IK9VjauIhi7nCw/BxLO5kqMnak+kcnFe9Pgs0L8M7GDM9Dx1L59J9OwP54KX141TndLcVgHXRFWFt4yaxE4Hc+Ow1liQvXqwVZQwLuBAlNiB2FVviUC9SvxVcgi7I93R/PgqyzRihWrFqH8R2iKCIo69pX+xTGVd+DBmOcLCgEI0UBXNvYl21bSIDNk0skPN8VjIL26N4JktWiaalJnOZbYyJrLJJywJDIOu535MJlKIdFqyK3DneztWZ9fFim13KbJttzUbiO+FJiHn7cNzMDECNMOSZAu78DGKX4Yj8S5zYvDUYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IzCISq4qMIzSqLrmRU1vvBB71XVwJ4J34gZq5tpR6CY=;
 b=RXnHI9PbT/JINnPgC8qwvUf8capg7GUd9mQm+zyMEjqNKPSRZED6WkbYSOT1PZ7vYdyX90Jy+lhfLQUWPrxnz7wJ0z/Wjnymm45am2k/pzM+i3cS0aGwi9HK85eUqsLv2KOHO1VZJefjOtGXx4HB4RoQw3SvX9qR2qhLvF7BzJL4ki7kB/Xza0oyYE6JmLctSCR63hpFkkF3y8MrvWh0mpPaImGIh8Zyvi2Y7IVumjTjrojw6JAiMW2vb2xWVXVkLj7Intu5X+k2wh8p5KGApcP+Az4cLLfqslacTA2X8n1AD4N+vxF7/A5HGnpE6ElFDlF7CSszzcqwTxzofyJjNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IzCISq4qMIzSqLrmRU1vvBB71XVwJ4J34gZq5tpR6CY=;
 b=YSj4YiKO9ffDiiI9uD7MNKlWmyV6TPf77cMXVDq9sDKNi/lCdgZIvzMzSInQa2//wjuMdYf9UPDmi5MlY+g4jjyg/k3aCueeShQBJAro/0nhX6HShYsuXFUsngsHvkM1mU7US0Rkz5y9Jf/tHpajOzPTjXie7Ap/8DiIkBhU0Mo=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB8411.jpnprd01.prod.outlook.com
 (2603:1096:400:176::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Tue, 27 Feb
 2024 12:02:49 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7316.023; Tue, 27 Feb 2024
 12:02:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 0/3] Support VBUSEN selection control for RZ/G2L
Thread-Topic: [PATCH RFC 0/3] Support VBUSEN selection control for RZ/G2L
Thread-Index: AQHZiaFfkULG6eflqEaqpA3OKcqzp7Ef1iKw
Date: Tue, 27 Feb 2024 12:02:47 +0000
Message-ID:
 <TYCPR01MB11269EE1F1FF841AFD999C9AE86592@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20230518155649.516346-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230518155649.516346-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB8411:EE_
x-ms-office365-filtering-correlation-id: c9729ec6-fa85-4fe6-ee7b-08dc378c03c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fYWoPMrLPI5ZbNhavrtwum1UEnFVtAOlkM3UXjS+r5AXR2HT9FwA7SYkdRugbnHCFYm2KXHu6th8FKWZxfN9JAVYEBk+Tr8s70G7VjGB9Dk17BvQdIWLm9yTgt0DbMxDUVmHLricnpTqtYeOtWrBs0VbypJm4WVY2nOWR4Uc4E1RH4uFJLFOnZzt1+ccfJbtrDw2R2rt/8ylqJP92QKZzbngh9x5njPpJs2gaUBWCXFKHiFzWoY522AkSgm7o7osAFscM2E0zDX3ILTVpcz1r56ll7Qva9nbYITmAstWt8F+wh6qKMq7hAThLjlzDUzB6hVZDpuIZoBcHpzzVR3S1OCx+b+xvgTQpOgv95L8Hj8fuNPxC/hVbtW0s3r3dRljvQIuiuaOcqrl1JNEihYyvdys7tKmImHScp3VwNCWd7nyeOSQbJpqT2+KMUMNu5TmyucUMrttcn+iNKE9sk2/6ol5eXu0uv/PTqnAe9O0i7ckPWhywp1ptwBSaTFYLH/9q+g5Oe/ak3Al6k1sxlzmm8Tp/V7EddR3+y5ivLM/wGtwaquLrFe9ASHSiXEy0ypEeCM/9HAEOnZ1P2zzb7cIj/fYnNBTxpQNU394eN4P30UGAUYwbUr2Wl2g5stC7g15cahlqJT/QC1S61p4DFqGLvWYUBnwgZp22SzWWuCagw+mtHTShDfU0tcSn+okHhU3/OFUoTnRKbb4grDhiBRdWw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?W7xSHMm1tS4h9Mr9E3Pp//a7/4AThg1vfhe86q+69VSfiDkitvGTcURz4fMw?=
 =?us-ascii?Q?B6sgvPbxsZCW8asEf49iOlgaf7Dx5ZkLYNOr62vFJ60REv2hr/sOQm4mwJBh?=
 =?us-ascii?Q?BFrzZZ7mY/RMs/RdWUhNsewSSoi8BaYoeehp9FpWhTi7KlwxPi/pS6/LP87v?=
 =?us-ascii?Q?NZcYuAYkyl6FSIwebo1Dp7U/ig6L3+7fQ7ioSOp93CTUWjCNj7I+bPLjX/N/?=
 =?us-ascii?Q?B7mlAXlKQbTdenI95W+oVLwsaw4GVtwIJ5gTn3LPDRmPKWOpHl7LhGodKDff?=
 =?us-ascii?Q?P9D9b50IKNDOnUS8wzusd0CzbQkXLt9OmW7WBHa34bOgFVlwUcWoXu+oo+93?=
 =?us-ascii?Q?JLmThNeZXPc6mQhILWsrfknSTjRkRy1JCFDM6LrM5yuFCMcdB7qd+yRCVThn?=
 =?us-ascii?Q?NuRAMMHsq6HT8kVj7fZCRCs8RE196wIrLWzOO/Zz0MDwC6JUe13m9f0OBTnQ?=
 =?us-ascii?Q?uuS9B529TyrAsyxZqF5i0jasolKP2zIeLV6FYbj3PKuXHJIMyeBzi2cLyAww?=
 =?us-ascii?Q?A2JDMPi0WKHeLlYROwRMres4yQQxwI822Y3W/i+1rmvNKiLEZ+C800caAltp?=
 =?us-ascii?Q?BTYLD3W/OXGFgRBJJma+fLhncmw3CgSCtGos7UB6BebGAiDT0jAaQ8s1L25i?=
 =?us-ascii?Q?/+5iovXStfwTLz07gfCIRbbGetIiJs1iwO4orRM0HooOJTx+R+JpzemEhWM2?=
 =?us-ascii?Q?aVxSq2lbwcQl8K9XZhGun9yjF2lJK5UTQYNSm8NL+IxA7IxbPYLegy7KiZQB?=
 =?us-ascii?Q?pQOpMXrAg3UvUgSZO6gfnVA2IMVWgDGDHsEcVdxEO7CyTlurtWq6Q3Xbx2fc?=
 =?us-ascii?Q?OmMN2nKIwaBZW9JweC6YPVJBv0z265v+AqtysDD3Bdf2CNOdAxcFv9udnEGs?=
 =?us-ascii?Q?Fl0q5TyQ44mNm+ZolJDY0a2erk6qZsmxrjB1Z37eMzdg+XRPlLDbR0hxEmfg?=
 =?us-ascii?Q?fqXPPBiGBfOZpzQ3heTausYypPE9kXxaZjwdc02RugnCTaYB6kiZbmBKuQL3?=
 =?us-ascii?Q?K/OjLUgRsZllwhxiHO0NvKnic22Jk2CZcQFC0gaBTCvG2gwBOitCNLujr3E7?=
 =?us-ascii?Q?r0KP6yMU9CnWdVIazEyM3xQclqbmwP+zS3Lbjb58MNbiEVuOzXO8fCrnzc+6?=
 =?us-ascii?Q?LvPIcHeuOzRBSYOBRyder7FjylFWJQSGN+q6IeHcvmthet4Du7tWZ6OrWWm9?=
 =?us-ascii?Q?bDfBCFRludw+aiLbhvrHBE6/wpUUAH3+yNwIbADiaw0vGeqm1rWuD7G8d06l?=
 =?us-ascii?Q?ObPBH+EX3UHOuAbm9oPet4zlS+5NQbRKL9tbl4I3nggmQPqGjwFw7vAMyrWs?=
 =?us-ascii?Q?OUAXpg6YbOrLTLUoX5DxkoYExaUCBWjwTWpMjQyA6/ua0SFYKebWHPklFRlu?=
 =?us-ascii?Q?rozZmka7JIX8SlbRlSVof0ohGoC/rVN2NfxcllVa+d70egs8chxRtm05mPC/?=
 =?us-ascii?Q?GDOguMyyfaprk04x16ICwE9t4wOnFJml8cilusyV13PELniajFsUE4Gn7mwu?=
 =?us-ascii?Q?71A+HPB3rJ2pe9iYgl6S0j1DhwUUG5i6TQciN+VtUqZ6R15A61P4IgGLv1qL?=
 =?us-ascii?Q?2GBjLv8ERE+n2XibVHiPy7vLKZSAoB07OqjTEksSA2UM33TiHIhKqu9hr/9I?=
 =?us-ascii?Q?+g=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9729ec6-fa85-4fe6-ee7b-08dc378c03c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 12:02:47.7454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VQiJgIUmtgZgXNerz8EFpned/USagmDW4U1LougVbrmzC255UOdzTD7Vl99GW+RcmoGqgjB/j46nrx2f7WBA2Noi26Gv/tnuCHN0Gl7iSGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8411

Hi All,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Thursday, May 18, 2023 4:57 PM
> To: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Vinod Koul <vkoul@kernel.org>;
> Kishon Vijay Abraham I <kishon@kernel.org>; linux-phy@lists.infradead.org=
;
> Geert Uytterhoeven <geert+renesas@glider.be>; Fabrizio Castro
> <fabrizio.castro.jz@renesas.com>; linux-renesas-soc@vger.kernel.org
> Subject: [PATCH RFC 0/3] Support VBUSEN selection control for RZ/G2L
>=20
> This patch series aims to add support for VBUSEN selection control for
> RZ/G2L alike SoCs.
>=20
> As per RZ/G2L HW(Rev.1.30 May2023) manual, VBUSEN can be controlled by th=
e
> Port Power bit of the EHCI/OHCI operational register or by the VBOUT bit
> of the VBUS Control Register.
>=20
> A reset consumer(phy-rcar-gen3-usb2) needs to find the reset controller
> device and then call the provider(reset-rzg2l-usbphy-ctrl) to configure
> it.
>=20
> Please share your thoughts on this patch series.

Gentle ping for this RFC series. Is this series is in the right direction?

Cheers,
Biju

>=20
> Biju Das (3):
>   reset: Add reset_controller_get_dev()
>   reset: renesas: Add rzg2l_usbphy_ctrl_select_vbus_ctrl()
>   phy: renesas: phy-rcar-gen3-usb2: Control VBUSEN selection
>=20
>  drivers/phy/renesas/phy-rcar-gen3-usb2.c |  9 ++++++++
>  drivers/reset/core.c                     | 14 ++++++++++++
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c  | 27 ++++++++++++++++++++++++
>  include/linux/reset-controller.h         |  9 ++++++++
>  include/linux/reset/rzg2l-usbphy-ctrl.h  | 16 ++++++++++++++
>  5 files changed, 75 insertions(+)
>  create mode 100644 include/linux/reset/rzg2l-usbphy-ctrl.h
>=20
> --
> 2.25.1


