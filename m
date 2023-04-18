Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4C7D6E6005
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 13:38:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbjDRLiC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Apr 2023 07:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbjDRLiB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2023 07:38:01 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2130.outbound.protection.outlook.com [40.107.114.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B5AC9D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Apr 2023 04:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NZpJ2qsEJqptaXlEbCe2uqHsbigN4s4QOs3hayOUgev9HGOzQmgpPuR7kBJuF+KQSxbeRiJvyc7KCxXZrKBh6OloJu2U30GLM4byaezlXGLNY184nzTV4JR1k5a3OlJVhsYAH4T6Fvo17LLFnJepRmaSD6FfmLQglhDqCfsv4SG3/Fvqvr2Rrq7UcNKMlIVSnFZ+1ZIajs5h/jMRioGAOK/hOVIh73B0tpOd0MSqN8Vw9rhwObkr6/b7EO5zoIQugx/4MgFbCrloDzy4IWrA2EfnrDZrItJpJba7Y1xhtX38Op4z6KxdEX/NCdtOuQuKDJTsfCdTtIV3/vnHMFmdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U60vqHQds0ODADgn11cRQwSkR7HAcjQewWAtZEniRt4=;
 b=CJ4htVnOLo4dh8vi9vBZXDbeYddgtctiwNqhT4CxjZl84MZn4WS/+BtuoblAdQRBwUTmWrZtIte2lrLIX0b/SyxWAWdAVGV5+Zw0uE2FgywZYS6ADoNOzXlx+bNZL3L3pk8abXmRPz0ZFi1IHKpYDoqKWKTRJzcgardkHhL0VbppCfD2+fPGEdwZ5T7AnPeNbaVwa0ZrLfWxAKrCqlwFVRuQMtQ8X9pmLH+sGr9o1sb2VDHu95AV2J/6ARN6z1LtfxE26j9Dkk2sLDmKJ1BMIpllNUGUkfrw5+m6ywwkS8yTCill9rn/DmlksYW0dHPFmQ84Q1+iX0u0p7g2szW9jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U60vqHQds0ODADgn11cRQwSkR7HAcjQewWAtZEniRt4=;
 b=kWc+eqELLMigVH1IoZEsSCn1iK3jlvoDUyoiWM6LhNc6IvzgkctW7iJEciVmkYstQ7kEmdxQPEk2gHD9DJuamCk/SLoI6HbrKFHm1zTXPU/4fy21G4BAWr2aCPKxyKDagpL48rAJJnPHBLPZOvOPt75HyHVIrQlMU3wSAmdvhGk=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS3PR01MB8368.jpnprd01.prod.outlook.com
 (2603:1096:604:193::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 11:37:45 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::5198:fdcf:d9b1:6003%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 11:37:45 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] arm64: dts: renesas: r8a779f0: Add PCIe Host and
 Endpoint nodes
Thread-Topic: [PATCH 1/2] arm64: dts: renesas: r8a779f0: Add PCIe Host and
 Endpoint nodes
Thread-Index: AQHZbqKP5H8flA1+xkaBO6/dYLw78q8w9h4g
Date:   Tue, 18 Apr 2023 11:37:45 +0000
Message-ID: <TYBPR01MB5341C150BCDD0E9995663FEAD89D9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230414072717.2931212-1-yoshihiro.shimoda.uh@renesas.com>
 <20230414072717.2931212-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20230414072717.2931212-2-yoshihiro.shimoda.uh@renesas.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS3PR01MB8368:EE_
x-ms-office365-filtering-correlation-id: 63c3fc3f-18b8-4ae3-0eaa-08db40015460
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O6uN+kp40Mh4EAMdTC6lET7ctwyyYvTRFHqE4eMsHu8JZPuufeyDOGnaPbcLuGgU8Ol0u8MqPMHY/tDQRLDawRQoxVg7iLvuSresZ1QL3PYh8LSKD04bDk1esU/8Wlzfs6hIJceHeCMYg+MDqMiTbUhX3RpxCKClcHxtWiWb++zF2yvuwWlEk/WpsE6ZbHaF0DVAVPJ/M8nKoniuxxI6Rmp/bXqFY7FdZDIHjCBlyRCA+HnWfbSP64IT2f2lMRGe8Oa1/rfxfjRiA+9yC0SF0x/aWb/0pStk5seNd7G24nRh47nl3XmmWJFP9rvk9tzDjymW6iWVknSGAXqrnfrwq8x6mlKc6chUB9Pt8KEbQnzu3+miSBRebhxRbnQ4u5DB9o/QZCo/CysPrZwSKuYuFktU6lslQN7IFd1b4KGH/kfn5U7AgTMdttVV3xuHt+YrhMZooNMCAMQOZuPOT4NIe6tMatXwDogNHbq76WixU9stNQWtJv38v737cqmGaA38DovmVzjtazoZMPvcTxOeHHzKuauMyMXmSf+QwMFSoa9X6R6djIh+OQr3Dtw9OAIRWkVg/FoevUw07gKLa0kN1rw6883t41/2MvRx9W6y0cjuepfNojdrfosdperQwRyN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(366004)(346002)(451199021)(8936002)(8676002)(66476007)(64756008)(66446008)(66946007)(5660300002)(4326008)(66556008)(52536014)(76116006)(122000001)(110136005)(186003)(38100700002)(55016003)(41300700001)(9686003)(316002)(33656002)(6506007)(7696005)(478600001)(83380400001)(71200400001)(38070700005)(2906002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N355aPmNTtrcmv1mALB5TsYJWnj8OCelj2hirKUedEA/wSjuKTOibkd30Zxd?=
 =?us-ascii?Q?Hwr0OaOf4sbuAQGuYEXjaDUCWtYDH1S8DijFZLMfU6JlYtZ2m1HL1eFKvLsa?=
 =?us-ascii?Q?Zv4vC8RUfGwptwqn6DdTquOcZ1gQaj6Av43RXiNsjx840848jBkZ6UDVDxfQ?=
 =?us-ascii?Q?vMmU4ifTID+rbyFyk+VZzj2/FIxkDrntmKjiJBvWtnrwgltmU29TWhomJ779?=
 =?us-ascii?Q?b6Fg4iF7hnXCrq+LbgOJUujclgau/ujuw+ggln4i+i1SWKw7cMUf3z7t09Sl?=
 =?us-ascii?Q?MM/kM8YmttrP/ecdTuIHYFpHvG2jdobt4veDyH6K7EZhlBQquPuEns+kafXn?=
 =?us-ascii?Q?WfNQieUrL8IsHjHLp1EnIV3RCi1rZTti3JlAuJ5R/Y1tOEXkDdnLytuhe4C+?=
 =?us-ascii?Q?9IDglP0P5o+ZADrs2TtX8MFlhGX0kE8RuPAGiKeJzqtoIXyqon2P46aHCabL?=
 =?us-ascii?Q?9xDtm131oK60nRdpPKBre4x7NhhABfng7XuVHsbGajWrChvJzzft6z58xlhg?=
 =?us-ascii?Q?QD3M6+4zMkaKjvnhzlA7YnOQ1QmMz8fL15qrZmCypO7Y4sYirgQ6AjA2VeWJ?=
 =?us-ascii?Q?s6sN+0qzaX14lhDIENESQLW966Lq3T6WC6u47byQyOw+VgE4TWzXo8Xxjrti?=
 =?us-ascii?Q?FbPZZyyLdGw837JEktGifpP0AGe3VjVV4g/Y2soEAOG/dBJaOrFeve/XM/3I?=
 =?us-ascii?Q?GQxVESfQ51d3fMT2ysFFs5ridNmCfx2j61NEk1B8mOcz0NSos32haboBVcRJ?=
 =?us-ascii?Q?tqaqc6uWQSlfG8L5gRL1Bo13waIqN6qdhgZpLNyf0qfG52njBLMQrtFjWNAJ?=
 =?us-ascii?Q?gSpFXhgkxtVQSVdkjElHakEZezYpAmnXGDrNaxDk4wcBAAygfs8VGO/bZMi/?=
 =?us-ascii?Q?E3xx9UUUoXTMvCBcA1RfhWywiGk3LWvU93BsY2NScPpErNz7Le1C8PmSFV/8?=
 =?us-ascii?Q?+4ktIKJ6w0cgyVf4LRZcjCurS/eSKmTBR/m9E0jSegSS8Pxd/vH+vnNZd3Wz?=
 =?us-ascii?Q?hSD7J6f5nGlxMm+Gh5sk363wiijuO2+o4UG49P8Xl1SaXXTDLn4SKFCEB4uW?=
 =?us-ascii?Q?NxJDKNGprUrjhx6NQkp7awVkNsGYFTMGXGxR4ItFFig+jCAcaVV8yt9PcUTF?=
 =?us-ascii?Q?vYSVM4fyudy5vu3yZShDpyb/qtBEZRlyAQigT3fVd8jze1jbX9KTLFZvKekD?=
 =?us-ascii?Q?XRvBrLtlZHH9GWSfRwEzXRUNLmrN6M3thTlpW6E6xvyNAUhrt380Twug2VDc?=
 =?us-ascii?Q?tfoL3bdkJTRvKZN8yNzGPnIvSGJ+B+86PYx4RKewWqIIKxUyTZlv+RoZ+pKW?=
 =?us-ascii?Q?W26sFgN2T42aAYYrZlTpnCVCywAFbheIFSGED4CB5YzIQMDx6zAUZ6Ek2qbl?=
 =?us-ascii?Q?wywjH+Tv6E8+Klq5YD/UeP5RYwmsiOtb7QblIOeaVQEY/CrCuQom+HMG3Vct?=
 =?us-ascii?Q?hWBJbPjbxCaWMyZVUerc8gl9kXB5s5rvqsKdfz5zaUByW8Yk5p3+Hy15iKL2?=
 =?us-ascii?Q?bFCsOS0AbDyTYN9Z7fNIIF/1UYN/2YIZr44UrhRGsdbCwpfG8/ahkuEfuNHf?=
 =?us-ascii?Q?60xMaWg3UM2NLdjNbgBkZiMv3aGbk1RWzUt2ACKehMgdQ8VcyNtOVHqF4mgA?=
 =?us-ascii?Q?XxAnQ1fadvPeuCdID/fnYd8YuuveNrHIB3flQ1fif2hech7HKTAwMPRgfa8/?=
 =?us-ascii?Q?HiS19Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c3fc3f-18b8-4ae3-0eaa-08db40015460
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2023 11:37:45.7620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6XMXk/fiwHawiWFHqv+jqYIuacM0nCPrYnviJFecD7scl4GInMqJvb2jcF2hZj5MuCUqlJo45pnPs3ZA9PtQZyIfIOHjJdPysW2wk7yCw3Kks716pMZ9vLzeopviQ4Nb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8368
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert-san,

> From: Yoshihiro Shimoda, Sent: Friday, April 14, 2023 4:27 PM
>=20
> Add PCIe Host and Endpoint nodes for R-Car S4-8 (R8A779F0).
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 104 ++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/=
dts/renesas/r8a779f0.dtsi
> index 1d5426e6293c..b3fe7e0599c3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -711,6 +711,110 @@ hscif3: serial@e66a0000 {
>  			status =3D "disabled";
>  		};
>=20
> +		pciec0: pcie@e65d0000 {
> +			compatible =3D "renesas,r8a779f0-pcie",
> +				     "renesas,rcar-gen4-pcie";
> +			reg =3D <0 0xe65d0000 0 0x1000>, <0 0xe65d2000 0 0x0800>,
> +			      <0 0xe65d3000 0 0x2000>, <0 0xe65d5000 0 0x1200>,
> +			      <0 0xe65d6200 0 0x1100>, <0 0xfe000000 0 0x400000>;
> +			reg-names =3D "dbi", "dbi2", "atu", "dma", "app", "config";
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			bus-range =3D <0x00 0xff>;
> +			device_type =3D "pci";
> +			ranges =3D <0x82000000 0 0x30000000 0 0x30000000 0 0x10000000>;
> +			dma-ranges =3D <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
> +			interrupts =3D <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "msi", "dma", "sft_ce", "app";
> +			#interrupt-cells =3D <1>;
> +			interrupt-map-mask =3D <0 0 0 7>;
> +			interrupt-map =3D <0 0 0 1 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 624>;
> +			power-domains =3D <&sysc R8A779F0_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 624>;
> +			num-lanes =3D <2>;
> +			snps,enable-cdm-check;
> +			max-link-speed =3D <4>;
> +			status =3D "disabled";
> +		};
> +
> +		pciec1: pcie@e65d8000 {
> +			compatible =3D "renesas,r8a779f0-pcie",
> +				     "renesas,rcar-gen4-pcie";
> +			reg =3D <0 0xe65d8000 0 0x1000>, <0 0xe65d8200 0 0x0800>,

I realized that the second "dbi2" address should be 0xe65da000, not 0xe65d8=
200.

> +			      <0 0xe65db000 0 0x2000>, <0 0xe65dd000 0 0x1200>,
> +			      <0 0xe65de200 0 0x1100>, <0 0xee900000 0 0x400000>;
> +			reg-names =3D "dbi", "dbi2", "atu", "dma", "app", "config";
> +			#address-cells =3D <3>;
> +			#size-cells =3D <2>;
> +			bus-range =3D <0x00 0xff>;
> +			device_type =3D "pci";
> +			ranges =3D <0x82000000 0 0xc0000000 0 0xc0000000 0 0x10000000>;
> +			dma-ranges =3D <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
> +			interrupts =3D <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "msi", "dma", "sft_ce", "app";
> +			#interrupt-cells =3D <1>;
> +			interrupt-map-mask =3D <0 0 0 7>;
> +			interrupt-map =3D <0 0 0 1 &gic GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &gic GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &gic GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &gic GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&cpg CPG_MOD 625>;
> +			power-domains =3D <&sysc R8A779F0_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 625>;
> +			num-lanes =3D <2>;
> +			snps,enable-cdm-check;
> +			max-link-speed =3D <4>;
> +			status =3D "disabled";
> +		};
> +
> +		pciec0_ep: pcie-ep@e65d0000 {
> +			compatible =3D "renesas,r8a779f0-pcie-ep",
> +				     "renesas,rcar-gen4-pcie-ep";
> +			reg =3D <0 0xe65d0000 0 0x2000>, <0 0xe65d2800 0 0x800>,
> +			      <0 0xe65d3000 0 0x2000>, <0 0xe65d5000 0 0x1200>,
> +			      <0 0xe65d6200 0 0x0e00>, <0 0xfe000000 0 0x400000>;
> +			reg-names =3D "dbi", "dbi2", "atu", "dma", "app", "addr_space";
> +			interrupts =3D <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "dma", "sft_ce", "app";
> +			clocks =3D <&cpg CPG_MOD 624>;
> +			power-domains =3D <&sysc R8A779F0_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 624>;
> +			num-lanes =3D <2>;
> +			max-link-speed =3D <4>;
> +			status =3D "disabled";
> +		};
> +
> +		pciec1_ep: pcie-ep@e65d8000 {
> +			compatible =3D "renesas,r8a779f0-pcie-ep",
> +				     "renesas,rcar-gen4-pcie-ep";
> +			reg =3D <0 0xe65d8000 0 0x2000>, <0 0xe65da800 0 0x0800>,
> +			      <0 0xe65dd000 0 0x1200>, <0 0xe65de200 0 0x0e00>,
> +			      <0 0xee900000 0 0x400000>;

I realized that missing the "dbi2" resource on the reg.
I'll fix them on v2.

Best regards,
Yoshihiro Shimoda

> +			reg-names =3D "dbi", "dbi2", "atu", "dma", "app", "addr_space";
> +			interrupts =3D <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names =3D "dma", "sft_ce", "app";
> +			clocks =3D <&cpg CPG_MOD 625>;
> +			power-domains =3D <&sysc R8A779F0_PD_ALWAYS_ON>;
> +			resets =3D <&cpg 625>;
> +			num-lanes =3D <2>;
> +			max-link-speed =3D <4>;
> +			status =3D "disabled";
> +		};
> +
>  		ufs: ufs@e6860000 {
>  			compatible =3D "renesas,r8a779f0-ufs";
>  			reg =3D <0 0xe6860000 0 0x100>;
> --
> 2.25.1

