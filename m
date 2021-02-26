Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 352FE325B16
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Feb 2021 02:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhBZBCb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Feb 2021 20:02:31 -0500
Received: from mail-eopbgr1410107.outbound.protection.outlook.com ([40.107.141.107]:42016
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229596AbhBZBC3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Feb 2021 20:02:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dsW3pjZeF3Tcd5OxHMJekn5KvCBYbRLf4ZdZlj6KGTP5d3nqFsyIu1y7Oo1MY2GySN8tGAPmWuoYYMWdhAdYsM4hBSq+c0aodFGQAz3sxK8xeBHctPhWa7ZZynLLnT6e3YZJrZ5mnXqC6Uc1ijH8QfscZNR8TK/FZcBiLOqgUvZGNE8td8Tr012QFC8IAD+yxTs7WJ1SrMmSKuiJBiZ3+J/2PMkZGXaN4ifSHJ+C4/8qmPz/un8MBb9m3Bk9Ha26AjH7kdLaUwW6aixKypLKV0kFmPO4N0tOySq1/zjvKYthxVz2MpjX3BDVJqensjOebtAJAsc5AnPptC5MYfSy+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoS9v8zPO5hIDRYXgstJ86S6YFZo5Qm73GGGcz02j3w=;
 b=HRwQAY7pMk7A6lTFPE0auP6XleO4exduEoYYLguHnaPNwpred60wsAm9SZh14terMABiYSraZoPz0Hsgvy9eMDteVu8AqO/Di22CRCqrwXm/S7giRmVqs3o3KDyhv9AuEAJmBbNdSFp2IYXmg4GZNf9OCmp+oxKrZ+cryClg2XUteYKy2Rh0sKH3f5aUccDHEya6cJZD+wd/KiJnP8MkE5nPAy6UEmt0qrc+CA/xNPgb6r8IvqY93bRe2svaz6W+9AkGhsnZ4AZgLpI7KUopZhlJ/yU3NUPFDDAoqGgSkpa/sJcS4OcT51Wu4X4d3+bd3GB3eg5zsUWyi40xp3gbYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoS9v8zPO5hIDRYXgstJ86S6YFZo5Qm73GGGcz02j3w=;
 b=cDiVwX466buho3kUKhYRcxcomgryIu8PBaDr/Fc1H52qjHmWQCL4FqQszswNeDCR2t17EKf+cnxw/NVtZg+dfjQZEZ4LAcGNo0k7RYRZfyoiil0SX30pmu90KU3mQ7OV0AIqSunNVoJCVHHyWYYRRPqUrzt7BMckF0idrbNAqp4=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TYAPR01MB5277.jpnprd01.prod.outlook.com (2603:1096:404:c3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Fri, 26 Feb
 2021 01:01:40 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::cb4:9680:bb26:8f3f%4]) with mapi id 15.20.3890.019; Fri, 26 Feb 2021
 01:01:40 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: [PATCH v3] arm64: dts: renesas: Add mmc aliases into board dts
 files
Thread-Topic: [PATCH v3] arm64: dts: renesas: Add mmc aliases into board dts
 files
Thread-Index: AQHXC3AOJmo/i2fQRkqPbIkfTls2dapo0auAgADIL8A=
Date:   Fri, 26 Feb 2021 01:01:40 +0000
Message-ID: <TY2PR01MB369202DF4D3EEC1085F6B00CD89D9@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1614255382-6377-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWLBX89R+jZSZSofgL-ONhjFBBdMDwd44Tuu8BY46+GjA@mail.gmail.com>
In-Reply-To: <CAMuHMdWLBX89R+jZSZSofgL-ONhjFBBdMDwd44Tuu8BY46+GjA@mail.gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:e5f7:ee15:e4ae:ce73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1c11d7e4-e131-467a-9448-08d8d9f21353
x-ms-traffictypediagnostic: TYAPR01MB5277:
x-microsoft-antispam-prvs: <TYAPR01MB5277121356E1C8A40DF4CFB2D89D9@TYAPR01MB5277.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NZKeV2l8rSLTeJF8iaeAzv3JeX2NAtz+TRd2YtgL27N8oYFbYBlrfQURUzr3ki8vx96zsGwUpmm2JEcij8rgpzViG8ME6MGtMsTFH0tzm14JAzK3kJosszQ+AaRG9wcGzTWQf4uWqZAz0KD1pT33GQdYOKO2Ip9lB9aHwZR6FebhAB/0P8xNveUxr0sZiMiL/HPQFNO90YduJJs1074H05RLrrR3P7kKgBoXUXzw3r9sCzB162wBPMNlnOin6IbtHFQ7RijVZb87ysygtrlHojfnhSXft7Ivfha5gz0ssr6ZK2Q6GWxJJdySJ4MOYFWD3X7o4R680h3axKYiSgKKf2aflGStelhfWm1cWWHnX8NMju7VTSKDghB7hT8EMPjqBUTvFWga6qnaamti3nRhjFz4rvDsuSBuh1DhXhugw+ylFJF2GiXl2gIyalYil1209CVAOhOn0FYqY3mjIPLgLup8QNPCF/1fuKj8WSHPO/ueB3Keni5n6ksEJOmiv2iC1oeaHcnHZ8Yz5N+X1dyYCA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(6916009)(186003)(83380400001)(5660300002)(8936002)(316002)(54906003)(33656002)(55016002)(53546011)(6506007)(478600001)(66446008)(66946007)(86362001)(9686003)(7696005)(8676002)(76116006)(71200400001)(66556008)(52536014)(66476007)(4326008)(2906002)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?nufbQzn54VBrz7wcf0tFROa4U+MOOrIUJqz6TLay861CBt9Kqgvuiw6eHqpY?=
 =?us-ascii?Q?vIfnujla3+oiWhNYn+FA353Ah8H+x2ufa+AdHDmLiA2Np65iF1wJbCm1J/tt?=
 =?us-ascii?Q?+5/mHOTLst6qp360YpJv3NDx7HVzeQCetAS/2Tr2tDVCV7Qzl0kIi/Ddr/Cc?=
 =?us-ascii?Q?XwUFfNGTTTy+xdYGB+XMv4xsyz9gikUBd8wPZDGvGfg1dq4pvhL5BFw1u7bA?=
 =?us-ascii?Q?xKnvJLqmVGt5zhd8Kw2XsMarQzWmoLCZ+KXKqOCcrHsp9ACtEwRKStC2aDsM?=
 =?us-ascii?Q?DVGc1NQLN38PObZXMlW3lFQjwKhit6IXhsfU3KmJC9hQRsPauwfGL7rYQ10P?=
 =?us-ascii?Q?f3Xffcu/sGg2LYO0vyPJnD+vY70AU81SzJvJoPGqwDKycI21qhawZTMKLwgD?=
 =?us-ascii?Q?vqVdtV80uVbzKC8EWVIoMweFtHFQ3oOaIBfwCM3ZjzFRWy866THW2aueeqIi?=
 =?us-ascii?Q?0ZXKYaLBy13sFrodVJKsFeIEGP+BUHmXpGY66JZfKC9904asj1mDPqi+CojX?=
 =?us-ascii?Q?8JlR7+aZ7Uu0iuUHkPp9igTBttm44uueaqjmcT8faUOONxiXhAA0Z6aEocnJ?=
 =?us-ascii?Q?/oTZHevfOHj3BvkD7NBf7Fwp3S+M+kys/StkMVAcOwAillAdzzr9yrzasDjJ?=
 =?us-ascii?Q?IRoPGMDhIg4Hlbu3eddRZRpmFD2icfmqAIeT5BBMy1z6F8qYT5KAa2KJ7PYU?=
 =?us-ascii?Q?0HfpEK1nDfVKOoZ8FsHk7nzOdzIpPMfwhbGGtxdu3dO4hUslqyh319h+h5+f?=
 =?us-ascii?Q?kAhU8kTu+A7cegOOc0KRcim9fOl7c2jSq36KiJxuersgaPyEEqRL+Wi6fZ4r?=
 =?us-ascii?Q?UmvuOtUM15Cq96k4mQ8xeGtt1F3n7q+r0MMKTLJdMTv5atkLrDyk0pD9vCB5?=
 =?us-ascii?Q?bHwcVqrxsS4/XcgG+wpO3kZSqNpfH86/L0i1cRJjOjD/PZ+mz5l7+kvEWkTO?=
 =?us-ascii?Q?Ze2vILdm6yOgmygbx3T0+xK0k3iEeX6CdVcjtewGsNktkTiZguPgDd2bhwlM?=
 =?us-ascii?Q?ibK+YNEjIYBcqMQRGugA9YTY530ZwjRBMr5zFl+Jf7hYqTF3hocyIDvps+Sv?=
 =?us-ascii?Q?d3p2XAQN0Ysjoq655/nky3RNJnXxe/8rP5flioKlkTA2mJn+bax5qwvAJJHP?=
 =?us-ascii?Q?VsbJwuNtdBhnKw26oSRjLIdYoe85GaCx6NQDhZZ8NE40HyrYsamJoBdDlqe7?=
 =?us-ascii?Q?KhLOFUEQytDFfvulGxsqdlQV/VVLrOkoplo5lUKhCz7TBfFFxZc+BVy5Imvb?=
 =?us-ascii?Q?FvtTeF1qCh341KVOfpau/Hkaf7VLQ+MFDQqsr8nafLcdZPpkJh1VHT/s9ovB?=
 =?us-ascii?Q?XSTY6tiF0xYu4egx3/4e4zEPTni5JBg6GjBeCUQUvz/toG1y9+H1/EBthGBU?=
 =?us-ascii?Q?BMLKWoM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c11d7e4-e131-467a-9448-08d8d9f21353
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2021 01:01:40.1773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F//zRGKbq7er0+8kQd2zeC/+jPMVONUWHQWfFfUl9GSbKQ5ITru5v5w9pd/AVrEj4kuebged8/ZzJI5G8YlYnI0YfOTfOR8E3II2Zlb/EcbbdC7bQIYF3YY1FAkD+sxt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5277
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Thursday, February 25, 2021 9:47 PM
> On Thu, Feb 25, 2021 at 1:16 PM Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
<snip>
> > ---
> >  Changes from v2:
> >  - Set the aliases into board dts files for consistency with R-Car Gen2=
.
> >  - Change the subject.
> >  - Add Fixes tag.
>=20
> Thanks for the update!
>=20
> LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thank you for your review!

> > --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > @@ -36,6 +36,9 @@
> >                 serial0 =3D &scif2;
> >                 serial1 =3D &hscif1;
> >                 ethernet0 =3D &avb;
> > +               mmc0 =3D &sdhi0;
> > +               mmc1 =3D &sdhi2;
> > +               mmc2 =3D &sdhi3;
> >         };
>=20
> Looks like on Salvator-X(S) the two SD card slots are labeled
> SD0 and SD3, so the last one should be mmc3?
>=20
> What's most important? Getting the naming right, or matching the
> traditional naming?

Most important is stable these mmcblkN naming for using it on
the "root=3D" parameter :)

I don't have a strong opinion though, IMO, matching the traditional naming
is better than board labeled because:
- we don't need to add any alias into a board dts if the board is using one
  sdhi/eMMC only like r8a77995-draak.dts.
- also, the traditional naming is familiar to us.

Best regards,
Yoshihiro Shimoda

