Return-Path: <linux-renesas-soc+bounces-15911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC774A88122
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:06:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C27CF178F4E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 13:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91A12BF3CB;
	Mon, 14 Apr 2025 13:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Lc+/JKij"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9172BE7BA;
	Mon, 14 Apr 2025 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744635919; cv=fail; b=DAQJyIVqXo3uplCXQxM+Ga/wkb8AqePevgcyRrHgcMabweNmGf/p8vD/gd66I2427tz6RjOKF/MYrmwgXyjVaGszPL29pc00IS4owmrxB8Z/gppg7Rva5HNKuhj5FFmfSPXTZ8gYiyB5WCemBXCpxZoNO9biEE/P3Ugn0J2HXBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744635919; c=relaxed/simple;
	bh=LcMLiSx5JQzK52omt6c3I9RsonKsl9AT08ctY1JSTPA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gxTCgsc7giUYw3AorZyesL4SOCg8gI895C6fsDW5NqbTR4Cvof5lLVd78sUQPuOqx0+ziDl+JVWNKP9on0wGAYhHFTrFJWKX510UZFeFcCZOaeWDng+Ox/2FHiuYnWmypX9ASMgvbXVWqgVBfUH23UqLx/e51sGot/BZteK1Q8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Lc+/JKij; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gW+hZiMU3ucANv7yGzrahqWY4XP8FCAqeCk9MwgUTfWfWOFZIyYtm9EvwQJaeO5VQZWMrlc9vhURD5mo6/6yI6vXEhacSTdCraWPSJjXurdNPxhFrpzhpPv5pr0xg66PWbLH+gpFJD3dOeTgJsb69/nAaCLtWIjtAvsAfHY0FhX5hn0WuSMLvgmB7V4sTzDkA6Q1Cbj8I8BGzcNxjkthive05nx4Le8GNBNHCW0to2v5iTWOaxJsy1qjyhf8V5ByFJsLWShq6kcx35i6CUDaFUZjUtQkwymOXcNXzt2h2aOQ2yZsznpqZGnlgyj+vYVLuSG0+OK1xQv45MJiUtyUyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjfsSJP4bqdvKh1W1bLDEVCu43A3t+DWM6aTR/Ht8p4=;
 b=oOYwO1tfhN38qKr7Vq8eksa+6Gt1n5MBWy4Ot3mpwOOjlWtckodjY3GR2wXj8XrL09EStweaIFO4tMkO7rOUnvx3mlICDJfsK5zyZxBkTg0gyoFFzlA8FLd4+f6RTiPKLStfUilJ4g4j/o6Z86KrQLY5AZWI3ZsxtsMiymatalCw34A8NLtGb651vDRhv2owaPubMfY4G/TUpkaZ5eIVg86aJEgSn2w+I092Xee2W1pY8Ts5JXpcgtgaf7kSESg9mruwl1+mD4lvS4hQWkileL63RHek5Hkc5ZXNUsTmxL49SWlWD65dDRGZEBzIz3L4cuYbduvHEhJkQg6U9K3quw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjfsSJP4bqdvKh1W1bLDEVCu43A3t+DWM6aTR/Ht8p4=;
 b=Lc+/JKijpWIpYPbJ2GR2dww3UCm2dUWTBQxLooe4t2JrrVuKYNj6Y8Kb6S8T8jA2gQg0wu8FlHvu35oLUXrReiwE/f/PaoMOOw69/q1MrlUuTYWPo/eD84xvht6LOC3xsqeGyvoUsMehVrLvAhldGYSCJdNndLIfnQb7IRJBzlE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13229.jpnprd01.prod.outlook.com (2603:1096:604:352::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Mon, 14 Apr
 2025 13:05:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 13:05:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for Renesas
 RZ/V2H(P)
Thread-Topic: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for Renesas
 RZ/V2H(P)
Thread-Index: AQHbrT006JPvaQdayU6PWC6vZahsdLOjIFkA
Date: Mon, 14 Apr 2025 13:05:01 +0000
Message-ID:
 <TY3PR01MB113469552384EB52CED89FDC286B32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250414130020.248374-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250414130020.248374-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250414130020.248374-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13229:EE_
x-ms-office365-filtering-correlation-id: 4fd935cd-275b-4708-4981-08dd7b54f75c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?BkfQ4Kr5p56CvdNHne8LsXfIEeSvXPHMoCoxlRicgk6YcF6waWvUYaEKllis?=
 =?us-ascii?Q?tY96rmIOzE+HY77ygO7albB0h78ja8fJhSc1ptlKy9NTauW/7anwCIs+aTCM?=
 =?us-ascii?Q?egLBIFMn7DbmIJ9Yh4u2Jkq6gnI646mgExU7erhVz/xcR2qeF7MnrWCxYMKr?=
 =?us-ascii?Q?m7yNWmg+WDybTKlU7tc62vdGIDIG7zmtgfVPKIoWA6Oz9r4/2IrBt04dD3xq?=
 =?us-ascii?Q?dexyYkpvRMBnR6JTH2ZSRpXWkukzx97Or0U354lS9P0c+4IHHabm+ETjB7ka?=
 =?us-ascii?Q?xD0zhUgF1M2+yo+J9mDYr/BKylNVWwbNltMhWOD+KHTydQgRQev98S5hKIRB?=
 =?us-ascii?Q?N7dP8QOADHViD4R/9nF4o08qbdo+hebDB+Y3fe9UDeU4Vi82U1OX4x3YxwQ2?=
 =?us-ascii?Q?XvwOQzx1TOLLrb6guTmX0NJ7NU5Gh2Me1tnqj0zLI+dDOOhMtdyEnhsfUs5j?=
 =?us-ascii?Q?4y3qCwtgi8vna59sHZUvYLkQIhYipvU0MDAl2USgIhOjmK3ne6HOyBwDM+BI?=
 =?us-ascii?Q?72KKU4OjT5r/kgJ3qSFpr3XX1QC4IeKiiqs+WjjuXyGke5rQKtBHK2muuh30?=
 =?us-ascii?Q?VgUwNjVvnVgZvZztPX8q716seQRjLw0qdeVv2Qffa7I3v1AuR47egLfmGLHt?=
 =?us-ascii?Q?L+vfRob8zh+s+YHcv8a4InXvVPPPhkFwjjzt6vdkaIqsNFJMgj1+PD/na0Gc?=
 =?us-ascii?Q?s0UAsSlQ7Te93cIA5eTdCt0k7fCXbqdX2n3lT8UlY6jozu50jV2x+CtdQwF4?=
 =?us-ascii?Q?Q2tChyocqJBf+VlADjo2aRnN0MDWFo0wkbsEMDMnGEYR2aHgkkYuNL5ScDDE?=
 =?us-ascii?Q?eXPYHxDoBsl8RgI5JW4RnDLshnePFYwnQ615maYP3m9gla1eYv/9PJqR+0Sh?=
 =?us-ascii?Q?0qhJNugtFbI/HhI9ShBIugJgNezvo/uk5tw8IXD49eLTFrTW4nbn3ds2hExE?=
 =?us-ascii?Q?BbVN/1j2Dj3ClS6iRULZw/BhtEYhmwgeKm9q99JczK8ZSKg69ySLg6IvL3lL?=
 =?us-ascii?Q?4ybJynBT1XNTiOrh4B25iBUMFt4W799TseDe7KAc5LVKsxRMVX99SRBuTrOv?=
 =?us-ascii?Q?41C9LpV5gcSaBpmdNcx5DsmbeKlBLSpvVIdtri9tbxG/rrRUHrImzqZ49BKh?=
 =?us-ascii?Q?hdCn6dBSnmrmf6mGPwPS+0C8HCTUsCT8Vs1xLGdNYSgNQhsnKw2XQtiLKmes?=
 =?us-ascii?Q?uOAe8G24SopdBmatZOMgQ3jnz9uPPAvKJKo3btIZQ/EnpoEq/Ffv5X7JrdJm?=
 =?us-ascii?Q?5wZmyMOYVKwjjyWMbYdf6nzyMxRmw9UIMEssCPHDcMeIGlWj2qrccMW3sr32?=
 =?us-ascii?Q?irxZz4MQ5SMurt764x2gREh10W/BvICkpDz8UVyYSUjT6YWOpCfHVfHHfvE1?=
 =?us-ascii?Q?7vKtFYqIyQSIRO3RlA3HnZwLvuSUP4XKsbU0kOUdGuEmPgMyvdWQt6DBVxDj?=
 =?us-ascii?Q?okxz+1vzbKbwlU7k2vQp8nGneVyNQdvqp/SBnWSCwGnLn+XG8SY0Ig=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?JR4OcXfDisONh9sDBO6GkOrdsVV0f6tHkjyxCfaRPCipRswKIcjCM78Tm9ZT?=
 =?us-ascii?Q?BiK1XtqmtxHUIhv54uWfMY0nmqtn+Nr7LAAYGGjCExPsVxECVkK4sK2ctDN0?=
 =?us-ascii?Q?bdtd46C7s3vwK8E4fC0/LQy6mgIYZsD72mcRErkj5Cb/HcfUxUCOtti2ocO9?=
 =?us-ascii?Q?BF+c8VX5tW4OTCiHQd4rkQkMKAdc0+9M91hujie6kDC4WA03Pmk10UlYFBT1?=
 =?us-ascii?Q?OpDEi3pswnBankE63pUUCu87fQCY8ApR5/Ok6uctt53QHt8e+JV5VqVVGkeB?=
 =?us-ascii?Q?CkZ+mDt2a0HX6ronIORPI1l/YK8shh50YoQFlPs0KNpqvATYJbOB62PTfe4y?=
 =?us-ascii?Q?luP1rI4IcQbLWVbAs3ORrGXXbt0crJsjeg2gnUWLmmwpiuFA9nUJDU5VUyr8?=
 =?us-ascii?Q?obVD73e3Jlproi6Sjk1OZlCT/AMsfOHrKYAqbVAcOkcAnCs5hZrTHjovmdmi?=
 =?us-ascii?Q?flOSLNTHyj/cCs1TDM/VGw/1QcGz/oO2934nSEFGQdFWQ5irrv0L63OCbfjl?=
 =?us-ascii?Q?xGxZO1l2zha9wSVdTpRzmUXzGBiEwYOGU3ofYSUNojtC+7mPCq7HUuPtz5nj?=
 =?us-ascii?Q?XJk2Q1UPFXCZiXHP98+8TbdKo8OXNus9twtFHunmj9kETRxRYzY9uxQjfizC?=
 =?us-ascii?Q?EWA6/mZYezxIqi2r/uYLXGSsKkyLbCcR9B8Bt8B47ndqc5YCdlypkLTGczMB?=
 =?us-ascii?Q?UfP4w4+dn7O2+9cmOu0H4U193sdIGfkIpgtf5zvVD49sjFuXSk8jwIvmRnNA?=
 =?us-ascii?Q?479PDmdnFdukCG2W6DqQu2+gIcZuWj6i8GwxsZt5JKqR6mCPnbUf0immovA8?=
 =?us-ascii?Q?VlI3BNW3DE0ZVG8Kww6+Zj4JG1/WCG25axcxg1iJdwAvv7c/AVqPIJamxlV/?=
 =?us-ascii?Q?lp8j947TEsgP/UjXN3R1L+D5LDj5Mo7SGABcLVGYLQPqXK18cQjIm9FUj2Pi?=
 =?us-ascii?Q?mPmqQZRzzMnlU7l1ihDN5fP0rWZSjT/O3oqvKoYgFUVoT0d2NUUTlNhZpPNv?=
 =?us-ascii?Q?VoYT5Wdwm2oxWVyQ4lM8u2nmaea287L4qL7HmbWvMh+cSByHsfWTpqsnT+HN?=
 =?us-ascii?Q?ufB81ZrjKWt8UUefJr7Af/to4ObOCLhEsVARAvtaz/wYCKNanoeWmVJesrbV?=
 =?us-ascii?Q?nTxSFki3HOKISmtte7ueeXVA6HrHjX3tYkouYQ4HWBp6OpmjJH5Fq+udVM27?=
 =?us-ascii?Q?d8vDmWhEoqXhXG/B462jGUd20zu46oKMsvmSPxJc5rC9Jhv3baoe5UmBMKhv?=
 =?us-ascii?Q?KIqESK5/gR+rNDin2yc+lCm6i5Ji97cRM28+BgH1142aQs5/MIRSKADcEN7G?=
 =?us-ascii?Q?1Geijj1Ao73x98wyKCKxxwpqw+owCLqen7gy1Vi/4Ush3+KTBvv5C/LMo8dj?=
 =?us-ascii?Q?2ZA89knlEnbXgV60+iLMTjD8uHp1spMdtI6er/Ljhckb/wgjZziQ3b7xiHN4?=
 =?us-ascii?Q?MmXgzzmmS910iCTAizelSDEEH1LDOEADZRmlFYv8foS6Ra/PJKgYDhb4F1Md?=
 =?us-ascii?Q?FUYR7MWbT7wza/N+uW697EgCUVSGxIZD3f4TYptevUb6/MyNuFnTrdN4t517?=
 =?us-ascii?Q?/s5fxqJNMmvR5/NShIYSiqmZXZ7JLz/vPQo11uFcjN7t7GaBCmu3/Pn98cLS?=
 =?us-ascii?Q?dw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd935cd-275b-4708-4981-08dd7b54f75c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 13:05:01.3550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cNzmF4Yjtp2rImhlVQ6+V3c5UOQrcevzk97K/BqR/bWfLaJlLHzGLcpseTkR4U+cfBuN4TyuCkHQ1dStbqFsIkSGfvv5asFyHauqVBqHWBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13229

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: 14 April 2025 14:00
> Subject: [PATCH v4 2/3] reset: Add USB2PHY port reset driver for Renesas =
RZ/V2H(P)
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Implement a USB2PHY port reset driver for the Renesas RZ/V2H(P) SoC.
> Enable control of USB2.0 PHY reset and power-down operations, including a=
ssert and deassert
> functionalities for the PHY.
>=20
> Leverage device tree (OF) data to support future SoCs with similar USB2PH=
Y hardware but varying
> register configurations. Define initialization values and control registe=
r settings to ensure
> flexibility for upcoming platforms.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/reset/Kconfig               |   7 +
>  drivers/reset/Makefile              |   1 +
>  drivers/reset/reset-rzv2h-usb2phy.c | 241 ++++++++++++++++++++++++++++
>  3 files changed, 249 insertions(+)
>  create mode 100644 drivers/reset/reset-rzv2h-usb2phy.c
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig index 99f6f978=
4e68..6c7dbd8ca580 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -225,6 +225,13 @@ config RESET_RZG2L_USBPHY_CTRL
>  	  Support for USBPHY Control found on RZ/G2L family. It mainly
>  	  controls reset and power down of the USB/PHY.
>=20
> +config RESET_RZV2H_USB2PHY
> +	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
> +	depends on ARCH_RENESAS || COMPILE_TEST
> +	help
> +	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
> +	  (and similar SoCs).
> +
>  config RESET_SCMI
>  	tristate "Reset driver controlled via ARM SCMI interface"
>  	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST diff --git a/drivers/reset=
/Makefile
> b/drivers/reset/Makefile index 31f9904d13f9..30d0fb4ac965 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -31,6 +31,7 @@ obj-$(CONFIG_RESET_QCOM_AOSS) +=3D reset-qcom-aoss.o
>  obj-$(CONFIG_RESET_QCOM_PDC) +=3D reset-qcom-pdc.o
>  obj-$(CONFIG_RESET_RASPBERRYPI) +=3D reset-raspberrypi.o
>  obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) +=3D reset-rzg2l-usbphy-ctrl.o
> +obj-$(CONFIG_RESET_RZV2H_USB2PHY) +=3D reset-rzv2h-usb2phy.o
>  obj-$(CONFIG_RESET_SCMI) +=3D reset-scmi.o
>  obj-$(CONFIG_RESET_SIMPLE) +=3D reset-simple.o
>  obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o diff --git a/drivers/re=
set/reset-rzv2h-usb2phy.c
> b/drivers/reset/reset-rzv2h-usb2phy.c
> new file mode 100644
> index 000000000000..737b768829c9
> --- /dev/null
> +++ b/drivers/reset/reset-rzv2h-usb2phy.c
> @@ -0,0 +1,241 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Renesas RZ/V2H(P) USB2PHY Port reset control driver
> + *
> + * Copyright (C) 2025 Renesas Electronics Corporation  */
> +
> +#include <linux/cleanup.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +#include <linux/reset-controller.h>
> +
> +struct rzv2h_usb2phy_regval {
> +	u16 reg;
> +	u16 val;
> +};
> +
> +struct rzv2h_usb2phy_reset_of_data {
> +	const struct rzv2h_usb2phy_regval *init_vals;
> +	unsigned int init_val_count;
> +
> +	u16 reset_reg;
> +	u16 reset_assert_val;
> +	u16 reset_deassert_val;
> +	u16 reset_status_bits;
> +	u16 reset_release_val;
> +
> +	u16 reset2_reg;
> +	u16 reset2_acquire_val;
> +	u16 reset2_release_val;
> +};
> +
> +struct rzv2h_usb2phy_reset_priv {
> +	const struct rzv2h_usb2phy_reset_of_data *data;
> +	void __iomem *base;
> +	struct device *dev;
> +	struct reset_controller_dev rcdev;
> +	spinlock_t lock; /* protects register accesses */ };
> +
> +static inline struct rzv2h_usb2phy_reset_priv
> +*rzv2h_usbphy_rcdev_to_priv(struct reset_controller_dev *rcdev) {
> +	return container_of(rcdev, struct rzv2h_usb2phy_reset_priv, rcdev); }
> +
> +/* This function must be called only after pm_runtime_resume_and_get()
> +has been called */ static void rzv2h_usbphy_assert_helper(struct
> +rzv2h_usb2phy_reset_priv *priv) {
> +	const struct rzv2h_usb2phy_reset_of_data *data =3D priv->data;
> +
> +	scoped_guard(spinlock, &priv->lock) {
> +		writel(data->reset2_acquire_val, priv->base + data->reset2_reg);
> +		writel(data->reset_assert_val, priv->base + data->reset_reg);
> +	}
> +
> +	usleep_range(11, 20);
> +}
> +
> +static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
> +				     unsigned long id)
> +{
> +	struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_priv(rc=
dev);
> +	struct device *dev =3D priv->dev;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +
> +	rzv2h_usbphy_assert_helper(priv);
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}
> +
> +static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcde=
v,
> +				       unsigned long id)
> +{
> +	struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_priv(rc=
dev);
> +	const struct rzv2h_usb2phy_reset_of_data *data =3D priv->data;
> +	struct device *dev =3D priv->dev;
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +
> +	scoped_guard(spinlock, &priv->lock) {
> +		writel(data->reset_deassert_val, priv->base + data->reset_reg);
> +		writel(data->reset2_release_val, priv->base + data->reset2_reg);
> +		writel(data->reset_release_val, priv->base + data->reset_reg);
> +	}
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}
> +
> +static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
> +				     unsigned long id)
> +{
> +	struct rzv2h_usb2phy_reset_priv *priv =3D rzv2h_usbphy_rcdev_to_priv(rc=
dev);
> +	struct device *dev =3D priv->dev;
> +	int ret;
> +	u32 reg;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		dev_err(dev, "pm_runtime_resume_and_get failed\n");
> +		return ret;
> +	}
> +
> +	reg =3D readl(priv->base + priv->data->reset_reg);
> +
> +	pm_runtime_put(dev);
> +
> +	return (reg & priv->data->reset_status_bits) =3D=3D
> +priv->data->reset_status_bits; }
> +
> +static const struct reset_control_ops rzv2h_usbphy_reset_ops =3D {
> +	.assert =3D rzv2h_usbphy_reset_assert,
> +	.deassert =3D rzv2h_usbphy_reset_deassert,
> +	.status =3D rzv2h_usbphy_reset_status,
> +};
> +
> +static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcd=
ev,
> +					const struct of_phandle_args *reset_spec) {
> +	/* No special handling needed, we have only one reset line per device *=
/
> +	return 0;
> +}
> +
> +static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev) {
> +	const struct rzv2h_usb2phy_reset_of_data *data;
> +	struct rzv2h_usb2phy_reset_priv *priv;
> +	struct device *dev =3D &pdev->dev;
> +	struct reset_control *rstc;
> +	int error;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	data =3D of_device_get_match_data(dev);
> +	if (!data)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "failed to match device\n");

This check is not needed as there is always data.

With this addressed.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> +
> +	priv->data =3D data;
> +	priv->dev =3D dev;
> +	priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	rstc =3D devm_reset_control_get_shared_deasserted(dev, NULL);
> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc),
> +				     "failed to get deasserted reset\n");
> +
> +	spin_lock_init(&priv->lock);
> +	dev_set_drvdata(dev, priv);
> +
> +	error =3D devm_pm_runtime_enable(dev);
> +	if (error)
> +		return dev_err_probe(dev, error, "Failed to enable pm_runtime\n");
> +
> +	error =3D pm_runtime_resume_and_get(dev);
> +	if (error)
> +		return dev_err_probe(dev, error, "pm_runtime_resume_and_get
> +failed\n");
> +
> +	for (unsigned int i =3D 0; i < data->init_val_count; i++)
> +		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
> +
> +	/* keep usb2phy in asserted state */
> +	rzv2h_usbphy_assert_helper(priv);
> +
> +	pm_runtime_put(dev);
> +
> +	priv->rcdev.ops =3D &rzv2h_usbphy_reset_ops;
> +	priv->rcdev.of_reset_n_cells =3D 0;
> +	priv->rcdev.nr_resets =3D 1;
> +	priv->rcdev.of_xlate =3D rzv2h_usb2phy_reset_of_xlate;
> +	priv->rcdev.of_node =3D dev->of_node;
> +	priv->rcdev.dev =3D dev;
> +
> +	return devm_reset_controller_register(dev, &priv->rcdev); }
> +
> +/*
> + * initialization values required to prepare the PHY to receive
> + * assert and deassert requests.
> + */
> +static const struct rzv2h_usb2phy_regval rzv2h_init_vals[] =3D {
> +	{ .reg =3D 0xc10, .val =3D 0x67c },
> +	{ .reg =3D 0xc14, .val =3D 0x1f },
> +	{ .reg =3D 0x600, .val =3D 0x909 },
> +};
> +
> +static const struct rzv2h_usb2phy_reset_of_data rzv2h_reset_of_data =3D =
{
> +	.init_vals =3D rzv2h_init_vals,
> +	.init_val_count =3D ARRAY_SIZE(rzv2h_init_vals),
> +	.reset_reg =3D 0,
> +	.reset_assert_val =3D 0x206,
> +	.reset_status_bits =3D BIT(2),
> +	.reset_deassert_val =3D 0x200,
> +	.reset_release_val =3D 0x0,
> +	.reset2_reg =3D 0xb04,
> +	.reset2_acquire_val =3D 0x303,
> +	.reset2_release_val =3D 0x3,
> +};
> +
> +static const struct of_device_id rzv2h_usb2phy_reset_of_match[] =3D {
> +	{ .compatible =3D "renesas,r9a09g057-usb2phy-reset", .data =3D &rzv2h_r=
eset_of_data },
> +	{ /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rzv2h_usb2phy_reset_of_match);
> +
> +static struct platform_driver rzv2h_usb2phy_reset_driver =3D {
> +	.driver =3D {
> +		.name		=3D "rzv2h_usb2phy_reset",
> +		.of_match_table	=3D rzv2h_usb2phy_reset_of_match,
> +	},
> +	.probe =3D rzv2h_usb2phy_reset_probe,
> +};
> +module_platform_driver(rzv2h_usb2phy_reset_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Lad Prabhakar
> +<prabhakar.mahadev-lad.rj@bp.renesas.com>");
> +MODULE_DESCRIPTION("Renesas RZ/V2H(P) USB2PHY Control");
> --
> 2.49.0


