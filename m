Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F71D52C119
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 May 2022 19:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240860AbiERRcb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 May 2022 13:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240857AbiERRca (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 May 2022 13:32:30 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2127.outbound.protection.outlook.com [40.107.113.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C571115E4B1;
        Wed, 18 May 2022 10:32:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oq81Ge9uKFFG3WeTbht/hlUgbdo2e2UmObwHRZsr0WGL1FlJExflX7AGf/w/iJ9/mwO+FJ+Rf2J/epxwHlY66+zsbCBu5ZL9xz+wMGhupcj6yYAvPNU3XnDsKSykXcXeZ3Ttw8WLEGvQU9v6G/yxEFmHCE01XMvA6PPkgL3mBiC6dSl7qUGpLJDb0ij9ZiH0KQRqfTmISLlHhYZOg/UOS4+8l3Em+FL7P1m9/gUtCvV9xZzakUDXLSIOYF7NeONgV5LUnfVWVUHu5eIlgmdYKY8hs2Jb62VomhWAQqJKDbzGcq3XNP1vdk6gxbiFXic/uMfS6dNkztdMWxkbTB+afg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4irn0YH6Rq8joCJATXY0qEYjHIaTLrJpWK7qXZ8MmUE=;
 b=SuhGs/DGnUcbYrQCdMdplQ2/y/F3wsxH4DOn/hl3pJN0fRhduWcoXdmFNCah1gUzr3F6BQMVZKC0hkmL6EOsvqEqzs6sHSZSIqK9elEFQPoAGBXFkeYKgpw4seRUROfviRhZZr/vaE2iIxVvb5A9BpLcTkHjHl/d8cM66oElNXAAyleZNqfUsbOXElDgUeaLnVdiYvw0YlZ9IxBFnNG8eafNWCZrRDCtLtJM2QTqxot3fH2vjWAAUfRd0YTU6awH3Fp0hCn3YICzdPvHDuKDn81RdQxLUdIKPgykoQI33eEfN9cHPxSKEm/kTLlPdreOvt3ohhxo1N30b2zEHyst8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4irn0YH6Rq8joCJATXY0qEYjHIaTLrJpWK7qXZ8MmUE=;
 b=EPjRDm5jGkBiq/edEFrCnH6A8p0AC+51HaeNtt6OuhuhAuntERjt24wcpLUS/KjVFI5VKVWHyup952qE2Usb07nwIbPvk0aVAAQYuQtScc7Gr2G3SQOVZ3sLi+ki8pjZyeOY7q8nwn3hc8zkvCSN+SQH0O1zFYvA9lcRJOCVBTA=
Received: from OS3PR01MB7080.jpnprd01.prod.outlook.com (2603:1096:604:128::5)
 by TYAPR01MB2671.jpnprd01.prod.outlook.com (2603:1096:404:8d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.13; Wed, 18 May
 2022 17:32:25 +0000
Received: from OS3PR01MB7080.jpnprd01.prod.outlook.com
 ([fe80::d00a:6df:2d6b:70d4]) by OS3PR01MB7080.jpnprd01.prod.outlook.com
 ([fe80::d00a:6df:2d6b:70d4%7]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 17:32:24 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Ralph Siemsen <ralph.siemsen@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [PATCH 1/3] clk: renesas: r9a06g032: Fix UART clkgrp bitsel
Thread-Topic: [PATCH 1/3] clk: renesas: r9a06g032: Fix UART clkgrp bitsel
Thread-Index: AQHYaty0mDtRz0dJ7k+Cw/24h1mfya0k4/pg
Date:   Wed, 18 May 2022 17:32:24 +0000
Message-ID: <OS3PR01MB7080DCB265038C9C9094BC47F5D19@OS3PR01MB7080.jpnprd01.prod.outlook.com>
References: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
In-Reply-To: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6bf1b651-e625-4aea-73ae-08da38f45f5b
x-ms-traffictypediagnostic: TYAPR01MB2671:EE_
x-microsoft-antispam-prvs: <TYAPR01MB2671BB072452B55076D73F79F5D19@TYAPR01MB2671.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vr7qopIMRsyGE6nOPDo+Je1sv+NQNp0VMHSqZbZr1dmsFC6PVP1U6AHJxHiWIqlSHcTS1xXiosN6PVKuMuM+PyMlLE0eRqlIYQNIfrFF0AdWOvO5aFCzn5yHbUuGnWKWmCThf4q8NsnBRyrsxzuoXiN1vxPS7wcHTvJjRlKUm+JyZDGjERoxt4HipsblFBcVN5Bvf2DqwoSdkhLfaCin+Bsh12gzZbMRhWiWvAYSolZLh7Uw0m2qxFQhwuTqK0QZB3oE5gsVt27eJD9oYZHX5mZx/lb85q995UDsnOiqlcwXomi+6D5ZOQ4hhMAeS4f9BGpa9zbxpH5lKgKqcW9N1KDhqarhMN6/5fEQA5+pdxc66e9l8qwPkP+GDLg5LrtP5fdhOro8F0tTT7Ot2UR3tklKhRkjyOYiAKH9LH1LVGPhOQs4uWlDBIv+yPI7XxPVtxbRC8JyN/a7yefn4LvUg497xJDQg1YRsxvhvb8bVXYvf5ImKBdIXk+aI0B/IbwpbnNV3Z/QV0jpP8mPJGJOiEknPRo0V1joH/tiPmrP3LCykJUQJZ0bE0aq4dXWMrSFyol74Pv7Lj4aBcxXj04PuURtybHJEnJtjNAjjNnTAuIrfCOr4DoeRa2FQWD8wjK4ncnYSeZXjER4xMn84PS8g60hLojzgBpMUhXx8FkcjdT1CxJJvr/2x1hfXUGg8eRlyfhAd0Rcx6p9Oycf29598UmYOa4gYgGe6ihQ66F/30c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB7080.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(33656002)(26005)(122000001)(9686003)(38070700005)(38100700002)(52536014)(8936002)(54906003)(508600001)(7696005)(110136005)(86362001)(2906002)(71200400001)(55016003)(5660300002)(66476007)(76116006)(83380400001)(4326008)(66946007)(44832011)(186003)(66446008)(8676002)(64756008)(66556008)(53546011)(6506007)(40753002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ppS1jeTWCi+xJeKPrp+Ya4fleGpdO7hkg23BmG6ndgXONRXdqIpiU2yy5eIQ?=
 =?us-ascii?Q?mWzm8qUp4wK8kIaG5SwfIXgaN5P6fF73tOZvj+92fFfQJMCQbDVRxRwEkXbn?=
 =?us-ascii?Q?j/dW8CuFYVVZ4v1nvTYP56URQB7Pt0XZMNqxkEzRN8bCqzUbKq/lYqVtuicu?=
 =?us-ascii?Q?QhbeZFlGQE5OW1Z55lHhPX5byf9yIzOIe0Tfc+fxm0rsjgHSslNSWO90UnK5?=
 =?us-ascii?Q?rpDgDJUqgABc41d5Ol/8PZ8pPmbBoP/eRHCSl+6gqRuByUyJJnyxudozktVt?=
 =?us-ascii?Q?Bgn0MKHZL82sn8pCFVTGkymcqhbDY73sOuWI4xqcCVCZJ4st7Xb4rJ+ou53b?=
 =?us-ascii?Q?fqIUbXXDA/RSEhKwz3/bQbF0AKSCqM0Xeb0lPSYH0DK7aepo+I97ILFVsh8M?=
 =?us-ascii?Q?Vq9touxlsBXCVSNkQDMjyDOHz3Bwl4ffS+z2idTBOtlN5Lz3c0bpaM2jxlRU?=
 =?us-ascii?Q?Da6eUHJ5oJrg7mGWGN45oI8mzoUKfVh47aPYU9la5ZMT8vmsHdsZJOUckooJ?=
 =?us-ascii?Q?+E278a0FcRg1NI+uktg6FOpmRLO00paNw0VFV+buSvsHU8BeD3oAR7paqM+E?=
 =?us-ascii?Q?EB5Hoc4VkeBp5iVuDARnMt8MSiekxv5jHQsKw6G7UrihCRaTADeb79j0A6lu?=
 =?us-ascii?Q?1a5RLQy+9B+ZFuWtRCvagXI8amnSobMuec0uYNCfOYOmzLol5CaebIVfgH2d?=
 =?us-ascii?Q?wk43Emh+92uhOWEuJSUylabbHjyb4KFcwI0ds7grRL1JD3aBhXk5vcu5DeA0?=
 =?us-ascii?Q?CyF3pDQVmGeUzhxK8l7iy7SSsxQEtJa8Ee1rIf3X5/N0+pPcVyAlFwXTCXfO?=
 =?us-ascii?Q?BAo2z8In+zb8b8lyEzxP9+wVIaCRsS9m8LtKyPxkV5/08NjBvdKRfvLPn51Q?=
 =?us-ascii?Q?8FT9N2hQj2IOQdG8QSJcBsN4lU2c+cUaCq3PXHY406MfRtg4ok5W5NwlTlFl?=
 =?us-ascii?Q?vV6NGwp4ktdP6IZrAC08RW44Fmov5maAlVm2llkib7k4hmYk2TV7fSorbzkM?=
 =?us-ascii?Q?x4Le99IC2+3MKH7iONpninFnIxWerTPbSM0eAHTUdMN/erySthPLlZGMNl8w?=
 =?us-ascii?Q?L/XFGTE9yfxjTz2zXVrPR6+BAlah03Bd4oH0w6W0I1ddm2wWkFc1F9AfAG3m?=
 =?us-ascii?Q?BI6Cwf/puJDU3Cc4XNYWnUB6oIn0Lm29/dVeMxZv8g2zdMFDNWZOfuKKDrjA?=
 =?us-ascii?Q?U5d6C7HWn/EPqL1nWTsMjk+rZPCqe1bYAMD6djeb3ipNucx69ki1vlbzFDUq?=
 =?us-ascii?Q?9fFerxX92La18CB6Ap48r5fK5n2dUdtrZTzS8r2NZyJ0SRkAJKZdxkXNV6vn?=
 =?us-ascii?Q?vTqhqjThJyyTq5Eph7OVwOwZHKx174r7ZkCXhnTVT9RWzpeEnsOlFXorAtxI?=
 =?us-ascii?Q?rZYidIBWpouBvzpYETAZpj0/raKl4ocPDLyK4NWFythGD3Fn4yjjY8dz1bYt?=
 =?us-ascii?Q?rRNq5Q5tVulr0mmNmQ1Qy3M77aQE3yIFkPM7+AEKiNMTycd0Kss+KxoSi5Dl?=
 =?us-ascii?Q?Od6Eu9AVyMJ0wvUWoIy++vJL2Mt+iiBAq8FAdXK4lb2CVYoVeJw38E9iV09U?=
 =?us-ascii?Q?aS7o+7lUoWUGYRIdPVMcDa2JFlTqtk1gUzQxvyMNYWsv+E2LfBeqEptSK0XA?=
 =?us-ascii?Q?eHLhRLsMJMEKZOfwWrEDZQbzk5X/ehnOEkyLhtDV9+IhuRjnqhArOBnFexJY?=
 =?us-ascii?Q?JAZKRGSN3r1JUyVEuYzOJ0Gp9TRxfhrkvpOWRURvhWWyusJslMxvAjGP9GBJ?=
 =?us-ascii?Q?PqBSYPPKw9Hf6iAzInzFzhAOU6Z0+pE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7080.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bf1b651-e625-4aea-73ae-08da38f45f5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 17:32:24.8882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w3fDlChMHtPubvRqDKN4VMYf9q9VsbDWJBa47FF4XNa3SWCNI23xZWyQ3rWZ4Cj4MAAxdhmvz+sO4JrXuebfy5aBt2YXqbCegvCgNVVHJAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2671
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

H Ralph,

Thanks for the patch!

On 18 May 2022 18:27 Ralph Siemsen wrote:
> There are two UART clock groups, each having a mux to select its
> upstream clock source. The register/bit definitions for accessing these
> two muxes appear to have been reversed since introduction. Correct them
> so as to match the hardware manual.
>=20
> Fixes: 4c3d88526eba ("clk: renesas: Renesas R9A06G032 clock driver")
>=20
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
>  drivers/clk/renesas/r9a06g032-clocks.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c
> b/drivers/clk/renesas/r9a06g032-clocks.c
> index c99942f0e4d4..0baa6a06ada8 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -287,7 +287,7 @@ static const struct r9a06g032_clkdesc
> r9a06g032_clocks[] =3D {
>  		.type =3D K_BITSEL,
>  		.source =3D 1 + R9A06G032_DIV_UART,
>  		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG1_PR2 */
> -		.dual.sel =3D ((0xec / 4) << 5) | 24,
> +		.dual.sel =3D ((0x34 / 4) << 5) | 30,
The comment above also needs swapping.


>  		.dual.group =3D 0,
>  	},
>  	{
> @@ -296,7 +296,7 @@ static const struct r9a06g032_clkdesc
> r9a06g032_clocks[] =3D {
>  		.type =3D K_BITSEL,
>  		.source =3D 1 + R9A06G032_DIV_P2_PG,
>  		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG0_0 */
> -		.dual.sel =3D ((0x34 / 4) << 5) | 30,
> +		.dual.sel =3D ((0xec / 4) << 5) | 24,
>  		.dual.group =3D 1,
>  	},
>  	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0, 0, 0x1b2, 0x1b3,
> 0x1b4, 0x1b5),
> --
> 2.25.1

With the above change:
Reviewed-by: Phil Edworthy <phil.edworthy@renesas.com>

Thanks
Phil

