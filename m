Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4096439BA4C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 15:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbhFDN4l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 09:56:41 -0400
Received: from mail-eopbgr1410110.outbound.protection.outlook.com ([40.107.141.110]:34598
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230209AbhFDN4k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 09:56:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bT3sUOkX5Keq0GjSIs3Xwk9HzhqAntfknQVTU1oiMgEUV+lCH3UE6NFGanrag7AL4uureKXTomh4sp7MO9fIt2JuFJioqfOaSgvLs60pbYiL27vThhL7M0AhgpsX4GD1ck79XNWTQFvnLaTuoE7XdP8Z5iLfGFoPHwkeppYqmhCDOss4UU4c7bz7t4COIA+Lezu0t8KB7Ta9i8bQS8RmJqrLPido1THf/sA30DW5W4/Cqp6GcGOlWwm/et7Vi0DFU3IpFwFpw8KPjasAb6vG3fq6Zzp8seQhS5YG4/Drt3KjgKT+xLT3UenHONLl4KafQOM3kmJ3cMX/MLQsfEYXWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rwruLE+aDRc9oCCwi1bApJVAB2V24Uk2Toa6ku7ogw=;
 b=QajsRUdkberiW77ny4Kp/HJLAthkB3hMHBXsV5/fvmPiKsaLNnptRV0LAhW1hUiYsnjI2G6OTwf3h4S7yM3MzbM9l7EgLF60ohUCfWl7Vs/7+Y+33y9f3FVoOy5tgX/vN7bz+dR/e0Lw5CkrQ77MHtEptBA6AC9t9StWHnK1gwAzLOx7TYXkTJiNr0BvH2OCdh2hWUYafeXj5kEhqgZf93HUeDd/nFQDi2a/TuCBfPFIe5378SUnV/pBMl2n+FgEp9o4+sVbpt+E3sUsQcQK557lL872q6I3gJqPoVpN29V/07N7/Z9AktYP+G47/TBbpwqjFCYJk5uxzpAiZLRuag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rwruLE+aDRc9oCCwi1bApJVAB2V24Uk2Toa6ku7ogw=;
 b=OIGCCeCVINGVvGEsHhfB1uKpdbxPw3w/sx66DZrOKmkMEZajR5KQj4Q34+AkPohZniHQLzCdJFQwdQCs56n+m17laPrwvkFluZ0oWyQ+nCOGaOMNktsXMXWeVdJ620EKeAGjnKnBMCSR3lPybIPkPddMuwMfsSUw1Bcuu/htyrE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSZPR01MB7068.jpnprd01.prod.outlook.com (2603:1096:604:11a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Fri, 4 Jun
 2021 13:54:51 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3c5d:90e5:6811:6913]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3c5d:90e5:6811:6913%3]) with mapi id 15.20.4195.025; Fri, 4 Jun 2021
 13:54:51 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
CC:     Prabhakar <prabhakar.csengg@gmail.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 11/12] arm64: dts: renesas: Add initial DTSI for
 RZ/G2{L,LC} SoC's
Thread-Topic: [PATCH v2 11/12] arm64: dts: renesas: Add initial DTSI for
 RZ/G2{L,LC} SoC's
Thread-Index: AQHXWMZyYuQzkjFuh0OkiBvnoZpocasD3lhA
Date:   Fri, 4 Jun 2021 13:54:51 +0000
Message-ID: <OS0PR01MB592232BFAF59D5C81CCBE6C7863B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210603221758.10305-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210603221758.10305-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bp.renesas.com; dkim=none (message not signed)
 header.d=none;bp.renesas.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [81.152.191.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8145371-3dfb-4225-d422-08d927605336
x-ms-traffictypediagnostic: OSZPR01MB7068:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSZPR01MB7068E7198058EF7C1D3EE8E4863B9@OSZPR01MB7068.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iBBhnxoBMTp0BvvPhHlA9bTonjyoVQqh20eLqBMhk1fDUzSHB5RlNoVb5IUnE3l8jClg2CGkv53zV+F2XHN7/JSzM4KnpOnkC55GV+TUJ1pACNqTF8adiVN17J4cBvB/xkU8OnHGHaztBNQoRVZEFH4X1F9GSKeRD9YbpqzXUUzJqo6t5AdIIXIKjLfb/mBFgeDH8S2OoAjWqMk2WtNy/9F1IE+0ZrOEyRc3eOz4rfyW4FiQekN8mtu+lPLyUQcvW+2ZIvpmnhwo/0/Xur+s0/+EoayfR6sRm60NnsPId4qBwsLxRLESKP8NA+xa3kZo7Yfx5G7ffbkRBwgH0JZYLfN+MdhU74974HiuEDug1rUhcTSuqf+TaTY7gufbgyxYmab0/yPVf/Xy3McUfX8KwE6mnWYE42XuKAmjfe7eDIY8TAonE3D8gNR2eyx5o+UpryNgF3g0LZzQoxJSob2DOp5ZaEftXpRgoVihHNYN7Kg1ZwjJErSXQ2l9i5ON2Ghcl1wP+UPiTtjATSLryqrlpJvkh/fGeYOM1tr5bjnZJRm5VPPaLqtao3cYrR7S/xoRn3tXH3SGE7PmnMKu4oipIpS+R5x26U4yl+xiT12qUt8nTPA8mk0LLuxv/NU0ISewsUfv+T9FWHZsG6mlBsVjbQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(346002)(39850400004)(136003)(26005)(38100700002)(76116006)(33656002)(66556008)(186003)(66946007)(55016002)(66446008)(64756008)(110136005)(66476007)(8676002)(71200400001)(83380400001)(7696005)(54906003)(86362001)(8936002)(5660300002)(52536014)(2906002)(7416002)(4326008)(478600001)(6506007)(921005)(9686003)(122000001)(107886003)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?9oDWrewN+dL/G00JZEuWv9fjknskaF1VuiPnrYqZjB6zpkgzFYFsxJHbp7jE?=
 =?us-ascii?Q?SPJ81Eyp0bAP6jDKzBv4RIculTN9ZDzfZLz5zsV3wg5pq01YVcYMn7Wjw7iu?=
 =?us-ascii?Q?ETjKNhEovGvTK0kR92cYsFbz6bLIEkX9NlOquZu/WAoWFVGorE3mFQB/TTza?=
 =?us-ascii?Q?K5zimsViM2H87U0aRKwfZ2CQJv+tj8YsKcoe1EBpkk4q80TJTVgxU92iM4Aj?=
 =?us-ascii?Q?9YYdWgkdf+YIwtJVEMouYrDfo6+kygPH5qs2ifBz18pSMsypQxTwUOs/T+T0?=
 =?us-ascii?Q?y8N+6vuecgZURCtRSnUmWk6Jv5KpIf/R/R5N9U/pGjybYrxN2i7VcTKUvUMf?=
 =?us-ascii?Q?0fnO49BnXb1LpmvNC2C3y9GNGUuBsV4FIZtSb4n8vSaQxPDChEOfuv2Nmlq3?=
 =?us-ascii?Q?xQrrnRMgnuIBqSJh7uV4OMactfTIV4C61z6Lp6oVDiU+A/1y5T1sTc7MEgOQ?=
 =?us-ascii?Q?mJYgjB8Yiuy9Byzx8ch0y3mgiOkp4voxQXRwvZhsE4GJzCuAnx9qqN8g1/F8?=
 =?us-ascii?Q?elLqAyDGc55ax0efnZXxC6/GDIZaRBFsGzCQX1+DeYp9yNc96ih1I08nyTBh?=
 =?us-ascii?Q?pHeQ8pKEijX6BG5pWjcv76/1bQCzQeU6JTRcZvsZhwuA0WrXe8JQ4TcUVc3Q?=
 =?us-ascii?Q?TzBpCj4Szqw3+buY2epzVOif8o/+iFvjkqL0r0ISY5lP7f6AWFfk9NQrFuny?=
 =?us-ascii?Q?ermbFTEEuIflSUHGnTl7wY45Ko/QLKh9V050f4Ckkt20/LVX95+vtvpe8uAE?=
 =?us-ascii?Q?NdKbPiF8ZeeKPBC5Q116k/8sC86Dy01gIGFnaSGijQ2cBDFDWTIjR5HSzThJ?=
 =?us-ascii?Q?hshYr9b94t5ldW2LXvht1WOFtK1zeMbbFKmpq1d9Yt9cEHQ9Un4MdNwk/zgX?=
 =?us-ascii?Q?NBW/5Em4OKfcHPaDrOS/oEfZRcfhYqVixkPU5DVwk3cTCmcOCOX1Y/7ASnj3?=
 =?us-ascii?Q?UAnElQ6Nr4Y3ClzSjh2BEuXuAqBa8CYo9+nafUTxMGHdRQglzIXmrVKeBHP1?=
 =?us-ascii?Q?BRp9oN3K8ur+mt7OseGKgKLGRPB+Gx/0KSFSbxa15gN3mK0dOjjisgeMNvNe?=
 =?us-ascii?Q?ja27wzL4Q9+81dAiWpRS0u86Tq3xzODURWxKxwi0vLHWwtWjf63w8CbhnPlO?=
 =?us-ascii?Q?urxvdyN9PnFQEJPItyqiH6E95Raiv9wD9pGypXJxCXVd7cQX3FbYo6tJYXs7?=
 =?us-ascii?Q?oNpkwZyH6Nr53dYSlQZjjLdB0IuJgxfN3e6xKPtbMFGWhKxecelJfSd912aM?=
 =?us-ascii?Q?4Op2TsO/9TX/gzOlWIVQG+O8+p4Bj1vRid+QZhkQI84Su0JKQrBzsyhrFjyD?=
 =?us-ascii?Q?NQecFHgRyZp753xU2uTnTCpw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8145371-3dfb-4225-d422-08d927605336
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 13:54:51.2109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0RQ31kKYQ6497o4C0mncDGyH0Bia9/bgjmNKFM3+LlaPFcBYqL5kkbWZDwOeAQ4aKbW0c5KkvVBA96wB0tXxqH68WF1y1jsxXkysokOEoVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7068
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thanks for the patch.

> Subject: [PATCH v2 11/12] arm64: dts: renesas: Add initial DTSI for
> RZ/G2{L,LC} SoC's
>=20
> Add initial DTSI for RZ/G2{L,LC} SoC's.
>=20
> File structure:
> r9a07g044.dtsi  =3D> RZ/G2L family SoC common parts r9a07g044l1.dtsi =3D>
> Specific to RZ/G2L (R9A07G044L single cortex A55) SoC
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a07g044.dtsi   | 119 +++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi |  25 ++++
>  2 files changed, 144 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044.dtsi
>  create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> new file mode 100644
> index 000000000000..b2dbf6543d98
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2L and RZ/G2LC common SoC parts
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/r9a07g044-cpg.h>
> +
> +/ {
> +	compatible =3D "renesas,r9a07g044";
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	extal_clk: extal {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		/* This value must be overridden by the board */
> +		clock-frequency =3D <0>;
> +	};
> +
> +	psci {
> +		compatible =3D "arm,psci-1.0", "arm,psci-0.2";
> +		method =3D "smc";
> +	};
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu =3D <&cpu0>;
> +				};
> +				core1 {
> +					cpu =3D <&cpu1>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0>;
> +			device_type =3D "cpu";
> +			next-level-cache =3D <&L3_CA55>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu1: cpu@100 {
> +			compatible =3D "arm,cortex-a55";
> +			reg =3D <0x100>;
> +			device_type =3D "cpu";
> +			next-level-cache =3D <&L3_CA55>;
> +			enable-method =3D "psci";
> +		};
> +
> +		L3_CA55: cache-controller-0 {
> +			compatible =3D "cache";
> +			cache-unified;
> +			cache-size =3D <0x40000>;
> +		};
> +	};
> +
> +	soc: soc {
> +		compatible =3D "simple-bus";
> +		interrupt-parent =3D <&gic>;
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		scif0: serial@1004b800 {
> +			compatible =3D "renesas,scif-r9a07g044";
> +			reg =3D <0 0x1004b800 0 0x400>;
> +			interrupts =3D <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "eri", "rxi", "txi",
> +					  "bri", "dri", "tei";
> +			clocks =3D <&cpg CPG_MOD R9A07G044_CLK_SCIF0>;
> +			clock-names =3D "fck";
> +			power-domains =3D <&cpg>;
> +			resets =3D <&cpg R9A07G044_CLK_SCIF0>;
> +			status =3D "disabled";
> +		};
> +
> +		cpg: clock-controller@11010000 {
> +			compatible =3D "renesas,r9a07g044-cpg";
> +			reg =3D <0 0x11010000 0 0x10000>;

What about WDTOVF_RST(0xB10) and WDTRST_SEL(0xB14) registers, this register=
s to be handled by WDT driver.
Unfortunately it is in CPG block.

So do we need to map the entire CPG registers or up to 0xB00?

Geert, Prabhakar: Any thoughts?

Cheers,
Biju

> +			clocks =3D <&extal_clk>;
> +			clock-names =3D "extal";
> +			#clock-cells =3D <2>;
> +			#reset-cells =3D <1>;
> +			#power-domain-cells =3D <0>;
> +		};
> +
> +		gic: interrupt-controller@11900000 {
> +			compatible =3D "arm,gic-v3";
> +			#interrupt-cells =3D <3>;
> +			#address-cells =3D <0>;
> +			interrupt-controller;
> +			reg =3D <0x0 0x11900000 0 0x40000>,
> +			      <0x0 0x11940000 0 0x60000>;
> +			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +	};
> +
> +	timer {
> +		compatible =3D "arm,armv8-timer";
> +		interrupts-extended =3D <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2)
> | IRQ_TYPE_LEVEL_LOW)>,
> +				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) |
> IRQ_TYPE_LEVEL_LOW)>,
> +				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) |
> IRQ_TYPE_LEVEL_LOW)>,
> +				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) |
> IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> new file mode 100644
> index 000000000000..02f6da806696
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/G2L R9A07G044L1 common parts
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +#include "r9a07g044.dtsi"
> +
> +/ {
> +	compatible =3D "renesas,r9a07g044l1", "renesas,r9a07g044";
> +
> +	cpus {
> +		/delete-node/ cpu-map;
> +		/delete-node/ cpu@100;
> +	};
> +
> +	timer {
> +		interrupts-extended =3D <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1)
> | IRQ_TYPE_LEVEL_LOW)>,
> +				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) |
> IRQ_TYPE_LEVEL_LOW)>,
> +				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) |
> IRQ_TYPE_LEVEL_LOW)>,
> +				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) |
> IRQ_TYPE_LEVEL_LOW)>;
> +	};
> +};
> --
> 2.17.1

