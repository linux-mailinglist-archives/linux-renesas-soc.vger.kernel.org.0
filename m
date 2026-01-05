Return-Path: <linux-renesas-soc+bounces-26309-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EACDCF52E3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 19:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F267A3018F5D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 18:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1003322DC1;
	Mon,  5 Jan 2026 18:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hWOBfJUG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CD32FFFA5;
	Mon,  5 Jan 2026 18:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767636388; cv=fail; b=r8HKmCZ6hJHMPAz7tbVoNcc0bdxdTf8rvLnPwPsYltvdsqohA8HTHBhPBk6lveQs/XHM/FIBrlaDE2hZA3xOQelxWboS0xMgrrcjmQHIru2a5foRPxr7Ca4a3YyO3Q2F9jKNrtDliN2IYBst8aY+gUwq3zTA6Ex/H4GvBQ1NEoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767636388; c=relaxed/simple;
	bh=4XK+6EF7Ox7Ww0j6Nq1vZkZFZvDrSwCpj32qP5gltw4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vy5EiJK8Y2SCQbR2dtsI3UJcLf15dXMh2oZpY5L4rgBHkTJZHtEQNkGM0XLnws8q5Ut1KdKAaaxLJO+5dKjTINK8oc4wSSCRJm+REDF3NmQC6jcj36WVw3Jw0F7xWBmo0NfWz0R2Aj7DhGitn0Mvqdgi6sfj3mZMeApVq5yUBVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hWOBfJUG; arc=fail smtp.client-ip=40.107.74.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tD6jpO+rGC68BqzGXPWncz12Zl6NOClnZ7Jhw/suq/3kS4GQTlzX1d74588Hjr5NXq1rVGM/Civbn/eIAbykKrgJ2iTY9/BPusZ11+ycj8462HP9O3B9bgi8RLcyFQyVapbh2249knG/gvc3Vrz0sIpS936GX2HAMOouF4eI0VLfDL3OBMmUJwI3E4yUp/mTapp6Us3TCd9G4mwvWK4GfVrSLV6ByuFiEm6bO3oC9H23ze2D8hymnRSRrQ+/+UW0ByjGplmmEl1kLZeFRdG07YmKd61TtoXtBd5eb6FP9Jx6JFjlxpYgCbYgaghY8KO+tQM9FWlBOJXGgfpaX4ltgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3LcWsllV+mgOrtKktG0gko816OeurStZJuhI8LX1/g=;
 b=PFhsErravpZdQFOu+iRBNsHf0jaPeaz7cxWT01cfFegFE+yMDHq55MtsxHx1oTb1ppTFrKn9B02Gao2gr7NfgPkfmVvALAlGHsxzvRxaX2Is9BZohvwAC58i68hkupRbl4xIP1PgDh8LSYSqmNT9mEAC9jSY/xFAFFZfddE5z9FYLFt5+70m6G7QojfRvBRR/a7TksUM5wRJ32iqGyMDCQuoikcI5W9h+DjXIfgm2M+gBWnwAVyPiFSleycY21xEccuFbyjtIjST6xx0IKsmcDs1v46lFsgmNkdr1khWFqbmTtIPLSLPIGX2kPKVMBEMsEvsp91ZB41kR+Et3nsK1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3LcWsllV+mgOrtKktG0gko816OeurStZJuhI8LX1/g=;
 b=hWOBfJUGVpL2ZieoIjzATryGvuQnffHjkmzKZf4lBwYvnrH9hx9iU1Bzy2kbnoabl47XK4Qgdl3WjtnbNGKwvbo0HfM7hU3X4BKiO+vrvsA/qcrV8kvBuFje5oLJ/i9uvv47z51T6sfRilbLpe4aARu0hwGThbz6zu0f7OSxjBM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB10480.jpnprd01.prod.outlook.com (2603:1096:400:2f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 18:06:20 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 18:06:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Frank Li <Frank.li@nxp.com>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
CC: Tommaso Merciai <tomm.merciai@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	wsa+renesas <wsa+renesas@sang-engineering.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Thread-Topic: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store
 clocks in private data
Thread-Index: AQHcfjEd/HHAzFY+c0mlsn4qV6uoULVD0GoAgAAOSSA=
Date: Mon, 5 Jan 2026 18:06:19 +0000
Message-ID:
 <TY3PR01MB113466E129D0970F0E2541F7B8686A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <94d378e99ded450ba118813b35239f9a10a73daa.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
 <aVvw3pjhphnVv7g2@lizhi-Precision-Tower-5810>
In-Reply-To: <aVvw3pjhphnVv7g2@lizhi-Precision-Tower-5810>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB10480:EE_
x-ms-office365-filtering-correlation-id: 78c9fe08-7394-4013-0ef6-08de4c8520a5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?BYTiTmEhMMqj2di2VKVYSA8ri77BeY7p6b0UV9JSny00II8rjrkMvEZsgZdc?=
 =?us-ascii?Q?fiQmI+E2AXf6hIfBVFK2XIddh5RrVojBoAW118L39oahshKEPZYkleu4dL+/?=
 =?us-ascii?Q?IvSWcfn/OCR2QPgLsj6DVYknamaKaAbhuOhhMvPO8UlJSBkneGbNZrovn8ax?=
 =?us-ascii?Q?/lu+R7u5Tfno8NdXTgnrOvUzjoKYZShJdzbs8vwWaqOzp/nH2+TmXMFYZxI3?=
 =?us-ascii?Q?/LAV83egJuZZ349/DzxOiHRCQltiTsAc9cGpiI0g+EGA9Bf8pCP6dDsCfCh7?=
 =?us-ascii?Q?BzNvE/v8IjkW+M7gcoA4TUMqITFyeA3320/2JsJsDCyo89b6TIXccVTekk7M?=
 =?us-ascii?Q?qFEAo8qXX9cpEnKP5+U5D2RIdEutK6dElr9MPCC/O8V/shleGvduASg4n6Ko?=
 =?us-ascii?Q?D8PM4aUpcj78bU+3MI8MJLSkmqLex4Me8G9r3Y/jnkG/5YN9z6JqZlq3MFel?=
 =?us-ascii?Q?W4sqfTxn0zCjck/ZG9vzWuhioE8mHixePSilTfwWxvgMS1ZWi7itQN0bA7OX?=
 =?us-ascii?Q?JgjtTuF4F633LCLjZ3tD5TKiqeTaJ5TsKQpVIzLfSOCEzCF5gBK8l38ACHZ3?=
 =?us-ascii?Q?MvjCceenKbsy+2h+RO6+pV72Pt+46/gzBFNYqXmvHCSGltoriJeTXCGj+Q2p?=
 =?us-ascii?Q?MghgWnsiXcxcksmq+Z2FSgvad6+gbPcffx/HHxM4XO8Y+9dM7EmX+AtFoDxr?=
 =?us-ascii?Q?pB4Zq7oYHWLtyFiazEqNx4jlg1BM3lvqa4ltA7QkiRz0Ko7TRhnQ9/fF6NeW?=
 =?us-ascii?Q?Ur8Fvi+xmX4lRR+wD1YrAtlQMB8FbnR9IwQqGRNNEPE2W5RqXw++/kQgzs34?=
 =?us-ascii?Q?vRd6fgbv5kp75NmXw0gpxkUkJWGBWUkWYKHTuNEN8kvczgvEdAHcpPIoYPzK?=
 =?us-ascii?Q?NnnJEgdzfDqMHWt/dk1Zqzq/pUojT32F5MaUh6y0Z8vpdBLAy+JKDhlvhRY3?=
 =?us-ascii?Q?AWtxXgrX9MM3y3owcP2OZAD93H6TJff+Oc9H//36mvjJSpntPPYyKzw2jH3f?=
 =?us-ascii?Q?XlPE5WMfUmQkHBPs4NDtceSXcoV2W6FrfOx5LobY8djyAqDT8zJonUog5wEQ?=
 =?us-ascii?Q?EdZ6LZZWDi1PlhoiPHyckQtzhDYIBy5XwNmFbySD0SboJQQy2RGn2cxkJ/NP?=
 =?us-ascii?Q?59ySxg/JAuXUla/6hT4dfTQ8yZjv0FByKN/t9CtcSZsd3i70/je2z9C7G4T8?=
 =?us-ascii?Q?awRgwPp72Vajzi3hfwUIlEeqOFJ5FID4MeTnD252fsQoxV9cP81gazluy+aY?=
 =?us-ascii?Q?bZl0cBAg/0bC8UXiUsX1FjNk3uzIhvYJicXiJRP5vWrL0gNU105etFMIuRLm?=
 =?us-ascii?Q?ejWFO9QrAxToL7XIhrih3HO1BX0NJzb2iSEI0KrL7CQ2zfGq9m7hD3EQ2oFi?=
 =?us-ascii?Q?fcuC3jcGXjLJZtX/thue5+AMZ2RYIaW4ztB8buMDZQ6KEnjZQB6f462+4R1e?=
 =?us-ascii?Q?Chj4V7TQdWhcwuz22T3EcNXzQwTibF7Q5R3lMWMFkEHj6fEnenLUKQId36PZ?=
 =?us-ascii?Q?gkHuN/Fzo0P5x+GotyZowpPZWRV8fwbvCemB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8ilV/7+TbodA0Kx2D4413T4bOlxghmNojgvUe9iUIzRJ4anzcQIffZqpL1zv?=
 =?us-ascii?Q?6mXW8ralYh8Pb7ub44aYFkdSYSpllJ/0WCqJ3kfUPgqED5qGVhB7WmJDtf5w?=
 =?us-ascii?Q?o/lM6MtASlleAaUaIs6n4967/l2XpBz7M1kQ7Xzruv8IG4WB3IYhS2AwY8a+?=
 =?us-ascii?Q?aRJfX/o9XG2mWf4tFMji0caR/SrFtnph1fh28OdQGo4Q1sS8uWc5a46Uj+eN?=
 =?us-ascii?Q?jU3PpFTCRsnnpS/z1VcMCCQC5l827I8VnCDj7M2hpiS7O9fRjkA+J3KlmsNL?=
 =?us-ascii?Q?leLb/ECSqZ86HV8dIzLpg5BPORUpGNeu5/GABy7HMvO98o9alm1LAV8ghgDt?=
 =?us-ascii?Q?f38Wn/nd1uqcd9Xf8OKn2p60+5ZA+VvJM9xMnndPPjLuH1+Pw7iM+4PPtoD3?=
 =?us-ascii?Q?q1beEP/FhLaaQVxl1AyP+Nhidrs5coTfXSqBMN3EwCZQL1jWtG61b6wqZGh3?=
 =?us-ascii?Q?HTrtZS2njDTdBIxqwBeZ56jzRAbYKJ+7cBPLDqs4TAoSsyjruwhIAuezBHSd?=
 =?us-ascii?Q?JjlHdYriWP5NYpkYJNIyBpL925e7Nc+Ina9NUP4qF7TfzfzJ9VuWlEYlJWmv?=
 =?us-ascii?Q?GpOwisRKBzhb/1q7ullyOMNF7Ui4uBSKhIABi+Rf+wb32AeMAbwwxpoMZwx/?=
 =?us-ascii?Q?WN8a6FojE/00+lUnsZLYbzuAW0CKoDs8iVyS2fZcz8FWuLXhQ4QtuuGd7w5F?=
 =?us-ascii?Q?8EsgdsA/mcM0487HzObd5N7o10h4M+SuzCzkuqvfl2bT+d5Qn322iVPfGhuF?=
 =?us-ascii?Q?oetD8v7SH/KXAd7MRSWy/Xv6ntwLOkbIVFAFJzAtGNsnzJxd/GezqmeSi8Ek?=
 =?us-ascii?Q?2Cm4yeEB7e+1kpQ1Vpwc4SytXnZVOtgYr7o0GnnT3fztFSuMfTQHTlYH8qdH?=
 =?us-ascii?Q?XWKY/OamRyaJk8ZsLqlUpzKqNzUjcf87k5ZEu7u8UmqxOkZNN10IsUy+HyP6?=
 =?us-ascii?Q?AWYgWDbCiu1IXI2I0WA+M1FA7v3RA5ykMcicwOxCzDPjnFXTCmbqB8paNZ17?=
 =?us-ascii?Q?edu0i1JmZojabLMIh/vjcCPBEiakXx/0CoVbYNvmDwOv34vyn70KnF6h1ITV?=
 =?us-ascii?Q?zbhD0Zsuoypdr2cnkwSImAXxgsllgv0X56bEizRcWHGGAApZHrgw4mHTdsZO?=
 =?us-ascii?Q?B7EVWAfZQtrKNvU8kDBhRgybOdjhOGDZ35xMAN+pvM6q+2SZi0eiXWQkqC6U?=
 =?us-ascii?Q?xORexez1t/CGsdBRjqkiB+wpWZYxojKU9VrcVrw2XWPNbEtVc8udquYaZNg4?=
 =?us-ascii?Q?ZR6zTCBYc+nq0vVABoIdkNJS/fQKmRpXBjVvDd7FGSs90Jt9o7Lzop019458?=
 =?us-ascii?Q?oB8dwSYGYiDvPorbct599P1AuCjfubmk5AUDEov+RZdKYPNf/KwNFUi7CB0o?=
 =?us-ascii?Q?PdumyOzie/qomZAkX2oUJ8nBD9mb0z1mSR/ms5c4iIqE8c51NbPUKKTYxVoN?=
 =?us-ascii?Q?nNJt8i4ANcK2XSSiF5Z98U3dm5IJ26rxei0HooTQqRHFeyMdvqbezcH7m+l3?=
 =?us-ascii?Q?cK7ofamiZCtGkOakSPtEnbozTDWaC3lv/I6tRoMp4/yHDiV0XL+udjD6+MiY?=
 =?us-ascii?Q?/1CE+5YhGGnmnjGgfb/keUpwYssPlUdVtsTntK11QKtD07e/zbxuon51g74o?=
 =?us-ascii?Q?7HF7lFnelvagxV4vE8JWxTOMDWfAemJ4EwpCpMxcY7Nw97PqGcUt+dBiNDcW?=
 =?us-ascii?Q?0ptRigobAf7AXQdW5hnQ6bVzG3sBRViaHlUKdOQPlcMliwTBOg1bmP9IDGYr?=
 =?us-ascii?Q?A+pc0cQEeg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 78c9fe08-7394-4013-0ef6-08de4c8520a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 18:06:19.4743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7NgQnnXsh9cfnGgwg87xLekyazuI+0hHcLaJVT+UE7RXAu5VW++5sxB9MO52/IBJWCtp8ARCGsBhFslZvJXGflelRsO5Vnc/JXDpYsZV88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10480

Hi Frank Li,

> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: 05 January 2026 17:12
> Subject: Re: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and stor=
e clocks in private data
>=20
> On Mon, Jan 05, 2026 at 11:49:59AM +0100, Tommaso Merciai wrote:
> > Replace individual devm_clk_get_enabled() calls with the clk_bulk API
> > and store the clock handles in the driver's private data structure.
> >
> > All clocks required by the controller are now acquired and enabled
> > using devm_clk_bulk_get_all_enabled(), removing the need for per-SoC
> > clock handling and the renesas_i3c_config data.
> > The TCLK is accessed via a fixed index in the bulk clock array.
> >
> > Simplify the code and prepare the driver for upcoming suspend/resume
> > support.
> >
> > No functional change intended.
> >
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > ---
> > v3->v4:
> >  - Collected Biju Das tag.
> >
> > v2->v3:
> >  - Added define for TCLK index.
> >  - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
> >  - Improved commit body.
> >  - Dropped unnecessary static const char * const renesas_i3c_clks[].
> >  - Removed the need for per-SoC clock handling and the renesas_i3c_conf=
ig data.
> >
> > v1->v2:
> >  - New patch.
> >
> >  drivers/i3c/master/renesas-i3c.c | 43
> > ++++++++------------------------
> >  1 file changed, 11 insertions(+), 32 deletions(-)
> >
> > diff --git a/drivers/i3c/master/renesas-i3c.c
> > b/drivers/i3c/master/renesas-i3c.c
> > index 426a418f29b6..1b8f4be9ad67 100644
> > --- a/drivers/i3c/master/renesas-i3c.c
> > +++ b/drivers/i3c/master/renesas-i3c.c
> > @@ -198,6 +198,8 @@
> >  #define RENESAS_I3C_MAX_DEVS	8
> >  #define I2C_INIT_MSG		-1
> >
> > +#define RENESAS_I3C_TCLK_IDX	1
> > +
> >  enum i3c_internal_state {
> >  	I3C_INTERNAL_STATE_DISABLED,
> >  	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
> > @@ -259,7 +261,8 @@ struct renesas_i3c {
> >  	u8 addrs[RENESAS_I3C_MAX_DEVS];
> >  	struct renesas_i3c_xferqueue xferqueue;
> >  	void __iomem *regs;
> > -	struct clk *tclk;
> > +	struct clk_bulk_data *clks;
> > +	u8 num_clks;
> >  };
> >
> >  struct renesas_i3c_i2c_dev_data {
> > @@ -272,10 +275,6 @@ struct renesas_i3c_irq_desc {
> >  	const char *desc;
> >  };
> >
> > -struct renesas_i3c_config {
> > -	unsigned int has_pclkrw:1;
> > -};
> > -
> >  static inline void renesas_i3c_reg_update(void __iomem *reg, u32
> > mask, u32 val)  {
> >  	u32 data =3D readl(reg);
> > @@ -489,7 +488,7 @@ static int renesas_i3c_bus_init(struct i3c_master_c=
ontroller *m)
> >  	int od_high_ticks, od_low_ticks, i2c_total_ticks;
> >  	int ret;
> >
> > -	rate =3D clk_get_rate(i3c->tclk);
> > +	rate =3D clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
> >  	if (!rate)
> >  		return -EINVAL;
> >
> > @@ -1302,13 +1301,8 @@ static int renesas_i3c_probe(struct
> > platform_device *pdev)  {
> >  	struct renesas_i3c *i3c;
> >  	struct reset_control *reset;
> > -	struct clk *clk;
> > -	const struct renesas_i3c_config *config =3D of_device_get_match_data(=
&pdev->dev);
> >  	int ret, i;
> >
> > -	if (!config)
> > -		return -ENODATA;
> > -
> >  	i3c =3D devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
> >  	if (!i3c)
> >  		return -ENOMEM;
> > @@ -1317,19 +1311,11 @@ static int renesas_i3c_probe(struct platform_de=
vice *pdev)
> >  	if (IS_ERR(i3c->regs))
> >  		return PTR_ERR(i3c->regs);
> >
> > -	clk =3D devm_clk_get_enabled(&pdev->dev, "pclk");
> > -	if (IS_ERR(clk))
> > -		return PTR_ERR(clk);
> > -
> > -	if (config->has_pclkrw) {
> > -		clk =3D devm_clk_get_enabled(&pdev->dev, "pclkrw");
> > -		if (IS_ERR(clk))
> > -			return PTR_ERR(clk);
> > -	}
> > +	ret =3D devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
> > +	if (ret < 0)
> > +		return ret;
> >
> > -	i3c->tclk =3D devm_clk_get_enabled(&pdev->dev, "tclk");
> > -	if (IS_ERR(i3c->tclk))
> > -		return PTR_ERR(i3c->tclk);
> > +	i3c->num_clks =3D ret;
>=20
> Need check num_clks > RENESAS_I3C_TCLK_IDX to avoid outbound access at
> i3c->clks[RENESAS_I3C_TCLK_IDX].clk

I guess dt binding check validate this as well. Eg: a single clk defined
in the DT instead of minimum 2, will give DT warnings.

Do you expect additional check in C code as well?

Cheers,
Biju


> >
> >  	reset =3D devm_reset_control_get_optional_exclusive_deasserted(&pdev-=
>dev, "tresetn");
> >  	if (IS_ERR(reset))
> > @@ -1374,16 +1360,9 @@ static void renesas_i3c_remove(struct platform_d=
evice *pdev)
> >  	i3c_master_unregister(&i3c->base);
> >  }
> >
> > -static const struct renesas_i3c_config empty_i3c_config =3D { -};
> > -
> > -static const struct renesas_i3c_config r9a09g047_i3c_config =3D {
> > -	.has_pclkrw =3D 1,
> > -};
> > -
> >  static const struct of_device_id renesas_i3c_of_ids[] =3D {
> > -	{ .compatible =3D "renesas,r9a08g045-i3c", .data =3D &empty_i3c_confi=
g },
> > -	{ .compatible =3D "renesas,r9a09g047-i3c", .data =3D &r9a09g047_i3c_c=
onfig },
> > +	{ .compatible =3D "renesas,r9a08g045-i3c" },
> > +	{ .compatible =3D "renesas,r9a09g047-i3c" },
> >  	{ /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
> > --
> > 2.43.0
> >

