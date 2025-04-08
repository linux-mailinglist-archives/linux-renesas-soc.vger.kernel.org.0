Return-Path: <linux-renesas-soc+bounces-15544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06673A7FAF9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 12:07:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B44A3B6004
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 10:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B55E267F46;
	Tue,  8 Apr 2025 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AY/qQULn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43CA266B40;
	Tue,  8 Apr 2025 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106130; cv=fail; b=bz9pfAsXUC4mWt9wMNkwpiugsM7t1gayHcIahPaRZtj8pdwBYLbLBJFvr0+iwPcPZkjQ+ZYG+9LCaOntLFOtVlFgrPKYU/DPHvFjZx1EjpPSsfTnrCsys4ic9rKhqfXt/l8jsPV58SfyLU96WZNSpLuwmOQ7wRiaXxHztwOwUW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106130; c=relaxed/simple;
	bh=Zysoi7H4XxBf1Akp8JjI6ZpvlQ9wmyUisvGxqDm84kM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gP/Gb+P+/B7PazEs8D5Z++21Xvl0Nw9cEOn4gYKFtR6NCdJXmX2thQi31hXXbjIAnbUeY1MVMJI5neCNnXN2SlqM5tq+zkCU4oerAYcGLgbEYj+0cuDSUqFHeatfejSVKJogkP1S23aFvWwZH6bM68Ua0UA4h0/XilzcXIpMpbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AY/qQULn; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKypCtMxLt4smDWNXNKCNmlVCBN1EkeaAYhxfKNKCk/JvY39LHjfvhl2EmJ+YZ/r5yBn0Y/YXYFX23eMvsYqOO+sof4NEiXscIaVvVs1M3Vbo0M8g/Nve+eu0tB+hG7XWoRelPiaYsR/qBGhLhS1ijWx0vTAOVNQ44Z4jlZRZuCV1W/nDNHAAEvVugJ93AZ6XBLNMZcXjgCqJUCnGO55RAQVZo9qf1ezOLDLplmP9jqorn9R/Jjt2qQL9cFKCf8oj08iiKSg0OmgHcPo7WiwXNt2K2r5y+kn/acTQJsrw3ttPkCQO7eb/E9FKuexMmk3QXCLJb2IE6OoejfgMqtDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjoYLh3Z7QqJiVC+MHc0WQYkVYidYMtXY9i/8JeUSjk=;
 b=O12/8fDBN/I7+GPIGKHc76vmD38I6j1O0JH6eHebKKIQw4TLpmwzxvyRKz69kE/gzQEVyOao5IqQf2MDn5TK0zm7y+FIIx7bFH3CeCVqmAeGKh/X6Pc6pgRkueRtXzqmO50RuaoqHQdhiWXVKShPhfISPZrWJCZv91q+om7zTBKEWtkaEwhW6TrY2yIfb+LNnzgKUd2TWycneTBVbEp3c4Bied2Ovto25aB9gfsYlaNpieOHH+LreBZiZN9wrHTpeMpaETQ2/ZBW8RDPXZ1+coOhG+zAj0NBTOmHnimFrQ+/bzu2XoBETEC6Cxw/hWsKTRorRr6cIuQND62Wn0oc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fjoYLh3Z7QqJiVC+MHc0WQYkVYidYMtXY9i/8JeUSjk=;
 b=AY/qQULnpU3lYawEQ3hXSXlaU06ND71YIeVEsg3PfHdvtdVrkPk/f7cuQDGe0TYJGeAzW5ycyMZMz1+m3vRVE4WvyoPRP67qwHk7xt0ecsacK5B6xMFB3CieQixForN95BpNAybP4wqYvOBfOfG0bGnaUdp7Zo4Zm6zS36zLtmA=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TY3PR01MB11347.jpnprd01.prod.outlook.com (2603:1096:400:36e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 09:55:21 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%3]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 09:55:21 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 2/3] usb: renesas_usbhs: Fix typo in comment
Thread-Topic: [PATCH v2 2/3] usb: renesas_usbhs: Fix typo in comment
Thread-Index: AQHbp6rYdFf6gpZSq0iUzGIDQfoMdbOZiT3g
Date: Tue, 8 Apr 2025 09:55:21 +0000
Message-ID:
 <TYCPR01MB110408FB10F30C127E5D3271FD8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407105002.107181-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407105002.107181-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TY3PR01MB11347:EE_
x-ms-office365-filtering-correlation-id: 5290b5fa-a991-4aaa-8c02-08dd768379c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?xL8IKhDINvYhsNmomSEFoJdmYhzV1EnXRiriwu4VYr/z0hEdRne9UZEcrh3o?=
 =?us-ascii?Q?qudEgzMjFmceJfKyikbfVxTs28WxrKd1KtVOjc2H+Zz3Tez6DsLJO3+WgrGe?=
 =?us-ascii?Q?fhrnpUmVUs1EcNTnu/N97LmgMNjOclyZIhnE2VsWmH772HjbOb5W0FqOBT4H?=
 =?us-ascii?Q?cojLi3dNMe9Q/s/7RysMGkdJXEpNdrq5i8bgppfZSSkyMJncnZK07Su94ID/?=
 =?us-ascii?Q?VpuqZCjWNzBvq1aLasXZmyJeNracwaRGoiemwuJ4tQNwIAisz/kFJr/6sQMw?=
 =?us-ascii?Q?ZZXyFCf+I5m5+L2oBvIo4hU/LgT2RKSShPfu6hPID2fUTy05E6nh+Of0RAh1?=
 =?us-ascii?Q?MDOCCbgl221Vdni/3L010r8GGH57jOjLIxRaOD5Ex5v1x/l5iBmhSQQAtL7b?=
 =?us-ascii?Q?Xh0I2UTNq1d9DRaESa1VBRjSLdL7Uwdouz6Fs0uHpHpeHC/KhQ2n8CHnvmBZ?=
 =?us-ascii?Q?RFRYqvHZqAW3Vu4ceWR6b6ftOngby6ruUYVjA7nD1hMktBO/LJwaedeBgbE8?=
 =?us-ascii?Q?+29C0jnVVpTgI0Zfc8XM0nbUxlFfQcerASUsfCv1ogerPou7bdqLEQ2KkGmU?=
 =?us-ascii?Q?oGQutVLgmONAEMRqq8N0VR62xgq0ygL5iEFVgCsB72xbYda56kzOdE3BxIvr?=
 =?us-ascii?Q?UUz2GrILdw2MMtOA417Rb24RXSOQ+9qvNjt56+XIUARlehBJZcq6s7YYiQRL?=
 =?us-ascii?Q?r6P9PBjyKlJl83Ji50UKf6iz5qN7ycjHGCYQ9V7j8gXEotjgIs2yD5oluBGv?=
 =?us-ascii?Q?h5qyYZan2XfC0aoPgNByGilNl7UHQuJId6u6iOzCZNJTUN4Vlivuerv4twGl?=
 =?us-ascii?Q?84D9cyLTQl50GInzdD6iiIO9YqMBFw+O911xZ3Dh2J1qyL4Y86scTW5+7AeU?=
 =?us-ascii?Q?22RMmGexu22fhrQTPOIaeXckIlniG2j/I65VqVMK9baTDpFkXFBgNpVa+WUH?=
 =?us-ascii?Q?6YymdfW4wK0y0ctaM3WpLl93i+x9JxIzcE42JGYldhN4jPaHP5OHkpxcnbyi?=
 =?us-ascii?Q?y5oFghYz2cowgAHD+GammZV+QBDT3v6QqVRPOUj88wpXdoY10LuCC8CBRPMv?=
 =?us-ascii?Q?zD6YD1hHDbBkzbrtS0bMvaC/KYjlT2gmRDWD4AogJww02U8GQC5egCTVzHVu?=
 =?us-ascii?Q?edCMNJpdN3wALqoy2obtyjagcHX5LJ56vEn0n9qvDxyhQURx6NZbpWDyqPXc?=
 =?us-ascii?Q?pd944nFU6IJP2rAR0/UY9KYwN2dfEVz4o8MgGXYOqfagjd8EL6VRhkNVsCTN?=
 =?us-ascii?Q?jTgZN39pa1zNSGBC/rdsBC1Kbw4ggnMtU2xT8piBS1Y+Y3rr1pKdUFBJuF/J?=
 =?us-ascii?Q?MgtWsF51T5VVum0dQEloCTFzMV5+/hCttxY64ImsE6ntjnGB0DxHZRwdtmFR?=
 =?us-ascii?Q?0KIijCHZVu9hFPbxczPKZu77JDc0bWcTZdPGdzV6oA++pYLlA53szysrnvFk?=
 =?us-ascii?Q?T1aUmtPvoA4QoVoqCbL/34vaD/ADb5fo?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?awa1m38sXCN71ohjkV56ucizrfKIno6FbYeWLpuQ84LEA0hIR/BvVe9Xtyaa?=
 =?us-ascii?Q?k8fkchCW8aeYQKOeLyJGLMaZPTs4z0ucujoiMqeMyZ53obKccLzIPEm8sHR/?=
 =?us-ascii?Q?ggzHTM2FOsD/J6jVR+ogKYLsQLZ/U7vAly/UoAj1JQARkAKCJe7Mz8yNOOa4?=
 =?us-ascii?Q?ZzxAwHtlyTDVJBM+yltY/poI2/9VL3GU4tcw8IBMdTqWsqolK6vZqsM8Maib?=
 =?us-ascii?Q?7ob2hjccGWezgrJwBF9Qh0PJ+TPQJItZvZda5oNQal1QpPflVJ6fhOMjkKRF?=
 =?us-ascii?Q?JmSd/v9m6JXY8t9lkQQGD5BJpTiNPiu+pt/p033QJrgP3RIK4lxIMhA0bpel?=
 =?us-ascii?Q?ieCj/91FfRFg9tkTlsgJ9j+fOhQMk9w2zdMfZFfjGCNbdBumT+QGpbn4TueR?=
 =?us-ascii?Q?Mpvqig2up2elhON+/9wV2ONvbIJVF6dI3ePVuCHkUa3nhgDRz5yBW3X9J3tE?=
 =?us-ascii?Q?hpWOCRgoandQeeFb91ZP5Im2S/oTYcFsCETxrQyWG3lfasWekF+jABU/op9o?=
 =?us-ascii?Q?7jut39M1qHKsmv2JjyVC8xSqISk2a337dskwo3TEf0s2zABTP7W5PP0Qm0yb?=
 =?us-ascii?Q?0YcArBHP8j+w2qwVUWMJNpEnasHeaviPaJVKEZVP4lygauCTHsbEJMc/jr7F?=
 =?us-ascii?Q?t+bz0HVZMu+4xIdMNtgjrGrvQ1/1EBPeL/mEmARR4JcCM9LvOdvKdjXqIUYj?=
 =?us-ascii?Q?90nlHfk05tWXu0DqQCQsn5dV6kVXDO9pRFPCsVBq3ui5iPleFed0mwRo+lOe?=
 =?us-ascii?Q?M+E1oR2e+716lhvYOQFf5sgnE9oNmEnEqUj4gm/eqPxYtZzmDrgwyd94J9tV?=
 =?us-ascii?Q?7PinpuXWqUunygeYdVCHTwFftDQm8KruiSps7UkJvKQl6d/Ej7E6NxhlVOBX?=
 =?us-ascii?Q?nS2gISnB+MUuMwkiYKvkwkf8/Yw/mrepcrnTeK0bFr2I4L4SIJ/k5F9G7dFj?=
 =?us-ascii?Q?L8I7ljU3PvNWqP+qlWBiqv17nTkcOSH81r7XGMu0Oomlv2FN5e/LCs3C0hlo?=
 =?us-ascii?Q?DCM/Ws8oZkBqgzv/a+3E8qW6S9VJft6P2umNQPuQzOQ9OX7zHC0ZiyxGN4co?=
 =?us-ascii?Q?xlKxl/vN1v3mRhMzhejD3ejm4qyR7eGSsm+Nm1aYmwmLm1lStdofltKBAXBE?=
 =?us-ascii?Q?JZqk/oLZWfygGDjZd8QKHe8edzkD1YuwekZzVFqhFu9D/76uXJbImi7fQApH?=
 =?us-ascii?Q?rkwGyiwiriUZlCOKa20n470TORci+zXVgS7WWWbNxw/sgNTghDj8yqHgAbdD?=
 =?us-ascii?Q?6QFwrsvkE1It04qsNEqilsZlPDY3JNCVEa0z5iDsmGpRNWNNXJ1RmjiDhUfd?=
 =?us-ascii?Q?8NdQMD/SaBLpMHwGxhG2a8Ml6oSkV0ML0bOXfhMY3ozIluBuJzBzkwjtD2Ye?=
 =?us-ascii?Q?3syBM5mCjMk7KrpDTEJdX9+/hmEYcFH0/3S96EkX2ZcEtAoybV57HXNJNLJz?=
 =?us-ascii?Q?I7I/LcNAE7T5syu9PlzfdrVIVxjAHzbO0JgA2idpoiz86JojwrrzLST0ipHb?=
 =?us-ascii?Q?hl0JTXhmRg6fGGf3gYtg+elv17wY9TfR66weGlXO5kWDJxuwQetO/372Hnz7?=
 =?us-ascii?Q?gwowFgrlUt9vfnqr2evEpbkGaEw5Koi6NPpu5qyHU8DKXa6ACJF9FdF9IDJe?=
 =?us-ascii?Q?lKpz6CZ76mBGhlmdhl5GVjlFiLdgGr/0vdsCRWTC2zpFjIc1V8DSbJPXSW9P?=
 =?us-ascii?Q?c3a9Pw=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5290b5fa-a991-4aaa-8c02-08dd768379c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 09:55:21.1907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oIM3J44isq3oLhPCDUlQQ1Rm/Krn5UfBj9AurEZBgP+mF6OFfBNejrkAZuM00/mvSgGDgxrbFtlxAWRKZBWVfch18EP8wOFVcYj+bFujK5rLq88JiKvjUkascjmBh+pH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11347

Hello Prabhakar-san,

> From: Prabhakar, Sent: Monday, April 7, 2025 7:50 PM
>=20
> Fix a typo in the comment by correcting "deviece" to "device"
> for clarity and readability.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  drivers/usb/renesas_usbhs/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usb=
hs/common.c
> index 03d4d40c90b3..703cf5d0cb41 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -710,7 +710,7 @@ static int usbhs_probe(struct platform_device *pdev)
>  		goto probe_fail_clks;
>=20
>  	/*
> -	 * deviece reset here because
> +	 * device reset here because
>  	 * USB device might be used in boot loader.
>  	 */
>  	usbhs_sys_clock_ctrl(priv, 0);
> --
> 2.49.0


