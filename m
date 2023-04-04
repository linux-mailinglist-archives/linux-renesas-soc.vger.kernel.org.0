Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6D406D5892
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 08:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233757AbjDDGQL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 02:16:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233700AbjDDGQG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 02:16:06 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 795BF1FE1;
        Mon,  3 Apr 2023 23:15:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXKhqM6h5ZOC8LvMx8KEm3TRot7bcdhDMPlqvHYTpCqOJZ992qcTLJuxbDqy2z0eI7Y+golYiM3TuMFoTmDmY81nJ9hzBib5uGb8OB3u+lYnM+9n/eSBcGw8ehkpJVUzYLqbgtgDJ+7B69LJ3PVYXUch+wQH0UqspeOjICgd+oASLgtUOARkBkzH5E4Xb6IvJbZiyBnOvJtuUWwtAxWAZtrEd6+kQRMe0saZxxHCnCWK5bZIigzN8SSS3U3C+PkbKHeW+A/KmQWLdTNqBEIf7bO+lCn3pF20QH45hid+TwvXOOHHo1ylVrEvH0NjUOVey+oZCQq7153MHFmBza0L0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DesxjzwarJsW3IHGGS60qGQ5b/QynCetTPx0K6QwIng=;
 b=EeVbfEjJKUh7rLno3okVU7BbHM4fBj+akk05WJj07HLj52ljdVZhOX9jrtjh76B5ZoeFxaPNcirWCu5c9n8m8KohvgOG0wrDssmueXP5XIKcyzxc2pjboUfJ2q6Kwh7/2vAPxs6qKPG0M6SphsJOcRjrxTsJJ8xS70C0KUEtQtyOciecpw31COklSQaHKpxo7TArCFsJNMPiJ7oJiQ70vmhNR0Nvrh515xMwn6aAT8TDNc7eWFzgmJ0KSF2Ky+ft+io1XUEsAzEpRCCoqvP753oEmYytZ7bqyeMspLE7BU61FssPtkMPAGouyodroiKnyKsZqYC8E7c9c0zxk6oGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DesxjzwarJsW3IHGGS60qGQ5b/QynCetTPx0K6QwIng=;
 b=qQTMqQ1PMLEKsPYnm4/9yANeZ7uVg7+ihgF8Uz+AtrFR5zv5i4NM4J+L6bZknXW/Hhuf6M+GeMUkhMVFm1ftz4Yg9FQrTtJ/1ahO2+MP6glBETrf/kIL9XsE7KeXbX6BdfZb6rPFnSYXqUE0aVa2OiKIF+fQZebm59dVK73tLv4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8257.jpnprd01.prod.outlook.com (2603:1096:604:174::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 06:15:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::e521:994c:bb0e:9bf6%8]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 06:15:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/3] drivers: clk: Add support for versa3 clock driver
Thread-Topic: [PATCH v3 2/3] drivers: clk: Add support for versa3 clock driver
Thread-Index: AQHZZhewe6BIP2rGt02XrsnePlj1Xq8arLWA
Date:   Tue, 4 Apr 2023 06:15:23 +0000
Message-ID: <OS0PR01MB59227BC478470683EFA82D9686939@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230403103257.328954-1-biju.das.jz@bp.renesas.com>
 <20230403103257.328954-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230403103257.328954-3-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8257:EE_
x-ms-office365-filtering-correlation-id: 22fb85d2-aed2-4aef-b554-08db34d3f9e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +VDkTbipcma4IYWolf2NLfky8GS/x75rE4MnoTiKGVk8PvsMA19mGhjHYgfQWr5GIFPJGz5FjmmDQ9/lcQqJ51CZyMJJVcam3mpGbkj78YSOaTJkNylQhDKVj12342X+kxbeKzr2bEXaL2O1KC+Kf6iL0XK+kIq6XqyltL+PVYgdIsGu40rp4ukdNG+uZHot30AQyRDs4vZeV+YOFc6d4+b6Zzq6hnGjAO7lWFs9yVQjr4HVZQXE48o9wBHXpr7cGCIK7Jp3LPzCTwKrepNucy2QryqPaX9ARP77hB1y0fYXLtgsxLDT0QeUvh8S95ORWZxY6wFW5YgBF8wyOCzNIW+kRIlASKA5NMZS4masqA6Y+sV5vNcnfv3laDy9h2ZYYl8td08jwEEaHHEXs/bQ4gHfMFYvldf1k9pNWYRl1D78xSBrZExFxBvq2nt+7kW4eHOy6DKYVDccZhOFu5Rda8zPYNNQUaeX2nu7fVEY73agW33/3OIWEKW3J50uZti2ECg2lXqH0PZ/WM31VQtMSxayoTUKeU7rMPQa/y+W2VUzD5A5HMNb1Fr+fiMtKDG2aY1RlWZOnM+0+5aTURo14ZtSS6WZJczG8jbluLCapfQTCrSXwoaYYEODbx1E2TaD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199021)(52536014)(55016003)(19627235002)(478600001)(66946007)(66446008)(76116006)(66556008)(64756008)(41300700001)(66476007)(8676002)(316002)(110136005)(54906003)(122000001)(8936002)(30864003)(4326008)(5660300002)(38100700002)(53546011)(186003)(83380400001)(71200400001)(7696005)(6506007)(26005)(9686003)(86362001)(33656002)(38070700005)(2906002)(559001)(579004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?liNZ93aapvYMnfzz+gQy/VZe543lmWgp5qV8KIAbhtKc+TK1g6bg2doyziUB?=
 =?us-ascii?Q?MFOy7FJb5M3nO8ecAJmjZEHMu3wR8XDlYiTVemTBsMb0Q4w3NoOm0C0w+zv/?=
 =?us-ascii?Q?vDFOCLQRLFZh8qj7l2vu9V9VxDW+tQXLQNQP34ETgxt3r5hMJFOtI2dLasKA?=
 =?us-ascii?Q?Ikch0fGf02+M7FeQ1owuexBuYWR5npfgsvrVjo9MUrH2ESEYhHPFlBzIqNaH?=
 =?us-ascii?Q?cZVEfS0ZB21Hld7pucy2Cwv5TQz+PxTUv3U0qCA/sr5Y/HJrkB6Jd4FFWKIm?=
 =?us-ascii?Q?l12gXxOEeriRsaFl/OEyeGfzNhQ8oOlu6y6VPnSZYHzmmz3zk+wCLn+1hx3r?=
 =?us-ascii?Q?t4IA8BoZKMnFZ/dkhL9GaDloXe/1pwnY/MxfXb1efJoOTycB4r2/OzrZoyF9?=
 =?us-ascii?Q?7r72cuX50UGUWvEpueJGTVN455knjUwzQeUCHEshb7+T8lAeD5FuNdRFoJ5W?=
 =?us-ascii?Q?wbBObUAL228P5A/EZJEtT4sRN3WMYcHyQ39rRyzUVmM261PFUMpc2Czk8Mf0?=
 =?us-ascii?Q?jjRocWESzMVqZArN7cKQM7OKgnel/hNbyiMM7+/5RlKSxzikAw7bu1oOsX02?=
 =?us-ascii?Q?MIfvKissXJc8PFEJR2sLT5EoyQklTuPsZMeyXPDV6t1ziiKwhESTKkd4BMg5?=
 =?us-ascii?Q?EtsYVR7Z6pEsgMt87HSJymYjX48oPPXK0crlIzoHRqyY8I/h3eMqmRoFvTbH?=
 =?us-ascii?Q?mgEv/cN2LhLIlm7wWkXVM8ActbfoU+9tVPKVOrkT95eKn1pjxUmPFYNPcakK?=
 =?us-ascii?Q?92Att/0moO1p5km/jg8maRNG3nOcngQXHfVxulRVF6h29ZQL6uLEeh/8DKUW?=
 =?us-ascii?Q?zfZPFYKpY1xozjjcFmg7FSDZ3mLV++X5K91s/pmE3fQd2F1Nb1Jv2VSymELg?=
 =?us-ascii?Q?3crq6ovRJHYtgvAEQXrUYVmjkSbaYw31j36DSCn4NMV9gNCc6Uq6oEd8kiYO?=
 =?us-ascii?Q?nPo92ETqRbAssV7PNFHzPQTU0uuDYbAOBCTkWXVZr0ScYsJkC/X8nKg4VNiS?=
 =?us-ascii?Q?UFxFRG4Pz8W083hPRbCtiutS0+4KYctj5LYZi46a+lq0eCOl6dTJl61w3Ves?=
 =?us-ascii?Q?x9AFl0tEO75n2hLaNrQJu3WIXUuudqj3r3XKIGRVUJmO94KWy0hxWuDeRg93?=
 =?us-ascii?Q?aGXgzIqR5n+qfQ9f2JE6O7HWk0MksOdS175E/aI0ZCof0f2BZW6tgxDUmtpM?=
 =?us-ascii?Q?pRPSuDXWOtgREyp3KgnVG+RDM8PLt89GJApv90Qya1DXWcmd6qC2sgaZ2OAC?=
 =?us-ascii?Q?sLCyY1dIU4+njFtoEJXEeFg2lKH1q/xTMBzgvZ0uwEI+u8NYTDj0RGi2cBkN?=
 =?us-ascii?Q?nZMYUf6fyWMxz+X7K6IqFF0yDd3Hnp84hdJrRI9QOYO0hnmQTPEA0PJUYt3k?=
 =?us-ascii?Q?unT2v+PgBlbGarkWmaNUHmuDi6GJIgNh4bzmVCfPrIiDUMjhs83FD3fSWXUD?=
 =?us-ascii?Q?89vLkKXLZx5oPNPSaosHJ3oeqejqWFsLAmI+4lGsnO2IV30xQc7cnlYIwRb8?=
 =?us-ascii?Q?AkmfkkFRNFYfwM5qwjAr4hNEDdR0y6WKd+ac+hvD2ZzNRofedKGmZeMlANcw?=
 =?us-ascii?Q?t/SGRcFkaoObLy3QiM9R7IUvRzx8MWop4SWblnvB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fb85d2-aed2-4aef-b554-08db34d3f9e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 06:15:23.7840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xmqUl8rIfqhnPAC2bYdKNfEAS7vEvKTLUxkMbzDfuxr7EWG8iyB7iMNLiZ/HgJ+NHsGhCsa+yezUQxDe2Re0r8BYlwq1DoFxQPbkxGUYddA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8257
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi all,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Monday, April 3, 2023 11:33 AM
> To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; linux-clk@vger.kernel.org; Gee=
rt
> Uytterhoeven <geert+renesas@glider.be>; Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>; linux-renesas-soc@vger.kernel.=
org
> Subject: [PATCH v3 2/3] drivers: clk: Add support for versa3 clock driver
>=20
> Add support for Renesas versa3 clock driver(5p35023).
> The clock generator provides 6 output clocks.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Updated copy right information.
>  * Removed .name from parent data and started using index or struct clk_h=
w.
>  * Dropped vc3_clk_out_ops  and started using fixed factor clocks for
>    output clk.
>  * Dropped vc3_divider_type_parse_dt function.
>  * Dropped struct vc3_driver_data
> RFC->v2:
>  * Dropped header file <linux/clk.h> and removed all
>    consumer api's
>  * struct clk_parent_data used for assigning the parent names.
>  * Replaced initpointer->const init pointer in vc3_clk_register
>  * Replaced of_clk_add_hw_provider with devm_clk_add_hw_provider
>  * Dropped vc3_remove() callback.
> ---
>  drivers/clk/Kconfig           |    9 +
>  drivers/clk/Makefile          |    1 +
>  drivers/clk/clk-versaclock3.c | 1137 +++++++++++++++++++++++++++++++++
>  3 files changed, 1147 insertions(+)
>  create mode 100644 drivers/clk/clk-versaclock3.c
>=20
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig index
> 016814e15536..73f2ef11ffd5 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -385,6 +385,15 @@ config COMMON_CLK_SI521XX
>  	  This driver supports the SkyWorks Si521xx PCIe clock generator
>  	  models Si52144/Si52146/Si52147.
>=20
> +config COMMON_CLK_VC3
> +	tristate "Clock driver for Renesas VersaClock 3 devices"
> +	depends on I2C
> +	depends on OF
> +	select REGMAP_I2C
> +	help
> +	  This driver supports the Renesas VersaClock 3 programmable clock
> +	  generators.
> +
>  config COMMON_CLK_VC5
>  	tristate "Clock driver for IDT VersaClock 5,6 devices"
>  	depends on I2C
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile index
> 9b7a414b5614..3b27a97b66f6 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -76,6 +76,7 @@ obj-$(CONFIG_CLK_TWL6040)		+=3D clk-twl6040.o
>  obj-$(CONFIG_ARCH_VT8500)		+=3D clk-vt8500.o
>  obj-$(CONFIG_COMMON_CLK_RS9_PCIE)	+=3D clk-renesas-pcie.o
>  obj-$(CONFIG_COMMON_CLK_SI521XX)	+=3D clk-si521xx.o
> +obj-$(CONFIG_COMMON_CLK_VC3)		+=3D clk-versaclock3.o
>  obj-$(CONFIG_COMMON_CLK_VC5)		+=3D clk-versaclock5.o
>  obj-$(CONFIG_COMMON_CLK_VC7)		+=3D clk-versaclock7.o
>  obj-$(CONFIG_COMMON_CLK_WM831X)		+=3D clk-wm831x.o
> diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.=
c
> new file mode 100644 index 000000000000..f2580383229f
> --- /dev/null
> +++ b/drivers/clk/clk-versaclock3.c
> @@ -0,0 +1,1137 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for Renesas Versaclock 3
> + *
> + * Copyright (C) 2023 Renesas Electronics Corp.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/i2c.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +
> +#define NUM_CONFIG_REGISTERS		37
> +
> +#define VC3_GENERAL_CTR			0x0
> +#define VC3_GENERAL_CTR_DIV1_SRC_SEL	BIT(3)
> +#define VC3_GENERAL_CTR_PLL3_REFIN_SEL	BIT(2)
> +
> +#define VC3_PLL3_M_DIVIDER		0x3
> +#define VC3_PLL3_M_DIV1			BIT(7)
> +#define VC3_PLL3_M_DIV2			BIT(6)
> +#define VC3_PLL3_M_DIV(n)		((n) & GENMASK(5, 0))
> +
> +#define VC3_PLL3_N_DIVIDER		0x4
> +#define VC3_PLL3_LOOP_FILTER_N_DIV_MSB	0x5
> +
> +#define VC3_PLL3_CHARGE_PUMP_CTRL	0x6
> +#define VC3_PLL3_CHARGE_PUMP_CTRL_OUTDIV3_SRC_SEL	BIT(7)
> +
> +#define VC3_PLL1_CTRL_OUTDIV5		0x7
> +#define VC3_PLL1_CTRL_OUTDIV5_PLL1_MDIV_DOUBLER		BIT(7)
> +
> +#define VC3_PLL1_M_DIVIDER		0x8
> +#define VC3_PLL1_M_DIV1			BIT(7)
> +#define VC3_PLL1_M_DIV2			BIT(6)
> +#define VC3_PLL1_M_DIV(n)		((n) & GENMASK(5, 0))
> +
> +#define VC3_PLL1_VCO_N_DIVIDER		0x9
> +#define VC3_PLL1_LOOP_FILTER_N_DIV_MSB	0x0a
> +
> +#define VC3_OUT_DIV1_DIV2_CTRL		0xf
> +
> +#define VC3_PLL2_FB_INT_DIV_MSB		0x10
> +#define VC3_PLL2_FB_INT_DIV_LSB		0x11
> +#define VC3_PLL2_FB_FRC_DIV_MSB		0x12
> +#define VC3_PLL2_FB_FRC_DIV_LSB		0x13
> +
> +#define VC3_PLL2_M_DIVIDER		0x1a
> +#define VC3_PLL2_MDIV_DOUBLER		BIT(7)
> +#define VC3_PLL2_M_DIV1			BIT(6)
> +#define VC3_PLL2_M_DIV2			BIT(5)
> +#define VC3_PLL2_M_DIV(n)		((n) & GENMASK(4, 0))
> +
> +#define VC3_OUT_DIV3_DIV4_CTRL		0x1b
> +
> +#define VC3_PLL_OP_CTRL			0x1c
> +#define VC3_PLL_OP_CTRL_PLL2_REFIN_SEL	6
> +
> +#define VC3_OUTPUT_CTR			0x1d
> +#define VC3_OUTPUT_CTR_DIV4_SRC_SEL	BIT(3)
> +
> +#define VC3_SE2_CTRL_REG0		0x1f
> +#define VC3_SE2_CTRL_REG0_SE2_CLK_SEL	BIT(6)
> +
> +#define VC3_SE3_DIFF1_CTRL_REG		0x21
> +#define VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL	BIT(6)
> +
> +#define VC3_DIFF1_CTRL_REG		0x22
> +#define VC3_DIFF1_CTRL_REG_DIFF1_CLK_SEL	BIT(7)
> +
> +#define VC3_DIFF2_CTRL_REG		0x23
> +#define VC3_DIFF2_CTRL_REG_DIFF2_CLK_SEL	BIT(7)
> +
> +#define VC3_SE1_DIV4_CTRL		0x24
> +#define VC3_SE1_DIV4_CTRL_SE1_CLK_SEL	BIT(3)
> +
> +#define VC3_PLL1_VCO_MIN		300000000UL
> +#define VC3_PLL1_VCO_MAX		600000000UL
> +
> +#define VC3_PLL2_VCO_MIN		400000000UL
> +#define VC3_PLL2_VCO_MAX		1200000000UL
> +
> +#define VC3_PLL3_VCO_MIN		300000000UL
> +#define VC3_PLL3_VCO_MAX		800000000UL
> +
> +#define VC3_2_POW_16			(U16_MAX + 1)
> +#define VC3_DIV_MASK(width)		((1 << (width)) - 1)
> +
> +enum vc3_pfd_mux {
> +	VC3_PFD2_MUX,
> +	VC3_PFD3_MUX,
> +};
> +
> +enum vc3_pfd {
> +	VC3_PFD1,
> +	VC3_PFD2,
> +	VC3_PFD3,
> +};
> +
> +enum vc3_pll {
> +	VC3_PLL1,
> +	VC3_PLL2,
> +	VC3_PLL3,
> +};
> +
> +enum vc3_div_mux {
> +	VC3_DIV1_MUX,
> +	VC3_DIV3_MUX,
> +	VC3_DIV4_MUX,
> +};
> +
> +enum vc3_div {
> +	VC3_DIV1,
> +	VC3_DIV2,
> +	VC3_DIV3,
> +	VC3_DIV4,
> +	VC3_DIV5,
> +};
> +
> +enum vc3_clk_mux {
> +	VC3_DIFF2_MUX,
> +	VC3_DIFF1_MUX,
> +	VC3_SE3_MUX,
> +	VC3_SE2_MUX,
> +	VC3_SE1_MUX,
> +};
> +
> +enum vc3_clk {
> +	VC3_DIFF2,
> +	VC3_DIFF1,
> +	VC3_SE3,
> +	VC3_SE2,
> +	VC3_SE1,
> +	VC3_REF,
> +};
> +
> +struct vc3_clk_data {
> +	u8 offs;
> +	u8 bitmsk;
> +};
> +
> +struct vc3_pfd_data {
> +	u8 num;
> +	u8 offs;
> +	u8 mdiv1_bitmsk;
> +	u8 mdiv2_bitmsk;
> +};
> +
> +struct vc3_pll_data {
> +	u8 num;
> +	u8 int_div_msb_offs;
> +	u8 int_div_lsb_offs;
> +	unsigned long vco_min;
> +	unsigned long vco_max;
> +};
> +
> +struct vc3_div_data {
> +	u8 offs;
> +	const struct clk_div_table *table;
> +	u8 shift;
> +	u8 width;
> +	u8 flags;
> +};
> +
> +struct vc3_hw_data {
> +	struct clk_hw hw;
> +	struct regmap *regmap;
> +	const void *data;
> +
> +	u32 div_int;
> +	u32 div_frc;
> +};
> +
> +static const struct clk_div_table div1_divs[] =3D {
> +	{ .val =3D 0, .div =3D 1, }, { .val =3D 1, .div =3D 4, },
> +	{ .val =3D 2, .div =3D 5, }, { .val =3D 3, .div =3D 6, },
> +	{ .val =3D 4, .div =3D 2, }, { .val =3D 5, .div =3D 8, },
> +	{ .val =3D 6, .div =3D 10, }, { .val =3D 7, .div =3D 12, },
> +	{ .val =3D 8, .div =3D 4, }, { .val =3D 9, .div =3D 16, },
> +	{ .val =3D 10, .div =3D 20, }, { .val =3D 11, .div =3D 24, },
> +	{ .val =3D 12, .div =3D 8, }, { .val =3D 13, .div =3D 32, },
> +	{ .val =3D 14, .div =3D 40, }, { .val =3D 15, .div =3D 48, },
> +	{}
> +};
> +
> +static const struct clk_div_table div245_divs[] =3D {
> +	{ .val =3D 0, .div =3D 1, }, { .val =3D 1, .div =3D 3, },
> +	{ .val =3D 2, .div =3D 5, }, { .val =3D 3, .div =3D 10, },
> +	{ .val =3D 4, .div =3D 2, }, { .val =3D 5, .div =3D 6, },
> +	{ .val =3D 6, .div =3D 10, }, { .val =3D 7, .div =3D 20, },
> +	{ .val =3D 8, .div =3D 4, }, { .val =3D 9, .div =3D 12, },
> +	{ .val =3D 10, .div =3D 20, }, { .val =3D 11, .div =3D 40, },
> +	{ .val =3D 12, .div =3D 5, }, { .val =3D 13, .div =3D 15, },
> +	{ .val =3D 14, .div =3D 25, }, { .val =3D 15, .div =3D 50, },
> +	{}
> +};
> +
> +static const struct clk_div_table div3_divs[] =3D {
> +	{ .val =3D 0, .div =3D 1, }, { .val =3D 1, .div =3D 3, },
> +	{ .val =3D 2, .div =3D 5, }, { .val =3D 3, .div =3D 10, },
> +	{ .val =3D 4, .div =3D 2, }, { .val =3D 5, .div =3D 6, },
> +	{ .val =3D 6, .div =3D 10, }, { .val =3D 7, .div =3D 20, },
> +	{ .val =3D 8, .div =3D 4, }, { .val =3D 9, .div =3D 12, },
> +	{ .val =3D 10, .div =3D 20, }, { .val =3D 11, .div =3D 40, },
> +	{ .val =3D 12, .div =3D 8, }, { .val =3D 13, .div =3D 24, },
> +	{ .val =3D 14, .div =3D 40, }, { .val =3D 15, .div =3D 80, },
> +	{}
> +};
> +
> +static struct clk_hw *clk_out[6];
> +
> +static unsigned char vc3_pfd_mux_get_parent(struct clk_hw *hw) {
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_clk_data *pfd_mux =3D vc3->data;
> +	u32 src;
> +
> +	regmap_read(vc3->regmap, pfd_mux->offs, &src);
> +
> +	return !!(src & pfd_mux->bitmsk);
> +}
> +
> +static int vc3_pfd_mux_set_parent(struct clk_hw *hw, u8 index) {
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_clk_data *pfd_mux =3D vc3->data;
> +
> +	regmap_update_bits(vc3->regmap, pfd_mux->offs, pfd_mux->bitmsk,
> +			   index ? pfd_mux->bitmsk : 0);
> +	return 0;
> +}
> +
> +static const struct clk_ops vc3_pfd_mux_ops =3D {
> +	.set_parent =3D vc3_pfd_mux_set_parent,
> +	.get_parent =3D vc3_pfd_mux_get_parent,
> +};
> +
> +static unsigned long vc3_pfd_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_pfd_data *pfd =3D vc3->data;
> +	unsigned int prediv, premul;
> +	unsigned long rate;
> +	u8 mdiv;
> +
> +	regmap_read(vc3->regmap, pfd->offs, &prediv);
> +	if (pfd->num =3D=3D VC3_PFD1) {
> +		/* The bypass_prediv is set, PLL fed from Ref_in directly. */
> +		if (prediv & pfd->mdiv1_bitmsk) {
> +			/* check doubler is set or not */
> +			regmap_read(vc3->regmap, VC3_PLL1_CTRL_OUTDIV5, &premul);
> +			if (premul & VC3_PLL1_CTRL_OUTDIV5_PLL1_MDIV_DOUBLER)
> +				parent_rate *=3D 2;
> +			return parent_rate;
> +		}
> +		mdiv =3D VC3_PLL1_M_DIV(prediv);
> +	} else if (pfd->num =3D=3D VC3_PFD2) {
> +		/* The bypass_prediv is set, PLL fed from Ref_in directly. */
> +		if (prediv & pfd->mdiv1_bitmsk) {
> +			/* check doubler is set or not */
> +			if (premul & VC3_PLL2_MDIV_DOUBLER)
> +				parent_rate *=3D 2;
> +			return parent_rate;
> +		}
> +
> +		mdiv =3D VC3_PLL2_M_DIV(prediv);
> +	} else {
> +		/* The bypass_prediv is set, PLL fed from Ref_in directly. */
> +		if (prediv & pfd->mdiv1_bitmsk)
> +			return parent_rate;
> +
> +		mdiv =3D VC3_PLL3_M_DIV(prediv);
> +	}
> +
> +	if (prediv & pfd->mdiv2_bitmsk)
> +		rate =3D parent_rate / 2;
> +	else
> +		rate =3D parent_rate / mdiv;
> +
> +	return rate;
> +}
> +
> +static long vc3_pfd_round_rate(struct clk_hw *hw, unsigned long rate,
> +			       unsigned long *parent_rate)
> +{
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_pfd_data *pfd =3D vc3->data;
> +	unsigned long idiv;
> +
> +	/* PLL cannot operate with input clock above 50 MHz. */
> +	if (rate > 50000000)
> +		return -EINVAL;
> +
> +	/* CLKIN within range of PLL input, feed directly to PLL. */
> +	if (*parent_rate <=3D 50000000)
> +		return *parent_rate;
> +
> +	idiv =3D DIV_ROUND_UP(*parent_rate, rate);
> +	if (pfd->num =3D=3D VC3_PFD1 || pfd->num =3D=3D VC3_PFD3) {
> +		if (idiv > 63)
> +			return -EINVAL;
> +	} else {
> +		if (idiv > 31)
> +			return -EINVAL;
> +	}
> +
> +	return *parent_rate / idiv;
> +}
> +
> +static int vc3_pfd_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_pfd_data *pfd =3D vc3->data;
> +	unsigned long idiv;
> +	u8 div;
> +
> +	/* CLKIN within range of PLL input, feed directly to PLL. */
> +	if (parent_rate <=3D 50000000) {
> +		regmap_update_bits(vc3->regmap, pfd->offs, pfd->mdiv1_bitmsk,
> +				   pfd->mdiv1_bitmsk);
> +		regmap_update_bits(vc3->regmap, pfd->offs, pfd->mdiv2_bitmsk,
> 0);
> +		return 0;
> +	}
> +
> +	idiv =3D DIV_ROUND_UP(parent_rate, rate);
> +	/* We have dedicated div-2 predivider. */
> +	if (idiv =3D=3D 2) {
> +		regmap_update_bits(vc3->regmap, pfd->offs, pfd->mdiv2_bitmsk,
> +				   pfd->mdiv2_bitmsk);
> +		regmap_update_bits(vc3->regmap, pfd->offs, pfd->mdiv1_bitmsk,
> 0);
> +	} else {
> +		if (pfd->num =3D=3D VC3_PFD1)
> +			div =3D VC3_PLL1_M_DIV(idiv);
> +		else if (pfd->num =3D=3D VC3_PFD2)
> +			div =3D VC3_PLL2_M_DIV(idiv);
> +		else
> +			div =3D VC3_PLL3_M_DIV(idiv);
> +
> +		regmap_write(vc3->regmap, pfd->offs, div);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops vc3_pfd_ops =3D {
> +	.recalc_rate =3D vc3_pfd_recalc_rate,
> +	.round_rate =3D vc3_pfd_round_rate,
> +	.set_rate =3D vc3_pfd_set_rate,
> +};
> +
> +static unsigned long vc3_pll_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_pll_data *pll =3D vc3->data;
> +	u32 div_int, div_frc, val;
> +	unsigned long rate;
> +
> +	regmap_read(vc3->regmap, pll->int_div_msb_offs, &val);
> +	div_int =3D (val & GENMASK(2, 0)) << 8;
> +	regmap_read(vc3->regmap, pll->int_div_lsb_offs, &val);
> +	div_int |=3D val;
> +
> +	if (pll->num =3D=3D VC3_PLL2) {
> +		regmap_read(vc3->regmap, VC3_PLL2_FB_FRC_DIV_MSB, &val);
> +		div_frc =3D val << 8;
> +		regmap_read(vc3->regmap, VC3_PLL2_FB_FRC_DIV_LSB, &val);
> +		div_frc |=3D val;
> +		rate =3D (parent_rate *
> +			(div_int * VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
> +	} else {
> +		rate =3D parent_rate * div_int;
> +	}
> +
> +	return rate;
> +}
> +
> +static long vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> +			       unsigned long *parent_rate)
> +{
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_pll_data *pll =3D vc3->data;
> +	u64 div_frc;
> +
> +	if (rate < pll->vco_min)
> +		rate =3D pll->vco_min;
> +	if (rate > pll->vco_max)
> +		rate =3D pll->vco_max;
> +
> +	vc3->div_int =3D rate / *parent_rate;
> +
> +	if (pll->num =3D=3D VC3_PLL2) {
> +		if (vc3->div_int > 0x7ff)
> +			rate =3D *parent_rate * 0x7ff;
> +
> +		/* Determine best fractional part, which is 16 bit wide */
> +		div_frc =3D rate % *parent_rate;
> +		div_frc *=3D BIT(16) - 1;
> +		do_div(div_frc, *parent_rate);
> +
> +		vc3->div_frc =3D (u32)div_frc;
> +		rate =3D (*parent_rate *
> +			(vc3->div_int * VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
> +	} else {
> +		rate =3D *parent_rate * vc3->div_int;
> +	}
> +
> +	return rate;
> +}
> +
> +static int vc3_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_pll_data *pll =3D vc3->data;
> +	u32 val;
> +
> +	regmap_read(vc3->regmap, pll->int_div_msb_offs, &val);
> +	val =3D (val & 0xf8) | ((vc3->div_int >> 8) & 0x7);
> +	regmap_write(vc3->regmap, pll->int_div_msb_offs, val);
> +	regmap_write(vc3->regmap, pll->int_div_lsb_offs, vc3->div_int & 0xff);
> +
> +	if (pll->num =3D=3D VC3_PLL2) {
> +		regmap_write(vc3->regmap, VC3_PLL2_FB_FRC_DIV_MSB,
> +			     vc3->div_frc >> 8);
> +		regmap_write(vc3->regmap, VC3_PLL2_FB_FRC_DIV_LSB,
> +			     vc3->div_frc & 0xff);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops vc3_pll_ops =3D {
> +	.recalc_rate =3D vc3_pll_recalc_rate,
> +	.round_rate =3D vc3_pll_round_rate,
> +	.set_rate =3D vc3_pll_set_rate,
> +};
> +
> +static unsigned char vc3_div_mux_get_parent(struct clk_hw *hw) {
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_clk_data *div_mux =3D vc3->data;
> +	u32 src;
> +
> +	regmap_read(vc3->regmap, div_mux->offs, &src);
> +
> +	return !!(src & div_mux->bitmsk);
> +}
> +
> +static int vc3_div_mux_set_parent(struct clk_hw *hw, u8 index) {
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_clk_data *div_mux =3D vc3->data;
> +
> +	regmap_update_bits(vc3->regmap, div_mux->offs, div_mux->bitmsk,
> +			   index ? div_mux->bitmsk : 0);
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops vc3_div_mux_ops =3D {
> +	.set_parent =3D vc3_div_mux_set_parent,
> +	.get_parent =3D vc3_div_mux_get_parent,
> +};
> +
> +static unsigned int vc3_get_div(const struct clk_div_table *table,
> +				unsigned int val, unsigned long flag) {
> +	const struct clk_div_table *clkt;
> +
> +	for (clkt =3D table; clkt->div; clkt++)
> +		if (clkt->val =3D=3D val)
> +			return clkt->div;
> +
> +	return 0;
> +}
> +
> +static unsigned long vc3_div_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_div_data *div_data =3D vc3->data;
> +	unsigned int val;
> +
> +	regmap_read(vc3->regmap, div_data->offs, &val);
> +	val >>=3D div_data->shift;
> +	val &=3D VC3_DIV_MASK(div_data->width);
> +
> +	return divider_recalc_rate(hw, parent_rate, val, div_data->table,
> +				   div_data->flags, div_data->width); }
> +
> +static long vc3_div_round_rate(struct clk_hw *hw, unsigned long rate,
> +			       unsigned long *parent_rate)
> +{
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_div_data *div_data =3D vc3->data;
> +	unsigned int bestdiv;
> +
> +	/* if read only, just return current value */
> +	if (div_data->flags & CLK_DIVIDER_READ_ONLY) {
> +		regmap_read(vc3->regmap, div_data->offs, &bestdiv);
> +		bestdiv >>=3D div_data->shift;
> +		bestdiv &=3D VC3_DIV_MASK(div_data->width);
> +		bestdiv =3D vc3_get_div(div_data->table, bestdiv, div_data-
> >flags);
> +		return DIV_ROUND_UP(*parent_rate, bestdiv);
> +	}
> +
> +	return divider_round_rate(hw, rate, parent_rate, div_data->table,
> +				  div_data->width, div_data->flags); }
> +
> +static int vc3_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_div_data *div_data =3D vc3->data;
> +	unsigned int value;
> +
> +	value =3D divider_get_val(rate, parent_rate, div_data->table,
> +				div_data->width, div_data->flags);
> +	regmap_update_bits(vc3->regmap, div_data->offs,
> +			   VC3_DIV_MASK(div_data->width) << div_data->shift,
> +			   value << div_data->shift);
> +	return 0;
> +}
> +
> +static const struct clk_ops vc3_div_ops =3D {
> +	.recalc_rate =3D vc3_div_recalc_rate,
> +	.round_rate =3D vc3_div_round_rate,
> +	.set_rate =3D vc3_div_set_rate,
> +};
> +
> +static int vc3_clk_mux_determine_rate(struct clk_hw *hw,
> +				      struct clk_rate_request *req) {
> +	int ret;
> +	int frc;
> +
> +	ret =3D clk_mux_determine_rate_flags(hw, req, CLK_SET_RATE_PARENT);
> +	if (ret) {
> +		if (req->best_parent_rate / req->rate) {
> +			frc =3D DIV_ROUND_CLOSEST_ULL(req->best_parent_rate,
> +						    req->rate);
> +			req->rate *=3D frc;
> +			return clk_mux_determine_rate_flags(hw, req,
> +							    CLK_SET_RATE_PARENT);
> +		}
> +		ret =3D 0;
> +	}
> +
> +	return ret;
> +}
> +
> +static unsigned char vc3_clk_mux_get_parent(struct clk_hw *hw) {
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_clk_data *clk_mux =3D vc3->data;
> +	u32 val;
> +
> +	regmap_read(vc3->regmap, clk_mux->offs, &val);
> +
> +	return !!(val & clk_mux->bitmsk);
> +}
> +
> +static int vc3_clk_mux_set_parent(struct clk_hw *hw, u8 index) {
> +	struct vc3_hw_data *vc3 =3D container_of(hw, struct vc3_hw_data, hw);
> +	const struct vc3_clk_data *clk_mux =3D vc3->data;
> +
> +	regmap_update_bits(vc3->regmap, clk_mux->offs,
> +			   clk_mux->bitmsk, index ? clk_mux->bitmsk : 0);
> +	return 0;
> +}
> +
> +static const struct clk_ops vc3_clk_mux_ops =3D {
> +	.determine_rate =3D vc3_clk_mux_determine_rate,
> +	.set_parent =3D vc3_clk_mux_set_parent,
> +	.get_parent =3D vc3_clk_mux_get_parent,
> +};
> +
> +static bool vc3_regmap_is_writeable(struct device *dev, unsigned int
> +reg) {
> +	return true;
> +}
> +
> +static const struct regmap_config vc3_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.cache_type =3D REGCACHE_RBTREE,
> +	.max_register =3D 0x24,
> +	.writeable_reg =3D vc3_regmap_is_writeable, };
> +
> +static struct vc3_hw_data clk_div[5];
> +
> +static const struct clk_parent_data pfd_mux_parent_data[] =3D {
> +	{ .index =3D 0, },
> +	{ .hw =3D &clk_div[VC3_DIV2].hw }
> +};
> +
> +static struct vc3_hw_data clk_pfd_mux[] =3D {
> +	[VC3_PFD2_MUX] =3D {
> +		.data =3D &(struct vc3_clk_data) {
> +			.offs =3D VC3_PLL_OP_CTRL,
> +			.bitmsk =3D BIT(VC3_PLL_OP_CTRL_PLL2_REFIN_SEL)
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "pfd2_mux",
> +			.ops =3D &vc3_pfd_mux_ops,
> +			.parent_data =3D pfd_mux_parent_data,
> +			.num_parents =3D 2,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_PFD3_MUX] =3D {
> +		.data =3D &(struct vc3_clk_data) {
> +			.offs =3D VC3_GENERAL_CTR,
> +			.bitmsk =3D BIT(VC3_GENERAL_CTR_PLL3_REFIN_SEL)
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "pfd3_mux",
> +			.ops =3D &vc3_pfd_mux_ops,
> +			.parent_data =3D pfd_mux_parent_data,
> +			.num_parents =3D 2,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	}
> +};
> +
> +static struct vc3_hw_data clk_pfd[] =3D {
> +	[VC3_PFD1] =3D {
> +		.data =3D &(struct vc3_pfd_data) {
> +			.num =3D VC3_PFD1,
> +			.offs =3D VC3_PLL1_M_DIVIDER,
> +			.mdiv1_bitmsk =3D VC3_PLL1_M_DIV1,
> +			.mdiv2_bitmsk =3D VC3_PLL1_M_DIV2
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "pfd1",
> +			.ops =3D &vc3_pfd_ops,
> +			.parent_data =3D &(const struct clk_parent_data) {
> +				.index =3D 0
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_PFD2] =3D {
> +		.data =3D &(struct vc3_pfd_data) {
> +			.num =3D VC3_PFD2,
> +			.offs =3D VC3_PLL2_M_DIVIDER,
> +			.mdiv1_bitmsk =3D VC3_PLL2_M_DIV1,
> +			.mdiv2_bitmsk =3D VC3_PLL2_M_DIV2
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "pfd2",
> +			.ops =3D &vc3_pfd_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_pfd_mux[VC3_PFD2_MUX].hw
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_PFD3] =3D {
> +		.data =3D &(struct vc3_pfd_data) {
> +			.num =3D VC3_PFD3,
> +			.offs =3D VC3_PLL3_M_DIVIDER,
> +			.mdiv1_bitmsk =3D VC3_PLL3_M_DIV1,
> +			.mdiv2_bitmsk =3D VC3_PLL3_M_DIV2
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "pfd3",
> +			.ops =3D &vc3_pfd_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_pfd_mux[VC3_PFD3_MUX].hw
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	}
> +};
> +
> +static struct vc3_hw_data clk_pll[] =3D {
> +	[VC3_PLL1] =3D {
> +		.data =3D &(struct vc3_pll_data) {
> +			.num =3D VC3_PLL1,
> +			.int_div_msb_offs =3D VC3_PLL1_LOOP_FILTER_N_DIV_MSB,
> +			.int_div_lsb_offs =3D VC3_PLL1_VCO_N_DIVIDER,
> +			.vco_min =3D VC3_PLL1_VCO_MIN,
> +			.vco_max =3D VC3_PLL1_VCO_MAX
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "pll1",
> +			.ops =3D &vc3_pll_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_pfd[VC3_PFD1].hw
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_PLL2] =3D {
> +		.data =3D &(struct vc3_pll_data) {
> +			.num =3D VC3_PLL2,
> +			.int_div_msb_offs =3D VC3_PLL2_FB_INT_DIV_MSB,
> +			.int_div_lsb_offs =3D VC3_PLL2_FB_INT_DIV_LSB,
> +			.vco_min =3D VC3_PLL2_VCO_MIN,
> +			.vco_max =3D VC3_PLL2_VCO_MAX
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "pll2",
> +			.ops =3D &vc3_pll_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_pfd[VC3_PFD2].hw
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_PLL3] =3D {
> +		.data =3D &(struct vc3_pll_data) {
> +			.num =3D VC3_PLL3,
> +			.int_div_msb_offs =3D VC3_PLL3_LOOP_FILTER_N_DIV_MSB,
> +			.int_div_lsb_offs =3D VC3_PLL3_N_DIVIDER,
> +			.vco_min =3D VC3_PLL3_VCO_MIN,
> +			.vco_max =3D VC3_PLL3_VCO_MAX
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "pll3",
> +			.ops =3D &vc3_pll_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_pfd[VC3_PFD3].hw
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	}
> +};
> +
> +static const struct clk_parent_data div_mux_parent_data[][2] =3D {
> +	[VC3_DIV1_MUX] =3D {
> +		{ .hw =3D &clk_pll[VC3_PLL1].hw },
> +		{ .index =3D 0 }
> +	},
> +	[VC3_DIV3_MUX] =3D {
> +		{ .hw =3D &clk_pll[VC3_PLL2].hw },
> +		{ .hw =3D &clk_pll[VC3_PLL3].hw }
> +	},
> +	[VC3_DIV4_MUX] =3D {
> +		{ .hw =3D &clk_pll[VC3_PLL2].hw },
> +		{ .index =3D 0 }
> +	}
> +};
> +
> +static struct vc3_hw_data clk_div_mux[] =3D {
> +	[VC3_DIV1_MUX] =3D {
> +		.data =3D &(struct vc3_clk_data) {
> +			.offs =3D VC3_GENERAL_CTR,
> +			.bitmsk =3D VC3_GENERAL_CTR_DIV1_SRC_SEL
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "div1_mux",
> +			.ops =3D &vc3_div_mux_ops,
> +			.parent_data =3D div_mux_parent_data[VC3_DIV1_MUX],
> +			.num_parents =3D 2,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_DIV3_MUX] =3D {
> +		.data =3D &(struct vc3_clk_data) {
> +			.offs =3D VC3_PLL3_CHARGE_PUMP_CTRL,
> +			.bitmsk =3D VC3_PLL3_CHARGE_PUMP_CTRL_OUTDIV3_SRC_SEL
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "div3_mux",
> +			.ops =3D &vc3_div_mux_ops,
> +			.parent_data =3D div_mux_parent_data[VC3_DIV3_MUX],
> +			.num_parents =3D 2,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_DIV4_MUX] =3D {
> +		.data =3D &(struct vc3_clk_data) {
> +			.offs =3D VC3_OUTPUT_CTR,
> +			.bitmsk =3D VC3_OUTPUT_CTR_DIV4_SRC_SEL
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "div4_mux",
> +			.ops =3D &vc3_div_mux_ops,
> +			.parent_data =3D div_mux_parent_data[VC3_DIV4_MUX],
> +			.num_parents =3D 2,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	}
> +};
> +
> +static struct vc3_hw_data clk_div[] =3D {
> +	[VC3_DIV1] =3D {
> +		.data =3D &(struct vc3_div_data) {
> +			.offs =3D VC3_OUT_DIV1_DIV2_CTRL,
> +			.table =3D div1_divs,
> +			.shift =3D 4,
> +			.width =3D 4,
> +			.flags =3D CLK_DIVIDER_READ_ONLY
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "div1",
> +			.ops =3D &vc3_div_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_div_mux[VC3_DIV1_MUX].hw
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_DIV2] =3D {
> +		.data =3D &(struct vc3_div_data) {
> +			.offs =3D VC3_OUT_DIV1_DIV2_CTRL,
> +			.table =3D div245_divs,
> +			.shift =3D 0,
> +			.width =3D 4,
> +			.flags =3D CLK_DIVIDER_READ_ONLY
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "div2",
> +			.ops =3D &vc3_div_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_pll[VC3_PLL1].hw
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_DIV3] =3D {
> +		.data =3D &(struct vc3_div_data) {
> +			.offs =3D VC3_OUT_DIV3_DIV4_CTRL,
> +			.table =3D div3_divs,
> +			.shift =3D 4,
> +			.width =3D 4,
> +			.flags =3D CLK_DIVIDER_READ_ONLY
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "div3",
> +			.ops =3D &vc3_div_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_div_mux[VC3_DIV3_MUX].hw
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_DIV4] =3D {
> +		.data =3D &(struct vc3_div_data) {
> +			.offs =3D VC3_OUT_DIV3_DIV4_CTRL,
> +			.table =3D div245_divs,
> +			.shift =3D 0,
> +			.width =3D 4,
> +			.flags =3D CLK_DIVIDER_READ_ONLY
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "div4",
> +			.ops =3D &vc3_div_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_div_mux[VC3_DIV4_MUX].hw
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_DIV5] =3D {
> +		.data =3D &(struct vc3_div_data) {
> +			.offs =3D VC3_PLL1_CTRL_OUTDIV5,
> +			.table =3D div245_divs,
> +			.shift =3D 0,
> +			.width =3D 4,
> +			.flags =3D CLK_DIVIDER_READ_ONLY
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "div5",
> +			.ops =3D &vc3_div_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_pll[VC3_PLL3].hw
> +			},
> +			.num_parents =3D 1,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	}
> +};
> +
> +static struct vc3_hw_data clk_mux[] =3D {
> +	[VC3_DIFF2_MUX] =3D {
> +		.data =3D &(struct vc3_clk_data) {
> +			.offs =3D VC3_DIFF2_CTRL_REG,
> +			.bitmsk =3D VC3_DIFF2_CTRL_REG_DIFF2_CLK_SEL
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "diff2_mux",
> +			.ops =3D &vc3_clk_mux_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_div[VC3_DIV1].hw,
> +				&clk_div[VC3_DIV3].hw
> +			},
> +			.num_parents =3D 2,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_DIFF1_MUX] =3D {
> +		.data =3D &(struct vc3_clk_data) {
> +			.offs =3D VC3_DIFF1_CTRL_REG,
> +			.bitmsk =3D VC3_DIFF1_CTRL_REG_DIFF1_CLK_SEL
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "diff1_mux",
> +			.ops =3D &vc3_clk_mux_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_div[VC3_DIV1].hw,
> +				&clk_div[VC3_DIV3].hw
> +			},
> +			.num_parents =3D 2,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_SE3_MUX] =3D {
> +		.data =3D &(struct vc3_clk_data) {
> +			.offs =3D VC3_SE3_DIFF1_CTRL_REG,
> +			.bitmsk =3D VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "se3_mux",
> +			.ops =3D &vc3_clk_mux_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_div[VC3_DIV2].hw,
> +				&clk_div[VC3_DIV4].hw
> +			},
> +			.num_parents =3D 2,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_SE2_MUX] =3D {
> +		.data =3D &(struct vc3_clk_data) {
> +			.offs =3D VC3_SE2_CTRL_REG0,
> +			.bitmsk =3D VC3_SE2_CTRL_REG0_SE2_CLK_SEL
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "se2_mux",
> +			.ops =3D &vc3_clk_mux_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_div[VC3_DIV5].hw,
> +				&clk_div[VC3_DIV4].hw
> +			},
> +			.num_parents =3D 2,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	},
> +	[VC3_SE1_MUX] =3D {
> +		.data =3D &(struct vc3_clk_data) {
> +			.offs =3D VC3_SE1_DIV4_CTRL,
> +			.bitmsk =3D VC3_SE1_DIV4_CTRL_SE1_CLK_SEL
> +		},
> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "se1_mux",
> +			.ops =3D &vc3_clk_mux_ops,
> +			.parent_hws =3D (const struct clk_hw *[]) {
> +				&clk_div[VC3_DIV5].hw,
> +				&clk_div[VC3_DIV4].hw
> +			},
> +			.num_parents =3D 2,
> +			.flags =3D CLK_SET_RATE_PARENT
> +		}
> +	}
> +};
> +
> +static struct clk_hw *vc3_of_clk_get(struct of_phandle_args *clkspec,
> +				     void *data)
> +{
> +	unsigned int idx =3D clkspec->args[0];
> +	struct clk_hw **clkout_hw =3D data;
> +
> +	if (idx >=3D ARRAY_SIZE(clk_out)) {
> +		pr_err("invalid clk index %u for provider %pOF\n", idx,
> clkspec->np);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	return clkout_hw[idx];
> +}
> +
> +static int vc3_probe(struct i2c_client *client) {
> +	struct device *dev =3D &client->dev;
> +	u8 settings[NUM_CONFIG_REGISTERS];
> +	struct regmap *regmap;
> +	const char *name;
> +	int ret, i;
> +
> +	regmap =3D devm_regmap_init_i2c(client, &vc3_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "failed to allocate register map\n");
> +
> +	ret =3D of_property_read_u8_array(dev->of_node, "renesas,settings",
> +					settings, ARRAY_SIZE(settings));
> +	if (!ret) {
> +		/*
> +		 * A raw settings array was specified in the DT. Write the
> +		 * settings to the device immediately.
> +		 */
> +		for  (i =3D 0; i < NUM_CONFIG_REGISTERS; i++) {
> +			ret =3D regmap_write(regmap, i, settings[i]);
> +			if (ret) {
> +				dev_err(dev, "error writing to chip (%i)\n", ret);
> +				return ret;
> +			}
> +		}
> +	} else if (ret =3D=3D -EOVERFLOW) {
> +		dev_err(&client->dev, "EOVERFLOW reg settings. ARRAY_SIZE:
> %zu",
> +			ARRAY_SIZE(settings));
> +		return ret;
> +	}
> +
> +	/* Register pfd muxes */
> +	for (i =3D 0; i < ARRAY_SIZE(clk_pfd_mux); i++) {
> +		clk_pfd_mux[i].regmap =3D regmap;
> +		ret =3D devm_clk_hw_register(dev, &clk_pfd_mux[i].hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "%s failed\n",
> +					     clk_pfd_mux[i].hw.init->name);
> +	}
> +
> +	/* Register pfd's */
> +	for (i =3D 0; i < ARRAY_SIZE(clk_pfd); i++) {
> +		clk_pfd[i].regmap =3D regmap;
> +		ret =3D devm_clk_hw_register(dev, &clk_pfd[i].hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "%s failed\n",
> +					     clk_pfd[i].hw.init->name);
> +	}
> +
> +	/* Register pll's */
> +	for (i =3D 0; i < ARRAY_SIZE(clk_pll); i++) {
> +		clk_pll[i].regmap =3D regmap;
> +		ret =3D devm_clk_hw_register(dev, &clk_pll[i].hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "%s failed\n",
> +					     clk_pll[i].hw.init->name);
> +	}
> +
> +	/* Register divider muxes */
> +	for (i =3D 0; i < ARRAY_SIZE(clk_div_mux); i++) {
> +		clk_div_mux[i].regmap =3D regmap;
> +		ret =3D devm_clk_hw_register(dev, &clk_div_mux[i].hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "%s failed\n",
> +					     clk_div_mux[i].hw.init->name);
> +	}
> +
> +	/* Register dividers */
> +	for (i =3D 0; i < ARRAY_SIZE(clk_div); i++) {
> +		clk_div[i].regmap =3D regmap;
> +		ret =3D devm_clk_hw_register(dev, &clk_div[i].hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "%s failed\n",
> +					     clk_div[i].hw.init->name);
> +	}
> +
> +	/* Register clk muxes */
> +	for (i =3D 0; i < ARRAY_SIZE(clk_mux); i++) {
> +		clk_mux[i].regmap =3D regmap;
> +		ret =3D devm_clk_hw_register(dev, &clk_mux[i].hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "%s failed\n",
> +					     clk_mux[i].hw.init->name);
> +	}
> +
> +	/* Register clk outputs */
> +	for (i =3D 0; i < ARRAY_SIZE(clk_out); i++) {
> +		switch (i) {
> +		case VC3_DIFF2:
> +			name =3D "diff2";
> +			break;
> +		case VC3_DIFF1:
> +			name =3D "diff1";
> +			break;
> +		case VC3_SE3:
> +			name =3D "se3";
> +			break;
> +		case VC3_SE2:
> +			name =3D "se2";
> +			break;
> +		case VC3_SE1:
> +			name =3D "se1";
> +			break;
> +		case VC3_REF:
> +			name =3D "ref";
> +			break;
> +		default:
> +			pr_err("invalid clk output %d\n", i);
> +			return -EINVAL;
> +		}
> +
> +		if (i =3D=3D VC3_REF)
> +			clk_out[i] =3D devm_clk_hw_register_fixed_factor_index(dev,
> +				name, 0, CLK_SET_RATE_PARENT, 1, 1);
> +		else
> +			clk_out[i] =3D
> devm_clk_hw_register_fixed_factor_parent_hw(dev,
> +				name, &clk_mux[i].hw, CLK_SET_RATE_PARENT, 1, 1);


Will add error check along with warning reported by kernel test robot in th=
e next version.
		if (IS_ERR(clk_out[i]))
			return PTR_ERR(clk_out[i]);

Cheers,
Biju


> +	}
> +
> +	ret =3D devm_of_clk_add_hw_provider(dev, vc3_of_clk_get, clk_out);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "unable to add clk provider\n");
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id dev_ids[] =3D {
> +	{ .compatible =3D "renesas,5p35023" },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, dev_ids);
> +
> +static struct i2c_driver vc3_driver =3D {
> +	.driver =3D {
> +		.name =3D "vc3",
> +		.of_match_table =3D of_match_ptr(dev_ids),
> +	},
> +	.probe_new =3D vc3_probe,
> +};
> +module_i2c_driver(vc3_driver);
> +
> +MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
> +MODULE_DESCRIPTION("Renesas VersaClock 3 driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1

