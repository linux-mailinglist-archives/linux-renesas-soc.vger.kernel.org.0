Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0B6B320DAD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Feb 2021 21:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231310AbhBUUol (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Feb 2021 15:44:41 -0500
Received: from mail-eopbgr1400121.outbound.protection.outlook.com ([40.107.140.121]:6065
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231308AbhBUUok (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Feb 2021 15:44:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aAUw44rgS2kf4eeM2rGt2aZu1Rp4NOxAiRIGE7BtSm8hyWlU0sazOHfM5mTDu9rWUICDvLxMpnQQj9nkmjL7EoK0rc1fEdDyPsw8n9zzUyVjhRmfbTOVdn+xzqRYShR/FlsfltoTZlC1C7AW1tHIMgD6JBQWRD2iuhle6kHkxs8VWR/mp4XOrbbCYo2sZrVFK60nQezgoAreWwqVYrsvXkGKLtlGUywAkiXw3/dq2K1zbEFt2j+XQEoJiJ2siFPnSqKZ07+vspdWGaFC8FkukI90dJ/qH6H5b5J+B3UtmKpzR0VTA02zXFFmdJ8YbdBRmCHN9D0lmXBcdgZes6Qf6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P7dovrZ5x6LesvMETuKGvVb5y8L0CT3C5KmHNnt0Rs=;
 b=jcSVd2sXBJWoUnH5hrepcd4WDMuXdm1qVhMV6Fp2YXH2VEW2SJ8sbx89pYeV3dMv7V13W1YADXZAr6U6+JTUhkT6stIftA+qURSqsSgZ9N9gqqoDuq0GEHGW/BSk9mnpUSY5XEQsBzfUg7Sstbo0q5pScNVISi/rsGbFiUzQnGeBW/gIfpNaWh0q4GNC90GWjcKTFrNa/M56Fh7m1UW6AN+NFMjfh/xo//EvdO4WnfXEWSbQmtYYgmblUr+n0ExFv/xex17gmyzUisTOBQr3xMYNBsyctHC/fMk/sF3+2JvhvIptRgDZGS58o1zHJ3v8c+CSrlUhEYnnA1PXRUpwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P7dovrZ5x6LesvMETuKGvVb5y8L0CT3C5KmHNnt0Rs=;
 b=QPyL03iFXbM5d3GH6PG7icss1yAvLqLbeyh1PfRu1lnTW2NUySjD3uwc/jWhO2HS+uEoInso3vp2K+iHEGtHA9Aou0UkfCsNKUsQfziYn2MJC46PgJXPedAgrFXq22YO7ICrv0R6AZPqvxXh7BeR4fSnHs7qTFlZjiMdmZ132sU=
Received: from OSAPR01MB4867.jpnprd01.prod.outlook.com (2603:1096:604:6f::14)
 by OSBPR01MB1573.jpnprd01.prod.outlook.com (2603:1096:603:4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Sun, 21 Feb
 2021 20:43:48 +0000
Received: from OSAPR01MB4867.jpnprd01.prod.outlook.com
 ([fe80::24cf:baf6:7ab1:2ede]) by OSAPR01MB4867.jpnprd01.prod.outlook.com
 ([fe80::24cf:baf6:7ab1:2ede%4]) with mapi id 15.20.3868.032; Sun, 21 Feb 2021
 20:43:48 +0000
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
Subject: RE: [PATCH v5 1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out
 ov5640 nodes
Thread-Topic: [PATCH v5 1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out
 ov5640 nodes
Thread-Index: AQHW8LKOq3fJT+PGb02VvAAmznixVKpjQtLA
Date:   Sun, 21 Feb 2021 20:43:47 +0000
Message-ID: <OSAPR01MB48678C4BB2CB2BAB7DBC9C68AA829@OSAPR01MB4867.jpnprd01.prod.outlook.com>
References: <20210122113424.2833127-1-geert+renesas@glider.be>
 <20210122113424.2833127-2-geert+renesas@glider.be>
In-Reply-To: <20210122113424.2833127-2-geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 44054cd7-9f91-4e02-f999-08d8d6a963a3
x-ms-traffictypediagnostic: OSBPR01MB1573:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB1573FA4C7DDE47DF357DC12DAA829@OSBPR01MB1573.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TnZ8hvI1BcAH+hV6aWqSpntYz4Et9hwo/8axRZ04XG6Rr9fp3GXdvkDaR2A47Q2S7Z1fNubHvNcF+dZa7Pf1evZ+MFwYyyg+2rRW7DkAExB2JW85EJRUN4KPJapcotvgJUWwzbxSn+jprmIgbwyI8j/wo5tmn3DnxGR0uCFHWMHUHWswgt+XHqiw9aXltlgD1z0vTN4svmk+VI84AGsEmIFb72BC0b8jIT6sSCTqirUePl6B/SD5MwiiXxToAlKehlQVnrEw5Xw/4bRX5NP6ur/UdD3j+evhgDPaqNyrhnn5saXNXKEbFKIwQalzJZ7zXDSPnb/vV05+SUu30+MDSYHl03soK6sGPPPXrJKEMjDcsCi5bGQDkGU95RPuHfiKlHTqJOL61Imrj1Vt8aBhY44BSLnE92OYcQHCank+PMiY/zIWk0YRtndwUJ2puHevxuGKUtw5AQY7x34BRV1cvMdC3WtghGDmNAr5QvSXMbgN4TcznaRpWEkrHu08hvEXJu+xQl/L8/1xMXfWx52TfzCoUYfknY00xpLHhNCBUFB7/ZVAllrbRfxSraoo3UXLMmES1ruCI5DznIkI2yUdAw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB4867.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(396003)(39860400002)(186003)(316002)(478600001)(76116006)(66476007)(66446008)(2906002)(5660300002)(66946007)(8676002)(6506007)(55016002)(86362001)(52536014)(83380400001)(8936002)(66556008)(54906003)(7696005)(33656002)(64756008)(4326008)(110136005)(9686003)(71200400001)(53546011)(26005)(473944003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?8KWpfVpldp6O5ybX2wV2owKwAM9DvOUqfaIwHYC7+DJQJJ2O0UpvDxXC07gZ?=
 =?us-ascii?Q?4gzCwj2t8Ik83Xalgq7aC/478w06+zE9+0Ur6e9DjIvVCYEbnD2L4l8Zg0TY?=
 =?us-ascii?Q?ITpIJgBWoz+U1JMdw92unygGEs82SJu+2iMdf1K+XE80wWoDv/9ug0xdZoAc?=
 =?us-ascii?Q?MAzbaSUcs0Eqg2dEadCbAEqbt2F4mDLrfKIuc4CtBQ9K8s58hbkt6Fy3zxPW?=
 =?us-ascii?Q?gyRB2P2nRRn8IyTBhUPFJ2NDf5H2slsgDiZKb7raVxOx1W2FbNdhdGvKLST/?=
 =?us-ascii?Q?CtxQz8vW8tm8DWZNKLwDA679pRI4vACjmpBCt/0OU92i4T1MtKtWwyblPx+O?=
 =?us-ascii?Q?83Zud3sMFcENUAiYYbibbBgtzeTsyq0GnzCI4gUuIkaMSeNfuaZVXLI/nQWw?=
 =?us-ascii?Q?JF4+fl/AqSo+DK+t6QkskhRny4O3Ci7QiOe7TIJDUw4+wFfh+jx3S+LQHjz6?=
 =?us-ascii?Q?FMRSvr0RdM4yl0ZzwhBgvW0rD9QrZvPA8X1Tsf0Ibj4nP1tSXCfGKBLAk9U9?=
 =?us-ascii?Q?dqzOUeRTj8NbNJv3PPni+chFyxz2daQVGH0HLBm2Vni03ze2NAM+JzvPBtuo?=
 =?us-ascii?Q?zi9ORpC6+csbYSonFyVX8G5hnHhP/pZRjLiaG16jl/ROgBm4m7wAqr6dk1Am?=
 =?us-ascii?Q?wGXxOqHrttEa2uAFVcTLtcFi3n2ILp4pzYEq6sqzzBFdJ6/bKYZXT+eg2vlR?=
 =?us-ascii?Q?HS6iElveqGL8xYi1TQV83ENze8uzXxm+a1DBRueC52t8UMq6FM7qWevU3lb2?=
 =?us-ascii?Q?DuxM++xY0rzs0jz8/LVT8HDIXdBYgd+lKKI98Y5Xhsy/DDPcBsOKZi+X497t?=
 =?us-ascii?Q?ikR0dCNup+1kOuYk1M3D1QSXucioCmWt3tkys1XrsLsRD70KPFs410W3c6MZ?=
 =?us-ascii?Q?wU34Qj8BMC8ijNMnBsKZDFYBeUUGGJBA5XeNdwK30e0WRJPSP5mdZbIYutrI?=
 =?us-ascii?Q?sGElq35pJMniXUpZFxke2iAuk132geEHARjp6oSpgw4DDsFTXfo+ryjum4Ph?=
 =?us-ascii?Q?06dNm5o79Pw8wmc/r3zFpGjrSV7y5gFjMTvcdpACDQnd3iUomsLNTwSJcDob?=
 =?us-ascii?Q?UX7/hB5iW7ZK/7UhmR0N+h50NiaVzy9wk/0qZeu3lnNpos96DT+u3AmSCAVU?=
 =?us-ascii?Q?rFZvY4634a72EeZ7674vHY+oLAbfOn4Eas5PyBbuHB2ovnKRpdl+0weDptwD?=
 =?us-ascii?Q?MyQe6xr4R8L8uLD0OaIbfwaP9SZubJsQDKl8EcJ6u/ftaM5Thxu8NRD40T6J?=
 =?us-ascii?Q?Ircy0V+EZSlPlduKiGOQ5fq+g6OzHUG8Ivh2qk89OOjlk37fzCqHA0xdeTy3?=
 =?us-ascii?Q?RE9fYfbAqFN1kiQFKZCgcqVr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB4867.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44054cd7-9f91-4e02-f999-08d8d6a963a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2021 20:43:48.0194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpBTcmQ4Pcwt/6aENu5n21sG4svEQKmtHzAHLKvrzPoy+c7P9HtDZawUIaNDoCCTKMCi3SNrrlHaomGLXWzlg4cOq2owING4S5mbfB6Y8057Nf0NTY24RPwzcmAYuufc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1573
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
> Subject: [PATCH v5 1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out=
 ov5640 nodes
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The camera daughter board can also be connected to 8-bit ov7725 sensors,
> so in preparation for configurable option to choose depending on the
> camera's connected separate out the ov5640 nodes in a dtsi file.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> [geert: describe a single camera in the .dtsi, include multiple times]
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - Only enable i2c buses when needed,
>=20
> v4:
>   - Describe a single camera in the .dtsi file,
>   - Include the .dtsi multiple times.
> ---
>  .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 155 +++++++++---------
>  .../r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi |  32 ++++
>  2 files changed, 107 insertions(+), 80 deletions(-)
>  create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-singl=
e.dtsi
>=20
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/b=
oot/dts/r8a7742-iwg21d-q7-
> dbcm-ca.dts
> index 98c3fbd89fa6c5c7..bc8280b2ac47e3ec 100644
> --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> @@ -91,92 +91,20 @@ &hscif0 {
>  	status =3D "okay";
>  };
>=20
> -&i2c0 {
> -	ov5640@3c {
> -		compatible =3D "ovti,ov5640";
> -		reg =3D <0x3c>;
> -		clocks =3D <&mclk_cam1>;
> -		clock-names =3D "xclk";
> -
> -		port {
> -			ov5640_0: endpoint {
> -				bus-width =3D <8>;
> -				data-shift =3D <2>;
> -				bus-type =3D <6>;
> -				pclk-sample =3D <1>;
> -				remote-endpoint =3D <&vin0ep>;
> -			};
> -		};
> -	};
> -};
> -
>  &i2c1 {
>  	pinctrl-0 =3D <&i2c1_pins>;
>  	pinctrl-names =3D "default";
>=20
> -	status =3D "okay";
> +	/* status set to "okay" when needed by camera configuration below */
>  	clock-frequency =3D <400000>;
> -
> -	ov5640@3c {
> -		compatible =3D "ovti,ov5640";
> -		reg =3D <0x3c>;
> -		clocks =3D <&mclk_cam2>;
> -		clock-names =3D "xclk";
> -
> -		port {
> -			ov5640_1: endpoint {
> -				bus-width =3D <8>;
> -				data-shift =3D <2>;
> -				bus-type =3D <6>;
> -				pclk-sample =3D <1>;
> -				remote-endpoint =3D <&vin1ep>;
> -			};
> -		};
> -	};
> -};
> -
> -&i2c2 {
> -	ov5640@3c {
> -		compatible =3D "ovti,ov5640";
> -		reg =3D <0x3c>;
> -		clocks =3D <&mclk_cam3>;
> -		clock-names =3D "xclk";
> -
> -		port {
> -			ov5640_2: endpoint {
> -				bus-width =3D <8>;
> -				data-shift =3D <2>;
> -				bus-type =3D <6>;
> -				pclk-sample =3D <1>;
> -				remote-endpoint =3D <&vin2ep>;
> -			};
> -		};
> -	};
>  };
>=20
>  &i2c3 {
>  	pinctrl-0 =3D <&i2c3_pins>;
>  	pinctrl-names =3D "default";
>=20
> -	status =3D "okay";
> +	/* status set to "okay" when needed by camera configuration below */
>  	clock-frequency =3D <400000>;
> -
> -	ov5640@3c {
> -		compatible =3D "ovti,ov5640";
> -		reg =3D <0x3c>;
> -		clocks =3D <&mclk_cam4>;
> -		clock-names =3D "xclk";
> -
> -		port {
> -			ov5640_3: endpoint {
> -				bus-width =3D <8>;
> -				data-shift =3D <2>;
> -				bus-type =3D <6>;
> -				pclk-sample =3D <1>;
> -				remote-endpoint =3D <&vin3ep>;
> -			};
> -		};
> -	};
>  };
>=20
>  &pfc {
> @@ -267,6 +195,21 @@ &scifb1 {
>  	cts-gpios =3D <&gpio4 17 GPIO_ACTIVE_LOW>;
>  };
>=20
> +/*
> + * Below configuration ties VINx endpoints to ov5640/ov7725 camera endpo=
ints
> + *
> + * Uncomment the #include statements to change configuration
> + */
> +
> +/* 8bit CMOS Camera 1 (J13) */
> +#define CAM_PARENT_I2C		i2c0
> +#define MCLK_CAM		mclk_cam1
> +#define CAM_EP			cam0ep
> +#define VIN_EP			vin0ep
> +#undef CAM_ENABLED
> +#include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
> +
> +#ifdef CAM_ENABLED
>  &vin0 {
>  	/*
>  	 * Set SW2 switch on the SOM to 'ON'
> @@ -278,13 +221,28 @@ &vin0 {
>=20
>  	port {
>  		vin0ep: endpoint {
> -			remote-endpoint =3D <&ov5640_0>;
> +			remote-endpoint =3D <&cam0ep>;
>  			bus-width =3D <8>;
>  			bus-type =3D <6>;
>  		};
>  	};
>  };
> -
> +#endif /* CAM_ENABLED */
> +
> +#undef CAM_PARENT_I2C
> +#undef MCLK_CAM
> +#undef CAM_EP
> +#undef VIN_EP
> +
> +/* 8bit CMOS Camera 2 (J14) */
> +#define CAM_PARENT_I2C		i2c1
> +#define MCLK_CAM		mclk_cam2
> +#define CAM_EP			cam1ep
> +#define VIN_EP			vin1ep
> +#undef CAM_ENABLED
> +#include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
> +
> +#ifdef CAM_ENABLED
>  &vin1 {
>  	/* Set SW1 switch on the SOM to 'ON' */
>  	status =3D "okay";
> @@ -293,13 +251,29 @@ &vin1 {
>=20
>  	port {
>  		vin1ep: endpoint {
> -			remote-endpoint =3D <&ov5640_1>;
> +			remote-endpoint =3D <&cam1ep>;
>  			bus-width =3D <8>;
>  			bus-type =3D <6>;
>  		};
>  	};
>  };
>=20
> +#endif /* CAM_ENABLED */
> +
> +#undef CAM_PARENT_I2C
> +#undef MCLK_CAM
> +#undef CAM_EP
> +#undef VIN_EP
> +
> +/* 8bit CMOS Camera 3 (J12) */
> +#define CAM_PARENT_I2C		i2c2
> +#define MCLK_CAM		mclk_cam3
> +#define CAM_EP			cam2ep
> +#define VIN_EP			vin2ep
> +#undef CAM_ENABLED
> +#include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
> +
> +#ifdef CAM_ENABLED
>  &vin2 {
>  	status =3D "okay";
>  	pinctrl-0 =3D <&vin2_pins>;
> @@ -307,14 +281,29 @@ &vin2 {
>=20
>  	port {
>  		vin2ep: endpoint {
> -			remote-endpoint =3D <&ov5640_2>;
> +			remote-endpoint =3D <&cam2ep>;
>  			bus-width =3D <8>;
>  			data-shift =3D <8>;
>  			bus-type =3D <6>;
>  		};
>  	};
>  };
> -
> +#endif /* CAM_ENABLED */
> +
> +#undef CAM_PARENT_I2C
> +#undef MCLK_CAM
> +#undef CAM_EP
> +#undef VIN_EP
> +
> +/* 8bit CMOS Camera 4 (J11) */
> +#define CAM_PARENT_I2C		i2c3
> +#define MCLK_CAM		mclk_cam4
> +#define CAM_EP			cam3ep
> +#define VIN_EP			vin3ep
> +#undef CAM_ENABLED
> +#include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
> +
> +#ifdef CAM_ENABLED
>  &vin3 {
>  	status =3D "okay";
>  	pinctrl-0 =3D <&vin3_pins>;
> @@ -322,9 +311,15 @@ &vin3 {
>=20
>  	port {
>  		vin3ep: endpoint {
> -			remote-endpoint =3D <&ov5640_3>;
> +			remote-endpoint =3D <&cam3ep>;
>  			bus-width =3D <8>;
>  			bus-type =3D <6>;
>  		};
>  	};
>  };
> +#endif /* CAM_ENABLED */
> +
> +#undef CAM_PARENT_I2C
> +#undef MCLK_CAM
> +#undef CAM_EP
> +#undef VIN_EP
> diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi =
b/arch/arm/boot/dts/r8a7742-
> iwg21d-q7-dbcm-ov5640-single.dtsi
> new file mode 100644
> index 0000000000000000..70c72ba4fe724a70
> --- /dev/null
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * This include file ties a VIN interface with a single ov5640 sensor on
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
> +	ov5640@3c {
> +		compatible =3D "ovti,ov5640";
> +		reg =3D <0x3c>;
> +		clocks =3D <&MCLK_CAM>;
> +		clock-names =3D "xclk";
> +		status =3D "okay";
> +
> +		port {
> +			CAM_EP: endpoint {
> +				bus-width =3D <8>;
> +				data-shift =3D <2>;
> +				bus-type =3D <6>;
> +				pclk-sample =3D <1>;
> +				remote-endpoint =3D <&VIN_EP>;
> +			};
> +		};
> +	};
> +};
> --
> 2.25.1

