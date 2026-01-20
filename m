Return-Path: <linux-renesas-soc+bounces-27138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AE/vEWzfb2n8RwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 21:02:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4874AF48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 21:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AA635A0DD25
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 17:42:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD78428852;
	Tue, 20 Jan 2026 17:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PjNxWCHu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010037.outbound.protection.outlook.com [52.101.229.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6361C352923;
	Tue, 20 Jan 2026 17:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768930920; cv=fail; b=l1UVzm5DBEhD1xpKXxiMhhmEV3W/LU+bawWN+IeDJon/BQa5qC5ghS4KiVuhtl4o9Zct5j01vFo0gqUc60b1ygaN+QQAnQEIH5HVgwkqWoMFJN8q/KUBJxNJQSuipdaxAtQKVwT2ohY8cxFcc365ZeyQpcooy5oWHoHBQSRvFIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768930920; c=relaxed/simple;
	bh=C6PtsN2c8DC0UqoZ+i+GkQXmNdQH9MguR6jiQlT86S0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fGhfnIDW1IlexXSUNqle7L8NMC/J9Ay2NBVftSs0exAuEmrFLZtXhIGl7/mdYHMqsjmxl0z6vmgCxMsqYukYY9oVCM8W4sZzG0XFcWzZS0jXeLHlcVXEDm2PqOCe7D+2fOP3DNOoPMF/SFB1Cz+IX8NsVncpwEweEWJkRRRqrKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PjNxWCHu; arc=fail smtp.client-ip=52.101.229.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJdV8ISvHa4OdhmAGWWxZhumckenoGMoYqi0bejG0lqzPagjhdfXASai4p0uyXfCoYf2KhYCL8/OTpcGUEwLsY5BOA2e+l6OuxlyvjTlLE8r0c5k3DJqjLzYq2RFFeuX0aOY8rqvQDWXzg3AGHNaQ/5njak1W54QP4guwCGLIPucOXENFjYeGk6h3IVpthKGNPTF8EJwp7S6J+tq4YLB3Xsz5aLR0tG3qKuGfu5zGF/2LD+NCLqyKEByLNJFt6hVr7fIYsUsqF5v/Xy/dcRgEDxfsS1P3F9UAPDn3yEwq4Xsz3W2yxdWx0mqABmPXUf1R3YIs/ttPoGXufTek92QNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDtZvRsMj/fqE7I5Zq5ClXK/+aLUq8yatH+Zx/LDK34=;
 b=tMyhZUPr36x4ZR1cC5N7FGXe5L2e9B9pbwiNi1nBPchR5JzQIN3zW9RVTkeD/0iWHjzbl6+Qlddre64iwK37Ws6p8/+Np71FtpSkoKCOktFs+57x0LdpZF2haTVKvahTbwPx+3waOFi+rDCtZMtYkr95UJh/eO6RFr+I/+usl0O58o1Of1quAr2xZR07PSl+Tix14AWdytZcjQZ76ZYynF2gjSw2Q59BLFRgJPp+2k0ZsQNZf0gcmzbyRvFFz0daehZ7dlaGQvDKxXzJG6XQi+0CKbkelkUJNIszX3+zc1xXuH2dO8m76j5ISEAQE7OI6Q7/nfZS958Dzj0Xl1+sRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDtZvRsMj/fqE7I5Zq5ClXK/+aLUq8yatH+Zx/LDK34=;
 b=PjNxWCHuCD3NWcge6FzUim//Q3shl7qrf1O5o6znAQ9mXUTFYD5GOO2AdisisrJNcX22J7rKDYKVRfPxdd9/0AjzDsom3fGxXug5mv3SqDGZQ2eNpvkDt+rUkOhHZCcl/OyfeCmElBDXNAiyek/CE69gEC3MXuejon3x3juTtEY=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYVPR01MB11247.jpnprd01.prod.outlook.com (2603:1096:400:364::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:41:53 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::439:42dd:2bf:a430%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:41:53 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: Biju Das <biju.das.jz@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ/G3L
 SoC variants
Thread-Topic: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ/G3L
 SoC variants
Thread-Index: AQHcihBStNj6nHFXQkO8G8TIy+vh+bVbUu2A
Date: Tue, 20 Jan 2026 17:41:52 +0000
Message-ID:
 <TYCPR01MB120937A6E90F5014CAD069CDFC289A@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260120125232.349708-1-biju.das.jz@bp.renesas.com>
 <20260120125232.349708-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260120125232.349708-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYVPR01MB11247:EE_
x-ms-office365-filtering-correlation-id: c25539a7-e611-48dc-d21c-08de584b32b8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Si/UT2MSDk5C5S+E2DTSGvHhUEeLWmwdK0Wesp8Um7eDuf5Hy0hcuEEiEgbE?=
 =?us-ascii?Q?Vvsldgn5BzqpePaYqBFBlhSGOQroRbDnRpxW6VCdJA1cVsiqjvmdoCI304Lr?=
 =?us-ascii?Q?Sboh5cxfpImJaeWv4RjYw7cm9rAgyP8Un0t0VhFKjKeMMRNG2oRXOw0CNfOb?=
 =?us-ascii?Q?CNWQFso7oD/Cm0dB+CvNeehqAb0Ujolbwht0GNe6+PipN07pS04I+Hjl9BWS?=
 =?us-ascii?Q?TkCscZQFNEswT897+jKjjLGBGwqqI+ZYy+6eNM2BGpVAQ+nswCGqYOyedGfL?=
 =?us-ascii?Q?O4uezF1gjvTPKy+UVyH+DMUVI+FY+k0qfa4pssmCwnPgWRYfbLXq5qvg1qX+?=
 =?us-ascii?Q?VtM7hYa/KxDzjory2yhZRwL9b6NCBLypo6MU+SCU0zmSl+fi1DnVPcuwEHTs?=
 =?us-ascii?Q?z2VnhFumqI96iiw6UHDlW5/kSTqp81zG+nnN4STZsKfbulnqhPRW06WTiwqT?=
 =?us-ascii?Q?IB+5bWQZE2VYVxEfs3E5/gtrGqqnYQkp0G/cnpJrbnSHTZk9gzM9f8LqLr5q?=
 =?us-ascii?Q?k8uC7FnvXC5arPbSBTTCPVxiaisFwP+7il6LdiFUF4EcBVUlp1Njf5t9ldH9?=
 =?us-ascii?Q?7lTD3V4Z4zudUt8Wk7d25IOl99FSr/CePpc6VzbRgeQhKXoC3eAXTqYTwjoT?=
 =?us-ascii?Q?s7r4cgimdRJSVXWxykzOviI5W3MvbJ8v49Vuq5H6esSmA+16r/pRLRRs6iKV?=
 =?us-ascii?Q?Fd5k15pIx1XRvwVL4rAvVZY1eHl8IoMjTk1mtf0dBdBhIrSx5EzTKBmNGVLb?=
 =?us-ascii?Q?4vpX0TtIpyrtsG8bOHuIU6B2fhKV7n6sAOJyvxLj1Hsmo2pgOzdZyIymq1hw?=
 =?us-ascii?Q?Fm9cPMqQvkoTVChE+6DQOrEk3I5VEemLz26Epaad7QRIkoiWXv9+rvV716zZ?=
 =?us-ascii?Q?0od4bM2JPyhUZYrpVj99fidQCpORENVI4b4i2Phbst97KXXMfV05LpaOmHWs?=
 =?us-ascii?Q?frvk0PG5EAtWZbcE4UEVtNRs4BE6Dy736uxsDs2Hv0oEooyd6NCGWGZP/HEI?=
 =?us-ascii?Q?O7upjaFytcYs4omvth0mRl93vOTH7SzKpii19xMjKjpVsSvafzYdetmbLtqb?=
 =?us-ascii?Q?uEegf16Hj0EpwvoZAZ5OesRTqeZ/kzwJHIIgdewG4sPq8XEvysLzjFMKKoRh?=
 =?us-ascii?Q?WKaUBPmkV1G3L65ripht98CH+yeNIhfGDP4Pf8zGOOgVg/9JIF3AMjSYA10a?=
 =?us-ascii?Q?0qiqRxaX9u4EwQtcsINYP6m4S1Ppy/MmcHGJMqdvomfNZtVPXfy18GTzim3V?=
 =?us-ascii?Q?53sBVdmYI3wkZ3EGN4fAAnl6hlWUMPKoMgXIy6nqJ7abGxZ9+NJTtYvnNlB+?=
 =?us-ascii?Q?kvLxnSqSIGOOxTD5EOg6NGC8wMn0WOTmm9bLk2Pbs5otS0WzIhmkkshyZyat?=
 =?us-ascii?Q?NbmvtxNAotkkRe2+oU8IcUH53tN6s1fiDGdkb+HHLRgRWm/vqtbOmq54sdRK?=
 =?us-ascii?Q?OwEdUwUKHw55hkTZAfeLm5fbC3fDXrtJJMjSfmndMT9bMi5u4DeJbXBwU/ZL?=
 =?us-ascii?Q?QlLIsLiR6WI8KL58z2VqYASWaTvTvCuzYak0v14sB2/nh9Qky7sE1BDcwRU0?=
 =?us-ascii?Q?ne8y37Ou6LL7dJh/Q089CyCMOKpNzDwVIFtDQHIYCSTnqYfsX+SBRzg5lddB?=
 =?us-ascii?Q?3evOMRhrYkaCk8OBupXDbdM=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+G50vTv36BZjGYVcKquSvxnX1rQ4UmsbcQ2/9PgOTcXCaZRNhGC5vXuzoG8I?=
 =?us-ascii?Q?sGcc9t3Wc4aoRAnLVvyzgcAnzspNFER2MqtMvpHjJgMLFRfJ69k63Hvkp3DG?=
 =?us-ascii?Q?wkpAM4QxtdUAU+du8DWw3ffT+96BXhS0LGbG9+4I3Cvx6pnwA+S6wkmzXEVE?=
 =?us-ascii?Q?L7TJfEasfNWw+QMuSwEtWRQJbXwyTOkbECgFEuibnlpTy0H0SP9tMDx4jxk/?=
 =?us-ascii?Q?Lji40JqVJ5R9o+ZhG6sC1eIo3TXXv6QU3ACJhuZ45elZofCdPr5uuGy1tcIN?=
 =?us-ascii?Q?91QtnxiZN7Slz52YyeWKzpIszdhCqFls56gWmlPO4PPJHTs6uPdn+dkLYbjb?=
 =?us-ascii?Q?36SrxpBLXR2yClibtEbyBTkzBiCgNEdipGel7QJQf/FdXA+/YGymJ1dIevX2?=
 =?us-ascii?Q?SBit1KEp9Ezh3yuftV8w2XLOTkwOA78AvKSvh8z9t81l/xWZDc1d5zUJ4j2C?=
 =?us-ascii?Q?LECIW7C7QpFvJRDZSFc55BZuOHt7pq85u0JJVZyYig1SbNY5AKkgWsnSUirq?=
 =?us-ascii?Q?pHXqYPJQxbjib9fTA95qWB3DOZBZFqemY67SZIT0TJHkqwsym2tXBAlET8Md?=
 =?us-ascii?Q?GDWTmtWwm8rlzqewusZZhtPdIMMeZX8S+3Q+0V2hpbqGk6LL2NOJf6RGagDJ?=
 =?us-ascii?Q?GyhTiqR44AeWKL0jSCO1SBWutDTOO0kBBzuEVv7gCbdqpWUo2f9fI2ybQm95?=
 =?us-ascii?Q?EaLW6SSQs0DeMJtI6MYO6CQfmiXxacEZaNpgELfvYAmhScRCfMIHn0gcLJB9?=
 =?us-ascii?Q?1pgGaXthUug4uVC9J0x6mHBRBPGImVvQSfxpnp/fweSR+gesFOGTvb92h5S6?=
 =?us-ascii?Q?Rfv63NJIXDf3NRXStKC+vMIqedlL3XSTR/1ERy8cqhzxa0i02AOnNMn9D7NF?=
 =?us-ascii?Q?bRc8JOOk65kjRQ3tktca7dp3bKOgAevO8j+sDYRndoFVt5JbaLznX0mgyylt?=
 =?us-ascii?Q?PsKO4ciWDJbDyiePyxzeb755afkM08Fm/xEKZvVsMI5ClGMssi8wNNbwuaa2?=
 =?us-ascii?Q?wD0DJF+XX+MYcuIUvUrJZCc+dh/yhBdB07Roz0s94NC68DNI8aQgerwDf76F?=
 =?us-ascii?Q?WTJGwG8GG1woagb5xxFHo2jEbN1oBB0IS4Y/v3e4lzW1W2r1sQpqk5HH7AyU?=
 =?us-ascii?Q?SNGHwO3lPiQhG1BfviydJNz64TqWeGOcnAf5HfO6x1tR26yUagQRuXQ/sCJr?=
 =?us-ascii?Q?/JAvVdJ1XO1PAETs6hu9OuZlEtZOqBLHpV4ADmWvy1ygSMlVWc+8HXjeHbDk?=
 =?us-ascii?Q?dkx6C4gRQCRzV9vD1xYF00h5/tBsK6LsPafZrpwzFv9e94gEr0NfIP7UBejy?=
 =?us-ascii?Q?Ixf/96baEi//GUya2eBKpiyKm2RwijQTQFWN+RDbmo4TTH8D2rg5gAes+2ui?=
 =?us-ascii?Q?SBW8GoZC1rlrk8gRupHim+4yJJIO4Cp0d2OR2BvhEk5ZpIGqFLKk3v/y30mu?=
 =?us-ascii?Q?KU2bdFVTGBnFSDJj/g0ZQizYcSOMa0z8QueZw2aK1VoCH2gjPAD9VtNCDcBH?=
 =?us-ascii?Q?Ge6n5Ty/Hy1GpLHARo84ZPnUQEDt7hS0WL3H6HmX2K8WJVWEKGapXCfkyaR2?=
 =?us-ascii?Q?OuKbyJhkFanoRsvwJCewbYwDv5oUSipPeLFiyEiwBbIVeZDsUYW8MnmSu9+O?=
 =?us-ascii?Q?GiQaj69mqKcZN2f0MA9aSKNFHcBE1ulrXUQ+clsf+JU7lKTA4P8vlzTkyXAI?=
 =?us-ascii?Q?KAm0zAfFTso1+v8W7M+AIMnkI5cvjbGv9BsPqyOYvLfYR61BvLpCwjMTKcZk?=
 =?us-ascii?Q?L6Pb6LPg4WpDBLSAvyxiKU1U+E6f7HU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25539a7-e611-48dc-d21c-08de584b32b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 17:41:52.9341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gc6j86xhIDx4sQls8Uy27Mjhk76yfU0uKm59QE576N5z9oobYyOjMO7RH7qS3yv9LAL6vuko50wwwacNQxelHbBYdAM5C//QkOLsVgB7OKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11247
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27138-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[renesas.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fabrizio.castro.jz@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,renesas.com:email,renesas.com:dkim,TYCPR01MB12093.jpnprd01.prod.outlook.com:mid,das.au:url]
X-Rspamd-Queue-Id: AE4874AF48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

thanks for your patch.

> From: Biju <biju.das.au@gmail.com>
> Sent: 20 January 2026 12:52
> To: Geert Uytterhoeven <geert+renesas@glider.be>; magnus.damm <magnus.dam=
m@gmail.com>; Rob Herring
> <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley=
 <conor+dt@kernel.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>; linux-renesas-soc@vger.kernel.=
org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Prabhakar Mahad=
ev Lad <prabhakar.mahadev-
> lad.rj@bp.renesas.com>; biju.das.au <biju.das.au@gmail.com>
> Subject: [PATCH 03/12] dt-bindings: soc: renesas: Document Renesas RZ/G3L=
 SoC variants
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document Renesas RZ/G3L (R9A08G046) SoC variants.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../devicetree/bindings/soc/renesas/renesas.yaml         | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> index f4947ac65460..be61a71c7305 100644
> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -548,6 +548,15 @@ properties:
>            - const: renesas,r9a08g045s33 # PCIe support
>            - const: renesas,r9a08g045
>=20
> +      - description: RZ/G3L (R9A08G046)
> +        items:
> +          - enum:
> +              - renesas,r9a08g046l26 # Dual Cortex-A55 + Cortex-M33 (14m=
m LFBGA)
> +              - renesas,r9a08g046l28 # Dual Cortex-A55 + Cortex-M33 (17m=
m LFBGA)
> +              - renesas,r9a08g046l46 # Quad Cortex-A55 + Cortex-M33 (14m=
m LFBGA)
> +              - renesas,r9a08g046l48 # Quad Cortex-A55 + Cortex-M33 + GE=
3D/VCP (17mm LFBGA)

The document I am looking at seems to indicate that all of the above parts =
come
with GE3D/VCP, but we are only mentioning that for the last part number?

Cheers,
Fab

> +          - const: renesas,r9a08g046
> +
>        - description: RZ/V2M (R9A09G011)
>          items:
>            - enum:
> --
> 2.43.0
>=20


