Return-Path: <linux-renesas-soc+bounces-30876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLjaEr8Q0GlQ2wYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 21:10:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA39D3978E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 21:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C84C300AB0F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 19:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4488F392831;
	Fri,  3 Apr 2026 19:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ok9BYaMz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F035371D1A;
	Fri,  3 Apr 2026 19:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775243448; cv=fail; b=bEs2h4A9+efaRzPc1W5OncIpWhRzuQlfj/iaicOHRe61aXvpaEJTEy+pex164aGNn4DBa5LdQu7gjGvbqSip/E67guF+GwT84eJillh4vYtxoNdXFAA36Wn1PM0RhvZi8tTFZQrnO3QAIsjnRkl0/jWVj0szI/6u0SbrUIIRXt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775243448; c=relaxed/simple;
	bh=wbsGp8HTnXTR1ocl2p4GW/lJDhbC1Uc3TUN9I9CMwtc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YGvYOpbdvY85QJYKNasTyInjYoRZE8tSlg8CBY2V38pNzLGGgPUTlEpex4gr6HTfnc7zelGyuswDEOFcRIvzXZN8Opj6hTpY5CKxGSGmbYXCsh448t8wYd39i8npTNrWLjU06x9JQ9YYT6X89MnfueJgRwx7z6S1B7hdMVYqB+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ok9BYaMz; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2jsHpqPuW3wOKeuWrBua2S8f4sbuQFeDpVPIb2yrWn5vUrAGfPFRW3DfXNHZkBv5plRSw/FZsUtO9Wakm4n2N+HlxPiGxXdhXpSbJUiIPTnh/4KR/RGd88JvLs10fv4vfx5qHpTISgHC/WCQSS+Wg1xD5IyWvXnmkTc9/jFxNt+HYxZOx6VWbkGu8tPHr3uwgb9CgS75ZRz22w7yopGk09wfexGSrFKAnw/US24bLVOZcsNCxoj4vIYqprOiIm4KLzzrarFOfC3UMy5eRiJkRcNn3hM9n0/ZM8rv+3kobbgINLyBCuymxKSjxVr3+pnMeXn4NQXSgDV6PTNeCPyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UhqkLTVHZKo0cLfJrTra0KvNjtMFwCpWSTJ792aUFvM=;
 b=pUFDrmKeaFazBTj6tA6T2P3g39M8Gz4SMUjR/YmSpeX16+ZMTCeqCufFJJCmAmzyyPuKoTpB0Vjx5c51smt+0WNaL5NmDFQ2xqljDidUg0Cr35QNliI8nLCvL3qCqL5k6iO7EaP6lZFaafyGS+/chsW3/tEcuEG4xOTYHnrMuWY4HVyRQAQpaypqMZk9EVZd6AWhC5iiEMjCOqlOPw+eT/Nb88AR/y8lKiespCecrEUeKIC47bZAZb3gfRRuSc8dqvvzLVWBa9QMPULeA9UTLt00uoW3rclIGrT1+29iryQJf2BF//QHecbO1t6oP2FsqVVGBNWQvRR4lsuTjXDNqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UhqkLTVHZKo0cLfJrTra0KvNjtMFwCpWSTJ792aUFvM=;
 b=ok9BYaMznSDdandyV8+zfFotyXeFRTC+205Hhh5vByOVrumHJJEg0max/2eRX2htwGyB1GVsY+yi2IcnBUy3l9nr5FZF3VKK/7MMDdmbsq1W14X0jsyja+jkl0xyY+ZPyCmF3Y4b2dBC7JLhZboOQrNT2BHcmWps6jNuSVnsSR0=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYCPR01MB10309.jpnprd01.prod.outlook.com (2603:1096:400:1eb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 19:10:43 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 19:10:43 +0000
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
Subject: RE: [PATCh v3 07/14] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
Thread-Topic: [PATCh v3 07/14] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
Thread-Index: AQHcwr1eAr8EQI72Uku1/g2x622zDrXMh3sAgAEtFvA=
Date: Fri, 3 Apr 2026 19:10:43 +0000
Message-ID:
 <TY6PR01MB17377F16AF407BE9C71A0E1BCFF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-8-john.madieu.xa@bp.renesas.com>
 <87ldf4g893.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87ldf4g893.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYCPR01MB10309:EE_
x-ms-office365-filtering-correlation-id: 3beae521-3e08-4fc8-43c4-08de91b4b3e6
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Tl4rT4kZlH4D7uX+IbIYh4ft4HH4DpUMUPA3XQs2oO8ISqKCYUD4UzitwcdpAQ58ivRStL+sorf6VkQYM2st6Oove3OoA9d+PHBDFPVmk+pi0U8VMR3gfEOSxdYKWhS8/jHS373N/01Ys+WLirLY+IczU71PbtKoaXcB1eP9WEYZrzAUjdsf4c4mByHGsM1FoDLVaFWRVqumNQTdp7dInFabX6MRrGONYXb1gFa5VHLGOhVzOukC6TyyGFdkTYUcmlRvw9bpX1nnmE1vKxQELGKPzE5ghbU8GKvmxt6TL12nk/AOWPciFLRPMuq38JimXcEWjIwpVnTepguIdLCi1BoNRAPFTmCzHKxGZRXwCK1vDcdrL0tWy+PD3X7YJ4GRHlGA6D5GZQWG8m/enHaxxCwsKzuCzwDZC7vJSIp8biogQUYulydC9M6Vqo0xwAYO6iF//Y/IcZ93gQLBfosbDwSWxGs7FWB4CPOpSQLazWL5GSWG0EwKqHjlhynmDP8jV+OPG8Oaso3ES639wlTFWxSh4G5YmACBdk4b4mw8vRESMX9yCPOu1++HmINqk1Pj36zs5HKDzJwr0PkTtEIHJokAouv7QIPLr+6UhC6HYqQud1OZlvN4v9wdH5DyhdijbIzuNCzVOUkS0nwB6FuhqIjVAlnLgDjOjVbg/kOJPXWkSGzh2uqZqZBvnBxuyDw7+w+7qH/kWH1MFMFjZabbxDURyOA4GFlECXGa9OKd3z4gRl38GYSmVSPaKHkh1OoTyIiajIM6JAhHjZMLkhx2jYSrJ9ze1N0Treq6SqHoGyg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?932Jr0qbtQHkXDu9aB1QKKAHMuXWRTMY8f42TDb6QaareGqspgopmw6Xm5mq?=
 =?us-ascii?Q?nzPYlD+mRWmSqbQtGtH2JxX2lUyu0YhwBAZzaFGG+/858EDcwA2Lb4KCv1jB?=
 =?us-ascii?Q?96fxiLaGGa7xTZan+bSf6jfK2HJFw8GHe6NO42tyLoFQAzuMNIi9/0jpng5E?=
 =?us-ascii?Q?9U5pnrnahHmGt1VRaCt0rUm6UCjLApzpM3Z1tTTapZ2vGhk4amNklxZJowX2?=
 =?us-ascii?Q?bGtx+eJl0HLWeArqC/BCFYb5c5FFR/rGYZAtlXKcVBmjeLP0BwHqjkIIlXsY?=
 =?us-ascii?Q?Sgws3B2BUHE3idPUxWpZIMmrzDxPnhvqnx2RPR1VPg3jGPMD7+YZl/EZy2s0?=
 =?us-ascii?Q?NsrUVfvQqABDToqxZ41dJ9424H5ii4kNle2ukcRYFINP09p4KUPyZC3NelsS?=
 =?us-ascii?Q?S5obe8/a1EOuRQAwpBFxCmIL9rz1Ugwd0OrZzYnOUIZUww409yZmbFD5LuzK?=
 =?us-ascii?Q?CvabVyZL3c6s8HEUxux8yqVkeishjtYtBv2keQgv/jdUHTsE5XF2rjv64zpP?=
 =?us-ascii?Q?U3zMw7tY4ghC30fVkHhnFhMhjOLzgGdWC70Wt6HDXoxmAy6GxPSYOq1Bu9LQ?=
 =?us-ascii?Q?U8wMF6TkhuZ5oVKdQXNCQ0Ttzxx5c8IXw2WBF3OyQUMAvPgb1pimP4t+YBvB?=
 =?us-ascii?Q?WPLK3PZnvBtbmBpYLFQu8BzEO30wgYEd7TFsdCulU4v6IfaDvpuKX6lL3PZ4?=
 =?us-ascii?Q?i0171SR01CbrVOhkadxGTrWTEbHqeamyhFVvN+pGbvvWaQPfeD8gAgUuyOEF?=
 =?us-ascii?Q?Qfl0Bz8pPB3Jt3JQDjSweyeENzJjcSWtqc7n8e8lqWFUIiLMbggQEvgOLqj1?=
 =?us-ascii?Q?5pe/SK3SDxK2dmQL3HY50r1aX+l6fwtcq1iGEutIfUYhgor5bieob4jtIfE6?=
 =?us-ascii?Q?Ezjt+M6m8C9R8EK+gTvXIDflmx67qXYj/mIRZ9T21EREoyIqPduyXF/aK1Fm?=
 =?us-ascii?Q?8NijartMnw7OgNxuuZ2oUcHCKTnmowbWlKmcPTQS40ibPjVw5eZ7R46ZUfTi?=
 =?us-ascii?Q?YaqopSE6y9im3hnAAKQ0zqSp34U8doqPBmF+7byDhzmYAtyjlsb/Zvmo0xiF?=
 =?us-ascii?Q?y9XTLa55il49TTgb9n4y3ElX3736/EaMxKPvicZ7yOUWyYB/FkcFUBQMMcPg?=
 =?us-ascii?Q?VWocuTfJtJCGIYD8MsUhO//2NJpqeYd3x1VErLAidnqkL2dz2w8eurZzA33W?=
 =?us-ascii?Q?0GKwmT04OzzoDqN5v6zzgnMmG5w7xpdWTwjUguT6+8d/DGXaNOWi1IdqFBTg?=
 =?us-ascii?Q?vzHDtMfX3bRWtMUyyxO0XmtjjXbZjKn8Tf9QHVWWzYxPcxDPOkwCFCaCCoSC?=
 =?us-ascii?Q?9U8aasmU8add843jomHXy3/m7YFug+jQqH8SmrseY9MyrzbmuzEN9nPUpjOj?=
 =?us-ascii?Q?aFFeme3/c2Lz1aOKipAkQNLs6quflNl2A8hBc0QzsmxrLost1YkVJrNjt/0P?=
 =?us-ascii?Q?zOf01Qo2DZZIe3RqvOeXU/Z7LzlUum2dqx/B0vhLfXG7KFkP7bR5rkvQ0F7w?=
 =?us-ascii?Q?MdSJzvKod1HssvL/fCtu7NoHSpWHTVUDx+Uoc/ofjECaL/Db9X2KUjN6EXwI?=
 =?us-ascii?Q?3I+Lfy3Wk/GvWOVBALvf+QaAT4wiLFs01FTG0dk8W+q2r65ytcxSBB+BrRlH?=
 =?us-ascii?Q?GhOmV01tnPz4lw9Nlz5AvR+KZPsDuDTTx8Fa2/COWTsHSTItMhYQYHjcfySq?=
 =?us-ascii?Q?0/GSqA9FDi9gefybwDFJ8xiNZ7QKKfJryP8uKsMJ5K1yk7853Oav+vM/6eEl?=
 =?us-ascii?Q?EQG2M12zf5Wvyw/UJzb7Dxgc3PgGa5k=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3beae521-3e08-4fc8-43c4-08de91b4b3e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 19:10:43.1402
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8PMSb+Gzc/nWIlZJKwQ34yMqqHKjYS85B1gwNOIrfnC7ga30VfVIaJJDrgNlMimNwheaEFSyMaDmUg+FK6FehvuTsoWUTIcxtelNcb9UVoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10309
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30876-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: DA39D3978E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kuninori,

Thanks for your review.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: Friday, April 3, 2026 3:09 AM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCh v3 07/14] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF
> support
>=20
>=20
> Hi John
>=20
> Thank you for your patch
>=20
> > Add support for the SSIU found on the Renesas RZ/G3E SoC, which
> > provides a different BUSIF layout compared to earlier generations:
> >
> >  - SSI0-SSI4: 4 BUSIF instances each (BUSIF0-3)
> >  - SSI5-SSI8: 1 BUSIF instance each (BUSIF0 only)
> >  - SSI9: 4 BUSIF instances (BUSIF0-3)
> >  - Total: 28 BUSIFs
> >
> > RZ/G3E also differs from Gen2/Gen3 implementations in that only two
> > pairs of BUSIF error-status registers are available instead of four,
> > and the SSI always operates in BUSIF mode with no PIO fallback.
> >
> > Rather than scattering SoC-specific checks across functional code,
> > introduce an extra capability flags in the match data:
> >
> >  - RSND_SSIU_BUSIF_STATUS_COUNT_2: only two BUSIF error-status
> >    register pairs are present. Used in rsnd_ssiu_busif_err_irq_ctrl()
> >    and rsnd_ssiu_busif_err_status_clear() to limit register iteration.
> >
> > Future SoCs sharing these constraints can set the flags without
> > requiring code changes.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> (snip)
> > @@ -72,7 +73,7 @@ static void rsnd_ssiu_busif_err_irq_ctrl(struct
> rsnd_mod *mod, int enable)
> >  		return;
> >  	}
> >
> > -	for (i =3D 0; i < 4; i++) {
> > +	for (unsigned int i =3D 0; i < priv->ssiu_busif_count; i++) {
> >  		enum rsnd_reg reg =3D SSI_SYS_INT_ENABLE((i * 2) + offset);
> >  		u32 val =3D 0xf << (shift * 4);
> >  		u32 sys_int_enable =3D rsnd_mod_read(mod, reg);
> (snip)
> > @@ -109,7 +110,7 @@ bool rsnd_ssiu_busif_err_status_clear(struct
> rsnd_mod *mod)
> >  		goto out;
> >  	}
> >
> > -	for (i =3D 0; i < 4; i++) {
> > +	for (unsigned int i =3D 0; i < priv->ssiu_busif_count; i++) {
> >  		u32 reg =3D SSI_SYS_STATUS(i * 2) + offset;
> >  		u32 status =3D rsnd_mod_read(mod, reg);
> >  		u32 val =3D 0xf << (shift * 4);
>=20
> ssiu_busif_count is for SSIU specific, no need to have it on priv.
> Please move it on rsnd_ssiu.

Agreed. However, since this is per-SoC, I would rather use a
file-static variable, rather thatn per ssiu instance in rsnd_ssiu.
I hope this is fine for you.

Regards,
John
>=20
> Thank you for your help !!
>=20
> Best regards
> ---
> Kuninori Morimoto

