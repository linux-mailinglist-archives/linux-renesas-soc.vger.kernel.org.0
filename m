Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A18455EAE6D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 19:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230337AbiIZRoq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 13:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbiIZRoW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 13:44:22 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2114.outbound.protection.outlook.com [40.107.114.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B13C4DB00;
        Mon, 26 Sep 2022 10:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOhlglPwQn1bfs/vTKldC8dV/XKC/vfNpWZelk4O5M+vsDWim1kK2GSEu1T+dDhcxGz9hnqW2coXbNr7z1aCxgZCb5lbRWJx+Sq38ULK3iLOIemJPp6wyEBgU5VNjCtp4DEAVZo9BGqdwVxYvUclt7HaWz9O4aqqPEu86eyCEkZeQyBVCyLticbFqjJ5q4UmzSm2sCWhSqEsnzeeXG2GMhpsbaKySEyJRbxpem8rvz5OGDK19Q8kq2qwk4UdA+HW3jypv8q7Mztd3wUqiPs9DUHrq9bvecjCvVba3k2MPi7ugCxVI1+nTMirkdKPutAtgdknEsIrzMo4LgWSOtPqtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8etB8qkgGcOe2WTws2YT9MekSRcNP34mSsOBQ7SKN/U=;
 b=Yd+XdC1P22UM1L4zS8ZGyycaBpQtu0x3h0LkHM4GXKTR/zVNrWAgdOY4KMpPab2jETVvdj/eO0xPi8RFkN1H86c+IVGyCPldYJblJbpETPlCdKFieT4WCkaF/LugT07D4TsWvvqmiSyObzi42mgvs4WIvyt+FS6Gp/RSw4uczGcw4OeEU3xctbZQaJWHTla8ZO20l4yXo9ADWh4O7NOtROYSsTr6dq8sGSJmNHr6JQ2KeI0A/cNG5wAqXGGJfW7wt4mjnKnMN6btvopk1utumMpYgTOG+AAqlGZNS73VcK1yVnpjfr7un2g+KImzEN/AF0O8jZSfkiHVzJXWDtWneg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8etB8qkgGcOe2WTws2YT9MekSRcNP34mSsOBQ7SKN/U=;
 b=IrYeLg+KxH3gVdHMNaTrCXM6M8XIMYS53ssiuCy9AIQn2df5s2oaQC29efyTFx/jC2r83f2zJ9XypVKL/+r2WDmsx9XDoduKqsW8gLuqSto5u0S2TlPnbRCyrde+BP+fQmyIedDGnRl0ZlcNuLjVviPg6B6Ua09lAuSqLkTkgdY=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYCPR01MB10616.jpnprd01.prod.outlook.com (2603:1096:400:290::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Mon, 26 Sep
 2022 17:13:21 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::7c12:d63c:a151:92bc]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::7c12:d63c:a151:92bc%9]) with mapi id 15.20.5654.024; Mon, 26 Sep 2022
 17:13:21 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3] mmc: renesas_sdhi: Fix rounding errors
Thread-Topic: [PATCH v3] mmc: renesas_sdhi: Fix rounding errors
Thread-Index: AQHYzmEL8L/KEMB8n02YNi6lLAt7563wYWCAgAGYHjA=
Date:   Mon, 26 Sep 2022 17:13:21 +0000
Message-ID: <TYCPR01MB59335B9556A66EE2D23351CD86529@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220922085511.1078256-1-biju.das.jz@bp.renesas.com>
 <YzCHFZnhrMWPkyIQ@shikoro>
In-Reply-To: <YzCHFZnhrMWPkyIQ@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|TYCPR01MB10616:EE_
x-ms-office365-filtering-correlation-id: ba38fb2c-3187-4adc-211b-08da9fe269dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ATj6M+54+YC/ChWyr7XdvFsSrTXNcG1zhmiKC20cgk9LuKf+IN6VK10FH25eE/ibg6PQ0VZAeBudHx5FcDY0e2pl9AtoMet+Zd2YaogZu9+exlmLEsVRiJ4l3pdSSQkiNE54orf9BLvcbH2OriPnRO/3+RbYaBjiI94ACHWBxQQWiKSFbMzL6hM9JGKQRM3LhNjUkWv6bE4pBWkGVpBbYcnivzF6KINCONq+yeBzvDhCwR7aY5LRKQtl87a4gVepMqg0pOExNIHOw+rF/XVf4EjusrfnCu/1u35ukNfLgv2j94KBuq3SaRwUPdUl5NrRkaJRgc3kKoBtiM0S/TJxFDPnyWmwF+B2a3EQ7+cNOoK4N/BpjPiiejsu9cSn95fTaPyK8lontj6fuDO8rF1r4ZcpTJhBZHPea7nXp28KzPKoZsIfkCCJDheJ0YUjQksthtGsE6jKlzPNcQckbXgXqvM5I7wJU43NxyInFihR2Klu+Q7hPLmewX8TyMsVXILJrAg2gvAOZZXxt3w7TafZkVkZjEA2slXv2XlbXSS7MwEUI1FUVM+0ZJ9J0KT3/96nl7ydxV6HXb33m7zZXMaN8ta3lrlVzcLcOPb6AkswTN+0pMDIgEbBKfkB8cy1P8jnXSbiYqIQWQznyFD43hgy2XDZJQRVjGW4H67CUeJKuDnpiDEHHMOGZu+37Ppfh/wIcGZz44wJKIimtRJLmOwulajrz2J6Hx7XEUZzQlqKwraowgITf5nCR06Gtuq+qFI5gTHtz/9O6s3FHwyIbrxzDA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(451199015)(122000001)(54906003)(33656002)(2906002)(86362001)(4744005)(5660300002)(52536014)(4326008)(186003)(66556008)(76116006)(41300700001)(38070700005)(66946007)(8676002)(64756008)(66446008)(9686003)(26005)(66476007)(8936002)(316002)(7696005)(38100700002)(6506007)(107886003)(83380400001)(478600001)(55016003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nmserbB6fEj3LhRUs7G5yZHbrxLDVwRczZdGxGwJPk2OR6TcI3SXyzl+Mx8u?=
 =?us-ascii?Q?S6i1ViW0BbaRfpcAMwSD+P7D69OxwSN2PzI+VUtHzV9SE8BTgM3XvokCbbDb?=
 =?us-ascii?Q?M86Mbx77gXQe+t+otJv0kAvb9lMcGf2fmSZps+2oqt2bjA6huSYc93kIPTNL?=
 =?us-ascii?Q?U/F6aoIaIYwIRVItKCS+bNanHKwHQHHAt49ghtnKYMeP1OijhOdUz8G5nTJo?=
 =?us-ascii?Q?pEzawglwwBSWiIbUTLCArfA8ccsnVazIRuKwBgMWNmgdsZVC0EGOFEFL3cHi?=
 =?us-ascii?Q?sRc3paSYya4wrZd1kXDqwXoJe2iKeeRM95+ZZ5rjLrgQSsh7O+unf+/i5Iza?=
 =?us-ascii?Q?9PVGvOx/o0DgfFV9iNzThpQl9N+2foroCO2HCBJaDMM9Dq31jutexVSeQ06Z?=
 =?us-ascii?Q?xLle4m8WH0+K9UonKTMdBntZq4Qiku1zCvpyrmaSSu0uaj9/m0SvNJvRLXeB?=
 =?us-ascii?Q?usDI6qWvYXMOZO/yYi3BjLLP76KjQHDwpm8IXALzS5as+JUPMivOHqHSM3DA?=
 =?us-ascii?Q?ebqo5qqYScGUFbbgrp4X8Fp7oaGwqbf+h+xeTf7hheTeU7f5Tao2cuDnv1AP?=
 =?us-ascii?Q?752OMlNrf9QgyZBTawbfR8WK3sIfPk1z/tyUFZdG8WhQLQFVrUthK8wcmkpp?=
 =?us-ascii?Q?6KRM+x8jqU/nNQhIwmcQD7RkN4RG5G/KB6BrY2BY3DuPn5MwqJpxRZAJ4zty?=
 =?us-ascii?Q?VwSJ7Ajq+EdyHdVLSE6FA9m1zICvFEEGEFHm8GJwVA3ieLd3WUWlrPUQKf4J?=
 =?us-ascii?Q?MqFRhvu+XAMh6sXn4dexwUpMMRCFgvQzLuXCZjmYSg9uTwTMovDF/WdYhq5/?=
 =?us-ascii?Q?TcrrKv/9j4+SbmtSU07CmJFJL+Ywv1SYca2BIDEbFvUFgd32r6aR6b+0n5hw?=
 =?us-ascii?Q?aXq0CY+k0oJo4wYhqM37ihRFHdGESS99ufLgSPaOBonFxr5ya5r4eZ0E9pDI?=
 =?us-ascii?Q?mqcHD0QPs+ha6pAKXAkdZcSHxUsv/dOMQNr2TD8e61vS/jgslfV4ZJKl7eSi?=
 =?us-ascii?Q?vWEqih3JxcagwUFEQRf0WOvbbdF2PZGxrHnnWLWCHqYZcPubp/OjHCy3EMwq?=
 =?us-ascii?Q?bi6GcJqLOSk9Pi4SXCIutHuXbwRYOFkSs5cC2huSWfS36dE0Gf16RD3lPY5q?=
 =?us-ascii?Q?6/1/g/8udlgU62jhNCwboKZ2x9LWvA5/AZJIISRvSn1RkaEvbkZhbY6TfG8O?=
 =?us-ascii?Q?wY1noEbOQnu7nP73e4qMcL4vZ6e7pjRvdrtKyHEB0JxtJpDBVExsAbWyAc/t?=
 =?us-ascii?Q?buC1xOAKxaLSMl6ZFTrJozzb2G7dZS0h0Ac09bB+qL3tKmjSorHrgWX06USL?=
 =?us-ascii?Q?GwhaPPtS5uulI/FElnc5LAomCEvOoeOwv1FSsnZ8lnTI+g8OcbanXrXIYu0c?=
 =?us-ascii?Q?zGtd9z1+oxNusmKya3bmHuGGZy76zVs95xgz1T9HxktRpAtkqZ5PSJ5GaX4e?=
 =?us-ascii?Q?i12fJgiw8oh8gAuQ9a6BwS5M9su0/LRjFkG8qbvTgjQnL9ugRBOUaa0kDRGI?=
 =?us-ascii?Q?n4z8+GUy4gM1ONoxgMzOm5dXm6oJgJGDhUfIi+3mIFiVCBAA+ZnqmYWacXtG?=
 =?us-ascii?Q?OhFOmzKAMPxr6/CajvPjX2h1fo89NZ/rR/8WjbEg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba38fb2c-3187-4adc-211b-08da9fe269dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 17:13:21.3336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d1PgsVC+OcUF1qQhR3EEG/XTysvRLGmIsfjsePFPKlq0nf/ni2nO+llMgcjS24uC9k6KMOjNkId1LDgx68vUeN3A/AmUP+gqH2ed0ZR8a+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10616
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

> Subject: Re: [PATCH v3] mmc: renesas_sdhi: Fix rounding errors
>=20
> On Thu, Sep 22, 2022 at 09:55:11AM +0100, Biju Das wrote:
> > Due to clk rounding errors on RZ/G2L platforms, it selects a clock
> > source with a lower clock rate compared to a higher one.
> > For eg:- (533333333 Hz / 4 * 4 =3D 533333332 Hz < 533333333 Hz).
> >
> > This patch fixes this issue by adding a margin of (1/1024) higher to
> > the clock rate.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Despite the discussion about the comments, the patch does not change
> any clock selection on my R-Car M3-N based Salvator-XS, both for eMMC
> and some SD cards. So:
>=20
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for testing. I have incorporated the review comments and send v4.

Cheers,
Biju

