Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1382843F78C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Oct 2021 08:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbhJ2G5d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Oct 2021 02:57:33 -0400
Received: from mail-eopbgr1400123.outbound.protection.outlook.com ([40.107.140.123]:35256
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232151AbhJ2G5c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Oct 2021 02:57:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g28E2ojwNIJoBngkhzi+egey+IIoIRzmLmT3zaQxh3oHP/JbHLFvp9tkXuWeX9kzisZyR8ok6ioLax0PSvrTfKflZm9bHvORYQyXVVpk7ujDTvZdhhNI6FvFiKxB9gzVvuREqfUsoAAmXqY8T8ORODovJNS0gvhDk+TJg6Ci9EclPvoiIs/QbeS1FNZSbQ8TK8jy1YOipoce96G+M6d9CtJ1Y45AQa6jFu3VSdHkD8ZpZt+MX+NAmeLHGLNIfGR6IeJAT/ucysDYUyBmm6iRTxHJcGnCuusFslQHHDdMHdeY/XKzAmKEnmDaVEcfCFxbLFQ0bks9jCE64xJxjhBTUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+e7xOyoh/fyvJ8cEStcgvpnpt2UGR22j0jmUjNKSp4=;
 b=Tf9ouj07lYLxvbS+t1cWDlaQ1pyw/oeTfR/kHNeucqMr/LdbL9cjDc8bmOMc4VOqD4iNAbj6RFdTjJ4/YJN8biZLZBWgICA4xE3Gj2HRtHIXIKPYo+pCSwPRSs+ESWn935ShhdOoLnKM+NcnXIOvzShpZf04MFXNVVjFsuHvOyx46GiQcAyWpPgiyzALggWK0vBMUiWpSDMBP1jOwbRFH7R+vS4z0z72TSosw8hBnQk17h2mjcdt/DQDOaJgX3wBmWvo8nQbY1VSoXwfajtxZBwpAwxAsNn4q6SLVR6CwgEhbvBx3KPZkFogVgU3Pvpa4luIPCNXtj8/e1jAF7TWcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+e7xOyoh/fyvJ8cEStcgvpnpt2UGR22j0jmUjNKSp4=;
 b=VsLK1cv/R9wv+VTWWvNp0IdzxmuewdVpcauLuWTjQMCNrzRE4bv5w47FxTdxV3HFx2qvA5G4m62P+pSvi+10zdF6caJsQOSb+WI2tRjHJH1n+4Wc8bSdxt8qkARvuTSk/CMKij9hiUImfnswUY8IOatDjSN68CO8tiPxDXYWXxc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4184.jpnprd01.prod.outlook.com (2603:1096:604:4e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Fri, 29 Oct
 2021 06:55:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c0bd:405a:cdd3:f153%8]) with mapi id 15.20.4649.015; Fri, 29 Oct 2021
 06:55:01 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with hard
 reset
Thread-Topic: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with hard
 reset
Thread-Index: AQHXutXdv6ZsGiNewUOReWqD4pnIGavfGfWAgAArXcCAAAG4oIABBI8ggAincACAALqzwA==
Date:   Fri, 29 Oct 2021 06:55:01 +0000
Message-ID: <OS0PR01MB59227455C2F3B1AB3BE0237D86879@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211006171605.6861-1-biju.das.jz@bp.renesas.com>
 <YXK7AfUYxuFWl3rl@ninjato>
 <OS0PR01MB5922DC39B54A0B8D7AA8B3DC86809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592212E593522E4E72BEAFCA86809@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592273BA2B117BE67B108BDF86819@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YXr91sKve3pmY+yj@ninjato>
In-Reply-To: <YXr91sKve3pmY+yj@ninjato>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sang-engineering.com; dkim=none (message not signed)
 header.d=none;sang-engineering.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e3a3ad3-51e7-446c-6602-08d99aa907ac
x-ms-traffictypediagnostic: OSBPR01MB4184:
x-microsoft-antispam-prvs: <OSBPR01MB41848D8429BB54CD0F19C46E86879@OSBPR01MB4184.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UpPCKSpZcxZIqb62MjGqmCH+kbVzXHwMf8E7s8b2APhC8RBQPVkvakRlKhpaFOZk8t4aL22JslYFBIHoZnAO0m3XoXHWjgh/AfU85oqjI0rnccpRZGoktdnccO/nPvf5L51OfyPUwtbt5KcBcboNe49pV+BfDwvpTywch5h0WOJ9fHOpykBYtMZSelYsL/FfekzqU2xk/2f9xg8oE9zHMTjycoO6aPy95tQYKdYrpqdhcvjtJ1+8NEAK3i2AvKXAj3QY6W+YS+Vrjvh2ZeW9AZtkTOGSbs0nytsCEfLOwguwy96MjfCANhBVtsVmKxQ4rynTkaeY3SfrTRRCoiQhkFOa1Uj9i659z/6Ioyary7PV5rKLrWW5F6CScqGBNSNptjBcADEzUz3FRBW/4GtBdXjwo+fnQd/ZM+FOo1h2uhusOHO2mCKPzAw8vc8cUT3OZrq5ob86ag0eG1agGR9Kwc/8iblN1VqB9+/CtUwi9503BMM27AH8k1aWEsQIQxYbDTD4ZZQxDCzvLIIxWwHAMHSaF2hvTqW4BW5uka6E0zGl7tHABXC2i+StCRp8fpAQikgqhahk19uZVQaWWMB1gf0I0h247PGdTJMe+PlyAZ5dHObmHLK7CpB7Xqg/Ge+TLsrDXLztdHVt6UDXckgpZVBNHMOVhotMIqmPxvOddem4U02ZMoxpLQTTWzqq6EFqO4mk8Eo63qLix+HbuIXipw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(83380400001)(66446008)(66556008)(122000001)(55016002)(38100700002)(26005)(8676002)(6506007)(54906003)(66476007)(9686003)(2906002)(71200400001)(316002)(76116006)(64756008)(7696005)(5660300002)(86362001)(33656002)(52536014)(4326008)(508600001)(38070700005)(8936002)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+y12YYbTVk4XtDftkBlr9NOVBacw2+UM6gDsQT+dpfnsNonQ0v31AuM6jFp+?=
 =?us-ascii?Q?66hrBqm9/4jU0lzA0FFP6Z6EFc4fyFA9U/znwR9UAvdC64+xTOXYdm2PU+Ge?=
 =?us-ascii?Q?dwlLxz4+80Uvbao2mE5WrGf0tuzAM5+AC0swPxSden0vPiA0qbh3Keec1mZ/?=
 =?us-ascii?Q?BExxeZSj0LFlS7Urw2MXDX+V3LaifM8plsLbhuN2ZNwky5U3Bj9GB6VyaGUn?=
 =?us-ascii?Q?rnALA7PF+//0KCS6eRa2kcbl+kvS1QPhK4xEkFm8mWwvE/pJxKqqdJGyf3n/?=
 =?us-ascii?Q?x0BXIreSZxa9RparUVUNPEHAEYGvZ+Ap5VM8xclTY30+inlH/7vvR1vON8dM?=
 =?us-ascii?Q?MWc1NhUAidYPpVlfL91XmzCbOwDv5xPaieCuvcYbTixtEjX5+aT2oKwzup3W?=
 =?us-ascii?Q?ZWuwFSn/XLSxRy6Qg/zvxxtz7+H78MTS0bKZEUF3G1J3vn2tOEMsbiKNV+mu?=
 =?us-ascii?Q?/Xm5cXO4C9l65b72pzRxBP9sHCJar+ww5tpGbNtqnnQntLLcQ31JChrmyAJk?=
 =?us-ascii?Q?jeSxULPWax5K2NU8Hby9gascOoh6+//rkS84EGjhd5AYmnFj1zpDdmo1U72T?=
 =?us-ascii?Q?10zFaTo/6fXiKzUfoOxsSYzZBr8F0tk224w8KjdyiwKskQ94wMGxI2HgZxAY?=
 =?us-ascii?Q?kK28xoy6b5lH4CSHUL3zOkvyYTuD5mxbnRpv1vmNDFl3hT7gNjhL1jLT4TlI?=
 =?us-ascii?Q?4sHmpSXxoF+5qAhD3ejb0rNhKdhHUwKbHBcCUJu3K8rL9AgD3tiE5UrgqfTp?=
 =?us-ascii?Q?yoaNruIpnemGpOZTac47mwp9R/n/y8WyPKRLmtwYOnRZMI6KoXQcUD1uYlgw?=
 =?us-ascii?Q?uA4s2fE77h9UwATSh8MA1uD1B688ry6sv70qBEe+q3leUviynw4w8sXtKcTo?=
 =?us-ascii?Q?N0krskwQF6XcyKjJKsV3s7Xy1dXmqtuPFk70ovR8AccUytItgoFhItcXDefd?=
 =?us-ascii?Q?cjnfQG8ftsz+sHzPihae/+iMEJxlb4QVbjpFfidSTaNshFQR4Z1463UtRd1I?=
 =?us-ascii?Q?wK0yUuiYAKYm2hE04OSfDSvVd+NVoO07APrzOgcKQCDbLPbKUsyoLnQQvSfJ?=
 =?us-ascii?Q?p66kA5SzQTFWF1204NYyXKCCwttNAyT4ueRt4lsMRjhZ+tKdo/604LvNZDzI?=
 =?us-ascii?Q?5goV6hbSnE3z7+MqDJZuCVg3QTzyTjls9I6iBBqI8/tPJ/GwBT2NKzYSThX0?=
 =?us-ascii?Q?iFzywokboLWJXVhTOjp7rWUZ5N3O1+ENNLtZRemZu3BrW8T1zdwRCqaAR3Gy?=
 =?us-ascii?Q?Ne3Uzz3fDs8x0DwJc/kUzNrzPNvG2U3vzYwZyFXeuSrBpe4NY46d1OmEZNy1?=
 =?us-ascii?Q?ze6Ejham5LQ0gLVrGBu1JEPzlS9B0SLSQUVmF+xiaacjrLe4L5bfCKDPFb8b?=
 =?us-ascii?Q?57BmE4lQF1Aa+nlgsQ5TitkMI1X4vK+i6rivjdOW49h9dQVbROZ+P+hVeT4/?=
 =?us-ascii?Q?NTBp/VnH73G1qXWgaGawIEkvu//4d2uq2Z3ebzi+ly4iQ5r4NCYXxk3JF0sj?=
 =?us-ascii?Q?2DkvQfZ/tmk2QVZGMXb5vfw9O8Bub95IKFChEdUn1/mDZK+STZf/1ms/lROI?=
 =?us-ascii?Q?LOmG0mMZAX828hJwCf9UFw1pUl5gRmqtLR9f4ECFufa9Znla1OhS3FUzO4JW?=
 =?us-ascii?Q?zYkcE/SMOmYS/WjDXOVGnJVLXsUaO4hKA9zP4wSGoIdx2AH3blLsy/JghCTO?=
 =?us-ascii?Q?7BnGFg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e3a3ad3-51e7-446c-6602-08d99aa907ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2021 06:55:01.6932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sts9ympEoKDzhc8cEAVtRvsajXcapnmZ6og/V+howObuEexIYamO7eA/f5PQhFRkkcrEzqF5rRUMlhtQG/TIYWA5faoLLkWoaVShDUOcU5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4184
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for the feedback.

> Subject: Re: [PATCH] mmc: renesas_sdhi: Fix internal cd irq miss with har=
d
> reset
>=20
> Hi Biju,
>=20
> > Finally found the issue. There is one more patch for host->reset in
> tmio_mmc_core.c. please see below.
> > If you add this code, then it works.
>=20
> Thanks for finding the culprit! To get this hopefully into v5.15 still, I
> will simply add this chunk like you suggested. However, I really wonder i=
f
> we shouldn't just replace this:
>=20
> >                 /* For R-Car Gen2+, we need to reset SDHI specific SCC
> */
> >                 if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
> >                         host->reset(host);
> >
> >                 if (host->native_hotplug)
> >                         tmio_mmc_enable_mmc_irqs(host,
> >                                 TMIO_STAT_CARD_REMOVE |
> > TMIO_STAT_CARD_INSERT);
> >
>=20
> with a simple call to
>=20
> 	tmio_mmc_reset(host)
>=20
> (with tmio_mmc_reset() still updated to set the card interrupts, of
> course)? I have to admit I haven't checked all paths for side-effects yet=
,
> but maybe you can already test if this change also works (instead of
> adding the second chunk)? If so, we could change it incrementally for
> 5.16.

Agreed. Will test and provide you feedback.

Regards,
Biju

>=20
> Anyhow, will send the patch for 5.15 in some minutes.
>=20
> Thanks and all the best,
>=20
>    Wolfram

