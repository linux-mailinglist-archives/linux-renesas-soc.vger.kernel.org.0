Return-Path: <linux-renesas-soc+bounces-7041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 973D9925CC5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 13:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ADE42C4586
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 11:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 500341940A2;
	Wed,  3 Jul 2024 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rouBGpPa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010004.outbound.protection.outlook.com [52.101.229.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4E51922DF;
	Wed,  3 Jul 2024 11:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720005097; cv=fail; b=uAor0DV23pHBt5rCP9G7Dk5hCa1iTdkQFU8U4k0o/0/t4E/0mW91WFtY1X5/CGnWWPACh3JQRSUSwL5zy0gCR/X2DZHH161Z6Z513QUmBT+//CDNml0nZERI+9bp7LsrfpwzBfB9E0mK6mElclz4NWJk5Lhs4qNRbtelDm6Bu+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720005097; c=relaxed/simple;
	bh=qbGUlACerd+3QXeWpypP75gU0ZDl5MPr7jj9IOhWZms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tbTj8OGJzoeIwqI40u6jIpxRy6NpFey1NbsUoOOgk+n6AAkKx7qJuLS2xsVWkXzS9QMEJJXYyYIlAQFLqDb9okzjoEeyXStcpErV7WalouRQYqgeh5pKA0CjD4+UVsWlprmBCVOqfVkkVLV9/LTLA5Qkid7h/eqJb2lPjtUIxk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rouBGpPa; arc=fail smtp.client-ip=52.101.229.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FMd+prM9G5z1NYDy0w93myHA/RMVkRkmzeDru52l2birWtZ3SFV+UufQSRFCHZzMDoQ7cHJNL23BDJqyiSQ6lf+TKOIKOcjFPNJUjfwlX850JBy951xApoqFrKrir/h18eD+gzC33xHiu3QQSU6MFVFM11L+2HWSOybHOoRQurWTVl1P9bMyDycLAh1aGw5qkX6/szRwAC3fgUuaJYVpKf3ATxAk2Q9USpd1II4eoEu+lxbBOxSU1v/WG/4E4plD8YoZtHLxrw5udQgLIz036neLc5Mr8+bxXlful/yzi6MI5LHxFE7wg4MuT0j0A2fFK2FU4FDn0XySIFBiYj1jJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbGUlACerd+3QXeWpypP75gU0ZDl5MPr7jj9IOhWZms=;
 b=R427mCl9Q61FGaSbKC7yF6xvY73GS1GRQp2zkFNV4M8SFtaD+l3Lc+xmUNktS4YSpHDj0XvR15UvUrJJ4R1dWF8Odb+l+suyxwEVw+XLtRm6+6clMvh/SsG1h92Z7t6dh/s2o+tNSs/Xl/JmxqfTSyBAb8jLIg/G6ACBbEaUfhVCZROADbJg7w+jJ86DKuqBT8I8LQVbWmcPUJ8W9kFYrntE8xsd950lrL7VXPW/C3pSgjMe8ctWjcD5RBDCkazQzTrYytGbCgcZUxRD1LWYdDeuSpRx45GvQHKsFSCo8E8EMXQsQgoE8IcVCkWjUVMYAmTw9PyYwQbzAR0DzAMUaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbGUlACerd+3QXeWpypP75gU0ZDl5MPr7jj9IOhWZms=;
 b=rouBGpPaqrBvfUwhRpsDjxQ77YgTYlvBQgJoxhoIyiF6aiJ6zNXyR0fgpdKnOQqptsXNWixZMe6NpO3HCKRBpzzj5kysnm1CiERr2TGebcdmt3jmogSWMJEp3m9+4KcVMg/9E5ETpdK+8irty/k6hIwv9n08Szxt8RP1fD/Y2PY=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12462.jpnprd01.prod.outlook.com (2603:1096:405:105::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Wed, 3 Jul
 2024 11:11:30 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 11:11:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Prabhakar <prabhakar.csengg@gmail.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>
Subject: RE: [PATCH v4 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Thread-Topic: [PATCH v4 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) SoC
Thread-Index: AQHax84UDZ/X9Vch3E2VKlZN8JU2HrHbXbgAgAlriQCAABkg4A==
Date: Wed, 3 Jul 2024 11:11:30 +0000
Message-ID:
 <TY3PR01MB113468B2E0C2591024A7933CE86DD2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240626132341.342963-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYCPR01MB11332F92C1D1987336FA316FD86D72@TYCPR01MB11332.jpnprd01.prod.outlook.com>
 <ZoUbiEy0AJ_JVVd8@shikoro>
In-Reply-To: <ZoUbiEy0AJ_JVVd8@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12462:EE_
x-ms-office365-filtering-correlation-id: f527bdfd-97b2-4ad3-63d4-08dc9b50e408
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?c2mTDFCrIg0u7J+7lBEu4+IG38l66+fEsLna0f8OKRBmKjaeY9qGe//OxufJ?=
 =?us-ascii?Q?JurNyYNc7+jwzOiOBtdEJE0+f9S0TVYxkWn95hRi+/mYXf6Z2yB3RtAEVdjX?=
 =?us-ascii?Q?TxALTqmvfgRLpm80KX31GB9M9XmjPIXik1qfUIsWj8iMpR/UGcI/Jv0UGsTn?=
 =?us-ascii?Q?KwP3p1yUKtrxjsr+j68lYDJweXgvRdOi9/59BrBvYaOk17TP9kq+00NyA2Ag?=
 =?us-ascii?Q?65HWLOPw54heypUp0xODM4RDIR3KhKQ+/EzrfORSTykTuiqIY1oeMEPKKsC0?=
 =?us-ascii?Q?XmwcJpfbnQh4oJSgHovuAo7HHkSgI5cN8TrJpFBVEx5fyP1KBQk1JDQLMWTZ?=
 =?us-ascii?Q?G3RKuxnAFlhHupnqyV4toiLyk/hVEGd2/0Rdc/QiRmlVXAKaBO8OGPztYcIg?=
 =?us-ascii?Q?T0UlzJ+rzbZisVS4Ccevl+Dvq9BhHoyydlkvX7FFVBcci5q5bpM3tdZaBxiZ?=
 =?us-ascii?Q?UxEN+LtAHX6RZy257oQ8g69ioGogyP07sX7WibEcHuLHeqiu5YoVp5zbTUe8?=
 =?us-ascii?Q?/sH926LhD1/b51y1OS2zSH0oppekTkHYeKdqqR26tjTo1hIrCxxO9gbE3FzJ?=
 =?us-ascii?Q?1oLG10l2z71orqvUb8o6iJW1R6WYat0D+UqTsDDRUHtYVwoeqfYxIUgJ4IoM?=
 =?us-ascii?Q?czFgkJlPGn+4kw/0Kb/lRO9XmK3x6BkzuhNZKqcWcFfdq3S0ZtlSS08mSMVj?=
 =?us-ascii?Q?AE0ZNghgjqNFZLOLsLyPR0FFlG9YKczpCH9DoOicMACkmdR2rpwO5NC9pkZu?=
 =?us-ascii?Q?ywReTMjP7bmJWc8T+JcTkLczIJ0VuxyQ1L0BD7a0tUZyOLOp8kdNeiegg0R/?=
 =?us-ascii?Q?73adbneR3LLqnE8e78VU7ktHAUTtsQPPeYWE8LOzAETw3E6Kha/SQ8iQcIBX?=
 =?us-ascii?Q?apfNWwyt6Uc1Ryys0Gd214f5mkncdaoKQtmXgWDeLw1JUGh0Y5mwLojsjOyS?=
 =?us-ascii?Q?W4PmI1zyH2/VVs3f/7JdekeA0gjqP4oTHkvNSkCrh6h32yexbvtYofCxyd0K?=
 =?us-ascii?Q?l6R7rXSar3VSfX0jnGDWltAjTRGvTlBpwOxirphGsU7mp4StvLHDGmpovcCr?=
 =?us-ascii?Q?0iCrbpFnGGZnBsYLEj4Woo29qRujt3JQ5QxU7vindI9yUAEkzuSMKOii41U+?=
 =?us-ascii?Q?gAXcwVZEMD5oRWNMHkZivZ7PudaVEGC3sWr8EsBwVD8MVHU7p7c3d8bQOJwQ?=
 =?us-ascii?Q?ZTqfgwYvacr5diE+mVGZItyx+zEGSfT5K588t5wQMpNhCG2ft/ViCVE46a3j?=
 =?us-ascii?Q?ijeSiDayKh8fn9ygniYk4a3Iv32MwAE+jLaDZL5NRmMJoCJ0IMZ6jYZNYRRe?=
 =?us-ascii?Q?fDHOIOS2ZiaQglqi5UNnkIJkBu36EQ41dvQSePsgBiVuvJ7pzZksMWQ5EgbZ?=
 =?us-ascii?Q?vcbfvU2SqxS0kQMl9557RIMksC1Ig6TI8Kz7j0HUWUUSJGW+Hg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Rny4sZ6sMO1ipbFH5WFRzJtnXJrUXlyfiQtDk4Td6KJEhUHN6sOZOLetfUKG?=
 =?us-ascii?Q?fd7sM3N80YE4Ebj5Sctq65RZykgrHWdi4YJkR7ElSDfL4ii4VbLa+WASFy8g?=
 =?us-ascii?Q?w1CghdI1Cp6S5kuQ12ovjbD/iRmIZkPqidXj7Pt6W8b/5ivwPjFLPyJ7sM7w?=
 =?us-ascii?Q?25o8hdhgX7GVFRScwHc9EOzBmdK+RC+pKeWRCphajtqM2bp2cJ5tfgUXZeBD?=
 =?us-ascii?Q?VqD6HhlPWJp8dSpHxl62WK2httDIS/dQHDlEw7tbFs5pq3raG2emPCPXWeO8?=
 =?us-ascii?Q?8yXmbacWiZUDB2GSrDFn0j/B4YuJHFo4GwskC2kZg9u9h1UVrfWmYTfw0mWk?=
 =?us-ascii?Q?YJLUKG6r9sTI/RUU8DKpaHqhrBnYCHyBrUWLrsdLeYE6WPSDLaNjBcwAum5Y?=
 =?us-ascii?Q?m6KZcxkCP7WInb5yf/a2D8E9EMgUCE5ek+050hj9nIOY2fSmb5ddhS+MRsVS?=
 =?us-ascii?Q?QHjAj7CYpSY44l40pFVLkB5R70IPlh5TOt8Ft7frtTz9ZgXWShVq+Ma6b8VH?=
 =?us-ascii?Q?yG7udBNSVIjHqWNM5oujqxWJKevDkyQqk5qsfvYvtLwVHvww4LItswMI27XA?=
 =?us-ascii?Q?tRBFL+PVSjFWY8gyZwtPZ4UPu6D+RIv3IqjoYap/X9vAXdpyxyK54qBJtfch?=
 =?us-ascii?Q?SYw4ZvHYEk74gWK9MZA6ZYlZ6HjeHKnjEXSgWtvcqJnH7FOj8fpSM4qgxAG+?=
 =?us-ascii?Q?/a5CLoSp5PRzLaeZLfIKEbp9B6VAFUekLsRnoPk2TLYvZGvNv4JaSdMiDZLc?=
 =?us-ascii?Q?D0XNj4xdmvLHEOF3WP/6qFBudm3VuUZRdAtrpBafIv123cfenQoA5XbrFn+Y?=
 =?us-ascii?Q?JMi9eVUhMDj076/MisuNawauqt3jfr6O79bAVUsAjLAMyHfWOBB+DVPaXB02?=
 =?us-ascii?Q?e2kygtElZYfwaihIlTqP5KzuGlnbpbKCRijVu6S0l0hfoOy35k1ymlrNHs6Z?=
 =?us-ascii?Q?cW1y7eAiGg40SI+ysAhnL2wqGiNOwXazEDyH3g2L3s+3/7Y4iC6bVaBASog+?=
 =?us-ascii?Q?5pOKTAu/87/VbbVFKWOUlFhoIksNfXUvrCXgP0GFw4WURwpsym463tcTRRBy?=
 =?us-ascii?Q?pCWiQK3lPDsDWm3d+z4QyVWz6Scox2INM1cIYrd4qju07dA8IVVftvkcZ29d?=
 =?us-ascii?Q?VyCkZ+eEqAkr6+LVnaK1fDp7m4Ob5rIr0WxsALgSAqhjsz9CSLkIgOE0sWAy?=
 =?us-ascii?Q?8pok+hmB88lk5K7NDt3qy0qQl6ALHBhqAlyrsINqOeih42KfiZ44oba5yKBt?=
 =?us-ascii?Q?q030y9l5YBbAwvZXckgA1F0kqECnWzXHWgx54QzMhhFJMj7PgvIUEgP0Mv6x?=
 =?us-ascii?Q?E2xBez69bCYgzbWgx7NSIRmNWV3i3f36leTHPy79k/7bWy6NfReRLFlQfxvf?=
 =?us-ascii?Q?8682wqO04k4mY0Gc7C6Fe08Ii0S1VM1nWXVdSVV7mzNuTMN7HnFC0PkRMfU5?=
 =?us-ascii?Q?XHJMMBWHcqSMdQ3KGloqWA+8msXpjD98VPwJWmyREYq56AdVIKW3QJSaAuBy?=
 =?us-ascii?Q?kbGUS0yCPG52+G1VDjWHsVIi40uOqq4/riZgFvTGfzV3kebJUqxxMjtrx2gP?=
 =?us-ascii?Q?lTWn4no0KScI9GQT9yPLZaraIUYLQ07Vlw83GZIK?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f527bdfd-97b2-4ad3-63d4-08dc9b50e408
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 11:11:30.4583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O41ZP2v+ywZnQHltZQ2xoHvh3K9gEw8Z6XuhZpAy1SzDIcdeduDTHk3YKn5jxCmnbYXxmAwW8nswBb1wBvhWDEwTB+wgyrQu606v5kDiNMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12462

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: Wednesday, July 3, 2024 10:36 AM
> Subject: Re: [PATCH v4 3/3] mmc: renesas_sdhi: Add support for RZ/V2H(P) =
SoC
>=20
>=20
> > If I understand correctly,
> > VMMC(Always on 3.3V) for card detection -->PWEN pin
> > Vqmmc(1.8v-3.3V) for UHS operation for voltage switch-->IOVS pin
>=20
> If these assumptions are correct, then I am sorry to have missed it. I th=
ougaht PWEN is for vqmmc.

The assumptions are correct. PWEN is basically vmmc, which needs to be on a=
lways for=20
the card detection.

> If it is not, then we need two regulators, one for vmmc and one for vqmmc=
. This is what the TMIO core
> expects and already handles correctly on its own, or? Except for the rese=
t handling where we need to
> preserve some value in the SDHI core.

Yes, probably for PWEN, vmmc regulator with "always on" and "boot on" prope=
rty enabled in regulator node.
So that it will be always on.

Cheers,
Biju


