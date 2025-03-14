Return-Path: <linux-renesas-soc+bounces-14362-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 313DCA60E83
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 11:15:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEAE91B60B61
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 10:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F57C1F30CC;
	Fri, 14 Mar 2025 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kDZzkSnb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0665A1F30BB;
	Fri, 14 Mar 2025 10:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741947315; cv=fail; b=o3asBSmUbfXwlpgN2ChefzHdvhGf2AZxvk9QStEpeCae54/sgRDJs5Tvhq4juWNnTyUqCI8eN29rhOB0jhVYyUdRphsej9r0ie33bdnAgkb70VfEllN3OWSWoyhtFXUeYWyj4znNFHIn6b4YycS9g04N9PaS3+x+ppcR/2ufgQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741947315; c=relaxed/simple;
	bh=KWH3EswySKU0sxFzKjTZdbWWntbeGhYLmES48EJDzJ0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kx2SBhtbhUcakVne8A389tXuTnmAVeG8WAqFquuvpnyxKDixbUObWSPtqCKvM4G8kWfbOYyAz8jxsGpCo8iVs2Bf8iCLlMj2KUXvjcByq6qg3+4UfxRWQj34R9Q3o/4Ri1T/s7mTBE3kZwZvg+HZ0/X2QS2fokq2ayYPwJv1rK4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kDZzkSnb; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ck0MV8WeVMH9q6XUmnfatu3Y2jGZiUnqgbheQQH9ClK95cVdZpM4D9hr1eFJxM72ONs8h25bPKDrECmGqThUVbAwo+IvVbXQUPSKBWdvSwFfFD+o6qzBlPre5/cIPYMalnw3bA3pUOSP+LwRF1bH1k9lWPZVKUkhckpds5hbTgufM2StBsQwnxwq30VjYvP+gNOONN2jnH6Wx+88ywTquds5u5+BvqtlJy/7T+eO9mKCP1Yi6nFJWsaRRHM0CsQf2VsYz3LG0ASwML5dklv25OGcd8Lm3ycEB8auQGmFmyeUwnSLf05JaauMI8N3g9hNJWZ+s871u6xlIkUF6iBjVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ADOwOLl24qoENQNmuKFpwmARfh0YPCQyyAf8UBwPLlg=;
 b=KPUuvZNuB1E76T8XtlHkKiKenADbu/uydcVEumxgi+4LeVo9572pLSQ7UEBki/Tu/ILkXPJF9IaYlei7VPeQnakd+OUcmhZdbyy+myrTxFwbgx6oVrJCApd/6Vi9UAmMKUwGonna1aQC0exNgLt/INDxs6M8gojthFT7CR0gAOc+w/XMWjpn1ojT25TBXcuNvY7fy2Jox5Uzc5HTk7QCDx6ixayFZrqQ17HxRS3rA/jTNdITq7ZF/QTJbaZE2A0WFEI9ZV8F7q+j8D1DqX5nO6lHmGkcAF7Njohv/yEn2+i2vEAl7hrAvtPT3fCqSwPVC8uVY8338NQi3B205501IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ADOwOLl24qoENQNmuKFpwmARfh0YPCQyyAf8UBwPLlg=;
 b=kDZzkSnbjwk9ydFFo9q09qDYf7p7Ksu2HBXVKqZfSmHsfDWqREXp21m4urwqhYfRKzW/lnFyPnCukqiu/w8+drSXJ0NWzKf+mFxOXiE+CPEQtrM1ZU79g74LpFVai4vDhyNSFyTt7WV7v7aYGJzmCaae43XsPIMRuKKnaLHk43E=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYXPR01MB15226.jpnprd01.prod.outlook.com (2603:1096:405:277::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.25; Fri, 14 Mar
 2025 10:15:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 10:15:07 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH next] mmc: renesas_sdhi: fix error code in
 renesas_sdhi_probe()
Thread-Topic: [PATCH next] mmc: renesas_sdhi: fix error code in
 renesas_sdhi_probe()
Thread-Index: AQHblMltsVKbnbAap0a6zPod5KkbKbNyaiAQ
Date: Fri, 14 Mar 2025 10:15:06 +0000
Message-ID:
 <TY3PR01MB1134649E12B12E9D86560F92B86D22@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <dc39e555-8ef7-4a39-9253-65bcf3e50c01@stanley.mountain>
In-Reply-To: <dc39e555-8ef7-4a39-9253-65bcf3e50c01@stanley.mountain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYXPR01MB15226:EE_
x-ms-office365-filtering-correlation-id: 3e9025f5-dc80-42f6-5e20-08dd62e1183d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tRZ5M/6D1jJUe70uksin6bf4ICwOvqXeAdlfRdwU5oqo1jOM2naxM8M9OkPx?=
 =?us-ascii?Q?aA+bEFOFdy6h6FxYL1Dwj2Z0ZOcdj9u/3OVsvD8IBHRYpomKKSf1v9HxL2NT?=
 =?us-ascii?Q?Jh9cZtvSHwcny5e/WQ1Y0+VxrlA0WifeNd7tnAzRFvVBwehNwOh4CWwxOmDm?=
 =?us-ascii?Q?l+V6wfCztgdPDd/AkKQcO83optW4y7fO8UHv7Wk4ee1BwPgc28EvClHdRfGV?=
 =?us-ascii?Q?CSi+D7bDxTAUBKs9FxkhipEtNQQZh1uq8wAhtvYtDPKBf6+SiXwFcawyhovT?=
 =?us-ascii?Q?/S5m/1+AY1fSo1hlDZ3VxsM3ef8aAMIxA7iAyyzxjfkMNDr0U8ilFx0HvIMO?=
 =?us-ascii?Q?FJ4VnATvY87trNrms6EZOOm4JS2gb4M8PeCt8Hcm8rg62q/rxECCJBtvegOd?=
 =?us-ascii?Q?Ke+emTW15feLwlPA0QPyFC1/E44CQPrrTLfcNhCdwExLmU/IR5c7ZMCHl+xk?=
 =?us-ascii?Q?7IvUbZI9HE7O+6aQGpenVTky8wRG8sUkllUIyVd3CFtczQyBkwBbK5CI4Yln?=
 =?us-ascii?Q?PIFPI44JsMsUhSvXFHfxqDAhJ9pkH8X48FwCR7fpME1X6angvOdnFEw9ZqP1?=
 =?us-ascii?Q?2gxDX5ordcU5mqGe4bbQuWq1+plygz4Y4PY3t9RjIxGG0RIgZSNsl/9rKA8o?=
 =?us-ascii?Q?TGs+vx/Qbj0uOM43UWdlb/FSdFCwuF4130De+EP9dEkvetiYf7AJQZtAsjgT?=
 =?us-ascii?Q?VxpyAPytOZPMAxGqO/Z+jmVfQtsY9Em1o66es8Hgo5ceqRTBhAL/u1ns8P7l?=
 =?us-ascii?Q?animf5GbkJ47xM0/F4LiUKUdznqgY8ADiyB6agn3vaMm/ohHQ8bLb43k5xtg?=
 =?us-ascii?Q?LaUSvJ8UA/Uoo+hJ1Whpo3ldIJYAkp2TOn4COad+bxVzMzo8xUxdaKlWi7Q4?=
 =?us-ascii?Q?7e3FsGzaQzpwqBVKi/rY3NEKJGQ6gBy8FvhWK+z384FVREYIu7FRYVOM8UgK?=
 =?us-ascii?Q?2iGg6HsDJH8v2LQFopIz0643hwvQ7ic/aL1DvlaBsVI7jZjIpgaPwThWkYNb?=
 =?us-ascii?Q?a65fr83bwelFVlk/HnPwFJql9fLFloeWP+NSjInFrpd1q3KLLDwKEQTAaZfC?=
 =?us-ascii?Q?g9NqYox2upDidqCK0w3wbNc9UJ50R34kcMRz7ccvdGbYzuXVHQAnqaBs5sdt?=
 =?us-ascii?Q?rBS1cmNwJj2qlatxEdB5sMfo/ILiGl02lphcaciOmbN8ZBXvl/Ns7YUPQeTr?=
 =?us-ascii?Q?thgtO7IgMu2dQmRXPGGuA9KOanm/ON151e5fpvYSZ3PSqtu+HRhGbzwrYnF8?=
 =?us-ascii?Q?sniuQQIH5aaNqUDwpTai0GhGv1kxAR8Ncw1qXt/momyb/DJkNhkBRyE8qw01?=
 =?us-ascii?Q?MeV0IiHAABv7niHhSrkLzrh5XuTukjyhwx7DYDZZYVTOdCrmuansGUol5PYl?=
 =?us-ascii?Q?ZYVi047eZtwx0umH2dwpfZFcvkuEzgY0d6I2W+oo1rkytGj66NrWU+bfbFf0?=
 =?us-ascii?Q?eO80xkEvbn0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Rn9j0lS3W60xuKimCbSHQSc+4hsfUqA2tcf1W9oRUq5U9M663tAV0Lx8g+73?=
 =?us-ascii?Q?ESIJYQKYGjkeKyAO3opp+LS9eaa0UfVwuHOdS55guU9QJ2ts+DiWe4pSZGBj?=
 =?us-ascii?Q?XNGSnDuPDRA/WB3bdjjM7FobmMgBMG7rWmnoywp5uIscCzR/o0PKxZn76ekm?=
 =?us-ascii?Q?nHBrVRfdyZUa26ehy0QvQCSOLLgnZThyd2wwgaiNihKYrtnILF1ocSwO4nfu?=
 =?us-ascii?Q?VvTavHkaUx2VE3NFoyQaR48v7gX4ktgf+MGHe7oTHCzvbVqwwHt03NAA3eMZ?=
 =?us-ascii?Q?4zf8F3REH+KHQPzSOZvhi+6nkBgispEC78ogSYb6FyHmOjxvmFJN7qLRAX3W?=
 =?us-ascii?Q?kA58qPHrfQknNVOR86jDi21iHVK1rBDjFdelXtxz9/h71RIRmjZaIEwsh2sc?=
 =?us-ascii?Q?9z+G27poSIEjT8jfWnmALmwxuUqoAgQnW0qSoyUw+IU3XLzNqZbNJQSmDDP5?=
 =?us-ascii?Q?GifTDsBrSxowO5fw2FgXqPSmtxyMqhV9pIbXkTbNvpmiOmTW8Gy4AJZ/Jls1?=
 =?us-ascii?Q?3bgzE/nzvhiK5bh+mMzVD7PkKq58GNBUd5LbvQhf1cgy3cQI0tmYzo1ZKH8F?=
 =?us-ascii?Q?AoZX2WlG7WMFpxapIpTEfJjRhPOfIvDz8qmP7D7zUbTdnYOU561jXRdvtFF3?=
 =?us-ascii?Q?qUihoP5vdJP1lvLS8uSZFT+qGn6FieexJt44a4i+ghT6FrXUysMPIOzXrDYf?=
 =?us-ascii?Q?13pxiuxsTzEQXrVfywECeyVsGF1EmsK4UrVMvg0LexXu4XRDS+KGiwe97Wdk?=
 =?us-ascii?Q?4qOtNfvFUMWlOXcHIxNow3BJmwsNfvJZkXh2g62NO1ai6ezDwNuFPFTLtNlI?=
 =?us-ascii?Q?wNe8np5tKcMrEtDQDvy79DoQrgRgVyoYSVp9v/jJpA9hXINeNAxUh1duaqeT?=
 =?us-ascii?Q?083ppM3kN2Jdu5xCNX8bU27ViP0whXmrqMCqoGdBNQSin8o0bFNx+0ZJHQEd?=
 =?us-ascii?Q?E4/ogKeQfMHu0dN0k7WEmwLYAirp02al8uVlcDuhJc9usxBm0TeSKc2/Fulf?=
 =?us-ascii?Q?NMGWxZShM/qPbTGNAc1JnIHAPrxslyI+jJ6C6+imALIs8drLUnD4I4FLGKq8?=
 =?us-ascii?Q?nOuy5IOyBXnDxdYNQE2XeE2NL217oyn9vcMcdU3bM/f9TNMG79T4JnCegbDC?=
 =?us-ascii?Q?y6SWkjiKWicKE+o+TVJfubwYMDNe9w7tVd9+tibkyfcJFYBpV/3RMFlTM402?=
 =?us-ascii?Q?0rApR0PRHVCTbyE8z8oK1CKYhWRKamnj60rl86oA7VTf4T+/47xeQkbNiDcC?=
 =?us-ascii?Q?NPp8g3efEWWgQxOdUiawJT53nne4fix1lZr/n58svFSNONSEvNecAlMQjt1x?=
 =?us-ascii?Q?mAXXwYQUF+fR1g2SqMDR/cb1ZTLire8RyZZ3nNxbtlDxboBpdOHuXFeriGJT?=
 =?us-ascii?Q?wJ1J2m+JoU2zgPK4bkptlvb0yRVP6WTEifU/GGrgysv5+5ERX+GmJ4H/aqvQ?=
 =?us-ascii?Q?PAl59lT/+ur4zM81BkfeSfHb1V6ncKgGz6DB/6sR7Zg8s72LDk8ThoRgyvCe?=
 =?us-ascii?Q?IHSGYr9wkfgcMEWjKgClvIwEugdtLRCFu+CykMZsmayVEDTXMnIKlEv6xsNU?=
 =?us-ascii?Q?8RtVyT8scLp1cznWNytbKn4EtD0d8EE6OtGPLK0dl4K47VFCYNqIt/ZSpe3Z?=
 =?us-ascii?Q?YA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e9025f5-dc80-42f6-5e20-08dd62e1183d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2025 10:15:06.9763
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AgTbXcWUpjfmdl2jXhBZHHBf6V112++69x8wof8/UDg5wo3G/4k00Davr7DL+l/PqiIRfSIsDMckd4enIs27LNH0tgTeag3WbOk/vo+4xd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB15226

Hi Dan Carpenter,

Thanks for the patch.


> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: 14 March 2025 10:11
> Subject: [PATCH next] mmc: renesas_sdhi: fix error code in renesas_sdhi_p=
robe()
>=20
> If devm_regulator_register() fails then propagate the error code.  Don't =
return success.
>=20
> Fixes: fae80a99dc03 ("mmc: renesas_sdhi: Add support for RZ/G3E SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju
> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 396fa2816a15..fa6526be3638 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1178,6 +1178,7 @@ int renesas_sdhi_probe(struct platform_device *pdev=
,
>  		of_node_put(rcfg.of_node);
>  		if (IS_ERR(rdev)) {
>  			dev_err(dev, "regulator register failed err=3D%ld", PTR_ERR(rdev));
> +			ret =3D PTR_ERR(rdev);
>  			goto efree;
>  		}
>  		priv->rdev =3D rdev;
> --
> 2.47.2


