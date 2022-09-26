Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FC435E972A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 02:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbiIZAZC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 25 Sep 2022 20:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiIZAZB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 25 Sep 2022 20:25:01 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2091.outbound.protection.outlook.com [40.107.113.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B0513D65;
        Sun, 25 Sep 2022 17:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j86F4TOZokIU0/rHEZ1j7xbb11ISQFtnt2qzQPPfTIfB+4fvgwI3hNiBUzfeuin4B2VpTK2tWmef9uaCJQ88hMrBVRzxPF+4/QVWtdekuGj3LBVwK/TLbzpbtaaXNTkHBcVR5ZIAz3RJrjQXb/iC7rzrIXTSTjav70j0BrObjLW7ILj2+rotP26OLnOcvHGZ5aF6mlyJjPQxt/RkDdcbzv5LKOor5zokVr+dirzzE1wUrb/X3HBJm39Kx4Mu+d8oe04UKMaeG8NwfkQqeixjVHa6zOByxydJwfw0u8xTqMoAy8n2Y1cIEjI7tB6VVzJqyZZ3Q2Mf+R3SL20ivrwqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6E7lMPAjzinVmirfLqMQwr0Gjvx8AwaYeorOp2n3gU=;
 b=SwFKLLZZJXCIPhqOfoMD0jdiKx8xiKH8+NUaj58kAB/s7mD1LfuHT9ucFYdroFsE0NyUdizVbakYkO20gPR1v/kexWzlwJ4xmNbWm8OH+i9jBwY0J2urw4BYGZbJ1C3TMV3xzQWeRzCXCV769xDM+MGuCWEibRSUEiHfsaeiYjBPPLIQPhyBrqCqEz7W6jqY/XskLyOELvFb9OOCZo82TSoSUHN0HjTn3cByCIw7iGxOl8rZ4fT0G5b+2hEfEZCk4f9LNIvzf8x04FbBDOqByEStCBuPhJNRFfRXZE/Uhxk+2wyQud9X44zqajDuDxvu+9QuY/buJ8KgZSUFm6bATA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6E7lMPAjzinVmirfLqMQwr0Gjvx8AwaYeorOp2n3gU=;
 b=Uq0f5W7gfzqPyi3pcixvuG/ZAmdxEDF7o889CCX+b8h3rvT+Kj7LbhE66V4ORmtge3jvy79SEw2ZuGWXgJgFbeiizUwJS98NHLmQoH9XgzXoJhkA8RCJ1xhSUxSbu0vRWNpgOZHGiMlV1HxKSTxOhaCcCV8yV5Rxp6kSWYGWPVA=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSZPR01MB9599.jpnprd01.prod.outlook.com
 (2603:1096:604:1d5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 00:24:56 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::2991:1e2d:e62c:37d0]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::2991:1e2d:e62c:37d0%3]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 00:24:56 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Vinod Koul <vkoul@kernel.org>
CC:     "kishon@ti.com" <kishon@ti.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] phy: renesas: Add Renesas Ethernet SERDES driver for
 R-Car S4-8
Thread-Topic: [PATCH 2/2] phy: renesas: Add Renesas Ethernet SERDES driver for
 R-Car S4-8
Thread-Index: AQHYzkKGjTefswCTZ0e+B+64nSuDoK3uLFcAgAKzk1A=
Date:   Mon, 26 Sep 2022 00:24:56 +0000
Message-ID: <TYBPR01MB53416560AF6E97BB33163906D8529@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220922051645.3442321-1-yoshihiro.shimoda.uh@renesas.com>
 <20220922051645.3442321-3-yoshihiro.shimoda.uh@renesas.com>
 <Yy6s5qfXxCPsfNxo@matsya>
In-Reply-To: <Yy6s5qfXxCPsfNxo@matsya>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OSZPR01MB9599:EE_
x-ms-office365-filtering-correlation-id: 3df3cbe6-7d7e-4e47-0e40-08da9f558a24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JBJde9iBnBUs8LwQdU8HuwuJNaVF447u7EKdGB4rWJHb89wxLOJsRLjVyDpnBYlzYLuIzWAUQpqWZbpM6QdVLqZc7L9vQU9pJXsUEWx0cirAq6vPQAkkW1TvZC4ts69FcSpuKrvRES3DG50Gv4FcO89/zITYmiVZsM7sBortZegoa99qIJSaR8TkoqIu8OOV7SGM+qrHLzAxUEd7cVZH+pyzNrlg8SOg/rSOqtizv1qja80mq0M0ifQcWhvUr9BZOBD38SGvZTEInTi/psAWVoqei9BUNk8/wBBjO//hHiFM2Jjz3MidOJiK3ejf30r1yG4LE/ZDQEpjZnKVFRZc4yY9mApXUDKvr6A8aSY715NkflmowNNfG0vxgf6OEPlJohXNTmjoFnffzoXz/eRXv1su5R7oBvIewBIwYzN629O0GCliM8MrdE1JJVh8ywVyc+TcPU7Z9gzXWGzKTthKvnJfcH05JwseTDsfK6L1A5qjOuN+qrYWgpwNNy3E7f00zdo88gUS65cF+Ckc/fe3sTAhabscBUOwt9FpauD2seLCwET9S4hr5qYohvVvX6CM7p/sptBUO67x3sVx7StEr+8TialfZgCBVMdtQITEq+FsxEK27OSR/USDm95sZfc1ilSYc67KleiYApDrPd7nvO453hiETFLfPtm0wxDk52pfUkDtPIwluKzrYtkxopOduQgGGAYQ+FjN9MJEVZ7tPXGPQErtIS3PXp9wtauIfoAqB4lZKz2GC2SP4NmcnoxG4+fdwSmQXEPLvGuAQLVRPg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(451199015)(54906003)(6916009)(83380400001)(478600001)(9686003)(316002)(2906002)(41300700001)(7696005)(53546011)(52536014)(5660300002)(8936002)(6506007)(30864003)(33656002)(86362001)(55016003)(186003)(8676002)(64756008)(66446008)(66476007)(66556008)(4326008)(76116006)(66946007)(71200400001)(122000001)(38100700002)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Cmd11DiuSnAJJMg2WjpimeH6bafhF+qexOWxMdoBy17MEx2bFfSdMTNAAvR3?=
 =?us-ascii?Q?icIF8LXJglamgOozri+GNGBP6C4fpxAvU0zc+XUSZY7Cw71ZaxjrRP5wZdDC?=
 =?us-ascii?Q?WM/cpB8cjfHIc7IGxpPI96o+b215fBkHio6CwofW+PZ6zaERMJUfoenA0UKl?=
 =?us-ascii?Q?Pgivze3QtMaxMi4uisU075gZo1a1dgRFMor22Cw/NQD6wxnLPxx0tl6g4kyP?=
 =?us-ascii?Q?+vPCuGuLCPiG+1fn89Km9x+jw42FcxsPDG71VioUqfJvOEHqSMeybMnUryOh?=
 =?us-ascii?Q?p4YOBjCQtY39dgPuywSnzCxu/1mgeXKH3iV8jSS/O1oOFqAO7KPhG7+WZ4ec?=
 =?us-ascii?Q?LAMWUSSv4EQoFqPCL3NseRdlV5ZkxkLvxYSGr9xIORMXmYftrjrsarJzHov2?=
 =?us-ascii?Q?PBZTfjUT8BoT92iUiZKIe3b+5scc+3J13IbzVBRxA6kEsgo/McB/ESt7M4Xz?=
 =?us-ascii?Q?ZtiUP9Jzk7BUaNfnr05vL26k1xsDhVcRxkSLtkOUJMYwaPq+wcabIY/PyBpG?=
 =?us-ascii?Q?71pftugiCPRZiKOq8jjTD4wzommeDnAHyoDHVotPazQpqLGIBAhkqeb4h+eH?=
 =?us-ascii?Q?DxD62Xk8DSaaKRTbTBIclHZwH7CcNMzI8ihC+3/SRN51j9E2oXgOarpp7GO8?=
 =?us-ascii?Q?Y2eKQm64Xeb/6q5+Ouw8VLT66zAVvdy3faSnR7N6N1dYs+b7xirgE/mJoD30?=
 =?us-ascii?Q?mo161h/L6oppBdvRRh/MdKCE3ZVFLTdlfuXxw8HbbxJqpo1trtRJLMDsUYAJ?=
 =?us-ascii?Q?2s9Eq/Zw2bPo/HNAuWipzsEXzApM7on30BlwzbqnMIFsq7tjiYAoyTIY8s3n?=
 =?us-ascii?Q?358iOQV7qaQdY2YnVL2TEKVb/VDpNlv76IfgHGM3w8GMhAQgs1P1earjIS2C?=
 =?us-ascii?Q?+Xc228ph0FJhJA+h+u0m/xN+BOK6SklqytIDMCkuO5Gbm4LoONUGoO+I2qE1?=
 =?us-ascii?Q?rNR/iQ6DXbNiEOBwqZu0gXtngZDyXVorv1tapYc0T0mvT6fRIghGJiKlnvu6?=
 =?us-ascii?Q?ZO9BxvjyimfT9+naNj6AgQhHgiXD85/1aOM36Ye9ejNHizH0v6SigDVOW+j3?=
 =?us-ascii?Q?vsM/f65F+DbUePHz2uiYh9zmCskeS3aQvfLaO+uq8y7nx6RuyIdVNNVl9bz4?=
 =?us-ascii?Q?kN+9L5pBKe8L7X0czV+9yfa/KBvrODDLCuMu3kIZRKQEU+ntlfPWlikcb/7w?=
 =?us-ascii?Q?DsH1Wmo7eEmAOZkMe3KuKZ4PI5zZnsqKO1xS+49XnKeYJYfCqE9W9RJmmrkZ?=
 =?us-ascii?Q?BvV2wIBrNwOylwGa+JdOcz4N3BVWaMeAad6LfcxhI+JOTy6j3b/f9UhuRK6l?=
 =?us-ascii?Q?grhGdgBxFFT5+iVVxcKL/obOCxG8NvkF83TdlL17HrcGtPVeVoS/3dSvN6Ek?=
 =?us-ascii?Q?9ZcbXqYaHCfh+tuWpXs7HxSkYCjEA3AqUoI2rejVza9IwoiYx83vvFbzcyyU?=
 =?us-ascii?Q?iUZBJwAY1JnzSwOUem5x6Lg93VWrrUOwYMQwzDB1edytWm8+n57khqLXEe4D?=
 =?us-ascii?Q?y3Dr9jpFI77HXEr86iPsOq8IJA1Ehj+nqilyj61nlk0PkVXeoilSyr7UqIUv?=
 =?us-ascii?Q?CwfjzAPQsW8UckqA3IIQVxNGrmFHTQ38xfK7FbWYxAleXNG+F+EY02uOeQqU?=
 =?us-ascii?Q?vBnE64jFsC9zkVnzFO1ziSbJqX/6VzbD+4x+DRatyP8c7yANSMMbVhbILF7D?=
 =?us-ascii?Q?D36y8g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df3cbe6-7d7e-4e47-0e40-08da9f558a24
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 00:24:56.4689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iFivYdR4yVwtZRY7UPsLqYPWC2rchYccZMy0hrt39clW08zqXIOJ7untET2Crtyx5VjY8jS5JRPpniL07+PGmaCg3gYN1HwhhoXVozH8HUgAl2JX3cBYMGevufUofvWi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9599
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Vinod,

> From: Vinod Koul, Sent: Saturday, September 24, 2022 4:08 PM
>=20
> On 22-09-22, 14:16, Yoshihiro Shimoda wrote:
> > Add Renesas Ethernet SERDES driver for R-Car S4-8 (r8a779f0).
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/phy/renesas/Kconfig                 |   7 +
> >  drivers/phy/renesas/Makefile                |   2 +-
> >  drivers/phy/renesas/r8a779f0-ether-serdes.c | 303 ++++++++++++++++++++
> >  3 files changed, 311 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/phy/renesas/r8a779f0-ether-serdes.c
> >
> > diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
> > index 111bdcae775c..68f160b0e8ef 100644
> > --- a/drivers/phy/renesas/Kconfig
> > +++ b/drivers/phy/renesas/Kconfig
> > @@ -32,3 +32,10 @@ config PHY_RCAR_GEN3_USB3
> >  	select GENERIC_PHY
> >  	help
> >  	  Support for USB 3.0 PHY found on Renesas R-Car generation 3 SoCs.
> > +
> > +config PHY_R8A779F0_ETHERNET_SERDES
> > +	tristate "Renesas R-Car S4-8 Ethernet SERDES driver"
> > +	depends on ARCH_RENESAS || COMPILE_TEST
> > +	select GENERIC_PHY
> > +	help
> > +	  Support for Ethernet SERDES found on Renesas R-Car S4-8 SoCs.
> > diff --git a/drivers/phy/renesas/Makefile b/drivers/phy/renesas/Makefil=
e
> > index b599ff8a4349..a2db7125da19 100644
> > --- a/drivers/phy/renesas/Makefile
> > +++ b/drivers/phy/renesas/Makefile
> > @@ -1,5 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +obj-$(CONFIG_PHY_R8A779F0_ETHERNET_SERDES)	+=3D r8a779f0-ether-serdes.=
o
> >  obj-$(CONFIG_PHY_RCAR_GEN2)		+=3D phy-rcar-gen2.o
> >  obj-$(CONFIG_PHY_RCAR_GEN3_PCIE)	+=3D phy-rcar-gen3-pcie.o
> >  obj-$(CONFIG_PHY_RCAR_GEN3_USB2)	+=3D phy-rcar-gen3-usb2.o
> > -obj-$(CONFIG_PHY_RCAR_GEN3_USB3)	+=3D phy-rcar-gen3-usb3.o
>=20
> Why?

I'm sorry. I completely mistook to drop it and I completely overlooked this=
 before I submit the patch...
I'll fix it.

Best regards,
Yoshihiro Shimoda

> > diff --git a/drivers/phy/renesas/r8a779f0-ether-serdes.c b/drivers/phy/=
renesas/r8a779f0-ether-serdes.c
> > new file mode 100644
> > index 000000000000..1aaf70b3ed3d
> > --- /dev/null
> > +++ b/drivers/phy/renesas/r8a779f0-ether-serdes.c
> > @@ -0,0 +1,303 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Renesas Ethernet SERDES device driver
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corporation
> > + */
> > +
> > +#include <linux/delay.h>
> > +#include <linux/err.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/kernel.h>
> > +#include <linux/phy.h>
> > +#include <linux/phy/phy.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define R8A779F0_ETH_SERDES_NUM			3
> > +#define R8A779F0_ETH_SERDES_OFFSET		0x0400
> > +#define R8A779F0_ETH_SERDES_BANK_SELECT		0x03fc
> > +#define R8A779F0_ETH_SERDES_TIMEOUT_US		100000
> > +
> > +struct r8a779f0_eth_serdes_channel {
> > +	struct phy *phy;
> > +	void __iomem *addr;
> > +	void __iomem *addr0;
> > +	phy_interface_t phy_interface;
> > +	int speed;
> > +};
> > +
> > +struct r8a779f0_eth_serdes_drv_data {
> > +	void __iomem *addr;
> > +	struct platform_device *pdev;
> > +	struct r8a779f0_eth_serdes_channel channel[R8A779F0_ETH_SERDES_NUM];
> > +};
> > +
> > +/*
> > + * The datasheet describes initialization procedure without any inform=
ation
> > + * about registers' name/bits. So, this is all black magic to initiali=
ze
> > + * the hardware.
> > + */
> > +static void r8a779f0_eth_serdes_write32(void __iomem *addr, u32 offs, =
u32 bank, u32 data)
> > +{
> > +	iowrite32(bank, addr + R8A779F0_ETH_SERDES_BANK_SELECT);
> > +	iowrite32(data, addr + offs);
> > +}
> > +
> > +static int r8a779f0_eth_serdes_reg_wait(void __iomem *addr, u32 offs, =
u32 bank,
> > +					u32 mask, u32 expected)
> > +{
> > +	u32 val;
> > +
> > +	iowrite32(bank, addr + R8A779F0_ETH_SERDES_BANK_SELECT);
> > +
> > +	return readl_poll_timeout_atomic(addr + offs, val, (val & mask) =3D=
=3D expected,
> > +					 1, R8A779F0_ETH_SERDES_TIMEOUT_US);
> > +}
> > +
> > +static int
> > +r8a779f0_eth_serdes_common_init_ram(struct r8a779f0_eth_serdes_channel=
 *channel)
> > +{
> > +	int ret;
> > +
> > +	ret =3D r8a779f0_eth_serdes_reg_wait(channel->addr, 0x026c, 0x180, BI=
T(0), 0x01);
> > +	if (ret)
> > +		return ret;
> > +
> > +	r8a779f0_eth_serdes_write32(channel->addr0, 0x026c, 0x180, 0x03);
> > +
> > +	return ret;
> > +}
> > +
> > +static int
> > +r8a779f0_eth_serdes_common_setting(struct r8a779f0_eth_serdes_channel =
*channel)
> > +{
> > +	switch (channel->phy_interface) {
> > +	case PHY_INTERFACE_MODE_SGMII:
> > +		r8a779f0_eth_serdes_write32(channel->addr0, 0x0244, 0x180, 0x0097);
> > +		r8a779f0_eth_serdes_write32(channel->addr0, 0x01d0, 0x180, 0x0060);
> > +		r8a779f0_eth_serdes_write32(channel->addr0, 0x01d8, 0x180, 0x2200);
> > +		r8a779f0_eth_serdes_write32(channel->addr0, 0x01d4, 0x180, 0x0000);
> > +		r8a779f0_eth_serdes_write32(channel->addr0, 0x01e0, 0x180, 0x003d);
> > +		return 0;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int
> > +r8a779f0_eth_serdes_chan_setting(struct r8a779f0_eth_serdes_channel *c=
hannel)
> > +{
> > +	int ret;
> > +
> > +	switch (channel->phy_interface) {
> > +	case PHY_INTERFACE_MODE_SGMII:
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2000);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x01c0, 0x180, 0x0011);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0248, 0x180, 0x0540);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0258, 0x180, 0x0015);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0144, 0x180, 0x0100);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x01a0, 0x180, 0x0000);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00d0, 0x180, 0x0002);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0150, 0x180, 0x0003);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x180, 0x0100);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x0100);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0174, 0x180, 0x0000);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0160, 0x180, 0x0007);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x01ac, 0x180, 0x0000);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x0310);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00c8, 0x380, 0x0101);
> > +		ret =3D r8a779f0_eth_serdes_reg_wait(channel->addr, 0x00c8, 0x0180, =
BIT(0), 0);
> > +		if (ret)
> > +			return ret;
> > +
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0148, 0x180, 0x0101);
> > +		ret =3D r8a779f0_eth_serdes_reg_wait(channel->addr, 0x0148, 0x0180, =
BIT(0), 0);
> > +		if (ret)
> > +			return ret;
> > +
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00c4, 0x180, 0x1310);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00d8, 0x180, 0x1800);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x00dc, 0x180, 0x0000);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x001c, 0x300, 0x0001);
> > +		r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x380, 0x2100);
> > +		ret =3D r8a779f0_eth_serdes_reg_wait(channel->addr, 0x0000, 0x0380, =
BIT(8), 0);
> > +		if (ret)
> > +			return ret;
> > +
> > +		if (channel->speed =3D=3D 1000)
> > +			r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x0140);
> > +		else if (channel->speed =3D=3D 100)
> > +			r8a779f0_eth_serdes_write32(channel->addr, 0x0000, 0x1f00, 0x2100);
> > +		break;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int r8a779f0_eth_serdes_hw_init(struct r8a779f0_eth_serdes_chan=
nel *channel)
> > +{
> > +	int ret;
> > +
> > +	ret =3D r8a779f0_eth_serdes_common_init_ram(channel);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D r8a779f0_eth_serdes_reg_wait(channel->addr, 0x0000, 0x300, BI=
T(15), 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	r8a779f0_eth_serdes_write32(channel->addr, 0x03d4, 0x380, 0x0443);
> > +
> > +	ret =3D r8a779f0_eth_serdes_common_setting(channel);
> > +	if (ret)
> > +		return ret;
> > +
> > +	r8a779f0_eth_serdes_write32(channel->addr, 0x03d0, 0x380, 0x0001);
> > +
> > +	r8a779f0_eth_serdes_write32(channel->addr0, 0x0000, 0x380, 0x8000);
> > +
> > +	ret =3D r8a779f0_eth_serdes_common_init_ram(channel);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D r8a779f0_eth_serdes_reg_wait(channel->addr0, 0x0000, 0x380, B=
IT(15), 0);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D r8a779f0_eth_serdes_chan_setting(channel);
> > +	if (ret)
> > +		return ret;
> > +
> > +	r8a779f0_eth_serdes_write32(channel->addr, 0x03c0, 0x380, 0x0000);
> > +	r8a779f0_eth_serdes_write32(channel->addr, 0x03d0, 0x380, 0x0000);
> > +
> > +	return 0;
> > +}
> > +
> > +static int r8a779f0_eth_serdes_init(struct phy *p)
> > +{
> > +	struct r8a779f0_eth_serdes_channel *channel =3D phy_get_drvdata(p);
> > +
> > +	return r8a779f0_eth_serdes_hw_init(channel);
> > +}
> > +
> > +static int r8a779f0_eth_serdes_set_mode(struct phy *p, enum phy_mode m=
ode,
> > +					int submode)
> > +{
> > +	struct r8a779f0_eth_serdes_channel *channel =3D phy_get_drvdata(p);
> > +
> > +	if (mode !=3D PHY_MODE_ETHERNET)
> > +		return -EOPNOTSUPP;
> > +
> > +	switch (submode) {
> > +	case PHY_INTERFACE_MODE_GMII:
> > +	case PHY_INTERFACE_MODE_SGMII:
> > +	case PHY_INTERFACE_MODE_USXGMII:
> > +		channel->phy_interface =3D submode;
> > +		return 0;
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +}
> > +
> > +static int r8a779f0_eth_serdes_set_speed(struct phy *p, int speed)
> > +{
> > +	struct r8a779f0_eth_serdes_channel *channel =3D phy_get_drvdata(p);
> > +
> > +	channel->speed =3D speed;
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct phy_ops r8a779f0_eth_serdes_ops =3D {
> > +	.init		=3D r8a779f0_eth_serdes_init,
> > +	.set_mode	=3D r8a779f0_eth_serdes_set_mode,
> > +	.set_speed	=3D r8a779f0_eth_serdes_set_speed,
> > +};
> > +
> > +static struct phy *r8a779f0_eth_serdes_xlate(struct device *dev,
> > +					     struct of_phandle_args *args)
> > +{
> > +	struct r8a779f0_eth_serdes_drv_data *dd =3D dev_get_drvdata(dev);
> > +
> > +	if (args->args[0] >=3D R8A779F0_ETH_SERDES_NUM)
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	return dd->channel[args->args[0]].phy;
> > +}
> > +
> > +static const struct of_device_id r8a779f0_eth_serdes_of_table[] =3D {
> > +	{ .compatible =3D "renesas,r8a779f0-ether-serdes", },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, r8a779f0_eth_serdes_of_table);
> > +
> > +static int r8a779f0_eth_serdes_probe(struct platform_device *pdev)
> > +{
> > +	struct r8a779f0_eth_serdes_drv_data *dd;
> > +	struct phy_provider *provider;
> > +	struct resource *res;
> > +	int i, ret;
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res) {
> > +		dev_err(&pdev->dev, "invalid resource\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	dd =3D devm_kzalloc(&pdev->dev, sizeof(*dd), GFP_KERNEL);
> > +	if (!dd)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, dd);
> > +	dd->pdev =3D pdev;
> > +	dd->addr =3D devm_ioremap_resource(&pdev->dev, res);
> > +	if (IS_ERR(dd->addr))
> > +		return PTR_ERR(dd->addr);
> > +
> > +	for (i =3D 0; i < R8A779F0_ETH_SERDES_NUM; i++) {
> > +		struct r8a779f0_eth_serdes_channel *channel =3D &dd->channel[i];
> > +
> > +		channel->phy =3D devm_phy_create(&pdev->dev, NULL,
> > +					       &r8a779f0_eth_serdes_ops);
> > +		if (IS_ERR(channel->phy))
> > +			return PTR_ERR(channel->phy);
> > +		channel->addr =3D dd->addr + R8A779F0_ETH_SERDES_OFFSET * i;
> > +		channel->addr0 =3D dd->addr;
> > +		phy_set_drvdata(channel->phy, channel);
> > +	}
> > +
> > +	provider =3D devm_of_phy_provider_register(&pdev->dev,
> > +						 r8a779f0_eth_serdes_xlate);
> > +	if (IS_ERR(provider))
> > +		return PTR_ERR(provider);
> > +
> > +	pm_runtime_enable(&pdev->dev);
> > +	pm_runtime_get_sync(&pdev->dev);
> > +
> > +	return ret;
> > +}
> > +
> > +static int r8a779f0_eth_serdes_remove(struct platform_device *pdev)
> > +{
> > +	pm_runtime_put(&pdev->dev);
> > +	pm_runtime_disable(&pdev->dev);
> > +
> > +	platform_set_drvdata(pdev, NULL);
> > +
> > +	return 0;
> > +}
> > +
> > +static struct platform_driver r8a779f0_eth_serdes_driver_platform =3D =
{
> > +	.probe =3D r8a779f0_eth_serdes_probe,
> > +	.remove =3D r8a779f0_eth_serdes_remove,
> > +	.driver =3D {
> > +		.name =3D "r8a779f0_eth_serdes",
> > +		.of_match_table =3D r8a779f0_eth_serdes_of_table,
> > +	}
> > +};
> > +module_platform_driver(r8a779f0_eth_serdes_driver_platform);
> > +MODULE_AUTHOR("Yoshihiro Shimoda");
> > +MODULE_DESCRIPTION("Renesas Ethernet SERDES device driver");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.25.1
>=20
> --
> ~Vinod
