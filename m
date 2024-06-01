Return-Path: <linux-renesas-soc+bounces-5758-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE678D6EC1
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Jun 2024 10:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A0DD1F26417
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Jun 2024 08:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6DA318E11;
	Sat,  1 Jun 2024 08:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JGE7yRWt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11010000.outbound.protection.outlook.com [52.101.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36555182AE;
	Sat,  1 Jun 2024 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717229127; cv=fail; b=t5n3WX4I6fopw3yJQjiIV/Als7S3eS8bg4eLpMKyEz6h3qwix65IJpiUNHTrMEeHNzR6BBTbWPRF7CccxABTkhpzUlatR2qVJzMBfT3aKg0HiwN0nqUT4e0lbHCT7+R1lKn0KGistZSycx8VnKCu9xhzWhCFQ97+aZgy1AxqXhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717229127; c=relaxed/simple;
	bh=HVyKEQtHxeLLokobKEVWEl1MW/bIQoXtBBPbnYOXZQc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KvyjtuV+xJxQv/rhl39lQJNc2Pj1JJOgIRLrwLLAeCP3j/00R5fbgIFMf3V25gcyceQGJcZ9sxSXNTWicgmFKEZfRWVG68h+sD3qJD6X/2duFowgojkn5QgE5+2ApEwLKNDshTzGRrIJcasUI+FySO8x5u3vqXsMloDeQzdTChU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JGE7yRWt; arc=fail smtp.client-ip=52.101.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGKJhy+HkmzqArVGv5SA60dfWmflIXUaTZsW2JI2BTJQpg3+O3WbnxMAm0kMuB8h2qd4PDyyEs2S+skZykKLykfwRY6Ac6XrqV8B4fRG9YLyJAOagSuopoooXo1wcvn+O5zEDJPUAjXGrYmjU58vz9JCJ+xnry7561u7i20uNLRpd6NOvWp3ZF+IHjGJC0dOGGyTpZeOO3kO8W39Q8Ob/ILuK7iiR2f9epmh0Gx3DazPYPqtCkgGHD6BUAtL42UWRqy7ubIWINAPI4RnwihG8DGEkMdgAkGnbp8+ip+D3N2XMAEJTUcBo+ipHLOCnuwZd6qazEWlfDka5CS1+ygJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cd+u5MG79xEVZYllj2DOHwz4No+ldoAKcYZAzFq8vmw=;
 b=SNBL/Fb3Q1nPJLO5e89ySEwNTdzaRnfUS97zNOE2kJexPkFOUpuYocOMKL/oPiEK908SyAKIMOiZ8bY3YLwKAjQTPaPjlP1ySCEtMhNu4Fm1jeIIaVf+2svD+0U/78/ayhkfmEcqb4YOGekjMncDVNXF1d3RmU8S7HvR7onjPuIuHvnnmzjnb7h1wJrzy+fInbWWc94zp1La3bS9xSmiDYBr2Z3nKdcFiZwMOCz22wGM6xthKLTGo1vpE/7hyDE1RDM0Po3pNAci1OAaeZM7MZV7arkfgbfm2x9H3f2OTGkGHOMgBk1C+irD8k55jvesiBK8jPd8Jjuwcnx3b4EJ5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cd+u5MG79xEVZYllj2DOHwz4No+ldoAKcYZAzFq8vmw=;
 b=JGE7yRWtqgY0Y2yqEv1e7CY2FSKdIe1L7M3D/X6zbUDmQ5sG1tSNszGP4JG4Pmi2jaJen4I32LKkvspNeUpixK1MKuHqiDbBk/leYM87w3rS0Udai4odeM1IEiXSJCN6Mdu37e+t2CkQMwRJGgFVguOTmpPbBhREW3qk06fUDus=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB9391.jpnprd01.prod.outlook.com (2603:1096:400:1a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Sat, 1 Jun
 2024 08:05:19 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7633.017; Sat, 1 Jun 2024
 08:05:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Russell King <linux@armlinux.org.uk>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/3] clk: Add clk_poll_disable_unprepare()
Thread-Topic: [PATCH v3 2/3] clk: Add clk_poll_disable_unprepare()
Thread-Index: AQHaeSSsvgiCzcsApEKP+Bm4jHTQr7E90ISAgHUvp5A=
Date: Sat, 1 Jun 2024 08:05:18 +0000
Message-ID:
 <TY3PR01MB1134626941F7B769CF8C8B13986FD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
 <20240318110842.41956-3-biju.das.jz@bp.renesas.com>
 <ZfiGrYcvoiM2Rdxv@kekkonen.localdomain>
In-Reply-To: <ZfiGrYcvoiM2Rdxv@kekkonen.localdomain>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB9391:EE_
x-ms-office365-filtering-correlation-id: 4e467a42-502d-4e4d-dd5a-08dc82119402
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6jTY5/16YVx61Uxrf5BLbyL2ChVSRl0XYQXrkXsT2G+7Vf++tpmwUACzgIdA?=
 =?us-ascii?Q?S7lGxWPKz6mmwjyFHtJgp59V8l3aKliVwAavdKZpVLblkdJgKpRdIqdcapeh?=
 =?us-ascii?Q?y2fSqxhNv7beaDPSo9Hw5xwf5TFE7Pm6PKkqVnieNEUEHAIaLU0C91s1uRKy?=
 =?us-ascii?Q?X1vsuFvU8R3rZ93jjbOYEN+kpej6AScVy9v6GKsktS/sRfY3/Nvbpmp71obg?=
 =?us-ascii?Q?A7K9svtvJ4fPkyomSchCKK9YfVENhQBotWlLtaMNyfUUQrJ0qbhLuFDKjeop?=
 =?us-ascii?Q?kzYmz7Xk8xpeEGFpPdD0h50EkfBuvrYJMtUfdUkkOL/W5g16p60xRFjC6w5G?=
 =?us-ascii?Q?HLO4YtL2Zl1kYMVD5MnMQdMnrpWo5Pwo8Zn/DA9daUIFdJ9l5Azk1O05ZN6w?=
 =?us-ascii?Q?7gZsnm6xUTBLrddpczQvU1DunLteI6clVMupjg+8ib4Gi4u3waX8p/pHvTrO?=
 =?us-ascii?Q?B4SBCGjUbkCbIAaj+4yWrl4QBzb04rK1cbx5TjoDq1Q1CcAVrFIiZ8FZtpAR?=
 =?us-ascii?Q?Dgi1ablSl8RzaS3T1fo87pqcAxyQXBJEOes85l4ITtJTP6U/5BFf+Ddh2C9o?=
 =?us-ascii?Q?tHEazF2rKvtbiwhQGaAJmMN8vPQNki5NVe9IK+/PiA2YwxZ68ux+C5xP8g1l?=
 =?us-ascii?Q?o0VVkEQfWMKSLi/BbKsny/5AiNTBOFXc/MuWYcICBdzGXrwe/ClYM5pDV9JQ?=
 =?us-ascii?Q?KDA5+bfXWbIiMBUubtukjzwB1RCVLB+5qmCuESTdWO9zvmJ9Yc0j0cEJUpdr?=
 =?us-ascii?Q?PdeY32mLRTjoJ1b2WrVGsA79dhPRJiiNGD9AVdxhSFtgaIGa384iqcHORWMM?=
 =?us-ascii?Q?cNv5AKwfidHb4i7XV4CXm07XkOgTXmTBuhJeNfQY8ty5wgHbH6p0BlljbmY1?=
 =?us-ascii?Q?28/cNwk6LgIh0xxqk1mMCUgXIqFZyXSPqER4mdRgVPJVROxal7lhO5I2CqI8?=
 =?us-ascii?Q?80sdaK20iYRBTOly0RtKCavp/SeeFC143Hz1SE92oZt34eajr+5Ytny6J9LT?=
 =?us-ascii?Q?uQdInmg1DWbaBCLS/UzxPLEfHlS7Ogbs3/SZ0VTBiff/JJ708Pe1F5cQxWGK?=
 =?us-ascii?Q?RlDOgZnGUxaeqhwSZqL/rNyl5PQB51dDHzlX9WPmtkMmOnp4crERJ5kBedO0?=
 =?us-ascii?Q?6K4XJyNLRPpaaMVLjQhGFGeSt/pqgHSKWiRKbDsoN5xVghMPfLQocrfv5IYX?=
 =?us-ascii?Q?grOqtD6GFap8JxRq3WzsaijYV1eFYr77CM6Rf77+QPv7RqeA6V5j71p9gq7/?=
 =?us-ascii?Q?TmehrJuOW9AWO23lC1paMKhJ+G1+DINBt1xZ2DkW6epIQbSTSawEO4Nm+tZZ?=
 =?us-ascii?Q?VfNk3XNw7DlqBwXjgE6Py/7KCBMJYqEmjCzMeo5goBPkQw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zEehU/H/lhf3SC1jrv6gVZR3oPIq3OKCoxPBXlBuw1LN9xdCfObtDbHEpWPs?=
 =?us-ascii?Q?62+Je2VN9cBgt0Jr5CeXGBizMnab2CHa5y06lTSJJxaBpHCFn1Eoa2QRnF5B?=
 =?us-ascii?Q?nYnKUbAV/ZRWx0pIc/j8jZyjP78dYe5mwF2dUCB4kqtuABsIEuDZw89vEvRG?=
 =?us-ascii?Q?YrsDHh7mP0lCFXo34xIaihPUXry8lCqdzTsKwoR6ZOkazomqygphTshQhSiN?=
 =?us-ascii?Q?qW9Q4e8vBSXZfz/F20/ZUmXaNdJxmdqXCXU9hO+cXDM9vsTpRysCbtMmk7XM?=
 =?us-ascii?Q?mOFvPGK/oMHYgTV/pX6phURD6LeBenbGcyA3Bvn3/9+95ZzIWdK1xoSLRKEe?=
 =?us-ascii?Q?OvZeoIvnpab3xpwRhReGKDS3GxYjfs3wrHfWqAkRMdeym3s7Kz9NHZz85NAR?=
 =?us-ascii?Q?+aiFc1Mmp7ITkZgH1E6HEYVPvj7dbqLJnrROd9dUeFvRHgo1Uq6P4mbIK9mL?=
 =?us-ascii?Q?9RGy3LrGU0L/rvOKhb4HtmB36Nsjx7K6Tpi5ayz9CZLtsjYJDByw/2CafAwa?=
 =?us-ascii?Q?a0wDQBt4ZG1nmbvS1zSHrQd8i7A9XbvLVzCUcEcRV0dGPRFNYtkSDtWCReKD?=
 =?us-ascii?Q?hmVuKUFpe6TVuCFdc6rJ2JB3F+iKcmb/l+ONwwKMcZHAK3e9xufE4MpIxwiD?=
 =?us-ascii?Q?PV8Cj2hXl5Q1fMRtez/eHVZttkWo/cMpikgMkxBm4tF7/zylWzEyVuJPr/jD?=
 =?us-ascii?Q?TuIXwCVSjyAF9hfTcv3lSxgo8p0Y/EsuWEP7zZpS/g5d4rMymuTUNW0ltTtK?=
 =?us-ascii?Q?OwBg0YHu8jH1toNqMjPCl/gmVJ6oH5GMUmkTm/gPIvwfXV1MNnlrVNB4eJS7?=
 =?us-ascii?Q?iPBoqimpIgFu5cYFffBYVkerdAyon0ypnLj2sLWiZn/jKJw/xpGPKOJa0LJZ?=
 =?us-ascii?Q?e6JuiEcobjlsu0OH4aC6QAU46faupJUJW/fBslvMvH6AZl2lO9uQ/ovID49e?=
 =?us-ascii?Q?QbLb9gpxCR31lDViVk0iR5m1fuK0rFSfuCJpODwgDlG0yfTERmRkUwbyCYaL?=
 =?us-ascii?Q?bJl9uhkj842SOgORyWVqWWuuJlCAlFwfF94VWTc6K+wMw+8UY0Q27MdFLbFQ?=
 =?us-ascii?Q?qqnz63tK4MoxrDvnt1AOD7f2z2N6Y4+29YXYnE5luNBorungpr8ONGg5A+HM?=
 =?us-ascii?Q?GWWqcK9+f9eyL88F3SFK+2S8D2uu3gppZpOJuJxUJqKkZ/pwGMrXEjJIrsRJ?=
 =?us-ascii?Q?V10r8W9O0oq4J0HW8diJ3Fgb2kFVannzqxLCj1vhdRJ6TO/cn39u6HNXakyc?=
 =?us-ascii?Q?6NUmM4fjUborEoTC03POvXQrnpQ0l58WlsAv7yVnT2Mw5T6gVrERas315jJw?=
 =?us-ascii?Q?ZxPxYfVoyvbOCs8QwQ+XkCqjbxN2TgTApsSLnWnnVYHpoDsfZ/3MRckiD3XL?=
 =?us-ascii?Q?8ivfNy05f5tgVCRObXJkkdMAI+1KZmPRGwml2M3MrCP5SSBzfAPMRmjZCXDm?=
 =?us-ascii?Q?lJMQDvP/YESI8c6sOMHsRADPKqxD/IYzSZgrz10kgjSpXFdg4n6wHUFarmH7?=
 =?us-ascii?Q?zNCDg+y8wNhFJ1NLTG12B1OfShMusBymnuAwqlX10rPRI2uinT8ekL+URyxg?=
 =?us-ascii?Q?ViJWHhGkhrMKW1XEV8j+owtJ7ZCQowWSI9+Z7rNgcq6CHjzwCrM2Ye9H+BL1?=
 =?us-ascii?Q?hA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e467a42-502d-4e4d-dd5a-08dc82119402
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2024 08:05:18.8585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 98YiDvnV5SbjBQ/MYTfrmHpXWL9i4X5d1HnksBVaHV8fIM8d+nHFZSaW4/QmAbBlEiYHiCzMo8hBdFtx2/qld+ojE+BDbwwy4/KG15JSY4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9391

Hi Sakari Ailus,

Thanks for the feedback.

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, March 18, 2024 6:24 PM
> Subject: Re: [PATCH v3 2/3] clk: Add clk_poll_disable_unprepare()
>=20
> Hi Biju,
>=20
> Thanks for the update.
>=20
> On Mon, Mar 18, 2024 at 11:08:41AM +0000, Biju Das wrote:
> > The clk_disable_unprepare() doesn't guarantee that a clock is gated
> > after the execution as it is driver dependent. The Renesas and most of
> > the other platforms don't wait until clock is stopped because of perfor=
mance reason.
> > But these platforms wait while turning on the clock.
> >
> > The normal case for shutting down the clock is unbind/close/suspend or
> > error paths in the driver. Not waiting for the shutting down the clock
> > will improve the suspend time.
> >
> > But on RZ/G2L Camera Data Receiving Unit (CRU) IP, initially the vclk
> > is on. Before enabling link reception, we need to wait for vclk to be
> > off and after enabling reception, we need to turn the vlck on. Special
> > cases like this requires a sync API for clock gating.
> >
> > Add clk_poll_disable_unprepare() to poll the clock gate operation that
> > guarantees gating of clk after the execution.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Added WARN_ON(enable count non-zero) and return an error code (-EBUS=
Y),
> >    if the user is not the sole user of the clock and the enable count i=
s
> >    non-zero.
> >  * Returned an error if there's no is_enabled() callback.
> > RFC->v2:
> >  * Renamed clk_disable_unprepare_sync()-->clk_poll_disable_unprepare()
> >  * Redesigned to make use of __clk_is_enabled() to poll the clock gatin=
g.
> > ---
> >  drivers/clk/clk.c   | 29 ++++++++++++++++++++++++++++
> >  include/linux/clk.h | 46
> > +++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 75 insertions(+)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c index
> > f5fa91a339d7..e10bb14c904d 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/spinlock.h>
> >  #include <linux/err.h>
> > +#include <linux/iopoll.h>
> >  #include <linux/list.h>
> >  #include <linux/slab.h>
> >  #include <linux/of.h>
> > @@ -1160,6 +1161,34 @@ void clk_disable(struct clk *clk)  }
> > EXPORT_SYMBOL_GPL(clk_disable);
> >
> > +/**
> > + * clk_poll_disabled - poll for clock gating.
> > + * @clk: the clk that is going to stop
> > + * @sleep_us: Maximum time to sleep between reads in us (0
> > + *            tight-loops).  Should be less than ~20ms since usleep_ra=
nge
> > + *            is used (see Documentation/timers/timers-howto.rst).
> > + * @timeout_us: Timeout in us, 0 means never timeout
> > + *
> > + * It polls for a clk to be stopped.
> > + */
>=20
> We should have documentation either in the header or here, not both. I'd =
drop this.

OK, will drop from here, If it is ok for every one.
>=20
> > +int clk_poll_disabled(struct clk *clk, unsigned long sleep_us, u64
> > +timeout_us) {
> > +	bool status;
> > +
> > +	if (IS_ERR_OR_NULL(clk))
> > +		return 0;
> > +
> > +	if (!clk->core->ops->is_enabled)
> > +		return -EOPNOTSUPP;
> > +
> > +	if (WARN(__clk_get_enable_count(clk), "clk is in use\n"))
> > +		return -EBUSY;
> > +
> > +	return read_poll_timeout(__clk_is_enabled, status, !status, sleep_us,
> > +				 timeout_us, false, clk);
> > +}
> > +EXPORT_SYMBOL_GPL(clk_poll_disabled);
> > +
> >  static int clk_core_enable(struct clk_core *core)  {
> >  	int ret =3D 0;
> > diff --git a/include/linux/clk.h b/include/linux/clk.h index
> > 84b02518791f..7f714ecce0eb 100644
> > --- a/include/linux/clk.h
> > +++ b/include/linux/clk.h
> > @@ -693,6 +693,20 @@ int __must_check clk_bulk_enable(int num_clks,
> >   */
> >  void clk_disable(struct clk *clk);
> >
> > +/**
> > + * clk_poll_disabled - inform the system whether the clock source is s=
topped.
> > + * @clk: clock source
> > + * @sleep_us: Maximum time to sleep between reads in us (0
> > + *            tight-loops).  Should be less than ~20ms since usleep_ra=
nge
> > + *            is used (see Documentation/timers/timers-howto.rst).
> > + * @timeout_us: Timeout in us, 0 means never timeout
> > + *
> > + * Poll for clock gating and Inform the system about it's status.
>=20
> How about, instead:
>=20
> 	Poll for clock gating and return when either there's a timeout or
> 	the clock has been gated.
>=20
> 	Returns: 0 if the clock is successfully gated, error otherwise.
>=20
> Please run scripts/kerneldoc -Wall on this.

OK.

>=20
> > + *
> > + * Context: May sleep.
> > + */
> > +int clk_poll_disabled(struct clk *clk, unsigned long sleep_us, u64
> > +timeout_us);
> > +
> >  /**
> >   * clk_bulk_disable - inform the system when the set of clks is no
> >   *		      longer required.
> > @@ -1030,6 +1044,11 @@ static inline int __must_check
> > clk_bulk_enable(int num_clks,
> >
> >  static inline void clk_disable(struct clk *clk) {}
> >
> > +static inline int clk_poll_disabled(struct clk *clk, unsigned long sle=
ep_us,
> > +				    u64 timeout_us)
> > +{
> > +	return 0;
> > +}
> >
> >  static inline void clk_bulk_disable(int num_clks,
> >  				    const struct clk_bulk_data *clks) {} @@ -1121,6 +1140,33 @@
> > static inline void clk_disable_unprepare(struct clk *clk)
> >  	clk_unprepare(clk);
> >  }
> >
> > +/**
> > + * clk_poll_disable_unprepare - Poll clk_disable_unprepare
>=20
> How about calling this clk_disable_sync_unprepare?
>=20
> I'm not sure if a special function is needed for something needed so rare=
ly as you can already call
> clk_poll_disabled(). Maybe others have an opinion on this, too.

This API is only for exclusive use. I am ok for clk_disable_sync_unprepare(=
)
as it synchronize clk disable operation first and then call unprepared.

Cheers,
Biju

>=20
> > + * @clk: clock source
> > + * @sleep_us: Maximum time to sleep between reads in us (0
> > + *            tight-loops).  Should be less than ~20ms since usleep_ra=
nge
> > + *            is used (see Documentation/timers/timers-howto.rst).
> > + * @timeout_us: Timeout in us, 0 means never timeout
> > + *
> > + * Context: May sleep.
> > + *
> > + * This function polls until the clock has stopped.
> > + *
> > + * Returns success (0) or negative errno.
> > + */
> > +static inline int clk_poll_disable_unprepare(struct clk *clk,
> > +					     unsigned long sleep_us,
> > +					     u64 timeout_us)
> > +{
> > +	int ret;
> > +
> > +	clk_disable(clk);
> > +	ret =3D clk_poll_disabled(clk, sleep_us, timeout_us);
> > +	clk_unprepare(clk);
> > +
> > +	return ret;
> > +}
> > +
> >  static inline int __must_check
> >  clk_bulk_prepare_enable(int num_clks, const struct clk_bulk_data
> > *clks)  {
>=20
> --
> Kind regards,
>=20
> Sakari Ailus

