Return-Path: <linux-renesas-soc+bounces-7543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5525993CD83
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 07:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5AEF1F21EC3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 05:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C77429406;
	Fri, 26 Jul 2024 05:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="higOlQ9E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AAC22616;
	Fri, 26 Jul 2024 05:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721971165; cv=fail; b=ciIS0r9+LTMLvffGDIJJrKryBSMqwLpVTp2fPf+9y90hnuRw7B/3zCafiZ7Ixcp00Kk490meoJlq2tW5NRX6pHNrHu324F2UT4p5RVI2tflt4Yp4BbihG8EdFkIx02ivpGA4suURRvo1apoSF6uA3R6KB6CAVO2gFkmRo3IW46Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721971165; c=relaxed/simple;
	bh=dLkSA6bijFTwXLymP7q9JUJUElNju4lYxAHu1PYKOeo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c8tdhJX365PChv+FtNifdhEg7YC2evytJwtTiwiKdaK1p1kzR4USrLn0qJnum4NtDilu45Yy/Motg1yWndqc52Wn8IaeQEQcde2rQM9jWsiliYLnsWJmNtNLg/zJpdRKru/mavFmmEIFzISrK46A4pqlUYtDCt5fsxnzl/Czgw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=higOlQ9E; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2ovV1vgkeiKjv/QXh5MYoWWSqxtQOsvfUYE58Jzp7aRuq85zaunUZCi4k0YZVd1ssyzWibcUIDdyRPW8YdTm+K8vtkqrxlUlSIZvFAw6YV7oy2N8lufxp9PcMGTb7W4iu3dJvT8x3BIdcHvI1DehFGupnbW9EUKbpum0qMyLHL2hVQ/679Xn7b6upa++ILOsL9lZCZAUrqZ1Z9UDOCXKQ4ZdkS0T2PWFpX+OYe3SmhJVy/s2YF56HKnJLyRvcWLX5cPouzRS0y7FQo0B03+aF/lF1gkvoD5nBvoXkCYl2/gXRy3FUbQ+8q8tlR/4xKmu7CfZEKO2q0+DaiIqhAuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z36LJHalue1CnCkuTXYQsV2wvCtFzurm8pYVODcB+XA=;
 b=edzhe1SzuP0/cRDFjw//rhhR4ADYvIZnSWQV+Y1tXzMqbPq8iQoHuTvetX9w1Frc6D5YxwsMuGMkvDzhyYqcWwNJrVRe4z5T5+GCHyG4Dp0nn5wntLPdF4RmpitDHXtRGiaIRNFnkkxX8ljyNOF1T7dIyk0Ls6Zc8zJ96+00tiETWERv4tYQkVzEJcx7aSZq3l6w+SRN+FkXNiUvJFFxFNdN8Njxn3f/TBw1e5S4aK88+6nAR+aOgt3WY4eU4jB77HHyQNqWdbSa0mYlFQfQiBFEmHMx7xsj1a5LTpFgTaKRXxjbbJblw3DAsnbM1+BWtJqMKH8xrZiVCi0/0aMFew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z36LJHalue1CnCkuTXYQsV2wvCtFzurm8pYVODcB+XA=;
 b=higOlQ9EFvpCgrN/UeKllJdtSjeswzqP2/niJiBgtsSQE6629bkgpf5AK5nBI2UGVU+OA74xQqPuAzrtibihm8YvmJA/A+JxhS5HMdCE9UYJ4mpdHMzKt/28SCNzkxW+c2ZFngpE/6R65MmJIwm2aSqN70wT0egO0um5b5T/fLo=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYAPR01MB5961.jpnprd01.prod.outlook.com (2603:1096:402:30::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 05:19:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 05:19:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Marc Zyngier <maz@kernel.org>, Magnus Damm
	<magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Fabrizio
 Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 3/5] arm64: dts: renesas: r9a07g054(l1): Correct GICD and
 GICR sizes
Thread-Topic: [PATCH 3/5] arm64: dts: renesas: r9a07g054(l1): Correct GICD and
 GICR sizes
Thread-Index: AQHa3phV9B1kAbbtQ0SSh+vqC984fLIIdMvg
Date: Fri, 26 Jul 2024 05:19:18 +0000
Message-ID:
 <TY3PR01MB11346857DC444410F5C0A0C9486B42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240725133932.739936-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240725133932.739936-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYAPR01MB5961:EE_
x-ms-office365-filtering-correlation-id: f8a50b5e-6207-48dd-094e-08dcad327faf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?csxOQwCW8jTS5nPL8ngvpar7jUEw+7w0kUkwTxWHoSb6VVm+K9Z0O2EzMuDI?=
 =?us-ascii?Q?dSIhCB9k9+E/2RYvsju3lTDYFhiX4mmYdjaTgmJdL2EfChCApgbzi5vlb2t0?=
 =?us-ascii?Q?MDiHO0g0tXrqrWvFzxM/QDwcbfH1OKgywGUBIWt0+L9PmgKnHfSB9mFfMxWG?=
 =?us-ascii?Q?772E68TUu9rV5mgMXwlnK77XCLjdta4Jb0qnRUafmemEE/ZVyloeYlw30w+6?=
 =?us-ascii?Q?LYcSJ9eEf8X2O8QrGmWkIkvczVW9Q3YQvoEBx2800PYqX75trXxZm/Z0sN+z?=
 =?us-ascii?Q?Mdxyw/NEE22Bk6urREfUum14sckmGp176ovkfxqkdnKEb19l0hft3EV5LFPh?=
 =?us-ascii?Q?T1fijhpxw6lJRU7xJn/+2nkOo6qsXr4nhTYXJxKmFRvxIJRjNxaCDvB0AhCI?=
 =?us-ascii?Q?Br4hXqmCupmMxTSfszXnnqc49GYa/Lqt+koL6EMQIPMxPKHF3lIdw0XX4LUo?=
 =?us-ascii?Q?soMOLLy98pXhDe6Y9cIjGpYCl/BqYNPlmYhKwkWphsgFOzMN5yC3yjD7xLqO?=
 =?us-ascii?Q?MR+GkVwyV0HqghH5Mig3quAD5SNR5TEvphFCpGyv/crNGUkqJaGkc1ZtK8eM?=
 =?us-ascii?Q?FpUq55heD/Gs4ffjAjXD5qjZ05inJW66ADlNIhxvT4PtjP1xG5LnHU/pyLMr?=
 =?us-ascii?Q?vcV5zHlbSqJTHOBPD0nrBkKdV8bbis+bRy6l8fDRuDFJNxkhEaTOSu02HUML?=
 =?us-ascii?Q?YnORYe1bqwedHxMLuOBcGulBiHtQdTy2gVawJ7Pf6l5h4MfPDQBCjNw6O+O2?=
 =?us-ascii?Q?2sABVRn29GSgOM4iZwP6qVyA5/oBdT7p1gHzHPE4SkqHRVvREUNgX3+jrTK9?=
 =?us-ascii?Q?jYqrPeqM7hYeivp0bKt6a4QsAqyY7lXz2ZtHTUv63sTgU2pLa27UhDfQcuXw?=
 =?us-ascii?Q?wkWBGwsvzKP+rO2DTVwbNYh3KbgZ8fW60QvUcTHyoQInBztUis0MXEn2YaAM?=
 =?us-ascii?Q?2eNjGnNmiNkWM92363m59glCCXo+7qrhF6V60khOvtqlwfSzqOv9fZt6iYXh?=
 =?us-ascii?Q?yLW6oBlltf0/aYb60TgXZeEwNrxgxZVkS8Re+XhhiQVdT3hJ6X44VKT1ay29?=
 =?us-ascii?Q?TqHEmuP96O6XyrApQlahKVJ2w0bGy35ykIGboqEt3lWEcimAdoKrOn8G/uoS?=
 =?us-ascii?Q?H6wA5MaaWZgKTUKKrVwxsizhOjgxGCd7ofGM+mXQSwXLSrIxFDSCrMPzEsku?=
 =?us-ascii?Q?cKtBBKzCaubTB/LL7HmNzsN4JIpu4YVhVIWT8moyLLm1Lw35yO8Tl9Ct9vtG?=
 =?us-ascii?Q?Nz3cybjI+htWY4Mmd2aBHsDGdvkLL2j/oIZ0XqQhERqSb63SDavK5BFiTUA4?=
 =?us-ascii?Q?WjXbeFZlCNmK28TtJyGyyYfs+dvCfNYesJ0qQl8aOoa4PB6fvyUfC2foI5CG?=
 =?us-ascii?Q?d641KvM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?06GUZt0gZ64TM1JoPxNMGdO8FA2gc1EIu0X+5gr5z4XefHy4/lhzD/TbjPvk?=
 =?us-ascii?Q?NfkNBEfqlb41Bv1guei+GubUQpUpawYYs85RjL7AGR4cinr9V3oWX+XQrE8w?=
 =?us-ascii?Q?c+PW8hbsMzPVy+yjgxge5xCiqcAh8WDch+DM+EqfxmI2KZ09EZzwVqwo2rs7?=
 =?us-ascii?Q?o7uTvqAsIAIN9JItFnRjHV95F5DEScollPVZKlu+tsyfZ9IzeXpm5zVf3TrA?=
 =?us-ascii?Q?ByTOLCywYNPEXlet110wAHh4omscnfCVRSBvCUy3prF4VuQV+jGtR5qC/glU?=
 =?us-ascii?Q?6vhwJmJTL7xF0151tbTdZe8icOVsPXn4CJFoXB3R6JOXcHzQYI36bu49ph8L?=
 =?us-ascii?Q?52fQgxJWdO52a19lyE6wbVbHiQGmqVyO1sD65+SgX5hz0UhWlI1a4d04nxPm?=
 =?us-ascii?Q?2y8462WbRVA5oX76ffX3IePHLDY7VpRjdzDXQKuCjBgReWYyPMk3TPr7m+Sd?=
 =?us-ascii?Q?IuK0ZHk8vzYD70MxFVMfM2lHPWc5UJ0sXIQqvEXx0PZp2YA3WEV8ATHkEMvG?=
 =?us-ascii?Q?6aU5+oD536FnPAqBYPuVGdQapm/OWB5isyec1J+XoTSg2/S8Aiys80qewf8m?=
 =?us-ascii?Q?cT9qRXuE/jYOdQIlHIoxkbnro4ehJshw793iURAWilREvPF2NbX20yXR5YrY?=
 =?us-ascii?Q?Nmq78qQKbbDR8BYo42SOvmcrBmYq3dLCJaSADxP7ZnUMWT31tqOIywqvgv0B?=
 =?us-ascii?Q?sQh/+++XUySGCfxUgJwLR0L0SkoCHRorgrtGLYqrQjyGYPkT5ftPyMEtxPml?=
 =?us-ascii?Q?PwSMfIJVYMMMkAeGTUVdTBwPDDEMUHiDb/s5kMPzGx9PEm4fkDC6AiHEWXQ7?=
 =?us-ascii?Q?1M8XtN6bPqEaRMYI16BE/Dau6wM8qH7LhH/j1VbownQPlQh7/wo8jkPNR9AX?=
 =?us-ascii?Q?0QH253wYegdW7OcPLfXClCEV/qRxJ/p5f8jgwKfW69LHK1qb0Nb/AxuJGwtk?=
 =?us-ascii?Q?FoX3RWkKMZu8eZaHy44n7r4B/NefAMjoY53CrfzXakWm0He8jUiXSyqTbKpR?=
 =?us-ascii?Q?Qr13tHxW6le7GKai4Ei1IBvzgbsVVb7ZqEhs2aYKzDJwTiIemz7eu2mOoWeb?=
 =?us-ascii?Q?wedq2utSPFG40zF4d4lxJxfUrFii1I/UuyYavxRRp3D/nNGTuxXy4wbjz+Sb?=
 =?us-ascii?Q?d4No4JNnSmVSip46AEof1D8i1aUlxsL8R+E7Kfeo9R5V3UanEi8M6FAPcxIi?=
 =?us-ascii?Q?1GJa/+OQsLvQZoD5rk2DJKIcQGPda0FWRQLsWUFP4vR43MIP/RH+l2UsAHHj?=
 =?us-ascii?Q?tLPfcDvvupXRaU8Bacn6ruN1riUhCzEkf8pZxaADdrS1oCE2QUpo1XP61pAO?=
 =?us-ascii?Q?i2+MGVQVbPOTO4isxlyZsZ3ZWy9yFypVN6kuuJd9dwce+HlqiFP9RfNrBA3K?=
 =?us-ascii?Q?tsImBBnTd7e3yLeHqabQh2Kpf2vLbEFP/9M0WzQLdFtR31ZsQuoCa5PQO5y6?=
 =?us-ascii?Q?w00UXf7jEy+qYROLoidGjxyN82Y+MKIg710C7eqCHgPC+vVdlDNT2VjXXRzg?=
 =?us-ascii?Q?IZtG+F8twiLz5xfTzGA1Sw66OD8myTMtCtBhRaf8yVo/0n5aPLioz0Q/bD3E?=
 =?us-ascii?Q?HfzqonE5Y65rOedBT1YvhC9Xvj77TdKvV/ENa7b2B+02Z+SJioPRQfmjegwZ?=
 =?us-ascii?Q?Uw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a50b5e-6207-48dd-094e-08dcad327faf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2024 05:19:18.1730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VbuOaYlyYYj8tDSWBl3DSolPGnqReZT16cwV20MEEiB3QpJS5riNbV6Hcg7V6miJO0QLWOvHqeUqJFmVBUWmFBZbhioR0XCJj2lddPrvj3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5961

Hi Prabhakar,

Thanks for the patch.

> -----Original Message-----
> From: Prabhakar <prabhakar.csengg@gmail.com>
> Sent: Thursday, July 25, 2024 2:40 PM
> Subject: [PATCH 3/5] arm64: dts: renesas: r9a07g054(l1): Correct GICD and=
 GICR sizes
>=20
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> The RZ/V2L SoC is equipped with the GIC-600. The GICD + GICDA is 128kB, a=
nd the GICR is 128kB per
> CPU.
>=20
> Fixes: 7c2b8198f4f32 ("arm64: dts: renesas: Add initial DTSI for RZ/V2L S=
oC")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r9a07g054.dtsi   | 4 ++--
>  arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi | 5 +++++
>  2 files changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot=
/dts/renesas/r9a07g054.dtsi
> index 1de2e5f0917d..8a9b61bd759a 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
> @@ -1051,8 +1051,8 @@ gic: interrupt-controller@11900000 {
>  			#interrupt-cells =3D <3>;
>  			#address-cells =3D <0>;
>  			interrupt-controller;
> -			reg =3D <0x0 0x11900000 0 0x40000>,
> -			      <0x0 0x11940000 0 0x60000>;
> +			reg =3D <0x0 0x11900000 0 0x20000>,

Can we update GIC-600 in[1]  based on [2] to avoid ABI breakage
in future?

IIC, As per [2], this patch series removes section GICT(GIC trace and debug=
 page)
and GICP(GIC PMU) and [1] does not mention first reg is for GICD + GICA.
However, it mentions, it is for GICD.

reg:
    description: |
      Specifies base physical address(s) and size of the GIC
      registers, in the following order:
      - GIC Distributor interface (GICD)
      - GIC Redistributors (GICR), one range per redistributor region
      - GIC CPU interface (GICC)
      - GIC Hypervisor interface (GICH)
      - GIC Virtual CPU interface (GICV)

[1] https://elixir.bootlin.com/linux/v6.10.1/source/Documentation/devicetre=
e/bindings/interrupt-controller/arm,gic-v3.yaml

[2] https://developer.arm.com/documentation/100336/0106/programmer-s-model/=
the-gic-600-registers/register-map-pages?lang=3Den


Cheers,
Biju


> +			      <0x0 0x11940000 0 0x40000>;
>  			interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
>  		};
>=20
> diff --git a/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> b/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> index d85a6ac0f024..5c0f6c5d165e 100644
> --- a/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
> @@ -16,3 +16,8 @@ cpus {
>  		/delete-node/ cpu@100;
>  	};
>  };
> +
> +&gic {
> +	reg =3D <0x0 0x11900000 0 0x20000>,
> +	      <0x0 0x11940000 0 0x20000>;
> +};
> --
> 2.34.1


