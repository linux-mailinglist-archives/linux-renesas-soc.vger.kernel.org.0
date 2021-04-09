Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE7BB359509
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Apr 2021 07:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhDIF5P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Apr 2021 01:57:15 -0400
Received: from mail-eopbgr1400123.outbound.protection.outlook.com ([40.107.140.123]:22657
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229905AbhDIF5P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Apr 2021 01:57:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hj35hanjgHAZ1OIaC2WND8DP5r04SX3rS4x4/BuxHp0VsQOsmNPLid6JKTe16jgwvJu6JEKTgFdzKqzZkhiTMxp9D1avRG2tw3qYO/i4I5cL3WwpruxqAUpqwioPEtsbZbBr792WjQORcHSrXabJVz3+B0IDp+cOtw8WU0cihrFlhCwGGwZP34JNx2Achp/JTs1Vm6eLLvnrtJdEuvyebh0zEZHjQmQU2OwimqesW0hkx9bugj6yns9WZPlH6xSGe6maW+PLbB1ik1IAgHZX78NaTbIV3f/OclFuUfDf21P8+dfznCH526MuA022m0mw4HNP/ofphpzYagOkYZQhcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvF0LrvGYV6RIUpT606ETjPRJ7E+hmFGAfQJF7da5kg=;
 b=m1zly10wq+FoQy4q8Q9E10xy+Ejkyq+IfMkEV4sf42GX7p+lMgDo1AnTQm+WH6H8TDfX8XPy/t3hcZk1IJDcugX8g8VrE2TJkX+MHbjZqTrhAJH9O4PAy03Hus+aDD9Df+WA0KhNyfHcwS8s3kHE0zrldAkHjO/CNTSDRJ8+BgKZfqRbxyNswtvuQxvpHjZvXROipFBCCDtz5JsznwF/o44YvuusvFoF0iVdwZAK71LoFzwjk2O/TSPttlTf3WGUw4ORLItRlB9QZ8CY9OXBqxHswGbWrrRcbSIp3wSZRm7cP6Ti/dZQ6HNTZ5L0zASBMVGqVZHi1nQKFrtFxAPQGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pvF0LrvGYV6RIUpT606ETjPRJ7E+hmFGAfQJF7da5kg=;
 b=rdCMKRxPZq068+GgaMf/jgak2v/F+XlIV6yZ+WJdGz65NwYMr20n0WLqZ7pJkaHbywDh5w6hCP4jQzbBNQas4KX1wVhYYzVmYn0XsCOmLz25TsPur3FgWeilWvnB8zXiQdx7OFsn3K6K28UqmU2InORJnv637pPCrU+GeT5GWfo=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB6010.jpnprd01.prod.outlook.com (2603:1096:402:31::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Fri, 9 Apr
 2021 05:40:50 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::e413:c5f8:a40a:a349%4]) with mapi id 15.20.3999.032; Fri, 9 Apr 2021
 05:40:50 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Subject: RE: [PATCH RFT] mmc: renesas_sdhi: enable WAIT_WHILE_BUSY
Thread-Topic: [PATCH RFT] mmc: renesas_sdhi: enable WAIT_WHILE_BUSY
Thread-Index: AQHXLHvpi2cdrsODpkCsh9njV+IrOKqrrBjw
Date:   Fri, 9 Apr 2021 05:40:50 +0000
Message-ID: <TY2PR01MB36920CDE15B59DD55825B2E5D8739@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210408133420.2900-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210408133420.2900-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0620bbff-07ee-41ec-e3ab-08d8fb1a0898
x-ms-traffictypediagnostic: TYAPR01MB6010:
x-microsoft-antispam-prvs: <TYAPR01MB6010C0AD4A0EB961A294F155D8739@TYAPR01MB6010.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bPHGUPy0lvgrnjlNUPNOff8T8XLAmkthaYV8GmMxmWcvFkLZVxOqZ5AbOCC3pgFx/aIOB1AAzyQmkYYOSQK3IzydyhocrI2rcPl/dKy6JKqReY3n8DebwSctuNC/6TB8rnqdUVzaj0TgfOsKfgUzNrbfNFf7eOmulKmIWKYwl+1AvFtNVe6Wa23s0nHmi2FqVNzfJAsz7ANQLmWfk9vwoq4gMzTJqwMIe6n7XS5PYvUMJdUNLeyROrNWAWAP8HCQGOIsfwwr4UoPWBbfxMSVvFfQWtpRKOUwp0iXOU0Q2oKIK9eAAz6F+I0EHL6ixspjK0sJoLnkO3SLubXr5HHoQe1HbLFW5pJ68vyhvbqLQSI0AxpBcweTj1hlNyLoB62kbYSHaazLHnRRZiuWskaAzh3kWWB4SO+aRhMXA7LLwn8mcVCKuOpYc9TzwCVkTkwNmetx9WpRc2UcURw+e3boyCDoI87H7B1vmsULO7cZFVpPSyqzdmrY6BFDh0hr+LcVAzlQVKo6DoVFBUFWJ3D8z6v0kC4cQlDo9okt3NAEyvDylaW7un/MCwNPL6IraDrtFF1qOBD+JcyNyh+wvBRplAGTWuYlD03rVVd5Ss17lZ5pHBo1CIe88nSqRK7EB73nIaB+sJd/Egrp85UBtcKX2ewglPzCg69F56DU9zPCgfY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(55236004)(4326008)(8936002)(64756008)(8676002)(478600001)(76116006)(38100700001)(26005)(316002)(66476007)(5660300002)(33656002)(66446008)(66946007)(66556008)(186003)(52536014)(7696005)(83380400001)(9686003)(55016002)(71200400001)(54906003)(6506007)(2906002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?dxfHRCTGSkMrhdfnb8QR1y/DzuOtgjqle7w3hDa0gqkX/oUdXG9ix6YE6dSb?=
 =?us-ascii?Q?gIkakGR3Sfh9JRYqVNUCNGAuOmFRLnGvz0pU7LXlTbdRvGpt9iTzLbEbzqt9?=
 =?us-ascii?Q?x+oo3YXNyAc+ZNv9Z5BLVTfNIY7HoIxpn2oT2/RxSKSQA/4zAPWz9xPyloYy?=
 =?us-ascii?Q?KcGdrp5MommADf+n+4tfqJZB6Rw4hgTOHRDzhIAlSymmsWj/AKv8913Waf3E?=
 =?us-ascii?Q?EdoF6JzbNPWv7KKxsvipE1OgU84yykJtRzAQrwWowzhjNhJ7yNbdtWUky/cL?=
 =?us-ascii?Q?8CzsIe8bYl2uBTLUh4IfZNvvy9n6+r4U2iUEO3i8SmBknvb9B49yW6J/vA1v?=
 =?us-ascii?Q?ueLPpgFIrUGDh7gFsqugmZ+O9JM6Y4iDNshwasfeCJWVl7OLAHIpnmxdT1cs?=
 =?us-ascii?Q?zj1caArEwnVgqG6Mux6bGC39+IVmbT6gyG0jbWfAzAEX9iwYSYBFOIqgMKS4?=
 =?us-ascii?Q?+6DXtl7QJ7zu7O0qv71on2Phdtc8NK8FMUpxxqjJ9LOIAJeXD8oIMIZiaL5J?=
 =?us-ascii?Q?hiizNp9HeUF5y4PiH4gmkpZPTPbLwBZKxD3D+5tqoSFy2lJ7H55/HXPlM/V/?=
 =?us-ascii?Q?d2ioFjtn93iZX0vlYhEQFXz67rsNvOJX1ofDdrGHEzhNTJ77GzrjrwRETx1A?=
 =?us-ascii?Q?xVfg0Yv01/dSXalYVrQNELO4t7QhJcFLzsZQ0TipJ4bHAHar57k6/xhLulHR?=
 =?us-ascii?Q?pbvYdug3+nh4Gv1DXJVdn+te8su/jKxFC9kC5u9VLPYkjRKzqqr79erPm9XS?=
 =?us-ascii?Q?NsWExMe1MnqxD0nK1aRT2RtNxe4GC1ZF3k3Tl9dz8V0FQbOAOf97QzQjf/rU?=
 =?us-ascii?Q?gyHX/9nPL0yG6s0a3E2vN9kyHKPOClCdNqqF0ghsxFKVfHhJrjPN/mamx9IG?=
 =?us-ascii?Q?G94yR3x+L8ik8icI3ijfyhnmiLRZYN9cHMpJA4/wHvZI54+l/38vdSNfu13N?=
 =?us-ascii?Q?IG68r2uUce5gQquGsVEIC6oStXM074kItvU3Z4pGYuIM8PX9yVsfMWyJQ3bO?=
 =?us-ascii?Q?qxUxmTXrYrkiZF5GfaMYoGPdXEx7Hs6AeIZ7Bgr/UBiiudMN1RvNAQ3e+2Gt?=
 =?us-ascii?Q?JT6b1LvcEaqiFaF7+mUfNKZH9NJQTFAbFJpnd+GIl2JmsbDMyEYFy612qsto?=
 =?us-ascii?Q?tdpoNM+DIrxrjqiEIqh3cjYpAzjUMnCMx5ngkjX5XHd+Ql+9K4BBIS9CWrpK?=
 =?us-ascii?Q?vdS86FJ7V1RFfdtKzaTiyZUygrU1pjT88RWOm+2/y+Ybzy5iC6Lkx9qISEGr?=
 =?us-ascii?Q?LqmbF+X4S/DZcweMdBp/NVoFAf1zjZaqz1weaySAp/igzcOG5pRX9gXQEYu0?=
 =?us-ascii?Q?vpZ2I8VcM77mpU/EGm6b/0bw?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0620bbff-07ee-41ec-e3ab-08d8fb1a0898
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 05:40:50.3724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a+sjVacUvvJiAs2fm48bp335xYMT8MoloMr3Eenr/bWHNb/0G8rhbo6s0dS81+CtdmqCblHa2fKMOhOGQhpH9uUJnxCjQmmBzCs7pNEVNbDBO1J4+U53CZUPNTlmjKV+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6010
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

Thank you for the patch!

> From: Wolfram Sang, Sent: Thursday, April 8, 2021 10:34 PM
>=20
> Now that we got the timeout handling in the driver correct, we can use
> this capability to avoid polling via the MMC core.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> I had this patch applied while developing all the other patches for
> TMIO/SDHI for 5.13 and had no regressions. Further testing is
> appreciated, but I am optimistic that we can enable this finally.
>=20
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 4 ++--
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/=
host/renesas_sdhi_internal_dmac.c
> index ff97f15e317c..47c795e79c21 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -94,7 +94,7 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] =3D=
 {
>=20
>  static const struct renesas_sdhi_of_data of_rza2_compatible =3D {
>  	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> -			  TMIO_MMC_HAVE_CBSY,
> +			  TMIO_MMC_HAVE_CBSY | MMC_CAP_WAIT_WHILE_BUSY,

We should add MMC_CAP_WAIT_WHILE_BUSY to .capabilities, not .tmio_flags.

>  	.tmio_ocr_mask	=3D MMC_VDD_32_33,
>  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
>  			  MMC_CAP_CMD23,
> @@ -111,7 +111,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3=
_compatible =3D {
>  	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
>  			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
>  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> -			  MMC_CAP_CMD23,
> +			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
>  	.capabilities2	=3D MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
>  	.bus_shift	=3D 2,
>  	.scc_offset	=3D 0x1000,
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/=
renesas_sdhi_sys_dmac.c
> index c5f789675302..0a3494fcc5e8 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -31,13 +31,14 @@ static const struct renesas_sdhi_of_data of_default_c=
fg =3D {
>=20
>  static const struct renesas_sdhi_of_data of_rz_compatible =3D {
>  	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_32BIT_DATA_PORT |
> -			  TMIO_MMC_HAVE_CBSY,
> +			  TMIO_MMC_HAVE_CBSY | MMC_CAP_WAIT_WHILE_BUSY,

Same here.

>  	.tmio_ocr_mask	=3D MMC_VDD_32_33,
>  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ,
>  };
>=20
>  static const struct renesas_sdhi_of_data of_rcar_gen1_compatible =3D {
> -	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL,
> +	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> +			  MMC_CAP_WAIT_WHILE_BUSY,

Same here.

Best regards,
Yoshihiro Shimoda

>  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ,
>  	.capabilities2	=3D MMC_CAP2_NO_WRITE_PROTECT,
>  };
> @@ -58,7 +59,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_c=
ompatible =3D {
>  	.tmio_flags	=3D TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
>  			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
>  	.capabilities	=3D MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> -			  MMC_CAP_CMD23,
> +			  MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
>  	.capabilities2	=3D MMC_CAP2_NO_WRITE_PROTECT,
>  	.dma_buswidth	=3D DMA_SLAVE_BUSWIDTH_4_BYTES,
>  	.dma_rx_offset	=3D 0x2000,
> --
> 2.30.0

