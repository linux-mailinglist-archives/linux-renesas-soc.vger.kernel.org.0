Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6C9A6B39AE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Mar 2023 10:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231563AbjCJJIH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Mar 2023 04:08:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbjCJJHK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2023 04:07:10 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20722.outbound.protection.outlook.com [IPv6:2a01:111:f403:7010::722])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6521125AA;
        Fri, 10 Mar 2023 01:02:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahp2ZNSn77JXJkKqswKlLbKsSr0/qu2Yf+5gPxrY+RUejS4kbgdQ+14jLrJ4SI2FwNilk+sXDmuyLiMxAt7mbPF/730KgvTxm4yEpIbSLzRgZxKoMPDY6rUIz6EzB5ayZwRexmHza9bsrmQUWou6Q38N5J5ls/MNrOTCDyEoOJPLfs0UfAqItNmM1tXCpoRTDBsIrlC/ELzUsYAx3FfePD4SUOxRKG0iXlOoTuhhZR3xTo3MQB3lyJ2zky52rDYcTwgGRLcJDN814QEc78CVtY/kndN/V96vjAGDke+OhjbELwzJU4dvx3VXNSh5NboKUXkNuxWXQQf+cIXDq5dzJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1b6aEs3RXkfmQPi3sD8AtPS4s0UhjMVvQ1WVPS454pU=;
 b=B4/rfO/1kkGaDrRbH9pwa5X+6cZtgVRtT9Gej4ZoryvKtsFx7he3+Y4l+8ju6I4169ImwZVLtRixqHa4WEJ4bPTlroQQGN/MiZXf1HsJcxOjj9eMZKALjhSKQTOdq0NamiOd2sRM9U/WgVZ1bWrsbZCW7lhs5QHDEq8GL+uDh/IOlWGDjBg15cgu85JJ131txAJMSSD17pD7whUyFPELEJmsuFMMDpHkUD8bat/Y5I2PVMFFTVR2bIAS4N3Abr0NE883yv/31rq1rUfPwv+uMeNqmGJnqk7Qc8H5JZziW+BMOgEDhBNUAGRUaFCBHdTb7kkFp5qIYp+Mt44Q/4kUHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1b6aEs3RXkfmQPi3sD8AtPS4s0UhjMVvQ1WVPS454pU=;
 b=oB32Na83S7BwXjPxRZJbsCuyI1OV72khU7a6Y6KWAJvdJlmrgmDbm3UqRfMTgRVq39johxZmip8isOYh3evW1/DqFLK+WkJ5X3YsXbZcu0ZadAUo645fDIROW53J00ZtUQUaqnaKZ/xEB8I7ETXPAbnE2+coEZgEvVzr0E5Lnvc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB7780.jpnprd01.prod.outlook.com (2603:1096:604:179::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 09:02:28 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::f54c:4b2:9c7d:f207%7]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 09:02:28 +0000
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
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Topic: [PATCH v2 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Thread-Index: AQHZUqf7M3UeNgduUEq+nm0rBHAmVq7ztLYAgAADkeA=
Date:   Fri, 10 Mar 2023 09:02:28 +0000
Message-ID: <OS0PR01MB59227A718FC116E4F5460E1186BA9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230309165529.223052-1-biju.das.jz@bp.renesas.com>
 <20230309165529.223052-2-biju.das.jz@bp.renesas.com>
 <5547887b-c39f-3595-2442-7477080e716f@linaro.org>
In-Reply-To: <5547887b-c39f-3595-2442-7477080e716f@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB7780:EE_
x-ms-office365-filtering-correlation-id: 9bfa7f00-ede5-4d25-8212-08db21462cd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iFUd7WpgoQUgwJPRwqOS4Ucy2v6UaALTKL+bjWRIxcF3cQBDnhjP8b1yo4sYjBuOasL45e0Uf2/zOej25Zim4qbMnX7NlIyUo7M+0chSkwJ62SgUoa8jhictL6xnRxl6NcIcLRsMCmdc0jztmJhzNP6k6/BSSKYc5cKz/3bhaZtH1epC3K0VJNt3iO2nT2IO80JlN989OctRCAZ77B4aoMaYLMicZDxtMr8yq/godl9QBiCC3m7DNjVHMEBuoDmyHs4MNI1Bnd5BYMrfEzQW37WyDVchEhCNvoq5Sjj2WnEzbCWBc2Nlzw7CCt08sdxCCxHFSk2tFD5+ZeZoqKcDz2nvSiGta16uUKI6wlh7HSpMuMoyr2WCtj+zWIoLdo5dG5Nh3pKZZMsd5MAFS6jd0cMMEJOHYPHSrs0SZc7GpX09jhLo0NEtgwjJrnoL1UJCn2Rhq1pbLmYtXH2EdfjvgVMQLY4i6G26duUNJD7lneTloTOq6ZqI8eYKu7rC3ukLj5fbFrpLbDyFOzVymhm6KLpeNNA5Kr04UrIlNtjM1qzgnp+MwDyOvz+GIMS7o/llZ5C6eFZz1BsObnu0Wvor4SCdUDvRqjuYE1ceKUBB8z693fDJ3rIdaFxD+c2wPN5wW5Ff4saMLxYN+2pBHvkBSYxaT/1EiaQAmtihZMNsO7XsnPZ6H+YIaIEVVqBXrncV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199018)(66946007)(8676002)(64756008)(76116006)(66446008)(316002)(66556008)(66476007)(54906003)(71200400001)(7696005)(110136005)(4326008)(5660300002)(2906002)(966005)(53546011)(26005)(6506007)(107886003)(41300700001)(9686003)(186003)(52536014)(478600001)(8936002)(38070700005)(86362001)(55016003)(33656002)(83380400001)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OLmIwN2wj0STuwU0qZFVK6p1EGT2qNGKvdgMLpaF5Zkjr5lU0ZIUYImEoE81?=
 =?us-ascii?Q?q/+zNa4ZXk59a4Yq40gt1pOMYMyZzF8ug1MgkcVDahcpr3s7YIjGDJ+iVSRb?=
 =?us-ascii?Q?fjMDr6wmiZuRHRmV/3mw7gzYORdL7deQzbsOfpLiKsKFEqWexLFb9R+36u9n?=
 =?us-ascii?Q?RZbJiy3RZNFJaIc25XPcGFSUkiNfviEEdjjPG5OofJqeDz+IEZ0lKpEf2q84?=
 =?us-ascii?Q?5ljt341dY05rb69CJ+Nwtu8LXCbqiuqSlGcRMiDfJQFJEbEQQBB33erQeeEG?=
 =?us-ascii?Q?IRv/rEoBnZIvx6r9j6exOuUxC5nznmKQyVjOygVeowpNFoLyqb7tqxGdICFb?=
 =?us-ascii?Q?WOYuhEFwMbu5nraU/PFT/2Je6JM8CbnKRZcD2uxbpf6YcddLxdSYKpyHZmor?=
 =?us-ascii?Q?SlhLrp0KPwE5Cu+RdOVsROEf6OQEYZ78QT7ONDymV6srUsdw6/l0D/Ir6NXA?=
 =?us-ascii?Q?SSntqVw3fSuSOx2CtlBxJGn+fg/QpMDMYN2bOmlp3XXhHvIlC72clH+YenD9?=
 =?us-ascii?Q?JUCQhlPoe7ZYaNPPzDDq9NsSZt2wpoIUrpwq3fk7RxYJr+ng90AfoFDX11G/?=
 =?us-ascii?Q?B0yg5kO367+OgIE/RVagPPblXPppOatbjIVIR2va7Cs+8IMcelo4SJBSpvI0?=
 =?us-ascii?Q?CTYLuSmFxn9EwvBHv1LTPeuWVDrPV+sp1ZytJr0+qlRdv/1JFUOmZzu1iR80?=
 =?us-ascii?Q?frimwjumALOFxYFITewx7hgZTQ8jaIntUAdK7MnswWJz+YOwS2Rd2sNqudzX?=
 =?us-ascii?Q?Jt7EpPxlNCWVtOcQt9WGbE/6ZILgKRLnyDutKiYDC+J6l/TqJu3U3E4ahif1?=
 =?us-ascii?Q?zZGy3w1TV/r9ucpuT7kOtAUHt8KxChG/xMsPYrwd7L+uzWU90As3a4kuC615?=
 =?us-ascii?Q?1cL5Q7TDrL5y0plr4NVgbq2jxOfFqcpGg8H0h3RyPEPm6sALrudWE1gnKtdH?=
 =?us-ascii?Q?w2N1HOzhNky3vV/yNwOKCxa52VifRiReQvtp/MfRNvgVZAY/VzbHYQFFFcm2?=
 =?us-ascii?Q?ySzgdHCQKm6GGpLR8vCsNHDpPvsdr+4S/Rf1YBKdqFXejHjTAUyNs/vlLjek?=
 =?us-ascii?Q?PfVEmjluHEUeG9wTRmTK5ECjO73Ip+syZ4wl83YZsTTLYlP5TySIsg6xR/eq?=
 =?us-ascii?Q?afUpPuq/2ZHfeILvqQHwsR8Xrq97qM4rtqzCXvbPvZ8SpecbsxgWqezzbTcY?=
 =?us-ascii?Q?2xwfnGE5WfVDE2ujV4whusejkHvJNMpjv/jEgZ59qi4DHeo5g1nDwhEg5OJx?=
 =?us-ascii?Q?eQx9xfPUVTcnACc9B4ST7VSsHEAeDg3su3HCprgn3AeAqLnFYzYveOrdlZjZ?=
 =?us-ascii?Q?HsERK8+6U3PSx397BENckgMWcVbcAqQIWjczlMrrROS9oGK56vHckV4i8T1C?=
 =?us-ascii?Q?kyuI8kxWHTvlqNC70OVLSGDeknaKiCxXj5BcMs+xEw1Ld6xQYCqTtLcuq6E9?=
 =?us-ascii?Q?CV0tbE8jzGZUbk4TWRt9a5v/vRsA5iEJrBJtz4hQIWvBknhMXtN9ogT8c5uG?=
 =?us-ascii?Q?bCLd3Q9lUWYilkCcE6/6t9yXXsIkJyX2QKnJawRaMVbiZMRMbrQjtx/LZ2jv?=
 =?us-ascii?Q?A/x4qx/ElVCQSRW6sG5zMD5vhWpX4i1BsjdNv946?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bfa7f00-ede5-4d25-8212-08db21462cd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2023 09:02:28.6387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lAF4AzIa1tYBQVMQM0Tq1NaTZHo6zpV9T6XXGS6cjCBS2yru9Fn4DtKVID4HE5u+N5zBBIJFU1oy5epc5ZKfcbfR/zXhSiT2XL7QJMYITWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7780
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof Kozlowski,

Thanks for the feedback.

> Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add Renesas versa3 clock
> generator bindings
>=20
> On 09/03/2023 17:55, Biju Das wrote:
> > Document Renesas versa3 clock generator(5P35023) bindings.
> >
> > The 5P35023 is a VersaClock programmable clock generator and is
> > designed for low-power, consumer, and high-performance PCI Express
> > applications. The 5P35023 device is a three PLL architecture design,
> > and each PLL is individually programmable and allowing for up to 6
> > unique frequency outputs.
> >
>=20
> Thank you for your patch. There is something to discuss/improve.
>=20
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
> > +  Link to datasheet: |
>=20
> | is not correct here

OK will remove.

>=20
> > +
> > + https://www.renesas.com/us/en/products/clocks-timing/clock-generatio
> > + n/programmable-clocks/5p35023-versaclock-3s-programmable-clock-gener
> > + ator
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - renesas,5p35023
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  renesas,settings:
> > +    description: Optional, complete register map of the device.
> > +      Optimized settings for the device must be provided in full
> > +      and are written during initialization.
> > +    $ref: /schemas/types.yaml#/definitions/uint8-array
> > +    maxItems: 37
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#clock-cells'
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +
>=20
> Stray blank line, drop.

Agreed. Will send next version based on feedback for the driver patch and r=
eviews
from others.

Cheers,
Biju
>=20
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
>=20
> With both above:
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> Best regards,
> Krzysztof

