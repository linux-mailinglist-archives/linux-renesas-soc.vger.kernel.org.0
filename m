Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF176B0B9E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 15:41:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbjCHOla (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 09:41:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbjCHOkM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 09:40:12 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2116.outbound.protection.outlook.com [40.107.114.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CB78D08F1;
        Wed,  8 Mar 2023 06:39:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MR8zuFs8tvtDV//iIG0jhTmDvpd+ypjfL1zfrTQGGB1OrLheRsXDVozoiGoQZnZqp+enq2IdroSltWRBihCiK45nKDCJOKr06XhHDT8Gj2KvbQG+YF6IlY4cnt3JwEW1DW9hqYrl5VvzgOcYYYKJ8hQHU5M5lPg/MKDrPtnMAb9WEIvmeFkQ/7+boCxmjxfbldjFcda1xaKyb3HF9PFxReR7Agu4Xq2f1PJeEAGAEfXzMuNO6SpfztfYkCyAB2u1Ii0vpQ3mU2ktordLkP3gTwgAFhSqwcjFfjGrKUEDXr5Grz2FKxoICDifoOcu2Y/69qRKM5MqbDaSWrDHRv4FCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4CJD/fi8u5W/i3uwRieLesnJvTMKOsXdXwKEb/8/p7A=;
 b=dQGyDccDOeJkz4o6n7Y1MTlAqm6YQUrfwQmpBMjgkmQ9TwrPUAEeU387v2nR4AVeFNmRMTc3402nPHqaJYXdKWbaMzNFNZ2ifkNDXRD8tQrMdkZHieBoIYr3xGQtYr/dN1OnJvFWRDL46F4reEW6HJalJMPc7AmPBcwslTMOx5D+6uR5Kf0g34kA0zxKPUnMXbDSIz4rYRWsAlUqC1zPH4bBTpCzJkPc4BJKxCtv7FkQmveBHCoTggkHYqr2LvQpb2eNpyUkQ/954SJ6YpsF2oCwCyUM69MRpo57whtPX/lDfW7gQXFEKOlwSANdxORp5sPM3UbaE/yCPGhwq7/nZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4CJD/fi8u5W/i3uwRieLesnJvTMKOsXdXwKEb/8/p7A=;
 b=jTcuYDYNnEy5op+sito89mvLd1b/ENkEeSnjvm3HSUosYqWAOh4H7ToXnibgLwSEMpxUN+YZ8fnLXVUod4vRScm6kRmwCcS/XZDRnwMCnHB1DJk+xWbp0Uy0R0gTOpaSlkS1VPL2SggX8fBEGdYya9FCUFyn7OfyVhK4GBcGcyo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB10104.jpnprd01.prod.outlook.com (2603:1096:604:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Wed, 8 Mar
 2023 14:39:13 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.016; Wed, 8 Mar 2023
 14:39:13 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Topic: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Index: AQHZRS0aT95BTvtLwUKgslaMkC+eWK7at0aAgBZQ9vA=
Date:   Wed, 8 Mar 2023 14:39:13 +0000
Message-ID: <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
 <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
In-Reply-To: <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB10104:EE_
x-ms-office365-filtering-correlation-id: afa62e82-5062-4f4b-15b1-08db1fe2e2ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p2HLmF9lGVRiYMayj1CVeV366dHeA7bMypguh1vNTAPIMbHqH0hGMqu1Sjti4XcEj0nUDvrmK6+LPOJBKTMI88L6Jy9lUTnXO+KGXdFBUZh10LIBoimYsI834A8TbMiEMptk8M1Hn4zwC5/rd5uImjLOTrjZuEnF5ZfhYBjkqkw2d469fa3hpx+3R3iVAXdGxL2piyvHB6QGerN15LYcxVRm64+HQ/Kq1p8/iDN0LfX7I/rdD2cfYLoEMk7iELsKLVySDLF0kryKrTh5pKmZhsW8nkGG7WaeVnYhux6APad0FgG9THWGirazfnioV1RCz/LXyE3Ju4S2v4rLAkRV2KZ+Fg0XFjuXAp+cXQNDEdJzelgMr7iuaWpyWKVn/0r1AcQoG3eaDEXB4Ta6M4pw8X8uPP6gKIrNuQ3J4OB2xRaCI09yD6+g2cfYaT3qsJpgC7V5Px7ikqcmplD2HlK57za+RnnJq0/n86toY5ptbOG9XZ8Tns9VYdlxFSZ/IMsFmsIc+VVfv/6uWp3dajT3WvvSknqMCIubI8rJzJbWB2YjhAfUQ+n42xtUdVINw+uYYdgZu6M/z3FjtBfPt+uM5eMAtl7kk+qdIn4Rda38lzhRJLLEpmUwMv5Z9/YiaBdga6o08VhVyh/XQIYDxFmyW9l44r0om5R0kf3jesw1aIYaejXM7kw75wWbDq5LPTpfyDywJ2qWnVOFuLIwA7/F9uLhbD2zscgky0Um6aor5rQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(451199018)(55016003)(110136005)(8936002)(54906003)(478600001)(7696005)(966005)(122000001)(66446008)(26005)(186003)(86362001)(4326008)(8676002)(64756008)(66476007)(66946007)(76116006)(107886003)(5660300002)(2906002)(6506007)(9686003)(83380400001)(41300700001)(53546011)(66556008)(38070700005)(38100700002)(33656002)(316002)(52536014)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WK1cb3VRkLj3rqMlG7Ti+diqTbawIwRqEiT3lOd25zjxaAALfBG3doThpOrK?=
 =?us-ascii?Q?j35Rtfr1bAKGpJl63wlkMvL9hAez+ADV854cya3MNVmEWz6gI72nsKOc62Rn?=
 =?us-ascii?Q?Mew0L4nhgUV+1dZIwtM9q7zeYfamF9KNEyd7k1TMMOkq7oXUBTEJ7jFIQHAf?=
 =?us-ascii?Q?9BaxNtBR0UbcR543CooAd2wvV289BtRcXSIix5AKWPNrg/x8UfpzS3f560Fd?=
 =?us-ascii?Q?8VatqxneoTvL8IkjkYO5NydFVnPZ04UedCiZU7IQBP1PUTgv9t8eJPpGy6tJ?=
 =?us-ascii?Q?duMRQOyo5YRQI9rWW3YwBa20ha0XDHNCcEb8spxkAmb2cVEmxdy7RI8xwnwl?=
 =?us-ascii?Q?01+M+eKv2Z4wrdPF2y5NVr7zrxVKyekDW4Q21a8vgCD1TFxrURLxNPe/j08c?=
 =?us-ascii?Q?UgjOrPaBAmw+cqKCOBc/RXJAprO0UOn+nFEG0axsXCCH4MlroqzKfB7Xvgfw?=
 =?us-ascii?Q?o1bY56xxlKPcKbSMdOA292OfpIywIVI3m0zIPX88q0QXSLtMTTVSziq1vhFZ?=
 =?us-ascii?Q?JNf65Pb8WiWcjOQXDpf7LhCnyPClZAq19uYkr5a1FNFkgS07ei+rIdb47hii?=
 =?us-ascii?Q?+TnCOFKWR1HQPGCor8kylVt1QbYtPjX7Xl472k2aQ93a38eVonvTkMvbor4N?=
 =?us-ascii?Q?r3+oSPGM7vamur1edzD6HFL8JKVIUogsvH9qURMywHiPyr5v3kZX9O/wtfT4?=
 =?us-ascii?Q?5OR4ZbRwNnUgGBFAljF8zWX0q1zhiIfNvirIZuk9UoC6UIRkSy0eixeWRphf?=
 =?us-ascii?Q?qkmUJMol41Hhv3O8Qn2Sg/TMHbJgZOEhgmZsC+Aj5uuloVq3DYNyBuA8109e?=
 =?us-ascii?Q?9XRh+xhJ3dSOWqCVBjCqiJCpW+Un64yGVdUzcxWikjr1Zo1JYPSlG0DAhY7W?=
 =?us-ascii?Q?ym9bUOpk60FEhXeTpO9GGYB+OYPfbQp+Ujw/Bb+3/pTZHuB/XC4RPgLTNHP/?=
 =?us-ascii?Q?Q2aIqdRIh4jinHBwDb5MLL8GSdGXOj3MoD4upSSrthEhrZ0HJjOUJvmcSlDV?=
 =?us-ascii?Q?Xm+hCeHIS31ttutz/duQF16yp0sMsbSqRBBkNvRk9ts1uJyB9iySbShpjenM?=
 =?us-ascii?Q?d4bVjPiolW1Ii27D1KTZ3Jx3Ml4v/vx7F89wNqqKzeIM7OcZ/MBkIcoFA0iK?=
 =?us-ascii?Q?0whpQmOLKC/uh7XT6hjG0/YRHLMuTL3EIZ2iucoAksOfUkDGB1df70lyKR0P?=
 =?us-ascii?Q?+Zo4J+9hkZsU8H8unB8pFSET6FjlX66s9JvG/WspMUB8ANo3vaDw8wem9uYz?=
 =?us-ascii?Q?wMQWetjqbfrXho7OTVlj79KDpBt6fJOmnr+QVbknjrER9oJ+BajZm352Ct/v?=
 =?us-ascii?Q?CPmj3v03qNBj+i0lgNxgKy65hZHtQLe0vsmPnox46+TzEiCBkX3goX0q/Hy0?=
 =?us-ascii?Q?9/KQNC24TnrLjVTzX6V1366EQJ5UfDbBqGT0FFGGCZzfjAIh/G5DPtYeKmKv?=
 =?us-ascii?Q?3qKV2sAy2Y0dtufuKOmtm0yyKwvC11C0u/CZLAH/hJzJmDSIqbRFhgCFmF6W?=
 =?us-ascii?Q?b4nolMMuF2IaBLaf1CXvgX2acvI6Rx6jmBeo0PwD+x3P2VcREDw+8i31W2nB?=
 =?us-ascii?Q?ZR5v/j+gKEJy8WcHUkoEjClUCVwslRgmkocBDbP6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa62e82-5062-4f4b-15b1-08db1fe2e2ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2023 14:39:13.0804
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NmEVRJRAuRKxJWbhwdzb2FAn1fayIhOGhnipfNeYLItwFgSlky9ftWzgpucn+b0uvWmPIaqOrTQgI87ZOA3CE2nOcq3vOg+MQ9lsXOWjIPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10104
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof Kozlowski,

Thanks for the feedback.

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Wednesday, February 22, 2023 9:34 AM
> To: Biju Das <biju.das.jz@bp.renesas.com>; Michael Turquette
> <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Rob Herring
> <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>; linux-renesas-
> soc@vger.kernel.org; linux-clk@vger.kernel.org; devicetree@vger.kernel.or=
g;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Subject: Re: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
> generator bindings
>=20
> On 20/02/2023 14:13, Biju Das wrote:
> > Document Renesas versa3 clock generator(5P35023) bindings.
> >
> > The 5P35023 is a VersaClock programmable clock generator and is
> > designed for low-power, consumer, and high-performance PCI Express
> > applications. The 5P35023 device is a three PLL architecture design,
> > and each PLL is individually programmable and allowing for up to 6
> > unique frequency outputs.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../bindings/clock/renesas,versaclock3.yaml   | 135 ++++++++++++++++++
> >  1 file changed, 135 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml
> > b/Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml
> > new file mode 100644
> > index 000000000000..f45b8da73ec3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml
>=20
> Filename usually is based on the compatible. Why these two are so differe=
nt?

Versa3 clock generator has the following variants.

	5P35023, 5L35021, 5L35023 and 5P35021

RZ/G2L SMARC EVK uses 5P35023. So I used generic one as file name.
And added compatible for specific one.

>=20
>=20
> > +title: Renesas VersaClock 3 programmable I2C clock generators
> > +
> > +description: |
> > +  The 5P35023 is a VersaClock programmable clock generator and
> > +  is designed for low-power, consumer, and high-performance PCI
> > +  express applications. The 5P35023 device is a three PLL
> > +  architecture design, and each PLL is individually programmable
> > +  and allowing for up to 6 unique frequency outputs.
> > +
> > +  An internal OTP memory allows the user to store the configuration
> > + in the device. After power up, the user can change the device
> > + register  settings through the I2C interface when I2C mode is selecte=
d.
> > +
> > +  The driver can read a full register map from the DT, and will use
> > + that  register map to initialize the attached part (via I2C) when
> > + the system  boots. Any configuration not supported by the common
> > + clock framework  must be done via the full register map, including
> optimized settings.
> > +
> > +  Link to datasheet: https://www.renesas.com/us/en/products/clocks-
> timing/
> > +                     clock-generation/programmable-clocks/
> > +
> > + 5p35023-versaclock-3s-programmable-clock-generator
>=20
> I think link should not be wrapped. Start in next line and just make it
> long.

OK.

>=20
> While touching this, please keep the same order of entries as in example-
> schema, so maintainers go after title.

Agreed.

>=20
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,5p35023
> > +
> > +  reg:
> > +    description: I2C device address
>=20
> Drop description, it's obvious.
OK.

>=20
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  clock-names:
> > +    oneOf:
> > +      - items:
> > +          - const: x1
> > +      - items:
> > +          - const: clkin
>=20
> This should be specific, not one or another. Why do you have two entirely
> different clock inputs?

Reference input can be Crystal oscillator interface input(x1) or differenti=
al
clock input pin(clkin)

>=20
> (and if this stays, then just items: - enum: [])


OK, I will use enum.
>=20
>=20
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  renesas,settings:
> > +    description: Optional, complete register map of the device.
> > +      Optimized settings for the device must be provided in full
> > +      and are written during initialization.
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    minItems: 37
>=20
> maxItems instead... but I am not sure that we allow register settings in =
DT
> in general.

Agreed. I guess it is allowed [1]
[1] https://lore.kernel.org/linux-renesas-soc/833d3837892f0879233695636291a=
f97a746e584.1643968653.git.michal.simek@xilinx.com/

>=20
> > +
> > +  assigned-clocks:
> > +    minItems: 6
>=20
> Drop.

OK.

>=20
> > +
> > +  assigned-clock-rates:
> > +    minItems: 6
>=20
> Drop.

OK.

>=20
> > +
> > +  renesas,clock-divider-read-only:
> > +    description: Flag for setting divider in read only mode.
>=20
> Flag? Then type: boolean.

Agreed.
>=20
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 5
>=20
> This is broken...
OK you mean maxItems. Based on Boolean type I will update this
>=20
> > +
> > +  renesas,clock-flags:
> > +    description: Flags used in common clock frame work for configuring
> > +      clk outputs. See include/linux/clk-provider.h
>=20
> These are not bindings, so why do you non-bindings constants as bindings?
> They can change anytime. Choose one:
> 1. Drop entire property,
> 2. Make it a proper binding property, so an ABI and explain why this is D=
T
> specific. None of clock providers have to do it, so you need here good
> explanation.

I will choose 2 and will explain as user should be allowed to
configure the output clock from clk generator, so that it has flexibility
for
1) changing the rates (propagate rate change up one level)
2) fixed always=20
3) don't gate the ouput clk at all.

>=20
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 6
>=20
> maxItems instead

OK.

>=20
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#clock-cells'
> > +  - clocks
> > +  - clock-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    /* 24MHz crystal */
> > +    x1_x2: xtal {
> > +      compatible =3D "fixed-clock";
> > +      #clock-cells =3D <0>;
> > +      clock-frequency =3D <24000000>;
> > +    };
>=20
> Drop this part, obvious.
OK.
>=20
> > +
> > +    i2c@0 {
> > +        reg =3D <0x0 0x100>;
>=20
> Just i2c { and drop reg

Agreed.
>=20
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        versa3: clock-generator@68 {
> > +            compatible =3D "renesas,5p35023";
> > +            reg =3D <0x68>;
> > +            #clock-cells =3D <1>;
> > +
> > +            clocks =3D <&x1_x2>;
> > +            clock-names =3D "x1";
> > +
> > +            renesas,settings =3D [
> > +                80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
> > +                00 14 7a e1 00 00 00 00 01 55 59 bb 3f 30 90 b6
> > +                80 b0 45 c4 95
> > +            ];
> > +
> > +            assigned-clocks =3D <&versa3 0>,
> > +                              <&versa3 1>,
> > +                              <&versa3 2>,
> > +                              <&versa3 3>,
> > +                              <&versa3 4>,
> > +                              <&versa3 5>;
> > +            assigned-clock-rates =3D <12288000>, <25000000>,
> > +                                   <12000000>, <11289600>,
> > +                                   <11289600>, <24000000>;
> > +            renesas,clock-divider-read-only =3D <1>, <1>, <1>, <1>, <1=
>;
> > +            renesas,clock-flags =3D <2176>, <2176>, <2176>, <2052>,
> > +                                  <2176>, <2048>;
> > +        };
> > +    };
> > +
> > +    /* Consumer referencing the versa 3 */
> > +    consumer {
> > +        /* ... */
> > +        clocks =3D <&versa3 3>;
> > +        /* ... */
>=20
> Drop consumer. Do you see it anywhere else?

No, will drop.

Cheers,
Biju
