Return-Path: <linux-renesas-soc+bounces-25992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E12D8CD6384
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:44:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59D493017D67
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D889B32692C;
	Mon, 22 Dec 2025 13:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZTM0iE9F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011011.outbound.protection.outlook.com [52.101.125.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF4C320CA8;
	Mon, 22 Dec 2025 13:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411095; cv=fail; b=kybfJ7tbImAMHbFh0P8oAksVb/BO2f2iayUkbNCX8FUhslQIfjQBvPCS5hZtkD89u4cEH0OOtyPymD+e4hiisVnEqDwjFZDWFLoLF7QIMd6kb3D4lU+xeIoct+Y40VlUnecpw7Rp0YoGpTpGRbV3pORmNdf4EhDfIaS8fGoe7bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411095; c=relaxed/simple;
	bh=7LaNSa3I727aQ9BCHdNbRPRTk5FzAzzImqDXkaa1T5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qprjPLjK+G7GlZY8jNE8xBO7NurINWypLoU3e9rKw5Miz3WWUtgcHz8WKwSjuH5WobSe+CmPsKSNcQx8HZo6txl25BrrQKqZm39Q/lIWkvptgpxukU7UtOHo+UHQPSRTbGVmdIwIs5nqkuOhbfK0fpFuuZ3j2zqB08aG9JiWcfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZTM0iE9F; arc=fail smtp.client-ip=52.101.125.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnPsd1EEUjgGqSeI+HNbV6xv8HZZuxKvPLAmf5Rv+xpcRx43oBwjmz19VUCJ9SqiuSz5c9TXvyzPgF8DZQngR1u2LuXHrRCZ1emCm5BFfRyivXFe0uh7iiAqpQW7yiH8A279zLgFxsycRzUc+ZcLb6phfZkJwryXlkNrjggoCx4KGDIR83FJgS+uSSr4ZZ202gdiYrBkcbFTpZQVdalahg9IPRw+PYtyTmSjiBKJkUld1lz0FmbMRBNdeplwx8rYrkeffeC0MNCYf3/A/RkYbSRSWKkyatt7gzWU8J2fE4GHtoGP9RG3A2uwqMHg3yN8jTnB/r7XdPooI3wFdfExVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lSB/mtmnniEEkwLtHVMrIrlOYGLzLsS5mBK1NrXJGJ8=;
 b=gcUtBSeMuEwG/vaU+dqM+yF+kD80hrwE9Zq8LX07koD+9HNbQdF3KC76uhjl6/ali66BHodHxM2Rj6mU1N0jooaE1ecFF2tNeEqbgyyhvxBG+RRBVMMOoVn2j6LMEvqcsYfLEK1zXaCKv9UFwltXgvrzc8RlC9+zNRzg8ZhbcHJMFB3lrc0p654nmzGwDPNwuvZm11M0Mb8tUO1YeaN/JUSlSD8XjfyZ+suvR+rlrWZnv0fLkuhnhE4BSfBbigM3YMjyo61PelKRS8mx8Hn6Z4GXIjQY/6eU1pjALi0W5IB1XPUhwEOeGIA1rZOYZwhkNE4TKfqOCgh71QqUFb7d9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lSB/mtmnniEEkwLtHVMrIrlOYGLzLsS5mBK1NrXJGJ8=;
 b=ZTM0iE9FfFvmDBjaltreZBYmJSbQ092UYBeY+/3jwWlIYgDoNLBhZcQ5m7d36cLymKF/95t2cPbM/VUqJE1F/Q1K/K4xtl3/56+HXjTSwuJbSNU9nwV2zgJXvjUe0L1DWvXojTeGAj5TKbO3e6xoKtetPh6wkt8FUqzGbK1+MX4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:44:51 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:44:51 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Georgi Djakov <djakov@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 04/14] dt-bindings: reset: renesas,rzv2h-usb2phy: Document RZ/G3E USB2PHY reset
Date: Mon, 22 Dec 2025 14:43:38 +0100
Message-ID: <45222b77aee4c50a2e1c855e32a85ffaaa5378de.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB14304:EE_
X-MS-Office365-Filtering-Correlation-Id: 48435b95-453a-4849-293c-08de4160480b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kehD8bbgh4TxDvPmzoFaOIi4/K8dhvSByilNtPHGh0eDr0N7piAG0Kgx91x7?=
 =?us-ascii?Q?66hfrJIc2J/fov8+auertiwv68Lj6m5tQrwU2jUx+OQhQmQVpo09CTfoDvXh?=
 =?us-ascii?Q?bjxiXHPvEd3qK87rBegwjdoysqimE/4zCwhiIa/x+iNaAVF2MF45aH/l+hIx?=
 =?us-ascii?Q?NmDMA3yHdY4oJ0rHXUcOA4uwJD4hvxSjj0H0kFC+QpnY8W4ZSBncHWW8K9WL?=
 =?us-ascii?Q?WIB64fD7G8sIlLEPuwDNogYLIXkTXVuebKH5RRbriT4BNqoY3qVywB/l8idg?=
 =?us-ascii?Q?uBXvtan/3Il5ANv9FUr6IaeVGwjqox1ltWK0bC/gMJa/TdUTcw5ZJmEKvEsY?=
 =?us-ascii?Q?ShEfxeBMoY5qlGzodogSIL4DI09LSPY2Zf79NS/1bi/516AzsKgjDmIUSz3z?=
 =?us-ascii?Q?g2ydnabEQTZMS+8pRpOPfbuv5ML584Pkjgyn7HFwKXryIRPNzaMDo16xItFj?=
 =?us-ascii?Q?yA3/+YSWewXOJ8kiHFe5MLINm9bTufUSz55j80M8AFIeYHHSGONKHheJHonN?=
 =?us-ascii?Q?ZWsibEdcthpox22lvTTBnSJcsJgClhUKnzRNKiPlwJx161znz9j4bE3WMJSE?=
 =?us-ascii?Q?2+yCbatgpGQR/C5igLVziiSQIqdMQn/0hM3Om0L78Hv7D5FrrEDw0e6r3BIh?=
 =?us-ascii?Q?CZPdGcGmaZQDTFF94CLvh9gVKnN+1YZfmI1kmvdPOgpVkCxd/bYa5t79vja/?=
 =?us-ascii?Q?GbzwlfsyM2sb3fLA9aTjiJJRb6gitoprvIDzTdVr89R1GHTDAN+6qvUrTBl/?=
 =?us-ascii?Q?9iW9O+h07AShl+ak9Ko71F8NyfQ2o10xyiKTkI3x3a1AKJGjt8y7Fp5+J1gi?=
 =?us-ascii?Q?9ULmJ8kkrFqMHaWAFuUitqU4j8V0VI5gE0HqRWnZm1Y0OiafxfGTY1m3IFuL?=
 =?us-ascii?Q?pKM+kj9tQ9aLggubG5JwhPIvmhnZdK2dEp/EAJ9jbDHsua9c39vOs3Qh12lz?=
 =?us-ascii?Q?fb/X/yc17WvLIFcC15aE9tXu472wvmFOD3s8MmY5oXReFYB5MPmxl5445Dlh?=
 =?us-ascii?Q?ekG1LJ+40VFCMkWrIb+WGTkZ57xMvVBK8B6sDNfc9fFSv7sUis4blVkYN7Co?=
 =?us-ascii?Q?mn26LbzCUKGaV1Yf1L2F/WVfNMYNGahrcvW/LXxuHoLbDmFxajkulWvoWweu?=
 =?us-ascii?Q?spxWxlUoKfStp3SYWiWRQz9F/ZZE3tSkKlZeEWJZME/xxocceJFACXo5GHG3?=
 =?us-ascii?Q?JFlkAUnczFHHE5X7EteoEu5ujCgbd5+HVo44BkORVjwnRcKOTHxlNDoEsMHO?=
 =?us-ascii?Q?YTlOcRjj+FKrkvjbnEYQpTfKDAjef5f/gXsBsAQ0C/oD+rWOOkOBvr2qBy2z?=
 =?us-ascii?Q?7Mfi4CYCFl9jhAiYo4zQC4ZtncZzJzNPJppzRPsnbqkr59m159V6QiySIkgB?=
 =?us-ascii?Q?E0gh1If9KKdfc7p2pSaXivhvYTsaFDx1V4tksUCtruXYJTFucwQPP4SubjOX?=
 =?us-ascii?Q?CXLlHxj05Qk35GYR+k5eDeoC4XSO0IpPf8iRX8krGdF8UZRl+jhNS1wzjPIp?=
 =?us-ascii?Q?nsHU3B7Fhni/3nH7bfuyL29jF8saw1H4CZDn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wTNXiVFU0zGbwyDzm8v3Dkid0ebHdN7LyY6N1QHLuDbhSk3DLzzMbuK8IPLR?=
 =?us-ascii?Q?DL6qBXfjwWaY81WMMsZOGpWizL3epzkdsNxHk34vxq+Ec/mOkDDAR+2Ze5/0?=
 =?us-ascii?Q?0mDshOelzis/jdEDW7gWy4pfF1Xaswty0pGxxo8qn3nhmOR0NnGuV6JFvfAY?=
 =?us-ascii?Q?8+hMspp/z0/NbWwJjwJNSRfcVOvnQQYSu2Mnu5371NiYLSHLVbG/Ee8BcO4N?=
 =?us-ascii?Q?HLggGQpN6CrYuHuG+gtttfUYLEOhHQ3pySDV0Qz8z1rmHINhP5GfB4c7pqWy?=
 =?us-ascii?Q?SCqEhBYW/PBTr6NyxgeoRUJmp8QwrsYMuVIuSv22vVjCTWTNEk/0ApukKl9g?=
 =?us-ascii?Q?l1KhigSLNxSJasPMmb0ZMWZj8l93Y+uSZfJH1K2F9ud/XtnC1VGkQ2X5pUPp?=
 =?us-ascii?Q?/nyYBIiZf2LjsxBgsKP3+1uC8d1kr398E5LYwKbuIG6aWK6ie4rkYHutF0bP?=
 =?us-ascii?Q?ymrzUXBNssSGqOXA/RLiwnTg3Lz4XH/MU7RNFPVuUyuh62xWz02vid48ZZeY?=
 =?us-ascii?Q?Qpdw03xiB+6RXKd7aJOBe/a2sGqH19ZKS/yFi0kxGleRf78jb5CoMDjNjbRq?=
 =?us-ascii?Q?Adu+hrNF2P0t4GH5AsHobLN5M++59fdt06aHIKIN13chcc0q4LlAn+YBRFlB?=
 =?us-ascii?Q?eWxfcaEkhtnpoO8kvB/CTbW4o6lr7LDD8cx754JGeXhGZoZNHHksmF/Rm6Ua?=
 =?us-ascii?Q?w/CxynXqPg9zgn12Jz/CLPnX5WtgctRAgrnFmuYoAKor2DG/Q4kUMaeeqzd8?=
 =?us-ascii?Q?Vcp3oYZe9HedGRmEnlPTWXTnQFXlx4FXg9ALIouAPXhzR7UhB6fHaFr8dMAI?=
 =?us-ascii?Q?KpPp6kFBdeZZ/R/a5hh7HqRaLsA+BBNdP+sA0ckBecGlPR5XWA0KMdh80SFV?=
 =?us-ascii?Q?1A9GclZWrTDaEopozuLhSw8LzerwnI9WsVhu80lX3gN+UlQDKm7e7RF60Wc7?=
 =?us-ascii?Q?/JIG3OLrLgulDUONbe/VCu9vEgY2F+1o34nSihlJ3JegFNapFn1ySSVb63Ph?=
 =?us-ascii?Q?Gp3SZg77rvvvHYpOgSnnz6g42RFNbxavQC5cjqMfgoqeiDT8huwacrc/MptN?=
 =?us-ascii?Q?ow6F5kwmNqEC7K/oVScwC1IQ3ue8jwrvpz+AJLtubtNPNuOx4h4/DjHgdt2L?=
 =?us-ascii?Q?jVqQdV64h9Ts4Y1ZS23QYK5ynvLgR8qNASgMGPP/MY9FPiJOTF+TBJOmAxOt?=
 =?us-ascii?Q?3gvJY+AyEsbQE9WmUx54eKDEk/O2z8aTfdqq7ZEMzxiuHKnbrNaqeqMW94OQ?=
 =?us-ascii?Q?8j544lvJehZGvoTC0B05txdBjs3E/YvM3yF5Vj8erm/ogVrQkmo15mwMYYUi?=
 =?us-ascii?Q?VjZ+uwGH5ad8KgM5hRs9xdGsKTRdd+iRvE4XVbpe8aOzuv1nR2E2tONHfziF?=
 =?us-ascii?Q?tVBd6B8pOmVLny6iwEZ3ImZtsEJkQ5UCC6FG0qbjLBpXynAxbJxI7DTvkVlH?=
 =?us-ascii?Q?4ht6lR/LjYWml5K+T0McTLyL2AmpnKy2zdDhBH/5mU487fICbgvfqzSISA+N?=
 =?us-ascii?Q?DdzwbuCWlkKfS49noy/fI0kQls0hIIC6ssMdmWh14wAHAfq++4YRyrbRjGO7?=
 =?us-ascii?Q?xvx8JVSPQ33H+nh2IfuT+Oqf9OmrGxOGuY5qr+IftGtXZH3Xx56ZRxN2Vp36?=
 =?us-ascii?Q?hhp5RnH6YC3hC879z/XwA00vRuHKOryRahgb+ZpAvJZrUE01hmyjnSj1mY03?=
 =?us-ascii?Q?dtr+X4vdunoSqtuQldcOkK8R28PxOLbhnSVNNB09qfVJ1Wq7OJ42Mfd3UsQD?=
 =?us-ascii?Q?MykUHKpgBYGLlAEfqTYfhzYAuDruyJsVin7Toy9o6oDlE04W7ubW?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48435b95-453a-4849-293c-08de4160480b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:44:51.5850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZO/4Kck392mZV2T3x93kdqLkY88zEk4G/dHPgEwBx49ZLxHpiyJNgdvF1ucvnZcX80We+m1PZppCLQuxjJBCRXB7BbpcDQ1ZwX7muar0cztuvqrg4/41gBAwkps9uawI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

Document USB2PHY reset controller bindings for RZ/G3E ("R9A09G047") SoC.

The RZ/G3E USB2PHY reset controller is functionally identical to the one
found on the RZ/V2H(P), so no driver changes are needed. The existing
"renesas,r9a09g057-usb2phy-reset" will be used as a fallback compatible
for this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - Fixed commit msg

v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index 7ed0980b9ee1..66650ef8f772 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -17,7 +17,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: renesas,r9a09g056-usb2phy-reset # RZ/V2N
+          - enum:
+              - renesas,r9a09g047-usb2phy-reset # RZ/G3E
+              - renesas,r9a09g056-usb2phy-reset # RZ/V2N
           - const: renesas,r9a09g057-usb2phy-reset
 
       - const: renesas,r9a09g057-usb2phy-reset # RZ/V2H(P)
-- 
2.43.0


