Return-Path: <linux-renesas-soc+bounces-32644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKcqEYJIBmo3hwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 00:11:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB2D5475B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 00:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 348613006B10
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 22:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BAF39E19A;
	Thu, 14 May 2026 22:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nbXBluUq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011054.outbound.protection.outlook.com [52.101.125.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACE438BF9A;
	Thu, 14 May 2026 22:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778796670; cv=fail; b=dR8TVyjHC63ZORLUuQ2qLso1nMsxlrWiSyaNNZHK+zK5eVKFVCcsffYvGqIlR+g8objfD8olAsAu1nxPoPUsdHWUYOSUOquwH3CrVRdwXrckdkdxkcthINJeFd6XnVRIbZFjxiNHoshH/YNwkoUCw1R0eHPCdEtMKWTagk9ssWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778796670; c=relaxed/simple;
	bh=xPjQVupVBJv3nX2ka27PvbWYn1HFaJkPy8vDhigtSxE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SMIZKkmJQ0VmrJTPS5EYf0yBDlEROJxWUwEV2b6QyXG6I1A/+U6gnfLAFfbxWsTak9K0dKKIpmeaYam+JJEUs/01sc/lVj0PUVRPLcJQyj2UjQ2alP+1JAeEFKwM5MZh4OCO84Vv0sVGHliL5sz3Eb9ubEDX4/gaDFxQiuKFH1Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nbXBluUq; arc=fail smtp.client-ip=52.101.125.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmHK2yB68UjF1Pn1MBZ81XRx/NyJ+sRh28QGTzCTM1i0LtzRvJlQMsXhYFw3+byB4hh3mlV6NsbX+Vr69YwhJoHqwwkNUlqQinNiZdkamqxNhUSqwWCZ6qmcUjrCvHAK35e1wyMg8SR8ZwXlckM6auCdhfPgHCxBnyDGyH5Xgz+cUsgrR/Cse1dZ+WkonLMEYC0kC598KEWozjJQ4NfDMpRlAkTDtHxPxD1dQPJEcG/nUcPgE36sTf9laVsQfrYKY2EdHNXKVULeUWe5dbsLiHG88I1jyQ10saXFZEMic5xx6m5HKbU28Th/JAZtPeOxjNbcecwyft/ugC+MLH2svg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPjQVupVBJv3nX2ka27PvbWYn1HFaJkPy8vDhigtSxE=;
 b=AanrWmm7AfqZ7rqLE/+zCkmTG8ciRAUmIk/bZpfBmbZl+2wWdSPDGOWHZ/FouKiEpJMUNB0L0MRAy127S9uw4POolSIXWVaQ+E53AxiW67CeJYxqJg80kJ2iKEQW5ldrg6+5A/l9RsYgwDx23wT/Vl2k8orwfEzR9vFCrwa7BiWJk5AFTE/5G7CVtjal6q1Fthw1M1ylOKNeeiJSVOHlMz2qIB+Twp0cORvc1MbA0pLhmSF8lbDSVNgjQ3vfmSpZHr+L+YCm1ecrNsxpASSA8rUNt0PJYl0a5w87/rjVuuhVGAkcBaCi9Nxr6wLcwjEuCDuebixnEGbAKOxwA94guw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPjQVupVBJv3nX2ka27PvbWYn1HFaJkPy8vDhigtSxE=;
 b=nbXBluUqUxT57zfmyhO+zVxs7KD5gCUsep8GPa/OCM0W0E7tAoBlD70GtDwa9h2tkL87FPPH8k46NXLXIH5c04iMELj/OPzaDWErkK4lf6eOCsTHyPOUlnNNKp4FCw9yv94MVs+c9bCBGedUV3bchu7z5rikREe3f81VbtJn3JU=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY1PR01MB10851.jpnprd01.prod.outlook.com (2603:1096:400:327::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 22:11:06 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9913.012; Thu, 14 May 2026
 22:11:06 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Mark Brown <broonie@kernel.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 16/16] ASoC: rsnd: Add system suspend/resume support
Thread-Topic: [PATCH v6 16/16] ASoC: rsnd: Add system suspend/resume support
Thread-Index: AQHc4j1DUYcOzvrGska+nX5WvYsvPrYMsc6AgAFkU2A=
Date: Thu, 14 May 2026 22:11:06 +0000
Message-ID:
 <TY6PR01MB17377C30CFF6D7075C5602FF1FF072@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
 <20260512182631.3842065-17-john.madieu.xa@bp.renesas.com>
 <agUbd0ImOGmGiyad@sirena.co.uk>
In-Reply-To: <agUbd0ImOGmGiyad@sirena.co.uk>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY1PR01MB10851:EE_
x-ms-office365-filtering-correlation-id: 79981507-eb3f-4bdb-b7ec-08deb205b1d8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|22082099003|18002099003|38070700021|56012099003|11063799003|4143699003;
x-microsoft-antispam-message-info:
 zO+dzZJYDj9CcEQR3rvTLMMF65F/jDcBoBtmnUL2qMmiiEsdWvbwJvV3tcWYlZmCsJOVXBKD9Onjl56yyW+sDHA5iSjNMG/ElJdv9iGsM3pa+UtoPiqWur8uHh4t9o91FDttVKhjX07m5ntHvMm/ptmvEJqgb9VYtNXz6rTn4cbuAi3MF1kKIzp5WtIcZYIOx0b4gJ5HFgMAUn5Zvnu95G1qPIFJRmxLvQVwU5PoHZW//fykt8RNU9Bbh3lrY/m+4rHBeLyzBoAzRvKxCLLuzeAN0fibnHB2j/BUF891YHAUfVTi5v1pefc3Vj6ifIm/pJuW8gjk7dWGCz8e4mHO53/+o8wNsG/0BFDULZMrHuhnPzC+0Yfzhw7GuAFtyzrfuA57k+ckwbgaUNgg5bFO2izAt7mWGAoPD9kTARN2i8/nP/p+L3GrR55WFv7a5ZLtXFTvHgJ3fQ0rYTuvfVvF+qQxw/mjWWpIIGccT10WIZsRCJUr6I3thAby1mKKBMT8VSdAPgJJMJwn2shtbWbXB/0SsEB1hPG3P0gyDiX0CYnfP3Pj5kF42w6En9M8aR6chvKKPxf2FGVkk3PD3GxzoqycBXG1QNISLats4RqT84+ThoKmzVhvurjVEthg1EtyIr5J9Zrj4hkEOieuUDGqLBLTiggCkp3YpXkETKsy8o2HRJCpb1KlqRJxuDCdBbsml9JEKUVW5F9YOWErlSBo9YT6Nrk5lvaPxHBxfREE0sZrA+MruOg53nO+WC5qN7Gg
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(22082099003)(18002099003)(38070700021)(56012099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Fj8S7nTWjZhJrmjdHx7FLEPvDXNJnuv5T8vOI1UWbggYt6nojfj9CSF1ywsc?=
 =?us-ascii?Q?Ir4cBl08RmOg3LAHQYE3gmWRGA/u76Z1RaJ59VLni5h1ohGCgWQta1cTMy5S?=
 =?us-ascii?Q?ZB8d1lpW+fIb6HkDcibww2VAEhLR2y8S+3N/GueT5c2TNFr8QR1yWGz/i6k9?=
 =?us-ascii?Q?hMKv8wprXdBgBKJAKym7fWz94CSjZJa94O5Mdyq+eMyoXMjPchaC3Y8ZThWI?=
 =?us-ascii?Q?l9KJucO8knytGdNo64pCk3/P4fi4+l56pGM6qiM39qWw04mlL9rmi8RTU+ii?=
 =?us-ascii?Q?SAufXYy7mWsAqCHMv4YxbQ4L4YmRcJdbwhZfkGK1rvbHwQi+IEpxFfPgRRBD?=
 =?us-ascii?Q?41ksOmG1EdSYppV7Zys15gTbdE+gkFtHbFtCkE+dG6Ak71m7Gjr8MnHHsmz7?=
 =?us-ascii?Q?f8+JNBay2tiIwM0KvUrLLnreYgzrdgDh+06zMaJBEV583uKb5WCDmafKkumC?=
 =?us-ascii?Q?GVxjlZI6oxxN3tVnchEZX/BbF6V7+TOOPWYDEkkOpmzETY/fh6oe1EvduKZV?=
 =?us-ascii?Q?OUyxYd4BneLw0bK830DRzoPbW501MX++MfWy5+NMKojprVlC/DSnCHuxFhAv?=
 =?us-ascii?Q?Rtd1PLkB4Iu2U0HPlAS32NCluRlJXpCn5WpyqGegrLFLA7fO8mmHyTrNNttl?=
 =?us-ascii?Q?UwsNi1ngBJN1Hd28Ijue9Tu29F5y7DZQ+709jmH4HdIHKXJr1omyf5w+H5yz?=
 =?us-ascii?Q?RgQAjKkClxxETN2D3JI8lZ4e0LreToDqpyNOlG3ZVMtJP+4R+5ALXLvQ2WIb?=
 =?us-ascii?Q?p61W6pEs8D1ze0E9H0PlzCjAeSHP93rSGUiEADgj2rZDgTLF05Jj68C/knc/?=
 =?us-ascii?Q?1Po/1uOBQPM6HpAA/CQga0TOTCdPPtHQTTqs1X0IJfR74VH9osOsBRWdw5zm?=
 =?us-ascii?Q?9BAQw1gBFJKG4M6C4mrrwqyMRI55z3JMth5p4y1ek2YJ6dIB52MSzKi8e5/d?=
 =?us-ascii?Q?3ZaD/WrM/9WYOFXOiYX5guYu9jdkV+BC7r8U28zYM5PIhZFbIkH86nn8YbWF?=
 =?us-ascii?Q?H9rELQBPMMNkOtIE1s0UayxkjPxYk9CwtuvJAuwC6TjJF89w3WJO0psBjsDe?=
 =?us-ascii?Q?6qYGOk2T7nsSyK9J5IVv1exstl6uDqodAOxDPKTVh/UkeRpUxj1n3WRc8IaY?=
 =?us-ascii?Q?liypceuYfeAC4sPOwHIb1h56HZOoBIaftlNjathn8jUuSmKulUVQ/q5O+vfF?=
 =?us-ascii?Q?dRTzqyXjw43Ha32ejZ4+HgCIBy5/ySoW8KbXNZVucOy2oWpI7aXOwYpa6VnQ?=
 =?us-ascii?Q?J/fFxJ6pYRcUeig7nZTpYfMMVGw/cpt7TlChEVFRzvPJM/UEzUIA4b2yr8Zp?=
 =?us-ascii?Q?lve85++u3g7ckKPjdtRczo48HVeG9Jd3vxl6KKE0pcnrglEMF6YT+nr7DELR?=
 =?us-ascii?Q?1+4YozsARFRpdvKPYKadwz1ygXg2SUcqk0AAS3IxoT5tUQ8B1JyqA6iwpQGw?=
 =?us-ascii?Q?Y3EPPtpTCYJ0btJuDpum4bOD1zlgVkQR4wewSC3dLQJZ6Ob3jbp13U6e90Zb?=
 =?us-ascii?Q?F+ssMNVEHmAubfRahRvdwRrcvTcCuPI6YEGVKxocYowuJpzjB/canJHbGT+J?=
 =?us-ascii?Q?bjimMQnI6fC2i/npX+7YB4YpxWJ8vIUFvsHmNF0jhK7y8PTJ0sMyXNHn6daE?=
 =?us-ascii?Q?TrECEG3D/VJxDzGz+BqiFs/3rR+5YtALcVvVBDhOQIJS3cxOlXE/2UigXw/O?=
 =?us-ascii?Q?2C1g1p2Amk5uJ6rk02QDomgBaaQrf6ULzaS1xY90Orv3TL+If5gelecxlzPI?=
 =?us-ascii?Q?niLndEKXTBSYth1XjZM5V8wE1U6E2eg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 79981507-eb3f-4bdb-b7ec-08deb205b1d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2026 22:11:06.1351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: weV/jkL5ylxQ6hHLM1wtQL5erwTbDtV5nj1FNVapGOIWIH55ZptetBjlHHjl83APoMKjWe6JhHaKiqmg/eqA7Kc8AEQg+R3oEXBee23PNCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10851
X-Rspamd-Queue-Id: 8EB2D5475B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32644-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,gmail.com,kernel.org,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

Hi Mark,

Thanks fort he review.

> -----Original Message-----
> From: Mark Brown <broonie@kernel.org>
> Sent: Donnerstag, 14. Mai 2026 02:47
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCH v6 16/16] ASoC: rsnd: Add system suspend/resume
> support
>=20
> On Tue, May 12, 2026 at 06:26:31PM +0000, John Madieu wrote:
> > Add system suspend/resume support for the ASoC rsnd driver, required
> > for RZ/G3E platforms. Distribute the per-module suspend/resume work
> > across the relevant files (adg.c, ssi.c, ssiu.c, src.c, ctu.c, mix.c,
> > dvc.c, dma.c) rather than centralising it in core.c.
>=20
> Does this need handling of scu_supply?

No. scu_supply is intentionally left enabled across system suspend:
it is the SCU register-access / housekeeping clock, and gating it
would make the SCU registers unreachable to the suspend/resume
callbacks themselves. The SRC suspend/resume path therefore gates
only scu and scu_x2.

Regards,
John

