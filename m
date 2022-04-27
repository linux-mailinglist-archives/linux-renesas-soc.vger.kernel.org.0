Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F53512204
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Apr 2022 21:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232465AbiD0TGW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Apr 2022 15:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232402AbiD0TGM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 15:06:12 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65EDC8A317;
        Wed, 27 Apr 2022 11:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kV2Ib87sol3I+sb9ovsW1nDtwLJyosIgcoROQUqaVEnQQqsdtLBFuUwFfXdtBpotOaE8SMF6NM05EzKEbUy95CTJYwIoQNreM0QDmocFrBEa8ip37VzR0yWlbRW0aIFNIkJyO/OTepSjkCAJr1oUU10rameZJBo7rknkHtV2d3redwt8UXiXQQm6+YQjUHKWR/uuNdvwEFA/Dh8YLhywzNdykuOdGm+bYu/woo3Csbm6e35921CtE9MK9I+iOFbBWxETnHgdX0bIInTJKCp+a/U9MtO//e4RoLbdmHqB4I8bq/AbSujsrjCYQOQ4/SiIGPisXqY/NO846ltfLnNpGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcxtRI2FiVXRwT82nmnfdAaUWVafoD1Zl82qtYQufaI=;
 b=VvkRJiDTgzixmXvgA3st7NLzxJIkfEznXtYA0zrdeHVQAVB1O7Rc1fAthy23bBDSxgm43uDfauxwAhp2YuVf4xdBHNFEfK5qiHgB8CZfLByuWcOhyh5j5onj0xMU37QdEUV6zGtYneRY9UfdoiuEKUEE9pkbgMaDqpXQdj4U+7uWyTb9s5E3ZBO5NWMYBjs81t0yVrl+FrK3Vra4Jv9BNHzQFzkndkQXqB5pAQdYZT3OSOs01cLGTdp9IPj//MbIZU1nPbfKE2wPN7Ou4H6g4BIKv6Q7K4W8eP5+a3C1ry9ynzxqzZTrK2hICpXa6UXyj6vUkQ5lCf76KZLq0koveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcxtRI2FiVXRwT82nmnfdAaUWVafoD1Zl82qtYQufaI=;
 b=MA6EMeIzzs7/yaY1lj6Dbtt3TAMCl+PTkIivVVwNBOCyYaiGmM3+85moWU6UH5BZlFJlnAuP6NtnEWMbK/i1BR7gnwg0x+BxqStBXDijcJToh2icMElDVWKSQW63qyKf+kkWsRmduIgtt6xkYQPCpbHAtP6apeJeecWsHhyGbUo=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSBPR01MB1478.jpnprd01.prod.outlook.com (2603:1096:603:1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 27 Apr
 2022 18:53:14 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%6]) with mapi id 15.20.5186.024; Wed, 27 Apr 2022
 18:53:14 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: RE: [PATCH v2 12/13] arm64: dts: renesas: Add initial DTSI for RZ/V2M
 SoC
Thread-Topic: [PATCH v2 12/13] arm64: dts: renesas: Add initial DTSI for
 RZ/V2M SoC
Thread-Index: AQHYREzSzs0MUgapA0emIkvOLlfemK0Cqe2AgAGb3zA=
Date:   Wed, 27 Apr 2022 18:53:14 +0000
Message-ID: <TYYPR01MB7086F756432C1F67E76BC6CFF5FA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-13-phil.edworthy@renesas.com>
 <CAMuHMdWVtJ-_KHUKCsuahhqP1YUwJGLDeVJmvBA0zuA28nwinQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWVtJ-_KHUKCsuahhqP1YUwJGLDeVJmvBA0zuA28nwinQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e40e8240-4c47-4a60-95e5-08da287f2f0b
x-ms-traffictypediagnostic: OSBPR01MB1478:EE_
x-microsoft-antispam-prvs: <OSBPR01MB14782168159E18DC15F6FF87F5FA9@OSBPR01MB1478.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D+1ORBHGI8WL2CxJwkmBiPKqLas413e5tBxR5deNskD0EPgLydQg3TkO4A9eLeyRl+l2MQi6mbmGVaBy4GvRE6KtGo19BBcwpQRMStNDoZAsfPbvrmeUYMFRutKW2I/T/pS0Sw+WFYzzeyCMnD7gVlj06/VRptHB0fBLTvOnpXommiIDKiFbfbv2ax7R20bQAoufBHTph8qS8HZmN3dBuc7mg4c/MLkhKerfUAnqx6x33Cs06RHYtjtMwBo2OoZOO9Lm6rLKeUVZzi6GkWX6lYnhus0cGi1giwE2WiuwKHOOymF1MXHFszZZxe0pyfYrNrGsRcdILsxK7G4SQ4JViBeEoEHkFO6YwPGabU0Ljm1EKiC9S3SAzDxsbzULbXeFXjRagGZo/5ec3g6kOl1ZS6yxb7Ok8YrPDaPjR26ku3yald214QRqWA+A80IkR7ttCJB87Ho2aElkdqA2yLmm4gDwjvM56y5zV6xDVrKt6AyzVRSkb6L5lckApH5cHN7BunuY2rRSllDm5kdAQUd86lobPJRPkashaskOMf2WO4u+yuNxee2p2QpEBVlLg5ElhWPY9bCh1xH2cMdJ2Cc6TrkhWKmtSIOAYyrwcOnihMSmmuaKAF/1cfBmCbd4PEJvbD8uYN8tIo9S17M3XchZxD6VvLMoP222Tp34uH3uMZtys4JkJvYf2P4ZQzZpuS+zuLmxH6YBH2OaH77kVgWE6sUzkSArHuHV8f8JkKav2me4vb5orNs6SPUdxPlpkxKBLAnOiChDw1q1YqZ3Fe46eXCYEN8ShUoQuXz2wXrYJkA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(8676002)(66476007)(66556008)(76116006)(64756008)(66446008)(66946007)(71200400001)(6506007)(2906002)(4326008)(86362001)(38100700002)(5660300002)(38070700005)(9686003)(44832011)(508600001)(55016003)(966005)(26005)(52536014)(8936002)(122000001)(33656002)(83380400001)(7696005)(54906003)(316002)(6916009)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iA74H90uxokEgVOzeGTdCRFkjdkd7ZCsguDmScxmXhdBi5yv0flHIY7BH1ya?=
 =?us-ascii?Q?9odSsSn+SC8ER64y0ALoR/9g+9yWw/iJFm7VxA+Rqe6uMjz5wjaNIQ0LRy4E?=
 =?us-ascii?Q?JO9yewiLdE+rWXZ9Ed6R94BTKWCzFxBR4R16iM9+3zbvHEdEELPuL0uj5/S1?=
 =?us-ascii?Q?lv8cXODkQAao8aQ5BR4BDJE8AxbrVFp1o7UMoTu8ggmkUQGPOxV5PQUQf2UL?=
 =?us-ascii?Q?eCgGkUzQqnVPrMn61Dzub0nd6Y3TB/0QXLRqyWjWnvRvZBQFwI0FJED/Te2r?=
 =?us-ascii?Q?YmHMFC39mBCXevoEmFz5Fhvi3U4irJNGmUt2xP8LM4MYg5x5UgzE70oiZ2I3?=
 =?us-ascii?Q?Jelk7otSih9fDiLHefNGdRxJxmhzIJ0igfWct1qx0mxRIwViRPOocrbhQ2qd?=
 =?us-ascii?Q?sFUi92sl62uqHhSWdf21f4jaKz/kDVA/zsZMsOWPYE5QMXt7DILWPktSSCd2?=
 =?us-ascii?Q?yHmRS+vConHfzsSo+HA74S/ynRzuSNscJ6I/vsAm2aUI7ssnj44AytI31wCS?=
 =?us-ascii?Q?8j1yiG5EXVf4ZsgMEV0bO9DluQuKfPSYNr7F9Q3QzRMtI+MW5IytIVG4OkVS?=
 =?us-ascii?Q?X5OdfXxVd5TRLeBfxtG4k7PlkeiyqIh6kr7tODtYTyATzrqAOo1+x01AaeII?=
 =?us-ascii?Q?0TDlqwhtA8U0Z9V9GIw8FqZz2HijFsmttzfn5qbJgFncEfEaWU5iphyHUseG?=
 =?us-ascii?Q?cpSYYIFxOYoNsiwIoos/PZOa+LYHtqpRyG6nr1IlXmjEC6r8Q9pARiYM8e7I?=
 =?us-ascii?Q?PuNqvv0ZadshyGUg8bGa2IxFuFCt7E3EKuE/G+Nhl6INYNphTEfsKfpYfRGi?=
 =?us-ascii?Q?4IkU+KMmsQ8EhYLymHvIOYKZ6J4vt9tPCbiWJy64LbNyQu/6g6fyBEhhezDr?=
 =?us-ascii?Q?Q8waG1Z5SgbguX35qM5uIAUiJklDJkSfCVPOEoXuCODu+W1YxhE6Zm2OeLZr?=
 =?us-ascii?Q?LbvDhl14Pwls0UI6pp2ly0iYoHMDGUklMtE9P3bmnVi/OF1HEeugAjVFvv+w?=
 =?us-ascii?Q?XR3D2AMlqgYB3hRLjzDMHc5NVeYrHiTShnyB8Yflm5l5EvjHyVEel2Nf/ua4?=
 =?us-ascii?Q?z5hepN0qRuVXb/fzgsvDOvp5Ek4dpMFzQ7RGjPfkyiux9DbJT9bb65aUL1WQ?=
 =?us-ascii?Q?8n6gQJkc2KjAoak6TJNxch6axlk6KmcRfCqG2963LWlKDXXMW4qQmQR/fXu+?=
 =?us-ascii?Q?AePjbLZ2hlS4olABycvdAR5h3s03NXudpJePGiZV8JEgLMtSN8rMIRWip+ch?=
 =?us-ascii?Q?TZD5crULjZTlZT/z2OvlV54+ehPZk53vFjs3w2vO8jHsX9qEhmD1tYtv4zbB?=
 =?us-ascii?Q?Zu3I+gMwy9NDQiFWiFGNKxBPrSUkT1dq4SWY8Y1V6g9l/BlBqAmeeA/ewKxF?=
 =?us-ascii?Q?TOaIHiikU7/IlzTcamw0dbAfaFh6FyB1hMcuZ6sniydplx41QM9GwqTHAH2V?=
 =?us-ascii?Q?2M5w8BYJatSV6VOrwye82YfHGMx5tCcdPbocplvHztX6W+6N/Gh6LL6dYoiI?=
 =?us-ascii?Q?fXbUbkwh0nq5jazGQq9STaYmt8SuJ3CT+8q7tU8sBWLsGxXEmFEqRBKGhPhG?=
 =?us-ascii?Q?dbM78pF/RlIobZ3vVj3LWLU3Kfs5mzwIZdcYupBaQcOiqmXHNqHvCEUdMQ1o?=
 =?us-ascii?Q?xxUEOekMSh9ouVO9H04lRg3gZJ6RVOgYREodyf4PH0EPTi1d7S3bIdL0UM6o?=
 =?us-ascii?Q?jONEdzDkuOcL9yV86DW+gfuGNwzYdqxBpj77La/8YmhR31gJAB48NE3eB1GH?=
 =?us-ascii?Q?ZpZlcKjts8q7dmpXR0xVcI6COvbyYLA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e40e8240-4c47-4a60-95e5-08da287f2f0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 18:53:14.0967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +bnPFndi8fbWVgtXCvs2VA6beJ8J8jkeFNOOEU2Jae33/9STERQeHgG2TJF6p1s6GVkJwN2dOGupvH9MMqJtMK173ENAQnSHfXF07Jup3f4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1478
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 26 April 2022 19:13 Geert Uytterhoeven wrote:
> On Wed, Mar 30, 2022 at 5:42 PM Phil Edworthy wrote:
> > Details of the SoC can be found here:
> > https://www.renesas.com/us/en/products/microcontrollers-
> microprocessors/rz-cortex-a-mpus/rzv2m-dual-cortex-a53-lpddr4x32bit-ai-
> accelerator-isp-4k-video-codec-4k-camera-input-fhd-display-output
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Thanks for your patch!
>=20
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
> > @@ -0,0 +1,99 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/V2M SoC
> > + *
> > + * Copyright (C) 2022 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/clock/r9a09g011-cpg.h>
> > +
> > +/ {
> > +       compatible =3D "renesas,r9a09g011";
> > +       #address-cells =3D <2>;
> > +       #size-cells =3D <2>;
> > +
> > +       /* clock can be either from exclk or crystal oscillator
> (XIN/XOUT) */
> > +       extal_clk: extal {
> > +               compatible =3D "fixed-clock";
> > +               #clock-cells =3D <0>;
> > +               /* This value must be overridden by the board */
> > +               clock-frequency =3D <0>;
> > +       };
> > +
> > +       cpus {
> > +               #address-cells =3D <1>;
> > +               #size-cells =3D <0>;
> > +
> > +               cpu-map {
> > +                       cluster0 {
> > +                               core0 {
> > +                                       cpu =3D <&cpu0>;
> > +                               };
> > +                       };
> > +               };
> > +
> > +               cpu0: cpu@0 {
> > +                       compatible =3D "arm,cortex-a53";
> > +                       reg =3D <0>;
> > +                       device_type =3D "cpu";
> > +                       clocks =3D <&cpg CPG_CORE R9A09G011_CA53_CLK>;
>=20
> CPG_MOD?
Ok

> > +               };
> > +       };
> > +
> > +       soc: soc {
> > +               compatible =3D "simple-bus";
> > +               interrupt-parent =3D <&gic>;
> > +               #address-cells =3D <2>;
> > +               #size-cells =3D <2>;
> > +               ranges;
> > +
> > +               gic: interrupt-controller@82000000 {
> > +                       compatible =3D "arm,gic-400";
> > +                       #interrupt-cells =3D <3>;
> > +                       #address-cells =3D <0>;
> > +                       interrupt-controller;
> > +                       reg =3D <0x0 0x82010000 0 0x1000>,
> > +                             <0x0 0x82020000 0 0x20000>,
> > +                             <0x0 0x82040000 0 0x20000>,
> > +                             <0x0 0x82060000 0 0x20000>;
> > +                       interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(=
1)
> | IRQ_TYPE_LEVEL_HIGH)>;
>=20
> clocks =3D <&cpg CPG_MOD R9A09G011_GIC_CLK>;
> clock-names =3D "clk";
Yes

> > +               };
> > +
> > +               cpg: clock-controller@a3500000 {
> > +                       compatible =3D "renesas,r9a09g011-cpg";
> > +                       reg =3D <0 0xa3500000 0 0x10000>;
>=20
> Size should be 0x1000, according to the address map.
Yes

> > +                       clocks =3D <&extal_clk>;
> > +                       clock-names =3D "extal";
> > +                       #clock-cells =3D <2>;
> > +                       #reset-cells =3D <1>;
> > +                       #power-domain-cells =3D <0>;
> > +               };
> > +
> > +               sys: system-configuration@a3f03000 {
> > +                       compatible =3D "renesas,r9a09g011-sys";
>=20
> system-controller@a3f03000?
>=20
> Pending acceptance of the DT bindings.
I'll remove this node for the time being.

> > +                       reg =3D <0 0xa3f03000 0 0x400>;
> > +                       status =3D "disabled";
>=20
> I think there is no need to keep this disabled.
>=20
> > +               };
> > +
> > +               uart0: serial@a4040000 {
> > +                       compatible =3D "renesas,r9a09g011-uart",
> "renesas,em-uart";
> > +                       reg =3D <0 0xa4040000 0 0x38>;
>=20
> Register offsets are documented until and including 0x7c,
> so size should be 0x80 (which matches the address map).
Yes

> > +                       interrupts =3D <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH=
>;
> > +                       clocks =3D <&cpg CPG_MOD R9A09G011_URT0_CLK>;
> > +                       clock-names =3D "sclk";
> > +                       status =3D "disabled";
> > +               };
> > +       };
> > +
> > +       timer {
> > +               compatible =3D "arm,armv8-timer";
> > +               interrupts-extended =3D <&gic GIC_PPI 13
> (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> > +                                     <&gic GIC_PPI 14
> (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> > +                                     <&gic GIC_PPI 11
> (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
> > +                                     <&gic GIC_PPI 10
> (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
> > +               clocks =3D <&cpg CPG_MOD R9A09G011_SYC_CNT_CLK>;
> > +               clock-names =3D "clk";
> > +               resets =3D <&cpg R9A09G011_SYC_RST_N>;
>=20
> The three properties above are not document, causing the following
> "make dtbs_check" error message:
>=20
> arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dtb: timer:
> 'clock-names', 'clocks', 'resets' do not match any of the regexes:
> 'pinctrl-[0-9]+'
>         From schema:
> Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
Right.
I assume the correct action is to update the bindings, right?
Of course, not much will work without this clock enabled ;)

Btw, do you know of a way to run "make dtbs_check" for a single dtb?

> > +       };
> > +};

Thanks
Phil
