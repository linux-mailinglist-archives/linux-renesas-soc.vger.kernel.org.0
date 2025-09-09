Return-Path: <linux-renesas-soc+bounces-21638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF6B4ACDD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 13:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA7577AF972
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 11:51:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E893054E4;
	Tue,  9 Sep 2025 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NUwiwYTZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010060.outbound.protection.outlook.com [52.101.228.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C8E285052;
	Tue,  9 Sep 2025 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757418757; cv=fail; b=lTZpan4fVWcwSmQk7NME/amD39sepPR6RERWiQW6V1ZOp5DokNhOGUBMK2WzEpyOh2eIQ3TulCQsJG3GNLriAkr+7+0T8V2XQq6FyICmrWZCAjc+iCr87KD30gRoWNS/XzBwrjRBE/oN1U3iBFkGOUBDQ38hPb/9iDuy1pNknOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757418757; c=relaxed/simple;
	bh=K4EDWwjJ1IVsIAscQZ+o70C0YWm5SqewbLIvysm+joE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GKha552V2z2ZZxT0v1w+W8AyuUadS3n+saP784kTM7O8HAB6j+LpRGu/t5HjphN5csh4jJvvby2wZ8i7U8k2DFy9dke4fIbwxsllrCY28FOLZCkqfL2TDxJTyJrIXZ0kEws01He999xGgbL0ABAV3l1lQWY+VJTDuw8fwXLVQ9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NUwiwYTZ; arc=fail smtp.client-ip=52.101.228.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dpcOLdavcKj5JcHB8CizCDU0H+JBfQrqFvJ0XELLYldfletUvmD19fJItix2kGOABtso9pWggnbua3rUT8V6c+0EGQbSHlN+WuNpFq6+HaPNnHkLf6oGlvTSzkxfFOipQ6e+fOLuNWfJGlbAUTjQ1gZMGDhMvMas6oVDxD6n8ciW2dRZV46fdqTGe1ozthauQBP2R+axXGB9/PXVBYcOHiYCEbagNjSqjKST5gTQmIZI5885M7pPseealwOOKfW5dwpAtEbmGp5KUFF4Hp/wiydUGQrBfJhyGX7REUlR8MJnYcWw1pyxpnp4yl/Y4g1ZtY0DFGL4uOsLWT/TJvaiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luG6vb6OqhkGy0cYTKSkZlcIkUi3k2l8vRl63TBxbWc=;
 b=kaB143D6I/HWgBOhnkCrwNA7Z1CjlkuV74+vOy/nvxSU3IxAQshWqUQKC/ZNzJK+tlT+sf5V5/AZbAr4QBInbxOgbf+7tSLLI9CWIlSgAXlrG2bmyChSlEr7e5HO1pgrNCv9dolHfo/BuEJA06Rs5IZKOwnj+xVebvBrAJTRvmfY6ZrKL8irE87OGpv115otYtjcMxO5S2l9tfW50iqqSBecvyanNnlM2gQ4kjoyxexbAVlgFTN2I+ddBPhQ41YymZ/ugyKOMy8cbz4NdnsVmXsawJXfUivmb/gH9oeQgf9geRK0+8FhNwXOYjjHwZr/TGncOVFl0jDhyG6oQgWn5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luG6vb6OqhkGy0cYTKSkZlcIkUi3k2l8vRl63TBxbWc=;
 b=NUwiwYTZCEatfhihLpDgUH1oRCvsFtoEQNMOOHsxK0QKFX6GYbqnJ9Bl0rKBLpDE8R4YQp51Pp6xDtlEciemKwH95R+RTiQluLt7BwvElfUk9eG7wojcDzPdFFlOacu/PbESkkfOrcs1J0ND5VeB1wd2hQMl/veaDAeEvSr6Ass=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB8245.jpnprd01.prod.outlook.com (2603:1096:400:119::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 11:52:29 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 11:52:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>, biju.das.au <biju.das.au@gmail.com>
CC: Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	magnus.damm <magnus.damm@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
	<linux-phy@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 04/11] phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver
Thread-Topic: [PATCH 04/11] phy: renesas: Add Renesas RZ/G3E USB3.0 PHY driver
Thread-Index: AQHcEfZv1w9Ut+eaXkKiVoFJ2qvdQLR+lu2AgAxFR0A=
Date: Tue, 9 Sep 2025 11:52:24 +0000
Message-ID:
 <TY3PR01MB1134620DEE9D31EB9C3AC05A9860FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
 <20250820171812.402519-5-biju.das.jz@bp.renesas.com> <aLXJozzGsbIndK9P@vaman>
In-Reply-To: <aLXJozzGsbIndK9P@vaman>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB8245:EE_
x-ms-office365-filtering-correlation-id: 17018431-52de-44f5-889f-08ddef9757eb
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Kl4me3JLLrvvQqfKq9Tz990zjL6Hqu6lZ3PvapHS85DX4lJclO2l2OG2Ihtp?=
 =?us-ascii?Q?Sdj4qe60LB+yJIW5jrzepyyvFNsrE2U4CpzTJ5hkS9EZ1AiLFRYP1Qh3wmdc?=
 =?us-ascii?Q?yWVYaQZ/Fn01TF5h3kqs/S6gTJpQrumFi6j/XBeyDfB7Gl/lb4OPLXjUtLci?=
 =?us-ascii?Q?Z49050SdpA/CReC0JNVnu79cpgOYn8R3YynnzCY1pA1bStg8V1zJtGMob/Ha?=
 =?us-ascii?Q?J5nxhasCRjE3OW+pGK6HbgsoaEMPJLdiJ9rakbd0NmswOs+ui0SZcfYZ5k24?=
 =?us-ascii?Q?1pkEQhRBCs5ow+Jp8c20Zbl/it56KjmwpixFHQTY/xYdfi3QjMPiQjRcHIuA?=
 =?us-ascii?Q?c2VQGTu5asRBQzslfSu8A88RpS7HsbAjE0wRg0fvzb5WGBtBl+k2alDrwiOr?=
 =?us-ascii?Q?VvD1nINrXo2kUAnsUsFL6jFMZFC9b1AZ/D+TGhyk7+NiTQX7pa95Hc4iJJwX?=
 =?us-ascii?Q?A1kPWRJXO5Q0N8+vRDWHWPW7lNcZZEu0i9igGopWCOUHS5oijI0lCpnNeT+k?=
 =?us-ascii?Q?HLjwhgRx1MM9QHouzeUlpxy2TMA4kSF0AR7RsYErCWVi0TskAJwoZnpP3Nuf?=
 =?us-ascii?Q?YM3KVS1oAy137Oz85F94Crxgtj2GcUZN/kYIqA97SfxG0YvYPW8QOw54lwYc?=
 =?us-ascii?Q?DqGmshw2UgcNgYbDNlN4xwx34CPpSsaDwMQ8AzguN4047sgOURVz6Zf78nPZ?=
 =?us-ascii?Q?UfxQqMnAgNarpTHnTGQDcwpGLNdzmyeSXvAAKDM7GI7cjYMsJS/p+Qx+q7S3?=
 =?us-ascii?Q?i2uQgGhNKs4uTgGpy/l3XOeWpkNOUTyYZgOGcd8Lbks7RVubLg3em3a2gyJE?=
 =?us-ascii?Q?pj0KC0ClIWplqZe4Ftw7fT+GrbqAnM5WCEG1CYP54GyMUvLxzlRfoPJB5AOa?=
 =?us-ascii?Q?s0yf2D73VxoYoCtlsuV38Z/A031Yk7dUpLk55tsgiwIoQbCs7HSxnmh6MXVN?=
 =?us-ascii?Q?IEmSONB377/YyXkP0qxIWCSNINLMQYqrDGodH0RRyy4kMuhZYZqpgSgYOuq8?=
 =?us-ascii?Q?EeiBohiaQTWEiANGvEpS5wivIbkzXDYfLMaBeebWSanEX+IX+G7pWCNJcaRJ?=
 =?us-ascii?Q?KxWFs+chNYoElP4PAAcntG/P6dhFmG1/FICAMotpnV8/33wdJqMNOD5+w6vJ?=
 =?us-ascii?Q?bU0oietlfAuSbWMY567bjFKbZtuI7Dbj1zWhh2IObDDEEyYvT0D/oeGhNO38?=
 =?us-ascii?Q?w1Xb5WSwnyLTa5B0nTaEinFoViyR41HxrQ6L1J3h9qBfBRX9wIeKaAO6YZ+p?=
 =?us-ascii?Q?sJTPVfp5sHtWXFM/zgpPSpL48qG4yYnUfQydCYGTvYBidY+EgoVuDQWR5f4I?=
 =?us-ascii?Q?t9k5QXtEn0usNG0vRmCj5TPQtIzRRsflC90TsN810LJ9bn3YxLCZ14e3cOxs?=
 =?us-ascii?Q?kBpFTN5OyuqA2cZNCd42/ly5tjybIiww95mv2uDM1lJ18vfe5v7IrDhLi96u?=
 =?us-ascii?Q?mqrdzzjCsnph16U3clD3SwcSPGp5/5gKHcQct2F96CS/5fU+caXqAA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wfIsdgOZYjzH6UNRB7m7qvjgXp9nDtisByETpJLz5tG34hk95xZJxT51Fsj9?=
 =?us-ascii?Q?yxAKiy7SxBn0r11qwPeMshvRwWqK61Ihw2enK0SbRDMwmT7PtgnoFIJhswnF?=
 =?us-ascii?Q?Eko895GuIYhDMLGJEcWE5EsbsC7Vrd+uW1To5gOsiIEEY4O64PHFCrAmGmAU?=
 =?us-ascii?Q?LaO+tK7kaq3KtNjIydX3QX48O2xgpwaTZK8v1ylYOhZDfIxLBz5k7xBuG8qC?=
 =?us-ascii?Q?WIY5qZ251bkheXTkUdtHI9VHPTYFNFYJwgd6DM0ckc6bXtLeVjQ23hqVhB1a?=
 =?us-ascii?Q?SkWtgPIpOmsEosUpQ6LfR1Yf0Nv8Z6hUG1ho9Ztd14nfI/lc7NCCU2M/GYoe?=
 =?us-ascii?Q?jgjzKsYAdtiehrhu1v1qxkC0hJRkb/UYQ36AawMsgcjeXn/yGGVjHS9+/aGh?=
 =?us-ascii?Q?dubrx7qXgxsNRmH56jWuk/5yRu/A2nKGkS1HxKLjUNfAmQkLwI0Z5MEgW3TU?=
 =?us-ascii?Q?jrW32RWM/TNZPcG6pwdL+fWedvdiIbXmTJXtLCWFLwUW6GGMTXU+uZgvGpya?=
 =?us-ascii?Q?ExmZWWTpuTpjfSp6J6FgN//9HdKo/7jQOw4KdhkrFzAr8rqI+FLBbVUVwsY0?=
 =?us-ascii?Q?lkva9SpWdQrmW4m8l9LjkG9UmGCKzchIVysDFGFi2DglrSvuB14onl2Ayn51?=
 =?us-ascii?Q?2ThtwcJ7qnv0fDvsEx5/h+hYH3zD3hZdSYcVBjva47chSL1BFXIrgsF+qjzR?=
 =?us-ascii?Q?IfrIdYB8Z11Zr0UALET4hIiIJ34TkESfY9OOkj0fYFKAS6xN7kDP0dUvfeGU?=
 =?us-ascii?Q?5+RYi9NV2qjQedWF1+IUygGEEZeehHV9ZwCIBTO4R/PLDGpMd5nF40e1+eBs?=
 =?us-ascii?Q?aFpb79XCfaEIdcWw7AdYfEwnBiFY/rXnQu8z6Nh01jiiER71wnS8cO69T1o2?=
 =?us-ascii?Q?EwON09+oXEEVZ+5HA7x+PmOPo4M+SDVzeffJ4uDPChtKhaaTFKDm6ekNhCam?=
 =?us-ascii?Q?tzy4WvmtfXmeV2wxy+FF28H4mco8aNZK9IbIfHpeYbc72R+LkJWeS4VIG9LH?=
 =?us-ascii?Q?4NS5uGR2gbNt3sY7HQ4ivz6i6JfqIRAh8BEwD2bvUj4uAkphk458bCp0/a8A?=
 =?us-ascii?Q?lKFXvy/Paq0huOCK5O/fcCbu4r89NZL5WsrEUGm8VRKvuEb2PTxu7osm7qQ1?=
 =?us-ascii?Q?2PkNIYilQ1DunJ/cqD5Jxj3pd/luWy6P2gxsAXu5dy8H+R1CBTYkRwr/c2Gl?=
 =?us-ascii?Q?nLJSO551V14BNiUKI8snVxmJthxwZ+Pzf8gzjuAAEqgYlu4Yh4Q8tG1GotZ5?=
 =?us-ascii?Q?fQdNeQkrN8oe9GecPghCfjv4Ldgewu+0WeCgFdLZhbIIt3qWrxJ8TbMIZRNT?=
 =?us-ascii?Q?4rlP/PTi/l40ptBJtVYA71DZL47YlgD4AXheUMwu5vkQtwYYQV6P1av1a4aH?=
 =?us-ascii?Q?r4bUwBMUYDDJSjpZZJgNk9wDNY0oxC9RHYPFBPG4///4P7nJcWG8fyBb7ssD?=
 =?us-ascii?Q?zssoM/p7rfSuRfoAbw+nyhcId9sZr+KGgI3uoJRGmHv+aRtUKcIxchpLWENq?=
 =?us-ascii?Q?VU17TbQ7BKyWMKKU8/eFxMMIVpyKOMLPNfdcO2ywEJ2GHcq9OU+4TfGEA4K3?=
 =?us-ascii?Q?Ds0kxeVYf3VxFnXGYl0KLCwPAIxHxwV9E1b3zZ2pceMf5LT+V9usLYJ8TDv3?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 17018431-52de-44f5-889f-08ddef9757eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 11:52:25.0084
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cWCS1lfXgDKuKJJW16HxTny15X+fisnKpG/dpAEUOc0Osx5Bq2SAqu342O+8nL+5rEOE2SHc5yvmfg8LGrGNMgRwcmnUNHdOIyLjQ8zYeaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8245

Hi Vinod,

Thanks for the feedback.

> -----Original Message-----
> From: Vinod Koul <vkoul@kernel.org>
> Sent: 01 September 2025 17:28
> Subject: Re: [PATCH 04/11] phy: renesas: Add Renesas RZ/G3E USB3.0 PHY dr=
iver
>=20
> On 20-08-25, 18:17, Biju wrote:
>=20
> > +static int rzg3e_phy_usb3test_phy_init(void __iomem *base) {
> > +	int ret;
> > +	u32 val;
> > +
> > +	writel(0x00000100, base + USB3_TEST_CREGCTRL);
> > +	writel(0x00000303, base + USB3_TEST_RSTCTRL);
> > +	fsleep(20);
> > +
> > +	writel(0x00000004, base + USB3_TEST_CLKCTRL);
> > +	writel(0x0000000d, base + USB3_TEST_LANECONFIG0);
> > +	writel(0x00000301, base + USB3_TEST_RSTCTRL);
>=20
> Magic numbers...?

OK will add macros to make it meaningful.

Cheers,
Biju

