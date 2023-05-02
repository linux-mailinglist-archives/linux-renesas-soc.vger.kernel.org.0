Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 849176F45EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 May 2023 16:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233972AbjEBOTI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 May 2023 10:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233849AbjEBOTH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2023 10:19:07 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4AD95;
        Tue,  2 May 2023 07:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJRMNHPrcB2lMv481NYPbL2y602sSb2PNtm88+tyIHqHSvJMU39/3YyF58lXK8S4qz9PPQcoh8KHfrm5bmGHNa9stwH8v1hpSIfEs9XtFbn536peDssxY6CppGEoKuzRXkakUFCVOL2cvUbtwXPm3pLlxUuDjAU0BIfVCcJOHBwMYK/EEzYepvTw3tHZs4iQ/bP7IrBbSF91lcME3HYwRD2BN9QVVJ2lQz3jeAXOP65HE2Ch73yEFYPcnIyhMR0f3PCGGvYS8GyW3mmKSuYqUbMuOv1us7ejHGGUajccxP2Mv0VrCiT07c/pnsRkdxkum7tX/fFkMcam4zWhqdnbkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Le6XI4iz1Y8w54hBZLfBGm+bt2XJDCIOg4TE82KWbMw=;
 b=Lta06a30ywsvop7YJFw69Swd/R8XeAobMwaH2S6Uy5dUTLZfGYUbSjWZ+1s7RKp928OjnPLB9Yv26In3GYsgCdh0F0m55N10S1i3rcYxKv7rTi9tHcXk0OBN498oeuLPb97nQrfQjrcCS7Plpb8cTKzn61Nw+Lb57zIW3+FwgBLWU3IizKhrBN3rTILfqeOYIjNyA2VV6HnvNwpdOZdAx1dmuYDWydc7yif5yRua7dyWfkMn8kggQu8H/Pz6hu7EkT1Y3idFGleIeo1CtKqyQLMhVsIOQ97iTw6DEvOqfRKf3OMQ8XeZ3NNCNeyuyfMZppedGHMcrNQr7ycrFg/LjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Le6XI4iz1Y8w54hBZLfBGm+bt2XJDCIOg4TE82KWbMw=;
 b=XQUoiSC3mZHdkmL2aL8WUDoBHgB2WQo7J+Ym8z1jJpNvz4ZdJtqyesKy7Hcb5pKLEh/oYbqia7LwsLl2g5qtIxRHi/G5j6FsizL6n2kR/LDFL+kV1EE5TakPJ5iHsR0bsLKU+tItZ3czfjHYcK8BZKLIHgDYupOOjaRbguXi//c=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9780.jpnprd01.prod.outlook.com (2603:1096:400:20a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 14:18:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.021; Tue, 2 May 2023
 14:18:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v5 0/3] Add Versa3 clock generator support
Thread-Topic: [PATCH v5 0/3] Add Versa3 clock generator support
Thread-Index: AQHZbhxjDSdzuZdA9kCC1BBZdg8cZa9HJZ+Q
Date:   Tue, 2 May 2023 14:18:59 +0000
Message-ID: <OS0PR01MB59220C350DFB9C221C801907866F9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230413152648.89089-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230413152648.89089-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9780:EE_
x-ms-office365-filtering-correlation-id: 10762fc3-1aae-4a15-5de9-08db4b182be8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I3/X5NdCP5bb6X8M+23Phz94S2+VFgGUOqg4QRNiepwc2yYQymwu6FmH1CEfOL8PTizt40FJ/tBEYpEObpPAhtcx5vJm/9Mv8MS3DKyvs4fvhkE/WpVMOT5IGoilf/Kby1nlGKPVdWWuZBTBSIAZD+QECGTKluT5Gb46GQL9SF5qQR1ArZPwVa79oiEjgtDGZ0ELpQ0BuEk/wtkG8HQPFKxiiP8mQ+ly1roqQGuoDI/8fzPFb4WcYlKY1m/6vK2wGP8YMxoDhTpb4yK3aU+yFpI3xCbBvTcJZOZealH+Hl1q8g6ejVHloLVJ/7d26GQgL1m8HHPZmZTa4GNCYxHEZEpJ8Ph7Uqack6/7PRYWoJYzbnGAf4fJ+nXHydAs0Bf+JtBsl07RWnM17IUj6hGzPjGLKuRLXNo6DjCCRPzz59j0gxdA91OgFSz8vqYtOin+0fO3BYquGnCM6Zwb+L77VGP6RoX1yt8o+NSewipr4muOJM7Tzw1+BAlOM+Oe758pl4dOsZwxtj+wC0x/Pu3rXAXwfO7guxKCvhfRkeabxMVxn6JTBCESeeAFVA65mDr3Kk3bUhOREvKL2+wX3XQGd7y7ku3U9ls2A4GUABiVozfvUu7oecYD0z2mWb830mNh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199021)(122000001)(38070700005)(38100700002)(86362001)(33656002)(7696005)(8676002)(8936002)(71200400001)(478600001)(5660300002)(107886003)(52536014)(55016003)(2906002)(186003)(9686003)(26005)(6506007)(83380400001)(30864003)(53546011)(41300700001)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(316002)(110136005)(54906003)(4326008)(579004)(559001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TMzSSvDvvq/j46KP2nVtHbPzsrqNJo3oHjYRJYiK7vrNqkRPfjAHjABZLmny?=
 =?us-ascii?Q?NBLfECkUoYhATTB6Wd5RTNMhPMF/0SrkZEPJzyI+4uDmcNMXYxkRciu3gf6H?=
 =?us-ascii?Q?80tS8ScKwbt2LHbJ20zqlg7taMjtk8krLQIJHgfL6iCYlGSvGX6mOkT5QqWe?=
 =?us-ascii?Q?sRGzUMbVi+EA7Ax9q8qJfrtLZFG2NMcnozVcBPMNRthiT5MS8iogzispBM0c?=
 =?us-ascii?Q?B0bqi+2sn00MzU0KM3XcaH5CqQTfFTp9WDfyLAl00Mwmrg+M2scLaDW8EO/L?=
 =?us-ascii?Q?nSSaB0HH1jCNrGHfW5drjc40WCkrjqIiI09Ynyyd1HeZzcS8opzgcKhPloXc?=
 =?us-ascii?Q?wkNrsICAT/HfXGIYj9KUkGgJ3Bc6TLSC0Epngq2b/uDsCRDydljvryaSyiVq?=
 =?us-ascii?Q?T9wQaeFi1cROrUKPxVvEVSHoCfLhISIGn0rZq17VDAq77qHtfrGSXXq4f98T?=
 =?us-ascii?Q?GMhUJiUMfoEN6zAhemU/anCuHlUDuUNIEAajHuV9Am40DWRZRb/0welJznXf?=
 =?us-ascii?Q?jvZ6iXEonaLwLnZBXfKAAtS2yz/KFQqjXp2QvmdHe7wV2Fhkyvckbb7Fn2ee?=
 =?us-ascii?Q?5b8a1bNJgsL7QdS/9ieF0LkfVrxSgqbJoxD/cO7bscqGd2i4mgZ2bLt6R0n+?=
 =?us-ascii?Q?B3AbK6l/O1LBpRywlHiFx+JuyQ6QZTI3gLtirkG1YsGJLjHtDglUaRW/h6oS?=
 =?us-ascii?Q?tIuAq09fJVvFH6GeX/H8XZdjscNAXyYPO0Q4hJ+5OH2UuMGuLWGC+Mo3WKEG?=
 =?us-ascii?Q?NZckBM7W+GwQHKPBfgVdjI2+mKlIf7QasTcFQlo7pEbbYSk759P/CwZapNoD?=
 =?us-ascii?Q?mX7/dVw/yBYLHgLQnwUqMtfDy20mqOfl4yPER03u+yWRDLN6nIGUIi3SZAVc?=
 =?us-ascii?Q?URMWCPPEQzCL/gwhHzOvTjft3xGdr+Qi5COAXjPHDl8cn4xjKMXJ0gCqrVvu?=
 =?us-ascii?Q?KxY458CM+449Z56ATW/hap4aDJh9HYHPZPTgtvx5qzsIhtV3L2obfxqLKgeN?=
 =?us-ascii?Q?ILve7yxgAJFtvPsEqxjbj3FQMIlhBQFS271eVpEYir+9Bswb1FdNzX1eBPa/?=
 =?us-ascii?Q?HCVy9JsoDB7cmzy+lzthZ1EjRuCOfDyY1eA+pPAb5KyxqZGBL4F8gA6c+Gnl?=
 =?us-ascii?Q?42E7CDsKQ38ypQslUCVB2IqY6yQxUEKpWUCC1a1yDthNxoMZnbbSRUPAvmaH?=
 =?us-ascii?Q?iPY7f8mjdfp+nGYUPNdeYBjNw3XedtENe9LwdVj2gZYpeKEgGVWumb5Fs7wq?=
 =?us-ascii?Q?xDHsqkgRgYRB12sa2k1QjLI1g/u6EI0ds0vif/2Dx4qDGnG5RTz7UcvEWQXF?=
 =?us-ascii?Q?EhS01NlhtezUApXPNpN4MeGjNKORng1bNltlmBthq/+Bb57q5M+qAkexb0Hz?=
 =?us-ascii?Q?9BS4ihhawqFlOhwYgKpNpj4nPyUT6h0/cyuLmEhaxY1aVMfria4q4Tx7SC7c?=
 =?us-ascii?Q?7F84qv5ZxT4SkbOAiJhgE1/ziPQLcJR3EwjjkZ0OEFGP0yXGybpS2aNNGyhO?=
 =?us-ascii?Q?9UdrbRvcGgQ1Eid0IuRissHXsGnIjE3pslQZDJljpEbtceVhOGrJmk5RT6b+?=
 =?us-ascii?Q?hnXKLYgP3Wpn51doODIgYF4tsibkT4dixSU0OZkN8JlDVG/gkO//kiqNx302?=
 =?us-ascii?Q?nQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10762fc3-1aae-4a15-5de9-08db4b182be8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2023 14:18:59.0972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nqFdvxYRe2Rdl4jfEkX+scHMNsIDhdYVhSg0WP6xJ7+sy/KyW85hfXslymnjde791mWuGxQDigETqxgO9ahwZHCfB/R+pQ5xbUiOOm+GtuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9780
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

Gentle Ping.

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Thursday, April 13, 2023 4:27 PM
> To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
> <krzysztof.kozlowski+dt@linaro.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; linux-renesas-soc@vger.kernel.org; linux-
> clk@vger.kernel.org; devicetree@vger.kernel.org; Prabhakar Mahadev Lad
> <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: [PATCH v5 0/3] Add Versa3 clock generator support
>=20
> The 5P35023 is a VersaClock programmable clock generator and it provides =
6
> clk outputs {diff2, diff1, se3, se2, se1 and refin}.
>=20
> It has an internal OTP memory allows the user to store the configuration =
in
> the device. After power up, the user can change the device register setti=
ngs
> through the I2C interface when I2C mode is selected.
>=20
> This driver is for overriding OTP default values during boot based on a f=
ull
> register map from DT, and also minimal support to change the parent of a
> output clock.
>=20
> The motivation for developing this driver is for supporting 48KHz
> playback/record with audio codec on RZ/G2L SMARC EVK.
>=20
> On RZ/G2L SMARC EVK, By default audio mclk is connected to
> 11.2896 MHz clk which is multiple of 44.1KHz.
>=20
> Please see the below default OTP configuration of Dividers connected to
> output clocks.
>=20
> DIV3 12.2880 MHz   DIFF2--> Audio clk2
> DIV5 11.2896 MHz   SE1  --> Audio clk1
> DIV5 11.2896 MHz   SE2  --> Audio mck
> DIV4 12      MHz   SE3  --> This clk Not used
> DIV1 25 MHz        DIFF1-->Ethernet clk
> Ref1-> 24MHz
>=20
> With this setup, we won't be able to do 48KHz playback/record on audio
> codec, as mck is always connected to 11.2896MHz clk.
>=20
> But by programming the i2c, we can make use of DIV4 to generate 12.2880 M=
Hz
> and make that as parent of SE2 and there by supporting 48KHz
> playback/record.
>=20
> A block diagram with modification can be find here[1]
>=20
> DIV3 12.2880 MHz   DIFF2--> Audio clk2
> DIV5 11.2896 MHz   SE1  --> Audio clk1
> DIV5 11.2896 MHz | SE2  --> Audio mck
> DIV4 12.2880 MHz |
> DIV2 12      MHz   SE3  --> This clk Not used
> DIV1 25 MHz        DIFF1--> Ethernet clk
> Ref1-> 24MHz
>=20
> The driver can read a full register map from the DT, and will use that
> register map to initialize the clk generator when the system boots.
> and later, based on sampling rate, it switches the parent of SE2 and supp=
ort
> both 44.1 and 48 KHz playback/record at run time.
>=20
> v4->v5:
>  * Added missing .determine_rate() for muxes
>  * Fixed smatch warning: replace divide condition 'req->best_parent_rate =
/
> req->rate'
>    with 'req->best_parent_rate >=3D req->rate'  Reported-by: kernel test =
robot
> <lkp@intel.com>
>    and Reported-by: Dan Carpenter <error27@gmail.com>
> v3->v4:
>  * Fixed the warning reported by  kernel test robot.
>  * Added error check for devm_clk_hw_register_fixed_factor_* in probe().
> v2->v3:
>  * Added Rb tag from Krzysztof Kozlowski
>  * Removed | from Link to data sheet.
>  * Dropped stray blank line from example.
>  * Updated example section for assigned-clocks to mach same alignment
>    with assigned-clock-rates. This is trivial change so retained the
>    Rb tag.
>  * Updated copy right information.
>  * Removed .name from parent data and started using index or struct clk_h=
w.
>  * Dropped vc3_clk_out_ops  and started using fixed factor clocks for
>    output clk.
>  * Dropped vc3_divider_type_parse_dt function.
>  * Dropped struct vc3_driver_data
>  * Updated the dtsi changes for RZ/G2LC and RZ/G2{UL, Five}.
> RFC->v2:
>  * Renamed the filename to match with compatible
>  * Added maintainers entry after title
>  * Removed the wrapping for the link to data sheet.
>  * Removed reg description
>  * Removed clock names
>  * Replaced minItems->maxItems in renesas,settings property
>  * Dropped assigned-clocks, assigned-clock-rates
>  * Dropped renesas,clock-divider-read-only and renesas,clock-flags
>  * Drooped clock handle part from example
>  * Dropped reg from example.
>  * Dropped consumer example
>  * Dropped header file <linux/clk.h> and removed all
>    consumer api's
>  * struct clk_parent_data used for assigning the parent names.
>  * Replaced initpointer->const init pointer in vc3_clk_register
>  * Replaced of_clk_add_hw_provider with devm_clk_add_hw_provider
>  * Dropped vc3_remove() callback.
>=20
> Logs:
> root@smarc-rzg2l:~# /audio_test.sh
>                                  enable  prepare  protect
> duty  hardware
>    clock                          count    count    count        rate
> accuracy phase  cycle    enable
> -------------------------------------------------------------------------=
---
> ---------------------------
>  xtal                                 0        0        0    24000000
> 0     0  50000         Y
>     ref                               0        0        0    24000000
> 0     0  50000         Y
>     pfd1                              0        0        0    24000000
> 0     0  50000         Y
>        pll1                           0        0        0   600000000
> 0     0  50000         Y
>           div2                        0        0        0    12000000
> 0     0  50000         Y
>              se3_mux                  0        0        0    12000000
> 0     0  50000         Y
>                 se3                   0        0        0    12000000
> 0     0  50000         Y
>           div1_mux                    0        0        0   600000000
> 0     0  50000         Y
>              div1                     0        0        0    25000000
> 0     0  50000         Y
>                 diff1_mux             0        0        0    25000000
> 0     0  50000         Y
>                    diff1              0        0        0    25000000
> 0     0  50000         Y
>     pfd3_mux                          0        0        0    24000000
> 0     0  50000         Y
>        pfd3                           0        0        0      960000
> 0     0  50000         Y
>           pll3                        0        0        0   564480000
> 0     0  50000         Y
>              div5                     0        0        0    11289600
> 0     0  50000         Y
>                 se1_mux               0        0        0    11289600
> 0     0  50000         Y
>                    se1                0        0        0    11289600
> 0     0  50000         Y
>                 se2_mux               0        0        0    11289600
> 0     0  50000         Y
>                    se2                0        0        0    11289600
> 0     0  50000         Y
>     pfd2_mux                          0        0        0    24000000
> 0     0  50000         Y
>        pfd2                           0        0        0    24000000
> 0     0  50000         Y
>           pll2                        0        0        0   491519897
> 0     0  50000         Y
>              div4_mux                 0        0        0   491519897
> 0     0  50000         Y
>                 div4                  0        0        0    12287998
> 0     0  50000         Y
>              div3_mux                 0        0        0   491519897
> 0     0  50000         Y
>                 div3                  0        0        0    12287998
> 0     0  50000         Y
>                    diff2_mux          0        0        0    12287998
> 0     0  50000         Y
>                       diff2           0        0        0    12287998
> 0     0  50000         Y
>  extal-clk                            4        4        0    24000000
> 0     0  50000         Y
>     .pll5_foutpostdiv                 0        0        0    24000000
> 0     0  50000         Y
>        M1                             0        0        0    24000000
> 0     0  50000         Y
>           dsi_pll_clk                 0        0        0    24000000
> 0     0  50000         N
>        .sel_pll5_4                    0        0        0    24000000
> 0     0  50000         Y
>           DSI_DIV                     0        0        0    24000000
> 0     0  50000         Y
>              M3                       0        0        0    24000000
> 0     0  50000         Y
>                 lcdc_clk_d            0        0        0    24000000
> 0     0  50000         N
>                 dsi_vclk              0        0        0    24000000
> 0     0  50000         N
>        .pll5_fout1ph0                 0        0        0    12000000
> 0     0  50000         Y
>     .pll6                             2        2        0   500000000
> 0     0  50000         Y
>        .sel_gpu2                      1        1        0   500000000
> 0     0  50000         Y
>           G                           1        1        0    62500000
> 0     0  50000         Y
>              gpu_clk                  1        2        0    62500000
> 0     0  50000         Y
>        .pll6_250                      1        1        0   250000000
> 0     0  50000         Y
>           HP                          2        2        0   250000000
> 0     0  50000         Y
>     .pll5                             0        0        0  3000000000
> 0     0  50000         Y
>        .pll5_fout3                    0        0        0   500000000
> 0     0  50000         Y
>           .pll5_250                   0        0        0   250000000
> 0     0  50000         Y
>     .pll3                             1        2        0  1600000000
> 0     0  50000         Y
>        .pll3_div2                     1        1        0   800000000
> 0     0  50000         Y
>           .pll3_div2_4                3        3        0   200000000
> 0     0  50000         Y
>              M0                       2        2        0   200000000
> 0     0  50000         Y
>                 eth1_axi              1        1        0   200000000
> 0     0  50000         Y
>                 eth0_axi              1        1        0   200000000
> 0     0  50000         Y
>                 lcdc_a                0        0        0   200000000
> 0     0  50000         N
>                 cru_aclk              0        0        0   200000000
> 0     0  50000         N
>              P1                      11       12        0   200000000
> 0     0  50000         Y
>                 usb_pclk              8       12        0   200000000
> 0     0  50000         Y
>                 usb0_func             1        1        0   200000000
> 0     0  50000         Y
>                 usb1_host             3        5        0   200000000
> 0     0  50000         Y
>                 usb0_host             3        5        0   200000000
> 0     0  50000         Y
>                 dsi_aclk              0        0        0   200000000
> 0     0  50000         N
>                 gpu_ace_clk           0        1        0   200000000
> 0     0  50000         N
>                 gpu_axi_clk           1        2        0   200000000
> 0     0  50000         Y
>                 sdhi1_aclk            1        1        0   200000000
> 0     0  50000         Y
>                 sdhi0_aclk            1        1        0   200000000
> 0     0  50000         Y
>                 dmac_aclk             2        2        0   200000000
> 0     0  50000         Y
>                 ia55_clk              2        2        0   200000000
> 0     0  50000         Y
>                 gic                   1        1        0   200000000
> 0     0  50000         Y
>                 P1_DIV2               1        1        0   100000000
> 0     0  50000         Y
>                    dmac_pclk          1        1        0   100000000
> 0     0  50000         Y
>              .pll3_div2_4_2           2        2        0   100000000
> 0     0  50000         Y
>                 ZT                    2        2        0   100000000
> 0     0  50000         Y
>                    eth1_chi           1        1        0   100000000
> 0     0  50000         Y
>                    eth0_chi           1        1        0   100000000
> 0     0  50000         Y
>                    lcdc_p             0        0        0   100000000
> 0     0  50000         N
>                    cru_pclk           0        0        0   100000000
> 0     0  50000         N
>                 P2                    1        1        0   100000000
> 0     0  50000         Y
>                    dsi_pclk           0        0        0   100000000
> 0     0  50000         N
>                    ia55_pclk          1        1        0   100000000
> 0     0  50000         Y
>           .pll3_div2_2                0        0        0   400000000
> 0     0  50000         Y
>        .pll3_533                      0        1        0   533333333
> 0     0  50000         Y
>           M2                          0        0        0   266666666
> 0     0  50000         Y
>              cru_vclk                 0        0        0   266666666
> 0     0  50000         N
>              M2_DIV2                  0        0        0   133333333
> 0     0  50000         Y
>                 dsi_sys_clk           0        0        0   133333333
> 0     0  50000         N
>                 cru_sysclk            0        0        0   133333333
> 0     0  50000         N
>           .sel_pll3_3                 0        1        0   533333333
> 0     0  50000         Y
>              divpl3c                  0        2        0   266666667
> 0     0  50000         Y
>                 SPI1                  0        1        0    66666666
> 0     0  50000         Y
>                    spi_clk2           0        1        0    66666666
> 0     0  50000         N
>                 SPI0                  0        1        0   133333333
> 0     0  50000         Y
>                    spi_clk            0        1        0   133333333
> 0     0  50000         N
>        .pll3_400                      0        0        0   400000000
> 0     0  50000         Y
>     .pll2                             2        2        0  1600000000
> 0     0  50000         Y
>        .clk_533                       2        2        0   533333333
> 0     0  50000         Y
>           sd1                         2        2        0   533333333
> 0     0  50000         Y
>              sdhi1_clk_hs             1        1        0   533333333
> 0     0  50000         Y
>              SD1_DIV4                 2        2        0   133333333
> 0     0  50000         Y
>                 sdhi1_imclk2          2        2        0   133333333
> 0     0  50000         Y
>                 sdhi1_imclk           1        1        0   133333333
> 0     0  50000         Y
>           sd0                         2        2        0   533333333
> 0     0  50000         Y
>              sdhi0_clk_hs             1        1        0   533333333
> 0     0  50000         Y
>              SD0_DIV4                 2        2        0   133333333
> 0     0  50000         Y
>                 sdhi0_imclk2          2        2        0   133333333
> 0     0  50000         Y
>                 sdhi0_imclk           1        1        0   133333333
> 0     0  50000         Y
>           .clk_266                    0        0        0   266666666
> 0     0  50000         Y
>        .clk_800                       0        0        0   800000000
> 0     0  50000         Y
>           .clk_400                    0        0        0   400000000
> 0     0  50000         Y
>        .pll2_div2                     2        2        0   800000000
> 0     0  50000         Y
>           .pll2_div2_10               1        1        0    80000000
> 0     0  50000         Y
>              TSU                      1        2        0    80000000
> 0     0  50000         Y
>                 tsu_pclk              1        1        0    80000000
> 0     0  50000         Y
>                 adc_adclk             0        1        0    80000000
> 0     0  50000         N
>           .pll2_div2_8                1        1        0   100000000
> 0     0  50000         Y
>              P0                       6       14        0   100000000
> 0     0  50000         Y
>                 adc_pclk              0        1        0   100000000
> 0     0  50000         N
>                 canfd                 1        2        0   100000000
> 0     0  50000         Y
>                 rspi2                 0        0        0   100000000
> 0     0  50000         N
>                 rspi1                 0        1        0   100000000
> 0     0  50000         N
>                 rspi0                 0        0        0   100000000
> 0     0  50000         N
>                 sci1                  0        0        0   100000000
> 0     0  50000         N
>                 sci0                  0        0        0   100000000
> 0     0  50000         N
>                 scif4                 0        0        0   100000000
> 0     0  50000         N
>                 scif3                 0        0        0   100000000
> 0     0  50000         N
>                 scif2                 0        1        0   100000000
> 0     0  50000         N
>                 scif1                 0        0        0   100000000
> 0     0  50000         N
>                 scif0                 2        2        0   100000000
> 0     0  50000         Y
>                 i2c3                  0        1        0   100000000
> 0     0  50000         N
>                 i2c2                  0        0        0   100000000
> 0     0  50000         N
>                 i2c1                  0        1        0   100000000
> 0     0  50000         N
>                 i2c0                  0        1        0   100000000
> 0     0  50000         N
>                 ssi3_sfr              0        0        0   100000000
> 0     0  50000         N
>                 ssi3_pclk             0        0        0   100000000
> 0     0  50000         N
>                 ssi2_sfr              0        0        0   100000000
> 0     0  50000         N
>                 ssi2_pclk             0        0        0   100000000
> 0     0  50000         N
>                 ssi1_sfr              0        0        0   100000000
> 0     0  50000         N
>                 ssi1_pclk             0        0        0   100000000
> 0     0  50000         N
>                 ssi0_sfr              1        1        0   100000000
> 0     0  50000         Y
>                 ssi0_pclk             1        1        0   100000000
> 0     0  50000         Y
>                 wdt1_pclk             0        1        0   100000000
> 0     0  50000         N
>                 wdt0_pclk             0        1        0   100000000
> 0     0  50000         N
>                 poeg_d_clkp           0        0        0   100000000
> 0     0  50000         N
>                 poeg_c_clkp           0        0        0   100000000
> 0     0  50000         N
>                 poeg_b_clkp           0        0        0   100000000
> 0     0  50000         N
>                 poeg_a_clkp           0        0        0   100000000
> 0     0  50000         N
>                 gpt_pclk              0        0        0   100000000
> 0     0  50000         N
>                 mtu_x_mck             0        0        0   100000000
> 0     0  50000         N
>                 ostm2_pclk            1        2        0   100000000
> 0     0  50000         Y
>                 ostm1_pclk            1        2        0   100000000
> 0     0  50000         Y
>                 ostm0_pclk            0        0        0   100000000
> 0     0  50000         N
>                 P0_DIV2               0        0        0    50000000
> 0     0  50000         Y
>        .pll2_533                      0        0        0   533333333
> 0     0  50000         Y
>           .pll2_533_div2              0        0        0   266666666
> 0     0  50000         Y
>              .div_dsi_lpclk           0        0        0    16666667
> 0     0  50000         Y
>                 M4                    0        0        0    16666667
> 0     0  50000         Y
>                    dsi_lpclk          0        0        0    16666667
> 0     0  50000         N
>     .pll1                             0        0        0  1200000000
> 0     0  50000         Y
>        I                              0        0        0  1200000000
> 0     0  50000         Y
>     .osc_div1000                      0        0        0       24000
> 0     0  50000         Y
>     .osc                              1        3        0    24000000
> 0     0  50000         Y
>        gpio                           1        2        0    24000000
> 0     0  50000         Y
>        wdt1_clk                       0        1        0    24000000
> 0     0  50000         N
>        wdt0_clk                       0        1        0    24000000
> 0     0  50000         N
>  can-clk                              0        0        0           0
> 0     0  50000         Y
>  audio2-clk                           0        0        0    12288000
> 0     0  50000         Y
>  audio1-clk                           0        0        0    11289600
> 0     0  50000         Y
> playback 48000 kHz sample
>=20
> speaker-test 1.2.1
>=20
> Playback device is hw:0,0
> Stream parameters are 48000Hz, S16_LE, 2 channels Using 16 octaves of pin=
k
> noise Rate set to 48000Hz (requested 48000Hz) Buffer size range from 8 to
> 8192 Period size range from 8 to 2048 Using max buffer size 8192 Periods =
=3D 4
> was set period_size =3D 2048 was set buffer_size =3D 8192
>  0 - Front Left
> 00: 80
> 01: 00
> 02: 11
> 03: 19
> 04: 4c
> 05: 02
> 06: 23
> 07: 7f
> 08: 83
> 09: 19
> 0a: 08
> 0b: a9
> 0c: 5f
> 0d: 25
> 0e: 24
> 0f: bf
> 10: 00
> 11: 14
> 12: 7a
> 13: e1
> 14: 00
> 15: 00
> 16: 00
> 17: 00
> 18: 01
> 19: 55
> 1a: 59
> 1b: bb
> 1c: 3f
> 1d: 30
> 1e: 90
> 1f: f6
> 20: 80
> 21: b0
> 22: 45
> 23: c4
> 24: 95
> Read at address  0x10049C00 (0xffff9a615c00): 0x300B4022
>        pfd2                           1        1        0    24000000
> 0     0  50000         Y
>           pll2                        1        1        0   491519897
> 0     0  50000         Y
>              div4_mux                 1        1        0   491519897
> 0     0  50000         Y
>                 div4                  1        1        0    12287998
> 0     0  50000         Y
>                    se2_mux            1        1        0    12287998
> 0     0  50000         Y
>                       se2             1        1        0    12287998
> 0     0  50000         Y
>  1 - Front Right
> playback 44100 kHz sample
>=20
> speaker-test 1.2.1
>=20
> Playback device is hw:0,0
> Stream parameters are 44100Hz, S16_LE, 2 channels Using 16 octaves of pin=
k
> noise Rate set to 44100Hz (requested 44100Hz) Buffer size range from 8 to
> 8192 Period size range from 8 to 2048 Using max buffer size 8192 Periods =
=3D 4
> was set period_size =3D 2048 was set buffer_size =3D 8192
>  0 - Front Left
> /audio_test.sh: line 2:   187 Killed                  speaker-test -D hw:=
0,0
> -c 2 -r $1
> 00: 80
> 01: 00
> 02: 11
> 03: 19
> 04: 4c
> 05: 02
> 06: 23
> 07: 7f
> 08: 83
> 09: 19
> 0a: 08
> 0b: a9
> 0c: 5f
> 0d: 25
> 0e: 24
> 0f: bf
> 10: 00
> 11: 14
> 12: 7a
> 13: e1
> 14: 00
> 15: 00
> 16: 00
> 17: 00
> 18: 01
> 19: 55
> 1a: 59
> 1b: bb
> 1c: 3f
> 1d: 30
> 1e: 90
> 1f: b6
> 20: 80
> 21: b0
> 22: 45
> 23: c4
> 24: 95
> Read at address  0x10049C00 (0xffffb7957c00): 0x700B4022
>     pfd3_mux                          1        1        0    24000000
> 0     0  50000         Y
>        pfd3                           1        1        0      960000
> 0     0  50000         Y
>           pll3                        1        1        0   564480000
> 0     0  50000         Y
>              div5                     1        1        0    11289600
> 0     0  50000         Y
>                 se2_mux               1        1        0    11289600
> 0     0  50000         Y
>                    se2                1        1        0    11289600
> 0     0  50000         Y
>=20
> Biju Das (3):
>   dt-bindings: clock: Add Renesas versa3 clock generator bindings
>   drivers: clk: Add support for versa3 clock driver
>   arm64: dts: renesas: rzg2l-smarc: Use versa3 clk for audio mclk
>=20
>  .../bindings/clock/renesas,5p35023.yaml       |   86 ++
>  .../boot/dts/renesas/rz-smarc-common.dtsi     |   13 +-
>  arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |   23 +
>  arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi |   23 +
>  arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi |   25 +
>  drivers/clk/Kconfig                           |    9 +
>  drivers/clk/Makefile                          |    1 +
>  drivers/clk/clk-versaclock3.c                 | 1144 +++++++++++++++++
>  8 files changed, 1317 insertions(+), 7 deletions(-)  create mode 100644
> Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
>  create mode 100644 drivers/clk/clk-versaclock3.c
>=20
>=20
> base-commit: d5b9392d664c6db52fd66e538f1145cfa927d8cc
> --
> 2.25.1

