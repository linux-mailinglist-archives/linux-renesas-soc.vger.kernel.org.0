Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25C2F64B7F9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Dec 2022 16:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235385AbiLMPBi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Dec 2022 10:01:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbiLMPBh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 10:01:37 -0500
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2109.outbound.protection.outlook.com [40.107.114.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51318209BC;
        Tue, 13 Dec 2022 07:01:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7Z2T5Jc8tknN3DiYcZIUt2th+8VnLpMlb5Dk2F0Y4W/zgIRjNLBcAOTnHn4mNzCfkpZSJCdcm3dpInDI1a5w1XlA7c/3yDWB8kJTSpL1kKgV5i1qsrXJLBbkG2NdyCEmgU5xRYMCMForI+GBJpK9wUa8gGuk8ceeJzwJQGAIIY3fBV0uf4Vms8MgnhXdtB+oX7s6/uuZ3BjlPH4XxclMk4eWtwKz8iMKajgrK2J9sqlqwBarc+z0q1PlmVcZhfgmxxo6tc/AZWu6CVNcS0AKNe7nG24wGJxm3DeOe11m2g9ATtR5hRdiy8Jc69qRUt0dbyF1et+xuxWerUrH1nm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDQYFC+Y+t7UUe17uhO3LbXI9OGoyzoJOnV1vadt91M=;
 b=fCex3le/TnVtkBymje/fDgY2SDNhylmovG9odvb/9PJKO73T2yTUreRSw/xqiJp1tziLHr+S7YSYocreTvIt2YqRD4G9zAKFbiPPW2m8m2/RFhiJpJSgoe3WNOr54Tth/PllLhpnYnmjt+womn6VGmUbJBST/yj15Cw69FmouddD/+ZaLiigHQo6K8dS01JhvOedlwVz86kTh9rYwsclYhBsSqcZsfEDXT9mTDZ1A8wC/+t3il+qMYU0j3F/7XYcm4OnSw/aNqlxAusp2lId3victaLDAAFCq8NWDcdFYIAqxQOAsi+PPQTwnrSraZ1aFsWRFspTVBBV7y8+W7ayDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDQYFC+Y+t7UUe17uhO3LbXI9OGoyzoJOnV1vadt91M=;
 b=c4lbAQpcvEXPwbgOYtUn4XLBXSYAbrIlmFLXsj6R2ANiF/ele5/l6zPbKD+WOc/dviqexXMJTZr68/jCql/XLTX3Xd83/Q2AbnPYRrqvsi8tscDpTBDXUxaxBhebWcSTGEUh4bib6v4BE5E2vLJOEGRtEnSIFmpBM8ov+QoB3ZI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB9757.jpnprd01.prod.outlook.com (2603:1096:400:233::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 15:01:34 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::2cfb:38d2:d52e:c8a3%5]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 15:01:34 +0000
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
Thread-Index: AQHZDk8gBgnbtRuyh02a6fh4PZaBEq5r4faAgAADFWA=
Date:   Tue, 13 Dec 2022 15:01:34 +0000
Message-ID: <OS0PR01MB59224764F969310126DB202186E39@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
 <20221212172804.1277751-3-biju.das.jz@bp.renesas.com>
 <20221213142921.GA958810-robh@kernel.org>
In-Reply-To: <20221213142921.GA958810-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB9757:EE_
x-ms-office365-filtering-correlation-id: 21e05574-6ee5-46e5-ab12-08dadd1aecf9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 46hD2uvmRpnrHgvbxGvLbRx0mdmFJlZ40w02qRCdxZ9Erh0N+f/nR/AwjqYk9rnrk/3aCiMqvh5/o90tSZ5qTNZiIuacKZclCJ+hbYoOun2rE2whIQRA6ZvGn6XQjE6cox1v7SuWJElG1vW3jZo5uEv7A0yKFspoSQmFv4cJbTZ9JraommjaJHqTy8hwtxmE1+kmQGzrKe+vVnvevdKVdtlfFMU36Wtv0cbSicgjW5AOoexqcutsBxSMnL9ogmOOy9zAcpE/7QdmchyLxJqE7mbv22WJrQWR1Rg0QHAGhB0BtGezxaRGOvOCplcZprSPT7qcP8k5vPxIeessNUz7tfDVJqmXTHYLmRbphVq2Gsi/uiprBrckeP90Giye457tcH5QmzfygAXouEgEX9IANqi8PWKukMb8OskxIZQCo5WqlueokC9Xanl7TYmAABPa+7YMyZleZoFhPLLL7tEuC0E8LO8yf8zYoDhZnrMmq3TQ/3mjtAtdkWQxeLMHywayIXt7IMyxbJ8Ri60nWbAsjarSCgzf4Xqlz1aHwgGN/r0Br6XE8y5gGucQhiXDP4apeQUO11rlcDbcAx72CirrAS422tQTxM392NvvJ0CzByurr9DF6VLQ4FBiWL5/PrCBceB4gvQBmV5Yev/iGkSJ+rwSm6kaKIPsvyn6G3OVluKWgH8z952VZFI0inSkI2QvNhvMGHbZwhhV++uoIqVvmCXQBXFbx0oreCbdf1Eda6s=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199015)(478600001)(8676002)(64756008)(38100700002)(66946007)(66556008)(66446008)(76116006)(66476007)(38070700005)(122000001)(4326008)(9686003)(55016003)(71200400001)(86362001)(26005)(33656002)(6916009)(6506007)(7696005)(54906003)(316002)(2906002)(83380400001)(52536014)(8936002)(5660300002)(41300700001)(186003)(32563001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xdQoDnOEe/iydGYmTpFZUOQcuxPAX2LdgQtAdoRvHC7c7EfmPEMsdPAzmYJL?=
 =?us-ascii?Q?7WUUYtZiD0XH41v5E5NjiMPpk+Dj6oApNLxg6e43UU00+2nXpdIF6m67MpcN?=
 =?us-ascii?Q?RzrZe7UoTzTdxLSL4iwZHOkVw4yCpx0szEhXlTt1BX/hdTlhUv+178lo1vin?=
 =?us-ascii?Q?gx6IoqPiDjzSGRcUuK2ZaeQc2cvlOgjdyTr1hvhwaeg9hgvwPKFtQYBVlicW?=
 =?us-ascii?Q?PwAoTOy1t7l35HTR00AYZSjU8JMp93cT6muHqJSnszSTZXVNRh2f0Vi3njGq?=
 =?us-ascii?Q?HSRh/jm2mPtYaO78J5SMd1plhaHkw0otRiBKUPDM/cTjnwbhKKPb+Jg27fCJ?=
 =?us-ascii?Q?IsBKRg1XdfxkYxYbuRVsjhHGjeV8cyc5vsEmApOplblnxFSH6Hbl5leR+NHB?=
 =?us-ascii?Q?kuMiXDR0ckX0VNLzaGn0P09+f3m6HIM1ouJ5kloICHlvR00upuuhG+HUA1hS?=
 =?us-ascii?Q?eqQXr+iVM3iwetqlSf/adnsV/39UWBmjCm4fmWmRAr6T9D5L6DrLjlcVjiIq?=
 =?us-ascii?Q?4N/vsQGMpHQXzXi7ZrfP0NFucU4ljlV7C508hRckdygCbxMF+0HNX6f/VtXg?=
 =?us-ascii?Q?Vj9fDO2rRwGxi4CBKyj0nwzhAUv9gwImlxCrNApCqUgfqj76Gq09wtCtZkxR?=
 =?us-ascii?Q?kcJ0Hy+AigEp9hfsehHV+Bi/QllNcxFn6TCCQUWc/FPBVaCuM13f5Ajpy9eI?=
 =?us-ascii?Q?wDwjKtfILzXuFRsHsiUQ2FEDs4hpxDSuJ4Wj+E98nsKNQ0ceivzD2CZ8g17w?=
 =?us-ascii?Q?HFtuQQi3S/jkfMJsQn9hPc40gGlvLdLfVu2nSVD6F98q5q2+FS7CuQBJKDs6?=
 =?us-ascii?Q?ipa+/nOE33p1XJxp0KKjCuJwEYNyNOYSYveA86swgCNX1DHSDakFHhFJxs8/?=
 =?us-ascii?Q?DSFrUJ9x6KiYBvpHJlJTmAYQ2MPijqK6veGN3NuyUlOVmwQmj6PvLPp1ymg6?=
 =?us-ascii?Q?BM0k+qszF2wlBWzdl7zGKQaT5Ui5b/iMhYLARLbt4HG7NNzre5+bKtUSq2T+?=
 =?us-ascii?Q?oXAEjaqI6S+hcV+rJXFnyMO6upHa/EjJ+xZd2MC93LUdYN/a1xb5xlSE8FZx?=
 =?us-ascii?Q?jW4F9M3GaiC7usl6Ljc0T4X2cfAKpC4Wwqig3PM0k3H6VBsc7PVzBsYMYHC1?=
 =?us-ascii?Q?+mc8XBw6tMLOEKRsQG8PDGDmBWILJa0iDW9CQS2wL0B5vJsuyylDQMuXb2nb?=
 =?us-ascii?Q?xqBy8E38PvJw5yRsq8Huh4UfkpocMpKwqBZcX0VKnaG+T5A8fODa78WsG9ee?=
 =?us-ascii?Q?Rz7CmmqBoz1p2GKtsAMZ2C4ywFt/I95cYedm4YJprqB8PD4wnOIEOEORID/o?=
 =?us-ascii?Q?g5q9LwRGIXoMEY57j9Zije/09QfBwu1Kcxu6kTMBrqdfxdSYnJzqsqjJMVVt?=
 =?us-ascii?Q?N888oDnPDTXEZ4D8HndzQDYVnphkxin9sf4l9Rf5A5p0JgiB9Cin9ZvsLaxl?=
 =?us-ascii?Q?0aOfFEGmueR6GH35e3tNVTLgO/HzPauuVVp1b54WtTzOu6l7jmNgkKw4NI1i?=
 =?us-ascii?Q?Nl2TQ+SkVXZNy7EqX0bSSgUBvNjPiYjNdXn68hf39AutpRUmtA3RLi0frSMr?=
 =?us-ascii?Q?a3jpvRWs5f2z05gjz4lNSNAqWlmde3UL/4WrzaxzVVkCJ1OGfJNChxkrELga?=
 =?us-ascii?Q?MQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e05574-6ee5-46e5-ab12-08dadd1aecf9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 15:01:34.0551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p0DUaH/WMFPgdjiUxNmnM1CPWLCBykPIjr/CNcoEj/ozQSxDMZRe//CPFL+9lORrja1sJBDYzL1OX6jvvvKJsjHIF+MsaKdsTBM3Uzeivko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9757
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

> Subject: Re: [PATCH 02/16] dt-bindings: usb: Add RZ/V2M USB3DRD binding
>=20
> On Mon, Dec 12, 2022 at 05:27:50PM +0000, Biju Das wrote:
> > Add device tree bindings for the RZ/V2{M, MA} USB3DRD module.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 123 ++++++++++++++++++
> >  1 file changed, 123 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> > b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> > new file mode 100644
> > index 000000000000..0c473c3398b3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
> > @@ -0,0 +1,123 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +
> > +title: Renesas RZ/V2M USB 3.1 DRD controller
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description: |
> > +  The RZ/V2{M, MA} USB3.1 DRD module supports the following functions
> > +  * Role swapping function by the ID pin of the Micro-AB receptacle
> > +  * Battery Charging Specification Revision 1.2
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - renesas,r9a09g011-usb3drd  # RZ/V2M
> > +          - renesas,r9a09g055-usb3drd  # RZ/V2MA
> > +      - const: renesas,rzv2m-usb3drd
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Peripheral AXI clock
> > +      - description: APB clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: peri_axi
> > +      - const: apb
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    items:
> > +      - description: DRD reset
> > +      - description: Peripheral reset
> > +
> > +  reset-names:
> > +    items:
> > +      - const: drd_reset
> > +      - const: aresetn_p
> > +
> > +  ranges: true
> > +
> > +  '#address-cells':
> > +    enum: [ 1, 2 ]
> > +
> > +  '#size-cells':
> > +    enum: [ 1, 2 ]
> > +
> > +  usb3peri:
> > +    $ref: /schemas/usb/renesas,usb3-peri.yaml
> > +
> > +patternProperties:
> > +  "^usb@[0-9a-f]+$":
> > +    type: object
> > +    $ref: renesas,usb-xhci.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - resets
> > +  - reset-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r9a09g011-cpg.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +    usb3drd: usb@85070000 {
> > +        compatible =3D "renesas,r9a09g011-usb3drd", "renesas,rzv2m-
> usb3drd";
> > +        reg =3D <0x85070000 0x1000>;
> > +        clocks =3D <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
> > +                 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
> > +        clock-names =3D "peri_axi", "apb";
> > +        power-domains =3D <&cpg>;
> > +        resets =3D <&cpg R9A09G011_USB_DRD_RESET>,
> > +                 <&cpg R9A09G011_USB_ARESETN_P>;
> > +        reset-names =3D "drd_reset", "aresetn_p";
> > +        ranges;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +
> > +        usb3host: usb@85060000 {
> > +           compatible =3D "renesas,r9a09g011-xhci",
> > +                        "renesas,rzv2m-xhci";
> > +           reg =3D <0x85060000 0x2000>;
> > +           interrupts =3D <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
> > +           clocks =3D <&cpg CPG_MOD R9A09G011_USB_ACLK_H>,
> > +                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
> > +           clock-names =3D "host_axi", "reg";
> > +           power-domains =3D <&cpg>;
> > +           resets =3D <&cpg R9A09G011_USB_ARESETN_H>;
> > +        };
> > +
> > +        usb3peri: usb3peri {
> > +           compatible =3D "renesas,r9a09g011-usb3-peri",
> > +                        "renesas,rzv2m-usb3-peri";
> > +           interrupts =3D <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> > +                        <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>,
> > +                        <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>,
> > +                        <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
> > +           interrupt-names =3D "all_p", "drd", "bc", "gpi";
> > +           clocks =3D <&cpg CPG_MOD R9A09G011_USB_ACLK_P>,
> > +                    <&cpg CPG_MOD R9A09G011_USB_PCLK>;
> > +           clock-names =3D "aclk", "reg";
> > +           power-domains =3D <&cpg>;
> > +           resets =3D <&cpg R9A09G011_USB_ARESETN_P>;
> > +        };
>=20
> The USB device ctrlr doesn't have registers? It looks to me like you've
> created 3 nodes for instantiating drivers rather that because you have 3
> separate h/w blocks. Either you should split this to 2 independent nodes
> or move usb3peri resources to the parent node. That would only be
> interrupts because everything else is already there.

Address map of USB device controller is 0x85070000-0x85070400
Address map of USB3 DRD is 0x85070400-0x850704FF

The advantage of the current split is that,=20

1) With this model, I can use USB3 storage device for booting and mounting =
rootFS=20
as XHCI driver is built-in and USB3 device ctrlr is usually module.

2) To reuse the usb device controller code as much as possible.

If I create 2 independent nodes, then there will be more exported API's
between USB3 peri and USB3 drd driver.

If I move usb3peri resources to the parent node, then I won't be able to
achieve 1)

Please let me know, what is the best way to move forward?

Cheers,
Biju





