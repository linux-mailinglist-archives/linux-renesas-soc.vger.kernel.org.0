Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27770240C07
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Aug 2020 19:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbgHJReK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Aug 2020 13:34:10 -0400
Received: from mail-eopbgr1300090.outbound.protection.outlook.com ([40.107.130.90]:56288
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727841AbgHJReJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Aug 2020 13:34:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNrek46pWBfpLB/agvm4PzhuweaK1A1mpO5kp2yMkRdwlliIOSxIJrPm1UyqHFtXuev0UtSRm9ZzsVcD2qlnI3LvoTNm/iaqeR39xHGAo15/AMZjc9eAvPuhC8vOsVTj3iFTw36IozOnlwlLisxBN9wSaIz7IbpzPALmtbGOqNn2tSIP6pyE+Q3VTTBN9Pi7oW5zPi2kdprhgMv+7vjwwFeCmuJTK9SgXq38FU7UOgZ0Eq2+vMhvmPjuej2/dnxjtJ0RWH1e6p2HvXqpxmHAhzdKf1ch7PEHQIW5MaZpT6wO/t2Cdmlx1aQtWygCYE7jLv5veWKnasI5U7xNzT9fFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUUZ5EPtWKIsJ+8+Mm4BIte6R7mXiZAWD78Nw6lb7Nw=;
 b=VzDhXBxMOU5emGevEDkqql99P6oyRe4ZOvASgZrPtkQkJot9OoTMgRkEEUfnO8ZR+MN3fApAFLGf6ekLThQz0L40ZNp1I1OTu0KD+pr4M2aMNAujTN76FQMKMT+fizndM2viZRLP07qRT0ejmpCbMcV67Ggb4w2tfaZHzKtPoTCZTmdaJbDoem/uF6yJ1iw/vruIWxpSvAyII2E6nAkTUAPBM2Xc7ItRYxaVNb1gfbgx15ztcYdwLiTPAyRzthGpQF5UtsVDp4hwG5PJS+JYd65vYQflKNHvlt4sEgsRJvFFVZB9lIzQTm+Riz2LW5f34F9EmLlFvb7PkeTBxbu8jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUUZ5EPtWKIsJ+8+Mm4BIte6R7mXiZAWD78Nw6lb7Nw=;
 b=sjW38Cgd69j3KLRC9XI64lSPpHyb4BlAWj7Kfp86JCMB6I4a6+7YxhdUa4wukBn3iIjNeFVpDwHL8Z5WGbxCJxYoD4VW1hxKQPOf/iDhYOkL/qqr270J+TVZzZP8u3L09lpF5q2czrCV8ohK/EuYX2mU5cSZ72NNru8Vnze8VgI=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB4154.jpnprd01.prod.outlook.com
 (2603:1096:404:d2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Mon, 10 Aug
 2020 17:34:02 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::c141:37ba:af8c:b2ee%7]) with mapi id 15.20.3261.025; Mon, 10 Aug 2020
 17:34:01 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 3/3] ARM: dts: iwg20d-q7-common: Fix touch controller
 probe failure
Thread-Topic: [PATCH v2 3/3] ARM: dts: iwg20d-q7-common: Fix touch controller
 probe failure
Thread-Index: AQHWbyoWubC3sjO6WkCn/e02nv2Wl6kxmcSw
Date:   Mon, 10 Aug 2020 17:34:01 +0000
Message-ID: <TYBPR01MB53096C93DC53D521792AFDBA86440@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200810152219.6254-1-biju.das.jz@bp.renesas.com>
 <20200810152219.6254-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20200810152219.6254-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [31.49.74.109]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5da4fb28-640c-49a7-5e8e-08d83d539231
x-ms-traffictypediagnostic: TY2PR01MB4154:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB4154657C469F4FB91B9CFB9E86440@TY2PR01MB4154.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q342VtLtcZh8p0SZfDXiCdtnjsent+hZk7YGQ2sSiiuW4Ni04YE/DQhNoUkEFwZVL1nP0Crkprv7REj6KAoj2h228GndOTTTqXwakezcfiECfCuOx0XqCWQdSAyy8n0BiHUJ9twbgNgTaNkyi6+pVOXQ5j5/NsiNF2IVEzN7JDCe53Vg8bxlqU8bv6Rw7EFlzlAgsRhCORZO2ue/La+UPgKyy4NBaj3YChhXf31lJBFS0iqSXrEJ/qcmlELuKnAQuh+85Pp+1fkD+M9eNjcYTW1GAR8Epm8H+6NPBsBoUVmK0RI7TV1uWC0bnLm3+uWPBC3Gb3LX+kp/jfBWVFBkqywjfSk4Kw+nI2ymchZsRCsfcaEakB8hY2Rz1GUTNr+tL2Odk4Wrte65O9ngljJ73Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(376002)(396003)(366004)(136003)(346002)(33656002)(52536014)(83380400001)(8936002)(110136005)(316002)(54906003)(86362001)(8676002)(186003)(7696005)(71200400001)(2906002)(26005)(966005)(107886003)(66946007)(64756008)(6506007)(66446008)(9686003)(478600001)(55016002)(76116006)(4326008)(66556008)(66476007)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: Yci0wYWZ2sGd+g329BCB3XQ3J7Xm5p8XYgkC+fj18I4/yC0BdqOIiQi3AQFjP6zHI/EwhvEYLddS2/BBQL1QINQtq4evgtsrObnlXha2pzNBASmb2KWzpiwMgps5ffus+nYAHIQBqCFIt/y+H0HmQjVj4Pxe/dF4o3F5PXBrL8H5yO4cG5+6o1mShGkqdad42sP9A3KSnCWjtr6kqUZntlAJEZ6C+PjhOw+T0FqdmN2EYZQ+ijH/+8/ewUzFMcGZs8j1mMV1DRRxly44nNtdJkdV61wP2eAVPEWUOxgqcovJ80YGPEQKbZV/WoauiMQ3OzrvOcnNNFWEoU36vezRNT1iAp0WdlIBCGbABn28sM37wDawU0vXf4nyGh2iDnJw5R31p3cTktD2zM4TYNsl5BClj8GzMNei5/I/NvR//QdKQRS/Q8/pkOyccGx7TumODRtld43nSBJEK206+3YEAvioVSDbEdpISi0Mw/x8v725Wxpg2s/BS7KcV9fu6Vqkd3fZyyW/URf1g2UWMDLnjWy72+2+yxkslyD0tFPqrY4K8hOD9HlkCpxKtHthOwd3WCHtYCrkKfPkkz5pmtSpBvY2bA8J41Q/VW+WQB+Db5jEd9c1dD2hV/Ym1f3x7b9WZew+g++MF4Zp8J+0g2kPMQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5da4fb28-640c-49a7-5e8e-08d83d539231
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2020 17:34:01.3500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X9HJjjnVF70Lwj6XvTkeVIIumNyf1kSdTWfY900miQKeUaQ9s3QvniTeW+YslH76UbJe2XKI7Lx9BdGIz8jAjef3Jvmzr6C5eH4sJPDgMfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4154
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> Subject: [PATCH v2 3/3] ARM: dts: iwg20d-q7-common: Fix touch controller
> probe failure
>
> As per the iWave RZ/G1M schematic, the signal LVDS_PPEN controls supply
> voltage for touch panel, LVDS receiver and RGB LCD panel. Add regulator f=
or
> these device nodes and remove powerdown-gpios property from lvds-
> receiver node as it results in touch controller driver probe failure.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  v1->v2 : Add regulator in touch panel, LVDS receiver and RGB LCD panel
> device nodes
>  v1 : https://patchwork.kernel.org/patch/11705819/
> ---
>  arch/arm/boot/dts/iwg20d-q7-common.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> index 4c8b9a6b0125..056f93119d8a 100644
> --- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> +++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> @@ -57,6 +57,7 @@
>
>  lvds-receiver {
>  compatible =3D "ti,ds90cf384a", "lvds-decoder";
> +vcc-supply =3D <&vcc_3v3_tft1>;

Sorry, will sent V3  for  this patch, since it is  missing removal of power=
down-gpios property.

>  ports {
>  #address-cells =3D <1>;
> @@ -80,6 +81,7 @@
>  panel {
>  compatible =3D "edt,etm0700g0dh6";
>  backlight =3D <&lcd_backlight>;
> +power-supply =3D <&vcc_3v3_tft1>;
>
>  port {
>  panel_in: endpoint {
> @@ -112,6 +114,17 @@
>  };
>  };
>
> +vcc_3v3_tft1: regulator-panel {
> +compatible =3D "regulator-fixed";
> +
> +regulator-name =3D "Panel Vcc";
> +regulator-min-microvolt =3D <3300000>;
> +regulator-max-microvolt =3D <3300000>;
> +enable-active-high;
> +startup-delay-us =3D <70000>;
> +gpio =3D <&gpio7 25 GPIO_ACTIVE_HIGH>;
> +};
> +
>  vcc_sdhi1: regulator-vcc-sdhi1 {
>  compatible =3D "regulator-fixed";
>
> @@ -206,6 +219,7 @@
>  reg =3D <0x38>;
>  interrupt-parent =3D <&gpio2>;
>  interrupts =3D <12 IRQ_TYPE_EDGE_FALLING>;
> +vcc-supply =3D <&vcc_3v3_tft1>;
>  };
>  };
>
> --
> 2.17.1



Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch=
, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, =
40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldor=
f, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WE=
EE reg. no.: DE 14978647
