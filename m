Return-Path: <linux-renesas-soc+bounces-3769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F60487BA08
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 10:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD1AFB2421F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Mar 2024 09:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF0CEECC;
	Thu, 14 Mar 2024 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EHFr+d6j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2060.outbound.protection.outlook.com [40.107.113.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B174C96
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2024 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710407239; cv=fail; b=CffQBk2yylVcy0vMEis3D/JVLVHZrnBNIg/4hg8bM3rnAt55QikaMRx1Z5q6vzU0Gr+4xnzJGfpW2frJ4OuIFUyKZZEnvpzwZjbvfl45aawRqcWQMyirv7p+0a5qTb+ibrSF9F5fgkxci4yun9wBRYJvMPYG9K4yfn7JbObLGFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710407239; c=relaxed/simple;
	bh=KpJyxXrB++sGfkHmOtmv9FQWq7KPwMYZfQwy8ScQE6Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JUJKpqMXFzFAkACsNkJSp3OWdXg9L06A/VsV9di9qsFd2EcEAmvrCJtEsFQ1YDi3+8GnKYDp+t3oibvsUrpERXKay8luUfSIS3M94j03rsxAiDTKeYfcKjeCCsifL7ftUxZQlNRHJTLGLDFrjcDlN/dMnGEflUoM+YzGIF9skG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EHFr+d6j; arc=fail smtp.client-ip=40.107.113.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PCTX1Cz4MNe3HgY5+Hkq1HqtFDjF52T1o8rVidRP39T8/k/wpTUxBSHMK+v1P7NiZNXL/TWXbkT68vSsTufwt9E3JhgyII7iqXZck2a+gzL6BxYbr3dHxhGz34JsrLXNa5uB53yPEWXEU7FNvvmEvsYLiTQljC8LV08QHb4r+9rbzjenqUy6dxZYuI5EMb5To0Qq4fz62EcOddWx1iweVMWZBnElI3W76V/5s20rOGC62kzADe37UCaP9LZQoKVfdvFyw1DYHZJLIJJri9s3ri/GX6xsaNzcUs5OpNLPeLtBiEv6W1v7RapbBQBem/wLK7NpV4luS4q9FN6abkmkGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F91/N8q9AkZ3qF9rXveid1aKO5NuLy9uTSS70SSdo3E=;
 b=UbDnHaYovlyv5sVa6fdic0KPLSvHuRgN77wRGQz6XP5FPLHnbSUzPnr/fAvS9CQqMx5AkTsPiz68QOuXQGh1fZDB5J1x74dcDEtcmFi7Aj6O6ZmCjTjdqXjPKy6gjk5IyNNiBq8nRaT9UhDwkzWPx7TuYEizFxTvz5WH3si4v9+i/s6/IPceacp60ixTMiwSZi6P8O9inDZwG1kDu5FbIrQj26eyy8C9GhSnehlTlke1bLIOzAna2fue6iSFGi0e/ZuXCrWucw+H/EqJpxQtUNLv31jj0ShpC+4HYl20i953dDtc9fkeCkmVfwbrImjszHQTGvcyG6510ucxzKmRXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F91/N8q9AkZ3qF9rXveid1aKO5NuLy9uTSS70SSdo3E=;
 b=EHFr+d6j7chmZSRFn9+HZJKwbWNCprnWbx5DMPoDU0ot8Rk15UdeKcex9fOrprnLZSN5wMn1LYjZ0rxsKhRtzX0RWnwxwSvPE8bOwxePoeTxYjAzaXJH1WExTieaWS6nqksNHnbvgUjX4ZIdRGSeLBlK0p0PZ3FjVB6tVeFmqfM=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by TYWPR01MB8823.jpnprd01.prod.outlook.com (2603:1096:400:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Thu, 14 Mar
 2024 09:07:11 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::aef6:c35b:b90d:2e3f%5]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 09:07:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>
CC: Marc Zyngier <maz@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 5/5] irqchip/renesas-rzg2l: Use TIEN for enable/disable
Thread-Topic: [PATCH v2 5/5] irqchip/renesas-rzg2l: Use TIEN for
 enable/disable
Thread-Index: AQHabyx9nUz2ikiCc06PItpalmBxmrE12y+AgAADjSCAAR6pgIAAAgZA
Date: Thu, 14 Mar 2024 09:07:11 +0000
Message-ID:
 <OSAPR01MB15879135B05751A5DA523B3986292@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References: <20240305183922.138727-1-biju.das.jz@bp.renesas.com>
 <20240305183922.138727-6-biju.das.jz@bp.renesas.com> <87h6hannrq.ffs@tglx>
 <OSAPR01MB15876D7985BD2DA5B0E25463862A2@OSAPR01MB1587.jpnprd01.prod.outlook.com>
 <87r0gdmbok.ffs@tglx>
In-Reply-To: <87r0gdmbok.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|TYWPR01MB8823:EE_
x-ms-office365-filtering-correlation-id: 420eacf7-4f8f-4524-1843-08dc44062265
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 zo6yDEWpL8ienceiUsGoN4RVNd+7fcllfzqjva/zpQUmt1WwfIKGIl9nvCL8+olZJT8KLJpgRf0q1WwAJMn7HqKXkqk4WLEbxdlKvIoyzV0vkqwDtrkPe2KkvcTU4DBhozoOpfc6ORu13YEOSZItxY26QoYxx8v4i5V6f3fx3j7JSPfsp+txJqAurnHrbK/nDY9tPcg01GNFLtyDCV98/SnnHMsgSeaQKi62fGE6GanqZTKFGj7lSQcjPHi6jJQGqHg5k95tOQDnShb3CrCOtzaQDZDvzzizPZacXqKMjEhWzQxSyGoQx9O2kiq0HWIWUmUuISCRozQet9us8LIHFmfIR9TJerHDE1CA1WUu4qll4RxILd2z9V7kJQIvEwa6e6MR24qDv3l1j7wnXvKjxTL9vXjnoJWo8BuZVYYy2dGD/NJhBG/m2T2y4B6F75zTGewzz6SCy9FKxJxEn5lYlYJbSigf7JaBt4jVqyIxYgkH+ZXQ7QI47f2ho+Q7ujA9ouu4P4Sr2bgqoE+3fSsDSr2y5/7WPmjJa9uiRKXUW+eZ+t1Sg8YWsxzqsB3fABr9jBJhW8+7/5BOJQY3RBiTv8RY62x61prDuCru0u2vLX5JqIehDUSIMyvSt43XaW2f3e9Sb2IGrYv7JV7/oEX0eQ5eCyST5bGuXRFhXMSwAlHNcL3Va5AmqKcb5NjZFbVn5m5CBDh/Rm7d6H6OmSpqot0Z/KxOevvn+GVmU40FodU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ixo3hHeT+TSrjiy6zDEw5Fe6kYLZuqKit5b9c4sfsXqZoIecZeW0Yu+c9QYT?=
 =?us-ascii?Q?LiGBgjJCtf8irx6ioLkSN9nMl8W1Cz8ridKQr3PRGR4It+ngon/+YxmUvNs+?=
 =?us-ascii?Q?2P4c4z/Qulq+kIwHArDjbBdDaVZP+W1kShulEotqB6U3wVXbufHL2TSf0xnD?=
 =?us-ascii?Q?a+hAAO37y4K0cXLQC9UNNnCPsuoi6+Kgmaj2uHFXxRZ98tJQYoYhMGcHVRg4?=
 =?us-ascii?Q?q/wtRa1/TsvtSUti2fRfc+vv3FWFhmhBlpIg7RGF7BvJPH6zJF1wVwiAp+33?=
 =?us-ascii?Q?UqVhudtKnPrSlEC2MdLcVsKgAv4UaFItR3Soy4J8pHBd5l00gyBLzqjtLlL3?=
 =?us-ascii?Q?692yV6XGJIA3wBzxheF76QtUFIi6cdcFFxz9qQWW+l88idmqtyYDUiwtVDmQ?=
 =?us-ascii?Q?EuTnL84Ig1a6WDTXY3DLJ4fZQVvlgtzeV/NXHJcO3DreJNrobICuJFwBAQyj?=
 =?us-ascii?Q?xL9FqLWDECjRJfJICVzVKqRlhLwk0wEUL+rpaHEuFZAePKPikS22fetzmYKP?=
 =?us-ascii?Q?IODtj81b5CZNS0+Wq5Cr9ZXFGvd2I2gMOHea2LcHGb04QXvdiMtRE6GtM70C?=
 =?us-ascii?Q?6Qkk0mhiW/a7+lyCj9ygqZXvCjK04jmi0r8m/pOJqf+uQhaL3O53b4A/gajp?=
 =?us-ascii?Q?UDojOOajWJyWF9EbcdQRBPZh+PDLJhittq2kFIOgQjqxWf8NedbnqAkj5akB?=
 =?us-ascii?Q?tOoH27eB/MoBdecdOJcFEZcXlLnWu80ZhcV/6B+K5h0rSkrKkHlA3dJs4gZ0?=
 =?us-ascii?Q?9rT2RKpYYd6XsXIJWjIiBljBZ4noZLm/8TBbYOD/MaarPH541aZvTO+iq6XJ?=
 =?us-ascii?Q?WLP9hH1LSA4ivwlt7MCsKQ0EPX7nfvQH713e0O7vNMVie7UZQ7YZ5Xh1XTsL?=
 =?us-ascii?Q?AEhiS8mk6BO1YrvzA0Up67uMD/yH1g647lsGB77HRpFQJcqlBhk4VrPY+2EN?=
 =?us-ascii?Q?GZxIiG+RYNIbuW98v0YrFlm/La4SXCjVrqrYmoNYRaMgauIb9ZIrStEdyzXn?=
 =?us-ascii?Q?+5Nzha6DGhhHLZVyho8mnD59IdyWhlq8hFeGE92PmH8F+uhD1xOOlrBxyTiN?=
 =?us-ascii?Q?j5Xb2ttC9AryKM91ZINzMQFcvslmyrNJXhqQPDOp4ghnbjcOdGk4+vsiCH0V?=
 =?us-ascii?Q?CmBo+bah/CRNCTjsJmH/fDHi5EEyupM6NKodaUU1G++mXvfY8c28l/k+haFR?=
 =?us-ascii?Q?Tm0kZ9e9ectzVg1gwF+hiKLUOfkawgYv6zBEo4nvqnDDo/ZugFtSUK2xLOh5?=
 =?us-ascii?Q?L0i7KHWglpgTW3svSU14RXkpF5Ysn4Kt0XtuaKqbFcrZwvaMhQK31/P8YgQj?=
 =?us-ascii?Q?j+8VuFSxpiYXT1AULK6X5gatRbYM58mbBj35cInDX8npMaZKzJ3L8Ko6Byqu?=
 =?us-ascii?Q?8pFpyAbiH60m+Sl4xw2reb6XK8uFo+kLAYq0b2zppc1upouCAY1IM762Hkqu?=
 =?us-ascii?Q?bKZ5kBQahWVJRkuZYGJfc6LVFxNEr8bbMVNNLf7I3wKo/J/ZvecpCeSZWZWo?=
 =?us-ascii?Q?YpV8+rN/fEWra0fCMylSrM4dHl1uPxO3jzMd+VVt4O14HznOPTixXRvDgT+o?=
 =?us-ascii?Q?vz32oNALOWFjI+SjcUqbZX80aCO8+KFiqCex0Fxzvu8jCnxLARxIcFjmalCk?=
 =?us-ascii?Q?qw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 420eacf7-4f8f-4524-1843-08dc44062265
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2024 09:07:11.6769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0glIyxr5MPo3FO5983Ub01qnmCU7RAwy3mhQQJ0a5OxlnpGkrX8XW+OqZ9KOPSQjSg3zpVKWHa9BYNFFtY/9POPTzvfNpFijTSQ5mjzNnWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8823

Hi Thomas,

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: Thursday, March 14, 2024 8:59 AM
> Subject: RE: [PATCH v2 5/5] irqchip/renesas-rzg2l: Use TIEN for enable/di=
sable
>=20
> On Wed, Mar 13 2024 at 15:59, Biju Das wrote:
> >> From: Thomas Gleixner <tglx@linutronix.de> IOW, it's zero functional
> >> change and completely unrelated to the above blurb.
> >
> > There is functional change. During disable, TINT source and TIEN
> > cleared together
> >
> > reg &=3D ~(TSSEL_MASK << TSSEL_SHIFT(tssr_offset));
> >
> > During Enable, TINT source and TIEN set together
> >
> > reg |=3D (TIEN | tint) << TSSEL_SHIFT(tssr_offset);
> >
> > This patch avoids modifying TINT source register which avoids hw race
> > as mentioned by hardware team. According to them we should not set
> > TINT source and TIEN together.
>=20
> Can you please split this into two pieces?
>=20
>     1) The fix itself at both places
>=20
>     2) The consolidation
>=20
> That way it's obvious what this is doing. I really missed that subtle cha=
nge.

OK, will split this patch into two.

Thanks,
Biju

