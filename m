Return-Path: <linux-renesas-soc+bounces-27565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD/JBdRaemm35QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 19:52:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6684A7E69
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 19:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 611F730247FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 18:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A49F352C28;
	Wed, 28 Jan 2026 18:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="UnjoDS6B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D359D2F5A0D;
	Wed, 28 Jan 2026 18:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769626320; cv=fail; b=P/5E2s5d1r7od6FOtETiyxxMEWQupVKJKrLwh0kWvBWNrUZAMluuO+DAIJayt98QjW5TR/MNwWY7kcpwxv0/q+vE3q+5oICjHopCGWkVzrzqexNFRjSVZCRXtCUoZ7se1pFYD525NgeUhFIAv4kbkoDuKWWERI/f/V0CnjQM8oo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769626320; c=relaxed/simple;
	bh=MhNFiVqrW72q0m7dJLaJap7zRMfm1DM94CU3WlrSJKA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N+cPJk1dWgWlN+WF9XQtiMP43FLM8tsK+be3vR5tUMZdouciYAtkBoqAPoqaPEqIeW8knbd2GYH1jZKBX6baIsqwaSwHtmdhqIH4b39J6SRMcDmPQRxW8ZtJx1MqUyOJaEpI6WkeRHfoVSgi5kMj+tfP8dsqqCLBS5Cm9DvheP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=UnjoDS6B; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZNAlAkpIWEurzHHVCMPni3r/9V4M3G5GuYNC/AajUJhyIMVXUduY0Vx+2TivMfgGRrpphrBbFKOZ9lKJSg8na4DG7WWjO29TmbD9X49SU35YKqQLI+HVvbwPJmzjuwttIOJGoW44Hi/VwEM9jtyH6XtWlTroIL+78w8+u3KWfXHd0eJrLEgFkwFehywryQnQBsdoIp+lOljGO7ehcQpCVgDCI/rPhX8M97dReBXxVL7JLsO9Y3O1OHGhQZZCaK/+Leh0wdWASCPt6/DSmGYG/LaEH8Bq3PAyhpDrPeCPCvlzbKUH3+QFG/zLeb2IzNQ8mJUt5ASx15omU44ceVkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GH6NLUsGL7KXhCBixPFYV2lR7IvTY59z6sQQDCdbMkI=;
 b=M4ax1n8SyalhIBJRPfgsHrkP7VcWRUkES7jGs2Vo+hSSiV5cutB9BfTQJvk+QA1++CFTn4mhe1ldBVp1cmlNibmwzOmdryoqqLQgTgIiQkv5125+p5pUbNcKxepxkCxHQUsZfL1hLS4xSL/T8kIFc/PM2Fhvj74nbzwUtr55lv5Escad/zsauh6O6SE+EOQu5ft8NP3t4WwLaiznpW6GyamjTKk2QKVYeHIRS7E0w2ldZPdtq3j+rQTlQgfLB2K/9P1ygMAds3ktPBdB+agugfZXuNoJLXplc8hxoFhPcjAQHo7i8B9OoKkGA6Qd690iO24c20OMCaUtsB3QWAxsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GH6NLUsGL7KXhCBixPFYV2lR7IvTY59z6sQQDCdbMkI=;
 b=UnjoDS6BufjXOEmEU778JTOoQF6DQ1qriyZmLdGkpwkGmORqrrqkHexjP4bPCLyl3ZnAFo+xl/jiqDkeTOb1I1CBC8aSJ4bKwObw2zj5TP4q/Y9dk7egOFEHjZPtLjCuO6Dbh33EQ0YI5qn7IGdLiYsFmSem6pafWSewBcIBwXQ=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by TYRPR01MB13505.jpnprd01.prod.outlook.com
 (2603:1096:405:1c8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 18:51:54 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6%4]) with mapi id 15.20.9564.008; Wed, 28 Jan 2026
 18:51:48 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Conor Dooley <conor@kernel.org>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown
	<broonie@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow
 multiple DMAs
Thread-Topic: [PATCH v2 1/3] dt-bindings: spi: renesas,rzv2h-rspi: allow
 multiple DMAs
Thread-Index: AQHcj8oOYuyD83XsuUebvUKfsgQ/wrVn4rKAgAADmNA=
Date: Wed, 28 Jan 2026 18:51:48 +0000
Message-ID:
 <TYRPR01MB15619DCD987445778003A81588591A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260127201706.616374-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260127201706.616374-2-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260128-sequence-platypus-59ae3318318a@spud>
In-Reply-To: <20260128-sequence-platypus-59ae3318318a@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|TYRPR01MB13505:EE_
x-ms-office365-filtering-correlation-id: 3d20677e-e145-4f39-9ed3-08de5e9e4ab0
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Q7G49ovSyRkHTBhIfFLl5qJ3iT14MACRhQ2Vd+9KqpuDa6k+4cRkgup65tkQ?=
 =?us-ascii?Q?9x/+nltc/ba4C1nrsh4KDGrROh0IgHS4mWgRTP8NNTaK2U6HF8GGEcCOXkkW?=
 =?us-ascii?Q?vTjmuA8AP+zD42BxlSG9T3gJ4oq2Sug+95xIgjB6oNhsMZm9bzT/2k5D7O98?=
 =?us-ascii?Q?MiuFSsMt9xOVtTQ4HzJAD6Q9Qp7MoWmG6ypSgbKauzkIFn07EfWJLqzIeOqU?=
 =?us-ascii?Q?VPnXrvGY1kwjNLVx7G/kLfMYCmmSNs+Re087OlIJY2kiegHfff5Ye5Yqqmop?=
 =?us-ascii?Q?aqEPhXNMWlqVPzbsqiLOczRMmWEE2uaLr2pzF0+ITfrgz1+vxcG32HSgjhxe?=
 =?us-ascii?Q?bTiyckBOQCOx9gjE4jRv7978xiIIDLrBsPc4N/ffu77F/4eXoyfyVfyGDp3w?=
 =?us-ascii?Q?ZRBEvFng6Mlg2YG6L9BaCJLRUnm8pP6TOAFTUz7ZlcoqJ/MRZLEdl3w8YFDo?=
 =?us-ascii?Q?irXre44kUt/Wrs7NFHFbrdD1BB4/Aky1Z+gK4JFM/H3XL1nxKn/DRASm+9CW?=
 =?us-ascii?Q?ebOLicixq4GB6Ypj6f1Q7wRk61FMIWGECqIt5EIpaG0na0rFmh8B+Ebemnnp?=
 =?us-ascii?Q?J220grwSkJZ8os6HBq57XrjFYROLpBCA2r/Z580ALV47m5qnajA//uscPMrN?=
 =?us-ascii?Q?vUNpf28TzDw/S0hIATOY/+81gdJj8VHwVi/M7O4JNwq7SiXq+IcjZoLSePbj?=
 =?us-ascii?Q?R+e5aU9UfKHuHFMWTb93Gmjggf8NMfRK4/Sl23+xmjm0vXUQ+o8tgvewJUJp?=
 =?us-ascii?Q?5b+vb6V4awGEvJ5sqL04fG9Jnp0b7tga05Nlmyaw2H5NRSigbS/aMZvOP0bv?=
 =?us-ascii?Q?iayRQVNDDPr6cl0eDFUDFK6ZkM2T3hUG/QjuXm6ut5rv9TeyU0VQj+Q5GXuL?=
 =?us-ascii?Q?hVhSW8LbucSaX/l96X6bZQC9+bKWDinGrBsYimmTTN4ZI1lcP6LWVN+y/Fux?=
 =?us-ascii?Q?rYetFw7kx5Al0jlfkrvNk7fmbpbbwOYzar2V5aQEO4XQoRPLlqiShqnDxR3N?=
 =?us-ascii?Q?yfJB6RzAxBZihiWZ3TE/3rINlxB+Fokp1S0HUmj7OLU5B6vTco/LpqUeDnxA?=
 =?us-ascii?Q?2KWqHb13G9O1FQB6ChQ5zXJjNJed1bc+gcwjnHDzTRixd+Yyz2ubMr7xoQ/x?=
 =?us-ascii?Q?T5YvEIevR1X2vJ2/1zQ4bAjYX7F9wOH0+SmKzCetArW2FYisyyBihAeiplVG?=
 =?us-ascii?Q?fe66o/UWuYmZ/WmPhozc9fEQnsN+KFIbbOed171KZeuBrKgl8s7CkBm2LO6G?=
 =?us-ascii?Q?hWRXIzl0Eit8pD/oXuGW1byaQ+vZmhhb+DE9suvb7qYRC3BoA8aJFs0rc0GQ?=
 =?us-ascii?Q?z/oVDnEhTuP9s5MLUz4fCDxvWXeEV+FV6WZBkAQLe2lO0qzKZRc21Worgazo?=
 =?us-ascii?Q?lERts50tbFEhKiwIB+REJAABWeuRk4tkb41gIOWgFlO11bDR74BLhr/UHIbB?=
 =?us-ascii?Q?wcwbOnR50RDIJiNEu3NJsbWbJtFYBhWL94oGU3Hs4J3hJY0MaZkIkQPdYWJZ?=
 =?us-ascii?Q?51LhNHvE3dZlDfD+OWJ+C8W1Hea9Dam0k+R7vBOi1TX+QY569tybTOzLfn5F?=
 =?us-ascii?Q?ggLpMF27LyUKz5sTZtqxTW3Nge3cSFSShkZ+gLFF6kTx6s0KFV1BfouInwdn?=
 =?us-ascii?Q?4g2QR2/r/aPMXy9yGvebh6U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nnBPdBYVit9aJVkjwwiaDOwQsifSDLzwF7LBuuv4QGYljhrXXGd7RXkTaF1y?=
 =?us-ascii?Q?Ltibzo+O+/7dbRddZg9+1aNwbaJrwiyzySqZAQfB0ZcSUQcLrjv1xw6QjHTY?=
 =?us-ascii?Q?Yk/jEByIfbJnizPk+UlbaHemZz9h10+EsGH8ohoIFgVmwYQ+ZKgQ19Cb8J/o?=
 =?us-ascii?Q?4u4JCLtjpZdYjeQr0PMNXwXOQU0TJJ1ieQrZm0KYfrIZLXlzvvSzNRfeznDw?=
 =?us-ascii?Q?+J0POmwJty2aCIYCeZyV97eAKm6lXu0OPFnlBk3zibb803mbgNsrC2eDesC6?=
 =?us-ascii?Q?aKdB/3+u93c4faD6uFKdEAIIuhgakboOmXGzpw7wqlY6jubC176aWd+6sRdy?=
 =?us-ascii?Q?1JsXrEWMCTUlonlhrXAKVGYsL3BZaDbhwcKZ+8VlegHJFFjdsKkxalJgBH5a?=
 =?us-ascii?Q?Ntp6GrtV8vR//KsA2QySOYuRN6od/VUakS7lt6Y9ANXGdmz9a2zZQbbfrbDC?=
 =?us-ascii?Q?gnZTnqf6BTpo+zPUDuIUYTj9AuqLk/fOUCVcBjpo7xDXMOcfWgvJjEMEp3ux?=
 =?us-ascii?Q?Q3L2s7Fwt4IwLpssHoyzv9o/INiDoiHpPFZiWb4o31XW3oVJ/8qLBPpn5p53?=
 =?us-ascii?Q?NeGF1d+qcKs/zYTeGQpAFr98rv+BqP5CaePHE4F7eTOGimG83VUm4xkt3k+q?=
 =?us-ascii?Q?w6Bovnb2olwLgJ5g33zX3YuYeQE/QWaP8iETeByPYuJOAjbj0I9+RjRJarV2?=
 =?us-ascii?Q?FQ8r/TgVCkPheFofpSi4A0pGt5xQ3lgoHedqjBIO13MQYMhKIP24npTZxvzL?=
 =?us-ascii?Q?1KIIjR1Jh4Q540tmrzPOYxZK9LAdCyXQCvcBuDmFRJpomBGddnLt5U+Dzh8U?=
 =?us-ascii?Q?zLtT61viP2QyvLin+H0dvakSFXo8/fuj3uwyu45fM8W9u0HxgFtvRQKy9SWg?=
 =?us-ascii?Q?uEaJmsTuKfX2Uyke5832VQ8v8jYqeZxCv1OVWmGfZhPTgSbXhYh+HRhJBpHG?=
 =?us-ascii?Q?ZIm1fktWxwzAFJmWp+KwdegP6VbfrjFZX2usr1IOPTuQRPyJfDaI5aCzkJTO?=
 =?us-ascii?Q?+JVyZzLN1Iwxa2mimkkPZYplGLN0gpKO2RWHordoqed0QAzCP/G0LqZ94Tfe?=
 =?us-ascii?Q?FqTK96F0IQDPjShqG2g/38BfOnWAgfMnLqE4rauA/WpnGQDd3K2yo6dIvhaM?=
 =?us-ascii?Q?R462mCFCOauSz/emT5+EvQRjgzM/7EX2f4dMTbJ9aKcRiO6W9w6/nv756JwH?=
 =?us-ascii?Q?5fqioUU4aA84n6c7As7ehK7bfGfxWH53uCpznTUILxbQ1j0tw45QbUkIrgEU?=
 =?us-ascii?Q?INGkIloZAI+FRLivV8uXunm6hVbY0oY0lpTiljfRHBAMq9E8XJhU83z3sS/O?=
 =?us-ascii?Q?tPtYdUyfpCBT4gyd1l0pr0jiSvufIKINCmp9BmPyGR+hhlQfuz+jR0hiQQ0v?=
 =?us-ascii?Q?KYW9E4z+cFTiLB+OlJMXZxr5cY4DU0b8RdTubovx6t8oqPwXV/IpOJbzS2sH?=
 =?us-ascii?Q?kPBw1Z4Cn9PtNguDk7fnI0aggJhPJDl+PQRnwBTYGWB1N1Zi+vdGSQFGWYgN?=
 =?us-ascii?Q?bd1WJHTnHDzC1wKHypEmQgjVjPRIcfPC6jcrHNyBGGaYmNRuR3zHnt3Yicvt?=
 =?us-ascii?Q?79WbvGfWrATJzB8pBYKuHZZr72OjVidsg8Soa8aDbWuLfeHwQPn/Ux/Eod/o?=
 =?us-ascii?Q?Mh6NFChGQ3sTIuQezcqOAEc7K/bLwHl9H2UtFI7Q1IftbDTbNpHOoy+3NrAF?=
 =?us-ascii?Q?Njo9tkfftRdZgdcDVABJX2CrP2JU3Wzg+Mk39l3PtVrq4MFTM6jp+LDdLmBU?=
 =?us-ascii?Q?QNiSEekvl+26q2hZhZXnxYxPIW328AKjY1dFmPbTzkgvW6iEl7kj?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d20677e-e145-4f39-9ed3-08de5e9e4ab0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 18:51:48.3707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j4zpSngDPxq5JiXwl1+vlyuLfTN5ZtOldmyGIMNDe1OD7lzZnxqx/vBCe7bNCQW0TgyNmd6ua4dhW45fB3NRI2KeZLHX4a2BTk5ZR93sNJWd0PH7azT8jDOvAaEzGtBw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13505
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,glider.be,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27565-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cosmin-gabriel.tanislav.xa@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A6684A7E69
X-Rspamd-Action: no action

Hi Conor, thank you for your response.

> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, January 28, 2026 8:09 PM
>=20
> On Tue, Jan 27, 2026 at 10:17:04PM +0200, Cosmin Tanislav wrote:
> > The Renesas RZ/T2H and RZ/N2H SoCs have multiple DMA controllers that
> > can be used with the RSPI peripheral. The current bindings only allow a
> > single pair of RX and TX DMAs.
> >
> > Allow multiple DMAs by only restricting the possible names of the DMA
> > channels.
> >
>=20
> > All '.*-names$' properties must conform to the string-array.yaml
> > meta-schema, which requires both minItems and maxItems properties to be
> > present before the items can be a schema. Otherwise, the items need to
> > be an array.
>=20
> Why is this in the commit message?
>=20

To provide a context for the maxItems that are needed below, even if
there's not really a maximum. Which is why having a maxItems does not
really make sense but it is expected by the meta-schema so we can
constrain the names of the DMA channels.

dtschema/meta-schemas/string-array.yaml:

if:
  not:
    required:
      - minItems
      - maxItems
then:
  properties:
    items:
      type: array

> >
> > Declare a generous maxItems of 32, which should be enough for 16 DMA
> > controllers, so that we don't have to update this value ever again, eve=
n
> > if currently the maximum number of DMA controllers on a Renesas SoC is
> > 5.
>=20
> Huh, No. The binding should constrain this to fit what the actual
> devices do.
>=20

Should the binding for SPI be updated if a device ever comes up with
6 DMA controllers? It seems a bit unrelated to me. In this case, should
we constrain the number of dmas and dma-names per SoC? Some may have 2
DMA controllers, while others may have 5. Please let me know your
thoughts, taking into account that I only added maxItems to satisfy the
meta-schema.

>=20
> >
> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> > ---
> >
> > V2:
> >  * new patch
> >
> >  .../devicetree/bindings/spi/renesas,rzv2h-rspi.yaml    | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.y=
aml
> b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > index a588b112e11e..383e97f0dabd 100644
> > --- a/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > +++ b/Documentation/devicetree/bindings/spi/renesas,rzv2h-rspi.yaml
> > @@ -57,13 +57,15 @@ properties:
> >        - const: presetn
> >        - const: tresetn
> >
> > -  dmas:
> > -    maxItems: 2
> > +  dmas: true
>=20
> This should have the same constraints as dma-names. You've now allowed
> this to have 1 and 33 dmas, because there's no requirement to have
> dma-names when you have dmas.
>=20

I agree, I will fix it for V2 once you decide how to proceed with the
other comments.

> >
> >    dma-names:
> > +    minItems: 2
> > +    maxItems: 32
> >      items:
> > -      - const: rx
> > -      - const: tx
> > +      enum:
> > +        - rx
> > +        - tx
>=20
> You've changed this to allow 32 dma-names, but they all need to be
> called either "rx" or "tx", how is a driver meant to use dma-names to
> get the second pair of dma channels? Shouldn't anything in excess of the
> first two start getting numbers appended so that a driver can actually
> request them?
>=20

The DMA core handles multiple DMA channels with the same name by checking
their availability consecutively until finding an available one.

I agree that this is not pretty but this pattern is already used in the
bindings / device tree for many Renesas IPs.

There's even an exception inside dt-schema specifically for this.

dtschema/schemas/dma/dma.yaml:
  dma-names:
    anyOf:
      - uniqueItems: true
      - items:
          # Hack around Renesas bindings which repeat entries to support
          # multiple possible DMA providers
          enum: [rx, tx]

> pw-bot: changes-requested
>=20
> Conor.

