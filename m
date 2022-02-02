Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D69034A7708
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 18:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235630AbiBBRnI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 12:43:08 -0500
Received: from mail-os0jpn01on2098.outbound.protection.outlook.com ([40.107.113.98]:24084
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231680AbiBBRnI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 12:43:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ni4aHCrC4pESv6gVoBQyFwTC9DhNnbTnyWZRvMXL2tLLc8+WR+4hcqFWVi8OqtvPlBHIAauUnHZg729u680Ph0YtQvWz6CprzyUKVyoRmhCm57we/tsfD7wpLlKIcHERSIRlFnK5b2k/YVpULVGLHC9WwAR6YkL+XlOg3F35shFqgII2GHMCFMBypvM9TuT0S+PU/3cLVjW0L96I9MghdOuHAhaonRLhXOzdXV8jmsiadZeDzmmJi6jfdgl4xi1nhJqOYps1xIxWLYbps6Cji9Fb1dwBAOSbwBC0qSN+gBa7VpN5oPnZkoPuTmVXjs/8OZNJMYc34kecyz9jMVZEsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tAuhYLEl34eyOa19NRrUpLWSv/Z2jzpBoqaAvKIurgw=;
 b=lh6+W1eTIQgGc9R34S7vLDru9v2LE1l04/LgQ0i+zCBHZjx/ur9tqCtWhFVHRVR72xF/5FGpPz9eu4kFahw5i+vraoUIUvSWKvOdEDcljse+4tdZOZinsUIjYvpFk/GeCiQHCF7iq41HKhwVO2084q2qV2FEtys/tZEURycRKhY5Iqwvqg4IB9jj51efU1SInue6VIcU62SJ6ty5ohdSKog6iOzyEHHS3rD0y/3b7WiINVx9wOSrlxQq7rmzUYkr793ra4Cqt/juQGLOMEvx8CXEPv/C+IH7qa3kVCg43LdX/5o2aCfhiWn6+4i1lWXKvXtTO7Cc+3QoUjBh9uJmiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tAuhYLEl34eyOa19NRrUpLWSv/Z2jzpBoqaAvKIurgw=;
 b=JkGT7sLiieCNnNeaQfPAzF3PRw25sqzjOkWU3pBg+YA5a3WvMuujsbIWbNiDHAwrW+wYdLJEURAaQDrLlaBQfyz/p1edCUQfu0nXztI+0C0aEg05+gDhlx5sahIEtLaoc+lB9m80Hu3hsq6XyVBt5mzCWzGpx5CpUSKODsuJ3AU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB9599.jpnprd01.prod.outlook.com (2603:1096:604:1d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 17:43:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%8]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 17:43:06 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] soc: renesas: Insert "Rev" before printed revision on
 RZ/G2L
Thread-Topic: [PATCH] soc: renesas: Insert "Rev" before printed revision on
 RZ/G2L
Thread-Index: AQHYGEA+ma8L8L5a3k+A4HSz3WIUBqyAh2rw
Date:   Wed, 2 Feb 2022 17:43:06 +0000
Message-ID: <OS0PR01MB592271F7B7E1481703F4616D86279@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <e61a88ca90ffd513c7aa680bdffefeee444edd8f.1643811627.git.geert+renesas@glider.be>
In-Reply-To: <e61a88ca90ffd513c7aa680bdffefeee444edd8f.1643811627.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7c41b850-1699-420d-eab9-08d9e673787a
x-ms-traffictypediagnostic: OSZPR01MB9599:EE_
x-microsoft-antispam-prvs: <OSZPR01MB9599D833520A0FC8C9FB6BDD86279@OSZPR01MB9599.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:110;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SoIZcRDTylHiCK9zbGDtfIqBe+NLI9HYrTC82sL+KtDuT1MLQrN1voZxz0JZ7Omjo28KjmBZRAF4y6T5jOGxsmlj/r3IShLdsioviU70aBWCcQ5MsRDu1MFzpw92TvUH5UvZNu48YGfWiY2dGQXJ66oLzvlgymJ7xnzBa+aZA4hMPMUE91kzFGdUw7v1RR5q5mn+BkrZwzi0DHydaDKojxedAjaUkPItqnwvS+qn2cYTIsoGa+rY1U6RQrQfFcYV2INcnVnulIOB/v1IwaS3Ow+AZ4nNXY1cGsdUpxq+m/KPebo8zCEZAK10qzmd58bAHA/6CRhplNYuIs1ruuxYsdZzgxGgqhazm1xNowXT5ZxfeAvxWoh2KgPHYWrrxhVg4uulAWBtod8qcgpwveS0HaSrC/2DxRcodxgtc0sVxRu3DMvF7Zx74+7NnoXasCtSayn1gwgKZn/npeKozc6Wr+auXxkvGoB7co4S+VDENKutOOUa95UdoEcifSQ6LOdlzHAl+oOumY9GLra0TiJ5hJoY6r8Q2j+7a/90iUr9mzNAHq+kOXNcf+GvebV9bi6yLzNqR0gmRv+LawFaTML03ZIrXflUHj9qtBMDhaqjLnHh87B2EI0Cl5BF+0n/85fQ6CUDfFkMtvwBgrdWI4yqw7RFNWhKFIKt5ZcNLp6TRDeuFvcuCzqitDhdRFQzEcJLOSvq0gCTuGTSKBJwOGCrAA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(6636002)(8936002)(8676002)(316002)(110136005)(186003)(2906002)(66446008)(71200400001)(66476007)(508600001)(33656002)(76116006)(26005)(66946007)(55016003)(9686003)(52536014)(5660300002)(7696005)(66556008)(64756008)(6506007)(83380400001)(86362001)(38070700005)(38100700002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HsKvLYRi7EC7NrtvPFCqlCdsz83kGk2slVw7wvwGww/ygkaelY5/WGcQ/8sB?=
 =?us-ascii?Q?z5hnB9ftdj4dLEijhhaDhA4uqZ1TpdGhfmQe9xt7imoRF94MpQHCAAwwbuMn?=
 =?us-ascii?Q?4pOWvJuRzIj0QySYzaq+hfXlDDPtDJgvKD9EZbxZnkI+ctMHm1oNjsFVufo1?=
 =?us-ascii?Q?3f12q4AqSJGP8Drxg82Tx5vD4eofaMwJnM6Tehn4Q6tg9aqDH4deCIRX4NeS?=
 =?us-ascii?Q?f0kLddTgEpEhgusd68bDrzVcPBdhRrMmZMU/Abglu6Z99XyhPtCUzKgJ5XFW?=
 =?us-ascii?Q?hiVz721VqrmQ1sJtwru5NSzVkkTxKfIewfPKTH/WR+Plxd/9PZdNKCmFN/yh?=
 =?us-ascii?Q?JGB9H+n3mfO1WAMRr639nvQmlQhCJrMol9qiKlPtw/tFJbuOXynOqReMc86Z?=
 =?us-ascii?Q?arlc8H5YNBffOtjta26zNKwtrcV+ySc4l8twp9rHos3QGuMdSF6csVU9lijT?=
 =?us-ascii?Q?XItZ6k3tFMX3chn5L/p28snr56p9mzmDKFE6KdswQLm95Q1zTbrmjIlZa5ZD?=
 =?us-ascii?Q?aJq9lNB8r/XueicyYowdMzwLryLwgcskOOG8hpBD7UrotuVsau+ECt9kWUoK?=
 =?us-ascii?Q?b8QBL+q/IR8L/+Pe3bT3PagUeH7Bf8xLoKWAZH4vOlYv/eqrtKfTTiiSKmNz?=
 =?us-ascii?Q?0IAoMM5g7FrmNVpI8w04J07/mjCNpuo3JaTECdFwgF+8bPyU3TGZSXgdIyqf?=
 =?us-ascii?Q?UsMOpvmoIsJ5FjRJNSj81kGNdI83neJ4K0fA3fDNnURC4GQm4PiNhwHGkNXK?=
 =?us-ascii?Q?vO5JhSosZduI2lmI8VG2NY2NreczDiS2JF3ZbSrWm1qDtn2jPkXDi4Y5zskx?=
 =?us-ascii?Q?3l056WFZs7BMIWYjHGR3NM7S3P2Yc0sfZvLiI2GSTuZDcABIZEmpBb5zq0lF?=
 =?us-ascii?Q?F9oyAf0+DSkRtoGpKRec1XPJz3kd3+gFl7OtP2XCjW7ziHJbnEpqUCMaliSR?=
 =?us-ascii?Q?1SBZnnxIdL7ON8TFbv51hSVktYWvKKj0/kJeXR3VZ29S22w03eaMmkDcU6rd?=
 =?us-ascii?Q?NWbpNv8Nh4C4a8dZJDbqWMWCjomrXp1c4LS6ZxcNXyTt/OM3iBaYZVlTLutp?=
 =?us-ascii?Q?K7Ua4WKoksyVCer3SSfm2i4v20iNNovPtO2Gl5Uk1dV1jgUtFkEqkTEqjV/6?=
 =?us-ascii?Q?W1PiDoyKFYLRgDpsx4A4B/5vt5kJDHUklvCOoE8i4BkoLKBgAb/wMqxFFSs6?=
 =?us-ascii?Q?4JBKX/asHwVsNEC4gss7rM5DFNkhEPn56HiazCaEF6ogX937IgztpOX4063h?=
 =?us-ascii?Q?0qTcESEJxJHHPrM0JQ6i412vkIXrv1S4cTC7WOdJE7ZKDQfWx5hkQAcHcg7J?=
 =?us-ascii?Q?W+qxa0/Z/vN/vZxsZVzVuaLqjqXvQXM2dMHpyd0tolX/sA4e6cZ7q8yvcN0s?=
 =?us-ascii?Q?ELm0LzKz9at/0OIJXZaHw84421zvYBWdqBOyEI/1B7Y8shIy5I7ppsumKbZr?=
 =?us-ascii?Q?HlEmF9xVqdKk8Sk1DQXcTwbPH3bmbyeCor/n8NCvjzLw/Y4sw7FFskBfjg0Z?=
 =?us-ascii?Q?d9y8CSFcOSTpDnI14vqaviKztCbPg3DKR7zFknTfq7+xrlQ1UPoWoalmXRg0?=
 =?us-ascii?Q?sr5YXdpl8rhpzMRHIrBdGhfjhoDAJpTGdc9I10u2ByKOV0ApfKGd06HVC5Hg?=
 =?us-ascii?Q?JaDIWh2JY+HYfq/T9YzJvE1JJUEATgAd9Qvjf2cH3MFZpCPKw95+qvZHWAQJ?=
 =?us-ascii?Q?cpHJQA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c41b850-1699-420d-eab9-08d9e673787a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 17:43:06.5803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h+K5K7QQ2VbegF1/1OehwG9II6PXq2e/Shg7va1JgetfARNtvZ4iCkfIBEO5DgBWpRWHAPIiAznywvDGt4Ndbb8EpZIN5CJoGT9oyZekG2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9599
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for the patch.

> Subject: [PATCH] soc: renesas: Insert "Rev" before printed revision on
> RZ/G2L
>=20
> While just storing the RZ/G2L revision number into the
> soc_device_attribute.revision field is fine, printing only the number
> during boot-up looks a bit silly.
>=20
> Make the output more visually-pleasing by re-inserting "Rev" on RZ/G2L.
>=20
> Impact:
>=20
>     -Detected Renesas RZ/G2L r9a07g044 1
>     +Detected Renesas RZ/G2L r9a07g044 Rev 1
>=20
> Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
> Fixes: 92dfff382af0ce65 ("soc: renesas: Add support for reading product
> revision for RZ/G2L family")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

> ---
> To be folded into the original commit.
>=20
> Compared to my earlier proposal, this does not impact the output on non-
> RZ/G2L SoCs.
> ---
>  drivers/soc/renesas/renesas-soc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/soc/renesas/renesas-soc.c
> b/drivers/soc/renesas/renesas-soc.c
> index 1ca83c4c0fd8c9e5..a5377d9c299f6c48 100644
> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -408,6 +408,7 @@ static int __init renesas_soc_init(void)
>  	const struct renesas_soc *soc;
>  	const struct renesas_id *id;
>  	void __iomem *chipid =3D NULL;
> +	const char *rev_prefix =3D "";
>  	struct soc_device *soc_dev;
>  	struct device_node *np;
>  	const char *soc_id;
> @@ -463,6 +464,7 @@ static int __init renesas_soc_init(void)
>  			eshi =3D  ((product >> 28) & 0x0f);
>  			soc_dev_attr->revision =3D kasprintf(GFP_KERNEL, "%u",
>  							   eshi);
> +			rev_prefix =3D "Rev ";
>  		}
>=20
>  		if (soc->id &&
> @@ -472,8 +474,8 @@ static int __init renesas_soc_init(void)
>  		}
>  	}
>=20
> -	pr_info("Detected Renesas %s %s %s\n", soc_dev_attr->family,
> -		soc_dev_attr->soc_id, soc_dev_attr->revision ?: "");
> +	pr_info("Detected Renesas %s %s %s%s\n", soc_dev_attr->family,
> +		soc_dev_attr->soc_id, rev_prefix, soc_dev_attr->revision ?:
> "");
>=20
>  	soc_dev =3D soc_device_register(soc_dev_attr);
>  	if (IS_ERR(soc_dev)) {
> --
> 2.25.1

