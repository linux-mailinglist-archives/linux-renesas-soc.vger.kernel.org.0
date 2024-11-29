Return-Path: <linux-renesas-soc+bounces-10767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E54B89DE8D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 15:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A117D281557
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Nov 2024 14:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F28D513AD03;
	Fri, 29 Nov 2024 14:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EOEchVkh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0874813AA35;
	Fri, 29 Nov 2024 14:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732891481; cv=fail; b=YihcVGbloD7KK9bizEZdtQY2UeX0XYpTCk/WLfQKaJk2Vw5PWpeoPkmtXNe7O097aXH+iKPS1IifYzc2wc7yruUA0POSPFOTATs+qQel/cviTIaKOZiSUTW5p5BIZz92atIy5nbIT1iL4/BzbLI9hAgSDKFwPpoTcE5U2T1LqgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732891481; c=relaxed/simple;
	bh=7d3o3pvrD/ossUolwfhECyVLAwZdtV6DiN5K8z1O9OI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=he+CwKDpp4HZijmkElyazM2iL/8VUg6jsv4MyGF2AyJN3Osf7BtekKtwIl9QczEk/9aGQEkNgdKnmDLxOynaeij39tAnIlcopdmVPKuugSZEU1P/HGd8erq/cnsU8OVIZLae7nY1ADnk6g+kCpKN7TidFL3I+gN1vq9rwib/ysI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EOEchVkh; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTa36q3x5jnRbH++Oo8DJUcd2E//lL/txfjY4MQnRzESoh311SiCalFm8zxkfXh7Ife6Wljug0Q1MYt5FUG7A87HSu5oxvNTOJgJE4xLBUQC5ud1xUUgX2Lz8v7qa5dGL0IYm/nXUFbbOEcV+3pWuClrxFSWIDg+9aLSmBl7O6iJ3YfiTDJboNenRvhycFlE2nYjHE6aaxgjKd2tThla/oMv+vOkSavf27FRI3rBAH1/Z2QOyzieesL5/jfMS4V9CDaPH+r0felRd2sWDPe6p/uEldrVOSbowwtcktbhjXntsDPLkIfgJcMp1iNfDGHtVIFbUiQ+jgR90u8aB7LOTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXICS5ovCVbjDDr1ulhlqZ0S6H+X2yKCjWRuHT9Has4=;
 b=hu4JqS7ikKdBtJZXns1G0haZEpUc9cVRNHrR3KEm1X+TjU/TbLjitxYtWaTKegLaehAz8cCU8vbqk0C9T7fFOhyfUock7oekRYONBtjNXJ5xcNj7PMs9r1mXsA/LnEURCz7F7Qtpi+7orCyE2iZjAR5Mpfq66bMKRbHwiNI0QHIbVD40XpOiFJ6Sl3s943XYFQ+L5jkMWwwczL/8Fl8eGTGMVieMTe6djv3haISmB8YYCGi/X/vtAYeJKDywiRvdrEddkoyBljl7FFy57cFEmbWrNnCsyw+434boZQKbPOsrqUwVpIuesbuRrt1o31+TjyvFrGZKicui2KdCZQyaHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXICS5ovCVbjDDr1ulhlqZ0S6H+X2yKCjWRuHT9Has4=;
 b=EOEchVkhZd7cbVn/PIQHJYmC1bNkeC4bxmHIbJHQCxaFmcO18uNufzeLCa/hHPWn4tUoeIf/9pyOdCG53R+FF+S6gP37JZuSlwy3z8xAzj/m2BtNNo2glsaQ1bdRG77ss3IPTaD9wiRZQKvqga4IxpPZzep71EPbckVBQbeThog=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB10330.jpnprd01.prod.outlook.com (2603:1096:400:24a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Fri, 29 Nov
 2024 14:44:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 14:44:31 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 04/12] dt-bindings: clock: renesas: Document RZ/G3E SoC
 CPG
Thread-Topic: [PATCH 04/12] dt-bindings: clock: renesas: Document RZ/G3E SoC
 CPG
Thread-Index: AQHbPNyPwnvP0dd5WEmP41dvvEol37LOX7kQ
Date: Fri, 29 Nov 2024 14:44:31 +0000
Message-ID:
 <TY3PR01MB113461CD9DE5FC325F34462B0862A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
 <20241122124558.149827-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241122124558.149827-5-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB10330:EE_
x-ms-office365-filtering-correlation-id: 136404af-cb19-480e-fef6-08dd108455c4
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?mHkkFp0tM4S2BD80zjta3BxnDTXQ8fkPuI1stC3dsHXvz7d8KxJnXCAORNgI?=
 =?us-ascii?Q?LRF2tNjj89Z8ctlBN1A5PUxN8/ChcrVEOz2gYvE8he/3Gacdq9tFTaHm5EVV?=
 =?us-ascii?Q?d1MbTprd72qM582jnoejpUUPCyyudYigTVLoe/B2/nyZWtnA2SQErIcppzI6?=
 =?us-ascii?Q?cIkr7li4/U2fB+2jkqkC8LfRVPgPY7TOLiWT66ASyjNDoP5MENxNspQtXTZx?=
 =?us-ascii?Q?NAo/SQ7CUk1BrXC8k626yLEim9iwGUV9n60CeaiZTsDW3Y/ACemR+ZN7pHdt?=
 =?us-ascii?Q?CPg4PsAYL7s1STLPmKnFakxOWFPIBCM8W6Cj02gcV977g4wq+T79XsebDTGS?=
 =?us-ascii?Q?4HKWB8F9ZUvhULprM4CJkxDhtmXOBeCdZusJTeeEtiBBcxOuB5t/qU2BpbFO?=
 =?us-ascii?Q?BhZD4FTaso+KoJuDxR8rHjEqXqzwfp3zBqsucZd8b5cjFMDn3fnkbzTYUnlU?=
 =?us-ascii?Q?hxnsRfYX1SBE5ZIpg8UIv5Kmd4yjlCP8ZKvERz4eUd3hinzAxfH0vCj94Wem?=
 =?us-ascii?Q?KyKfUQDjRJZeWhi8noU9tKQt7mAtxO2r5x85dnrud7KzglugdpVQH87hYajf?=
 =?us-ascii?Q?a52soT4mM58nWvhQ1gnZiGSQMyFHofBp0G8wnl6fj835Vlb8qbr+m2eCYW55?=
 =?us-ascii?Q?pYXkBOKS3OKX7bOmuTKVJm+u8VtJgoDWLdrNOHbjL+WqIiz3KP8m37zM58EH?=
 =?us-ascii?Q?/VMatFu7UCV8TddbLjkaW7ZGPYfK7paN0g6zJCKzaeIMHiZkGYa8FJmKOxXW?=
 =?us-ascii?Q?oZijQuBNY8L7ITlFQ5sj0Oh7b11VnC6f/pmuDBs6IYupoBr+ThfUkX/qz4+0?=
 =?us-ascii?Q?XJlwiYE6VyjjoaVHuR1V+5nLuXlSbkbsUKSkingh7MSn6iVWuC3s08zJHLYh?=
 =?us-ascii?Q?NbV8Q4jysUKZlx3+Qp+snF/4XxEyb0hV4paXWC9R2M2i+zPmRsreg2nMYQCN?=
 =?us-ascii?Q?SqcA3MqtpakA/xa9GAWavjIg49qahZ16RyIpXE8K/2f+NvpeYx9i+FjItuQE?=
 =?us-ascii?Q?M/nt4XH0ZEsetW2/FTAn21lPpCdqWu99zP6F860n+iYu5CXP6j0udFWT+sap?=
 =?us-ascii?Q?9dt8ewxT7GoCnShAkZoR3n+JvUic2DQLOj1X7z2SyzilrvuqIpzkzPHPAp1t?=
 =?us-ascii?Q?J6Ik4HXvNZlKhtnZCGfmYy6/yz3QYkuxKgU9eCevjOu7jGayb7E/Dl7pjMbe?=
 =?us-ascii?Q?ZzuZkrby8DRtthNvumWNhRi+LZxL+1cMay32LBuOKQk7oHWAnhILVtqcouIE?=
 =?us-ascii?Q?gAgyeu4dvHwVuQYeKci2OxTlDwMmHdILhtTdC2WkG1ego6p2ySxu5QYlCkMl?=
 =?us-ascii?Q?1/WQXe/z0hO2gPAlaagNrZy+R4noyctiBPrHzrIGCnl3GcO9Ny9nD3K1QBla?=
 =?us-ascii?Q?sdtYRKo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OWJ/vFqQjHbCc1fSA17GNFX4TJb25jLUvU1CY8vsEHEEpCunvoF9NyUsLcuR?=
 =?us-ascii?Q?Vd+ZZqLKkvAgwYxE81oALY5nMiYNWto+I3EsMEB8F2I5u65aCHCaexj4TLb+?=
 =?us-ascii?Q?5TZMRzBvPE+gFdWZggh7dhpqFqkLuyJwfEF/ddaOLfGOCep7cf47icM0JrMT?=
 =?us-ascii?Q?tZpuGDzJdWRdlxt8CONROYeN1Wa58qeEIIRrjkO5s/FCbog5jm6xFYEiMFj+?=
 =?us-ascii?Q?zBjz/Mj8UgDq+BAb9Q/WPd4p8cZhrf/n3cqQCdZUShalIqi0O+tyN4on61kB?=
 =?us-ascii?Q?bI1762LZO/vneohcEnfXWrnS6WgNcg40ngXCYIuFXO6qS3nSXD+qM4buLhTm?=
 =?us-ascii?Q?QFAm7+5a8rzNeheHsuHmskcSeMEQiGgTy4aAQKUuPd5J4izZXRfkDWTVbI2Q?=
 =?us-ascii?Q?I1tW+2fQ8awiD7wM2TE6BTVGDupIjpT2SDPzeXwpqmVngabZcN6SqrBAIVMs?=
 =?us-ascii?Q?6T1x5YkkJ4yP/PP6+/Wcw8y3fiQxBx24jWQZNdyZAeTa39SLb/j+cygtdvcR?=
 =?us-ascii?Q?bR8EwcUL9LeCEPYKZ5dAFURxanpvjWWKJC5zGywwpllnY1NGzpqg6urZQW3D?=
 =?us-ascii?Q?ODNgtvwJYMHmMpcsi0I6DQmOVcd30hQddxwIIqvqS/w7MQkJy6cnr4IJKDyk?=
 =?us-ascii?Q?fgahrW3bYYCydnGY7q4aKsW3WwJZSVchniSfYWYd77seX5B5hC/VOtnNxFao?=
 =?us-ascii?Q?RB5Zggsm6rBgLUu5eQ04faYNDvRNEyEFWI0TOyFD2zsCdPFKwAczV2l0UO6G?=
 =?us-ascii?Q?UdTYqdYRqMHOKUuDIBYZY3mjIUZN/AqPCVIWyZd13dHEvT5umlH17XNPS1GE?=
 =?us-ascii?Q?ytdxKowm49gT6X2wYqQ+xB/p+jQdwNaktnAbSO/6FTPOHzMRgdz8XwJedC9l?=
 =?us-ascii?Q?YyQEVqBw9rMdXz2cSURsIWVH9xMrnZBYVz1sHWGKwOPUeqJCodaBToil8QKf?=
 =?us-ascii?Q?O+sOFnFL8K7GuOCXv2kwOrkm4BtIp9+RsaUwqwM68jKcBlRU2cI8DFB6w9JH?=
 =?us-ascii?Q?JaX1i3kJNuJAoQ4W/2BwzmTANwQvubX4BLePU781Xqiq4QKNMkZLoTpBaB4E?=
 =?us-ascii?Q?WLEw8Q+TRFBZvVkkz4MIQPffC5zlfFO+Wzhr7J1Sgi6uJzkwkr6HtcrieBEr?=
 =?us-ascii?Q?q8gA5RZuza8VJCQu3mQ3qKpgpV7HQgjWZxjJAUMk4Xbf3u5RD88D4p3fs4Ux?=
 =?us-ascii?Q?IjMWfbxUtuGGTyAM2ZpFkeFVOVUZKCgFyprMM7/tZIXJERx3lQHAMdkZeU+T?=
 =?us-ascii?Q?UmjNKxrTv5czp493u4Ho+i+dGXSHvsVDieN6fZppLEw4+jzPHu0WfZeA0kzh?=
 =?us-ascii?Q?2915XSx/2mp1sWUXTHwYkE14JuqlxfQfUmYZN1CsYzMyhm0pPzL1uhmj5Yxr?=
 =?us-ascii?Q?Dl9V2ycqYON2rR4X0m5nmqm30wx6KEwHcGKkw+VQ4lzeTJDDcLAAy0PMQdc/?=
 =?us-ascii?Q?tRzqIXXJFMSvz+SiwvMJ4cQ7anQHCmeLnD6Ra3O/muEbRq3PpG3LMu9ftW3W?=
 =?us-ascii?Q?0Wf55OnKP3OvjeoEk6rloe0mBZNg4VVUge3CrsyKWSGcvsn5YLUChLLuK6lf?=
 =?us-ascii?Q?DvnkdPFV82Y7Y8942wvzrTPKx6pVd6+WFEM1hDZXs4nPcki0pvl6/fbjnukl?=
 =?us-ascii?Q?uA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 136404af-cb19-480e-fef6-08dd108455c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 14:44:31.6898
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EjQvlvzQbVyYIXwqAoT9HxE/gtBiUy8q69lYpRozMBhcEWR4Q/G4KI4YbvB11Un9GYQYpFwShGHzoDXmOrIT6NyV98LUTgW7utDzz7dBeec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10330

Hi Conor and Geert,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 22 November 2024 12:46
> Subject: [PATCH 04/12] dt-bindings: clock: renesas: Document RZ/G3E SoC C=
PG
>=20
> Document the device tree bindings for the Renesas RZ/G3E SoC Clock Pulse =
Generator (CPG).
>=20
> Also define constants for the core clocks of the RZ/G3E SoC.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../bindings/clock/renesas,rzv2h-cpg.yaml     | 15 +++++++------
>  .../dt-bindings/clock/renesas,r9a09g047-cpg.h | 21 +++++++++++++++++++
>  2 files changed, 30 insertions(+), 6 deletions(-)  create mode 100644 in=
clude/dt-
> bindings/clock/renesas,r9a09g047-cpg.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.ya=
ml
> b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> index 926c503bed1f..c3fe76abd549 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> @@ -4,19 +4,22 @@
>  $id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>=20
> -title: Renesas RZ/V2H(P) Clock Pulse Generator (CPG)
> +title: Renesas RZ/{G3E,V2H(P)} Clock Pulse Generator (CPG)
>=20
>  maintainers:
>    - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
>  description:
> -  On Renesas RZ/V2H(P) SoCs, the CPG (Clock Pulse Generator) handles gen=
eration
> -  and control of clock signals for the IP modules, generation and contro=
l of resets,
> -  and control over booting, low power consumption and power supply domai=
ns.
> +  On Renesas RZ/{G3E,V2H(P)} SoCs, the CPG (Clock Pulse Generator)
> + handles  generation and control of clock signals for the IP modules,
> + generation and  control of resets, and control over booting, low power
> + consumption and power  supply domains.
>=20
>  properties:
>    compatible:
> -    const: renesas,r9a09g057-cpg
> +    enum:
> +      - renesas,r9a09g047-cpg # RZ/G3E
> +      - renesas,r9a09g057-cpg # RZ/V2H
>=20
>    reg:
>      maxItems: 1
> @@ -37,7 +40,7 @@ properties:
>      description: |
>        - For CPG core clocks, the two clock specifier cells must be "CPG_=
CORE"
>          and a core clock reference, as defined in
> -        <dt-bindings/clock/renesas,r9a09g057-cpg.h>,
> +        <dt-bindings/clock/renesas,r9a09g0*-cpg.h>,
>        - For module clocks, the two clock specifier cells must be "CPG_MO=
D" and
>          a module number.  The module number is calculated as the CLKON r=
egister
>          offset index multiplied by 16, plus the actual bit in the regist=
er diff --git a/include/dt-
> bindings/clock/renesas,r9a09g047-cpg.h b/include/dt-bindings/clock/renesa=
s,r9a09g047-cpg.h
> new file mode 100644
> index 000000000000..5bcab7ca2bfc
> --- /dev/null
> +++ b/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G047_CPG_H__
> +#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G047_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* Core Clock list */
> +#define R9A09G047_SYS_0_PCLK			0
> +#define R9A09G047_CA55_0_CORE_CLK0		1
> +#define R9A09G047_CA55_0_CORE_CLK1		2
> +#define R9A09G047_CA55_0_CORE_CLK2		3
> +#define R9A09G047_CA55_0_CORE_CLK3		4

Typo here based on the based on "RZG3E_ClockList_rev1.0_na.xlsx"
CORE_CLK*-> CORECLK*

I will fix this while sending v2.

Cheers,
Biju

