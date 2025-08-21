Return-Path: <linux-renesas-soc+bounces-20861-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE35B2F47D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 11:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6077AA57C4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 09:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00BF12F28FA;
	Thu, 21 Aug 2025 09:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QHWyJoY9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010051.outbound.protection.outlook.com [52.101.229.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6677D2EFD87;
	Thu, 21 Aug 2025 09:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769555; cv=fail; b=Vhqo8o+cBnKSJ0JRfE4HHaikPXoOPHhHPh8ZrhIqRh6bnuaEMjngke16+ALrVfk1+Dq6jKAsf1qWw3YmgYsPkm3BVihECp4RNoyPuGU/kqYwMkz5jWBLWYcq2uYGrEIJQ1NAkEgAqxhhhqq3OAwWsvXdU/85HkQwc6KQNBtK/as=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769555; c=relaxed/simple;
	bh=XJRzcDSBwK3wYGGu6t/a6hjfNsCJYgfXP52nY441lSs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aHfSRUJMWJWC/RVso0O2RcHVeddpoP9KW78DSgewwxvUQCUue8NqL5f63RTXDOVdelJ02nQ4xeDOm7/krs8nZW7XW5S1yoB9yVbe0Tg9iVAdjMo3cbFhZdLyP//waTUGkfHAA8Q/wg1utV4KPwE22oD1SIPKnKLHyz9Wnw5CuOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QHWyJoY9; arc=fail smtp.client-ip=52.101.229.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwPhvQmNWMZFDFO24Jb3PMtIPtC62wU/9Qaf7+LslC2YelzXVucFeT1PCUts9u/8I25zA+Bh/Oclit9hnGtJXwc7/7cqju4Kw/jWm2rrn+fu70mwS9e2VU/cz28O7sCJp1x3hVQaIT6BJkKbzS11jPFbTnpPDuULcRYs8J/VnfrtywtGWS4isNoM3yFOaaOuhHRWOTaZPPPg2XwlRzhxHDJHPyO9Zwcx+QKcQDV11snW3Cg0PM5luceBWhEf6orDjwKFbIRmMx3Ehm4IHAmyiTBBRknN/GJtWIk3A2BVg0VMS1A1h0jqlV2KVT/KsG8cbrldkfRoori0C1kunHczAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XJRzcDSBwK3wYGGu6t/a6hjfNsCJYgfXP52nY441lSs=;
 b=lpZQesr1zl2vv7DtYEfTVkK64J2GLz/1czxFhyIGO/TliFpeFelRgR2PplybRnh5iHHZEo/MfHq7NDnUs29f9hYoPfE03MJDLovLFZovFYebZvcYzUbZUwPR9pJ//tW1s9G0YtQtRowuL3DiDPr5u0Fz/erC4/oJHgzR3erqBHHQidnqK2g2CUdsH8wdnkZPofd3MSc+UpWPZ1+T8tDzXJdLZF6iWUN9dRzEBtL9PAOlr5m0j6RdfPR8NNqnQVo7bcNAUSsbRywvdHcQfV66ppcKa3loldbX/dHTInhEWLbFpFFp6OBCVcZ6ZK8Dmk2oLqFQujKOFkVHLOUzMT9vZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XJRzcDSBwK3wYGGu6t/a6hjfNsCJYgfXP52nY441lSs=;
 b=QHWyJoY9p5btXdGnI674XRzDJHdoC5A5IxhUN5b2zjbe0+1tZDbHsge4PsEWPj0ewYc1yAd6n//+eVIyrc9i0CnNCcHELBPvq8Ur2aQIYjOOZUNfLAZxIflEwXe3ZNpwNch5L3gNjrP0TW5SBf6iVtDZW8m0yed7/IA1cyZeKCw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB6069.jpnprd01.prod.outlook.com (2603:1096:604:d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 09:45:49 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%7]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 09:45:49 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH RFT] mmc: host: renesas_sdhi: Fix the actual clock
Thread-Topic: [PATCH RFT] mmc: host: renesas_sdhi: Fix the actual clock
Thread-Index: AQHb6TXbfHLMvzblLkub8satum1rp7RtLTOAgAAAZyA=
Date: Thu, 21 Aug 2025 09:45:49 +0000
Message-ID:
 <TY3PR01MB11346A9044FB08D8E9B4A0BB98632A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250629203859.170850-1-biju.das.jz@bp.renesas.com>
 <aKbp2x8MaBelS4Wc@shikoro>
In-Reply-To: <aKbp2x8MaBelS4Wc@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB6069:EE_
x-ms-office365-filtering-correlation-id: 9c53c0fe-8dc4-48c3-fc32-08dde09782e8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?VKkia1e/K8HpaP+PSAQKgLlXojjrbW5+/qBcnetF1+7lVAvcRiSdcIoDwBFs?=
 =?us-ascii?Q?cYxyl78RBgWerzNsmDSAZ+KnvnR0Xu2LT2kFeiKPVJF7AD0MI7iCDerFBDWy?=
 =?us-ascii?Q?Tr3lzxmhfrfIeCKtzjOCIxEWmrLA5Y4Zh2S9odN+Ys4HTo0L9Nr9ASSlwV6K?=
 =?us-ascii?Q?Svoh7Hqg/oq4EMtnimzXyazGmE80h8Wl/uDggTEnJocHxxmdzps5iTxLFrH4?=
 =?us-ascii?Q?/MzjoMXA5i8kE2w440QF5joiTaMxhYTd9d2csmManGTyDRlvRUsnKICeOcWm?=
 =?us-ascii?Q?UX+AuArqS9r0E5VzigXl8W+JWXpPWNGnUyvsaUwtAGE3F66Yy595OTatVn3V?=
 =?us-ascii?Q?qxH9mc2J+z3yQqRFIeh9oZEMLSxKQ8AuULm0Vvb5I/bH1QBngvQbxD8PG6BA?=
 =?us-ascii?Q?LfL+FqkfRiyWZFjf1l5J8Jp0fz37gpcSFGu+o8r0n3aAeJ6kOSsVYrR91U0T?=
 =?us-ascii?Q?WS9lDBFyft0RLX/DJSYavWsH/5RsHZ5BM9+QSCyMioK6I25sr6twHSH/EB9I?=
 =?us-ascii?Q?f4/nv8jubEzhbj2Xs+/XIgry2VUaghVH0EqheIe8R7P0AyFpkgYffOscIlNt?=
 =?us-ascii?Q?BJQSeYQaCP/oqMMpZxeAlozY9qtklKYVvR90UpNuPxzb1TPohrCoBmhXdIQH?=
 =?us-ascii?Q?tdlAxcriY/5/ZrnvIgspBQJfimdixUWyNqLjEP1yIlKBimQDn5o98PiqBYQU?=
 =?us-ascii?Q?K4B+FSaJVDWSa8GtfT3Yux/YIVAlTNjdQcFrMpAKPyZDWcaAgfx0//+BwCgN?=
 =?us-ascii?Q?+v3pf5U3ix8Wxumq1UbdccJCZBtrGLyEqcP0OrSvNDU4/2KlJXcKt56oebux?=
 =?us-ascii?Q?Hd75nGILasjuH5d4fVG8mI1Q4fgtgOa+6HsprPQPP5pDraYItxRTFQ4bYF18?=
 =?us-ascii?Q?9YaHT6EgK0Qr87nPe2JL6Qofg3EJ85qkjkYF8H17Jg1vq/G6E5kahtFXI/hp?=
 =?us-ascii?Q?CU8PIDQUwFN100nf+LCqbBFjRyaGXRBtouEpoNmDLKH/vhKAIJoRhlFOjUq1?=
 =?us-ascii?Q?nfs62dmtvre5rZ40skK80ki2TjgOveqAiekXf6GBHRXv435ryDg27eGkqXKV?=
 =?us-ascii?Q?gzoXuDmscdJRpG8cphDyAQw7Ft5yODFhBfFmuONouVUOEgYpxkAfZsLo6jNk?=
 =?us-ascii?Q?0VDgm45QVzsJYvPfmPZjYK5uxrjGF/cEE4twuZvfkGnIpbJ2yVLGh9voYoLE?=
 =?us-ascii?Q?pGOR78YOWt2YwMJs9yfuhgML3mThY+Q/qWs4uX42cTAYpdbO+qWYQyWzV/Ns?=
 =?us-ascii?Q?Bd2F6iy50XQ2o2VOrnsj9kn2448v6EFWW0kHPpryhGAHLcYeuMKDSGGAEbMt?=
 =?us-ascii?Q?xAAU4RaqDLZZBXsJ6K0su7IDxxXgpXjR7CE8p/WXEjDGBv/6BT3AS7r8Rabu?=
 =?us-ascii?Q?A4e4CKdXke0f2qFpPTafT4ohdEvO2f7kCXuM9ulQipebWHcREFrfm+LgMUM5?=
 =?us-ascii?Q?dqL1MXjn6hgUs7b/S6ETE76jC4bOx/6Fcl8R2FbOn8Vmpd2YXqAjNAW+KCVI?=
 =?us-ascii?Q?653DrsC2xJY56H4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?c1JeUzpoZkxlTHQGcLsyEhCweRHYiG7V2TlrsQbgjzvUM5NYkAGBAqbxNiu4?=
 =?us-ascii?Q?gf2fxowMh8m3BUggvyCZ2Y5dFn8hgHpvOhgYbQV0t6BNTlWqnoW7wrdqHDjp?=
 =?us-ascii?Q?dsnE1fuJW7dyyZuXrOjHQBG+pZG2ngVkwsoyA7I9abbGV0J0+GXurLNinAVF?=
 =?us-ascii?Q?H4Kz6UvTmLqLFWhImOUl0gES7QEiSzoJF2hQeOxOQJFJPzNpDA5dajsbOIKm?=
 =?us-ascii?Q?TFRIawCbe6rNlEsCnyWDY5xt/MXV0p/DrIC9Jul8q5pWNlXNjoJnhhORQTjH?=
 =?us-ascii?Q?jh5/c0+qkLZEiXKFlZPeAlu/s6FcMKwwM5LdFuC7kR5tarDSIG0bkRD/3eZ2?=
 =?us-ascii?Q?yd1MBB/YBgS76gvPaN/Uilsfc8W1I3oOI6c0DePcu2C0wKthUwCHGLozv/we?=
 =?us-ascii?Q?j3LIJZgD1JnxJ+vuoNzNOGcA7cmbLwtvD0Q+1pNukDPDz3On8AEZzVGB7Mvt?=
 =?us-ascii?Q?4Abh1F23y1SPJJlPRBGm3nNtEa/yMNRmiUSeZif2mAFMXP+4MtxXiN6BJvdW?=
 =?us-ascii?Q?w9dzHEzkw4KKcpnaSqflNrulI32AYQMMST64T2IbuRputKHiZA6cJSAbxMrc?=
 =?us-ascii?Q?j2GE//g1lTnyX5QP5eIJ5W+0KJstSv0dHGD5r9Q0HaMJ3HMsYY58PNANwhu+?=
 =?us-ascii?Q?ge30MlWaWXcqARMabDPKxtOLZ6RIZRgKEjpIc1OPxKYy+WOe1w9CMFjMvehG?=
 =?us-ascii?Q?zLI5KU0vtFN1gQJs+C33A9DqbnlL2p8etqemh85lrCFmPCNefs7zp9EBF6SY?=
 =?us-ascii?Q?7OmPc0X9LsG4AahjsZ0pRStMQDBXt3cNsAzXKCYbIm5Sb6x/CRwiL+Hewhrq?=
 =?us-ascii?Q?JvH1XsW75ma+LPmMdTaVryJd3cViBTCvcJH+/pqMII8lhaL8rf+OYN5RCewg?=
 =?us-ascii?Q?5yni1OhndjBOU5AhLWnGpC8GaUMqIo7mWUMxdQjt03OoNGORRne/cIIgu5IP?=
 =?us-ascii?Q?s8iuq32dZPXeVYwF/YyAIqu76U1+jq4e7lwLv1F9BRgxot87nCBSznm2mV86?=
 =?us-ascii?Q?TzmaF5QfqfxIFeisxQNASg/+syv9l532tCS+NM4uWDOJpvyAak4sD6DUksHM?=
 =?us-ascii?Q?Zf7ZEkIq691JUAkcO4UpKhCIoLDZNL97Pi8b/Yx7Qn7sLeBiDBw5y9TgQFlf?=
 =?us-ascii?Q?8zv+4vNeuyg69WiJfoRlmuTUHHicZnnLXRjJpQ31pEWEUjMmpWlagizsIhxD?=
 =?us-ascii?Q?Jn4Y6+uLNMaMc7bBpDXXNW+lxG0PD0UcLgHnB6BtQfl4yzQlXCiERlO9+qDW?=
 =?us-ascii?Q?Qm6KwnebnRS8QAw4KQmNR6XPVCgrnWIc3Obnkwx+KDy9PXighm2UteNrcZpA?=
 =?us-ascii?Q?XH4nnfkTRiNoSwll/QSzLyMcE6aNilfhljSmNu9zW/WU69onXRUQeQTuVhzC?=
 =?us-ascii?Q?7Xa8znd97tUuJRHBI6Y/ScL0ZBIMvKussTAAM/30m6llMKEDZUYbgIYtLyDl?=
 =?us-ascii?Q?KNMp5Bphh4KvRBHnATN80gmUk16qP7Z7bcYo3iq+M+vFO/E2r3i15SXj3VrQ?=
 =?us-ascii?Q?oEdbR8+scfIDfxck5RKGr7oggsCAIkz1g3NEfU8oYLPxOc4MjvwCLk8kQttW?=
 =?us-ascii?Q?teyuyoEE9iGmvTu70b21srJoTLrQ15lioYwdIPakul/faulHtOikc3alMm4z?=
 =?us-ascii?Q?Jw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c53c0fe-8dc4-48c3-fc32-08dde09782e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 09:45:49.7182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4P1LTQLtHuJ/bWcSZKUeg8EQztPBwy+JXfq0eE/X6fN/+vQjYqCe8ixAYIai0on18yNqzoi9Q+YnD1hyJW59u3tJnTARBmhZNOPO7NyJcAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6069

Hi Wolfram Sang,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 21 August 2025 10:42
> Subject: Re: [PATCH RFT] mmc: host: renesas_sdhi: Fix the actual clock
>=20
>=20
> > Note:
> > For HS400, the division ratio is 0. I don't have a board with HS400
> > mode to verify the fix.
>=20
> I can only test remote this week. I tried this on a HS400 enabled board.
>=20
> cat /sys/kernel/debug/mmc0/ios
>=20
> and
>=20
> cat /sys/kernel/debug/clk/clk_summary | grep sd
>=20
> both report clocks of 200MHz with HS400 enabled.

Thanks for testing.

>=20
> Seems good to me?

Good to me as well, as it transmit data on both edges.

Cheers,
Biju


