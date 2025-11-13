Return-Path: <linux-renesas-soc+bounces-24538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C970CC5628D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 09:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 596CA35138D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 08:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DBC3203A0;
	Thu, 13 Nov 2025 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fB6//ObR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011015.outbound.protection.outlook.com [52.101.125.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C1123F42D;
	Thu, 13 Nov 2025 08:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763020964; cv=fail; b=eIoZb9GbcOCg6Y3cIsuF7ZsGxVu7YFjD5nFVUp5C4HHE7hH6el7CdGfqCnEsgjd76fhh6kzcVo7xBxuQhXvMwC605gmmVg4yRPc68OqkOfXTjHn4oSQkJWRi4ot2R2vd0LW06NlybqvGzu9D/TxCyyPSj6uolChUnHQdHKVx2H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763020964; c=relaxed/simple;
	bh=NLUP9J5KRybyYNulEQxtTpqC1gk4wcWi3/A+dDMWP7E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kYsEdlwQxOimgpi7PqnT7XOF/SSg7/8decCMcvB+mMWY0DMm4tqTA3cFPJOZ8RHA/vhCxNeu33h1sjv/TgDJMHl50+Elo+/ZWsXsL6rWDMKCissg2woeNvz6vdiQBtGxT+U2y6uINhRcYhRCDrr4u2D9Sb9RPRqfsqYtudFtncU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fB6//ObR; arc=fail smtp.client-ip=52.101.125.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vKjI+LOueaOegcjMnkKkRLofBMY6sl1EOYO9zcDQSDsCDjQ70evC4kCcvxHP14etoXwpKKCv7Ld+3cApIVkWKgU7xMPPeN7S3HFyJwYMzdkFG5uyiXZTQPISqeV4slhluIsjkqwX13og9Lq4WoPh3WJhawNOf3izsXbvwdF1shbQKSwFnquH25V8NZtCy+9UOFZ1HNlPzmurg0LKF8p3+kD3W/5fmTWEgK54xSHJFqyvbzLcgP8E3aDVWSsIU1GGFpTWaS3kPfPeGN5sNxNfiYK5aXwmHFx5IktdaUmf/Wn7LP4Oc0Dspww3IBCnvjhenAdrMerH6WEahJKofraF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLUP9J5KRybyYNulEQxtTpqC1gk4wcWi3/A+dDMWP7E=;
 b=ZHnhH7qcjDVU9qRtbV4M5dihk5IfYOXYvTjmGD40If0XD6ZVZ3IRcUabN9B6BYVXD18HUGj9As9/8twuJIi1MLWNvIEIbPwnXgIYCC1qr3fWR1rqpYy7o6xE/RUHiLZT4dPtxHcZMD8W/5hj8nSejgjsUf8UFYMv4J6pthLm+FPJ3KW3aECVbIiwPs6qlEgAiqf8R8m/sKzzeRCulBR7O+jX/ptae2Y9mIMne1ovDA3836dlWBGUfrwoEP/hF4LbdpSxRE9epaIkG2OxLECpaedGNl9r+X9lTyVqTff+KsiituHWGtf4cecZV+oeEYmeRxeI39xe+3VytH4dasLbfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLUP9J5KRybyYNulEQxtTpqC1gk4wcWi3/A+dDMWP7E=;
 b=fB6//ObR8Ah6uULNAaH4QI43FYqtVMaezAePBWl7AnC5YRwE+ahh5TEAmRE4gaj3tifxdw5OMDt4Tz8IUbzwuA7EeIiNsOMj9yxiJoZH9LLQr5igguMdUfbzCqs7eUykQ1TICLbBt4EhGwcobsLe+6x6IKdNwJ9OqJVjcMnEdic=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY7PR01MB14592.jpnprd01.prod.outlook.com (2603:1096:405:23f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 08:02:32 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:02:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH 3/7] ASoC: renesas: rz-ssi: Use dev variable in probe()
Thread-Topic: [PATCH 3/7] ASoC: renesas: rz-ssi: Use dev variable in probe()
Thread-Index: AQHcU+rS4kOsewXAz02dZeNXIygPcbTwGvcAgAAkq6A=
Date: Thu, 13 Nov 2025 08:02:32 +0000
Message-ID:
 <TY3PR01MB113468318B32BF2E23953198586CDA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
	<20251112154115.1048298-4-biju.das.jz@bp.renesas.com>
 <87bjl6wkf6.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bjl6wkf6.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY7PR01MB14592:EE_
x-ms-office365-filtering-correlation-id: 1587858d-f345-4082-a5fe-08de228aff87
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Cmkq6LsRem/wGhjg8vAKBeFxyCkdVCYPGq5v89hkj1Nvl4aG3P4MPSEbu/+r?=
 =?us-ascii?Q?9yqYdMX8xkiUZNkvaX20epfSVEP991+xmdm7VzL/n+dDQbPbkSpWYh4aiMNz?=
 =?us-ascii?Q?xQaUKxiVppvtWWbxW1LZFEEli47ADZfPIqTi6buXOYverpsSbCsTfJhe+vBy?=
 =?us-ascii?Q?gHqFj9nBxecOfbZy0OoC6o9k1hqlnofWK8xiNp1JD4YBqRaTWHAMP2dfryP0?=
 =?us-ascii?Q?z7No7m9aSQC3fNyqBaoLNVfX0StJ2W23E6NhEpdQjWm2PQGxNmfWhrXODFk4?=
 =?us-ascii?Q?MMyNHXE/p3FpeFAUfwsh+3WnPQSWkVtLPthmjcIC7+ZXj1Gz98j68EgQDf8E?=
 =?us-ascii?Q?BGr/lwdEUjmQMGSMenKSh6A4C35GAohsM+W/EPzztQPT4LwqFL0kCYcX7oQp?=
 =?us-ascii?Q?2MCeorxJXRIr9FO73NacHTCcEql8g0S137PbmFQHvk4UsMin9imh9kHgTTUu?=
 =?us-ascii?Q?LC3k0/hknpm5B+W2UJqJLd9jOIkDY/vYOn1ZfvA213FkUT7jwQxAqOU/d++H?=
 =?us-ascii?Q?+VIBJd64R9f71ju4HzxGSX/gu+1F3TLVkNt5THP5KVtKXMmtIs0vl/sUj5Rn?=
 =?us-ascii?Q?6JJf3AJqtZhk2cP4MPbOznnt3S0hwaFAVsNx90Ft5beG+5HL50nBHGOmwvj6?=
 =?us-ascii?Q?+hnYBklJdlEFPwSooeceDYNcI2kBrSDLEXvMZuuPSZkGazeBVWOP/noaZZPp?=
 =?us-ascii?Q?yR6gnA+Nerp50mZc646FqYGKTTPuS++G59CH24SBfhufXmxwfyt8f+mcm5s+?=
 =?us-ascii?Q?WnY9xdAHWX6gi59xArXdx3mvBZQ9wmTsInx2XYn6Iz4KczthrAUm4CWJniOp?=
 =?us-ascii?Q?eSZAgIJdiBiXpC5PtjvT/xl13zbNCuvSkDkR/UclkZx9MYM08Luo9vN43B3D?=
 =?us-ascii?Q?i1Pg1m5Ksarkmn+Qjm6g4egaiaVBOwhMbkEqu051HWacFe2akiGMy35Ere27?=
 =?us-ascii?Q?FOAa1NGf+7zE0pqpbJJnrvIFdXJI36cwoTI1S9MT8gmwvtZAHpDMIY5yKC//?=
 =?us-ascii?Q?5KeVbyTVQpwNHbA6oJRJrnVBEWi6IPdiN9nRs3x0awsiy/cmbTSiftYSA0g9?=
 =?us-ascii?Q?xR4Yk29PmXSmSW9dhnHXktCX34ih4M3IfEUSE9SvQZpKg4Ig+nt4Mz8EYXFd?=
 =?us-ascii?Q?NcPwFb67tsVtimpOF21lUx3T4DfVsmi8fwqf/0cE+/vRb1w6Oh5/MYJ/fhQi?=
 =?us-ascii?Q?9REH89sxbUdESOzTyU+Tw+98LvmPt4IHEiFAP3V6V6qM9wHG8zGap7IYI83h?=
 =?us-ascii?Q?vcsu4n+RvIBytwHf9Rrp0OG71JXnozKEjtkEyYUByyT7UJeIOi1PxwUpYvQw?=
 =?us-ascii?Q?mG/rPi7wnmaRgf+FAr1Vi7b3aPhA2rMv7n1V5qHururJJeJ9fUBEqfR0Hsrf?=
 =?us-ascii?Q?lUxPQ68zd3jlQTiL9wyIklPpksR7qtS76LpYSkv1YoH6L4yaUMgMnVjDcMS2?=
 =?us-ascii?Q?f0BXZ+VBBGJWPe0xgS7STl0mfoO35TQJMJBVEXtVUL0sqdeD4gkRm3bdhqLk?=
 =?us-ascii?Q?YrBXceAyKoJgVcVKfWwUucQBuhS7xsyWbFAC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+95Mayb/pgzvLFWPHD6MdFhI5jYEL7gK8ozI+kAqp3et2ejHTIgqcw+W74R+?=
 =?us-ascii?Q?KvltTFmFJ+lUGKATQstcqygD8Lers06h8TFNwXe1GtS9Mk9/VuCxfDxLczOR?=
 =?us-ascii?Q?9zywDK+uWwrd5wMnN9aFX43nGy1onLShzQMBY37Stn1NcRf4H/rWv2WK/kGy?=
 =?us-ascii?Q?zPLlDpTqyJTcERwM2T3OMldSRtq8af5ylBwnjjVIHFmbjvAgA+BMwSNPThAz?=
 =?us-ascii?Q?2S3dpuB+OJzFm6YxBVbBfLZJfOxsz0xlN4Qk1OdQJlYddo8JUo4+28C5Oz0f?=
 =?us-ascii?Q?cIR1GjNiL3HELn/uQMyzI+sWoywFLXTrzgMIWx5HMMiNF9yaNVzPC8FxpJEE?=
 =?us-ascii?Q?PlyB8lynPmxCEAyxehXCir43aR1PdzpNOgREOYQkIbFLULY3pvCf+waOE4DE?=
 =?us-ascii?Q?PDY1+5/Y3inVAnShVHQukYRGaAhJrqDQIHduMg6cgbQBxT4NnrO6RONMWw0B?=
 =?us-ascii?Q?1rdGY97UlM2m253XyUeJooVDVZSv08rwzZSf2GkDtVi8LfuaxLC2mS4GC8uA?=
 =?us-ascii?Q?7V+ESOMF1+HdRdLZ0Zdg7aZL/cr9/LivseJXr3e5y/fgxbl0fiDilcy+nHTR?=
 =?us-ascii?Q?sDK+lH1/PtIBNsyySXd0ygX/adJ8B7wjIz5+60QPa4tilKyvQ3Cv+faYeHgY?=
 =?us-ascii?Q?8L5eoXawIchv2tB+ZfKmC+m4cK6QO2jwNryloMc9SOsfey7+lN+GqmVUjjrj?=
 =?us-ascii?Q?tz7q648s2BaEP+UpBFkrLmarPtFgEkABHNhu6gcoRT8CjEs1fVEoXghTU3DS?=
 =?us-ascii?Q?IFmYLyqqHqgU6QsS6O6pxdqUnaEHksNB7juifcLulhniJJoSrEdAKPYtU0rh?=
 =?us-ascii?Q?OmuDsKC3SYzyeH7WdMhAuEE7YZUfm0TvDLGuHA2tQLMqy3Cx5dXaBfp/FXbT?=
 =?us-ascii?Q?AXAIaFwmqXmTgvgwNnKb5g4XvyA9VbW6hIe/sfID0OPavLj+RKH64pS4zx1h?=
 =?us-ascii?Q?EkhqGQtmvbgcavxq1yn6NI/V6rqamgQ9zyWMyC4xMqpej4920fOySUtp/B3c?=
 =?us-ascii?Q?2/Jmtw06vYWJJNebPSZV6SMHhSNEmXRlvVyHHZCV5/3M1y7iEbli7VWvpTjd?=
 =?us-ascii?Q?dv47nTUmPgqMC5eePJxL5kPQaT9JFieCGpkyLjeXNA533Oto6p1cMZO0JXW/?=
 =?us-ascii?Q?QYq1PxMk0IrhT/E8HvsK/NgOd+dI6zXh0DDSPhraxuBwyn9yAAN3KBEAZxHP?=
 =?us-ascii?Q?h+VyER1q/UdMn9bPKt9K/Kh/gPSiJ7FuORl/0DkPcirlebXCM+I/ujYMqCoP?=
 =?us-ascii?Q?PhyJ3Yyx32OKcSwpJ3zYXuIPYIvXIv87Z6Wfyb+m1cZr8rhe0BdGeIL5nbUj?=
 =?us-ascii?Q?rH6YGhl9c1rvkZmEdL8T0ZiRxCFoC8oW7W67dDH0pyd922aJy6RDs7zI5p47?=
 =?us-ascii?Q?92CPSGohTUQegiiDKsXcF20Mf6MspdkzpzHoQQPhlAxlHi+9m2kvR2p/g1Gl?=
 =?us-ascii?Q?yA4V0EEtWMe0IxkuxTzXeNR4xLA9VdJXAJIOh0F8hvNj3C/wpjzy7oxVkTNs?=
 =?us-ascii?Q?1iIC7pVDo37Lk+hu/GcztTk1wzcsqXk0K2ldEzLrbAcwTGjWUSP8sXytMYqa?=
 =?us-ascii?Q?ZzyRbpdJcrxbHXlJsFc6W9DDc8PDIFNxUJ/OP5eutNJp/8NFF/VYnFZP+MCd?=
 =?us-ascii?Q?rA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1587858d-f345-4082-a5fe-08de228aff87
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2025 08:02:32.0933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4DBFgD5EMLsFjdEaIC5iv3/SkhWzegoAabagj5zZrrO7tuXT7RfCgjxwwxiAgljC1Z5fRezZITSMCwtRhbpFOz6u3CeX74a/b8cwloYT8Jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14592

Hi Morimoto-san,

Thanks for the feedback.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: 13 November 2025 05:50
> Subject: Re: [PATCH 3/7] ASoC: renesas: rz-ssi: Use dev variable in probe=
()
>=20
>=20
> Hi Biju
>=20
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Replace '&pdev->dev'->dev in probe(), this makes few error paths shorte=
r.
>=20
> nitpick
>=20
> '&pdev->dev'->'dev' ?

OK, will fix this.

Cheers,
Biju

