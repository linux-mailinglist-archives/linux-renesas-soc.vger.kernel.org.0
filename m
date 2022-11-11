Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D00A1625630
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 10:06:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbiKKJGQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Nov 2022 04:06:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232732AbiKKJGG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 04:06:06 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2093.outbound.protection.outlook.com [40.107.114.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 680C89D;
        Fri, 11 Nov 2022 01:06:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XI9u4P7jcAPQJMnytFwUPQcbKNA+uy0CZ9DTyjGa25y5NM/kHUiAVSFVRnKTX5UqyN3KfYYUb1N16J21j/svGVBU/ElITxKlrkGKZ8V7Bo+l5nTjSKiNYGhN4xBiTnbq5r5R11wVUNo7ohav/Z5Y8Pt+sOfgfHAIvkpoV6w00UqZYud/fpoeVkQN39s/ZR9ZK4xiwseJKcts5f5PMnTcRYaJZ+/y3EKr8I8HMpng/YZFVEB3MV38KvPbHCHQguQQohfyGC7byZAyvzML9m7kHJt2Mpr/z+3ZHypYJIHfQuplsndUV1o6FQII+ObbyGPCo9p6r3etJgk1ZVeBcDBa2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJI/r7n5FIcCUs5QDwEt8iRcAsLCmjKY7d9NWYHUMdw=;
 b=dq4dkD/yw69jRpBo3oHarVpIlzoq/xYKxOtOXQ7g4hHULtIsm0F0LuZB9dG91SoUKQcOK4KlLm98Ave4ESfmupDMZhu57FRSganpc1B1nlynE7vyxUpQJxUlDgEPosflqq071JGnMogW3WycLj2ADTNCv5MraCooRqohgqufMqyAUJ8eQIqZFmuhMHtXcMnNVBBci8LrumrFj+8/t8qNsIZNGIwk2vwzVnI+L1TPV+FclANyXZ3kBwAbYCru1HJPCO34GHy9wjs+QqDq4iKzG6NC7k8Yc4+IsfxN1t6ueGMasd2EmzXa+nHZAv1Sqtuz4vtpNp1w8We9yN2J2WTrLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJI/r7n5FIcCUs5QDwEt8iRcAsLCmjKY7d9NWYHUMdw=;
 b=f4YB4i294N3Mz9WbzVQBljque1q8qhCusdOHkrIuOiuUGaAwQ6UtTBbmT/AeFPNSpLqq0ujtP2zSWKwuKIa0PSq62CtTfUihT7aD/10cUZ1yqGnaoJxeokHFnjpnkZfCHsfyRESzHuZz7qEJL0shDUfSJYUtysb+2Sk+w5oOtCI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10614.jpnprd01.prod.outlook.com (2603:1096:400:2a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 09:06:00 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5813.014; Fri, 11 Nov 2022
 09:06:00 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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
Thread-Index: AQHY9SCBIuQl3m8nV0Kf1Ch8X1TBHq45ZpOAgAAH2aA=
Date:   Fri, 11 Nov 2022 09:06:00 +0000
Message-ID: <OS0PR01MB59229179DE3D3D00C4963F3186009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-2-biju.das.jz@bp.renesas.com>
 <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
In-Reply-To: <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10614:EE_
x-ms-office365-filtering-correlation-id: 38090327-f467-4930-5de9-08dac3c3f3fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /3J/IofJr38boJV6GGZbHjfZQi6nb34kr9ZPGZotvWBOxeQB0GV6pkYPuyFo2DoGThSjTlmIYlDFMVvwGINOC9bwM40HXSF1DVCVddMZ1zIVzEika+nA/eR3kkqKAnHZaumEGyNPT7zePXbEBezzwKAWHbjckWBY8CP8o1nakwL6F3nyhSP+OpTmFyXCKP/aMLxaz6i9cz4ErmVbg+TP6cJNFZtzOXvt8ZSvk48JixUPztugF9DkglypfriqV3vwRlx9CsrAd9jbeM0hbgByy75QY6ng2uNcEvXdBbj2bfIOXKb0bHv4tNtIdoKOzswQbURIvenEb27kbOAfERYZYEPqIX1kCHXk+TU7mHYSp4st8qDnjp+Gu6ACKT7VygyjVVejRaHX1ZxK2MSPhjqoZLMCqRYbiltIPI3QeTI7J+jXDpE1L6N96u/K5D5K4CtHOaWL/oogRFQLrGfRx0Uaq91SRx+wUEzfyo1MVNtrUcXe8XCLcK487LghaIqjvtdhZ+n4rlZ3AtVCVPAcZeKCRlascsuxJnyqc2v4/2YlFoCZoXUBlPIEFkIqIcTksrJAwOz1ZucIXAc0BbP7dnQf7Z2Bn5sRXKXkd5UlysOknvlu7thPn7Jc8HRNjvaFXk9M9NKh/JFxCeRc5bCGXTcQn4109rfU7U8q3V5prvIPZpuOHfG3e6wXwzMh2vCyo4l1zOHH7ciNL+m69kmNPiAYNIOPx7E+VgJoKobOOOPzlp/WnYsx/aOrCGCBKTXw8aOSbtxJa16vpN7a9gJGl9+OhQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199015)(186003)(86362001)(83380400001)(122000001)(38100700002)(38070700005)(52536014)(2906002)(41300700001)(5660300002)(478600001)(8936002)(55016003)(9686003)(7696005)(66446008)(110136005)(66476007)(76116006)(66946007)(26005)(4326008)(8676002)(71200400001)(54906003)(66556008)(316002)(64756008)(53546011)(6506007)(107886003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t8D1d6eeE4k/S30xVR+PZFSl65GhcH+GYiIj6CqIpkBeFKssv3+hGqMHHJMK?=
 =?us-ascii?Q?4u9osDxAilC6UQYje4vRUXft2r8MPcnib1LwxaGEd//90wj43PgKPVDtzn3a?=
 =?us-ascii?Q?EpiaAl/u+gUeMzwX7MR0hm1VdbjlVB3l9xwlyhl7BVxmOBDYzIj9l4RAJ6CS?=
 =?us-ascii?Q?JnC8LwxO1wSRYeJCvRgkmFwb04veUJKOQD3yJ3xMV3wxkGZdhGyK4q18PnCI?=
 =?us-ascii?Q?sZNiLV07jGa8LtWrqqoJSxvbqpLrkcK8Ut+hLHIN+pGpboFbk4kcKBzFhk6A?=
 =?us-ascii?Q?TQU/m9XG6sJjESPShu96nESvi75qZ15boPc8zG/sVJsaT0/AfFX9UgMGvded?=
 =?us-ascii?Q?QFXqypQ36eJy9vu/9e+5pjKcyh7F7vnxvSpuxTA+SqaUaleNr+VNMg1mkDZ3?=
 =?us-ascii?Q?VkNbnxxfsDIwL1TY1JIXInpubCKoTQrBfWcQG5UnZyjbLdAr1WWCQvf+HLsX?=
 =?us-ascii?Q?GXsJZD/+JBQSxt3JFJPJsGBHfsVPh+WFxunDhYcpHyb+MEXoYVRpsbQ9Ojyc?=
 =?us-ascii?Q?Q7KY6Iv7M/5NuGPYP8AFFtKtAUPDqjz46VP64ZgdCiAVjv6ylV+9Do/7gzR5?=
 =?us-ascii?Q?7sJGSsFbLtT9FRtfm18WS0/UsHAcQY5w8KJiJRdMtImjvGKqjwqHlxYTzf3W?=
 =?us-ascii?Q?Ob4cOLPzfT/vzK/ydEnXv/cwiCdmjfF/GlThIbf79vLJbrxh0agMYSXECD6z?=
 =?us-ascii?Q?BWUHfypkM9phV5wKZwAAcZRElXHdW61VuH5NwQIDUVhF2bbxyzs+TzUhe/Rf?=
 =?us-ascii?Q?lwnxEeH4SqEKo64l0/z7EianDf6Yfhv/YT1uDDjT5GWcS5cVlG3KIdgxh6+h?=
 =?us-ascii?Q?YvdOYyzIO0JDnEiKt6LaG1A/V8R+n/VaXk8KqEdwxoCT9oBAuTqSD1OiQjsL?=
 =?us-ascii?Q?V8/vQL48CYyLYkR5skrfqNoa0C2i2zLCXc8iR5BwDGb+qqWsVUCn/JEIXnqE?=
 =?us-ascii?Q?T9CFzoPNT0VR07cs7dkM1W9jRUqedxcMHGzGCfOvYnQjJNf4nt54FmqSz7eF?=
 =?us-ascii?Q?8aVll2fk34ZMRfanT4S+Gw9Xh42he0jN+ZZWhUoIfttmKYOHkNIOxQLJNH9g?=
 =?us-ascii?Q?0FqoPwsjI3njYdP7xL0WRlKUh739J1GkUqgl9K2KnjGWo0mRwPJoj8C1PCdn?=
 =?us-ascii?Q?8lMAKdSFAjxJFnmkSA7lcAQJQTtf/4Wwc0xe0442i+wVy9SeDfiL0rswO/tp?=
 =?us-ascii?Q?KnsIWKjjGFRQKzKn0Vr4abUs4AwZ44s7t/6YmJhgvM9ym9t2ufaESonK4UVY?=
 =?us-ascii?Q?8nbTF++d3B5pwa0j0uNActOc3VjjL39apeYlkSemhNDPDVNrAqcsL2PLoGVB?=
 =?us-ascii?Q?lxzroRt35aIgB/RoIBKPobcQCGGbct0oQIqdKv6gAxgLL5vLlgA80Ew0g8xy?=
 =?us-ascii?Q?IRoJGQoTrUvgXYw/jAorvZq4oiagfZfeFM0FD2bYvgc4VwVyM3Fomshq1mHU?=
 =?us-ascii?Q?SypzQy/tQrBIskR0/JaquAlf0BchwnsriAY/zpVa1pcnY336lnv00sv4GMtj?=
 =?us-ascii?Q?yMTi42sq+VG5wkf35jB7piZFGfbjYU8bLROs8j+nGfcnaryDQHOKQ6W7r1xJ?=
 =?us-ascii?Q?TZb60DR1577picNq3Z6V/bMaBBnx28GU4Zqx4pOvT+FcU2D3H5TiSPPE2Zv0?=
 =?us-ascii?Q?Qg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38090327-f467-4930-5de9-08dac3c3f3fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 09:06:00.5188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dGCP79OAZGheGrOwAsEyt4MB/Xf2AHrCkr5coOX4Gbt8nP1hyqdiT986g+Lobftdp8m+D5H8gpl7ekUvi6PkA0IbpI0+HrLsl9aej5Vioiw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10614
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Krzysztof Kozlowski,

> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: 11 November 2022 08:34
> To: Biju Das <biju.das.jz@bp.renesas.com>; Rob Herring <robh+dt@kernel.or=
g>;
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Phil Edworthy <phil.edworthy@renesas.com>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>; linux-
> renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Chris Paterson
> <Chris.Paterson2@renesas.com>; Fabrizio Castro
> <fabrizio.castro.jz@renesas.com>
> Subject: Re: [PATCH v2 1/3] dt-bindings: arm: renesas: Document Renesas
> RZ/V2M System Configuration
>=20
> On 10/11/2022 17:21, Biju Das wrote:
> > From: Phil Edworthy <phil.edworthy@renesas.com>
> >
> > Add DT binding documentation for System Configuration (SYS) found on
> > RZ/V2M SoC's.
> >
> > SYS block contains the SYS_VERSION register which can be used to
> > retrieve SoC version information.
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> > [biju: Updated the example ]
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v1->v2:
> >  * Moved the file from arm->soc/renesas
> >  * Updated the path for binding file
> >  * Updated the example
> > ---
> >  .../soc/renesas/renesas,rzv2m-sys.yaml        | 39 +++++++++++++++++++
> >  1 file changed, 39 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml
> > b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml
> > new file mode 100644
> > index 000000000000..cc41747798e2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.
> > +++ yaml
>=20
> Filename should be based on the compatible. Pretty often some common part=
s of
> both are fine (e.g. when file contains multiple compatibles), but this ve=
ry
> different then what I see below.

We plan to upstream another similar SoC, RZ/V2MA which has similar IP, so w=
e may
need to add generic compatible rzv2m-sys. I am checking with HW people to g=
et
more info about RZ/V2MA.

>=20
> > @@ -0,0 +1,39 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> "
"
> > +$schema:
> "
"
>=20
> Drop quotes from both.

OK.

>=20
> > +
> > +title: Renesas RZ/V2M System Configuration (SYS)
> > +
> > +maintainers:
> > +  - Geert Uytterhoeven <geert+renesas@glider.be>
> > +
> > +description:
> > +  The RZ/V2M System Configuration (SYS) performs system control of
> > +the LSI
> > +  and supports the following functions,
> > +  - LSI version
> > +  - 34-bit address space access function
> > +  - PCIe related settings
> > +  - WDT stop control
> > +  - Temperature sensor (TSU) monitor
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a09g011-sys
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    sysc: system-configuration@a3f03000 {
>=20
> If I get properly the purpose of the device, usually this is called "syst=
em-
> controller". Use that as device node.

The hardware manual mentions the below. So want to consistent with HW manua=
l.

Section 38 System Configuration (SYS)
This section describes the functions of the system configuration (SYS).

>=20
> > +            compatible =3D "renesas,r9a09g011-sys";
> > +            reg =3D <0xa3f03000 0x400>;
>=20
> Use 4 spaces for example indentation.

OK, Agreed.

Cheers,
Biju

