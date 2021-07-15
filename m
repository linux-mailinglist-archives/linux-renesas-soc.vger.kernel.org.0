Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1F703C9994
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jul 2021 09:23:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhGOH0S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Jul 2021 03:26:18 -0400
Received: from mail-eopbgr1410121.outbound.protection.outlook.com ([40.107.141.121]:11712
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231508AbhGOH0R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jul 2021 03:26:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4GAfoZlNpENEZJ4ueWnG4iodBO60uiZePonniyAn858Z+Ipn7yC0SsaXzIeBPC6mlJi2QOkRyT3Og14irMEXYrIwqZOAMf0hwfWkIFJplr8B2VTQxU4+sBKZg98kuLV45SGrN1zPDPS0YrgIrK8BjcEPC8VNRtGt2FinLf+DLqmLTXyjJQN55LBBEep+qPMv+E3PNmoDzWm9dkHxbeGNMRUwLss6gJ1qPUTIPAEzp89Ji9IiiwszJ+C5/llpA4W55ldKtK+JBClNR5gqAJ3BAOIpKPTmZwal3WmpsY9FKWdhThGdgeNhQ2ZG44ZLRDhxjTDqUIAI/eCxMFHQ2l0mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFhoHTLbv5CohbPZk1ubssmnkrV4VDaYtKIrAYZ03To=;
 b=QGU4Ao6PrEuLvSQPHb4NNTdF7GUDc1juVr1lCrUe2IBOYwc76TTNqafwjpSVeWXUfN5rQhurmwe79cRiahh9dZJZZceexc5MNMi+P/RaYQvFp499Qgd8x3ndaGyEYmdl0Spqs9OScsmbzJVPN04/R/tdaX0NoU3pBukyb7FJpvxa67+G43DtD9+M2D5CzN8fapy8uqTAeiFdtoce/Ek03b+2dujTgg+LY+vb5tkldhLj6q9POuj7nIx+Aj0i3VzNpospkRgGRmpfeWDfTn2d2H9BLcB8gfbpNwPtrb1oBZa4XkjZU2R/MhDJBvDiXuI+K3XT5YTeFgxbztfizf9IaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nFhoHTLbv5CohbPZk1ubssmnkrV4VDaYtKIrAYZ03To=;
 b=PwTZiXN3lzHluAZBykxrc9/SliZjdtna+1ay4Ze3/oFjsYY1zS90km1c4Dv/mD+KmRtvnSMMX+B+m4oe3zoyuDw6DkjYjJrC4J5CatE3+vcMJHrwQL6u3SWbFXmmC/eF8U3DlBty/Yn4KG1oOc6ZHoCDAK7pnOgMKR1+hbrrp2I=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5731.jpnprd01.prod.outlook.com (2603:1096:604:be::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 07:23:23 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 07:23:23 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: Rename renesas-rzg2l-cpg.[ch] to
 rzg2l-cpg.[ch]
Thread-Topic: [PATCH] clk: renesas: Rename renesas-rzg2l-cpg.[ch] to
 rzg2l-cpg.[ch]
Thread-Index: AQHXeLPSc/S8lcxbakyilFFDbitA26tDonhA
Date:   Thu, 15 Jul 2021 07:23:22 +0000
Message-ID: <OS0PR01MB592293A58EABB918281B323386129@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <edc442daaedffcf10e835ff479d906fcae0e59db.1626268821.git.geert+renesas@glider.be>
In-Reply-To: <edc442daaedffcf10e835ff479d906fcae0e59db.1626268821.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30a04875-b18c-4bc1-dab7-08d947616ddd
x-ms-traffictypediagnostic: OS0PR01MB5731:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB5731EC644A8F1BD1846A0AD886129@OS0PR01MB5731.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kmkm6MlYoF0ie6k1WZ4DyCoN+D7sIGxMeohmoT4hDW+/C+7bUSTYtIs7u0vtL35yl0NRJAHyi2WL8z7ndC546HxlLbv9jH9CieiyLrHUiNb0cE5AZfYXOa9VVA6jFF7jGecgMMqAChcdX/41EPURqOb1VHOpW9jmdKeBi8JsU8xSZuVZqVC1To4J6lDSbb2d2sH686cznZaAcTk/MJfqooZdcaC1Spkukikzvfi6+cxJpS6ODVemCr+OC5kErhWNmz8CVFfa91zOCG+19joEE2VWXN8LgiKw/DLognlkhXccDhZlY3VTyBuHaaX8vm67xA/57n5NmuOhZl2b3ZYZVUULNcysdKEoQKH0FwpYvSaK0ahoae6h3mtK9ATXUSJqtS56+4gTSGa0S0WvVmK6V2eLbhDGsDIn8ExMoYPMWlmHjiUJWn3QPNyae+IDjTRs0mPmCfU7vdMVYBO5YZuFcvPeHjjVlf/zjTTrGO8ZrGB9z9dBCAjzMIG0ogZbwtQLHZHHdVS3qvAsOIFmwC3utRX+TVQF6bBV3v/PsQD+eCutKrPWHVKcmYpp89E9ltKXgS8DIJ2czL818+DIVkdbphMS1aGv8/cG/qmJxJtU/DKkMLrDWL6cizCSbLA2frpvaUzRf2EVpqBAO4oeQ6OVxbIrKDkWd/FSFd7eJyo0Owk5uYMAfZmrnvqWbx2FR7HGHLtq8f5ASGEJ8gwVrRN1Cw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(52536014)(33656002)(38100700002)(478600001)(53546011)(9686003)(122000001)(316002)(83380400001)(5660300002)(26005)(6636002)(2906002)(66446008)(54906003)(6506007)(71200400001)(8936002)(64756008)(66556008)(55016002)(8676002)(186003)(86362001)(7696005)(4326008)(66476007)(110136005)(66946007)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o/OCk66uZ07qYuy/HPCsn/vRLYNNo/UDRYT1GsWYKArQZ4HSfpK1d444+x2U?=
 =?us-ascii?Q?em9U0at/QmZaScaQGLqfo0mdaGdefv1VBc8WHIEO0fZhskBX/PEGZ0qsZcV3?=
 =?us-ascii?Q?J5dDGxsrnhJixlLzO0JR5DyHQV8dT/QqDPxbJTc5frPZH7vinNYQHJshGEzf?=
 =?us-ascii?Q?mxjyiHxNlPqHDRZjVs8iWllonb3uzYMH9YIDVpJVONE8MLcLGod2Lp7bvmWC?=
 =?us-ascii?Q?S3lbGEUy+lJ0LDMfuSyqRKb0eEq3yOeR59IBvKNOZrYa6bOuLlSSoCQEO3fw?=
 =?us-ascii?Q?9IeScZFgFYAhd9RY7xhfqcY+I2hyugs1XVwx/Tt5UL6C/xeAzvjZo4LI689l?=
 =?us-ascii?Q?w1VWh3txIaSH/EwzVpsP7AmgYX1a1HsLm0nZERMGLD0bPweZEbId6x1RgFvi?=
 =?us-ascii?Q?JeV7fxup6bj+lXoD/3xfdujlLhQSoxQrYBysc8jmv2LLs+m60bSSyDg6QgBn?=
 =?us-ascii?Q?OjVGc6hFmJHsBS5FD0JEXvKlVDQjfPbr1/hDzDVmzKvZm2NS/Jj47dDXY0RQ?=
 =?us-ascii?Q?lUuiEzTjqbpDyw+R9Cye7k1WuQ/V657Bpk9uNnIvLMH96LMCNRlL01Xuzzg6?=
 =?us-ascii?Q?C/0JNd3nu9+hmSD4PbA5mDUmXrIJWiOdxycfti7fPu6sIHOH4AziaN5/qlbD?=
 =?us-ascii?Q?SBbI5a9H8LD23kSe76fljRipciD7tnnDwzSLroajHEwzigOne8fUWDwt97b/?=
 =?us-ascii?Q?gm/SGvawsRx6KIn80AAb7OhKkQPxh8nrUnr+D39UsdwCXF5YRGvGPMeMTvKw?=
 =?us-ascii?Q?YIDkbPsvNb0tGe2m/bMx80i7OrurBj2ckvYm8l+jxHhil9dU3xyeN8GzOj/R?=
 =?us-ascii?Q?WQ+wROk4r4axCXdq9k0g2godjfh1SkIAQBSHrLiS/89KIjjI9MRmw6lGkt7X?=
 =?us-ascii?Q?BywxEy5c6spJLgu/f0Zxo43dBXBp+RYc9z2DwX+JiWezDV+lHWjPa8OFmSCE?=
 =?us-ascii?Q?7+yp5M3jd2dHCZk2jPMz1D+YnCdzvAeUTZWY66SdiyG2Aq8lJDktNVqdpBpK?=
 =?us-ascii?Q?ac23jLLnNxSuZ76CeYaCMLrffBpcr6x6rChs4oh1uUxDI/V4EE0J7Dpxm7/Q?=
 =?us-ascii?Q?TfY8XnWJlP4oOWOLo/0ZDr55sXhAzfeBREKGVEFHiv7EplyOemLUVxJAlnkT?=
 =?us-ascii?Q?q2v2cbwCEb5K4+PmPcw1qsCQ/WAkVyS36WqOKhUQ7uw2s2LsL7foqIY4DRkU?=
 =?us-ascii?Q?ErIjEb+inJN82dlAY5CG3USUsIyMQEXIrv9MWIfVAlSkSK1s2C0YQkSJvMvJ?=
 =?us-ascii?Q?Oio8Zir0JLHrlbViBpD2xeKGlYWjslxl0sfL5D3IloZNRkdent4i+XAKfL5z?=
 =?us-ascii?Q?bMESA61EGbhlykevKgz1vgd1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a04875-b18c-4bc1-dab7-08d947616ddd
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 07:23:22.9684
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kkgkk3JFFQBAruEtgfvW34f0haRALDKA2VwtPyq3ieF5fYEpbmueZfmJNa9J2zMFTkyFWC42xUkyhGeVR6JenInqYMftkYOFs7tLTQijh1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5731
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for the patch.


> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 14 July 2021 14:26
> To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; Biju Das <biju.das.jz@bp.renesas.com>
> Cc: linux-clk@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Geert
> Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH] clk: renesas: Rename renesas-rzg2l-cpg.[ch] to rzg2l-
> cpg.[ch]
>=20
> Rename renesas-rzg2l-cpg.c and renesas-rzg2l-cpg.h to rzg2l-cpg.c resp.
> rzg2l-cpg.h, for consistency with other (sub)drivers.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Biju Das <biju.das.jz@bp.renesas.com>

Regards,
Biju
> ---
> To be queued in renesas-clk for v5.15.
>=20
>  drivers/clk/renesas/Makefile                             | 2 +-
>  drivers/clk/renesas/r9a07g044-cpg.c                      | 2 +-
>  drivers/clk/renesas/{renesas-rzg2l-cpg.c =3D> rzg2l-cpg.c} | 2 +-
> drivers/clk/renesas/{renesas-rzg2l-cpg.h =3D> rzg2l-cpg.h} | 0
>  4 files changed, 3 insertions(+), 3 deletions(-)  rename
> drivers/clk/renesas/{renesas-rzg2l-cpg.c =3D> rzg2l-cpg.c} (99%)  rename
> drivers/clk/renesas/{renesas-rzg2l-cpg.h =3D> rzg2l-cpg.h} (100%)
>=20
> diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
> index 5c6c5c721d98d827..7d018700d08bd9dc 100644
> --- a/drivers/clk/renesas/Makefile
> +++ b/drivers/clk/renesas/Makefile
> @@ -37,7 +37,7 @@ obj-$(CONFIG_CLK_RCAR_CPG_LIB)		+=3D rcar-cpg-
> lib.o
>  obj-$(CONFIG_CLK_RCAR_GEN2_CPG)		+=3D rcar-gen2-cpg.o
>  obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+=3D rcar-gen3-cpg.o
>  obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+=3D rcar-usb2-clock-sel.o
> -obj-$(CONFIG_CLK_RZG2L)			+=3D renesas-rzg2l-cpg.o
> +obj-$(CONFIG_CLK_RZG2L)			+=3D rzg2l-cpg.o
>=20
>  # Generic
>  obj-$(CONFIG_CLK_RENESAS_CPG_MSSR)	+=3D renesas-cpg-mssr.o
> diff --git a/drivers/clk/renesas/r9a07g044-cpg.c
> b/drivers/clk/renesas/r9a07g044-cpg.c
> index ed5f5c11ac12d925..a71f920f5dfaa7da 100644
> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -12,7 +12,7 @@
>=20
>  #include <dt-bindings/clock/r9a07g044-cpg.h>
>=20
> -#include "renesas-rzg2l-cpg.h"
> +#include "rzg2l-cpg.h"
>=20
>  enum clk_ids {
>  	/* Core Clock Outputs exported to DT */ diff --git
> a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-
> cpg.c similarity index 99% rename from drivers/clk/renesas/renesas-rzg2l-
> cpg.c
> rename to drivers/clk/renesas/rzg2l-cpg.c index
> 9addc9dae31ac115..3b3b2c3347f3763f 100644
> --- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -29,7 +29,7 @@
>=20
>  #include <dt-bindings/clock/renesas-cpg-mssr.h>
>=20
> -#include "renesas-rzg2l-cpg.h"
> +#include "rzg2l-cpg.h"
>=20
>  #ifdef DEBUG
>  #define WARN_DEBUG(x)	WARN_ON(x)
> diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.h
> b/drivers/clk/renesas/rzg2l-cpg.h similarity index 100% rename from
> drivers/clk/renesas/renesas-rzg2l-cpg.h
> rename to drivers/clk/renesas/rzg2l-cpg.h
> --
> 2.25.1

