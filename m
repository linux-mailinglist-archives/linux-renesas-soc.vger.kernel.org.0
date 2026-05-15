Return-Path: <linux-renesas-soc+bounces-32681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAUJMiUZB2rOrgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32681-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 15:01:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6ED550168
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 15:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CCDB31DBBD8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2026 11:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FCAE47DFA4;
	Fri, 15 May 2026 11:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VUrytX/t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010012.outbound.protection.outlook.com [52.101.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D31B35A933;
	Fri, 15 May 2026 11:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778846347; cv=fail; b=ECraiHL3clbrFPLImJCBl3nc8hfnIOHMKbRfMBI5keZdNrz2oBnLZPIkrulNzTDy5mn5cRbyni9ryynxFnyw1m4gk8dBReoN/GdeY4sNhg51zDZ+VQoiGknEm2xh3pDXV9M5HKJxljZ8udpeSPorHh/7eVppK95MxfW9UU0ENUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778846347; c=relaxed/simple;
	bh=Yuhh2tDjFaEkG+mUGVz+wnMF3vHTgqzH2HsomimLVXE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hCokIuW5UhlWA2yed6aJeY6NLon5wWQ8lLb8FQc7x2ZvUJk33owYwVcDEMZnZd2uBFGEn85R+nx/j2wTY0h69WS7KicYFu3QTuAwCcCYtMuu3/3PlA27Qml9lF8aByfMdOG415uBnHQCHY5ne3oD7WFPXEEVi9GybAyzV216NaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VUrytX/t; arc=fail smtp.client-ip=52.101.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRTDW8qMVauVthfBOCcE0Fz73UJLhhcVJFkCvwlKVB5Kmo/bQH2AE32BRrghI2QQst2y2P7zRaCXQssM6xasd0fLb/2jBUl42LyCMq/xygxXqwC6dHurXpRDDFLkdDxRLH7cSPIiLsbtoKFg5Yoyh/IgJAPKVKmXH/MJT6Asv+om+4kMBeCzaWuaQ62bbqTxhVCT1R8HN+fY6z9vHAF5bmDHGzj/eBVpt145KU3abORG4FCM0t1wvBWeJXpbQlt2/1H83+kRgsieXPFUl/et4BU19lb1c2nm0QOHJX3VqJKdBZ08odbvY3vNk0rGjQQ1gcAK0No5WuXBnDsNmXQpVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UKIQE56h9jPa37zOiZTwqLZ6a4C2QVqHofbOtaB0eIg=;
 b=Gkpu3fdF1FHN1KwNUnUQcPoO4Hf19AGZ2mgm0TvcOP489SY9HDlSk25tYljvgsoYWPPVB9VGgVBly6z6igouJIJgPNaIM9scx+Gfsz/bPW4UHgWXRkv3QXDa1ss7t8zVJ1rrYDLWw3bBOJP0qh0Oppy5njz3qsh5HfEph8pZciQjJ6WhJvRWKB9eGEODtFJXocYw9VwPzHJ4lNGkzUDxaKNC6UH6YBRkz/2OBe9Mp3vxUuiEBOwxMVCnXTtA09vmpeMq1DZLxIsBPuREg0KxAUkiVbzFccPVFbqWVBQ5pt78v0iswzBikb1pi3YH6v50JocaIbBAlLtoYxI2Dqk3BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UKIQE56h9jPa37zOiZTwqLZ6a4C2QVqHofbOtaB0eIg=;
 b=VUrytX/t7RAY9FFTNswtQhhFCCD5g1llU/HLSxACByeHyH6hCBGopT9cxCSna2Ch6ZyJOOrs26PodSy9vjErIYVvrE2m4+3EdOBepewqqAG+px3JAK/kMdqeki13YStCVFeiGqYu50D2twgXZsh51TLLzqfbN9HAzqSOUayFjV0=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by TY3PR01MB11020.jpnprd01.prod.outlook.com (2603:1096:400:3b0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 11:58:55 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.20.9913.012; Fri, 15 May 2026
 11:58:55 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Rob Herring <robh@kernel.org>
CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
	<broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Biju Das
	<biju.das.jz@bp.renesas.com>, "john.madieu@gmail.com"
	<john.madieu@gmail.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v6 01/16] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
Thread-Topic: [PATCH v6 01/16] ASoC: dt-bindings: sound: Add DT binding for
 RZ/G3E sound
Thread-Index: AQHc4j0JOxbIxckKgU+hYzGA6LonCLYNlzkAgAFlkWA=
Date: Fri, 15 May 2026 11:58:55 +0000
Message-ID:
 <TY6PR01MB17377F226C3B10B1DC5AD1FFFFF042@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260512182631.3842065-1-john.madieu.xa@bp.renesas.com>
 <20260512182631.3842065-2-john.madieu.xa@bp.renesas.com>
 <20260514142754.GA378860-robh@kernel.org>
In-Reply-To: <20260514142754.GA378860-robh@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|TY3PR01MB11020:EE_
x-ms-office365-filtering-correlation-id: 22e58746-d174-4347-a609-08deb27956e9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700021|11063799003|4143699003|22082099003|56012099003|18002099003|3023799003;
x-microsoft-antispam-message-info:
 Jz6fer0fr2VZvL14pcfRFuUK83XGvdoBPenIDXJgbBwEAPit42EISKDs9Ns9EHniiuFkeRxsAtFi3fylG4JJwSkfui5pZIc/yLxGXHxzkMWfcqWfofpZWZfuMObfEnErQvjdHlP2t4M38e+tptnY2r8JvzOSgQvuA0Z5WsISAE3NDLIFSjdesS//+jlucql5tfTCmJ4um/2QIFNYFmyDtwkI+RFK/6y0KtF6LzMnVVtOQS8hJMO6YWuztnumpRjN5Qt4U60O5IHAW9V2XXmtC/gnxh+Q+JJYGuORZKk/cvgYbsp86+yzBuyZo7Dg7d6NGakBu3PDrhI2/AaXHjuOhoHzsj8BPlErdOetMss+DRW/o0G/wOwtPuKX3MRdQpdSENZYA9BNtal3e9DVbtpxjC7gKQRm4UoduuhRqzxMvY3EzBds7FCGodwsFX21ow3UEc+dg018uGDtw5e7WLX8CNoJCWGjRwatrh1eiGqjPs4ZxWoL9SDFjvVSEgUTYaJ9T91x2BjaGMKHE8/2wdFEaxROjJcrMSDbP4f8XgFvgR4StEuEMzK2FQ2WQq9lozQHV6yA/RquJob7dqTqi3UUcfXNX47jVlhJ4Xtz5kQPlinMJZf627ivDphhyqJbbPdU++TUfNXdgKIMDG0hbPnXzfGaFsZb4zyXrpYKzk3iereZ1FaeWXtjOgNf6nzjoCvBgFHPj1f/cllmYE3WL5IOQA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021)(11063799003)(4143699003)(22082099003)(56012099003)(18002099003)(3023799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?V5W3Vn9XIunPt4tgoRPs5RAxe0g8Baszj7CIah/YqCbO1xi0uVmPxGp2rnqY?=
 =?us-ascii?Q?P+4VwSr5pn5gz9CE2YlxnGS7jDaxBU4FEXpWDEnNjr5KumaBcBxpU2xeKdDc?=
 =?us-ascii?Q?kuY+vHAZnwTjx3LD/rLdkPUcYvg5pKPg7ozfEbyl0KnIfMN1s7fDi3hvi/Z2?=
 =?us-ascii?Q?6NXLeHeDpcLF8PtEGzSpHt3b+SgCCsOcn1r9s3RZVYpwsKqI8uTdCp5vbHZ+?=
 =?us-ascii?Q?H+0lQMvtePRE9L/zYWKW9MfTCUQ+xBqtP1RbvpmxRjPCnNo0ILy1LNs7zerq?=
 =?us-ascii?Q?5WZjsh1PAQX2EJJrSe1+5IrlfhEVejYVdK7wPLfXk5Ae0wle9U1i3OVryJTW?=
 =?us-ascii?Q?LtIJXE5yTVVG8ZUraO7W67Frqy8PYoY66XcmnCkSm16KIpC/ZEhkglYj0hsd?=
 =?us-ascii?Q?3h0/eA6N10jR9B278uBgt0vXYUjzLJTXpozbDIHizECuNHsSqj1+kZneTH1w?=
 =?us-ascii?Q?uwDXBb6dL/2QS00I27fNJo8rSQmgzpa3/UrOdfhBTs1nw4LMV+Cvna6aV65o?=
 =?us-ascii?Q?ONal4p5bGjj9mb/cCwzFTj4JdOpewG0vaxryA/kYWv0s0cwEz6+FRI4d5G7F?=
 =?us-ascii?Q?LWU13K2A5ONs/WpZ6/k53+28G4znLu9p8Uw7qxdxhMCYqXyN5XApMKa0ZnZk?=
 =?us-ascii?Q?uyDXC33sfxcTAOl8bQ4yuJSuACfqgRY04xM+QdiED08/Qz/skKuM4BceTyoj?=
 =?us-ascii?Q?34NCQDOuUz3f6zPYshPIXRxlAJhOCWbuDlZ81bBsrfSlqG0dV/Fv+aqbOVfE?=
 =?us-ascii?Q?ZziluZdRgpWXNWCX9bsBBHxR9ajQW5Qps3MzxMgo0c9g2It1o+ecR/MVC0B4?=
 =?us-ascii?Q?EIlj7INYMeOd2V7WiqdNzpvgZKuGzjoq9GbqShr4DnHXWq0BhXkM6mKpzWbP?=
 =?us-ascii?Q?FJoMMmTcmLcUznvYNbWWtkvCIHeAOGZ95f1hUu5ESQCP4ICIQYfTiYlgbHDQ?=
 =?us-ascii?Q?pp5A/gU/dY7BkDoTMmTz68/4yWyriZv6T+PrxyFlENsZWe1/+nONuiXsxdCf?=
 =?us-ascii?Q?1Q7qXSuH+xbqgvOW0o39wF9GFyks6+iUAw6G5XnHZwq0TguMchmBmfL3fVz6?=
 =?us-ascii?Q?HeciSGK2hqbYVX8NutYIIi4lLB6DefPK3WUbKyXAGIOVvXvW+tExjUtTTrrr?=
 =?us-ascii?Q?5JbyO+GYY5aXi2Zx+xgz4AdcfO4SFIGd9Cys1dyDxfKNn2pklHIC31PkISMc?=
 =?us-ascii?Q?SZRbkf7VsMnhhSFsRFzejCd29YjQ8hM4s1XeJq+ML9sntm1mQeUczpOv/qdk?=
 =?us-ascii?Q?ZWxLL+yGcxgvHK//eVqG6q6PMjjWl9KXTavRmcFjdALoxwBRsOOWaX7czcaX?=
 =?us-ascii?Q?KilKALN3z23vpj1LENRvf180vmva38wOnhbzeV38h37BTtVkM2P9NjKGurmV?=
 =?us-ascii?Q?8PGQwlKjqSzT6Q8eNWkJDr+Y3YhGKZfkMfOOaDfmTIVHHIBNliXfgdNDkBMs?=
 =?us-ascii?Q?EfsU3oQeITCXWES54GOo7V25FrTFSLev5bnHH8A3uKYZtuFqzZJ9X9vjMT0r?=
 =?us-ascii?Q?qo/tu/cAF1mJbvR6/f324IrOnvjx1gXHFcyNPhO6+S/99qVaYEN8GR3UgWGD?=
 =?us-ascii?Q?9SY8WhDtv5nChVdObB/Qb6yey9Wka2cchgdatSNsZ3o5u6UbeX21lLuLnLbV?=
 =?us-ascii?Q?gvT5e6F4a125Ja4m4CFn8YgUhiDvdWL2qof+tRt9S7pMUe7EzG2BHTZimiBJ?=
 =?us-ascii?Q?cXnVkgxJB3eqGT6qAT85jrmu3yRrCIq66kW+JkrRBI7syDNkL2k72cjw75DJ?=
 =?us-ascii?Q?xG4dh9zr9pF7ruE/OnZnChvLYPUxDEY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 22e58746-d174-4347-a609-08deb27956e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 11:58:55.1880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y/k2G927dgxdf7BnvS5rXgMzlBfSMT9L4FocghXPcoC2l5zeXmBb1HKow01KVFOhiNEqbPwKxstQcA6O5mEajHaPqnegz5lX6eXd5D7OGF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11020
X-Rspamd-Queue-Id: 1A6ED550168
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,glider.be,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32681-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Rob,

Thanks for your review.

> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Donnerstag, 14. Mai 2026 16:28
> To: John Madieu <john.madieu.xa@bp.renesas.com>
> Subject: Re: [PATCH v6 01/16] ASoC: dt-bindings: sound: Add DT binding fo=
r
> RZ/G3E sound
>=20
> On Tue, May 12, 2026 at 06:26:16PM +0000, John Madieu wrote:
> > Add a standalone device tree binding for the Renesas RZ/G3E
> > (R9A09G047) sound controller.
> >
> > The RZ/G3E sound IP is based on R-Car Sound but differs in several ways=
:
> > - Uses unprefixed sub-node names (ssi, ssiu, src, dvc, mix, ctu) instea=
d
> >   of R-Car's rcar_sound,xxx prefixed names.
> > - Supports up to 5 DMA controllers per direction, allowing multiple DMA
> >   entries with repeated channel names in SSIU, SRC and DVC sub-nodes.
> > - Has 47 clocks including per-SSI ADG clocks (adg-ssi-[0-9]), SCU clock=
s
> >   (scu, scu_x2, scu_supply), SSIF supply clock, AUDMAC peri-peri clock,
> >   and ADG clock.
> > - Has 14 reset lines including SCU, ADG and AUDMAC peri-peri resets.
> > - SSI operates exclusively in BUSIF mode.
> >
> > These differences make the RZ/G3E binding incompatible with the
> > existing renesas,rsnd.yaml, so it is added as a separate standalone
> > binding with its own $ref to dai-common.yaml.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >
> > Changes:
> >
> > v6:
> >  - Rename all indexed clock-names and reset-names from the dotted
> >    form (ssi.0, src.0, adg.ssi.0, clk_a, clk_b, clk_c, clk_i) to
> >    the hyphenated form (ssi-0, src-0, adg-ssi-0, audio-clka,
> >    audio-clkb, audio-clkc, audio-clki) so the new binding follows
> >    the standard DT naming convention.
> >  - Tighten #sound-dai-cells to const: 1.
> >  - Drop unused properties: clock-frequency, clkout-lr-asynchronous.
> >  - Simplify the ports/endpoint schema (single ports object with
> >    port@N children referencing audio-graph-port.yaml), drop the
> >    separate top-level dai patternProperties block.
> >  - Move additionalProperties: false to the top of each sub-object
> >    (dvc, mix, ctu, src, ssiu, ssi).
> >  - Reorder example clocks/resets to match the new ordinal-ascending
> >    name order.
> >
> > v5:
> >  - Drop the two-patch rsnd.yaml split approach from v4. Replace
> >    with a single self-contained standalone binding that does not
> >    touch renesas,rsnd.yaml at all.
> >  - Remove select: false, redundant blanket properties
> >    (compatible: true, reg: true, etc.) and pointless
> >    patternProperties per Krzysztof's review.
> >  - Add missing #clock-cells and #sound-dai-cells constraints.
> >  - Add hardware description text instead of "Binding for ..."
> >    phrasing.
> >  - Move G3E-specific DMA comment into the binding itself rather
> >    than relying on a shared schema.
> >  - Use unprefixed sub-node names (ssi, ssiu, src, dvc, mix, ctu)
> >    to reflect the actual RZ/G3E DT binding.
> >
> > v4: No changes
> > v3: No changes
> > v2:
> >  - Introduce RZ/G3E sound binding as a standalone schema.
> >
> >  .../sound/renesas,r9a09g047-sound.yaml        | 743 ++++++++++++++++++
> >  1 file changed, 743 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.yaml
> > new file mode 100644
> > index 000000000000..0b651214bd61
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/renesas,r9a09g047-sound.
> > +++ yaml
> > @@ -0,0 +1,743 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > +---
> > +$id:
> > +http://devicetree.org/schemas/sound/renesas,r9a09g047-sound.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/G3E Sound Controller
> > +
> > +maintainers:
> > +  - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > +  - John Madieu <john.madieu.xa@bp.renesas.com>
> > +
> > +description:
> > +  The RZ/G3E (R9A09G047) sound controller is based on R-Car Sound IP
> > +  with extended DMA channel support (up to 5 DMACs per direction),
> > +  additional clock domains (47 clocks including per-SSI ADG clocks),
> > +  and additional reset lines (14 including SCU, ADG and Audio DMAC
> > +  peri-peri resets). SSI operates exclusively in BUSIF mode with
> > +  2-4 BUSIF channels per SSI.
> > +
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a09g047-sound
> > +
> > +  reg:
> > +    maxItems: 5
> > +
> > +  reg-names:
> > +    items:
> > +      - const: scu
> > +      - const: adg
> > +      - const: ssiu
> > +      - const: ssi
> > +      - const: audmapp
> > +
> > +  "#sound-dai-cells":
> > +    const: 1
> > +
> > +  "#clock-cells":
> > +    const: 0
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  clocks:
> > +    maxItems: 47
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ssi-all
> > +      - const: ssi-0
> > +      - const: ssi-1
> > +      - const: ssi-2
> > +      - const: ssi-3
> > +      - const: ssi-4
> > +      - const: ssi-5
> > +      - const: ssi-6
> > +      - const: ssi-7
> > +      - const: ssi-8
> > +      - const: ssi-9
> > +      - const: src-0
> > +      - const: src-1
> > +      - const: src-2
> > +      - const: src-3
> > +      - const: src-4
> > +      - const: src-5
> > +      - const: src-6
> > +      - const: src-7
> > +      - const: src-8
> > +      - const: src-9
> > +      - const: mix-0
> > +      - const: mix-1
> > +      - const: ctu-0
> > +      - const: ctu-1
> > +      - const: dvc-0
> > +      - const: dvc-1
> > +      - const: audio-clka
> > +      - const: audio-clkb
> > +      - const: audio-clkc
> > +      - const: audio-clki
> > +      - const: ssif_supply
> > +      - const: scu
> > +      - const: scu_x2
> > +      - const: scu_supply
> > +      - const: adg-ssi-0
> > +      - const: adg-ssi-1
> > +      - const: adg-ssi-2
> > +      - const: adg-ssi-3
> > +      - const: adg-ssi-4
> > +      - const: adg-ssi-5
> > +      - const: adg-ssi-6
> > +      - const: adg-ssi-7
> > +      - const: adg-ssi-8
> > +      - const: adg-ssi-9
> > +      - const: audmapp
> > +      - const: adg
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 14
> > +
> > +  reset-names:
> > +    items:
> > +      - const: ssi-all
> > +      - const: ssi-0
> > +      - const: ssi-1
> > +      - const: ssi-2
> > +      - const: ssi-3
> > +      - const: ssi-4
> > +      - const: ssi-5
> > +      - const: ssi-6
> > +      - const: ssi-7
> > +      - const: ssi-8
> > +      - const: ssi-9
> > +      - const: scu
> > +      - const: adg
> > +      - const: audmapp
> > +
> > +  dvc:
> > +    type: object
> > +    additionalProperties: false
>=20
> blank line
>=20
> > +    patternProperties:
> > +      "^dvc-[0-1]$":
> > +        type: object
> > +        additionalProperties: false
>=20
> blank line
>=20
> > +        properties:
> > +          dmas:
> > +            maxItems: 5
>=20
> blank line

Will add, here and in the equivalent src, ssiu, ssi blocks.

>=20
> > +          dma-names:
> > +            maxItems: 5
> > +            allOf:
>=20
> Don't need allOf.

I tried dropping it and dt_binding_check rejects the bare form
("items: {const/enum} is not of type 'array'" from
string-array.yaml). The items-as-list form doesn't fit either,
because the length varies (up to 5 AUDMAC controllers per
direction), so maxItems is needed alongside the per-entry
constraint, and the meta-schema rejects maxItems together with
an items list.

The allOf wrapper is what renesas,rsnd.yaml uses on src, ssiu and
ssi for the same kind of constraint. Is there a cleaner construct
for "string array, maxItems N, every entry must match this enum"?
Happy to switch if so.

>=20
> > +              - items:
> > +                  enum:
> > +                    - tx
>=20
> Is 5 entries of 'tx' really what you want?

Yes. On RZ/G3E each direction is fanned out across up to 5 AUDMAC
controllers. Each dmas entry points at a different AUDMAC, and all
5 share the name "tx" so the dma-engine core's match-string lookup
picks the first matching entry, falls through to the next when
that provider's .of_xlate() can't satisfy the request, and so on.
The driver just calls dma_request_chan(dev, "tx") and gets back
whichever AUDMAC had a free channel, without needing to know the
topology.

Will expand the commit message and add a paragraph in the
binding's top-level description making the fallback explicit
so it doesn't read as a mistake.

>=20
> blank line
>=20
> > +        required:
> > +          - dmas
> > +          - dma-names
> > +
> > +  mix:
> > +    type: object
> > +    additionalProperties: false
> > +    patternProperties:
> > +      "^mix-[0-1]$":
> > +        type: object
> > +        additionalProperties: false
>=20
> There is little point in empty nodes.

The rsnd driver enumerates MIX and CTU instances via
of_get_child_by_name(), and DT labels are attached to these
sub-nodes for the playback/capture phandle routing arrays. Without
the nodes there is nothing to label and nothing for the driver to
iterate. The same empty patternProperties exist in
renesas,rsnd.yaml today.

Will add a description block on the mix and ctu objects so the
purpose of the empty patternProperties is clear. Is there a tidier
way to express "this node exists for labelling and enumeration
only" that you have in mind?

>=20
> > +
> > +  ctu:
> > +    type: object
> > +    additionalProperties: false
> > +    patternProperties:
> > +      "^ctu-[0-7]$":
> > +        type: object
> > +        additionalProperties: false
> > +
> > +  src:
> > +    type: object
> > +    additionalProperties: false
> > +    patternProperties:
> > +      "^src-[0-9]$":
> > +        type: object
> > +        additionalProperties: false
> > +        properties:
> > +          interrupts:
> > +            maxItems: 1
> > +          dmas:
> > +            maxItems: 10
> > +          dma-names:
> > +            maxItems: 10
> > +            allOf:
>=20
> Don't need allOf.

Same situation as the dvc-N case above; will follow whatever
resolution we land on there.

>=20
> > +              - items:
> > +                  enum:
> > +                    - tx
> > +                    - rx
>=20
> 10 entries of any combination of tx and rx?

Same reasoning as dvc-N but for both directions: up to 5 "tx" plus
up to 5 "rx", each duplicate name being a separate AUDMAC fallback
target for the dma-engine core to try. The same description
paragraph at the top of the binding will cover this case.

If you'd prefer a tighter constraint (enforcing exactly 5 "tx" +
5 "rx" in some specific order, or splitting the property into
separate tx-only and rx-only halves), let me know.

>=20
> > +
> > +  ssiu:
> > +    type: object
> > +    additionalProperties: false
> > +    patternProperties:
> > +      "^ssiu-[0-9]+$":
> > +        type: object
> > +        additionalProperties: false
> > +        properties:
> > +          dmas:
> > +            maxItems: 10
> > +          dma-names:
> > +            maxItems: 10
> > +            allOf:
> > +              - items:
> > +                  enum:
> > +                    - tx
> > +                    - rx
> > +        required:
> > +          - dmas
> > +          - dma-names
> > +
> > +  ssi:
> > +    type: object
> > +    additionalProperties: false
> > +    patternProperties:
> > +      "^ssi-[0-9]$":
> > +        type: object
> > +        additionalProperties: false
> > +        properties:
> > +          interrupts:
> > +            maxItems: 1
> > +          dmas: true
> > +          dma-names: true
> > +          shared-pin:
> > +            description: Shared clock pin.
> > +            $ref: /schemas/types.yaml#/definitions/flag
> > +        required:
> > +          - interrupts
> > +
> > +  ports:
> > +    $ref: audio-graph-port.yaml#/definitions/port-base
> > +    unevaluatedProperties: false
> > +    patternProperties:
> > +      '^port@[0-9a-f]+$':
> > +        $ref: audio-graph-port.yaml#/definitions/port-base
> > +        unevaluatedProperties: false
> > +        properties:
> > +          reg:
> > +            maxItems: 1
> > +          endpoint:
> > +            $ref: audio-graph-port.yaml#/definitions/endpoint-base
> > +            unevaluatedProperties: false
> > +            properties:
> > +              playback:
> > +                $ref: /schemas/types.yaml#/definitions/phandle-array
> > +              capture:
> > +                $ref: /schemas/types.yaml#/definitions/phandle-array
>=20
> This is odd. The graph should really just point to another endpoint along
> with any properties for the connection. These probably belong elsewhere.
> What do these point to? Missing any sort of description or constraints.

Each phandle in these arrays references one of the in-node ssi-N
/ src-N / ctu-N / mix-N / dvc-N sub-nodes; they describe the
in-SoC DAI module chain that the rsnd driver wires up for each
direction. The remote-endpoint phandle on the same endpoint
describes the off-SoC connection. The shape was carried over from
the existing renesas,rsnd binding, which has the same properties
on the audio-graph endpoint, and is where asoc-audio-graph-card
and the rsnd parser read them from.

I'll add proper type definitions, item constraints and
descriptions either way. Where would you like the properties to
live? Or is there any other approach I should have followed ?

Regards,
John


