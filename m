Return-Path: <linux-renesas-soc+bounces-25989-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C59CD6378
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4102B3019BEC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D702E321428;
	Mon, 22 Dec 2025 13:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mstAqPVx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011028.outbound.protection.outlook.com [40.107.74.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BEC30F55B;
	Mon, 22 Dec 2025 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411075; cv=fail; b=lLcq594I+Ike8fQy72h/jXTN4pP4pwBeb5g1m+JKE/cTLaeHrgtD8Hs3aq+lqukeesSGRN5HzylK6YHSKi0dxE7jVWx+UtKm57AaHLX1vDrCOZ1wYyiPwBDh2qzGrDuzFRgr7VRzgbqWCVLnZY3xVOaC1zfiSzS4uE7Z40m3nvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411075; c=relaxed/simple;
	bh=s6xo3VO7wY7n+EAL8s69XKlDOOz+2gMa/zCgh5japqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ACc8i8MpvzO6g+kLIGr2WMqukMyKltwnmm1GVZMP++Y5OIToz4PGV0JQbgLyQnHxGxoOo/272rtD234aMtnC7cwT1ODUcPAzgggxU8ZGJf032hBucVElPPm53i46wTQ29pdZrIrpqK/CD8epbZi8EtOiubGpJRRfdWQBThOF3rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mstAqPVx; arc=fail smtp.client-ip=40.107.74.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3gP4pqR6kPJ9SpQNvFn4Y4uTMRNTBRHLcMsxDdr/Isf6A/+8qKdqCfdwKYuzuONVODY7S8Ma4CrnTBuUMs4gckH1nfIjskn9aDzBG72YGoGX0WQ89Ydm0bOChmgWdT7OcXoDcDW3qWGh6OH/L4hNlyyIb2RyQOj1qjPXYbaA7oRBX9s0gvoQWcupLowrYAm4XTS6NawtNiDpxC0gr6y4ZRoi1ccT7rJbkgQZGBVqNhc5nRh8XjyW/Xo1GwlcyKamUsSyftZlF1HecXeU/+H05xxZu757OEyEBW+BW1i3OYzRWFzDFEgi/yKySGbmkcv8Vr+5p2PjejNRTXejxK6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CkwYSJsgizC1o3H36xYhdHZVkQ3z9I3okL+NfOU6es=;
 b=BRRuicL5lDy2+Ze4f/S9vhOpPTVbkUm5lMzMNcduVlVvAwt8yOHvZbbcDV4QVKbv+yJMV/WTH++UVrL2/HEyaKkvA1icidtHBzknQMMwBvdE50qOOyBBliUh8QWV6A6P0Qh+ebupeDVNXdYxvW3sc3NsxDYCd8nVODlUJwtXWlmU/Ju5vsXCrRq/0Q5uB0rEWfUnZelkAUF/sXDpJ7IjkaCh4nac6NJsR0Hy3AV3u31KkWoRNsRZAkScA3RjnAF5Hjr4JQkUyzi5qD633C/SZSdrRebnCDWeGNypl2wmnd+Vwxyv73CYixDvlHAgOtnRIPC0c/7w7xCrS6qI+L1cUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CkwYSJsgizC1o3H36xYhdHZVkQ3z9I3okL+NfOU6es=;
 b=mstAqPVx0P5TCA+AuQYQ4yDBYlc2vkCRnNAOf+Y0Zed/rjuMeABxF3PlU2+dkCwZyrc4pXC9n1V6R912hQXZOnX39N6dYVxeh4727pnr678d12KiWY2wTZWKdE8lGskZHvGdhdv9G9GB32PGzsgfb8NNZviy36EFAm8Hx9+Qbac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:44:28 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:44:28 +0000
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
Subject: [PATCH v6 01/14] dt-bindings: mux: Remove nodename pattern constraints
Date: Mon, 22 Dec 2025 14:43:35 +0100
Message-ID: <8ddf324c6037399f67b57724d15e32949522fae1.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: d1ba112a-7780-45a0-7f10-08de416039f6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3KGWJUPVoo5J32Q/AktLhOKsA24EObqeSc053IcukbxjjoSt0/khyz7ujNj5?=
 =?us-ascii?Q?zHbP1Tkcw8v/ZlBk4D20fgV2zSU50I0ImpSTTIRRNmgauVId87BVNRjcFbFG?=
 =?us-ascii?Q?mzlBnVJ+sIRLuj79DCZ0MoMokwJkZQnEHW0oMvCy/OBLBYUxPJX1WfCaMqgF?=
 =?us-ascii?Q?rTih2XVZ8uBiPIk3RLH9U7feEEY8ekFAeUAqw213dG9xq5G91C2k7UzXm0gf?=
 =?us-ascii?Q?yAPrn2fr+ek5Vv5Eb1phWk30h30gRqAfH7jvQO/xFe4kD7pLOQj6W+rq3OcD?=
 =?us-ascii?Q?Iv/pB1487O19pAiaT20ptY33ohKWwFel7mqfSoOJ8AjQeeH/RsDJSGfrt7uD?=
 =?us-ascii?Q?cSajwyWXRYOjUOsXPEM2TtBgUinjaCR89gPCEMy/ZMGyYSHv8UrBwDuxJSCD?=
 =?us-ascii?Q?vzpaftWapSIMXb4MJ66FA3gIFTAlHKOcLW29T7U7btZNZjiO6rhE3McaKZ5s?=
 =?us-ascii?Q?IJ47uegrm+JG9k8ag+wi1NdrJSYzalvdcStd8xzv/W6wARRw7cz8LhtYUzVM?=
 =?us-ascii?Q?rsasQy5qjgKWCHeJyUiWU8+65vjncmo/818hRxbK9+eEgxf0Vzukt8tscPgD?=
 =?us-ascii?Q?tab+yDy+BHymKkoa/hEg+gGfs+tQ6zUuVXj9z1+24PNovvb1VPL121tUUwLh?=
 =?us-ascii?Q?u6wHH5u648IAfoxCiq8CaEOF5tCCIiLrMQwNaKcUdDmehP5mGqTCvAaJMLz0?=
 =?us-ascii?Q?kiYRB5Zqu+eWlKWvlVBmWddg6UdGyXm1L/U1T5k+351QOkiKb0kRnwOEavmk?=
 =?us-ascii?Q?cczGe2yrNdqS/JTLt6oncNzddDrGwkvbhSnSp4Q+mrz3EOgW5WDc/0rv55/5?=
 =?us-ascii?Q?lVKm5SI8KGLA66N+/kggOzfXEh+1m2PVqKqgoqOzjD5aYg1ZHG1U9ThoRRl/?=
 =?us-ascii?Q?63TLYZ58eQUH8jehh//2lHYvciDvAetcfOSqdDO5KOcv26fUthlcsRI2d6Sz?=
 =?us-ascii?Q?nhr/ICG3+cZPgi4EJCDJSA2RC7J378w8f601YJKd/lZ+nM+h+axcWU/NSxa4?=
 =?us-ascii?Q?9SaI4pyDyI1KG3ZfQUDxJ4RvbPtyUIxqg7jEm5KsKko3pvD5x6T4MyYI85vO?=
 =?us-ascii?Q?Di8bFcc3PUK5KdGhlnbFnYBWYfXwXXhyvECHfoZC5INHrlhy59HKBz5xg+ec?=
 =?us-ascii?Q?S3xtkX/+b307eKZMT+UxfomdkORlh7COzZatu3PeKn3+Wey0yBrrwWHYx635?=
 =?us-ascii?Q?/V5VNpLEW4/JoH8ajjad2IPDEpVW8Of7W8NbJB46gZsCZotZJ0z12gCkDY+t?=
 =?us-ascii?Q?8hmJIxG8uSfvPD1EI3VZWYYSFX+RaEBa3ShmEUf1snXW2toKrGUJTkBb72HM?=
 =?us-ascii?Q?2WImHXNyVuDq/CJP29LMGuQ5wvVzXWfMlOGR8jd6+d+jZqSVvYG7azgdRStl?=
 =?us-ascii?Q?Q1GVxkfMHx8tzArnhre53eF+Vgeqw/H7uxfOIT98QgqHC+GuCu6/mgjoI0zH?=
 =?us-ascii?Q?ORKE0n4Bno++U1+4bUqzbWpOf9/C/ZREs8001P+mLTnG7uhdqlk30/7dRKK9?=
 =?us-ascii?Q?VPH0yD7FCFpUO7FW59dZDixuKpj1pWKNJvJZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iAJD1NZHkQRBmNah2b3yZOztG/iGXYR4D0WL4pO+TaEAUBs+KOH/hXu0KHpV?=
 =?us-ascii?Q?lQEVOtHhWPiFT/mls4SgBJsbzZPdEMKK08+6KqSmZ+i9ntlOs2LCMeKHmfbg?=
 =?us-ascii?Q?JBPXRnYesXvE9gBuAeH528gei+eSa9d3QUwPw5CCyeIhNtx87/Tz5Qh+ffWc?=
 =?us-ascii?Q?O3ohPoWCnT8HTP4GBVJubTnI7gnAaZqnSL7pT3qyD4Of99HDQpnKSsjrxiFD?=
 =?us-ascii?Q?GUpT/nFkdOypwGKO8a3gMu0w+dkWAJUTJr7VLoBEbFh1wknFE3gnAdG7X2B8?=
 =?us-ascii?Q?5B28t6BWI4CW98fViqsVsHG3PM0hALdpIudT1HdWX8iGpgupl0Hw2zssUUgk?=
 =?us-ascii?Q?ZDfKzuzcvPhyfsBnYE0uGq3LhVNZW+RJyWqZE86za0A12YI8WrRAOoBtArxd?=
 =?us-ascii?Q?0p+BwdzlPygVMjm9HQJ0YqAaqVGTt2Nt6VrbsCX1BtouKptHycdXtQVQTMoC?=
 =?us-ascii?Q?PiNCLoI8QYP0ecaTxv5NR4bXdvADjnl4zSH16SY86vUTn07NuhcjxZcLF6zw?=
 =?us-ascii?Q?sj2VeYMDHn/6ItessJVSWMzFWqHpNfDeG53VW9kr6EOD5BDyaDL3v4WcHk0z?=
 =?us-ascii?Q?43EE17p5EVwkemvg2q7G/VA1pgsY7e+z+tGrm62NuHtYKVEeNzgze5rUXAtk?=
 =?us-ascii?Q?kK7X009dAUYY+G6tJnEwXcRFSTcjRe5GHfgSjRsMPE77L8/liQjVdJFPLN5/?=
 =?us-ascii?Q?q9RaBdZHLNc/F1KT8hm7byRM0ubsz4bzvTOK0fcbYYgpMgh4oDuFTuCEOPTn?=
 =?us-ascii?Q?UY0Bj+gD1zJqdFyKX/Ph5f1Z3J6ypHgbeNCzUgstuHFfFYy0Dq9lIejPBs8R?=
 =?us-ascii?Q?SQfPNQLJkxiWXFLFYBpw2y01r1Rxdvtzr5GUUuIB+0VaRZq0EbLBZw7sVHCk?=
 =?us-ascii?Q?wMLY5ZDuKESZhPEsSvOGWFTwCwqwMMQYz4/cJGCktRY8WYvfZUWX32hpBrN4?=
 =?us-ascii?Q?Q4O3MrMLgNCcFuHh20OZ5Bxv+zZpl18ipsuKTynsHqaPWNN9Kx8luJbFasna?=
 =?us-ascii?Q?JiRBHo+mOEkkfnz/Bfi585JBgMN1XP0dz5KozBJjUmOTX78YOiFqhKdYTYsB?=
 =?us-ascii?Q?BR8K/eNBuvpXmA3bpPBrQ0fhh+7HDIkBbouZPBjeTIHJrUl/W5TCUK0Bi2pc?=
 =?us-ascii?Q?HKUpejvVLyLkewRGebY6qUQ18Bm9ravogm0Q4v0SEB5pcM+LJ5ggIU0jVSbm?=
 =?us-ascii?Q?xDKnZpdefMe3j5t7qOm7T423xb3XD7NzI8i5p1n23hkOw0e9fdGvRepSxoFu?=
 =?us-ascii?Q?6a2vav4TMmxNgUiQJOrrrx6FqSfJzseVJOccpDFBc1stuPfT2bXVl1Xmd9+v?=
 =?us-ascii?Q?AKDkD54fb6mNzWAM8abQrnNakYKhvBZf+eUa+Rmwq6tgMregbE92WAvxni/o?=
 =?us-ascii?Q?dKH9kBHDaqwnbxWb+UAhfi88L2oLtKOJBDGTCZz9KqzOMskLJgsNt2ZfESLC?=
 =?us-ascii?Q?IYOPkowmr/s98M03zM+3ty5lGmgQkSk2Y8+AGcH7ak6XooILkgP4qhn7g+MJ?=
 =?us-ascii?Q?ybiS0/X65g5k+ejYFiW51hfjgj6x7s03DTxblVYmj9IMyTW2Dgp+nA3HFgwo?=
 =?us-ascii?Q?PHZuJ0/rbMkaereZQyIS1MSTPQd+4KoCqIa8JNdEYVkHeb98P0TsVFul4YMP?=
 =?us-ascii?Q?pgPhCJ+x1PBS9BHd7YdNBjv9JmSuIXwrsvR2aeb3bIeh5+ObvdzTmFQtM42y?=
 =?us-ascii?Q?lUkCRbNbiTuYBWhTpK6xqZ0zwHnKoYksCn0xfTbKYiVnbnveZU9xPHwAAcVE?=
 =?us-ascii?Q?UQJHskr9Hl2X3xLloj3qFfAwkDyUJjmFGGRoz6p7BBvDoSZi2dAK?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ba112a-7780-45a0-7f10-08de416039f6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:44:27.9297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unV/18q5CJ6lBm2fa85U6JMImd0TjwVk9Uum2fT30fpzfwXr5GHW3+vER76oJ0ND9sNLiy6NpHQoSpxxlbywHCmkI3hGrUQUhO3dXG3CtCokIAk53V9pXECRGcR8+TYI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

The nodename pattern in  created an unnecessary restriction that forced
all mux nodes to be named with the 'mux-controller' prefix.
This prevented valid use cases where mux functionality is part of other
hardware blocks that should use more specific naming conventions.

Remove the $nodename pattern constraints from both the 'select' keyword
and the properties section of the mux-controller schema.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes.

v4->v5:
 - Added Reviewed-by tag from Conor Dooley.

v3->v4:
 - New patch.

 Documentation/devicetree/bindings/mux/mux-controller.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mux/mux-controller.yaml b/Documentation/devicetree/bindings/mux/mux-controller.yaml
index 78340bbe4df6..6defb9da10f7 100644
--- a/Documentation/devicetree/bindings/mux/mux-controller.yaml
+++ b/Documentation/devicetree/bindings/mux/mux-controller.yaml
@@ -63,18 +63,12 @@ description: |
 
 select:
   anyOf:
-    - properties:
-        $nodename:
-          pattern: '^mux-controller'
     - required:
         - '#mux-control-cells'
     - required:
         - '#mux-state-cells'
 
 properties:
-  $nodename:
-    pattern: '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
-
   '#mux-control-cells':
     enum: [ 0, 1 ]
 
-- 
2.43.0


