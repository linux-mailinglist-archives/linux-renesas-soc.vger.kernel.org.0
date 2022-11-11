Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46DD6625929
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Nov 2022 12:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233308AbiKKLQl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Nov 2022 06:16:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230377AbiKKLQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 06:16:38 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7819B6711D;
        Fri, 11 Nov 2022 03:16:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pp4yvtPrCzcEi+fc6ebaQ898EOpdqi4VAaR5oHa0QZnkjwBhxAepO29+9ug5E0YUJ2finG8VKr5wqDDOi5kuoNSXO35wivNUArx8SEWwN+CjbDU/scgp4R1lJRQhNS9l7hFW8xTCCCH17dzyJYMmvcL41qwZPHi2U01wXvdqcIvObOaRVWikkxq7cmSNlcZKz9AfafavBu/4J8ubbcPvtUkBF5cV8/uA4iUBqR8padDxUSsKx5UmgDRjVfJ3P0BlXPtlSGECZwwkxN9V/Srn3ZHDKBHZ/9cKk4O4ape+r2gCn7Eq/pHI/c1uXrhKKZuYRLodlR8Lo4AazwuA1ml3jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Np5QQDfHPiqaW+YOb+IWkBJajmpY3HhHXuIrGZki9d8=;
 b=od986ocYkGjTDgHE/lmGpbgrKuTyTJfP1OGTB9vBLmwG7Tn85fR4ijqeBMHKR90jLJ/m5Qa305NrV/1dc1OpzFFUPgqZJTKZzjBR7R6d3ax6r/f6I0bRW6EWU3sy/Xxq/V1KO0TeCMROKvmJo/DNYW1rIpkMmfjWSwieSI1Ha3f2LFqoHe87O/U8REX+Cdvuk8/nbm5bPasbcazzBRYTj7gbgpYIwrNjNE3Ov4VANXfVDeY8fNh2LqJLsZLsv9YiilkPWO1nQpMP3AJY/VHKWXl44POmwzUPy+b/G3Zd3iuo7I9rLEEp4bhc3RcovhStehc1lFUekaMauK9kRyyAag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Np5QQDfHPiqaW+YOb+IWkBJajmpY3HhHXuIrGZki9d8=;
 b=pySBDEqMDwrFe0T+JEAq64k0Jzn5ZaRc0tmpXJeH9coLU9G+f1PG7Mq/14a5qGcMFcngm3bTWB9oGLpXBtWzTzP5wSX2aCv6BtKtboWdD8jGCkYi1FdDcc0/WXfVAAPpJW1jm9lvCAFH39EbhwZS1CBLrNt5csrwCDtsEocMW88=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB8274.jpnprd01.prod.outlook.com (2603:1096:604:184::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Fri, 11 Nov
 2022 11:16:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5813.014; Fri, 11 Nov 2022
 11:16:34 +0000
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
Thread-Index: AQHY9SCBIuQl3m8nV0Kf1Ch8X1TBHq45ZpOAgAAH2aCAAB6FgIAABS+g
Date:   Fri, 11 Nov 2022 11:16:34 +0000
Message-ID: <OS0PR01MB5922863B8EC8DF54D8E881FE86009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221110162126.103437-1-biju.das.jz@bp.renesas.com>
 <20221110162126.103437-2-biju.das.jz@bp.renesas.com>
 <ae35fd75-64d3-3ab9-8cc0-3cbcc9c34b78@linaro.org>
 <OS0PR01MB59229179DE3D3D00C4963F3186009@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <a7bbfdd1-1abd-2ee5-1d32-47d0bcb7e1f2@linaro.org>
In-Reply-To: <a7bbfdd1-1abd-2ee5-1d32-47d0bcb7e1f2@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OSZPR01MB8274:EE_
x-ms-office365-filtering-correlation-id: 4060d6ef-d982-43d0-862d-08dac3d6313a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0LNBEyqyt0MwNArmPdDUqWqSfvhkAIYc3/Ldt3rqhzoFFNIQhHGVlKzi1pw2FRlDTG9am4mu5JO+MnWJ4u61xnRccqztIK4oDrpI3OjSkmheQ291jBzJnwgiDOqr5yumdudQBstDkQOWaKMGFhWTw21M26MvHNkv1Uak4gEZjT+flnraV2Dva0f95qrwEHKFfc6b4DpMNkPlee9EZqE4218S2wpdD1HxUJPvUQ54CkBonIOriUSD8qKQFUc2GfsnmLkVoWYtwPOvuMiy4/GSOh3IUHeGmZSUBuX5xtpaZ9RRftOCODQQ5UnhiPQe45IbSU64qtN6QV2eigGyLmnaVYX4+EM9j/7Vurx15u+v2ld57oAKwz4zE7ZHBM2eDqecERfQjNuEGtG4QbWkTqfVZpm9zNUgMAjRMNeAv30pSMlHHY8ev/yT268kusSEsQQ9LaHxVUzLWHQg03FsPWYYqA5hBBhFxDMav8T0ednrH86tPbkWFksXGMTKLZ7Gl+HyJJYRDc0VkjPeYi5YWbJQyEw5LTHwyf/e4jePTlja5W+hHFeGw5de4m3sk/pjF9Hz9k2tHLhU7ewmsHBobn+QxJHoLLkhmisUG/rpn6AyvXUCtcXY805n+ucFVc8XXoZ2uexghvPG5wDZSLT87HraN4sjzoodRvdofnwHSllNlQaSPHzeNUkMmN7pypakmT6XFfnAKDNWi3eo4XAxFawdQqHfxr260fKXL/eKioEYBcfkcGjlhZj7XJ1MlW2Ibscnjnkwo6q1F9aWFHCjLoIl4RLvNE9+6xQwehVuEhT6PSM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(451199015)(110136005)(55016003)(316002)(54906003)(9686003)(53546011)(71200400001)(26005)(86362001)(186003)(478600001)(107886003)(966005)(6506007)(7696005)(33656002)(83380400001)(41300700001)(5660300002)(38070700005)(66556008)(66946007)(76116006)(8936002)(2906002)(8676002)(66476007)(4326008)(64756008)(122000001)(52536014)(66446008)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hmmxVCfQgctFwOEX6Qu6W0uBsOEUbAYLZ9dYw/xZHs9s+b6dEqa3CjWdnWNI?=
 =?us-ascii?Q?HHF2HJk/+jcIOlYnBiNffJguVEPiwraHv+YJ4zphu/UgjDcVU1mITWhWlTgl?=
 =?us-ascii?Q?CB7B7TJtTfJP2GX1YQoxn6EYqK5s0UoaGyy96FMdK+KnaWoSMGGWwNwsiK6f?=
 =?us-ascii?Q?bcoxCoV6pVB10Z6FdGOCWFHHODzfGWW1DJDjoC10rBWPx28GfBIl8/0kKJqZ?=
 =?us-ascii?Q?mXVZ2DQUqmogiMOSVylO+krbD2u6/iRJrs01+wL09Ot3Su8Js87U67bC831N?=
 =?us-ascii?Q?PW5Oh3+gzDTKaTRhG6E8zxRyTQZxuNfeW/7V67OGCr4I3VPkp+adHWqnPOvL?=
 =?us-ascii?Q?ppQm5IfQMuvvK1n9FoTB6/0nJorCH6jZgbqg/Emfg8rJIKFYVBQzozoQI7sm?=
 =?us-ascii?Q?QVfqD552jueAMlKPiyrDd+vx6ivKdZVeWpOf13v2BM6uoSw2ILs9EfqBLX9p?=
 =?us-ascii?Q?Pstt/aQq3o+Br8RhVuLmDmBv7Zj/v+IpLC8CvJoL4mWD1zA4CPptiJkKG1US?=
 =?us-ascii?Q?mWAxtPWIL7oMGqk3Zc+6Yf2xlAvsiHgz3jHrRpCZR0tnwq3v6JLpwpRcDSjW?=
 =?us-ascii?Q?lg1SuNa1kBBosif1mGhcz4P4ekRkavdcH9MwJgtckbH8AYxp6UvDQZlBDcUr?=
 =?us-ascii?Q?4N5mDWe2cuy2EvYeZAHod2hvLrT3kUzA+nAnaiEL9SqodaZCxdt5zFwmqzyV?=
 =?us-ascii?Q?xIWDiC202K6KGqNX+bK7oaI/uFq/RvE2yxmZl0e9CG4v1l6iM/dvph/q5D2J?=
 =?us-ascii?Q?EcSigP8fuCfwsYtF/c1oEqsNiJfFgfVN3MEHD17+UI5hJlMd3HzgH4An2gcU?=
 =?us-ascii?Q?JgNO0NzJ/dJxrUKVasJbIrbkbQ/dy8XwOPTeXARvXAHwekIlap23Nynv60Yg?=
 =?us-ascii?Q?eQgfC//WVUjQBqk/Rw6ftHkmOXnuCIOWzHonIIqLtnjReEinAzxHMY6GKHPM?=
 =?us-ascii?Q?r273yteSnOV4++p3e0sFMqhGTO7mIti2WIDKf+VRRrqWEKHdBNnZ0cj3oah3?=
 =?us-ascii?Q?q2pUcOeDgc3PODkn8TmkjDHhtOcZeUpn6w+bLYns4MPzj7fKjg4NB3sFfvdh?=
 =?us-ascii?Q?bI20V7h15NLVIypaJFC27t5G+/2crO5k+WoMTx8QEolWNFIA/ZR7XUi6Ow62?=
 =?us-ascii?Q?yuYpAsy0FGtjSPb66TfL7KbWnJKQTNDX1rvDyodt8esXfNBjDH+WrrOCPjQc?=
 =?us-ascii?Q?s4mO3rgpEmbsQ8MhDFxDcLToCE1pB1EV9XP82lSFNCa2N5vy8FxZw+rBCCK2?=
 =?us-ascii?Q?8OCMwADlPKrnwXFDwswnyu3oFT4FAioCw9gwuANfc8Vi2L2IpBACcKdFyTua?=
 =?us-ascii?Q?QAHBF+Zp7F/Dcd1rzTWlahpMlnaYP5iJo2CccUScaK02sdHay+XRQHfwy70F?=
 =?us-ascii?Q?C9QIKVKHcdE5TcSsQxUwbravSGzqChF6GjUC6ARYfP7ymGu0Pp4zRVlAb3QJ?=
 =?us-ascii?Q?y6u31kza1ApRJM1mpGQSUwj9PRDijaONL1+DIXc1Qk7d9Hp56oOAChldJ3pg?=
 =?us-ascii?Q?suSwtoB0CjIZ9Oro50N++nhxWg6g6iMNHPR3GN8QAGlqb+veciO+EekERRGa?=
 =?us-ascii?Q?K2l6Hk8uYaMprDMh7LmpUxMiqhCFY3GTRKXD1ubfHUJGLxeAqQSgSTbKK0aI?=
 =?us-ascii?Q?fQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4060d6ef-d982-43d0-862d-08dac3d6313a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2022 11:16:34.2357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GFF1Yk0iVzvOSoQijkUJ8GxYfOS9XVWxo+F4xDt3z/GFO0NCmgU3TRfTO6te9BtXsS52WqZ2W0RjfPpXLojmmFlEN6cKW8SvybjXd6mNyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8274
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: 11 November 2022 10:52
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
> On 11/11/2022 10:06, Biju Das wrote:
> > Hi Krzysztof Kozlowski,
> >
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Sent: 11 November 2022 08:34
> >> To: Biju Das <biju.das.jz@bp.renesas.com>; Rob Herring
> >> <robh+dt@kernel.org>; Krzysztof Kozlowski
> >> <krzysztof.kozlowski+dt@linaro.org>
> >> Cc: Phil Edworthy <phil.edworthy@renesas.com>; Geert Uytterhoeven
> >> <geert+renesas@glider.be>; Magnus Damm <magnus.damm@gmail.com>;
> >> linux- renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; Chris
> >> Paterson <Chris.Paterson2@renesas.com>; Fabrizio Castro
> >> <fabrizio.castro.jz@renesas.com>
> >> Subject: Re: [PATCH v2 1/3] dt-bindings: arm: renesas: Document
> >> Renesas RZ/V2M System Configuration
> >>
> >> On 10/11/2022 17:21, Biju Das wrote:
> >>> From: Phil Edworthy <phil.edworthy@renesas.com>
> >>>
> >>> Add DT binding documentation for System Configuration (SYS) found on
> >>> RZ/V2M SoC's.
> >>>
> >>> SYS block contains the SYS_VERSION register which can be used to
> >>> retrieve SoC version information.
> >>>
> >>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> >>> [biju: Updated the example ]
> >>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >>> ---
> >>> v1->v2:
> >>>  * Moved the file from arm->soc/renesas
> >>>  * Updated the path for binding file
> >>>  * Updated the example
> >>> ---
> >>>  .../soc/renesas/renesas,rzv2m-sys.yaml        | 39 +++++++++++++++++=
++
> >>>  1 file changed, 39 insertions(+)
> >>>  create mode 100644
> >>> Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.yaml
> >>>
> >>> diff --git
> >>> a/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.ya
> >>> ml
> >>> b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys.ya
> >>> ml
> >>> new file mode 100644
> >>> index 000000000000..cc41747798e2
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas,rzv2m-sys=
.
> >>> +++ yaml
> >>
> >> Filename should be based on the compatible. Pretty often some common
> >> parts of both are fine (e.g. when file contains multiple
> >> compatibles), but this very different then what I see below.
> >
> > We plan to upstream another similar SoC, RZ/V2MA which has similar IP,
> > so we may need to add generic compatible rzv2m-sys. I am checking with
> > HW people to get more info about RZ/V2MA.
> >
> >>
> >>> @@ -0,0 +1,39 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> >>> +---
> >>> +$id:
> >> "
> > "
> >>> +$schema:
> >> "
> > "
> >>
> >> Drop quotes from both.
> >
> > OK.
> >
> >>
> >>> +
> >>> +title: Renesas RZ/V2M System Configuration (SYS)
> >>> +
> >>> +maintainers:
> >>> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> >>> +
> >>> +description:
> >>> +  The RZ/V2M System Configuration (SYS) performs system control of
> >>> +the LSI
> >>> +  and supports the following functions,
> >>> +  - LSI version
> >>> +  - 34-bit address space access function
> >>> +  - PCIe related settings
> >>> +  - WDT stop control
> >>> +  - Temperature sensor (TSU) monitor
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    const: renesas,r9a09g011-sys
> >>> +
> >>> +  reg:
> >>> +    maxItems: 1
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    sysc: system-configuration@a3f03000 {
> >>
> >> If I get properly the purpose of the device, usually this is called
> >> "system- controller". Use that as device node.
> >
> > The hardware manual mentions the below. So want to consistent with HW
> manual.
>=20
> If the hardware manual said this is called "foo-whatever-name" or
> "rz85736dfnx2", you would use it as well?
>=20
> Node names should be generic.

What about system-configuration-controller to make it generic or
You still prefer system-controller like [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/arch/arm64/boot/dts/renesas/r9a07g054.dtsi?h=3Dv6.1-rc4#n635

Cheers,
Biju

