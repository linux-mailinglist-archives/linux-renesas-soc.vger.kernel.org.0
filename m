Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1772C5AD5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 18:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404454AbgKZRmd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 12:42:33 -0500
Received: from mail-eopbgr1400129.outbound.protection.outlook.com ([40.107.140.129]:28053
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404320AbgKZRmc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 12:42:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VmgR29jM3lo6Jphiq6KmZ0cD6xZ7NIX6pddaxqOdvb59Ukjiwo8Xy6q/GnSYd8pQyqIlGxWj6RfegbrV2evomxZG5w0FZZS9wy6G246Hwy83MNZ05owME7UD5HYPqpzbEZKDcY6gCoH6ZyEaTyY8cVqeeemfdwc8/DdRe+KI7+S4VN4UljKnCg6fxP+D0I/RmeAeSPtu937MpMBxEDZjVICAWhU4uP1rA8ZUD2citoXtpkNrst4yhc5H6UlojLGyAkfc2DfoHwrNdFLAu0r2oPQ5VUvVh6cdX7pweOeAiuN7720NVvdYBrH5Y0a1oMf8V2ixM54sfIUrOozd2Goy1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oESO4pvWhdlONiHpJfpcBSu/z4Lk8AkdU/F7oMD67e4=;
 b=EoR8DNJpuHsNgSNnHtlyyZgiVdSdXTZ5MlD70uwdX4UkNrS4vwImUC3B9CyBQX8WursXJQYwqWY3Gg1/8Up/pW7WR5oy/zJ6S37y5hB5ORAblfEV3cUviBkgNCg9nwha4lBRwJxUtjV16cQqKoNvOuMZVKpqxxD5wdPBQwxuQsStb59eo6YvBm5Q87nzoFzCDX+du9opP0TTI5MjhsZAqIG/I3Mc12rPydZkjRqjx+zL3yfKTYFGG0lCsqqTUJ4cTUgoobLEzyFVvn6GG5GhFYBhkCame7QZ31f5WrcDjWfxcglIq306kxXxDGMpp2Izpb7lQ+sjKDyCicnvx2DbNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oESO4pvWhdlONiHpJfpcBSu/z4Lk8AkdU/F7oMD67e4=;
 b=f2SPkkuLsUZpV+HmkvfSYivbEJJdVfOyKZRJ8EjouGSFgwA8c3N62PRwvXJNv2eEcna0lkeatbZ0fKlsDS+8cfcyFmUgjrPv+c5kNJk5D38NiU40kjbe4PLOFsJGcjsEo1qJYOkTPrgbA3IoHikrA3bFBUArQbHQUkYuLiRVy9w=
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com (2603:1096:604:38::10)
 by OS0PR01MB5859.jpnprd01.prod.outlook.com (2603:1096:604:b8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.21; Thu, 26 Nov
 2020 17:42:27 +0000
Received: from OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70]) by OSBPR01MB5048.jpnprd01.prod.outlook.com
 ([fe80::18f:c7ea:e9e4:db70%3]) with mapi id 15.20.3589.025; Thu, 26 Nov 2020
 17:42:27 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out
 ov5640 nodes
Thread-Topic: [PATCH v4 1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out
 ov5640 nodes
Thread-Index: AQHWw/9UPOaFqxmSLkudy+21evfaLqnarTJg
Date:   Thu, 26 Nov 2020 17:42:27 +0000
Message-ID: <OSBPR01MB50483C8B0A3AC24C0987F14EAAF90@OSBPR01MB5048.jpnprd01.prod.outlook.com>
References: <20201126134031.4115211-1-geert@linux-m68k.org>
 <20201126134031.4115211-2-geert@linux-m68k.org>
In-Reply-To: <20201126134031.4115211-2-geert@linux-m68k.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c431e460-1141-47e8-bf9b-08d89232a447
x-ms-traffictypediagnostic: OS0PR01MB5859:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB585980C70DF0475926778A29AAF90@OS0PR01MB5859.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J82zyS+VdPjEz60BHPjjkH+cspGTeLeA3OU3xBoCbZKiyyGH5ROtmh0j/ApHupLuW+CRk1RIa0565KD3+5SpLC2JsW+feiUYjEqKu4UCcQ1rsTQe85iT+9ijpkOvEkckqlecTbBeOI9Oiq7g2TMBXYtLqSHuAD6QD5252Fp3hfLRAwIiePmiAc6XKhnnUPLP/YcJrB/I3yEMKdkT0Vw32VpQveysJYyOx0hBButuM00SNt6eo6D8+NZmVZH0uzbjFqR79f7KhuO1P4EzRZrWfelKZr6rLIXpA0z6md+IjColfodFG6KfsYq26W+TcUj7+22sWU0WqjPX6xfPc5qBnmXmHEcjAvBBTzJE7Vx/GqViRBCSWPGagBSNSQtCIJl0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSBPR01MB5048.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39860400002)(136003)(346002)(376002)(186003)(71200400001)(54906003)(478600001)(110136005)(26005)(316002)(6506007)(4326008)(53546011)(7696005)(86362001)(76116006)(83380400001)(8936002)(33656002)(52536014)(8676002)(9686003)(66476007)(5660300002)(66556008)(66946007)(55016002)(64756008)(2906002)(66446008)(473944003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: WjlhaGDSXkB6F7foFRNfNLBTnsyYDv5V+T1/HjzGNGGLTzQce3xUc+iwQN6uR+ehNrBoGoNcb3EFtxpUm7gqBhViE33XuiZfMqwudPYZzBbfUDKeKUe9FhUZrnUvPhUKe+ONRYmpLAoCheR1XU9QnB+puoxZVpt0qNyH22XhOG2kpJbMGcbqsdSokeg10H9/iuNyTrYCkWQTloHO/QufsriRybALfEr3xNLXUoOlVDf23ZvSpdbLHUQQZsNix3YS27+/FvssurJUg3q5BTftH1Gof3BhPPOhkEOGLbpuuEh/tFDu+jX2oUKkDI6Apb2ukTrobGTeOZK0pLD+H3n8Fq/1PKRy8sd+H8nVG4H7kd3fjuqZSRw7WEZR1qvZPdNgoJYc7EHdXPhchdqanzrQeWpiiZVhF1xq1CWH2/c8iZQFSALHpBSrhkhFe2+n/1MCP96yByR8WyZFsmbXX3YkB+s0u0XZwSWvV4/azaO+Ty/PY8FqD3KqoHNn6/5V/KMSeOiibD0xlSfgFwlBJ6XhGLG4oxHpro07l/zRoGgLdqQD0PnmZwK97X6gqNYNzULPdJOL3LE7EAhNGpIdLd1cDItMFXNO/VnTBkiD9IT/7zyZJI1rEurrAUBI7yIdmdLjaDlVT+rHEyFXlQgjMsfnIMaBlH63BktHiOV9Cw4FzVu1iilCl/cxTWVVe8TOGuKAPQAN8tX32Ce2OvzeraNHCwoHW2v/DkJ6PAin7o+lT1En/tpXjTm+t+6QsurDwgmjprmnhY41muSVXy8hGFpa6PhVtA5FCmUPhaKHoQ8+6SFRosMJbI+gF3BhPtGJB39NL4BLDdDiwVcBTnGDJXpvsfwrYcIM9XA3FBdPjLTy0opfs10PQB1duSlcavszvX1s2TP9iexVrxrnO18g2C2swQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSBPR01MB5048.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c431e460-1141-47e8-bf9b-08d89232a447
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2020 17:42:27.4121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H4JPGY9pAjshTF8pRcezA1yFXizRVTw8KDHK0x+iarf6K6rhKvzgPg5u7vtiF1xvLnXRn4C0pHChP0qGHHVadw4IaEpHLQ80MzvrADD0a3VzDz9Vx+0Qm7ZvwYY+j9bt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5859
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

> -----Original Message-----
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: 26 November 2020 13:41
> To: Prabhakar <prabhakar.csengg@gmail.com>; Magnus Damm <magnus.damm@gmai=
l.com>; Rob Herring
> <robh+dt@kernel.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; linux-renesas-soc@vger.kernel.=
org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Prabhakar Mahad=
ev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; Geert Uytterhoeven <geert@linux-m68k.org>
> Subject: [PATCH v4 1/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out=
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
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v4:
>   - Describe a single camera in the .dtsi file,
>   - Include the .dtsi multiple times,
>=20
>  .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 151 +++++++++---------
>  .../r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi |  30 ++++
>  2 files changed, 103 insertions(+), 78 deletions(-)
>  create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-singl=
e.dtsi
>=20
That looks much cleaner thank you.

Cheers,
Prabhakar

> diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/b=
oot/dts/r8a7742-iwg21d-q7-
> dbcm-ca.dts
> index 98c3fbd89fa6c5c7..00634eb58ce39da5 100644
> --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
> @@ -91,67 +91,12 @@ &hscif0 {
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
>  	status =3D "okay";
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
> @@ -160,23 +105,6 @@ &i2c3 {
>=20
>  	status =3D "okay";
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
> index 0000000000000000..408016620f5b1a04
> --- /dev/null
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
> @@ -0,0 +1,30 @@
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

