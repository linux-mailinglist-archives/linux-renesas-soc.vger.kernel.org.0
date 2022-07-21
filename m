Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFF4557C1FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 03:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbiGUBty (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jul 2022 21:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231259AbiGUBtx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 21:49:53 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA9892CDFD
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jul 2022 18:49:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZpNPS3PYc1pS+Ck3isYyOTTO+S+p+9KV6QLbA1CkfpvwUYYlEmje4TpjLWBJJZMxxkEBv+WdWDC42Wu4XNXseOh6YF0w/25b1jwt6jPV4TUAlLBx++wJx94jf6hVYQ3oPk2OcGCpUwQ//s+dy4sRiG7kAC9trewdv2goCqVxq1ewNuItmI66Vze5yT5qoBxjDAJslox3EbBounAZAhGGFE1WSVWNsA6phXpyadH4fNAPe4QpUKUlhwB0QFoNzDcSOWhiqfQgHMekmIQBx/OH4f+kqFnj+twlV5QNrDC4E/ClSFwZaPsZToZ4lDt1x/AwtsgMyha0wEYBZ1d31O5FPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUBqufOs6ZjDeBLOcBx9cXprcLP0bGNlhTUdW2Hh6HU=;
 b=HHAFoAysIablKFlDHZTrmWi9zkTsbBZeZslsRLPTgSjIWYzSC5bqtZsp5wPqvkafRK+rqGSwXFoT9PuQzraWhh70F/4sBKkz3EoVOa2lUjlpPLrMkyEebooJgC+/1hp2zzCWxJZXqmhz/RtxZZwfiJnDDTr7eV6KpicY7OMeScKlXSO0ZT8jasjiGMX1DjfTNp/cCxeaxuWMmGxXfoLfL4Pc4xxmNzjr2b8TKoxWk9EsCfehIdwk54k04E64xove7cjrQjrsMnnxO27Qr3/n/K5j1ykLfD2EwJuxXvgK0gZvkBm/ned31a5KyLJPChxFrbnYyUfDLgK3sy0vNOl5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUBqufOs6ZjDeBLOcBx9cXprcLP0bGNlhTUdW2Hh6HU=;
 b=Nt/Md26wQrEqNNsTmwdytufFqgrG3xlL/qTD7EhX2VZ9qAm3w82WHJwyBogmnKtoJjjJIYcDHdR1I2f19EudRr5EKynIFR3ikcBO80i5hleKpHLaO3T1WoETJMucItkvcHU6VGaPQkNoOycycuB3d7K8Lc4IujDET4s+zQ4HJFs=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OSZPR01MB9379.jpnprd01.prod.outlook.com
 (2603:1096:604:1d5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 01:49:49 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::307d:7cc:2021:f45f%7]) with mapi id 15.20.5438.024; Thu, 21 Jul 2022
 01:49:49 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 0/3] r8a779f0: add SDHI support
Thread-Topic: [PATCH 0/3] r8a779f0: add SDHI support
Thread-Index: AQHYlSy9IUwIHsNTzU+jYYObuMaM762IHMHw
Date:   Thu, 21 Jul 2022 01:49:49 +0000
Message-ID: <TYBPR01MB5341D1EB5B610099A60DB9E3D8919@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20220711134656.277730-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220711134656.277730-1-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ea12a4a-4cbd-428a-efca-08da6abb4c5b
x-ms-traffictypediagnostic: OSZPR01MB9379:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FKNhp82+qWfET6BIxY2aBmfo+GEr+UxOd/swCKgu0VRh359r91SG+CkZcT3xidGIyYaDEcvAJbkTdpygybH9uTbxj4pWTk7rMOtfWB+Omx0MiAa2Qd7s6A+XdR2ajvhgm5bKlty7lX5a1ooDPkuTEq0lb/7SxOcEooFhfzMhKnDCbXkJL4Inrwm8CCy54V3bu0iRFZLQgm/H4HszmXGz2OfweYc4DJWtoW0vtMXmPQtqFh8PkfUF3Tw32VmIn/IGIVgyTUhGOzHFMKKSPOztHlsaaNO00H5Ksdnb0FwspUfwgs/8CqoHpJATHCa7s4yzS7tH72Ef547A8tbfra4SrCG59JDmH2PzhwdeWZoFfnxSZVph6dFdQAYGvblg/CcUhSXUqDyNXKTyzpGWU6QQdI/7Enp8rns7OdJbZaYLhDwdpdc+h2CA0CQZzxPHePbshgICvPlBS5VTfcwo1bivBaFOekhHDBklkw8BOCxkGI1BQdw/0g1wEBQl0aZ0vzycfU+8avB07zRlthAQVIdSfqzMGWZ9bjzbUueuyv0XKvYyiu+Zyjf58/MZcJ1q81DLuPzlua5j7/rwQymz0ik+ZK97Z7eAIFanuNTv6cqKq5rmkoj1eFgYdRAhiMc5V1Sz+8yP0HiyLH9wdu/Qpv/4dgUibY4/g9tNVeUrAEan4mVo+OG2e1vlJr6Mfc78WO6it0yGa0KDM7kz+X1wyWwDBzPiTcfxwpYR+fjXOZiFr8nRjPZZnA9f4DBAwBDay5YXPYFcbsiiTD2jZkR0iUQV22kSIINtSiduf1z5G1NMmYGp/W6GX4BDv3llypj48M1f
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(38100700002)(122000001)(38070700005)(83380400001)(186003)(8936002)(52536014)(66556008)(5660300002)(64756008)(66476007)(66446008)(9686003)(55016003)(2906002)(478600001)(6506007)(7696005)(76116006)(41300700001)(71200400001)(8676002)(66946007)(110136005)(86362001)(33656002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0K2gFIsuooNhD+um7LhXRcTwZzaXF4o6wRvxwOvragF+oAUxVtIULOCJTBS3?=
 =?us-ascii?Q?8JewdILUMbFO1nUoh7IiAPEE/0brEwByzO9iEFud5PGCDp9aBCBoJzGZswKm?=
 =?us-ascii?Q?jXv7y5AJUK93cSjF3vRrMOxKiM8yKvqwJYZGrJ8SQg5esNI7pUIlonvF2MMS?=
 =?us-ascii?Q?PyNgZ0boslJVBVmfuxsJv0S3uUMZMk3/Qty22ZkRwUq1lUpPmp6BQSnjJ4Mb?=
 =?us-ascii?Q?KhTtJAOdaN6kcHjmshBUo/zFOBXhV3qG1j03agy9JHovrySLVOZLKgR9ovCZ?=
 =?us-ascii?Q?nn6XTGXGi2esIGDoIPvgTgzhU8MqnMMVMco/ExIZJwGT8FRVRJEWv1XxnWud?=
 =?us-ascii?Q?5PP7XUOqMNvnuECGkiX9QXsAx8NVqnio5uLORiclPFhZSojb410aNPS5eWKo?=
 =?us-ascii?Q?zGLe/A7BXsgdRF6kIg9BhU+pVXLLpUW6GBwbAixOP0V+q00ZBmS9Hnx4NVUT?=
 =?us-ascii?Q?UsSj/ryp3rNms5iYQvyUOVy07fsIu/cOJzjU5ce8H4PdW/TufeLKFC490oTX?=
 =?us-ascii?Q?xl3l//IgcMPsL83voJYF5BYz3ayaahyYHYahb0s8uvAvkn7FsIgiJwkYjrPF?=
 =?us-ascii?Q?Cc6pzxHqab24YqbhAozfKyL78lacl9/wAEq3xGHm7q6VZ3PkxmGZCK6yeQNs?=
 =?us-ascii?Q?nA5e33Dc2Kd1kFK3qIwG1tz1JSWdMHbaDW7PnR5bHRRxsr0aAsUxHkO4u8Xv?=
 =?us-ascii?Q?gIDNYUAixDTICAgQJIyfu1ZFCWNeot8JUB+0DKzPWN/R3MoVm27gB6448sSV?=
 =?us-ascii?Q?aLPFKq5Z3FK3QdBYFAUjuyp0f23k7p9tges7JG1dOvaxxyzObzQYKc0qOjdd?=
 =?us-ascii?Q?orBKXWbbUQSr/ImKGKUPUbq7j1/kxhvHMt1XcyOifspmCC1opMuouP/cyUQK?=
 =?us-ascii?Q?FgcSaZaOIHM0l1B/yKHFpRRgo6r0NAXDi69IKiodUzy4KccoPY2DUJea3+Hv?=
 =?us-ascii?Q?R7h3TulZnjomvvFK0deQNRt7OfSRyAwp+UTo5n7hbq/lEuQBTKy4hv/csgEj?=
 =?us-ascii?Q?LKC+X0J+TyzKM7apkxvKfZ0Kjd1vvov6R2Uj3Kenr0U3bvFx5MIc4B+mMI77?=
 =?us-ascii?Q?HCmVZLkPn6GekHLqilCXLoqzNg5gvNmvjq5g8yIpMZccFCKvjIw2ikZpNtD6?=
 =?us-ascii?Q?I2c7gAx7pa7yj4WTLk+nKX6dzr0O0Y3kR0aHqJ8gh5ucQZVeWCCNJur0KNQv?=
 =?us-ascii?Q?Wac0VrPFdsq8oMAbdeaV4pQunElQhnYmZT8OMGzKUcZvJOH59C7JVVuNBWxV?=
 =?us-ascii?Q?CLz14EcTy5ysIImLLZjh5bnEFVit2Rbu1jIhL1oH+9XkAEwxToLhM7D6BJaD?=
 =?us-ascii?Q?5cUA/U6Zz3NZ1yc9AAuYY4E78daDmJxG+Wqm7GAEg+PNC+fmnhvipr+1Jbkv?=
 =?us-ascii?Q?dTDk74oZFCAXBEkCLAEAammSG471WRT1H/zU5BWbFCxDDWbzFhChfrq+N4Sh?=
 =?us-ascii?Q?g12VSYhZBHahNd3Hx2gnITKjKYuHivs8NdLYdsUJnVa56tzyZCvJkc2bORt8?=
 =?us-ascii?Q?sOuokiCqtb/gVszZdrLPzC+qyXAEV2Ys0lBvoF0gC0XKKb0opbqvaOvDg6wc?=
 =?us-ascii?Q?A4c2AIBcQMHQEc4alJ/I25JYIKOitIZVzYi1v1OxuvI1dOG/l9VTHK5oy50z?=
 =?us-ascii?Q?beqAHUDMsVE0cJYqTPXlZgm55pyWq1s+brGtYfChcwQdkplktk9ETVXzd/xb?=
 =?us-ascii?Q?xZ+gEw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea12a4a-4cbd-428a-efca-08da6abb4c5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 01:49:49.8400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: phCJzVcMwIvnv00BdoUakMMm1/aWgMiBX4qt/sCn+q0hA+XJqfuprFPJZ6JIV7HWdpo/v+t0i+ZbPRgQoXRt8LG4ofk6KNFuM0mf09Mi31adLfyEOEisFYoykzwvUTF0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9379
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

> From: Wolfram Sang, Sent: Monday, July 11, 2022 10:47 PM
>=20
> These are the remaining patches to enable basic eMMC support on the
> Renesas Spider board with a R-Car S4-8 SoC. The patches are based on
> mmc/next.
>=20
> Some comments:
>=20
> - For reasons, I have not understood yet, the performance is a bit lower
>   than our BSP when checksumming a 250MB file (BSP: 2.7s, this: 3.4s).
>   I was investigating clock handling differences between BSP and upstream
>   for a while because the values of the clock trees differed quite a
>   lot. The patch "clk: renesas: rcar-gen4: implement SDSRC properly" was
>   rejected which is fine with me. I meanwhile found out that the BSP had
>   PLL4 entries missing which made the values all bogus. The newest
>   version of the BSP fixed that. So, it doesn't seem to be the clocks.
>   Back to the drawing board, let's handle this incrementally.

As we talked locally, the latest renesas-driver the issue doesn't exist.

> - I made prototypes to support the microSD slot despite it is hardly
>   accessible because the Ethernet subboard is blocking the way. After
>   further discussions with Shimoda-san, we agreed to not support it
>   upstream because the voltage switching in hardware or CPLD is only
>   for specific testing. I added a comment to describe that.

OK.

I reviewed the patches and looks good to me. And, I tested on my Spider boa=
rd.
So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> Other than that, eMMC works fine so far.
>=20
> All the best,
>=20
>    Wolfram
>=20
>=20
> Wolfram Sang (3):
>   clk: renesas: r8a779f0: Add sdh0 clock
>   arm64: dts: renesas: r8a779f0: Add SDHI0 support
>   arm64: dts: renesas: spider-cpu: enable eMMC0
>=20
>  .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi | 45 +++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 13 ++++++
>  drivers/clk/renesas/r8a779f0-cpg-mssr.c       |  3 +-
>  3 files changed, 60 insertions(+), 1 deletion(-)
>=20
> --
> 2.35.1

