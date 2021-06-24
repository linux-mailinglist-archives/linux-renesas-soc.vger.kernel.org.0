Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463D43B2CFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 12:54:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232224AbhFXK5A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 06:57:00 -0400
Received: from mail-eopbgr1310124.outbound.protection.outlook.com ([40.107.131.124]:3027
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231294AbhFXK47 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 06:56:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jObYbCCqagJFpGuGID6n9rJmiXWgHj1d0zqUDpyFn+eZ9cx0aZJKIAEAxZJk19W2NOs/PU639HY4qNhD7FIQ16MF6yg5hOXHdtOce66IrpPXH/iVlb0VlqLvKh07FzjmNxCksFqK3xe0q0hwF2bYltOG33g6YjoFeTBivrwvR9Oe7YjFzykQLVfkYrUy5sKBrzNCFVQ60EKkcTdIIYJvRMp6AQeOHBJjml6+ZCQ14lRto7ZT7XW4qquWcW8AOOO+66V6z6g6Ma57m+sCczxNpD90b97r44OSXtR6+obgKbH41scI1nziFpgvl/Mz0BJgcDsQi2rGR1eDrLCAoxXkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqHVzsOjYZ4btvmUHuezNlhisjD65locvBqPLGjqQhg=;
 b=B7m2FU7fQAZEyzsK1HNLx5IQ0b1sLZEauB6Y2s5FvjbLP7VTf823xFYFyxIrvRe7RPRKChJzMeBkpyUGgDi1FWxIUtHPxc6L+lymi3ID+d+2NVaIn98Hg5BQGZbWl5Ctcomi4nz1KcF0x8w5zOUF4sJd6y+PEsK4A7wWNJc/rDTq0FpuPP8p1r3sI2ZahIOk1hLeYAFKCO7LuhBltgUEwgcRJm1qHrZBIpkvDlpHxQ8/d3stSXZqZ3N004M2lVH97i0s8qBB+PAoBrxw+K/Ov3MraJte9bt5Z/95HYwxG5RUnLZjsgpEc73aP6nkoa9CHvh1XGWhnQdbMqanGtxQcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqHVzsOjYZ4btvmUHuezNlhisjD65locvBqPLGjqQhg=;
 b=VGS160Pug7sHXBAeT6nOLgMhuTRQFZBkmUziVHQoBONXuC2HiJiKUd0xfTDyG2noBauHCS1ISAHOe5b5KgcByVffw3uScTYYcntxlOgt9+kyKjZpYoOp6jWR51XLKaartge7FsNEGXrIEnLWZ6x5PBzbz4BkROD9wD599a6SNR4=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB4027.jpnprd01.prod.outlook.com (2603:1096:404:db::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Thu, 24 Jun
 2021 10:54:34 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::4c5d:66ee:883a:72a5%6]) with mapi id 15.20.4242.024; Thu, 24 Jun 2021
 10:54:34 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa@kernel.org>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: RE: [PATCH 04/14] mmc: renesas_sdhi: Add support for R-Car H3e-2G and
 M3e-2G
Thread-Topic: [PATCH 04/14] mmc: renesas_sdhi: Add support for R-Car H3e-2G
 and M3e-2G
Thread-Index: AQHXXdxGVxnXORnr0UKfnp2dzw5A3KsT3joAgAAN+YCADpPUcIAARLKAgABJHXA=
Date:   Thu, 24 Jun 2021 10:54:34 +0000
Message-ID: <TY2PR01MB36927B0CCE7C557A3115E481D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <cover.1623315732.git.geert+renesas@glider.be>
 <22b4c393bf5074b53791d2797d8fe74deb8ea9a7.1623315732.git.geert+renesas@glider.be>
 <YMei/rKwEyicfx+H@pendragon.ideasonboard.com>
 <CAMuHMdUJQCv7Qe01Km=6F=yUjcNoo_OvOBrYpPcC3SbhX0Ru5Q@mail.gmail.com>
 <TY2PR01MB36929E0DE956A374B8CF5EE7D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <YNQi0w4zsG01ezgu@kunai>
In-Reply-To: <YNQi0w4zsG01ezgu@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20c86595-4d37-4d83-ebe4-08d936fe7436
x-ms-traffictypediagnostic: TY2PR01MB4027:
x-microsoft-antispam-prvs: <TY2PR01MB40276B8A00AFBA6E3B68C292D8079@TY2PR01MB4027.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jtZ6tY1kRp4NYnAC+gIgCnmz+z3B+4wo5NVnvKai4QwnrQiB23DVCe0Mi0XYZI3xPNAOzUCND+d7TyWqovFN5AsfDiQGs7UuwZj100JxVjWjghH8xFQECy/LRxkMCru1l3qJ5IdHify/xLi5OU4RbkQyXAp35Ak5TOAAficrJ626dmgDuIOyRzQMYOIN2rNyAIi7hHr37TWPX47tC+JCIRfTXF+R9OqCjxk9ja3A3MG+CyUJSegLkHqXJAk8XWTVfCQx7yvae6aKbej5NzDxFIUIBARqy0qfdJ76LssmjoR5fWT7/g1zUEBhMtvGqUSnudXqrBfOX3EuHS5PBgGPpBpxBbxC/Oz7/frCo5wW+3hQGcFC/sKH0wn4R1Nc/X3+wZD9QbcqT67dnpcuaJqbOkUxu3NzuqV2H/9NOwEur5S3xnIB9k5MAbAG/1HCkmz5+ysPJ3ptdBwl1flw5wqsnJvvBppf9yiTWO5pIb/+04dUlN/sah22FDfn62QEXJ6t93Ro27rV1RFBmL8Epk+kCID342SVoYp1FlW2svdnXGrd/KpeAJw8Z0Db8tc/H4v/U70GazVAnys5PNi3Ho4jz6gAvYrJw3xKCH5Yx9D3ENEeyvd4Z2VUhP8jVK2qsPpfZf5iRgGJDbnS8bpZACbqpw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(52536014)(122000001)(186003)(33656002)(66446008)(64756008)(66476007)(66946007)(66556008)(8936002)(8676002)(38100700002)(71200400001)(26005)(6506007)(5660300002)(7696005)(55236004)(76116006)(4326008)(55016002)(2906002)(9686003)(86362001)(6916009)(316002)(478600001)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?b0/n2t6C/gPL76lpS5CT4O71cm5cP9SJUduChVdDQ5WF4GdEeuZNe7ra7kvZ?=
 =?us-ascii?Q?At00baDXhJ9uQx2jrWR0jhEqdyiOFL992mC+u7WfvstfN3vPThede155xcd/?=
 =?us-ascii?Q?yo+RP2Qmvgy2hvMo3CK8sVruia1jFnjzNZi4cVTMstgv03NynInfn5n7MV7i?=
 =?us-ascii?Q?Td1MbduxiinDzfWQSQQApee97KNx3vJGSz3swjOMETSZP50KNhXGmDG8L0hS?=
 =?us-ascii?Q?CG1Vns1csZFvZravFYfmhU8p+UdVA7HQvUfpeBawT1pBltYMNmSV5o43eQL1?=
 =?us-ascii?Q?e7g2AvufPbEMBsRZ9K8tGzyhIx+MpS/z/cXa/o5DPsgIEV4IuEL0eyeSLjzu?=
 =?us-ascii?Q?J8hpl67L0EGNe7NbLj/8oRV6Tn2Y/gOw+IXoMKDqHDaa6B1oI3G94kezZf0d?=
 =?us-ascii?Q?yQwoErNdwsMf2qHCGcjZ/rmotuB8Zg2H0UO3BrDdPSRwc4ghsFLyEe7xQIu0?=
 =?us-ascii?Q?pFqQUSywlmJE/Of2q8K/oxJAJooE4R2J6NYggSuns6c767+CgiWOiRCB/T4X?=
 =?us-ascii?Q?sSnGjTNpfc9N5jyTk5wLlS7//2Jxo11tSJFw3pyKFD6ZxqjHLiDhT2GRmx2D?=
 =?us-ascii?Q?N0EWJc+NjwjC3NJiM1J+MLfg/a4vdUsrNTAdyC6CBEDQIgRyhUAwqowLnfaj?=
 =?us-ascii?Q?JyB+VYjD7NgGnilJWYfESLJObh6cNzemWQJwl0PtZQ92bIyul14pcmzCJ5E0?=
 =?us-ascii?Q?BV4uEaysNccoGUuvCbGhgGS+qZBGP1Snm5L1l5X029CPVBycGog7z0boyaOE?=
 =?us-ascii?Q?5pfuYQ40dYDAxJoizSva5CODJ33hTw6aQAGs1miZtFRDuwvyS563Q9gwtgt/?=
 =?us-ascii?Q?GYk7uHF3kbXo1wdxAO5VxINgJYDAHVzJTTn0jz+oAFqPFW6oesz2nJBJnDLz?=
 =?us-ascii?Q?SKH70GyWUzXyRPjQrq1fsfgxnpg6ncRPjrQ4Cef9H+PlhHJXH+ZD/mJcqH9W?=
 =?us-ascii?Q?WfeN0JB/ob6WL9s1DanPOi0oWWScbQgKvfMH7tZgSNqgFdCPLYZL5VMbZQvb?=
 =?us-ascii?Q?hi4Dwua+vtaBU+FXwntTRr/5U9cViSgZSFNlU0yeOczLummNdaw68ZMRKLVc?=
 =?us-ascii?Q?YGa1KIO1w+kFrOjNW8f3GF8fHeZKCKwH6lg/WaE4zPS+x99Qtutm0y6aa9eY?=
 =?us-ascii?Q?NHqeFc2HCs2PD/Zf1hvNoSwRW0AsOsZ3gQBxZwp+TwZ6g54nkV8MkQe0BUor?=
 =?us-ascii?Q?r7OyXWjkt8y+puJm8fP6pwofb3DcZ/hB/gibaV2SROehhYkqAB8vZsfI8KEu?=
 =?us-ascii?Q?upZVjvj2NV7NplGJ9jQ6u33CWIfHRdwtxBDICSmkkUeZgnsHhwlIABXc6zCT?=
 =?us-ascii?Q?XciXIOx3lDKv+5/uATry8Dlq?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20c86595-4d37-4d83-ebe4-08d936fe7436
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 10:54:34.8005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pCibwsTEp76En4X+DKQun4hUPe/9u8xReFNWDvn6eGMrAr9Hvq4SQy6bY5uFnPnMrzbitsSrZZCYvs8EMqoySrZL7EghM0Wj8ZJowilULK5K4ZRhN8Kw4EY7Ud2enSPO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4027
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Thursday, June 24, 2021 3:15 PM
>=20
> Hi all,
>=20
> > > > > --- a/drivers/mmc/host/renesas_sdhi_core.c
> > > > > +++ b/drivers/mmc/host/renesas_sdhi_core.c
> > > > > @@ -943,6 +943,8 @@ static const struct soc_device_attribute sdhi=
_quirks_match[]  =3D {
> > > > >       { .soc_id =3D "r8a77965", .data =3D &sdhi_quirks_r8a77965 }=
,
> > > > >       { .soc_id =3D "r8a77980", .data =3D &sdhi_quirks_nohs400 },
> > > > >       { .soc_id =3D "r8a77990", .data =3D &sdhi_quirks_r8a77990 }=
,
> > > > > +     { .soc_id =3D "r8a779m1", .data =3D &sdhi_quirks_bad_taps23=
67 },
> > > > > +     { .soc_id =3D "r8a779m3", .data =3D &sdhi_quirks_bad_taps13=
57 },
> > > >
> > > > Could we reuse the entries for H3 and M3 instead, by dropping the
> > > > "ES3.*" revision ?
> > >
> > > We cannot reuse the H3 ES3.0 entry, as soc_device_match()
> > > works differently than of_machine_is_compatible(): the former doesn't
> > > consider "r8a779m1" and "r8a7795" equivalent, the latter does.
> > > Same for M3-W+ (no explicit ES3.0 there) and M3e-2G.
> > >
> > > It's a pity we still don't have a "quirk-free" SDHI version on H3
> > > and M3-W class SoCs (waiting for ES4.0?), as that would allow us to
> > > just match on "renesas,sdhi-r8a7795" resp. "renesas,sdhi-r8a77961"
> > > through the driver's .of_match_table[] instead, which would work for
> > > H3e-2G and M3e-2G, too.
> >
> > Perhaps, ES4.0 will not be released. So, we can refactor the driver's
> > .of_match_table[] now. I investigated this a little, and it seems
> > we need many renesas_sdhi_of_data for each SoC instead of
> > of_rcar_gen3_compatible. But, I guess such modification is better
> > than adding sdhi_quirks_match entries.
> >
> > Wolfram-san, what do you thinks?
>=20
> I don't fully understand how the refactoring should look like? Is it
> moving 'struct renesas_sdhi_quirks' to renesas_sdhi_internal_dmac.c and
> merge it there with renesas_sdhi_of_data? Is it really better to copy
> this struct per SoC? Most of the data is the same.

I also have the same concern. But, I guess we can refactor
the renesas_sdhi_of_data like below to avoid increasing data size:

struct renesas_sdhi_of_data_with_quirks {
	const struct renesas_sdhi_of_data *of_data;
	const struct renesas_sdhi_quirks *quirks;
};

And then, we can keep of_rcar_gen3_compatible and
we can add each SoC's renesas_sdhi_of_data_with_quirks
and set it to the .data.

Best regards,
Yoshihiro Shimoda

> Thanks,
>=20
>    Wolfram

