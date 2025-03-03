Return-Path: <linux-renesas-soc+bounces-13896-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF05A4BE63
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 12:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC00A1888437
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Mar 2025 11:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D60B1F150D;
	Mon,  3 Mar 2025 11:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="uZvWOjMa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B261EF090;
	Mon,  3 Mar 2025 11:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741001098; cv=fail; b=gj10ZI5fdcikqj/V//gAhoXUVdTjKMTXJKtGwfzKTBN5nTgG4Q1jwpw6N0NEd9PjNiapeOwnpvGbygnyJ3GawSVoWMv1lWaqHzhQA4H83Ge1bSIA75X7kA0zpbK/1byQk9oAAPh386luRkpYMYTvveUNEJLD+pEaUkbqFIqnpzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741001098; c=relaxed/simple;
	bh=obV0Jvt2qpJ4CCfHxhcbnJOwwB6KJ/AzdInFEaf32XI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U7OS9WqocOemekFnUncdDouk7ej7FpRmT29NAtqUEzKn7teTUzi7xmmGN9Eo46cDz92WrFScpeWD+ev2IyzPgL/UHEpjbSbUSN80XCx96EkRuLJZ5NIRtBQnD31CdNTl2qWt4M+FYjg8pv7+pHSNChBb9jCTDw2pyTZldFw91yc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=uZvWOjMa; arc=fail smtp.client-ip=40.107.74.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5vf1J5QRpLQg67VAJIrVvTizgu3Oo+O0lvnGplvW4kfWqFmf39lNBtk5iPTwXckjNK2km+t6rOB9b38UBeqO4m2v6DdOnzKFMLUaXvtFTZvfW3gIGNt3BCfJzTRcLXF2iQik7C189ycG/w0ZZY4H/2/oHRDATgd//a2W3PaFMk7vLzymoKl1Eljy6+C2nfaoQOumO9li/PySWrFdolVhB4+ATGiKiRfNw6jK8cd/ARWj8IYqEJ9zBAtPIX+UAY6Mdmws2i7ehggJaBMtuI00jxQxOpMd18bj6NjYMbNxpvbRqUVa7a6FZZt+j2D10WJ3mpvHDIWmeK5HyZmz8P+hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KunPrCDZjZKEu6YQTJxAL8ebwYtbqFWFLlKN9r3Y4AY=;
 b=VrWaGULdb/HRj2uRMTakWE3RR2HLXhL2rG1Ga7erQWsEdQNM37XITQ3J5iI4B86o6Gyzni2wvSQk3egx59hUfBFdR3lZa0aN3rRbiFetYhuEYJjx3+5fdd16Xjb/oUTMKsOMI5b59rC0+6wxky032h3j8Zs8+wIMSMG/vj2Rc5PHHTLT2pyr/KJk4JGnNuyKxfZIwtR5THyvavcscSzLosWYhNd6jO7d0GWw0TmINXZj4dCyU+BpO5VGC796rrbbvrCDGgnBFFCUZL54NCVu5hDzPtGtLBcEhrSdWthpjV17rh4VZ2pHLzdTxuTWjsz9s3zQu5wr9Jfp3dkXsI1aAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KunPrCDZjZKEu6YQTJxAL8ebwYtbqFWFLlKN9r3Y4AY=;
 b=uZvWOjMaoImydq18ZJl+Re9T751OZE/e6z4rTogZkv+cQcTWhVNU9Ix+8xscvubsHnbJlSvOB/xdMN/bUL1X4vT5XwbBohAQUP+JnBR9w18YfYSGKxMabp1Z8OI37wAOO0TxVWslOcqb4Uc9AQ1Ibgn/2CW9cAW+YyefR4GGq3s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB8117.jpnprd01.prod.outlook.com (2603:1096:400:11b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 11:24:51 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 11:24:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v4 2/2] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Topic: [PATCH v4 2/2] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Thread-Index: AQHbid7tmxChuSDAPEe/fyW4gbbdOLNdOpQAgAQPBcA=
Date: Mon, 3 Mar 2025 11:24:51 +0000
Message-ID:
 <TY3PR01MB113460AF4665D15ED07A0809286C92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250228124713.153979-1-biju.das.jz@bp.renesas.com>
 <20250228124713.153979-3-biju.das.jz@bp.renesas.com>
 <Z8Ipkqod7SdGlDak@shikoro>
In-Reply-To: <Z8Ipkqod7SdGlDak@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB8117:EE_
x-ms-office365-filtering-correlation-id: 1a3c217a-643b-4182-5849-08dd5a4603f2
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?vSSP4mQwHGJwg0fkznOFEVcO/eRe2g8bacmEqCwIKaVXNdRLOUWBnKQXLaY/?=
 =?us-ascii?Q?hYKW5Ql3LZUEg4klHS6LEBWwzynpVSfX28QVrSn07C5vwpeuTDRsyeR5w8bD?=
 =?us-ascii?Q?T4vd5uD0AN8iddLy7B46khUAcup1SizWhtu6a462kv4b1CePHqTo3zlq7vAY?=
 =?us-ascii?Q?RFogvE9sYS5PEZBWAkNoit4ztYsi2c3l4EHvKDNUscscNLurO1ZCcnZtPivK?=
 =?us-ascii?Q?Kux7D/z1f3r4iX48bUSu7jL4SnSPCED7jSxWHn/KjuuKHRDIx14A6Pw3GiOH?=
 =?us-ascii?Q?tSGyvkDfBalgQTmacVSw/XwbOREDNDvkEIdLWNQSvC9p12K0W2UWAAm9xV2Q?=
 =?us-ascii?Q?DPZX4e7fwd605NeWIcM8QN9O8peEoFXGeUioEGKT+ocpvD9RMfL/R28sA11V?=
 =?us-ascii?Q?QKvY3V6HRaPwXRq9H5v26NZX3jIcnl/MeeokOA+uQJPshZx2gXfl7vMYo+ih?=
 =?us-ascii?Q?u204A+eUhR9lVE+jrqKD40hPrtR6SkrI4mXsZ8Aq9wvp2CHqgKQwY/i3dESH?=
 =?us-ascii?Q?2X57KRrv/D8Jf9IZ7LqegXeoSQA40iHynxAN8A2YwXp853Ivt9+L9hlSH+/6?=
 =?us-ascii?Q?Ic1KCeCprCta7uu1G9fuDPsdUpLOPULNZ5E2WfUXBtkjFY0JChQEK2g06PA9?=
 =?us-ascii?Q?4q6zHcM5XYEKOA+92tE0kOMuFBiIkh6xW9/jFVE8XC+BmcDcruJKq+YnYFgc?=
 =?us-ascii?Q?pYNTzC6j82i42Pgmb3uO6Xu9yX1PLgvtVNejAL8kCLTgY0jKO9l2Qm6ypapT?=
 =?us-ascii?Q?6+6SkzCKlo80AEtGXL4YifuCEaAw2G55MKiA7JKcc+yJSQaltyXtOf67pNBG?=
 =?us-ascii?Q?NjkoVoe/HUlonXmP+P3S1775fYOU1R6HdWACtnDSTEz10M4nQxDgzlFbDooB?=
 =?us-ascii?Q?P3mW8EwJadoNrq35EfsKZqCi4PrImD27trMyQCH3HbTTzBQN/yBnJXfRF/76?=
 =?us-ascii?Q?Q0N6MP2nGQgbcnHo6qfxHV+TqzP2RVlmrpHrQVFLD44Z1osFigrepD5W4bsn?=
 =?us-ascii?Q?1bcWo2p5oGYH/QUwZH1n3y1PqVy/dz5tMVznPNrBe14Erm+Cq3n2FHD/LUl0?=
 =?us-ascii?Q?EGM9BSweH1cP9n9px7cq7Is/YceimePbc6kXgh8TiHaS2fvwPVLe21Ben/XR?=
 =?us-ascii?Q?FniDp3smV0XAEyuGGSqUoL1PZEw2eMrjgTjp8meNc/4GKC+gMhF6dNHLIFLV?=
 =?us-ascii?Q?vXTKrlGkewy8hoDRuFJ1IWgj8i2we9klwVM7v5h+NrPJgdVLTCM0XkADZtP/?=
 =?us-ascii?Q?vBGyVHdyKAGxhfHwZ328d+D5SwwvAivtXTRmozN3OosedHP4A7Ddl6DzpiPP?=
 =?us-ascii?Q?ioTbJfS1ZhMNdNEqKdj2vFOZ3prc/c8hOAKLTygefAA4jTm/9dXD32+B7LSM?=
 =?us-ascii?Q?iWwU+Wkgio32mR2ywviJeTKdGhZGjtS0lbBXSclxPK8ZTcZWIzcjYDD2X9FM?=
 =?us-ascii?Q?YCClvpKvSYGDmS5F2q7Cho6SHCT0FuSk?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SJZm55B2FaUgAAgJRVJgZNg6HaLczvC0j9Pq3WvRU3ubsIyAMoGuLgBHXnJU?=
 =?us-ascii?Q?8rtx7pdUQpORFJHe0ZgdZQP0u5WIUzbTfGtuXGTUjhvzIjWhPoCW2oQ8wSBp?=
 =?us-ascii?Q?stexRuIBbz3Cb745XDI0899vSLi+j0vILsr/4wemjAyoqdfBEkVo7hHpAtuL?=
 =?us-ascii?Q?HezvCRLtPi7nbQwhc9qwRYA97hrnUNQhr2g6+0X21tfds1CXSeRRaQQ8uYzX?=
 =?us-ascii?Q?93iWCC1pXNh/EJeSngyi/VdtHzSwMONcLElH6MsJNfv4a4tJ5f+kGXtO9xFt?=
 =?us-ascii?Q?HYRRcn3bU83UfkFoEepse3zIk34rHIkJNdY0rLs5yxCcfzEiWeN5jo0ZRbuE?=
 =?us-ascii?Q?J7xiLERb0zeMmEGmuGfwErj0NLdZsoE7408B4qYmHWyktKNRrzcpsLReimqI?=
 =?us-ascii?Q?GXuMyifk8kQQX7sGKRamiS2tTDs9e5/kIoBr2ms98KT9NUi3y4POGxrTfQVk?=
 =?us-ascii?Q?+TOgoDA3ZIOPd3Nw6u5vQPt/othTW4ZDinHHq7yjyD47hus3vmToYgoK+Z9e?=
 =?us-ascii?Q?xRnjv9TNRRD9kAsh4PJwVWp+Q0xC+NnwwZkfENfbvAfUL3kskrmwvvmNNpZ2?=
 =?us-ascii?Q?PaQ9VfmmgmHdgED7Xz/btT5Z+VGg4/kUCiMcuxgxHLVUpCM9NtOryAaahkLZ?=
 =?us-ascii?Q?wHU62YlaY+Lsuq54KgrJWywDZwhI9Mc8WI+D4sOJRdopVUoEO4pib5xPj3Pv?=
 =?us-ascii?Q?u5CYi5jjlLxvM19OkXq8YSsTezzw1iXPmWqH3UwBVz9uJW7RDnAOjQ98tWW0?=
 =?us-ascii?Q?1sHSr4fY1MgpzBiF3jUEet7WpS0PiubWncUUCLEuP40/pi9WxCBVcixEybrh?=
 =?us-ascii?Q?ASbsnpnu2VWsuk68SG2YHx/R2EJqqrC6newHiTp66JNmxU74AAoUo7Zc//YS?=
 =?us-ascii?Q?Kp89UNqb/ErH/cZPlo9q3LnV1CSJ612Cw5DBbtPBEpMRJBvbvm/+Dd3J84wH?=
 =?us-ascii?Q?AGxXCAZ4ELHEOiDHZnKwmjXufOHCjmp/pNQrPIGLCI4vXmcPx91bxzF3FRxa?=
 =?us-ascii?Q?syaTAoXPOg/aprzaxwL/w/LJARBlxFb/oW4GWwFvAXgTcCAScj+Y8pwJGx/u?=
 =?us-ascii?Q?AR66U+dIbR0nF6ng9ze7A5CSlsBXcg950Xld/cn8x3QUpK3rsDeCpqC0ILpi?=
 =?us-ascii?Q?cQeUtiOmzHgxTkX/o0lKovu9JiIEokJQyYH4XzWG+dRUHO2PoszgzKxzCvmI?=
 =?us-ascii?Q?N1/fDlLc6sUMU4HtZ8o+G08gm/tRzNLjhslB81JXtdDtfGrr3CX4GCNP+0eZ?=
 =?us-ascii?Q?L7/wJawlGyZ6Mms8CogZs47qUrdxOYQEIEVr1psqKK2QMnSiKHp+uCK7+XNh?=
 =?us-ascii?Q?peesR9nYmd67fl3gVjFcyi6c6P27sCjAOrX36rF8d0nH36IJ2tkgiR7cGwHz?=
 =?us-ascii?Q?pJSJKkdhX86s0BXczrMWGCwbKYBR8UUPtx9RNOzoUix2+tWGNB+Ty3CHz87V?=
 =?us-ascii?Q?RlP9briLcHSZ+ul8zePTQH+dqhzW4sLUGqKRqPN30kyEDXn2H+fkApbJpH9E?=
 =?us-ascii?Q?BB3cY1sdrG1wSJ81+Fp+yH9Ukph5TSUr6ipoNcJEQPcGJomhhQyKbTLaBULg?=
 =?us-ascii?Q?io4ufYkANKR/yitYcqS61FYBB8thZtc7nWPUBUupyo1AmL7KKmrA7bJOnL9V?=
 =?us-ascii?Q?6g=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3c217a-643b-4182-5849-08dd5a4603f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2025 11:24:51.6624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h6xSE2MG7JpLt+FWnBCRVYqekGrrkEQTlGCXR68XaES2qffYImUIHZmxytzuCB3Bj5aR/mstZky88/vc5Yarsfwzut5N9A1dPjehcw/ekgQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8117

Hi Wolfram Sang,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 28 February 2025 21:25
> Subject: Re: [PATCH v4 2/2] mmc: renesas_sdhi: Add support for RZ/G3E SoC
>=20
>=20
> > +static struct regulator_desc renesas_sdhi_vqmmc_regulator =3D {
> > +	.of_match	=3D of_match_ptr("vqmmc-regulator"),
> > +	.owner		=3D THIS_MODULE,
> > +	.type		=3D REGULATOR_VOLTAGE,
> > +	.ops		=3D &renesas_sdhi_regulator_voltage_ops,
> > +	.volt_table	=3D renesas_sdhi_vqmmc_voltages,
> > +	.n_voltages	=3D ARRAY_SIZE(renesas_sdhi_vqmmc_voltages),
> > +};
>=20
> ...
>=20
> > +		renesas_sdhi_vqmmc_regulator.name =3D "sdhi-vqmmc-regulator";
> > +		renesas_sdhi_vqmmc_regulator.of_match =3D of_match_ptr("vqmmc-regula=
tor");
> > +		renesas_sdhi_vqmmc_regulator.type =3D REGULATOR_VOLTAGE;
> > +		renesas_sdhi_vqmmc_regulator.owner =3D THIS_MODULE;
>=20
> ?

Oops. I will move .name to struct initializer and drop this redundant
Assignmets.

>=20
> Also, one space only before '=3D' in the struct initializer.

OK. Will fix it in next version.

Cheers,
Biju


