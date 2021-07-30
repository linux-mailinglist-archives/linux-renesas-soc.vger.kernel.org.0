Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189403DBED7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 21:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbhG3TNd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 15:13:33 -0400
Received: from mail-eopbgr1400105.outbound.protection.outlook.com ([40.107.140.105]:17504
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230335AbhG3TNd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 15:13:33 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWmy5lUmnS0xxe9goXikr4QD8M0610mSJLqZR96dRI/VcWuK2wGq7gPrRVlqmpH087KYSZMCC27rCcUYXcmzxSuzpIMelVpnQkz5sBMq4VP9njLZcwmijnmpNizAx2T9sHIY0GkAMgLRfkYJ953H1wbknjag7aQKZob0NlUEdz5uWoFgdm8ezW9qleYvltBZRDN9iBve2tY3WF8Nny9XV2ml9VNLo1YA1VQxyokZ23YNlSOOzSZj8jG6PaOOfqFfrFvjd5oT7N5aJ0Kzq2fHBWJ/oLAKTtOknZd1DOJXECKYnT4KCGwgQeY7q1I8in3+2D+wMkPXM2tnIA8Ngh2Mqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ORZVx3Iw1XvVyXomsORVVapco7qrFdsZp5K7qefhh0=;
 b=GiI8w5ULCb8yxT4D5VtreSh8fC4aEz33UbzfD+ktjLCOHs8KL8Yr8ivOaftd3xucvZACkDgZ8iOooRohn0lhMUIeJ7/ROkjYm37oprtBBIq7ZcepuEpZnsF8sVEcw53Q7Ss5mXKMKvrpebzrsO3vJlx60m1FfNzGNKwWDZJiopt3ekMUkSe/uywLfx7g3eUhGQYJ6LhGjNqeQwC1hqhluhyU8MTYTDMHWhZ0qljVFK3H49+1U/+dyBzXpKNtgTkN4F5LzlmuAYtBf4E/Vv6uuU/NdnK26urxexbvN5YLFvoHUz0jzUNsW/GJ2s47hUHu8+u/J/43ALysaoJHcwwNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ORZVx3Iw1XvVyXomsORVVapco7qrFdsZp5K7qefhh0=;
 b=IDSeYc9eV+v7LqamYQQQ6Y+VovBCrCc9JZIYip0oDNXu1QZKfsJBIsd0zFl8mRWUBQaMl/JqVOnpoZ9xH9BCeufCmQ/0lqBMlGNKfgZc/hrf/5wntyNzNseSEGrPC8h7Hjt1LP+p2AAnebyuocRNF/SA1YJsu3fy17SCN3BTUjY=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OSAPR01MB3122.jpnprd01.prod.outlook.com (2603:1096:603:39::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.25; Fri, 30 Jul
 2021 19:13:24 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::a058:9916:364a:1d1]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::a058:9916:364a:1d1%8]) with mapi id 15.20.4373.026; Fri, 30 Jul 2021
 19:13:24 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Biju Das <biju.das.jz@bp.renesas.com>
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
Thread-Index: AQHXfKOvQnBEY8n7zU2mwkwS8V7ieatb8e0AgAABDPA=
Date:   Fri, 30 Jul 2021 19:13:24 +0000
Message-ID: <OSZPR01MB7019905B23FA514DB08987DDAAEC9@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20210719134040.7964-1-biju.das.jz@bp.renesas.com>
 <162767143674.56427.1812897829636885311.b4-ty@kernel.org>
In-Reply-To: <162767143674.56427.1812897829636885311.b4-ty@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a8a80f5a-cae0-4189-f8bf-08d9538e1a76
x-ms-traffictypediagnostic: OSAPR01MB3122:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB312230EAEB282DF18348929AAAEC9@OSAPR01MB3122.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 88Gd9XcUpAiCJT4Sl3UdZ67+dq5cGlYwZax7NCkSbbMLafu8Z1EkiMxpyUv08Um7du9u9XkpVPuy7yHXNSVf5X6Rmt3XLQIE49+EjGcDXUMKJN8Rzqf3qqMCYryh2H/2Tq4FE6YzHeY8smJtdbOobC+dipGznXqbxvg4ZL/ZhfV+JYim+23aJI34r3LFHJjOrK9yttNBlTLbiCPzmGZnTAJsrZL8A3kYotBphx+EHEYwahkd2dR2dfOj7s9oZbOvOv3ULaa0/pfj0/TMOz3NA05g80U+hfYfJL5JCc1Hs6jeQfZYvUokKDzT8jlxkC98wVrcBN25jwwIndPUdQ6RJwkk65GAticuvGxG48ICEkqo4LW35mKUerbSEqRGixcKFy5D7cw3ynTxpcMy+Tao45gGA4dETKOOKH0NU9zpJQAMLfaF4Z4xW3yL8u2H/zN91ty8dIo5C17DYj6KQz3Smsajwit3AqWaNtWXG/4wzgib1spzOZsneVWleBRikqEJzDPKl/G7Hi4kxaS9OoRT+olnDBMpt/oszoYyOCO5b+SiAgA0w9JdufidfBXSylsN5oljBpE8C0ZipX8j+01zrK0zUBkTAIhDChKchj4xsHLx0ilpmPMn6OALMUarqMrGLI5+bEtUYico9SFVNDvVD4iVeCzeFu4jaWf7VaISSq+WjuObcRY6mEGa0ChdAZdKcDu1a2AI/HZ849O2BCFXCxCJXYoTjM84DUmUwn5D4Cj38v3lsZQY6AEBoK62WeKhOsBF9mMJ3F+BOde2cCDkAfqDVZiwy2l9InUGfhN+cNyrP45/hzYn95qEMwAb3VLA2ni5gpZKsJHlGLWLeQ4Bfg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(376002)(136003)(366004)(186003)(53546011)(6506007)(26005)(7696005)(33656002)(8676002)(8936002)(6636002)(5660300002)(122000001)(38100700002)(9686003)(7416002)(83380400001)(2906002)(4326008)(71200400001)(478600001)(38070700005)(66946007)(52536014)(64756008)(66476007)(110136005)(54906003)(45080400002)(316002)(66446008)(66556008)(966005)(86362001)(76116006)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?doQaW1ytTNGfS5XXHHrGbQKd/hNXecxy6M1wky1NbCP4oAoO/If/SNKvkJok?=
 =?us-ascii?Q?+4lN5JtC7O0fNdc3rK+A6hgCJu10CUwr9gJq6ZJxwiF/YUytTOcLowjnNWza?=
 =?us-ascii?Q?JLM5J5ATfniAhr/ArBlUTFpw2zOdhcyLJF/bOtjf1GV44/mK2qur++aUxNmU?=
 =?us-ascii?Q?iTnN5bk6Sdj60hQer6f0TlECiUT6f3XAz4wczOxZ/eeR7RfDdl+8wPPWL+eL?=
 =?us-ascii?Q?2pmfyZSfYh7zkCaUZISgh4ZkNo2xOyLEZUW6Kh21a1sF225/NGr7RlljtmLe?=
 =?us-ascii?Q?z4XkWQWFxKLwMoqqHwNsEydoLTaGoLi3uoAmwVdsKhuIHW/e+z4TJ26r4YEr?=
 =?us-ascii?Q?cYyMb2z7VgZTJ5HAQO1OpQJQhIlEW2508yn/GRZtN34NLxtoTyRz5vg8hH98?=
 =?us-ascii?Q?pdkCscpDW44TVy4bRwinkfa2D6/swXdK/3sZagdBulL3KGDeHm3mXVcV8S7F?=
 =?us-ascii?Q?0P49ABQA1lB6g+XG5UaFJkv1rl2g8GaI1mr9XMLLd+vfT99y7gKD0KBlca4W?=
 =?us-ascii?Q?TQ7XuOW7Isfu6qro8387CYYJunlA8TyDbfoGyMaTmU4lFxPHPlKk8S6O3qTo?=
 =?us-ascii?Q?EJeIyTiR4Yi34vci/9Hg6gAoNQRemg+nUuBl8L+HjFnY+DmSE/XbJziPTVEt?=
 =?us-ascii?Q?WRG08NTTet+rgs5JMUYEMtGin3281Sd6gA8C2exkTMpLpZ2tN8YydNtWZO7o?=
 =?us-ascii?Q?i5MbuWCsscsy8GNTfBK2S2OSLb7esMTsTVCFMPlyKAneMK1L60pG/NW0bzmw?=
 =?us-ascii?Q?AZu2pcmFAhipHQuW91ij0o2JMpJ0Qm32f/gX5P6y39CGZJRj6KfMeEnpSyXJ?=
 =?us-ascii?Q?OHWD7HGYSYpLbLgVaknEdYltnYSgghKZav7aa/pKLvGwsxC5NHuzS4vlRVh7?=
 =?us-ascii?Q?r+z9B4//gstSZEk0wSx8iuWLXTOn/HXW0GgYX1jqUb069/N5+jWiQxLXY6TQ?=
 =?us-ascii?Q?5GTND/tY61UkFV337HKhT9TBg9pLmbpmcsZwDKRWK6Z4FxCTL8FUEUTkORho?=
 =?us-ascii?Q?K9GIWFbEv2y/Ha6RZyqkHZQ6bXC/O8+sgxmAg13vqlnEwaLE1LgNMEWtlYsI?=
 =?us-ascii?Q?cARNPeWk3bN84aGjygVEQnUKxvdWO55xKkpOEsRC4CFsH1djIEB7ohqIiD7L?=
 =?us-ascii?Q?B8HevmG/4gBFnH+Lt3SdqmLDBfnz5Jn/KyF6WhKXnk5stAhsjEiwG3rTat+o?=
 =?us-ascii?Q?iVuEK5Rj0Z4kTNIY3sH/cWgd8VCUzIF6C4U3xaAN5+7DLxkivf2n9GpjtnhR?=
 =?us-ascii?Q?XUDleC9ivceUNWz+yoSLaV3P1nTwmH1RWKfZgNDOsxbduVmL7KNNPToEis9h?=
 =?us-ascii?Q?Ol0geAq0BPwBnE2WM13mnYJA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a80f5a-cae0-4189-f8bf-08d9538e1a76
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2021 19:13:24.0836
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQvrvsBH3cWlwF0AjzlcxUq/u+L//JNDe7B8IwTunffUBQb4wKuZ/Extwl3Bd4N29LtgdbROy+sjY561JPTosrkVLxoj3HDr5NPnpz7hz1+id2RlPlL8MeMgaWRFvzTN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3122
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mark,

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: 30 July 2021 20:04
> To: Takashi Iwai <tiwai@suse.com>; Liam Girdwood <lgirdwood@gmail.com>; R=
ob Herring
> <robh+dt@kernel.org>; Jaroslav Kysela <perex@perex.cz>; Philipp Zabel <p.=
zabel@pengutronix.de>; Biju
> Das <biju.das.jz@bp.renesas.com>
> Cc: Mark Brown <broonie@kernel.org>; Prabhakar Mahadev Lad <prabhakar.mah=
adev-lad.rj@bp.renesas.com>;
> Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>; Chris Brandt <Chris=
.Brandt@renesas.com>; Chris
> Paterson <Chris.Paterson2@renesas.com>; Geert Uytterhoeven <geert+renesas=
@glider.be>; alsa-devel@alsa-
> project.org; linux-renesas-soc@vger.kernel.org; Biju Das <biju.das@bp.ren=
esas.com>;
> devicetree@vger.kernel.org
> Subject: Re: (subset) [PATCH v2 0/8] Add RZ/G2L Sound support
>=20
> On Mon, 19 Jul 2021 14:40:32 +0100, Biju Das wrote:
> > This patch series aims to add ASoC support on RZ/G2L SoC's.
> >
> > It is based on the work done by Chris Brandt for RZ/A ASoC driver.
> >
> > Biju Das (8):
> >   ASoC: dt-bindings: Document RZ/G2L bindings
> >   sound: soc: sh: Add RZ/G2L SSIF-2 driver
> >   arm64: dts: renesas: r9a07g044: Add external audio clock nodes
> >   arm64: dts: renesas: r9a07g044: Add SSI support
> >   arm64: defconfig: Enable ASoC sound support for RZ/G2L SoC
> >   ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support
> >   sound: sh: rz-ssi: Add SSI DMAC support
> >   arm64: dts: renesas: r9a07g044: Add SSI DMA support
> >
> > [...]
>=20
> Applied to
>=20
>=20
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
ernel.org%2Fpub%2Fscm%2Flinux%2
> Fkernel%2Fgit%2Fbroonie%2Fsound.git&amp;data=3D04%7C01%7Cprabhakar.mahade=
v-
> lad.rj%40bp.renesas.com%7C60c047db42e149eacdb808d9538ccc7e%7C53d82571da19=
47e49cb4625a166a4a2a%7C0%7C0%
> 7C637632686468564246%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXV
> CI6Mn0%3D%7C1000&amp;sdata=3DRdyi2vXY9i%2Fly%2FOTWVFmc8k0rVbpM75FthJn7rij=
xwU%3D&amp;reserved=3D0 for-next
>=20
> Thanks!
>=20
> [1/8] ASoC: dt-bindings: Document RZ/G2L bindings
>       commit: 2b761f476f3a6e0a212c8c88e7855f66edb177e0
> [6/8] ASoC: dt-bindings: sound: renesas,rz-ssi: Document DMA support
>       commit: 5df6dfbb6de815ba3a75c788a916865212fd5221
>=20
There is a updated version of the patch [1] which was posted yesterday due =
to change in handling DMA slave channel configuration [2]. Both the queued =
patches need to dropped.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2021072917=
2311.31111-2-biju.das.jz@bp.renesas.com/
[2] https://patchwork.kernel.org/project/linux-renesas-soc/patch/2021072908=
2520.26186-2-biju.das.jz@bp.renesas.com/

Cheers,
Prabhakar

> All being well this means that it will be integrated into the linux-next =
tree (usually sometime in the
> next 24 hours) and sent to Linus during the next merge window (or sooner =
if it is a bug fix), however
> if problems are discovered then the patch may be dropped or reverted.
>=20
> You may get further e-mails resulting from automated or manual testing an=
d review of the tree, please
> engage with people reporting problems and send followup patches addressin=
g any issues that are
> reported if needed.
>=20
> If any updates are required or you are submitting further changes they sh=
ould be sent as incremental
> updates against current git, existing patches will not be replaced.
>=20
> Please add any relevant lists and maintainers to the CCs when replying to=
 this mail.
>=20
> Thanks,
> Mark
