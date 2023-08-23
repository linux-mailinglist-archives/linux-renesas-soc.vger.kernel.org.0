Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE23C7850D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 08:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233024AbjHWGu5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 02:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233023AbjHWGu4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 02:50:56 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2137.outbound.protection.outlook.com [40.107.114.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FA5EE46;
        Tue, 22 Aug 2023 23:50:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aE4O7cuV292SAq8xoqEpf+wQDdLvhW+hV1Hwr7OOwdmDu9q323BjH7pmLt79LvI+bS0JcCQWHRorgz8OSFxqWNL9A/GWyWILA1VhJ89qk456jhljuKW3kpDJpn6B/4lCYL+xsPSiV7xw1NdGrgoL7GzRlOOphXelo7DyMQZO3ReAVHHvfddMI7XjlFJPtZs/0SPXbWNNEC8k4LGoyNlqaUh+j191ELWvyuRxHmoXYjEeGk8EV5TqL9tbE3SOxPQbVmMWN7Cqt5OO2jchUEdwZ4QEcMfTImm+VHk2lp/5Fd+ZkZLEtXYKS/nHolEFtY06lLxkb2lGw8ci1lG8fcXoow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiQMw7Q12acLpnYirS0g+cFhmqjsvgsOEA8nBWhPWbA=;
 b=Db4/ZBSqX+/6lwYX2X7Tro5RsbDJ0Y3QhOKwFrL6mrvOcNHE1a2EbAXgW12K5AM6sZUVSECWj9GxfmiCYWvKA+KiKswFPDk44Z3X0813ICZJw0nqPm0DmMEX+oMYgbcOe7554GDhlRurkBeCDgqlPIPX4MZsJyE8RKAiV/3vTbI8zYpkXQ6k+mZ73tWY6pLAkXvlJvOw5/j/KHemYASgJRjoB5cUF/OqDxugBL+YlCTkIv82ywTP+aKeSIJloDujScYPrOBlA/AKhUTe5yyEUJBJl3Z0GD2OSXaJQhNtfbJKZorAS0eBj8DwoypH+3kvPlxfyJ+etFagQdTmeB3CNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiQMw7Q12acLpnYirS0g+cFhmqjsvgsOEA8nBWhPWbA=;
 b=AovTSURayLYY1LIMhvV2zVWIg077eorFskb9hZR8H2fHhkRggXkKt5Aoes4PQgbA80KnqjzqcN2/mKFEhgLEdKZYLYPfz0ZoJLLWNQcRZHO0l+e2aSf4OVYQATYWft81LgxTJx1eQ0oj1Lkqtn6I/lyhnhp7bPFQyqIwbad8vFk=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYCPR01MB8327.jpnprd01.prod.outlook.com (2603:1096:400:15c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 06:50:50 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::8e13:cc46:2137:9b03]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::8e13:cc46:2137:9b03%6]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 06:50:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Julia Lawall <julia.lawall@inria.fr>
Subject: RE: [PATCH v3 2/4] clk: vc3: Fix 64 by 64 division
Thread-Topic: [PATCH v3 2/4] clk: vc3: Fix 64 by 64 division
Thread-Index: AQHZ0RZAiz9j1V2A60+OcdI7bQ1TUq/2zFKAgACtUcA=
Date:   Wed, 23 Aug 2023 06:50:49 +0000
Message-ID: <TYCPR01MB5933D545CDF04F345C231591861CA@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230817142211.311366-1-biju.das.jz@bp.renesas.com>
 <20230817142211.311366-3-biju.das.jz@bp.renesas.com>
 <309338dc2c3b62e3c62268760947b9c1.sboyd@kernel.org>
In-Reply-To: <309338dc2c3b62e3c62268760947b9c1.sboyd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYCPR01MB8327:EE_
x-ms-office365-filtering-correlation-id: fd17a8fe-8793-4b27-1052-08dba3a54958
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QZZspzdqCfffzW+3BLWDCUVBHtmgZ3a21VV1Wk3GQW5S/ToGaLYKE6j8OOf4w6GrcJoEiuyyryWLqSRL4iiGt43I9by6/ofDJa+d41HLnMh2x3FRCI80jCPhsTbCyAtyjbBV9E9Q5hQwPKHK1CNirjcu+zqLF/z7N0xxAAgB52ArdJEcmuwvxbOkkPszht98OpxqfxjGl4LYAEP3rqZVtlMcpF5AkQ/BezPEOgxoR8+WsmJzU/sfaqGdZLDe6gMxUumHGZjEscW79z54M+xv2wm9FbxnQ/eKtqnw5eyIlpoqxJ15lEW2NSKWdYrFuMM6MfQdhaomv86DBt3KtTtywmUAG6E8RLTc2OLmbLwHjB3gtWmMa7WU0alYam8/zKNk2CEjKIXbiYP/xrjCPng7/VtexSOwZW5N5w5GrHNspolWtmGXjkwd0Q0XNS90qWapxq+dRD31CGxgW38VByaT2K8xJE6I18yKa+LJSqZqdZQCiOI6nbPy4HG0szHmmUwIDwVl1+qLNUlHQQfNx1UWBzys/NwuZTaT4dIbzz4FUvOrDVCtzzbjYR4eHzjJw/iee4Ug4R1dCNElD1GVRiF1dAavpV11m7oVlVE/Y4recyIcbTd1d82Oak7CSJIK4PzD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(451199024)(186009)(71200400001)(8676002)(4326008)(8936002)(478600001)(316002)(110136005)(64756008)(54906003)(66446008)(66556008)(66946007)(76116006)(66476007)(55016003)(7696005)(6506007)(41300700001)(9686003)(38100700002)(122000001)(38070700005)(26005)(5660300002)(52536014)(86362001)(2906002)(83380400001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qM4E27bnKb86H+9nPFGEkUD2tweoS6Yg9QYGSf5uwQ7/dNh+Fd0i10OoacHw?=
 =?us-ascii?Q?4Rg+Bvoglqh/CQTFc+X+rQHJFkg5J7s8Cpaf8SBHzEAKkeLTmIcrJe++ZTmA?=
 =?us-ascii?Q?Y8ajoPGyfIhHPw2lL7YDmy9Dl+xLDW8eQ9o0AAn15gH7m1+hOj4u3AcAwWN6?=
 =?us-ascii?Q?IeG2lW0EZhjLBiFobQB745vi4B5Kgow2GtXlYj3/pCGN10hYcK64OQR5Ra9H?=
 =?us-ascii?Q?actK8Cdq9514GRX/hVcAMec77kDs8lbKN6ZID999rPoDrQLHeI4DxMp1lIwI?=
 =?us-ascii?Q?GZDatpoxU31etxGlONhg8Z4W8WYJsuLommAtsYMGsyXL2NTq2qlCH/0ighqc?=
 =?us-ascii?Q?vUfUapGGIofCBeD8N11bjJcSwaJHFd51b4rc5vXgEmN+34mPd41cFr1c5SXE?=
 =?us-ascii?Q?FG2+6QKkKfaG8lJ0zWOoKCK9lbVmkEBa4gTZuHVqIp5LZt4s0LkD/WI3Nk5P?=
 =?us-ascii?Q?FQNs1vbuQzMZNE+6XNmky63PzrPGlzgQVBy2oRFYWeD/Ir9aKVX8F/WeaMhY?=
 =?us-ascii?Q?B1ko7wSFR9Cdr+HtgBlj6QSOIhdZTX/ERM3Ise3BuFxROrBviBkc7o70xvIu?=
 =?us-ascii?Q?XuS+aFWhjR9SNNAQ1UWVawFyDsV69DFbPlbIljmUPEBCwpx5pU8ZKfv6CJ1U?=
 =?us-ascii?Q?t4ZfZolG/JS27gmCD0kuPR3W+B5ESrXgj6tjw71d56eH234/tUcXYWCWoj65?=
 =?us-ascii?Q?UeVUyI/5piToLzn0V0yKo2uliEl+yDKQZGR6rmwSHxhwdu8FppFIQTDZEjFg?=
 =?us-ascii?Q?4u3vYrpZWwZRyzZMZ1QW62hbwX+3Ust5EIPOVhc618q1JEIQPl0Q5iAAUolT?=
 =?us-ascii?Q?dMt66B7XA6eKfQiBhyL/JRJvMORq+gzsxMPHBoqbEXMbZ9NP6Np7C0jhVQqS?=
 =?us-ascii?Q?8SEe6xM2c19NFQJhbLmMzT8lpCDemn5JxWu4v/aegRoU8WxdJviZD9dz/QbW?=
 =?us-ascii?Q?9xxtTbNq4laWT8UVNKpMWCW0sLsoasjSOO37sB9FReqyoPewaR8Ujrgol+24?=
 =?us-ascii?Q?YPIIjeFApC7ERIGdrkvtrSsJ5hpukpt2YZnPYwoPcQbp7m0AY/InBc2qZ8C3?=
 =?us-ascii?Q?7RLfysyx0p2XPs2SguVIBEWvmKxL0Obc2dqJOPRgDV+G2l5BjV6ZtkFp50xm?=
 =?us-ascii?Q?mXW4nsf4loxrqRctu2HuS3q6JFTQJLEbcoF/OCS824g0cMnfAZlx0Z2QRPLw?=
 =?us-ascii?Q?dALXNk7SIhv/esY/S8V8kCVm4jP7gVKbdCAjsIbdriE81BbyM5iQ64bZ2LVa?=
 =?us-ascii?Q?exms8Ueml0QhYQ/nRKWq3v02lzjY/zKk00ws5Az9gIr/7wueXCYKtB9zJd2d?=
 =?us-ascii?Q?/xOtM6LiU9iai+4BA5JSj9P2mhtdF0lAGKo4Rn2hHOXKc2yEfVwwHznZIcWE?=
 =?us-ascii?Q?ZwVBAQ/09M1jZV7MGY5mbqLDSVJxzlDQjMowDW1LUxySoKNWgB9FIRqrs9jM?=
 =?us-ascii?Q?k5ace60tZ9fsLHlRQngnzfk0DVs81C05DxgV6XoWNBDF4P6jnLDTfPh6fCju?=
 =?us-ascii?Q?jFKhaOf3mh9LxLoL4TQZVlXUQ1LzAJWVAd0YYQiro65H1ADsKF58r9Wp7aPm?=
 =?us-ascii?Q?DlPZSU3Tgq5Bfmm7KQ2ptuIkRY1/GuW9vQllAtIq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd17a8fe-8793-4b27-1052-08dba3a54958
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2023 06:50:49.8144
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NbzNQ9P2mytiSWOxZIdK0un03r3W0g6oSKWAg23+qpvrNvaNxuzK+qJyN/BA0CFDvM/wL5kd8Ews8L9dYNavzPlhc52mEAZ0u+9ZHIRwmC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8327
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen Boyd,

Thanks for the feedback.

> Subject: Re: [PATCH v3 2/4] clk: vc3: Fix 64 by 64 division
>=20
> Quoting Biju Das (2023-08-17 07:22:09)
> > Fix the below cocci warnings by replacing do_div()->div64_ul() and
> > bound the result with a max value of U16_MAX.
> >
> > cocci warnings:
> >         drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a
> >         64-by-32 division, please consider using div64_ul instead.
> >
> > Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > Closes:

> > Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver")
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Added to this patch series.
> > v1->v2:
> >  * Added fixes tag.
> > ---
> >  drivers/clk/clk-versaclock3.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/clk/clk-versaclock3.c
> > b/drivers/clk/clk-versaclock3.c index 7ab2447bd203..3ded616a0d15
> > 100644
> > --- a/drivers/clk/clk-versaclock3.c
> > +++ b/drivers/clk/clk-versaclock3.c
> > @@ -401,9 +401,8 @@ static long vc3_pll_round_rate(struct clk_hw *hw,
> unsigned long rate,
> >                 /* Determine best fractional part, which is 16 bit wide
> */
> >                 div_frc =3D rate % *parent_rate;
> >                 div_frc *=3D BIT(16) - 1;
> > -               do_div(div_frc, *parent_rate);
> >
> > -               vc3->div_frc =3D (u32)div_frc;
> > +               vc3->div_frc =3D min_t(u64, div64_ul(div_frc,
> > + *parent_rate), U16_MAX);
> >                 rate =3D (*parent_rate *
> >                         (vc3->div_int * VC3_2_POW_16 + div_frc) /
> > VC3_2_POW_16);
>=20
>                                                             ^ Should this
> be vc3->div_frc now to get the clamped value? --|

Yes, it is clamped value. I will send next version fixing
this.

Cheers,
Biju
