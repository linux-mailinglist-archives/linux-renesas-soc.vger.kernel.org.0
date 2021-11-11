Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E17CB44D557
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Nov 2021 11:53:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbhKKK4G (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Nov 2021 05:56:06 -0500
Received: from mail-eopbgr1400090.outbound.protection.outlook.com ([40.107.140.90]:23835
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229643AbhKKK4G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 05:56:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSYOfW+d0O+HXSRJO85W0WJCmtkuX0eMhNvtoceNENiixsk8hvOHozc42qnsohhti2trCH+wbDbN525blxzYCZxnJ2JEtq3hikL0Cmnk4+N8PGoaXj0gG98zrlu7KbCfjhwag7oXWM6GCdWLkyfKNRcdXZRxVorAwuosIGq/RtUw0fmcL96XvSgYTFr6DY7iPVylJuPsQHMmuWzt8Zq4YlOZyv2QdUuaqxgvjubLoJi2cpVwbxW8OVAgS/dwSpvvuObgzs4ZtKRPJH4/FzM5Aec6zqZOem4GclFkmcAngx46uQklQwMr6W/2m3hSQE/R7FIppmHTzXCjTPhlXQOIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNjr24BFuK5NiWXOphxohFupJJaqvLoBfjw4SlLopGY=;
 b=Y4QHjlK5r9kvrW7j2SvUi79gmETRJ7ZhclIcV0pDinifwJu2WtkEPLiCxjY5E/BlUF84alt1HAqPkVDnTIZ/K9HbVoU5BUmGY0lgMa8V5uV5iLmPTygVnIMnfAFSpKugEfZH3tSX5uySn5RBQJdMAvwSXvDROfgwHMrATb94nIC9t3vFEl7KkKSOgcTjrNjVg/vZsMC8zuY5sn+qs2O4EiBxCtxgiL9/eaFbkCqad3gCwHy/R/7gAMdnRARw61S8PBGqsGso+BAbe+xGQoe5ahaYGnUmmyTCOAWh7mPwKMRmQ/2FF/X2stMiN7P/HQynBf0YEMgMGCHNiaEz9oG9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNjr24BFuK5NiWXOphxohFupJJaqvLoBfjw4SlLopGY=;
 b=HB8fyN1MC6WJnR5vpyznzBCiQl+E9A5Mptd0Zk/wXlA3QnM4gtzF301/hEqJpHRgcQ7gIz0ARdiLS/53MrMmo/6/oEumLjfvhAubzlps6AtCDLgzVNmwvY1V6RpkcBCgSiKl45hIhDRtVzKDwCtUOf72S8wgwWdJwg3XVx2LMYU=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OSYPR01MB5317.jpnprd01.prod.outlook.com (2603:1096:604:93::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Thu, 11 Nov
 2021 10:53:14 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::1d3d:8c79:ad2c:62ae]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::1d3d:8c79:ad2c:62ae%9]) with mapi id 15.20.4669.016; Thu, 11 Nov 2021
 10:53:13 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <Chris.Brandt@renesas.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] soc: renesas: Consolidate product register handling
Thread-Topic: [PATCH] soc: renesas: Consolidate product register handling
Thread-Index: AQHX1mVOTRi7z328j0izZNoosmVLiav+JrXA
Date:   Thu, 11 Nov 2021 10:53:13 +0000
Message-ID: <OSZPR01MB7019F654442E51DAA294DD69AA949@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <057721f46c7499de4133135488f0f3da7fb39265.1636570669.git.geert+renesas@glider.be>
In-Reply-To: <057721f46c7499de4133135488f0f3da7fb39265.1636570669.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ec3169e-ee0f-4ec4-00ec-08d9a50175a8
x-ms-traffictypediagnostic: OSYPR01MB5317:
x-microsoft-antispam-prvs: <OSYPR01MB53172100E876CFE75F359D4DAA949@OSYPR01MB5317.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ev/pgDB8M5hDBMnhTTzro1u0iH+21lW0ZqCeUy+Z52ShPQK3ihKR1N+5w3pc/O9vmbrXtubud2KcEWSMkMQ9VJ7fpxfTWLvedT3aThFsH2UpC3/KBqiZT4HKYq80PeRuheC9iq2y61seYd64HDwtMcJx4B4bVeB79HRP7uImyNrZjBFAKGCsDyY89DRmwANFiibMSSkEhO5kBVxvE9I+ztxVSHkIOeLVCgrZtsPnPtDwTACDc7TKEv4D2fN2OlBMPVS5eTVTi7tDzQZO3z+9ns4Sl3vFRjPXmWHir8lTf88QTSiUful1FDmfVV8yyHFF1Blj9K0PNp+h6Pog8sfKrltzFxAX1TrUCaNTqXnAXbkftpL81BJn6UoctMZgaHMUystgiKGVKxXXWQCQ61Vsk/D484QiuGiTUYBuWFPXwfc2z0sZsd7CJSJK0iFLc5ng+8F0Cns1WIGaR2R9bcBuirGRQZUK55aUQZSe+EMgY9smZZH6NE3ctQGccGlWe96hP0CoE1pNvIMXX9Rx+yCpr/XbbNpT5m9kFe7wuYe7t2Utg+oVdACXB9yaa6+Un+yd1iNUUsTxSiRAfddGphLAWHTniMzINTt+UwgCcd5XwyR/36ZoY/zKWJhVhAEYaVUMu+Vk0Ixd8JrTS7XhTBoIi4ZHrbaKz3kQLlU1gPulL8B/Q+zBJFDkjkfjYuLxoQ+alZ81pp/5rFtH3lCsVplCEqvb5Hj+zOq0+18DEcJGAIEZvQTdYZASSXIY9hSt3Q1P7Sad/AsjCXDFmRKImgzLlIIcxEligazvKbcDmGQF6qc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016002)(86362001)(26005)(71200400001)(966005)(122000001)(5660300002)(66946007)(45080400002)(83380400001)(38070700005)(4326008)(66446008)(508600001)(7696005)(2906002)(33656002)(186003)(8936002)(6506007)(76116006)(64756008)(110136005)(53546011)(9686003)(52536014)(66556008)(38100700002)(54906003)(66476007)(8676002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Mm7Mr8gtYtUlTtR6nZrIJE0Go6nkh7UZRZHljFN6b73qu9KXdcNtV767y1w+?=
 =?us-ascii?Q?Xr9QHQVe1vFXFakd6x8gHqq3d/IEj4Lzc5qqZ81LIPmYMq1bIrB0mz0cgxJm?=
 =?us-ascii?Q?Y5pV4JpVn74i8xDmemu6p787dBCQhXeN+CWRlGxYMR6AEdxoObMvU3JkHYUQ?=
 =?us-ascii?Q?kGn9vvrbyheTorAs3FX3GbiTpG8zYdfmG+pNJ/AaOIKH7Qj2ouk/6TMyuyob?=
 =?us-ascii?Q?QvpmCgHQ5eYok6y60gs8LGMBke/0tGsJIt9geB2Vlw4+2mkzwQbQ8Hd1X981?=
 =?us-ascii?Q?ySh0kDtJuUmAZ16l26Nk1vcyATdavS4olpdnZki8DI/Qb58v0fCEeji/Nc/Z?=
 =?us-ascii?Q?AzgLAzh+pqvnNqJyiMJskO935+CxgxWrD0hYcnuZ9lPbnPK+vhO3z+wwNwr/?=
 =?us-ascii?Q?dy7bE5O8BSMmuqtswSIIs3pqU2mfpKaTvyKInvTA3mThkL+Z4EYiCEgeX4C5?=
 =?us-ascii?Q?6ZMC0wilDeB1slGWp1NpAXyaKweXQB1LAXC5QTEeRUNsRXD3dkniokxA/5NQ?=
 =?us-ascii?Q?N19YbtucnOweXZzOQR2UdNgHrKY5Xa85La6IITYFDcmAFN6zdZYetEoKKhI9?=
 =?us-ascii?Q?0fWXnjyEkAWnGihuo1B4b/dK4u5yObvoPW82Zj2zYamfF+rhvSmD7n0K1B0B?=
 =?us-ascii?Q?lXgdK5vI55oKyTYwVvXrhbo+gbeqdhJ7nmCb2lipeomzDaKDczYqVkebz7DV?=
 =?us-ascii?Q?hlgTRMeoqbBsLGCYg75oq+5bR1Cu+EfYO8vNw/BXhJubqwiQ66kfYTFgoEvm?=
 =?us-ascii?Q?vu5yYd8tXUhYZR+lsbKqKPt464C+c5nmacy/6N5rKhVhwl4QmLGGaIKR3WHu?=
 =?us-ascii?Q?w+EO6mVrtI1k0o6BlrsVCwx2O01JEZ3oPChPKEbvHerA0vWx4ojPTHIgmj4o?=
 =?us-ascii?Q?m1ImMePjm1sG1YTlWNg/8zVviCMd4e1s7hpnGNhHGlLJS94PhmZwRxPiyd21?=
 =?us-ascii?Q?9XaUasV9muDDo4PBTDZpfvDfJwAqTzDYF98HFsmK9IVGz0X6eF3a0AaJc/en?=
 =?us-ascii?Q?NuiMDdhBmQtiQAT8+W9/KgCjAJFAs7L+nbBzYL6ZV9lIpe4mt8DF9E8RyuTp?=
 =?us-ascii?Q?e3TOSEzyl+9++s0nkhj3h70DhZh8nRmXPmtN1oA5ks7mNtYlLj9PVyjDfs8v?=
 =?us-ascii?Q?aw5bSMK9T8S+b/THhQCJdMhsZqVLMJQGIN6KPeUaBhY0rMvtPl+2ciK/l7tW?=
 =?us-ascii?Q?6voj2sC4Kf4YBEGi4X5lQqT8mgOubqq/tJJL12Dkx8o+eFuwu0N44iVX6HLq?=
 =?us-ascii?Q?50E8CZQmtO+GMJx1qsyyqtpGTnoZwj7oA9lOcU6w2DyJ7UhhgUE1Tv7hEOzC?=
 =?us-ascii?Q?LztslmvpRNeLnC14XyiQybfH4ZcOC1Sxz4VUUgHogyLf0I6AqitovYXPD8wA?=
 =?us-ascii?Q?TQ4Pry+RdaCotBzWZRSmf2deDNDDuk/0EZ+UTVSqCHvCUHoqXURZB4wi605z?=
 =?us-ascii?Q?iV9jcwx9DQVARkhISNIxVMpAl5J2jQWRefEqIhCYsPjYCMXGMiK/HXFri0Qs?=
 =?us-ascii?Q?+59YNvi1Sy3/uWTGn1FPtzYA7VWKItz8ojZ8KNvJ2W5tAF0bc6C2EgpT7EkK?=
 =?us-ascii?Q?/KsKK47utaBJ2i+XNTGo1zfgSgHFoDJPGONw0w13isaCn64MYTl3aL3XBxxe?=
 =?us-ascii?Q?zJouaX+FpF6Tb4Lr3vpJkQANpuyv0ZiXGJrRUf0rdY7Gv+cRE7XfkktsXr9g?=
 =?us-ascii?Q?z2bbNjFK2Su516TyvziCrgsyHpnBRdC7UUIHiYHatkIk3gfo78OU+rXyXx3B?=
 =?us-ascii?Q?xWup3OEbcg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ec3169e-ee0f-4ec4-00ec-08d9a50175a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2021 10:53:13.6105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P1UXpJTKMieiyB14DdWxNb11q2wyUMiMqUcuXJYrOtJCuW/qoA9dLgU3iirEnqAH0+cnL6CMzwnek/G4JEs0tP30kJBHIj4hcYMcrBBrFdx0xVV9/XMrrVGXmeh+HlVB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5317
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 10 November 2021 19:01
> To: Magnus Damm <magnus.damm@gmail.com>; Chris Brandt <Chris.Brandt@renes=
as.com>; Prabhakar Mahadev
> Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org; linux-arm-kernel@lists.infradead.o=
rg; Geert Uytterhoeven
> <geert+renesas@glider.be>
> Subject: [PATCH] soc: renesas: Consolidate product register handling
>=20
> Currently renesas_soc_init() scans the whole device tree up to three time=
s, to find a device node
> describing a product register.
> Furthermore, the product register handling for the different variants is =
very similar, with the major
> difference being the location of the product bitfield inside the product =
register.
>=20
> Reduce scanning to a single pass using of_find_matching_node_and_match() =
instead.  Switch to a common
> handling of product registers, by storing the intrinsics of each product =
register type in the data
> field of the corresponding match entry.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Unfortunately the simplication of the source code is not reflected in the=
 actual object code size, due
> to the sheer size of struct of_device_id (196 or 200 bytes on 32 vs. 64-b=
it).
>=20
> "[PATCH/RFC] of: Shrink struct of_device_id"
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
kernel.org%2Fall%2Fef59d6fd3b22
> 01b912d5eaa7f7a037d8f9adb744.1636561068.git.geert%2Brenesas%40glider.be&a=
mp;data=3D04%7C01%7Cprabhakar.m
> ahadev-
> lad.rj%40bp.renesas.com%7C97f0415c949a4bd5f67e08d9a47c6e5c%7C53d82571da19=
47e49cb4625a166a4a2a%7C0%7C0%
> 7C637721676621408059%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXV
> CI6Mn0%3D%7C1000&amp;sdata=3D2Yp%2Fz9uQmdg4rrZ3uHIB7QAWKlJcNAo5xyszYqDRWc=
M%3D&amp;reserved=3D0
> ---
>  drivers/soc/renesas/renesas-soc.c | 115 +++++++++++++++---------------
>  1 file changed, 56 insertions(+), 59 deletions(-)
>=20
Tested this patch with RFC patch applied on SMARC EVK.

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/rene=
sas-soc.c
> index 7961b0be1850922d..7da0ea3587c4eab8 100644
> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -328,16 +328,49 @@ static const struct of_device_id renesas_socs[] __i=
nitconst =3D {
>  	{ /* sentinel */ }
>  };
>=20
> +struct renesas_id {
> +	unsigned int offset;
> +	u32 mask;
> +};
> +
> +static const struct renesas_id id_bsid __initconst =3D {
> +	.offset =3D 0,
> +	.mask =3D 0xff0000,
> +	/*
> +	 * TODO: Upper 4 bits of BSID are for chip version, but the format is
> +	 * not known at this time so we don't know how to specify eshi and eslo
> +	 */
> +};
> +
> +static const struct renesas_id id_rzg2l __initconst =3D {
> +	.offset =3D 0xa04,
> +	.mask =3D 0xfffffff,
> +};
> +
> +static const struct renesas_id id_prr __initconst =3D {
> +	.offset =3D 0,
> +	.mask =3D 0xff00,
> +};
> +
> +static const struct of_device_id renesas_ids[] __initconst =3D {
> +	{ .compatible =3D "renesas,bsid",			.data =3D &id_bsid },
> +	{ .compatible =3D "renesas,r9a07g044-sysc",	.data =3D &id_rzg2l },
> +	{ .compatible =3D "renesas,prr",			.data =3D &id_prr },
> +	{ /* sentinel */ }
> +};
> +
>  static int __init renesas_soc_init(void)  {
>  	struct soc_device_attribute *soc_dev_attr;
> +	unsigned int product, eshi =3D 0, eslo;
>  	const struct renesas_family *family;
>  	const struct of_device_id *match;
>  	const struct renesas_soc *soc;
> +	const struct renesas_id *id;
>  	void __iomem *chipid =3D NULL;
>  	struct soc_device *soc_dev;
>  	struct device_node *np;
> -	unsigned int product, eshi =3D 0, eslo;
> +	const char *soc_id;
>=20
>  	match =3D of_match_node(renesas_socs, of_root);
>  	if (!match)
> @@ -345,77 +378,42 @@ static int __init renesas_soc_init(void)
>=20
>  	soc =3D match->data;
>  	family =3D soc->family;
> +	soc_id =3D strchr(match->compatible, ',') + 1;
>=20
> -	np =3D of_find_compatible_node(NULL, NULL, "renesas,bsid");
> +	np =3D of_find_matching_node_and_match(NULL, renesas_ids, &match);
>  	if (np) {
> +		id =3D match->data;
>  		chipid =3D of_iomap(np, 0);
>  		of_node_put(np);
> -
> -		if (chipid) {
> -			product =3D readl(chipid);
> -			iounmap(chipid);
> -
> -			if (soc->id && ((product >> 16) & 0xff) !=3D soc->id) {
> -				pr_warn("SoC mismatch (product =3D 0x%x)\n",
> -					product);
> -				return -ENODEV;
> -			}
> -		}
> -
> -		/*
> -		 * TODO: Upper 4 bits of BSID are for chip version, but the
> -		 * format is not known at this time so we don't know how to
> -		 * specify eshi and eslo
> -		 */
> -
> -		goto done;
> +	} else if (soc->id && family->reg) {
> +		/* Try hardcoded CCCR/PRR fallback */
> +		id =3D &id_prr;
> +		chipid =3D ioremap(family->reg, 4);
>  	}
>=20
> -	np =3D of_find_compatible_node(NULL, NULL, "renesas,r9a07g044-sysc");
> -	if (np) {
> -		chipid =3D of_iomap(np, 0);
> -		of_node_put(np);
> +	if (chipid) {
> +		product =3D readl(chipid + id->offset);
> +		iounmap(chipid);
>=20
> -		if (chipid) {
> -			product =3D readl(chipid + 0x0a04);
> -			iounmap(chipid);
> +		if (id =3D=3D &id_prr) {
> +			/* R-Car M3-W ES1.1 incorrectly identifies as ES2.0 */
> +			if ((product & 0x7fff) =3D=3D 0x5210)
> +				product ^=3D 0x11;
> +			/* R-Car M3-W ES1.3 incorrectly identifies as ES2.1 */
> +			if ((product & 0x7fff) =3D=3D 0x5211)
> +				product ^=3D 0x12;
>=20
> -			if (soc->id && (product & 0xfffffff) !=3D soc->id) {
> -				pr_warn("SoC mismatch (product =3D 0x%x)\n",
> -					product);
> -				return -ENODEV;
> -			}
> +			eshi =3D ((product >> 4) & 0x0f) + 1;
> +			eslo =3D product & 0xf;
>  		}
>=20
> -		goto done;
> -	}
> -
> -	/* Try PRR first, then hardcoded fallback */
> -	np =3D of_find_compatible_node(NULL, NULL, "renesas,prr");
> -	if (np) {
> -		chipid =3D of_iomap(np, 0);
> -		of_node_put(np);
> -	} else if (soc->id && family->reg) {
> -		chipid =3D ioremap(family->reg, 4);
> -	}
> -	if (chipid) {
> -		product =3D readl(chipid);
> -		iounmap(chipid);
> -		/* R-Car M3-W ES1.1 incorrectly identifies as ES2.0 */
> -		if ((product & 0x7fff) =3D=3D 0x5210)
> -			product ^=3D 0x11;
> -		/* R-Car M3-W ES1.3 incorrectly identifies as ES2.1 */
> -		if ((product & 0x7fff) =3D=3D 0x5211)
> -			product ^=3D 0x12;
> -		if (soc->id && ((product >> 8) & 0xff) !=3D soc->id) {
> +		if (soc->id &&
> +		    ((product & id->mask) >> __ffs(id->mask)) !=3D soc->id) {
>  			pr_warn("SoC mismatch (product =3D 0x%x)\n", product);
>  			return -ENODEV;
>  		}
> -		eshi =3D ((product >> 4) & 0x0f) + 1;
> -		eslo =3D product & 0xf;
>  	}
>=20
> -done:
>  	soc_dev_attr =3D kzalloc(sizeof(*soc_dev_attr), GFP_KERNEL);
>  	if (!soc_dev_attr)
>  		return -ENOMEM;
> @@ -425,8 +423,7 @@ static int __init renesas_soc_init(void)
>  	of_node_put(np);
>=20
>  	soc_dev_attr->family =3D kstrdup_const(family->name, GFP_KERNEL);
> -	soc_dev_attr->soc_id =3D kstrdup_const(strchr(match->compatible, ',') +=
 1,
> -					     GFP_KERNEL);
> +	soc_dev_attr->soc_id =3D kstrdup_const(soc_id, GFP_KERNEL);
>  	if (eshi)
>  		soc_dev_attr->revision =3D kasprintf(GFP_KERNEL, "ES%u.%u", eshi,
>  						   eslo);
> --
> 2.25.1

