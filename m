Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD19320DB3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Feb 2021 21:48:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230174AbhBUUsk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Feb 2021 15:48:40 -0500
Received: from mail-eopbgr1410133.outbound.protection.outlook.com ([40.107.141.133]:34544
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229830AbhBUUsi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Feb 2021 15:48:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ly9yMUOMAEwZ20o9+o0lDhm5M+JIo/JefsXsu96vSVnKMhH4R2URxFkxQMkUilSV6HDemLzekTzVOsccuioig6AIQzpX1a/Yfjs+bHugZUxMCeQTXGZ5uZWMeHPDi8T9OwVLFsvx1MnplcTOF7USlBtB+v/UMAhFMhgMt847/23oTGvlc+qck7TodUYsgEC4Gtc0LYMsVR8FlKihrSiV5FdHwi28dlACtRETHBpmN5lgC48S3APj7vvp+zRent6TyXYf8lSrP/4Ywlsz1ZsQ4gJtBXXsrr4r0BIIxnwhXw4ltats59V/SLG61zc0em1b6M/EWagtjKYWNhGjfyTUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UITUYWcPDwCEmWI27eq2d84ZKUPNf2oMd1WcNpEq2B4=;
 b=H8coik71zynjL29Fu6WrNZmw+6/0ANfmTxgDQOppyqPDel7KoNMKlMheLhcPHz7w9i0qtkDdIoAbFKfHf2NjvL0gc8CqP8Yw019/1F/h5J55bZXnlIKsvwynEMhZrpjiSmAfk/38kPHjcCBCdSruj+y1h32JfVmxn0o1N6bn1D0jtmCXvPekl8QR5fEc9M50v4h42tAJHCCJQS4wLIQ8oPeXCU0AtLziZ64aSzv/fsitC1tnRTKIuID0jxGWY808LcebYHqXeuhrWwtFMbDVu/JB0JJByhnvi5LxCEzK7Q2Saenup4cfmeBdoHrKlDMIIHSbSTP1SpYryp1VRq360Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UITUYWcPDwCEmWI27eq2d84ZKUPNf2oMd1WcNpEq2B4=;
 b=U6rJtTiDlaFE31VHZWIrEHA+I12ppcK3f1JRrH05rE3CsxGUyTAWAtHP8ryedt30d+OXKPyDvri3RfIkI0NvHZnz/gRAlzZuGcbbJFwHScA1F+q5NvTmFkhdRmjliuhsTp55YD1ulkQVfUzzSYtsvpgFUUVyAeHc2WmKqFdhNRA=
Received: from OSAPR01MB4867.jpnprd01.prod.outlook.com (2603:1096:604:6f::14)
 by OSAPR01MB3969.jpnprd01.prod.outlook.com (2603:1096:604:5e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.31; Sun, 21 Feb
 2021 20:47:40 +0000
Received: from OSAPR01MB4867.jpnprd01.prod.outlook.com
 ([fe80::24cf:baf6:7ab1:2ede]) by OSAPR01MB4867.jpnprd01.prod.outlook.com
 ([fe80::24cf:baf6:7ab1:2ede%4]) with mapi id 15.20.3868.032; Sun, 21 Feb 2021
 20:47:40 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v5 2/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support
 for 8-bit ov7725 sensors
Thread-Topic: [PATCH v5 2/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support
 for 8-bit ov7725 sensors
Thread-Index: AQHW8LKRzj2B3kS6PEaGmkq+PdpshKpjQ9oQ
Date:   Sun, 21 Feb 2021 20:47:40 +0000
Message-ID: <OSAPR01MB48671C18C35B6F52EBA37FD2AA829@OSAPR01MB4867.jpnprd01.prod.outlook.com>
References: <20210122113424.2833127-1-geert+renesas@glider.be>
 <20210122113424.2833127-3-geert+renesas@glider.be>
In-Reply-To: <20210122113424.2833127-3-geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7f86390a-7a8b-4c10-4685-08d8d6a9ee4c
x-ms-traffictypediagnostic: OSAPR01MB3969:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB396942637B73938116CD5B79AA829@OSAPR01MB3969.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 519295+TqMiWqIeQ/sJ8c56+7MUnOtkCUcfNH6oljpE0H4/U55NABVn3YfQuSa7iQRi1Ot0Xf+lv45GKhzA202c/xn8VgcoupFmYV5f8TIPX7xaKXW+ucQyFYYgisySVzjntiGVrYGDu8nQQLdahHXtdp12iE5SOPFCQURqMBnoGyvBvnl+F5N7S7Kq/Z0pcWTXyimBzDAgbn2ZhFnmGwB29NfoZWVYdGF9bZzp/ng3fXXaAsUZ24rmKsK8rcX3KC1fTvZa84uQJM7uMDVLEvqzc7Psr+J/yzpLp4tWCA/SHxfLuB/j5+xrOTObqzQPtdPHVdGf8Oa+7gIXmJFhdFPVfXdYLWqoUH3ci7+S0Iz/jHlSVnCNhCyOxeecIggT2gvhnux5V7HksL8SvqVvh41Vk9Dtg/EL9jP0Qj34eZziV7rvFuhmqqZocxixwMHSnm5QtRh6Aq3fl3bthoFJc5V5hc5FN9ki59k6nMjfKXOYbiH5+V9DsL0239LAvsqcY9hAL2pPWKOeo83VjaAIaFTbpPvbsFjzXY6/7tBcga/Efg6BVHdC2gYAP3nW2haZa1SI6us+Z3+EPDVk9R1kEIQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB4867.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(66476007)(64756008)(316002)(66446008)(66556008)(76116006)(83380400001)(66946007)(71200400001)(5660300002)(52536014)(6506007)(2906002)(26005)(4326008)(9686003)(33656002)(7696005)(110136005)(54906003)(8936002)(53546011)(55016002)(478600001)(86362001)(186003)(8676002)(473944003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?iqzB19O/xRzoRGkmcfFvwUP93vcs6nxIUsPqpLuZqY2P5gA+MoKjXCD/oAU8?=
 =?us-ascii?Q?GZzpniXHgVvJ+U58QcdUPPaNbi218h342RrYJJn/AnaQ48BjVMkRHqadiweA?=
 =?us-ascii?Q?IelB9r5D0gzZ1AvJ2n4x8a7VNnKqYV69if6SdH6MbWQihkXGyXmQdsO0lZ/J?=
 =?us-ascii?Q?qkCwj2JWYzmwRBb5rODlV2Y6nnW9c/yHcphVZIt2LGDTDM965tUtFPYU2Ffd?=
 =?us-ascii?Q?SDBPOOPUczrEu7a0HaU+1bSeEZI/1zCLMLVwHoN6RL2BdBEJEZ+KjoW/Gkag?=
 =?us-ascii?Q?qySZGBja8wV+QZJMbrqdr+cL1gK2LkUEz8ICOaRfJiu5IKlHgOcYgEcSn3Gh?=
 =?us-ascii?Q?kA6OiDiWf2nQZbMPU+LeKFWs8jSZ6mOiQQKRZ9PaHrmXuI4ZchcZonQTIJxk?=
 =?us-ascii?Q?qwjydmTq94d1GZ1T+J43IPI1kxyAve4yILqWEKDNjuTienz6QlS75gXkUT3P?=
 =?us-ascii?Q?5naaxOI1pDfsf7fyUP97Ob8tEXIyhNw8yEbM5zKGbZut8Zm1oWUd9oG+gPbA?=
 =?us-ascii?Q?FmAeWw3Fu32ILxOeeF57vnYqiFdaqrAG5ck1cUsBKoVLiCSArKZwpfI/u/d+?=
 =?us-ascii?Q?H/KcrxP6n5XHSVbq2dxXKjNCXcaC7tlcE0AS5Hl93v5ok9KXAo8DOuvToYVJ?=
 =?us-ascii?Q?mQu7kfoXz6HzJ1R1xqzlySzxYrSKMpyHnpToqYEXsNhOlzH5SzKyVfhWSv1p?=
 =?us-ascii?Q?BVnFqLobUWmsBO2SG+Memll8IgJtJFDNUXV3a2pSU+qkonB5DQgyVn2ubSIW?=
 =?us-ascii?Q?8gx4pAcoArR/divqwqOp1QKg+ZoZ9VJXgIBY69+RpblChfhOOvjCxf7YafNN?=
 =?us-ascii?Q?NKRMKNnikZBf+8hfipxohXlVfSsgCmkl/z+qde8aOW2n71TzbgwZnQH91sa8?=
 =?us-ascii?Q?SeOF5eBcEzoOHChDPE5CwYWMPgJW6wMisvLI7BxpWHLFsg1PZusWHLgwRiJ7?=
 =?us-ascii?Q?3fFqGTGS5QRFIrP9Jq3z9UNnbUGDnGP0fv+kP73/J5sR20nATCodsUIFuyUD?=
 =?us-ascii?Q?wCInt/+A9iGLKR2LUxxZt1tMeiB74iTNKAQv8vSrkquJOEMyiaZCUOqa7aHp?=
 =?us-ascii?Q?RzoLqm7u21i7xV3CwB1w7HaY2wjvzn9t8B46dkdQrwkFKa3lJ3w/b+pFDSHf?=
 =?us-ascii?Q?BgAW1euX7+Wr+P9YzPyuEf1zZtoIxHkIYv5DCIv//DjNlLHy9FCW8YDyB0oK?=
 =?us-ascii?Q?ri4VyIgBHslxr5houMw/zDmPVk7gJZINy39t9m6O+DF2hIwF8oPy8L0OTW0P?=
 =?us-ascii?Q?nYCZfx1Npxbb8dpEpyYTSDQ04z2gWQVpkjUcu1dvRQ8Tg/ry0NW0CN5xAAs6?=
 =?us-ascii?Q?yjRAqDUFrU+zvoSEKqAAYr6m?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB4867.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f86390a-7a8b-4c10-4685-08d8d6a9ee4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2021 20:47:40.7818
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XZuwr4Bl1Ds68FzAG1dPe0vH6OuPt3Yu2MDPyWyAni1hYTRbzk3b5Pu/+6CO9dGN7F1SnhKBIyu5sP7NUb9YHod7vilUJZBlFGt2FVvJmV58Bp39Pw4XMbyGh+JO0itX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3969
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 22 January 2021 11:34
> To: Prabhakar <prabhakar.csengg@gmail.com>; Magnus Damm <magnus.damm@gmai=
l.com>; Rob Herring
> <robh+dt@kernel.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Jacopo Mondi <jacopo@jmondi.or=
g>; linux-renesas-
> soc@vger.kernel.org; linux-arm-kernel@lists.infradead.org; devicetree@vge=
r.kernel.org; Prabhakar
> Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Geert Uytterhoeven=
 <geert+renesas@glider.be>
> Subject: [PATCH v5 2/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support =
for 8-bit ov7725 sensors
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The 8-bit ov7725 sensors can also be connected to the camera daughter
> board.
>=20
> This patch creates a separate dtsi file to describe an ov7725 sensor,
> and includes it multiple times in r8a7742-iwg21d-q7-dbcm-ca.dts. The
> user can (un)comment #include statements depending on the cameras
> connected.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> [geert: describe a single camera in the .dtsi, include multiple times]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - Enable parent i2c bus when needed,
>=20
> v4:
>   - Describe a single camera in the .dtsi file,
>   - Include the .dtsi multiple times.
> ---
>  .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |  6 +++-
>  .../r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi | 29 +++++++++++++++++++
>  2 files changed, 34 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-singl=
e.dtsi
>=20

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/b=
oot/dts/r8a7742-iwg21d-q7-
> dbcm-ca.dts
> index bc8280b2ac47e3ec..2bcb229844abc5c2 100644
> --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> @@ -198,7 +198,7 @@ &scifb1 {
>  /*
>   * Below configuration ties VINx endpoints to ov5640/ov7725 camera endpo=
ints
>   *
> - * Uncomment the #include statements to change configuration
> + * (un)comment the #include statements to change configuration
>   */
>=20
>  /* 8bit CMOS Camera 1 (J13) */
> @@ -208,6 +208,7 @@ &scifb1 {
>  #define VIN_EP			vin0ep
>  #undef CAM_ENABLED
>  #include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
> +//#include "r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi"
>=20
>  #ifdef CAM_ENABLED
>  &vin0 {
> @@ -241,6 +242,7 @@ vin0ep: endpoint {
>  #define VIN_EP			vin1ep
>  #undef CAM_ENABLED
>  #include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
> +//#include "r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi"
>=20
>  #ifdef CAM_ENABLED
>  &vin1 {
> @@ -272,6 +274,7 @@ vin1ep: endpoint {
>  #define VIN_EP			vin2ep
>  #undef CAM_ENABLED
>  #include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
> +//#include "r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi"
>=20
>  #ifdef CAM_ENABLED
>  &vin2 {
> @@ -302,6 +305,7 @@ vin2ep: endpoint {
>  #define VIN_EP			vin3ep
>  #undef CAM_ENABLED
>  #include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
> +//#include "r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi"
>=20
>  #ifdef CAM_ENABLED
>  &vin3 {
> diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi =
b/arch/arm/boot/dts/r8a7742-
> iwg21d-q7-dbcm-ov7725-single.dtsi
> new file mode 100644
> index 0000000000000000..f5e77f0242516720
> --- /dev/null
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This include file ties a VIN interface with a single ov7725 sensor on
> + * the iWave-RZ/G1H Qseven board development platform connected with the
> + * camera daughter board.
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +#define CAM_ENABLED	1
> +
> +&CAM_PARENT_I2C {
> +	status =3D "okay";
> +
> +	ov7725@21 {
> +		compatible =3D "ovti,ov7725";
> +		reg =3D <0x21>;
> +		clocks =3D <&MCLK_CAM>;
> +		status =3D "okay";
> +
> +		port {
> +			CAM_EP: endpoint {
> +				bus-width =3D <8>;
> +				bus-type =3D <6>;
> +				remote-endpoint =3D <&VIN_EP>;
> +			};
> +		};
> +	};
> +};
> --
> 2.25.1

