Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1781D262A1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 10:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726036AbgIIIVl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 04:21:41 -0400
Received: from mail-eopbgr1320094.outbound.protection.outlook.com ([40.107.132.94]:44032
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725975AbgIIIVk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 04:21:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nK+on2Zz2xqiZkRCyh3Pqy1PGJpannCelEwJ/F6iK7g7HnpbQ6vxj4pThvFHYAH/QpHm6FKLGFTtG3KXbusyR3MgF2Wfxxp1SMkhgtmkdM6sygAUOBin6zPTUphZdPYUI6JJhqUZYcJc/MoFS1WVixS80HxMHZaGmBCwGqbd1kVejhoHe86kpHFdZcqKCIQx/6117+6rR2m3kj/lHuR+3Q1xrz1TXekoWeMUK4M029JxJnnR6V7iKZObN/ApA84u3oM26uR9OlyksgwCXHrAaXGutYpRP5Ej0IwyMt1srFloax5L/Mfj3nSZ+w3AQxc5z7Fz6jajoNnJV0jkQe7Kog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGROaJoDYeQQOAlnkb2YSNwe6z4ByA0unBEC4jwOczI=;
 b=eG6IqQaTgyCqtJI6DRpartWNnBRrfTUAxQURev4U5Kk2G4iLQ99tBjFHsSM1SGC4x+pT7bIQ2+wQ7I0X1mVWJ6TQQkd0ubK3OPwq5l3AYXojULrrn7W64XBzLhJV8h8cPQby0kF0ZyvNwGBk4/tad5aS65MrFr8qKQt/FFOjnO6G4B/44jieSXeTI/od/78Erbs7KRRMJ6/44oHv21WnbeFtfXrkR9aC36pRHZ0GTDDaeTaMRp2ukM4dBS6ooBXtjBeHiwRxOZ7ppnMSfdZ9rzSnocsXq9iC10lKgn0L22xB4SqPGO2VcHJKprnt8kArLZQgClhSsqiGomM3TsDp/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGROaJoDYeQQOAlnkb2YSNwe6z4ByA0unBEC4jwOczI=;
 b=UWLmZH/l4GKzq7k2EgH4nW1nZANQhQduN8nd0eRZabYYuxzs71YeWSl4pUFxJKNAkMotKFvQHLsnjExC4dGjR450zpqYX6tyTj1AL9Fus20tG6Bd8PWmwLO1E6KKIVVHHreFq4XRfhXhhX330h9NUFUrfBJl2zdnb4PXq3aadcw=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY2PR01MB4252.jpnprd01.prod.outlook.com
 (2603:1096:404:d2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Wed, 9 Sep
 2020 08:21:32 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::757f:58cf:296e:9f84%3]) with mapi id 15.20.3370.016; Wed, 9 Sep 2020
 08:21:32 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 1/5] dt-bindings: usb: convert ti,hd3ss3220 bindings to
 json-schema
Thread-Topic: [PATCH v3 1/5] dt-bindings: usb: convert ti,hd3ss3220 bindings
 to json-schema
Thread-Index: AQHWeiBm7RRdOc7Pp0aB6GJsD3dNDqlfbNaAgACVPJA=
Date:   Wed, 9 Sep 2020 08:21:32 +0000
Message-ID: <TYBPR01MB5309786FAFF729AB8998B5D786260@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20200824141053.5062-1-biju.das.jz@bp.renesas.com>
 <20200824141053.5062-2-biju.das.jz@bp.renesas.com>
 <20200908223651.GA1042906@bogus>
In-Reply-To: <20200908223651.GA1042906@bogus>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 91cb0bb2-cc28-4b39-8550-08d854995c45
x-ms-traffictypediagnostic: TY2PR01MB4252:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB42528748326BDB9F6419C5D286260@TY2PR01MB4252.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3o8N6K/zbJVJBqdnfX7peY3WZnNntjTzPJfP6Dy/E0NluGxrNcMNfRMfC3HJwY8BL9HrJXqSSWHyEXX8VIGsrw/Mf1wBYkpHbDRsCKT+IUgA5muAyFK4cCj4bdE58sYavPhj2XJLDkNm1m1gHd43jOCd3G7hiaEOY1In92IOMQj+djuSrw6s96v23He4Jz0oiLAjv5wCtnP5xGToXqpD5GqMEHh1nGXTYjKt/jUg3uhxhrjlbUHj/i1s5sNynP2Xl1ukJUYD8fjG6ruwzETzxm9cSfswHZwITeSXsIZ7g1US9bLM29MneRhwflXVEB3bs+4w4WgjnJ27gZi51JC4Z9DXqWyJ0GpWNpVDlLUbC+ZVGs44myqgY65C/1d3nxwmzoaB9KOE8zkyfYs64lSeOvEZYZe0oe1LUNXCN1RYWUCFOwIabUlv/96++c+xNiq7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(66446008)(83380400001)(33656002)(8936002)(52536014)(6506007)(86362001)(5660300002)(9686003)(54906003)(64756008)(55016002)(2906002)(4326008)(26005)(7696005)(316002)(76116006)(186003)(6916009)(966005)(66946007)(66556008)(66476007)(8676002)(478600001)(71200400001)(142933001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: nF2t2FuEBtYwPr/n3mKY2QAMAKu8BBL8gkjPoyOPuv9BnxTqVQLXgqPtbnEeD4obrBKajLRJMbJxRir4eZZHLPIfzepBUSC1EW1s6m9QIesTtv+GIvl9pwXYbaF6Q3OWMN95bUkKfUcyhDGw+802CEXpkpAqI69Ob64rhnzFDUxVLFv+IVOxQtPR8OuAWo8ruPxx07pTieo3ukHu0At9uRqvUeGDIx7fZxmxc0wsnYMejZJLZIpm7rVbmj82twVhkXS1PJuycKbJHAq8wGGyi2s4iuiM8U7mveBNm5RQxQ1S1r0FMhwUrXQRxENYGBcSty/wKQN4FtEq6xKkCOGp+z4XXsN+CHPkbzfcBBnpWEkt+wqgI4nWBdKir/nAoNCfuVHTKmxa7XpZoXD2qPiwvmtjmLfaGVyVt2i+TqjDoZM2WPseOllkzJP+CFzkS4F8rzUMQiDZZDBsPfOeGotYNQNWeM8lFZnH04LRbRIe+NU8yCDNapCNVZkoEq7/OVPt3R1snajYi0gnutYLaJIxVv4ndwUFHRn9sVI+dvWEp3jvRz6i5uIUQ77Bbin0SR6e9wtmdQVBJ+MKWCow2PjwtoH+NP3yhhb90Ql/b37BHYEAUh8fDdSbMPBUiJ5yLtrRcY+G5iNbYr93P0xNkFTwPA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91cb0bb2-cc28-4b39-8550-08d854995c45
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2020 08:21:32.6032
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZtwB0PaBO4DaLeH9eWdioCFd7ak9IBuuNkqvaQkiuTE4qNj3O1iNcSAqN6ZjVc6HJ4AlhWGrSJHp3Li9rpNhZsiiekDpTQCwTVOezlyCIqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4252
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH v3 1/5] dt-bindings: usb: convert ti,hd3ss3220 bindin=
gs to
> json-schema
>
> On Mon, Aug 24, 2020 at 03:10:49PM +0100, Biju Das wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Convert ti,hd3ss3220.txt to YAML. Updated the binding documentation as
> > graph bindings of this device model Super Speed (SS) data bus to the
> > Super Speed (SS) capable connector.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-
> lad.rj@bp.renesas.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3: Replaced Tabs with spaces in the example section.
> > v1->v2 : No change
> > Ref: https://patchwork.kernel.org/patch/11669423/
> > ---
> >  .../devicetree/bindings/usb/ti,hd3ss3220.txt  | 38 ---------
> > .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 81
> +++++++++++++++++++
> >  2 files changed, 81 insertions(+), 38 deletions(-)  delete mode
> > 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> >  create mode 100644
> > Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> > b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> > deleted file mode 100644
> > index 2bd21b22ce95..000000000000
> > --- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -TI HD3SS3220 TypeC DRP Port Controller.
> > -
> > -Required properties:
> > - - compatible: Must be "ti,hd3ss3220".
> > - - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
> > - - interrupts: An interrupt specifier.
> > -
> > -Required sub-node:
> > - - connector: The "usb-c-connector" attached to the hd3ss3220 chip. Th=
e
> > -   bindings of the connector node are specified in:
> > -
> > -Documentation/devicetree/bindings/connector/usb-connector.yaml
> > -
> > -Example:
> > -hd3ss3220@47 {
> > -compatible =3D "ti,hd3ss3220";
> > -reg =3D <0x47>;
> > -interrupt-parent =3D <&gpio6>;
> > -interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
> > -
> > -connector {
> > -compatible =3D "usb-c-connector";
> > -label =3D "USB-C";
> > -data-role =3D "dual";
> > -
> > -ports {
> > -#address-cells =3D <1>;
> > -#size-cells =3D <0>;
> > -
> > -port@1 {
> > -reg =3D <1>;
> > -hd3ss3220_ep: endpoint {
> > -remote-endpoint =3D
> <&usb3_role_switch>;
> > -};
> > -};
> > -};
> > -};
> > -};
> > diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> > b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> > new file mode 100644
> > index 000000000000..750a099529c0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/ti,hd3ss3220.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI HD3SS3220 TypeC DRP Port Controller
> > +
> > +maintainers:
> > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > +
> > +description: |-
> > +  HD3SS3220 is a USB SuperSpeed (SS) 2:1 mux with DRP port
> > +controller. The device provides Channel
> > +  Configuration (CC) logic and 5V VCONN sourcing for ecosystems
> > +implementing USB Type-C. The
> > +  HD3SS3220 can be configured as a Downstream Facing Port (DFP),
> > +Upstream Facing Port (UFP) or a
> > +  Dual Role Port (DRP) making it ideal for any application.
> > +
> > +properties:
> > +  compatible:
> > +   const: ti,hd3ss3220
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    description: OF graph bindings (specified in bindings/graph.txt) t=
hat
> model
> > +      SS data bus to the SS capable connector.
> > +    type: object
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description: Super Speed (SS) capable connector.
> > +
> > +      port@1:
> > +        type: object
> > +        description: Super Speed (SS) data bus.
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c0 {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        hd3ss3220@47 {
> > +                compatible =3D "ti,hd3ss3220";
> > +                reg =3D <0x47>;
> > +                interrupt-parent =3D <&gpio6>;
> > +                interrupts =3D <3>;
> > +
> > +                ports {
> > +                        #address-cells =3D <1>;
> > +                        #size-cells =3D <0>;
> > +                        port@0 {
> > +                                reg =3D <0>;
> > +                                hd3ss3220_in_ep: endpoint {
> > +                                        remote-endpoint =3D <&ss_ep>;
> > +                                };
> > +                        };
> > +                        port@1 {
> > +                                reg =3D <1>;
> > +                                hd3ss3220_out_ep: endpoint {
> > +                                        remote-endpoint =3D <&usb3_rol=
e_switch>;
> > +                                };
>
> If you have 2 inputs muxed, then there would be 2 endpoints here? Please
> show the fullest or most complicated case for the example. The port@1
> description could be a bit better.

As per [1] "HD3SS3220 has integrated USB 3.0/3.1 SS/SS+ MUX with 2 channel =
2:1 switching required to handle cable flips".
The four Superspeed differential pairs (two Tx and two Rx pairs) pairs from=
 the USB-C receptacle is connected to this device
and the output of the Mux is connected to the  SoC .

This is the complicated case so far. Do you want me to add full example lik=
e [2] with type-c connector?

I will update port@1 description as "Mux output connected to SoC Super Spee=
d (SS) data bus."

[1] https://www.ti.com/lit/ds/symlink/hd3ss3220.pdf

[2] Full example with type-c connector

connector {
compatible =3D "usb-c-connector";
label =3D "USB-C";
data-role =3D "dual";

ports {
#address-cells =3D <1>;
#size-cells =3D <0>;
port@0 {
reg =3D <0>;
hs_ep: endpoint {
remote-endpoint =3D <&usb3_hs_ep>;
};
};
port@1 {
reg =3D <1>;
ss_ep: endpoint {
remote-endpoint =3D <&hd3ss3220_in_ep>;
};
};
};
};

i2c0 {
status =3D "okay";
clock-frequency =3D <100000>;

hd3ss3220@47 {
compatible =3D "ti,hd3ss3220";
reg =3D <0x47>;
interrupt-parent =3D <&gpio6>;
interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;

ports {
#address-cells =3D <1>;
#size-cells =3D <0>;
port@0 {
reg =3D <0>;
hd3ss3220_in_ep: endpoint {
remote-endpoint =3D <&ss_ep>;
};
};
port@1 {
reg =3D <1>;
hd3ss3220_out_ep: endpoint {
remote-endpoint =3D <&usb3_role_switch>;
};
};
};
};
};

Thanks and Regards,
Biju


Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch=
, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, =
40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldor=
f, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WE=
EE reg. no.: DE 14978647
