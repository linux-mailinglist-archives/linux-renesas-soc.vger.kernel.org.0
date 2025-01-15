Return-Path: <linux-renesas-soc+bounces-12177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CEED1A129A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 18:20:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B8197A2E5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 17:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4140F1AAA22;
	Wed, 15 Jan 2025 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Yl6l/RIK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010036.outbound.protection.outlook.com [52.101.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E2378289;
	Wed, 15 Jan 2025 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961604; cv=fail; b=u2kgQ+pKN7RO1fltIzorT+21sG9z0j9x6iHoHWkHshqUcHqjeJtB8OwYeHpBWrkwIw1imuHZq4ghVTzJe+vx7Y8lQgHt0yFM/JXNLQgkqXRoONa2gbYUPopaA+ORJinoOcHGJOGai3b9pHA3XlY1BahoqsDaoFEhYAyEwerO27U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961604; c=relaxed/simple;
	bh=+NnvzPDGKZz/GBXfq1hM+uGc9KXKW8RxPULMOUvDGFY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Rh7h3ixEBWbpnFgSKSVYt7hFUchSbvl/1OFbGh8EQPSsKHllVquOOxLo72uvnroSsA78ZDkDFfNhCk1erOYc+n99azDZJF7hg5U/Ru+pNiNLpLoOpAjl2MFR956Cv6cpX9DNJFOWRC8Vwv/ShygO0o3HVpUWl4KtDbDNpKTjzbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Yl6l/RIK; arc=fail smtp.client-ip=52.101.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KxUh1+OOEI1PMSsBZtV3+lu+JhlBohcpgxz7cwLk4b3Z1Uel9mklEIPlHKVzkj4R3wurp9rvEJ/OVBWmXXqANMIZVSFFANNvDcnsaXRaOAjknTzdpQ++RpZTa7oyV5ISJlk6ZGOdJazNfji4xZqTfpipj0sgqbtZy6oDiCEHLYVz2wYn21m5AnUG94LG48PcY+r6mL83gKz/57TJVfhepBR1bWKycz0zY4D8znYs4yEXNihfE1/713bXOETJnaTLSFIfDPS792jmgw0hcIpIdmSXNBZgL+YXonoqLc2S2hsGcOtRAgvQ6RmMd7WxYRu5OHCxleswytTKPigT+OieFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EV5GIFZpKL6NIUemTw+Z4LvhWHeauVH9oMfDZ4uohuA=;
 b=FoB/onGVFJu1ctGUUsbRAdtdBCZBYDlTXNAja6H6LyejYKiUfmOUY/LExBqxlsip0pY1CFqE8Eo7Uwb6Up5+eDhqbOgjo4NwqiiOQKVs6sor86TKQtmKr1/31d1WZbu8ZOhFpakPeH6da0P1U7QMwbMNUyAq4kH8Rx4NRy91UQsnvqJvcqGfeef3NdpTvpp10v6WP7P0w1znQOpDZqibV9q0frJmlGaZzt5BERkVvEL41FYLp083+KyduS2PtxVinBvDtnBW2Ywt58HXDKizttpQvd0UyKt658fFMEOR4q0WlJVbTD9E0YU3FwlAqT7RMUBtZDXRHYgpCy03Y+/BTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EV5GIFZpKL6NIUemTw+Z4LvhWHeauVH9oMfDZ4uohuA=;
 b=Yl6l/RIKuMdIuiNIM1RqCxeUq5yVY0miLdoRrmjbmQRGq7gi/6rF3r3trhrdQOJrCu18dAPuPlgysU9BGJtuzDPxbLsFHPABIzP7xOXVb0xL13Uhp/MVTH03D5DrPm9l/1FSruLihEnJLdiGBjd1UHCh62xsTXg7LAcCmdhg/Sk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12451.jpnprd01.prod.outlook.com (2603:1096:405:f6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 17:19:58 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 17:19:58 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 5/5] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 watchdog
Thread-Topic: [PATCH 5/5] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 watchdog
Thread-Index: AQHbZznEg3Bhn8J+P02Vnz0tNQ9AzLMYFHIw
Date: Wed, 15 Jan 2025 17:19:58 +0000
Message-ID:
 <TY3PR01MB1134612C1DF4639F12D829FF386192@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com>
 <20250115103858.104709-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250115103858.104709-6-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12451:EE_
x-ms-office365-filtering-correlation-id: 468c9638-4a5e-42e8-5e67-08dd3588d67d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/QnPaHXM3WmzrPjwdojRVNBeulC3tX5RayxdZofCrtjl/qbF4y0WWVdn5BdL?=
 =?us-ascii?Q?t/jgfNX4sTaeYKkppGjmxe1QqPMu5G3GBRfvW2Uh/sJP3CMqELznlQWc82Oi?=
 =?us-ascii?Q?B0eN5ueFUapQWWC/F+j6wCv4xsmNjVIjVv5hnwHrTP5Fge6KCmbPYSVxeZTS?=
 =?us-ascii?Q?HhjvVn4LFfiWZKzUEIUyap5hF0Ru/Mh7tdytYqAGNe0NjRLWe2e3PM2nENrW?=
 =?us-ascii?Q?pHMWTaMERRmfEaOcxymQ+3VUWWuwm0DGzSOwbJPafYvTjWTr8YaknUYqR00A?=
 =?us-ascii?Q?qP++LKony1S/kn3FC12zDrix677KWaALKKN4HA6BG/X1IpxD8D8lv46spP5q?=
 =?us-ascii?Q?A2CprE5lb9SwqJssB6MiCVj8V1I9Oi3JXcpu4J0j1g9Shol9E/iNBA0sGwD4?=
 =?us-ascii?Q?iAMqzSD+B496ff0MUL4t13C0EE7zu5pEqUm0XnijpHewLQ9lOG+I4N5Ulpe7?=
 =?us-ascii?Q?CzQVqVwhlTPVoigKTrwgOOR+e2hCbwMrsEbrDrtekMDWzECaNDvcZD8J3sCN?=
 =?us-ascii?Q?RIUn/pA8WQG2U24jkFIQqHsKhvfw54HGxKHIR3YoeOMHxfq/g/rU8qo6a3SI?=
 =?us-ascii?Q?94n+6HoaX1QneNA9NvAZ6ug2R+jw9bHzPQhOFrTgTkx8+m6QsnTguBQlijrO?=
 =?us-ascii?Q?9fA+chvVaehMF+41PJ6G4rGJR6biiDsLuU/7P6rtVCh2PuwGMo02hM4ynjIW?=
 =?us-ascii?Q?bZ4031c7zSEVkbs5hf16ImMeVgZ6YUa+M6Ed0ajoTECOS50LJO9TJjBELT0Q?=
 =?us-ascii?Q?RXYrraoCZiI2kQ/i9SFpWnE96EDhvf3I9waNP6wUACnQ+y7dl8DfuBmGJ/NN?=
 =?us-ascii?Q?nw9n1zI3AV+DrkzZ6PVcGx0GHCxNtEm9zJ9pamCXOO7aENvL/B4aMRYKQJqH?=
 =?us-ascii?Q?TT89ZjKR/NF+LDH1K9SxP89MNe7GMmjYpZbdlO8XSLrrUvtlx3q1sCrWKhRz?=
 =?us-ascii?Q?kLr+jn8kKQjOQbj+f9zLNFQQ+tFl2+qTu4th0yY8b8Kmxl/0hGi1Qqc34afE?=
 =?us-ascii?Q?mHWjV3x4auDdQqqIf24/ebZPrICYIXnYCoUJ3p0g2shUuPq4pLcEUlyxR6zA?=
 =?us-ascii?Q?H7+Z5KLZh5tc/0DQaalWgMRCS4tCgP+ElBeYl6u1e1vAi/u8D1bHElfD4W5O?=
 =?us-ascii?Q?I1rSsZBVizmbfb85wyQp80+aDOBh+khTZxZa5e6oesj2/xA4jQ7JPweVQblN?=
 =?us-ascii?Q?YY+EQsZMDXlKFjkRcQtjLqxIXbTGuVRESM8hnecsgN5MgeWjdDKOWzSMUMsi?=
 =?us-ascii?Q?a5hSmpxZf7Fss5E3YMYGqwjN0tW7hk6w5JoJyhctR2FWbJlFZDrzCDI1eRQW?=
 =?us-ascii?Q?p7//enfKgmrN8BxUF2i6LDMtb10Zu1BygDqn/jKury5ckjfUk/+W4s8wig+Y?=
 =?us-ascii?Q?/R9k3iznfMzlbtso6IkIkmRqt1bnwb44LbO1u7eHvmUXaYs7sFwio6DCeUnn?=
 =?us-ascii?Q?scGGdv517oZkSx03R070DU1Rm4dpibPW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?60WcAjkptU5E6j5NxBn3nFrwTNbnRKg5tmrIBxUAbMNBbV3cct4v8ljW+Tsf?=
 =?us-ascii?Q?w49Dm78egYBnqDqPni9BpYOxI3q3Trc9jscITG7MrcCaLX6pnlL6a8y3mps2?=
 =?us-ascii?Q?yaT/CBN3VWMa2jUWitkCDZeSQ3R3r72XJZIlnSDQHjiKREH9fA38LLgGm8mf?=
 =?us-ascii?Q?QddjTc8na9cV2AuanP3MNi1ZAMcYGej63GT/ZGTBRG4vfGd+lD/MT7Nj6KgB?=
 =?us-ascii?Q?1VXdj4T6mbmNc/JounHNFDT4oDcxCKDpUSeHdWi+uT/ACGEClx08h6bWZ93f?=
 =?us-ascii?Q?kuJHr1ZofYvECEwnnoCIH6juG5suiTiIxRPxiryNS5vZF1524M8drs8SJwlD?=
 =?us-ascii?Q?q2nJiPdLhE09IRUAm24cgCAy1od0wg0shp4dOJnxsI8enAy68tEjX92xtr8v?=
 =?us-ascii?Q?mrr0Y3lONWvuv4IljHI90v9mYK5yoqhF/pGuYtwWMIiiHku+F83TF2yNBCNF?=
 =?us-ascii?Q?dJUC6EhGY9Dj3gvQHHryavnqorwm76MrQDqe4j4QorD7dIaZhqq6m0cJRBy0?=
 =?us-ascii?Q?ka7bdESOsb4cAPq3WmL4QDhSH0mqyjfhZwhaIwuG29z31lcaxpWsfNsEb7O6?=
 =?us-ascii?Q?3cNHsEmpY9BIioY+EYIfj2RW1bRKSLbJTS1YBFgaX3vIAAPEkruOVP1hlu3X?=
 =?us-ascii?Q?RTNLO4B7X/I2k5tHPIvBN0lV25xw2VluNj0ZajZ5oAb4mqdJ/IXAdaPDHiQL?=
 =?us-ascii?Q?5zSL971UiVTp45Kw/AiWNnUUrKyADPMC2wdBzdmKV/s5brj2j5OQopVk3e6U?=
 =?us-ascii?Q?JxpuiyKMYP7KILDrgtpmqiZNwfJZ8oqkkW+6EbFw4Hs+q0KurTVQ4j7Fp+CW?=
 =?us-ascii?Q?cJuMbZ1NOL1JGNHciUddU3Cck/2AjhwxwckQSAD4skso6+SxH9dK2amSAHs+?=
 =?us-ascii?Q?BkuYxgv5bA157vRVu1mpgR14YEHJfIwjqR3loRTFQ+L2DhvwOQkoUpg1bqGX?=
 =?us-ascii?Q?115jks9mkzE3K5MAIaltTOeccIWEBsOCKkNb4OJ2i/n5eED9MoYPlhxvxX/C?=
 =?us-ascii?Q?fsnPb8DWe8AOh65dcP+RhfWRe0keuTkcnpWE6mYUw2ZAR6Nb7a05JxUej1jR?=
 =?us-ascii?Q?/Fc/jUOMG2lOjP8dfxjWud07z18hghN4djoV60qp2spwPHOka5NUTX1vmZQ4?=
 =?us-ascii?Q?cvr+RCJ+Z+Zhn/s+25gwL4bAnwdWQ5N0ajlw0MlO0z11I+2RcBDu2FtRilJf?=
 =?us-ascii?Q?ZeaZW6Ob8euVXLuwnmCM/DAJjKAmA71eLbffqu+WkFHdF6Fnh7l9LbJ9SaMN?=
 =?us-ascii?Q?I3XSCYYgbidW9ZEhufJyQSYcRegf7V4l8ox3jenLd0MjQmrSYSeAz70dF9nT?=
 =?us-ascii?Q?cPH4IrgXmtkBDmwisLsfhsAgUtgR++OcQcztkLcTUxZE1mFa6yaCsrmFlzRk?=
 =?us-ascii?Q?N3zL7r0Iy8EaBFlPgYpPJTTNsM2iZXe2TV1XPlw4WL4qynOKd59P/Paur0wo?=
 =?us-ascii?Q?3FAOBt+BHJi9OAjY8p3/gjqvBKsfdjXYoieBq/gfK5gGZ+Vh9HsNAqSCS65O?=
 =?us-ascii?Q?1OpHVeptkKKjdUdgLql2iv8faQRgYgH+1MwCUHrT6L8AJkAwQpzIResO/WF6?=
 =?us-ascii?Q?PW1j1/1kfcaNSu/Zbu7ow+jRlIDK5ecyCwzobhGr+8puxJvEXsQrFS9Z+Zz6?=
 =?us-ascii?Q?kg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 468c9638-4a5e-42e8-5e67-08dd3588d67d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 17:19:58.6520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pIYi1w3o5a+6Ul/UTtW5LUXkV2LY8UyoXjKz7zzYLKQveUYfUGRnhz8b5HMZF18lWPH8YJItRaannMsxEjHvs3HjJkxnUAqaZPxcCD7jvvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12451

Hi All,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 15 January 2025 10:39
> Subject: [PATCH 5/5] arm64: dts: renesas: r9a09g047e57-smarc: Enable watc=
hdog
>=20
> Enable WDT1 watchdog on RZ/G3E SMARC EVK platform.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> index c063d47e2952..33b036b6a93c 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -29,3 +29,7 @@ &scif0 {
>  	pinctrl-0 =3D <&scif_pins>;
>  	pinctrl-names =3D "default";
>  };
> +
> +&wdt1 {
> +	status =3D "okay";
> +};

I will move this node to SoM dtsi on the next version, to have consistency =
with
other Renesas RZ/G2L SoM modules.

Cheers,
Biju

