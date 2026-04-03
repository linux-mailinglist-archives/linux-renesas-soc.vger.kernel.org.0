Return-Path: <linux-renesas-soc+bounces-30875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8O8JFsAC0Gk/2gYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30875-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 20:11:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5878E3973F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 20:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37710301531D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 18:10:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD242FDC5E;
	Fri,  3 Apr 2026 18:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KympewJ7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5036F26CE11;
	Fri,  3 Apr 2026 18:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775239840; cv=fail; b=ZNIumlQnZ+zW25BTsrSLnk94EnsYDKt2+BldvWURbjgv6Ax0uqnAW3q3h7dapO4uU5jL0b2q9kenoFY+jZveVxv1FwGjn88eC0PTSGmwHe5wIX6d7FbwtfCLvMcHNQU6b7riofK+dpTu1SkiaKuJhlBaVreXVWsFx/zmlYFwE8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775239840; c=relaxed/simple;
	bh=qzLDLkkWNoo0mOWUf+fxi1J23SDP5k6ng4H81/2ceLM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L6rv8ELWRDrelPeVimI2ciIa4a532AkhOILixNj+Q62uqDt2Hm9eZ90VH8mLzqI9L32oGUdzFB5HrF61glO634KPyR3Eo2uaouvSYNAxIcIuL2Hiw6uj+6MBa0XNWZ3CioC3oCFKUF/IxsZBUOXslawNq+9YdhrkfvqPJYmvJmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KympewJ7; arc=fail smtp.client-ip=52.101.228.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwV3kVw8jGa6L5BmOyairIw4b/y/HvTUL6LPMfB8elnlzgi3HqLbmyyfl+WNwsuwdKwuY11CSDi3gj5tgarxIri0WwEJKAveweyIQn5PRBo9TXmQ0v/xhpkWuJvhNM8SIxzM9atpe3TmvuNwMl7drOIrCn7IAXSOSUg3UlDwJhM33LTWU/FtyO9eHMaaVCSk54HSxIrQFpQQTlxp83mDgV9JkfPzeDtuU46atE3fWdCOOcYy4vv8LVH9a5SKItCGHNoH7TJaemt3Iav49QCqYsBP/YvcmPvDiL2zkzHR4UxVtZyI5BNpdVSzly4ESW+yWhg+t9MMF8dbaHxhchEJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWf2i1WgyVCcte8rJspsUOe5qskOVXKl32j1sGim7wY=;
 b=nzml30khxo7f32H6LB2cLV5vPSu+4PEk16qY2MNPZeZ5h6X5174c1l1eXb+PaOO8/McBdEeUcTwYFWRPSKZ3lP8QNPDLBRMLheDRxJXhaU0sp4XGvxorD0XRJnh/1YuS6sa3X+g/MdFTtYf8Acsj3Us8Pi0iOBMI/vLl+ZeN4YDrI2HevYiq7M7/LDRT+Ra8ySKCf5a5h7hWQt3abzON5Vi3yPfy9o59PqkpoSCabvD28kSuFv2/WoUMZ4ytgOfoe2Cyzq7mLi1q1JaGA6L4mzZAfB+XoLGVasHOTR8IUUUz3m+7R+/MtG/sAeAoswcXEC4TRoK0LYo4rOUs4T4duw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWf2i1WgyVCcte8rJspsUOe5qskOVXKl32j1sGim7wY=;
 b=KympewJ7/h0unM19LpbN0IqOXR6VG+opKCsm5V0sHz3M9ql9UMUxtA+56Z/yEsTkt6wu2pRlRbO3N1Ihcc7H7hoCVeiV0UtyhCvZ5i+kd3gEQGa8u8qtYTG2Qp6tHLe+F+hfWtnazYJwFoTMYegk9U7UFvLyEMl1PM1kjvQf9k0=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY3PR01MB10093.jpnprd01.prod.outlook.com (2603:1096:400:1dd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Fri, 3 Apr
 2026 18:10:35 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 18:10:35 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, magnus.damm
	<magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCh v3 06/14] ASoC: rsnd: Add RZ/G3E DMA address calculation
 support
Thread-Topic: [PATCh v3 06/14] ASoC: rsnd: Add RZ/G3E DMA address calculation
 support
Thread-Index: AQHcwr1cRuCrrqNToE+47UWUvnzZFbXMh2YAgAEcplA=
Date: Fri, 3 Apr 2026 18:10:35 +0000
Message-ID:
 <TY6PR01MB17377A19DC4E26C44794D6A99FF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-7-john.madieu.xa@bp.renesas.com>
 <87mrzkg89l.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87mrzkg89l.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY3PR01MB10093:EE_
x-ms-office365-filtering-correlation-id: 220ca181-1726-423a-3fc2-08de91ac4d98
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 gAKq6D5GhBL0GVG6fmAtQvTwi5wOq2ovdLmEvIVyPbhnY0DIG17+ChYq+d0qM0VbAhxgObMW1w2n+p0KQKH6hyzyQmbmd9YVqQ/tF0pMuZ3/FUKHJvXS2+pUSbEA1n18ZrRkJSCn+/OnyEIFOc1J4eWvI/rAK5uMI8Dk0WNQDuv3XglVnXadR3KG7EnrpJW4UsdEHeA7BD8W4y6wXq2h3XBK8+Gi3YeK8kaR+70jmbij3UQelQP+h+sRUruygm5f5cg4z318A8foxgH4uyeHYQcGtzfwzN3UQ7QFdWCFOEwVglTGm+XDpoR3my3Ws24dVcxIHMvRoeKFX9n6BgpvAtYaqERnAr3+dkKB9TkABvH9dMQII4sc9tc96XapIFNcsur8F/y49ZMnb/JHI7JC/nfiRzMgvv5UNwuuJJ8g2oeiVEPymNTH9KbeKFMeQBlJixpab5kDEmhm8gul6JmrnC+1mn8LEjARtGxFfBb/u4u9KfdBUwX9yB7vs7gk5lBn079aBrxCcSEJyGZYNED+JU7GKycFLmBD/CxFUzUYZvIlRKXmRZVD5pvuNXOPucz2EB6xlRpkLgtmGeb14RaxxKCRtE8z8gSg2sjy4J5TTGvSji5vQhSkjWUna0JsDCRNQXj76V1BCtBL3X9YuZx3KHDP2b3mCa6t11zfL5tdj7uw3qOgRWtg1+nYsmHH7qLE3chh4FabSLe2JVjQIIidpDXqOCcPZ55Sd/5P0edv8gbS9ETdIWm45bJIOd4sRinxuqkMl36SBxpzfIG8HomVb3TKCdhuhTZ4en62ViJJoi0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+aOObm+uF8A5arS+HeRzPLKmmcCEujFdrYLMfXIrQIvLlsj+X05pIhfsizXe?=
 =?us-ascii?Q?+H8Bf5sJ90NZ501RXaufLG1YBZfq1qGRMwbVnENYeRvdpkz+J2kuHJdg+xCm?=
 =?us-ascii?Q?PoDCtRozMKTEaBKoZAs7KcqwrCeFMHr8OD624YvejTpT146iA5+xjVRARmPz?=
 =?us-ascii?Q?EiJdEMCDq/Zb5rSkn0p6AesUnct5lE6HibVuJ1SgiFBgF8gceye+ECQVhVBF?=
 =?us-ascii?Q?udpwnTOtC5A7fIUrCPa/JVDLUrfiATqPu9tWQOTT96ZAxZIQhQujxraN7F0Z?=
 =?us-ascii?Q?ye+MIG7vc5cg9vzAHUJNrTvkZhpgFQNrRsS8wRa3MR9WZB8TzRQ/wBkbF45K?=
 =?us-ascii?Q?uIwD/yWbW2PuDd9eJmm0m0hALmq1IglyKnGQdWEAccR3AL+aNUE7d1qdJ+FE?=
 =?us-ascii?Q?CUCxe9nDRlJsuzFf8rP4u9NAAQ7ohGDfy+ianggA3EFUBM7966+Ycp2oa1q8?=
 =?us-ascii?Q?JQV/X5Kf6F7b8m9RLecFiY4tJT2cGzLunt4nNX9d5ASKhiLGku1RxQfvxmbu?=
 =?us-ascii?Q?NVZOZZOEWVGHC2jbAKJKHJEOKO33/UPIqmdxbNoPuu4AmjrlX35x84u3o5vz?=
 =?us-ascii?Q?FWwJu0oghGeAoyju8hFwXFPt2N0e1Q7XTJME+7e6UcV2PI0sPcc/8X90mT56?=
 =?us-ascii?Q?mlotm+O3lXVKR5mhDr20yX1k6Dk6UyAshyTty+KAY37p8kHAWImqET+2VWnB?=
 =?us-ascii?Q?LY66wURGkytaijbgv+owaslkZsULm3VplYs3x2u4098sZ0yTAbsbb6lWWKXL?=
 =?us-ascii?Q?qRqcoWj9vngxZCN0KzMpbpDQ/aYirnKjRIMDA49UGIDr4ALOQ6IoyR30ON1A?=
 =?us-ascii?Q?rbUUmef6ktRCKWhGuhJjvtQTFFWZkEOjMoJgFLOeM/WUov1suAZmCizne4hi?=
 =?us-ascii?Q?Hxb8obZC792QPCziqDLJ1lungB6f76Spk68PAES02pbaoljE4MyYu5ei9NHi?=
 =?us-ascii?Q?0b4ZN1eDklVWptohyrt7xeE3SP6azoroExSg5aJQRAWtpzgHB+rYXTopBZjs?=
 =?us-ascii?Q?JKjaPCU0ckYg4b3u3FlxpmgyXO3oI1354ZBFKLwUx04jHiUWBPfbt8BxRe/w?=
 =?us-ascii?Q?ZUe+Z3RrWk45RPKYLqU9EUibuvCPU1WhjfVQWRnlXImPu0LZrpNa4aB1SLgC?=
 =?us-ascii?Q?mMjdjAXhxFFrSh1c7HTZjcWnfRAygCXpega6+YB7axrxYf+rY7WD0yrpKV1O?=
 =?us-ascii?Q?lb+YWR43K+StbncdqocjP83uvRxUXOXi7VQk9be86LxqB5l3SnJNCZWQ3acD?=
 =?us-ascii?Q?/kPpL6Yf6xxt5y05lIGXa4cVG1B7gw9TUapKQNb3wh7m8/MF3iVJMgdVKh6a?=
 =?us-ascii?Q?qgzH3CG/Vg2NDIz6KYkx/5yQ8fqiHn8d1AtsoZFMlAP4gMilnrzhCzlXUSGr?=
 =?us-ascii?Q?A5rA4bC1I1GO9SpVWqSHv47w4urFk2w9YjPcDT0icik67TGBy4b3klW5RS3D?=
 =?us-ascii?Q?7yGtOIqpcNvjP2Gw34QvjwXmi7p0w/kkIY/zCYC9a5Y0wn90EYiiNnzQwdpd?=
 =?us-ascii?Q?eBE5AYdBNxRLfOs1SsO1U55cSr0beGHukHpQ9IZqpiLaS7oJSnlZynkPH2Nu?=
 =?us-ascii?Q?5CTcgm+Hk8r6q1gyMkrGHgwuSXefFpu85abPDjZLHA5TZP6zrjrruU0eAMTq?=
 =?us-ascii?Q?Dnlgwzz0I/Bi1W25kGTZuSSs+a3ZpBd/1etySIZnS9ICRACwYJ4mkwtXbrIG?=
 =?us-ascii?Q?n9yCe94fNUs0/EwlQKuTuLsHeAVNyuMEQzkJClwC7WrjU2O8PEr4Ot0GyVha?=
 =?us-ascii?Q?3FlOeAZcNwG0TRuOXqmExmqvxFQ2xvs=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 220ca181-1726-423a-3fc2-08de91ac4d98
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 18:10:35.5068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nE3QQM1tjMKG85ZC5aezYF+nSUnvyZz7lBzltRMJuX3KP7c8gTxY/CVMrBn+65PGk0orN/TPXAs0kycT3jNLMWGhTHTsX7naNPkXMXh9Z7o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB10093
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30875-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,glider.be,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5878E3973F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kuninori,

Thanks for your review.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: Friday, April 3, 2026 3:09 AM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCh v3 06/14] ASoC: rsnd: Add RZ/G3E DMA address
> calculation support
>=20
>=20
> Hi John
>=20
> Thank you for your patch
>=20
> > RZ/G3E has different DMA register base addresses and offset
> > calculations compared to R-Car platforms.
> >
> > Add dedicated rsnd_rzg3e_dma_addr() function with dispatch from
> > rsnd_dma_addr(), following the existing per-generation pattern.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> (snip)
> > diff --git a/sound/soc/renesas/rcar/dma.c
> > b/sound/soc/renesas/rcar/dma.c index 0afe4636b005..5b63206361ef 100644
> > --- a/sound/soc/renesas/rcar/dma.c
> > +++ b/sound/soc/renesas/rcar/dma.c
> > @@ -496,7 +496,35 @@ static struct rsnd_mod_ops rsnd_dmapp_ops =3D {
> >   *	SSIU: 0xec541000 / 0xec100000 / 0xec100000 / 0xec400000 / 0xec40000=
0
> >   *	SCU : 0xec500000 / 0xec000000 / 0xec004000 / 0xec300000 / 0xec30400=
0
> >   *	CMD : 0xec500000 /            / 0xec008000                0xec30800=
0
> > + *
> > + *	ex) G3E case
> > + *	      mod        / DMAC in    / DMAC out   / DMAC PP in / DMAC pp
> out
> > + *	SSI : 0x13C31000 / 0x13C40000 / 0x13C40000
> > + *	SSIU: 0x13C31000 / 0x13C40000 / 0x13C40000 / 0xEC400000 / 0xEC40000=
0
> > + *	SCU : 0x13C00000 / 0x13C10000 / 0x13C14000 / 0xEC300000 / 0xEC30400=
0
> > + *	CMD : 0x13C00000 /            / 0x13C18000                0xEC30800=
0
> >   */
> > +
> > +/* RZ/G3E DMA address macros */
> > +#define RDMA_SSI_I_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 +
> (0x1000 * i))
> > +#define RDMA_SSI_O_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 +
> (0x1000 * i))
> > +
> > +#define RDMA_SSIU_I_N_G3E(addr, i, j)	(addr ##_reg + 0x0000F000 +
> (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 *
> ((i) / 9) * ((j) / 4)))
> > +#define RDMA_SSIU_O_N_G3E(addr, i, j)	RDMA_SSIU_I_N_G3E(addr, i, j)
> > +
> > +#define RDMA_SSIU_I_P_G3E(addr, i, j)	(addr ##_reg + 0xD87CF000 +
> (0x1000 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 *
> ((i) / 9) * ((j) / 4)))
> > +#define RDMA_SSIU_O_P_G3E(addr, i, j)	RDMA_SSIU_I_P_G3E(addr, i, j)
> > +
> > +#define RDMA_SRC_I_N_G3E(addr, i)	(addr ##_reg + 0x00010000 +
> (0x400 * i))
> > +#define RDMA_SRC_O_N_G3E(addr, i)	(addr ##_reg + 0x00014000 +
> (0x400 * i))
> > +
> > +#define RDMA_SRC_I_P_G3E(addr, i)	(addr ##_reg + 0xD8700000 +
> (0x400 * i))
> > +#define RDMA_SRC_O_P_G3E(addr, i)	(addr ##_reg + 0xD8704000 +
> (0x400 * i))
> > +
> > +#define RDMA_CMD_O_N_G3E(addr, i)	(addr ##_reg + 0x00018000 +
> (0x400 * i))
> > +#define RDMA_CMD_O_P_G3E(addr, i)	(addr ##_reg + 0xD8708000 +
> (0x400 * i))
>=20
> Please add RZ/G3E info on top of rzg3e_dma_addr()
>=20
> > +/* R-Car DMA address macros */
> >  #define RDMA_SSI_I_N(addr, i)	(addr ##_reg - 0x00300000 + (0x40 * i)
> + 0x8)
> >  #define RDMA_SSI_O_N(addr, i)	(addr ##_reg - 0x00300000 + (0x40 * i)
> + 0xc)
>=20
> And R-Car Gen2 info to gen2_dma_addr()
>=20
> > +rsnd_dma_addr_lookup(struct rsnd_dai_stream *io,
> > +		     struct rsnd_mod *mod,
> > +		     const struct rsnd_dma_addr tbl[3][2][3],
> > +		     int is_play, int is_from)
> >  {
> > -	struct rsnd_priv *priv =3D rsnd_io_to_priv(io);
> > -	struct device *dev =3D rsnd_priv_to_dev(priv);
> > -	phys_addr_t ssi_reg =3D rsnd_gen_get_phy_addr(priv, RSND_BASE_SSI);
> > -	phys_addr_t src_reg =3D rsnd_gen_get_phy_addr(priv, RSND_BASE_SCU);
> > +	struct device *dev =3D rsnd_priv_to_dev(rsnd_io_to_priv(io));
>=20
> Creating lookup() is nice idea.
> Very nitpick, but do we need to remove priv, and remake dev ?
>=20
> > @@ -574,20 +671,10 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
> >  	 * out of calculation rule
> >  	 */
> >  	if ((id =3D=3D 9) && (busif >=3D 4))
> > -		dev_err(dev, "This driver doesn't support SSI%d-%d, so far",
> > -			id, busif);
> > -
> > -	/* it shouldn't happen */
> > -	if (use_cmd && !use_src)
> > -		dev_err(dev, "DVC is selected without SRC\n");
> > -
> > -	/* use SSIU or SSI ? */
> > -	if (is_ssi && rsnd_ssi_use_busif(io))
> > -		is_ssi++;
> > +		dev_err(rsnd_priv_to_dev(priv),
> > +			"This driver doesn't support SSI%d-%d, so far", id,
> busif);
>=20
> Very nitpick, but please keep dev on top.
>=20

I'll address your comments in v4, moving each macro on top of the
appropriate function and keep dev, avoiding remaking it, and also
pass priv as parameter to rsnd_dma_addr_lookup.

Regards,
John

>=20
> Thank you for your help !!
>=20
> Best regards
> ---
> Kuninori Morimoto

