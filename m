Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 914093CA582
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jul 2021 20:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbhGOScW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Jul 2021 14:32:22 -0400
Received: from mail-eopbgr1410109.outbound.protection.outlook.com ([40.107.141.109]:43909
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229506AbhGOScW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jul 2021 14:32:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSOjm8Cq7J3kbcP52fkEsRk3eHAdEcImnarYaQl3lFpacVNgxxruRUqFQZpHPT//8B3+zpeGhsKzQVd4ET7DsoFdF2aXzg4gN5tWgQ9MdBnZKa6Mdaf6B2GqmbJZa2r+PrQNAOgLjP7dv7b9o+9d+KV6K/vJIaPaf5So5t7iG7c4dHscMTNgwLKgwPW3do2AkefJ5TGh53NnytDtHtf80S6oGKoai+cXs9Tiquxn41mNfPMvVbjVadjUEq9aU6v7nY5ENqFx7xWY6n142xR2DIfz2+u+KK12J52qhnmopN0UUpJu+nf2Qi1weeDTJAVj3jmbTeoVRh6UbCyBCNXCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDVU7hN00BohAUvkdPW9SSLGTnpvAGVSEq999pwDJEo=;
 b=b6pB7MztQawKaogDk7smgHCpSvLUezin76CgYUa7EBJBsficmhU1cCXJtOZN2fMwh/1YMJxAPXwUz1mmZWlOnp+zlYSnmPWjSFLXJgXiImR5iEaJ2yY1V93Ejxu4ioRkrd+x3I9U2Ekpz5XVbsZRbbFDZDi3BEZOffzkQJUgmXCfxyDE/yDdZSTZrOYWX4aMKtbqi9lHY/o/XSV26jyxbmByv3ixzzlF0GA5mwXumUuaUk7arl3xj2JZNNnngQWEm4DiiBB8XcNV219QX2ZKsxaV9HZvuutgGC4UI0jpyiu+nNGfbSA6Xag5ePzPXEEKW5LtslivXBCtjBh3XBweQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sDVU7hN00BohAUvkdPW9SSLGTnpvAGVSEq999pwDJEo=;
 b=CLLxRAUgr64Bu5kO9Lm9gHPmmzipJfpHlEJaLbH/T8844yt96XUPdwlvB5ne14lSUB/LUdha2JtK43tm5OqxOQrdwa3Nag0SMDCKN/D4NpIxDafuqceIAeVMdfsVAGcwvYSTFGaJwDyvCGB9MuPI3wlLjQhXjquNT0dIFDwpUsM=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OSBPR01MB2789.jpnprd01.prod.outlook.com (2603:1096:604:13::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.24; Thu, 15 Jul
 2021 18:29:26 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::a058:9916:364a:1d1]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::a058:9916:364a:1d1%8]) with mapi id 15.20.4331.022; Thu, 15 Jul 2021
 18:29:26 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: Rename renesas-rzg2l-cpg.[ch] to
 rzg2l-cpg.[ch]
Thread-Topic: [PATCH] clk: renesas: Rename renesas-rzg2l-cpg.[ch] to
 rzg2l-cpg.[ch]
Thread-Index: AQHXeLPTWV+5pyyPHUmjOnvzQk7QhatEXMdg
Date:   Thu, 15 Jul 2021 18:29:26 +0000
Message-ID: <OSZPR01MB70198A32B2C74721DA5638C3AA129@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <edc442daaedffcf10e835ff479d906fcae0e59db.1626268821.git.geert+renesas@glider.be>
In-Reply-To: <edc442daaedffcf10e835ff479d906fcae0e59db.1626268821.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3993a179-1f0d-458a-b479-08d947be7a03
x-ms-traffictypediagnostic: OSBPR01MB2789:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB2789D743F56AAC8FE707C596AA129@OSBPR01MB2789.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: colnvGkbXfTDOjlvsdpl0XPfPd+wRO7rdqjWNhSkouxAjJFXbL/I46r84xh0iMJFnwV7RQijWOUxkWwZGolwGkQkAATLAvW9N5PrM1cNNOOLmH3GVZCJA+Qi7wWIE7l+zyH7jwOIRCWuNmXUFtPXu5Fg05DNgQJ+Q/TVWBXnYx8pnXxC3sNkCJ7rszR8vXpzuIacG4LjqUMW2Myi+dINq796yTWt24QIjBcwaw/Cth63Wn8xOMrcoQnDnrIW/jGOYaXUKF/SXJu1yw6q/v33t0kD5DeowLw+PZqDnduOv6XiCrX6bOvS+c2fGcDvadj3y6CeafE7wu/Nn758ckW1POJ1tm6qri8QzKJMPlfyScczOcK0qGwje9Ns6BaYBGIVfK7ArkruqACX0I1TJDoHzQYtOx6DDNgyA8l3f05L39eGBuKxuMoXNiT1TaG7g4pz05RUqeacRJWlp9Jo5v8bhHyPwOUTl1ixWhp+CJXIB1TRw6/WWm6RM1kVAkZLp1512LdLpFlbT7UY4en5OFloTH0iIx8vhx6NqaS+91j7XCVdnTWuYR3EluN5Sctyx7gj0mL6rmu/6SV5zqWH4E7542vRrwE9vN4J80jDQTaneMu1sn2jkKv2BbiKv94rG116tZnsbluWmU3F4pdvObpJpBIFjvkqxkwMe47Z0L9kkXXwgUCFHOIxCyYCmhFCfhYISSR6llSdkZCiIEg/pB7SBw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(6506007)(66446008)(6636002)(76116006)(38100700002)(64756008)(2906002)(66476007)(52536014)(8676002)(478600001)(66946007)(9686003)(8936002)(54906003)(186003)(4326008)(122000001)(33656002)(83380400001)(110136005)(66556008)(5660300002)(71200400001)(55016002)(7696005)(26005)(53546011)(316002)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mAgygsLIg6TOMCSvvlhncpDo0ocJUvs5L6ffxkV8llqtlRJmKQlkfxnEwG13?=
 =?us-ascii?Q?DCmnszYMwz1G2NFB7Si7OQ2//gosLzT1eu++oygmaDSDE+mDrQdy97muHq3b?=
 =?us-ascii?Q?2zs+leKb0IarMnEYyuwriSsYbfbZzhVV8s32idd2Yyrm0Cs3llXrEpNW97JX?=
 =?us-ascii?Q?SSsW5eF80nkaKA41vA8ZyCjc5tAj7U5QdIciA97qMq4eR07ILIoHyddJXc21?=
 =?us-ascii?Q?ZU4pP0uGTgJNkgkjLRh2YZ3cxKUyze9l1i2KRIsDh9uVL0UAil9/4YS7tTFR?=
 =?us-ascii?Q?qdpNRxiW/neTsiAKfH5pXymheRnzIBBFTGWjyUS0WpEQGhxltgYlIXXdzrEF?=
 =?us-ascii?Q?xe0BPpnB1CqlFHTsQy2LC/O9+zKZsrIH/2eLfKMI87caEzUw1S6X1PmiL9K9?=
 =?us-ascii?Q?fbsp+jUAZVIrE1QTtHrrPrRzacFHAY9Bm+v7jCXD41PfENjmcTGJYYwOBMoZ?=
 =?us-ascii?Q?1k0Bz4rcR7zAahfWe7n4SqoIisE2qhW3GQeRt8b2du4C0xVA9VqIv5IfSp4o?=
 =?us-ascii?Q?wtQZTNBfAA8G/Nj/gnVjZDgTzjQ1qhju+1I8TEX/uoce2F+ZQ9KKVCElXJTB?=
 =?us-ascii?Q?Ut06xjepsy++BN12lyhnTh938WGu8RW8nhEbyX3IfTH12bb37Xx+UMhwV85C?=
 =?us-ascii?Q?tLgRaTjfvcGPlKz99WkrH/9Yz+tTcYmtcjIM85GKONmN8vKVSDMoel0w+JHE?=
 =?us-ascii?Q?p/3fv6mZLeP3U0HwkshPq4XMTvdya08tosfzNpK9eQMoIMBjytISPz13W0uq?=
 =?us-ascii?Q?WfYO1n+CjAk2NF+R/xrzKBwkmDS2G67oDUWZX5lG2kCgiXW5XYiTyak5GsKI?=
 =?us-ascii?Q?13DrqWuenZ9DUJUkXv1ZOSdE2bZfzy3dJJ5qX1Y1xm5mRUB+1+FC5Q1ekRUC?=
 =?us-ascii?Q?36ubEzmRmG/29sVE1RcDcIiHhLRlNKhXYv9FzGUiG1ee4SPElytQW9Lwji1Y?=
 =?us-ascii?Q?3Hr+ASc5Jrugm9BPxtb1JAW64G1tq00jg3tTraaQOx+5IAX7HTl19FmJWLxj?=
 =?us-ascii?Q?jwlWZ1RtPzDIcheOSMe3Vawy0gihkFFKHe1umMw24G+TpNCbkOSygySvo7ER?=
 =?us-ascii?Q?AF6jGwac27IrkmS/yJugxc0+OKB2P4md3O6Tfq50rkn6AMyA2Pfq7Go1GDSt?=
 =?us-ascii?Q?tfXpEoDSJzOEtMbZ71W2/ZZd0pq+fiRCXhJYdyk0+rRxf4cz8pSYKNIjbokj?=
 =?us-ascii?Q?lAqzUitAd7mWoPwsYTnmXwmdHS4wjI5aG+WeifpwsdIAs7eSxOOe5H4jiAgE?=
 =?us-ascii?Q?gtp13SNS0hu5Sr1kvdUiZ4P8pezFWqWrAr63pctQGoM+b5o22yuo+2C17VHq?=
 =?us-ascii?Q?x8JSlqB+7NcifChWIPhJwH+W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3993a179-1f0d-458a-b479-08d947be7a03
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 18:29:26.5240
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZEY9MluktvEPBYb6H8SFa7tGlRdI2fpuwHnZBcE2lD7EPNrYJQ8VrSPGYkKBnAZnQf4SNXpS1tfiq4/y51yaWANJS5UU1XQuHu2h6j/Blz0uWOsrTFOP8xsJ505CnN3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2789
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 14 July 2021 14:26
> To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd <sboyd@kern=
el.org>; Prabhakar Mahadev
> Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; Biju Das <biju.das.jz@bp.r=
enesas.com>
> Cc: linux-clk@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Geert U=
ytterhoeven
> <geert+renesas@glider.be>
> Subject: [PATCH] clk: renesas: Rename renesas-rzg2l-cpg.[ch] to rzg2l-cpg=
.[ch]
>=20
> Rename renesas-rzg2l-cpg.c and renesas-rzg2l-cpg.h to rzg2l-cpg.c resp.
> rzg2l-cpg.h, for consistency with other (sub)drivers.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-clk for v5.15.
>=20
>  drivers/clk/renesas/Makefile                             | 2 +-
>  drivers/clk/renesas/r9a07g044-cpg.c                      | 2 +-
>  drivers/clk/renesas/{renesas-rzg2l-cpg.c =3D> rzg2l-cpg.c} | 2 +-  drive=
rs/clk/renesas/{renesas-rzg2l-
> cpg.h =3D> rzg2l-cpg.h} | 0
>  4 files changed, 3 insertions(+), 3 deletions(-)  rename drivers/clk/ren=
esas/{renesas-rzg2l-cpg.c =3D>
> rzg2l-cpg.c} (99%)  rename drivers/clk/renesas/{renesas-rzg2l-cpg.h =3D> =
rzg2l-cpg.h} (100%)
>=20
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile =
index
> 5c6c5c721d98d827..7d018700d08bd9dc 100644
> --- a/drivers/clk/renesas/Makefile
> +++ b/drivers/clk/renesas/Makefile
> @@ -37,7 +37,7 @@ obj-$(CONFIG_CLK_RCAR_CPG_LIB)		+=3D rcar-cpg-lib.o
>  obj-$(CONFIG_CLK_RCAR_GEN2_CPG)		+=3D rcar-gen2-cpg.o
>  obj-$(CONFIG_CLK_RCAR_GEN3_CPG)		+=3D rcar-gen3-cpg.o
>  obj-$(CONFIG_CLK_RCAR_USB2_CLOCK_SEL)	+=3D rcar-usb2-clock-sel.o
> -obj-$(CONFIG_CLK_RZG2L)			+=3D renesas-rzg2l-cpg.o
> +obj-$(CONFIG_CLK_RZG2L)			+=3D rzg2l-cpg.o
>=20
>  # Generic
>  obj-$(CONFIG_CLK_RENESAS_CPG_MSSR)	+=3D renesas-cpg-mssr.o
> diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9=
a07g044-cpg.c
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
>  	/* Core Clock Outputs exported to DT */ diff --git a/drivers/clk/renesa=
s/renesas-rzg2l-cpg.c
> b/drivers/clk/renesas/rzg2l-cpg.c similarity index 99% rename from driver=
s/clk/renesas/renesas-rzg2l-
> cpg.c
> rename to drivers/clk/renesas/rzg2l-cpg.c index 9addc9dae31ac115..3b3b2c3=
347f3763f 100644
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
> diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.h b/drivers/clk/renesa=
s/rzg2l-cpg.h similarity
> index 100% rename from drivers/clk/renesas/renesas-rzg2l-cpg.h
> rename to drivers/clk/renesas/rzg2l-cpg.h
> --
> 2.25.1

