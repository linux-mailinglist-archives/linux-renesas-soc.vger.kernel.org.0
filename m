Return-Path: <linux-renesas-soc+bounces-4667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE85A8A70C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 18:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6365C286A2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 16:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB1E1353EF;
	Tue, 16 Apr 2024 15:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qFmAa1v7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2074.outbound.protection.outlook.com [40.107.113.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0F3132489;
	Tue, 16 Apr 2024 15:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713283040; cv=fail; b=nCWUl/VH2aBfOxaaSDu1ZrWPrlzprpwloaaaLq5CZB1o45DYdvgnwVHYgvmTypN9KXZTs3+zxYhPEnnTsMeUOxx8e3vGY4jGFufPq44uTHzWH7r/GYsQrjuG/bouukfuVGBzEObmIkMvXox0m1TEeVpqsjJ8AST3sgjNK2fyb1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713283040; c=relaxed/simple;
	bh=JmxuEL6q6BQxn7mfIApODmNgrNzCLTc0o4ln2L6p3rs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ixUChpHQzftFp+nPukcAJHGCEJqzE68/DCPSisIlGYOvU4u+FbK626ZBWH3qQTlb1fujmBSX0lewsKLQbre/8MWR6vCtTSJr7TPp/Wv5xDNfnakkCX2E0Ugl+B/ru1OjkIJHeF89/wP2sNVNnMYxlHCsCIYYsNCskj2P01hYRMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qFmAa1v7; arc=fail smtp.client-ip=40.107.113.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kL5pbU04sxfwAt2ywWl0UXXP6MaURgI22IwmPdGjZ5euIdjy5VUGPMvaPAtj0mXBuwX+lQMWtxASST90ql3tbUPGZXX5GpI/avNeolaClwC71JS7r+QELvZdgRsyl5JwMv+9ktlnSlVLwv0rUqq7bDG7AVzHbtGPVQQctzhM5hYrcWrPAF578fH8EMZSM3eguryT46RLcuv61s8PwwjQoOK+Hyty1s6qldXU8n7Su+o3pNWlSDT124MU3uDP5A11VjlRpUG0yVYYBXCHhgnVYURtx7LGpTRAzLAsTlJrp0Mrl4tdnv1ql4oZC/RvYqBKtniQ+ytD88twaRB0XHK/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiRPHAxy8UKTIKjs1Ir5D24ra2v71yusFVZW3VnMfDY=;
 b=JxqIYuQEN35f2QSqwZ401QlViVJ14HxQVpT8fZ5qAeUhAUQfTkGcKW3kA+zwZdhwzAcltDrMC/hiRYKAOuX4fzeDJnUcAb+IIILclrn25wbC0+KagAcOfH8SXm0/JzhiAnGY2KQwrwlQ1LRPdUvhg0a4sr5Xdigf+4ohe5yosOulHgQBbxmBxAOmT6pmjDxeK3TRjUXtlWbmosGYB7mGACQqks33YYtCIZHojjvyITR48c1UbbbSFYgOo/YatAYzsHnO519f3oxmtqOstqSdZAcLQo0CaUC5z+qeli7f9srbLNnB0baHkGaORJEvFDZHvMkWxyXC4CNlO1XxZX7ulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiRPHAxy8UKTIKjs1Ir5D24ra2v71yusFVZW3VnMfDY=;
 b=qFmAa1v7m/SVpwYEl4WTDLK04+Vm7B4FkDrX9LWMtf+/ClaETwvThTjqmSgjLCwtAWDmu5dWiRwU4POs42KNBOeBf+5euvkF50dCH4RjYkasxxlmYfIJN/8wFUIHzcoUNDFgxrV5YjVkqgoJ9jKpGj1x5jzwo8F+DMte0iKl0Gw=
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com (2603:1096:603:2e::16)
 by TYWPR01MB9407.jpnprd01.prod.outlook.com (2603:1096:400:1a2::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 15:57:13 +0000
Received: from OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::fda5:45f9:f1b2:cbce]) by OSAPR01MB1587.jpnprd01.prod.outlook.com
 ([fe80::fda5:45f9:f1b2:cbce%3]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 15:57:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
Subject: RE: [PATCH] usb: renesas_usbhs: Remove renesas_usbhs_get_info()
 wrapper
Thread-Topic: [PATCH] usb: renesas_usbhs: Remove renesas_usbhs_get_info()
 wrapper
Thread-Index: AQHakBZI350z163bA0yIiECJx8jKB7FrDLtg
Date: Tue, 16 Apr 2024 15:57:08 +0000
Message-ID:
 <OSAPR01MB158761A6E15A505F9E9E3C8486082@OSAPR01MB1587.jpnprd01.prod.outlook.com>
References:
 <fa296af4452dfe394a58b75fd44c3bb9591936eb.1713282736.git.geert+renesas@glider.be>
In-Reply-To:
 <fa296af4452dfe394a58b75fd44c3bb9591936eb.1713282736.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSAPR01MB1587:EE_|TYWPR01MB9407:EE_
x-ms-office365-filtering-correlation-id: e4a71ae7-ef11-4ce4-3735-08dc5e2ddf03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 QXx/kx8M7lW4ZwtkalG9HXQaLF6MrFpuT6GbyU7vN7olIfVj++OsRtbbVPk8mFzT72+miQbdL+ioJ3dIr91AnJHEJz4/ZqtdzyJUomYce1pKkUKmfeL9/ziI6IYQkZnYLiNn5J8Ov8e6oibBhEDU2xrA19SvpYmmCemNzSuMyXxkfSiHe+J/iP2A9BQCzyPNcbevEB8NtrKwhwQWQpYD+n3aY1v6O0BwSMg/QwtjSfMeqYmtHGqVO0uX7swU2yr9jyZ6FOjm6apaHRPeRdr8k1wHocxSMee23ediMY7ifNTsJ4wMjGT1CYSeO806z+Ga5Kwb8GzxLCpMWyE/gtMTl/B4fpBgn6+y4wuRvVsVd31hcB6Ih+D85NeR1SD4wGTfbVeNwvYo7aPRUzZAt/Pow7kMwMkI9YNibNjBp/d0jhHUzjtbi4uM7/i3+Jc2ifRAWQhHegt6JESFhLkx2/eDkwbzEn21SkBP5mJOEwz9HQCF4De6RRnFzkTslzhXSX+nYBR7X8OT6PzCJYlS352Glzg+bhs/QPoVWiqM3knJsFOZpFh00souB/Lp5DoJmiDT2F+jjNE/s8oEqitXNkAMl/MWLtbDzZfKWiKb1PRQtor2fpC1wIfIz4Yos1fawz2Krq891Ld9XmOYtxVFcKZEIpok1IbfOdU9hazxy3By4wXSU7NJ5rGvwtG1ssJ2YhP3g5nshXh9DPMnV74QkVs3rB6m32yvgiu7/8gwK8eVEls=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB1587.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?NkjCz2K2i4xoCbHQizmkDI36IoIud0yS+PkSAJAY/xzR9AlIDbnipn+bsynN?=
 =?us-ascii?Q?WX0pv9KPFgHDEZWKDDsBCQADbtb9RrwlR+toSjM5YFW09xpWVr7Nkg0zQVbv?=
 =?us-ascii?Q?PkFYtIkaC5gydakVusBLyASfZpEBEEUe+8Tnpk24Gialo6AlrALLSTzAfJ5R?=
 =?us-ascii?Q?hBP5bTJ9NijBZjJlKm1UN/Xg4Ex0zpNA950aLFJ8m3gZOlR2AYCJc64e9Wt9?=
 =?us-ascii?Q?J5GOeDlZu2XO0SSBc+FJA03OjBborgHzw9Rj3OGmqxPiZnH98b1KC0Fx81yh?=
 =?us-ascii?Q?gqVdD4O9HdnJ1hnspzIwsnLuTqPoxicmdRxTQZd3I4rufDfnHsXXtthuCp92?=
 =?us-ascii?Q?Q5vdplNyWWSoreUkML1hNXDqdgAicxKYKw8KEIc3P0rrnSF6Sqg2b3yOm2Xw?=
 =?us-ascii?Q?UaVkS+a+Q87p/zkhwXvWR4XQzhIifPb7Al4Aa7jldZVWlZqpNg9aVkJgYVyr?=
 =?us-ascii?Q?gedKl8PIXQuvWRm4N/2ZqBadi6ykjiWhJoDjAKPv63aidTEZ6ZfgiSia6Lk4?=
 =?us-ascii?Q?vhfVj5PyU1O1X9QGa/Z2twqQoezQFgQhHdRSsupp/EltLp6IcEmKWGM/39Gj?=
 =?us-ascii?Q?7BHm4i7vbqpC7DICwHKU2rom2Dil8ZFnJXjdbaK0WNS5+VQI+7vD97De5soU?=
 =?us-ascii?Q?A2eUt+i/lFwqvZa4Yo8VGKdIfH1Riynp/+q16iBfVKRhjYg7KWLd4o7mnfwp?=
 =?us-ascii?Q?nD1puawkZYVXfOnYYy75xk0XaweAcdWEyrQSdIX4QLoHydbm3xSlHQekqOFV?=
 =?us-ascii?Q?fApIpiezmN4MOEDDJ8BtYJ4RZE07NjR3qmKcoTFeLk2mXR+sVam/1ogkbwOQ?=
 =?us-ascii?Q?O3EQguP8iDpZ8MNNwG2yxJ2yj9pyYsH8hl3zmKlvvuH+nqw7V5PfjXsIq8zs?=
 =?us-ascii?Q?xW8bwGgXdSJMh7t5xgYZlbQBrkfBiecPX/M8Re0ITHVwBe2lHoF+pIIR+GTl?=
 =?us-ascii?Q?SZVafnwq+81qnBkj93zYNmN76NGLt3rvRLYOJHCv2Tznb/1YEwFXwI6L9m9m?=
 =?us-ascii?Q?a5rXphdZrl1v+swpnwZweraLqvEKRbEPBxVOKr8GljJ0bY239CQIwTflIrWc?=
 =?us-ascii?Q?AZQRMZVtaLllPx0nRYp3RcantBu2XlmuSRCG1f5uSClv2HUhwzVKXkyb1MDF?=
 =?us-ascii?Q?ICxbtzaaEZnclyAJjSRM/NEnMvCReOJwH35maKQDEAgcpHVGwyrvzZ8GfqQL?=
 =?us-ascii?Q?vcobxcZfkOlXX4QVhQOC8O3cMx3lbWmOYp7WI7wNPBTNNPWjJ2Jd8C2u4A8h?=
 =?us-ascii?Q?hh9l9iaMLzavqQyATlykcEwYo+FHjLb1NwHzZ+MIjKLF5diiehFlivGLSoJI?=
 =?us-ascii?Q?ukZHYNyD1SzBUEStBPTDulaqfOWZUhzAKB9+Ga3t1YKco4DECp7eUhZY1CZF?=
 =?us-ascii?Q?iRhwvPXDEEPRFzXmHt09fqfKmyw23mWzyTyRcRtu6ct1yVEWHV9mHjHzf30V?=
 =?us-ascii?Q?2nXn+AE2d6XMYLFP3Pz2j/qzk1gNHxhNPNMm4EcQsPAmBqTEycg38CRuEKrF?=
 =?us-ascii?Q?WTOh9m0ZPhvaabm6l4/ZD/HljraSbT9i8MT4c2aKeBL3YxHVa9M4Fhf5hpe1?=
 =?us-ascii?Q?aadtA+APPVWqxP25wxzPBsJWr5vRW6LAbLMo/lglt3SiAKMy4Rc6IuPS0x3o?=
 =?us-ascii?Q?Xg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a71ae7-ef11-4ce4-3735-08dc5e2ddf03
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 15:57:08.7284
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KERTrKtEHMqBPwGUa2xBAoXxh7OkMLx81V3SsTp/pBmsd35XLVN0O86cQNCbOCLgiPtfGhuEP8gXqH6sP6c93ZL1m1l0dM295yTBw/SL8RI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9407

Hi Geert,

Thanks for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: Tuesday, April 16, 2024 4:54 PM
> Subject: [PATCH] usb: renesas_usbhs: Remove renesas_usbhs_get_info() wrap=
per
>=20
> The renesas_usbhs_get_info() wrapper was useful for legacy board code.
> Since commit 1fa59bda21c7fa36 ("ARM: shmobile: Remove legacy board code f=
or Armadillo-800 EVA") in
> v4.3, it is no longer used outside the USBHS driver, and provides no adde=
d value over
> dev_get_platdata(), while obfuscating the real operation.
>=20
> Drop it, and replace it by dev_get_platdata() in its sole user.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/usb/renesas_usbhs/common.c | 2 +-  include/linux/usb/renesas_usb=
hs.h  | 5 -----
>  2 files changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usb=
hs/common.c
> index b6bef9081bf275f0..edc43f169d493c65 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -613,7 +613,7 @@ static int usbhs_probe(struct platform_device *pdev)
>=20
>  	info =3D of_device_get_match_data(dev);
>  	if (!info) {
> -		info =3D renesas_usbhs_get_info(pdev);
> +		info =3D dev_get_platdata(dev);
>  		if (!info)
>  			return dev_err_probe(dev, -EINVAL, "no platform info\n");
>  	}
> diff --git a/include/linux/usb/renesas_usbhs.h b/include/linux/usb/renesa=
s_usbhs.h
> index 372898d9eeb00bbc..67bfcda6c7d2779e 100644
> --- a/include/linux/usb/renesas_usbhs.h
> +++ b/include/linux/usb/renesas_usbhs.h
> @@ -194,9 +194,4 @@ struct renesas_usbhs_platform_info {
>  	struct renesas_usbhs_driver_param	driver_param;
>  };
>=20
> -/*
> - * macro for platform
> - */
> -#define renesas_usbhs_get_info(pdev)\
> -	((struct renesas_usbhs_platform_info *)(pdev)->dev.platform_data)
>  #endif /* RENESAS_USB_H */
> --
> 2.34.1


