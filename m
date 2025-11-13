Return-Path: <linux-renesas-soc+bounces-24536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ACAC5626C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 09:04:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 621ED3502AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 08:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13935331217;
	Thu, 13 Nov 2025 08:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ibqcml78"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010031.outbound.protection.outlook.com [52.101.229.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0132D30C36A;
	Thu, 13 Nov 2025 08:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763020897; cv=fail; b=DE3hhgAv6yr6336xoXGQp/o/+koKh9I+uDcmOufhXASt0d91j82ouN4TT35giG9Tv8RepbgIN1ccoDNu2Th9zVFlHTEZM/YN3CK3iknY4EYqIOfO4iRG+HLM4CXpiB9GdeQ9ag8sp5M3aR+pl+D026XgvdEQNAXyCj7bJLD0o8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763020897; c=relaxed/simple;
	bh=92jq3DHStvWd925s2qvAxIV+Fb3k7F8A8rDnsyOIAAY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G5ydgQDqiGMz7M3vU85LwU/926stoGN3hRslAF3sHJ1X81efeoMgEoV6TuWDx4ZTy0W16GnpsBawaKhWsGJOjQ7473PnQoJnMUbU+ONQbjisR4PdtYQWKzgWg3bwhnAecHiji2PRgbsWuCJ9+mafwgaaf6W+p9ouCw8tLPc3Lb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ibqcml78; arc=fail smtp.client-ip=52.101.229.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pB+LnEXc25WExK6y7qBCej8h03wRTysoH3ffidaLWkUYFiwjXecTlVv58bPwbhmyBJUhJECBiYcFxQi8ZyFwrtd4gwH0z4MYsFvIhefFIhaQtIhmX/xTFNtT24JGFoxeRodnodo6ol7jFvnYOgWgoBMPFvhTZrJFOe2bw+Tifrme28XP3nrpT9LO8lhv24ktQQ6Bow9I4pz/GgH3/qQZyXJqkVJdEhQ7FvslzqMScnNb78Mfw+cbFNqBciytVqodaYhitujFyOC5qNwnzngPPonPJcV3jon1KATLW5nXFY6gpNHXRnxKYRlem1FWBB4FzXfCsn4fimHv1RJep6lWlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+CBOldPkjn5NeetoTnv2JW9nAJ4FEAvNsXP1NLklKM=;
 b=bmU10he1sbU9ZxIEVq89a8OKvuiv9GQ4hhmYCd7gK0sHgWKI6D3Ai1850+15sHp+u66NQ+GiDlc9OaqWWnV5t4VsWJXgkKgtSCOjpe2BIcK0Ce6eRLbxGxE/6UC1Pya2l1MB9AL6uaSYLPf7YzbRxV1z29WuVN6Z85qvQx+FL+CZxKUwOOsR0UrRkZ4idIncQcq0YQERESb/c2puN2lNrfbT8JaWn6xrx+YGpciBeG9H6IoYcc7n39ncKFWI03KT3Rq1Tjj/ynEwaP9K+UntY2/yOpY/9b2q4qyq7u1y22d0ezRXnGQzxqlfzkjtUpIrOfA22McwO6KpDOkHrLK9cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+CBOldPkjn5NeetoTnv2JW9nAJ4FEAvNsXP1NLklKM=;
 b=Ibqcml78iMOUWRcLcVQ4lJnfr754GWfazFFFTP99fQmmeQacOuLn5/SshCTcQGORtzWO5br9s8oTgUdDZ4OHuLRipmowY6WMuAa+ZD++8u53Fk0Kt5YVdWuxL3yzLB1SiLuNWXN6bhtkw3jvGTjVZ3HVW3b3Wy5x63D+gV/nXnI=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14592.jpnprd01.prod.outlook.com (2603:1096:405:23f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 08:01:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:01:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, "stable@kernel.org"
	<stable@kernel.org>, Tony Tang <Tony.tang.ks@renesas.com>
Subject: RE: [PATCH 1/7] ASoC: renesas: rz-ssi: Fix channel swap issue in full
 duplex mode
Thread-Topic: [PATCH 1/7] ASoC: renesas: rz-ssi: Fix channel swap issue in
 full duplex mode
Thread-Index: AQHcU+rRPmXIuHj5BEOv4ofHcmlKxbTwGtwAgAAkBYA=
Date: Thu, 13 Nov 2025 08:01:32 +0000
Message-ID:
 <TY3PR01MB11346E1A2411DB3975A97637686CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
	<20251112154115.1048298-2-biju.das.jz@bp.renesas.com>
 <87cy5mwkft.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87cy5mwkft.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14592:EE_
x-ms-office365-filtering-correlation-id: c268e3b9-4497-4be4-96d8-08de228adbf3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hq78Mfr8F1LKRyG/7QQ6/pbuwpLs6WapJec4vjSVjL/TwgVpXu8YpPQxDLMp?=
 =?us-ascii?Q?qKjTXin4OFVN/GDlqgp2UCTNG3pygO3labrtiUAOJgNa4SrmBrdPvFoHPn95?=
 =?us-ascii?Q?4OD4gtPjaNIMP7XKjwJpV6l1EeqgzN94WPk4m52sKFgPCHiOoecZKKCRGem6?=
 =?us-ascii?Q?eMmwqOw91xX3/iOTQBosDoHrAAl3cNEA1W3v7H44wP93QhJegK/9HwONhLld?=
 =?us-ascii?Q?TkqAJyLfQjDOZE2FCg3W6tUogokRhumJLGR9qMlwL/A46/qkI63jJx7D+Tvl?=
 =?us-ascii?Q?S5C55ulYt+Eep3AYpr/EuOfJt65yarRzt7xPQYVagiubCNd+VhS+4UKuIYVb?=
 =?us-ascii?Q?otkdPRZUIjPJ24hQj1RT0j74OfY82P2L2+W6U3k0BES92o/GcuugFKm7tiMl?=
 =?us-ascii?Q?ETUk3JCEqCyPsBH4M5LOLP0Bm3pvOVB7ielPAGVAY/xujmaRBDLOPNZ1dUs+?=
 =?us-ascii?Q?13yau6K2jvqsW56BW7T5muaMlL6OceOkDTGSGs4dzSIQPE+OIM2QyVBGGuDz?=
 =?us-ascii?Q?ceLN8xTz1Lr1p9AZQRu7wlInjE+KZc+IHX72iu3Uxr79mu6Xpm6R9drXY1+F?=
 =?us-ascii?Q?6pseim4aYdWw69ekhvLdjuyDnhKQsq8BTcwM0qdSwDeAFwqg4IrsCUU6Oaql?=
 =?us-ascii?Q?26H+P0ScmxNwkozcuQ5y8Ghla+Igvgs2IgvTP4UsF5mmPZrs5CrTl3a+s2jB?=
 =?us-ascii?Q?4bpSuVPkqmy42f2aE9w6KxPtoTKXMRFvJ/WMBV7GiFaYqRbB5+DN3UH9dsQY?=
 =?us-ascii?Q?hevZRmc+Kk+C5o2/mG+TyfXMl7UIUx/lpgL4dddjIjb2ZYnKzumFpmQpzbD0?=
 =?us-ascii?Q?XXLEDSWuZ6CtiaZCyWBzmDho0DWgtfNDyZ7aKJCZJmFBuEngRMrPDeILK6HA?=
 =?us-ascii?Q?5nz7M5408pa9GTdUDsxf/Ov9+Hop187H/ggIlYx37SwOuqb45f2eoMKGD8Km?=
 =?us-ascii?Q?p7urLj/idS6U+D0Y121St3cIjcd6K14Iu+ldrpyhTKfjGssYYtM9xEfRddZb?=
 =?us-ascii?Q?nUJL02msgWo0gjsOMnxRkFvpwUFu//PnA6ZFfbv4MHlaDQvmzxV1XN70yAAO?=
 =?us-ascii?Q?35Gt/R8sHqRYhLkKxFWh+5h3i5i8GGP2VrRNERBx77oocwHTq8GQbXlKjq0I?=
 =?us-ascii?Q?zWgFfM852PYLRoQQVbIYl7jy0ZJ0+gikW8xKiKOMk8HWh+dynuvYJjnuVqyj?=
 =?us-ascii?Q?b4W9SKbse+5DhPWoPf8RZiWofH1GZ1btMxd0IYlYK4ahaAV2Ir2ZDdLVYJvu?=
 =?us-ascii?Q?jU1LM9JHBZVboPNQ9yfu3pIloyco/xDG/s+toyn/g2RLmFuMa10Q9q1JiGuz?=
 =?us-ascii?Q?BDLiiTnDgZv9Qs7mbIAexlu393GivSJIOyHZ54XY4PBQsqvk3SCSChSjktZv?=
 =?us-ascii?Q?tOOW7odWTWApWQYUkw6unffkdNvGNfyX65tAAkD+Undp3UmuRcbv/2LnOmzH?=
 =?us-ascii?Q?sOINWzPsfA1yl0dpKJ/2pMr4Pm4xH4540X5Y6O5EDxXvjfwDd6Yx1ZP958il?=
 =?us-ascii?Q?AaUuytYvnT/+0M81d6FHhSKAzltvDmgMOQWv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vT4a9K/gI0LOn7EYzIQf9iTavpCiT/j4o+8AN9pt4KLqsCq9Q3dfXjo3WzXj?=
 =?us-ascii?Q?WAZJjrL7WH/Fqq1YhejzHfkkYBtPcyk5WI5jbK+HzNsLbGtDHavcddxEgStW?=
 =?us-ascii?Q?bJ4q1DhkOtYhNdGOasxiTCK14vLQQyOSNB5uzY8pTNQjUf/EzKak+4TeSGBd?=
 =?us-ascii?Q?NRmsHMkFlKdodta9ZKOS1covTia3MZCaf+PhKY35ucckQCB+L50ZTh5Ca8Cs?=
 =?us-ascii?Q?RWuU6mf0zvVmVcx1JgbSBsgdYujV+ByFE4DFs+fn64KAb3qWCQYby3jWvAWX?=
 =?us-ascii?Q?nPB799giAlHaLC2qUw4nTjor/pWSea+ADJaaQsw6mGNUxaq5UDFYpLLrS8au?=
 =?us-ascii?Q?qA9zTZje+YKKUDwoaz47uX5Qnff33VGTcFbRfnazy8J4dCdbuo4czyHC9Xxk?=
 =?us-ascii?Q?ps4Uv5HjHU8QMTkc1vD0WpOKEeElVLkhPhIO0Nmf5fXZKFaF6LOIgf1ls8fq?=
 =?us-ascii?Q?jewzeIutzsULabBgZBY8RjATQbWuw/qNIseyLa7E6TiX3KURkNLa985Fpbyz?=
 =?us-ascii?Q?rV24NIMAJ0rqXjuWZv+mz4fg0lD3fQySOfaBg9XcZa8hQobTEBw220ecDGUQ?=
 =?us-ascii?Q?exaHRXuFFIpBWDXLKG57ZPgWg3+B6oL9FsmUkuBgcpo10srvCMf+bdLuxDBI?=
 =?us-ascii?Q?wYnfhVR5DvOUcyqa3UO71Y1HfWCb9RDgp6CP3hQaX0WLcQz9ySqGKhHG5nEr?=
 =?us-ascii?Q?199hWyDAmK63kXaxedRXMfbq8Gxn9mNbxIRMJiKJlocnFZyvsYKz1D0fIRn4?=
 =?us-ascii?Q?fLneAYHftsnRE8jztrYr4lPa4MK7ZA6m9q7+kqEI5y/od8J9twVgjbgj6Veh?=
 =?us-ascii?Q?4BC6JHB8i6ZVFSzdl81A/vE8Ge4cT7d8IpT3T45IMNtDLeGopB5/kiSHo68Z?=
 =?us-ascii?Q?n1h0mlYjLDSlqPogjoWvjsz48FLCarA/P6kLup8GstNq6zgb3BwGuW7cEtGa?=
 =?us-ascii?Q?THUgbqAAAf+tLV2fEtOfTU4Jy3YSRlijhwBC2ff3NMh+r6JDUq7xJ9QX78Hw?=
 =?us-ascii?Q?iQk4Qc+JCwF+oH7TW7b58W1L2/r6Ekouinu/MvDCb/3qLQElgYlDF4YMfHuB?=
 =?us-ascii?Q?LlBDzvRaG2D7cewsc4vHC1GMI7Gdea9WKaa5MDkn1MHcT36ZJylgG3HRiALT?=
 =?us-ascii?Q?J1wdJRsQv1aKtBnqh3Z4rEagvVZhTJPboK731Ijqt8ZhrGbqoNPWlCYYzfLf?=
 =?us-ascii?Q?NArhAgi6QRfNXvgTy5My6E92xfwu2tMQeW8tNbJAjmW9JDz0924bWrtbq530?=
 =?us-ascii?Q?5thXoNzB565xGfwN+sgfPQOGLq6rh9Qf9tb7DJcUVtT/1mW8kINBvEUBc1jO?=
 =?us-ascii?Q?swcEevAn/lu9jcAlE43t21zz3qidtlO/0qs2QzhQpzAgYTpkhdDwsaMXU6GK?=
 =?us-ascii?Q?U3R10yo1v84+WE4iY32U6npGbghUlf6gEs1uwAObg64Wy2uZllAhjZlZyd3i?=
 =?us-ascii?Q?nV04HSv9ObDyFEFYFpsEr8oJGKwdJ9k60NxAS8UF4Ymp+0706+NH0ogqnT22?=
 =?us-ascii?Q?ijiikbDA05DfGrz8Ks/vjjJgRaA/BE48kz+NvqFGiTxiuhvG+IQopDU4orh/?=
 =?us-ascii?Q?zr24+QQW0lWbCL3MCTWB3w28wqa/jGbwXhjXtrh8VgO3yUBDRO5KILlhUa+l?=
 =?us-ascii?Q?fg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c268e3b9-4497-4be4-96d8-08de228adbf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 08:01:32.3805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5gLYyS5frCdasfW2Vyk+AQ7J4bIHLI6/jGUPBxw+2x+QYoJcntgsFKXo/Z3/6eoqfkYBGWnNUSHg0soZpGW1f2IhcaTaWl1myfrrsCx81no=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14592

Hi Morimoto-san,

Thanks for the feedback.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: 13 November 2025 05:50
> Subject: Re: [PATCH 1/7] ASoC: renesas: rz-ssi: Fix channel swap issue in=
 full duplex mode
>=20
>=20
> Hi Biju
>=20
> Thank you for the patch
>=20
> > The full duplex audio starts with half duplex mode and then switch to
> > full duplex mode (another FIFO reset) when both playback/capture
> > streams available leading to random audio left/right channel swap
> > issue. Fix this channel swap issue by detecting the full duplex
> > condition by populating struct dup variable in startup() callback and
> > synchronize starting both the play and capture at the same time in
> > rz_ssi_start().
> >
> > Cc: stable@kernel.org
> > Fixes: 4f8cd05a4305 ("ASoC: sh: rz-ssi: Add full duplex support")
> > Co-developed-by: Tony Tang <tony.tang.ks@renesas.com>
> > Signed-off-by: Tony Tang <tony.tang.ks@renesas.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> (snip)
> >  	if (!is_full_duplex) {
> >  		ssifcr &=3D ~0xF;
> >  	} else {
> > -		rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
> > -		rz_ssi_set_idle(ssi);
> > -		ssifcr &=3D ~SSIFCR_FIFO_RST;
> > +		if (ssi->dup.one_stream_triggered) {
> > +			rz_ssi_reg_mask_setl(ssi, SSICR, SSICR_TEN | SSICR_REN, 0);
> > +			rz_ssi_set_idle(ssi);
> > +			ssifcr &=3D ~SSIFCR_FIFO_RST;
> > +		}
> >  	}
>=20
> nitpick
>=20
>  } else if (...) { ?

Agreed. will use else if.

Cheers,
Biju

