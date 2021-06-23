Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B888F3B1DC8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 17:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhFWPsS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 11:48:18 -0400
Received: from mail-eopbgr1400102.outbound.protection.outlook.com ([40.107.140.102]:26605
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229523AbhFWPsR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 11:48:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWisEBA50tGEJw+YdxwjxVoM3WPC1LQSKOFwGkZlUrbh1sdvVrm3BiGsZKI6qtv80nrdrAdKUb2wf1Xx263cvbGSL0PES4Qxn+aPBp8H2a+PcvgP8DqGRGEUZeP068S10aT0jbaVYpT6cngnY9lstLHZSeBtdZGjoN9KkIsOXLJsq98sGJRr5a64DYEcJOL58fzCHY4DadWMEb52zm3hdZV1wItfOFEW/qabO2+SNZ9SvKgEKNSFWp8wnQGrHgG4nQS/ZGoXq2xx1WcqYqw/fBsyUsUz5Y0HQZzu23gGkAzBmMRkDNg0dScrhSLrkE5Q1cP2Gv6N600RwN5IQSObUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2g4zSX0SBftPpw1FFJPgZIc+UMp5vbxPtm1HK7RDMCY=;
 b=iy1R0TT68REWyE/x0oadC7WJjhrsIfvOCTHWlMW6yQWdrgMD1W5mfKq39EIfzmIUtXrxjUuOg2LF7YQRN1MFaU1TqqyunxdSbAUp+be93KFqe81FwDjrwj2xpAafwoyvPxO3YuTlj8b1nAKN3gMF/QPwA3rGEdGlL+Vu4JMODd+HuWGl350W8K0nPr4f0txP9EpryK2piW4fP5j9k04ik0MG2GCQz+Yj1zeuvZ5+rKFBuU2iAQu84vhKRuUno4vuxyi83mvvM/z2P7C3QXxTY6+yF/E17Wm5zYQPOUP4cWo40AcVlOkDiQLcqmH/saxgIvhAeQkvFlGhuqv/MqREKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2g4zSX0SBftPpw1FFJPgZIc+UMp5vbxPtm1HK7RDMCY=;
 b=E7ZkVFqszb8q8iT/+gW2eRXr5yznjFqOht+YnbcyYLT5luusv7vEyAEPhntBARb4jCEI6QIuxve2v4QfZIBLeuy2dQIrPqkps1jKpIOo8fz2qzEvLklvtcBfk4enpMFVxeWuh94Pg5CvqWBxcc1N3W0jBP8iqvpxgSiW6PSbQDE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB6209.jpnprd01.prod.outlook.com (2603:1096:604:f3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 23 Jun
 2021 15:45:57 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.025; Wed, 23 Jun 2021
 15:45:56 +0000
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
Thread-Index: AQHXZoFkEsylYGbSPUy+XB9R+DfKg6sgQr2AgAFYKgCAAAvXAIAAFwGw
Date:   Wed, 23 Jun 2021 15:45:56 +0000
Message-ID: <OS0PR01MB5922742488532EC506334AC786089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
 <20210621093943.12143-2-biju.das.jz@bp.renesas.com>
 <20210622165851.GA3840386@robh.at.kernel.org>
 <OS0PR01MB5922ECC2B573F1F8E170744F86089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAL_JsqK_6_LUD-ffkDCuDEds2RiYftJfynZyPN4io3Lt3MnQ4g@mail.gmail.com>
In-Reply-To: <CAL_JsqK_6_LUD-ffkDCuDEds2RiYftJfynZyPN4io3Lt3MnQ4g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 47bddc56-113d-4251-99d9-08d9365dfdc7
x-ms-traffictypediagnostic: OS3PR01MB6209:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB620948DB49EC5924A27C034E86089@OS3PR01MB6209.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W0u0zSBDsVxleh5nZTY+Jg6ApykDOOGQiiMaNu42wi7KVbFXRx1oUGEJ8vp1GKhI5QmMjduwFrdScxWY0VMUMM/uTTZcMmDnw3B3IYU+51F7pO7IZ9cm0fFKkhsKdQslrKfh8IVQ4c/ZI3cIv58IKhmGJkcvCMtlhsr2vyv/kyWNQu+UsTHdrUi3n5h6saVmpoBlr4xWPOGnUpm7HoxtkpyumLQmSbC3rkoRvm/CaX2+HvNm1KrbWdboaK/SamOSP8svz6Haiz4TZGttvPd88HFarwdVSqlOOUztS3bVQwAUsNOU+fv3R620rop6deWmzNmgroih17pGaxEklfJX062GOdapUtrRe55V0wxg0M18fOYWkxNe5YZLGiHFRSHDYZkh3BrbmxDcFHMTvjsQQK5jsHPnIyOYVeJEf6UEXBbYwlPxvc4t/0n0p0EXwgUDdH7VpVabJY9PD/olmWzZBBSsRlyWVh0csbA6rU7slwCjm54/3hgWVSaoEWKO6zj+zdbQ3gUU4rwtG5Y13IOM0i0g3eX4Km6y/rJzQhKDqWOv83EN2OxqkGLh84z3t4oz3RliSqo4AYq68NObvYB43x4dxV1ctaDHrF7IUbUuEvzPatTzxKEQ0ehVoceHZDHWwXp9YCM39WLKwmEONj2qECg5x4mdaSsaPWcEv5a3mY1HKGDtXvW9qqmIJKPCoCVmw6g8Qs/RqrTXXESZWWOqmL6//jgg2QI3JQ0wdsk5sj4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(376002)(136003)(366004)(316002)(76116006)(64756008)(478600001)(66556008)(8936002)(66446008)(52536014)(33656002)(8676002)(66946007)(5660300002)(9686003)(66476007)(83380400001)(53546011)(186003)(26005)(6506007)(122000001)(86362001)(55016002)(38100700002)(2906002)(6916009)(4326008)(7696005)(54906003)(45080400002)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E0br1skGpYM5qz9sXlzG3ecazlTmds0OWD3k0PbGRxLVQzcvOYYa0HyFdr3K?=
 =?us-ascii?Q?OknHC745opGMi2qWS4u3rdpRgPtdlBBHaW83AXys4ppSyb76IPLlruvXEmTI?=
 =?us-ascii?Q?N1xYOLP+OzRkXwIrDc1QuqIyco2cS6AX0vo/8MpzxuW0+Z1Zvy6LNsKIiZ1Q?=
 =?us-ascii?Q?JxFwBybXOsMGLLBFCweAEvMpP5AJmEeMwILU5kNhZslMOq4TXnWMgKwJFwWp?=
 =?us-ascii?Q?L4WPG0DGokPPRbsryGEuKLErXiekCXb4etapEFUraVwSOJ/UYpaZtoPi8Eio?=
 =?us-ascii?Q?04VfIVDV6kEZmB5YuWnND19PxqrHNYSj5NKaCXrfal5S37TQcKHeKAN3jL+u?=
 =?us-ascii?Q?yKuJE5Q7FkHPydFEW/Y+UT72H564i8cDTDMf4Lg/AJjzpGH4OG+3/mXt7I/x?=
 =?us-ascii?Q?/EfmBkLs3fndL09v901Bo2no2MGwHOZu5v1KNcGv9DhYv6CwCgEjRWlD2Wwr?=
 =?us-ascii?Q?I785A5dPZ0fOkFRXatv/Tq3IfpvCOH/XE3Dc0ZlvBX5jW5xN7Bh80OitTGAa?=
 =?us-ascii?Q?GXJVOOUFLLcu8MDQBO4Lr+tLg75Kuw6PqxzsnvhrIeWWgIV49noqUfKx4fXB?=
 =?us-ascii?Q?BrE6olMmjWH22OawzlRVAO/NUuOZreyFehuJBU6t7CPZgBmT3ordYQTtFNKP?=
 =?us-ascii?Q?cTy25sAt8XMKSNh8XfKjE8KgoyWkYeNzF6nfimOhXvpEdl6GtUwiKMMAr1as?=
 =?us-ascii?Q?fu4GwAbS7tUx/8BncHw/cJl4o6DB4bOJlBUC9CzUCUKQQ6o7IchYjZ+11CiT?=
 =?us-ascii?Q?0CowTX1Qz7lcm8t8fWzSKJMW1vy6No16JrzUh6zHJa+CQe7o2j5t7JpHlTQ1?=
 =?us-ascii?Q?TB5SXXkbmQtXBf/RFijdPdxmA+EEd6L5+L69wFOFyKIPo6ejGfyGPccfvIe2?=
 =?us-ascii?Q?cymYragDVpiontRsnFB1pcZ26CMWyn7pAdhL+FOMbLbWxpQCJxctfGeucNYe?=
 =?us-ascii?Q?Z3FIwBPwlAHVU0bxJ0lrOzWb+3tcdbV+dGB3leQOHKYew5QqC3nC0BTHyEYj?=
 =?us-ascii?Q?8vGzmutI9rtsNEFKv+TYbzlS4wtPbsKd1Q/Dn10BZx2JPN0LlFVDD8p0yrjV?=
 =?us-ascii?Q?DeOK152ycZgosvMUqA/XDLxTBtvxj+FWpEnYi1Ka7Ks1oAgZUunhr6ccqbfO?=
 =?us-ascii?Q?fWp48pNYAwHvUG8NUc2gl3OSR3MVAnIkhSEB718w3F1P9jkTCUq/W2CEYAiI?=
 =?us-ascii?Q?aSGlZTXj5xULcXJAjzhddtqMFfhB0wS3YuIWdvOAZS7Xevi/39wqqgsiq/r7?=
 =?us-ascii?Q?3z2YGFTz3eUPgO4N5ef4l3zRGjGW6I8ltE1yexvKJZ5HyvPHh233xmBT4kXv?=
 =?us-ascii?Q?WJudyXbs71MvwlhizOoN8YqM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47bddc56-113d-4251-99d9-08d9365dfdc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 15:45:56.2352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aFPk2NImz3HhNFFBjvt3/9EYnhGXKRXXUv+iSPW8PaJYIQBLFyqH8xz7cZNcn6FoZ/+eQbU8TrGzKfSkWRRPOWspybGXjEDG1Du541xhUR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6209
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH v2 01/11] dt-bindings: phy: renesas: Document RZ/G2L
> USB PHY Control bindings
>=20
> On Wed, Jun 23, 2021 at 7:38 AM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> >
> > Hi Rob,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH v2 01/11] dt-bindings: phy: renesas: Document
> > > RZ/G2L USB PHY Control bindings
> > >
> > > On Mon, Jun 21, 2021 at 10:39:33AM +0100, Biju Das wrote:
> > > > Add device tree binding document for RZ/G2L USB PHY control driver.
> > > >
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > Reviewed-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > V1->V2:
> > > >  * Add clock properties
> > > > ---
> > > >  .../phy/renesas,rzg2l-usbphyctrl.yaml         | 65
> +++++++++++++++++++
> > > >  1 file changed, 65 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yam
> > > > l
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.y
> > > > aml
> > > > b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.y
> > > > aml
> > > > new file mode 100644
> > > > index 000000000000..8e8ba43f595d
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyct
> > > > +++ rl.y
> > > > +++ aml
> > > > @@ -0,0 +1,65 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> > > > +1.2
> > > > +---
> > > > +$id:
> > > > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2=
F
> > > > +devi
> > > > +cetree.org%2Fschemas%2Fphy%2Frenesas%2Crzg2l-usbphyctrl.yaml%23&a
> > > > +mp;d
> > > > +ata=3D04%7C01%7Cbiju.das.jz%40bp.renesas.com%7Cc6bbf5f6ce334eaa722=
a
> > > > +08d9
> > > > +359f07ad%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63759977942
> > > > +1910
> > > > +039%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL
> > > > +CJBT
> > > > +iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DJcf6Om4DehifCe1KO1rmt=
5
> > > > +LxTB
> > > > +6jtGoQLD1MoqWGM%2F0%3D&amp;reserved=3D0
> > > > +$schema:
> > > > +https://jpn01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2=
F
> > > > +devi
> > > > +cetree.org%2Fmeta-
> schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cbiju.das.
> > > > +jz%40bp.renesas.com%7Cc6bbf5f6ce334eaa722a08d9359f07ad%7C53d82571
> > > > +da19
> > > > +47e49cb4625a166a4a2a%7C0%7C0%7C637599779421910039%7CUnknown%7CTWF
> > > > +pbGZ
> > > > +sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> > > > +Mn0%
> > > > +3D%7C1000&amp;sdata=3DLlqPRLf9%2BGrEdSapxCFhwxVKcXTVh9ECr%2FXPN0SI=
z
> > > > +i4%3
> > > > +D&amp;reserved=3D0
> > > > +
> > > > +title: Renesas RZ/G2L USB2.0 PHY Control
> > > > +
> > > > +maintainers:
> > > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > > +
> > > > +description:
> > > > +  The RZ/G2L USB2.0 PHY Control mainly controls reset and power
> > > > +down of the
> > > > +  USB/PHY.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    items:
> > > > +      - enum:
> > > > +          - renesas,r9a07g044-usbphyctrl # RZ/G2{L,LC}
> > > > +      - const: renesas,rzg2l-usbphyctrl
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  clocks:
> > > > +    maxItems: 1
> > > > +
> > > > +  resets:
> > > > +    maxItems: 1
> > > > +
> > > > +  power-domains:
> > > > +    maxItems: 1
> > > > +
> > > > +  '#phy-cells':
> > > > +    # see phy-bindings.txt in the same directory
> > > > +    const: 1
> > > > +    description: |
> > > > +      The phandle's argument in the PHY specifier is the phy
> > > > + reset
> > > control bit
> > > > +      of usb phy control.
> > > > +      0 =3D Port 1 Phy reset
> > > > +      1 =3D Port 2 Phy reset
> > > > +    enum: [ 0, 1 ]
> > >
> > > You already have the const, so this doesn't do anything.
> >
> > OK, will take out const.
>=20
> No, 'const' is correct. This is the value of '#phy-cells', not the
> contents (we don't have a way to express schema for that).

OK.

>=20
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - clocks
> > > > +  - '#phy-cells'
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> > > > +
> > > > +    usbphyctrl@11c40000 {
> > >
> > > usb-phy@...
> >
> > The IP is called USBPHY control. It mainly controls reset and power dow=
n
> of the USB2.0/PHY.
>=20
> Sounds like it should be using the reset binding...

This IP has reset, clock control , connection control , clock status and po=
wer down setting registers.
Currenty we are using reset registers for turning ON USB/PHY block.

Since it has extra registers I thought of modelling it as a phy device. But=
 we could model as reset device as well.
But it has extra functionalities apart from reset.

So what do you propose here? Model as a reset device or phy device since it=
 is related to phy?
Please share your opinion on this.

Regards,
Biju

> >
> > So not sure usb-phy is right one here ? I prefer usb-phy-ctrl instead.
> Is it ok? Please let me know.
>=20
> A node with #phy-cells should use the standard phy node names unless it
> has other controls.=20

Apart from reset, it has other controls like  clock control , connection co=
ntrol , clock status and powerdown setting registers.

Cheers,
Biju

As I said, this doesn't seem to be a phy, so using
> #phy-cells here is what seems wrong.
>=20
> > > > +        compatible =3D "renesas,r9a07g044-usbphyctrl",
> > > > +                     "renesas,rzg2l-usbphyctrl";
> > > > +        reg =3D <0x11c40000 0x10000>;
> > > > +        clocks =3D <&cpg CPG_MOD R9A07G044_USB_PCLK>;
> > > > +        resets =3D <&cpg R9A07G044_USB_PCLK>;
> > > > +        power-domains =3D <&cpg>;
>=20
> Also, are these all resources of the usbphyctrl block and not just
> resources you happen to want in the driver? For example, the power-domain
> should be the power island that this block resides in.
>=20
> > > > +        #phy-cells =3D <1>;
> > > > +    };
> > > > --
> > > > 2.17.1
> > > >
> > > >
