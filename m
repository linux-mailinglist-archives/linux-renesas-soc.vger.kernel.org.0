Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 524E41E969
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbfEOHw5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:52:57 -0400
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:63808
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725876AbfEOHw4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeFXUESGBNV9v5Dfv/wMbT25CAfPaXQ9DYXLriHte/E=;
 b=ki5XwyMtd8YBWbFPKXCzCwTBGckyN34rMa9vLuV3H315zwGr6RrWH61jglst0fyaJ5OLDKSr3SLGEpwLdUXJHpniavDa/otamXpGCx//otrcCbGJONfa7mBCzQpQJo91w3JRAL19/4YpmmKi/H6Cfrm/6BBPs3sRTPCZ0fGoM6Y=
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com (20.176.240.146) by
 OSBPR01MB2392.jpnprd01.prod.outlook.com (52.134.255.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Wed, 15 May 2019 07:52:52 +0000
Received: from OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213]) by OSBPR01MB3174.jpnprd01.prod.outlook.com
 ([fe80::f873:6332:738d:7213%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 07:52:52 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Chris Brandt <Chris.Brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Simon Horman <horms@verge.net.au>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: [PATCH v3 11/15] usb: renesas_usbhs: Add support for RZ/A2
Thread-Topic: [PATCH v3 11/15] usb: renesas_usbhs: Add support for RZ/A2
Thread-Index: AQHVCmVwjUCgqhn2dUikkOJj83EO1qZr0Nuw
Date:   Wed, 15 May 2019 07:52:52 +0000
Message-ID: <OSBPR01MB3174F7F91A11317D353BCE9AD8090@OSBPR01MB3174.jpnprd01.prod.outlook.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-12-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-12-chris.brandt@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73ee33d3-9c24-42c2-369e-08d6d90a5545
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:OSBPR01MB2392;
x-ms-traffictypediagnostic: OSBPR01MB2392:
x-microsoft-antispam-prvs: <OSBPR01MB23926F40F653ED6D210A7D0AD8090@OSBPR01MB2392.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(396003)(136003)(376002)(366004)(39860400002)(199004)(189003)(33656002)(54906003)(26005)(74316002)(6436002)(110136005)(9686003)(55016002)(14454004)(229853002)(53936002)(6116002)(5660300002)(186003)(478600001)(316002)(86362001)(25786009)(4326008)(52536014)(66066001)(68736007)(107886003)(2906002)(6246003)(71190400001)(66946007)(64756008)(256004)(8676002)(8936002)(81156014)(7736002)(305945005)(71200400001)(76116006)(81166006)(102836004)(66556008)(3846002)(73956011)(7416002)(476003)(446003)(486006)(66476007)(76176011)(99286004)(7696005)(66446008)(11346002)(6506007)(14444005);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2392;H:OSBPR01MB3174.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pcMe0yFR/weIoUgWrymAkAbIBU51r01PiltrEVSxtiWkY8LS2lXnab1JgLAIVPb5Z3U94quN5JJJTWU+AzOud4mrVCRA7GpSafB37KZaDuhtXkMuIpdlXJqe/Kg7zHmFGTsgq+wvH08HCyZvOErxQjSZwtIzbZVvIRUJn7glKitnfm0xeR6bC4yxwKvtErf3JltCqTseS4cHoB798DSeVlz0OZUErkTSGKw2bM1GN6NkLozAAqRAtuXUCQ7oN+HVOnhVxEr1/5p0hQshMLfy9xCl++I0L8dEigCI9IAi1yQjahtNiUuVC0XBEHOzwNAy5uR4/lzXQy9233WyAfxB7LBTIEYgWqlOrHulW3eU6TdHkSZm67O2ROEG+/Er0kJxpHWWI5Bqq31eZAXu0iyfzVT2uHgWB7+b7536Ax3ew/4=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ee33d3-9c24-42c2-369e-08d6d90a5545
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 07:52:52.1714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2392
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris-san,

Thank you for the patch!

> From: Chris Brandt, Sent: Tuesday, May 14, 2019 11:56 PM
>=20
> The RZ/A2 is similar to the R-Car Gen3 with some small differences.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v3:
>  * Removed check for CONFIG_GENERIC_PHY
>  * rebase on top of Shimoda-san (v2) patch
> v2:
>  * combined RZA1 and RZA2 for fifo setting
>  * added braces to make code easier to read
>  * fixed and clean up usbhs_rza2_power_ctrl()
> ---
>  drivers/usb/renesas_usbhs/Makefile |  2 +-
>  drivers/usb/renesas_usbhs/common.c | 15 ++++++++
>  drivers/usb/renesas_usbhs/rza.h    |  1 +
>  drivers/usb/renesas_usbhs/rza2.c   | 75 ++++++++++++++++++++++++++++++++=
++++++
>  include/linux/usb/renesas_usbhs.h  |  1 +
>  5 files changed, 93 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/usb/renesas_usbhs/rza2.c
<snip>
> diff --git a/drivers/usb/renesas_usbhs/rza2.c b/drivers/usb/renesas_usbhs=
/rza2.c
> new file mode 100644
> index 000000000000..56409cbae33c
> --- /dev/null
> +++ b/drivers/usb/renesas_usbhs/rza2.c
> @@ -0,0 +1,75 @@
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

I should have realized this on v2 patch though, this double blank lines
should be a line. After fixed it,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

