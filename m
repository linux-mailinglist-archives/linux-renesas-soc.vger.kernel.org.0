Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B21963CCD6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Nov 2022 02:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbiK3BaJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Nov 2022 20:30:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiK3BaI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Nov 2022 20:30:08 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2135.outbound.protection.outlook.com [40.107.114.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 190E25F46
        for <linux-renesas-soc@vger.kernel.org>; Tue, 29 Nov 2022 17:30:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jyhjf8U1fCj7TkoUOcH9go7FFHcVONORJqmVqp75Ng4zlcS+zcdhRLkutRXj37emlzB+dSVFe9u9KFBzuTUdQmYD5/h9/mAcR2n0QETsIvLChRGxAfKX99N6ap/q3iKmkLGlCUoOa0hXC+f58dhc6RXsVQ+jSixgOB3JOw9Dt7M7vcDXkeXGUPhXg6hQTBjdzqKjTC9hYZbcJ5kEwC0zcZBzwXFZ40FxLK3CvVj7tk7Pm8ENXpAGY5QOaQKJm5sqBbvlVbsFAgIR24QkeYx2zfmYnNYfe5AkJFCPc/APCNgkVQJAsP9Jd7jzn2IMWhmoRZS/5RWyLb/uFcKPaLLhUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RkJ5hN+bYMm+quxqKqj/lQCel3sBSwH6EovJk87WlI=;
 b=QKRUA8f4UocnByYox9nsKtdRLAQwa7QDNSbuJXBpOPTwONDEqN+Lw1gIRrQ2NqaVVMkcJ2DLNlpX2s6uv3TuzXcetL2s8rbD0bjGPTX96k2rZuFcV0mHwN31tfRqQ/MStbCWUCKWBdTu3d7QKY3NlFBwqVctWzMIMVFk4DhGvuABxCJUleNbnm2rqU5sTLzhD2q0oh5gjeHXsQvaQfTkiuSNcfaLEs/db7ORPOha3ENlkarut0PfyBmFL8Veedvu6zYk1vB1N0ZjJoYbrjjPURwIoP7T+yLZRYS4u8ZUwUTL51JfPKm+f+eDcIzqaSIuu4bJ3bj2H+6q5b+nbjSmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RkJ5hN+bYMm+quxqKqj/lQCel3sBSwH6EovJk87WlI=;
 b=L+MCS288Ke2skApaGqT6FUskxsJ+N5aOxaoa1+Os4/Eo3KQ6JNhYUmunivus3IBs0KxgH2ucK6dddDk+/RqlBXJW1e8aP1rHDiNDkC5kW6DjcorGIH1mzOHuUXYmaUioynEB+qm5dbgdWiVNRzmLnXzS0hvqGLRMmqIQgUL/Mqk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYWPR01MB9644.jpnprd01.prod.outlook.com
 (2603:1096:400:1a5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 01:30:05 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::cd89:4a4b:161e:b78d%8]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 01:30:05 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     Tam Nguyen <tam.nguyen.xa@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 0/2] renesas: r8a779g0-sysc: Add missing A3DUL power
 domain
Thread-Topic: [PATCH 0/2] renesas: r8a779g0-sysc: Add missing A3DUL power
 domain
Thread-Index: AQHZBBR3BDBeB4bj0kie1ovqMNaFYK5WpKsQ
Date:   Wed, 30 Nov 2022 01:30:05 +0000
Message-ID: <TYBPR01MB5341C67652367F006132ED31D8159@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <cover.1669740926.git.geert+renesas@glider.be>
In-Reply-To: <cover.1669740926.git.geert+renesas@glider.be>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYWPR01MB9644:EE_
x-ms-office365-filtering-correlation-id: 8ba525b0-447e-40e8-cfa8-08dad27268b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1UvbsjBQ/6G/XdcQ2UjwqjXOeLwz32FzZNEExcBMVA/Cpjw8ecfPa6oHNCl81o+y7ouZZYzaK09iWMYkeNun5K/lHUALZUdHmlCcQcBz6ZE3eCYdkvoGUcVCbnVwPlKWqK+zFKnEJHsFzvRw2fm2MzyJ3xMefLrGnnmQr6uZAtaVoS55V58Y1wkUNkuHvvGWfX22mKIbkrTqBTKNdVUl47E5jkjBJ4afVb4csijRK3Tc8UAe+dYCO4M0FELcDe9xgNcbyDFUOm942gebqpzqewLzoEfgvLx3fMj1n5Jl/lKOsT27zYczP6NkC76FuGaIrWk1NE/I1pQFVEtIrffLvEtRGIw/X4nVjU2IVgm6tiULmQ9xw7R55lF5Dm4SZuqry4eAK7lSWy0F2SB/ZJynl9vtHIo6IZ6+2deypBtuhuwdXMQNbZ+XV4RKL3HBWZpSmbXDYnXPHxRsbfl0QJvKmPhT/5HGMv78/Cst7pyhy1R29sCELkjNmVBPwIN3ZJr8BP15NWQJaIbbUuhNCEn8ohU3Xss5Q65YpRUFBFe7MuZVdI6nSVo4V66t1PaAj0uiGZtCsdFlkq3fe4MZLSL3N7WbXfd0MEZvebMF8c1YOPzwohztXGR8oDWVyzDZove4LLZ37hJf7V4DZ5YHiBV57z+OEO330qgY/njC8jyUacYvGISE6zOqHUFwRGuRpaVCjXXmXiIsHknqtZj54CO74pORN9XF/kOSF9JpgyZyv2w=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199015)(2906002)(6506007)(41300700001)(4326008)(66476007)(66556008)(54906003)(8676002)(186003)(64756008)(316002)(52536014)(110136005)(8936002)(76116006)(71200400001)(5660300002)(33656002)(86362001)(478600001)(66446008)(7696005)(66946007)(9686003)(122000001)(38070700005)(38100700002)(55016003)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?AqGaZQ2r5LQg6uMy9ghKcgWGvjTnQd/2d6ATtPGGK93+JfGi+S9cHNP8VJWe?=
 =?us-ascii?Q?8Ofly5Z4Rv39r9G7CGbHd93v+rj42gp7UnrXUJ1f2x97PzGRdlfRhwdqpQ4Q?=
 =?us-ascii?Q?qP0uacagPVymOyO6x8PhyVxp+qBRfMRN/AU7+kYnbS4n6P8W8ZRtNMPFYTJG?=
 =?us-ascii?Q?lhcMjRC61RSqY1PCM9UtvZKU5PnxM8BGnKLxP/4GVLdpcL5MO+oH0eyMWvd0?=
 =?us-ascii?Q?JQJs9X4266H/lu9lCzvqv2CUvUYk2G1NasP1KOb/LUdvThlxvUDsSZNridze?=
 =?us-ascii?Q?Wik63GAtnY20kAeuJTn3T/ZymWwgkH8nEm583u7HNnLcPDgkuCizO7vokeOy?=
 =?us-ascii?Q?rUmfeBwzywOWaSkZCUZ+CijmUEQYEs2uhET4XgAFA76EDjWEf0DkDQBOMnXG?=
 =?us-ascii?Q?/SFbvx333xmc2xtUNNoL04KsdhuIyeaLVhcpisaLCzz+NPAOFGN0aR9EU4YE?=
 =?us-ascii?Q?FtSiHBaHFy2B/nAckDuRH9P9nGSd1t99LZkjSHWvxTjeBK3BQI6JqXMvIpYK?=
 =?us-ascii?Q?HH57nAU9+VzDi4kLl/hL2Vl1hd/k49bvX+U1QX1YvmOBjX+Ns1MUsRna7jT6?=
 =?us-ascii?Q?AFLeTMjCaNNKnrQhxWjiy+EBAPfhQODE97SrY2EJFD4N97UMFe3fOrwti90C?=
 =?us-ascii?Q?/+8QyHY/DQFCooZn6Fr49GRcnWpqw5+jfcJVg5aWyWze6i+36lylT5FOXuVJ?=
 =?us-ascii?Q?kxN10LmF6XlAvhxnrILEMDk9/AFHWARTyupdrUEiB1xuG13PDAfrClQEual2?=
 =?us-ascii?Q?fOEV0y3cKMxFTupqA38aN2b+q7EVrHSrBl8HDxwq0l7mjWTUDcIKMQFPrpv3?=
 =?us-ascii?Q?h4EjzSiGN0KbIYWm0YNXBDFH+3NjWXKVYMDp64ahg8+AlQMtenK5ZkjgyyKI?=
 =?us-ascii?Q?/JVgT06W89BX1EOdMYZ5BYHAiYdb5v0zLmJQ7a5rJg+xmD/8sRPlQakQ+FOq?=
 =?us-ascii?Q?RjgIqb5Ja4XqGFUK0kuVoCfwclcytP/B2Y4sDOveHLcCHxkHzK4kuerc5gmr?=
 =?us-ascii?Q?TVz1+vE395O6HIeCtSs9Mh/7ElyDeog4bysZyt1ogNTRU67DREkvJwamugol?=
 =?us-ascii?Q?LdNZYTgd+KF14+QbyEAOnAi9KRgb1fEmzD3vCNhfwH+th8K0q0SINewJqJNM?=
 =?us-ascii?Q?w9TOj/qVnBJAaVcwnMF1zwmir2TCykmPZK8kHq4oWCaF5UFQw5ocu6RX0K+n?=
 =?us-ascii?Q?B+CXl1ArT4LkIcguVQ/ttaA56LBoRDzSZYUBE+pfocNejwuT6gd2Szdc+enh?=
 =?us-ascii?Q?gtLR9LtGYhPtG3EeAdHUWJ2tf8gRqxH1P4/ceHa105L0E9JmLs1BbRAjHTEV?=
 =?us-ascii?Q?LN7+gYpBb5jDCJJ1SxH/6PTo4utI1RWZTzldcN5yR6xSYptb+cmrLDWjW8jm?=
 =?us-ascii?Q?peAkuck8dvT91ojAIJqq3y50lLXeo4EnG3UA6LV6ee2exMd1uNSFhCEy2K7j?=
 =?us-ascii?Q?CdCAQGEi8op/Cp12BVoPB3AWX8cajA0e823txcrJvNZ2GYc7+JN3BsbT7K3o?=
 =?us-ascii?Q?5pGxnyDsc7JJkxuXESBKa9kHyMRatxNPcqrlbA40z1rIPF0DS0II/v0knQR9?=
 =?us-ascii?Q?r3LMRkb3w/Sm3qnG2gy4ZKB78CjFPaj7JXdbJfew5K+kqDyDIcacMbplbqfQ?=
 =?us-ascii?Q?PKv1MvU/YXJwrx1rENOYNn6ghZCxC3YI7g9QNGy53knT5swGgFEfZgGrGzj3?=
 =?us-ascii?Q?++5DqQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ba525b0-447e-40e8-cfa8-08dad27268b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2022 01:30:05.0662
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zE03MccnAUz9fvn0EOn5z5OLxySOamtS6Cg6gnse5iQI803Bw9PQ8rtJe4U4d1cJmt9gFXi8pwz34V/DMrAg0bH2knYBOvgLsVsd+yruauU9lzBCvXmGp0lUCNTkPszU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9644
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Geert Uytterhoeven, Sent: Wednesday, November 30, 2022 2:03 AM
>=20
> 	Hi all,
>=20
> The R-Car V4H Series Hardware User's Manual Rev. 0.51 added the A3DUL
> power domain.  Hence this patch series adds it to the DT binding
> definitions, and adds support for it to the System Controller driver.

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

JFYI:
- Rev.0.40 (perhaps internal document?) mentioned the A3DUL.
- But, Rev.0.50 dropped the A3DUL.
- And then, Rev.0.51 added the A3DUL again...

Best regards,
Yoshihiro Shimoda

> To be queued in renesas-devel for v6.3.
> Boot-tested on the White-Hawk development board.
>=20
> Thanks for your comments!
>=20
> Tam Nguyen (2):
>   dt-bindings: power: r8a779g0: Add missing A3DUL power domain
>   soc: renesas: r8a779g0-sysc: Add missing A3DUL power domain
>=20
>  drivers/soc/renesas/r8a779g0-sysc.c       | 1 +
>  include/dt-bindings/power/r8a779g0-sysc.h | 1 +
>  2 files changed, 2 insertions(+)
>=20
> --
> 2.25.1
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
