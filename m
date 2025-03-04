Return-Path: <linux-renesas-soc+bounces-13941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 112CAA4D402
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 07:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EFFF17061B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Mar 2025 06:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B241A1F4CA2;
	Tue,  4 Mar 2025 06:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ArimVgF2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011038.outbound.protection.outlook.com [40.107.74.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594821F419E;
	Tue,  4 Mar 2025 06:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741070587; cv=fail; b=tq686FHVbBqSlTVC16lsQZgrat2Mi3V43QQ+tdFur0cpGjwirmCfCFEFJoSuOOeoIu0/+enPVR7QI6uYsT6r8LfYxgWP00f1QHK0upt1+9mZAKi0BqW0em/2t41qqSR4sFi3xU6VPm/RJ/6SbqqwM6TKvBvuakapgCbl6YU4VWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741070587; c=relaxed/simple;
	bh=4E5r9Jio47w5TenXRFwKnXknnr2O1wOask3N82y5Ga8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cr253PlNGB5wnDKbDKsnnj5XODY4oBF5V0YphkSoa+g69MO6PeVPboITpdiMqr94pLr31vKhfc15CMjwEVN4oVFyJx2Hex0LqylUcF9ezuLiboF1MILB3MdL3nPzJBURnYIToYvFSQyUSWPND6DAQQfNF+LXf+oYhZxJh/nKGWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ArimVgF2; arc=fail smtp.client-ip=40.107.74.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiUXdPUYdriq1PZ08Po40uGLER33NcP7MdzS4wd0uUSgCkbM5878ova40AR99/6YppBFCMtisNFauJ/gm++CCWCMGKQVdRg0GW2Gogca7sVfzIUNPQuzJeFic+uOp9K7bQZm2eG3x3HKRLy8trYYwm1BFMltyWWZCl6Z4P/e0auCZDsN9C5tN3CcpXLPFogXKzkCP69BlaxJOh2Rz050M9NYbOZx7heCBD1ZzyrcP+W+moWBCkKuDURfpuJZUUl56vmanJw3iki8x8HCWEqAXdIAPg7Kou2uwdSapvgo+IwNAvIfSrHCkj13n/E3V+luGVizEbxL0DtrEOfuvXFDcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puOeo/eiClTGQ4ctZQjqEss/sO3DV6VY0JooSaGWNU8=;
 b=BaD2CMXMhIBg0qt9shsYMGbaYgfkX0A+nNtD9FxzkZ74hfzxDrtYeqlvCNHTv/5WwALavxmlZBvXhpmzVnZ2f9eZJliNiwdauf79QundPmB4aUEZnIovKXoROBTjqfAGO5Eh4gePcsXkk3e7Ewz/otuzh4Jz5PgGXSG/7IABliRJZroyeBRCrJzWsc+ue514k6BKq3mWPUpJbumnK3wdQGb4osnD8uR6kuzixMEydTDEKFhEzeADqycmR2xl02J9VMdoeV+45hYHfFSMRE1FgVVWrCgyre9M6G1Lwpk4il0FCBwXkSfyY1INMnEeWx+uNcmbcCJEVNnsitpp3L0qzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puOeo/eiClTGQ4ctZQjqEss/sO3DV6VY0JooSaGWNU8=;
 b=ArimVgF2JGpVxdk5QQ9AdShSVafFmppzE3jQRPocqdcLJ7iTL7z2DJZl+Avt2xnPr4zdYIyqSbFaP+tP25O4faoP6GmfOeDZsAUBgafQjm+jy0CcLG0Vk/5PVh2UD/X59q064TnhQ6zupjzicd1LMAZMxcUtKkd8G8089c9gLMo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10875.jpnprd01.prod.outlook.com (2603:1096:400:26f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 06:43:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 06:43:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: RE: [PATCH] reset: rzg2l-usbphy-ctrl: Correct reset status check
Thread-Topic: [PATCH] reset: rzg2l-usbphy-ctrl: Correct reset status check
Thread-Index: AQHbjG+036o9v54XZEKlBIYrBvmKv7Nihvvw
Date: Tue, 4 Mar 2025 06:43:00 +0000
Message-ID:
 <TY3PR01MB11346BEF0C5C45C9EC6B3D3B586C82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250303190841.179890-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250303190841.179890-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10875:EE_
x-ms-office365-filtering-correlation-id: 6a985f58-6f86-4878-45ff-08dd5ae7ce97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PxVC+sxY2eSBmsBqmKDsdV0C6TEI43KTtRwxYRVEQ6QKkfL5KbPOYEAW9uuT?=
 =?us-ascii?Q?5+j0hR9iBO0kQE54DsqBzwOwrwDEMzw1me7EwedNAANkQWsu+rvH1O1w7FGa?=
 =?us-ascii?Q?NAiEFJKgaq5q85n5C7N1+c031lFm0MEFblldL/J4TaRcxblQvdFIrInrDoSi?=
 =?us-ascii?Q?v3JFF0oC5aN+Z8oik86C7BbHxm6pBiXu0CBLZ4a+I/OlgPw/llDmMc4hA5U/?=
 =?us-ascii?Q?FH+tmcwNeZOMUFC9FL4GYq3yhl5G9NB1kOUXQE7IwOm+Bez+FfEap5I2FulB?=
 =?us-ascii?Q?ho7KR8q2YrMI7N+O358j/YzFLKgCklitOOYELtzeMyAsXSd4nEOVNXPwxX/y?=
 =?us-ascii?Q?jJ61rK/hVXhXq2JPCZ2O6IVq6VliHkZxw5d2DIiUzK8CmET2XWSeXCPnIPyG?=
 =?us-ascii?Q?QTysYTIb1sUv3AyNQ9j4193kW33gZZS+IjraAEPvYpD8eCn5lWK8eIEM1ECe?=
 =?us-ascii?Q?5EpOtqHUgM83N9EwmjOitJb0tC+Vd+Up5emABPmPeeQd6hRH/W+MX2wXsASB?=
 =?us-ascii?Q?70Hp9VnzE81ILudPl7wbg9LMKfioObQr7n5srjGmfr03hcQy3Lqpg4Z5NJTd?=
 =?us-ascii?Q?jOPmroEbStkF+ap80M0PVD/qOdjJfmmTuIIDhsNTgMDiXPHjIE+oC5HpEJNQ?=
 =?us-ascii?Q?hOf5z9H51lPNtmKCv5bbinYjCtnrjSVL/XWHERSCWJQblsq2exetGV30c2pX?=
 =?us-ascii?Q?1FAf5gN5ld/weWwYj+rUphs5oVFCC7NRksjQgOHDl33C4MkZc6H/a5BaslQ7?=
 =?us-ascii?Q?9SJPC1BRBwQZppHixj426PS1fjrMWXB2onYL+exnE29HZwFRS4ElujrUT49N?=
 =?us-ascii?Q?QFDmYj1lTII/BMwE+LBEsdxl8sljfJHom2ZoFnusZazkn7D/GotOQdklYvb6?=
 =?us-ascii?Q?F44iKCzxTLzAyKs8/5uar6EcdEFJFJ5Yfn9la/ybP2B40frl6Cg058Qm7Vyk?=
 =?us-ascii?Q?oXrBi+UgFRcmOqOBK1+Fpl5B7fZ+dcM6n1rDX2qjzQMwcZ6drEfvGnT34pXq?=
 =?us-ascii?Q?lbhtWh/ROQ0hrvR4MbN5NPC5dtsCkLp+r1g5vSyoBteEsburOkjzG0cVpH3c?=
 =?us-ascii?Q?nExtYia1zaDGtBN2KX2u+5f45rOQ5ESpO7/FaG+v7fg9jfvgVhwrqe9AHDea?=
 =?us-ascii?Q?UwF6JUU4AAl06K6nkJHpX5zxhhHW55ub3+nPXD/dnLw+P+7pT83Mx1fKiQWe?=
 =?us-ascii?Q?hQgH8pMjhMfHaLigdSeOUVYMefVjOAxGaB7Jldn4FJqX7phhc/pI97qqy1XR?=
 =?us-ascii?Q?9SEFsuvosWhVEqURk0x7MhNoTz7D2Ro4JFMTOTwFzLjKCWHNqrwHuCqFYHJH?=
 =?us-ascii?Q?+7zP5Y3aa0Kw5gKm8qkS9w56PmiRZoSTUY1bdMIMsW8zhaNRlo5JyCnlVob2?=
 =?us-ascii?Q?LaAkyH3GhX4HCj9rhOBs2rXLExrt7yAGU267Tob3LPfL/vUdDt6Mb0EshMg/?=
 =?us-ascii?Q?IBaW3wM3ZL0rU2qcWUsspG+QdslNDUuA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eacBpU+I8g+gOxVZB0tR9h4LSxLA+bYtIl1zGk65gxIi6OJnAsji1m+2ZfuI?=
 =?us-ascii?Q?/ZpBWYAoA9m7k/gbFP2cUqUOo9hd+z2czrbAZI7pfGrAX1agHLeSzT+fHmct?=
 =?us-ascii?Q?7gXFeRKOEqoKHwWjH35jkrgpqD/j+VPwvmfI/P/UVrY5j+CUB4/Y6NxXQ0fh?=
 =?us-ascii?Q?2OPxUnhIe4C8tVKsXLvZK4e1kpX/HovW0mc2onOJrr2tu3Jclh6yB/yiJX6v?=
 =?us-ascii?Q?z7uOdMd/mph7pc+RWgbCiuJBLEPCdiyo5Yoz7/wfLzYkgSG2/xQggX6PyUWV?=
 =?us-ascii?Q?oaxvax/WKSZshpB+7GuW05jYCKyWxRmcnoFjcOli+CrQmM3mtmIS2g/cJAoH?=
 =?us-ascii?Q?u+t0w+7hWfrLaVrAeuRCTk6SaeBAMK72CufBDh8hTybZlQMUf5It2/AKS++w?=
 =?us-ascii?Q?AYwaDAJduEZlMBsQYRBRiCWuWjpJScTtJPUoWgtOZHSnAGwgGlqh1Ats8vec?=
 =?us-ascii?Q?Pj9kUCc4ixqDPhlsrDotLMretsr1E1aEEswfyH+jk6/V3kIe4b0+2+OAm/Rt?=
 =?us-ascii?Q?K6YEf90x8CZWV6NDqBVuM0+0y2CwJYVErJAww5EeLbXS4lp+t5EQkKbyt6fL?=
 =?us-ascii?Q?Tz4vLDs7vdSud9CGd/4jhUT2VNE8/Zp5QQH0/R3CiBm6n5jVrFGpiYkOE+An?=
 =?us-ascii?Q?XuPtIEdfm65n1WKYvmQ75+kzs+m0ttiYqON5Qo/uZQ69kl7l6Pxhg1EOcCdK?=
 =?us-ascii?Q?/S5B/iuXmu1ej7cFCqoTJDu/6rlmlXaNDuufptVzbpZBy5NXTb/uW/vr+6eb?=
 =?us-ascii?Q?lI2jmbNd3bbDY3dh1a3VxvGOoIXOB16/CbDEZiLh5RpznAiAGMWROwvI7FU7?=
 =?us-ascii?Q?MGsotgcZLQgXQb77f5uFHwt2OcNNBiE7uHYvENYpkd6yn0fotHXbvz23QY/p?=
 =?us-ascii?Q?SRA0nc5AKoIyQBMjGeDgLBfnL3EqWet8NwKdwzDO+VcpU2xUmaE+Y93QMNad?=
 =?us-ascii?Q?QffhGLo/3fST79oYyxSOrCjsOPMvvl1OPC6yrMCQ8I6pt+gjdsgtWl3kbTmx?=
 =?us-ascii?Q?0IZGNVa+1U/dU5/1N25SMcrMxeiIzRJowBjGBu3av4kOq9EOxkrlVbEh8LMv?=
 =?us-ascii?Q?bviSuFw2RycJaSMZIfpnx9H2TgXtQMezYWZhaXy6R+JdeZNTGrwI2HD3u7My?=
 =?us-ascii?Q?KR2uNvivtyU4UoA3Vn5ArLUahHGyvfnPThOz8R3KQpv8tw7az6P7MbSx5pig?=
 =?us-ascii?Q?oCAlVDf0ArYKlfk+qaGe5Mf7q+5YLNHUwHD7nuNjL94OOtgIuMNyZ9csbERC?=
 =?us-ascii?Q?uBbJtmG8y3pFQtUl5fJYOxD44DYa0aqsmsmg69NapW7fItCTTqn8WGnB2Akx?=
 =?us-ascii?Q?ELJQ1OCBt51yET4zJx0OvEX0mR+sEbGhBR5MpwReYOGBkvf21gwqeGFmfwZj?=
 =?us-ascii?Q?e7WJPzPMpKjniiwmL790QXRaH7nKoThSMwr+WyKuLuqM9Oo31bqAPUudpc1l?=
 =?us-ascii?Q?UTwbnpVRODrRt4wW9VTPSwZGYtCbJRS0pHzAeZByaZRP2HfynLgAkU8RlPL5?=
 =?us-ascii?Q?QxRPiJErD0qDuHABRlo5yIWfafnPHyYRTE1liGjs99vPfY4mfP4bASY7FaVk?=
 =?us-ascii?Q?w+j+qrRpxE472eCUY2I4M+SZX4g7O/2pP8nkHXq5AGM9+TrQun17UTK1Amal?=
 =?us-ascii?Q?rw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a985f58-6f86-4878-45ff-08dd5ae7ce97
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 06:43:00.6151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CuarJyPG35nTuUA/IWXZ5sRR7knlhXzdrA7eSzqFhG5IQmiuyTunx0yPwaYt7R5ZrAUNMH7mzuOgQRJo7LwUN9cCsNkYLGscfvD0Yj34P5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10875

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 03 March 2025 19:09
> Subject: [PATCH] reset: rzg2l-usbphy-ctrl: Correct reset status check
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Ensure the reset status check explicitly evaluates whether all bits in `p=
ort_mask` are set. Replace
> the double negation (`!!`) with an equality check to prevent incorrect in=
terpretation of partial bit
> matches as an asserted reset.
>=20
> Fixes: bee08559701f ("reset: renesas: Add RZ/G2L usbphy control driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/rese=
t-rzg2l-usbphy-ctrl.c
> index 8a7f167e405e..6451f621e862 100644
> --- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> @@ -88,7 +88,7 @@ static int rzg2l_usbphy_ctrl_status(struct reset_contro=
ller_dev *rcdev,
>=20
>  	port_mask =3D id ? PHY_RESET_PORT2 : PHY_RESET_PORT1;
>=20
> -	return !!(readl(priv->base + RESET) & port_mask);
> +	return (readl(priv->base + RESET) & port_mask) =3D=3D port_mask;


As per the hardware manual, these status bit is valid only when
Only when sel_pxreset=3D1.

If sel_pxreset=3D0, we are reporting invalid status to the caller.

Maybe we should check sel_pxreset while setting it and read it back to
Ensure that it is set to 1 and in this function just check for
phyrst_x bit for reporting status

Cheers,
Biju

>  }
>=20
>  static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] =3D {
> --
> 2.43.0


