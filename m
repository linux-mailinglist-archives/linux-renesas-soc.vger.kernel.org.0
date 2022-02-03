Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04A494A86E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Feb 2022 15:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbiBCOsZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Feb 2022 09:48:25 -0500
Received: from mail-os0jpn01on2102.outbound.protection.outlook.com ([40.107.113.102]:3990
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237254AbiBCOsY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Feb 2022 09:48:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=csOvSfT7ZdyrGts0Z3eSYK6IoT/MmmrtSVrQyjgziCm8E3EOrKonNskHzFPKaCQM5Tw6DbAbN8uw06vYKjGQV/MzTQVBVD4Tth+q254jXKzxMhy0DY+ExniKPlr5YUEvenMA66myOiXjUEpjBVaGtjnlWbb5YY4xvlCYeo+M9z50m1hY6+2FWG67PYNDtY2crKJb4YMnebR5b8QvXkrNA65aLb40TD4pBSIniucVLpxagjoASEzijJmqWTcIRJx/cb3Vb3jWWZtyazptp3x3UU6sOhqLgSDir8Xir9IlnbtJMioPidqGhyR8K5LZJE0+7yi/q06OKSRjllpiRvQkEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mw/I0O33AITfIHPBnLr6NCsifKpvKmmp0lTE7yRYnkY=;
 b=WODW+liT1jRxMhz43Pp39+RJZjeEGE7TAupL3Npt6ayUQYE8A4TXUUtmE/ARJpg3n3ZEc92ROYgBRZAFTvI8v01zk90olkSOMVRYxIlEj0fWw6QLlXg78iKCOY4t9aoZOg2mixv+GcMJxoQSjoFDSxAQgaPmTOPEc/Gv9ofsemQmc3jd0L8hWk+bN+RzN36NJPgh39ojMTZ51vC7ymikl5ya9f1HoU3MasLQWMmfvK1B4adYx2mHcpMOxlAConzbAWi/gZz1Gjd7YHKkf/ZrtTDNxMaqFdcN5NxmJ2JTM12G0VulLTjYRc95GvWk1jQ9b9oHaoGy+K1W8oA+36hU0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mw/I0O33AITfIHPBnLr6NCsifKpvKmmp0lTE7yRYnkY=;
 b=elYVediG78+LSRi1hfvbkGFFpkB47ldP39LXwDak1C0DvZIkCH0W00wonfE9Us3KvNe1XwwWTCvCtRMnLOnug4tvKVDQ13SsbOHCHXhPwch32yJ9EyQFoLa6vQOcYxIpUREErG3g3FCIrNAdWK1k/1cfsEtGroTcvxdCR/IfnAE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB3134.jpnprd01.prod.outlook.com (2603:1096:404:89::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 14:48:22 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%8]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 14:48:22 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi
 file
Thread-Topic: [PATCH v2 1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi
 file
Thread-Index: AQHYGGvM7lx+LAo+10ilwGtOcFmnzayB6JGQ
Date:   Thu, 3 Feb 2022 14:48:22 +0000
Message-ID: <OS0PR01MB592266167C24B42AF8A2AC1886289@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220202193339.22441-1-biju.das.jz@bp.renesas.com>
 <20220202193339.22441-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220202193339.22441-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 95170dec-1b38-4e86-f929-08d9e72439bb
x-ms-traffictypediagnostic: TYAPR01MB3134:EE_
x-microsoft-antispam-prvs: <TYAPR01MB31341D3E7DC39865B438636886289@TYAPR01MB3134.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: avktwEtm8Unnaf2rAUh4NxioN7sXvEl94CL2z2J5Tyb1axqgX0Brlt6dJAow/84H8t9LrGbiamaLdckNtB50kS5boQasK2GdCfpY/Evj+YCZ32efIN0oc99evvV72g0D/P8zsNSWY5uyOK+ELVWcHojPnv2aN1NbcL9tFFfJICiE+e3meGo1apGEipY0RhhJU11EoLHEoMI0h7Hw13x3Uw6HUyAuwmdKT6s78BS8ktACz908aflAC9OFZHXMDwH2eV4BccCIWp1zEYR924rkZRtCzRxtVsvF12WouNjDkzb31lw078Y94eAS202sfubwADtvTgXN0XosHXpq4Bx5Lf+NDX+sqDb1JbGg3+NF4bCE0zEX8PHuDgDRixUaspp2RhYhvikU7YPMblXC2iT0x19fTjWMrZPBCyuhoyVfL2yrN4yPfqh4vDbWU2ZBGx85DlpJ3rNPh5s0SY79av3Bydqj2r5Elq/yqAyYjTszPj0IZWhbqPV+IDVmiavdGKbmF7/BLws5fIZVG8aRnq0cREhFnw8h/XG1VZM+ZPTByF9SnbImduzEpxAE2XzSH67MG7M3fpvDZAW5gXdyAsrfGEK3OLrd/NsvUZEeMhulGGN3j9/JAtU8MLDzI3SGxf/Q6cTxIETZT4TwlAVu5JOQJAuJfqdtjLKiFmwN0YGQznlL3D00YsV5ljXuHPWWsv9/AGlQ0UtKKhe/W97dBmmOwA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(30864003)(38070700005)(7696005)(86362001)(6506007)(55016003)(9686003)(71200400001)(122000001)(66476007)(76116006)(66556008)(2906002)(52536014)(33656002)(107886003)(38100700002)(83380400001)(4326008)(186003)(8676002)(26005)(66946007)(54906003)(66446008)(5660300002)(64756008)(8936002)(316002)(508600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qcdx1FjIYffcOuCxaarok/eMrJh6EFraFw2cHSb0UzSZqvKxnSmMhqJCQd07?=
 =?us-ascii?Q?MUtaXMKzijnLvsVMx71iqUOHrrM1LqyY5nX2x+pYChwPzE4EmgdLyVIjcMhA?=
 =?us-ascii?Q?tepVf137DU88N8+17kkFGYdXKX2IKl7uCHL1Ib0fFqfnBqDC/SqgbBDsW4R3?=
 =?us-ascii?Q?OpiSYRb1PJLJD+2WhrG3GntHLIIhnfdtYVdgQwx00Jvq1i6YulMT1nz/uxam?=
 =?us-ascii?Q?fM6p5QpZ3UEzG+wMeaYChuszUDj2Vz5snQhAJpUU6+BHbbTRPnnrc5iNmJ7e?=
 =?us-ascii?Q?2mODLxUV/nhGNOk0eW2lR1lGuA3/YxCMgcbmPVFlSuJWZBx62vmirtlTH9gq?=
 =?us-ascii?Q?oZNkFbpfGB94wDCEgDYnsh/fGF/ItKJ5OwKKwNwz9ZSkV+c6w3Yha5I15yvL?=
 =?us-ascii?Q?CUH+qlfVVdJCLn0uRwraL8NMRjkimXylwwfMUMVmNKCELH02mec8U67Te0vi?=
 =?us-ascii?Q?zWOnx4Flnh38FSRCT4ZXqWT4wDhc5WilWRWZxev1rejtvbtQa6ISB7wZEd9K?=
 =?us-ascii?Q?2uBbzUwXJS+CBM5dGvPx0SfHbuc6qcfX8VEoJOzG5iTsGDXTIhAApx7SiU0Y?=
 =?us-ascii?Q?8cAlfzpRx8BuT9I+l3KVII7W0n1CucK5KEIBbeT1/b+983Lpy1Zoqphkadxc?=
 =?us-ascii?Q?4UWtdZ2mEXn6xTSNgb8mI7pQJcw/hYynnQPwUrZv8r49Gm4XkeneiHtf3zBZ?=
 =?us-ascii?Q?zDXo1WBSOrXuoXFtHz0V+YBSmTwm3BFmZ99uMQA1aIiRGvf6k6Sfic/GEMCn?=
 =?us-ascii?Q?AL9wJDRBEAce5XR8bYKj6wvpSaLdDKp+RgZxThJx/gCm8byzQBHcVUKwiwCb?=
 =?us-ascii?Q?Awuj8t6uO7fRtx0b2OpAyWqmsO4b1+6QgwKjMtWAnB8kb94H7u5tlmu4zBaC?=
 =?us-ascii?Q?WcN2NjAlMAYnVswQqX6ZOpQYJC7ElV2jZ7y4BvnvFDIsj9vMrkDZhOThOX/U?=
 =?us-ascii?Q?SDtZGHTtmB2ubbkw5RUtYJJegPHbyM5GP237xhN9rdwsmv/pFyYqGNq1snBI?=
 =?us-ascii?Q?Wzf6WKC+rxHWTAjAZR0GwLKlFGvOBkWrAOjl/0rd314JWC5gmKnz+nOJIi0j?=
 =?us-ascii?Q?JVgUpuxTQD5eBIan1nKIneSeJ11n8xSTSdHoda7BzbPekixQ/Vzd9sYpGJRq?=
 =?us-ascii?Q?bdd4Vy2las84exwLOH15fAp4aI2YC/YRj72/qgycp9kO5QJkvWdQoapziiYK?=
 =?us-ascii?Q?LstloUdUU66SGOm0QeyL7Q5Z81XliZHygqIPfTk0cP6QN8I6RrkLJPJrCw5/?=
 =?us-ascii?Q?p5ar6YjFZocApxheR6NR6HmrE8v3K/Zk5EP4uKOOQ7u9Efc9MpLM+TC6GEbg?=
 =?us-ascii?Q?M3LMDOBMSgceERiuF/RhrkS5WX9p/ueDVSPuGUW03K0qOm0wdZzcfYsGeW2t?=
 =?us-ascii?Q?r1Xy8IdwxTuTsVwLvgLdzj3WOfz2KA1Wbm8e9BfMZT/W0CDCUlKeHAStD1Ct?=
 =?us-ascii?Q?t8HFnmhfZWD4Hd9kZGwDrOycMi/Je8Ns0kQf1k6BOE2ltePQchPZB4R4DA7s?=
 =?us-ascii?Q?Srh3RL0eIeDAf8Er4Fov0UKvM7wF/2jQanA7+pyVV5nhIz/Qf4UZgrWZ9gi6?=
 =?us-ascii?Q?dMmzcq+bHPaBTCwjxt2L4/tpuD4GvtNptoW0drSxmaRsHNetK/vAXxf0roa6?=
 =?us-ascii?Q?1+Txqdxue4r60eDFzjasYt5jxkj3BwjDefsBcxdeiNuhR1LFEgImP+eKWjQk?=
 =?us-ascii?Q?HLnYNg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95170dec-1b38-4e86-f929-08d9e72439bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 14:48:22.2470
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPNYIfe8guBfRV1IYD8nZL9htaIhJCCrSh4YiS2WYb4HuOB3bINULD7Rmge/gbe+rhz3B5yBoXb+BYojxCsJj1O+r56sH74ccGIbOJGnIC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB3134
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

I would like to drop this patch, as I did not taken care RZ/V2L.

I will send Clock changes of V2L along with RZ/G2LC.

Regards,
Biju

> Subject: [PATCH v2 1/4] arm64: dts: renesas: rzg2l-smarc: Add common dtsi
> file
>=20
> RZ/G2L and RZ/G2LC SoC use the same carrier board, but the SoM is
> different.
>=20
> Different pin mapping is possible on SoM. For eg:- RZ/G2L SMARC EVK uses
> SCIF2, whereas RZ/G2LC uses SCIF1 for the serial interface available on
> PMOD1.
>=20
> This patch adds support for handling the pin mapping differences by movin=
g
> definitions common to RZ/G2L and RZ/G2LC to a common dtsi file.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
>  * Added Rb tag from Geert.
>  * Rebased to latest renesas-devel branch
> ---
>  .../boot/dts/renesas/r9a07g044c2-smarc.dts    |   9 +-
>  .../boot/dts/renesas/r9a07g044l2-smarc.dts    |   1 +
>  .../boot/dts/renesas/rz-smarc-common.dtsi     | 207 ++++++++++++++++++
>  arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 193 ----------------
>  4 files changed, 209 insertions(+), 201 deletions(-)  create mode 100644
> arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> index 8d671111d973..af84fd6c8a81 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
> @@ -9,12 +9,11 @@
>  #include "r9a07g044c2.dtsi"
>  #include "rzg2lc-smarc-som.dtsi"
>  #include "rzg2lc-smarc-pinfunction.dtsi"
> -#include "rzg2l-smarc.dtsi"
> +#include "rz-smarc-common.dtsi"
>=20
>  / {
>  	model =3D "Renesas SMARC EVK based on r9a07g044c2";
>  	compatible =3D "renesas,smarc-evk", "renesas,r9a07g044c2",
> "renesas,r9a07g044";
> -
>  };
>=20
>  &canfd {
> @@ -75,12 +74,6 @@
>  	status =3D "disabled";
>  };
>=20
> -&scif2 {
> -	/delete-property/ pinctrl-0;
> -	/delete-property/ pinctrl-names;
> -	status =3D "disabled";
> -};
> -
>  &spi1 {
>  	/delete-property/ pinctrl-0;
>  	/delete-property/ pinctrl-names;
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
> b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
> index 886d38886d05..bc2af6c92ccd 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
> @@ -9,6 +9,7 @@
>  #include "r9a07g044l2.dtsi"
>  #include "rzg2l-smarc-som.dtsi"
>  #include "rzg2l-smarc-pinfunction.dtsi"
> +#include "rz-smarc-common.dtsi"
>  #include "rzg2l-smarc.dtsi"
>=20
>  / {
> diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
> b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
> new file mode 100644
> index 000000000000..dd2a19ae0bfd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/{G2L, G2LC, V2L} SMARC EVK common
> +parts
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +
> +/*
> + * SSI-WM8978
> + *
> + * This command is required when Playback/Capture
> + *
> + *	amixer cset name=3D'Left Input Mixer L2 Switch' on
> + *	amixer cset name=3D'Right Input Mixer R2 Switch' on
> + *	amixer cset name=3D'Headphone Playback Volume' 100
> + *	amixer cset name=3D'PCM Volume' 100%
> + *	amixer cset name=3D'Input PGA Volume' 25
> + *
> + */
> +
> +/ {
> +	aliases {
> +		serial0 =3D &scif0;
> +		i2c0 =3D &i2c0;
> +		i2c1 =3D &i2c1;
> +		i2c3 =3D &i2c3;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	audio_mclock: audio_mclock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <11289600>;
> +	};
> +
> +	snd_rzg2l: sound {
> +		compatible =3D "simple-audio-card";
> +		simple-audio-card,format =3D "i2s";
> +		simple-audio-card,bitclock-master =3D <&cpu_dai>;
> +		simple-audio-card,frame-master =3D <&cpu_dai>;
> +		simple-audio-card,mclk-fs =3D <256>;
> +
> +		simple-audio-card,widgets =3D "Microphone", "Microphone Jack";
> +		simple-audio-card,routing =3D
> +			    "L2", "Mic Bias",
> +			    "R2", "Mic Bias",
> +			    "Mic Bias", "Microphone Jack";
> +
> +		cpu_dai: simple-audio-card,cpu {
> +			sound-dai =3D <&ssi0>;
> +		};
> +
> +		codec_dai: simple-audio-card,codec {
> +			clocks =3D <&audio_mclock>;
> +			sound-dai =3D <&wm8978>;
> +		};
> +	};
> +
> +	usb0_vbus_otg: regulator-usb0-vbus-otg {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "USB0_VBUS_OTG";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +	};
> +
> +	vccq_sdhi1: regulator-vccq-sdhi1 {
> +		compatible =3D "regulator-gpio";
> +		regulator-name =3D "SDHI1 VccQ";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpios =3D <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_HIGH>;
> +		gpios-states =3D <1>;
> +		states =3D <3300000 1>, <1800000 0>;
> +	};
> +};
> +
> +&audio_clk1{
> +	clock-frequency =3D <11289600>;
> +};
> +
> +&audio_clk2{
> +	clock-frequency =3D <12288000>;
> +};
> +
> +&canfd {
> +	pinctrl-0 =3D <&can0_pins &can1_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	channel0 {
> +		status =3D "okay";
> +	};
> +
> +	channel1 {
> +		status =3D "okay";
> +	};
> +};
> +
> +&ehci0 {
> +	dr_mode =3D "otg";
> +	status =3D "okay";
> +};
> +
> +&ehci1 {
> +	status =3D "okay";
> +};
> +
> +&hsusb {
> +	dr_mode =3D "otg";
> +	status =3D "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-0 =3D <&i2c0_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +
> +&i2c1 {
> +	pinctrl-0 =3D <&i2c1_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +
> +&i2c3 {
> +	pinctrl-0 =3D <&i2c3_pins>;
> +	pinctrl-names =3D "default";
> +	clock-frequency =3D <400000>;
> +
> +	status =3D "okay";
> +
> +	wm8978: codec@1a {
> +		compatible =3D "wlf,wm8978";
> +		#sound-dai-cells =3D <0>;
> +		reg =3D <0x1a>;
> +	};
> +};
> +
> +&ohci0 {
> +	dr_mode =3D "otg";
> +	status =3D "okay";
> +};
> +
> +&ohci1 {
> +	status =3D "okay";
> +};
> +
> +&phyrst {
> +	status =3D "okay";
> +};
> +
> +&scif0 {
> +	pinctrl-0 =3D <&scif0_pins>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +};
> +
> +&sdhi1 {
> +	pinctrl-0 =3D <&sdhi1_pins>;
> +	pinctrl-1 =3D <&sdhi1_pins_uhs>;
> +	pinctrl-names =3D "default", "state_uhs";
> +
> +	vmmc-supply =3D <&reg_3p3v>;
> +	vqmmc-supply =3D <&vccq_sdhi1>;
> +	bus-width =3D <4>;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	status =3D "okay";
> +};
> +
> +&spi1 {
> +	pinctrl-0 =3D <&spi1_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +
> +&ssi0 {
> +	pinctrl-0 =3D <&ssi0_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +
> +&usb2_phy0 {
> +	pinctrl-0 =3D <&usb0_pins>;
> +	pinctrl-names =3D "default";
> +
> +	vbus-supply =3D <&usb0_vbus_otg>;
> +	status =3D "okay";
> +};
> +
> +&usb2_phy1 {
> +	pinctrl-0 =3D <&usb1_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> index 78034f36156d..33ddfd18bd56 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> @@ -8,164 +8,13 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
>=20
> -/*
> - * SSI-WM8978
> - *
> - * This command is required when Playback/Capture
> - *
> - *	amixer cset name=3D'Left Input Mixer L2 Switch' on
> - *	amixer cset name=3D'Right Input Mixer R2 Switch' on
> - *	amixer cset name=3D'Headphone Playback Volume' 100
> - *	amixer cset name=3D'PCM Volume' 100%
> - *	amixer cset name=3D'Input PGA Volume' 25
> - *
> - */
> -
>  /* comment the #define statement to disable SCIF2 (SER0) on PMOD1 (CN7)
> */
>  #define PMOD1_SER0	1
>=20
>  / {
>  	aliases {
> -		serial0 =3D &scif0;
>  		serial1 =3D &scif2;
> -		i2c0 =3D &i2c0;
> -		i2c1 =3D &i2c1;
> -		i2c3 =3D &i2c3;
> -	};
> -
> -	chosen {
> -		stdout-path =3D "serial0:115200n8";
> -	};
> -
> -	audio_mclock: audio_mclock {
> -		compatible =3D "fixed-clock";
> -		#clock-cells =3D <0>;
> -		clock-frequency =3D <11289600>;
> -	};
> -
> -	snd_rzg2l: sound {
> -		compatible =3D "simple-audio-card";
> -		simple-audio-card,format =3D "i2s";
> -		simple-audio-card,bitclock-master =3D <&cpu_dai>;
> -		simple-audio-card,frame-master =3D <&cpu_dai>;
> -		simple-audio-card,mclk-fs =3D <256>;
> -
> -		simple-audio-card,widgets =3D "Microphone", "Microphone Jack";
> -		simple-audio-card,routing =3D
> -			    "L2", "Mic Bias",
> -			    "R2", "Mic Bias",
> -			    "Mic Bias", "Microphone Jack";
> -
> -		cpu_dai: simple-audio-card,cpu {
> -			sound-dai =3D <&ssi0>;
> -		};
> -
> -		codec_dai: simple-audio-card,codec {
> -			clocks =3D <&audio_mclock>;
> -			sound-dai =3D <&wm8978>;
> -		};
> -	};
> -
> -	usb0_vbus_otg: regulator-usb0-vbus-otg {
> -		compatible =3D "regulator-fixed";
> -
> -		regulator-name =3D "USB0_VBUS_OTG";
> -		regulator-min-microvolt =3D <5000000>;
> -		regulator-max-microvolt =3D <5000000>;
> -	};
> -
> -	vccq_sdhi1: regulator-vccq-sdhi1 {
> -		compatible =3D "regulator-gpio";
> -		regulator-name =3D "SDHI1 VccQ";
> -		regulator-min-microvolt =3D <1800000>;
> -		regulator-max-microvolt =3D <3300000>;
> -		gpios =3D <&pinctrl RZG2L_GPIO(39, 1) GPIO_ACTIVE_HIGH>;
> -		gpios-states =3D <1>;
> -		states =3D <3300000 1>, <1800000 0>;
> -	};
> -};
> -
> -&audio_clk1{
> -	clock-frequency =3D <11289600>;
> -};
> -
> -&audio_clk2{
> -	clock-frequency =3D <12288000>;
> -};
> -
> -&canfd {
> -	pinctrl-0 =3D <&can0_pins &can1_pins>;
> -	pinctrl-names =3D "default";
> -	status =3D "okay";
> -
> -	channel0 {
> -		status =3D "okay";
>  	};
> -
> -	channel1 {
> -		status =3D "okay";
> -	};
> -};
> -
> -&ehci0 {
> -	dr_mode =3D "otg";
> -	status =3D "okay";
> -};
> -
> -&ehci1 {
> -	status =3D "okay";
> -};
> -
> -&hsusb {
> -	dr_mode =3D "otg";
> -	status =3D "okay";
> -};
> -
> -&i2c0 {
> -	pinctrl-0 =3D <&i2c0_pins>;
> -	pinctrl-names =3D "default";
> -
> -	status =3D "okay";
> -};
> -
> -&i2c1 {
> -	pinctrl-0 =3D <&i2c1_pins>;
> -	pinctrl-names =3D "default";
> -
> -	status =3D "okay";
> -};
> -
> -&i2c3 {
> -	pinctrl-0 =3D <&i2c3_pins>;
> -	pinctrl-names =3D "default";
> -	clock-frequency =3D <400000>;
> -
> -	status =3D "okay";
> -
> -	wm8978: codec@1a {
> -		compatible =3D "wlf,wm8978";
> -		#sound-dai-cells =3D <0>;
> -		reg =3D <0x1a>;
> -	};
> -};
> -
> -&ohci0 {
> -	dr_mode =3D "otg";
> -	status =3D "okay";
> -};
> -
> -&ohci1 {
> -	status =3D "okay";
> -};
> -
> -&phyrst {
> -	status =3D "okay";
> -};
> -
> -&scif0 {
> -	pinctrl-0 =3D <&scif0_pins>;
> -	pinctrl-names =3D "default";
> -	status =3D "okay";
>  };
>=20
>  /*
> @@ -184,45 +33,3 @@
>  	status =3D "okay";
>  };
>  #endif
> -
> -&sdhi1 {
> -	pinctrl-0 =3D <&sdhi1_pins>;
> -	pinctrl-1 =3D <&sdhi1_pins_uhs>;
> -	pinctrl-names =3D "default", "state_uhs";
> -
> -	vmmc-supply =3D <&reg_3p3v>;
> -	vqmmc-supply =3D <&vccq_sdhi1>;
> -	bus-width =3D <4>;
> -	sd-uhs-sdr50;
> -	sd-uhs-sdr104;
> -	status =3D "okay";
> -};
> -
> -&spi1 {
> -	pinctrl-0 =3D <&spi1_pins>;
> -	pinctrl-names =3D "default";
> -
> -	status =3D "okay";
> -};
> -
> -&ssi0 {
> -	pinctrl-0 =3D <&ssi0_pins>;
> -	pinctrl-names =3D "default";
> -
> -	status =3D "okay";
> -};
> -
> -&usb2_phy0 {
> -	pinctrl-0 =3D <&usb0_pins>;
> -	pinctrl-names =3D "default";
> -
> -	vbus-supply =3D <&usb0_vbus_otg>;
> -	status =3D "okay";
> -};
> -
> -&usb2_phy1 {
> -	pinctrl-0 =3D <&usb1_pins>;
> -	pinctrl-names =3D "default";
> -
> -	status =3D "okay";
> -};
> --
> 2.17.1

