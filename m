Return-Path: <linux-renesas-soc+bounces-19413-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B096BAFDF92
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 07:49:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71D8B1C20AD0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 05:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E195267AF1;
	Wed,  9 Jul 2025 05:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TMHr2LEp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE371F0E55;
	Wed,  9 Jul 2025 05:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752040126; cv=fail; b=EbB26j2qpQY7SFW/rW0z2DuWetjWSV445WZd5P1YCvQ1s/zx5Fj+zDTKTDIwUCDGTyDTOIPdHS9WF6iv66zlHZloyKmBiCinE88Jk5nqyHNwzagurZiMkw5hCdrktpVgsCtpRuGRR1Q4m3NEIUfeWsAfeIb0wG2x7j/ImZ8cg9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752040126; c=relaxed/simple;
	bh=e5OpMZNeYUAKV8xM2g3kop6YGuQ1Fw1zHLqIHOf5NnQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iSQq/bPoAgHUrvjdfC9XmOxFkX/FSRNlLrz4ZqAbFvh5/S5UrGydVessCJnGEx/SEW1hypNXXFbBFI4iNBBOF1kQ/bN5AlKRviuZzOobjGvI0kuU74bDPgUtPW3mbHXtSSvKLVhSSX3mU9wzw94+sS8HrgYiOHiqJofnoWxTpvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TMHr2LEp; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XVCs5/TG3kIsZ10QXPA9KMQy5WuWb/PU8wmOiypyJYvOOx5lc4rUyEUczEITYf/oZPR7UXNHiPuraBwRliDUwEOiQ8vZSlBfbhkEqzQe59/AiNOzx74Ds6xKC/AOmYbILJPn+QRJimfupi4ZAvSw2sVn54H2rFr1Y0hgPrllMrxGbsSsrYqyioI69DOlTuPc2THc2dXdAeGMxSEnZ3PtI1YtbtrBKsozF0zCr0qUwQAXSASo8MqPg8b1zthNtJwLPacJtATkou1+1hWIS+9nJsZfWWWTJs6QwB04oBb1XqZoJb7SfCKvVSCPh1vBngqFwNyzKoLPBkWF2COknMYpgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5OpMZNeYUAKV8xM2g3kop6YGuQ1Fw1zHLqIHOf5NnQ=;
 b=eczX1WcXIxfxIeFQc5zzBepPOngOqdG8O/TfF4snUIZipPUlka0XutIj/wW9DKTnhPzcL63jov6ROKdLq9V58JAnruNSa6WF9vBRw+fB8ykrP9abPchE7ftiBWsmp2w64B/hmx4vOseZuKvIcqVW3TXvDnIoh2U7ZMolWKb4lqf+GLoQefa0U3t+10a0MTwUg6b6vgVsaEq2QASY37yJ/MhCub4VQfu1NaiHt/t1zLbnDXcHaZTUbRvWMKy3FJJXQEMjKy1BCvVfyNFYbUkNgyJm5GgPiCAd00JhFC7Omxk9kKZ2TFK/L4AzYOhoOmmpuWUN8Emhpvh364aOGHvu/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5OpMZNeYUAKV8xM2g3kop6YGuQ1Fw1zHLqIHOf5NnQ=;
 b=TMHr2LEpokY94PY78L5BfiP9P0HldDJl4+ediMcGY5GYqADCtxCZ4je/mnGP7xi339AX1891hMH02zSSKd+Bml3ElprX8afwkmz9MMhniWLDxjbq8k7mbvRRY7ooiO/1EvzJNraZ+L/ip59x7JNR6dIlwq/khDk+94VKuG15/zE=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB8159.jpnprd01.prod.outlook.com (2603:1096:400:104::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 05:48:38 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 05:48:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH RFC/RFT 0/2] Enable 64-bit polling mode for R-Car Gen3 and
Thread-Topic: [PATCH RFC/RFT 0/2] Enable 64-bit polling mode for R-Car Gen3
 and
Thread-Index: AQHb6ZbYCpQLBS2f6Ey8NpbgjtH4bbQourYAgACb1QA=
Date: Wed, 9 Jul 2025 05:48:37 +0000
Message-ID:
 <TY3PR01MB113462DDBEEBB29A8D8ACAE138649A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250630081315.33288-1-biju.das.jz@bp.renesas.com>
 <aG1_kEZZwVPIj99q@shikoro>
In-Reply-To: <aG1_kEZZwVPIj99q@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB8159:EE_
x-ms-office365-filtering-correlation-id: 777f3208-21df-40d2-3ba7-08ddbeac4062
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?65df34u3jFCPfLQNL0uVoFRQ85KcpFmFVLoUvUVO1HS6ZVsZRMbq1SS/QH93?=
 =?us-ascii?Q?qaS6Jp+J9hKDg1rETX+4jmp+m4yJigWZKoXr+5hv1u96BYwHO3vq7rAZlviF?=
 =?us-ascii?Q?LcD4bCJbdcKoPPS3/R6RasKhoNp88VFlxnesescVGeqFdbvQiQmfAnFqwARO?=
 =?us-ascii?Q?lJU9ywWzVMQtfkoXu88q021zpA2w8+OwHUBc1Mc2Cn5k9k9R9o7F7cZm82Pa?=
 =?us-ascii?Q?vA3/p1kInB2YjDSgkboZuicvG+WGDfje/qPYz8VoJscGDNZxvhKfoiUVkCY6?=
 =?us-ascii?Q?qkDc2epxZ/lWqBs6R9UFLgy3tmgDW8nxS4MbO8exy5rfV785KaPpP8OIBWJ2?=
 =?us-ascii?Q?fbj4H4B+8sNrCcORfkkEBKPTLJgpIFwgJKue8ZUutydnQMHCLciG06xUnaNt?=
 =?us-ascii?Q?cBf53sQRbsr7Ts6NK+suayW5HaKEOJ2CPo0DzTxf2GM4ummzEnX85zYFlMcW?=
 =?us-ascii?Q?vTbhnCqVsa3fGibiUz45Ze7a7r8/kPVkCGsOJU+f8cjrldHZN/0t/LjZhexc?=
 =?us-ascii?Q?l1Ji1OZ45KPj0zU+8ry6okNK+farPwLuOFC+68FF0Bp6/HPAmw1fNgFLU7MK?=
 =?us-ascii?Q?OhT9R9q3ssdVZsdv5ocD87i8SDolw0BHvhx3b5rA/s5m/pfKVwmobX64HIy1?=
 =?us-ascii?Q?qG7+s1SWKsEb7PrSwe/LgzrJyAwqtpIBHMz70K+/rDmxaxqnVYgapvisK1nH?=
 =?us-ascii?Q?DNMO/mv74YdU3xpEW8wi2+DYEtJgBdvLtqsYyIwd35ALRyGfSqXJc1M6oka/?=
 =?us-ascii?Q?8ntmInlcu/o8C8Gm4UiBjEhh3KrkGfVsDFKBlMd7RkHyB/KKMZWzqvgfvM9Z?=
 =?us-ascii?Q?3xtTVKHGxZn3+hIZ9BUrptXhysHw9yTFt4PSPurGO58nQfdKP6rQqI4uhAw1?=
 =?us-ascii?Q?VWg94bkbrUAbw6My8Y05RlmmWV7OuBwDTdmMmWG3S+dsHTO+6XI1WmTASun6?=
 =?us-ascii?Q?4dbBUI48VVcknTWpK4vCJwb/Q39O1X4xRNkPmzqY8IPeOpG27UmfIckZRbcq?=
 =?us-ascii?Q?Pc7IIS7xWWpWyICLxKPk7HUvyhep/Nm1mhBydWJUHAJtodrxX/WfGZMg+hKL?=
 =?us-ascii?Q?lhzXxlFhE24tgtDt4dPUYtJVEfvBfjt3hEmBYsFMCHdjrWCqTJX3Mrwv7KYK?=
 =?us-ascii?Q?oGfWITH0sOPPorRZc27VK6bpMkNQZCVI5WErmoq5jsvdiL85X5x2kjAoyfav?=
 =?us-ascii?Q?6deY05am2xSl5R3VHCQiMdjyVsxUrP/PNY8Ew6XTdTgSEbCk14xzAZ1eDg/I?=
 =?us-ascii?Q?AXBoAUepHOJhwaywFvIZarEdPvVoe6BbqV6JYjt03KGe53brHJxxqUS4wl5v?=
 =?us-ascii?Q?iXLJ6Jk9yAOUOobsGxVwIw+mRWxNrzpa5hz7kAyzuJxdjjRZR+YM4FqG8m0H?=
 =?us-ascii?Q?CiIi2FkPslokU7gQBNMQapwAsIaC9OMAZmDKBCZDe8Z4S8d0JukB29M7u6wz?=
 =?us-ascii?Q?bfuunjLItTorIEmX4Rf9ju4BZOhZB1PgwUOpuZyrbbDgDg8kHtdWz5e0lOqu?=
 =?us-ascii?Q?kp0N5V8YAfxXGm8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?P8huSgLzQKVTtyROHGkf/6Yf+o5fSie0sXGHfeYdzHcUo/m+Z8sRqDwu4LFe?=
 =?us-ascii?Q?I5mw10Q5QZnum7HYOIp130Jy+0MXiTnu/HuMo2TrRoVyHmYIOY3aV8r4VU0o?=
 =?us-ascii?Q?sQRptMbgYavT6/rTxj1CHJVnM9MPiMHLscrPTmgouyV4a+YhKzA62OMCC9kd?=
 =?us-ascii?Q?P45vbC4DD8u+jt8T+S2xHsdAMMTVB5EQaaG4sJ0d573kM/PZ2RIY8JMzZIHT?=
 =?us-ascii?Q?ynwJgypf/OMYl76V9tKt62x+D8rAdOI3iLZ7Z2qC2Ctc7DI6zzKHus2R42Ze?=
 =?us-ascii?Q?iRYJzBM0ziS3Oq0rlL5lbIZHKFZInOcgDe1DJxYTUe3/0jUdXoU2tkfnCSv+?=
 =?us-ascii?Q?3w5X5NaE4ayq3Fa16vFsAc0c2MPZJjVvfwy/Z85RxbIV/vVihD6ZEaOwV2rt?=
 =?us-ascii?Q?ENrkoeZmegN44xV6yrUynDwku43IfIZWT/Aox+VFVMotWHibSDOiPj884pyl?=
 =?us-ascii?Q?lbb4X0FQTxqK3v/NPGbDIbzQYEtVyVdCZSAeBvM+qcQUNpssYqP6dBNwHrpY?=
 =?us-ascii?Q?znrZXphBgHAx4rYNChj0aOQkOKnpy4Odrico5jOcFOi1fMuZE8VZvDZhqmaC?=
 =?us-ascii?Q?TuyePW5m36qUWKer+OKaNZblCQ2b6hS9+mN89Zbm0MgFFZzWBbsdszZswobf?=
 =?us-ascii?Q?I9GcNvWDxzBgZe9RMProZI830im8mgEhYkmqRLIB4pFAGthc3/uewPgCLnGF?=
 =?us-ascii?Q?tjSoIy/Os9lpv1cRAK8+SurT3apGx4+1RcDladrEHQFsdC0y6j1qwSzjZlD2?=
 =?us-ascii?Q?Caa2Fi3AfGuIxoWuBOotf0Lkl9DGdfgj4Wb8x9hX3VCEOmt/BSGZ29Ff5U84?=
 =?us-ascii?Q?LIKTv8ZLB05a4ZCZTnB0MuNOqHWE14/CLHlpbb6e5AVEvRRaW1/H3JqVEjfv?=
 =?us-ascii?Q?ddzBGvmqNKN1saJHxybXDr4bToQa2Bs+kLgJq85c432IE9gCZA1gExFDEPcz?=
 =?us-ascii?Q?mStK1CiAyh6zTXpkDUetsTPOixw6RWNT6Ua5HQYrYpabhZgJqm8mUWyicx+1?=
 =?us-ascii?Q?lyagNU1OYlGeXZwy5C79zevM8VX/djw2qyvQCIYr5MWi0sq5EM1kt7aYHv1M?=
 =?us-ascii?Q?Zc5xy0wqnWr2LOMs8Nvep3aCaEZlxYQyZ1fjLoTtOylaB7HvaLM+vYDSd72C?=
 =?us-ascii?Q?8voyyMApU0EN/Fr7yDMUChtDWx5/3nDxBXPMTaSChEzYF7u9qCKu8QyYWiVs?=
 =?us-ascii?Q?d0x95N8qvkrYEMkHQmK8kzPD7fn8nAXqd+fQb4I95mIk5eFE7xZxCaMjWotQ?=
 =?us-ascii?Q?/EbI4dfdkWtnShMUFlMHezuFu3eBIzBaJ8pK4Cmd/36tw/trrvBp1eOFrDNY?=
 =?us-ascii?Q?VP70ZaWH25x7JvGKUXLlhFTrconN67u2KWXwRbDobkJQ06lsOsbp1IdXQAxE?=
 =?us-ascii?Q?EPOl3RTwuwewizh009VR9SX/3wBADZ+LIwi4REpC1i0mBwJoedeOliBf8zvR?=
 =?us-ascii?Q?J+z1AuNfs3Ylm6or+nf6XoxyA47ZVit3qXx7fMtT3kdXpTDzOEY5ebJ5tiI6?=
 =?us-ascii?Q?/xls555z7dJ9X3msQVG/JYiukZBksvUogtWImglclF4jskiWJv3KriEiB7mJ?=
 =?us-ascii?Q?dT81/zRig4UizN7hQ/jfoS2jFNYe6Wom0MqShBobPcj4oMxHg0eLg6jZ/uBj?=
 =?us-ascii?Q?dg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 777f3208-21df-40d2-3ba7-08ddbeac4062
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 05:48:37.9904
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nsbzPl4zIWIW+U/y1QRjP/AuY9Fcx2Cbz1SqELYK7J0mQ1l1tB1ovwnXyoNRbi93MZ6N1Hhnf6nagz6RBmTTmfmWrJCfcHzhJ9vnnVcpwNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8159

Hi Wolfram Sang,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 08 July 2025 21:29
> Subject: Re: [PATCH RFC/RFT 0/2] Enable 64-bit polling mode for R-Car Gen=
3 and
>=20
> On Mon, Jun 30, 2025 at 09:13:09AM +0100, Biju Das wrote:
> > As per the RZ/{G2L,G3E} HW manual SD_BUF0 can be accessed by 16/32/64
> > bits. Most of the data transfer in SD/SDIO/eMMC mode is more than 8 byt=
es.
> > During testing it is found that, if the DMA buffer is not aligned to
> > 128 bit it fallback to PIO mode. In such cases, 64-bit access is much
> > more efficient than the current 16-bit.
>=20
> Cool, I had this somewhere on my todo-list as well. I want to test but it=
 will probably be only on
> Friday. But looking forward to it!

Thanks. Also, we need to find a way to handle this issue [1]

[1] https://lore.kernel.org/linux-renesas-soc/TY3PR01MB1134662BDC486D781E5B=
263878641A@TY3PR01MB11346.jpnprd01.prod.outlook.com/

Cheers,
Biju


