Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D09B63BA844
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Jul 2021 12:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhGCKz4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 3 Jul 2021 06:55:56 -0400
Received: from mail-eopbgr1410119.outbound.protection.outlook.com ([40.107.141.119]:29312
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230114AbhGCKzz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 3 Jul 2021 06:55:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXpg36jP1cLPX1JKUE4n7EV3jTU9AF/gIHdOz6JVMS4kTEPDH/I7+tlbJBHwAGM2OaB3W9WUGCGx/O/dM+4rE+qBfaH5LjAswFEpBxW3U55zDd5Lcdw6xvxpVu85zGV7tB9E/+qjwPoMebmUSplMMNVsioqAhw9zPc/8hRVji/aV7+gFZZx1wxIJxSBgCXUGWuLWiB0b2RByDaBDeznCSrJNVDv8Mviup15/1yrUNOoE6iNBRRK9EfGneZDXLSc63EZl+ysYzyz5huRIXPxhRKNo2vZ/m3N4Mnveyym6KpqhSDHrcqm9kLBPhplrenX8pasdFn4whCKS/whKaaEU5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/x/1TKjIHIM8bjcV0ap/SXEEaFXCzwal0xGmsR04zbc=;
 b=bRs1R4maC92DwpOREE3zV2Y9/76N86aOwonasRq8HxtCOG2I7dkmE+CTcGQ0okjUHvAg/ScT4/prMFkUM3u6TEjJgnnlgS+TMKAj1KGGJH6F0N0f/M+l7BElBYir//h7blY6NAVbYZoWE5UJVzaTXdgLMtvD7fajz0H+TdDJ5njg+ZRsdNqpI4/O0iK7uBqa1EDfUYGRuKxv0+eBGLTI75p2I7v25C9RVRAGVI5u49dY3JPCzzbwQtEgz9pTTZdHAil60GE0ORuX38ufyrMmp95edBl1klXPTxLthbmucKLw1TDTxXhRiORN7W7MP6+vv22yXknfK2R0ra71n+m5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/x/1TKjIHIM8bjcV0ap/SXEEaFXCzwal0xGmsR04zbc=;
 b=cnk83lBl3Sn8/Z5QkRZlS9/MA3orDlE7zTKw6aICLyxZg32SRJYO01QLUDaawcVK5xD6ItJeNV+zBJpPAPodcfJlWiRCgsGwUqaUuRHY34VmcNogQHCk//l+e4VJo8h9iWRtHns67xV7zQO2oUappbNVNs6c6h9mK76ttkspRAM=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB6100.jpnprd01.prod.outlook.com (2603:1096:604:ca::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Sat, 3 Jul
 2021 10:53:19 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%8]) with mapi id 15.20.4287.031; Sat, 3 Jul 2021
 10:53:19 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 03/11] dt-bindings: reset: Document RZ/G2L USBPHY
 Control bindings
Thread-Topic: [PATCH v3 03/11] dt-bindings: reset: Document RZ/G2L USBPHY
 Control bindings
Thread-Index: AQHXbYHZqDif+eSem0CtpPP/RFXBM6sukvsAgAKE85A=
Date:   Sat, 3 Jul 2021 10:53:19 +0000
Message-ID: <OS0PR01MB592235741403C799B5824A72861E9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
 <20210630073013.22415-4-biju.das.jz@bp.renesas.com>
 <20210701202348.GA2863189@robh.at.kernel.org>
In-Reply-To: <20210701202348.GA2863189@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [86.139.31.53]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 10ca8b2e-df90-41e6-924d-08d93e10c502
x-ms-traffictypediagnostic: OS0PR01MB6100:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB6100F972E27A5723A1A4DA1F861E9@OS0PR01MB6100.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bhUPszbp9dv8bLEMXOEFjCHifUTH09BtsfrXarYt4PvO0FeIgJTCPI4xfjLyb8T7t2kV2qCQTAimLJFgQYSW6QbfEmMEDkkAy9G+NP2qjl799SSYLOeZfhC+qSIXMzBTrObPNbpTYPQRdgRQjRgQpIYyAdGjeB0KJa0aNB+G45c4iinx6P4jY6hAvL+/SUY1VMMyW0Rmu2U+FaGfrS20SPUcE8/DaMYFJg9mm9U2UmJFYErbS4c6tfd3t/blM+8c8gLJqUD830g8GL6+Lo8T8hvRyuGZYJHb0iwUgLw0FK3+qSSPbgoFMjkwq3tStYcKV7WWbAGQdiBf8zz5GDGaUV8ccjAhPFkvTIivQMifubs28w0qhkfwmAHAn5PHLQBh2NtnZKWqA5slTo8zfrNjoq76dUoYPDg3ROQFqbHGoqMAE4iidrcvbA9McHN05eOwOPUAzmDj8S5AapTmbAhobuJYN71OV3PDL6jMh4Lto560wjA4GjHdz0zH8hHQiRQP9m9+NifA9smJ5HD4QkDG9HmNw7PWA+0ERd71mbZ+LMj4DZQyrJeeksOXVzhA/Xte7vuSOZupQaiUyoVUGEUMKP8u3pj8oYp80bEWae9Tt/bLANGl3xVHRfWFpdKPZ6xjp8GARFmTyaQW7ZDj6IhBkxE+sfceFsvWxnLruzA6rhKYz0vjgnAvb/wjrlRyrQYPLdcV2loShLfrmcwJv51gscOqea4yl3me1ZGD1lf+dC4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(39850400004)(376002)(136003)(8676002)(5660300002)(8936002)(45080400002)(316002)(478600001)(38100700002)(9686003)(55016002)(186003)(52536014)(71200400001)(7696005)(2906002)(83380400001)(122000001)(86362001)(54906003)(4326008)(66446008)(6506007)(26005)(66476007)(76116006)(66946007)(6916009)(33656002)(64756008)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?asNuCxbQ9J9yypFo6xK+hL1MUtmxI/PS9S8NsiI03icCDWXyhlLdFyW+G4sv?=
 =?us-ascii?Q?yXWXrZLpvy5hf5qsl9+UtWZoJ4tABut2ziQLO/HMZjIB3YXbpUZlYIWg3sv9?=
 =?us-ascii?Q?0MBTHadzcUmFy9W4XpzSywystM2wS8rcPdnRHes8N84Vp4mL7JeGq0EL/h5e?=
 =?us-ascii?Q?ZTOdHQf694LXJSkGDxtCLxZQnUH4TF3C1y6mK+bqtoXUmAx37B2OxiZ/cTm2?=
 =?us-ascii?Q?JYi023/eOZfZBw97ZZFzCB1q9o30UGYDknQB1vEFtKbm9Vxm83U+an3u54qu?=
 =?us-ascii?Q?HFBJAgjpc2hmHrcf9dOBWDSyP93WgmGri9BmivLuvRT70a1kMUV4SXJVH/J8?=
 =?us-ascii?Q?V7l+5gb+yRquBNWt8OBHwA8IKKB25Mbl5e0z9OJiFThY5a1NLDaat3Roa2DV?=
 =?us-ascii?Q?OtZSy87a7Cv6K4Oxi6Nl83qTcdBFt/arXQbFFSpCJYqr2tav+/UaNs+wxq9s?=
 =?us-ascii?Q?FnGEGK6NzisxZRzuH7QVb2T9AM5k1oDPRZ1C/0aHAkaRFg2L9YUXSlAhiKJd?=
 =?us-ascii?Q?UOaPv1Ji/y+Vw+VbCuSZIWK/g7FREpvvI9iYW/ATtRpgJ3dPKFq6Fw62fR87?=
 =?us-ascii?Q?5Of9gO7mqlmxL222AUsZv553+FQULhxV3n/vsQJ/bzE/9xLfrdFyL1Xal+Uc?=
 =?us-ascii?Q?ms6yX5if95bTJenBi9hhZjV0+MCe51S15IWm/zCtFda9VpaYMq/xFSwx9AbN?=
 =?us-ascii?Q?Je//rrOCCYEAfoDagnl6KDf9XUgPbfULypImKjdY/el7qKFfuuZdF3S8bm++?=
 =?us-ascii?Q?IVB4KvKZdU0VCEETRGMAuYKTGuDremk84qyXg/uDb832bmMyORCwSuxYD/J5?=
 =?us-ascii?Q?Hdb89ByA5S9TnYcfsvODwvkeU2y3mfvg3MLMencwo4iofFVnNfw2zTY/ct2c?=
 =?us-ascii?Q?+aaxzmDWpamV9fQ/dBXrwthxtnON87x4DrNJ1BgnHcCFdbuOmJ8VM6yDJy+Q?=
 =?us-ascii?Q?TNdHCEkpqBALIjoH8Z+qGD/MsrzexsdZbTaFJWr2zUo/mOhoqJ3Y1kJVqnYy?=
 =?us-ascii?Q?6vov5txGkrxtOqH3VDIj5RL6GvuELs26/F/Ze4W1QFzUhxTfq5mwnNrbCzvq?=
 =?us-ascii?Q?EeD044qgbCFQnjb77gw0APHIQ23yKiLaETlj0nNsuF3UcETa2L9p9dDMiJWs?=
 =?us-ascii?Q?OhCBOhkw4nFyUG3df4XGvz4JEB66wskoDQJDJpUxcD3mfXAKMIIAaXhEYD2I?=
 =?us-ascii?Q?/O53zKmv6aOSNqXsoSbP/p1kGuun3q51ExTFMyMSzmNvIHYSt8WMAhJe+Hi8?=
 =?us-ascii?Q?8WBJA786JG6kYdXmDMdBQF93GnejGR3edtfZghYjb35oLoR339bJQUxs87Qo?=
 =?us-ascii?Q?HUI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10ca8b2e-df90-41e6-924d-08d93e10c502
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2021 10:53:19.0476
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UrCCdpN6HfQ07Zw5i6tq1dOsD4KH9US1Tc90s8Z9PPgmla1kLBumg4NHwHlC7Fq9nVboVqsJfDU1gxDKL0pY7UeqyZhr4/yBSa2ik2w6ouw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6100
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH v3 03/11] dt-bindings: reset: Document RZ/G2L USBPHY
> Control bindings
>=20
> On Wed, Jun 30, 2021 at 08:30:05AM +0100, Biju Das wrote:
> > Add device tree binding document for RZ/G2L USBPHY Control Device.
> > It mainly controls reset and power down of the USB/PHY.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  v3:
> >   * New patch.
> >   * Modelled USBPHY control from phy bindings to reset bindings, since
> the
> >     IP mainly contols the reset of USB PHY.
> > ---
> >  .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 66 +++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.ya
> > ml
> > b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.ya
> > ml
> > new file mode 100644
> > index 000000000000..2a398c7ce7c8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctr
> > +++ l.yaml
> > @@ -0,0 +1,66 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> > +cetree.org%2Fschemas%2Freset%2Frenesas%2Crzg2l-usbphy-ctrl.yaml%23&am
> > +p;data=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7C770350c845f64b015f68=
0
> > +8d93cce253d%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637607678355
> > +475757%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC
> > +JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D9vEtPav6hmc1axa6Vj2NqT=
%
> > +2BT0EOoyXTelx2Ft5fCEKE%3D&amp;reserved=3D0
> > +$schema:
> > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> > +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cbiju.das=
.
> > +jz%40bp.renesas.com%7C770350c845f64b015f6808d93cce253d%7C53d82571da19
> > +47e49cb4625a166a4a2a%7C0%7C0%7C637607678355475757%7CUnknown%7CTWFpbGZ
> > +sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
> > +3D%7C1000&amp;sdata=3D1e4CSqGpir0E%2B7izDrdcuB%2F%2FpL7fqfPNRBPCs0w%2B=
%
> > +2B84%3D&amp;reserved=3D0
> > +
> > +title: Renesas RZ/G2L USBPHY Control
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description:
> > +  The RZ/G2L USBPHY Control mainly controls reset and power down of
> > +the
> > +  USB/PHY.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
> > +      - const: renesas,rzg2l-usbphy-ctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  '#reset-cells':
> > +    # see reset.txt in the same directory
>=20
> Drop the reference. With that,

OK. Will drop the reference in next version.

Thanks,
Biju

>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> > +    const: 1
> > +    description: |
> > +      The phandle's argument in the reset specifier is the PHY reset
> associated
> > +      with the USB port.
> > +      0 =3D Port 1 Phy reset
> > +      1 =3D Port 2 Phy reset
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - resets
> > +  - power-domains
> > +  - '#reset-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> > +
> > +    phyrst: usbphy-ctrl@11c40000 {
> > +        compatible =3D "renesas,r9a07g044-usbphy-ctrl",
> > +                     "renesas,rzg2l-usbphy-ctrl";
> > +        reg =3D <0x11c40000 0x10000>;
> > +        clocks =3D <&cpg CPG_MOD R9A07G044_USB_PCLK>;
> > +        resets =3D <&cpg R9A07G044_USB_PRESETN>;
> > +        power-domains =3D <&cpg>;
> > +        #reset-cells =3D <1>;
> > +    };
> > --
> > 2.17.1
> >
> >
