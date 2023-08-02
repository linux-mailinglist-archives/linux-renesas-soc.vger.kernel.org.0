Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F69276C519
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Aug 2023 08:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbjHBGAW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Aug 2023 02:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231845AbjHBGAT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2023 02:00:19 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2124.outbound.protection.outlook.com [40.107.114.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A6402121;
        Tue,  1 Aug 2023 23:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCX92p7hvbN7Qr3sw1v3ehi9jIWznckD3uSZVxVuuHgPw4/rnAjdgEgCq6oEftNvHpsasJyaqZ02eKWiL1a/zGI85vmN0D0JfqMWJX7aHRZUpG3S3HkxpjgaSMKeIADgMAcBzYOHSqmzWVGhNSk7ZEenXNNNn5UKab9UmlVk2HH1n+W4m1e1mgx2BhAl47kmoH/R9hehMxuzVmQBEDpBJtEZ4HksDGgDscFIJ/DF0UAfw1EPVwqF7KH9TL/zgRFl09D7kJ57G5qHSBXSla/XjuI6QWSk6Jj9BDfiG+IZMxiNGxc4StSPe0W4EPkDxDQgIwUfA/fqaXOsLSttSqMdrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddyEdHi6s5EyVPD3U5n4OT3l76+qoacTrf2WQKMTTXo=;
 b=BXlCTODC1o4MrTyCVXKvzwBEXM1FhJUNQNa2MA083vl01mLxmfrNUeIUIK3QJkWIxcGBcY6OloCuRw+YYiTZ8PKBAT1whoFVmzHgxt54tcJFfzUMgVVahgnws85fzXBd3t7iuBPJsAE9FN5ssRDXQ5yq+mTi1DLwHNxk9MA89on2TDzaOsPLODJcOkZlX4PE/JW+AukBhaDMEXOq60EQCFePFio5m2xBER1zVOcC8RSn491i4PdLoxFvA0klIf9IvEVszkpTuP0iasY5WuZiHTJxSjtG7HyJe9SnrFOQnEI7b1isCJjdOTIOQBijMw6l/n6a2HHNdxkyL0d13T6how==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ddyEdHi6s5EyVPD3U5n4OT3l76+qoacTrf2WQKMTTXo=;
 b=OStzORdqNcb/7Gpo8HwIh7tjFLfZLLdwBIz6TcAvl0zGXdutQqWO3nj4f4BgC/WV2cvRyE1TUx/6OkZ7gubNMParJ8F0a+ZoedL13MJdqJdtzqKVqbVgwtWcs9zZgJ6lawc5bmCmaUNnEX8BSgh+8fGcj4lBEFt01A9ERvtTpzQ=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB12050.jpnprd01.prod.outlook.com (2603:1096:400:405::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 06:00:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::8f98:d64b:f092:766%6]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 06:00:10 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Julia Lawall <julia.lawall@inria.fr>
Subject: RE: [PATCH] clk: vc3: Fix 64 by 64 division
Thread-Topic: [PATCH] clk: vc3: Fix 64 by 64 division
Thread-Index: AQHZxH/nY29jgoIY3EWGmcBmkjk2eK/Vy0OAgAC2zxA=
Date:   Wed, 2 Aug 2023 06:00:10 +0000
Message-ID: <OS0PR01MB59228C9207587374BD349F81860BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230801135552.386796-1-biju.das.jz@bp.renesas.com>
 <09434a37dacc7b8b0278d1fe26c16313.sboyd@kernel.org>
In-Reply-To: <09434a37dacc7b8b0278d1fe26c16313.sboyd@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB12050:EE_
x-ms-office365-filtering-correlation-id: f6d0b9c5-87c9-4d16-75c4-08db931dbb0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ssXCRpjm0dgPB732pT1CFkUwZouiFXYa+ucv6BElUrdcQDV6A1BJ+SwtRNkRxcKHodGJe657bUPwPowO7cO0Se1RRXJmp+vqsIYQeIpbRR+l8B/0HdI52hsRvcId5AsCMQawo6BHLp2/GQsf3UezKe6F2BTV/UYnRkqMR2Bbj25UMXpP82PPBGCbdoR4bauFovcItxgtYWcGYIEIk9fv1Y3nq3PaTRxVYhEOJd0f9atyknN6bKWZ/7nIVbCTd9SfaNW2KoHdk+jvaEMhjZpGuzy1pv3m4Qo/khHIAB1fiZtWrf5lY5wJJuqZ9p0njiGKeqfSnzABAgI8yJuumZe+uTi1wwLCb0xek/FXmBydR+84IDocxOrNFx6LJEwCPx7baFzzeYPkAABdq6q9o3kDrKdS2DD/hzUL8cqLEoM0OVwe4fN4BHGVQxy/sHerbHEcbOn5TeIirL9qKPWFXazZRaPAyvdh2/XZ1Li4sT8bw2qeD9vA9wAxjDFQwxaLmoaJ5G0qoYTNmO/5Z/R4QVNHmW3UUmr9jK09XMV3FhSmiIQr0RS8eIbvCby7srI8JpDs97vIepQ2awH9MD9XNT+/bH6M6kDX1SQTIiQYVKmlCOaB2kJW0DBIoA9giZi/fLmu
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199021)(66946007)(64756008)(66446008)(66476007)(66556008)(38100700002)(122000001)(41300700001)(55016003)(52536014)(4744005)(33656002)(86362001)(8676002)(8936002)(5660300002)(71200400001)(9686003)(7696005)(478600001)(54906003)(110136005)(83380400001)(316002)(4326008)(38070700005)(2906002)(76116006)(186003)(6506007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v7bIlKgN9LXEcHSvezhC43wbU4+bzA3J5d2MME6RBvSMql3vOf+2sevZ0e7D?=
 =?us-ascii?Q?dh+kgllKYFBBe0xkS2Apv487ktlOqe5PTB1Hk36Gpn7f7LSx30vs4D3oHqzN?=
 =?us-ascii?Q?GmqUxqzDeDfRILdjQvZDILHVumamKDh2xPQLBBBVb2M2VofkU2bUVcQAkqCS?=
 =?us-ascii?Q?Ikss3UFSZ4JvFiESmk7y851LWLYR02iwx5zV6B+KUQWTdCc8EAEqEGK4Y3VB?=
 =?us-ascii?Q?ay2852DrgzyGVf2BvSnXGlCOb96u4FjRP0MevVeTJSsr7cLKXSrzZi13Qx/S?=
 =?us-ascii?Q?xpUi5xLABTJGV4Z/qglTc6p0GClDSu/whk9RHafCPiPWHQGNld1ZYukJ6MGz?=
 =?us-ascii?Q?wFkuHsEB1/zF6jKDAnxEGbQNvgAhWFiYDVqELrk+BnQn8DB/QfWTw8PBMuA0?=
 =?us-ascii?Q?AQJMDpNKUePV/w3r8PYyylF1nPxay0Cz1lfW4ePz1B+43vPCHyko65V6+u8k?=
 =?us-ascii?Q?iiOEF5fpawUnYexoS3UHkrUYMlZEFdzI6xP12y29U7cWLIEUxVPIGXCHT5I1?=
 =?us-ascii?Q?EPVdkZ9GTcAicNBqCjf0nPlXbaIWsFHhbFm94/yLnyMlrj/y7E73Gm1Sdfqt?=
 =?us-ascii?Q?/hBL4v/gpvq+ohY29Tz+2sOaWR25B3HHURLz36j3fHlKVhjaK7TK6ySyHQN3?=
 =?us-ascii?Q?D8SFm/M4F6S3lsePJQw1NVhJ0LE1dyah4jjXHFlsyRQS2091r6Dm2GkZ25Y8?=
 =?us-ascii?Q?SqDjJlZNb2bYFjpLVo//IKOTG8PLMcxsKv/Yqxuw9STJ1Nx2HpdpMxt5z+SF?=
 =?us-ascii?Q?GpQj2MISL0g6hu+36Wjqd6pOZMclmn5ElIxXFQM8MqOYD9ByyOckCTVIQOuJ?=
 =?us-ascii?Q?XRHq+7+N3Jsj9iOYDG3yV+EXDo/uH+dsf+13nihLW5ZtUWeIYYOGU37YcE7Z?=
 =?us-ascii?Q?PkzEoyGB1wo8b6qRPuutGpH28A/si2D71qy2WKbrJrxYmrf856OgGDwyomJ/?=
 =?us-ascii?Q?IK2nCsOVWzyib6VZ8yaoXOqLLqCR/N8xH9KjahJhzRuy+D73lWqeWHl1BbKo?=
 =?us-ascii?Q?24gIVql/0bHMEBo8erI6cfBQz+0rS5VbZoQCmLKIaYq7UlFDLOvFlGuVWLTv?=
 =?us-ascii?Q?szEmvpxIUcl7DVAbsQzfZb3hth4ga4udB1tcYwI1oMZh4mDfO+rW/8KXwn5D?=
 =?us-ascii?Q?RkUbQ7Z20rMTWvgbMzOm493bKqjwiQ6xBmJkC8gX+0CNnjtvSh87c+8Yu4qh?=
 =?us-ascii?Q?7egAfS5s1G1JLz/PKsXioj/zit657YmWf5U+bLRpvzqKGdDbeaptknCoHca5?=
 =?us-ascii?Q?/3SAY6qKzJGsYBu5XUj3ru5bfEZx7kYVJGn5+jF9+jhhTtpBJkcFxU/URBAl?=
 =?us-ascii?Q?lRw9OkWS7fEbkFy/o5pc1/n4ghoA6Gv10xdauiT7HYAcJnrsGdkSphQmf1wy?=
 =?us-ascii?Q?yywsX652n/nl3FzuyKtaGOFZwBs+RzB5QgTuF+T0mZu8mGy/suebSrq+utbe?=
 =?us-ascii?Q?WmNm6AHaW5ZdPPsP1oA5qs+RKl41EU6EniDJGo376VrO4BHpAfEbw13akE8f?=
 =?us-ascii?Q?bpaTZPdh2pn5m4pDBD6l6pR86l1xHVEMhZ8rtmo/z2e3lSQO5tNymJ9rW/Tk?=
 =?us-ascii?Q?G8gH7OXxopwYMJQyliIzuQU1XQp1GZfgklOMvaHT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d0b9c5-87c9-4d16-75c4-08db931dbb0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2023 06:00:10.4219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1V437Shn5HR3RYfvpHFNEjJy+W9y92t6x4O1MM/awBava74iuhBqM5WTWXci9ZImfS9yyQs+kozlBmsVqpbliSpvrKUQVq2BztDhJElZkZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12050
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Stephen Boyd,

Thanks for the feedback.

> Subject: Re: [PATCH] clk: vc3: Fix 64 by 64 division
>=20
> Quoting Biju Das (2023-08-01 06:55:52)
> > Fix the below cocci warnings by replacing do_div()->div64_ul() and
> > bound the result with a max value of U16_MAX.
> >
> > cocci warnings:
> >         drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does
> a
> >         64-by-32 division, please consider using div64_ul instead.
> >
> > Reported-by: Julia Lawall <julia.lawall@inria.fr>
> > Closes:
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
>=20
> Any Fixes tag?

Yes, the below commit in next.=20

Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver"),

Not sure the commit ID will change, when it is applied to mainline??
That is the reason I haven't provided fixes tag.

I will provide, if it is required for patches in next.

Cheers,
Biju
