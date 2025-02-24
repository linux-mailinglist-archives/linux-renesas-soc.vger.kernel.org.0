Return-Path: <linux-renesas-soc+bounces-13595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B99FFA42826
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 17:41:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46ADF3A5C74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 16:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA5618EA2;
	Mon, 24 Feb 2025 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YhwNn4Sp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6878F5E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Feb 2025 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740415257; cv=fail; b=kzvYskc8xSmLyzRXXc/FhVqfgMKIkIDEGQ8hGtfB2JKdCdxGosOfVm/Vb4vLGMfreYPGdIw47pHYQDcTA+n90fd8c9eOi/wKLdkcS6z5nBmUFdhwzlp9wf0e+h43UPo8btkxPtuNxdJ8JiYZEg0dG58fhfh+msHlgEnV3Dm3Tvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740415257; c=relaxed/simple;
	bh=H7K7YTt+XOtZjsTOS5umd1qMHysjMCPKXjduQMziJDo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=o5Xm4ifblMgKPH9Twzf/A5nkQh3FFzLwRXV6J8VGKNPjYOPizShesd23JaolXZOCgKR/imh2UpcFLe1ZRyiGCOx2ojtkKtm5Wc55Yglwuw30z5GeopMFcilKpGVzrjO7PiRbr0kz31cuCVZdx/Qs6SymskNRzw4xlZapnv6KXyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YhwNn4Sp; arc=fail smtp.client-ip=52.101.228.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lt/a5hClMCALsA2iUwJ8Z7GDiLA14GoKh7eapon2xPv5IsMUWTPgrElz4mYwZtCo0Mqf1ro+LeoRQhDkCZy1JBNTso7d1OsyE0g6Qnbal1PiSLXrfQAPVIOMNIr0P0GAEx8x0/LN+59w9zhRlpT3ugYmczbnzUhIV9YQ8FyBWL18YO9ksDvKFJqxAauy4xxXOgNKSEsuETBP1+TuCORHCdXrPR6XDyCulqi2j1oNIDmvBnTFIVNrWNxDy8xCycKEddBcQaq1dcQlnyAugGHNzmv+XxWeJ8IXv7y1VtCHFX7D5FEKWnJVASX3HyFSwAJeYxfhRHjfYgKZE6RM2BgyPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joZxioxsYIUzEJQrKWZu3EUMlLC//8dhcPh9N+3Pq28=;
 b=uuJCoJnGcdqVxdnHVHO4iQxkhOHn9ML9meHpf/N2ScznIZPaVjxcns1fg2QG5SnmdfnX8sOMNh4rDeCE/pj2ip0iRocqpx2F2S6NbAn/aWv5hOUZ5aVxwtTkGrHcY5EXh7LT16xoQYfUQ4QBt9wf1LzzWkHx6XGg3NVc+reEEnyFMcIkR8C+C7lP8lcS+xT309nBe70o0JWQob5Davxge43QPScQRuud0Bczmu2U8/wdMr+LQPVefUxUR7vBuq18i+7qwFqmwSd2ejIGISVYrD9Lz7EibI5bnn5AmeS3yLJ1Ju3JTiTjEFkO/NdMH2lPgw940Yma364JOznuJbU9aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joZxioxsYIUzEJQrKWZu3EUMlLC//8dhcPh9N+3Pq28=;
 b=YhwNn4Sp8xR3sXVnSrBATYRZp0U6G6P5mPzJURhZH/68iJScp6YNuiZOUh9bwDfQjUQ8MEGiT/t1gXesz6CjcsUX50Yo1I/6V01I5Jd6NZY8zs3GvovZ5FCk7b4BS3HWpmArJ4smqYdlAZF64XIlUx1INRd4RRgQTmf03z/Bn6k=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14189.jpnprd01.prod.outlook.com (2603:1096:405:204::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 16:40:48 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 16:40:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven
	<geert@linux-m68k.org>
CC: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 11/12] irqchip/renesas-rzv2h: Update macros
 ICU_TSSR_TSSEL_{MASK,PREP}
Thread-Topic: [PATCH v6 11/12] irqchip/renesas-rzv2h: Update macros
 ICU_TSSR_TSSEL_{MASK,PREP}
Thread-Index: AQHbhr3mOj04C0ZTW0Gqyq3ESU+j9rNWeP4AgAAA5ICAACEFAIAABmDQ
Date: Mon, 24 Feb 2025 16:40:46 +0000
Message-ID:
 <TY3PR01MB1134605A7E0F71277EBB3056C86C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
 <20250224131253.134199-12-biju.das.jz@bp.renesas.com>
 <CAMuHMdWjpdHH-+R5pQ9DJ+_MJQ8Nd06dYcKEqqo2Asd7TLTMTA@mail.gmail.com>
 <TY3PR01MB11346ECB931169C195A63F49386C02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <87v7szfifx.ffs@tglx>
In-Reply-To: <87v7szfifx.ffs@tglx>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14189:EE_
x-ms-office365-filtering-correlation-id: 40a2d14e-936c-4baa-eb24-08dd54f1fd2b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?LenhNmQ7iTz55S9GK7LZP51FTxDJrZYnZkaek/3Dm6baWkuJoIMIw7a02dyo?=
 =?us-ascii?Q?X8UwHlYbPguhlaauyOcwRTjSip5nrHiWjR6G9IefZi1nGWxfAxOxlKTkHeql?=
 =?us-ascii?Q?ELSQNY68zK2MjYncP08PK0xp2jrdk3RHw3DuHSZXJmhs08OqA5z+FYGoms5k?=
 =?us-ascii?Q?AaEonnO+HYCWN6Eby/r+ZEigKf2HcPOJYcLL0X3VB0xtLzda/U1qbf6z0OZj?=
 =?us-ascii?Q?0Q8cycXCvdl3WYBEtUB2aN/LlD+x988n4lKzoL9CpLZj7XHq9Wiidjx2ByyT?=
 =?us-ascii?Q?xpDYcLR+rvjzr0VAwShaoKIWW/6QtMu3rMy/p2CU9A2X630ZmRwxiTH9ISXd?=
 =?us-ascii?Q?tPamdQLNvZGlsfMsmxlzo/tTXjaVSMj0fR5+d4tV/gEL4tKX0tSHk6r7REPV?=
 =?us-ascii?Q?WhfFohMtCbeem7e+52K+hyWP6kgN0WKWNnBNjQfT9oYt3BF8t6fJa0JKg3a+?=
 =?us-ascii?Q?y4XD1PaCrtQ7GXIPuCvu21AAyn9Ztk3C3zfABR3fDu70SIGo5PrVLl2RCkfz?=
 =?us-ascii?Q?g2abB4a76ATAsynAgE2ja6zVci7PYUmXo2FfzvgQaD7bF/Xm5hZr9P1Q4Fmv?=
 =?us-ascii?Q?kMpRyILqyOtretmKcuxi6BxLItfl4cY6wW6aTGnGLh/SJ16ZxFexEBoPSmyQ?=
 =?us-ascii?Q?+GGRCX7LxjGwRYWj3Rs5osJtdr7I366rwQgxc6xI9YuZNmtJdaa8kbOCOAxL?=
 =?us-ascii?Q?VlHD86Wz74QGY8kMRRugshxFsGNlPVPz7b4iQtUbYwIfvrL7NSNFhHKAQyGO?=
 =?us-ascii?Q?iP8hEjF8qiLFfZ/D9V5WTvJkVFrA9aFZwQpae5Eto0SpyU1RthFvstSvznWN?=
 =?us-ascii?Q?dLXmq0azzogcXqK4tQgh98u/fcCn3z20iJami8VnzKuk8qLSIsaleOoswRO/?=
 =?us-ascii?Q?0+3SpPbkLprfngiAoJctXH5bleZld+bLcbz5RH/Cu1IKYChralGfWv4KZa5f?=
 =?us-ascii?Q?3lUsadVrj/JcKC2lK+XRdhKqtz2uyeIo3ECtUufqtfTJbg+3KfZXJWFf5QG5?=
 =?us-ascii?Q?FQq7ADLsaJ3VFx4rSxuXz5DjXDcGL4LMD/KBdtVI54IBHQdsSPyiWFJWF+Re?=
 =?us-ascii?Q?H4cO5+fdJAtbl3++YmAOkov+BgglqZR1fjuNf+XkNF95Xrr0PZADJLAPZo5d?=
 =?us-ascii?Q?ymmadFsSlrGZoL4u6rKuYKVSTIOf05sEajYhpnHL5LmYtNsShfvfbLmkZRxF?=
 =?us-ascii?Q?XQQt32vIwi5c8Y/SF936voHgLtuzymkODoIsu7fCK1SUe5nTqiJv2QblNOi6?=
 =?us-ascii?Q?+8lfiWgQyZe6IFlBX7CIPipdoJ4XVvipIJEwL1q0YOvuSBj1d14SD+riNF2+?=
 =?us-ascii?Q?p5Savouow3HopC4QzisIRuDFhDiw72Xhu66ySDlhR0QO9ql1c9RuYDogXcpN?=
 =?us-ascii?Q?a40c/0fATdGuIMniPhctX6WlB8KUk7swLGUT9CvycFlchGXx534qEumq7ij1?=
 =?us-ascii?Q?OXGLud6/MpIzomyXic+AOElXGZBSkmh3?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cwrpJFQRwxjKnbsWI8hCf2ZbN89Juq17dpo+AZKjBh30DFaROCO2d18K7sRw?=
 =?us-ascii?Q?a70WeeiW30YxyaJzKKTqnx2F+JL55XxZXACDS8oFgWzhCcg4wJH2fD5VQsMN?=
 =?us-ascii?Q?8utA+BBrFTySCe5Br6hPT+/ETT9pq6Ha/YW9sn7GM/X/tUN5kpOXcuegElzH?=
 =?us-ascii?Q?Jx8cMgHQiImveNBwsWIp9PTaWbPyR7HEJKDWxq5jENLz84XKJW+1EmYnJuCF?=
 =?us-ascii?Q?DWJQCuhNVHXT7Alr5tMN4jmYDrCCMtbtDodeiEOsXZ5LemU8cyvIdQofhfzl?=
 =?us-ascii?Q?4KYu5oFIAhTEow59783/4HNhv99APWiXELf/QE1w/JgWQdDuerYOs/coCubO?=
 =?us-ascii?Q?Yg5jUKLUB8hYjw4r6iulN1/8mlJ5RjxiDsl5kQYPrKoB4bzHlisouqbtslIe?=
 =?us-ascii?Q?IfEBCcd58aJNMBpeUd4UEhYXgluiYWyTclaoYaglCDriAYRBBezCSZK1s91J?=
 =?us-ascii?Q?b2dJjGm7YwY6NLsKmggP2I2C4MaBEuxS3sIIO/6zD38BFmSg8GN6Pp1WIrWD?=
 =?us-ascii?Q?zM4oTCPXgFQq5CYdlCJgZZQOCXnMUjqSrm+EolrBqvztaBTw76/o9m6i5R3j?=
 =?us-ascii?Q?vn/Yjp8CwfcGONdKz7T1WFTMJHAXmVfAbd2KLck1lXOtESa3wrKVDuYjhyNc?=
 =?us-ascii?Q?SEhcCrqia1Wplyy9ZodW6nm0U00uFlsQxesWsZAPSp9w3lObgzENQuFGTvcZ?=
 =?us-ascii?Q?zqalFaq0ei+xolL4kyI5HI0o2jHN6cDHe4aZ9y76tGnBec+iyPTqtokn8b//?=
 =?us-ascii?Q?FB5MhUW/vJz7UHbihUHl7MdbSaOqIGRmIjDdC5mgsEGNZNp9tPr/YXjqJ3jc?=
 =?us-ascii?Q?VBfMFUxof5kGbHcB/JKCcpB+eWo+arHGX49Wqez8mkDb5aJQj3gtyswYi4cl?=
 =?us-ascii?Q?oOWWCyz9UkGMMnjpJvy3C7LLYnG4KRo6oSd9fIuPknEy09nQivAxMltjNO2J?=
 =?us-ascii?Q?IEW/dTbtn1MQiz2EnDqSr18DwcE0ktZzWqpnw5c1RlwuNjqYZs6bEbSGWycx?=
 =?us-ascii?Q?sRIANq4+hJbSnQdwP2eSTxQez8bGgfwFXGiKwHUhO4FjFLeGl+fdYwb22FHx?=
 =?us-ascii?Q?F+7WnrL5aCsCgC/x4ncOIGN+4ozhbvI7Oe1qJEab7jffrNB9WKyuwDFCd8Ac?=
 =?us-ascii?Q?qHQGeEkbiFLc/2g8ShvdOkAvf/ciM/httJwIaTuQWccqY2ORy3M9fsIbxhkw?=
 =?us-ascii?Q?ABBGEijfE7gLqen8J5GGqSRNxREmWf9k0pwQeJF1Nm5sjPQSAkX7Ctk2P8iH?=
 =?us-ascii?Q?GrCzQ/vqYHLTEI7V6V/Zpva3rYSt3QGuov+QfymfdieYQg5FoMUTxnWckcoB?=
 =?us-ascii?Q?LdGW2+WCyr6nKwQaPoQvXq32oDAX0ZStyLE17emyvLZG8tMPFtiE7A4Z8YY5?=
 =?us-ascii?Q?1kTqnKXgHpV041sCQ3Gk6OYwr4gmvn0Ak6okKbtvxI7d2XC5jrBsZiNG8+SL?=
 =?us-ascii?Q?r9luWTd6clSLmoXlYosjXJySfELKs46pD0PJSovFCxjHmaewUZxuSSDJZfIg?=
 =?us-ascii?Q?DgOBqlk4I1gqYN3YNUCozgMEoSWkRTHni66ZQdP7GE56klSdT+4rcRtZgkZx?=
 =?us-ascii?Q?eWTeL6Lu+LcNt+ip6LliKHZL2pwt8xsUzLqaJ51oxbjzlgPPWqSJJxTcZlQ9?=
 =?us-ascii?Q?tw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a2d14e-936c-4baa-eb24-08dd54f1fd2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 16:40:46.7772
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qm+gI7vjs4rVb8TSJDdqlQJyN7yQXcJZID8B1qOAzuXsETyUrCBxmyNrNNFTcDN4eeEP8RpUh8ryluAxkNqbQLW0qLF3EZxITIAIpvdFAfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14189

Hi Thomas,

> -----Original Message-----
> From: Thomas Gleixner <tglx@linutronix.de>
> Sent: 24 February 2025 15:53
> Subject: RE: [PATCH v6 11/12] irqchip/renesas-rzv2h: Update macros ICU_TS=
SR_TSSEL_{MASK,PREP}
>=20
> On Mon, Feb 24 2025 at 13:59, Biju Das wrote:
> >> From: Geert Uytterhoeven <geert@linux-m68k.org>
> >> > -#define ICU_TSSR_TSSEL_PREP(tssel, n)          ((tssel) << ((n) * 8=
))
> >> > -#define ICU_TSSR_TSSEL_MASK(n)                 ICU_TSSR_TSSEL_PREP(=
0x7F, n)
> >> > +#define ICU_TSSR_TSSEL_PREP(tssel, n, f_width) ((tssel) << ((n) * (=
f_width)))
> >> > +#define ICU_TSSR_TSSEL_MASK(n, _field_width)   \
> >>
> >> Nit: please use f_width or field_width consistently.
> >
> > With field_width there was some alignment issue, that is the reason it
> > is shortened to f_width.
> >
> > If there are no other comments for this patch, I will switch using
> > field_width in the next version.
>=20
> If this is the only change, then please just post an updated version of _=
this_ patch (11/12) as a
> reply to the patch itself. No need to resend the whole series for that co=
smetic change,

I will send both 10/12 and 11/12 with replacing _field_width->field_width a=
nd
f_width-> field_width as macro parameters as reply to respective patches

But patch#10 needs updating commit description _field_width->field_width.

Cheers,
Biju



