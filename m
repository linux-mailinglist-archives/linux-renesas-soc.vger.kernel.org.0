Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19B9D312FDD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Feb 2021 11:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbhBHK4v (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Feb 2021 05:56:51 -0500
Received: from mail-eopbgr1400121.outbound.protection.outlook.com ([40.107.140.121]:56000
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232421AbhBHKyl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 05:54:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NttBhkVLLLv1kQZZUtWgnvR2LOx8Un2w9zVQQCp24dti86UaWS/yF2jDuui0nDEDbpCnFr9nXQG65DL0mVYccexEnd8E3+hK6dRZD8u2pVjRBp8oh0WvXgF67YWqx4QPCqcmi0HJrhikA/DkD4DALRMw84dXeGiYBW8oq+j8Ym//MHhg7nVMtXDqqWc4tmFSxp1pQVCcOtDYL+dzOdmZnpWH1endY654RMiQeaTm0fpg8OxBHgtdGS+16OVTAwAyBGzRDCYfFEp7vXVNUKYCwNhUHvQirI1Hwh4aJG0LdNDrxNvh+VoWcZKsVVWI383sZTpXaGC76OtEIe5g9gLTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HM1n3ezUEPqXAOznBVt9N1+RqTHLUDU9/zyOHij0V/o=;
 b=IWbEa/84+lAM4kVRa0hz8Pc3zm2mJtf13vAED/FnwYJM0Jluz634ajEU6vFY3OrHasVld+3ZLEfqpH7aWahGfw/QJxuVLOv5yMGbjEtXA3KVYuur/VTjMwORPDOAn8EhLvSfxds8gjMNaXjRVrRkgNZKL5HpwllA2P2PxAqQbuAx3hnK9DEeo9a/Y17yCdBEN5EFdUfBZY7jS0ixhND+MDGyzA2Fjg367C1APADhfNPtWWVrPhekRoZx1F+qyouslLRBr+04LC9btU6ATOcdYMjl0k2gYVqFi+/5J4HS6xptDuMZZ+Uy14GMGxU5Ml4qbnSCBUQBtf9KG6wb0ILbEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HM1n3ezUEPqXAOznBVt9N1+RqTHLUDU9/zyOHij0V/o=;
 b=WVUN7aaCM6qWMyhIyZNCNQj7J9vtaWidETs91LoG7RNpoxTNwDO04ZKyDbC/1DEZmYqXUXl6myxnm+ABPaMKE2gGYevZj1XQRjlBpJArFcvYLiKUZmqNd1uG9jzYZo4MkvOXV/cMMm+vDPZyaXmKtpkMnTit0gUp0/v4Ggpt4gU=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYXPR01MB1728.jpnprd01.prod.outlook.com (2603:1096:403:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Mon, 8 Feb
 2021 10:53:47 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3825.029; Mon, 8 Feb 2021
 10:53:47 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH v2] arm64: dts: renesas: add sdhi/mmc aliases
Thread-Topic: [PATCH v2] arm64: dts: renesas: add sdhi/mmc aliases
Thread-Index: AQHW/cTOUtO6F3MdPUy+cDEbUjgMHqpOAuOAgAAOObA=
Date:   Mon, 8 Feb 2021 10:53:47 +0000
Message-ID: <TY2PR01MB3692141F9F2AD0E1CCD0D10ED88F9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1612752464-27838-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdVBAy7wtB-_uOsTg5NiEorCwyHgENrwUQBxtcqRChvp1Q@mail.gmail.com>
In-Reply-To: <CAMuHMdVBAy7wtB-_uOsTg5NiEorCwyHgENrwUQBxtcqRChvp1Q@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:98ea:2273:b01a:3c41]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c6b4e78b-a1ed-41eb-f10b-08d8cc1fcfaf
x-ms-traffictypediagnostic: TYXPR01MB1728:
x-microsoft-antispam-prvs: <TYXPR01MB17285553104E4EB7AA98CE3CD88F9@TYXPR01MB1728.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zW8Bg0iQ44RsC6aF/qILZOUOgy794ewcyvYkEEK35wxL9Y1vWKqPlIMO3RT2EAUGuZ2d8opQm98g2NXKgy+RFt79Jp65iOFT3On00T/GiK7FI12PAU8NEDKaSA/uwqZaojHsbKaqVI5J0y1xKVXKkk2o7d7ItuSuE7ww8Hj1w8d4XWvGSg12GtP7WvhAJd3F9xdCVRQ/10ezTnp+KMSSnbV87LBj0OhUS76NTpax0Pu2sCTx7RPumFKQicU3uCcr9FBdbIJvAc1qmFGxCcTa0oNrGVjw+FmxBUURQIhPjXYyF6yaiaJYxUjnNWwtTFQCBvTLO3xR/jNcBV89+C2yxDU/BYXXwOI+UYDetLXl62dSTpm5Agn49E3wLoh34h74IGajSGE+i12xe04EvE4Q5Ad2j/y8igwkGQMG6H0pNngJnzv8n0tCiCxWuG7b1tT4w0YXA9VyRWNH6JfgwgL2ohOsMh8dPastjLTn2yk9UYNgVePalOMvVCMcvRY9Ta5fPCpeN7/0SJ9XRa9TzaLWAw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(136003)(376002)(346002)(396003)(66446008)(86362001)(478600001)(76116006)(2906002)(9686003)(8936002)(316002)(54906003)(53546011)(64756008)(186003)(83380400001)(5660300002)(66476007)(6506007)(52536014)(66556008)(66946007)(4326008)(71200400001)(55016002)(6916009)(33656002)(8676002)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?8Rwl9xP1vf8DtqqkZ754cqSZVPh9u1RgTziJhxJs3X1680dt1pG1jVmlTxp0?=
 =?us-ascii?Q?ACe98IlJWeQORZDUpUdJCZwHGUJNItGdou93QwHfbrklglxswMk4Y7evKgE8?=
 =?us-ascii?Q?/o4//EljDbidO5oa/eS8/dF2LArkwh1+USm/DAYrGRAfUHGrj/P4HAXn/KxM?=
 =?us-ascii?Q?/SnoS8L7pfXJI/V87MnbtP6JI1Z5NruH3ggywc1hLsMZ9QjF5TsjFj6qfwO5?=
 =?us-ascii?Q?TSvUS4lgCHta2eJtlScLwGFaowvM8pE/zDBnFvfcN5VAKtPnoRm8oznezSm5?=
 =?us-ascii?Q?4rw0kY4FoBw+Vnll/PgWAu4ujHYoVD+N5aapzFOAEbPRLhSJVfZK7AOaoI58?=
 =?us-ascii?Q?vDuHTve7qvrpePTvWNzRHH9JdiQUxpkOVo3dBgUn6Fqi12Pw+5LH9+DhXyhN?=
 =?us-ascii?Q?2YahBSc/ynEIb5XuH0uFz3xTra/L/fy148Dd8hIK+kujWaIspe6V862NcnLx?=
 =?us-ascii?Q?KdFgRubc0hOeFunospsOud6R0S73C+7I1536xqsS6Mbx+gAC3qhw2S+qIex4?=
 =?us-ascii?Q?xKXyolVFkYrE1imgBJkek951qeQCQaluxWpETZZuqa+lAeS/iRGoBKHm/Huv?=
 =?us-ascii?Q?OAEqjS/mspwJImlWPyce2welw5cjdUQ+WCiLjiXQkG0djkHDAz+TSMpIMFaK?=
 =?us-ascii?Q?c+ChrlVskbEiLr2u7+ttLneElbhUNvEjbGBG9Zek9uU+Wjc6atCWAYjue6fY?=
 =?us-ascii?Q?uH2mT946y6qW/M5palznsLzsvnagfllsRuO5PelhIQz/rw7Hcrarnl2JfA3d?=
 =?us-ascii?Q?9Mjwc2bSSNH8AiHlXnbVDn78ETPAR/gkC9G6FuOqwx8KQRkSVD24r1XxKm1Y?=
 =?us-ascii?Q?Xa6RaCHCopoKv8kBOjuyAdxdwA4jQ3zHBu2QIjAtF3qcGieO3Y4aQCIB5gmB?=
 =?us-ascii?Q?dI3ur0mjT7f8PvQEfpbXUTBz+I2iR3qACkZesOXqxw65nfHz3K44QlB/APtl?=
 =?us-ascii?Q?kHrMI2yad1N6AEzQZPOwTcXEF1ytM+7UahXpWUx2kXqHlgnwDzJqeYqC5BV2?=
 =?us-ascii?Q?O4Cy+MWBfddzKMNk8VBP3absEhxTg5f/bsBfTqh3MzuZ1VgZQ8eNwNj3w9fv?=
 =?us-ascii?Q?4JBn66yFteoBGJvlKEC0yR/TixW+9vJ+G1mLE0dz440tiNBn0w2RTuFn7a+o?=
 =?us-ascii?Q?q4n5oId2otMwqO7XOuwoYE8LzbjOyT/prdfQlto958gicYPwQVhLYLUcIfSs?=
 =?us-ascii?Q?1GydYVxDbrECvyqIA71s7ArsvLlxhbkUT3LAVpPUUhShv6Jxzqas0cKnP+/U?=
 =?us-ascii?Q?KNypmthoOmTZpT2Pea7HT1PKFOUNZZXl6yUckH0jrtDUwOdd0ij7ANazT0wN?=
 =?us-ascii?Q?cYSgQszQkx5wMOExdRGrgIUlznsIRDQxp3RLBoiKuSBLUSzTUSHWTRD8q8vF?=
 =?us-ascii?Q?fd1MB8k=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b4e78b-a1ed-41eb-f10b-08d8cc1fcfaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2021 10:53:47.2072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xbNA7333ulC8eaHZ4XR5vys/ROmxxUvR8R7+xOIOlfRVQcb3KLcBoLyL3ok5ZoPMBxexNmBrjvRNClBD4OlHYCx8JLR7uhL++JPxvpW+FT4mflw7w3XF9D517YUih16s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1728
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Monday, February 8, 2021 6:46 PM
>=20
> Hi Shimoda-san,
>=20
> CC Ulf
>=20
> On Mon, Feb 8, 2021 at 3:48 AM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > After the commit 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS
> > for drivers that existed in v4.14"), the order of /dev/mmcblkN
> > was not fixed in some SoCs which have multiple sdhi controllers.
> > So, we were hard to use an sdhi device as rootfs by using
> > the kernel parameter like "root=3D/dev/mmcblkNpM".
> >
> > According to the discussion on a mainling list [1], we can add
> > mmc aliases to fix the issue. So, add such aliases into R-Car Gen3
> > and RZ/G2 dtsi files. Note that, if an SoC like r8a77980 has one
> > sdhi controller only, the alias is not defined.
> >
> > [1]
<snip>
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  Changes from v1:
> >  - Revise the commit description.
> >  - Remove some alias which SoC has one sdhi controller only.
> >
<snip>
>=20
> Thanks for the update!
>=20
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. I plan to queue this in renesas-devel for v5.13.
> Unless you want to upstream this as a fix for v5.11, in which case we
> have to hurry. Note that v5.10 already has the issue, too.

Thank you for this comment. For v5.13 is enough to me. However,
if possible, I'd like to apply this patch v5.10.xx too.
So, should/may I add the following Fixes tag for it?

Fixes: 7320915c8861 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that e=
xisted in v4.14")

> BTW, shouldn't we add the aliases on 32-bit arm, too?

I think so. I'll prepare such a patch too.

> > --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> > @@ -14,6 +14,12 @@
> >         #address-cells =3D <2>;
> >         #size-cells =3D <2>;
> >
> > +       aliases {
> > +               mmc0 =3D &sdhi0;
> > +               mmc1 =3D &sdhi1;
> > +               mmc3 =3D &sdhi3;
> > +       };
>=20
> BTW, this is one of the other issues with aliases: where is mmc2?
> Yes, I know why it's done this way ;-)

Ah, I intended to assign the aliases 1:1 between "mmcN" and "sdhiN".
But, should we use "mmc2 =3D &sdhi3;" instead on r8a774c0 and r8a77990?

Best regards,
Yoshihiro Shimoda

