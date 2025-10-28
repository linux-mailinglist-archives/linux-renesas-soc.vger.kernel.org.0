Return-Path: <linux-renesas-soc+bounces-23808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5037FC1746A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 00:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 775EA1B20F9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 23:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A81334EF15;
	Tue, 28 Oct 2025 23:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PRKKN+m0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640621891AB;
	Tue, 28 Oct 2025 23:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761693055; cv=fail; b=bLAqpH4UU3hO2ofR0HLWEFTC+e7JxIvSjc7a7/V18E8t3M0vOYHN76uDr+zkT+fCaW52KLWjVIzB881146udGTdKduTNR6hWD89vUm8F4UUZGGiil/0rUj62mC1NWFrIT947cd12AXYX34fyBy1wIfynb5bWC57YLr0hJnUk3Vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761693055; c=relaxed/simple;
	bh=t2hZIC7kcCGu0/U8bTDFC8fXavN1RrzbrVhvn6wgR4c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pL4CYPDa/PJTq9PNNewMG2YzUaoR7VfmSr32xn93b7G1PTE0kOsy5mFqJgAEjpPNeTlpvk5JlbWX7/yPfDVn0E95YdCjEcr2x808483t/G/wv4kNX56Rx/PrqwpVlW0uIyTEjq+Oy0Zu6ao9Uq4AbhW3GaIdn/06++HZYOfggso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PRKKN+m0; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgsz/mrTkKDPrQwfRe8apK3F8uSvvb04AmOeFXRo6C3gU4tKLw2uSn4ydwSsbDC7bYLYi0QxInJp6r+cHbUApQuW/GTqls+vXaQJ+oW74CJcBlE/1HR7K7Ga8kt63T6ZvgsBjvotwjQuw+gMQjs0G9rUzf31OlvZOB/AKpZRnlfVdiT+diM3ueuajNU8B59jbgUMln4pWyJmppfQ+OowLrSwtU3o7wxCRo7+LbsySs3m9enJuSN3VK+vGZ9l5pZp6r4gXDAm57IBxmmi6vPHdR0mymmsTfifnrIR4QBavHPVknp/qGCrawYxvw8cAxiJZE3pam9iZ9p/8v9EVZmfPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2hZIC7kcCGu0/U8bTDFC8fXavN1RrzbrVhvn6wgR4c=;
 b=jzNKrdIRmpxl32idIhHvHrmBGA2HuoDrOZPf5hKb+7ImeZFzyhl25UIAPP1uGPbVigyQLRaOqtN1njuF5d5hoE2VQ69xoqGJ0ZITwUMAStAievbt6hd5N+AxWxOp6f/rDbQ+yqJq4SzntvuY/DvSOzFat/FQel2n4tgg5SyqryHnP59A8ZcQjZfCqAmNHb2oYk+Sri+1Ytb97SpgBXQC9wp9+42ZXOh5407gUUWIOLyURkYzEHlHEdniGCHu/rDQq8R4EFKUKojQjeXlJilB4nW5Q12B2mLGrUpd8W1dbbukOz0HcWzVFFQi6sDyFCNqPF0xQDXWWI4Xj3RXb1hydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2hZIC7kcCGu0/U8bTDFC8fXavN1RrzbrVhvn6wgR4c=;
 b=PRKKN+m0YeX/imxRZOn+lOFeO6U1ZM0c5XxqGCgUWkSW60/dBmrpg8aEL28AE3s2VFhso5DmM+V0wYcusKhlUkvjbpN8x2p/ifjcS8mJfM+e+yhV/wyrrRGOKG0h7qje6BNW/HCUqVAab2rhUTtOqvrz6dT4UNSbPvfiH9iSpuk=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TY3PR01MB10599.jpnprd01.prod.outlook.com (2603:1096:400:319::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Tue, 28 Oct
 2025 23:10:47 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::6473:1660:bdc2:c983%6]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 23:10:46 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Hugo Villeneuve <hugo@hugovil.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
	Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Topic: [PATCH v3 1/2] clk: renesas: rzg2l: Remove DSI clock rate
 restrictions
Thread-Index:
 AQHcQ6/1iluAkL2rhkmyfDQl5Q3u3rTQDy2AgAej4YCAABg9AIAADeEQgAAbYwCAAAaeEIAAC54AgAALKHA=
Date: Tue, 28 Oct 2025 23:10:46 +0000
Message-ID:
 <OS3PR01MB8319BEE3B3612F42626EB6CB8AFDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20251022235903.1091453-1-chris.brandt@renesas.com>
	<20251022235903.1091453-2-chris.brandt@renesas.com>
	<20251023143141.a1a274104e3704dd8680f901@hugovil.com>
	<TYCPR01MB83278181C69129D2283C7AC38AFDA@TYCPR01MB8327.jpnprd01.prod.outlook.com>
 <20251028123848.57512e792da671b6f8f50be0@hugovil.com>
 <OS3PR01MB83198C16302EAAB7D2A163DC8AFDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346376337E4C12C677446C986FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <OS3PR01MB83193390A5D983E66DAB62528AFDA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
 <TY3PR01MB113468E6C9835E2EB063EEA0386FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113468E6C9835E2EB063EEA0386FDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TY3PR01MB10599:EE_
x-ms-office365-filtering-correlation-id: e75cbfa7-6370-4665-b54f-08de16773a51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?2wPDpKr2oIT7KN2mvuX5R599fIAsV3NObhCw1f4i1kboFrqJRqokLGZmMtP6?=
 =?us-ascii?Q?LDB3PzgWdWDIlMn/sem5NVvFg1AUcoL7DSc0BGRMl4siszVmHA5Rf8fcdX1M?=
 =?us-ascii?Q?oKfckB36Os1pVi4mlib5FTlObu2lBbunyjJQX5DceLHVBghL/oQk3JfAYPEf?=
 =?us-ascii?Q?xN1/fLGEE0YWoqsW4hQfJBeBHx7cF7/6MR/ufAJfj8CI0pNOZZOc4anKjKzN?=
 =?us-ascii?Q?BUjqOS16wDF3zqgNf6/1DKroWa1QNxBHccKU9++ZSmWceOkBfEhakINdByGT?=
 =?us-ascii?Q?v+eGmaJmWwuna8HvwIIed1IeS5ykoGYp1qjnK07Wu0d3S3JCBiLMf632Wmza?=
 =?us-ascii?Q?jz6wH8Y4qc5LaPVvlOK3K1SgUepAnig+7PTPAmtrnNSgn3w+KARJaqPW3V6R?=
 =?us-ascii?Q?TWmEZl6b+yIbfmuOnwGfJNpN6AW1gQMoHUNwPqTL7FbHlEna8XEn1V6lgUYL?=
 =?us-ascii?Q?AmPjkq0uFy4/JLv4GNx+xf7YNvjoKDiu1Belrzs70zx2YEqQcO9yxqFBP4R9?=
 =?us-ascii?Q?/M0li3gQ7dg/r/69DBQW5A6BNK4XO5a1Cm8GOZj75MLZ9sFWEazJyY46hf00?=
 =?us-ascii?Q?M3vb5tYN6MP8i3+JIwwO6s2VAeCiC/Gcbm5FxDO7rdhaWJyDWc09ybvSpAe+?=
 =?us-ascii?Q?su6SQ/fZbbHuow6N0rcGvXkAAYKgzqqIySwnYdErjVD5lrPdJIjMOHfcovj2?=
 =?us-ascii?Q?zjMy9eNPjh5Umfsa20pLzuBrQoOR7mziSRyzauJBGo+VOJaUBhNib3cBYhpR?=
 =?us-ascii?Q?kS7+Si18yGVOKPPA5/1ZJSekgDiblCUnLw1Dql+BzyB/qjWKII/LdRiYaKPL?=
 =?us-ascii?Q?zciVCtCJAfTLf0s0FnMC/t/lMVmNZf+1/rh4PRpnngng9EY0wCam2jm1swrp?=
 =?us-ascii?Q?bUsQczOceTEhTme9Ty22DXQvuzvGiDfCgmS4HW03WuuIACihmLbyPdjv1ExY?=
 =?us-ascii?Q?8YiT+rrQvGOkCzAfZw5VFvH7Z81oHJnxtavVeebWtRxohdQD9NOyPyroWiyw?=
 =?us-ascii?Q?492/P+/l5ew2Q3DTngeop66IhkSJeuyzmDIDWo2By2nQhFPUwK7FGQxW/y+o?=
 =?us-ascii?Q?WhwN74kOjBFD0YOV4riCh5q6AfK1S67yg4pokyzNEKfDroI6iLBj6DehYCos?=
 =?us-ascii?Q?D3cfNTGK0dbrLQUNx1l0O9JWPsb7bws2GKsYk5vKCbh3Va3h7XAbb77bTnC0?=
 =?us-ascii?Q?PJiHZri2oHwPGX0fsFy/9HTqiTSsBrV34eCGFRK9vhfcBwfUTh+ZFdr+dB3T?=
 =?us-ascii?Q?Xwx2B6Fz9ToAvcC75HFNk24Xe6LHmEwdTN8p3+HMEZ1uXced0FQ+MGvcXt/+?=
 =?us-ascii?Q?eGNPlJEVWLhrca+tIqg1huTTo44XYiNAJ96tsW6gNNQXkreYjcEBdvirYjAa?=
 =?us-ascii?Q?FsELK+caY7IiXktmCzl+GRLdCgDWa+lJ8xsjlu+TRNZbJuHF2HoxuepmnAEi?=
 =?us-ascii?Q?cOTOJcr5eBTU9knge16LgCxvlGdGXejl2SeG79ZolMAE3eaFMMTeVRvY26a6?=
 =?us-ascii?Q?Yqc9Y5jTp/JvI0HkrhyBwRhEotx9eW5eT3dv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8319.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?If0VF+6EBa+FgCrfr/auMs7j3JB3KJRN+betYnBu9Titx2MKQHILGh14qFN8?=
 =?us-ascii?Q?t6jCH73ugQ8wQdfX42Gt6SvaVhhXPriB3uqCZr8TVPNzY7G1/A2+mDCJ5wVA?=
 =?us-ascii?Q?frP8afu4gPy6wEDwM9tbKggZIBMjd/NS5UCzW8Xz4396Q8D7d2yF7mGau0/t?=
 =?us-ascii?Q?8jaieuZt2wcHb05DRDa7kj07VJ00xEjTKyrkzH+X7qFIlQ8EaMC84b/dh8QW?=
 =?us-ascii?Q?MU/xCQnIE7DQ3F3DCFkONxkXGeVN6vW4QECV6s9uYcwM6aekloKHliEZ80AW?=
 =?us-ascii?Q?nzrlX7I7jmrUgZQk4VXaLTNSTUghGCXSWpL9mhQFHUshJQ3Vvu6iFN8Iigba?=
 =?us-ascii?Q?JD/FDwcydKC1jEhgOz3jPjyEtRTfB//JsBJnLMJp8eQjBBEgwh96hytcPwAB?=
 =?us-ascii?Q?QXNomEJq/d9Giy1bWOT4WurIk/as2dy9V1mOz5WRUCp/sO6/FiggQvTuH233?=
 =?us-ascii?Q?xiJ9quL2FoAQwnzxNcyzfBaXCud70QNp5RlSrJQEKuGRxhVtWOPU2RV0BJ6a?=
 =?us-ascii?Q?GvlMofJ4FcH9euQtc5ldG1mSki7HNbKCZGH+K8CmNZCPnQCcQmYKyza5WO5h?=
 =?us-ascii?Q?BXUxDwrKDmKDJtg7cSkVToJEvqy0iYL96shGc03SmAoUBygL6irTaQ7f17mo?=
 =?us-ascii?Q?9Uk/wzbm4kkGKVvVeAlG/QP+peP6DxNIe90g6PhuYO3AJZPIZ0RneOTJkw8m?=
 =?us-ascii?Q?0gRhw3n6V3MUrivgDH3TC3UC+slqCIZh+e1TEb5xzYs6ZJB9EbGa/FCk0+z4?=
 =?us-ascii?Q?SiiWmmF2V9PjX4MBVrs/vnB2lC1U3DA0MfrRZyaM1XhveuaobIY0Cb8F0ep9?=
 =?us-ascii?Q?tzgpWZ+4dv27c9Ae1StOPyE3Q9FfTS6RM9JDm9x3kc8LWi0n8K+73UC1hFeT?=
 =?us-ascii?Q?diY6NfVqgubRo6QxhiYo9cnYfG+NfKnjntHKRPnuXAampcFQ6oXIQ/+6QM0H?=
 =?us-ascii?Q?dCAg70qzOiP548fQHb7dbEObaemEym7lfQX29w9oGIdxXy2BNlcNt/9+4IE2?=
 =?us-ascii?Q?ZYaLhmNhGg0Y26qbjWKx1Lq7BasdokfnvvIzaMAKkSYaLT7Ne8NVyZcuJ0Nr?=
 =?us-ascii?Q?GAbShUZ+cYwCG+5RunK5yLaD9cJNHoOBKRRmfVJc3FS8ql2DuHBL6HzrBnAp?=
 =?us-ascii?Q?bu265sR2kfvpzYjUxw0kY8OYSB/5e3PgmnIJ3jHH0S01HCtajxaCAiUYjsm0?=
 =?us-ascii?Q?dbCAReQyuFgdGlTxVBjh9q3UquLcgR2ceAk+zjiyIwSr3RnA6AsSHTtCf7py?=
 =?us-ascii?Q?eoJBZrvbcmJt+Tk+Wn30SMcbrTKA9u6W2tpXgCdR+1l7nPqv1iE3wEGar5oI?=
 =?us-ascii?Q?tD0ZyCTZbpVio20vk/IQi8hKUxjwiZPoDNH3nmv7Pg4EqODg1ceWtwTiF1dI?=
 =?us-ascii?Q?N+XbcUSRFTlhZ9D5xrirlkk+d1MKl4UZs1Iy9xTNICjQg7uUTthK4qHIf6Am?=
 =?us-ascii?Q?/0tnmUm1TdZldhZU3pA2bBU5b9QSarhCe2R8niQYY/8G6uXbyvnImLDq1gX0?=
 =?us-ascii?Q?cut2ytTQmmTPaZZHiazDnaMHlo2tOPLdBZ/KhNvhiPIe6oOGBbpIf1Frax+w?=
 =?us-ascii?Q?UktIywSz5jbI1E4Jn3KE82Z6SBzt7yGhX33aR+J2?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e75cbfa7-6370-4665-b54f-08de16773a51
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 23:10:46.8302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b9I9ktRT3bEohIftHYqUE25y5r+DnV/p/ig3OoP0a62kmOXE8flLOBLz/L75DIBVd3KYeFKDFbeGUq2p38Vds7go3ROimiD98KFuGOhAM9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10599

Hi Biju,

On Tue, Oct 28, 2025 4:12 PM, Biju Das wrote:
> Do you agree? Or am I missing something?
>
> I was referring to your comment
> " Side note, that code comment "Use clk src 1 for DSI " is wrong ...it sh=
ould say "DPI""
>
> DPI always use FOUTPOSTDIV. So, clksrc=3D0 always for RZ/G2UL.

Hmm...

I have code that was tested on all the boards, but you're right that it doe=
s not
match the documentation.

So now I have to change the code to match the documentation, but keep the f=
unctionality the same.

Then, retest it all.

:(

Chris

