Return-Path: <linux-renesas-soc+bounces-11047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C129E7F8E
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2024 11:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40CAF188447C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Dec 2024 10:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE5513BC18;
	Sat,  7 Dec 2024 10:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LdKdO/DL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011010.outbound.protection.outlook.com [52.101.125.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D975ECF;
	Sat,  7 Dec 2024 10:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733567768; cv=fail; b=gSCayCPfD7guJiWZXXqKBgCh2VTl24rCJlM9JXSvDjm40PCqO91zMh79BVQBvTfWxYLedj4c1xJP3YYbauUzz+QIYntNuMey932X2ZYiXcx1HSss5qWbV7Jp6dl7ZFBY9ovwd217N1A7Bda31HEhrga/xtiKpdNW4+Ba+mO4MaE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733567768; c=relaxed/simple;
	bh=P1HFUGzhyavGD6n6km9uzTrapgChMweWbLy2Ia9NQYc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ShlgjJRmcTJqOnXEAugwmzvL6GgxEormJSm7B494xe5XqA3KmchCw4E3Mgt8N7tXh6XKhhDZK3X4kFz9gNukXyURXYMmRCgLS7D3DQ3RTR28VvdQSwTAjJf96E29Nm/3ALRssMJAXinFhw9XKLdMDuFcjrYcDWRAHmhy63nSMTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LdKdO/DL; arc=fail smtp.client-ip=52.101.125.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUQ7cvAT2a/uYTLvSDZM8/VVoz+rxYXH/2E17PGhqcJZkxCs45hrME1iUMidWcNvXdCUjP58TWj1tbzDnmhgL8rIo6f5TjP60ubYIuZfHvOvW3L33oP2cLTCWG5Yu3FOhcw//c55fyG1OZgKTnJmR43VNYvJ3Uf0t9f4S1rFrMfW1+yi32MI3Rv+5DZTr2ZZly6HrAixv1FNoZl6oniY5hGInADugZzlSecMohopxgcouAjGfR3QfpoET2NnA9x+xMoKUBiVq32zco3TNqsn/VpIy4ef4JaixIP0oG7PKE6pIi4YgTm3IUat0gExve2cUpJ9GB+etQSSEyQHoV+Rrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TkSnHg4tyPpav1wP8PMSmUVu5sobt08oYGkkZQy+2A=;
 b=PZp5CDWrfy131Y6Bf4lITaQjWm+vRMUyGBb2BNcyRvA40Hu1DF99BCefoaAgb63+NyePZZ7YY2+GKTEhOmbyAaMuFReqXNnUfCRcvBvGduHRR8HWON/DPowAYfSdiOeAGdYy5T/yAHvwgO4uFob1QBEeVFkv0+V5UAbTrkc6osK6a//plohtAlHUjlW3N70JuikoQQvS7Qh8M4gBdd/FDwkj9NAH+u60By+Sv/Ve43OCMKMlJN+TiHaclce2awftw3SP/bm/s83ZO5gFXaCh/vfOsWFBMXhI7ajuqwy75MNFnj6FgYT3AgOEEU+WajnOGOmxGJ66wHoFn3onANlnPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TkSnHg4tyPpav1wP8PMSmUVu5sobt08oYGkkZQy+2A=;
 b=LdKdO/DLv6+nmSatph0qXdh++hp0+D75ZAfmHJqrZ2AxPOd3S8wfTFihv8Ysv62GjsnhTPWtRTJRR1UQDIV3YhEOvWz0IcUrVcL/1aa0bP8u08gGgAQeLEB07nbEGnDtLlaciG2jUfDwtiJwcJzI5cBgonxy8beVuqn+qmzw5HY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB6770.jpnprd01.prod.outlook.com (2603:1096:400:b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Sat, 7 Dec
 2024 10:36:01 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8207.014; Sat, 7 Dec 2024
 10:36:01 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
CC: "john.madieu@gmail.com" <john.madieu@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, John Madieu
	<john.madieu.xa@bp.renesas.com>
Subject: RE: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
Thread-Topic: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
Thread-Index: AQHbSCWIFHpIWC8dxUe/1MWPUYJtFrLalhKw
Date: Sat, 7 Dec 2024 10:36:01 +0000
Message-ID:
 <TY3PR01MB1134653DFB1CEB5D81F357B1A86322@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
 <20241206212559.192705-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20241206212559.192705-4-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB6770:EE_
x-ms-office365-filtering-correlation-id: 30a42d1d-b656-4c8f-5e7d-08dd16aaf222
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?moId5SXP2Ps/paZ5aN+ac6quIf7CdiK/tIkRqdgvY5bRlI8lNzigi21o9f0c?=
 =?us-ascii?Q?4YAhnwM8t3ODbhOWJhM9EIYbILoNF9yY+xAG1FG+zQKmj2LKGedHBqrAUthW?=
 =?us-ascii?Q?xPuRL58c98s9A7zyEuuEeNe+jtJoV1HRyticEGkorF+wEqaxiKkMPC5BK7w6?=
 =?us-ascii?Q?XetUIerD+76wrRGVpfg+e88KNytwzj0nM9uj9jYdA+fx70uwxZspA3mKh9Qa?=
 =?us-ascii?Q?h9wTRpIfQNEWSE/lwpr/ARrdjy28YVrt7wuOWtUBlQPG0XrjBSU/jRTSi9xv?=
 =?us-ascii?Q?j8Gyqy7YMbZONTU29jb1o+NiKMb9aJKSASEZSTv22BW9SU5tMQNfcpYB42NF?=
 =?us-ascii?Q?dKzuSDYieqrNqeZhIxEb+eybN6RSUIOP6BobufAhHbnFcZofdks2BE0jLUQF?=
 =?us-ascii?Q?Wlvrt1lhMTc8QD1AhJVnSwOGRKoAzk/wmBahGsEDHMgcUyTMCPVIKVPwmwCF?=
 =?us-ascii?Q?9CciS5WlJyDwg7SuzpuIUNriAtiVP16sHpg3jTPwPkMIal4odNifH0KhS6YS?=
 =?us-ascii?Q?jeF8QFdVBZOZY3sYm+crXheYcvi9O2fNyjGMje/dPZ5QGJqXO6GgF823RcZF?=
 =?us-ascii?Q?xMiNG+IxeAkQhkihF91R6tyloOJz0GUfHZIGsP0WxvdWsk2AExdGpmNLIOL4?=
 =?us-ascii?Q?8angmWkRTUKBy5NIHOEzIKeHZoZpbGT/oJZcOn66mkAf1W+tTQxlwh6oxKWy?=
 =?us-ascii?Q?DcF06YZaqy1WmyWVsfOh1/YV/1BE+YlRAgi3DB/YpbFeK8+YOyHQIiJvWoOe?=
 =?us-ascii?Q?gSRwDcy21on4SCWB2aiSVrvfS6rnJea7qvaayibIaHpg5HAsfECcFr7pNw/N?=
 =?us-ascii?Q?eDCW7P0dVt025+I31Mgv9qklHP3KfM9BhN8d56Mi3822DcZc6z1DPIuKL1ma?=
 =?us-ascii?Q?jfhNGh9tWvFY7YbWjNg+CeUxJyNpXdpP+4kQU90gVVusZ1iwDK/yNULAFZmZ?=
 =?us-ascii?Q?HyoQHkzVo/0i6Trfwfa8pPGCbtKfrL3ty2C59J7RYa7GUm21m9joHQbWPU/k?=
 =?us-ascii?Q?2MHxKXmYPLY6AfY5Xr8196wjSmP87XJfa0moKJkNIcR9RVltnf8FnY/qQT2T?=
 =?us-ascii?Q?CpdTlRMfaXRvmPurkpF+pRFCIAtPRO3Xz/K0E8NyS0Zfgx8+7epH9EzrxKVU?=
 =?us-ascii?Q?S17Z0YHY20X9ed59U59Rm8r+rO3RFZehHn+sy6Wpoq80tJFnhwXlXBem6pZT?=
 =?us-ascii?Q?sUBHTrQceP2M6F6eBAUJvAYvtFkSFUQ4oAZUqF+htEWuiSv00Bnvra8MJl0X?=
 =?us-ascii?Q?sZ8SuK3X6aguoQ+w0GGWPeQo29bNOP29p9sEroeptMmPO3USwFkciekzCvGu?=
 =?us-ascii?Q?hxm9iQRfZ4Y/gdnWL2+jAuAD0W2Qb883ivltWn6HB4HR9B53sBxP+9q8ZcRk?=
 =?us-ascii?Q?RJwWdp0jc/L9XbATvgpD3ekN3lV03Dk4KpPWeWXyO1+9vpqzFQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2YLQfjfbtUNdSLlK0Qfbvw4HeS/KBY0Ky6aPwec5jPTrmb2AJ/tv8yC+LnU2?=
 =?us-ascii?Q?eTuaUCgzoj1iqqzjyEgSJq3XUzMIpS1MJABBi0ZnFYOx6vuQFCCS9Gcuotkj?=
 =?us-ascii?Q?x/jVGHh4/ioEnMbPOwa+Dip12YSrlmSvzZxK2Rc0KWl940Mcx3q4/Kx4TCwz?=
 =?us-ascii?Q?x0Sq/PNAXLKGXUtHUcnC33CVP7v/XA3iGuuqQQbCCtOw2Xd4xIceAaQQ86Kb?=
 =?us-ascii?Q?McaMu730uYTdEsaBuc2d2Dm88m6LWUYan7703K/QcpNylh23Y4dlxTFBp93i?=
 =?us-ascii?Q?2ai2f53mtZ/IuZcvLCUGMFahyWCLlgTQipaThN+ELFGTOCOfQWs8x6VT3Cnf?=
 =?us-ascii?Q?M0ZoRnQrr9NTsdnVDx1cQtD7lQlRqmNSS8eS/BTQqj7rrRi6OXze7jtt4KkD?=
 =?us-ascii?Q?CQgpAOPbCriAaR/rHKclJcdcF1MSSp+Ru2z/MDF2pIse6HabVQNdHVtgW0RF?=
 =?us-ascii?Q?Xpv/kj+4lXnuZ+6PmWR71tHQkzlXMbd2lrEgAtNlPCLeMvwUWzOrly0oBmkg?=
 =?us-ascii?Q?kIC8uFj9eMFg777fW+KUAGHoJAj5NBKK+DvcL4Z3+N3sUR7MhJvDQ97rMKpr?=
 =?us-ascii?Q?FauopvI/2n6O/xsVacJ8PdmRW7qLCpId5FZtVAPLTOoC6gjdmNJfIJ6uJyT/?=
 =?us-ascii?Q?sL1ZxkKd1jEz0UFQEZ5c6ynoc6+QtgYJK3H7fdslcrBxPooODRLdqRjFrLQj?=
 =?us-ascii?Q?iPMNMwPXzG5etu426bF6YYJuVt6z+kjiYbptX1+21/0fDwzwRFAwS3CC/004?=
 =?us-ascii?Q?JHn0Yip8UcPvlzEtsBkOeFvZYP8ISMDJwkg9tl2QI0Ib6JW6SXKtS492rEVI?=
 =?us-ascii?Q?3MalEIZqUbaySriKUiVlR/6ioGsDuRIMINwhloRiTZ73AhNFiDy/3Iz80giR?=
 =?us-ascii?Q?hQPaiSFY2n8dm3sXHY74kteZ9VWe6N3ZGuzusaNT9s3v8TrJ32stYkpLSCbP?=
 =?us-ascii?Q?sAXhb1IdvTjrY/xX3rBHoZ9CSEQdBqnWfnLUdKlNaZkZsgBulEX+3r7/lYZS?=
 =?us-ascii?Q?YO4tgCSNSecFjeD0nSueq73KcDf+EYSsGUiATfIPReOBdO/2oC6qJDbVVRyG?=
 =?us-ascii?Q?Gcq6v0T+X3ZZ3luqyNG6Ujpj6Cc5/sSa8VLbEAYEz5Lv6xHRNWgF3b8Tw5Qw?=
 =?us-ascii?Q?CJrvjNUC6UgAYBYr+6a9q2C0eGCYdFh18hzC1YDX6AFJOcvkAAXZWLMW2y4w?=
 =?us-ascii?Q?U41lcAtEDBK0zNL306nYin1rgzG7/g5hC4lVME9AaFWrNyW3asJpPXhRgd9x?=
 =?us-ascii?Q?VnVcoRpeQG+BLXPboKRf29PSMF9R5hiAmnWHu0XEQCbPzzU7dfOIe176T+95?=
 =?us-ascii?Q?qDIVSJQ5dP4uazOt1wa86NnnZjB1M+Jh4VjmCLwmKxfsixUqzqSoPX4YoPkb?=
 =?us-ascii?Q?3EMdcbIRIInpU7+l5xbKWEWOzEiYQUgQmWdRlOEkgFrAGDt5jVwzlR16V/2x?=
 =?us-ascii?Q?3uBafvrBye3lInPkLdA/D4oZNtK5xGf+OaqN9B+AfffUpnlalRtol8hJIOQf?=
 =?us-ascii?Q?mSTjDhtEHAZt1zElfzW1izV7KWhBVXeBhoHT/Y4wuKtB0NwdLa+Z1JgVf4ax?=
 =?us-ascii?Q?/A60WcZNNjAg2vdTCBsJdb8lZI+DmKsBLKZmw4GISrfZ1fgp2rre0U48UNju?=
 =?us-ascii?Q?lw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a42d1d-b656-4c8f-5e7d-08dd16aaf222
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2024 10:36:01.8967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3FOtvumRFRgoE7zjtjWBvbUJlFnjWr5IwYXWgcw2jSEbuP3gcj8tcpFkDbQB3nK9rAICeV6/em0TBFKA1zvqrKFRv+ukZfQVvdxktAcdOaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6770

Hi John,

Thanks for the patch.

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 06 December 2024 21:26
> Subject: [PATCH 3/5] soc: renesas: rz-sysc: Add support for RZ/G3E family
>=20
> Add SoC detection support for RZ/G3E SoC. Also add support for detecting =
the number of cores and
> ETHOS-U55 NPU and also detect PLL mismatch for SW settings other than 1.7=
GHz.
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>  drivers/soc/renesas/Kconfig          |  6 +++
>  drivers/soc/renesas/Makefile         |  1 +
>  drivers/soc/renesas/r9a09g047-sysc.c | 70 ++++++++++++++++++++++++++++
>  drivers/soc/renesas/rz-sysc.c        | 44 +++++++++++------
>  drivers/soc/renesas/rz-sysc.h        |  7 +++
>  5 files changed, 114 insertions(+), 14 deletions(-)  create mode 100644
> drivers/soc/renesas/r9a09g047-sysc.c
>=20
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig in=
dex
> a792a3e915fe..9e46b0ee6e80 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -348,6 +348,7 @@ config ARCH_R9A09G011
>=20
>  config ARCH_R9A09G047
>  	bool "ARM64 Platform support for RZ/G3E"
> +	select SYSC_R9A09G047
>  	help
>  	  This enables support for the Renesas RZ/G3E SoC variants.
>=20
> @@ -386,9 +387,14 @@ config RST_RCAR
>=20
>  config SYSC_RZ
>  	bool "System controller for RZ SoCs" if COMPILE_TEST
> +	depends on MFD_SYSCON
>=20
>  config SYSC_R9A08G045
>  	bool "Renesas RZ/G3S System controller support" if COMPILE_TEST
>  	select SYSC_RZ
>=20
> +config SYSC_R9A09G047
> +	bool "Renesas RZ/G3E System controller support" if COMPILE_TEST
> +	select SYSC_RZ
> +
>  endif # SOC_RENESAS
> diff --git a/drivers/soc/renesas/Makefile b/drivers/soc/renesas/Makefile =
index
> 8cd139b3dd0a..3256706112d9 100644
> --- a/drivers/soc/renesas/Makefile
> +++ b/drivers/soc/renesas/Makefile
> @@ -7,6 +7,7 @@ ifdef CONFIG_SMP
>  obj-$(CONFIG_ARCH_R9A06G032)	+=3D r9a06g032-smp.o
>  endif
>  obj-$(CONFIG_SYSC_R9A08G045)	+=3D r9a08g045-sysc.o
> +obj-$(CONFIG_SYSC_R9A09G047)	+=3D r9a09g047-sysc.o
>=20
>  # Family
>  obj-$(CONFIG_PWC_RZV2M)		+=3D pwc-rzv2m.o
> diff --git a/drivers/soc/renesas/r9a09g047-sysc.c b/drivers/soc/renesas/r=
9a09g047-sysc.c
> new file mode 100644
> index 000000000000..32bdab9f1774
> --- /dev/null
> +++ b/drivers/soc/renesas/r9a09g047-sysc.c
> @@ -0,0 +1,70 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/G3E System controller driver
> + *
> + * Copyright (C) 2024 Renesas Electronics Corp.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +
> +#include "rz-sysc.h"
> +
> +/* Register definitions */
> +#define SYS_LSI_DEVID	0x304
> +#define SYS_LSI_MODE	0x300
> +#define SYS_LSI_PRR	0x308
> +#define SYS_LSI_DEVID_REV	GENMASK(31, 28)
> +#define SYS_LSI_DEVID_SPECIFIC	GENMASK(27, 0)
> +#define SYS_LSI_PRR_CA55_DIS	BIT(8)
> +#define SYS_LSI_PRR_NPU_DIS	BIT(1)
> +/*
> + * BOOTPLLCA[1:0]
> + *	[0,0] =3D> 1.1GHZ
> + *	[0,1] =3D> 1.5GHZ
> + *	[1,0] =3D> 1.6GHZ
> + *	[1,1] =3D> 1.7GHZ
> + */
> +#define SYS_LSI_MODE_STAT_BOOTPLLCA55	GENMASK(12, 11)
> +#define SYS_LSI_MODE_CA55_1_7GHz	0x3
> +
> +static void rzg3e_extended_device_identification(struct device *dev,
> +				void __iomem *sysc_base,
> +				struct soc_device_attribute *soc_dev_attr) {
> +	u32 prr_val, mode_val;
> +	bool is_quad_core, npu_enabled;
> +
> +	prr_val =3D readl(sysc_base + SYS_LSI_PRR);
> +	mode_val =3D readl(sysc_base + SYS_LSI_MODE);
> +
> +	/* Check CPU and NPU configuration */
> +	is_quad_core =3D !(prr_val & SYS_LSI_PRR_CA55_DIS);
> +	npu_enabled =3D !(prr_val & SYS_LSI_PRR_NPU_DIS);
> +
> +	dev_info(dev, "Detected Renesas %s Core %s %s Rev %s  %s\n",
> +		 is_quad_core ? "Quad" : "Dual",
> +		 soc_dev_attr->family,
> +		 soc_dev_attr->soc_id,
> +		 soc_dev_attr->revision,
> +		 npu_enabled ? "with Ethos-U55" : "");
> +
> +	/* Check CA55 PLL configuration */
> +	if (FIELD_GET(SYS_LSI_MODE_STAT_BOOTPLLCA55, mode_val) !=3D SYS_LSI_MOD=
E_CA55_1_7GHz)
> +		dev_warn(dev, "CA55 PLL is not set to 1.7GHz\n"); }
> +
> +static const struct rz_sysc_soc_id_init_data rzg3e_sysc_soc_id_init_data=
 __initconst =3D {
> +	.family =3D "RZ/G3E",
> +	.id =3D 0x8679447,
> +	.offset =3D SYS_LSI_DEVID,
> +	.revision_mask =3D SYS_LSI_DEVID_REV,
> +	.specific_id_mask =3D SYS_LSI_DEVID_SPECIFIC,
> +	.extended_device_identification =3D
> +rzg3e_extended_device_identification,
> +};
> +
> +const struct rz_sysc_init_data rzg3e_sysc_init_data =3D {
> +	.soc_id_init_data =3D &rzg3e_sysc_soc_id_init_data, };
> diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.=
c index
> d34d295831b8..515eca249b6e 100644
> --- a/drivers/soc/renesas/rz-sysc.c
> +++ b/drivers/soc/renesas/rz-sysc.c
> @@ -231,7 +231,7 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, con=
st struct of_device_id *mat
>=20
>  	soc_id_start =3D strchr(match->compatible, ',') + 1;
>  	soc_id_end =3D strchr(match->compatible, '-');
> -	size =3D soc_id_end - soc_id_start;
> +	size =3D soc_id_end - soc_id_start + 1;
>  	if (size > 32)
>  		size =3D 32;
>  	strscpy(soc_id, soc_id_start, size);
> @@ -257,8 +257,16 @@ static int rz_sysc_soc_init(struct rz_sysc *sysc, co=
nst struct of_device_id *mat
>  		return -ENODEV;
>  	}
>=20
> -	dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n", soc_dev_attr->fa=
mily,
> -		 soc_dev_attr->soc_id, soc_dev_attr->revision);
> +	/* Try to call SoC-specific device identification */
> +	if (soc_data->extended_device_identification) {
> +		soc_data->extended_device_identification(sysc->dev, sysc->base,
> +							 soc_dev_attr);
> +	} else {
> +		dev_info(sysc->dev, "Detected Renesas %s %s Rev %s\n",
> +			 soc_dev_attr->family,
> +			 soc_dev_attr->soc_id,
> +			 soc_dev_attr->revision);
> +	}
>=20
>  	soc_dev =3D soc_device_register(soc_dev_attr);
>  	if (IS_ERR(soc_dev))
> @@ -283,6 +291,9 @@ static struct regmap_config rz_sysc_regmap =3D {  sta=
tic const struct of_device_id
> rz_sysc_match[] =3D {  #ifdef CONFIG_SYSC_R9A08G045
>  	{ .compatible =3D "renesas,r9a08g045-sysc", .data =3D &rzg3s_sysc_init_=
data },
> +#endif
> +#ifdef CONFIG_SYSC_R9A09G047
> +	{ .compatible =3D "renesas,r9a09g047-sys", .data =3D &rzg3e_sysc_init_d=
ata
> +},
>  #endif
>  	{ }
>  };
> @@ -315,20 +326,25 @@ static int rz_sysc_probe(struct platform_device *pd=
ev)
>  		return ret;
>=20
>  	data =3D match->data;
> -	if (!data->max_register_offset)
> -		return -EINVAL;
> +	if (data->signals_init_data) {
> +		if (!data->max_register_offset)
> +			return -EINVAL;

I assume you don't have any signal use case like RZ/G3S.
Can you please confirm is it correct for RZ/G3E?

Multiple drivers/devices accessing same register like USB PWRRDY register i=
n RZ/G3S? =20

Cheers,
Biju

