Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F73739B6FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 12:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhFDK1L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 06:27:11 -0400
Received: from mail-eopbgr1410111.outbound.protection.outlook.com ([40.107.141.111]:27376
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229668AbhFDK1K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 06:27:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vwkuxd3lpO7UgK+qkuGQ3tTnljMeggHusfeIH5BLLkKJsrYGvejpny/pct/vA6nXq1vAVrthGNAzoZmcaMCuGiZk5SXaBxR64XnyJXHxCnwgRjbay8DQnIapEwSePD9muxEsgZihgHRE2jbdL1JBPeape4KEgf+gOytg/UgKPE7RLWKHeOigkAngJmtQ6/1xN86Vm26Rg+BlcBmG04b+BIJnjfR/JL3O+eUOXKrrPYtc+yuSaJdnox8CxcrHKT0tARdi8yqxM6ZIIFc7TRLMNrjUlfd4FsWGSI8JgU5qdS04Laf4RQWPIx7FXoij/IGsS/Xo5ZYIAWscoUp4yuIitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pj/ARhWdAG1VD6f6IvnYLq9zpzugyTdcDyi3tyIkOM=;
 b=kcwFoONSnfC9sKWAeKB4EfY0Uv3QnMZEphzpx3Cx5tcWdHLO1nqDXpQxRzObQHViAia8kJ046FFx834f9oLwWNu21AToneFTH4egY5t6n/6pQTz1KJg2TbFsRoaaH99ddmF75Ljl3BQqoajhPvgc/mM0pLfMaIlofzR8K0fQpXzVj4J+Xntr3XYMK178+8sxoSROKByyvPvcvfhzV+q0Qsx5COqQyeZWgd02B766Ax4pAMyF/z5mhc5kx1GELb6TZHMSqvynv+MElRXqhmEayfpwY+WBCfSiRvxJWMedadkXkZ+d8MbM7ZYSlSVEsYowO1S5IhuFe2T0eR2tnSEWFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pj/ARhWdAG1VD6f6IvnYLq9zpzugyTdcDyi3tyIkOM=;
 b=GF0M/jhhVfx5DDh9R1PtjHIsEG9KzAoB3zHH4bfnIkYzRFXr2JoRn+C2tlf25Rnch8pKYMUlnDKm4tlt9hb6kLSllM43L8o2JR/1tBHrCQsteQilnwfi9LXZpYUdnS/7SZxm7IYvAhit+3Yz+a9tGXWbnGp5y3sVWREhmm8Uml0=
Received: from OSZPR01MB6877.jpnprd01.prod.outlook.com (2603:1096:604:13d::6)
 by OSAPR01MB3412.jpnprd01.prod.outlook.com (2603:1096:604:5a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Fri, 4 Jun
 2021 10:25:21 +0000
Received: from OSZPR01MB6877.jpnprd01.prod.outlook.com
 ([fe80::a947:6ea:f448:49d7]) by OSZPR01MB6877.jpnprd01.prod.outlook.com
 ([fe80::a947:6ea:f448:49d7%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 10:25:21 +0000
From:   Chris Paterson <Chris.Paterson2@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] arm64: dts: renesas: r8a7796[01]: Fix OPP table entry
 voltages
Thread-Topic: [PATCH] arm64: dts: renesas: r8a7796[01]: Fix OPP table entry
 voltages
Thread-Index: AQHXPPSu/HhutY519UGOZBzJYguUqasD276g
Date:   Fri, 4 Jun 2021 10:25:21 +0000
Message-ID: <OSZPR01MB68777269982BFE2B22CE87F1B73B9@OSZPR01MB6877.jpnprd01.prod.outlook.com>
References: <b9e9db907514790574429b83d070c823b36085ef.1619699909.git.geert+renesas@glider.be>
In-Reply-To: <b9e9db907514790574429b83d070c823b36085ef.1619699909.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: glider.be; dkim=none (message not signed)
 header.d=none;glider.be; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83f67b3b-6887-42c9-575b-08d927430f03
x-ms-traffictypediagnostic: OSAPR01MB3412:
x-microsoft-antispam-prvs: <OSAPR01MB341268821082954A43556CE4B73B9@OSAPR01MB3412.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3MefckLPsKZJjPCFeKz6GCHdu2g/ffMNrtO6PwkJQzfjEPVJ74QLkP4fpVTDDNIiZAjy7x50M++ctWhjCKLWm3CDKHsmfEriLhfua3bn9mE+3OURGRFJSBd7yPeYH/gJlCSEeuSoAP80LtxDjS2oo33EFbsnMTiVFlCrpWQpzhN8P/X4sRX463OkIXtMN53a+SFP6IwONe0yucBmwTyzfetNZIWDm/321LOkwNCx9Y7z2QmgBjohsvhWgVeeEzAChFnKDGJjnCXEfJt7gVqmRT/lI6wWkHNGmiBWkMXdOiuOWKniLsd3CyKBSz+fMpzDxMb/kfL4Lq4xOY871Llyva8Lybj73Zl56r8vCEyLU5AyGwphWTDZmjpYM8+DfuY9yBAdMpyHuInGpwAGKSkZvN3dU4Qk+XKidpt6wP69weVxzWktGWqLfUtdXlcy+PDfV9i1kUxbr8JLGQLlI83fJFA6GePuQUFASHEoR2bHjHNci8gfnpzwgnnT7/4Az6ZF1yqXDvOc/b5n502LhPrevedL8TjI+7eFXIWwek8XGbzWdpYwnkPUi0JKBq5MwT4ioR60G1y89xsghdFC7TwtETZJ3IfivVsZeNYkGpqUtuc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB6877.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(8936002)(66556008)(110136005)(33656002)(52536014)(66946007)(478600001)(71200400001)(6506007)(4326008)(76116006)(64756008)(2906002)(7696005)(186003)(26005)(86362001)(5660300002)(54906003)(122000001)(38100700002)(66476007)(8676002)(66446008)(55016002)(9686003)(316002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?vJziqv1Am2pD+ZZogcgDsbJb6VwvmlwOhGXZN0u9xOwnZkZDQAKyl8uM?=
 =?Windows-1252?Q?meQCxX+FFxe2ExTET00o+MqjsRFo9gb/swZyBVP5JkjqACV1L3UgjX3W?=
 =?Windows-1252?Q?OYLC54Qmhi5kkU8+1X7bnCMeOsF00AKtJFCmC4NMeCws+8+gRDYR85Fa?=
 =?Windows-1252?Q?ltNV+VucSOfHDgPIkjW5rNKG5QZhwp72KfO8Fjch6x4fXu3gatYXggRS?=
 =?Windows-1252?Q?YufDcIsNQdqX846yt3JoZ4VPsgvleizN56WwimNtdjbMvm92evwDf+d/?=
 =?Windows-1252?Q?BoHbSufmik/xu90bZZgFZpTllaVO3wFLTZVixgkWG0tcfFaoa7TPca6x?=
 =?Windows-1252?Q?olCgbsYIHdei8yjdUphfpUU/M+E5MHCk9YLhxN7fdt0QoCfCn365MWsv?=
 =?Windows-1252?Q?SCQoE5bW0F2aalarbZII0vC44gCN0DCsOhNyftPmazWhEoCGOqrp/TnG?=
 =?Windows-1252?Q?rnIfiRSfsnFMZkpzgpv3NnPhWNfGIpK+NQzggax4rYHKFpsHLAZxKE8x?=
 =?Windows-1252?Q?ywR2xeRale8r1i68aB8kZP0oISJNdFKRMWriaMQL0IC2PYBoxeikr3qM?=
 =?Windows-1252?Q?zgOr5Nub6Buhf7s/TtjtCV4IXG41wmO0NEnOO2KyKYL13xp3snCPklxq?=
 =?Windows-1252?Q?j5YnrE8tmYRVSc1/Q40B/7MN0p4VIvWAIXX4ZbiDCvYacHuevgXgb3it?=
 =?Windows-1252?Q?zQbj4XtzqBsjTKZ8XZj8dF+DVT92d+tbXKm6C7cIBTqCl4lXv7b3623p?=
 =?Windows-1252?Q?7ICz1eRuoQP0dW9k8iPpQBmDyNUFP6/T46fe0KGI/ZMiHUJStq0Fm3DK?=
 =?Windows-1252?Q?u1DA0DTIGJt5LuBmm2ftg2DY7/o+NjTKt9e3xncjAzUo5imptBTImLqq?=
 =?Windows-1252?Q?PEUzd9caulJD1uTu2YgnRLlZgAVhIJVKmu5v8O5i8lt1ba9lbgNiOUkL?=
 =?Windows-1252?Q?cw8pRoJM8eAXI40TL5/uwFLzyDsAtZwVJ4HiI8lPRjHwwzSgqHQwz6g/?=
 =?Windows-1252?Q?rjDQYoajMBRH+wogtE245UJagda1mqG8p9D2TMEqCHK8lQZc31gfW9FR?=
 =?Windows-1252?Q?hPlXYk18kCmdjYVP7rE2FA2/y6dkHi9p/GLU64iRii6o8OVDVdkK7AhW?=
 =?Windows-1252?Q?WaGoLOOEvTgqH91NYhLVuA47BtgENUQxWCAwKjq8MoIEQsheCYPtwBmS?=
 =?Windows-1252?Q?XU4r4f4KaHQG4VAagufVxPbjGGkqotMWhA4LfsN2uwx8xZRKGYEyNXwa?=
 =?Windows-1252?Q?XWPgCEq0KgAehvSh+1oa51K4YkpbBC/arI8jtJN9U0GyysdUPMwo44fx?=
 =?Windows-1252?Q?1GbU1HppVaifp2TOZ7g5twPc0RpUPuZHTRyxG5zGHccRsrcRxP9QL8dx?=
 =?Windows-1252?Q?7U42+9WHuEmBWywZUaBAGPJR2s46ACxNt0chpz+BqiekHttUol7Olotk?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB6877.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83f67b3b-6887-42c9-575b-08d927430f03
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 10:25:21.4718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Crd4vClu8KOnqW+3z5sZvO3zQmhrpbE3QJptMoIpFbEGct5+3HeeCSnxtbMiabVtWV4NLvBi8PdNRp0O9tY4n90TR76V4vqGZ+AxNruFW/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB3412
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 29 April 2021 13:39
>=20
> Correct the voltages in the "Power Optimized" (<=3D 1.5 GHz) Cortex-A57
> operating point table entries for the R-Car M3-W and M3-W+ SoCs from
> 0.82V to 0.83V, as per the R-Car Gen3 EC Manual Errata for Revision
> 0.53.
>=20
> Based on a patch for R-Car M3-W in the BSP by Takeshi Kihara
> <takeshi.kihara.df@renesas.com>.
>=20
> Fixes: da7e3113344fda50 ("arm64: dts: renesas: r8a7796: Add OPPs table fo=
r
> cpu devices")
> Fixes: f51746ad7d1ff6b4 ("arm64: dts: renesas: Add Renesas R8A77961 SoC
> support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>

Kind regards, Chris

> ---
> To be queued in renesas-devel for v5.14.
>=20
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 6 +++---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> index 63bb395a6a64499a..2bd8169735d351b2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
> @@ -63,17 +63,17 @@ cluster0_opp: opp_table0 {
>=20
>  		opp-500000000 {
>  			opp-hz =3D /bits/ 64 <500000000>;
> -			opp-microvolt =3D <820000>;
> +			opp-microvolt =3D <830000>;
>  			clock-latency-ns =3D <300000>;
>  		};
>  		opp-1000000000 {
>  			opp-hz =3D /bits/ 64 <1000000000>;
> -			opp-microvolt =3D <820000>;
> +			opp-microvolt =3D <830000>;
>  			clock-latency-ns =3D <300000>;
>  		};
>  		opp-1500000000 {
>  			opp-hz =3D /bits/ 64 <1500000000>;
> -			opp-microvolt =3D <820000>;
> +			opp-microvolt =3D <830000>;
>  			clock-latency-ns =3D <300000>;
>  			opp-suspend;
>  		};
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index c8b73108a4c8185d..3c73ee47791542a9 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -52,17 +52,17 @@ cluster0_opp: opp_table0 {
>=20
>  		opp-500000000 {
>  			opp-hz =3D /bits/ 64 <500000000>;
> -			opp-microvolt =3D <820000>;
> +			opp-microvolt =3D <830000>;
>  			clock-latency-ns =3D <300000>;
>  		};
>  		opp-1000000000 {
>  			opp-hz =3D /bits/ 64 <1000000000>;
> -			opp-microvolt =3D <820000>;
> +			opp-microvolt =3D <830000>;
>  			clock-latency-ns =3D <300000>;
>  		};
>  		opp-1500000000 {
>  			opp-hz =3D /bits/ 64 <1500000000>;
> -			opp-microvolt =3D <820000>;
> +			opp-microvolt =3D <830000>;
>  			clock-latency-ns =3D <300000>;
>  			opp-suspend;
>  		};
> --
> 2.25.1

