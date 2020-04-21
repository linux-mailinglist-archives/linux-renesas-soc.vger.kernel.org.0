Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CEDB1B1B54
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 03:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgDUBqk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Apr 2020 21:46:40 -0400
Received: from mail-eopbgr1400091.outbound.protection.outlook.com ([40.107.140.91]:17440
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725958AbgDUBqk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Apr 2020 21:46:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6q8lyn5PebhT0H2ZrHXfmeWbyB9q1oQS0MwEUoeH+fueBDkMc2xO/5073I+E0ufEnMbSgx1VGNVMfFqW4Qw50oqUUFQRrRow8GNo2GbmutgQfrIa1ZINutsR9uZnJu2xvX98g0+vFcd52tkxhz/MytCkDqZPbBO2JnweVbkm1a6XHr5/lqpVsdTEgySG1Mz8KAMLRYEm7nYUnDdzOnrnKHYM4UehXle1uoJtLXxY1tNgglnJ1j+noESdZ/Trw/iPQc2VZgerUMronb2yVeNGmJhhIxqJcSFUDpDX60zGbTW5XlHsZOu9X6ONWeDPPy7I1ga0kQffhOpm7462LvE9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg7yc8DRV9nsBRbDz7zhb0OimGIpGWlVcIBERY+mTzw=;
 b=kyFgKmPlXkcPXCiz/Kl2ec2HiVy4J2kI6cXYeo1lskaHyjlrq5S3WywniUsNI7HyzKWp0NIEwCRiaOzEyl9EdU3IDvDj29S58w4TeqRLaKvHyS/gs7m+SHhXnU19ob5SIMrgqTUH8R3z83QtpqxSSPH8ZBJkqPbrPwrQwPsQ704kCZO4JEJcGqgv6qKRgCYJHZgBf4qH4Z8XcNjfmKXZ5IealEcx/eC/qY9kYd7f72sqsKXttNygl4QGexjGizKpoJJxxU4c2+//qi0O9T06LbxVqEENh16k3PxNfECiiurkB8thadCy2cEzh7JtLBXb1Cntqeyq654Mso/+KuGkVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sg7yc8DRV9nsBRbDz7zhb0OimGIpGWlVcIBERY+mTzw=;
 b=ID+zSKWyyjdlIFDtiPg948Cxl+fjdvSmpQGfDZHisJXXmTHwj7oCAe7g8XBZT+pMvesY+jU8I3Xggm0DXYxa31HrYASotPJuiFNJJ6+vk8a8vS79o1kFTQwqX03cHBsSc1Aek1+it+fwYPN3F/A8IIRtfdzuaQ5q8pNgd1Ar0ag=
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com (20.179.175.203) by
 TYAPR01MB5054.jpnprd01.prod.outlook.com (20.179.186.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.27; Tue, 21 Apr 2020 01:46:36 +0000
Received: from TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06]) by TYAPR01MB4544.jpnprd01.prod.outlook.com
 ([fe80::ed7f:1268:55a9:fc06%4]) with mapi id 15.20.2921.030; Tue, 21 Apr 2020
 01:46:36 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     "joro@8bytes.org" <joro@8bytes.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bndings: iommu: renesas,ipmmu-vmsa: convert to
 json-schema
Thread-Topic: [PATCH] dt-bndings: iommu: renesas,ipmmu-vmsa: convert to
 json-schema
Thread-Index: AQHWEX3joQ1TxPqDiku42usLcXTo3KiCcEYAgABmq1A=
Date:   Tue, 21 Apr 2020 01:46:36 +0000
Message-ID: <TYAPR01MB454448A3FAA76FD1E1E9E00CD8D50@TYAPR01MB4544.jpnprd01.prod.outlook.com>
References: <1586773533-8893-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200420192646.GA9603@bogus>
In-Reply-To: <20200420192646.GA9603@bogus>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [124.210.22.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4c6294d8-058a-42c6-328c-08d7e595d40d
x-ms-traffictypediagnostic: TYAPR01MB5054:
x-microsoft-antispam-prvs: <TYAPR01MB50546C1E144DBE22641782DED8D50@TYAPR01MB5054.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 038002787A
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYAPR01MB4544.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(76116006)(8936002)(186003)(8676002)(81156014)(6506007)(55236004)(26005)(9686003)(4326008)(33656002)(66476007)(86362001)(52536014)(66446008)(64756008)(66556008)(55016002)(478600001)(316002)(966005)(2906002)(66946007)(54906003)(7696005)(6916009)(5660300002)(71200400001)(142933001);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q8wvjaW54PPBwtGKWqhnnA4+CZ9BfKmkDyeTdUqFD+ZC3s02tGubV6GnXHX/we8iLRFZ9nu49TrjApMamanqYHut4pnF7sys7Ga1nLWF4fXyJEEv2fbvINgNEkUpfHu/Hp9bIsnRXfFJ+o4NK+LpS52+duJvydRIFVCgF+K4Yjo0MayJCCgSnKyzmeYIf2LfOPvMgwoTSXysQYunYYx3LOZvcwlYX0/+j6rAEu9yVVia/0p9LV7yQOnI9Jpa4H/wwHXYFRUAJZ3qGglWrhtDY9aF7U/z8ZjjrCusdHjj2kU0e4ftyIakYGFJWC/O2HMXcEW7iPh6hIpzx+VoVyf6ZiEx+Y6cam1UefuGg83gd5pkgFYIg8dTU0CYWY/N7xZY7tMsHoJC0N0UzbCVkIOQ8QMriA+dRnyv1DDSTNmPizh6kV4ZlfmIMZc541p6p7+Z7Ewb/slCFj6VgUIKFqrAcEW4M4Mag0lmKbX7hatWGrwpDh7WdILEq9tYB2Rf5NCXkla/2u82aXUJOMFKmjfYNj8R5nV6ZVa3huirM3a/ArTTWLiFH5jHQR2mc0/mi1nc
x-ms-exchange-antispam-messagedata: 1yu/N6cVJe+bPCBAffj/hvOJDbyfvQCJo4F/ntbnmwCXMhwDpFUO12Ke8FKV4cHMNRrWNYJ77qhLi/qwPUrXNyrQOR0tQslehScFZp2ceyXqlTxfupFDlCN9x4ISvb//GepL4JRF6CTjwpuyq2u20w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6294d8-058a-42c6-328c-08d7e595d40d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2020 01:46:36.5457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XQqDhe61LtTMArRqfK17fsk1XvB01Y5HacDegRruBG/FSaKIqLJAugMguXpADes8ntC3cXjL3YJHsUU7m/n33OLzGuBfO5nrE6sKnspcKy/tlwyuOqfp9WZr1Llzzcjr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5054
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thank you for the review!

> From: Rob Herring, Sent: Tuesday, April 21, 2020 4:27 AM
>=20
> On Mon, Apr 13, 2020 at 07:25:33PM +0900, Yoshihiro Shimoda wrote:
> > Convert Renesas VMSA-Compatible IOMMU bindings documentation
> > to json-schema.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
<snip>
> > diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa=
.yaml
> b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> > new file mode 100644
> > index 00000000..3820b10
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
> > @@ -0,0 +1,90 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/iommu/renesas,ipmmu-vmsa.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas VMSA-Compatible IOMMU
> > +
> > +maintainers:
> > +  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > +
> > +description:
> > +  The IPMMU is an IOMMU implementation compatible with the ARM VMSA pa=
ge tables.
> > +  It provides address translation for bus masters outside of the CPU, =
each
> > +  connected to the IPMMU through a port called micro-TLB.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,ipmmu-r8a7743  # RZ/G1M
> > +              - renesas,ipmmu-r8a7744  # RZ/G1N
> > +              - renesas,ipmmu-r8a7745  # RZ/G1E
> > +              - renesas,ipmmu-r8a7790  # R-Car H2
> > +              - renesas,ipmmu-r8a7791  # R-Car M2-W
> > +              - renesas,ipmmu-r8a7793  # R-Car M2-N
> > +              - renesas,ipmmu-r8a7794  # R-Car E2
> > +              - renesas,ipmmu-r8a7795  # R-Car H3
> > +          - const: renesas,ipmmu-vmsa  # R-Car Gen2 or RZ/G1
> > +      - items:
> > +          - enum:
> > +              - renesas,ipmmu-r8a73a4  # R-Mobile APE6
> > +              - renesas,ipmmu-r8a774a1 # RZ/G2M
> > +              - renesas,ipmmu-r8a774b1 # RZ/G2N
> > +              - renesas,ipmmu-r8a774c0 # RZ/G2E
> > +              - renesas,ipmmu-r8a7796  # R-Car M3-W
> > +              - renesas,ipmmu-r8a77965 # R-Car M3-N
> > +              - renesas,ipmmu-r8a77970 # R-Car V3M
> > +              - renesas,ipmmu-r8a77980 # R-Car V3H
> > +              - renesas,ipmmu-r8a77990 # R-Car E3
> > +              - renesas,ipmmu-r8a77995 # R-Car D3
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description:
> > +      Specifiers for the MMU fault interrupts. For instances that supp=
ort
> > +      secure mode two interrupts must be specified, for non-secure and=
 secure
> > +      mode, in that order. For instances that don't support secure mod=
e a
> > +      single interrupt must be specified. Not required for cache IPMMU=
s.
> > +
> > +  '#iommu-cells':
> > +    const: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  renesas,ipmmu-main:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description:
> > +      Reference to the main IPMMU instance in two cells. The first cel=
l is
> > +      a phandle to the main IPMMU and the second cell is the interrupt=
 bit
>=20
> The cell counting is wrong here. We don't count the phandle as a cell.
> It's a 'phandle plus 1 cell'.

I got it. I'll fix it.

> Same goes for 'iommus'.

I understood it. I'll also fix '#iommu-cells' description.

> > +      number associated with the particular cache IPMMU device. The in=
terrupt
> > +      bit number needs to match the main IPMMU IMSSTR register. Only u=
sed by
> > +      cache IPMMU instances.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#iommu-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r8a7791-cpg-mssr.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/r8a7791-sysc.h>
> > +
> > +    ipmmu_mx: mmu@fe951000 {
>=20
> iommu@...

I got it.

BTW, all Renesas related dts files are described as "mmu" now.
So, I'll also fix dts files later. Thank you for the pointed it out!

Best regards,
Yoshihiro Shimoda

> > +        compatible =3D "renasas,ipmmu-r8a7791", "renasas,ipmmu-vmsa";
> > +        reg =3D <0xfe951000 0x1000>;
> > +        interrupts =3D <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
> > +        #iommu-cells =3D <1>;
> > +    };
> > --
> > 2.7.4
> >
