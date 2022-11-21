Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 196F26318B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 03:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiKUCr2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Nov 2022 21:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiKUCr1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Nov 2022 21:47:27 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2097.outbound.protection.outlook.com [40.107.113.97])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2A620370;
        Sun, 20 Nov 2022 18:47:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=et1ujxAsLKglrAGW7VGDHMw8U2EqBF21YFiupy2pkAFi+e4zu/hzDow0jePU40dTOQ+lgpZ4kDCSoPU790d9aSd4MnYzaQHEl1hFatBbiv5E3z1CnHqLVeXQ+mylPnRAD908adCqDYqOVdnP1pfh+slh55cQeYTZXDCENMOWY33fcY8jWqdjMBHxJiCYP5XXOlkX+g173flj7MAkGAbkUyMyYM7beZdBUf6upjPgsPuCtnS3FJDZsjoajQkKpFdXcLZIUbCGsJbHiE05hiXxylyoizOHYnOXOZTAAAcSKNujHTwRgPjFRT4bZouYwkJx6olAhWPEjUn5kc/dGTcu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tv/UjxxFY5FWF716ynGw91Q4m6F0LrgHGmMIAxEsKxw=;
 b=j/wc9OV6hkSISKILpVTFPpXuCFMfe/XSL7B91k7xlS81YVaQBn8EjYWN2vqXRudkC1SAiHR4X+/vEJ87V2u1HzUlwLkpE3evj/CkLP6DuozzUGpzG2mcSpTTGt9CqHfh1BP6uyEMQZs0W2VYKmhRg68yaJk13gfo0aI639esBZtRDexKuvp+bU+CJPKGkeblnwlBGhKp6Kex2Rvz6klh+pZLo/2zbT1BufmV4H8uIhu2qz9pB/2NDu7kydQ8IVKQ2BjOvgP1LYvkooosUuxDL/m/PGqz+kYoYj7dxt9hQvUGqTWXKVxrRx3lqLVZGJHCEHSxb2OmIpBx2MqJRGt59w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tv/UjxxFY5FWF716ynGw91Q4m6F0LrgHGmMIAxEsKxw=;
 b=L6B0ZheqYzj58UbWfiKcDHKOs8NiVEEOs+5xh5aaPg9x1wr2W3U1FBb3jXStCz+OR2D2TekATYsGYS9tL+NMixVolNvqXFvDIpfI3oFsvuwYaXZqLDqcECMkp0bG4Pa9hmRnr6rPNT7zEsCi1VYYR4Ud2AFUxlbT2+coZyOJGUU=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYYPR01MB7879.jpnprd01.prod.outlook.com
 (2603:1096:400:113::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 02:47:22 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d%9]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 02:47:22 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/4] mmc: renesas_sdhi: upport improvements from BSP
Thread-Topic: [PATCH v2 0/4] mmc: renesas_sdhi: upport improvements from BSP
Thread-Index: AQHY/NQkoJg2yFfkQEidzmifDIjC4a5Io3bA
Date:   Mon, 21 Nov 2022 02:47:22 +0000
Message-ID: <TYBPR01MB53415F5F4A142DA0776E59A2D80A9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20221120113457.42010-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20221120113457.42010-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYYPR01MB7879:EE_
x-ms-office365-filtering-correlation-id: 428c4a3c-3a37-47be-81a6-08dacb6ab6de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BeDUXGFxzFBhp8d2VadGymCFSrvYwiG3cq4wjV7TFZoTjKVgJ8gl4Yuk9C6j9sWRTyT8g6xVS1D/o/oirzIrld36oYuh/a7Bya2fnuttKHZdL9j4wbCuVaGwet82nP2hxJ3+cjsHwYy/hgHrdnFfHG8RYUDc/eYl98l1GlPFyqAuVx250QqJU5Q2v27soQ4JJStX4l1BnTXnEQTn+Qudoo/+ykcCEqGIamuk4+rpJg8gH7MPszU0/ToyHTiZ+W3bcvZfH1tyWgqywpMATyB9GFJirxEBW6GgAra7ipWFlKkV3vp+7nqVyX5HptWIsgTsnObBc1HnR2oOV2Jr73YdkPca1F7PNTVkqrRLruX9huaDhiHivjtgWU2NBxx9hLa9kliydK7cSRYCGY5ahNngU11hOPmXOpTWvQ0YZnm37lvq/ds0XVATPFRC0WHcFVKGVV4a/gUvPDU7MNVjkreD+qv6USw5gyUdN7xbCMVsFLjpp8do0hwI/NFGH/uiX5KWgQdCJ1/QtWlV17JrQ1YPjrArWfkRZvv7C7KDPnwkdIkjNe9NxEc4aUERfwZiVQFR1PISHlupm1D7SsbkgHTM4fYysg1weTwJI7f4gFGuImdm6qw9TpiHDpvJk/QhMCBoCPdvOYzsv/yOmlCybvieVySAPqDfUXj+YrFcpVByMWdmYGf080O7P8XmU4aSH6hpmAOcKnrFN0XHaq77uKfFGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199015)(38070700005)(33656002)(86362001)(6506007)(7696005)(38100700002)(122000001)(5660300002)(8936002)(2906002)(66556008)(52536014)(41300700001)(83380400001)(55016003)(8676002)(316002)(9686003)(186003)(478600001)(71200400001)(4326008)(76116006)(110136005)(66946007)(66476007)(66446008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?HUH9Vbva3haXGyQOX8SVFqSnYYuxZ35Hj4K+dKDbeojh5Ocb2Gblc37z2rxV?=
 =?us-ascii?Q?hxxxt1EQHY/86bPpXHHmrcaJjSyQ/XDzPLyfOTqv7f9zDHEQttdZpqLR/Myu?=
 =?us-ascii?Q?cGjyv78GzLT16hn62vSbkYGwfv5lrfMfOcUPMdGE6Sf1Tv82mzX19S2c8vjt?=
 =?us-ascii?Q?vxkH2wbHik6u9AlPlYNwNS6cewGUQOQGQEX+S0Z+TaD5oOGPo9UEUg0OcCQ9?=
 =?us-ascii?Q?uES8oMxrbBlOptCth1KqGwlOHiqrwmiybaAk3PfcBuUsK6plw7rbCSI3GfeY?=
 =?us-ascii?Q?1Ce6Iy4znPv5g5P7rlEklAUcKuWewtpxKCrP9QKUhXMr3ijxj1yqjXxiD8k0?=
 =?us-ascii?Q?DZFUyEV3FM7i9lT0P2KteI7VzG2EAW8TouuopBqe3M5oTgGqd9R7mvArhjuO?=
 =?us-ascii?Q?4ywdMfemAIy8YSe/qt0vfC8lsQcD91TvbHKm0g0sA9M0PHtzEYj/X6I3qv3m?=
 =?us-ascii?Q?0sbBsNqBHaxvKpZZO1UlkyC/lTsiliR0M0drGuD8Kmp8oeV6HeEYjEinOwe+?=
 =?us-ascii?Q?b5KaYR0myf3JcdV0XRw5TzcoH42iTzgq7lX8lW81SiFRv/+si9h1fjSZNwc3?=
 =?us-ascii?Q?ocyC1UzKrl+55A+qgf2Q3k7arYyIHs9JbnNp+hUdWAOClL/dPe5zVSfbp1pN?=
 =?us-ascii?Q?YfE91BU4GPlPdJ1ZMvHU0yBiKzjn+CONdD5m7zPP+x8DuvxsRQvguuve3ZYm?=
 =?us-ascii?Q?KJzVfGSy8Fhksgjjoo3vdKARkdA3M27BeL1Vp/VA976e4L8Z0FQHBzHeYPGJ?=
 =?us-ascii?Q?3yvRRy7MEu7+zlL0FkitZaHxd1GwsLSUsXb1lJeHXs0oD/x+86ZShjNtGjfd?=
 =?us-ascii?Q?eL/tD9YoXnUVcN/DGL2FUPvkxmbe0R1Vozb2LLmjokBIh0DUZnD9GNYQkWDu?=
 =?us-ascii?Q?XIT+Kv2Ti1kmFmSZIQH5/6mMVh/hKNTFO7HCah2js07yp/Ioim+nQ0tGbn48?=
 =?us-ascii?Q?xXav8DChJLv1FO/a/KD5r58q1fp9o1cmBxSP5oRSz10msimU8nfzG8Qaktq+?=
 =?us-ascii?Q?wlH9DreSkxv45T/BoRczTQwWgIEBG4D3wo4hCzwXQ284x/WcYeY0vy3ETKkY?=
 =?us-ascii?Q?dL9Bx16kqOpTPxJk3GSZEzhwWmHLHxKgFy4PMsJOHC4YOaIvH18Ez3zjXoUp?=
 =?us-ascii?Q?IS+BFNuZlvbVqgxx2T1u5Gw+F4BtgLu2f07nxsVZGlsrw1nrHJufSB/9LX3R?=
 =?us-ascii?Q?KAAqj1+vPztDUJrzW9tkeUcA8IDI1DsNvdFyIbeS1yc+6FBQBDBZXkyH3bP3?=
 =?us-ascii?Q?bja2HAepzpQg3gJQGneywra1J+HJ5P7OCsuoD3gko/d803gWKWi1qKOhSjAt?=
 =?us-ascii?Q?pvg6JqKJumvCPIK+zPFwkbduSoN+nWL9Bgt3YUu92S0Mx117mpBjVbQH7C6c?=
 =?us-ascii?Q?/8gk6xKBTL0ETXC0ffsEmsLTpE6USXI+wJOixGEH1i+HgA6EFakfbqRjPkep?=
 =?us-ascii?Q?IMu9Uco2X+craLQ/hnnNevhSanvnYZphSPcr6QX//Zuex+9YoqNCYzkcIl9L?=
 =?us-ascii?Q?RJ/AX9irfFq7e0L4Pt6rwX8QZR8J7B1GYc3RXAXvrbgqEGDAooD/vfELI/sz?=
 =?us-ascii?Q?3QSMBH5i9hTqyuvqcyBQ12ecfSYM5HnYMiqPsXXRo0bNKaz3Q0N4UpyffZ6e?=
 =?us-ascii?Q?scSqjDmTIKpFE4peQBibtIrn1JCXwR22B9fnbFB7TasHAKfTx/5Ia+/S18Cw?=
 =?us-ascii?Q?rSzQ+Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 428c4a3c-3a37-47be-81a6-08dacb6ab6de
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 02:47:22.0729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4h67GBIinKOOLEslallflVgpAMV+z07wIlKR8JtUtsibK4fALTGBqo9wit5/AHwycTjazrAkunI/MIkcSPsiYtqoljhQExLDyfCjGxELns86Vj84uHmKRovMcoUSXD1A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7879
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Sunday, November 20, 2022 8:35 PM
>=20
> This series upports two BSP improvements in a refactored way. BSP patch
> de9461ece1fa ("mmc: renesas_sdhi: scc_ctl is always set in after R-Car
> Gen3") made sure we have a pointer to always reset SCC. I refactored it
> to include Gen2 as well, so we can optimize the following code a bit.
> This is patch 1. BSP patch 15d7abbfc3f0 ("mmc: renesas_sdhi: reset
> calibration register") added a new quirk for devices which always should
> disable HS400 adjustment. This was only applicable for SoCs which either
> had bad_taps or needed a calibration table. So, I simply used this logic
> directly instead of a quirk. This is patch 2.
>=20
> Two cleanups come afterwards. To increase readability, I finally did
> something I wanted to do for some time now. Having a helper to check for
> SDHI quirks. This is patch 3. And while working on this, I discovered a
> new macro from the MMC core which we can make use of. This is patch 4.
>=20
> The series has been tested on a Salvator-XS (R-Car M3-N) and a Lager
> (R-Car H2) board. The patches are based on mmc/next as of today as they
> depend on d901e2ba566 ("mmc: renesas_sdhi: take DMA end interrupts into
> account"). A branch can be found here:
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/sdhi/=
for-6.2
>=20
> Let me know what you think!

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

I also tested on Salvator-XS (R-Car H3 ES3.0). So,

Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> Happy hacking,
>=20
>    Wolfram
>=20
> Changes since V1:
> * added another improvement to the series
> * reordered cleanups last so backporting fixes is easier
>=20
>=20
> Wolfram Sang (4):
>   mmc: renesas_sdhi: alway populate SCC pointer
>   mmc: renesas_sdhi: better reset from HS400 mode
>   mmc: renesas_sdhi: add helper to access quirks
>   mmc: renesas_sdhi: use new convenience macro from MMC core
>=20
>  drivers/mmc/host/renesas_sdhi.h               |  2 ++
>  drivers/mmc/host/renesas_sdhi_core.c          | 29 ++++++++++---------
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  8 ++---
>  3 files changed, 21 insertions(+), 18 deletions(-)
>=20
> --
> 2.30.2

