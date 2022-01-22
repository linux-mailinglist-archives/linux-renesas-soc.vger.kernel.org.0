Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E421B496BD0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Jan 2022 12:04:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233970AbiAVLED (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 22 Jan 2022 06:04:03 -0500
Received: from mail-tycjpn01on2095.outbound.protection.outlook.com ([40.107.114.95]:23813
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232530AbiAVLEC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 22 Jan 2022 06:04:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnxUnBBfi8eyf8AxREe1rMB1JHb+lHeoaIoPqUAldeEhxmZe0+/IjlLrGN+6MsdXY49h6/wNZK/bcYhohz6TiBBirDl8W1IPwHdWYzQJcKhK/wER+DQrKidYtmrWGtZb3i5tVc9LIXrvUp3BiKf1OrZDeu9fKJVdy7upr2Y+8Mk4vOSm8sJv0psAT4eoS/0EB8didCuhEYoZOSGw9uSuZ3+1K+uIetYjLjsucB1WP3TB66EN7x4dkde4+hg6c3N+i3+GQZ8Q0DZt0hq+yLn/X/BgBGe46o2Zrw4NzdmL1rZkZg4NYV0ScrFTN9xGKkEdtOc9mGOjgdkXmQJzoEKjxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZkDK8DchRrFDF+yIQ+1nWBnm0Ya512AFNnFXaFcPXY=;
 b=WuKc7185TmOZ6yOTwF6Voo9tIFOnTtv/VgXNy4vxCYceBNs4OqCxMIc/vUHmUuFCiK3M43FUQr2n8CDHVPc/DRpUYj6Weww07ZgKDsUaDA9GosgojrSSB33HmEg7whLzakrIZovqs02XrGQNQweYZYmBDW1Fz3G8iR7/w3SQpgFdFaFtIwQ8vtXEPx29X4Oc8q1s3o8EKR512F3sBsJ1aURY56+UmZgE6MCghJtgx2dOw7k4V/NVdSgoZL/8Vy1hGs4x5qUkZknvPel7aACfeLR5tuRZIVR0YVeZYPUan8ZipYoCyMSgelYkFm56Xr7IvSAIychaxIEH0VQFGUZbPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZkDK8DchRrFDF+yIQ+1nWBnm0Ya512AFNnFXaFcPXY=;
 b=VdxFODx9Y43Ur8tz27uGfBn2GstZamgKReU2GZ9odthgQpf/MOZmYnuVsBQbdLnGh3vPCQPCB4G4q4TqZLrNvWY+crMxmEC9IkYrm4rvWkCresJqXvIolqpqaO4a+ePJ31THJHrSaCAuOCrU4NR7bnCEngjG4JA5VY+DBU5sAKI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4231.jpnprd01.prod.outlook.com (2603:1096:604:43::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Sat, 22 Jan
 2022 11:04:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4909.014; Sat, 22 Jan 2022
 11:04:00 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] arm64: dts: renesas: r9a07g044c2-smarc: Drop unneeded
 pinctrl-names, too
Thread-Topic: [PATCH] arm64: dts: renesas: r9a07g044c2-smarc: Drop unneeded
 pinctrl-names, too
Thread-Index: AQHYDt18OGCMW7ujjEGiCRFuVo90i6xu4RwA
Date:   Sat, 22 Jan 2022 11:04:00 +0000
Message-ID: <OS0PR01MB59226F7D6618AE551DAA9F51865C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <ada490aeee8f1bfdae4a878dd1fadbb34dbc3fb7.1642779366.git.geert+renesas@glider.be>
In-Reply-To: <ada490aeee8f1bfdae4a878dd1fadbb34dbc3fb7.1642779366.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccfc513f-24da-4fc9-54e5-08d9dd96e4e2
x-ms-traffictypediagnostic: OSBPR01MB4231:EE_
x-microsoft-antispam-prvs: <OSBPR01MB4231E36060D7DB1158DAAF74865C9@OSBPR01MB4231.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: itRwY+/6ssuQThSQ4mm++IIGB366AJFRiU/W4WUB4tojXz8e6j6vddVsHnoYrLprj1ulkdzVfOaHgN73tBzUZFAHWiwlRGAUJqC3vZB9Onr84IyHSHlxmHZ8dNgm4AyCj8W1kvRDSbe0/fzIz6oap7LBep6rw2OiDp2W2mz6vfdbm2RLDna/SJNq2krmdmUs67s7aC8Ybaf2yqaLieNb1diEmc+XPf2oQ8VZn2NNKGLqzaEPMEItboKrVaN3hjgYtMH+BQdAzs5f19llXXEAzu2BedM9IYWrXoFnLCVRbNwDKQ/JO3dI//3BE0sldEQdWRyTieFfadRaDrfCBZVt7vh4H/9V2li9z/ig+UR4FOxKUK4l6LK/GCCWW/ec3qPDfHb9fVsHUiyEd6uxbP/OL6HsOvSXxDjX91FJ3rBGm3yB0M43WXltyqfn911+rxaKo07JehXU5m6vWKE/1akOj/3RpuEw/84uPBJHu6y3CdSHbqZE55OuHjQ5B3mjErPsYKlyIpDtEm6OBtUrskfN/tqhTONduF5GYByVcgCYvm/GEj++D/Z1QNessX7wJIjmsoBYAJ0XNTLoRNHL4EtUPANk2wi4mJj45JKaCYqWaYjarENOczfmlGWJckIwLYUV4xU7ilF/K11wfk4lvQLt5IYZkS/fquSyMCuqSUkSMPQjbOd+py/lFUdsDvNSvb0TQsTKJEaX2R9Cp4Y1CGN/4g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66446008)(83380400001)(9686003)(33656002)(76116006)(66556008)(5660300002)(66476007)(38070700005)(122000001)(64756008)(8676002)(8936002)(66946007)(86362001)(52536014)(55016003)(6636002)(26005)(186003)(6506007)(7696005)(38100700002)(508600001)(2906002)(4326008)(316002)(71200400001)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iIW+cug13idNM2OlM7y4RCPZtlCLv83W45W6jKc/J38TMWxh7P0Je50o5rNU?=
 =?us-ascii?Q?Z45WQXZm/3amhAYu++7W8LTPL3ICDyHzs9R0J+EXLa0kGLC1i3db1xiPEq30?=
 =?us-ascii?Q?0VWfmFVc7hO8J96DQD3dYhzndnplZfrozWhm5eEl47yeQL+vPXR7R/mO4W9g?=
 =?us-ascii?Q?zH0exBq734yXP13TCPu6KQ8uAA6jhIWl/LGaF2WIl/kf7tv2jPzTEMymBbMr?=
 =?us-ascii?Q?Atk65KA4oMArCPHTA6G5vIiJVegqgdkNPX4gBBZlQvPC3EXh2y2U8d7kD59R?=
 =?us-ascii?Q?FEfU8ob0DrQyUIpJRClRvNI6p3Ip1eCeteFaf64vS6TeCdWr/SCHn6EeGTiQ?=
 =?us-ascii?Q?ICpuLVWYLawBUdzY0253tnz+fIOoDK4D3ARyBF7WKhNIouw0IDdyLNtMo/zD?=
 =?us-ascii?Q?F8RsOhSIsEB5XoTyO/zli7P0F1kwQof+wEhZvpOu6eWxnb6QP2NWoChxCoGO?=
 =?us-ascii?Q?m7Zc03/po2KzClIxVKP2lw8kAB+M8vbeHe7XYmoExe2q34ocX4MkMa7RcEhx?=
 =?us-ascii?Q?Z42vDV/m/5+Gv/4a+AD/EHlAFgHBMDCjXuAUspkDXElWFnt7Ou0Nf7rARZce?=
 =?us-ascii?Q?O4jK3mbPOzIJ/7rWQocv+msV49CV+1Ps22P1Jh90QMC2UR8V6Yu/2ouq2k6K?=
 =?us-ascii?Q?wNWiyhEVBwxIz0u4/71fWYHwhK7i2M4DctswC+Uihy7t7HO+/Fg9hMN48W2O?=
 =?us-ascii?Q?Za5i3Gc6yHB0eXAo2EZDrYtWLAYNgOqarWFjpaVVMiJwH3tLK4SfzboNtgL0?=
 =?us-ascii?Q?audeSD7LQ6cE2JIv+VN8bwbMzlhr+YVJ4LiEC7XF+LoVyYudDdYE0RHPyT5e?=
 =?us-ascii?Q?VPU6WXIYbU5AX8y/sWIWgkAs9cc+JTzTm/nK43H+W1z8g9C8UVJPNa0nhxwg?=
 =?us-ascii?Q?+DTW3sHnPgDhNxt8CKHxvve/Iclfs7DL3iSmBnNMBNNQqaCSm1xUuQp7pT2f?=
 =?us-ascii?Q?qP21WYBzJjhAtyRBoF0EJMk2yJfwscFQx0VZaiCqmajh82QGmdZf5nR0sPuZ?=
 =?us-ascii?Q?VtwvneeYtjQaTqCjUifD8EC7UEr+qT7IpAuExM2XiuwWF50nKMcSZGYYe74A?=
 =?us-ascii?Q?+XWTtYBAw0MjLZKQxuZiPIzMYQxTxLdAazUDddX2TVwA4WXeo6KZL1kZT9JQ?=
 =?us-ascii?Q?jIOVXncP95aqD0Qozqjh2KimXOuph3y2oz+cGphBu7L6i8WhwXjSnejizYBK?=
 =?us-ascii?Q?s3voB0BcqVfbK2VDAfCy+Ga9CYQov7+eZk0S2FrwxjoPg8FXW736Uj9sNsF9?=
 =?us-ascii?Q?ZXq65C0ZiFdbt+/lIl7KVxIc6waeiafyj7GsjXVDKffQVvHRnBRSkRcu3sOV?=
 =?us-ascii?Q?hT3+/BGwfATVNgnnHCcafPTMsfDtQMwVtP+mhLx+1tR5J0hKZYjphxdmwJds?=
 =?us-ascii?Q?H248mrkJqQHWrupT3vG+FJOrPcbhDAhLWg0fSDbjMXVy8lljEB3OxUICMH4l?=
 =?us-ascii?Q?w97glCH9/QfVZsvIDY1uv4CAgN1BhdLkYDMor3HjTpT2S7j7AHreAgpap2cl?=
 =?us-ascii?Q?13M3dO8oxmVk+UlVvYK+FOFL1Z3+0baP2UqwCXJ3qyJDrCvybNq1TBAhTopt?=
 =?us-ascii?Q?QgJ02ze0lptVHkW0zByeYfQ9DMFxB0uJLkD4Qw+5A4CDHhN1un8KmAeFbTqe?=
 =?us-ascii?Q?2lWuIP20TDlTnYGJWXVlkf+2NTXnrvTtFxhATCVp1Uver8vPL9S8PohNZixL?=
 =?us-ascii?Q?fn3gnA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfc513f-24da-4fc9-54e5-08d9dd96e4e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2022 11:04:00.4194
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 60wkhNe95dyKNm/v7txH8UMQ3QUpbnT6YMouubcKLdV8x8u2qclTmhL53dFYRrjE0S5HuHHJ0M1rgIl8zIHmZbIRd/opgZ3kQtpy3PLxbmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4231
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for fixing this.

> Subject: [PATCH] arm64: dts: renesas: r9a07g044c2-smarc: Drop unneeded
> pinctrl-names, too
>=20
> "make dtbs" complains when "pinctrl-names" is present without "pinctrl-0"=
.
>=20
> Fixes: 5c0d1874072bef54 ("arm64: dts: renesas: Add initial device tree fo=
r
> RZ/G2LC SMARC EVK")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Biju Das <biju.das.jz@bp.renesas.com>

Regards,
Biju

> ---
> To be folded into the original in renesas-arm-dt-for-v5.18.
>=20
>  arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> index 53845823d0dce9cc..728a2275ea8d21ac 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> @@ -19,46 +19,55 @@ / {
>=20
>  &canfd {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &ehci0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &ehci1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &hsusb {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &i2c0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &i2c1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &i2c3 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &ohci0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &ohci1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
> @@ -68,32 +77,38 @@ &phyrst {
>=20
>  &scif2 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &sdhi1 {
>  	/delete-property/ pinctrl-0;
>  	/delete-property/ pinctrl-1;
> +	/delete-property/ pinctrl-names;
>  	/delete-property/ vmmc-supply;
>  	status =3D "disabled";
>  };
>=20
>  &spi1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &ssi0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &usb2_phy0 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
>=20
>  &usb2_phy1 {
>  	/delete-property/ pinctrl-0;
> +	/delete-property/ pinctrl-names;
>  	status =3D "disabled";
>  };
> --
> 2.25.1

