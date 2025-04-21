Return-Path: <linux-renesas-soc+bounces-16196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20305A95311
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 16:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AB1B7A4D68
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Apr 2025 14:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317E21C5F2C;
	Mon, 21 Apr 2025 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Yh3mHjhc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010054.outbound.protection.outlook.com [52.101.229.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C4C19C556;
	Mon, 21 Apr 2025 14:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246960; cv=fail; b=rEKZ8ToBbVxJD8H1gmfschJqakjdtJ3Wpci4j7JTPq/KahJ675RsTf14eAfMi1d98g1YbdxCRM/TXZEmdawP8U2FG1WPSYCc/AV6VBlY1fqiSxyGvta4gYGCLBlKpg0lwIuTZp3MqHs8Vr39IYUnf2GtIM1Q6W8qQrj1zIKnXFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246960; c=relaxed/simple;
	bh=GTVdpColA900paeLUREA/xHq+4wNQCrCHBvJ4eAMP98=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cVkLn6rCuaOFPGkn+Lif5JsMYST2r5wxwT1gqdR+OkNQRQZnjLpWMMxGs9mLADGiNmL04UVVg8YjHPT1npHoJoyOkQn/XmHM+pnLewhl0keNiy8afTHVr7VBRv1CKZQKPx9951lvxgWy7I1D9M0gWBg/QwHYezm56cpmiXF1tcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Yh3mHjhc; arc=fail smtp.client-ip=52.101.229.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zoc3n+zYtkP673Bi8Ukp033jAz/6rV95sVTbBATSZbEqwoG0bmnvufQgYW5FMqAMj6MhiuvvVfpKXriVZCpqC7i1/WRC6Ze7bu6XHT2Ox5pc6REhijuXLwJEdjaznm3BNDx07/ovUWGEBfHG+BDR4kyQZyj4Z49EggL07KX0myGRfjZzfoBv9zhNk0UGr0TyBEaLRAO2e8o+XpzLpXS80CQ/DvconJbMnKZGzdDPEOKDstCtgh0HjsL22O6pE9bA5SlkACPItnqEF4h8/k69qvrAcgWiPA/ciMKcN31vHAErJhtTTlPbVRnFQnPTS9NLfEagmTXETiXCi+1IK7zz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+bvsynq4FBD8uRxE93WsyVhicjxaeBnekpatyqxZXw8=;
 b=KWgXsBB9z5MjHPm8OAgKcWB8DYeK2CFEimoIab5vIEODbR0lfgGpPWWq665d0V3SV9X1aPFLhmACZhQZAPSyrwGU4aw91ji5PjaPQJahx9WHgOKiv4inzreCk90RHuvQDwBA2c/3iFGeX4otdioPmtzjevNMdO/01Zk0xf8sQJVQViBaunHX/foObSmB+RJVegXKqeXHbMUSwFTwo3weccG7JCb4KHrLZg8LcEWwwtj9a5V+eEBumc30VQIAUVA+MhVDRoP88VCNROv3YARTHaZSHBf7iwyIkaPIVlVKETH0e9QxPg6mJ/PWkSO0qOJlHYO2Sv4baVwKFI07kT1mIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+bvsynq4FBD8uRxE93WsyVhicjxaeBnekpatyqxZXw8=;
 b=Yh3mHjhcgxY6lTxYJAeIVL4Hnk/Iwh7lyp0Icp+U6TF0nDvIWAMgWoSQEeHpPJ1SKEK0py8HbVrsJ/pKUTPNW8Woum2jhHThv0EXn6cNJkdPF3jMwc09DSxPvrW5qhRPlN9kqYNx+fc8lQk/o50jPkJCwrjyccNWERHwPilP17Y=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB15188.jpnprd01.prod.outlook.com (2603:1096:405:27c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Mon, 21 Apr
 2025 14:49:09 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 14:49:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, "Russell King (Oracle)"
	<linux@armlinux.org.uk>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Richard Cochran
	<richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu
	<joabreu@synopsys.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Fabrizio Castro
	<fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Topic: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer for
 Renesas GBETH
Thread-Index:
 AQHbp7UXRdTsn2oCYUWD5qYhUQGHu7OjbUQAgAAVgQCAATLSgIAJgP8QgAAGBICAAAvXcA==
Date: Mon, 21 Apr 2025 14:49:09 +0000
Message-ID:
 <TY3PR01MB1134679B1CB5780C3D1AB648786B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250407120317.127056-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407120317.127056-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z_0-iH91A4Sexlzj@shell.armlinux.org.uk>
 <CA+V-a8sS0TtS-TEdkQ8MB5F4JtzV9358Y9fmKe5MggGU+wP=4Q@mail.gmail.com>
 <CA+V-a8tbW2Zs6op20yRTcihSm1bcMC2dYnRXVCKRf=q4fymZyg@mail.gmail.com>
 <TY3PR01MB1134633A8CB82788BB98C6E6286B82@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f27b0531-11dd-4074-9c79-172953d28292@lunn.ch>
In-Reply-To: <f27b0531-11dd-4074-9c79-172953d28292@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB15188:EE_
x-ms-office365-filtering-correlation-id: 956d2d31-0986-4dc9-8750-08dd80e3ac39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5z4z8Uer3oGDIbM1+X2c/4cTvBA/CZo3fS0qLutxOTkrxQDEUB8EbelOsjac?=
 =?us-ascii?Q?WKoDA68CyB9FmY2EnT9MwKfa6n0ohd79RO5SX9f4ZgjnjTe15l0WFFORRxhT?=
 =?us-ascii?Q?IewEX1XQMk3S8vdmwOGqWZVD74JSXfPoqDi1ML2STQ+nWlc6P0b91sp7N+8r?=
 =?us-ascii?Q?joaU1GwnN47JWjVJ1N5HDX+u5XyiVo3IwS/+Cn0dLOOL+HHHKDXm+4ZzLmx8?=
 =?us-ascii?Q?RPjvOzusdhRSKxmRpq5IiycDbMy8pnuRZ1tdwJkXA6nEax/gGMmds2px5xki?=
 =?us-ascii?Q?RCpBR2r4IFGNRHlqbqrecoUYj3ZANf4sDc+J3lLbv5cFBP3nPCxr46DPjdQW?=
 =?us-ascii?Q?pcK7WvGaEKLLagJ8z+JVev67GzYrCCVv75Hmxjv8Mf4o8Z5pry0ol5LKLApX?=
 =?us-ascii?Q?FLT7evFxfPRSID7E9RILXihi9y9mt9GSuRuS3OmKprel1U4XouGekwIIMjFB?=
 =?us-ascii?Q?vTdUXDrKOPdG7uyNmKSZy2MNDKCUqqbVUQ8XRaJgoSrxj6XQ8Lq2EokNsQLb?=
 =?us-ascii?Q?3NdlqZIs5Eqdu7Pq8CoPlOoy9sa1VmLok6fpC0J4/RP4c9mHc3cBqfRIFtqn?=
 =?us-ascii?Q?3pCsL4ifVoaCo999xJsNhpZ04ZgTd6e+Cd/beCBuMNClrcQWmLmfv/aat2zg?=
 =?us-ascii?Q?JMCxaPBkPVyg8ukGdxs8nyur1m7FoA6hv8sfBf4REZD94ehPoMHw0tXa5mLg?=
 =?us-ascii?Q?s2MD6ict7oq/5U0wUMsR6wr6oqVwEOjW5herQhlWF1GNuBjtcQBTHqw777+0?=
 =?us-ascii?Q?XbrIJobCEVWSiPxR8ooyo/wTdH9ap9f7KKUI10mPwLMhzpRHhLUfV+2pGGkq?=
 =?us-ascii?Q?E+m9M+CYt+owv8iJxUb1YDa2LE3tltYUPY/ZtokHH72iy6YvKdM7VniJV4wu?=
 =?us-ascii?Q?8CteCueear+v2/pWdVgZ9bs1SfgrcYTovSsrD3caC6JfNhFc3UKLCu4SRif5?=
 =?us-ascii?Q?qgnPEao/jkVD+cLJIeKv0S9i42rjAE+AMCkZvKjIPZ2/UQfruU1NEHzxTTQf?=
 =?us-ascii?Q?/kr37nXWsDGdiClNEP031BO2Rjl6XAEzCjwSjBLdjQolzwsUvJiEqKy6hcAL?=
 =?us-ascii?Q?wNXmrekW7c+x7hCmoaJclS3424pJ7NiT9EWKXGfzQGEREIKP5NJTNFjBl9Uz?=
 =?us-ascii?Q?uHd3znflPbr7NdJBboWy+OQJ3rgNdOz00VuPglQIZlcHkuLSOKfQ27XvgK+p?=
 =?us-ascii?Q?DnHN83zcfbHGhuRABrl1eHEZRMRe6ZWhIhGrHiRTXm1BB1kgOgatGJHlTVOW?=
 =?us-ascii?Q?35YqW/d8vFyz272FPvlRlxsNxuX1dp5CzxJFZ4qJ9LuEx0ljIHl9/Lbbu5Zr?=
 =?us-ascii?Q?izTFZXPWVuMb9zWyCi9LOaZxmbZUVPsKouAhJKVoN4hRmqFXjabaHy5vxFru?=
 =?us-ascii?Q?hJFh9/MEnMQhOBbCpWEHcQ0ZKBW4cp48scUFgAsZVME5YMPltb+wk0YLbnnn?=
 =?us-ascii?Q?tCp8KY0F0cgVDpLv52Yb3vIwQZvly6AEpwIHw5VSsv2pKM9W2NXWRgoIa3bZ?=
 =?us-ascii?Q?4kRF0iJPQc0MGX8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hobzI7qxxGqqTgwdkh7NhI4sU9chJYsy4aO5tEjXFkHXJiDZ9blR1appf4Op?=
 =?us-ascii?Q?whVeJ1V61fX3gjBiMI8MoBdulPBHPiaEzcNKkmleefvlMfOqbJYbzbV3amKo?=
 =?us-ascii?Q?uB4pafe6PNtP7xhgeWzXCnCbkp6/JaNJzLQ7yb1SePAqOaGnrEPhU3oOrCLT?=
 =?us-ascii?Q?2fiDlx8MQTk2ZquQRUk37UdscYK4LPATIZ3/lpht/vVfZtstv8b42PHRqwHU?=
 =?us-ascii?Q?GD5M9ekS0pu8M+ibhiOefdfto5wQTO9uM4dfJP5Vu5WEwChvN3qkRo0aGqIz?=
 =?us-ascii?Q?Hp2heETprQVn9X7DyFVpBPpTZgwdbF7SDtFLuzgLsO2JGmpQAaH9jwB7lyrp?=
 =?us-ascii?Q?rG1R92d7w7+k+Wd1OsJhjqnlK1N82Y99UpnuS9i9WYcbxPN/j3FlOYJdtxjJ?=
 =?us-ascii?Q?tKM6qjDEYtR4IyjQLOIh8QjSs6tLmNubI7PFwct9HcMOGoJvbrNLfuIxOo0T?=
 =?us-ascii?Q?H+P5wbDb7b+SHYBx4VNJCvO1skYOIzSSZ91kH5qp9/wTLlmCK1SD+URoymNB?=
 =?us-ascii?Q?C+I6RlIKgFeuVUh4S2OJp1mqGgukqNj+kZEcwWAw8oXicKExhob3pwiC8Qmc?=
 =?us-ascii?Q?0oFJ3uMbxg+Tc2LYVDNoGD2IN9K+TPbm85HGTHF8wQshGviUM4CnNtgKlcqZ?=
 =?us-ascii?Q?p/xhYyeMRWgMA+idGlS3BV7CMR17HFL7nE62Rqm4ay9m98DYFp7rxlKtp9sG?=
 =?us-ascii?Q?HsLnlrLlVzzy74L0MSqNHYUc19V2MrmDa94/3oPzgNEA3FdxtJMlD3HpTin5?=
 =?us-ascii?Q?z7ShEfRP9Im3g9lh0Ngsz5lIBbtWc0zCOValH0MqXGc4udd3yNmxI5LffQ3y?=
 =?us-ascii?Q?adWsGDN05/ggCYAXRcZzwKdd+bo15PpukRK99sdpjT9ujaQ2v2PkuEasX+3b?=
 =?us-ascii?Q?fz2KxwZyzJQiAURc2sw+OvCQGZsYAZtpPQHleg8jXQW36cL4O7RCK36OE8lu?=
 =?us-ascii?Q?tdjbqGUVRLBsK30RKDaTJpZdv5xsc59TXM7e1JrKBkR+QNeGmUPmzQBql91w?=
 =?us-ascii?Q?sEovLB+r471XtG5eTmo5Fntni28Q+kIKG+o8rhu7uRC8i0UM+JSBucdpsanZ?=
 =?us-ascii?Q?WvGA4KcijT5cxlBYifweN0IojqRvvQy4gOt2P3OvfgNQPQttPcLLlFj4LR7C?=
 =?us-ascii?Q?tA3UOFUelxd7OetY3imvVJsmls75GiNTDiRnFLaCQ6rt814xCk9et6fZFOTO?=
 =?us-ascii?Q?H7F01eEtsHbA6e8RLX3oMWXHJFsm3Bqd2O5MZim0FQMbiWPxAEAUXFiCiaga?=
 =?us-ascii?Q?TK+eFY5rmvo6ZIKANiPunitpBaLvqxXtr7WhRou5mEoeUO6+LqXyWuUbZhNW?=
 =?us-ascii?Q?rpIQIaHezI+eiFbJGCuK9SGw+9tGExmz28HPuqTTbbxXANOo8L/dGGftgfwK?=
 =?us-ascii?Q?eZhNeDLofpOpL3ElyD/85N6x+ufCfDR+3y7Bpox40Ys2qrSHow3hTMwOCQH/?=
 =?us-ascii?Q?FBeLz43cREMNZB59G6LFvlBiZAWFvVwTeQWg8t94I07V5r/RKtLnqaNjjEek?=
 =?us-ascii?Q?m4fGBNvmXQJxxWzdYy+gDZ6nLzM2/gzazfWXAiATmzJPbEOEoU1713ZlVaao?=
 =?us-ascii?Q?bY136A7Cyx3H/SpduK+k7s/FGI1Je9cAIMT1Jfv7mIcrw3GO/ag5JEj6g/8n?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 956d2d31-0986-4dc9-8750-08dd80e3ac39
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2025 14:49:09.1636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Jih3wWAi6mPgRKy6VAbPjzr7WSvzRhxz5N0hp2SIFW/qUxWk1gs0jQxec9qQxkE71UMkuAXxOL51GfnKIKOtVtqOVI6MFz6IAFKqgqpjs88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15188

Hi Andrew,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: 21 April 2025 15:02
> Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add DWMAC glue layer fo=
r Renesas GBETH
>=20
> > > On the RZ/G3E, the upstream support for testing S2R is not yet in a
> > > usable state. So for now, I'll switch to using init/exit callbacks an=
d drop the PM callback.
> >
> > FYI, On RZ/G3E, for STR to work with mainline, we need to reinitialize =
the PHY.
> > I have done below changes on top of [1] to make STR working.
>=20
> Can you explain why you need to reinitialise the PHY? The MAC driver shou=
ld not need to do this, so
> something is wrong somewhere. If we understand the 'Why?' we can probably=
 tell you a better way to do
> this.

You are right, reinitialization of PHY is not required.

I can confirm STR works only by adding just [1] + Restoring the direction (=
MII/RGMII) of IO block for
ET0/1_TXC_TXCLK (IO attribute) in the pinctrl driver.

[1]:
+		.pm		=3D &stmmac_pltfr_pm_ops,


Logs:
  34.081297] PM: suspend entry (deep)
[   34.086010] Filesystems sync: 0.000 seconds
[   34.094746] Freezing user space processes
[   34.101104] Freezing user space processes completed (elapsed 0.002 secon=
ds)
[   34.108164] OOM killer disabled.
[   34.111468] Freezing remaining freezable tasks
[   34.117478] Freezing remaining freezable tasks completed (elapsed 0.001 =
seconds)
[   34.124888] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
NOTICE:  BL2: v2.10.5(release):9aa8ec5-dirty
NOTICE:  BL2: Built : 14:47:04, Feb  7 2025
NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
NOTICE:  BL2: SYS_LSI_PRR: 0x0
NOTICE:  BL2: Booting BL31
[   34.202183] renesas-gbeth 15c30000.ethernet eth0: Link is Down
[   34.328938] Disabling non-boot CPUs ...
[   34.338285] psci: CPU3 killed (polled 4 ms)
[   34.352108] psci: CPU2 killed (polled 0 ms)
[   34.368492] psci: CPU1 killed (polled 0 ms)
[   34.378137] Enabling non-boot CPUs ...
[   34.378137] Detected VIPT I-cache on CPU1
[   34.378137] GICv3: CPU1: found redistributor 100 region 0:0x000000001496=
0000
[   34.378137] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[   34.378137] CPU1 is up
[   34.378137] Detected VIPT I-cache on CPU2
[   34.378137] GICv3: CPU2: found redistributor 200 region 0:0x000000001498=
0000
[   34.378137] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[   34.378137] CPU2 is up
[   34.378137] Detected VIPT I-cache on CPU3
[   34.378137] GICv3: CPU3: found redistributor 300 region 0:0x00000000149a=
0000
[   34.378137] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[   34.378137] CPU3 is up
[   34.378137] dwmac4: Master AXI performs fixed burst length
[   34.378137] renesas-gbeth 15c30000.ethernet eth0: No Safety Features sup=
port found
[   34.378137] renesas-gbeth 15c30000.ethernet eth0: IEEE 1588-2008 Advance=
d Timestamp supported
[   34.378137] renesas-gbeth 15c30000.ethernet eth0: configuring for phy/rg=
mii-id link mode
[   34.378137] OOM killer enabled.
[   34.378137] Restarting tasks ... done.
[   34.378137] random: crng reseeded on system resumption
[   34.378137] PM: suspend exit

root@smarc-rzg3e:~# ping[   34.378137] renesas-gbeth 15c30000.ethernet eth0=
: Link is Up - 1Gbps/Full - flow control rx/tx
 [   34.378137] mmc2: Skipping voltage switch

root@smarc-rzg3e:~# ping 192.168.10.1
PING 192.168.10.1 (192.168.10.1) 56(84) bytes of data.
64 bytes from 192.168.10.1: icmp_seq=3D1 ttl=3D64 time=3D0.751 ms
64 bytes from 192.168.10.1: icmp_seq=3D2 ttl=3D64 time=3D0.858 ms
^C
--- 192.168.10.1 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss,

Cheers,
Biju

