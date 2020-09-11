Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59C172664C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 18:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgIKQpq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 12:45:46 -0400
Received: from mail-eopbgr1410123.outbound.protection.outlook.com ([40.107.141.123]:18177
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725912AbgIKPIF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:08:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUU+bPBaIvn/niSNo+RwHqLHhR83u6MRDR64EEfx+R2tFFBr5SXrl6maqnPZsABTKg5LdVZRHtyDqcRiRwtp4sISCMPHsdBhAnX904FhCtx+CEU9aIoCnYAoFx7DOoytHwAhlm1OC76XvREbtK5PluM4mrwbjhXiOm6WPSa7GOs09mWnh6PM7fYQgUyfV+IO4BSeB/hiGdrXQzCP7PLD2wBj3Qv8pjb/ObIM1qieLf2fCP0ftoIj/MZkCluDAaPGV2c35PBZ7MCLL9BW9O5IURzBkSsZcl0M75DzM1qRkejFv+Dt14D5/+BOqxwPrx6/6mFg10oE7Q5swRZrL54U/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZJ7RtixorXjNEMLu1rApVubtdtU+nPmbfkJ+z+a3PQ=;
 b=A10qAMZVXpmeCYaSRl8SdyiKAjSGnH9ZYAw6hlJcIQoP9w1O0KqCR6TmGvB51RqVCWx3XaEUOUPj7+wcggvikAWNnUSjpxGxg0ZSMeZbdYaHEvydWbscOtEGUBjVbBoGMKFMMe7yMaVGHWnFhMIecVYhfa6b2AEgG4a7cDdPyDVeEgFKEqPR+t0yr3dKgYQXSOT1AX5mtAWIN37vRbfY1MxgLIGcSSaCcp6y+YyrNBGCbM9bbR+UH2yqYm7JzBjijKnHidSIpSGm1PwHNcjg83ybcYHy1LB8+X1qjOrY7co/uC6Q7Ib4csrcfzPDN+5fOb8HFwnkfK2vlHA8h9N3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZJ7RtixorXjNEMLu1rApVubtdtU+nPmbfkJ+z+a3PQ=;
 b=g4wnn3I8SkxGTuMM2oQzyiDHemsW95OJWR+zF+6EfT8b0nvHxcwPwrJ8A1ELsMzTbfnet8xJAFLmk4Rr6j6QsWm3anKmOpf/UH3YZZ0sDgn2UBM3rGPrhIlH3iEhpl2CegtF5tYnRkkXSOJP89cQCFekq4zCPH2zvKDH2wcP+1E=
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com (2603:1096:603:3a::20)
 by OSAPR01MB1908.jpnprd01.prod.outlook.com (2603:1096:603:1a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Fri, 11 Sep
 2020 15:07:36 +0000
Received: from OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2]) by OSAPR01MB2740.jpnprd01.prod.outlook.com
 ([fe80::8c77:606f:d812:ecd2%7]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 15:07:36 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Chris Paterson <Chris.Paterson2@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a77990: Add DRIF support
Thread-Topic: [PATCH] arm64: dts: renesas: r8a77990: Add DRIF support
Thread-Index: AQHWiDTu0MDLhvbbRkmMS4n9SA8/u6ljfiUAgAAFeYCAAAYaMA==
Date:   Fri, 11 Sep 2020 15:07:36 +0000
Message-ID: <OSAPR01MB27402E0C99EF92447FE4F1C4C2240@OSAPR01MB2740.jpnprd01.prod.outlook.com>
References: <20200911121259.5669-1-fabrizio.castro.jz@renesas.com>
 <OSAPR01MB238592CAC340A0BD147847ABB7240@OSAPR01MB2385.jpnprd01.prod.outlook.com>
 <OSAPR01MB2385C1419FD37C52D81E5687B7240@OSAPR01MB2385.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB2385C1419FD37C52D81E5687B7240@OSAPR01MB2385.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4bc13a3f-c52a-4c40-a39e-08d856646b1f
x-ms-traffictypediagnostic: OSAPR01MB1908:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSAPR01MB190814EFAC7C77C278258256C2240@OSAPR01MB1908.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QO625amrSWZW5jTlbfuzq+8+lRuJ4Ai+oAe7XxfZ3JJZiiX5pAU/tpqvLdegYCgDEuph+cxCpa/hL6q6vGinIuHKJGKJtKhdrTWUdFKqkyX651TT5C5Cs7TFjuuodnmMSCHivkkIGLQY2HGsoyiE8pREWqYclVbC+QyKK+Ml9hFmw61Mhco/4KvDRO5G+FHvtiDDKNg007Qrq+zxCPDXkuSe5FASOWTSQZPX+vbUBa+s93ub4zpdjo2N2iEGRJsFsLBa+4r1yBmWHKmYF/Ao5EmuAen6E2xmk3YGCUo1J3e8wjsJFfz7oPhIKigjPg0KqMKJa3YEzHc8XOXyxBWYhQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2740.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(26005)(83380400001)(8676002)(8936002)(55016002)(316002)(54906003)(110136005)(9686003)(5660300002)(52536014)(186003)(478600001)(53546011)(76116006)(4326008)(6506007)(66446008)(66556008)(64756008)(66476007)(33656002)(86362001)(2906002)(66946007)(71200400001)(7696005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: e15jL0WOImuWaiMHWmpjWBm+RnH0Dkul1RkLKxBod7qvFhXvmAIhJj8ZJlCr9E6MbHMeSsCp2XguBMoBVXX3R2AHmVUA68a+r4fmweEjytZvOuKSFzhyHov7EP/wBVmaV48YLUznStHu4VHZsEKfMYFiMhHHns36hef2LebBjrRtWg3p5u3He3IxkhV2H9caretpPzx7aALx+8o2yrMgRXHzCA+3iyoXkF7PkfAjGtSTHFnkTVmZkL4dWlLuzBxarGWfzZNL0Rf41G9QW7noNq+akl4t8OYZmtG0AbukLZZ2no/f3ftZSAboazx39ZZudAUy6KMV3DNxQiT+JByN7g+gMeWMOJO83/PmXL+U4fKulWe5C+17bPO7m7PTOdpaYqTDEm7plyPmrAe12zZbbAxOXMwSdoaw0gXa9QoUDYsgubIczrG3HkB/+9ouh1kyNSVmUIqPEDPOyqbSg8jrplWXrOb07nOQDmDi6JBVZgVOqoWbl65hDMqMnkgTklsnM+FN6GnzjcsgMV0GXT68V2mUGDY4lZvUw+/dzqOJWKxILAq0isf7bwWG9NUv9BkeeBmHiCrwhxapmSMOZxU5WqfZisWLHLfEwuPOp/Hu6HJTVVfqFnZINbDt7WhV49MNA/g6U4gs9qROQBl48hldiQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2740.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc13a3f-c52a-4c40-a39e-08d856646b1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 15:07:36.5559
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TRO4Y8EU5pAA480e6vUM6vfyCJeIKWrRqvbYVUPS2Ae2ERWaejW/WqlmkqwoprIyTygv/PdNqK8VXL+m2ijl0677//D+CPrYW7+rTsryij0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1908
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

Thank you for your feedback!

> From: Chris Paterson <Chris.Paterson2@renesas.com>
> Sent: 11 September 2020 15:44
> Subject: RE: [PATCH] arm64: dts: renesas: r8a77990: Add DRIF support
>
> > From: Chris Paterson
> > Sent: 11 September 2020 15:25
> >
> > Hi Fab,
> >
> > > From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Sent: 11 September 2020 13:13
> > >
> > > Add the DRIF controller nodes for the r8a77990 (a.k.a. R-Car E3).
> > >
> > > Please note that R-Car E3 has register BITCTR located at offset
> > > 0x80 (this register is not available on the r8a77960 and r8a77951,
> > > whose support has already been upstreamed), and even though it is
> > > not dealt with just yet within the driver, we have to keep that
> > > into account with our device tree nodes.
> > >
> > > Also, please note that while testing it has emerged that the
> > > HW User Manual has the wrong DMA details for DRIF2 and DRIF3
> > > on E3, as they are only allowed SYS-DMAC0 rather than SYS-DMAC1
> > > and SYS-DMAC2. An errata addressing this issue will be available
> > > soon.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> >
> > Looks okay to me. Thanks for the patch.
>
> Assuming you're going to update the bindings...

Will do.

Thanks,
Fab

>
> > Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> >
> > Kind regards, Chris
> >
> > > ---
> > >  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 120
> > > ++++++++++++++++++++++
> > >  1 file changed, 120 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > index 1991bdc36792..caeddc2c1a70 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > > @@ -1288,6 +1288,126 @@ vin5csi40: endpoint@2 {
> > >  };
> > >  };
> > >
> > > +drif00: rif@e6f40000 {
> > > +compatible =3D "renesas,r8a77990-drif",
> > > +     "renesas,rcar-gen3-drif";
> > > +reg =3D <0 0xe6f40000 0 0x84>;
> > > +interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks =3D <&cpg CPG_MOD 515>;
> > > +clock-names =3D "fck";
> > > +dmas =3D <&dmac1 0x20>, <&dmac2 0x20>;
> > > +dma-names =3D "rx", "rx";
> > > +power-domains =3D <&sysc
> > > R8A77990_PD_ALWAYS_ON>;
> > > +resets =3D <&cpg 515>;
> > > +renesas,bonding =3D <&drif01>;
> > > +status =3D "disabled";
> > > +};
> > > +
> > > +drif01: rif@e6f50000 {
> > > +compatible =3D "renesas,r8a77990-drif",
> > > +     "renesas,rcar-gen3-drif";
> > > +reg =3D <0 0xe6f50000 0 0x84>;
> > > +interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks =3D <&cpg CPG_MOD 514>;
> > > +clock-names =3D "fck";
> > > +dmas =3D <&dmac1 0x22>, <&dmac2 0x22>;
> > > +dma-names =3D "rx", "rx";
> > > +power-domains =3D <&sysc
> > > R8A77990_PD_ALWAYS_ON>;
> > > +resets =3D <&cpg 514>;
> > > +renesas,bonding =3D <&drif00>;
> > > +status =3D "disabled";
> > > +};
> > > +
> > > +drif10: rif@e6f60000 {
> > > +compatible =3D "renesas,r8a77990-drif",
> > > +     "renesas,rcar-gen3-drif";
> > > +reg =3D <0 0xe6f60000 0 0x84>;
> > > +interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks =3D <&cpg CPG_MOD 513>;
> > > +clock-names =3D "fck";
> > > +dmas =3D <&dmac1 0x24>, <&dmac2 0x24>;
> > > +dma-names =3D "rx", "rx";
> > > +power-domains =3D <&sysc
> > > R8A77990_PD_ALWAYS_ON>;
> > > +resets =3D <&cpg 513>;
> > > +renesas,bonding =3D <&drif11>;
> > > +status =3D "disabled";
> > > +};
> > > +
> > > +drif11: rif@e6f70000 {
> > > +compatible =3D "renesas,r8a77990-drif",
> > > +     "renesas,rcar-gen3-drif";
> > > +reg =3D <0 0xe6f70000 0 0x84>;
> > > +interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks =3D <&cpg CPG_MOD 512>;
> > > +clock-names =3D "fck";
> > > +dmas =3D <&dmac1 0x26>, <&dmac2 0x26>;
> > > +dma-names =3D "rx", "rx";
> > > +power-domains =3D <&sysc
> > > R8A77990_PD_ALWAYS_ON>;
> > > +resets =3D <&cpg 512>;
> > > +renesas,bonding =3D <&drif10>;
> > > +status =3D "disabled";
> > > +};
> > > +
> > > +drif20: rif@e6f80000 {
> > > +compatible =3D "renesas,r8a77990-drif",
> > > +     "renesas,rcar-gen3-drif";
> > > +reg =3D <0 0xe6f80000 0 0x84>;
> > > +interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks =3D <&cpg CPG_MOD 511>;
> > > +clock-names =3D "fck";
> > > +dmas =3D <&dmac0 0x28>;
> > > +dma-names =3D "rx";
> > > +power-domains =3D <&sysc
> > > R8A77990_PD_ALWAYS_ON>;
> > > +resets =3D <&cpg 511>;
> > > +renesas,bonding =3D <&drif21>;
> > > +status =3D "disabled";
> > > +};
> > > +
> > > +drif21: rif@e6f90000 {
> > > +compatible =3D "renesas,r8a77990-drif",
> > > +     "renesas,rcar-gen3-drif";
> > > +reg =3D <0 0xe6f90000 0 0x84>;
> > > +interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks =3D <&cpg CPG_MOD 510>;
> > > +clock-names =3D "fck";
> > > +dmas =3D <&dmac0 0x2a>;
> > > +dma-names =3D "rx";
> > > +power-domains =3D <&sysc
> > > R8A77990_PD_ALWAYS_ON>;
> > > +resets =3D <&cpg 510>;
> > > +renesas,bonding =3D <&drif20>;
> > > +status =3D "disabled";
> > > +};
> > > +
> > > +drif30: rif@e6fa0000 {
> > > +compatible =3D "renesas,r8a77990-drif",
> > > +     "renesas,rcar-gen3-drif";
> > > +reg =3D <0 0xe6fa0000 0 0x84>;
> > > +interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks =3D <&cpg CPG_MOD 509>;
> > > +clock-names =3D "fck";
> > > +dmas =3D <&dmac0 0x2c>;
> > > +dma-names =3D "rx";
> > > +power-domains =3D <&sysc
> > > R8A77990_PD_ALWAYS_ON>;
> > > +resets =3D <&cpg 509>;
> > > +renesas,bonding =3D <&drif31>;
> > > +status =3D "disabled";
> > > +};
> > > +
> > > +drif31: rif@e6fb0000 {
> > > +compatible =3D "renesas,r8a77990-drif",
> > > +     "renesas,rcar-gen3-drif";
> > > +reg =3D <0 0xe6fb0000 0 0x84>;
> > > +interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> > > +clocks =3D <&cpg CPG_MOD 508>;
> > > +clock-names =3D "fck";
> > > +dmas =3D <&dmac0 0x2e>;
> > > +dma-names =3D "rx";
> > > +power-domains =3D <&sysc
> > > R8A77990_PD_ALWAYS_ON>;
> > > +resets =3D <&cpg 508>;
> > > +renesas,bonding =3D <&drif30>;
> > > +status =3D "disabled";
> > > +};
> > > +
> > >  rcar_sound: sound@ec500000 {
> > >  /*
> > >   * #sound-dai-cells is required
> > > --
> > > 2.25.1



Renesas Electronics Europe GmbH, Geschaeftsfuehrer/President: Carsten Jauch=
, Sitz der Gesellschaft/Registered office: Duesseldorf, Arcadiastrasse 10, =
40472 Duesseldorf, Germany, Handelsregister/Commercial Register: Duesseldor=
f, HRB 3708 USt-IDNr./Tax identification no.: DE 119353406 WEEE-Reg.-Nr./WE=
EE reg. no.: DE 14978647
