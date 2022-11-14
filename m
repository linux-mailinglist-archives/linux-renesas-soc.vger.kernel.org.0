Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 863276284EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 17:19:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237467AbiKNQTI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 11:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237402AbiKNQSv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 11:18:51 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2098.outbound.protection.outlook.com [40.107.113.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C41A25F8B;
        Mon, 14 Nov 2022 08:18:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHaaKvWlLOr6ifZSUcJ7LPNQsfsDnDqyRh8fryC9JhqMe3RIggLJXW0rjWb4GJnDcejLlLWh8Tf9yNoUTTngfYGHgw3VrGlOZf5rVeaOOd2ZTdkqSNmo+JGQSpNvkcaKlBLnNMQ5Dsniqdg1eAzmqrPyprUd5eHPUSVaIDysIXnutYViwjmXxVIh4bCmAxwZGvphU2q5SW/A8kIRgcqJVTH85kbOMrxBY589rriPZJmVNIpWUqdoqzTbDWT0e1KWBiO96b76fBSvUX9uZwUtxfd8AnrTYLYaLxaHYHdwezb/31Zwa+x1o4M5aFNTMhEi4BkD39PBxJCQ47SPT6Ofgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAvJ9oA+uz/4L3jLPQx4qNA+Ai19rmWcRJZkuts2tkE=;
 b=N4YVRw9i+LPpdyBoVHDY4wze0vyb0Ty5WtpPkHK1tDHRKi3VUrP6vNFpkk8gK3nnIfCIcPkcOrBW22pBeBiALpNxvGOUy8Ewlq8jLacfib8EWtKx4IzoZnfgbeSWTBBYoZ2IRAXg1uwL9+J3A9jmtPTK1d4OK/m/7iYMsNCNfdJPvnYGlld74QRbqpEjGPRQ9SGHK8kcbV+t47iKJiROSFGYe0LgVTwQTPspSg09NQI+qwBE3IUJLeRtpIwx+PuMvmP9fPLSxz4NR0WsKRrWbD7Nr+0ygCM62PUhElwlzHRjpAK2WeQB/WBQfK20GFJOzVC0a7L6RkHJI9Mqeq/Bwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAvJ9oA+uz/4L3jLPQx4qNA+Ai19rmWcRJZkuts2tkE=;
 b=lVwosgyb1f1DfNlZq8WVC12ixjYNAFSm5tuRRxdmj6ub5wJCRvWda8ZMzCZAC8S06ShE4+BV71nPxFRtgI48+fV317JzyoGgrHXofQ7cuUasBsothOd0IKCs0VXC9GtA70pkKSXsF3Rkr9ABg0faBw+Ubo1IjlntGIDlFVB+gMg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYVPR01MB10878.jpnprd01.prod.outlook.com (2603:1096:400:2aa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 16:18:46 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 16:18:46 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas RZ/V2M
 System Configuration
Thread-Topic: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas
 RZ/V2M System Configuration
Thread-Index: AQHY9SCBIuQl3m8nV0Kf1Ch8X1TBHq45ZpOAgAAH2aCAAB6FgIAABS+ggAUMRDA=
Date:   Mon, 14 Nov 2022 16:18:46 +0000
Message-ID: <OS0PR01MB5922C8A590502C8820B05A7186059@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-2-biju.das.jz@bp.renesas.com>
 <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
 <OS0PR01MB59229179DE3D3D00C4963F3186009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a7bbfdd1-1abd-2ee5-1d32-47d0bcb7e1f2@linaro.org>
 <OS0PR01MB5922863B8EC8DF54D8E881FE86009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922863B8EC8DF54D8E881FE86009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYVPR01MB10878:EE_
x-ms-office365-filtering-correlation-id: 25f4358b-05ae-400f-bcaf-08dac65be846
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eoClJhGjc9ebi+iDcrcD7hEgty/Fu9RuNc9bHjt6UtkKnCESwiCB0IGuJ0v+0EAdSYhazRYGhynEZ+OrqrwpKsFdOWMPrvd0sGui1R2pqQlnCtueCW9qd8MLELxajrr/EH8MrAMvN7fXSv8fIn15I3moY1ogA8ucqJbPhyA/NF85yV31CUBczCTzYwoaLQwiZtpGAXRX54KuDlruXR8475AHbRK2mZh8mjHnBFyFQi5qvFbN1EE55pBeugiyIJMYoItIiAQLEwnJTMBeHRFdNB2yV6fmTKBXhUtEho4pmm0j3WieXVW2oJXtk3oyk3uQYOzIwYvTe76i+0csnYDesb3a6IubJNUgajdD3yte8QCXkE7RDEzm628nxDh9rrCF09MxR15WRP/If/w6W/FW9r8B3A6R+dggIClG774oCzzNSXxpySQNtxJhxBBY0+4vuAlEMyCpnunj7feVkSdKUZoWTqUXGlmNyXAmw+iv3iamUtIQxsrYtNhB3qzX0n4mf1SmjsgeWQAhHnP7ayCDTogsUge3S4Cwy5wkZzA4SjCluIO1DHjqGehbcHjIQ0lssAEkgq57fotWcU4RHmtofCUdR5rmXQE3sx19XTDMKNLRj7pjPZy5RLQHYkH+HucsEUsYSqwmoPMopg6+/uMQkPuERQs1Qqz4DqUQmGuWZAqIwZb7tn078ZqZ2PFrLKf+VHIQRtPQPCnxO3FJ8Bjr2220OXQxVk69j3aNzkhWtTS4gLO/bMG+1WIoj3RO13Z1ulDlKGVqhCgvz4pfRVWDOQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199015)(26005)(9686003)(53546011)(186003)(107886003)(7696005)(33656002)(6506007)(38070700005)(38100700002)(122000001)(86362001)(2906002)(83380400001)(55016003)(8936002)(41300700001)(52536014)(71200400001)(5660300002)(316002)(110136005)(66946007)(76116006)(54906003)(478600001)(66476007)(66556008)(64756008)(66446008)(8676002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pVbiyddEQLZr0xHjTbE6Upgaxij84jPo6hAC1D8oPeM0GgP+P8QseBKtRzwQ?=
 =?us-ascii?Q?WOjLFhqNbh8yT24ubxxHX2Ju/YXgR2+7uQSvTi/kV13LA1LL8oZboNawZP+m?=
 =?us-ascii?Q?2mRIr7qJgue4ijg9byYaq272EuhvE45ueuXnNxZA1lzE1ZEW4Q8KN/TlDOoY?=
 =?us-ascii?Q?fLwyOtE98dOXkevYTAC544kIxeFObYmuyn9VIUbV1z35si+vzzXVdAhXbaHR?=
 =?us-ascii?Q?rvFPWeLQ0BzV1S16LBh8KzChnRengciBnj20riVk9XRnFwBMSYCrHee+K7/q?=
 =?us-ascii?Q?PQ8lQXCJAmnZnnP9dUPShF+dgopezqOVZtW/6DA3sgI0hD7vHriJRNfDRbS7?=
 =?us-ascii?Q?rXyf5cLNBR0we1j/LWMkIMvyXBErVjHzqRyxdcEqIo/v+kaydds78ottCxaU?=
 =?us-ascii?Q?JqHAWU8hV6jYiHkx1CZnKsqw388RKyATyEC7EABBNdY3JoT6ESH6eqXq1Dtz?=
 =?us-ascii?Q?fNx53VpAhjKryyVLgfvYTheAsj4eeyEQSrAcLZU+U8LhGKUpgYP4IIfAxm34?=
 =?us-ascii?Q?LrDsHOCjY7ruSMUr95lVQTdHCuGvgDQmDh36QM7BwISffMbtqXVRHKnS7Txs?=
 =?us-ascii?Q?8AOe0NvbOooS6iYL7OGSxg/Ry85ylMnkaIxlZNGv3RXlXOqmKi2o6dYRDALi?=
 =?us-ascii?Q?uzlOep3Vu/+GAMjJ15Flmm+5GGsn03V61zGAZYjqHpj4A6e1Ozg2orCsMm4L?=
 =?us-ascii?Q?+tFZ+qAkExst0S0j2NDyOXQyqQynQU5Fe3OHN2uGEqWX10szQaO1P8Mm8f+K?=
 =?us-ascii?Q?taxti//9AtkM93i5dwfhA//o+cmA29heyam6rQInH0wJOO/0LLcj1+efS+bN?=
 =?us-ascii?Q?/Q6NXIyObZFaza8rGfBb4hRMl7+ImuFdnD8y8Zfx/jfPfGrwO5RUEYr1CQ//?=
 =?us-ascii?Q?z0/rryY3F5jgk5BGUcKh0sk8+pUhDxyouOErE+vUI38eF4FtFhU8fjhoXPKK?=
 =?us-ascii?Q?q+aIy3O8X2V3b5PMtvZqqYAQftbkBtLoFcxoHlQglXJl33Go/Zd6eg51VwTD?=
 =?us-ascii?Q?80PabGCdaqbAWVpOh/wSu7l0JlaXVUAaHGoAibclBOeyutnCtUvPxOk2hl64?=
 =?us-ascii?Q?96IRvYpfoEKOWH4xyu6SnWWMcbSqPhJrNJRNVGkOVY/s/HbwBumJRRadSZ8z?=
 =?us-ascii?Q?7Aa6bUy6GXKWgQw891mmJccEVRnRR9YQrJE3O3i1hc+v1HM1CKE8deGC6Gqy?=
 =?us-ascii?Q?BM+6WEpjz+7jU5k6OJvYBeTyaO/E0Dsa5M/1NUGF/tv7MpnnSqDgMSJETmx/?=
 =?us-ascii?Q?zPrYsE0WkLTGL0gDL5FpKj6ScPSdCV0T08bSmtsMNw/IXr0tQb1EXYJeKRY+?=
 =?us-ascii?Q?RzqYLUoQ0aRJ/LBuwGPXLOJz1Da6ODFd5pMWPZ17SIREWtlvppdQY5CGRpxj?=
 =?us-ascii?Q?Fe2GM/vwJN2tbmVkh3NtrQpq8v+c+ngJsfQNc1sk5v+wdgS3FXkN1y+yjRnD?=
 =?us-ascii?Q?9numbVnw3TTCNWXm2z1S9pw288w1bLlJsr72o+fndm8A2YyP69sCzf4e8sVW?=
 =?us-ascii?Q?p8nlk6Dinfiw7MqyQZJFw/zqSiOlkb7PWFIHGT7l6OZtan9DrYWcy94Tcl1K?=
 =?us-ascii?Q?HVTUhzI3FsEk/DqnlwKlwCvtTZYM7s0rPg5he4R/d9tSV8hKQrUcviHdO5zr?=
 =?us-ascii?Q?Kg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f4358b-05ae-400f-bcaf-08dac65be846
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 16:18:46.7151
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LqDVOgXhV4SGt8xD9fbzbVkx7P9cfUNwaxvYMTw0Z5nTyLLYEKn+af2Pfe6Gssr78QdGUK4vzVoz6fo38veYs7K9ScEXaoTZ94RlD/sz8yE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10878
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

> -----Original Message-----
> From: Biju Das
> Sent: 11 November 2022 11:17
 >
> > On 11/11/2022 10:06, Biju Das wrote:
> > > Hi Krzysztof Kozlowski,
> > >
> > >> -----Original Message-----
> > >> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > >> Sent: 11 November 2022 08:34
> > >> To: Biju Das <biju.das.jz@bp.renesas.com>; Rob Herring
> > >> <robh+dt@kernel.org>; Krzysztof Kozlowski
> > >> <krzysztof.kozlowski+dt@linaro.org>
> > >> Cc: Phil Edworthy <phil.edworthy@renesas.com>; Geert Uytterhoeven
> > >> <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>;
> > >> linux- renesas-soc@vger.kernel.org; devicetree@vger.kernel.org;
> > >> Chris Paterson <Chris.Paterson2@renesas.com>; Fabrizio Castro
> > >> <fabrizio.castro.jz@renesas.com>
> > >> Subject: Re: [PATCH v2 1/3] dt-bindings: arm: renesas: Document
> > >> Renesas RZ/V2M System Configuration
> > >>
> > >> On 10/11/2022 17:21, Biju Das wrote:
> > >>> From: Phil Edworthy <phil.edworthy@renesas.com>
> > >>>
> > >>> Add DT binding documentation for System Configuration (SYS) found
> > >>> on RZ/V2M SoC's.
> > >>>
> > >>> SYS block contains the SYS_VERSION register which can be used to
> > >>> retrieve SoC version information.
> > >>>
> > >>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > >>> [biju: Updated the example ]
> > >>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >>> ---
> > >>> v1->v2:
> > >>>  * Moved the file from arm->soc/renesas
> > >>>  * Updated the path for binding file
> > >>>  * Updated the example
> > >>> ---
> > >>>  .../soc/renesas/renesas,rzv2m-sys.yaml        | 39 +++++++++++++++=
++++
> > >>>  1 file changed, 39 insertions(+)
> > >>>  create mode 100644
> > >>> Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.ya
> > >>> ml
> > >>>
> > >>> diff --git
> > >>> a/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.
> > >>> ya
> > >>> ml
> > >>> b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.
> > >>> ya
> > >>> ml
> > >>> new file mode 100644
> > >>> index 000000000000..cc41747798e2
> > >>> --- /dev/null
> > >>> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-s=
ys.
> > >>> +++ yaml
> > >>
> > >> Filename should be based on the compatible. Pretty often some
> > >> common parts of both are fine (e.g. when file contains multiple
> > >> compatibles), but this very different then what I see below.
> > >
> > > We plan to upstream another similar SoC, RZ/V2MA which has similar
> > > IP, so we may need to add generic compatible rzv2m-sys. I am
> > > checking with HW people to get more info about RZ/V2MA.
> > >
> > >>
> > >>> @@ -0,0 +1,39 @@
> > >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> > >>> +1.2
> > >>> +---
> > >>> +$id:
> > >> "
> > > "
> > >>> +$schema:
> > >> "
> > > "
> > >>
> > >> Drop quotes from both.
> > >
> > > OK.
> > >
> > >>
> > >>> +
> > >>> +title: Renesas RZ/V2M System Configuration (SYS)
> > >>> +
> > >>> +maintainers:
> > >>> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > >>> +
> > >>> +description:
> > >>> +  The RZ/V2M System Configuration (SYS) performs system control
> > >>> +of the LSI
> > >>> +  and supports the following functions,
> > >>> +  - LSI version
> > >>> +  - 34-bit address space access function
> > >>> +  - PCIe related settings
> > >>> +  - WDT stop control
> > >>> +  - Temperature sensor (TSU) monitor
> > >>> +
> > >>> +properties:
> > >>> +  compatible:
> > >>> +    const: renesas,r9a09g011-sys
> > >>> +
> > >>> +  reg:
> > >>> +    maxItems: 1
> > >>> +
> > >>> +required:
> > >>> +  - compatible
> > >>> +  - reg
> > >>> +
> > >>> +additionalProperties: false
> > >>> +
> > >>> +examples:
> > >>> +  - |
> > >>> +    sysc: system-configuration@a3f03000 {
> > >>
> > >> If I get properly the purpose of the device, usually this is called
> > >> "system- controller". Use that as device node.
> > >
> > > The hardware manual mentions the below. So want to consistent with
> > > HW
> > manual.
> >
> > If the hardware manual said this is called "foo-whatever-name" or
> > "rz85736dfnx2", you would use it as well?
> >
> > Node names should be generic.

I got the following feedback from LSI team.

*The reason why we use "configuration" and not "controller" is the possibil=
ity that users might take it to mean=20
"control" of system operation (product operation). This unit determines how=
 the whole LSI configure to operate LSI,=20
so we use "configuration" for this IP name.

As per this it is not a controller. It is a Configuration IP.

What should be generic node name for system configuration IP?

Please let us know.

Cheers,
Biju
