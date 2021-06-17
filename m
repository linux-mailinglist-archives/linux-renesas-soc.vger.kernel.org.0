Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E255D3AB599
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 16:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231478AbhFQOQX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 10:16:23 -0400
Received: from mail-eopbgr1400130.outbound.protection.outlook.com ([40.107.140.130]:63394
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230137AbhFQOQT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 10:16:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1iPfZMccykNPwyWhqPX40MJrR2/MkEcJ8p4ALgushQphaPhCqzYGsUKsdJK0I4G81pSHWPKsxfxNlENYxi8p7l8XWugEKCWTMuAZHeHIVnPI+C8IYLgKL6fyFVFuHjn4+WdFWNqdV3hggzIKCjyZEWEhV9/441MAENXi56+O0hQC2JjXbcELldQP37BdIGgcotwt/fr92t/xd3NJcSTL4AmUnmbLqMUYrSHfem73l9oW8JkJTL0CXHmV8RLcg0ghi9gjsMJ1zJWh0Q2kTW3SUrbQ43LdqfSyZ6xImz2beAmGJskm4X2Frr3ZAKv9iyVSgfqIClJ1oah+3gz1zMRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8kNR72j48bdgqlzN2gY/4FJsSQJA5SoVbpKEgBvNEI=;
 b=VT1pbFBwdHNTorXE1hCA3GYnbymcBWXHy3/9JKlyHEX+e+Q1GPmXE9DAK7+wmKylnNBmYbwZcj3Y8/qbEdzBbFRXpsOdtnZPXTgCsRaqASfVjj1hjU85B2CVxmECqUlKmSAUIjuOfsqyvUXMHeKUeNnLL4ObU0sBWhysUvSpe6MkdBAzGomtfNtz5xaN1jqIwCoRgojC3L3+QuoFhS2hL0UcwACAPLuYW4gEK9+anyRAo0MGp/1uAx8deyJuLKjLrmaowanlrRnDYSEjHH3PVvTrI+bqDVfeQxiQvFaBOn1RRMql1iTsTWzSiqsZZoPQKIMNmil03TGtVKovxcgxdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8kNR72j48bdgqlzN2gY/4FJsSQJA5SoVbpKEgBvNEI=;
 b=NaA3UFJ2l3V8vtmvFyu7cirC4+wux1Aco1Ju3QPx62et9P58O2Bfl4Ks54/U4DbOX5Q/EGqo9v58LWeSNTukio1e9he35MKvWcvtBXUvZzkZVSNow9n+xvXLsQvrvEXIXDwhjdSkmYLa/U5Xi3UFMgzqgfw0svVk+0jfRYJ+gNY=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OSAPR01MB3761.jpnprd01.prod.outlook.com (2603:1096:604:52::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Thu, 17 Jun
 2021 14:14:06 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::79f9:fd59:1111:55e6]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::79f9:fd59:1111:55e6%8]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 14:14:06 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: RE: [bug report] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
Thread-Topic: [bug report] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
Thread-Index: AQHXY33i2Wlsz5nzFU2l9cu5KTp2NasYPe0Q
Date:   Thu, 17 Jun 2021 14:14:06 +0000
Message-ID: <OSZPR01MB7019B7DD71AB6E3FE04AE51CAA0E9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <YMtP/QHWljGcv3JX@mwanda>
In-Reply-To: <YMtP/QHWljGcv3JX@mwanda>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.219.24]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ed87f977-f76d-4e06-8d24-08d9319a2b12
x-ms-traffictypediagnostic: OSAPR01MB3761:
x-microsoft-antispam-prvs: <OSAPR01MB376196496602FDFC45F50976AA0E9@OSAPR01MB3761.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KUN+A1gA6FrwPQQAe1sKJTPWkSla3whzmV0svkT6ycjmxyQVjATlqRreyc0BJXU4opucnbqC27GOg5NRNncZtXWrOIRaE8hK3cgGfxjTf+eA7yNsiCE3vRYuilwsR/F99Jg8bRGR4T/LuOTmEsWsDg5B/ue7obJNKzCaqARPSN873Nph7O1fYetvynI7UHvopavv7Y6O9UNajggO1/IfgHIkzRQZGYydysCa5EOvODITe/fH5CWDbfKgpOxGWynpZizA+8hHAajZvJkEdizKZZkC4aCpg8alDY9Zob0dxsAy73ujgb2o3TdMqmFTbJ+7PCotcG7tg0F6QvNPUVrpWKHiIJiau7wM/V4YEpJCUbF7KSBOxNNpnH5RVcC1Frb6UvvUThKeXrhIr9D4W7kxK5TyO8XZyeqScLq86unbjFyq17a57jaPG9IyTSlOUPB/xWSPYKVgkKUDW0cqL0uQZcuaFPamMA6+XWkCC1q0hMX7pBH15Gw01kz1l33EP94yxw+EIYnnqBHEcQtJdfchtXW+1RzTQ8IQBhvKN5ipatm8BkAqnCGbWgsPLBEhNiY9Upg1IikE6zDtOoF32DvGhP0gUe8eijB56FoXc0k7tj8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(366004)(396003)(136003)(83380400001)(71200400001)(54906003)(52536014)(4326008)(64756008)(6916009)(66446008)(6506007)(7696005)(5660300002)(53546011)(8936002)(66556008)(316002)(478600001)(86362001)(26005)(66476007)(9686003)(55016002)(8676002)(2906002)(33656002)(76116006)(66946007)(38100700002)(186003)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Q8b2nWT6chf7ktiOuov44pcYBFidUjcfjrDSPatExE2AXL5EYH40Mv6NTDLj?=
 =?us-ascii?Q?YPdue4p56pj2feIGHYM0feA/C3lEqqP4chjAOxCzMJWDnzKX9Ushca2X8W6n?=
 =?us-ascii?Q?d0c/AiGKkYx0aGFkwAUkG4rlmDFLKgcVyF9fcXzJSvMPOu45bEdfWgAespvQ?=
 =?us-ascii?Q?ePRiJtArscKfwhMP24opEZr1YauJ4FEF2bi1cPponfVYamuNtr3Y20axVLsr?=
 =?us-ascii?Q?LwCd15mlB2HQW1UdleiMnGlU9p0SVpuqZPy2nSP1CGO19czuzitFrcyZh228?=
 =?us-ascii?Q?lgPf2uoLkeeVVFwVBEafjxGa50mA2fxyyrslwDPHISTN2+OkC+8WSsDKdDeg?=
 =?us-ascii?Q?q9A/YmOR7HDBIvue0UNmaqYy7BZYn0NdYj4raDdaYQujZSd+9r/nRMdwO63t?=
 =?us-ascii?Q?m3YIMrh1MHKOL5ZZVeA/mdgs/gzDPS6c0nMQL5pcH785dOmJe+avL1AL+ZU2?=
 =?us-ascii?Q?0ZA28amde6Sv8Irrh05Gm0ZU5dPzeTFvHp7fFTFPISy1lv3Ag2lGMQiy+SzB?=
 =?us-ascii?Q?rgoRWJgvdimjvvz93Hsxa+aloE7SnTLFPx5p/7F8lpuRBQHMuxT9vltUGciS?=
 =?us-ascii?Q?yTOCAgP7Fhrfwu/Y0QePMbB4Pt9AzSSR3YJFutSuuVleH52Wk2WpaXDGqqk6?=
 =?us-ascii?Q?MyW4j2YtLW7itYPCTnBbv1LDgAr1fk446MVDJRFSfOud6+CoeLwpuG8N/UTf?=
 =?us-ascii?Q?GOCFm1IiymZrkbEWAzAmfmuPt+kfZgziNWzdYiw35EOq/DCNbEZKxFte6zIe?=
 =?us-ascii?Q?XabxgiLoZflHBb6h3IwYpremSisreGYgOlxXqM07JOGYup9jv9lfeM7nQ3vO?=
 =?us-ascii?Q?ZdTGZOLer8hOmGU30vCEsTCyryJHu2KnXScuOKdsNcxKP+R7BNGZ5oSabQy1?=
 =?us-ascii?Q?S0Hj2dRcYptf528tXIfkyZa79DU7I60Ti9a2xBVcapgWxrGsYfZjLwv8wxgm?=
 =?us-ascii?Q?/1FjwcLkzXmvWo2/tFpelAJ52wW+dfOicA9rTH/+IM4dXIYVY9qOMyvJiiS7?=
 =?us-ascii?Q?zRzQx6HZrzpwZlIcunE8d/33KogRpFnhoj4IR4fiedh1AEEAayJeVA0mGljv?=
 =?us-ascii?Q?ZGqkLqwDmm1Pscpc0QFWi6DglUo24jnDY1FVhgGKaMJxBqnA+NmTZHy4KNbP?=
 =?us-ascii?Q?k1l/mWoV0YciCu7x1QiBl1p28IG2RN9CWJXRME4mPjSg3Yz2LCvE0k3pABU7?=
 =?us-ascii?Q?bgnY/hcza1jfLec4bL7DAX2MZAkGl67a9o2bfsXgavxL1kt+xGGUHnlNlDen?=
 =?us-ascii?Q?P8DoMVziH1HF/uP8j7p8BlnaBaKyW6vjvU5A0PST8FzzVgJBRkKJzN8ZTxE7?=
 =?us-ascii?Q?41AY/uTUfxsbF8Aq3Z8Zt1nh?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed87f977-f76d-4e06-8d24-08d9319a2b12
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 14:14:06.4158
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EkBKRFCFDXQVNUoaYjZl+2yM3s4SXpEtJnwZcgAKwF1+LPNHY5di76SelCYIiCS+Kv/8NuNafABgClJ/lIOSrp0D91Xp8k+jMH6X3STcUCLgz/dblQxbE/AhnYCPbZXN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3761
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dan,

Thank you for the review.

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Sent: 17 June 2021 14:37
> To: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org
> Subject: [bug report] clk: renesas: Add CPG core wrapper for RZ/G2L SoC
>=20
> Hello Lad Prabhakar,
>=20
> The patch ef3c613ccd68: "clk: renesas: Add CPG core wrapper for
> RZ/G2L SoC" from Jun 9, 2021, leads to the following static checker
> warning:
>=20
> 	drivers/clk/renesas/renesas-rzg2l-cpg.c:226 rzg2l_cpg_clk_src_twocell_ge=
t()
> 	warn: array off by one? 'priv->clks[clkidx]'
>=20
> drivers/clk/renesas/renesas-rzg2l-cpg.c
>    209  static struct clk
>    210  *rzg2l_cpg_clk_src_twocell_get(struct of_phandle_args *clkspec,
>    211                                 void *data)
>    212  {
>    213          unsigned int clkidx =3D clkspec->args[1];
>    214          struct rzg2l_cpg_priv *priv =3D data;
>    215          struct device *dev =3D priv->dev;
>    216          const char *type;
>    217          struct clk *clk;
>    218
>    219          switch (clkspec->args[0]) {
>    220          case CPG_CORE:
>    221                  type =3D "core";
>    222                  if (clkidx > priv->last_dt_core_clk) {
>=20
> The ->last_dt_core_clk value comes from the device tree and I hate that
> we have to trust it.  I haven't looked at the device tree and I only
> look at the code but based on the name "last_", I assume that
> in the device tree data this is set to either:
>=20
> 	last_dt_core_clk =3D priv->num_core_clks + priv->num_mod_clks - 1;
>=20
> Or maybe it's set so that:
>=20
> 	last_dt_core_clk =3D priv->num_core_clks - 1;
>=20
> So I think that it is not off by one (based on the naming scheme).  But
> I would prefer that this code just used:
>=20
> 	if (clkidx >=3D priv->num_core_clks)
>=20
> Or:
> 	if (clkidx >=3D priv->num_core_clks + priv->num_mod_clks)
>=20
last_dt_core_clk comes from header include/dt-bindings/clock/r9a07g044-cpg.=
h and used in the SoC specific file in case of RZ/G2L its=20
assigned to " LAST_DT_CORE_CLK =3D R9A07G044_OSCCLK," in drivers/clk/renesa=
s/r9a07g044-cpg.c index of the core clocks start from zero so this check wi=
ll hold good here.

>    223                          dev_err(dev, "Invalid %s clock index %u\n=
", type, clkidx);
>    224                          return ERR_PTR(-EINVAL);
>    225                  }
>    226                  clk =3D priv->clks[clkidx];
>    227                  break;
>    228
>    229          case CPG_MOD:
>    230                  type =3D "module";
>    231                  if (clkidx > priv->num_mod_clks) {
>                             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> Smatch did not catch it, but this condition is definitely off by one. ;)
>=20
Good catch this definitely needs to be if (clkidx > (priv->num_mod_clks - 1=
)

Cheers,
Prabhakar
