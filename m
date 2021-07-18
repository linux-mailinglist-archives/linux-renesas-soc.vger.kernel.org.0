Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8B23CC82A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jul 2021 10:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhGRIcE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 18 Jul 2021 04:32:04 -0400
Received: from mail-eopbgr1400095.outbound.protection.outlook.com ([40.107.140.95]:59069
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229578AbhGRIcE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Jul 2021 04:32:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkOdKVTokM4NOjusAi7Fw0EC/bXcmlEN9wcuyX1CR8Q3g1CB6SjRD+dZJ79rHVqc+mixQ9bAIHvGQEkC5mtZ6W4ZNbL+TkWzdabQREz/WTSqdkcQPiEqt9+j5jsH3FxycPsUSKH9OiK0ftgrIgN+yhVz4kQlxZF2apFltBbnp/KlvXdLwKAT+aHcIILTMl0/+xFmZNu2eqXC7kTZFRk35w8aa5usJ1Fp2hPxXpeqj5A040YaQoWXgasHhB6Cfm7Zvdy6B1Ys44iv7iAOIogj4wI6HG16W3eH8k/oI+5Cq6thu20MT7Scg//WRec4IiiWTJQlnjCV28jVX8UVsrHeEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzbfzjplJ0RYVfEZ7CX8r/zs75spZ5bDIaYAGHgFxYE=;
 b=S1ow0G7lzLRRRx1icUful6oJNfk9Xxokpl1Z/5m9lg33aT6oKgBQqPKl92DHKA9/85KBx5lacY454VJEbEXjJJ8Fegj/TID1WeRRY8l155plG36EgzKzpsWSM+xPC4uBpNP6HGnEDqeNj2h+X54XQPwU+128UqO/Nr5iysgMdpjvj4m3y86gYTTLIRQcRZKeNw5NBMrsLAnK6QftRmSs96iUcUh5UKPIdYblqEd/T7MrFImcLoDM30hmdcHxFtru3yMXzJNxZy2ve5GjWRPWmLH3lbdfxK64urc3e6plu8GaUDU8IY+WuWxYQ4Ogv2IFabyo4f3xJaunLDbS7DyJWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DzbfzjplJ0RYVfEZ7CX8r/zs75spZ5bDIaYAGHgFxYE=;
 b=WPWERbHQHXc2OFS1fQ0nysJC/BqudMQz6jPudLIg8dlf87nIAqhhmGU67+ID025RifMBpc01q0Md8hbUTna/9BZ6gEJKuLsTdpvZ/VlPBaA6iSS+AFdATy67xanl5EHzG047BBUqGgmqXBQfwfwss1Yyc572BulnPgTPgSrtUCY=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2530.jpnprd01.prod.outlook.com (2603:1096:604:3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Sun, 18 Jul
 2021 08:29:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4331.031; Sun, 18 Jul 2021
 08:29:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 07/11] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
Thread-Topic: [PATCH v3 07/11] dt-bindings: phy: renesas,usb2-phy: Document
 RZ/G2L phy bindings
Thread-Index: AQHXbYHhglWpoTGXsUeqWuHX3BdNeassSd4AgBbHkICABXCBgA==
Date:   Sun, 18 Jul 2021 08:29:01 +0000
Message-ID: <OS0PR01MB592257F7A3D1460D0DD2123A86E09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
 <20210630073013.22415-8-biju.das.jz@bp.renesas.com>
 <CAMuHMdWbhY9i+WvV77LVNYhLBLQBVCojgEwM93A-pvFf9Eab1g@mail.gmail.com>
 <20210714212135.GA3539572@robh.at.kernel.org>
In-Reply-To: <20210714212135.GA3539572@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 41961b29-0ca4-4759-627a-08d949c61932
x-ms-traffictypediagnostic: OSAPR01MB2530:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB25305E7D7DEDF44ACBF746DC86E09@OSAPR01MB2530.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eLRPNDiPcK9Zq+su0CwB8XdMDyLzz3PGeomrZtA/H3seootITwLEDwLt2i3uBSlYd9+z3sn/DiPpK9alKnpYxKJMVUiOvJnLtIf38tYWcz/zs8LzohihYl8PejOlm3dck/ZuqPDKqQoXnEZ5idipaktzBUO0MyXqhFMxBJ7fnp4PlJP/ofiPe1M3bfk0aiJqwq0JiOeBDt0PJX44P91mU4k9PzbuGGTF2emnr95qSBafKUHm+m/96pt6G8lTGBuyyMgxQcrItz9RDs5/xpf2EkU3HZQ2IxI5+wNozWKTetOKx9QIWRsv+Z2L22oGdup+yq72DlliooW6+ERaRAz1Ej7NIny7xSD8fQjxpfM21jS+hf2HjIBmU9IX4nC0AtCrFuL8a7xxRlJuWqou6QlLG8Ay33b3KsaCt0+E3GwgTatv9mD3Ayq77PF0pMoSc4fUxNCYk2/P1WPiRt5R0+enZ/2vEWE1hT5X87bYRSEkQWYzU5i7MBGlqUiGmhY/+ZR3jkCRa3FBsr8ucHNiEVXl32bJNrHSt3Xdni5vqZLVdkArgzpB08sKX5fOzZKfnDIWeB5gNGEwouLepI/OC5nTAU+VXVuSTv/b0Sb2kYR4hwBM+QLXn+8q7tJcrGQpzrUa39GukDyAnd4zLKT9otgdJqNPnvoqHwCIdMiMMC83fvDsTq7u7S1R9v7HD5odZcFp1mT3m8XOf9YWIqqZqvA5Dw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(64756008)(2906002)(66446008)(66556008)(66476007)(7696005)(33656002)(4326008)(508600001)(6506007)(53546011)(54906003)(71200400001)(186003)(122000001)(38100700002)(9686003)(55016002)(5660300002)(110136005)(316002)(86362001)(52536014)(8676002)(83380400001)(26005)(8936002)(76116006)(66946007)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?olWlebEyV5kHrvy4LMtC2bPfB75gIWlADsVoW/HYVV4ldeNCxNyMi0AUL1Hp?=
 =?us-ascii?Q?x/f/UBVgDCQxhTGPEsWy3yIj8X+NUc5qRjuoVbI7htLCizebOomxCkv8mgNt?=
 =?us-ascii?Q?cUmzRgQnxTIGFFzFc7YRNyd+yYh7xeGA7ZhOkSrG6Qt4AOLowXurw13iyLlG?=
 =?us-ascii?Q?RgNS/CIRrFhCyr8LtsMZChwiOwaaoJULSveVoBoAn+SlLbh9SK/nEzwTS6dA?=
 =?us-ascii?Q?2NeB9zSQ7aD/qjPtzn6LPrDjC4IlyHzfoetNBxEhIoq8GKZ19QaEEqXvIFq+?=
 =?us-ascii?Q?3aNNmsr3mKlMOSnFjMucHiN4SWtsGlC0pvDYR4PMUSYjndRIOMsGiaPRPt/E?=
 =?us-ascii?Q?gHYAKGK0EJYEXd0QksW6YmUPuJk01gxULqjnBqtb1S7y6pGHAkRXARU4kGnW?=
 =?us-ascii?Q?LFUjRfjbYzfI7eUYJlrKv2H64RFNsxZfMsP2xPyelTN5qf6THqTqjHEq/gsG?=
 =?us-ascii?Q?Bpy5FydLDwCfYmFexzyzGG9mYfZzOs0hblI8H4PQmBR7x1MHTk+3+lh84La/?=
 =?us-ascii?Q?TbIH5PkNFvQQ2lf0LC3T9NhUheuHTloxnhclh9TRezKpgssX5qOGG9zmSuNW?=
 =?us-ascii?Q?vNGNYAXsELMrsWNd4aee6oKiem754JTAghTP2gDEjtj2msUJOBegdrPFx0QD?=
 =?us-ascii?Q?/TlM5B58yoJYwpn3vEMoDLsr6fIMkwFYb9LbmcFHtzWgOvuBf1dI0nREcIZT?=
 =?us-ascii?Q?Akx/5BqSolOfmulq0qzKwBwzPcXwy0L0Sd+7zL2JCS+wx0dceMpkm4kGagqU?=
 =?us-ascii?Q?6hP/+Ufd8cW6YLtGhZt2UFZGFSiwm80awxHVHAYEJirrWXVM2YnHv/mmHBXD?=
 =?us-ascii?Q?d+CwPQrxlMM4mhHkngawIr8uHtkzbm5hW6vyV4es78UZXsDt0mzK6gUSoy6f?=
 =?us-ascii?Q?+klyKUNML8kdbyrhX8C2iH0AzT1G4jgCXVp/oTX82GYImrAIfIg3k79l84NM?=
 =?us-ascii?Q?A8Nh3Nk2yUrgOMJySnvsAjOsuIvd2JANgXa+jcBpQCpw8EwdTmaMHI4jwzCn?=
 =?us-ascii?Q?9lzNciFKACWSa47CKLk3swiXKO3N9a02cBroQcsMXorKagR1XB2qH2H2/IlD?=
 =?us-ascii?Q?bWI9n8um/YwvBEcM8r5kscK7aCfCSwTSbtd8oF9gDciDMlI8S9uzLfUjs0f7?=
 =?us-ascii?Q?eUG//qP40wSWmiBvnri8yyVHGr4iTEbB59OQD6R76DiNXHMPPkIzEQq99OWT?=
 =?us-ascii?Q?HsAtQFo/JJVa7Kj9nHnYVchXZxzbcrGvzQD6/hD7rn7lWW1A8D7vnTZh9GE4?=
 =?us-ascii?Q?0I5PrdWTvWiw/PB1+v4wf3oY7M9so7+w29JHV+3HT+Z78g0yPVr7KTNohZ3L?=
 =?us-ascii?Q?3he5bKWl+Y/qBR/HYLzhXUeL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41961b29-0ca4-4759-627a-08d949c61932
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2021 08:29:02.0060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LTqOtMIsiY4k4EuQwrx9+3of84DAmQhLigxZ92x2C2/nv/xiG12qDtAT0Mwo0jrzQuGU3NJBZkPwyVXVRIJXrrN2BGQAMzzqKhQCZYfxN6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2530
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

> -----Original Message-----
> Subject: Re: [PATCH v3 07/11] dt-bindings: phy: renesas,usb2-phy: Documen=
t
> RZ/G2L phy bindings
>=20
> On Wed, Jun 30, 2021 at 11:29:36AM +0200, Geert Uytterhoeven wrote:
> > Hi Biju,
> >
> > Thanks for your patch!
> >
> > On Wed, Jun 30, 2021 at 9:31 AM Biju Das <biju.das.jz@bp.renesas.com>
> wrote:
> > > Document USB phy bindings for RZ/G2L SoC.
> > >
> > > RZ/G2L USB2.0 phy uses line ctrl register for OTG_ID pin changes.
> > > Apart from this it uses a different OTG-BC interrupt bit for device
> recognition.
> >
> > Nothing about resets? But see below...
> >
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > > v2->v3
> > >  * Created a new compatible for RZ/G2L as per Geert's suggestion.
> > >  * Added resets required properties for RZ/G2L SoC.
> > > ---
> > >  .../bindings/phy/renesas,usb2-phy.yaml         | 18
> ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > > b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > > index d5dc5a3cdceb..a7e585ff28dc 100644
> > > --- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > > +++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
> > > @@ -30,6 +30,9 @@ properties:
> > >                - renesas,usb2-phy-r8a77995 # R-Car D3
> > >            - const: renesas,rcar-gen3-usb2-phy
> > >
> > > +      - items:
> > > +          - const: renesas,usb2-phy-r9a07g044 # RZ/G2{L,LC}
> > > +
> > >    reg:
> > >      maxItems: 1
> > >
> > > @@ -91,6 +94,21 @@ required:
> > >    - clocks
> > >    - '#phy-cells'
> > >
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: renesas,usb2-phy-r9a07g044
> > > +    then:
> > > +      properties:
> > > +        resets:
> > > +          items:
> > > +            - description: USB phy reset
> > > +            - description: reset of USB 2.0 host side
> >
> > Do you need the second reset?
> > Looking at your .dtsi patch, the second reset is shared with
> > ehci/ohci, so perhaps it makes sense to drop it from the phy node?
>=20
> The existing binding has the host reset (and peripheral, but no phy
> reset). Was that a mistake too? Smells like collecting resources the
> driver happens to want, not what the h/w connections are.

On that SoC's there is no USBPHY control IP to control the reset. But PHY
is part of either host block or peripheral block. On RZ/G2L as well PHY is
part of Host block but we have dedicated IP to control the reset.

Regards,
Biju

