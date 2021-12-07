Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA3046B00B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Dec 2021 02:51:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234761AbhLGBys (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Dec 2021 20:54:48 -0500
Received: from mail-tycjpn01on2125.outbound.protection.outlook.com ([40.107.114.125]:52480
        "EHLO JPN01-TYC-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230223AbhLGBys (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 20:54:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BSPTLoj1VZIQ9+xX95igHwhJPVJjfvfiXxVhOQM7u8ssirns0HP4hal5cHk/0oShlAQr4OcKU9dMEnmd73/cVeUdAfCELPKfwxVEPmgVtXePK7t0CtgIUHYxTI6+xmo2os03WAWcTmIs/ZJIZW1ChTOyhHixrxNGPCOKj8LbEBvmQmMAd4Z+dNDSCUnfHQclXiVA91+Twdb2sJnGARvfi5cuf89rQN523zbvxGP0YkfisxkHZv/npGAtxFe3/WGR+D6AY/x+7hMea12c56QGI0RqopzrQ45pSWT4VMoe2emqRH0D5Uz2K6W1R9mKs+/ts13OqQbwByRWLFaV0Ne3/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZYy117X4OhUCP2vho5TBzePH47c5bVEI/zHh3yLb70=;
 b=mBMQW95Ii+9q6Vn4oKMpMw7E12lt1Qeyq7sr4FwX39WxMuk+zkRDyrVkpBiEAnD9N2b/KnjRd1bmx+IKQeFwLnaALVSI6Gs6LNsjL5LAFOdDUOA0+ladXC4IXUQI4n6rVqMg2H97dDhTjGL21xvpsT90lEXYPwWE2CnWi+FUxs8cVXKxdy+hF2rqTP6HT3xAJbrWhw4Ohbp1pCq0mJbD2r0F/Lmzq+vWrke3B0OH6p5Bs5W1ABzVNOyN+Ij1FDELPwHxfmO5x7m1eocZBhJ4N4a7O1Idl6uGVVOcf1kfLM7ONDBEOLnKGH5vpb3YIqIJwkU7zdbHLXcbU7VaJ5f3hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZYy117X4OhUCP2vho5TBzePH47c5bVEI/zHh3yLb70=;
 b=AeWDrTDMTHL1yX++XZsGOyCWuTWNprDSZBY+d/gpACA0+W2J/LxdSS2E1Kti7OfTjZdzV6VPmDSfaACmMKXrPe+UMxGyTGyuMHxCm3yIH1Zk7GAEYIYH4s5EiL3AZ/JnIkJ9h+lWNeTIVny3lurVbwlOYZKmLjbzfec8BeKxfpg=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB2059.jpnprd01.prod.outlook.com (2603:1096:404:e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 01:51:09 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 01:51:09 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH v2 08/14] clk: renesas: rcar-gen4-cpg: Introduce R-Car
 Gen4 CPG driver
Thread-Topic: [PATCH v2 08/14] clk: renesas: rcar-gen4-cpg: Introduce R-Car
 Gen4 CPG driver
Thread-Index: AQHX5oW3Fz6Yxsmp8ki72IkDvcqhwqwlcHAAgADZdjA=
Date:   Tue, 7 Dec 2021 01:51:09 +0000
Message-ID: <TY2PR01MB36922481D5C75272BA7B7D9ED86E9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
 <20211201073308.1003945-9-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXwYqDO2q=SYC=r299QB0TRgga4-ijDCdA7tordBw1OUg@mail.gmail.com>
In-Reply-To: <CAMuHMdXwYqDO2q=SYC=r299QB0TRgga4-ijDCdA7tordBw1OUg@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0d2bc265-bec0-4918-e384-08d9b9240a77
x-ms-traffictypediagnostic: TY2PR01MB2059:EE_
x-microsoft-antispam-prvs: <TY2PR01MB20594A478E03F32F46C71D17D86E9@TY2PR01MB2059.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EoOkJC0rKBtMtfVCS/lBF9AOdFY+hvoujsq16cNL7J5tM69kP6RAUvyXexN4x7rgGeSKcWJ93iILrQAA4BS5GobgfU2so5ct0W6k+oMZCq5F7F3LlgGcgNKLL2Lb440Wr9pZA0bXewvpFn4O6p0+1xF0m5ORlDuKQ8Rzw/6LQU8G9gvgyyevrGxN4ebSxgkFCmlgyQIqWkIDQ/9T1btaZ8eLIb9nd0kBw+MTKhEWT2zpoVuMTHrDfzIyqkPEkT9D7sUqsLHHmNMgvuZHmcVvVZlMde85c8+zqs5+wBrZAN0GzL8sphOpmm/v7jZpAHa6vtAKY5jXxadGXbnOO8Yfht/jWzSedsWQDfubejmquO1m0als6f681byYh7Vwv801GJ/GXBF9cK+uGxCrUFxCva08bNwEBYjLHLDPw5LUinCgz7EK+s+gesspvKb2tAQ7A9Mr6+dKqiKRvq9PdZJ+KblSi0huQq/JzqE4wadjgn7d26s1NeC3HUZN+57XD5YTrNSZVsltlBY03gLdd6O6ECOSoy/Q8sSRBBnwrMhSvPW/Z6gwiJgwIvElm38KT6RzH8k627ZpITSTHzk3OIiGhdGYPQqBOyIgScz/3v9ktM2F9DB5r1bD6S9qwUvNJo6fPDMKuiNyNCBPkTi327Br1wDCcHoCeNPL8YjvhTrooA0NHIxutvWNFItBpkTqIweRvhRHCaU5pcV9o8mtDVEG7lh80DZOSursnwNMqV+iy+ad1g90Xh4aKdjcJmTtwSQwxu65xmVTEc1ZMJhEhruu1sqn4gTYgDr4bWiJWi2UGBw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(316002)(66946007)(186003)(6916009)(76116006)(508600001)(53546011)(54906003)(26005)(66556008)(66476007)(66446008)(64756008)(9686003)(38100700002)(71200400001)(6506007)(8676002)(122000001)(7696005)(4326008)(2906002)(8936002)(52536014)(55016003)(5660300002)(86362001)(966005)(33656002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dXUDotpxcGOHJlEBtD6EUFsuGWrTrEk3cOqvpwEDYLngpuMkGMGmhwcJv1Ug?=
 =?us-ascii?Q?NiEKg9qQWl/ARVtLn4TBlrmZm+ISY1AiaSsjQw3dLSwAuGXhCtUNO/L1dzXA?=
 =?us-ascii?Q?V17ajt+/xYfD/NrohzWkdNzaG5iEC+D0dFl5ED2cMYBXaansdvRnC6n3peab?=
 =?us-ascii?Q?75OcsQHjZEVRGSmFB4ChsBAQtpDTmX3wFQwTg91R0ebRvoyCM7nKgQ2xwR0d?=
 =?us-ascii?Q?jzAzI9CfRd5D3MLonGcRiEiaakfHJEfxl8spHPs0/mH6lHNAwDLdj7CCyvQ5?=
 =?us-ascii?Q?sKfUYRFhvYe41W4yJknb8dk57jLE8euNJ7nNRW9GUd2N2+TA9I+fSVF3jAAd?=
 =?us-ascii?Q?0zrNXxUWlNoi1Z0imJeM+hvSM2YDdCg0qVJt6Ly7fExxDHlmySBLt+1LevKU?=
 =?us-ascii?Q?oBtvqnU48mtiYnxbkoM2AMkbme1+aYOCTUOjnDbvzboKLZ53XtObfPhthUk8?=
 =?us-ascii?Q?TX1dTtCjD3IPmVojK8kOiDW9uS6kI/u56prra5rehhAKbufXHF1EqL7wo5x7?=
 =?us-ascii?Q?nqSLw7kHs2MTguipL/K87Ark0BajeUEfG9tG3tW5n/FV/WJbliE8bDfK7YrB?=
 =?us-ascii?Q?n6LLDwUCIqxFulj3fi0Afs86rgRwOu3WvdkR4ky2iBRAVvO5sS1vwgt6RKPR?=
 =?us-ascii?Q?/w/MoEYICy6Joi2xsZE2T7vtBfnOmOAfhZ8nb4ER8/ZOLDxFhW4rsgAzTBhs?=
 =?us-ascii?Q?N+dW7pd/zr7tfCwCz56j1l6K6N1cGNTA4/kYsiEMaVENzALisQxkWS9MAuS2?=
 =?us-ascii?Q?0VI2frLee7p16JuyGYBDVuRwsGgdQI7GWGev+PHlB/o0Ow3FBKnNlyAIaBZu?=
 =?us-ascii?Q?IYsfHt9dXSVpWN963IlZlB8MwWO2R01zP/YgjorvuQFha2JNlm/pJSyT9fkC?=
 =?us-ascii?Q?GazFtjVK4chjzdQJyzn/h3hqXq0k7hSXmhjK49Xq8UB28F/yf+YE2ElyOVRT?=
 =?us-ascii?Q?hHRFKLIX2AIxauseXuzZFZjPEDN6vIJgU9fw+kXtDSx4FjWg6JZucDQBzcUy?=
 =?us-ascii?Q?89GCz+yKD1t4I6RS98PjFq0TU+lGTOA3LKwDK3MkxGmP8+4G7yc/CCHl8W0J?=
 =?us-ascii?Q?tHqhWoeut/gLAbVZI2d7OWFSncW5erERp6+NyJKL+IBIjWCfGlxCVyu/vlQe?=
 =?us-ascii?Q?F7lCfa4UKxQ4Jc33Bt5vfXSdYImudpKRlSn8dwDTHdewn0y0je9twp1E24aL?=
 =?us-ascii?Q?IilmzDDUeUaPrymRkewRER4An1BP5eIuHjcEQSRZn8/StKDt9Klim/4/4gtF?=
 =?us-ascii?Q?tt2bDOiUX1FNRrn2CMN9FD1HKzXoS9J86NABF4GyR6K9TCRh/btN2b9ALSUs?=
 =?us-ascii?Q?NCyGeb5BceyWsuGd7XpWJY9Yj4vhnJt3jtIMizoTuCYXwINBZ0/P7t0v3SDN?=
 =?us-ascii?Q?YZnd7NoIY89+1bNzy0pJ9f0t195IRNpFXVGOyxYt13LotMHB8FkO3L2+EDhj?=
 =?us-ascii?Q?qFFDFp4NuW2zB1Y60vi2kIhEOBMptiOWR0Rh8xTWWF8YVgxLvGhayPbk4hiQ?=
 =?us-ascii?Q?ZpNTjy9WlmRsMC0GnUvCbVS7kzeUXKiJmwBYQWCgEnxgPZKAbGetVSpNcHdY?=
 =?us-ascii?Q?6sveVNW5gPG2zx4YHXl2NDATHsLe7F4B9b1knAgcn/HHhBbvc6zbj00Qp7RC?=
 =?us-ascii?Q?AF92OWfCZBRTzLIj88BMllxzoXu42e9F40iIaVb0BVFRffbUPma6d92nicAW?=
 =?us-ascii?Q?OMxOlmttG8NuPZW54+x1ygJ6Joz+Ny49YZ3UreAd9eP7kxPKAEaoNdACOYaR?=
 =?us-ascii?Q?T8y8GRqw1Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2bc265-bec0-4918-e384-08d9b9240a77
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 01:51:09.3807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: saDxDnNCN0Bs79ryF4rMbhogkKkvVJubu2vz/4caQHzG9jY6RVPtFkcMZKy391nN6n+ReblllptVWc7NsZ5pvT7WIq9ZBwlYSGGWiUH/DK34Hg1Ryxr+S3zdTDJgjEbB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB2059
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

Thank you for your comments!

> From: Geert Uytterhoeven, Sent: Monday, December 6, 2021 9:43 PM
>=20
> Hi Shimoda-san,
>=20
> On Wed, Dec 1, 2021 at 8:33 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > According to the official website [1], the R-Car V3U SoC is based
> > on the R-Car Gen4 architecture. So, introduce R-Car Gen4 CPG
> > driver.
> >
> > [1]
> >
> https://www.renesas.com/us/en/products/automotive-products/automotive-sys=
tem-chips-socs/r-car-v3u-best-class-r-car-v
> 3u-asil-d-system-chip-automated-driving
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> Thanks for your patch!
>=20
> > --- /dev/null
> > +++ b/drivers/clk/renesas/rcar-gen4-cpg.c
>=20
> > +/*
> > + * RPC Clocks
> > + */
> > +#define CPG_RPCCKCR 0x874
>=20
> This is also defined in rcar-gen4-cpg.h, so I will drop it while applying=
.

Thanks!

> > +
>=20
> > --- /dev/null
> > +++ b/drivers/clk/renesas/rcar-gen4-cpg.h
> > @@ -0,0 +1,76 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * R-Car Gen4 Clock Pulse Generator
> > + *
> > + * Copyright (C) 2021 Renesas Electronics Corp.
> > + *
> > + */
> > +
> > +#ifndef __CLK_RENESAS_RCAR_GEN4_CPG_H__
> > +#define __CLK_RENESAS_RCAR_GEN4_CPG_H__
> > +
> > +enum rcar_gen4_clk_types {
> > +       CLK_TYPE_GEN4_MAIN =3D CLK_TYPE_CUSTOM,
> > +       CLK_TYPE_GEN4_PLL1,
> > +       CLK_TYPE_GEN4_PLL2,
> > +       CLK_TYPE_GEN4_PLL2X_3X, /* r8a779a0 only */
> > +       CLK_TYPE_GEN4_PLL3,
> > +       CLK_TYPE_GEN4_PLL5,
> > +       CLK_TYPE_GEN4_PLL6,
> > +       CLK_TYPE_GEN4_SDSRC,
> > +       CLK_TYPE_GEN4_SDH,
> > +       CLK_TYPE_GEN4_SD,
> > +       CLK_TYPE_GEN4_MDSEL,    /* Select parent/divider using mode pin=
 */
> > +       CLK_TYPE_GEN4_Z,
> > +       CLK_TYPE_GEN4_OSC,      /* OSC EXTAL predivider and fixed divid=
er */
> > +       CLK_TYPE_GEN4_RPCSRC,
> > +       CLK_TYPE_GEN4_RPC,
> > +       CLK_TYPE_GEN4_RPCD2,
> > +
> > +       /* SoC specific definitions start here */
> > +       CLK_TYPE_GEN4_SOC_BASE,
> > +};
> > +
> > +#define DEF_GEN4_SDH(_name, _id, _parent, _offset)     \
> > +       DEF_BASE(_name, _id, CLK_TYPE_GEN4_SDH, _parent, .offset =3D _o=
ffset)
> > +
> > +#define DEF_GEN4_SD(_name, _id, _parent, _offset)      \
> > +       DEF_BASE(_name, _id, CLK_TYPE_GEN4_SD, _parent, .offset =3D _of=
fset)
> > +
> > +#define DEF_GEN4_MDSEL(_name, _id, _md, _parent0, _div0, _parent1, _di=
v1) \
> > +       DEF_BASE(_name, _id, CLK_TYPE_GEN4_MDSEL,       \
> > +                (_parent0) << 16 | (_parent1),         \
> > +                .div =3D (_div0) << 16 | (_div1), .offset =3D _md)
> > +
> > +#define DEF_GEN4_OSC(_name, _id, _parent, _div)                \
> > +       DEF_BASE(_name, _id, CLK_TYPE_GEN4_OSC, _parent, .div =3D _div)
> > +
> > +#define DEF_GEN4_Z(_name, _id, _type, _parent, _div, _offset)  \
> > +       DEF_BASE(_name, _id, _type, _parent, .div =3D _div, .offset =3D=
 _offset)
>=20
> Is there any specific reason _type is not fixed to CLK_TYPE_GEN4_Z,
> like before? Perhaps you have a future use-case in mind?

This is a similar definition with DEF_GEN3_Z. And, there is not
upstream use-case though, if we support ZG clock, we have to use
_type for ZG like Gen3 BSP. In Gen4, we will support ZG clock
on other SoCs in the future, the _type is not fixed.

> > +
> > +struct rcar_gen4_cpg_pll_config {
> > +       u8 extal_div;
> > +       u8 pll1_mult;
> > +       u8 pll1_div;
> > +       u8 pll2_mult;
> > +       u8 pll2_div;
> > +       u8 pll3_mult;
> > +       u8 pll3_div;
> > +       u8 pll5_mult;
> > +       u8 pll5_div;
> > +       u8 pll6_mult;
> > +       u8 pll6_div;
> > +       u8 osc_prediv;
> > +};
> > +
> > +#define CPG_RPCCKCR    0x874
> > +#define SD0CKCR1       0x8a4
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-clk-for-v5.17 when the above has been sorted
> out.

Thank you very much for your review!

Best regards,
Yoshihiro Shimoda

