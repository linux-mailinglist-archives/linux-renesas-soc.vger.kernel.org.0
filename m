Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10D43AB632
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 16:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232949AbhFQOmg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 10:42:36 -0400
Received: from mail-eopbgr1400114.outbound.protection.outlook.com ([40.107.140.114]:54342
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230299AbhFQOme (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 10:42:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPWa/DrkXjNr2+3+6U7FEoq89pR1SjG5CipWHkHz7PU+ecHDVXs3M2Oo3/zbRlW/OfmZOGBx6Ys4RXFGCmMfDl9dBZCp/sUgmvkNDbNWZXOPhRSal9LZyUNgDp7DviP5b83hLYihk3sb5WQp3xjEbyx4wSGKBvIc2lMOpn09bn2pLirKJyECP67fgDSIlCSwV5lUjIJKb4DEuD3r7F/Pk/pWIpqhFtGLoDlmY2Xr3otvsMoNCwMjC03lj9FLcUW+surKK6R8x05G6zziMbb9ktSB6tPbhdFHkNm+5Ao99KhZijKj3Gaq4+LGTn1CPDoOp5Noi2HF9I0EN/jLFZY3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8VZjsFt7WC4H+OmJqMFWZv1MNcyH3cg2ziMfK9bVy4=;
 b=oYGVZi3wN2UwH1Z9SbIQG3DJer+7JF79UGhe/jib2CirDPTi7VTe/dT8nlwSDasoJvsX3xjDnDgWX381Xcp1l2d7OigyngCurFDyRSH1o3LHKknk8A68RqDmLCeRM6qg3ijZi5qQ3cMvcYTJRFU5gQGlbriAbJgXRUOqr9kBk7CHsoJmJq8aLS/4AB3VrSN9V0KaVg5Py+nFpFlMptQ9RCLJQBVoAiKn6pkIFotmbyuU4D0u3IaeabihQXyEiXulPsmPuE9KDlgM2EDU6y38qZqQ2ka1W8xBgPXqrq6l0Q4KgbCtsS0VaM1ORovew7sbSUgzPhC4KTcNC/DQ6OgeWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8VZjsFt7WC4H+OmJqMFWZv1MNcyH3cg2ziMfK9bVy4=;
 b=DQg9cL/MJkpUES3XeEcZzfqptXP5fN5amM9aBiVjMqim4QvnLpAGBLdpbkXmlwzzUHs5gqNu1EqpbKf0NWHlEL7cDF9ye0IEqjcUia6FetQWzBDEF5YLL6PUFarR4SbUERV8blmhCbSQNH3QXEM68A6UvL1bUHPZT3ZU6fplGgA=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OSAPR01MB1571.jpnprd01.prod.outlook.com (2603:1096:603:2b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Thu, 17 Jun
 2021 14:40:24 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::79f9:fd59:1111:55e6]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::79f9:fd59:1111:55e6%8]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 14:40:24 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH 2/2] clk: renesas: Avoid mixing error pointers and NULL
Thread-Topic: [PATCH 2/2] clk: renesas: Avoid mixing error pointers and NULL
Thread-Index: AQHXY4M3wrjBeuM+7kuOudE2VajpBKsYQlag
Date:   Thu, 17 Jun 2021 14:40:24 +0000
Message-ID: <OSZPR01MB70199F49C5F64B7245B0BE57AA0E9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <YMtYs7LVveYH4eRe@mwanda> <YMtY7nOtqEvTokh7@mwanda>
In-Reply-To: <YMtY7nOtqEvTokh7@mwanda>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.219.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 611e27fa-28e8-40d3-f59c-08d9319dd791
x-ms-traffictypediagnostic: OSAPR01MB1571:
x-microsoft-antispam-prvs: <OSAPR01MB157111A25C5E6C7554EB7588AA0E9@OSAPR01MB1571.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CHZZlcDukadNEGx1gBlX/zfW6Maf1IohrCTmpsTscMQYGQ4tAucfWm6UJ7yEV+T00cVS6yzHHA02wDphXbYoqi2GbLR9K3qfVySo1GCdPk54Vk+Zww1kDQRXSl1quNlPzCHbg6UMX3hgGEg2qcy9tZcqJMv+dVwrG3H7VEPrgJTQmuzPPiU1nAw8wELLBWLIkfQAftNdf9+8y/DkDQOk3cj/072hw/R5zXGFdAYDi66/ldmv5eCCNrPkqX4GKj/e0RyVbZUG2nG1AEk//iY5/A+6TFRos+PiszJ1jy79Mhl/9AjyohbPuBmtVnUluXv7PDTutkxP3be/osBeIWfv9pgUWp2XKeAReyOuONf1UAAT6G4pqJbPA9TosdbaT7HftJYdVoETzeFJBiDSuDAQR7dgkiNe2H1u3Osf2GVPHs2ljcc8jw4CngjLBTr4Nts/83fx0GeAKnlxdrfkCWB1cDdzO+Sc5fghr3BKuFugrNO7gFb6HlZ/Ycbv3BO9G2zD0Z1m+BCp26oqRmIrlv8fecugZkzOjNQVahwVG2bAzONCj3c30kLATVh4sqPW1e2lgP3QMEZ6//h4wA2JD3Kmd1EHg7spty05gFaZhmlqGhg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(136003)(346002)(39850400004)(9686003)(86362001)(8936002)(52536014)(66556008)(110136005)(5660300002)(26005)(186003)(2906002)(4326008)(66446008)(55016002)(66946007)(316002)(66476007)(54906003)(64756008)(8676002)(71200400001)(76116006)(53546011)(122000001)(33656002)(7696005)(38100700002)(6506007)(478600001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4lNd0IRhzCbsI5M4g0obwyBm31QqjYU1/F6H57n7wse0PkWtd1ccgtab3R3L?=
 =?us-ascii?Q?IDmFVFcGmxfLBGmfblDXz6dObBfKMRC3Ezm/sy0sGZx3Q0iFzbINIcWC5/Br?=
 =?us-ascii?Q?skMToQMUe3QFxxh0F5LecvH0IHobdODXxQBA7IXNrrJwjCUXS5uBy0iAExbd?=
 =?us-ascii?Q?/DkBvCaSd4M5vefctJO/YmHlBUSDYyJEPzvQHcZDQWJZjnKI/SZKE2PSgtyh?=
 =?us-ascii?Q?fSrqLalyNIUgG411LgUkmPNX5Ij+FNHi+AiNY/OKHDUrfXYxeO+AY/pR3lI4?=
 =?us-ascii?Q?knXc15btKQU1IFQ9bVj3ySKiSAdixpTBal4vjcZW++ahsVaTaUdtTjnF+2Hm?=
 =?us-ascii?Q?FFTWi1dbghU6BBS1SqdxBQKwoj7VhUpZTNF3Q2tra4bEVnDIKDGi8xQOQlP5?=
 =?us-ascii?Q?MFkj3VdTPKnNam5WxqsoAxkMOXidwNuyieGiAam+Mw4Ycec0tHjqyiZ1uULe?=
 =?us-ascii?Q?7UVHtYcr71NJT9To8k7hzDSVaJkn56krYOUB/FlxDyKONScmO6AMuM4B0+69?=
 =?us-ascii?Q?kyn0s6tmp9f7ZpwXsBvdQ0gYwwvAA6iyT8/ICOAkFpOXccwyhm2BKy5lYT/Q?=
 =?us-ascii?Q?85zk1G+2d2ZjJUNrNe9LAGmefoIt5iGZRwWtPYu730ML8gObDDMFyO9lP7eL?=
 =?us-ascii?Q?auwiLk/YoUiq7bbvXeCEuyxzaQ7t1yzOoxD74oTo/Ia+gRYpc0aJPkvu9N7W?=
 =?us-ascii?Q?TWysxC0PvRiMuLNmkgyXKNUqMOo15WcLJCB2NzSKC0AgI6hwAacWwdkg5jDH?=
 =?us-ascii?Q?iQu9VNbmkihDRACx6/qqKPEM08+RreEsUCKsGSRRNYlJacNUmOUyePXbPCas?=
 =?us-ascii?Q?71YnD69qiXZ5h46DCREuMmDb6gOuCSN9miIAJIE1ZU3Cd1B+F+2W9cyZaC9D?=
 =?us-ascii?Q?XxtGNgjFz6vsuEzDYgllV64BIRfMZ4H/QJO7CfYuxAwGPvfzD16MMaKgMTu7?=
 =?us-ascii?Q?TtcADf+3p7b+43rMrWRIIRljlw3oKWP5Cdb2v7MCsJ/mBiG8wR7b0TVnrPQI?=
 =?us-ascii?Q?wTTNG2i5VQYgFG77HSBWHGrSBORWFPKRNxqYc55f11UdOecRW7Tf6bCd0hDC?=
 =?us-ascii?Q?+iGb4c68rZB9LUE4i5niHL/dt01SWPRk8QfQCfseeuPU8YdDmpJdwpEYYGlx?=
 =?us-ascii?Q?ZckRB92C1ekbuR4sVIOXEHFpLHU9+aOAkR08m/Gfosmsj7JZviJsfdJdBFxh?=
 =?us-ascii?Q?6o5BfisYnyfKdVYRmFki2IJVdVDeqvtv78WRYBcwpBBa1/l92qPsQqmCP8Ny?=
 =?us-ascii?Q?3naEMNuAuU9RYTQQW6stMcdHMqBIR7hoWBDh1l+3YSOf97/vVuK6Ewp7BTDp?=
 =?us-ascii?Q?3h1G3ojCEAx9kwudCMoyhpf3?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 611e27fa-28e8-40d3-f59c-08d9319dd791
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 14:40:24.4406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aeFFgjCwiamtTiR2JgNWn4ggHC4HnaNDOEHloVhhObLKxY9eAfkaTvgg1/1Q3+fRKbJvalmJwyAElt2hKbV24f8YpYRzNMdPCajXiPkgInRBo91gypy3LijEAgKh/dvP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1571
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dan,

Thank you for the patch.

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: 17 June 2021 15:15
> To: Geert Uytterhoeven <geert+renesas@glider.be>; Prabhakar Mahadev Lad <=
prabhakar.mahadev-
> lad.rj@bp.renesas.com>
> Cc: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd <sboyd@kern=
el.org>; linux-renesas-
> soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-kernel@vger.kernel.=
org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH 2/2] clk: renesas: Avoid mixing error pointers and NULL
>=20
> These functions accidentally return both error pointers and NULL when the=
re is an error.  It doesn't
> cause a problem but it is confusing and seems unintentional.
>=20
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/clk/renesas/renesas-rzg2l-cpg.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesa=
s/renesas-rzg2l-cpg.c
> index 7ba36f19896f..83b58e1cb78f 100644
> --- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
> @@ -124,7 +124,7 @@ rzg2l_cpg_div_clk_register(const struct cpg_core_clk =
*core,
>  						 core->flag, &priv->rmw_lock);
>=20
>  	if (IS_ERR(clk_hw))
> -		return NULL;
> +		return ERR_CAST(clk_hw);
>=20
>  	return clk_hw->clk;
>  }
> @@ -174,17 +174,14 @@ rzg2l_cpg_pll_clk_register(const struct cpg_core_cl=
k *core,
>  	struct clk_init_data init;
>  	const char *parent_name;
>  	struct pll_clk *pll_clk;
> -	struct clk *clk;
>=20
>  	parent =3D clks[core->parent & 0xffff];
>  	if (IS_ERR(parent))
>  		return ERR_CAST(parent);
>=20
>  	pll_clk =3D devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
> -	if (!pll_clk) {
> -		clk =3D ERR_PTR(-ENOMEM);
> -		return NULL;
> -	}
> +	if (!pll_clk)
> +		return ERR_PTR(-ENOMEM);
>=20
>  	parent_name =3D __clk_get_name(parent);
>  	init.name =3D core->name;
> --
> 2.30.2

