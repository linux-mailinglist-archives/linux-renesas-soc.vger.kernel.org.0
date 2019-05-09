Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96027185B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 May 2019 09:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfEIHER (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 May 2019 03:04:17 -0400
Received: from mail-eopbgr1400137.outbound.protection.outlook.com ([40.107.140.137]:23363
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725908AbfEIHER (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 May 2019 03:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvFttp70Hss83zQI2nqTgjqdvudmQBmhyD5D9pEAHKI=;
 b=jsgquOJgOyz3NwZaS3qiiELkPEKhy5IO/lwa5ZfiNd24fNp6zLNx4/hvAK3HLs2+dlX3tEqF0rp0kzsKnL8ifaAwSOUPmoA8PPOCa8SJiLoQ60pcV1q9SPI6a3ls+trWnpQsWHAfUKKf4tIOMcj47Vxt/r6/wgSSWWjVnM98phE=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB5160.jpnprd01.prod.outlook.com (20.179.183.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Thu, 9 May 2019 07:04:12 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::4d29:3383:d67d:d562%3]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 07:04:12 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>
Subject: RE: [PATCH 06/10] usb: renesas_usbhs: Add support for RZ/A2
Thread-Topic: [PATCH 06/10] usb: renesas_usbhs: Add support for RZ/A2
Thread-Index: AQHVBGYr87uajTfZtUuBJLuJP7kfAaZiWrMw
Date:   Thu, 9 May 2019 07:04:12 +0000
Message-ID: <OSBPR01MB317436B70E57E04964BDDECED8330@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190506234631.113226-1-chris.brandt@renesas.com>
 <20190506234631.113226-7-chris.brandt@renesas.com>
In-Reply-To: <20190506234631.113226-7-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5694c5c-2afd-40fc-3c89-08d6d44c8a93
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB5160;
x-ms-traffictypediagnostic: OSBPR01MB5160:
x-microsoft-antispam-prvs: <OSBPR01MB5160AF9D6F5F7738C3EB5B8DD8330@OSBPR01MB5160.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(316002)(54906003)(476003)(486006)(55016002)(25786009)(14444005)(4326008)(99286004)(6436002)(6862004)(256004)(14454004)(478600001)(6116002)(3846002)(229853002)(8936002)(81166006)(81156014)(5660300002)(2906002)(102836004)(26005)(8676002)(186003)(6506007)(6246003)(86362001)(305945005)(68736007)(7736002)(9686003)(53936002)(74316002)(71200400001)(71190400001)(6636002)(66066001)(7696005)(76116006)(66446008)(73956011)(52536014)(33656002)(66946007)(66556008)(66476007)(64756008)(446003)(11346002)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB5160;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I1omU73bgFP9/BMVOjTTKOVXIXUxPSpzpF1NJ1IGSJuczs7aR0UdzElFJbIktijU5ZCMqt9t6kCP/F6a2nc+AJkbOmj0/sR6dudc1RN5XFEMg83U1RosJK7uB7PzeZ4WP+eqKPCpFME/zEgO8QHbZd5Wmm5e80V/+g+7uh9RHMg8DeKyTTsQuF/FcdRaT7d3v2zztR0UnBlQMUq2p3i7mcxKVFwLKObxvglImMHlf/ABkAEHJqE+bOxG4CrIgK/0Ih/xjrLlbTERTvTRWxXix3EJ05k9G06Uo+yTwun6ziUVopQir8YcUFHx/bez9mfVpMPhJbF/hByqwLzD71FMkAVevBrmovfeGpRDqIuFEHWwa+74Y+CI6x2QLtSMcZzNMvJRRztpB981mUFjx10CVrmzkKJcnUviHohinx2GUGg=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5694c5c-2afd-40fc-3c89-08d6d44c8a93
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 07:04:12.6071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5160
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris=1B$B$5$s=1B(B

Thank you for the patch!

> From: Chris Brandt, Sent: Tuesday, May 7, 2019 8:46 AM
>=20
> The RZ/A2 is similar to the R-Car Gen3 with some small differences.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  drivers/usb/renesas_usbhs/Makefile |  2 +-
>  drivers/usb/renesas_usbhs/common.c | 27 +++++++++----
>  drivers/usb/renesas_usbhs/common.h | 13 ++++++
>  drivers/usb/renesas_usbhs/fifo.c   |  8 +++-
>  drivers/usb/renesas_usbhs/rza.h    |  1 +
>  drivers/usb/renesas_usbhs/rza2.c   | 82 ++++++++++++++++++++++++++++++++=
++++++
>  include/linux/usb/renesas_usbhs.h  |  1 +
>  7 files changed, 124 insertions(+), 10 deletions(-)
>  create mode 100644 drivers/usb/renesas_usbhs/rza2.c
>=20
> diff --git a/drivers/usb/renesas_usbhs/Makefile b/drivers/usb/renesas_usb=
hs/Makefile
> index 5c5b51bb48ef..a1fed56b0957 100644
> --- a/drivers/usb/renesas_usbhs/Makefile
> +++ b/drivers/usb/renesas_usbhs/Makefile
> @@ -5,7 +5,7 @@
>=20
>  obj-$(CONFIG_USB_RENESAS_USBHS)	+=3D renesas_usbhs.o
>=20
> -renesas_usbhs-y			:=3D common.o mod.o pipe.o fifo.o rcar2.o rcar3.o rza.=
o
> +renesas_usbhs-y			:=3D common.o mod.o pipe.o fifo.o rcar2.o rcar3.o rza.=
o rza2.o
>=20
>  ifneq ($(CONFIG_USB_RENESAS_USBHS_HCD),)
>  	renesas_usbhs-y		+=3D mod_host.o
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usb=
hs/common.c
> index 249fbee97f3f..8293f34b964a 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -44,13 +44,6 @@
>   */
>=20
>=20
> -#define USBHSF_RUNTIME_PWCTRL	(1 << 0)
> -
> -/* status */
> -#define usbhsc_flags_init(p)   do {(p)->flags =3D 0; } while (0)
> -#define usbhsc_flags_set(p, b) ((p)->flags |=3D  (b))
> -#define usbhsc_flags_clr(p, b) ((p)->flags &=3D ~(b))
> -#define usbhsc_flags_has(p, b) ((p)->flags &   (b))

I would like to separate this patch to some patches like below to review th=
e patch(es) easily:

1. Just move these definitions to common.h.
2. Add USBHSF_HAS_CNEN and related code.
3. Add USBHSF_CFIFO_BYTE_ADDR and related code.
4. Add RZ/A2 support.

<snip>
> @@ -620,6 +623,11 @@ static struct renesas_usbhs_platform_info *usbhs_par=
se_dt(struct device *dev)
>  		dparam->pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe);
>  	}
>=20
> +	if (dparam->type =3D=3D USBHS_TYPE_RZA2) {
> +		dparam->pipe_configs =3D usbhsc_new_pipe;
> +		dparam->pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe);
> +	}
> +

It's the same with RZA1. So, I think we can reuse the code like below. What=
 do you think?
+	if (dparam->type =3D=3D USBHS_TYPE_RZA1 ||
+	    dparam->type =3D=3D USBHS_TYPE_RZA2) {
		dparam->pipe_configs =3D usbhsc_new_pipe;
		dparam->pipe_size =3D ARRAY_SIZE(usbhsc_new_pipe);
	}

<snip>
> diff --git a/drivers/usb/renesas_usbhs/fifo.c b/drivers/usb/renesas_usbhs=
/fifo.c
> index 39fa2fc1b8b7..9b8220c2c9cc 100644
> --- a/drivers/usb/renesas_usbhs/fifo.c
> +++ b/drivers/usb/renesas_usbhs/fifo.c
> @@ -543,8 +543,12 @@ static int usbhsf_pio_try_push(struct usbhs_pkt *pkt=
, int *is_done)
>  	}
>=20
>  	/* the rest operation */
> -	for (i =3D 0; i < len; i++)
> -		iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
> +	if (usbhsc_flags_has(priv, USBHSF_CFIFO_BYTE_ADDR))
> +		for (i =3D 0; i < len; i++)
> +			iowrite8(buf[i], addr + (i & 0x03));
> +	else
> +		for (i =3D 0; i < len; i++)
> +			iowrite8(buf[i], addr + (0x03 - (i & 0x03)));

I prefer to add "{ }" on "if" and "else" like below.

	if (usbhsc_flags_has(priv, USBHSF_CFIFO_BYTE_ADDR)) {
		for (i =3D 0; i < len; i++)
			iowrite8(buf[i], addr + (i & 0x03));
	} else {
		for (i =3D 0; i < len; i++)
			iowrite8(buf[i], addr + (0x03 - (i & 0x03)));
	}

>  	/*
>  	 * variable update
> diff --git a/drivers/usb/renesas_usbhs/rza.h b/drivers/usb/renesas_usbhs/=
rza.h
> index ca917ca54f6d..073a53d1d442 100644
> --- a/drivers/usb/renesas_usbhs/rza.h
> +++ b/drivers/usb/renesas_usbhs/rza.h
> @@ -2,3 +2,4 @@
>  #include "common.h"
>=20
>  extern const struct renesas_usbhs_platform_callback usbhs_rza1_ops;
> +extern const struct renesas_usbhs_platform_callback usbhs_rza2_ops;
> diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs=
/rza2.c
> new file mode 100644
> index 000000000000..c0b5dfa4b85d
> --- /dev/null
> +++ b/drivers/usb/renesas_usbhs/rza2.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas USB driver RZ/A2 initialization and power control
> + *
> + * Copyright (C) 2019 Chris Brandt
> + * Copyright (C) 2019 Renesas Electronics Corporation
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/of_device.h>
> +#include <linux/phy/phy.h>
> +#include "common.h"
> +#include "rza.h"
> +
> +
> +static int usbhs_rza2_hardware_init(struct platform_device *pdev)
> +{
> +	struct usbhs_priv *priv =3D usbhs_pdev_to_priv(pdev);
> +
> +	if (IS_ENABLED(CONFIG_GENERIC_PHY)) {
> +		struct phy *phy =3D phy_get(&pdev->dev, "usb");
> +
> +		if (IS_ERR(phy))
> +			return PTR_ERR(phy);
> +
> +		priv->phy =3D phy;
> +		return 0;
> +	}
> +	return -ENXIO;
> +}
> +
> +static int usbhs_rza2_hardware_exit(struct platform_device *pdev)
> +{
> +	struct usbhs_priv *priv =3D usbhs_pdev_to_priv(pdev);
> +
> +	if (priv->phy) {
> +		phy_put(priv->phy);
> +		priv->phy =3D NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int usbhs_rza2_power_ctrl(struct platform_device *pdev,
> +				void __iomem *base, int enable)
> +{
> +	struct usbhs_priv *priv =3D usbhs_pdev_to_priv(pdev);
> +	int retval =3D -ENODEV;
> +
> +	if (priv->phy) {
> +		if (enable) {
> +			retval =3D phy_init(priv->phy);
> +			if (enable) {
> +				usbhs_bset(priv, SUSPMODE, SUSPM, SUSPM);
> +				/* Wait 100 usec for PLL to become stable */
> +				udelay(100);
> +			} else {

This else code never runs. So,

> +				usbhs_bset(priv, SUSPMODE, SUSPM, 0);

this code should be on the below "here"?

> +			}
> +			if (!retval)
> +				retval =3D phy_power_on(priv->phy);
> +		} else {

here?

Best regardsm
Yoshihiro Shimoda

