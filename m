Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F9B8266559
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 19:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgIKQ6T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 12:58:19 -0400
Received: from mail-eopbgr1400139.outbound.protection.outlook.com ([40.107.140.139]:22013
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726225AbgIKPE0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:04:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k6Ky4S6NdQnqyo3Ysh5OFd7TtWn/TGVIu2+EmRWkmU8u2ihPjNh/bnB9Vw/Ki/oYINEEQhF1mDKO6zwVAkoyaBR6JZBkL2Eg/UhweyacByqiA9z/X0kjW5pnNgeCxsEHlpiXzgBQ4OBmQGnKUf1LEOi0TJ7XvQeiqWnuNtpM+CIzDQ/DPI1MxQy3AEgJtnsz1jmg8TM8h6qz/mzjvfesKdidGX7+E02olAKghoaffV7Koo7/vfPssev7Fng9veryb7aQyT70euq/BSRS25Cyp0Zc2wu24MqMxwhJE1l+MuCtBP+e6bFj7/4HLl7SoGtAvvDBBHM8fpJ2Veh2Ek/x6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vjYy6MN5naoBRUiGu7aZJUlR5R9Tj2eO/7Wc9Qcd6s=;
 b=lUhgRJJeoDow9htDq6U0cVRs6v9dzFOxWVmstd51Lf/D3BrU1ZdCbtVCDzCAAKvPv5WDsw6HmA0Pieb89kIF1VMgAswQptvw9Bbx+e5SwGOr2HoMWLqPUz3iUImKFRxTaSKUShWnXc+In7aS9TSE8bFwYEXPj1axzN7bJYHk99zNDy8ya0PBdOzoa4EySwmHcSx6CJVCsn4a1E/MjIWOPEwLw5IkWbM1myaneXy2+vtwAk1/FNBT8Mg6EiJ0ETaP/Zt0wMcf4LOfHpIHED+eM9dp+IfqxKbK4nzP2DbQ9j0je7fqLRn+xaqt7cjvF9jg4JbmW/S7YcdkE5MQelYt/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vjYy6MN5naoBRUiGu7aZJUlR5R9Tj2eO/7Wc9Qcd6s=;
 b=eLRMoyPVvnVtIgOBbBwNc8izHRbVk2qXuomUp7VVZdby3iROnkaCNXnyq5KkfevhZKqD9S7xjhYMVRSJLaoyRSJg/4OVM4RXZp+CWjgQm32vYlt1zFbJDG19h91G1QCOtey8k9EGe1Qr6CfGrLmTyyp/MDlO7v14TLBolVUhPhw=
Received: from OSAPR01MB2385.jpnprd01.prod.outlook.com (2603:1096:603:37::20)
 by OSBPR01MB1735.jpnprd01.prod.outlook.com (2603:1096:603:2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Fri, 11 Sep
 2020 14:44:13 +0000
Received: from OSAPR01MB2385.jpnprd01.prod.outlook.com
 ([fe80::75bc:81cc:bb5:7d50]) by OSAPR01MB2385.jpnprd01.prod.outlook.com
 ([fe80::75bc:81cc:bb5:7d50%6]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 14:44:13 +0000
From:   Chris Paterson <Chris.Paterson2@renesas.com>
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH] arm64: dts: renesas: r8a77990: Add DRIF support
Thread-Topic: [PATCH] arm64: dts: renesas: r8a77990: Add DRIF support
Thread-Index: AQHWiDTuz7MJCTxWkE21FuJi1e1lZaljfMoggAAGI3A=
Date:   Fri, 11 Sep 2020 14:44:13 +0000
Message-ID: <OSAPR01MB2385C1419FD37C52D81E5687B7240@OSAPR01MB2385.jpnprd01.prod.outlook.com>
References: <20200911121259.5669-1-fabrizio.castro.jz@renesas.com>
 <OSAPR01MB238592CAC340A0BD147847ABB7240@OSAPR01MB2385.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB238592CAC340A0BD147847ABB7240@OSAPR01MB2385.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [31.54.191.121]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 936eed0f-9b43-4cb2-301e-08d856612706
x-ms-traffictypediagnostic: OSBPR01MB1735:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB17353B80C8D5A16623D03432B7240@OSBPR01MB1735.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1jUc3pIQRAJr/ooyqGAdmY5nTE0ezwDv2LpMku7x0OhF8yhC3Lcc+wfj5b5K1i1aGHsnzLcl3CsRcqteMoskbm3wcW/aTrNfQEON6ev7sGqakYAA/55zV/Hyt+gJeSeU6aMwaJTCvX+X9qtFBN+B8aBZW3lFm+4tM+3jm3IT9gBbxap9EpVwD4w6WwsHsAm5Q6METyOhExQYpp90tltqt0tzVcnghyYEE1yp62wrYTB4omw+aaUKqLKr8AxNoaIrHKTMErudTnF82Bje1LRfEHXMw2Rt14UoBpkzbjYr0E+L8C21TNcNN8LSqk7jmusldWrbal9u16eiqBL76eDkXw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2385.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(7696005)(86362001)(66946007)(2906002)(6506007)(64756008)(66556008)(66476007)(54906003)(66446008)(4326008)(8676002)(9686003)(110136005)(76116006)(5660300002)(2940100002)(55016002)(478600001)(52536014)(8936002)(316002)(83380400001)(186003)(33656002)(26005)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: M76l0MUfZ+/p/o5o0fHCtRG69pWf5psKwi8wVY1Uu2G08ahbADHDZqxMMoloPZHKW3r2o7u8fq07hQBlsC51G4t8+nMM2uhfLsM8+2w4uuZKuJBS2TIu1CRRHfgKcZ8pIs6dudmGuDnb6D6UrIawhHAD35IPi4hubueClB5TGOADB4vGn+zHRV8rgXtb5+3OFILobo2VqHuB2gvna6JjIpH3bsxbMehdyvjUTdS94tTJy9J34LayDcodyFPpiV4ogtYz98xpelLq1OWbk970YrTVYnfo5XE0JLFOIebf3sLhjm1B+Qih9vAAxx8NXcv8TA9Q1VHUJdCHOoPADja3eDcdlsnC3TG14MoP76/m3t1gW9jUIU8a259SbUU2YwUGMlJB87VpoRSgwB91V725stZR3WNi+++EKq5dQH5K1k2PBolLjGxWKcYuWjiq+bDHn84WWA8L9OpKAkObGy/CWl3gvLezKnZ32s6NQ5SxfMmR/Nc0b7IzkZ7WTC0YHuupwByu6qMGoXZSo7p3qMMDqkAnRslfNcuR2icKVH4olzS5N2sN80qgPzO0WgohOgZB9wvVoCisLct0Z7fZGQRzBUzVyfXfl3FFBz+8drxebJLLs2sdE8T5odmQO2sfkF4nEGjImR0cF1y2RdxunQ2BGg==
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2385.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936eed0f-9b43-4cb2-301e-08d856612706
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 14:44:13.7739
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOMrg3PSAQ0vRV5LkR4q2BiZ51VkjNeJIjqFvCzu4O81gsVi2/eJ37ZzbvJVnlSZGz7Mc6t1geZWlAx8NP9sl0oQXDjKczW7JuRq5SU9z3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1735
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> From: Chris Paterson
> Sent: 11 September 2020 15:25
>=20
> Hi Fab,
>=20
> > From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Sent: 11 September 2020 13:13
> >
> > Add the DRIF controller nodes for the r8a77990 (a.k.a. R-Car E3).
> >
> > Please note that R-Car E3 has register BITCTR located at offset
> > 0x80 (this register is not available on the r8a77960 and r8a77951,
> > whose support has already been upstreamed), and even though it is
> > not dealt with just yet within the driver, we have to keep that
> > into account with our device tree nodes.
> >
> > Also, please note that while testing it has emerged that the
> > HW User Manual has the wrong DMA details for DRIF2 and DRIF3
> > on E3, as they are only allowed SYS-DMAC0 rather than SYS-DMAC1
> > and SYS-DMAC2. An errata addressing this issue will be available
> > soon.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
>=20
> Looks okay to me. Thanks for the patch.

Assuming you're going to update the bindings...
=20
> Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
>=20
> Kind regards, Chris
>=20
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 120
> > ++++++++++++++++++++++
> >  1 file changed, 120 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > index 1991bdc36792..caeddc2c1a70 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> > @@ -1288,6 +1288,126 @@ vin5csi40: endpoint@2 {
> >  			};
> >  		};
> >
> > +		drif00: rif@e6f40000 {
> > +			compatible =3D "renesas,r8a77990-drif",
> > +				     "renesas,rcar-gen3-drif";
> > +			reg =3D <0 0xe6f40000 0 0x84>;
> > +			interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cpg CPG_MOD 515>;
> > +			clock-names =3D "fck";
> > +			dmas =3D <&dmac1 0x20>, <&dmac2 0x20>;
> > +			dma-names =3D "rx", "rx";
> > +			power-domains =3D <&sysc
> > R8A77990_PD_ALWAYS_ON>;
> > +			resets =3D <&cpg 515>;
> > +			renesas,bonding =3D <&drif01>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		drif01: rif@e6f50000 {
> > +			compatible =3D "renesas,r8a77990-drif",
> > +				     "renesas,rcar-gen3-drif";
> > +			reg =3D <0 0xe6f50000 0 0x84>;
> > +			interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cpg CPG_MOD 514>;
> > +			clock-names =3D "fck";
> > +			dmas =3D <&dmac1 0x22>, <&dmac2 0x22>;
> > +			dma-names =3D "rx", "rx";
> > +			power-domains =3D <&sysc
> > R8A77990_PD_ALWAYS_ON>;
> > +			resets =3D <&cpg 514>;
> > +			renesas,bonding =3D <&drif00>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		drif10: rif@e6f60000 {
> > +			compatible =3D "renesas,r8a77990-drif",
> > +				     "renesas,rcar-gen3-drif";
> > +			reg =3D <0 0xe6f60000 0 0x84>;
> > +			interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cpg CPG_MOD 513>;
> > +			clock-names =3D "fck";
> > +			dmas =3D <&dmac1 0x24>, <&dmac2 0x24>;
> > +			dma-names =3D "rx", "rx";
> > +			power-domains =3D <&sysc
> > R8A77990_PD_ALWAYS_ON>;
> > +			resets =3D <&cpg 513>;
> > +			renesas,bonding =3D <&drif11>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		drif11: rif@e6f70000 {
> > +			compatible =3D "renesas,r8a77990-drif",
> > +				     "renesas,rcar-gen3-drif";
> > +			reg =3D <0 0xe6f70000 0 0x84>;
> > +			interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cpg CPG_MOD 512>;
> > +			clock-names =3D "fck";
> > +			dmas =3D <&dmac1 0x26>, <&dmac2 0x26>;
> > +			dma-names =3D "rx", "rx";
> > +			power-domains =3D <&sysc
> > R8A77990_PD_ALWAYS_ON>;
> > +			resets =3D <&cpg 512>;
> > +			renesas,bonding =3D <&drif10>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		drif20: rif@e6f80000 {
> > +			compatible =3D "renesas,r8a77990-drif",
> > +				     "renesas,rcar-gen3-drif";
> > +			reg =3D <0 0xe6f80000 0 0x84>;
> > +			interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cpg CPG_MOD 511>;
> > +			clock-names =3D "fck";
> > +			dmas =3D <&dmac0 0x28>;
> > +			dma-names =3D "rx";
> > +			power-domains =3D <&sysc
> > R8A77990_PD_ALWAYS_ON>;
> > +			resets =3D <&cpg 511>;
> > +			renesas,bonding =3D <&drif21>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		drif21: rif@e6f90000 {
> > +			compatible =3D "renesas,r8a77990-drif",
> > +				     "renesas,rcar-gen3-drif";
> > +			reg =3D <0 0xe6f90000 0 0x84>;
> > +			interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cpg CPG_MOD 510>;
> > +			clock-names =3D "fck";
> > +			dmas =3D <&dmac0 0x2a>;
> > +			dma-names =3D "rx";
> > +			power-domains =3D <&sysc
> > R8A77990_PD_ALWAYS_ON>;
> > +			resets =3D <&cpg 510>;
> > +			renesas,bonding =3D <&drif20>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		drif30: rif@e6fa0000 {
> > +			compatible =3D "renesas,r8a77990-drif",
> > +				     "renesas,rcar-gen3-drif";
> > +			reg =3D <0 0xe6fa0000 0 0x84>;
> > +			interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cpg CPG_MOD 509>;
> > +			clock-names =3D "fck";
> > +			dmas =3D <&dmac0 0x2c>;
> > +			dma-names =3D "rx";
> > +			power-domains =3D <&sysc
> > R8A77990_PD_ALWAYS_ON>;
> > +			resets =3D <&cpg 509>;
> > +			renesas,bonding =3D <&drif31>;
> > +			status =3D "disabled";
> > +		};
> > +
> > +		drif31: rif@e6fb0000 {
> > +			compatible =3D "renesas,r8a77990-drif",
> > +				     "renesas,rcar-gen3-drif";
> > +			reg =3D <0 0xe6fb0000 0 0x84>;
> > +			interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks =3D <&cpg CPG_MOD 508>;
> > +			clock-names =3D "fck";
> > +			dmas =3D <&dmac0 0x2e>;
> > +			dma-names =3D "rx";
> > +			power-domains =3D <&sysc
> > R8A77990_PD_ALWAYS_ON>;
> > +			resets =3D <&cpg 508>;
> > +			renesas,bonding =3D <&drif30>;
> > +			status =3D "disabled";
> > +		};
> > +
> >  		rcar_sound: sound@ec500000 {
> >  			/*
> >  			 * #sound-dai-cells is required
> > --
> > 2.25.1

