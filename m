Return-Path: <linux-renesas-soc+bounces-32555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIJBGxAHBGoHCQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32555-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 07:07:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BA552D731
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 07:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E3B13093C01
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 05:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946BC39FCC1;
	Wed, 13 May 2026 05:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hwk7jW7v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011005.outbound.protection.outlook.com [40.107.74.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A56A39A077;
	Wed, 13 May 2026 05:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648696; cv=fail; b=c/pmqkKIAqmURnnpWjr1E9waKjP5NCrZIGNQOJOD0z6rOgZ0zNo9FQ8VVznDnYiaxak+pfQMf/jTm8FSO9qCeSsMpaHjKPZTtpbtyXDNfu4V7N+ptIUAi+cDMWZNSAaB1Hs5IIp78hyX8sOmcEkwvfKaJeKx6xo+Wu5+HZGOLgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648696; c=relaxed/simple;
	bh=uivQjsokQMPUrWdaBVJy1ZGX6tUisFiVZX53KKVImeU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Qgj0hImbvO2OE3DQQshnmxRS8SfPxkQkfkffM2ThyoRgkx4Jonxa4J2+KiVey9v0u03CbBrnq8y9TNmoD8EX5bJE0YUlp4lasKuvIKMyZxPb0ozUh+gussCmspkLDGlrqvtmO4NhagBA3rEj6hYAr4w4JIOZmq1cEJuB4OTtutM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hwk7jW7v; arc=fail smtp.client-ip=40.107.74.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cv3lCZFSrRlSy/GJ1sx00fDK3nLkgJ2J/RsMFSR6LHP0QBp5v/qN2OH/Ur8cdUlHgyWbeB6ID9MSLn14V1bnwy3KnbYiVEl+GyMxebvwNbbDbtfVyAlOt1Mk74H98QIYYisKA/2kjaQyC5SqJDXXYHyMOtK0Z9WLAX8jbStf7894OfK9W4rzfjgu77+a4cIPloUQdgMRY1qK3gy+BHHPDNhc2PJFvKZIRiRu/3rRj8+UlO66reKkoEQwF0Z++ObZeAJPKo+y3gVA03eM7ICEdwZNZ1QIt3cAJpHIGdgHLWoooDaqevbFw4MNTcqHUsbU1/0lwtpEpqEOpU8pjLFNgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVZNnVkNNAWkstZHSQZuW5ACc2ucTq6eaAwYhMbr6hQ=;
 b=iovUQdGm3P7iiafvjhVoJjafVJbdTz3utqZQ65pObuUBM3ZxHiC4q+z7/HynJAgh25/62+iry0MYAkU0pDNpNFqjWmy/VNULmzpLtIQFWA9pbdv5yQzrkZFr+UGXzzTQAfnHMVQkT3YMeJYAgNkp5cdhc8nnj6F9Ax7BWBMF/z9cZe/RijpdWYgcogoBOjqtbRgMrKI39Xe2IXdNBvOh5PmfzVVxdxBmrdwfl01ny+iN0N66i6TZMpEF+p8ue8WW2dMi8pXn0OqZ+70OkL1Zpbma1AV6SWQFKruVt1OV5Q4vd9C9Tr2Ig8jo9+KZtY8zDM1E49Ugs1UPChudprtq1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVZNnVkNNAWkstZHSQZuW5ACc2ucTq6eaAwYhMbr6hQ=;
 b=hwk7jW7vjWXoA9eZMxPTOSwrEQWCvzhCtcLoLis7xjAPjV00EOEkhdf7DUr92lA5n9ki5L8hz04opAR2mBL+kFe2h7Sv+byAUotSV8Z0mlmMPax0kkj7zrdlWJrDLpLtqqVlIjswpaBU0vNFMyNl0pJRM/LIYgIZtXyIVBT1fIY=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY1PR01MB10722.jpnprd01.prod.outlook.com (2603:1096:400:323::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Wed, 13 May
 2026 05:04:46 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9891.021; Wed, 13 May 2026
 05:04:46 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
CC: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Geert Uytterhoeven <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 09/16] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
Thread-Topic: [PATCH v6 09/16] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF support
Thread-Index: AQHc4j0oIH83bihPlEaJPgVZpBc2XbYLHDsAgABKa4A=
Date: Wed, 13 May 2026 05:04:46 +0000
Message-ID:
 <TY6PR01MB173774589216B8FAA085623C4FF062@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
	<20260512182631.3842065-10-john.madieu.xa@bp.renesas.com>
 <874ikc6taa.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874ikc6taa.wl-kuninori.morimoto.gx@renesas.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY1PR01MB10722:EE_
x-ms-office365-filtering-correlation-id: 7bf82d2d-bc54-4bb7-c90c-08deb0ad273a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021|56012099003|3023799003|22082099003|18002099003|11063799003;
x-microsoft-antispam-message-info:
 LtpA7kMA7oyp02XnntH0adZfhRLDP1UzsjiMY0CPTw8ScWvmFhRCDge8W3j4RMbyshnN2jNT0GKG2XgC/x+kyObmKw9FYwwbWWWzt5B/OS7uuJvwdFBM1kn+AL6cBw3821j6k9ddukxohuf8NatacB/wqf1YbB8L8dCh0RUGgughMSbedgFf+FeIujHxr2GcOctnPPVkT/jQYRbbfzipvp7uLIdjKELE09lXtred0tUyODLjh/yqh8JstDHUgQPgXNIhf/C5KFMhVREcAvQMGZxoua+pxhRArtaU2cwp8xjk7rx6wQJ1oyxG0HEFV/8vyhRkVlpdVe+KvwW+YBB6JJUUMqIqFMMZyQxudyWJ2ucIihcy5Dj87447Wr0nLkUWdf8ABKXXlttq8p3j5irvbV7hbTL+MDu5KBAyGXDWnJZnN6j2yoIybaARs0mDLcnvD2wEfjmifN3skUxeZwaKt421HsgGNiyeu+CXSy9EJOa/Dz0lQT3YGKBZcynm3DNHj6+xUJlumRYMlSpKd35US8DxRQnOXkQMuS58Qo28YZpIB+dnrUq/tysjA5texO713ZeCWNec9dAfUE+LraSNsVrNNlIv1Ya9wRCo8XVUoFx5ygDxzs9NpVbwpBVa6+7uRjN0Wdeo6iwwVBlwHfLFk5yamMBomKUrjfieJpKWWOTLquDNdovKeytFzARR1/CtSxRirnvpUCkaFXjsaKyg5GOG1EoBW57OzZe4N+ItTqrLvgPZcircMT69b9922Dc/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021)(56012099003)(3023799003)(22082099003)(18002099003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9uHXTXJxBjP2VqLqV0tv4QL5jf7ULYRE+7Ne7e9Nk2Ayhah6LSKniHxSjHaE?=
 =?us-ascii?Q?FrhHspm4bZ0cVbs8H2IFMqG0Nic7lGEG4X/bZu0iGQhvgdzyP95m00Fs1smZ?=
 =?us-ascii?Q?kAs3EFkK09dgz0w4O6UCcNVs3rovoPY93SpOAxhF++cnKu0lWBWVg3PP9AXQ?=
 =?us-ascii?Q?WZpgi7CVb9T0njAq9UDmg3oVa4MNQIGv88mnujbLbut27FPsFrDUk6nCTxV5?=
 =?us-ascii?Q?GtggH0KQYq+Eb4+MbkMH+gAzNzX2KxTMP5td1lRnxElsleT8xpHBTNGpoxnH?=
 =?us-ascii?Q?PKilACSQrt4r2LlOmpcxXGk4JsLZ69WBNhzHDVDw0JCgGENjDdbjfk0D0Ke0?=
 =?us-ascii?Q?YPbZewzVR/2HN6WEutQIAM3GB/ybp8fDCbcceU1SfVlwyIp1tIGfOFNpDuyK?=
 =?us-ascii?Q?ZnnSE8l7UN8cbn91iNEl9GYxZm/yApTOMVRkBBtHrYkbP060q7AV2l7VgJ/5?=
 =?us-ascii?Q?p01TaYNXuGnNaLVA9qlMLOhjssXVjniTDFPkoEM6YwpB5rBw5z3N9DTaAle0?=
 =?us-ascii?Q?HPn0eIT/fwytYUochjS2TWa1nPeqbFbHq4WsNowwf76lOWwR/Lj0Bp1zAksM?=
 =?us-ascii?Q?nSGlX/SzkRj6BN75wW9Prv/02ndVxTcMnzgxR7rJyEhGZO3Uc3AE2KbRu++c?=
 =?us-ascii?Q?4TaYq0D83APUliMg3enOLkfqQeMN+5mjtXli9R+NSUg9odEiFEiCzz8YThur?=
 =?us-ascii?Q?XoQXCFsAKUZhgcpo+xUV8micyf2zG1mtjkbyabEgaEuFoVbfDFixfNKCqdBF?=
 =?us-ascii?Q?HsS+Dix8lbhH30C1MsbponeFo+64N+GiXflt9t8R1EVj2hiPhAsE+ArHR/QR?=
 =?us-ascii?Q?mfHhwe+OJkmXCQtjX6p6HPy8LpyhL3BQ1sYCvH3sjer7ms93n5bbxSau8RCE?=
 =?us-ascii?Q?q1q6/TPv33fTpBQivsDvLWtWQ6QbwXVdPVLVFzAsANMJgZ4e46OqFAdb4J/0?=
 =?us-ascii?Q?hHKhkX6f0tUKuyG4r2W60XiMQWtWaZugGJMSOPmpBPP+HE7wMMWa67zAhCKy?=
 =?us-ascii?Q?nCgRnG6bl+EjchxaWbhSccLgLKrpO6J8jOXmhG7wP4Qr8fmr8on221kRp3hG?=
 =?us-ascii?Q?yuI2iQQiMVbyF5c8GkOpFIhcDuG6uiViWYpxBYSgndI1yxhKi+iEOkFJZh7J?=
 =?us-ascii?Q?2wQykSgUKdQiqPt6wG1180+Pf5Lw6VvH4gY78SDwR3UXvh5brCluJpT8GX7/?=
 =?us-ascii?Q?Fnp8+K/9ccVUsd1rfMIj0lJ7fstNkUcJevMlHZKH8wX29s2a8CLnM7oGZwZ7?=
 =?us-ascii?Q?KVzE9Vl9AOBWcHgk1wfLOCR/uTVMQsbBGcADd6DJm+k2XTkc+7hdD93nMin/?=
 =?us-ascii?Q?YVZv61Y3npjBSWRTll6TcSHr8pKG0HEzMEwV9gn7OgneC7ArHEgnD3zRynGp?=
 =?us-ascii?Q?R2+lb5NPvk3nn6lNAfGTyYyaWc2AjpEDAlrC7gFVk+6OVB/bnNwgzX9Gf4HG?=
 =?us-ascii?Q?Fmv+9U2hSDOlirnre5/kjob0yusUle4mIDN7SGzig+KxbmNdMSuJgeBpOy77?=
 =?us-ascii?Q?QUQ0J0WwBa9IZa2s1GqgWhvVJvulbaX9PxgkJpJ/kvFCLWjlJUUYAUOVsBK/?=
 =?us-ascii?Q?wojRg3ZYnJ6Sue9pMI8eSWjqWYBJsGWQ0mmYgx+tbUqZ/DOfCcgoXADgN5on?=
 =?us-ascii?Q?Co5TA+URc8b/oVjzmusga6v5CmzzRxWzlgUBJ7ih9vnRWKidTGXhUzOZpFUw?=
 =?us-ascii?Q?IosbLutVVfUOBAtJdtZOrUvOnKKM9DH3QPcTvypZB8TvmF5QYjzEbC0qw3ho?=
 =?us-ascii?Q?D+IjUpmViT3XARTGGHWZxMDz5cTuJAk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bf82d2d-bc54-4bb7-c90c-08deb0ad273a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2026 05:04:46.6761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u2o/i4rpAdoj/UsoGPPfbHUO6IE2zSL4hHlHZSvF4oxT6upzjDuqCjpH5RPcPBXQgpXxEgioY+50qNqaE41f2OZfpdAJYdzh/sWkvL3kR0A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10722
X-Rspamd-Queue-Id: 08BA552D731
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32555-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Action: no action

Hi Kuninori,

Thanks for your review.

> -----Original Message-----
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Sent: Mittwoch, 13. Mai 2026 02:35
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCH v6 09/16] ASoC: rsnd: ssui: Add RZ/G3E SSIU BUSIF
> support
>=20
>=20
> Hi John
>=20
> Thank you for the patch
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
>=20
> If my understanding was correct, this patch includes 3 features ?
>=20
> 	- adding busif_status_count
> 	- adding rag3e_id
> 	- adding rstc
>=20
> I guess these can be separated ?

You are right, three things are happening here. I will split them as:

  09a/N: ASoC: rsnd: ssiu: Add shared SSI reset controller support
         - just the devm_reset_control_get_optional_shared("ssi-all") in
           rsnd_ssiu_probe() and passing it to rsnd_mod_init().
         - No-op for non-RZ/G3E DTs.

  09b/N: ASoC: rsnd: ssiu: Add RZ/G3E BUSIF support
         - introduces struct rsnd_ssiu_ctrl with busif_status_count and
           parametrises the loops in rsnd_ssiu_busif_err_irq_ctrl() and
           rsnd_ssiu_busif_err_status_clear().
         - adds the rzg3e_id[] BUSIF index table and the SSI_MODE0 guard.
         - sets RSND_SSIU_BUSIF_STATUS_COUNT_2 in the r9a09g047 match data.

I am keeping busif_status_count and rzg3e_id together because they are
both keyed on RZ/G3E and form one feature ("RZ/G3E SSIU BUSIF layout").
Splitting them would leave an intermediate state where the BUSIF index
table and the error-status loop bound disagree on the SoC. Please let me
know if you would prefer them as two separate patches anyway, then I
will do a three-way split with the busif_status_count refactor placed
first as a no-behavior-change preparation.

Regards,
John

