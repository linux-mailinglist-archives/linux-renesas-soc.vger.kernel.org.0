Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE563D70A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 09:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235896AbhG0HzU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 03:55:20 -0400
Received: from mail-eopbgr1400127.outbound.protection.outlook.com ([40.107.140.127]:15709
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235890AbhG0HzT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 03:55:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKjJZt0xesz6sdS7nYf9RbYF096fnnejw5scO8p5Dm+VEIQhMElsbiY1FUexbRiNptKsL+G8N8+JyeMijkqAaxHVnsaFBxtInrl2ZwZd9230eQSUu6uNc9+kyqbEtee9yKvrUAbSaC/HBtmZW/Ld7eKeG8j/uginPOReen9yM4C07I56L0HOBlP4zq5C+AFo4ncV2/xO+s71PadN7vccBtv8dvvf/gzA80z2DlBL0yTiFEUg4NMviqTZnsSipptRmB3urGKLmgktGzwauYfcGBdMwYqfaZRtwjSKqWKEwFp8ixo1JxQVyiqaIUFBUTOuuF8HemcVbp9Rlt0LC3bQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpQMhBcEbhgFrtERj6DBjpRl8aBkgYk8mhtJooXRtI0=;
 b=cEgjZO0oLoEIzBrxTwnYl1mPwcUzrpQOAC9ZT0D/vAG8v0d9St0j2/R7NsobWSG8E23qt2Lg7xpfLZo/d/d8+1TqMAeR8E2Z6Q1vIydPf4i8aiwXYBQ08VN6/ULhc8AAlWV+OiyQ+BD95E9x9iqHh+QXTk8aJkkvrLTy2h06jG14RL92Q75yEnsMpxiH9plR2ynsIxo/fpn6ZzzVvotCjqT5eGR8Iiot63Lbr0gAfoFsphdQU60LC/FeL0NCTJsls2i31t+n+PA7Oqo7AJoMMTn+QvLUqrdJF9SVF0jWKY7hGiJdUkgCItobpp5qTBNgD0epuvbNMwhKjQEFGxXAhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpQMhBcEbhgFrtERj6DBjpRl8aBkgYk8mhtJooXRtI0=;
 b=UfqgXFBjsTL9UoVk3tyvGILuUPQzd/u+R2DlXJKaZbcowhBajlMV27/Lbngu2BnS3ze4MSdiyUSD8nhZn4ILhiQROkJhifIqlaYJqqXBbuwZSDgg1Rh2nROydU4E5dsgz6I9BZF6eOeA8nx6NMpDPQGUeuQGuLx3iyNhWCPk7zI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5736.jpnprd01.prod.outlook.com (2603:1096:604:c7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 07:55:16 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 07:55:16 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 04/10] reset: renesas: Add RZ/G2L usbphy control driver
Thread-Topic: [PATCH v4 04/10] reset: renesas: Add RZ/G2L usbphy control
 driver
Thread-Index: AQHXfJhheV5fogd0t0SNRhT6tn8BzqtWf90g
Date:   Tue, 27 Jul 2021 07:55:16 +0000
Message-ID: <OS0PR01MB59224851A0C86B3AFECD575186E99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
 <20210719121938.6532-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210719121938.6532-5-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9f3c3d4-7e53-4315-6a6d-08d950d3df5c
x-ms-traffictypediagnostic: OS3PR01MB5736:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB57361E46529BFF90A1C1825C86E99@OS3PR01MB5736.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZarHqKal1wndE6w3w22zwHj7/9o4ab15bSJ6OmADr0006F+HI6gYG+hlfDoDc2YrRfoSoJWMw3UfwqdVPyocMqNx5+QG+rk1JF7t0iMFXXhrhujYJKTy0p4PzJpvxIyCagJZS1wL3e0sGJTKArP3PTsRxZF198fkJhpWg96LpZAIU1Ysoy3ahv8vpHnhTYILNduWegDKUjeekJQw3XrwW99OBqaac9eQnZ0RIJZcKnoZWnGbpGR+TgTugmWixMeFpOVRMnvlQwAqunxgnmrC9SUzRz4B+r+lNvexQjaTFs05YnDolf11jCLTqS4H03nhzoo9H3M5JSFxSAZsnbxjiSDOee5i1bAnxw+9W7DK/lpeTb3zNoLNb63GM1n/xptib0KBN0p6twoL6S8qTakUqDUjWwPqbjOVEUNZRTMLsO/+V2RO5Z5EroY6/kaVkKI5E9DP7t16Ulxn9oVCQgbTWdzL51Ed9pDAAIr6jFOUnlo+ORWsKiaeEm6R+pn3hoXsJPocawVGM6+3SXcDQOQ0i0vKltgxOCrZm8jqBgjYHuHoqxXQ031q5tWnroDKZcURNWfpz4Q4eIsvl+ksy1NeKY0FbVhX5NVrsOANBp66FLRLzSrkJOXi94c8i2HD2RLwwWOBr9rcNc581ij30dtanT5BKuoiw5sVIYTDjSxejNNQuvLqZwteT5mdyPkZjS63PNGHvX2l7ukF3Ssfjb/NvA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(5660300002)(110136005)(66446008)(122000001)(8936002)(8676002)(2906002)(26005)(6506007)(4326008)(33656002)(478600001)(316002)(54906003)(86362001)(186003)(52536014)(38100700002)(71200400001)(66476007)(64756008)(66556008)(7696005)(83380400001)(66946007)(76116006)(55016002)(9686003)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PpGbeyvU1Ot6PzR12BGskndHi6veJFM8kIkYJaaklsByC2AdTVZFckyMq0uc?=
 =?us-ascii?Q?4K8CHynyQcnevOPuoDTuJZGO7daSK6XDRR/GHQz1oDGwmjCetY9w0ZaYP9Xw?=
 =?us-ascii?Q?oZ4XSPudu70zsfiTOcEtjEG2TsA8q+Fs/L6p3yaNqHnZELro87odGA4T79xz?=
 =?us-ascii?Q?Mg0vnlIp44KLueN1RZncF1hETQKkYvarFVOEzi0hhH89T7rCcJxV8MyaI908?=
 =?us-ascii?Q?OQ56OH8xyscA02hdOjrSO4U020Z4W0oQwSbt7uhehbeAxaRyEClnco8/BMQz?=
 =?us-ascii?Q?2+mqCQT+CXDorRLBk96yEU9CqH+8ATKhRZZJeI18j5k+K4O0ldaobQUbn13M?=
 =?us-ascii?Q?zpcgNnYqD9586wdyn1nfyHC4k/RN05uUF6Q2RP3rEKd+HTKgHPkgAxaOMW1E?=
 =?us-ascii?Q?xI6bkKevIEpeSd6DkGk6hBA9AvI5bU1ifZlJe2mAqutRRM3od0QZdpx6QWVS?=
 =?us-ascii?Q?XnEJSYaWdZNHexVLqpdy0pwkvRMvXkH4d02cUp531J4FeXwpt2Uu+jCzsDbn?=
 =?us-ascii?Q?/xKtHEOxk2nkeoaV1wqM7MrR+VDki8n3sIYf+URDoHnP3JpxIZp947Z3PlFS?=
 =?us-ascii?Q?xZB2kOjKqStjTPDZVSJbiuCWkHtmRcJz7LNeY0r+AoqjjaWx5I8Z4sDhtpz2?=
 =?us-ascii?Q?XqG7oVjiyt2Pr23UcLxknrlEftoHKhTKFxOPgIiNwY4WknqoUTHVC3zj8UGe?=
 =?us-ascii?Q?mHr01iZIshtk6iLYmYyU1BdE5HFHsAm6llxEMXPAS9n4nG5d6YF1axExUS4c?=
 =?us-ascii?Q?dTXFH8+788JRykgccUxt36iKT+45FVB0LLZw0qr6hN38Zrezr97BlU4/5nUG?=
 =?us-ascii?Q?Ikp84gqwpMNSq2tO0jRmemHKkXKmmUvWx/CSBapebZBJa77NzrJGFqIdLzw1?=
 =?us-ascii?Q?2aSxu+iZ2OOIJsZwlCFoWmWTL5c/0Xdx+sIEIpS7xYPow3gC9qsWOpTU2cHu?=
 =?us-ascii?Q?MKi/dpHa3t3LFtko7kPTXLuRoU6IvqEpm3B0I9HYEB27q6gu8RziAGBijCxr?=
 =?us-ascii?Q?iY7+8+Z7Z/QJcaaT4fzSo0Z2/zKvhUHHWqwIcrFJ9hsfmIG78m6cMncUwUYI?=
 =?us-ascii?Q?YlMZjmW6cTevZDsCuCtW7xaW1CWOzy3ZX8SJzY1nhqnAVWRHK7Fz3Okzveb1?=
 =?us-ascii?Q?PGFxL7ixUHY6GlQizcXW+5/K8wEpV9KPpar7pZy3VoQUdirs522A/8BjJOMa?=
 =?us-ascii?Q?+HUg4wg0liGa/Cx5yMI+pwJXw8Q4vg0lCUOLNhVyfQaMDU7M1vZOxkA+Vqhw?=
 =?us-ascii?Q?dtkoXjyC8smy3K5gIVl5HP7kU9xfIms7NX53h9nrvGUwO29crDBdlg6ZMKA9?=
 =?us-ascii?Q?7Ig7AEs5wby5sFGPxOI29Gzf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f3c3d4-7e53-4315-6a6d-08d950d3df5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 07:55:16.2664
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 775alIO3KGyk8sjpEWNkmAcqoikjPFuiJpWgJByNKPn0j1m8mrMVL8xSYSmfi1EXxnqZ98lsvtkkk1RFVxFRkRqmgZ+sD8GoSiRF/I1IPMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5736
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

Gentle ping. Are we happy with this patch? Please let me know.

Regards,
Biju

> Subject: [PATCH v4 04/10] reset: renesas: Add RZ/G2L usbphy control drive=
r
>=20
> Add support for RZ/G2L USBPHY Control driver. It mainly controls reset an=
d
> power down of the USB/PHY.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4:
>  * Incorporated the changes suggested by Philipp
>  * removed *dev pointer, replaced the magic number 0xff
>  * started using of_reset_simple_xlate
>  * Added spinlock for read-modify-writes
>  v3:
>   * New driver. As per Rob's suggestion, Modelled IP as a reset driver,
>     since it mainly controls reset and power down of the PHY.
> ---
>  drivers/reset/Kconfig                   |   7 +
>  drivers/reset/Makefile                  |   1 +
>  drivers/reset/reset-rzg2l-usbphy-ctrl.c | 175 ++++++++++++++++++++++++
>  3 files changed, 183 insertions(+)
>  create mode 100644 drivers/reset/reset-rzg2l-usbphy-ctrl.c
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig index
> 328f70f633eb..ed65ea66987b 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -181,6 +181,13 @@ config RESET_RASPBERRYPI
>  	  interfacing with RPi4's co-processor and model these firmware
>  	  initialization routines as reset lines.
>=20
> +config RESET_RZG2L_USBPHY_CTRL
> +	tristate "Renesas RZ/G2L USBPHY control driver"
> +	depends on ARCH_R9A07G044 || COMPILE_TEST
> +	help
> +	  Support for USBPHY Control found on RZ/G2L family. It mainly
> +	  controls reset and power down of the USB/PHY.
> +
>  config RESET_SCMI
>  	tristate "Reset driver controlled via ARM SCMI interface"
>  	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST diff --git
> a/drivers/reset/Makefile b/drivers/reset/Makefile index
> ea8b8d9ca565..21d46d8869ff 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -25,6 +25,7 @@ obj-$(CONFIG_RESET_PISTACHIO) +=3D reset-pistachio.o
>  obj-$(CONFIG_RESET_QCOM_AOSS) +=3D reset-qcom-aoss.o
>  obj-$(CONFIG_RESET_QCOM_PDC) +=3D reset-qcom-pdc.o
>  obj-$(CONFIG_RESET_RASPBERRYPI) +=3D reset-raspberrypi.o
> +obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) +=3D reset-rzg2l-usbphy-ctrl.o
>  obj-$(CONFIG_RESET_SCMI) +=3D reset-scmi.o
>  obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
>  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o diff --git
> a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-
> usbphy-ctrl.c
> new file mode 100644
> index 000000000000..e0704fd2b533
> --- /dev/null
> +++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
> @@ -0,0 +1,175 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/G2L USBPHY control driver
> + *
> + * Copyright (C) 2021 Renesas Electronics Corporation  */
> +
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/reset-controller.h>
> +
> +#define RESET			0x000
> +
> +#define RESET_SEL_PLLRESET	BIT(12)
> +#define RESET_PLLRESET		BIT(8)
> +
> +#define RESET_SEL_P2RESET	BIT(5)
> +#define RESET_SEL_P1RESET	BIT(4)
> +#define RESET_PHYRST_2		BIT(1)
> +#define RESET_PHYRST_1		BIT(0)
> +
> +#define PHY_RESET_PORT2		(RESET_SEL_P2RESET | RESET_PHYRST_2)
> +#define PHY_RESET_PORT1		(RESET_SEL_P1RESET | RESET_PHYRST_1)
> +
> +#define NUM_PORTS		2
> +
> +struct rzg2l_usbphy_ctrl_priv {
> +	struct reset_controller_dev rcdev;
> +	struct reset_control *rstc;
> +	void __iomem *base;
> +
> +	spinlock_t lock;
> +};
> +
> +#define rcdev_to_priv(x)	container_of(x, struct
> rzg2l_usbphy_ctrl_priv, rcdev)
> +
> +static int rzg2l_usbphy_ctrl_assert(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	struct rzg2l_usbphy_ctrl_priv *priv =3D rcdev_to_priv(rcdev);
> +	u32 port_mask =3D PHY_RESET_PORT1 | PHY_RESET_PORT2;
> +	void __iomem *base =3D priv->base;
> +	unsigned long flags;
> +	u32 val;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	val =3D readl(base + RESET);
> +	val |=3D id ? PHY_RESET_PORT2 : PHY_RESET_PORT1;
> +	if (port_mask =3D=3D (val & port_mask))
> +		val |=3D RESET_PLLRESET;
> +	writel(val, base + RESET);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int rzg2l_usbphy_ctrl_deassert(struct reset_controller_dev *rcdev=
,
> +				      unsigned long id)
> +{
> +	struct rzg2l_usbphy_ctrl_priv *priv =3D rcdev_to_priv(rcdev);
> +	void __iomem *base =3D priv->base;
> +	unsigned long flags;
> +	u32 val;
> +
> +	spin_lock_irqsave(&priv->lock, flags);
> +	val =3D readl(base + RESET);
> +
> +	val |=3D RESET_SEL_PLLRESET;
> +	val &=3D ~(RESET_PLLRESET | (id ? PHY_RESET_PORT2 : PHY_RESET_PORT1));
> +	writel(val, base + RESET);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
> +				    unsigned long id)
> +{
> +	struct rzg2l_usbphy_ctrl_priv *priv =3D rcdev_to_priv(rcdev);
> +	u32 port_mask;
> +
> +	port_mask =3D id ? PHY_RESET_PORT2 : PHY_RESET_PORT1;
> +
> +	return !!(readl(priv->base + RESET) & port_mask); }
> +
> +static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] =3D {
> +	{ .compatible =3D "renesas,rzg2l-usbphy-ctrl" },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
> +
> +static const struct reset_control_ops rzg2l_usbphy_ctrl_reset_ops =3D {
> +	.assert =3D rzg2l_usbphy_ctrl_assert,
> +	.deassert =3D rzg2l_usbphy_ctrl_deassert,
> +	.status =3D rzg2l_usbphy_ctrl_status,
> +};
> +
> +static int rzg2l_usbphy_ctrl_probe(struct platform_device *pdev) {
> +	struct device *dev =3D &pdev->dev;
> +	struct rzg2l_usbphy_ctrl_priv *priv;
> +	unsigned long flags;
> +	int error;
> +	u32 val;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	priv->rstc =3D devm_reset_control_get_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(priv->rstc))
> +		return dev_err_probe(dev, PTR_ERR(priv->rstc),
> +				     "failed to get reset\n");
> +
> +	reset_control_deassert(priv->rstc);
> +
> +	priv->rcdev.ops =3D &rzg2l_usbphy_ctrl_reset_ops;
> +	priv->rcdev.of_reset_n_cells =3D 1;
> +	priv->rcdev.nr_resets =3D NUM_PORTS;
> +	priv->rcdev.of_node =3D dev->of_node;
> +	priv->rcdev.dev =3D dev;
> +
> +	error =3D devm_reset_controller_register(dev, &priv->rcdev);
> +	if (error)
> +		return error;
> +
> +	spin_lock_init(&priv->lock);
> +	dev_set_drvdata(dev, priv);
> +
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_resume_and_get(&pdev->dev);
> +
> +	/* put pll and phy into reset state */
> +	spin_lock_irqsave(&priv->lock, flags);
> +	val =3D readl(priv->base + RESET);
> +	val |=3D RESET_SEL_PLLRESET | RESET_PLLRESET | PHY_RESET_PORT2 |
> PHY_RESET_PORT1;
> +	writel(val, priv->base + RESET);
> +	spin_unlock_irqrestore(&priv->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int rzg2l_usbphy_ctrl_remove(struct platform_device *pdev) {
> +	struct rzg2l_usbphy_ctrl_priv *priv =3D dev_get_drvdata(&pdev->dev);
> +
> +	pm_runtime_put(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
> +	reset_control_assert(priv->rstc);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver rzg2l_usbphy_ctrl_driver =3D {
> +	.driver =3D {
> +		.name		=3D "rzg2l_usbphy_ctrl",
> +		.of_match_table	=3D rzg2l_usbphy_ctrl_match_table,
> +	},
> +	.probe	=3D rzg2l_usbphy_ctrl_probe,
> +	.remove	=3D rzg2l_usbphy_ctrl_remove,
> +};
> +module_platform_driver(rzg2l_usbphy_ctrl_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Renesas RZ/G2L USBPHY Control");
> +MODULE_AUTHOR("biju.das.jz@bp.renesas.com>");
> --
> 2.17.1

