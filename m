Return-Path: <linux-renesas-soc+bounces-30887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCiuFHYv0Gn74QYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30887-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 23:21:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8E939867E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 23:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1BD433007A71
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 21:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB310377ECB;
	Fri,  3 Apr 2026 21:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EaN8Vhqz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011040.outbound.protection.outlook.com [40.107.74.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2D3225403;
	Fri,  3 Apr 2026 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775251312; cv=fail; b=N8AE4HE5//nU38sA7V2OhtTl89Q3xfLlggi4TZmr2nBpEr0nJnuf+GF4Hu2f8gQeV7jnjnaq3vkH/4TAY49WBAy7YbF3vLHIj13D/6VXabjIfx7ZJYoK7cj6YaKuDlmFQKUXLqOiDkdqBVITmCsHOUp49C2gtzrGpLGr5FKqPAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775251312; c=relaxed/simple;
	bh=H0/KWXUsMsOP8SUCIZPsj1QGU1qMRifjuv8m164m3Fg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UvtLNJHGqRpa+89+dmN1ta4QIIwdfHDNZCa0fT8Qu5n9yGkbFY1mRhuvV9ahb0J5cRRqIBtnoFm9LffKrm813CoIajtoB33NQM1/E9c/bryUXpg/lGwIPvW614BBaU3Eh9FD22vc+W6eSl3nDeG+ruG3lg3HXpcnMC1CNmSI1RU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EaN8Vhqz; arc=fail smtp.client-ip=40.107.74.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kx2xV6i56ro0uq5ZYvSbOpITaMMDobIfdilIlUHJum6x7qR9HPUWshASsHe93HqBf418mbMBxUvoTeRs1tbBbySvZ0lmw4lYPKlodpbWnuI8IO4haipTeSxQw0uTMi4fO5qlIDSG/QnBF0VDUI6VWsHAbbIGWvlOOqKBKkUOBCOScBQfBYlkmFo842Z45XmHWEiAxPLEzr+U3jeqncM3ClDr2bz5lbFRYaBV3LJyJH8FxSgXepj1XOt1XTNSObH3rCd3MzWtkUV1GnARLEA+2xvBEOEW7ZyOCAk95xWy6AilAAmcUrXGZfC1lNMPHHpWDtcAMp8YO21kzygWn0sIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOqx5fgmiIGTFtxj7PUfQCTLw6fq9QBCpndenkzK97c=;
 b=Pqynbjhud/PUGiGu1S7YBg8loydz7e5hla9phlL0hKuUttI06BUB6pDAx64CgJQs2mClxYr47oliiOQY61c3TRX5Iad88Ug0Vt1td/ltqED3asvc/cfTa5veVMTd0me6NGJhkoLkaNF8UAmqBlXzclEqFVh/qeKOX0Ggjus+yT5cjTrGIKSUkP3uIT0DVF/XSqqhXk38bHhx5uj80HF6KmSMZmtLZHSfvu2d7AENQI6vgIjoLdFzFQOkAW4W7AIhbTguYHFuqxx9wIIFa5mBsn2e51jCAeIhIrFHGnohncRK1c9SF1aWpuJP0RTBip9vdY5BjoSAwCkKhMFpal/6gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOqx5fgmiIGTFtxj7PUfQCTLw6fq9QBCpndenkzK97c=;
 b=EaN8Vhqz+UTjBM37twmsJCzQRUakgm+vKWHkouRDxI3OiRD7N9swYfRgo3zy4phwhK9PaBAsrcFgD6UC9an0V2ls0ShZFkEophm5k4lS5J5fJPVk5P1R9CIfymmtjQrCdsIJv1NOaHUUoHTUdqy1nH5+FSdzYvdKkCctIm6UjtE=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TYYPR01MB12160.jpnprd01.prod.outlook.com (2603:1096:405:f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Fri, 3 Apr
 2026 21:21:48 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9769.016; Fri, 3 Apr 2026
 21:21:48 +0000
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
Subject: RE: [PATCh v3 12/14] ASoC: rsnd: Add rsnd_adg_mod_get() for PM
 support
Thread-Topic: [PATCh v3 12/14] ASoC: rsnd: Add rsnd_adg_mod_get() for PM
 support
Thread-Index: AQHcwr1vTvvLfxccmk6jO9MBmGq++rXMkvcAgAFG1uA=
Date: Fri, 3 Apr 2026 21:21:48 +0000
Message-ID:
 <TY6PR01MB17377DBAABCD821F7426C8CB3FF5EA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
	<20260402162436.12059-13-john.madieu.xa@bp.renesas.com>
 <87fr5cg6cl.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87fr5cg6cl.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TYYPR01MB12160:EE_
x-ms-office365-filtering-correlation-id: 3d339990-cea2-4178-fb41-08de91c703e1
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Qg0PUhhFuzJnjKILtaXIFCPKbrpIqbUXfF9qOqorOU04F1g/uXqPhzo+MsaaImbme82Kai9ESHjMQne3OWIaaTGhX/PQnXXt9pm6Sf8y2b3eJBlrYfBs0Ae5TsrhNx2Ru36aAyGjdOGqviLqPAU6eXE5hy7bKVzsT4EtZHbR53RjEaTMnsVNvC/9kS0cK4mwLmMF6LlEEHmySL9Zh8OinY3HgIeL7tYYVNM4pV5VlUYQPYTIA+vLasXzxNL4uYzF2aiD+QYj+ZlYDYCWr+AbP0dGcWUBC411GQuum1oPX0okGMpqhOiOCB2jSj9db7rtQNV8AeZX0q9VGHsdGThrEZG2vd7KdP8MlPkFAtAYgy0ZWAIoGvvfySENeVrC1ZlhifY3dwuxqTCFDrJwQqU8L5IkZ7dfmLXj3kMWVfU8II5nqEL2f6lZkepPebueUYXX4diPRta2R+fZ++rE6UdJqIAGo86ZiU1Rs7QDkx+RE41EdxhcBdj/lTKlV+v1rcfWP1ihEF4Uiid5UFYu+E2c4xDyRYpk4BCf8yghkzSkacv949Z/UaKZ+UJ/na+6/JuXSvZ3EiOZc4Y0mFDzhjLRxzVEP3O6zCxSAjnIriIuZ2nBynU+kZivlb9mqz/5GuaT3UWy0ShIQChyytN8BeCyGVIOKlj1ritw1fKyHvgaajbNoHT7KyG//TsCvEqYV8OL1y/VCUwkkovA8OQLNFJDohvfHlMF6cE8uLV7TX1EdK3jmUgWWz6YOQrOi3Cf2u6AJyfzghQ7Y+3g0lbHFNd6HI+d5s2fgH7QYRqHUlgfHZM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?PNC2KbWnfNoFsKEeQc9knONH38NfhKgAv4ax0kueaUygTp0NHeyP03dqP6Wn?=
 =?us-ascii?Q?bULy1Pca7M+LvwrMRTz4RA46kkvPiebB5jvf8i1QAeUtI8cw3VuU004jJoHJ?=
 =?us-ascii?Q?RqrsWsaBZkG9XPK+lvVqZReBrACqVCSTTqlPC3UJW48wShT23qjZJOuIDxI4?=
 =?us-ascii?Q?nluxFABrkzyhrJ0p66C6Rt5btFccfPufgyvD5KUQEW3XWZYA48yWQw4s+AWx?=
 =?us-ascii?Q?pr8iI7cHXCRZt0Iwz41UZKW+xQPkpE2+bdqcquJ3kkJ6i/iBM8RMG8AW7gZF?=
 =?us-ascii?Q?0d0kxvCKM5tfFN8emGGc6iG9NnJE9Hhi5Sd1LVYh8n975r9IUfYOA18HoAzH?=
 =?us-ascii?Q?cjgu1DNqD1VcSYcvsncjEBvReBWi9aaFHMIuXiY/4FyG2ANtkG3NJAjiu1dQ?=
 =?us-ascii?Q?Q3nO8z5ZEJyC3V01Iy1gp/e6lRqPjaiDP2SPOODA9wy4ROs8ErN+FGkSLugX?=
 =?us-ascii?Q?rGk4FsKR/ZzNw0AQg536mA0ieGupC2B9yVd9cMfoZ0En/t6bjHlU5fCSroG/?=
 =?us-ascii?Q?Hs7gGkMpGng2mw8MXiSpPWFmKkZd+IUsJHVMaF+r3ZQy3jyNftYpBFfZIe0N?=
 =?us-ascii?Q?MZ0+lh8WC6+/2KXuuf1MRWSb+8s4KkcNcEL+yka3vM14wANnh8RNtkrm6Gt2?=
 =?us-ascii?Q?CZz2oyNePytrSZjMtWH5VHiCVm4y2dcXQIS3INp21VwNQM8VJAyiBSBrrM5S?=
 =?us-ascii?Q?IGDgGUo20pFF93fTh0rG6w1LgHcA1b/8FIXzImd/K3PEUH8snO+4C6JOCdnX?=
 =?us-ascii?Q?7ojf+9LGeEdX+U0SIklVkxQ6bTlpkMIVJaTymmlx7BRV4qHyrwnI9/k0Lcac?=
 =?us-ascii?Q?+7TU5VbXXkvCUu6krcpoHJN0jY+Cjx8DmRv4LepvQhCWitJq2qTvbs19dxsk?=
 =?us-ascii?Q?NwrcbzGjkXbCAZYzSi2BWHb7NZ6bGMKcOCMf4nEkc9mWCRPvn7M9rk3R61Ac?=
 =?us-ascii?Q?DBoatxHZ3jjfFb5wt9b8kq0TiRVlx2bvxOtvHbPmi8Xp/ITIXdpJICTupBeq?=
 =?us-ascii?Q?mM9WUZRtVmXxpGd61+ZaUH1wLwSEyq9CCLD2ebhSLhJm4h/TlmDLv45r6dz/?=
 =?us-ascii?Q?ckxvvIhnrN9JjOQAvDk21cD1tJkfq470YxCvYriPKBJoP3nHQratpauN8KZQ?=
 =?us-ascii?Q?lS1PfTohkmHoDRdUSn5ZPiNprXT4o+mtBVdW2LpWI70+NGlXnovHP7gpRRQH?=
 =?us-ascii?Q?kJvLjAIYeX/BPHpw8BYHQmegkcJGu3tpFlAa2lkvY5GhYYVpo6MHBZQJclMe?=
 =?us-ascii?Q?QK8GdNQJjWJfuQlvHvf1DIeEXMZEINhmdW43Ubqi4P6tOwYA32bciNODVJ9A?=
 =?us-ascii?Q?xXtLccwas8G2R8bVQq+9UEPvxN8PfrZw0fsYxitH+mve0V0YawEiQYpb9nGz?=
 =?us-ascii?Q?+tYoycboWyLq52wLe6k4pkSC0EY6tKfvD33pYbQMm/9sL1SV9o2mSeJadOqu?=
 =?us-ascii?Q?IhyhUoPuPLjfHnxwy7sxLmTQfmiWPWzkAXRpN5drjDUrZk1efLP325GXAqKE?=
 =?us-ascii?Q?ma+xlUyfeAY1hqFESNPLMKGTPaO72QXyQ/0NI0jn1jI/9BJA9hdoJ8bjqWqH?=
 =?us-ascii?Q?nnbgFasdaIjG6QNaL7vwrq1hjnupHNAtvc/653o9nBkUa6wAARdiwOz+EnVv?=
 =?us-ascii?Q?Qk0wdzei0ic/L6fTkzPbiny5tAlh1JE2LxTYOIrnRS/uE5ioBzdtd8cfqZzD?=
 =?us-ascii?Q?VdkfuSoq86ajWvUxjzDcZQnz9romfMGNG4IoPMyRtBmL2aCYFBWka1u/b4Re?=
 =?us-ascii?Q?q91sexPz6VTFtyCTGgVKu54dGgeNH/c=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d339990-cea2-4178-fb41-08de91c703e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2026 21:21:48.2699
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LI8PdZ9jZlNlh0pSjK6OIlu816bjENfWgZEZew5wtjQpVp5kfydYmCGUELhB1AeTSfHLNA46HPx+GsAjC5LTaaWzSDX69SSUw2lf8atFenU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12160
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
	TAGGED_FROM(0.00)[bounces-30887-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4C8E939867E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kuninori,

Thanks for your review.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: Friday, April 3, 2026 3:50 AM
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Cc: Mark Brown <broonie@kernel.org>; Liam Girdwood <lgirdwood@gmail.com>;
> Geert Uytterhoeven <geert+renesas@glider.be>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; Jaroslav Kysela <perex@perex.cz>; Takashi Iwai
> <tiwai@suse.com>; magnus.damm <magnus.damm@gmail.com>; Philipp Zabel
> <p.zabel@pengutronix.de>; Claudiu.Beznea <claudiu.beznea@tuxon.dev>; Biju
> Das <biju.das.jz@bp.renesas.com>; john.madieu@gmail.com; linux-
> sound@vger.kernel.org; linux-renesas-soc@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCh v3 12/14] ASoC: rsnd: Add rsnd_adg_mod_get() for PM
> support
>=20
>=20
> Hi John
>=20
> > Add rsnd_adg_mod_get() to retrieve the ADG module handle.
> >
> > This is preparation for system suspend/resume support, where the PM
> > callbacks need to access the ADG module to manage its clock and reset
> > state. Other modules (SSI, SRC, CTU, MIX, DVC) already have their
> > getters exported.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
>=20
> This is just a comment.
> The reason why other modules has getting function is it is needed on
> rsnd_parse_connect_xxx() which is called in __rsnd_dai_probe().
>=20
> > @@ -618,6 +618,7 @@ int rsnd_adg_set_cmd_timsel_gen2(struct rsnd_mod
> *cmd_mod,
> >  #define rsnd_adg_clk_disable(priv)	rsnd_adg_clk_control(priv, 0)
> >  int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable);  void
> > rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m);
> > +struct rsnd_mod *rsnd_adg_mod_get(struct rsnd_priv *priv);
>=20
> The user of rsnd_adg_mod_get() is only ADG, no need to add it on rsnd.h ?
>=20

Agreed. FYI, I'll simply drop this patch and merge the getter helper
while adding suspend/resume for SRC.

Regards,
John

> Thank you for your help !!
>=20
> Best regards
> ---
> Kuninori Morimoto

