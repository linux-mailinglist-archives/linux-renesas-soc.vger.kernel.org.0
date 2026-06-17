Return-Path: <linux-renesas-soc+bounces-34165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YvQlAFaWMmr92QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:43:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E5043699D2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 14:43:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=eS2P3tmx;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EF8D93008095
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 12:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80FC23F0ABC;
	Wed, 17 Jun 2026 12:42:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877B13ED126;
	Wed, 17 Jun 2026 12:42:53 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700175; cv=fail; b=IEuifeLXy71IciszhF0xO0gP46vUqOGAv4V4zp764ZoXBaYGdAneeOk8TDkaKI+6IzdTg2lDv34fjSkz6GU5bbcTHVboH6CitV3zA877xCG60L93X+nW+Dc5IHlkFgpKr0Q1nXtbi/PUaZZgtsFWX8looqBh+90VSlQXoZgxzAQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700175; c=relaxed/simple;
	bh=Q0QrRWXmK/0ey9m60jihmUH3gSuaw4uDhox+6PlB0mY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WWlGNA7aGy/rwB/g6R7k0YePkDDzcEcRTaQLiHdh56U3U5Q1bfog38Szj5Vgi0hB6hOOmu+mH3w2uGRNUFqEcvJkdlVoQdHng5v8DB/2C3uttmNA97SyXPzTNppt2Ts0imy9ecbPDCoYUuzAk11brnhqDMMUAm26YS+qv7nxJ5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=eS2P3tmx; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcWchwSEUrbgLDhHdmaWX4RwXg1h6t59gEyy/XYEGrufRt8tGH9QZY6rQrTMgVElqa2mcA3XFKH8t9rn93AUmDRG6Woc+IJn3kxZZL+iCdpigl/FhARMPHXUE6fcbva2tIXBR3QXJWQsbO+RlK47liBnxjQ8MPzrmg6YvtUVCoHKvhtv80TDeFUcRh5qGKsmbTF1pQeNgSXa3d0h4JlIJ5vDeYTecBD/e+5YwzLfxMnD6nrhrD10yPElnof+JMbwqgL2dJ1XlrwvDJQbEe4wkMdjxilB6k6rDPAk2lyLzIflW2ipQQUcEK2DHDUI+fxvK6M7uFfHr8FxXAOSA0WKxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VKHs4KYyOTEF/0pcPoon3zCCekOVnbpDLgITOTe8Sgg=;
 b=AG02X8qeOiucx5KHBx8s0PqAGyvSDRTR0VXYhJP6f7paHcseJmLb1RR81iyHHAVJCnfwqwKkk9lQ+5nanQbjfnAwYIH/Bu7de1l2kqq4ds8uaHsI2tC1iewsHK7xNps3kLs6sXGeNLYyjleCYrgv9PcULV3MNshXtZHagGEomLD6mDgGYrTkphGrAJKGIvuvJDBcAgC8aXifLp4c+yP0+sGnS3h4VkB2B8fNSmfXIoAGrLrAYnBl5VTsixY7bNSrtk17unPaNZg/BZO819mME02q4TmQWpemlACH7wQXQsUAnaKWPoarnMeuHsUp2xt6Nx7wIRLjJj6Y+I3Hk/ipyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VKHs4KYyOTEF/0pcPoon3zCCekOVnbpDLgITOTe8Sgg=;
 b=eS2P3tmxRsD+ECCAnalzyBbBCsUNQVZFzqh8WHm4hM6ABBU9E/hPLWKIfjw7p+sPuh2PztNxfJvKqpPgzDmHMKY6rtdu5MCZqy8MpdJktDp3s94eiPpa5xqpy9bezHvcbJEhDBGsXtlK1s4UzG40ozEZtGipyI2K2H6J3x+4Wis=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS9PR01MB16139.jpnprd01.prod.outlook.com (2603:1096:604:3e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Wed, 17 Jun
 2026 12:42:50 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 12:42:50 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v17 01/17] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L
 (r9a08g046) SoC
Thread-Topic: [PATCH v17 01/17] dt-bindings: mmc: renesas,sdhi: Document
 RZ/G3L (r9a08g046) SoC
Thread-Index: AQHc8yZGZL+xVT0kJkKzynWtJHSRPLZCwOEAgAAClbA=
Date: Wed, 17 Jun 2026 12:42:50 +0000
Message-ID:
 <TY3PR01MB11346EA69F7C78DE7D07F3D6386E42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-2-biju.das.jz@bp.renesas.com>
 <ajKQ5OzGvWg3kBYa@shikoro>
In-Reply-To: <ajKQ5OzGvWg3kBYa@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS9PR01MB16139:EE_
x-ms-office365-filtering-correlation-id: 36c5e315-51d9-4ee8-f530-08decc6df12b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003|3023799007|38070700021;
x-microsoft-antispam-message-info:
 fICLGbxMvFcDYmtMzyfvQZC8rMCLDAj3u5a8+dqCKJb1Zz5lsBrCz5wtiDaoqeP/KthPCx6G99Vu+IA/aNMVsBARfwYc0C5q/KPFNEnPkNmTF/BwWZaVTrZOSxT0hgoJk6O/z8C7LB0TVHPhDNrOxzT0e1d8j7oVYZ72st2RhbR+i+piPYoKvnAt5Ew2t9znfWtcTXgUgt6t1BzE42WzOQxXjwZoBLYUYqKEcbeuvs+o0yAZEJAH1sxqKmB7fq9oa8aPe4UMa79SLBtDS+pyDHtGayHxIG91k/3THf7b2EEWIq/xxcuzVqoglyE5jdigD1T9XCwsma86aET6SXWJM1CufvH7VrcRE5Sg4ZS49avxeOiTGPYW15CYPJ+U2AuX9DsdqqD1ms/HfWHu5C4q8gSuaAo+Q8gxO7GK/eXEG/MROGZo9AQ5R/ITN8tIBFix4aRjLMCOL3WOei+RPBbOHniAfs+yOpUrQY2tDIFPIwBj+LwYoK2cuzHOHzhOKhILNM8Z8+tPDch/2S0oHba06DUpzrHePk6e/L4aKWPLEtpSlDJWEKaKDtn1nWufvFdtjZUwpHaCPLjk8QkZyczN0csmX96SFltI099oYs95D9MNv1/Pab8XCIfut6on4cgxQy97RtgFJZLkz0xtOeK0gfpUAVGCjXna+fE4Qmn/j7DcuuDWenDn1E4WDKTtl4Z/5VT/SF2aYlIkg+HCVjeYY61T044YoirTH8lqQmfoPXbSSVIv8CP+Vrfke5VLr9wq
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?kZiMIjk2DGDqN1XjsxHt28yEhXDIIN9FWePhNOxJbGIocEvaktRb+5F3HwM1?=
 =?us-ascii?Q?+HYxKa9jhqGscAF9/6xEXB3oZF1quxuv5O7kBDtlBbG7/B81DPDzeugkgAsl?=
 =?us-ascii?Q?8cqbCQahnL2MV/W1FS8oIvjgiWkUllxGMbFEuIvA3MKC9a0ahSQSpTtTqAEb?=
 =?us-ascii?Q?unHeFkTKW9hBuWlW/dzn3HtCvJ312UtWKd3pXaJiwqnKE1IIlS6qHt04ehav?=
 =?us-ascii?Q?TxZ7kQblpHgRGLWDvvzdLAe3esIZRI3uijF8fcSpFKHqrfNgbWQqAPuFB0Ef?=
 =?us-ascii?Q?7aS5aX7w7ZcpFvMcdgWjnQbTwvFg6bYCn7LbBclbsRcDg7f7UQz5ulPHoxKd?=
 =?us-ascii?Q?mbjgeXbbzZbVQAY89J8MJRqUKM5ximCAFjrWEsU6JIpmLllYGwuIX6U2QIba?=
 =?us-ascii?Q?C6dft1CtF6hJhFbYOw6KbLXweuzuj3CPcua8O4L0+VD5S76tjUmZyt16vNnY?=
 =?us-ascii?Q?XjkYW3/Kb4OpRYFVbS4/+/+FimLd7RT5BwEzjwXa+mxBkWmQx91/OJzAGamB?=
 =?us-ascii?Q?HNxceAQX5Ro7V8pF0Jq3Vc+wLnbLP9UaYoahMMgJk045HvRrlgRpYynQXHru?=
 =?us-ascii?Q?0FPEGZKTa+9lWM1/WxQzHQNVNxoOjwea+VB1KdqfsTnNuep11ulR6oromx9B?=
 =?us-ascii?Q?yUNHDrnRRTK0cXdPTNzRkOK3S4UGDKftPqk6r66IL83ipMbza3fiYUAO3ELV?=
 =?us-ascii?Q?d2YRkvKjKnzYniEKbgOSqewWLLQDjUQRid2NsNDcMKugFk1Z/7BmjhYEmyVj?=
 =?us-ascii?Q?BxWN8VbVAylgXruRjTdVVn0/gzYDIVTekaM+4wQJnTSb+1iabxJgOZ6h8eKJ?=
 =?us-ascii?Q?ppdlWGfQZrYkCCaUzFKxjy+7oJlltk8NIsfPXubFi3MmrnYqvvGdFT77t9oJ?=
 =?us-ascii?Q?B99BMws9KqHbUWxiNWlfzpSc4zeIiz4v6dRn6RGHbHn1xJMDKEtOATK4279U?=
 =?us-ascii?Q?Z2THv7r6jR5SXQ80tlKUVzOc/EZB2+6E/boiw3M3Khv/alXva+/ojGbCd5RB?=
 =?us-ascii?Q?6QZMZJ4tbFl4p2EeYYvSkJ4Oz7gR2H9T+5kpNab06pDWzhAUouLOzVy9b49S?=
 =?us-ascii?Q?fSivaoII5GLBOMNlcRzS48y3xjgoguhxPtXjyLP/i+aMlkn12UDBpe5HeH4Y?=
 =?us-ascii?Q?orN9XBbQ+EqNKun8CTtBo49EnnZkZ23f8V6K5rZYh6vuhDt076JEWZnLu2hm?=
 =?us-ascii?Q?nBtBAeOCBw61XzN5og3V6EPKprx832GzyeW5HeQ0BLZFjpUEMYuEGG112HvJ?=
 =?us-ascii?Q?0rbtMalV3ynTZyI9J1PZVg4olo+nUf9g3Mei7ZlMm87A5QdmhPskbUa3A1So?=
 =?us-ascii?Q?8fZelJkEtVDf448Lco8aPuG0vSkoGHABgpaUEV1YJNUPx/bNx+zVuAwdx+DC?=
 =?us-ascii?Q?wyJX7Xtn//mk3GV7Jr1E2/kP2TprOhjM+valWqua2MwvK3loqMjk2uJ6tayl?=
 =?us-ascii?Q?xalEtt6MJZcLOaDqlLOyD+etIc5fxqc3UGOgLC3pSL2roEK9PCQlGHYJ3sUA?=
 =?us-ascii?Q?7MZH2HXSsG6HEigM9DRPafcYS5EyUHHi/MK8XF04pO/MFSHdAYpHS0cfDbHY?=
 =?us-ascii?Q?zzefLqmcLG3EXWb7BUvXZxIrG1HlBWsKcJDulR5+y4rULeDyORZmWU/iDJaN?=
 =?us-ascii?Q?8gCZMHEwlnBIxfUelwRQkW9Z5AIpI1n7PRZ4yLpIQ1qOM8F2VySOlTH+GPom?=
 =?us-ascii?Q?J/5Ff+EJez4QXO/FGITHrCai5K4p6iyXzyEkpH70EjGzabe8rjMCHDpbNuDd?=
 =?us-ascii?Q?7H1icVUKqw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c5e315-51d9-4ee8-f530-08decc6df12b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2026 12:42:50.1774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tzl1xyI353KyisRQlB+WkdqhS0sFDGDxQWzm+XtbTT2sNCHfltAtai4KppBwsafcK7GGKiANpNj2MdeuDMsgs4+7xXjkPIB23pNqG39ERw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34165-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:conor.dooley@microchip.com,m:wsa@sang-engineering.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[sang-engineering.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,microchip.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,sang-engineering.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5043699D2A

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: 17 June 2026 13:20
> Subject: Re: [PATCH v17 01/17] dt-bindings: mmc: renesas,sdhi: Document R=
Z/G3L (r9a08g046) SoC
>=20
> Hi Biju,
>=20
> On Wed, Jun 03, 2026 at 07:57:01AM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
> > controller is similar to RZ/G2L but has five clocks (core, clkh, cd,
> > aclk, aclkm) and three resets (rst, axim, axis), so update the
> > clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.
> > It has an internal divider for all modes except HS400, and a 2048-bit
> > divider compared to 512 on others.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> I know you work on v18 already, but some high level remarks already.

OK.

>=20
> > +              - description: ACLK/IACLKS, SDHI channel bus clock.
> > +              - description: IACLKM, SDHI channel bus clock m.
>=20
> What does 's' and 'm' stand for? Is it mentioned in the docs? Would be ni=
ce to have here as well, if so.

I know only it is bus clocks. But don't know what is 'bus clock s' and 'bus=
 clock m' stands for.
It could be just clock name.

I will check this with hardware/documentation team and update you.

As per the clock excel sheet,:

SDHI0_IMCLK: "SDHI ch0  main clock 1"
		After supplying this clock to SDHI ch0, it is possible to divide the freq=
uency on the SDHI ch0 side and output the 		clock to the outside.

SDHI0_IMCLK2: "SDHI ch0  main clock 2"
		Input is always required even when suspending.
		When this clock is turned off, external SD card connection (Card Detect) =
cannot be detected."

SDHI0_CLK_HS: "SDHI ch0  High speed clock
		This clock always operates with a relationship of 2 times that of SDHI ch=
0 main clock 1.
		Must be supplied when using SDR104, HS200.
		It can be stopped when suspended. "

SDHI0_IACLKS: "SDHI ch0 bus clock
		It can be stopped when suspended. "

SDHI0_IACLKM: "SDHI ch0 bus clock
		It can be stopped when suspended. "

>=20
> > +          resets:
> > +            items:
> > +              - description: rst, Core reset.
> > +              - description: axim, SDHI axi bus reset m.
> > +              - description: axis, SDHI axi bus reset s.
>=20
> Ditto.

The reset signal mentioned in the hardware manual are
SDHIx_IXRST, SDHIx_IXRSTAXIM and SDHIx_IXRSTAXIS (where x=3D0,1,2)

I will check this as well with hardware/documentation team and update you.

Cheers,
Biju

>=20
> Happy hacking,
>=20
>    Wolfram


