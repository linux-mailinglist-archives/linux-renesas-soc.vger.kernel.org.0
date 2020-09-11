Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3913266563
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 19:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726294AbgIKQ6O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 12:58:14 -0400
Received: from mail-eopbgr1410124.outbound.protection.outlook.com ([40.107.141.124]:6675
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726246AbgIKPE2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 11:04:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MP7RByA6zVfSsAg67Q+bFE/Y8ihaErkBSzLFO6XmaJJak9Z1tNpZyHT62L90qnUglsjzoZf4/ID0SCc7Vcfk6pNL9kCvh1eJZqqoQRwWHQ4ZOXZi4uc9s4aGyVcyXj0UIyyiDv30hiv/HhzCWyl4esHxW9KcUuC6gQBeXv5B28NMb1RRxEK/IumjhjpAHFNI4pfDTHJgnqCwP9jp2pfBgCAbto4l3OzUFC8G+A8W0apZk7stLR1gNSK1GpD7gloVVp/IcTuES8kkAFzHX5HakJE5cYMYMsk+tgIgkqVyJsRZjrKHU+FVpVBl8yvk8vHD2OUwciI3XNNnfHD9R4rz+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyVa8ezLwz+uPKTF5HpJY2JUjrKTtQyi3AbO0YzRyYQ=;
 b=SJH/ZMacj0fNsGfLsVpc+cHyLN83UCuBM45KGwfQl3PyNFB1goh7cmOgydcNMV3URt6tikBeXOX6BzYdksqE25FilVEGJ/9CRZOHQs3G4BME4Ue5KYGyFODX0t2WAPzGhdVm24PduKLT1fHgMU66oNbb0eoKKBqDu542ApyiKLanchZ+Fy480YarMqTmZB0YXYukEP2yCLDvw97AZlV4q4cHR2DyTZqnR6Iw1KZva0OQOhaRd/JBox0RrFVuLzsnLbRoAmLUpoC1wKhczJ2h4HTj0pG4FG7oJ79n86dNlOfoQPDN4vC8G7vh7vhrVKzlPtFbL1SpivIMMWQmpl9MMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyVa8ezLwz+uPKTF5HpJY2JUjrKTtQyi3AbO0YzRyYQ=;
 b=ZWV1Nb88gktMIbUs1xgBZfMMeJRJ5B0v3LEbraWd+i9EqzHf9ISjqKfN5ZBf8PAJun+54x20laaGrmB9YQhXY64rvWb/IM7k17dKZpCX8mC4lOUDxW5zeCyPCErSlQUfpiUhesHWVdbbNc0kZ8ilHb+hK7yN915TMSibfPSm9Jc=
Received: from OSAPR01MB2385.jpnprd01.prod.outlook.com (2603:1096:603:37::20)
 by OSBPR01MB5176.jpnprd01.prod.outlook.com (2603:1096:604:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15; Fri, 11 Sep
 2020 14:24:38 +0000
Received: from OSAPR01MB2385.jpnprd01.prod.outlook.com
 ([fe80::75bc:81cc:bb5:7d50]) by OSAPR01MB2385.jpnprd01.prod.outlook.com
 ([fe80::75bc:81cc:bb5:7d50%6]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 14:24:38 +0000
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
Thread-Index: AQHWiDTuz7MJCTxWkE21FuJi1e1lZaljfMog
Date:   Fri, 11 Sep 2020 14:24:38 +0000
Message-ID: <OSAPR01MB238592CAC340A0BD147847ABB7240@OSAPR01MB2385.jpnprd01.prod.outlook.com>
References: <20200911121259.5669-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20200911121259.5669-1-fabrizio.castro.jz@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: renesas.com; dkim=none (message not signed)
 header.d=none;renesas.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [31.54.191.121]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e41b99da-50bd-4995-9a98-08d8565e6a85
x-ms-traffictypediagnostic: OSBPR01MB5176:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB51760CB32140D14BA65A0CE6B7240@OSBPR01MB5176.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dTRCdCuYM64RphQMC0i3kvWqldBEE5xFjRH2sJEFZTzbUudKLnGg/6AtyHNbQRgoQJj125JMudWJNw1RIhIqjj/S0roZ/y8YnVa0+yJKswCGO/ZsbQXPZjAHpDPBBnh2Wq2VYs5nZcz+cpIMUUB2qwwNDh97vLPRrNGFFhiqDKM4wvSy4QbxY2mXMB9XScDpUHj5YNoyMZioG761YkjBzlFCKv4WR+nErp5cUYDM7BHXXYgE+JxVIwQVXiguBXKERDDs1E8TEk2VaZA+4sAKGkQAjLsoxKe9ptYXWUSHJZaqUbRyoXyMWBsXOEU7xhYzK09OZGGfLg9+p7240KiCNA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2385.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(26005)(5660300002)(110136005)(478600001)(83380400001)(71200400001)(86362001)(52536014)(33656002)(66476007)(6506007)(54906003)(55016002)(186003)(66446008)(66946007)(76116006)(9686003)(2906002)(8676002)(4326008)(316002)(64756008)(66556008)(7696005)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: VbCErXVJBDyAzOaMauAMyAyHjI57QWKbIQVDOePsirWE/aNipBjOcWRY8j8mjyL99KFkpu37He5mgw15XL2NSvUNzRyP/X9tsBUJKrCd4WRlkUxUraSGbUmYtJgHYNVbh8a+trSlhjP8fQPH1YNERbzcmsOBf7H7RLhl9Trhx2mV0krM7vjxvnZaSJMETf2dWHMu3FQAl4V7nl+EcAFe1tDw/UzQOe/7fk3ET+sN85E0KgyrMKl0jKeZQmDDT0VSmVD28Px4ZwuglElYSLUk9RCLPDxFlNKTXak8lKtyC5iVpYSJcJkKGWcm/c8VPgt9s96wugpqMFhMMLPMYQPdeQzJ+9EHval6OGoq8p9CmsXl9QMZpLLcFJu8/9flIHyHNWZXajAl1Qj4lohr3pcVN6BHMJWhPJPykId9WSlZVH/dq2Y69iyJALnsdLj6b+3vK8t50F0MxyfWSc00PwMkmQ5/H5e8HveH2MRonKDMrVIcxRv3mQ93DlceMvJipRWYDw/T4K9CQVEhSZMOioziFZQzekDAWapdIEuVnuLy2LDarbzmgnOpnPl3agGGq/stOaMIdcVLAO2+WmX20rP2voJZrwNRHahYWudqepuTM82Y2849gCnHhR6qhWjGpY9Lyh6LMRMwKE/l/+sfdIGHdg==
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2385.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e41b99da-50bd-4995-9a98-08d8565e6a85
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2020 14:24:38.5071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q4538gdzpSGn0Zt2OowSjdrhYv3eVY+xO7dgESm5avcghLRPV3ETTU8RMMUsqWY9knjA9tyNBwhNUXpGZR/81KkRJ4TLpw5/y4ACLTurCqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB5176
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fab,

> From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Sent: 11 September 2020 13:13
>=20
> Add the DRIF controller nodes for the r8a77990 (a.k.a. R-Car E3).
>=20
> Please note that R-Car E3 has register BITCTR located at offset
> 0x80 (this register is not available on the r8a77960 and r8a77951,
> whose support has already been upstreamed), and even though it is
> not dealt with just yet within the driver, we have to keep that
> into account with our device tree nodes.
>=20
> Also, please note that while testing it has emerged that the
> HW User Manual has the wrong DMA details for DRIF2 and DRIF3
> on E3, as they are only allowed SYS-DMAC0 rather than SYS-DMAC1
> and SYS-DMAC2. An errata addressing this issue will be available
> soon.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Looks okay to me. Thanks for the patch.

Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Kind regards, Chris

> ---
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 120
> ++++++++++++++++++++++
>  1 file changed, 120 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 1991bdc36792..caeddc2c1a70 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -1288,6 +1288,126 @@ vin5csi40: endpoint@2 {
>  			};
>  		};
>=20
> +		drif00: rif@e6f40000 {
> +			compatible =3D "renesas,r8a77990-drif",
> +				     "renesas,rcar-gen3-drif";
> +			reg =3D <0 0xe6f40000 0 0x84>;
> +			interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 515>;
> +			clock-names =3D "fck";
> +			dmas =3D <&dmac1 0x20>, <&dmac2 0x20>;
> +			dma-names =3D "rx", "rx";
> +			power-domains =3D <&sysc
> R8A77990_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 515>;
> +			renesas,bonding =3D <&drif01>;
> +			status =3D "disabled";
> +		};
> +
> +		drif01: rif@e6f50000 {
> +			compatible =3D "renesas,r8a77990-drif",
> +				     "renesas,rcar-gen3-drif";
> +			reg =3D <0 0xe6f50000 0 0x84>;
> +			interrupts =3D <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 514>;
> +			clock-names =3D "fck";
> +			dmas =3D <&dmac1 0x22>, <&dmac2 0x22>;
> +			dma-names =3D "rx", "rx";
> +			power-domains =3D <&sysc
> R8A77990_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 514>;
> +			renesas,bonding =3D <&drif00>;
> +			status =3D "disabled";
> +		};
> +
> +		drif10: rif@e6f60000 {
> +			compatible =3D "renesas,r8a77990-drif",
> +				     "renesas,rcar-gen3-drif";
> +			reg =3D <0 0xe6f60000 0 0x84>;
> +			interrupts =3D <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 513>;
> +			clock-names =3D "fck";
> +			dmas =3D <&dmac1 0x24>, <&dmac2 0x24>;
> +			dma-names =3D "rx", "rx";
> +			power-domains =3D <&sysc
> R8A77990_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 513>;
> +			renesas,bonding =3D <&drif11>;
> +			status =3D "disabled";
> +		};
> +
> +		drif11: rif@e6f70000 {
> +			compatible =3D "renesas,r8a77990-drif",
> +				     "renesas,rcar-gen3-drif";
> +			reg =3D <0 0xe6f70000 0 0x84>;
> +			interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 512>;
> +			clock-names =3D "fck";
> +			dmas =3D <&dmac1 0x26>, <&dmac2 0x26>;
> +			dma-names =3D "rx", "rx";
> +			power-domains =3D <&sysc
> R8A77990_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 512>;
> +			renesas,bonding =3D <&drif10>;
> +			status =3D "disabled";
> +		};
> +
> +		drif20: rif@e6f80000 {
> +			compatible =3D "renesas,r8a77990-drif",
> +				     "renesas,rcar-gen3-drif";
> +			reg =3D <0 0xe6f80000 0 0x84>;
> +			interrupts =3D <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 511>;
> +			clock-names =3D "fck";
> +			dmas =3D <&dmac0 0x28>;
> +			dma-names =3D "rx";
> +			power-domains =3D <&sysc
> R8A77990_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 511>;
> +			renesas,bonding =3D <&drif21>;
> +			status =3D "disabled";
> +		};
> +
> +		drif21: rif@e6f90000 {
> +			compatible =3D "renesas,r8a77990-drif",
> +				     "renesas,rcar-gen3-drif";
> +			reg =3D <0 0xe6f90000 0 0x84>;
> +			interrupts =3D <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 510>;
> +			clock-names =3D "fck";
> +			dmas =3D <&dmac0 0x2a>;
> +			dma-names =3D "rx";
> +			power-domains =3D <&sysc
> R8A77990_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 510>;
> +			renesas,bonding =3D <&drif20>;
> +			status =3D "disabled";
> +		};
> +
> +		drif30: rif@e6fa0000 {
> +			compatible =3D "renesas,r8a77990-drif",
> +				     "renesas,rcar-gen3-drif";
> +			reg =3D <0 0xe6fa0000 0 0x84>;
> +			interrupts =3D <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 509>;
> +			clock-names =3D "fck";
> +			dmas =3D <&dmac0 0x2c>;
> +			dma-names =3D "rx";
> +			power-domains =3D <&sysc
> R8A77990_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 509>;
> +			renesas,bonding =3D <&drif31>;
> +			status =3D "disabled";
> +		};
> +
> +		drif31: rif@e6fb0000 {
> +			compatible =3D "renesas,r8a77990-drif",
> +				     "renesas,rcar-gen3-drif";
> +			reg =3D <0 0xe6fb0000 0 0x84>;
> +			interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 508>;
> +			clock-names =3D "fck";
> +			dmas =3D <&dmac0 0x2e>;
> +			dma-names =3D "rx";
> +			power-domains =3D <&sysc
> R8A77990_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 508>;
> +			renesas,bonding =3D <&drif30>;
> +			status =3D "disabled";
> +		};
> +
>  		rcar_sound: sound@ec500000 {
>  			/*
>  			 * #sound-dai-cells is required
> --
> 2.25.1

