Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02E397B4B99
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Oct 2023 08:45:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235526AbjJBGp3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Oct 2023 02:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235457AbjJBGp3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Oct 2023 02:45:29 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C1C4A6
        for <linux-renesas-soc@vger.kernel.org>; Sun,  1 Oct 2023 23:45:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4j7Fir1DuopnwTX3EaIIkzxS13MYW6qH5007jTkRu5OVwvUw7nAtqMoyD+mjAEJwsPzcQIL5rFl5U/Id41ExbXiXmlXpg4dct2UZ5gcDOtSXhJ8aFyOhQN6gvLk+4GjspFffLV4XLcj8TmQPwKBI84KAkqCO9zA0X6f/7L9TSJST5naJXJD1QomcqbIngMk+d7DHjWuWDcjch+B3oyXG1X/weGTDuxYI51ZjbVIa0NEmq6xZQiY+CH07RU0HMoXnYEnXSn/7bgioIr445dD9RLpWybDozF7gbP9I7jKiYNt/AVrJOgLUnZY5WAFfVuvTOi1IvnN5H59RTBHdl51bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIen/nwRQewcm6DuzG4I/Qqx/UxFNMH/nwEBRYDc1iU=;
 b=OskBz+blGatA5cVubPNyUlzRXAi6FntAw+CyesuflpbxnmnnJhrYXVGBEbuz4F1XND4730MsAodKf85obsmI/qO4pdE65inhsszKDeuRVcV0deymLqdRLLuO8TKLKuJ2JlA3/XrS9ay1v2EvZvUjl3OCSzRevSQWjSdzfafiqBXngwC01rPTIJIxE8H5fgfXeABITbuObpsyExRzdSRfjVcaBrW/AGfzJGc9BIGEUoW36yy5MBJOOoS2dQ3YdC6IubIMnwEGcEaWN+QnGhCZEkXOStjRYlI0CXjNDHaRcvCnWy1bm6VzHoWk7OzXCqj+fa459qvYAzPffg5esj3crw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIen/nwRQewcm6DuzG4I/Qqx/UxFNMH/nwEBRYDc1iU=;
 b=REmp8rZTP9IOJGw0tOmWhoB04rYIW8OJ2fIxmHEcXjbRYybn6vGSDGeMDJb1g5Ib/cZDe8WRXqYUFUJwU7V2EuDbw/rMjZDLLDFffxPQ6+N//radGLR0VXVBU1Upi9gmhwoQZUmJ5Vqq63PKU0+u1jLBmgD5N20K7TJ/6HjX5GE=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYCPR01MB11289.jpnprd01.prod.outlook.com
 (2603:1096:400:3c4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Mon, 2 Oct
 2023 06:45:18 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%7]) with mapi id 15.20.6838.024; Mon, 2 Oct 2023
 06:45:18 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <maz@kernel.org>
CC:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Yusuke Goda <yusuke.goda.sx@renesas.com>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Hai Pham <hai.pham.ud@renesas.com>
Subject: RE: [PATCH v3 1/4] dt-bindings: irqchip: renesas,irqc: Add r8a779f0
 support
Thread-Topic: [PATCH v3 1/4] dt-bindings: irqchip: renesas,irqc: Add r8a779f0
 support
Thread-Index: AQHZ9PUXIPLyuFB3+E6X8zQpHlgsDrA2C9Mg
Date:   Mon, 2 Oct 2023 06:45:18 +0000
Message-ID: <TYBPR01MB534193210976F3274EC31622D8C5A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <87fs2tefhj.wl-kuninori.morimoto.gx@renesas.com>
 <87edidefft.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87edidefft.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|TYCPR01MB11289:EE_
x-ms-office365-filtering-correlation-id: 4884f4be-2776-4a77-2255-08dbc3132438
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mqdrwVEwScoWCoFbnIFQO/sRATyzpbEIhPZ3q5tYLYsGj24a1UNQmbXeavr/zj0KWsL9UreY2GEVT7sLshVz4j4GXPHTehf0cPtu01t4XpF0i2PPD9OWUANLZ0pWSsJV+eB9Ja3HtOUUW3MxGN+XT2myROH4b0PGkHhqQ+wyyda477tSkhBMu2OXVZk0j9P9/Gq13awX+ZWvW8lmdwgAD01e6fvya7VkNfk3ek5Zy3W/AF4kJkmZWUoHS4GCNRh7QZgxJAhpN1Z0p79inST36HLu7ILpbRWGwyUYDTkaPEWXkkLCsbIDtZvyKMw8/4ogdywu+7Zgdl/oXuNDUOX3xs8SRvmh863pzvaevS+Vplal2xYM31sYKoOtsCXNr7D8dNfN6EAV8R0MUgaQuNh/EVMf7BxM3Iq1gwo72fnqObsGYAmVHuyfKR2I40d+exj/nl9nNWUInEggsk8HuJ1/4Yd/agcKMDilORLtuizVfW70qZWbdAZw0keBjHLUH5XljtE+RCVSbzoKlZoq/3aFjbvwJANHp1opkfZCSYRs7KHcqbBAEn5cCVE6PHZDprdcK3T6NUZFdoa8VImBx/OY9NzSuigx99550VtFvBnSNlLh0hPJ86Ao3c/v461s6EwM
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(107886003)(478600001)(64756008)(2906002)(66476007)(316002)(110136005)(66446008)(66556008)(76116006)(66946007)(55016003)(41300700001)(38100700002)(86362001)(52536014)(38070700005)(5660300002)(9686003)(4326008)(8936002)(8676002)(7696005)(6506007)(122000001)(54906003)(33656002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PBdVljK55EJ8apv+nU4FWLXuIojAlk7lCYvNh1T9+K4B3UIwvpP6jqLL6OaU?=
 =?us-ascii?Q?ROkT1DLB//u30ZHClT5060gge7U0cPcJVGX8m/jFVL90CMcQU6mtqzroa+TA?=
 =?us-ascii?Q?lgfB4vJvj6ZD+D9oSv/yfWN/GCXuiJK3ilE4lsUU2yXPW8SJPXiW3+rgpowC?=
 =?us-ascii?Q?evX//tF+gKDe1PvSo1fOVNUNvtrcsC1BCivTrI4duCYuy4Nz859JtT9+/Rte?=
 =?us-ascii?Q?CTaoynSlbh9acfs+BtCuKbOZnXFvSJVdSYPHzd2Zg4BAtYGMGPfwNau+EhzP?=
 =?us-ascii?Q?oeTJnHk29ji7ZdD7EDAoaF52sZUSvbgByCvY9uXJyBOW2bB/k+JExd8IJ/9h?=
 =?us-ascii?Q?HYZEGjX58gvFC1oZ9pImBlJqDCrHgrxRs9uHIq2aRXTXn2fhEMdo/GpcjwlI?=
 =?us-ascii?Q?EgjyOHj4TiUnV2qEreSHD1bDx2y66i3tRoNgBQcI9TNG0nh6/935+7AfsCoE?=
 =?us-ascii?Q?BgkdgamKch+voTvmYS4pm2Ecwfwik2u4Gy9brS8cT9p16TWpwTeCYOhTnZ4p?=
 =?us-ascii?Q?Wupsl6YCcnyVcx+gTIH3iV/3cJbyUKLEb+KclEjBTCMF4ChUcbgTpFfddjdN?=
 =?us-ascii?Q?M5rdNRMl+FIvKYcPa1MgiS/P9tVA4xbQHtc5T5JZdUQbIwpW7oLieZ2IAjoR?=
 =?us-ascii?Q?Eknb0zDCu3+pE6b4aSsaSdNPwijHwI3rpLbV+bj2KmjZJgCY7uQuDmRKJIXO?=
 =?us-ascii?Q?x1zclNLefWrv0LDrltb9NRnHh4YGRGd6777Zpfq/FMa772kEJ0dweZbC6/Cq?=
 =?us-ascii?Q?0EgPqE/Y1dcdavNGqU4Bs1HvzIGBnUi2kCGTEw9Cfw2Ybj4AlZkyTXJyFGP2?=
 =?us-ascii?Q?Yg8BQBsmQL5sYjz/Rov50wJBC/QJYtaaA93BWue8DDuk7KHZeUlCYQzC1MNq?=
 =?us-ascii?Q?1RreWgyw52lJf3DgyfFMaBAjwszKlddGblhpbAXZKDYwHv8JifSmREjKfQ83?=
 =?us-ascii?Q?GhhbDxwiaSTFogBiBgmthoXxcKpwboKq3571updW9VSU94ju/DHMRbCwspin?=
 =?us-ascii?Q?003VYDjxBVoD3QKCLAlym3fEmQXbrdLTGhRr2+rQuE93GoEZ8Knqs1Z4bA19?=
 =?us-ascii?Q?HloLRQxUrgsZNu1tcW9UTYfEWtRwsF0YKxmyxROfNy6ifa6/5Pj6cUQ0ZbSU?=
 =?us-ascii?Q?U/khl9N0AVtAAooeAWm2ATmpeHH/R8XAQm86N9AmMbdQplNmnPLtU2bMqUK/?=
 =?us-ascii?Q?bukAtHUIOAQM8nX9qox2goIPZwaPOv83gn0c5BaTXvhwsbSrdsABl5mZVtDe?=
 =?us-ascii?Q?OvcGFDnB+p2qtxbdzZ3EJO4ZmPyqId3sNzp2QSoCyAVUmwbUAGowpvov9eM2?=
 =?us-ascii?Q?EiC6gl4g5Dkt1/Lbst9ankL8D5uCqrk+cVqPZEo5uXbLgpqGEaINZi5WY/8f?=
 =?us-ascii?Q?AWwPKs9mRHMcb9bMYZv6Yy8hlSrHvvknobZniDtfnyxoyTYkmC9I4WjAxJaZ?=
 =?us-ascii?Q?rL9j93XOoj0HZhNCNn9g8ES47PVoPcFSvtJ9CVZNNOEe+g4+OTc3LCx9R3St?=
 =?us-ascii?Q?9Gzmy+DG/ZmubQf9oqvu7bSXg10BgCfWfzybHPbDrHBKgHdgb5Jt7Uy/JFaD?=
 =?us-ascii?Q?VoaXaZF0kMxJ5msLfRE8jwAWMsfDJ+XtEAsHomQ5KYqbinqbBcYy0wqT+Li+?=
 =?us-ascii?Q?JCNSfY0YTHdLZO5V2yd8NYxgcuugikiOvUxwuAZ+sngEpHD9G0UK4tIPBBS3?=
 =?us-ascii?Q?2rakNQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4884f4be-2776-4a77-2255-08dbc3132438
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2023 06:45:18.2357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MOpWlT44mQsVnd22wYtznpyedxyxcIr86AkfsHlLK/wUSxO5/82WKS/6GMC2Vjm/OnFvt7d1YEXh+1WV98yEOCfRChnFSMK/gjUjEVvWdBAWLJXGbaSKr07BjP5txSrU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11289
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Morimoto-san,

> From: Kuninori Morimoto, Sent: Monday, October 2, 2023 2:56 PM

Thank you for the patch! This patch looks good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

However, I have some nits like below...

> Document support for the Interrupt Controller for External Devices
> (INT-EX) in the Renesas R-Car S4 (R8A779F0) SoC.

nit:
s/INT-EX/INTC-EX/

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  .../devicetree/bindings/interrupt-controller/renesas,irqc.yaml   | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renes=
as,irqc.yaml
> b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yam=
l
> index 95033cb514fb..b1f3e7d7b88c 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc=
.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc=
.yaml
> @@ -37,6 +37,7 @@ properties:
>            - renesas,intc-ex-r8a77990    # R-Car E3
>            - renesas,intc-ex-r8a77995    # R-Car D3
>            - renesas,intc-ex-r8a779a0    # R-Car V3U
> +          - renesas,intc-ex-r8a779f0    # R-Car S4

nit:
s/R-Car S4/R-Car S4-8/

Best regards,
Yoshihiro Shimoda

>            - renesas,intc-ex-r8a779g0    # R-Car V4H
>        - const: renesas,irqc
>=20
> --
> 2.25.1

