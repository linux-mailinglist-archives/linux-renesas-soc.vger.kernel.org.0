Return-Path: <linux-renesas-soc+bounces-18682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD7DAE6FCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 21:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CF303A5217
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CEE2E8885;
	Tue, 24 Jun 2025 19:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EXMfVgaV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE21324169B;
	Tue, 24 Jun 2025 19:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793845; cv=fail; b=pjdFUG9etejJSDF0GDeyfGrfYisq6fWnR3PLkKVH+ewRTCjxxbvTKrZ2v60bVw7c3NzQqc0wBV5Ta9Za7ic/YkgL3pnLmf/ADutn2FiC9NuUpI9yIOQJmfjzPx4BFQkbDEtvR5jVt+4k2bTGPmCSA9D/4GCKB8yx5mTBNVkg7rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793845; c=relaxed/simple;
	bh=QRh2UPyNuwZuWSWdmPQb+xQTgaIc/BgR3tsQHOcpZTs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Q7qc0FU18osbxPIC9b6wTQlj230c/YcF2Dp2BVS17XdPEVCajj2HUr7SKMeRMbhGyWyTyvVm76hpIGiDXerBffp8MoGBQmx1N1W/Q4dp2n0rYF47VRoCPWqB8RqyuUSkE6bK4aMtWzHytkX3SMBda6vRxUYrUrGIRmK0sDx9XHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EXMfVgaV; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hs9s2IyWrloG415DIZCgwHtVPVxDevd3rEbpxrwtob966EZ7mboLm8WhmCX9vGqgo9tpySEMipNBMm6Ng624YyanpRJXMeUqFdVTr67nEbBliZW8AWNnx3hCTmyfbJ5IiIBxEZveYhFyTeznKniRkipAmoGnYcaeTjPcouHXb97wxACvtAA28R3aRkS7i5i5ArkoMJn2kipv0d3SRSJKzPoO3ty0AkMM2AHp17rr/+ekFzz96hE4ncnY7N36E9mrN4fQ53gWrwamqgvobvC1eAgbA5lzYU8zOWNykVEYT4m/2MuyNCuLyo39Sd9Rx410I+5TFTmTkWNdJ5otMtoKQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kO8ACJevs++uy5et9clh9p/S8P4AuiQrxtGyaUQnEFg=;
 b=s+cYCXCYXdTTU5TBLI7FCrggAiEx2WeQiLyYAe801YaVlrXPMZv59zy5Y2brJgxN5QixyMxr9/UoQtpH710mLlQhIIPA2i1qbD2ELcGrjcga97OlbsmGQscVgd8v4qR0YwrOFbcVwsw3nDbNRxmzynnZDdY8ZohFS5V9SrbZwFPf2hwpns/b6dZfyum7WcRIG+sehdKwTHTUhn4qZcWF9+rjngPIZGgnJM8hiJm8HTGco9hLJAuZCxHGyGUJiA8nGyj6nkKXpMUothWcs8fZoqTnXSL5QyW8DhEvZE46IsMwX7vgJkP7S0+gi86QUJhuS44CqYamJF1th5kEezAo/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kO8ACJevs++uy5et9clh9p/S8P4AuiQrxtGyaUQnEFg=;
 b=EXMfVgaVVYLFOjTz5M8pYMukzeEW5g+L0ibs5ehQllxTjmCM4z+92hjCpSwCa94uVVfk5IdgYI0ds2kog9NhZR6IC1ySN5wLYAi9QjCFJc73gUAsbodFuO3nqJ08GDJ5V/kFWHRPQJKIfpCmhlO/AoyqjwIqut+STmmxaAmMfFY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13347.jpnprd01.prod.outlook.com (2603:1096:604:330::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 19:37:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 19:37:11 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH 1/6] clk: renesas: r9a09g057: Add entries for the RSPIs
Thread-Topic: [PATCH 1/6] clk: renesas: r9a09g057: Add entries for the RSPIs
Thread-Index: AQHb5T1ysgp76SccXEie1Pa8TYBnfrQSs+BA
Date: Tue, 24 Jun 2025 19:37:11 +0000
Message-ID:
 <TY3PR01MB113467AD1F96F3AAC6F941A2C8678A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250624192304.338979-1-fabrizio.castro.jz@renesas.com>
 <20250624192304.338979-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20250624192304.338979-2-fabrizio.castro.jz@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13347:EE_
x-ms-office365-filtering-correlation-id: 29d45b44-b64e-42f2-231b-08ddb35683ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6NjXD2B0bUu4BYK6JyZAnw1weSakCWOmaP9HezzfzcWLpWSlqTg0jv6ebOI9?=
 =?us-ascii?Q?XbiV8xsS1I9wMkK1vzk1AbClnxSZT2sY6QXaScV7IzHGmUECwCmQcDR+M9Ov?=
 =?us-ascii?Q?RSi5huRvrYhql0BlEAJfv6hAV5ZDWcIJPEmGlW8htiRhF98pUPAJ2h+d830r?=
 =?us-ascii?Q?30s0ub1exWl9TYrY9vapVpQ7x7Q8ecMhWH4kamxaO3uZvDgKxTbRdPc49PUx?=
 =?us-ascii?Q?mp7TeSuZRwA+P6/qzw3otSfCoRMycTQo3kXhjzjzmcdgcoJLKIe6K8cyZSPK?=
 =?us-ascii?Q?OzHPaedZKcIzbSQqnso8JEi0VqhWNhg/8OtpqAS6w+1wFDQH3wDMb8ygIRit?=
 =?us-ascii?Q?OXQqHohHjZIuCEjEfYI7RsnsaeTvNbhKAEJL6WSH2035mfhl2LQFmUAvaWNY?=
 =?us-ascii?Q?xY+2eLH9E2eZMC9NeKzB9WpimdTGijr3JXNnsbueoGB4B9+2scfTWuNakYPX?=
 =?us-ascii?Q?J7i/W05U5v8mcdkBoCAUmvwOIOStiB0hNf8VrgRKG1l9ksZ9/QSJ/rrjfjE2?=
 =?us-ascii?Q?Kjx3XpZzuOgQ+tghoezUmW+2JdbRhQXzAwEJW4e8JxeH2AzVi41l11m1+vSQ?=
 =?us-ascii?Q?0yLhl68R+YqVMk1Nu4pQgNcfKYKL0p2W+5HkM7MP/LCm5T7p8cYIYyOYoE/E?=
 =?us-ascii?Q?fH0lr8XrfuX7nPJJwEJGm/19ekz76TXf87TLlv3dUEcxT7l8hTP64JX5RYRO?=
 =?us-ascii?Q?Z7NJFmFYwDrgknmNSFjoY7qJMUgeOCk/BaIggW3Ujg5/VjDm/5q4l/47DXVz?=
 =?us-ascii?Q?R5bAy65uL1ydL4Gk5IQK+oMMtJw1XE6qi++ELHhc6LZ/dXkdVZ8LslvsC7we?=
 =?us-ascii?Q?VEPdzAUOQ1D/ixAEqe/vpE/n/8TkbriZ9G8QQhcmJKRHvy9NdFuTjCBhIW4S?=
 =?us-ascii?Q?6eVlmKutTT4O827m6DQ6x9HzZN0VUbeBjnzVi+TfA45MPNntmzg+n72npkZK?=
 =?us-ascii?Q?J0ZGmBYTPem9EX5NjYYkGfkzvHu2e8gNe4j42i5pAJvkXm4WWBQWhAc5fqtX?=
 =?us-ascii?Q?XbcQU8ko0UexCwx7wETjoZHD0xJ7+4eVFJ7WGz//OnkLDkp5r3tTU+KvWpE2?=
 =?us-ascii?Q?5qXhKdADMP5X/Jn+gsgPUGg9EWwDUTTA7Z2vcMvT4a6CKDFMmmxobahvxnOu?=
 =?us-ascii?Q?lh3g3pi0KjxNBxq3XZySOH8WGD/7iPJK4SEbOFdO6tLLSqu+AYsTgZwx+QLH?=
 =?us-ascii?Q?Qrbyl1PW4/cIup6IBut2H5spdkbS1mohzJ5XO0M3I0ukJXEdfP3qp9omz50K?=
 =?us-ascii?Q?Yjb+fWvXdzBb0ezSvracEPOmjynsicpAEy0cG73x8N75QmFsznoCBtPiTMmP?=
 =?us-ascii?Q?KMFyd1pjjWUAyRDXK40+iOWLdsAVjC2zc7j1AO6RZx9s6Xy+7GBKVWunH7J+?=
 =?us-ascii?Q?BtlnUrxnm7MQPVSqTF0aqaZsA/cvNo35AW8fWMNVXLmdEg/wAMgcOtmVDptP?=
 =?us-ascii?Q?yFPrSJ9G72rTpnCshXaf/LU628sa2uTxBdu9s328HIAtC4QZxLSBA5ZoBFDw?=
 =?us-ascii?Q?KSh8TDcE4WO9Cjo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?qlfQXYnI43y9diG2dAPNBB9mPQR+AAQjwI7boQDxwZVRtieJy9ncvSe2I1um?=
 =?us-ascii?Q?9zGjwoMm+9HKTw+GXlCCj7sDxx9lNII0YZjUpRP1ZoydxEyLMoV1pHp7I6lr?=
 =?us-ascii?Q?x9e+xobIPCLWBO48c2O4d/4mg6C9RYpnKXYgTHKtVzsukMP0oCmCCXoEBI0O?=
 =?us-ascii?Q?5+uYXZOSHenVd1X7210J4Ho/Tnce/xIYujv6K+YTQ4Cd7n/NlZsj0cisjB9X?=
 =?us-ascii?Q?uMusPAXIZsjuTqrT6LZ/9Py9bkEvqyvIXoPkoBdcV4FZ4euPVIA1/o5AFpPr?=
 =?us-ascii?Q?v1O/He1cTHlCLj3WXQVBrABScXHQPRFmI3CCKG+RL8q+wJDS35VuaOnoWhp2?=
 =?us-ascii?Q?E4vW2cmAN7IYdilNqw72kI/toFkkjcx5OVv8aBQR5zIqeWaOQ4KjJH4wRQiG?=
 =?us-ascii?Q?pkKamrf6G3kP08WWHWPRD+6NnHm8OYdvw+O76Gvr0Gduze4Swwi+Adzd9TDm?=
 =?us-ascii?Q?uHht9RfckRWjRmXas2bTky/irU0I8t90I75Ojb1u1pZLdp3R8mjijWWSWh39?=
 =?us-ascii?Q?PxR1RatV9/Ii5XvQhmRXKMz82gXT27XkJKNRyA4rU0Y7zsRly3pDpQ9iqbWo?=
 =?us-ascii?Q?JU7IQw39WlO/ti7Udbfb2EEBgval/9wQHUMQoZpOdUxaSkJul8/+T66/SUqW?=
 =?us-ascii?Q?61QGPECX76sDdYqIc/KJ50wIg8+97U3J8Azr5jCGdpbI1y8IrXg2Cf6DUkit?=
 =?us-ascii?Q?SnW+Hvw2o89xuqOzabgk8QvdIa2YY7q9KPG5Wkf3kF+iSuUHtThtYzeKR+NL?=
 =?us-ascii?Q?mBqzvLbA//uZ2repz/+xSFTmIKlyFvZBBtT9lBlTRmE1X4HPTXkLqo1mWp3n?=
 =?us-ascii?Q?OVppnYDchRcQpVV9YxHPHe5SuQDAOUOQg28oMuXVrMSYQeQ5OJ1yPcTf3/G2?=
 =?us-ascii?Q?oQm49sWhKN5b7UVxzPb68iOpZ6UV5o75L9DGxofT6WxnFBmNl58Ic0+v4DJt?=
 =?us-ascii?Q?tBkjMJdNPlaBhbUpDh2QxCBXK+AYz/0BE81oiCn/i4+GRkv6s/Fg2Ls5wd6u?=
 =?us-ascii?Q?jjfm9FVJuDQVQD+NrKBSp4wtxepfO1r4n3pKLgYrI0gqRuQpvbfPeFdfnD5d?=
 =?us-ascii?Q?UPOC8dKQRptIqIejRnw225QI8x2HPJ/Awy9BhLYueH2Jc0o4+eXLAHOzhKbJ?=
 =?us-ascii?Q?V+kzOpTUO9RhWdrga16kLCZBkCunP4mD+iznB8p613XVwZH30tn78UkVWZ1z?=
 =?us-ascii?Q?M36/UlZReBparczOnRcX7P3sCLr6LFUS26qzDr0YuJbdj5/4fTp40p+BFQBZ?=
 =?us-ascii?Q?/Kf3V8B0H2fbNbM3eVy7eOAolaUO0klyoJwRAhn4SROo7fczmefUoy376cnR?=
 =?us-ascii?Q?h9W/YW49uq/EDlbNEPf2b6upNbz+adRPeFj1tMjoYGa8ez9QF1BVZAMLJ+2b?=
 =?us-ascii?Q?uVQvQHlkCTbmKHyzL10m9/c+n5mnoytIGYyCbk92Z5KOmFJUyH+2HsH8I81X?=
 =?us-ascii?Q?f7T1CGqzVvBVGRnd8aAVXMBMXtTXZDGSCIvkIVbgeMQ3/4FToinGniBFp0xz?=
 =?us-ascii?Q?V/nz91Mkgo0B6DbGmyhV8jR62HjE0XoAgWHReoT4HYFGEo3O13qqQLzYssqR?=
 =?us-ascii?Q?Xi376yr3UsDAQNRIn9qGCPv/g4dyEHvRxEkvu37O?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d45b44-b64e-42f2-231b-08ddb35683ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 19:37:11.8011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4BVGpGBcPDY3RJONJ81mkZaYJ8tORh3eOK3exZ2u1C+Nk3vw1oJcq9Tx90gA5wP73QtPHsAix1TKbJWlPyZ2PmF28LCwntLTq88SlK6Ifhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13347

Hi Fabrizio,

Thanks for the patch.

> -----Original Message-----
> From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Sent: 24 June 2025 20:23
> Subject: [PATCH 1/6] clk: renesas: r9a09g057: Add entries for the RSPIs
>=20
> Add clock and reset entries for the Renesas RZ/V2H(P) RSPI IPs.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>


Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  drivers/clk/renesas/r9a09g057-cpg.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9=
a09g057-cpg.c
> index da908e820950..f39bd2e78312 100644
> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -217,6 +217,24 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks=
[] __initconst =3D {
>  						BUS_MSTOP(5, BIT(13))),
>  	DEF_MOD("wdt_3_clk_loco",		CLK_QEXTAL, 5, 2, 2, 18,
>  						BUS_MSTOP(5, BIT(13))),
> +	DEF_MOD("rspi_0_pclk",			CLK_PLLCLN_DIV8, 5, 4, 2, 20,
> +						BUS_MSTOP(11, BIT(0))),
> +	DEF_MOD("rspi_0_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 5, 2, 21,
> +						BUS_MSTOP(11, BIT(0))),
> +	DEF_MOD("rspi_0_tclk",			CLK_PLLCLN_DIV8, 5, 6, 2, 22,
> +						BUS_MSTOP(11, BIT(0))),
> +	DEF_MOD("rspi_1_pclk",			CLK_PLLCLN_DIV8, 5, 7, 2, 23,
> +						BUS_MSTOP(11, BIT(1))),
> +	DEF_MOD("rspi_1_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 8, 2, 24,
> +						BUS_MSTOP(11, BIT(1))),
> +	DEF_MOD("rspi_1_tclk",			CLK_PLLCLN_DIV8, 5, 9, 2, 25,
> +						BUS_MSTOP(11, BIT(1))),
> +	DEF_MOD("rspi_2_pclk",			CLK_PLLCLN_DIV8, 5, 10, 2, 26,
> +						BUS_MSTOP(11, BIT(2))),
> +	DEF_MOD("rspi_2_pclk_sfr",		CLK_PLLCLN_DIV8, 5, 11, 2, 27,
> +						BUS_MSTOP(11, BIT(2))),
> +	DEF_MOD("rspi_2_tclk",			CLK_PLLCLN_DIV8, 5, 12, 2, 28,
> +						BUS_MSTOP(11, BIT(2))),
>  	DEF_MOD("scif_0_clk_pck",		CLK_PLLCM33_DIV16, 8, 15, 4, 15,
>  						BUS_MSTOP(3, BIT(14))),
>  	DEF_MOD("riic_8_ckm",			CLK_PLLCM33_DIV16, 9, 3, 4, 19,
> @@ -349,6 +367,12 @@ static const struct rzv2h_reset r9a09g057_resets[] _=
_initconst =3D {
>  	DEF_RST(7, 6, 3, 7),		/* WDT_1_RESET */
>  	DEF_RST(7, 7, 3, 8),		/* WDT_2_RESET */
>  	DEF_RST(7, 8, 3, 9),		/* WDT_3_RESET */
> +	DEF_RST(7, 11, 3, 12),		/* RSPI_0_PRESETN */
> +	DEF_RST(7, 12, 3, 13),		/* RSPI_0_TRESETN */
> +	DEF_RST(7, 13, 3, 14),		/* RSPI_1_PRESETN */
> +	DEF_RST(7, 14, 3, 15),		/* RSPI_1_TRESETN */
> +	DEF_RST(7, 15, 3, 16),		/* RSPI_2_PRESETN */
> +	DEF_RST(8, 0, 3, 17),		/* RSPI_2_TRESETN */
>  	DEF_RST(9, 5, 4, 6),		/* SCIF_0_RST_SYSTEM_N */
>  	DEF_RST(9, 8, 4, 9),		/* RIIC_0_MRST */
>  	DEF_RST(9, 9, 4, 10),		/* RIIC_1_MRST */
> --
> 2.34.1


