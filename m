Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34309665D8A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jan 2023 15:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238893AbjAKOSz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Jan 2023 09:18:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238950AbjAKOS3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Jan 2023 09:18:29 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2098.outbound.protection.outlook.com [40.107.114.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2A4BFAD6;
        Wed, 11 Jan 2023 06:18:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCK9aQETpPLQaa9fYGAzd5df/zGDIn+dqTaZ7Lii3uuXSRLXJ7H5NvD9OA5blooN9AXnHRuebrM/pmZiEqpBnDESRCsA+zLh75A5bBfU4Qyu5xP8SAQ6depE4EScoCXhB4Re+jx9Uopa+0sYuKqjLdyME4pOn+/8mBOBb5gfK4rdWjp1W2W+BnlRfB7qZTWI/eDPDQGxMWF+pnJrEj+Se6H6k3bYBSRs1E1y84XRQyJN7HUWwdBkHJ48yPE0wvRtN+V96heuYsNV+3pwhJrJr4i610sjSwtRuSVVyf33GP83aSkX3EYvj0/KmcS9vCPHr55r4S4SpPm3pYukybC5xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IsnC9aJSAqfThPRpHjTe3T1Co84/t6fAY2l5loDar1U=;
 b=d2WBHl6CB5/hDStZzJYgljPz/hqqR0VbUaeeqt3Stpzlajy6RCwGo7vsuyYaMDj2s4l5Ps6X/dJZmF/TrF5V3ebYqtTG7zmSkGfDlHykTd/CbqSlsDiNnhG0zWbu5LUck91Op2XyJHg/YKwsD68ZyuZAaFO8K/Su2B/cN1RMrPcqLN7kO6nAmj3F8Fy/RsfA/ltFnI59fpwVbbfnrSIg7trr0i3xhzntU1hPdi6kSxVEpYS8gWJJhrzv6u1PVKQg8tieAl+oy/CT9S0qftsvMEhNIsVzPAFeuZHEPeZSyBOEPJXD2VppZQESapnaOvzholIcqfsfRoIPYxfI/+WPmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IsnC9aJSAqfThPRpHjTe3T1Co84/t6fAY2l5loDar1U=;
 b=kYu4vMhoa1vHF+qv+1U9NOy0vUe7feGPPVOaWymY5x/mCO6sE4Egj/UuxavoAciwqSpkB7cKYyUIZEoGM1Scs9s1iAUKb0+jLso0NTVJPPBldvZwUu8iOAuOrB2+t/+v3MxIlhn7I/7gLiKjDlKmtta6OZa2pynqMoo/iszr5Uw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8341.jpnprd01.prod.outlook.com (2603:1096:400:15c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 14:18:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%3]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 14:18:21 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 02/16] dt-bindings: usb: Add RZ/V2M USB3DRD binding
Thread-Topic: [PATCH 02/16] dt-bindings: usb: Add RZ/V2M USB3DRD binding
Thread-Index: AQHZDk8gBgnbtRuyh02a6fh4PZaBEq5r4faAgAADFWCAABTCgIAtb+2g
Date:   Wed, 11 Jan 2023 14:18:21 +0000
Message-ID: <OS0PR01MB59220583B9C8BC4E6E1EDEA186FC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
 <20221212172804.1277751-3-biju.das.jz@bp.renesas.com>
 <20221213142921.GA958810-robh@kernel.org>
 <OS0PR01MB59224764F969310126DB202186E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20221213155441.GA1483198-robh@kernel.org>
In-Reply-To: <20221213155441.GA1483198-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8341:EE_
x-ms-office365-filtering-correlation-id: c094b2af-21bc-4771-0cc1-08daf3deb172
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zU+V2xYLy1y6MRKLHRymESfViQjZZYutvzeG21xpK208EEh9q4HaCToLzGMUfNpn6FxMPh18DKcQheMngqkm7N2QrpSVuVnJ52Tsfy3/yS3rfx8Yn54pP78uHMYMVL0zDZtLV3YBqFMigG43H43HsnaikN/rIZxvszct+6y0pfdZpo4p7D8nhaW+d/Yn6iskppFc4JNbONECtkDKZuf1UTUTW6WI4RTJxSqY9iodnOXqJsX0A4aNP5KRuEBUcJvbBvNwQ8XoghlzX4rUUQoK2oj9hru/+Pe7QBaJfdxJ9ivBVkOG2/i3dJnIfMkTUY8PD0JpaJ0NgSBwSSne6bD7UhzOYCBM9NHV4LHgRMJF2Fln442UYdTHE4chZm6FVL3Z9JSpuWGuOVHwW7qImwZYI40EaqmKM3lGcv/VC1Bo5EA6vEfzu5xBG2NgUKhjLaTizCMaLMQAGXvq2OyKkQhX49X6qTnwXSMnRg9NkB594rJZfFpePM94xkEhVo4PEbQ14igRAHa5KN9sDz20lSKVwZfHDW8OkU6xJQI5fZxW3bYqZpyu2+CysAMaSJwmsIEjpS1IBloLdryc3KOi9GvYjVQ4/yDwFqHlRofaFRygx5Hs88cn10575LvGGIuatT12pg8Q7kBJsNI4o/4Ck+PIjKE3YMHw+hFuGaPQwfi8F9RZAZ2RW/+YwOMv9mWNoL6GQNlN5IWi3xNR8yeQAuCSZsM4ln5pFF4Z3Kms3HRY3vc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(8676002)(52536014)(66946007)(41300700001)(2906002)(8936002)(5660300002)(6916009)(76116006)(66446008)(66476007)(64756008)(316002)(66556008)(7696005)(71200400001)(54906003)(478600001)(53546011)(6506007)(33656002)(4326008)(55016003)(9686003)(26005)(186003)(83380400001)(86362001)(38070700005)(38100700002)(122000001)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8fchOKeYXbcwUNLaD69yhP8sv7e6lo1uBbRzMlJRKAMIKY0YDVGiwl4M/OUT?=
 =?us-ascii?Q?b5X7LZJrd9tvKAvSALXrpy2lOyaA7+49hpKGQYmYAzrie2KDzq5TlYP5jyfR?=
 =?us-ascii?Q?AGOicGXHdL27FEzgJ8nY88XYzdi839L4PQNOWRxYGXzB15nYUiBBr6UVDBde?=
 =?us-ascii?Q?IC5SGzqnZqfYaXfaqEIAC7vEOZZwAJKgOfBAr1p9zo6MgnstZo10UJ0ey7Pl?=
 =?us-ascii?Q?7TZLac9OMVw/0fTnfUBjk/8dnoBgZa8Ub2gzan1xpdwACobM9FtsQvEjI6rz?=
 =?us-ascii?Q?DO23W3BhaYZI+BX67LODAOXywZvKUD7OfS8Pt+7qo+C08DwVwx0srHjwb+Bj?=
 =?us-ascii?Q?fUGOx6LispE7oJELPo3hqfGYjMHzfzzfkkuGtvkDECKR7+DT8YUzjXri54Vl?=
 =?us-ascii?Q?RPiUoGCC2dEOHb+HquDayqepRlkH7FdsiFM89atMgY6gVUVTNuV5Ts+vpzDu?=
 =?us-ascii?Q?LDFttMGiuHu4EOx838TkpbIB8JDMZin5zDXrqWSwpyqo3L2bSqkZrfVtDq+P?=
 =?us-ascii?Q?0QQvN6f+TXd/kH/1MEsQafrewe5vSF1DOOQGMzg46SzddNlRvQoWrPXancVk?=
 =?us-ascii?Q?QHsUYWh/haiLdOAkUg157EKxdMviihbrWQ+lur1CeRrbf9207eDHygzQXbrC?=
 =?us-ascii?Q?saIhEt2SAPa3c+HlDumpVj4azvKybIhRE/AOR2QM97Jg5V+/JWc3d8AEGRm6?=
 =?us-ascii?Q?O2yQgwlkV2jI5LC6ll2Flrn3szfYrJPTeEndrZtzXCU2bCQVrXm2TuBA/4fm?=
 =?us-ascii?Q?Da8O4e1gR+vTlQmTE3WdebqxowkGKqC2Ev1HNxldBXHDb9mhU08MfLOnU6Pd?=
 =?us-ascii?Q?+0CpH6mohirP9tDexqxil3ZsKVu4cTRqzD+W0lOH8M0hVet3cOpGYkLuTE0o?=
 =?us-ascii?Q?QDURD3bIIWoppP1iUaQEOOqyLS2CbCW/eq/2ij0AD8GlzQ8X6KidgDiqnVlU?=
 =?us-ascii?Q?eDOslbOsmsCnH9MWPJEfOhgQG2x0K7NwA3IBv6CbFUT9avyFmLRHHLcB1ejf?=
 =?us-ascii?Q?Nn9eEZ4aIQu3/k3rNO6RuldFn7AmJpATyqe2rLClwm28viXOqs4HMFg92CKT?=
 =?us-ascii?Q?cMd5bioqWlybbKJLKOdNc3ZE2LgWuHZRVMPlPKXBL3c1X5W3LMZjMXLpUkIr?=
 =?us-ascii?Q?tVS8PZ/AUhNfUgPTxNegEd1BSBjg3UYpCGGRZ+rm7l0CEJOVVrY+eBzjMNhx?=
 =?us-ascii?Q?q0QD/JzBc4INV952srMGkambwH588KGDLfL3ii/RvYlY86nSe+7QbAnBrUKb?=
 =?us-ascii?Q?XdgJAQswDBtmGKLdM3yvDFM+Z92udgPOw5BLXg2Nt7f2rmLFl5zVR8Hm+AUy?=
 =?us-ascii?Q?CHi54vn2PeJm1f/YDp1/Kr9PA35PCgvJyPORlkQJf7KLLsEd6aoX3eT6LO7t?=
 =?us-ascii?Q?E67sGhXThkF3Cj07FroiHFbkW+PHLC6Ig0ppG9Z7gfJUdXwzf7/IOO10Nfex?=
 =?us-ascii?Q?aL5SFLYyWXNQ9QAiOvJlUN4iBOj8ccmFOnF6Jk8xwHrmaCC64YfZEauzniA0?=
 =?us-ascii?Q?R4pK5DHOw83BGxi8sIsYIgkohG3ksx24zR6/M54KBPjOdCOxBLLaDXSl38he?=
 =?us-ascii?Q?fCY3MmcdHI6fBEm5uLKaaFC42ogZEzP7Da2gKybT96UgBs2mbOndjyzwnLFQ?=
 =?us-ascii?Q?Sw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c094b2af-21bc-4771-0cc1-08daf3deb172
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2023 14:18:21.1364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lmOMpX+UR62ovKgph36x56x/hOIgqGY1UPv7nTc7S+qNXExvgQXAzeFUWDz1stLCvjGL8PMwL63MtSgh0cwh1V6h6f0XyO3PzkGc49vil/A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8341
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: 13 December 2022 15:55
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Greg Kroah-
> Hartman <gregkh@linuxfoundation.org>; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>; linux-renesas-
> soc@vger.kernel.org
> Subject: Re: [PATCH 02/16] dt-bindings: usb: Add RZ/V2M USB3DRD binding
>=20
> On Tue, Dec 13, 2022 at 03:01:34PM +0000, Biju Das wrote:
> > Hi Rob,
> >
> > > Subject: Re: [PATCH 02/16] dt-bindings: usb: Add RZ/V2M USB3DRD
> > > binding
> > >
> > > On Mon, Dec 12, 2022 at 05:27:50PM +0000, Biju Das wrote:
> > > > Add device tree bindings for the RZ/V2{M, MA} USB3DRD module.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > >  .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 123
> ++++++++++++++++++
> > > >  1 file changed, 123 insertions(+)  create mode 100644
> > > > Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> > > > b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> > > > new file mode 100644
> > > > index 000000000000..0c473c3398b3
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.
> > > > +++ yaml
> > > > @@ -0,0 +1,123 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> > > > +1.2
> > > > +---
> > > > +
> > > > +title: Renesas RZ/V2M USB 3.1 DRD controller
> > > > +
> > > > +maintainers:
> > > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > > +
> > > > +description: |
> > > > +  The RZ/V2{M, MA} USB3.1 DRD module supports the following
> > > > +functions
> > > > +  * Role swapping function by the ID pin of the Micro-AB
> > > > +receptacle
> > > > +  * Battery Charging Specification Revision 1.2
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +          - renesas,r9a09g011-usb3drd  # RZ/V2M
> > > > +          - renesas,r9a09g055-usb3drd  # RZ/V2MA
> > > > +      - const: renesas,rzv2m-usb3drd
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: Peripheral AXI clock
> > > > +      - description: APB clock
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: peri_axi
> > > > +      - const: apb
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  resets:
> > > > +    items:
> > > > +      - description: DRD reset
> > > > +      - description: Peripheral reset
> > > > +
> > > > +  reset-names:
> > > > +    items:
> > > > +      - const: drd_reset
> > > > +      - const: aresetn_p
> > > > +
> > > > +  ranges: true
> > > > +
> > > > +  '#address-cells':
> > > > +    enum: [ 1, 2 ]
> > > > +
> > > > +  '#size-cells':
> > > > +    enum: [ 1, 2 ]
> > > > +
> > > > +  usb3peri:
> > > > +    $ref: /schemas/usb/renesas,usb3-peri.yaml
> > > > +
> > > > +patternProperties:
> > > > +  "^usb@[0-9a-f]+$":
> > > > +    type: object
> > > > +    $ref: renesas,usb-xhci.yaml#
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - clocks
> > > > +  - clock-names
> > > > +  - power-domains
> > > > +  - resets
> > > > +  - reset-names
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/r9a09g011-cpg.h>
> > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > +
> > > > +    usb3drd: usb@85070000 {
> > > > +        compatible =3D "renesas,r9a09g011-usb3drd", "renesas,rzv2m=
-
> > > usb3drd";
> > > > +        reg =3D <0x85070000 0x1000>;
> > > > +        clocks =3D <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
> > > > +                 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
> > > > +        clock-names =3D "peri_axi", "apb";
> > > > +        power-domains =3D <&cpg>;
> > > > +        resets =3D <&cpg R9A09G011_USB_DRD_RESET>,
> > > > +                 <&cpg R9A09G011_USB_ARESETN_P>;
> > > > +        reset-names =3D "drd_reset", "aresetn_p";
> > > > +        ranges;
> > > > +        #address-cells =3D <1>;
> > > > +        #size-cells =3D <1>;
> > > > +
> > > > +        usb3host: usb@85060000 {
> > > > +           compatible =3D "renesas,r9a09g011-xhci",
> > > > +                        "renesas,rzv2m-xhci";
> > > > +           reg =3D <0x85060000 0x2000>;
> > > > +           interrupts =3D <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
> > > > +           clocks =3D <&cpg CPG_MOD R9A09G011_USB_ACLK_H>,
> > > > +                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
> > > > +           clock-names =3D "host_axi", "reg";
> > > > +           power-domains =3D <&cpg>;
> > > > +           resets =3D <&cpg R9A09G011_USB_ARESETN_H>;
> > > > +        };
> > > > +
> > > > +        usb3peri: usb3peri {
> > > > +           compatible =3D "renesas,r9a09g011-usb3-peri",
> > > > +                        "renesas,rzv2m-usb3-peri";
> > > > +           interrupts =3D <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                        <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                        <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                        <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
> > > > +           interrupt-names =3D "all_p", "drd", "bc", "gpi";
> > > > +           clocks =3D <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
> > > > +                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
> > > > +           clock-names =3D "aclk", "reg";
> > > > +           power-domains =3D <&cpg>;
> > > > +           resets =3D <&cpg R9A09G011_USB_ARESETN_P>;
> > > > +        };
> > >
> > > The USB device ctrlr doesn't have registers? It looks to me like
> > > you've created 3 nodes for instantiating drivers rather that because
> > > you have 3 separate h/w blocks. Either you should split this to 2
> > > independent nodes or move usb3peri resources to the parent node.
> > > That would only be interrupts because everything else is already ther=
e.
> >
> > Address map of USB device controller is 0x85070000-0x85070400 Address
> > map of USB3 DRD is 0x85070400-0x850704FF
>=20
> Then your DT should reflect that with 'reg' in usb3peri.

OK will add 'reg' in usb3peri.

>=20
> Why does the device ctrlr have a DRD interrupt?

OK, Will move DRD related interrupts from device ctrlr to here.
I have prototyped this as below [1]. Please correct me if you have differen=
t opinion.

>=20
> > The advantage of the current split is that,
> >
> > 1) With this model, I can use USB3 storage device for booting and
> > mounting rootFS as XHCI driver is built-in and USB3 device ctrlr is
> usually module.
>=20
> Sounds like a Linux problem. What does that have to do with the binding?

Ya, Both host and device operation depends upon DRD block. We need to do
Host or device reset release + setting host or device operation in DRD bloc=
k
before accessing its registers.

>=20
> >
> > 2) To reuse the usb device controller code as much as possible.
> >
> > If I create 2 independent nodes, then there will be more exported
> > API's between USB3 peri and USB3 drd driver.
>=20
> Why if that's a common split, then doesn't Linux have a defined interface=
?

If I just create 2 independent nodes for host and device, then I get kernel=
 crash
The reason is , Without reset release and setting host operation in DRD blo=
ck
We are accessing host registers. The only way to avoid kernel crash is by d=
oing
a hack.
ie, Io remap of that DRD register, configure for host operation and then ac=
cess
host registers.

>=20
> There is no reason you can spawn 2 drivers from 1 DT node if that's what =
you
> need. Describe h/w blocks, not nodes for drivers. Sometimes the h/w isn't
> partitioned just like Linux would like. That's a Linux problem, not
> something to 'fix' in DT.

I will send next version based on [1], please correct me if you have other =
suggestion.

Cheers,
Biju

[1]
properties:
  compatible:
    items:
      - enum:
          - renesas,r9a09g011-usb3drd  # RZ/V2M
          - renesas,r9a09g055-usb3drd  # RZ/V2MA
      - const: renesas,rzv2m-usb3drd

  reg:
    maxItems: 1

  interrupts:
    items:
      - description: Dual Role Device (DRD)
      - description: Battery Charging
      - description: Global Purpose Input

  interrupt-names:
    items:
      - const: drd
      - const: bc
      - const: gpi

  clocks:
    items:
      - description: Peripheral AXI clock
      - description: APB clock

  clock-names:
    items:
      - const: axi
      - const: reg

  power-domains:
    maxItems: 1

  resets:
    maxItems: 1

  ranges: true

  '#address-cells':
    enum: [ 1, 2 ]

  '#size-cells':
    enum: [ 1, 2 ]

patternProperties:
  "^usb3peri@[0-9a-f]+$":
    type: object
    $ref: /schemas/usb/renesas,usb3-peri.yaml

  "^usb@[0-9a-f]+$":
    type: object
    $ref: renesas,usb-xhci.yaml#

required:
  - compatible
  - reg
  - interrupts
  - interrupt-names
  - clocks
  - clock-names
  - power-domains
  - resets

additionalProperties: false

examples:
  - |
    #include <dt-bindings/clock/r9a09g011-cpg.h>
    #include <dt-bindings/interrupt-controller/arm-gic.h>

    usb3drd: usb@85070400 {
        compatible =3D "renesas,r9a09g011-usb3drd", "renesas,rzv2m-usb3drd"=
;
        reg =3D <0x85070400 0x100>;
        interrupts =3D <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
                     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
                     <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
        interrupt-names =3D "drd", "bc", "gpi";
        clocks =3D <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
                 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
        clock-names =3D "axi", "reg";
        power-domains =3D <&cpg>;
        resets =3D <&cpg R9A09G011_USB_DRD_RESET>;
        ranges;
        #address-cells =3D <1>;
        #size-cells =3D <1>;

        usb3host: usb@85060000 {
           compatible =3D "renesas,r9a09g011-xhci",
                        "renesas,rzv2m-xhci";
           reg =3D <0x85060000 0x2000>;
           interrupts =3D <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
           clocks =3D <&cpg CPG_MOD R9A09G011_USB_ACLK_H>,
                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
           clock-names =3D "axi", "reg";
           power-domains =3D <&cpg>;
           resets =3D <&cpg R9A09G011_USB_ARESETN_H>;
        };

        usb3peri: usb3peri@85070000 {
           compatible =3D "renesas,r9a09g011-usb3-peri",
                        "renesas,rzv2m-usb3-peri";
           reg =3D <0x85070000 0x400>;
           interrupts =3D <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
           clocks =3D <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
           clock-names =3D "axi", "reg";
           power-domains =3D <&cpg>;
           resets =3D <&cpg R9A09G011_USB_ARESETN_P>;
        };
    };
