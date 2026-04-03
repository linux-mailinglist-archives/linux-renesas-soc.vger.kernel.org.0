Return-Path: <linux-renesas-soc+bounces-30881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODYbA6Ed0Gk/3gYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 22:05:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 608DC3980E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 22:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B1EC30574B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 20:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DEF23D75DE;
	Fri,  3 Apr 2026 20:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="C87jtg4E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3966736164D;
	Fri,  3 Apr 2026 20:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775246582; cv=fail; b=gIYcvAkGuGJj6syfylO2TBurR9qRrVjqiGdbSmDE6IvUHBNJbXFKXL9AqSLBnmNx56mrK90AspnZkDrijTTxPUVxUWPOig6pEZhVCJ2FrwwqJcy5lAqUfYbDUhYGMZY3EWF0kwJ3+iYtwuYIFoqiKWbwUBAWU2NYt3nSvjCJZFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775246582; c=relaxed/simple;
	bh=/I/n35VqEYeoJady8K4Wi+jOGLMtGvEq0K2QRjYPHyA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gBolme72UUTE3cDJHJwnZOJyrssOP0L7LYQ0Wpu2N1nz9rdUTiW1IhGPRPEO56LacYBKYW1+IY/HuTHST68c9rdCjliQN+XYVg6YHodSgBn8iUfkS6AzR8mwcaIrDr8l5ZHF28Y9yHfiIoxJeqIi3/drzIdDkplUo05BWWj2rPE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=C87jtg4E; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bTGoh1M/ynjIY8jfUMTJsKo8EJPXDqDKotefkPxH4Yytf/TKiOrR0suRr/1PWj/ccbelgSlkKuVQ1B5n4WWfoOvwsjKZflft40AS2Y8RCo6E4DRI3fYHNrtcYlhh+jEWH4nNXJq6EZ+Znve2PCeJX3fqNAFxbGJZe/EMOU5ksQOmCEdTK4Svn1s3O7xCVp18Qc1US+GfIb/f82sFZ+jkBiLzmqxI7mTU9v5n8cVN7+1HaTVX5i6U2x69ORYdHvkUhnWPD1YNaZNJtW/YKgM5CGHtUhYEITdAhSEPllAsPou/fHUM4WaHoxIv4CILC826IRE5ACY6Lm8lzvf7Mc/1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOj7JRjyTxBYQ14BQq54ujWYsZV77W2S4e+viCJtI4U=;
 b=Z5RQVDTU5ryKNMGB3+Z27tJVPEP2klSL0d5ds7wEZsyg3ABQKe21c8JiOwT4aqjPjPBWe2cGNDUKAuJ6axX0NVGvhCbB/43e4Qg+2yDYlRe0P9aFpv42HvvM//DaspfE0J0yAZ+WvNwuzjvkXUlh01/p3A3Bw5spH+OY78xnuuCk5qR0m4w08IaDu7hnaQb+tzRd7sNG7PT8tZAiYGV8JUiONxEpasYskZY73NGvhF5NCb5JMoFTwjgf7bXwGjbNCvn6WKcFBg1vUAJCrwdhC3aZH5IxqwRpn0APp5mlGfzt9i7szFrjrBozwG2RqfTu6kGkz0HmCHYFN/AaFpj4EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YOj7JRjyTxBYQ14BQq54ujWYsZV77W2S4e+viCJtI4U=;
 b=C87jtg4EOUeMAFh5dxDuJ+tOjkKL0b9P6OkkFdnZdAgE3zeir2Uhd3f3leZsXQ9OnATvpyXeT4MWdCHgDcSgytw6Kh2xGoE0oRcMpgzKu6TUFPdgA3RD3+HBEtRXjIKACvus0vGDV14/kbotEEFILYwBItbevOr9fHoykUrul5E=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS3PR01MB10008.jpnprd01.prod.outlook.com (2603:1096:604:1df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Fri, 3 Apr
 2026 20:02:58 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 20:02:58 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, magnus.damm <magnus.damm@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCh v3 10/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF supply
 clock management
Thread-Topic: [PATCh v3 10/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF
 supply clock management
Thread-Index: AQHcwr1pAzAyXF5bLEakh+bcszcXI7XMEE8AgAGzbaA=
Date: Fri, 3 Apr 2026 20:02:58 +0000
Message-ID:
 <TY6PR01MB17377119F7652E03C92211FD0FF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
 <20260402162436.12059-11-john.madieu.xa@bp.renesas.com>
 <9182f54f-c413-4337-ad72-4a847dd58fa5@sirena.org.uk>
In-Reply-To: <9182f54f-c413-4337-ad72-4a847dd58fa5@sirena.org.uk>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS3PR01MB10008:EE_
x-ms-office365-filtering-correlation-id: bd0595a5-f38a-4506-0b4a-08de91bc00d3
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 3t6FiJeZafjBdVYIxijlPApkd9PmlAxzUn2YUHPRSB3LpdxRaor4AGEJuNJOd+6EZdzPSZDimO2hGom17oBzxCLmlv+dtHYZ7iTKxrQM7A4Dgr/EiXpl/VwqeA9gBcuBNl9jNb+xk+yqEBKpIPs9p2Qmg66IAaPTS6mbRpqFUFTmv+if3CfbO3g/+7elzqmk/d4FIdWQnsUbeZh/fpMr6i1MkSdlMzOA3f1g0KvFT++V7E2SXopVwzvlLwbv8oxZ+MDFvxWMih3MnvwoEmoFQxB8FXRxohW8yvMuQel+6r5l5Ua/aJg9hsgDhjQffktHfdg0a+qL6p4+VqBl343sVkGEI0jb1bI2hYGgCp29TjHRU388XP5sEN3aR0kq+/a08+Xa4oR5wuSpSdcyiISd0GheSX2zANKtrwSq6FWtAFqi3WZJTdxMd+2zgihShkK/y+1jsehD9c34hO47zR6Xir8l2jAXmPvAlXJk+blVpTZJ0J263cvMUlqGPO3JOsaooZBV1Eniu2mh2h8ffI7RW6ckgyrSRxGoxLv56vbO3ZIPNGU+5pKAgSV2ETu5X3GNJ3oiYHvUhZUGaTwds/cTtnNvSrpW+CBxIiy8VLHS82K7ct+u7gMRrUOOFBaggbtgZWNzUwF9ErLH+qEQOyaBzFbEHN/u//UKIh+3HNJrI2+bAYoAoA4UsGwBh4DUTvADRXQfb81suLcuwbnqqNA0QBPYuPfpPS445Jubif1QlzFpbsniKhhyQEafoB+hIml03mfBV+In/cqonz5W8csjg+NMzGL8QaG3BpwTlCpK7vI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OtktiRC0VmqeiqIorBCMyo9v0HOJqoPJBeAv803zCNv3E8tZf4QEcUGhOEMq?=
 =?us-ascii?Q?Kd1WGYEHO7ixw0DDvUL/WTZ5h3VY/50cLYVeS8Xwqjd7czhYcAQtJnUyJC9B?=
 =?us-ascii?Q?5FOaAh9hwH71oiVK42ZCyRXAbZmfMOdDPpAl86w42DzZDKJCwKVy0r9YWI0G?=
 =?us-ascii?Q?OcAAu8sijeryt7VX0N8/gB+oDLt+UNWtIn9/Su7JEn2umxI9jvrbeJOEm1Op?=
 =?us-ascii?Q?1ty3EcStJmuHa0MJQedFqCTS6yOJfgS/V5I8Yi/XcI/nsUjLQqPA2EpvN9O4?=
 =?us-ascii?Q?R0zwtO8Nx7+RwyCx7STKrn4n+6m62Dgo4MeT4dVQz7FF+NvY+lY+jDHxh3pz?=
 =?us-ascii?Q?K3tEOfHrNfhWOYK+9hxUijOjDA7tJbqjLBOV2+2BYqJTwY1Vp3RsyLh8iiS3?=
 =?us-ascii?Q?a4gGeRzPxKql9vyE7frv3dg8U5Qb4dY//V0qjYrUfaBCwVCVXVA/EMoIKJ3y?=
 =?us-ascii?Q?SmFs686wJrm1u2TmQrmVWDFZvTcqMr6MpANyi085Npw70/wD7RCp0dFC6QIG?=
 =?us-ascii?Q?NcYJ9yMAIJCgl4TWFMg30QDofC0ez+ToMz9718/RIBqPXhzEzk+H0QCbTWcE?=
 =?us-ascii?Q?YW9ObFcR0zI34a0QQ1nU2VYLVIfwGxCla3zQEpuD+FSgJYB9KlHqReacSMIj?=
 =?us-ascii?Q?djm4jl9Y16YlcDbz57aSacp8/6J9+oQqWcyu4+ZCOs1J4eDxUzDOEBRz93bN?=
 =?us-ascii?Q?Nn4EVP2RgjdGsUxJUeYqTsIM6ZZnuVxrFgbpfCQcJ1j+zPJMvFsukowJRp3A?=
 =?us-ascii?Q?Xy/eR9oZjj6K59j901+xypuF2r6re6LGC7qvIrZbnVHZFwuyTXmnuul64uuq?=
 =?us-ascii?Q?PVP3d99I8waqeBIZX/S7NDBjz3BR038cA0T3wk/MHL/fH9r4FPChbpt2lKp8?=
 =?us-ascii?Q?O8m2/T8dQMpaetNvYfC/j0yPIQ216HYViyZrbtUc8pYteCxh7bY9SwnEhdpV?=
 =?us-ascii?Q?5vs6ltQymxXrTqGoN6XVrnszHXsMqJZz9NdxNv3ByXmrwi1BjATBGQqVr8A6?=
 =?us-ascii?Q?MWgHHc7OEfnVz57jNbvGHnbf3Hn3MJVs3kZFrRnrIIbzPYGBZctI95uZgsLj?=
 =?us-ascii?Q?lh2wLjAtEnrxkKheIAREWBp+MbFc0EIcxJBYGK9IsN1madvg42JkLZTZth94?=
 =?us-ascii?Q?JwYhsun4qWGBtUC1Ol40apLnOM5JN5KQVgAK0KOEWogI3FCr21owlKrW0/3Y?=
 =?us-ascii?Q?t3Gqmt76o4WJ09XkLZKSEamEj4RRugucHAXfQS6RSSNyYOiyeFPAO+CQnBO0?=
 =?us-ascii?Q?1DkEMc56BBUO51RgqqrUgR0dPtapi5rZr1mAcgG3/SY8QEMm6VS+1yjqXlhK?=
 =?us-ascii?Q?qFs4DKxmg89fgUqBcrr9JZ1KiMAnBTSuxN+H4W91mRdVYK/1Pc4sta26rsRs?=
 =?us-ascii?Q?yKhQN3rytoUjZ8OJRPyxqDRO9NOx8NILZWdywVK+ib30XN+lwiKr7OZZh4qN?=
 =?us-ascii?Q?Lr9wvolIUxQ9U3HosDZHBhDZB+1pGbesRFNuKF6vlspz+gMComrlj9bMLiHQ?=
 =?us-ascii?Q?9Pr51HPPmrpp9hHzvC2jQVHBpHvUM2yf8mLCub4ZcJF0/qKEMZ32zCdT1osf?=
 =?us-ascii?Q?8TX/XspLzYtIvpLPBskTI4vkuVWWBqxa0qsfPDgnV8LWW+T5zoBb58EPGhmk?=
 =?us-ascii?Q?aIPM+uErBz5gqmT9zer4sKvBiGwRPAXrAvM+ocSvhuy3Jbnt2FUNpCGYEQH3?=
 =?us-ascii?Q?l+MhQtLUYVRDdUzSknnA9rD6j4PquBPAEAiBg3RrEBeprzb5uWBaQU2UoijA?=
 =?us-ascii?Q?RfYKwE1dqyIr9aB40V27O0M+wtBcArw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0595a5-f38a-4506-0b4a-08de91bc00d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 20:02:58.6373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: djxThjR+/tNycATz/7WTrB/oxkxWJs4h1ft2+GddRocviO4baXdjIEdaDm/VJO0MXlF5GU+5wmgvEzrNllKvY11j7DV0HtIEXV86rSzFbRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10008
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30881-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,glider.be,kernel.org,perex.cz,suse.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,TY6PR01MB17377.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 608DC3980E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark,

Thanks for your review.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Thursday, April 2, 2026 8:03 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCh v3 10/14] ASoC: rsnd: adg: Add per-SSI ADG and SSIF
> supply clock management
>=20
> On Thu, Apr 02, 2026 at 06:24:32PM +0200, John Madieu wrote:
>=20
> > @@ -376,6 +431,18 @@ int rsnd_adg_ssi_clk_try_start(struct rsnd_mod
> *ssi_mod, unsigned int rate)
> >  		(ckr) ?	adg->brg_rate[ADG_HZ_48] :
> >  			adg->brg_rate[ADG_HZ_441]);
> >
> > +	/*
> > +	 * RZ/G3E: enable per-SSI and supply clocks
> > +	 * Prepare was done in hw_params
> > +	 */
> > +	ret =3D clk_enable(adg->clk_adg_ssi[id]);
> > +	if (ret)
> > +		dev_warn(dev, "Cannot enable adg.ssi.%d ADG clock\n", id);
> > +
> > +	ret =3D clk_enable(adg->clk_ssif_supply);
> > +	if (ret)
> > +		dev_warn(dev, "Cannot enable SSIF supply clock\n");
> > +
>=20
> Should we not return an error if we can't start the clocks for some
> reason?

Agreed.
I'll return proper errors with cleanup on clk_enable() failure.

Regards,
John

