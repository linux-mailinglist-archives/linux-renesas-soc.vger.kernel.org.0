Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22CDAE7F07
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Oct 2019 05:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbfJ2EOW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Oct 2019 00:14:22 -0400
Received: from mail-eopbgr1410108.outbound.protection.outlook.com ([40.107.141.108]:27360
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726705AbfJ2EOW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Oct 2019 00:14:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNZJFidl9oxXYJWzSZOUx8c69eNWrLJPOtXdv9Ojrirwywrl1RZv8YaA/ywMLoNhfk+XEHTeOgHHa4XtPMM4cNbaV/iT3QIJaC0wQqsJJKc1QIx+CVQI/mg7JC1iueyMBd+GTvo72un1B5PDIFum+HcuD8ueT0b1s/ynKItD8xJMMwS+WGX2O9ShIpv+SivVGUXqJI+QIctWaJuxO8QXu4KTJPtmWIjjKO5Wg58n7dMq3YbXUY0PYF8e9FUSLfHldsOkoeU2XEd6u1hEY+qkBXacEAR5ANN3EsWT6+mrMqeSn9PqONAZshGQyXwWWYGuo3MrBKFcgTFJWiUrhcipcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbHvOuI33OG6wle9ogvFL6JG64jY0lw6qBzzSiXJ+S0=;
 b=dkSnEx2FMTn0HWO8N2jxv7RsxwdZXlTESYLyVgUmzQlVQjyamLAH1JMpsL/AaIQnAuDfdj3qbMStbyjwATexZWiacKUvZ5lVl7hfxHYlhxTu1+n8YvKHJ1gRKWhu21VT3Rt14VrFal2Z1FF9jcqs5w86UP4OJD6JvXG6X+5r/pNbo2aYUjKyDIYtyK7IAuYZj1p21lYQApbkeXJK7NCK9U1D6FFoELIR/Pd77Rrh1WVMAfNjbeU7o2KRrgJsKcWuK0yZXd1vmCN3a+rtI/koGHjhvuP9dq0k0e2fGCXEDAMAoH5GZv7621Xkt1+opFM03mKcdqs9pNON3GgI69jgEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbHvOuI33OG6wle9ogvFL6JG64jY0lw6qBzzSiXJ+S0=;
 b=XbvRrl8NLltmfEZrax5woPIJ1VgZkYJhaoZPIt5yv5fR19247cuXKR6VFEqW4JbZmBjznmY+Po24xI2qXAgKY/blvwy2w84ZhqCvCrBP7IL6JwJk3Y7LDflwt6SFPvxUrnxjs3NR6yRoopTYImVXn0Sdvx0U8y+teK8WWiQ791k=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB3102.jpnprd01.prod.outlook.com (20.177.103.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Tue, 29 Oct 2019 04:14:18 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::548:32de:c810:1947%4]) with mapi id 15.20.2387.025; Tue, 29 Oct 2019
 04:14:18 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     "kishon@ti.com" <kishon@ti.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: phy: renesas: usb2-phy: convert bindings to
 json-schema
Thread-Topic: [PATCH] dt-bindings: phy: renesas: usb2-phy: convert bindings to
 json-schema
Thread-Index: AQHVhY952/0Zj6abi0uVrAee6hPMwadw7TgAgAAiTAA=
Date:   Tue, 29 Oct 2019 04:14:18 +0000
Message-ID: <TYAPR01MB4544FD4F09FAA09F7AF79EF0D8610@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1571387933-23397-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20191029015708.GA29561@bogus>
In-Reply-To: <20191029015708.GA29561@bogus>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [150.249.235.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1653038b-5004-4efb-cded-08d75c267813
x-ms-traffictypediagnostic: TYAPR01MB3102:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <TYAPR01MB31026145784D87C447D001C0D8610@TYAPR01MB3102.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(199004)(189003)(99286004)(446003)(74316002)(476003)(66066001)(11346002)(8936002)(6116002)(7736002)(52536014)(6436002)(26005)(5660300002)(186003)(102836004)(14454004)(3846002)(54906003)(478600001)(71190400001)(81156014)(2906002)(81166006)(6506007)(8676002)(305945005)(71200400001)(25786009)(966005)(76176011)(7696005)(316002)(6246003)(6916009)(229853002)(6306002)(66476007)(66446008)(256004)(14444005)(4326008)(76116006)(9686003)(33656002)(55016002)(86362001)(66556008)(66946007)(64756008)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:TYAPR01MB3102;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QFUOe3AKd88iAvpZwEmIyVISmQRfA4vM1u68vTT/8LzOao0VyXKhM7IEmrJH7Vfsyg/I58To8ol8usn8zxH8cZCv81Z+TCFt0ljscAzwi5/zbZ1XCI7qKwwstb/8sDZ7Z1YfZR6Qpe4gGhRlAC2OcYeGMnXdZ3I+ZGL1/0APBxp0/Be97rL9cgzc60bEvK1G/PW8Nn+fKPKW0Zgw8/1/KD/bNofa7jTTjTjgE8xbcF+V52jHcgfEwJgnEY593vAWCxb4xuPhA8ASl2wZfDVj0IBQKmJEuARNvddyzUHe3mgJo5eEeHNHhtqrwk6y1NpqY0qgz5edfVz9kvjMUFfKLyHt16oVu/4SOrp4EI/EDegxf/FlRQ/vajGK3sYgheY5vAMjs1+yx6nZ8UGIJNEXWI0RzJYFPbtCp6JAGwSJMAVcRq++8m2KxK9Q54pPD6InRa8mUxSHRDoHXocl34lzgyaviRMmw/VEoCsg+UiHSGE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1653038b-5004-4efb-cded-08d75c267813
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 04:14:18.7641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 41GLyddyq5HeZ57HVAbcvcDbQ3xQP0/bi6rkNrHnrDhfDD937R/4sitqv6Lh7xrkSnfnsVfWJAx4hoY16aoOUKZyXVyyynSk/foFkDajTCWY1v3fzR6D1RhP5VvdfQuM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3102
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thank you for your review!

> From: Rob Herring, Sent: Tuesday, October 29, 2019 10:57 AM
>=20
> On Fri, Oct 18, 2019 at 05:38:53PM +0900, Yoshihiro Shimoda wrote:
> > Convert Renesas R-Car generation 3 USB 2.0 PHY bindings documentation
> > to json-schema.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  70 -------------=
-
> >  .../devicetree/bindings/phy/renesas,usb2-phy.yaml  | 106 +++++++++++++=
++++++++
> >  2 files changed, 106 insertions(+), 70 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/phy/rcar-gen3-phy=
-usb2.txt
> >  create mode 100644 Documentation/devicetree/bindings/phy/renesas,usb2-=
phy.yaml
>=20
>=20
> > diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yam=
l
> b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > new file mode 100644
> > index 00000000..0f109c2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > @@ -0,0 +1,106 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/renesas,usb2-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car generation 3 USB 2.0 PHY
> > +
> > +maintainers:
> > +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
>=20
> This:

What does the "This:" mean? If I replaced the "oneOf:" with "This:",
the following error happens when "make dt_binding_check":

  SCHEMA  Documentation/devicetree/bindings/processed-schema.yaml
warning: no schema found in file: Documentation/devicetree/bindings/phy/ren=
esas,usb2-phy.yaml
[snip]/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml: ignorin=
g, error in schema 'compatible'
Documentation/devicetree/bindings/Makefile:33: recipe for target 'Documenta=
tion/devicetree/bindings/processed-schema.yaml' failed
make[1]: *** [Documentation/devicetree/bindings/processed-schema.yaml] Erro=
r 255
Makefile:1263: recipe for target 'dt_binding_check' failed
make: *** [dt_binding_check] Error 2

> > +      - items:
> > +          - enum:
> > +              - renesas,usb2-phy-r8a77470 # RZ/G1C
>=20
> You can simplify to just:
>=20
>          - const: renesas,usb2-phy-r8a77470 # RZ/G1C

I'll fix it.

> > +      - items:
> > +          - enum:
> > +              - renesas,usb2-phy-r7s9210  # RZ/A2
> > +              - renesas,usb2-phy-r8a774a1 # RZ/G2M
> > +              - renesas,usb2-phy-r8a774b1 # RZ/G2N
> > +              - renesas,usb2-phy-r8a774c0 # RZ/G2E
> > +              - renesas,usb2-phy-r8a7795  # R-Car H3
> > +              - renesas,usb2-phy-r8a7796  # R-Car M3-W
> > +              - renesas,usb2-phy-r8a77965 # R-Car M3-N
> > +              - renesas,usb2-phy-r8a77990 # R-Car E3
> > +              - renesas,usb2-phy-r8a77995 # R-Car D3
> > +          - const: renesas,rcar-gen3-usb2-phy
> > +
> > +  reg:
> > +    # base address and length of the registers block for the PHY.
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    # clock phandle and specifier pair(s).
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    # for RZ/A2
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      - const: fck
> > +      - const: usb_x1
> > +
> > +  '#phy-cells':
> > +    # see phy-bindings.txt in the same directory
>=20
> Drop this so we don't have to fix later.

I'll drop this.

> > +    enum: [0, 1]  # and 0 is deprecated.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    minItems: 1
> > +    maxItems: 2
>=20
> Needs 'items' to define each entry.

I'll add "items:" and two "description:" on the resets property.

> > +
> > +  vbus-supply:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
>=20
> Can drop this, *-supply already has a type.

I'll drop it.

> > +    description: |
> > +      Phandle to a regulator that provides power to the VBUS. This reg=
ulator
> > +      will be managed during the PHY power on/off sequence.
> > +
> > +  renesas,no-otg-pins:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description: |
> > +      specify when a board does not provide proper otg pins.
> > +
> > +  dr_mode:
> > +    $ref: /schemas/types.yaml#/definitions/string
>=20
> I think we already have a common definition, so just 'true' is enough.

I'll fix it.

Best regards,
Yoshihiro Shimoda

