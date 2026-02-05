Return-Path: <linux-renesas-soc+bounces-27937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODYrKk5dhGmn2gMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 10:05:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD57F0434
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 10:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59EC73074F3D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 08:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E5238F93C;
	Thu,  5 Feb 2026 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="X754pH9d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010057.outbound.protection.outlook.com [52.101.228.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C04338F25C;
	Thu,  5 Feb 2026 08:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281798; cv=fail; b=WPgjvWciMgFsYAvmGW8z3af6Zk9QR4Rj9LI+MBvIsuHQdtBHj95z7a1OmwlI+rYxyXVHX8zNHxlHpRCSW/OsHxGaSFEQfq3eOErDvRRymu4L1WhJnfy5M7VVNIUtlF4xL/qgP+qMZRw3EmjZj/uzhnypbxWJoSe0vXliv//NpEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281798; c=relaxed/simple;
	bh=j0Ak1ualftTlvH4moI1MWDs7JenF7Q73Sfx9Km3C60s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JaBMdC6SZTmB9fsKSg6emT2TWWbkbhsg1Zky8Eh/jiMSPtn4oX2zzQ2psXTdwQsEZEdz0q2ZH7Rs3tnlpoaEA612v8b7Gr+LfpiNIRF/kPq0QJi7/NiCBtCJigN1Np5T2R1hOYP5lfitmKdgL6LrarOed36ZlHJ0PmkYsBuNUY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=X754pH9d; arc=fail smtp.client-ip=52.101.228.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7Nn551o9Wk1u3hWgqaB4HJc7fhDVpXJINZ47UjVQpM7BCKRMoinK+ULXHvU1e7LBzlx11ydqNEGhqc+Oq4vOA9mCu5/qxrOe6oHLgsrwYKxbhN2cQsDHnq/BXMVeuYAkQuUGe6tg9wSzZuvn1AJyxYXhgrtx+3bZWEEGWTj19QQVHaRCEJzwhEkKK4pdmkUk1p7vZ09mr8iZjyxx/kZMG+1SMpP+7GJeg3On7XHWQUby6WRVtxN64NqhtwezP0ASFB89kYeg+4o/SytL007AdFKefSlYhMXLRMW3pFmFwLZGVPFYl+d+I/X7q09KO7pJdu6Xaopyu5pVntpb+TDMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cmd49l+1DJwcqh3UqimoMME297gEk5FqKEr0hAtWxHY=;
 b=hMwZkBaodB+b0Wxjg2kO/IgBGDffzhlGWSjdptOoDL2QcknEhXR3sw+iM5Zol3aMggp7t6CYiH6MSPS3Ws00nBuz425kWNv+3Vn6zFxeJHuMxiW9b9jAfZasUXDWMTLyBntxiY9hec4UFz9kKlb70sw5ZTwGQ9sIADpfK9IGlymIpR1ZF0ZzlP8D5GQ+dbr8NoQTrAOFrpKJNsEmWHmorPkzOjj9kcWImh/He9tiR8TGwuLXZRXcmaJFAjYwwPwlVZHIqljmY/YcA2v1VfTShEzD/rOlOv1nai71D0sWR1QTwW0BGZK1ZS1ABMYEGSgNLkLpIQgJPbocWk+xe80vAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cmd49l+1DJwcqh3UqimoMME297gEk5FqKEr0hAtWxHY=;
 b=X754pH9dFztOlGBPbXUSZqmJsuYGL5gzFc8bhTryDRIqbLrD4eKcvBwCNaWZzWBn0ySInbdv1T7sXixDqbSR2xxSHWR2iNY2tkh4CiheIdt/kzMuM7+8wccA7cNKhO+Ap87+LAIrUPLcFlausSflJxZ8O5ooofd7lxHWKjyqobs=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB16157.jpnprd01.prod.outlook.com (2603:1096:405:2e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 08:56:34 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 08:56:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v3 4/4] clk: renesas: r9a08g046: Add clock and reset
 signals for the GBETH IPs
Thread-Topic: [PATCH v3 4/4] clk: renesas: r9a08g046: Add clock and reset
 signals for the GBETH IPs
Thread-Index: AQHclPyawgYHi2q7u0ydt5kMAyV7G7VzzORw
Date: Thu, 5 Feb 2026 08:56:31 +0000
Message-ID:
 <TY3PR01MB11346663068916109084975CD8699A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260203110220.265748-1-biju.das.jz@bp.renesas.com>
 <20260203110220.265748-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203110220.265748-5-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB16157:EE_
x-ms-office365-filtering-correlation-id: ac7dae26-4fdd-4d91-d03e-08de64947558
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?DhvQe1g0CeAp05hUFn2w6SWs+bvtt6/1g0zkMElOsrCf8dB8+Rc1z6RzhH+f?=
 =?us-ascii?Q?v0wsfdFlpG43kTiWl919VLlHGaaUuvhRYUCQxKGmyKG2a90z92jPcKasVoQ0?=
 =?us-ascii?Q?o2I7d95Tuw58rlnj442UisIaaENsXW3xNm2mjlKlzEDlRnYt8bqRMgbzXTrU?=
 =?us-ascii?Q?peNR7rT/BsK80wqxOA5IVhLG+vJCX36gJeuikjbJ5foeZNWuaZeMCI9GEYP4?=
 =?us-ascii?Q?EozQYHvGeVrdkNhoRyNrxsxLO2FrDpL/E1kHJ+oxeqIzEPLr8/KF4HLPPVXa?=
 =?us-ascii?Q?/CgCdZIW8878FhwfQCdJWKVvXfw/HEX0JSmo2+/8SHGj3sptYTzhcKZtA/hY?=
 =?us-ascii?Q?Bg2QzEaLH2rRbWNiFo2iexVvZBCrOEF4Eaz11bbchRRnZLwg10uwhCep9Xfi?=
 =?us-ascii?Q?vHH7H/ut+r8hLWhIZYgp8yLjJKFCbjEfuM0KmEZb9q0Dfeo9kDhPt3wpo8q8?=
 =?us-ascii?Q?EKjxpiFykaoMjAgYlEUKoSFnjbBOR10X5Se3ndAXHyEquQ0PLZm8GY45S6vj?=
 =?us-ascii?Q?mhXR1yLoWjuiDPgyb/FpJl/+3Bde1nxUTRft2ihNohCoQDGy0AHGoMuWCB3C?=
 =?us-ascii?Q?EDPUUSEruMsko1C4mZzY1Sez9X7ivvnL0yHMZaA8wF6tlYNf6W0B9O920b3o?=
 =?us-ascii?Q?qwTOXGvhUaehLHTwKzOw+J5QIab8AvpTebyUa3w6PDTqOjyiU+t30LGnML6S?=
 =?us-ascii?Q?qs8ycZgNDPWntcoQpGUnjOqWcFh1+MmPoj5ZJBpHQZxRfyQZU9dHj1p407+N?=
 =?us-ascii?Q?f4ZlIbJTYoP5Y115nq9kS2UlquCTPayKmX2agNwQAtUpDANX6uruDqiwdcjH?=
 =?us-ascii?Q?c0qSL33JnkLFh13F/jn8OSrN5OckdUJXmVJg0TYgGSNgdlwMfPvEK4+q9jfw?=
 =?us-ascii?Q?yN8q1qxk4DAfuooHYU5rEkkT0Pz2F7XKmvTq6Bo7wYkHcu+ee5sImhClzehg?=
 =?us-ascii?Q?pcf1/iG4BpPq3m/Bn2MJ84DdAnJYCqOsE6CVcJHqj2/C/SS4A9RJU6dx5FEI?=
 =?us-ascii?Q?WgWQwxeakwOotwCayqSWVR4yG3E0z9xcyZduGIRZ9iGfdKJ9he0x6M3tUgiY?=
 =?us-ascii?Q?//4DqhCWMGN+cYoUNbta8MhzIarpbTQt5Xk4tMyeJrZ28WvJvjSNwwZUaPTq?=
 =?us-ascii?Q?OfPtxnEoqX51tF3h+ldRow3+OeYnanw8fRFJmda+GwgQNGLPlUyvQtCe0Mm6?=
 =?us-ascii?Q?2knYguGluE4CohGEv6s1EqcFN3Fx+9krAHACoWWLLSeXwNa2Bm1Z4iMuMFBK?=
 =?us-ascii?Q?d4kSlV+gI2afqaqEpoIOm9V902Ol2heSyEbJE9jD3JL559m5lKYqR1OX54TG?=
 =?us-ascii?Q?tTCIYsVDQpw7zYvHKQacITcvlc0EcPEqOLq8bA4nPFriOl4gc2uZVr3hxn6r?=
 =?us-ascii?Q?H25FX4uq09j1WTcGFRsi7R57zKE1zG+QtB6b37XB7wrCQgfW9qztbGn7tTZI?=
 =?us-ascii?Q?BPxOOYz5qytuQV1HZ5eQZWQQOkq/mQVvyfGwLVtV9J564bB3vXqkV0toxLrz?=
 =?us-ascii?Q?Za6lXL9zcdDNhIWDnuGT+PUeSBChtXHBDE6SCw/fz1PmCv3yKn6YKjJalbvi?=
 =?us-ascii?Q?ZOYFEannmCcBSBTG2Yn2jwQhD0C9edlsMRoUnFuW3b8EzPOhrm0LlaMJZrBJ?=
 =?us-ascii?Q?RH9iCENXNIkVlo5/P1ewBzY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CpGBqiCkhY1IV7f4bK1HS3CyIFymVBz1ROdBk58Z3dHZhHRHD1iU3lGgJczW?=
 =?us-ascii?Q?PeTH3sEFVH9nhqr1JnEmM3Sc7bfEq915U8qzpMc6J8XSAQGa6TN3NP82O9w6?=
 =?us-ascii?Q?gfFnu6asGga7+sfMBMT85ZYN9U+d6BZ/tgFFZpJVN8EkA5dBXxEX5yHPGD6U?=
 =?us-ascii?Q?qa3Toa8LfrK2QfbV8bxVTPk7QJbvYV++f6//BaghTHEYmGl0aESWvXrTKLfX?=
 =?us-ascii?Q?um4Y/pPmZ3WR4YyQGWVrwz12XRFRthpzO/Hgd6EWSM5/izFv17LeL1RMyAo4?=
 =?us-ascii?Q?wqrnM4/boWlA8khPRMXRIY6WC9ECIzbTNBpLdef8oXYTwpiAa8Q0jzXp6+iq?=
 =?us-ascii?Q?fRNG5r3T9uBZN2z/bxDs4KVggdH55eynB/5k1i2LE6T6YyUhyiKu71yc04hH?=
 =?us-ascii?Q?kdAfgvqQ2TpPq34n5s7vjQl3ZkgSKgIik1vtx9AqfVvstU7OJx0aSGGyomPk?=
 =?us-ascii?Q?+uDaPl7DudWSHiGDi5R7jGARBPYxDH6StQhesw4pvnclYjmpr/AcBV/ZKhlI?=
 =?us-ascii?Q?iLkySoFKc6NI1/dlggQxBSlK9Ze/PtCayHh/V+oXeLTPcWQ0W7DQ4BnysV63?=
 =?us-ascii?Q?XBVbJrcwYb8mu2eb5kaZakRbEdpJNPsLbSq28c24uCG5W17vOz92ou3jtOnO?=
 =?us-ascii?Q?JP2bJ7IboXpHVqXi+aJzB/sDkL9+kr8a4hRVcKltZRhCixayAcNSl48fEjSo?=
 =?us-ascii?Q?WXbG+m8XsHvfe/WqCSOaltANuv9pJeVUcTje7yf7nmlP+2ZAYeziJGZ0oiLK?=
 =?us-ascii?Q?NclslAiwf/uvxCWMqDyK+RbKPPTvfc2jc0cfhRnjdrOEDC6/su3/Ghe73fmC?=
 =?us-ascii?Q?1aJ54lp1RjdG/n+4nV4kjIGVBjJ3iePLYjeU2YF5KJbcd4jaJm8qcLNeAtZ0?=
 =?us-ascii?Q?ncLHsvOHiw85K0v300a/gNdinw6flIVxLEF76JSTRbIqyamZxCKK0JnncLli?=
 =?us-ascii?Q?k51ojBgD7BCF0XdgrfXweGuV+7Jl/fmZQaspcUZX+lWedF+GrI4HFZhgCrcP?=
 =?us-ascii?Q?p2qB6v+jHUz8QN6xg7MRVKZdHMXT46xRwAOvzhkmKOrq1nzFQDXxDVqoooXM?=
 =?us-ascii?Q?Ux0XqSzQsFDfdkJl2rF6QEPqgM27+LfoUzSDeQMSi9oUxIz9OKWLXr81MeGR?=
 =?us-ascii?Q?iWeOxCLccAS0lgi7nTciq/DTsj09XCqg/rUzxQirvAZndn1tHjjPncNHeRr7?=
 =?us-ascii?Q?Q2+vgsVBQ8r+7nSfh5MS9gVslCIvUVeJiFTP2j5RIrCdIbgs6hXynR10JhRB?=
 =?us-ascii?Q?17NSVPPR7vMvGKIzu0mobP34HG/7g837JC0ihHpedBDPZAOaV38q7sKrc607?=
 =?us-ascii?Q?P5xr16quOUWjEyVTYq1bRV6Os95qSHUwdwvY9Y5afet13FNu/KExkpqcJ/lm?=
 =?us-ascii?Q?X8l7zYIGPy5VyZAoiVKWmI4vuSHFt7HdRvNrOu/c2j5hVnVgP0CvzBy7S1Da?=
 =?us-ascii?Q?RxmvSSF/b4R32LbSuCzs3ZB8M+fGznDAtzjrTFi3JitFaQbKHHeK3dFti5bX?=
 =?us-ascii?Q?idRFWaP0t/0MM7z3Hc/8rj8MelGros1f4/Q8CTLWaK5S3F/HfoBCZPnB7bcc?=
 =?us-ascii?Q?IFENvQ567zfQ3PI6SKKr7jEdKdk3tCw7NpMOj3DImw3k/8qidFsDkD05jKCS?=
 =?us-ascii?Q?Ij7NPpUlnIxQmTU0BRURQGPCCFkkMkuzcdIuBQyqiRi2qfIZ3JI9SPBimPjb?=
 =?us-ascii?Q?fN00DBkVJ3vxUCo5Af/Xm3O5oEr4lNFhkCUsPoyIhEQHGgLX2gyS16EIMi4W?=
 =?us-ascii?Q?kUSQ/vvqag=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7dae26-4fdd-4d91-d03e-08de64947558
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2026 08:56:31.9667
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TH+HQ9ISb/ltd7PW+JORoy8pXNcOB4WPlAa+1rVBWNPgFA7g6/56W23Ip2CIA+Wzm89m3YBFRlOoDJenVhs3yOXWhU6S4VBH1ejXn244PwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16157
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,baylibre.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-27937-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 0AD57F0434
X-Rspamd-Action: no action

Hi all,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 03 February 2026 11:02
> Subject: [PATCH v3 4/4] clk: renesas: r9a08g046: Add clock and reset sign=
als for the GBETH IPs
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Add clock and reset entries for the Gigabit Ethernet Interfaces (GBETH 0-=
1) IPs found on the RZ/G3L
> SoC. This includes various dividers and mux clocks needed by these two GB=
ETH IPs.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Added eth{0,1}_{tx,rx}_i_rmii clocks.


Since, this clock list are part of PM domain, PM framework will
turn on all the clocks. So, on the next version I am planning to add
tx, tx-180, rx, rx-180, rmii, rmii-tx and rmii-rx clocks to
r9a08g046_no_pm_mod_clk table to avoid enabling both normal and rmii
clocks by the PM framework.

Currently, Renesas ethernet glue driver supports only RGMII mode clocks.

On future, the ethernet glue driver will have 2 LUT's one for normal mode a=
nd other
for rmii mode that select the table based on the mode of operation.

Geert, please correct me if this approach is wrong.

Cheers,
Biju


