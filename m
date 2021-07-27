Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCE93D7931
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 16:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbhG0O7w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 10:59:52 -0400
Received: from mail-eopbgr1410103.outbound.protection.outlook.com ([40.107.141.103]:37088
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231552AbhG0O7v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 10:59:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7KOzDlgq5FOW4Zoe9VralHvqf4qqB3Rc+0xblbpU1PjjJEfIVan+6ek31azRtnhnQEwHVxM25QZAN9fDaM1gz0Ield6kwmA659iGIH2Q4n+fyK7525FAbA+DXOw4z/+i599YnNGv66DkESN2ziDwVtM+L80QJdmM3zb0h/ENlFpNZsGdV20qaDPgwW1gNRNfJAkYb4LlZLZ5/f5tILhjZZukIbuBb3hAp1WS4zrnLpVL3GVac4IFTH8Tjg/G7m3dhfkhYf9qUZmeQkgaHqZdYr9HUf7PoLYlLeBj59BZfOVA/5V3JDdxm4wjTAM2P7f88m9TLvb2JSywZIzM6Azrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rL5qNx7irfEonAzmd5QHp1WYB+Rw5JRW+00u8phWZMc=;
 b=i3B9s3/irL6OV/esKrbwngCoE8rRifNS8Hx4zymgSdtl/GcvamG+od22DVef1RRq1D/soQyB3WwU0D4pmyXZUdr+AnMEWCkMahN/y31eRtyqOS2fpz0jSI4nL0EfVodbbZS7kknQCjKG/+kR3gQ+rNN8gsSrTeRZaq2bxPDXJXcgQr59M12Kgp5YkWY6reqhCApQg9J6ghhyAjS+bkGmOve9qxicfWLSOIltActSB827uC9vadO8VThHSavJDA37l9K5F9twfHkNzqGjC8m+nOXpXeWEZ/7JREEuZgXohs/nEvhv2xCizGTFtZGl7YiyQTY9zpzDcJGXn6cRJLg4fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rL5qNx7irfEonAzmd5QHp1WYB+Rw5JRW+00u8phWZMc=;
 b=gifrMTKTwjIIYpRLRkEIhdm15vUK4j4lwakwZVu513bJorKkP+E3y5MNQA3DABgQeB+4+IIHKyQ7zQuJovPEUi/RGt8c5PNDU5fu5AQCXOmwkKO4qCIUhRWoZmzstqWQt+2AjyWFLYO0Cprh6wxH8+d5TH25d7yqJPBCwDItyxk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB1941.jpnprd01.prod.outlook.com (2603:1096:603:1f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Tue, 27 Jul
 2021 14:59:49 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 14:59:49 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 09/10] dt-bindings: usb: renesas,usbhs: Document RZ/G2L
 bindings
Thread-Topic: [PATCH v4 09/10] dt-bindings: usb: renesas,usbhs: Document
 RZ/G2L bindings
Thread-Index: AQHXfJhqbET+VDB/a0OnXJEyJWKfMKtV4n8AgAEUJkA=
Date:   Tue, 27 Jul 2021 14:59:49 +0000
Message-ID: <OS0PR01MB5922E3E91209C78D0302AB4A86E99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
 <20210719121938.6532-10-biju.das.jz@bp.renesas.com>
 <20210726223032.GA988259@robh.at.kernel.org>
In-Reply-To: <20210726223032.GA988259@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0c6cb371-b482-4886-2e05-08d9510f2e78
x-ms-traffictypediagnostic: OSBPR01MB1941:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB194191650C128D28AD8EF37C86E99@OSBPR01MB1941.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +DZc7P446e7vyb2RtBgJF2AlZv5WS9BxQm+lRJdPoaSGaPzjVOZITXXV4oFih08PjRBF3E371oo1Cfgr9+6/MAVhoWxT+Wgk+B/969v7TEmjok0HFKxDaxe2hppGm7wv9SGclZIi5RHPlsixJjHKVQmPX6hbr1jzN7+nqLhBApOCmHzQ5SpbGL7vyqAo33Q8C95oHTWAG1a50l2vfNVAfzWWLRq3F9GNG8ABIQ6EvHgmLFMbYajsDTt9nlnag7CBkw+2m/HIppdDB9+aFq4xFq+VvRXYoAjdMd9fYNTEBaWJ8r1OLBHAPXm9JFriYsisoi0AJ0ujPPynHDa5Gbrc12V0mNstMCSiBuvLzyazCmXZ4brTTvOXIAUtPMVS2hq0CN+6vpMAaTNe4qpITMVX2+8ckyWg2NPo+HnLycMsCY825VJoqllDLhiMOZz3QCnZkWCL4SwsK2uafakCM6sluQh+vSVBB9+gAynn06CcTBOMvaajwHnosDgv0NYKSOs3qjxp+MfQSFAEA/vqKzCeSzk3ofXreCXqWXJObqAtqSDbniKAhrwFNiLOfFmBC/YmxBK0qcHFsiNx7YO+y1BcFEOxzbj8U1gZcqOJcRY6h2UXQ08tuKeuZIzKpP77NOoMPqlsZimNENUz/2H1362Hun2Q1id9NpLlYkFudCcij1aTW1LQoMpXLQ+VVG0995EVaVo+4qAvrnXeHzX35cL8oA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39840400004)(346002)(366004)(52536014)(71200400001)(186003)(86362001)(66946007)(83380400001)(55016002)(9686003)(76116006)(38100700002)(7696005)(66556008)(66476007)(64756008)(54906003)(316002)(6916009)(8676002)(8936002)(5660300002)(4326008)(6506007)(478600001)(66446008)(33656002)(122000001)(26005)(2906002)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y6NaSgqP/ujImiczXsNMfmXJCBqBn1whQYI0k4WCDTTCkRS9c+NdtEM2/HqK?=
 =?us-ascii?Q?zBx12VYAHrQZXJPvZ+Z6OZ5bxNyqjJGhYa2UUqcHTtYOOijXVxWdGPpa6x9T?=
 =?us-ascii?Q?SLj5EJaCr2vfnCqu+aJAg1c6nDJJ6igWqDHTG1j5SLlE9nErzzK7jO80JYdf?=
 =?us-ascii?Q?EeDZyh65H4+ODOFfh9TzK+5WugkoZmhj9ZZjxSVuIfHD11LTJzRKfxB+qGUo?=
 =?us-ascii?Q?N+vDai+1148AwI0OFo/l1u/YQBK1n9SehCzYJd0SmoeB8vYsvNWQk6/mjobJ?=
 =?us-ascii?Q?UGTbUk0hPlcjehhrmkyaeWHhajLjPIZJ0ihrtuZj75xyexHErteLSFrqHL4e?=
 =?us-ascii?Q?+cf9jCmNu2X0it7kOFOC6c7S83mKWZNRRSDz272arp4B8X8+kXIVN/tRJjB/?=
 =?us-ascii?Q?Cjmw+jIVTGFotUsYafbIucQAdbwqiLVF8jl3y7r1UA/OrT/GmK9cVPH4mPLz?=
 =?us-ascii?Q?T+2DKDXWSLuYOlVGJbUALkkijqHecmdglyydRNAmA4hVf+o2Gvj0qqf77BWa?=
 =?us-ascii?Q?EyTX/gG0f/GKKC67iNQTsv8lGhzXHjsnmUTCYD0v5zSKOkM0f6WywLeHq7xh?=
 =?us-ascii?Q?AwiT13/LfbMTpzHp9c8OQ0be/JZARA2x0kWYRjdM1ePW4SEf8HKQVugXdpZ3?=
 =?us-ascii?Q?fGO3tBWGJQ2bv4Dy00l4ds0Rqb5FFNLx7UVE8XdsPOmVJOK3Pf8C6jLy2Sn9?=
 =?us-ascii?Q?HD3Hpmb6qeDZyBrcCNJzjqwygpsCnO7skDR27gqbDwFd2Gu9OykOyQWOf1x/?=
 =?us-ascii?Q?4Wkad/B39LWFtRq2ndd0Y51wx87wBVAtxQ6KNUu6eWQNfrAO1S88Ceip675T?=
 =?us-ascii?Q?LfifGRajzXAeVvpDdcB3YQnfWYcYzNbK1OYaJTV4fvKPNq02lvr4hK7ZEk5d?=
 =?us-ascii?Q?jGrn+qHBLgKaW3VsDAbH/ZZTu2LvE+ekL67J7Rj6tF4Q68tvSF3rxoW1GmcF?=
 =?us-ascii?Q?9VKQmYa/R+2P4zxu782oo7yTxTrq48VgGzdsgST2syiQaznR1PYt5cHCf/+m?=
 =?us-ascii?Q?DaqPBRQqyiF6sRXuZjM+cK1bgBN3mEGlGY4kI67ZwC9XV/ld80zJpZ7rxbyy?=
 =?us-ascii?Q?mqQLi9CpubPr/NPsttcViWGD70CXUAxq6KFO5WeGNIH+L8mLNhsynZ53x6uv?=
 =?us-ascii?Q?Y+49fVqlWDY4mAHVxGE32UYyHwkYo+veglNdWpsbSkDpZM9YNxQJ3nHCdbU0?=
 =?us-ascii?Q?OTzq9BNrcq98wRKQ45pRcAaUPW2DNKDgASbeXbo8j3jrWsaspjRNvBeVSPVM?=
 =?us-ascii?Q?y04gaYeWFrPMyIrcdzwKfohSqN6zok2c688c+6d7d6P2mdOxqHTJCrZ4EreR?=
 =?us-ascii?Q?o457uAMdP4zIYJs836mqevqq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c6cb371-b482-4886-2e05-08d9510f2e78
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 14:59:49.3691
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cg7bqnTm0RRgqQyzAbEFKmi8zvIWrpwOqXIc4Snty88b7HHtTud4QGlO9+JIIslRs39hv41eshx6GovEcL4OOcqqbCW2q3eOzSg+kEbIKSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1941
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH v4 09/10] dt-bindings: usb: renesas,usbhs: Document
> RZ/G2L bindings
>=20
> On Mon, Jul 19, 2021 at 01:19:37PM +0100, Biju Das wrote:
> > Document RZ/G2L (R9A07G044L) SoC bindings.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4:
> >  * Added maxitems in interrupt property as per Rob's suggestion.
> > v3:
> >  * Updated the bindings as per the USBPHY control IP.
> > ---
> >  .../bindings/usb/renesas,usbhs.yaml           | 22 +++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> > index ad73339ffe1d..a85ad392d443 100644
> > --- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> > +++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> > @@ -17,7 +17,9 @@ properties:
> >            - const: renesas,rza1-usbhs
> >
> >        - items:
> > -          - const: renesas,usbhs-r7s9210 # RZ/A2
> > +          - enum:
> > +              - renesas,usbhs-r7s9210   # RZ/A2
> > +              - renesas,usbhs-r9a07g044 # RZ/G2{L,LC}
> >            - const: renesas,rza2-usbhs
> >
> >        - items:
> > @@ -59,7 +61,8 @@ properties:
> >        - description: USB 2.0 clock selector
> >
> >    interrupts:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 4
> >
> >    renesas,buswait:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -108,6 +111,21 @@ required:
> >    - clocks
> >    - interrupts
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,usbhs-r9a07g044
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          items:
> > +            - description: U2P_IXL_INT
> > +            - description: U2P_INT_DMA[0]
> > +            - description: U2P_INT_DMA[1]
> > +            - description: U2P_INT_DMAERR
>=20
> else:
>   properties:
>     interrupts:
>       maxItems: 1

OK. Will fix this in next version.

Cheers,
Biju

>=20
> > +
> >  additionalProperties: false
> >
> >  examples:
> > --
> > 2.17.1
> >
> >
