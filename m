Return-Path: <linux-renesas-soc+bounces-7806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ABA94E7F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 09:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55FB1B21FA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Aug 2024 07:40:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22C071586CD;
	Mon, 12 Aug 2024 07:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VddUFjby"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B81B1474D3;
	Mon, 12 Aug 2024 07:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723448408; cv=fail; b=GluHCxfjFnfvXJ8ogrSDKeif1PbpBibIc88sWL6god2xbQTFjywi5/3zgtsIyNNMebipBsMqWz8ZwfiyHELQ15ArjOmlvQ6pbHiArT0TYXRKX7C7ud8F985Q0ewso98W49nKpY/Z6tdBDqpec0htBYhrabD6Vci+04nAdMlg/uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723448408; c=relaxed/simple;
	bh=wDDcPZ8SNLg/fRjDi4IX3ysG1E9rKwpN0qkaY5wbMY0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eHDe0Oy2N/fNYh3F/c6rh8uAJ1wZYsdqZXv0ypfqjX8K+03cuXT9xG+cYILLf23qA362C6Zvvj7/oQEeKceXXNiOUZSPFqaosT7wA06RFdsistXDtdfMB5BJwsw8s3hLQy/D4X00GhxBXiolXCcb/SG8ZwgmchJO1gEPdpfK+p8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VddUFjby; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYx9KeSVPkTikGkPWy13aQQUsQim49e9164DvsMmpHxyTvMQQZ0v6khYmPdlrZQ78iW/06jpN1e2veDdXegwoKbQ6Dmm0Sxnb/WH7nmVIFA5WkhqOyRbp4bI7qy0FRPMdd53NBWq2mL4H79n5FeGxwILCCBKylKs8h5Tndqj4nHxkXfAbTeURpW0EgR2ARfU9pDcV8iA7X0TgoLhXmVbXeWcoiW8dtNbPbo5QlQ5E0j/e8y4eAI4LLRSy7JZ7FYZruJYxusNXXcellca6JM+jk6LtJ07XHDjx07J0E8fSG413qLEI+io+/x0iPPBu1zZyMCANIoNejV261eMjnbOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWoriLjWJxW9TkSL9gSqVNHOswoB5tQChniNSeMqvgA=;
 b=cYCrUmJ/smYmniec8AH7MeWWHgLgTx/p0w4beZC1sSf/nrY3CdS1BXHe0RV5YLeelv+JzbHswXO5jmUFR0hNOl4cSiLeewDrXAXGCvhlgU/KLBazqx6ghfyXeZ1TQQtHmu4PHTsQvV/Bbl0MhstHe0JB3EUM7ZCoAOqWazNnLY8liJ9fmKM5tCNQK2cJ9y3UV4e/1vSYrkdjenZ7xWknon/dBqgH0TLIKxSO0FJjRcK3j1+wA0a3m3Q+UB7cTmZu0tAZTAVV3dLX60h4oufJke1K3yu6C3UQu7EPP5FwPRzdrSkhMTCnjUxKv3zEZkWZfvzYowlu6BGa8IlRHLkdQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kWoriLjWJxW9TkSL9gSqVNHOswoB5tQChniNSeMqvgA=;
 b=VddUFjbyYFv90xVw5mLViXwLLaRXrNRvSlgPZuO1BZtemH949Zp79J63sVCftac6cylSknmimsohX0LLMZgj2Ry9C/Yxzlq3Nehy1cGzRnorSgeE+oYJVsryQVec8BODrzUJ+VpRmWcdBQfvLOOeWhY/g65G26oTAPKGxrw5KH4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB11976.jpnprd01.prod.outlook.com (2603:1096:604:236::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 07:40:00 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 07:40:00 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v2 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable
 OSTM, I2C, and SDHI
Thread-Topic: [PATCH v2 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable
 OSTM, I2C, and SDHI
Thread-Index: AQHa7DAXCupFvrqDHkWsJaJo6V49crIjPC6w
Date: Mon, 12 Aug 2024 07:40:00 +0000
Message-ID:
 <TY3PR01MB113466DE7061B60485B3BE97986852@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240811204955.270231-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240811204955.270231-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB11976:EE_
x-ms-office365-filtering-correlation-id: ebb220da-948d-4fcd-70f9-08dcbaa1f8d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?kZYbtkqZfXv4JKobZ7te5e54oQZiulko9c9eGMsxUFVXQabfXFtR9/JvLPWP?=
 =?us-ascii?Q?dG7fxbITAsjiYktcgnyFShlWmTiakmmZwhM14eG3kgbceJpZrR2df0sLXUoR?=
 =?us-ascii?Q?a0HQgHOn5uEEykNfrXTq7yKvnopqoKmsgE6iBK1JRaZA6ZAWhJYjd2vV3OTN?=
 =?us-ascii?Q?EkVO9JjC//jwEOIVM/jbtNgAH5jrrJHyKR20PDIJmg6AWcYR6vUD+AIKWOtT?=
 =?us-ascii?Q?0UJzcMQ5Yav6msSgb+vjHxHb63G4a0i5Ay2FXqohxzYl4iXMuXoVATohzqYO?=
 =?us-ascii?Q?i1OLL+tNzCfZGWsWYvXYsveXZW9aMo/YHfSnK9XJMmakG8vujn/4bA2iKK3Z?=
 =?us-ascii?Q?6XOD1YBvfFa4XC0UCw1pbxUQG7iHPvfCggINXnhXYaBmuzOWTm0oktbj1KHT?=
 =?us-ascii?Q?j8af3pdGskdtAtAZvcPkltxqnbl6zzddljXNhpSNSfUnNr4a4o0LnpT0rPoQ?=
 =?us-ascii?Q?hGmjYrzZ2+geNcOpN9TFndpFCBmdE/7kZ4/PvaDY2OOaNPGEmPOCHEDxbt58?=
 =?us-ascii?Q?tpU7CwRDvnKBUk4kFQB9kWGNpJS+uYuHkD1CW1yn5tHe9Z+0x+Vl7+e/NI3H?=
 =?us-ascii?Q?fGs5KoGRYTDF4w/2igeuGUpaA+F3OZDzy0kQC1k774TdKQe9MEuCLOTpPDut?=
 =?us-ascii?Q?0Jw5XHmRi49W/TCNSm1nFxasVnulmmmeUGdPEyQ2K2XIaaoupZDdMqB7u8Er?=
 =?us-ascii?Q?4K0Juib1wGkmhQhMoMBW4LXUJJVFcGadC+ERhcRkXBhmlnwUZxTdEV3PrFPT?=
 =?us-ascii?Q?4O3Z+yNVPILCmGN4yp/T987bh0gZjmLq+W4IItz3HNAqFjWFotip8/tmjfHy?=
 =?us-ascii?Q?QV9QPGmYeMET3pRh3zsp3bki0V1IfZIOa/1KJ+s1i+VMCz8W83IMoBVTzK3g?=
 =?us-ascii?Q?R1p29OahnfG71QK+pXUMBDAauYnlXbfQgRylA3WMTh32a6UTZxRM5oLNl+Hi?=
 =?us-ascii?Q?psJ5ItYtWGOQ0KaCuKkaGYcybRfD9SbPXm6/kZlKqXHxVugGhZpRcsCLVILs?=
 =?us-ascii?Q?VQF/NzumacXUlyjFLqjr6AwWQGokeLYRPtRwEUExnX3DmmmgJNjRC+pbao0k?=
 =?us-ascii?Q?4hyP9FrxY1BAXE1Ii35RgnwQADUnbFhjmpVVgIw5XCAI4DH3eCrbyUg/ljRt?=
 =?us-ascii?Q?2Z2i/I3jOmpr0PR8zrj9guV+MuQUr/PsdSM6ks1OYdtHlWGfi0l34PKVM7WY?=
 =?us-ascii?Q?0TTyTA6xospCzLGE3579VyPdHm/SaYXFxXhxEEdYtsnexEmm4p+EzIesde8j?=
 =?us-ascii?Q?lMiQ1msboc3QS2D3bA5WHaXgfvxIjqzKppSeo4mT3p9HmkzOVPUtLiSMZNmD?=
 =?us-ascii?Q?J9sJ+FwNFWl0lAsyYsZPbn2eDf/te/GcYImwbzuK35shJjHV56C5+EAVkpCd?=
 =?us-ascii?Q?QWYj6WiQKtlfR4W9ep+EgOYnbQk2CGCOmGpzyHr8OuMkfhWVzg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?fiLeYIcBPJZ2CI6o7OzqwWScKqkNR9KwxkySkp8FX3iZ7rX4G+lTSVQAH7zI?=
 =?us-ascii?Q?sNiGF52iWVuW4RNweH+k/BxKreMNAkDsxpDclh4kOVi3kOB1SgHVnl3x7CyK?=
 =?us-ascii?Q?6UgZ/RIBHd4zUKuL5BUuhFVwmyW5E4q1JBiGkoyZLEigWI+LZVCXxIsnrFN6?=
 =?us-ascii?Q?LM0j9BwVQ5okzC05gJoBg60nP+D8xx6oc7atyM0jK7DOqJphoQTB+7fEVLoj?=
 =?us-ascii?Q?vgp8hB3hlhX3Hw5gvAq7aIJnusSVw6UY2vuNDSdU/NzqtFwa5IsME0BhfYGF?=
 =?us-ascii?Q?BqUh4sTmLXg8rpTQbW3qju60ITtuuFfMw1RXx3W4z1bAyhsOnzYTjhj2arlt?=
 =?us-ascii?Q?YTYlu35geCKv8VsG9frbLEfCm6Uabv0Steac5J7VWydoVrEN1YJizXDeAg7o?=
 =?us-ascii?Q?crUvk3dN6YmNz17gSSg/vOxbCTe9Dl528xYoKrMePc8/VtOQzCDPEXiktDHW?=
 =?us-ascii?Q?q97JsBDHjSo32cxw6qHJYURSo8eBwlZyNlMCqGjg3ln2VC5nHAZ+gS4V8wba?=
 =?us-ascii?Q?jWqOJK997aKqf7kVeObfedtxXW3Lt/9pmjJqJ4+UWz4U+13UTzI2It61RUSy?=
 =?us-ascii?Q?k2GacnAkR1qP6iRJYBZZM891jN1EMEPoJAkUD7cm66XlPuWp/SQVJcuSotoj?=
 =?us-ascii?Q?fjfWh68oYHllwgnEnQf9LpSEO4IB7Hm1f5v8/iV1mRxxB+koW0pjC8hY1Tlw?=
 =?us-ascii?Q?jbhnyWWoKJ/EmMI9X1ceM/vk+R0JqRPvv2PhsblwVOvATp7Wv7rkE0OPcxWs?=
 =?us-ascii?Q?kIBAo3rzDbSAqsGQ6OpLToH/qUxCvyTm02o9/UvzsF1hYwDS5WgiuON5D2ve?=
 =?us-ascii?Q?XBRMvUtsi+2DX2gYAFuAvuD9kQdtWjpNWaFQE8ddICCRnxErd0rVcfHw2hyc?=
 =?us-ascii?Q?dTdV0giR3c5yAA7+IzqCaZC1JkxkT6la/vsTmrniTAVirHExYsAFjEvsv8M/?=
 =?us-ascii?Q?boL+XhQjZOEFcRwmzfy2CD/GIJhoJswag6LPxLFJCuVJv/nj4BdjQO8V8XiY?=
 =?us-ascii?Q?o5tkBA8u+JKtUdhD7VGOU2sudlEbIhpFDQ+rzFYl7O1P4kXMbCa1d38C9rER?=
 =?us-ascii?Q?Nj9zhim8s/jngy7ELM12h9Bb2HZyNIqRlpfFkxxcX5Sa/QoxqycywocFIiRB?=
 =?us-ascii?Q?fkXGuIwQFvW8NdEMcu+zVmG/2vslD9eQGhxFTM4gzZyNMsnFjHdS7Gla9gzA?=
 =?us-ascii?Q?EMNSu90qBGzPsoSQwdNldJEYsCjzSgjHKLdoeESQ6zpFKl+5MHLyESzH7VrI?=
 =?us-ascii?Q?hCQ6jVHpZ8QshEEYxyb4FbpHr5SwGJQniyN/swCQVS9jQOxFI68N3iS2qQZk?=
 =?us-ascii?Q?0V/NT9u2JLzqANzUiDH55dyQg84Ws0Y4zSItr7nYvRPwoQXW5wRA1CPfsSVC?=
 =?us-ascii?Q?iAG2Cccw4WgMazvymPmlH8GDzYGOVBfB165JPfhLHu+bK1/wqNCdsm4f6D5+?=
 =?us-ascii?Q?bfSGT7tiCJ6+IB61K504xkf0+aMiN8+F0/mBREgnuwWS3SV8rQOyRa6xWL8e?=
 =?us-ascii?Q?bQk9wfbwrhAU7xmShwczYStk3e4ZoFV5UI0Z5qTE/raGpAnJd1+3CCdDtzaj?=
 =?us-ascii?Q?RjsduMaZO1X6DReMKBjYvZYOfgMUVZKjY0H1IB1I?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb220da-948d-4fcd-70f9-08dcbaa1f8d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 07:40:00.6868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KcXb7uqRjepBqceLbr+O5Zk0dCtrUyqARWtrxCj6cQk7yjoKu1rr8tUR+cJj7asmryqF/vYht4a4LIGxfcDgPqLIDbGgalGL6OreHv5CdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11976

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: Sunday, August 11, 2024 9:50 PM
> Subject: [PATCH v2 7/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable =
OSTM, I2C, and SDHI
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Enable OSTM0-OSTM7, RIIC{0,1,2,3,6,7,8}, and SDHI1 (available on the SD2
> connector) on the RZ/V2H GP-EVK platform.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2
> - New patch
> ---
>  .../boot/dts/renesas/r9a09g057h44-gp-evk.dts  | 191 ++++++++++++++++++
>  1 file changed, 191 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> index 593c48181248..11c13c85d278 100644
> --- a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
> @@ -7,6 +7,8 @@
>=20
>  /dts-v1/;
>=20
> +#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
> +#include <dt-bindings/gpio/gpio.h>
>  #include "r9a09g057.dtsi"
>=20
>  / {
> @@ -14,6 +16,14 @@ / {
>  	compatible =3D "renesas,gp-evk", "renesas,r9a09g057h44", "renesas,r9a09=
g057";
>=20
>  	aliases {
> +		i2c0 =3D &i2c0;
> +		i2c1 =3D &i2c1;
> +		i2c2 =3D &i2c2;
> +		i2c3 =3D &i2c3;
> +		i2c6 =3D &i2c6;
> +		i2c7 =3D &i2c7;
> +		i2c8 =3D &i2c8;
> +		mmc1 =3D &sdhi1;
>  		serial0 =3D &scif;
>  	};
>=20
> @@ -32,17 +42,186 @@ memory@240000000 {
>  		device_type =3D "memory";
>  		reg =3D <0x2 0x40000000 0x2 0x00000000>;
>  	};
> +
> +	reg_3p3v: regulator1 {
> +		compatible =3D "regulator-fixed";
> +
> +		regulator-name =3D "fixed-3.3V";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
> +	vqmmc_sdhi1: regulator-vccq-sdhi1 {
> +		compatible =3D "regulator-gpio";
> +		regulator-name =3D "SDHI1 VccQ";
> +		gpios =3D <&pinctrl RZG2L_GPIO(10, 2) GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpios-states =3D <0>;
> +		states =3D <3300000 0>, <1800000 1>;
> +	};
>  };
>=20
>  &audio_extal_clk {
>  	clock-frequency =3D <22579200>;
>  };
>=20
> +&i2c0 {
> +	pinctrl-0 =3D <&i2c0_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +

clock-frequency =3D <100000>; in SoC dtsim

Why frequency set to 100kHz for all the i2c nodes even though SoC supports
Transfer rate up to 1MHz? Is it board limitation restricting to 100kHz?=20

Cheers,
Biju


> +&i2c1 {
> +	pinctrl-0 =3D <&i2c1_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-0 =3D <&i2c2_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +
> +&i2c3 {
> +	pinctrl-0 =3D <&i2c3_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +
> +&i2c6 {
> +	pinctrl-0 =3D <&i2c6_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +
> +&i2c7 {
> +	pinctrl-0 =3D <&i2c7_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +
> +&i2c8 {
> +	pinctrl-0 =3D <&i2c8_pins>;
> +	pinctrl-names =3D "default";
> +
> +	status =3D "okay";
> +};
> +
> +&ostm0 {
> +	status =3D "okay";
> +};
> +
> +&ostm1 {
> +	status =3D "okay";
> +};
> +
> +&ostm2 {
> +	status =3D "okay";
> +};
> +
> +&ostm3 {
> +	status =3D "okay";
> +};
> +
> +&ostm4 {
> +	status =3D "okay";
> +};
> +
> +&ostm5 {
> +	status =3D "okay";
> +};
> +
> +&ostm6 {
> +	status =3D "okay";
> +};
> +
> +&ostm7 {
> +	status =3D "okay";
> +};
> +
>  &pinctrl {
> +	i2c0_pins: i2c0 {
> +		pinmux =3D <RZG2L_PORT_PINMUX(3, 0, 1)>, /* I2C0_SDA */
> +			 <RZG2L_PORT_PINMUX(3, 1, 1)>; /* I2C0_SCL */
> +	};
> +
> +	i2c1_pins: i2c1 {
> +		pinmux =3D <RZG2L_PORT_PINMUX(3, 2, 1)>, /* I2C1_SDA */
> +			 <RZG2L_PORT_PINMUX(3, 3, 1)>; /* I2C1_SCL */
> +	};
> +
> +	i2c2_pins: i2c2 {
> +		pinmux =3D <RZG2L_PORT_PINMUX(2, 0, 4)>, /* I2C2_SDA */
> +			 <RZG2L_PORT_PINMUX(2, 1, 4)>; /* I2C2_SCL */
> +	};
> +
> +	i2c3_pins: i2c3 {
> +		pinmux =3D <RZG2L_PORT_PINMUX(3, 6, 1)>, /* I2C3_SDA */
> +			 <RZG2L_PORT_PINMUX(3, 7, 1)>; /* I2C3_SCL */
> +	};
> +
> +	i2c6_pins: i2c6 {
> +		pinmux =3D <RZG2L_PORT_PINMUX(4, 4, 1)>, /* I2C6_SDA */
> +			 <RZG2L_PORT_PINMUX(4, 5, 1)>; /* I2C6_SCL */
> +	};
> +
> +	i2c7_pins: i2c7 {
> +		pinmux =3D <RZG2L_PORT_PINMUX(4, 6, 1)>, /* I2C7_SDA */
> +			 <RZG2L_PORT_PINMUX(4, 7, 1)>; /* I2C7_SCL */
> +	};
> +
> +	i2c8_pins: i2c8 {
> +		pinmux =3D <RZG2L_PORT_PINMUX(0, 6, 1)>, /* I2C8_SDA */
> +			 <RZG2L_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
> +	};
> +
>  	scif_pins: scif {
>  		pins =3D "SCIF_TXD", "SCIF_RXD";
>  		renesas,output-impedance =3D <1>;
>  	};
> +
> +	sd1-pwr-en-hog {
> +		gpio-hog;
> +		gpios =3D <RZG2L_GPIO(10, 3) GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name =3D "sd1_pwr_en";
> +	};
> +
> +	sdhi1_pins: sd1 {
> +		sd1_data {
> +			pins =3D "SD1DAT0", "SD1DAT1", "SD1DAT2", "SD1DAT3";
> +			input-enable;
> +			renesas,output-impedance =3D <3>;
> +			slew-rate =3D <1>;
> +		};
> +
> +		sd1_cmd {
> +			pins =3D "SD1CMD";
> +			input-enable;
> +			renesas,output-impedance =3D <3>;
> +			slew-rate =3D <1>;
> +		};
> +
> +		sd1_clk {
> +			pins =3D "SD1CLK";
> +			renesas,output-impedance =3D <3>;
> +			slew-rate =3D <1>;
> +		};
> +
> +		sd1_cd {
> +			pinmux =3D <RZG2L_PORT_PINMUX(9, 4, 14)>; /* SD1_CD */
> +		};
> +	};
>  };
>=20
>  &qextal_clk {
> @@ -59,3 +238,15 @@ &scif {
>=20
>  	status =3D "okay";
>  };
> +
> +&sdhi1 {
> +	pinctrl-0 =3D <&sdhi1_pins>;
> +	pinctrl-1 =3D <&sdhi1_pins>;
> +	pinctrl-names =3D "default", "state_uhs";
> +	vmmc-supply =3D <&reg_3p3v>;
> +	vqmmc-supply =3D <&vqmmc_sdhi1>;
> +	bus-width =3D <4>;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	status =3D "okay";
> +};
> --
> 2.34.1


