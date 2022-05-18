Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38CFC52C25D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 May 2022 20:37:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241438AbiERScl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 May 2022 14:32:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241418AbiERSck (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 May 2022 14:32:40 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD72015A74E;
        Wed, 18 May 2022 11:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9ry+PnHf2KhV0cm04WzazEY81e0bOJ06/h3IPAOn/VXo3ZPJBk51KVomb8KzBZzKIoB+MuNlPJ4Zo8LPj+Vkw/odz4fNCiB2XF3+/d4h156Mbh9aw4eytIGJb4ZLi3e9EI19jNE0zyj80whuyF/SrjTRbqp6GaqJf+3nQbqPEbzRSiAyo5XBudm7fbTUjD7MDqOnuxqOsCTYVIl/HIGiA56ZxR+FbuL4xNd6y2fRSIjfyVM7R9LDhU6Y4q1ttQeZDWUFndLDddHx5L3WnSmYYcFeUdDO/Cs3pyJ7yPmKZWBiFcw/31PiuEz2FTWx+GluPNK/2Lait4P1IrzX2kBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IcG6FyIkKjzWukQVX9tBoB2UZj7KgyPRloKQFCXJf3M=;
 b=ablgJ2P7ZsgfLDuyJNlioA+kwrzrbGhQcWIUT5dsvLmheEIeOLxsmf9g1aEx5Ku8N+wTv9uzd3tVYRJTZ84RcWKv+x4zDAMATliPC/KgvuLOxcraogG1S2RHaoODVp6xtZoDQz7e+0nrFHhubvNpjVjAuIgVjeMO7Wa2pq3PeWp6upwgYItfEXuZ87cGmT4JXUx3A4cPwJvzL20zNRK5O32ZHHJqDOWUc5PpxU+lpEsEfG0RWYKzjngoZB2+6BNqc7U6l3I4TijhhGXIO6N8Ec1IwheRNKhpkxfCHDTKv6THDh52ZZhvwtAcv3s53PP9FuUsl8VbjuPrhm+JJCDAcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IcG6FyIkKjzWukQVX9tBoB2UZj7KgyPRloKQFCXJf3M=;
 b=gtSjUAM2HVes+JKP9+fLIC159x7EuEYIzQJwPkbUstamkbtwjHZrHb0Yt/I5kD/UA7f4hCqjnrPXSW+y5ob7lmZsR5lyaU7tef7QjZpcLXUaAUXa5BzYWnp5QnO78I0PtgWNaQEm5JvNkBUfvm1V42/trDD9Yr5I6pzTAqa6Agc=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSZPR01MB6985.jpnprd01.prod.outlook.com (2603:1096:604:139::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Wed, 18 May
 2022 18:32:36 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%7]) with mapi id 15.20.5250.019; Wed, 18 May 2022
 18:32:36 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Ralph Siemsen <ralph.siemsen@linaro.org>
CC:     "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] clk: renesas: r9a06g032: Fix UART clkgrp bitsel
Thread-Topic: [PATCH v2 1/3] clk: renesas: r9a06g032: Fix UART clkgrp bitsel
Thread-Index: AQHYauSuNkuyAG+fTESabe0t1YeYx60k9S0A
Date:   Wed, 18 May 2022 18:32:36 +0000
Message-ID: <TYYPR01MB7086A76AE1742DD0F9FE3681F5D19@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220518172808.1691450-1-ralph.siemsen@linaro.org>
 <20220518182527.1693156-1-ralph.siemsen@linaro.org>
In-Reply-To: <20220518182527.1693156-1-ralph.siemsen@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24285b9c-721f-4772-d233-08da38fcc820
x-ms-traffictypediagnostic: OSZPR01MB6985:EE_
x-microsoft-antispam-prvs: <OSZPR01MB6985D550E9C4690EC2ED7C4DF5D19@OSZPR01MB6985.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gimqb1J9YweAiXn0D2KJEclxsVQNggnId+ia64iyAXZwpI3FtVb+TI8gLXeWoAhz2uCqscFK8ElShWluqPCfsy/DpUBnF6ahXuwMZHxYaCkt9vIcIT7gwcdD7qVMVoqmOTkweYOEuG8TnA4xNDy5l/33rfjvAeACbzuawxbce75ivE+6mEzr0UfU7QWFQaqNi+70uo5zsl53WhWyrIuObaWaD4WIy2tssb9uX+5Yf8SQ+NeEAsHurWNG79grniJJbRN4MOXGzSutVDJEp0LFe+2HBswdADVyAEr6v+o1uPafXMHkTKPK7Cq/vmuQ9CpnOIsGzlv0iwIMSTe8A0fj13ejEPu05NRpwNYnuWx/kmipx3O3ir2bJzFO5VbAz/MabMw5CNINFmApF5b+va6d1+BQP4vhgZTV6XynWdGBM8bF1iIGkTqFJydW+7RTXTn2vtc3vOJDncs/hrA+F4PleFl7WYJOkrmjr7Z8WE2KVT4QvJiFzJQXsROs2QeUBDURSHMuguGWK5f+EVIXVApEnxI+wBd6Yt/QbKaTY66+2mtqnmR+8EqNH9KR21Car0HyfjImxFVkqMIt0vB6agSYaKXTXS2TjdAf3cw4fMfWitJwUs/lK/q80brljK1FzqiXYKB/5KnXsZqs6G2x8z4taDJRt/InJon47nBIzrIjRPzsLDJf96R53utajSdX85iNkcjl/aDzfW8Wxlb33Q4/o4HrpC2/B678BK0B//K4PKw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(122000001)(33656002)(55016003)(6916009)(64756008)(66556008)(76116006)(54906003)(66446008)(66476007)(66946007)(508600001)(2906002)(52536014)(8676002)(7696005)(9686003)(186003)(26005)(8936002)(86362001)(44832011)(316002)(83380400001)(6506007)(71200400001)(4326008)(38070700005)(38100700002)(5660300002)(40753002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pVT8/Tpcp3vGY1s4tUJPVqlbk8zEbHRSuGpsvZixIGvNCkSoXC2pE6wunemQ?=
 =?us-ascii?Q?S4oj8knmS8cataLQ0jIm7YAfUvGzPRRXzSUL0xEyeK2UyV3kI1tMQuPyAduh?=
 =?us-ascii?Q?Xo0OoGLxCTI02BxnHTJB7x3xToI67D5uyR2Kc8Dc042NPxwxbvzHzxKrKnUv?=
 =?us-ascii?Q?iBgaLVCU7uZ8cWC24dZ5w8AADzUdd34zccg/OLYaZ3dcGhglBcDtWWQebtRz?=
 =?us-ascii?Q?kMei4e6xf+3okyBlj/ONRuEqVUBee2o3bFZoSrKaDp/dBhlb5fcA9LfsWb7n?=
 =?us-ascii?Q?tUTvySNkygP72hOI5pHcPOor2hxByQEKBFr5Qu9H0yJ4L0H7SG1btMz2SzjS?=
 =?us-ascii?Q?cX+Ys4PZZdG8jgTsb+QHJjiaFaujBn/gXMk2jgPR0iklKdUBgIllmgP/ytmH?=
 =?us-ascii?Q?3MeR4KJFYuIQ9hlM6swc7Dv4d3NvkfKMRYW/XhPznk56c8EWCRhBbaOzzKk5?=
 =?us-ascii?Q?gKyUfFcouUGTGtorI2OUINBF7W9PRdavFwFumDxRh84iOsIqO+topDeFxYi6?=
 =?us-ascii?Q?yfhkytE2mf9rynGDkeICohNjxy/uOkMcg1amUaAM/TuMlFYZrO3YZP7eYxMd?=
 =?us-ascii?Q?Dq1314l9tIpnTkzBR06sRRu9dq6aINRm7KVZhJlLRk47Ja/Z+f2Bul0O+iia?=
 =?us-ascii?Q?QrFOO0Lt9c2kkqyT2tPSaCRheANvsFdA2PvLLRCoS5bPheLienPahFGadPcC?=
 =?us-ascii?Q?kDwh6o9tYAdQHRkZvn4NXcscwPTlMoBQel0LyFdF+Ewrg5cWCXSTzcnetHs0?=
 =?us-ascii?Q?+PdEtjm1bLvDWEwuHJq4tlnU2LMgTFHXkfiCfC9q6IBAbPTV5W8YVSZj9OkI?=
 =?us-ascii?Q?jNKaW/0nQnUAyg4AeyKP1jntYicShUUX5+Zan3wADW55HQO/Gu8YTjY6kfSG?=
 =?us-ascii?Q?B4AViU6swP9jYsmLlMHlVG77uUZUZJOPHTXc4E72qY95nCcTaztKgyWRrcjh?=
 =?us-ascii?Q?LHpgbbjhTvswMkLqYCcoghxks4rCJ6FY1lkSk8ysLurSyxYM6uSZ7CJ9SnKx?=
 =?us-ascii?Q?4Wx0r6mU09j2MZl65c2JCl/DENCgac7C2QWVdbQK7B8wxVsWo/yIxzPGr5pL?=
 =?us-ascii?Q?Ba79KjbQ/ao6TBPiIBU+FJt2G3aV/zTg+tCHLfU2EKoWNK03hJEEkrKVUA2+?=
 =?us-ascii?Q?GoJh+o4sx2Hs8c3L6BQ/S3DYPmshgoLopqvM/25FJAw0Wftw7x7K4wyHZd3F?=
 =?us-ascii?Q?g59oOJZAKrstw6l4Yt3d4MSOT6KnX9Li5kZJRssGCx3PBSWj9XHcJUZTELQC?=
 =?us-ascii?Q?laUfjtETRA9Dcu8Foaxxep+kJanpqWXu7nAjNmHVWnrwoP73vtWG6+e2sMFS?=
 =?us-ascii?Q?oWpYllHkIRvUpZXC94AsDBZW9BdnQS40Qq7S+xW0YCFIa9bIkOyMKcHiZdlk?=
 =?us-ascii?Q?lFqO2sMnrLbHkf7ZiL8GLBsbbzNYXQZ+RTYd2vhRZBedsrgdxVcKzq6xkOFw?=
 =?us-ascii?Q?tdvnwZnarHxJGmjFH2i4t8J3lTlWakZFaxn8rzJAJOs3HyNO6kJcd2kLTck1?=
 =?us-ascii?Q?Lo/JhzJtxcKVlONagwJUY8pnL9AVdYzTf3O9qBR78uuzAAEfhf8Zthei9tHX?=
 =?us-ascii?Q?jMarO9Yz41OlsQlpS4Jp34tFJBg8RUtLcPPRwJDO801x3edyLBYmS5DSgBWU?=
 =?us-ascii?Q?QruHGpfWfToC33OjiZCoZmOTix+SawDuA2RbNbDKl6N/aw7ugl7nu/bLHafV?=
 =?us-ascii?Q?v7ZgpQL/kIlN8l0dkaE/lcUJNrSz8o8mTfGoUcaws2kIghYuRfAV0fLWeZJQ?=
 =?us-ascii?Q?4+O+4S4PqdD68Eu2q1uXF+H4d204Mn0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24285b9c-721f-4772-d233-08da38fcc820
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 18:32:36.6386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T76cLrDMo38lv5HjqCU//IC6DZ0xeJdXrbg/hNwOBEyySwjZR4IoS6LjddjyT7l88CJfNGTd7UCn5I9De79ukQbiM0vryU4JD5mbQk+x73I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6985
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Ralph,

Thanks for your patch!

On 18 May 2022 19:25 Ralph Siemsen wrote:
> There are two UART clock groups, each having a mux to select its
> upstream clock source. The register/bit definitions for accessing these
> two muxes appear to have been reversed since introduction. Correct them
> so as to match the hardware manual.
>=20
> Fixes: 4c3d88526eba ("clk: renesas: Renesas R9A06G032 clock driver")
>=20
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
> ---
> v2 changes:
> - reverse the comments as well
>=20
>  drivers/clk/renesas/r9a06g032-clocks.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c
> b/drivers/clk/renesas/r9a06g032-clocks.c
> index c99942f0e4d4..abc0891fd96d 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -286,8 +286,8 @@ static const struct r9a06g032_clkdesc
> r9a06g032_clocks[] =3D {
>  		.name =3D "uart_group_012",
>  		.type =3D K_BITSEL,
>  		.source =3D 1 + R9A06G032_DIV_UART,
> -		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG1_PR2 */
> -		.dual.sel =3D ((0xec / 4) << 5) | 24,
> +		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG0_0 */
> +		.dual.sel =3D ((0x34 / 4) << 5) | 30,
>  		.dual.group =3D 0,
>  	},
>  	{
> @@ -295,8 +295,8 @@ static const struct r9a06g032_clkdesc
> r9a06g032_clocks[] =3D {
>  		.name =3D "uart_group_34567",
>  		.type =3D K_BITSEL,
>  		.source =3D 1 + R9A06G032_DIV_P2_PG,
> -		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG0_0 */
> -		.dual.sel =3D ((0x34 / 4) << 5) | 30,
> +		/* R9A06G032_SYSCTRL_REG_PWRCTRL_PG1_PR2 */
> +		.dual.sel =3D ((0xec / 4) << 5) | 24,
>  		.dual.group =3D 1,
>  	},
>  	D_UGATE(CLK_UART0, "clk_uart0", UART_GROUP_012, 0, 0, 0x1b2, 0x1b3,
> 0x1b4, 0x1b5),
> --
> 2.25.1

Reviewed-by: Phil Edworthy <phil.edworthy@renesas.com>

Thanks
Phil

