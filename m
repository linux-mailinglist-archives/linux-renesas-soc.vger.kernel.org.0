Return-Path: <linux-renesas-soc+bounces-4672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0668A7D35
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Apr 2024 09:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E167C1C212CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Apr 2024 07:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AAB6FE21;
	Wed, 17 Apr 2024 07:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n7+ZrioA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2048.outbound.protection.outlook.com [40.107.114.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7481D6FB9D;
	Wed, 17 Apr 2024 07:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713339387; cv=fail; b=UjNEoYps92RyMUHfNye2I+m9MysPZxeQKOaKID98TvVmZ/F5FraxgvYN6yL1dX90yiIaCIvOVcvZiZ5pbxLK7BrVf08SyJWp/6z43uDxvIqL3dtQhdBr7NfwqLEhrdWcNuUne7h2rJxWefgDlGTiBtaGkGbSjbjE+D1Rmtzuguw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713339387; c=relaxed/simple;
	bh=rbSyp9fzIVfsAC/UHIKMUt++i7MtfKBK2TcrMrsXdDA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UIWoktCJboFSLWEJWOFoEpF6+MKgv3bDQVuKezx+rbyHTEMZzTXJEduUc6oUxWpdHQpkVUphDKmJeRnJaZ8QlK1HOQugXh5ZfCcc5cT/BTYxPSq1j/QiCCZKPQqT0POayu9fqqLISAXzhX0qRRAkdd1Qvsdv5K8oE3N+tFFWvc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n7+ZrioA; arc=fail smtp.client-ip=40.107.114.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELb66utAwdHTbrsQpd0/pszkJuuhP67fAQAdMGYj7Rusdzr/63/raJwQ5AzxeUO0NGjRfqNsdDYhdBMtPPyam3XinVFT3ZDANlQwB2rvBp7CJqbIR0SlErNFlCMPRKHCDZPrwuJq6KBtRep6aCQiH4OuLkBbTXt9KavlgT8V5sA8iIwSpxAt9RaHWKCdLBr7X/imiXbGIQb9gIPhs/x3Pb50iWVE5dRD1Sa6Au8igpsSjnmcxZ7MWGOfoZHc8NqDi8vWVzijgkLqj7lD7FIDc7jOhxO5mcCylUXwy+a/7h5T2I8fhDRxN4AU+AnT86XPN5GpOogi1LGkGGfR0k/2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JA5qbeINxqUXFVK4YpKH4ldzb6vxBBHKUn4RzhZg+Tg=;
 b=hNRimzlsxbd0F54VYq1Rdg+SH7Srzt1Jp0eq7/Oa2fTuVty0EXUP0ANaNqJzWBFuk1r5IsrKazTWgnuuZg4B00jZ8YZ6r+jWOibR55lenPEq8+xqx0ZprZs29Z2YzNvHh4pPCXf9xjfijBJCte/syt3SJaiYRpkOPs7FNOe/blepmVvU0zE2+edmm87hgTnLLzJeVYpKgeY/CCXcSevMbyuARi0gaNQr1v5hG8RjlxfHXL7cr0Uv/sprCym0lOC+PYrz+ef1zEAoqeS5n3/fRBW3rwGqovttduwT/oWyg2WQERX+EjgcfbruKVnrRtG0RAZdK7biPqzIXPJ5qeN9nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JA5qbeINxqUXFVK4YpKH4ldzb6vxBBHKUn4RzhZg+Tg=;
 b=n7+ZrioAWd274l6ICbkz2/+EH+l4fp+WdtV9I0fK8DWvee0iX4naHCDN6wTCDUjISeJfuW6VuWWN4uR15rwy2IS88yxH4BZC3T25lJyUoF2aRmWc4CRopGajG4qrxpkXgNMAsR7+fmTiw4YdJZ1/J25hvRZOuVM8HfUpaQ7DE8A=
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 (2603:1096:400:390::11) by TYAPR01MB6252.jpnprd01.prod.outlook.com
 (2603:1096:402:3f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.51; Wed, 17 Apr
 2024 07:36:20 +0000
Received: from TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::cd96:e2d7:d31b:6428]) by TYWPR01MB11030.jpnprd01.prod.outlook.com
 ([fe80::cd96:e2d7:d31b:6428%5]) with mapi id 15.20.7452.049; Wed, 17 Apr 2024
 07:36:20 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Biju Das <biju.das.jz@bp.renesas.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
Subject: RE: [PATCH] usb: renesas_usbhs: Remove renesas_usbhs_get_info()
 wrapper
Thread-Topic: [PATCH] usb: renesas_usbhs: Remove renesas_usbhs_get_info()
 wrapper
Thread-Index: AQHakBZIRBLTKzfMhEaZrOERCAxWoLFsE40w
Date: Wed, 17 Apr 2024 07:36:20 +0000
Message-ID:
 <TYWPR01MB11030828622DFCFD2517FB6D5D80F2@TYWPR01MB11030.jpnprd01.prod.outlook.com>
References:
 <fa296af4452dfe394a58b75fd44c3bb9591936eb.1713282736.git.geert+renesas@glider.be>
In-Reply-To:
 <fa296af4452dfe394a58b75fd44c3bb9591936eb.1713282736.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11030:EE_|TYAPR01MB6252:EE_
x-ms-office365-filtering-correlation-id: f403503e-2f6a-49e0-07df-08dc5eb1132a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 gZ5Kc0DJygF7S5ooH4XEge5Qjspc7GqT0RZ0aBBB0bl0t5KzS9GFQPjcNhbnW34qXvZKHXbKSRb4SW5nSyQFpFZr5kfDt2fMwCa8Rn4eaBqJLiMCGOpOJweJsfbzOCx+gcBu9V75JQJoWjtz7aa9SNzCeRMCW4+iEQAJNRFlJfSRAg82FRfeU0bpUAl6DYCG+ZU5cMOrWpsndX3/Q1I1bhpRSH7cNTEkKV/3U7jd8vzGHNiT+E1eVSBj6XbSG3IEBCEPSD2bl/IGY8BXKYutnDG7NlVoHTwJSFEudVZyI+/bbqMp2jn6XODBmmH5cfvXLN+2Z0rR1tU8LN5OWDMEe+2gYWEFvr2V6SkVyjFL/3Etx0lT2in348G4UVwa+M0CpWPKD/PqZGj0YPlaUV1iIbIENjBu+me7yJW7zciIfQMhHflDy0Yoe43z8ZZsWEaWh71+3CJ+3Yqz+h0HgjvTsvfS/8z8kUe7BgzuknbJ63GwTH6WvwdxYmZUxjFgWsvDzzbAEdiwYCJtCnprpIuGja+kj1wA2WOc5goeJEpZT9vs8Fyic5WYh3iuI5+ZFCfYe6fV2dyQUwjyeCG9A1zZZhA+pD/d43idZm+pEOh9AgmE2bBIQhz4hp6dqJsl5EwYhl5apY3dBMfGHRxc2mNiMjJ9NYA7PTdYGFsVLljeLnQNE+VMneOEhQyqAtgRhCRnIw5WVDHYuQEG/bhBuHym77S2nmBwBdz32WFDlFz7yRA=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11030.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ikZt2KdhLLx2A0Jc9mcBzGSb44Ea+QNKvunfYIVOVLMbMUIQcKc+7CiUG8SC?=
 =?us-ascii?Q?33hTtySMZuvF2ED6hBiGfkDBPq487sIJa5t33orXC6tMOK16DR/Pj2ZRlxSD?=
 =?us-ascii?Q?FoImYgw6EBdGQj6Wkv63KlOnaIe9bQuZshPEcdZsYmDsxERdAtUW9xXa9tPv?=
 =?us-ascii?Q?FE9GGGVR3+S90KYGlVlds89r5HDKJMDJs2jTXtp0hkU8Fyx5IaKOqQ+lxzBK?=
 =?us-ascii?Q?DeQPeviy9+oHXTJiLuEiFxDjlcZwS+AEOkXlStt8MeUjv4gnvaGgN2pfJPba?=
 =?us-ascii?Q?IrODjnL9Iz3KIraPT1t9lZF4r8pcpvsxcvnOtU3DflOSW0qCVCJEgwj5BneV?=
 =?us-ascii?Q?rhzqfc4MnW3TJuKK9fmSceUt6v2+rPqH3G8J+Da2oYhVbzMWpJlvvEvfmhf1?=
 =?us-ascii?Q?/Yf05dAe9a9yOYzZ/XJRe4Amu6i40IbQR/1GNOsrZFLiSAlxPZcmzASuz4Z9?=
 =?us-ascii?Q?3jdlTNGw4NCikh6yY7PSDh9ex4QYWDrdCA6rOuCBcmH6Hj82ReyfJogIPXzf?=
 =?us-ascii?Q?hSX/z7GCSoMRCp1oX6mCPHySq/VWWUtjMFoBqXUbDKSPSvjVSxqOklnd4HL9?=
 =?us-ascii?Q?YG1h0pGPqlignfJ8xDwjdLIQ5sY5hfo/77rpmDS2IWiLZL3RQaV/egPLyAvE?=
 =?us-ascii?Q?DYK/kag6U3Y0sGesCCVs+c3EkGCuy414vAODx1sGfiIPZX/AtgIPyyr6rVhh?=
 =?us-ascii?Q?R/A4OZ6R+FIJ+sDK2atXysL4mYLvbi664c0xxc4s2HUTSpPSFQT5ez7mcc8A?=
 =?us-ascii?Q?McH8xd63N3ep15Vajozro2gy+h49anYLXomplNqxfPf08S0isgjxl7mKYEVF?=
 =?us-ascii?Q?WpuGNlsW+wSDL68wAX+kXa3MPwNQsaPOpcI1ef12hwbRXoG+Be2Ox3aNE+pO?=
 =?us-ascii?Q?BGSYzjjHbczRO9+DZ41lv4Q2nZIixJ4ka9X6OYWGvaJTlQ04AaxkhRWMqv5J?=
 =?us-ascii?Q?or/5XYLcKRZRegD3i494QcpkyAd72DNdxx/J1h/ywoBFuA2eZVQoXtfnDejO?=
 =?us-ascii?Q?oJM8y9dWhNpcWFuIqhI0hcdaxlMRTdCK1uI2iOpsMcexCwpFtcOT5qOvFqCF?=
 =?us-ascii?Q?tOwBwmkE40dZFmC9HN4xqTW37MH0nB3hr0QP3VR+5slTxM/oEtUD9mBO8qOO?=
 =?us-ascii?Q?F/9n+OSUPRkiwBM0dejsPm/CRkxjB5tMmCfXl68DNv4Eosq52BWjM2TXBMeB?=
 =?us-ascii?Q?3znRUmY+yiEqIJBr4KZgqAxkqLOw2bvYlsSzogwwnHwZ7b0muEAjGNAP4C8b?=
 =?us-ascii?Q?nlgidWRGormCnk9ZsaIrf5SPv3yAhiAhyiMarPdCYbJUOKXC2m4xvUooDpvM?=
 =?us-ascii?Q?yR1KjeoCHWNs9b9uFOWq5JOCa8ctQo/tX4pL+NACfl3N9P/1qiFvRzckRsd+?=
 =?us-ascii?Q?k9wXO/yZeX81Mq6PSRSEKk740I/67qjXPnIbgZhO7A7xBjFwTJXWHdZhUUPY?=
 =?us-ascii?Q?Lrse3fFNfK0NUZRzV274UJZ9Xugky2lwgH4CDtxdDAY0ajHenu1pkTj73nLr?=
 =?us-ascii?Q?fHIz7jXI3Pv8MUl0G/Hg3cbsoo6SlpEBCenMRE3UPo/UKPbg92U2/9FSyNBp?=
 =?us-ascii?Q?7vOYOzI0kLg9NutaABwaNhn0mlKbm8JaLMmeogPllqfswS6vue+SjjGUYqaq?=
 =?us-ascii?Q?sU9Xe4id8t39Psj6+Rx3iUM2zOCNLByCzOSQmgnXoXJWFMwBuDbOG0aG4ow7?=
 =?us-ascii?Q?aq0UAA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11030.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f403503e-2f6a-49e0-07df-08dc5eb1132a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2024 07:36:20.3209
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YLNIOBOMO9SdxaHqPGvDhxVpQ2TUX8rGfPOMpzq7HtWesEmN7AN0rSgsRMvZWch00nk8WtSpeBxPSw3KfFhFX/AFgq7/RnuyrB7SsAV+xEjwJpeIH/oQ1NL6uHohIutt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6252

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, April 17, 2024 12:54 AM
>=20
> The renesas_usbhs_get_info() wrapper was useful for legacy board code.
> Since commit 1fa59bda21c7fa36 ("ARM: shmobile: Remove legacy board code
> for Armadillo-800 EVA") in v4.3, it is no longer used outside the USBHS
> driver, and provides no added value over dev_get_platdata(), while
> obfuscating the real operation.
>=20
> Drop it, and replace it by dev_get_platdata() in its sole user.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  drivers/usb/renesas_usbhs/common.c | 2 +-
>  include/linux/usb/renesas_usbhs.h  | 5 -----
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


