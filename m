Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1989976462C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 07:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbjG0Ft6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 01:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232441AbjG0Ftg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 01:49:36 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D26102D67
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 22:49:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocokIKaonfY6ESRGERoCJGz0MSa54QF3bsOAQtcyvD0OWI+JtTgRv9wPFtyXLR4FkoIVTPxaZoxqnKLAx+doB9upgDEqGqcNkCIzKL7G9MMlIA4dMn7DrW4RjcjbN5q5imZnffyot/xtr74NoIVeZ3EAMtVAC3CK653nuAcWmG7GrKDIyoj9/h2pN7uSLhLBrmw4DCKs4yO80yqXmGfXd06J97zxBZrtbTeGEQ9CER1ue5zwaA+6sZFW7eXbZ/EF2q68rlrLZMRzGRPHaG6oaDRtr5C8Ku3cfBZn4jc50DrEk7D0+fmQ7D3FHD6zX1mor3+RkyLjYUAoGvI8TyqlvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtL09GfQUfhn4GkuanGtPEGzlmlR4m8YGnZmIBn0K6E=;
 b=lkLQffQ94D4SRU2M+B4HlC2lvsMyihxURLYwbeUq2jhBVsW5lRxcAM0ksmKw6rXntXMBtsc5ycwBnKWlv40WtFG004vGzaJdDdAXjC8HpOrHrONK2ZFsn+GmZrYx6lMgaatAQST0ejkY3gzCUOQWxpRpX/8HjXH6fLZIEUx1tYeZfxMITSXY2FfuR2wZYT/bMnF1K8E30ezhiM2Axqpgu3uHMSnY1f8jE+UzVyT5ynOzhZtFR4l8jxxJLKqHl7IsTur6GEYuUI6R6eNpA/Sz5lx7vhOYBBXLjDd24qbeHGa/2y1Hgs4FhgJPrOVXN8qy2DnvDsGbiPxy28NUzA0jPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtL09GfQUfhn4GkuanGtPEGzlmlR4m8YGnZmIBn0K6E=;
 b=AB1/E+UZGzRzIcIyNLhBkteB0kMdMi1WVSAmjK6ssoQU1kkx4tnsBLgQhjkW85GpESdEtITMv2LZ6NTK7ta13JyAh3S1ouNj87DBVAbnpYYMLPaUzWnJWUp3lh0i2ZRR8BnzDc/uk5cwyYbBQTM4PlfnfL+5bAEXXKtqYkizDog=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB8330.jpnprd01.prod.outlook.com
 (2603:1096:400:164::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 05:48:48 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::e5cd:66a0:248f:1d30%4]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 05:48:48 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/3] arm64: renesas: r8a779f0: Add INTC-EX support
Thread-Topic: [PATCH 0/3] arm64: renesas: r8a779f0: Add INTC-EX support
Thread-Index: AQHZv8/CHEnoXfjfSkqj8TIWO+Fy16/NGehg
Date:   Thu, 27 Jul 2023 05:48:48 +0000
Message-ID: <TYBPR01MB5341A9EA975DFCB42C4AF4EDD801A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <cover.1690382328.git.geert+renesas@glider.be>
In-Reply-To: <cover.1690382328.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB8330:EE_
x-ms-office365-filtering-correlation-id: 813ceca2-a810-4416-7a3d-08db8e65261b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SbkNsHpQC5/oYQqEn6YUEWzW2hhOGmZX1HMI7KsaviRGJRWK2G8ps2gv4FG+cNYDzB/fhrsPnEFnI+izAmD8ww1W0XMmu1BG+B5LeC7PyuvCjy2i86r7kepjKsKColB5r3IETRrIQjLgeCLENrwAeTDExMl2o1GNNUQgwYPM91mM0++9e/THDofNRx0rVV9Bir2flLW0qtmX6Xdw/qj6WeQC6lmatiqEkvC0smbfVIjZMvzAVkKxlEYk1aVcJxIvRdBPZ82jmAfuSsluEe/b/AW56iKaKuhFK3nbYQhdp0doz81YynrPPS/9F2h1d6YtbFK4XvtD4Dw1NgsNPspP5Zk4T5eYFB7tWAsbDdGdTET+8rRYZm30JuTS+SvNds9qIzb83CmEloM/FX/lQg1ycvekDM3mUYsxYRg5dWe9t0Ej56WkoI96SzPK2VVNHZWA2VKjPE6cvkE7QVZ3npsMhwPmsaSRdxiBmcLoqECyEKpuJJvKTse8LQyKr1NhL2ZhNiRZsoKGz/ciO6LBanKhD4S+gTb/L01r6wyMB0/BI9TConqV3t/AyTxlJs4TC8J6xt0AElO2/NXhtwbiSoh2QX9hJIh0biTt5PG0gTJHpsHqUNc1Dwxgnb6D6Z/eNtRj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(55016003)(71200400001)(110136005)(122000001)(7696005)(38100700002)(9686003)(478600001)(52536014)(41300700001)(64756008)(5660300002)(4326008)(66556008)(8676002)(66946007)(76116006)(66476007)(8936002)(66446008)(316002)(186003)(83380400001)(6506007)(86362001)(33656002)(38070700005)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LSIKGzJQIYRBXhccEzbYI/LczDh+HS9+S2g9gvSf8XtOYW14jLtH7wYD6hFA?=
 =?us-ascii?Q?QWM5dFVykni7IGST3Rf5VYP64XSY3rkgakdp8V3njEa7SQNCuZTNVl14jvNL?=
 =?us-ascii?Q?ucJrCwuiO8j5LZTFrFz0ueF4ynAiwQtwIGUXene9iRdmFlsuOsmlhECuPniV?=
 =?us-ascii?Q?x8wNj369t39YRe+4A8Vq4yFeusmgf0Dg3knKebBcntoytcWa4mdIZJnn2gx8?=
 =?us-ascii?Q?0tp4bFdMzadSRcdotuuNA8j0z1B5GvKIDdsWLBaFwrJ59MwpnL55AeVqo8wJ?=
 =?us-ascii?Q?JYW8QhUJEFsbj+vp88/lL+E05H2bFj5KfxcL2QCeGXHtC/IllPkMx19y78xJ?=
 =?us-ascii?Q?R6rY76BApYhTQaU7iAIcF76RIkZsJ0cTLgyGxgADYbvNTMesG4FCskj5RUTL?=
 =?us-ascii?Q?YUOS57H5s3MTsJ5nD+iHOlDpAIdnM6IseFNOwATI+sxCXgmIrQxWNAcjqJep?=
 =?us-ascii?Q?LWLtlI1KP5C1aPjsSURGsImNd1UPTt4Vnk1GQ4fU2XCSxmqhrtMmvLo+w7Dk?=
 =?us-ascii?Q?i4p0e2/E4xG4fEB5t1Rhc6X/kApGnUERJPP6OZg91WtDPgUF3JCEmBXdary1?=
 =?us-ascii?Q?B6XlNtXXvaoG3LsoTRFTQx1X131fdmko4V5iX6wO+zcx2J4/ngKT3SjzzmH5?=
 =?us-ascii?Q?ieToHgbUNGekONeloXxdH8RdZ+M4Ldzmh24EvHYIaDheX9NLo+TXqulrInV0?=
 =?us-ascii?Q?4qMP6avbLEzlvZ5or1yhJbdRYIQMEYrY7/TBEBrnbWVcH+XAA7DNVAkbqDDU?=
 =?us-ascii?Q?YcFgVYANSIEa6U9wqLD49tclJVLvch26m6OTeiPW8DrjuaVDR1qKzQUC/lFB?=
 =?us-ascii?Q?j4dcQV85SoF6tV2G0hX9TNwQW2DbFcYt1bUy/MPtuuiijnf75FjQJywXjy3E?=
 =?us-ascii?Q?BtsVE3/Q8nDX86MA72dTN9WXCCf8l6CZuJXoKEzIdjGasncWaD/RavQmbk5X?=
 =?us-ascii?Q?xbRLiXfOaLsmUj8fziFzswk4rVRlI18iS0uuIfXi426JrbaesFr+azOTNrXL?=
 =?us-ascii?Q?mH7w7KISFmReg30kjDrvPMSWOa1ITRmjFAyR4fm0Jl+DiW3c5JyRls1k0aOD?=
 =?us-ascii?Q?xsSugXvAZZuwFFYRPKLQVRWuZOcbFIs6BxA97F7C5fmHjVdnK3/kRwdmy3F9?=
 =?us-ascii?Q?RtyqnSMRZChaq8wOtX32NjA+MtfEW1VnRfmeMVlaw8lcvxTE5Qj1MosWB8yn?=
 =?us-ascii?Q?JYOl77gK+xVqS3mGrhkHk4VCNKcC28hIK6eBEOUwz4F2gioGK2xfZpnBasKJ?=
 =?us-ascii?Q?nR/51SQ2u9vP+sXspvv1V/pbZ31sCw06DDHC2AFhEfhj9fZqcWlxSwu2t8PG?=
 =?us-ascii?Q?uYiDcWeKjYPcmQi62IDoccDiqRgetLd/MZqV5PGB9iQBt1BSgC8NnbhDMD+f?=
 =?us-ascii?Q?sVokW4upDN2grQXlRiXV251mDbeMSxn57aW1yYZ7WuIsMCBNGxa3M9HC0UXt?=
 =?us-ascii?Q?N1kUWn4W/2b+cfjkdJPSU0FWTKk6lSOZyOLq/LXwfVhJfSD/xNwZRzDWG0N7?=
 =?us-ascii?Q?Jg8wfxtU/KZ9Sk8XbCsv3Ef1ZfKdyz7iXtDxnDciX2I/+Ylk7SEPsHni9a8Z?=
 =?us-ascii?Q?h5fGZ/epcWaR19cfGqHN3MCs05WHkdcwTkA3NrsAwq5ay102M7rfoUBMVc3f?=
 =?us-ascii?Q?65+bjcRWyW2vPprMa9YQ4thLSB0PBSbLQ6RpK+UCwRSxJzz6cHWqi2nSHg9a?=
 =?us-ascii?Q?zzErag=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 813ceca2-a810-4416-7a3d-08db8e65261b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 05:48:48.4930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KnaR4N10LxZcP16lbLsYs2SaBhDENe0RzH4dCbzsNGJzS1DmwTVNuJ9hJuBbMh/LVgEcrACY8oerR03NqBz4b2wDK+amyy1z/wfYQmBsgXbvpkhmwdtl/lNrMxsFY8EE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8330
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, July 26, 2023 11:45 PM
>=20
> 	Hi all,
>=20
> This patch series attempts to support for the Interrupt Controller for
> External Devices (INTC-EX) on the Renesas R-Car S4-8 (R8A779F0) SoC.
>=20
> As I do not have physical access to a Spider development board,
> I am sending this out to a limited audience, and hope someone can test
> it, using patch 3/3.
>=20
> Thanks for testing, and for your comments!

Thank you for the patches!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> Geert Uytterhoeven (3):
>   dt-bindings: irqchip: renesas,irqc: Add r8a779f0 support
>   arm64: dts: renesas: r8a779f0: Add INTC-EX node
>   [RFT] arm64: dts: renesas: spider: Add keyboard to test IRQ[0145]
>=20
>  .../interrupt-controller/renesas,irqc.yaml    |  1 +
>  .../boot/dts/renesas/r8a779f0-spider.dts      | 52 +++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 15 ++++++
>  3 files changed, 68 insertions(+)
>=20
> --
> 2.34.1
>=20
> Gr{oetje,eeting}s,
>=20
> 						Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
> 							    -- Linus Torvalds
