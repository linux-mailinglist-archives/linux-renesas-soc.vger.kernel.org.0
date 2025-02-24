Return-Path: <linux-renesas-soc+bounces-13559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB06A41B93
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 11:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5E38171C73
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 10:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FDB257AF3;
	Mon, 24 Feb 2025 10:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VgxJjE+j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011018.outbound.protection.outlook.com [52.101.125.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E7124502C;
	Mon, 24 Feb 2025 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740394136; cv=fail; b=EW9/0Oke3n6iTckVBbks/l2alN6xwGcXuAsHu7YO1Vp2TP/ZGSyH46IX9IWUtYIdpodSlKFsBfdpOlC4E672dRsPqqg2+redKkkndbbquxMobx61v7nwQbtvxjVNXqBOWE1oe4lPZ07Rf6gB9na4redB3unNT2fED2ciSPKykLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740394136; c=relaxed/simple;
	bh=FsLXO3CJjK0j+j4ZYRVlbfIxQkpbdyW6Coaaxp79p0I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EuJGF5Pre2VoD5HY07UkFFKFaeUvbTienqQEMZS38QRuNfUHAdoDws0uqZujpcor1AgZaOTHVcqAjgRGFe+5T13yFrJ6WNs6R7LdTiHw5/MRK2aVNL5C8xK+6gliHgoXZfBN94WrY1jg1sYD3dHUdlbSpSLJG9QZc4Jz4X0gi54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VgxJjE+j; arc=fail smtp.client-ip=52.101.125.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BuyPMdpOAPWvLv9uF/SbEyAhAw7GX1e/bZphhtlNfhHUUsZz8f3GH3iQNQg53ZrlUKj0lc5pjjYYuYKl4W3FMif8jsi5unxcA7/4SDMI47lyqn+7ADLC0Ebc8B8Ncdt1XDSuSR8dphMNhVT3WeWpGl/v7g9800Uy9JGsuOCrRHap3K+3By3vch9WbOL/6qywN0dZbNB2CIemJPJX6+otWvUgpyhHaA5OdMw5dN7gZBbBTF7ImAoxbzBjbrgfsKY+lVwdSS5MhZE+ITT49zTJ2MSJj/ks+lg73EHcUD4W2CSFsaGCFobGX8D3nCHevEyhAnkY+xaVSKBRpQEvIfO+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pmSi6f7XMF3s8x9nc5AWySm5yshWOAVm6vnq/brX7sY=;
 b=Jf8Uep4Gj09seEabUIEKdEzTy7U9m80xil9J+HPtqfOnNoF/IBQB47tbs/56K2Gvf4UnjEW7cezDDXwMk/4vEHmG9ntPo30uf5QAOsr5IfBKh4AIZHUBdczVt58aJ0ILAnuf+1ma7aD7x5R6GRsqWa2may+FW5Gz+lZHdxmZBWfrb/fxyEFyw76jecveMe4+JzXsz/oV8LqOgb9XZ/rng/cllDnE5oYzwZj3urWjEP70c3+mNkHGUVgKoKDqY67R24S+Lyo5H8Stis/lSDOc5Or0dkx/smfYc0M2MTwCKc7U9Gtd1Q6RqrYy2HrbD2Mg5m6/LuW4tJLMdXDBXXVU2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pmSi6f7XMF3s8x9nc5AWySm5yshWOAVm6vnq/brX7sY=;
 b=VgxJjE+jhgAxm8/hdaGaf87TwT+1iwt0ZaQGM/tZLrjaQEppchv8JSDSmg0hveDbN8AQS/b3P9aFHVIKaHKF3adFWRqG/Ks1hRnvGPUNEdYcepFJ6kuIPXKAYX/MMqSXIYcwy3HDasELYsoqsFM56te0elJAYF+Q2g5Ih9zkdU0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB12868.jpnprd01.prod.outlook.com (2603:1096:405:15a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 10:48:47 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 10:48:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner
	<tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v5 00/12] Add Support for RZ/G3E ICU
Thread-Topic: [PATCH v5 00/12] Add Support for RZ/G3E ICU
Thread-Index: AQHbfT8H8+fmJsxiyUCs5uVi/kg0nbNWWHSA
Date: Mon, 24 Feb 2025 10:48:47 +0000
Message-ID:
 <TY3PR01MB11346EAE435572E11B276BE1C86C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB12868:EE_
x-ms-office365-filtering-correlation-id: 9e19baa0-d205-4836-ec19-08dd54c0d131
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?lNmqe1r2C4bXhHg7mzeTiLcj+xo2ZH93lzb8wFcnob80DKW3LuJzvBnLS1Ce?=
 =?us-ascii?Q?YGRQ3c03SCvYyKs1bjf1VmeFMeVyODBODs3aBs8TWeawNIIlV/JLVjITiSxP?=
 =?us-ascii?Q?RuizpSZA+3IKGyZQZEEa9Rxz/bnt2RjxzhUC9yaGxcCgNH/ixxxAfNCUJw9W?=
 =?us-ascii?Q?AYLbVpDiOia0ZrPxmrekGAWVVcvX3AOE8S/JDVcHEGmtopLLCKUkq8ekreyd?=
 =?us-ascii?Q?C1F7f9h9laO1P3ITOHqiuRUyqE/vrLCi/M6iD7nv6VwhpwaCt/H66bRd6LKE?=
 =?us-ascii?Q?PO9RCqRJurMK8h+b7P9hApfvA4P3uC6uaRArIaxNiCtUleRgtFsOoOxVh6JT?=
 =?us-ascii?Q?ZhC7O4IVhx4JWM01Mwn1WIrC5aK0b3oB7fEIW+6FueeN3feJ+18OdHNYBETM?=
 =?us-ascii?Q?hDGdeCy2OqBAYyyETqxwSMjHJGC0Oejv/LIyRcxJkTivmey8rcO0StAGmCJp?=
 =?us-ascii?Q?H8P0cHZQHw9soUyFY46ffRA6N9BiGuzQimXB8OMKIJMRTCmSwC8oc9ilMcH1?=
 =?us-ascii?Q?3nLXcNSwO3UmGF55UIv5DyLgnYSBKo5yfN5PyEIsTe7iTUeZMokwmz2rMwFB?=
 =?us-ascii?Q?AlO8ynIPcPb1iBise4+xXt1dK6hgzadYg9WZ70+c2CuXMwqZolSUTnfFQBl2?=
 =?us-ascii?Q?yiJiSytl7J0TWjN4wdBeY7nxkhmxOoyf+uSX+sqGNkXrI1XYmA9nz0NjNklL?=
 =?us-ascii?Q?78gi7IKVoPguvPc1KLrSfJzMplEz2W8CN+e1f1ZUP9SyYc0KAjrkoMKdao7u?=
 =?us-ascii?Q?EPS7FC0XF+Bt72OmRPOuMnEqHRTSxWJrOVlMgHH9qO77rNF6Gx9/ihNJB0/k?=
 =?us-ascii?Q?m6lEUegfNevPJvOPcO0O0DsyqluXP4HtohgT8QmU0ScCqpdcKMcpRvz9AFtP?=
 =?us-ascii?Q?CelbtwGdBVaRVhz0QqNtzkQXMU8H46OyD+xxkr49yQRkHHlCZ+4+qlrI8reH?=
 =?us-ascii?Q?3zNYTvm8Lotucoja5/SwkMMSRC8JibPrat/XZzrmaBl2JfyBulv1x0sNWGLs?=
 =?us-ascii?Q?hiuyz1mLqGtqXYujYJO7m64/2MnsYaCgU7o7lmFqMGIkT8r5GV/OtMj/cDhi?=
 =?us-ascii?Q?h1n4p8x9t9bCtaWirC0e8IjIhMRcCAw/CsGW8p0jOdYJHG+0Hd3UihYN3Cje?=
 =?us-ascii?Q?BoSl5UeY8HIpPPJqmn1CcZ7wYZtUUjIIETsRrsa9rKaetyvVI21HSiHhmdUl?=
 =?us-ascii?Q?XTWoPAq+oUOSsPHZNRM28pyn+qLHxYVYBWhS5QkbJxpLuxzK1MzwQFfIYdbA?=
 =?us-ascii?Q?92uOAkmDTWTotFEfo5ZHaOCmfANWkJ1Dh6C82qYl3eIfhu9Pjpqwn/Rhon25?=
 =?us-ascii?Q?TGTKRCgNpVTbs1AY2n7IfoKaRp0tHr6HsG7zjaWoZYXydsVwdUlsyum8lnrM?=
 =?us-ascii?Q?YodJXNxyb5nwBDKfoysHQ/CQg9s2k47beVlFx+ULbrNQ81aKt1VZMTc3SrDv?=
 =?us-ascii?Q?KjMtIsGIi7qxGQN2Hi3LHsPK3WcH09lI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MzzbHkrHOx2kIi6ijjsCohUUyGGNqRS1U4njLn27WH+MWRW2BMLjGUbwNbVr?=
 =?us-ascii?Q?7UW5cgsoHvEZHmB54q7tSP8fWGSCS19WJdT8k2/+SfOmFjF+oYmngcINNINv?=
 =?us-ascii?Q?q4hCklUpRisAZPxssC/6sYn1zkcN79ZiiDmH9apF7uIxi4w8DlGO2+5dKSMT?=
 =?us-ascii?Q?FuHACUR5ppvNEipp6K0p9wxJMK+31TnOs8ACV4F+9QjUQTVzWSAvleZBqT4Z?=
 =?us-ascii?Q?jrBRL/kThffeewYyt3wtJgsK0EnF1HBdUH6tIERCN/XWmKOWkd2JguFcmkTV?=
 =?us-ascii?Q?8OI8caDbW56X6odTX+WcBjS/JQRzwaYui78MVYftpweYM+4fn0kN6MdT14jM?=
 =?us-ascii?Q?IArfbJQbN73MJkjeP2ZvNbEli5zOO5zfhM3XLZ+OD6/qwSVuNmvuWwXpnUpz?=
 =?us-ascii?Q?k31ahBEUnyI2Rkd5rezoYKj9MjG+z2O84JpQE4hgGEfnuCmnGvjAEPFCTAUq?=
 =?us-ascii?Q?28Qfu7A50+gPkzm4qwOntfNA+Fe3hKZ5vqiLVRHuXVly8kn+sxUKW1+bp5eA?=
 =?us-ascii?Q?bsshxTnjSmrn7BILK6h8lanAeuZ2vNk7raxQbLCV7ZraJG2dTpctDXQBubgN?=
 =?us-ascii?Q?EVxfImX3V+WlPdJluBOCnG3lrBhGKQxLbwZgJRqMydBxh5nt6Faz3vUvT4bN?=
 =?us-ascii?Q?FTHNxZ4gOZ93mZQ0r/I4sdivsB//KxCSvVeSl0MXwPPPc8dJ0+J4/GcUw2G4?=
 =?us-ascii?Q?mvrgZSs1xvDJd7LYieWcRWpH3seiwxplj/Fpj5aDVn1txb1Bo3RAe4/CwS7J?=
 =?us-ascii?Q?PZRu6NQGt+ACiAtov1RjplOg84vieWUg62r2sfbkbk8duA4apRQx6uY4Ntcf?=
 =?us-ascii?Q?mqysw4KD1lAGZx94UuENr3uKwmf4D5MoB0Pb+ONHUDFUXuChu8Nsb4xFSttg?=
 =?us-ascii?Q?Nx66DqYbXjDK/ExVT4UsEypwWs8tRHVaihQB241Wjd2whugA+TXqW9QqwSdF?=
 =?us-ascii?Q?L8q4WB9c3CO4nBJF9RE4Slks02SoSJ1HCyEVgpZB/52bP1fuj3T+Qu72hJ4s?=
 =?us-ascii?Q?CozBP0zjUGfEFY6s3fA5q+ru+irf0bQyzqCxshV21DZ3YxPWRtiPIXd806rV?=
 =?us-ascii?Q?sn1GmijfOVpePFyBfPV9JIVmM/DfWoSjxmYeyinM4mZh6bC03Ypcd2kkW2DR?=
 =?us-ascii?Q?o7txY8dyXHMz1SB60M3qo6d8FL5/3caaY3hvK0lxWkiQZlNHo7a5kqhhO6ES?=
 =?us-ascii?Q?mlOPxboRtiQJb4QaubnyxfYVCGydL+iJxdTbNWdX7qFtCp9YyMDzrfwlR3Hd?=
 =?us-ascii?Q?hrnQRVBvCtesO4AqC6c3r3vkgTrxcaRSJK8QN+f0MTthOulMIVptUAf4ikOs?=
 =?us-ascii?Q?lhD0F4wxXx/+pzg+hkEJ/1LZJ7/JyowP8+DpSJ2MpHJmKR8gJbxdl48VnMO8?=
 =?us-ascii?Q?KNRYAl8WxMIIr1swPqz30rEl+J4UNlElXmOTLvfuqv+8PYU7zOeYWICYOVnl?=
 =?us-ascii?Q?RUhPrvZ9O+CnmkSQZJe8F6gnwRsew/C2I9t/PSeYBfvoGacHk4SUfRq7DuoV?=
 =?us-ascii?Q?qbZqYZjudtPZdSNkNfYbQWw44p1JXwEsIB9r98/qppyq7gL0gzIW5hSgSbgb?=
 =?us-ascii?Q?nJOk3BB9xhPAt6VdGknBT3RwYB9oUFGu1kiXmj9eqrB1Bq+Maz7gS9mp9om5?=
 =?us-ascii?Q?Yw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e19baa0-d205-4836-ec19-08dd54c0d131
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 10:48:47.6495
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MVnBMuM7ZvfVQVnWtZKBTfoLV1ps7o7g00nLkuj/bcLJIr7NNSawd8u40Wgg4MRg8RWXqSLqf5aqpOM5t2gayyvyEm4DZ8gOD6Zn18Yf6Y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12868

Hi Thomas,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: 12 February 2025 11:12
> Subject: [PATCH v5 00/12] Add Support for RZ/G3E ICU
>=20
> The ICU block on the RZ/G3E SoC is almost identical to the one found on t=
he RZ/V2H SoC, with the
> following differences:
>  - The TINT register base offset is 0x800 instead of zero.
>  - The number of supported GPIO interrupts for TINT selection is 141
>    instead of 86.
>  - The pin index and TINT selection index are not in the 1:1 map
>  - The number of TSSR registers is 16 instead of 8
>  - Each TSSR register can program 2 TINTs instead of 4 TINTs
>=20
> Add support for the RZ/G3E ICU driver.
>=20
> Note:
>   The SoC dtsi patch is dropped from series as it is queued for
>   renesas-devel.
>=20
> v4->v5:
>  * Collected tags from Geert.
>  * Added a new patch for fixing wrong variable usage in
>    rzv2h_tint_set_type().
>  * Shortened tssr calculation in rzv2h_tint_irq_endisable().
>  * Added tssr_shift_factor variable for optimizing the calculation
>    in rzv2h_tint_set_type().
>  * Dropped unnecessary parenthesis for calculating tssr in
>    rzv2h_tint_set_type().
> v3->v4:
>  * Updated typo in commit description register offset->register
>    base offset.
>  * Update typo 15->16 for the number of TSSR registers in RZ/G3E
>  * Collected tags.
>  * Fixed the typo varable->variable.
>  * Started using field_width to handle the SoC differences ad dropped the
>    variables tien, tssel_mask,tssel_shift and tssr_k.
>  * Dropped RZG3E_* macros from SoC dtsi.
> v2->v3:
>  * Added a new patch for cleanup using devm_add_action_or_reset() for
>    calling put_device() in error path of rzv2h_icu_init() to simplify
>    the code by using recently added devm_*helpers.
>  * Replaced 'goto put_dev' by 'return xxx' as put_dev() called by
>    devm_add_action_or_reset()
> v1->v2:
>  * Collected tags
>  * Split the simplification patch into two.
>  * Updated commit header and description for patch#4.
>  * Replaced devm_reset_control_get_optional_exclusive_deasserted()->
>    devm_reset_control_get_exclusive_deasserted().
>  * Moved simplification using devm_pm_runtime_enable() to patch#5.
>  * Aligned kernel doc, struct members and struct initializers in
>    a tabular fashion.
>  * Renamed the macro ICU_PB5_TINT->ICU_RZV2H_TSSEL_MAX_VAL.
>  * Replaced hexa decimal constant with ICU_RZV2H_TSSEL_MAX_VAL in struct
>    rzv2h_hw_params.
>  * Introduced ICU_RZG3E_{TSSEL_MAX_VAL,TINT_OFFSET} macros and used these
>    macros in struct rzv2h_hw_params rather than using the hex constants.
>=20
> Biju Das (12):
>   dt-bindings: interrupt-controller: renesas,rzv2h-icu: Document RZ/G3E
>     SoC
>   irqchip/renesas-rzv2h: Fix wrong variable usage in
>     rzv2h_tint_set_type()
>   irqchip/renesas-rzv2h: Drop irqchip from struct rzv2h_icu_priv
>   irqchip/renesas-rzv2h: Simplify rzv2h_icu_init()
>   irqchip/renesas-rzv2h: Use
>     devm_reset_control_get_exclusive_deasserted()
>   irqchip/renesas-rzv2h: Use devm_pm_runtime_enable()
>   irqchip/renesas-rzv2h: Add struct rzv2h_hw_info with t_offs variable
>   irqchip/renesas-rzv2h: Add max_tssel variable to struct rzv2h_hw_info
>   irqchip/renesas-rzv2h: Add field_width variable to struct
>     rzv2h_hw_info
>   irqchip/renesas-rzv2h: Drop TSSR_TIEN macro
>   irqchip/renesas-rzv2h: Drop macros ICU_TSSR_TSSEL_{MASK,PREP}
>   irqchip/renesas-rzv2h: Add RZ/G3E support
>=20
>  .../renesas,rzv2h-icu.yaml                    |   6 +-
>  drivers/irqchip/irq-renesas-rzv2h.c           | 189 ++++++++++++------
>  2 files changed, 133 insertions(+), 62 deletions(-)
>=20

Gentle ping. Should I rebase to [1] and resend.
Please let me know.

[1] https://lore.kernel.org/all/20250220150110.738619-5-fabrizio.castro.jz@=
renesas.com/

Cheers,
Biju

