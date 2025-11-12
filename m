Return-Path: <linux-renesas-soc+bounces-24516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEEAC540FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 20:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E76873467F0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 19:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203A3343214;
	Wed, 12 Nov 2025 19:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PAsOc0g/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011018.outbound.protection.outlook.com [40.107.74.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F3028031D;
	Wed, 12 Nov 2025 19:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762974403; cv=fail; b=NRhyh5Irvel8abiHPtuP8ddRhniCq9tRyNxHoAc+/ISXgPj5JGnReqsRlUeoyXchNjm+0vb2ySfn2NbtXFElpVGymnLue9ehEbA1WDG9W7tRp3QzWmK67BtLSDY5TAWXi6MLRERmIZy70Z3FFgfKpoR7nn7wvkFemQDPKEfQQhc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762974403; c=relaxed/simple;
	bh=EAcQTaqsa+H3RNW4ZXPhaqvHcBi3cyCt5XSzD3OrNpo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DVhIdVuMiNmiDLD7OdmLIefZG4HS0nUpeEDo8R2hIa0HbDB/9t/f8QaZ5UcEL2A/M42mwg5zLLtA2c1eHcs0eIK/DPLmx22hfdVZvSfheRx4Rx0vHGl9EfPlxEKLe6fvLNS5CmBI76OT3GG/6su36yo4iK/aTTQM29OSsOgx7Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PAsOc0g/; arc=fail smtp.client-ip=40.107.74.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ln5vrA/iTL6Ppa176vbmu834OBw26YfEuOPqVZqZDh/SxjGWMkDv7372y9YEyRJSb8zrUfHKjZPrvBnufIjksE+qzjpZLq+pHe2BQaIKa+f6cN535sPWUoOiqEzS/2yKvwAYRzrRbznt4DCHqGi40WA0C+Q6SJnHyiBOQLFFz5WCZdXYhOa1srrZQv6k//mdhq29rxuEGDbQo/2NG4gZxa+bF3MzJn/XfkkyIoyO/5e0c6I5dNyqP6D6qTBQYXPFzE3T8DkMbtMoUkwNKkb0cGD52Ds29SrN+KKtJuNoY499LmK0bejRl6/RifV96U36Zi32qrBSj1X1oI/5c2+tvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EAcQTaqsa+H3RNW4ZXPhaqvHcBi3cyCt5XSzD3OrNpo=;
 b=BjHA0Dg6oWbMG40mLYb86xnmx1EF84cJ53AHRsjyJF6QUU9rg6vbbGqOQ751A1IDnrde88iSDR7ZAEdKZwhHFtAKR7v3UKkthzjVkhGui1SnVx+f3Hxxnh1oSTSuaWBiv7joeFgnsS2nBAWBqkc/VblxKz328r9ZpgNKarQMN4KJaCQIV9kORavEyIoXOS2Z9cBJ5ELKIkABR3+7Or6vyyWhNowVWludXCLn9zWuGTvAOOe/b5Qr2m2QWliMTKWjRVDU1uRcL2aifINwMU442tR1mI+XcKZqK7MB9/WsbcLvCfsag3fNHMSKCZXmYfcOxOtRWQgBw+DRzwlHb7MJnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EAcQTaqsa+H3RNW4ZXPhaqvHcBi3cyCt5XSzD3OrNpo=;
 b=PAsOc0g/vaNfQtkHNNRvu7ARehmMogYeoS8c/JKwEQs6djEwuGgGJHjxS1gHHU7UPC+OY0mHMoIeNsouKudj1K3wlZ0twE91dFU5H+ab1GhoEu5KHsWADaiAdxF94eioTOq8/SUIE0ovLbKHBGwCHJSelWZWhS3X1fjcUcrH7S4=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TYCPR01MB8659.jpnprd01.prod.outlook.com (2603:1096:400:15b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 19:06:36 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 19:06:35 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Hugo Villeneuve <hugo@hugovil.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
	<biju.das.jz@bp.renesas.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
	Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 0/2] Remove hard coded values for MIPI-DSI
Thread-Topic: [PATCH v4 0/2] Remove hard coded values for MIPI-DSI
Thread-Index:
 AQHcTqMq7HmTg5AWsEKO+ner0HLbLrTtvHUAgAAMAXCAAAqeAIAAFFSggAB9PoCAALfM0A==
Date: Wed, 12 Nov 2025 19:06:35 +0000
Message-ID:
 <OS3PR01MB8319A5873CD10A7D86F0094E8ACCA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251105222530.979537-1-chris.brandt@renesas.com>
	<20251111120148.943a0e193a65469a53a0cbc8@hugovil.com>
	<OS3PR01MB8319C8A2BD72FC7787ACFEFA8ACFA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
	<20251111132246.eef0faf1177691a07a1df47e@hugovil.com>
	<TYCPR01MB83273CEE6D5B665179456A2A8ACFA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
 <20251111220347.167dba316bea7effb6e0f849@hugovil.com>
In-Reply-To: <20251111220347.167dba316bea7effb6e0f849@hugovil.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TYCPR01MB8659:EE_
x-ms-office365-filtering-correlation-id: c5a3d24e-7b20-4039-bbb1-08de221e99c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5WiopnG5wIDzGVvBQKtOpEZEkjAqTKRwhEBnD9IobqzUjhX+Nl2V+zs+u6Dh?=
 =?us-ascii?Q?rH33Vco5Ll2lsusBzqg1tVWa0dmolk3MQ6fpnIptMC8FevMbXAl4xGMKT3+B?=
 =?us-ascii?Q?OFm0FRYML3V9OCuo723nupT5s76CjQKDyjx9IMGAR+0+dOKjzo1Y5zuJbVmi?=
 =?us-ascii?Q?StUHRZKy7d+vh1TGB8IQwyn11yvgX9TXmRoPzRuT7CsiF/CdUw1kRa7zffkd?=
 =?us-ascii?Q?N5Vhgk8QPX2ZoMGwOdptNPO/F8UkYOmPA9UrZDnu/NO7Cl7rYO8mT1kUDCPq?=
 =?us-ascii?Q?mGMgf3slmkwGO4WkQodXLwvgghYBZYeHUk8mSY0l2GKmc5qQFUe0rfgSQzaf?=
 =?us-ascii?Q?S6WvzswndOifY9w+zieWJBMf21bPBTQZMK/QSLbFGvUpWtho2EBT2xoUHANG?=
 =?us-ascii?Q?i/g7YFxbIklfeV6BiAkRLnQ2W8K/fVZq0thcqfYqSFMQPAYQMhoNuPb5Wkby?=
 =?us-ascii?Q?e3L4MLj/+1pbS/llFEEuttQiuLLQWW422NbVAZbKQ5FccWzm6bsiwhMf42nC?=
 =?us-ascii?Q?MKyE9auVDtc+qmwACKKTQN2N95g/MCbFKB6bX18hXz5vV3iSkf5rFS0GDmVR?=
 =?us-ascii?Q?eLsXRyUsINoptl071lIJGzPEv7xaqcLbgwKvSoLMG4B6+yLTGPk62KGzbkLi?=
 =?us-ascii?Q?zN62J8nwK24PnsDl0V533iHLxv4M+UQOQ3icjUBeauoyXTEmP0KLyu3KRwLq?=
 =?us-ascii?Q?YNpb7Ze0vVU5oY44yrUrUVwpzVqkBrZ7KFru5WI4uIo3tykaJ5tMt7KmjSTr?=
 =?us-ascii?Q?FhVSgWToGt6hHD3dExu1cEMaA5Yw7SSTEt3PYjCDko0y5Q2mC8g4wmosuv/b?=
 =?us-ascii?Q?D1iAGR9MlZpQkZF8Rs34Hzoh/PxXMFKVQegdeoV8SNLCXWXwSy+Dc4w1EVJG?=
 =?us-ascii?Q?E5uDpDrwiztVyQrg1Tw++nRAr55jagKPmVjIHuxrUzrqDjqlJCQ3CNCdnoxt?=
 =?us-ascii?Q?JKxO3b3Gfrt4YI0co7GB6k7JB31X7kk/13BSk+CvD3CMqXJIUHEX06lkkg++?=
 =?us-ascii?Q?4VnHERqZfieGHrcPd3rr7qtgichC+2aRc/w0y9z2jqx5yBhS+lEaVpXfH+dh?=
 =?us-ascii?Q?WUXDx+WZrL2EVH4HhGbJ4SFBrT5wc+Ef+3BLOyjUiVAVzeY6j8jPeHG3sJNQ?=
 =?us-ascii?Q?5nMQ9OzURGOWDecRLymldYm1HT5eM1IfdTq1odNWboVpmVG97vWIpSK3lXVa?=
 =?us-ascii?Q?KsbEHmix+p0EvtjQg2WJ3XkebJswM2oKUPqSyLCZhKvx/kOqR9IDXyLeqpvE?=
 =?us-ascii?Q?f9vdTT1U0BBB3P3aAD4XM6D4+M0/J80tUQbl6odMgeEZcdmMWvhQ0lK5SDqj?=
 =?us-ascii?Q?gV6JP32UJiTWzIWNzdM7jKBCP6UKsGwu/6Ypm25cfLpQuk2a1AWaoXuu9RN4?=
 =?us-ascii?Q?sj4Q4jNuMd2TWtDZszNp7HELpGizT4ObtbIvZuGa6PWTbRJ35eDRVyBGb4sm?=
 =?us-ascii?Q?Yfh8eQIUjai+HwfP9MEs3n5d0UJiwt9jYs5x7aSORFFnPxb3IArToUPunjnG?=
 =?us-ascii?Q?p5O24W3JtFu/65+BuxCRd3+Y4RY5k9krqejD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8319.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QflKJn/fPRZF0+Ll+ND9oIpMF5m7tZRzG1JrpTr6RHg/ajqY7+JiMmOdaSL2?=
 =?us-ascii?Q?sIQ31xHiAd5ZSgsgNH7wgZNDcNP8oO7SYbSueE3Hpx7vY3/ZJpJJrmsauuj2?=
 =?us-ascii?Q?AknzdCpjEaeLv4sWWRK4D+WscOmogH7RmkE2ie52jJws9JYBgTbSSwwxKsJF?=
 =?us-ascii?Q?vTIIMUd4JiO5gzRWgQ2SWpg7jJ2R+CbQnqJINtVNW1Hgn06vSlPPHtkrxggo?=
 =?us-ascii?Q?9k78FokV16lQzIT2WijxxkKG5c1HO/Q2S3F+pWaCe0zxv/Gen0+5+kzEEUbn?=
 =?us-ascii?Q?qdpzIM83yQnPI4rySoz5wpQwO0CY5z56NdzaKFvGaGGhKbJ5RV15UEAeaYGu?=
 =?us-ascii?Q?PvE0K3I6/3ouy+bT3YGy9ul3ZVID2estbbhS7iMIq/Tt9g3oGIzo0NE2ZtVt?=
 =?us-ascii?Q?/xnvuRPlTjakrCRmkWPNC4LA01IdkeFdtxb5dNfNy87S49NNm3ryLyKdlllW?=
 =?us-ascii?Q?NmK6rtgC43FmQoClYcHaLued444WUu7d9twXee32I7sy+vSUTaWnYg8+Iek1?=
 =?us-ascii?Q?dl6vcyBwwVSJy1gmYyVsx342XFB7Ju50l4TfLbgroBO0mucvMzQ8hqWE94vK?=
 =?us-ascii?Q?YpQGShf3xeNvhNRbENifZ0Vwbt8JSTQ71oqzqzkl+yDz27HFnJyXBty2+EWS?=
 =?us-ascii?Q?RScQHIZ8nfyZm/nLJapY0zk7prPJJNiiXYNckqjeMKMhowiKg2D2L1L18B9U?=
 =?us-ascii?Q?6a+mZiiAGcQc2xe1SaReP7Uwn7iHGVVVU6U7Q6WHJM+37/XESrCgmZPS55k3?=
 =?us-ascii?Q?EA02PQ8WZ5QflS3+K3t2bLmgSfpyvHVNIBri919VrXNK/d8mCcritQ1llkbJ?=
 =?us-ascii?Q?4AbJLS9vGsSFn8fuOVoKpqVKITHGc48rEOlED0mAIyEGNlQmVXtR38LOr6FA?=
 =?us-ascii?Q?nA/BbMODjC5phy1knJpGSRErEMarpf0CMfkzvV6IIj9Hpv013Xf0+4/utAao?=
 =?us-ascii?Q?WGIPL9cd+XV8hVC0BTjuZNKf9ixCftkmNVywzxT8R8qXe5/uKkkkhyCAPaFk?=
 =?us-ascii?Q?I/zXuDt3kl7knTWH7rjgkKMq9rmew6oHmDcblJoJUp8J404dSE2E7aMfD6Wi?=
 =?us-ascii?Q?X3A82K0JpfPPo9mUMNbSY2lG3wRNemA9JKdl21iykW8IopMxdPsTVJEngAam?=
 =?us-ascii?Q?SWW82wOlyl233enBQvuCQZvXMhxXGU2CHsAWrh1BEg0/yfJqnwqZRJUvjUfk?=
 =?us-ascii?Q?Edb1nKToTfNGntRuvZJlWg0WU0D5FpbAz0JYrPms006XGMNb/K3nQ3+a1kim?=
 =?us-ascii?Q?K+Z585Ieh81jtNrg59qGHry3o2FYZbowJgSbA4bLQUoi9yG2dKv+v06qaT48?=
 =?us-ascii?Q?Qx4+LnhiCgCyWBh3TRGVzPB/bqXLCBZ6Qjd1X/qHq+JY4QLXpNxVSDa5X27Y?=
 =?us-ascii?Q?c5kzzgjRjELrHpG7qgJy0RbUyz4+90KRaAFgMDuMbEoyg3FwIe1k08QcnyU0?=
 =?us-ascii?Q?rQSe+uQ2l44tvWY4+gEibleXRFCn4ddNg4+j9z71w34Fl+lCXV741+W33vfW?=
 =?us-ascii?Q?uPn5o1LHp1PHSTx9hMw4AzKpo3UIyoDBvMcdylmlD+pyUu3nUjpdbEE1/ZnG?=
 =?us-ascii?Q?ofU7vWSRpx4VSWhqlYdjkP7RFY3G9BJWNdLFAFYL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a3d24e-7b20-4039-bbb1-08de221e99c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 19:06:35.6962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+mOHfhcphIzQlfgQugJMATGcZNFfGPqoYigN12u6rRf0yHXyQwkKzFslTiOIrZzIWLMSjzXJtpcarIPNdV55W1Jb2E2NTqOpDjnB+4SEJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8659

Hi Hugo,

On Tue, Nov 11, 2025 10:04 PM, Hugo Villeneuve wrote:
> You still haven't provided the base-commit. There is a ton of branches in=
 renesas-devel.git, so it is not easy to determine the branch/commit you us=
ed for your patchset.
> By providing base-commit, you will save everyone a lot of trouble.

https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
master branch
base-commit: dd30a345f284e0d9b1755e3538f8257cf4deb79f


> I tried to apply your patches on branch renesas-geert/master, using base-=
commit: 211ddde0823f

That is what I have been using. I just updated this morning to v6.18-rc5


> The problem seems to be that dsi_div_ab_desired is not properly initializ=
ed, because the number of lanes is uninitialized (0) at this time, and ther=
efore
> rzg2l_cpg_dsi_div_set_divider() gets called with its first parameter as z=
ero.

Hmmm.
There are 2 ways to set the number of lanes: Device Tree or hard coded in t=
he panel driver.

What I do not understand is that by the time rzg2l_mipi_dsi_host_attach() i=
s called, the number of lanes should have already been set.

On your system, where is the number of lanes defined? In the panel driver w=
hen it is probed?

I am testing with 3 different systems, and I have not seen this issue.


> Like I said, it also happens on 6.17.7 stable tree. If I remove your patc=
hes, everything is fine.

Things are hard coded in the existing driver.
They work for you today because you are using the same number of lanes as t=
he Renesas eval board.
I'm trying to fix support for lanes =3D 3,2,1


Thank you,
Chris

