Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 298C03C9981
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jul 2021 09:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240294AbhGOHVF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Jul 2021 03:21:05 -0400
Received: from mail-eopbgr1400100.outbound.protection.outlook.com ([40.107.140.100]:6122
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231718AbhGOHVE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Jul 2021 03:21:04 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7ZOYU4fhcFvQI4pNDZVScy9rSbFODvKmG8IUK3YxZomsoQ1NAVT9iCU4mM1kgFTbyq+z9W1o433Y4lJqwNcNC9ZRCdMgDnVPpBHeRsAWXk4Wkx0Mt5cZdRppICZwm9t8GV/DmgGH1h0ww/O/HumFBA0N8+L8yqLg/AoHRIkIU3Dd662cMrS1VJi99RjS+/kiqsXgOCsE5G8jtoeQVSTlNMQ+ShsAbqIN1aytMf4iUktwFfAs6Pk/Rrk78BIPBSglef8DB/OUa+tSDsyl1vm52UERpEa0QTjtwZBFYvkb6V4lGX9TuW/F6UF65NWReT4fO2ZylxHDZUVOKNaiH9rlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Te+uxIYv6YxDz2QcXwR9j0f2rAX7baxtWyTf9zbDDVI=;
 b=PgdSmkKZFS5pq8GNODvijHQrajhi/1sXF6qAdtEC6JPfgsY+TzenkDltVo9CI1CZuesHSy3Ks8uNqOrnYU7Vv1Jk22mROyM7N7OPYUtcxsjF5wmIJwBQ9ATTuKqDsjOupLCoeA81j0hNVL0QufCbUKnvant4JFaKwJIyIIrCaAURh0A3oGxdzPKDXbQpnE8DVCvwrYZ4r2s62Oz7VA9f/wP+em7Ut1Bco1UUwVrBqJdSMnRVYpEruwGeP3POMvic5+1V/ni5MxsR9kqVPUn8ZBrC3m0olLDVgaycuGb18iYFxQOTjptVkCUwJvxe4TTK6mCLcYkE7iJNoFno64gr6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Te+uxIYv6YxDz2QcXwR9j0f2rAX7baxtWyTf9zbDDVI=;
 b=IE78IPEhw39WYLdZNvJMY3Qta5PVWQ71ArWE0RF5ApruWP5fBrD/0mTq0JySUQhMd0Eka9k2evD2v3paCItIj9Lwv7Sj+AeBMrPeZ803KAF6qnlZ7be2Gfm5v5PFJB3//k17m2XJgIDpuXDqUHxEUth51SMZ8H3nrZ0p+ZSHbzE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB7018.jpnprd01.prod.outlook.com (2603:1096:604:13a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22; Thu, 15 Jul
 2021 07:18:07 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::c6f:e31f:eaa9:60fe%9]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 07:18:07 +0000
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
Subject: RE: [PATCH v3 09/11] dt-bindings: usb: renesas,usbhs: Document RZ/G2L
 bindings
Thread-Topic: [PATCH v3 09/11] dt-bindings: usb: renesas,usbhs: Document
 RZ/G2L bindings
Thread-Index: AQHXbYHkt93XbUeRM0SktUqX5oBbb6tDEl2AgACfx3A=
Date:   Thu, 15 Jul 2021 07:18:07 +0000
Message-ID: <OS0PR01MB5922F18129DC9427144AA3AC86129@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
 <20210630073013.22415-10-biju.das.jz@bp.renesas.com>
 <20210714212455.GA3547570@robh.at.kernel.org>
In-Reply-To: <20210714212455.GA3547570@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 48732e0f-ab61-45bc-5bbf-08d94760b204
x-ms-traffictypediagnostic: OSZPR01MB7018:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSZPR01MB7018B53308A3CE343E5A6C7786129@OSZPR01MB7018.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kc9qWN1CV3QGGi/yowyoTWqdFkmTgw3n/qL29l7SOH42VJxVsJTiD7sUGUen8tSKQLcC1HD/butdCtHZ90pEu1ynmScCqcfvfDRgpb0RgdIT+4Q3NplJXRU37JBqbwzovxkmzMvFvMYab0ipu96vLIkpQBMNz5j1EKJyCZ4gjF2MzHzqxCIBQjKEixQnT0NWHte/+bbboKQ/qN9ehDBWlqPpxSjvZQtf741/KhTSuQPrqqOGE2b3r14f8H0tGkuW0f2XlP/DtKrZOzlToV38I6DuH379M6PH/ZPEFIBwetUKVk8oIkgR+DcuitOBUmL4m0BpSRyZaGpJ9F1UthBsndrYi2/4un0X5/roJnCNxKap0B5j42bb06eBP9eNAdeMVzLH4kTJ4wRnLMRCs7TTLPpgkVH2LzHmhnW4tkpzRrX8RDjooamhVwdqQ4Y9QDf86ZYNJ1psndwK8gSAJlolJ7W3VmlkmaCT+9u1dpgoBikPrTAk/6mrJ0y5N3XoR67Sa+R/TlT/JTET1fCZwJxM9RaGR1lYbDU5Y9t/Af3dSm097xlrDm/r/kF8CAHEi73C3UnbhxxN1DZO9MfUePvyEexRC6yUn50RoKe7F4PxDrye12brTtJVMtp5at2SXnGhxtHnj7WTnyikE4t38A59zHlboVg7fCFGE8Mk60aZmz3kLtgEOU1YDMvV/E0CdlbTm13hJIgUawt5j6WuQfBJTw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(9686003)(4326008)(52536014)(86362001)(2906002)(66476007)(8936002)(55016002)(33656002)(5660300002)(83380400001)(6916009)(71200400001)(26005)(122000001)(38100700002)(54906003)(478600001)(66446008)(66556008)(316002)(6506007)(76116006)(64756008)(66946007)(7696005)(186003)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qZRsdIqNFm/5IJpdpZBF5L5v36fPdkhPrLUbLL81RljDptKsFEm71Eqb/UGd?=
 =?us-ascii?Q?h0TkGHQ664Ki7hbGJMKDu7TY0YWaquljr6dPsk2fkYH9FSg6beSJGcG7lAjZ?=
 =?us-ascii?Q?m1YDTOExs5C59rjOWt0qcJ4V44hxLV5Oq1tlyFBtlxn6R/6SYdd5/552rksX?=
 =?us-ascii?Q?+EdhKjnJ1l30d15Lq3wx2/kSKBG5n0Cfjs4NbIjeFVze7M9LdXo2xdgHoUEA?=
 =?us-ascii?Q?i6U2L5CS5IoZHq/txOEsSq/RauNgZGoRYPJLIUf2wFhdLYteALBQVyEyVGcA?=
 =?us-ascii?Q?eOi5lJR1Lbf2LwrV25kjJyOYxskjsTlr2gItF6v1wr21vRtBBhtSFxe3uEYe?=
 =?us-ascii?Q?wsWYLB1d2SXTq/X3D9RWAvCxzEUiJITd5gqo+2n2zIyst3t2tMDrCjTLSm7W?=
 =?us-ascii?Q?vFWSv0XhDhqmx7dBR0AEsFjOK1fJCabSHxAzKetULFNLJDJyaZIJa0JPYkdB?=
 =?us-ascii?Q?s0zcyHMeaLe0MUPJAF7q4bx0SfK53eBvp6c+8sHjK61VS9A5mSngMFYfDw3C?=
 =?us-ascii?Q?sLFcpW1l5NLzQDuh0AmwMVNE+HvTNF7KF474psn/kMroFsk6jd3ZtVVpGPDO?=
 =?us-ascii?Q?atrQ5IGALg4VVB/twrjE/jy9cUgZnM6mKghIjCxigCes0zf2HedJFrkRQ+zS?=
 =?us-ascii?Q?yVU1/ILVVqSxm2iRn1VgQiWjPdmkEF6zLAKOuLdZ1hOxqgxM9/Sl2hSRbq1/?=
 =?us-ascii?Q?zHjbVgbjWcSwAid+1/vxXMbCwSNK3cIQLhWOD/KBK4mGPHENbesiR0ay0+Cn?=
 =?us-ascii?Q?oL025589t0kOFUZYHWipyj9+q2EQLQMTwpEmWWs2GghswLdKRl8EV1+QSFjX?=
 =?us-ascii?Q?3ZZAuFImOCwQp1PNK6NpxNe6vy9LBdy8M1KX3UILD/F/mpwgPdBxnSeReUiX?=
 =?us-ascii?Q?weR7CbP285ecMlFUs2evGWUW8ZyaXaQKwE6rfs8KR5KJXSUfx7Ykmb6jHHuP?=
 =?us-ascii?Q?1J9YGJH0/VljsSAbShfeyxx4RQPOICs602/NVjtitUc01GWtGJjrPjIweTqp?=
 =?us-ascii?Q?tl5wtUZ61rFiFjxgoURekIA7kiPkJrGDxjyY9AFg5XwFeBtlrjt9SJ/VD95S?=
 =?us-ascii?Q?rpmjKVi5ZHwrHZgJpkw9ipSf0Fw2NEWn2ktkRLnV5kGuWtnfj8h/DBm1uXbX?=
 =?us-ascii?Q?ipMRPv/O//IRXpA1IvTsrCdi+I4J6KsqoI8nsyaVP35oVVdm7Zq6FpR4GWb5?=
 =?us-ascii?Q?EldU6HuoSX1Dm7Rr5CM98s8kJpM8nVsAjNXuvMpC2XvvIqQXwWZ+by7GGbPE?=
 =?us-ascii?Q?ZjvlzRVWn14qCHGehKhZpsZ+e+wjlHeeEHYKW/aAQPpO3Ymj9n/0GdAcuaHj?=
 =?us-ascii?Q?FVKaKWTFSQUhXs7xm1uoUXi0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48732e0f-ab61-45bc-5bbf-08d94760b204
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 07:18:07.7005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zU1CKsZ0b226SuQ3GCm0HByvzGlWKLJzQjLaHcdSHaD+V2DfEqLBrWT3b3T9fDIltGRQ7cRZ2DvlFJkrK8qBkNoUgq4HUgeBo0ChYCh+ouo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7018
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thanks for the feedback.

> Subject: Re: [PATCH v3 09/11] dt-bindings: usb: renesas,usbhs: Document
> RZ/G2L bindings
>=20
> On Wed, Jun 30, 2021 at 08:30:11AM +0100, Biju Das wrote:
> > Document RZ/G2L (R9A07G044L) SoC bindings.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3:
> >  * Updated the bindings as per the USBPHY control IP.
> > ---
> >  .../bindings/usb/renesas,usbhs.yaml           | 21 +++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> > b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
> > index ad73339ffe1d..5562839bef8d 100644
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
> > @@ -59,7 +61,7 @@ properties:
> >        - description: USB 2.0 clock selector
> >
> >    interrupts:
> > -    maxItems: 1
> > +    minItems: 1
>=20
> maxItems: 4

OK.

>=20
> >
> >    renesas,buswait:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -108,6 +110,21 @@ required:
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
> If the first interrupt is the same on all devices, then this items list
> should be moved to the top level and just have a 'minItems: 4'
> here.

From the hardware point, it is same "HSUSB interrupt"

But HW manual is  representing  it differently

R-Car Gen2, RZ/G1:-USB2.0_597 (OTG)
R-Car Gen3, RZ/G2:- EHCI/OHCI OTG.ch0
RZ/G2L: U2P_IXL_INT

Other devices ??.

So it make sense to leave as it is. Please let me know if you think other w=
ise.

Regards,
Biju


>=20
>=20
> else:
>   properties:
>     interrupts:
>       maxItems: 1
>=20
>=20
> > +
> >  additionalProperties: false
> >
> >  examples:
> > --
> > 2.17.1
> >
> >
