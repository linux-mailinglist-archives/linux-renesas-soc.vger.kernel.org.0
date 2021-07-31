Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C013DC419
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Jul 2021 08:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236749AbhGaGme (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 31 Jul 2021 02:42:34 -0400
Received: from mail-eopbgr1410124.outbound.protection.outlook.com ([40.107.141.124]:63312
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232079AbhGaGmb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 31 Jul 2021 02:42:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arOjVMdLdSlC/X+1Y6jDxXrHYQS9+H6TOvfIpn3raYkcoruCkGkiiSxl7eKHWNI06KZ5azSCrlFVQr4h/FltoRjBrptkU2IMkU7e+nLmJe9T7RrxY18+VF4QxZtgtiYxAVrI+uQ+AhfaiaRANFicILqXbplNF6dtlYgEXn0M2Eqob6Gfhw8fe73ilpd0QnjvTGA/fWTHdn3XlCyTzLALbf8lPyhG+sFQMAwtpB1UHrw13w9DwdiotPtwXzKlWyjn/gP4+g4HT2fVH1Qa2Sv208DAZKkCgOgMe12Rzg/4lJxlPTbPluVSZw3/Apl36vtGzi6FODIPUeUE7sbc41evEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPjDVRXTsrS/UThdhy9PeO9nXsucXV5WI8sSm8fnFLc=;
 b=mEUz7xDYTDOZv1dnFY6V9xfQHOzcHY0Fe252sjcpe1SewXB+e2vvJ+DTq51XHrNrwK6Q8d1O+emCS47dWxYCtjh9YcouFPcDvpocvmh312RL8r3Bi75dh7gpr9c9hyNJVuYZ23pjTKRurItDpMHVN9tZCphF6efZn2Er7sfGJ2G2e1OmcyRvAEU/hqMh+0c9psrcMeA03HjUkLk8D3khKMAEM40Y0D58sQFNky7iyaG11BurExf6KLT7QqfaF4I5o6gka6u465dviOn5UYvTWTVToSm4IDNEtx667iLZw3ay2VFR96dc1uUrdT2Z9x7PNKGrI4bleh5C5UtgVN6kzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hPjDVRXTsrS/UThdhy9PeO9nXsucXV5WI8sSm8fnFLc=;
 b=Xbx0kyPnH9A5RHVV7savt+ZbHDC8ZLZgzXtGHpa+LVfwQiy19/nWEjU5jo3aM3ZA9GapBoZuvUDb/H8/IKSRnQMfOPgWDKYL47eYIiWTeIOweOS8aiWQwOpXhQbAkW3I1Oo0eWq4/6GiW24ppNPrvPcyixmlVohCZYPQb7SWcH4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB3204.jpnprd01.prod.outlook.com (2603:1096:604:7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.22; Sat, 31 Jul
 2021 06:42:14 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%8]) with mapi id 15.20.4373.026; Sat, 31 Jul 2021
 06:42:14 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Vinod Koul <vkoul@kernel.org>
CC:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: (subset) [PATCH v2 0/8] Add RZ/G2L Sound support
Thread-Topic: (subset) [PATCH v2 0/8] Add RZ/G2L Sound support
Thread-Index: AQHXfKOvUAXdtaEiLkeDU6Wspqxkt6tb8e0AgAACuwCAAL+fwA==
Date:   Sat, 31 Jul 2021 06:42:13 +0000
Message-ID: <OS0PR01MB5922641004F8B0029490332F86ED9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <162767143674.56427.1812897829636885311.b4-ty@kernel.org>
 <OSZPR01MB7019905B23FA514DB08987DDAAEC9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB7019905B23FA514DB08987DDAAEC9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 505404ae-54e2-47a1-a593-08d953ee54f6
x-ms-traffictypediagnostic: OSAPR01MB3204:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB320443476425076BD683D5AF86ED9@OSAPR01MB3204.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RxzrgEhc90IqNJELPsoaTGmofHhUK54VuQLFBDG3+N5kkq4wPMzvXCclXNUwTBWp4PJUHCgDT/F/4FySEZB/rhZJGuP17+gPqfBUgXiarPNvlC9lWleeK8dZrBJkjpxh/XXBdauULLccrT62W5/A8XJiMzGRsy1ZKmchjT/6yTsMeFr8Zol7+17ArhuKO7hTA4UcT6fHHteMgBkOW/AKIBbY+Z4LnDgMzmUZVqqHMaLnDX6aOzDoNtTeBVt0tiOoTCDLoXRZ1K7IjrPvPArJpAd5H5nggdD9z1vOkc9ezVNpwwjOnuQbIKhQySEMhtPOtzuPWnecOOz+uOGeisOxjnbj42KGk2lIx/O50dvvNHEXPqcD2iFMjzHxW/r2gDXmwCVAPb2UQx7/+jXZDqt5czZQmhZyLv1DuAentUy3QMKfXWgMaM0up5Rkz8LeGWmZf1IMx/3dgjgF51OExkEHihjLLrH7kwF5JEoiaPCu/KxKE9BDla4dP475NrrYWh7gXMCBf3rIMqk04GPgAkSMC1fUpb0kH1YNZilH1RnRSttfaU67B4iSv3Bj7Z0I2u+zCM/On9+pzMz6q+J0NETrYd+WNIXsSuWNW35Js4hrZ8jZHlyFPZaVsledVykZTnk3DpHJ2pqd4zn2AlsXioSI/o/5imvkGbkqsnsBQtGJd4ArDXw2Qu26Tt1uVtNAp9iO1VuisqVWBYcmKjLT8PzTX8wN+8pL5eOZqPap+LYi4Oml8l+1bgo6ZvCF62bvW3QMjkDaenBXHDibUbQfrdjIcoEHAEl0lOyA++so5IlD+sNGbkSyBa/Q4cQkjuoyCddADjy7Oatz4aZU6wwuyZf5eg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39850400004)(7696005)(9686003)(5660300002)(186003)(86362001)(55016002)(26005)(71200400001)(52536014)(53546011)(122000001)(478600001)(38100700002)(45080400002)(4326008)(7416002)(19627235002)(966005)(6506007)(8936002)(76116006)(66556008)(66476007)(66946007)(64756008)(66446008)(316002)(110136005)(33656002)(83380400001)(2906002)(54906003)(38070700005)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dA4SFaMzEBaRcT2EsE6GRBunZmgtEu2aU77Ean0JMAV+GZZh5EqOZICdoe8N?=
 =?us-ascii?Q?SbyMUIU9Vyq8cEyHE6Iu5Y9yyUT5v+EWdGnTEifl8bv/gZvWjVpYCkAoceio?=
 =?us-ascii?Q?0ijTMDO9N55zC2fC5FjjquQ2+5rTV5NH2zhGAcW8XOCyUbzXkKxobr/eWxeS?=
 =?us-ascii?Q?Rnei6/RV3OU2ZVkl5jF573p/xmQ0l6DPeOofpHXZQ78/tGVA5JGtggMVwuND?=
 =?us-ascii?Q?Ne7hJknVR4ZuL8/BY/BBre6y957ioUBdL/5UOVGYSeAbIp5srD6MSDFPgueY?=
 =?us-ascii?Q?Qd/tI62xFaHQkpOoB3nbm0NqDtK7h55H67Ws+S6H9V7ZzU1kaB8tvi640kiu?=
 =?us-ascii?Q?WPUAcdpPJT9bxDEVXBbKgi5UdVeBqlICMd3i2M/dw1LtIgPoPU1QLwtbj3aM?=
 =?us-ascii?Q?/PEiIU9KRmiDhmyjfGDg4Yr4fobKOL3g2W8U3YPk1gikMESV7gNQ0YQKOLWR?=
 =?us-ascii?Q?KourSDWwBitZlXlY26g7KNcCPTjlz9oEodR10BVibxe78ps2TiwS+YYcXQ2h?=
 =?us-ascii?Q?1YQwigk6OmdTemWjTAPhmlIVT/7LxogJQaHNxshX9Z3w+y+oOkUgWDrjznmN?=
 =?us-ascii?Q?jBoq40lnbv25r1KVZSSHlx0ZeKZHDek6KchUbpSaWltvf9t+54Xvpw4SFlYF?=
 =?us-ascii?Q?/gPyvg2IY/1k7YXiSiCnSgNd/uLetQZFkkUZi0ZJjlztbET3CdQQhWUX6kGT?=
 =?us-ascii?Q?iF+mjIaHYJumztFpV1um+2xUUwCXWOF56zzDEWqidJRbFn764+pIlb+h8D2i?=
 =?us-ascii?Q?OxHfcMacY21hW5APmUVUnJuCJiCSI4Cz/T7sVn/utnPbAQ+XvoFKN876+9nE?=
 =?us-ascii?Q?mJDgfCZFPbJ/9r4sgVTRR2MMJ2fxgC4gLhQtrt3APdUIZvxt8hwimoTShIY/?=
 =?us-ascii?Q?EzFy/wyuxXrZ739vtmnjpAOnx7bbSLHsIY4Q29kzGcTFnJ49XSIIVo+UD7qo?=
 =?us-ascii?Q?mV84+hgOJTjiEOdxthgypZdoUtOAFppgqq4AQEXOX86x1tIm5J6jQd86lh+c?=
 =?us-ascii?Q?t6xMtitrANbWpScQ4q//aRL+fMF/fjks+iZEOQtAskF/qkBNmG3+WBN3jdBJ?=
 =?us-ascii?Q?bceoRGmfD9qYEAw/wBnAHRvA0f1mhNZAOvLxyqj5aZk18yrfjGEPs9N5I0tz?=
 =?us-ascii?Q?8AUcTgsfbT8EKssDTBRF7HD/hwtUhw7deBZ0BW+YV8trTBSFZjI91HJqr5Ql?=
 =?us-ascii?Q?wmNFI0p4FE9LQyyv+G4r2dp1NjvevbhjI0dpC4LO10lnqiCteu+q4eFrEGwE?=
 =?us-ascii?Q?Kh/oXNPdFC4EPXVTVlkTNT3F7c/Y3jW1D5KfAvYoEiBgHkLBgVnFYrRBpuBs?=
 =?us-ascii?Q?WBgebyON/0xUIcERZ6rGLK5n?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505404ae-54e2-47a1-a593-08d953ee54f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2021 06:42:13.6563
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O1dCUrS0S5bexFUBc/9i0aUhDMgU/tPbTLCMD5N5Pysfmj86TGNXqszDqUl1s6QrSYZRnuK6HhG3VgcSg11uElyK9X0qDrIiyeOfy6QSI7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3204
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark and Prabhakar,

+ Vinod.

The first binding patch is for SSI support in interrupt mode. so it is ok.

The second binding patch is for adding DMA support in ssi.
The example value in #dma-cells need to be updated. Earlier it was just MID=
/RID value.

Based on recent discussion with Vinod and Geert, It needs to updated with e=
ncoded values of=20
MID/RID value and legacy channel configuration parameters, as passing the l=
ater to driver
using slave_config is not recommended.

So either drop the second patch or Will send a follow up patch fixing the e=
xample

+            dmas =3D <&dmac 0x2655>,
+                   <&dmac 0x2656>;

Please let me know.

Regards,
Biju

> -----Original Message-----
> From: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Sent: 30 July 2021 20:13
> To: Mark Brown <broonie@kernel.org>; Takashi Iwai <tiwai@suse.com>; Liam
> Girdwood <lgirdwood@gmail.com>; Rob Herring <robh+dt@kernel.org>; Jarosla=
v
> Kysela <perex@perex.cz>; Philipp Zabel <p.zabel@pengutronix.de>; Biju Das
> <biju.das.jz@bp.renesas.com>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>; Chris Brandt
> <Chris.Brandt@renesas.com>; Chris Paterson <Chris.Paterson2@renesas.com>;
> Geert Uytterhoeven <geert+renesas@glider.be>; alsa-devel@alsa-project.org=
;
> linux-renesas-soc@vger.kernel.org; Biju Das <biju.das@bp.renesas.com>;
> devicetree@vger.kernel.org
> Subject: RE: (subset) [PATCH v2 0/8] Add RZ/G2L Sound support
>=20
> Hi Mark,
>=20
> > -----Original Message-----
> > From: Mark Brown <broonie@kernel.org>
> > Sent: 30 July 2021 20:04
> > To: Takashi Iwai <tiwai@suse.com>; Liam Girdwood
> > <lgirdwood@gmail.com>; Rob Herring <robh+dt@kernel.org>; Jaroslav
> > Kysela <perex@perex.cz>; Philipp Zabel <p.zabel@pengutronix.de>; Biju
> > Das <biju.das.jz@bp.renesas.com>
> > Cc: Mark Brown <broonie@kernel.org>; Prabhakar Mahadev Lad
> > <prabhakar.mahadev-lad.rj@bp.renesas.com>;
> > Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>; Chris Brandt
> > <Chris.Brandt@renesas.com>; Chris Paterson
> > <Chris.Paterson2@renesas.com>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; alsa-devel@alsa- project.org;
> > linux-renesas-soc@vger.kernel.org; Biju Das <biju.das@bp.renesas.com>;
> > devicetree@vger.kernel.org
> > Subject: Re: (subset) [PATCH v2 0/8] Add RZ/G2L Sound support
> >
> > On Mon, 19 Jul 2021 14:40:32 +0100, Biju Das wrote:
> > > This patch series aims to add ASoC support on RZ/G2L SoC's.
> > >
> > > It is based on the work done by Chris Brandt for RZ/A ASoC driver.
> > >
> > > Biju Das (8):
> > >   ASoC: dt-bindings: Document RZ/G2L bindings
> > >   sound: soc: sh: Add RZ/G2L SSIF-2 driver
> > >   arm64: dts: renesas: r9a07g044: Add external audio clock nodes
> > >   arm64: dts: renesas: r9a07g044: Add SSI support
> > >   arm64: defconfig: Enable ASoC sound support for RZ/G2L SoC
> > >   ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support
> > >   sound: sh: rz-ssi: Add SSI DMAC support
> > >   arm64: dts: renesas: r9a07g044: Add SSI DMA support
> > >
> > > [...]
> >
> > Applied to
> >
> >
> > https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
.
> > kernel.org%2Fpub%2Fscm%2Flinux%2
> > Fkernel%2Fgit%2Fbroonie%2Fsound.git&amp;data=3D04%7C01%7Cprabhakar.maha=
d
> > ev-
> > lad.rj%40bp.renesas.com%7C60c047db42e149eacdb808d9538ccc7e%7C53d82571d
> > a1947e49cb4625a166a4a2a%7C0%7C0%
> > 7C637632686468564246%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI
> > joiV2luMzIiLCJBTiI6Ik1haWwiLCJXV
> > CI6Mn0%3D%7C1000&amp;sdata=3DRdyi2vXY9i%2Fly%2FOTWVFmc8k0rVbpM75FthJn7r=
i
> > jxwU%3D&amp;reserved=3D0 for-next
> >
> > Thanks!
> >
> > [1/8] ASoC: dt-bindings: Document RZ/G2L bindings
> >       commit: 2b761f476f3a6e0a212c8c88e7855f66edb177e0
> > [6/8] ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support
> >       commit: 5df6dfbb6de815ba3a75c788a916865212fd5221
> >
> There is a updated version of the patch [1] which was posted yesterday du=
e
> to change in handling DMA slave channel configuration [2]. Both the queue=
d
> patches need to dropped.
>=20
> [1] https://patchwork.kernel.org/project/linux-renesas-
> soc/patch/20210729172311.31111-2-biju.das.jz@bp.renesas.com/
> [2] https://patchwork.kernel.org/project/linux-renesas-
> soc/patch/20210729082520.26186-2-biju.das.jz@bp.renesas.com/
>=20
> Cheers,
> Prabhakar
>=20
> > All being well this means that it will be integrated into the
> > linux-next tree (usually sometime in the next 24 hours) and sent to
> > Linus during the next merge window (or sooner if it is a bug fix),
> however if problems are discovered then the patch may be dropped or
> reverted.
> >
> > You may get further e-mails resulting from automated or manual testing
> > and review of the tree, please engage with people reporting problems
> > and send followup patches addressing any issues that are reported if
> needed.
> >
> > If any updates are required or you are submitting further changes they
> > should be sent as incremental updates against current git, existing
> patches will not be replaced.
> >
> > Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> >
> > Thanks,
> > Mark
