Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188DB3B1B4F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 15:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhFWNlH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 09:41:07 -0400
Received: from mail-eopbgr1410117.outbound.protection.outlook.com ([40.107.141.117]:25138
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230061AbhFWNlH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 09:41:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ul/SY6oNWv5bViyb9mkMEL6AmQo5z+x9u+KHFVCyxydBJdtOWmvHf5Kg0y4xumFyrsUTU4H7U4uGtlxIXME5fk9C7UiuvfHeq9g3W6zq61By0tppOSylW8aEVZd7JJGOIVL4u5VlYJMe5Fbj8WoVCVy1DjdQnqzzlqafMYNIZpx9WHCD9gkuqH1AxG/5ROGGx5qTkYu5gdT7M94igFKlxGKtGSrb9lZoPe/uJHFYwP/SkjjYKIKCgPL5Ii2E2VGIaEvyUYDoprgrahjF0GqsYBYebr2WbP5zQzfUxtw6K2E59EW5uDIZofmntjTssxXtzYdd0QV3FutR4dnTbrNwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liUDrwzHLYQ6cxIO7Jkq4JLweQSC7as4+S4jAKLYpSw=;
 b=CJXAo9gq8omkG3qS8A6xzvXszI17wL+MR5wh5o6pXdCfoN5n2M2Jwoupbn2HmJbm4Mw9GqlJ8EKhshVjdvPtwbU2C/Th4KtNHFXDNwtpUq9Vz3VRXw22uDqmMxhc4H39D6PsrQuJLV6waXexJS+t8W/DvLMD2cmBYUXoORdfglu0DsGHU8RMZe+ySk0B9FXpEtq34G/xTynh2rVqt49iAdtizJl3D0pgKjBc6AhFm9lrN8FVrqriYB0dmOOyLNVzOxfdRO86pSf2nzCR2vlefFBMHhsWoIn94POjDiAEBpgHtkSUa6pPHtvwOhga5x6r2Z19xfQnITFKemwME77XAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liUDrwzHLYQ6cxIO7Jkq4JLweQSC7as4+S4jAKLYpSw=;
 b=JHNb7muVdrkYQLKLldfPAGaWCBLb87JW15ZfKb+3JL35l3clAU/OVvgc+2C/2J8oMPOdouA95n4OOoqj9HqzopMrOo69cfsoGjcB6DYH7ikBIgv0/ouVuMfGn3xzL0gabF94vrmv98Ly0AtjeOr/0vtexxOrWCXiKvHcyCrsRjs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4695.jpnprd01.prod.outlook.com (2603:1096:604:74::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 13:38:46 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 13:38:46 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 01/11] dt-bindings: phy: renesas: Document RZ/G2L USB
 PHY Control bindings
Thread-Topic: [PATCH v2 01/11] dt-bindings: phy: renesas: Document RZ/G2L USB
 PHY Control bindings
Thread-Index: AQHXZoFkEsylYGbSPUy+XB9R+DfKg6sgQr2AgAFYKgA=
Date:   Wed, 23 Jun 2021 13:38:45 +0000
Message-ID: <OS0PR01MB5922ECC2B573F1F8E170744F86089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
 <20210621093943.12143-2-biju.das.jz@bp.renesas.com>
 <20210622165851.GA3840386@robh.at.kernel.org>
In-Reply-To: <20210622165851.GA3840386@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [86.139.26.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60a9c6c2-f93a-48f3-41f3-08d9364c3984
x-ms-traffictypediagnostic: OSBPR01MB4695:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB46950577F261D97B3936F54886089@OSBPR01MB4695.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yi1oC7pc8de3xNX1YlHvXgNPg2EGrkZx+UPf6xqfO3Q6G5uFWw3zp4tfQlTJTGnmVyKoQfrJ3PCJ1wfq4RSUXwYvelUDLCTCckqF2gncdrbk+51GBSER/KE+SUgAGRVDXHFHD0xgHTny6enzgRTPCcJehqfSIIwPfmCaa0x6/lvGxYzHMjMb1ZvRtVdWxHFTNOwikLuN1XbDEbuFWSkhBwByyZ9npVeMikBUK+2z8J/BwnITssOwTqLyyBPYJc1pUJhlwzqwJw9slhQsjav3jbTQwD+n/2QOgvR/+kNCwJA/tYj/WwHtP++hhjtaB2k3d9QiZr0VbtCrJ7BGR/eYCrV9plbJh7OMOnrXnHgj0BGCqXxOzuNUMLjEHSX2ea+Ei/1UavgymfvEgeJmk0iuLCpiQp7z7ZM7XpLOl+AGeaIKY/TUjDJLA47izqd68KDWP5tufoeOrisa8bH8EOyqUFeXnJoo1XuX3k/Y52G6tRY2StyXCrr/ibMo1hCn4vjWEViAvEVAZnYQbsmLH6KDaT0y9RVxagCMdgScophS3BSycwcjXGMgFmuqhK2xIn5sQFp4rwgCGANR8iR61F5XcHs1XFa0MIpFlG/epkmMUHPWBg4e/uUecHi+ioukla6HHj7FA5RPGuxrM5HhHhzv77zADf56p3tMgpnw/o0eLhm6VMR49+AXnXfqZD06drRAgPsN5YBWdu+rwTx7XnEPDcFvRdSYJpUWr67jwKsIVio=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(76116006)(45080400002)(478600001)(6506007)(26005)(33656002)(54906003)(186003)(83380400001)(6916009)(316002)(66946007)(4326008)(71200400001)(122000001)(2906002)(5660300002)(7696005)(52536014)(8936002)(66446008)(66556008)(66476007)(55016002)(64756008)(38100700002)(86362001)(8676002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P1KGjP/jWN43PBwDnGOc9CLeSYikgMulAYo+zlOC9fcHGRWenOkuUtkmE9mm?=
 =?us-ascii?Q?p53d6LhGOLL2fD6WN3vDNJK/f4/q6nNSHcYoXsYOBWZL3VJ7p4Gx7Jy5Eavm?=
 =?us-ascii?Q?uha2/f51JjKukJIhpCtTlOLDZVBoJeQAhF27/4XteFXJPlSCEAzkZgWQ9L89?=
 =?us-ascii?Q?Pq4FzTKfD4ZG5Vth1I4/yW7MGiLFsLeUeDvGjjT1JRGZkJ/PaJ3j9bVBmJWj?=
 =?us-ascii?Q?52aGj3WbZmTEGN7wEPVDQFgG/sg9Gmpgy/cWDT5Bz/gIE2goMKj27Uif0gU4?=
 =?us-ascii?Q?da+0h3d+od9nv72yAjjivpQrMcgcTExdt0VyVjh/s+/52yP09zUAsA1Y6Twg?=
 =?us-ascii?Q?pzdGlkWC6Ex6pEYDyQW1mXkhFSimDAsz76ijfbE9DiPknJyA1BikAgaX6BME?=
 =?us-ascii?Q?Hm2V1WAHx8Esmgzmk8dQq1qGF6MIeGPOUabi7IKmQm3eNTUxu3DRNAO4nvvd?=
 =?us-ascii?Q?ls4Hv1Sa+bxNs0bNRa25/pILKKv1EiWLEIU4ZB9Bj5Ijz7PGs+zgX27sy8E9?=
 =?us-ascii?Q?AhPZkzSEZvTzCYewAAnOw1RN5pJ9BuidA8LcjUuAmRtK6z+PJmF+XhRR3Jfb?=
 =?us-ascii?Q?RtlSKghZGXznw5Aoe6/SEI2G/OfdI2P2tJ04Ht09uKefrzM5GsMccPEjmU6Q?=
 =?us-ascii?Q?P66xWdf+YOKtOZjp7OUtBLuZgtQcRFaCqq6m7QPVx6usodWuj/VVbbahBHPO?=
 =?us-ascii?Q?zoAsl3oPXfVUydMkOloFqV7bukvMzBWlsa6HCgvWNaeQut8pbLn6yTGlQc/d?=
 =?us-ascii?Q?rggxa0fUKI9NSFoSiTy20VHu27k2khdCAlLnd8rlm7B5OSqepwhF6D3VigAT?=
 =?us-ascii?Q?2gS+DRdYAwBp3QfDEYobcN8Ri/cGXBJanfJuygHCbAxqn88thPS318bVvfV8?=
 =?us-ascii?Q?8p1Ky+KeBlO6kV3H67PoHpw4m0u+/baukLAn7IqFdkQ0XVh2F/fYcdUUqLzW?=
 =?us-ascii?Q?Wkb6G8cDBMM/Y/qF9WPdLSwaLIUdHE6spPe8F/m7lGfn8rq8zLY8fpXtGC3L?=
 =?us-ascii?Q?VlaBxJZlweAulGNq7tw7g+o+qLoQ+0XkyvK9Ol8I1E6Qh1Ffv3Vh8l7Ib5lq?=
 =?us-ascii?Q?g7Le1FboSwgNyFouzDGNFJoSdLy/jJT7kjF2bxWKh1vegwE7A/Lg4SF+HK8V?=
 =?us-ascii?Q?Q0wdOp7hiy7tsLgPJtW+irNtEK0SWe7GogxnZ3qnhsyqk2A0f9aGqmunx108?=
 =?us-ascii?Q?Q2FtGcyqWkqgCh3bMAp52IGmcYaU0p+kXWxqu3B8xo4AcaHDqL1GkdvijOXi?=
 =?us-ascii?Q?3U1NSMFX9jpNCRSoCZTqGCQr15NXpavnsD3uwezRf/SxIO3WIN+UdT5XLuak?=
 =?us-ascii?Q?+qAgxjz/W7JiW1WJBPkaA9hC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a9c6c2-f93a-48f3-41f3-08d9364c3984
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 13:38:45.9003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: evzKQjbILuZ8eLLXVV5jUpWFq3rZT5TUhWFmAAD7L4KFrOUNAFwTUPspZp2EkaWxa7+vJe4w8wRM86DvE4OLDHkWbbeNfxaU7KsLSH6n7ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4695
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH v2 01/11] dt-bindings: phy: renesas: Document RZ/G2L
> USB PHY Control bindings
>=20
> On Mon, Jun 21, 2021 at 10:39:33AM +0100, Biju Das wrote:
> > Add device tree binding document for RZ/G2L USB PHY control driver.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > V1->V2:
> >  * Add clock properties
> > ---
> >  .../phy/renesas,rzg2l-usbphyctrl.yaml         | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> > b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
> > new file mode 100644
> > index 000000000000..8e8ba43f595d
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.y
> > +++ aml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> > +cetree.org%2Fschemas%2Fphy%2Frenesas%2Crzg2l-usbphyctrl.yaml%23&amp;d
> > +ata=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cc6bbf5f6ce334eaa722a08d=
9
> > +359f07ad%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637599779421910
> > +039%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT
> > +iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DJcf6Om4DehifCe1KO1rmt5LxT=
B
> > +6jtGoQLD1MoqWGM%2F0%3D&amp;reserved=3D0
> > +$schema:
> > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> > +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cbiju.das=
.
> > +jz%40bp.renesas.com%7Cc6bbf5f6ce334eaa722a08d9359f07ad%7C53d82571da19
> > +47e49cb4625a166a4a2a%7C0%7C0%7C637599779421910039%7CUnknown%7CTWFpbGZ
> > +sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
> > +3D%7C1000&amp;sdata=3DLlqPRLf9%2BGrEdSapxCFhwxVKcXTVh9ECr%2FXPN0SIzi4%=
3
> > +D&amp;reserved=3D0
> > +
> > +title: Renesas RZ/G2L USB2.0 PHY Control
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description:
> > +  The RZ/G2L USB2.0 PHY Control mainly controls reset and power down
> > +of the
> > +  USB/PHY.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - renesas,r9a07g044-usbphyctrl # RZ/G2{L,LC}
> > +      - const: renesas,rzg2l-usbphyctrl
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
> > +  '#phy-cells':
> > +    # see phy-bindings.txt in the same directory
> > +    const: 1
> > +    description: |
> > +      The phandle's argument in the PHY specifier is the phy reset
> control bit
> > +      of usb phy control.
> > +      0 =3D Port 1 Phy reset
> > +      1 =3D Port 2 Phy reset
> > +    enum: [ 0, 1 ]
>=20
> You already have the const, so this doesn't do anything.

OK, will take out const.

>=20
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - '#phy-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> > +
> > +    usbphyctrl@11c40000 {
>=20
> usb-phy@...

The IP is called USBPHY control. It mainly controls reset and power down of=
 the USB2.0/PHY.

So not sure usb-phy is right one here ? I prefer usb-phy-ctrl instead. Is i=
t ok? Please let me know.

Cheers,
Biju


> > +        compatible =3D "renesas,r9a07g044-usbphyctrl",
> > +                     "renesas,rzg2l-usbphyctrl";
> > +        reg =3D <0x11c40000 0x10000>;
> > +        clocks =3D <&cpg CPG_MOD R9A07G044_USB_PCLK>;
> > +        resets =3D <&cpg R9A07G044_USB_PCLK>;
> > +        power-domains =3D <&cpg>;
> > +        #phy-cells =3D <1>;
> > +    };
> > --
> > 2.17.1
> >
> >
