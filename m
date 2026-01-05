Return-Path: <linux-renesas-soc+bounces-26280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3DDCF30D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 11:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 45229300EA12
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 10:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5617A3161AA;
	Mon,  5 Jan 2026 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aZCzTWY8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAAD316197;
	Mon,  5 Jan 2026 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767610238; cv=fail; b=UBS2Ml0Y4WEH2K6xe1X3r9cgw+TPRJjjrhIOuW603Em3vZPkYPFEiYVUGUmlCZplNsDQiksVDTo5yN/Gr2+blR4AaEp5TsgfiiD9R4+kT9VzqHxE/808MwE2c6yvDgzBo4Zi8qvJZTBAqBrIDRGrILZSBtMxllr2i/anyB4sEW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767610238; c=relaxed/simple;
	bh=XeHcaocZUUqCKe3fR+AYUMulmMKjiQKd7VjzKMlOhxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OlXQaE6LdoYtRjodTRKF2YMgS7RpdZVF84IYLWWoaYvN1P2cDC4Cu0G+yVq5VQkv1dt/wTQMJD8mmZ9zz+IoQZOOlTZX+JOGv41wD6BEQQRzy4AbHJwDS+skLe3/Zc+VPe/ktFUYwbciRGvKpWh1pnndZmHL/VOpVMonysoU8l8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aZCzTWY8; arc=fail smtp.client-ip=52.101.125.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Svd7XNrPJ1hnqFP3DFJQcbSeDTQ8BiLNX7LFTq9Zckab4kNI6iXb/4TpRSFswIRhUP7oflHVYqoOQ2sgI8raOQpCoI/LlDgKXNHL4kXX80msZY27BhSqSGsuOHpulJmwehUocfmAFrUeuFCmso67XkNjppJDuOsNDkTfIxVlANt0i/Y5eplePMSvsa1Nf/Mbon5npwoTQLqgBCYmt2cvB00IYv8YieWSTyDyF7cszTgZBDDMHPJGQJUYBHp5J/aJxolXYFwDPvT0xP5PD3mgSciZvvNZcRvF4bQj/DCAf/k+87s2gmSsH59ufp08scmeu3YQh3dK6jEHb10dHCLFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LiSBgxhd7cBTNYRvaBCLWopvCMR6+r83nUedgB1T97s=;
 b=CtCRbpbZv5+jBO3yC4cvBYTV1j39c/pbotzi8bpCl5gnvtCpI9qJoVGPN9CBmcG4wlC0RaQHHp6JMXTJYwNS4K6LGjGkpJfrulMI72KKjeUqMOaWtAAhdrsY1lSfqCsrVVJLqsswL60JLcU3PxkP37kLVci7bJJlqDAN+OhCaFEKa/hrafKN5fhOxcvwRaK2PNXtO71cDl0DfdsVBTa1hRVprK+xmxIhXBWT8TWsRA47aHqUhWLGffU45ovxHl7NuBdZ4E2rtdQ3fEgwbRy6DBbjk/DNxehH/VtikQIr0N0B7DKcuW1jRwTy+AAGHD17oeL72IWdsetrh23pMSxFKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LiSBgxhd7cBTNYRvaBCLWopvCMR6+r83nUedgB1T97s=;
 b=aZCzTWY8O7iXgeZNstlRiSB8oizNwant4orrD0yhA+L+0gkL09ZqvSK28fIaHlc+V17B3TZZW2cblO7+HuyDKCA7xQ763hJCGt8bI6UGbmNMyKQ2mumaz3pkaaU2wnYVCeajSdRUHEoWExljM+8Y8+G6j9QsfU0RXzfxJ8q3mWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB15540.jpnprd01.prod.outlook.com (2603:1096:405:274::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Mon, 5 Jan
 2026 10:50:31 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.001; Mon, 5 Jan 2026
 10:50:31 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] i3c: renesas: Switch to clk_bulk API and store clocks in private data
Date: Mon,  5 Jan 2026 11:49:59 +0100
Message-ID: <94d378e99ded450ba118813b35239f9a10a73daa.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767608450.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB15540:EE_
X-MS-Office365-Filtering-Correlation-Id: 03827964-eac3-4595-d306-08de4c483ebb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?smKhYw43CRFpjmI4mPunORcz2sbqpw9xqqkgHiSFFq5A5uWBimvmXBNG+De7?=
 =?us-ascii?Q?5kf/nRQdZkSkOEjimF+DqNobO9Cpv+q6vEm9Owy7lWaoucPE9AJll5KG4uP3?=
 =?us-ascii?Q?wN0MouqSW1QqfOjhInU8U0Yxq8WRKk191P/AN+/DxMsWRiUOkqOnX9W6WCA/?=
 =?us-ascii?Q?UMaRsSXpB9+kcxf15ZJuT4cLiXUx93QEs43WIFkpXpdtl5J+Un8HsiTDCoJr?=
 =?us-ascii?Q?dTm+mie+GSlm7wuk5JOKEi6jZnjZGdsZDSP21OyThTU5XoZbyNQObFNmo+9n?=
 =?us-ascii?Q?gsCnclEoyU/wMrtkhydauGHVrwvYE1mzXWAXqRuCzNWlji0zLyZQu3sLAZMj?=
 =?us-ascii?Q?Cu46BgwuAMLHKT/ZOuyW+MaXlyjEiry/1wG41nEzOKMF3UAotODNcrgCeKbq?=
 =?us-ascii?Q?ipnjh44IYDbE82czqsjr89C3ASn/TX1n837Bl8RW90zHL2n8GpOPW+xFMNf6?=
 =?us-ascii?Q?cwaPlqq+UWoSWAjcqcDg7llyN7bRvFABtVNC+suXX+8JE3f2hVv0u2qDPWNP?=
 =?us-ascii?Q?i+01aRYAsRysgieCWe0wGimbZlrSozvFw3O6YOoomjqHfDB3aqvtnDthONtF?=
 =?us-ascii?Q?luNnQA2o1KmdlTJ9dsEp9NYNuoCPAMMJ5LtiNW9RiL51iq+lRnySnxlOd45j?=
 =?us-ascii?Q?hIY3m6A54qvTHCxtYuZXPPjLaLvc5ZZ3s9Me2JdQk0F+CFKK5PErVUBqdjY2?=
 =?us-ascii?Q?fL24dzj4Y8xVQdaYU73vFu2sSpGSNJxOaw70/tSiRetNEhXQbEYJosXSKCJz?=
 =?us-ascii?Q?64BssaV1wo+7JjG9ahnluwmi7KINTxzB28hAYwxHPfYbwyMdsg1p996Ctn8d?=
 =?us-ascii?Q?+2mjXrcWL7yKCV77GLtXfOvo3qqPetpVoToPWhx43I+AR+mxycAzcxpxvjru?=
 =?us-ascii?Q?UamqvdgHpD/CLEH9u6/bwnXfaFYsM5WucuqHQsTCfO47Qo+s/aWaWWyb3142?=
 =?us-ascii?Q?zdL1EfcrKEmnrD9KGpFCMgRfdS2m68YTk9CKoPTFMMbPgflJhTVjILx2t7ao?=
 =?us-ascii?Q?8G7k8APZOtAoFjAfvoPnFDAfrbHjIFR2frnPi2tjc1lOBEpeCAYPRkTH+vvi?=
 =?us-ascii?Q?9xuZg6Y1YqQcHOCoGotwaF5AByICqY6eGPsNSmKTjW4M5iCulMHiFLEaZbON?=
 =?us-ascii?Q?W0oE1lukhsYzcQjeVCcLrRuraDgCFlJqDbd8MR5OQuXXJ1CeeK0sE2mu9jSw?=
 =?us-ascii?Q?ZRIMwo+yjORDqQrcxrelFU9+HL6/AKvwHIDJk0xAgetPSlBmQLZfZxT9KNFn?=
 =?us-ascii?Q?TAJEIzx6N35GRkOfUjiLocqMv/thqdfqK4b0rBEgupSYUCsTCyg45cf9tMYs?=
 =?us-ascii?Q?5Ei5eGSQkh56O+yVFOlNbzrdCECDwLU9Pr4mA55HuXASZzjUBFMZCZRT9yiF?=
 =?us-ascii?Q?dljRUG+Ij1cpLs2kcmTbPHINKuwmAGAb14iLl4b7+f55SchTRCaVvQp1Y9M9?=
 =?us-ascii?Q?QUtmBCpfnjoWZj695f2egmpLpqF1pStJgRbYfnsTziRDFGwLLAVKdEgmVP+x?=
 =?us-ascii?Q?z/I+Izg2ytay6UHyP6Ba6um52U6kC7/ds5vD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KJyycTzfhO7z0XrHwHHPI4MeLQOBegkL6rKFBlXB6fz0lDs4rMgIxeMi1V0+?=
 =?us-ascii?Q?nZzfgBUWI6JjYxSMhwJm2Bv4XxrvrW9AFwezOB7Z9L2Ynz+Gi43tSDqxhBrQ?=
 =?us-ascii?Q?YHMvOtPei6TG9Wp5V3OL12sXxpSHPT8ISSipW568HrrdnPEezCGDuGQHLVX1?=
 =?us-ascii?Q?gvZI+FiOZANsXd8RK019owxoPvHq4n8pGbkLLlrPRht7Njt3+dHdGis+ddw/?=
 =?us-ascii?Q?F3B4c1IxtYKf+IjiaWIjKPbTYm1h768p2WLfL9F2tFI3WbF80GhO2GJTdHWG?=
 =?us-ascii?Q?iYpCPea3ko+bdzFBSgquL38+S2s+YC2s3ryIYlrWVlKGokM8ymUIQlrTvNCb?=
 =?us-ascii?Q?FgqmcrqqjntKH+TDhDqUgzc/Bo5fml7X5n04jOXzC3mvmWVlOnESoJi7hSkY?=
 =?us-ascii?Q?p9WidWDlaBWxrkeJ2N3HZ22J50iU1v9gQ2TKcC92VRb0PTXB6B/ujSbPAqgU?=
 =?us-ascii?Q?5a2+2aAcDhOvIhlv88bMxPBO4ssa50wImiLu9S2OZ0BFV60VKBU/ic1Jt8Zq?=
 =?us-ascii?Q?58IZaBNLlI7SIW7pO3WBE5+yR/gi+XgLQndy5gq9R6iiMvjyMUJWLsATKPZi?=
 =?us-ascii?Q?vf7NpnEseOMJeAlZax587ppbBPISU/sSTyGnzTDQooSHYJzCW+7WaOp+/XZk?=
 =?us-ascii?Q?hOtbPfC1siSIe1d1/enG7VpFLHUHI8LUq5hCiyD9WskgsdeyqH7fdFA/RkUm?=
 =?us-ascii?Q?l2k5WUCiX3kPZ2TK0lRBGRPlGtt9L5uJnxPqti5sJH9Jfgkie5qJj2wvg6if?=
 =?us-ascii?Q?GFFzdZDtg7i1rmTusTd1Omod2b4dBy7shE88VvqcAoHp8lsloHFKDddcC+KM?=
 =?us-ascii?Q?dIlLvdtSYVsY46CqXaEI6qRGLsAy9QLCNfWuBgVCHYrObRV/IXc8XzVl96XG?=
 =?us-ascii?Q?/aRIDJ2ibyEz6jsNRp8tDgbTWhcD94LVX/Ae3vyZFqk+MKkxeE1nihH0+a+k?=
 =?us-ascii?Q?pT0vV3/qdeM0kLB8EZ1n8BzLmK1XXc8gybLVnik54o3EOQ/tb+C740Fri7bE?=
 =?us-ascii?Q?EtHVp7Br6tHPrNvt4bK4rPNOJnla+2CMyevC2G72q5QEiVavfOE/RUWpmp2e?=
 =?us-ascii?Q?HqwLhDzw4jYJdVniWUqltLCpsH1IwBZ7sm9Scy4MciGteeIRTRMFGDPpLC/T?=
 =?us-ascii?Q?ckrmQqoyczJpcL0UGAE16uUqlpnlU8O8/q7HpdbrnaRMHSO0WJrrBHUxNRMB?=
 =?us-ascii?Q?0XMS6qgqTKvBFZjLSe1I902GwObFQUz9dvVCjL8hCCwTsHwl8AOVcFuwLJXN?=
 =?us-ascii?Q?VznO5/Gm/HiH7dQez5XLpQyrwQQpCEzwR16JlZgyg+c610mlrkl8CSzVtwRo?=
 =?us-ascii?Q?iIwxwAzSkohG/lVKrhlJ19ruUfwj6S5fUcBi4Xt5BbV1KrzUuBg4seuuGDdr?=
 =?us-ascii?Q?iGgYCsJUmeQO1faVGt8BMu2ovB8w8AX8AlSlxKzV2hsYeEQ9ZT9HMb1r7brn?=
 =?us-ascii?Q?sLfr7+lzc/G4l0IfcmIzCG5jQ/CIgXA1UQ9XvaooQwIE/NjhclDD9Cv4FXbH?=
 =?us-ascii?Q?EUHH4R53BK4kKSjdkD9PPMlw2G3xFD0PyhHqtvg3Gi87T+mbN6UBU1QZG3j/?=
 =?us-ascii?Q?Z6Hc3iCGesqOIzUTo9GbWqEIlvLNruiZ2bHCfx66dgo6i6Cx4MXirYX62HHj?=
 =?us-ascii?Q?OYBDOoTdkwDyXmo7t49CoqVoHbKNUKbIgS/yeVNXPPZsZ+212akJ3QqjY6lw?=
 =?us-ascii?Q?NhnxCl/z1dd/vrL+W3muz9y+y/CR1Lv8u+DdLoWLRsgETWG9oD0PK65I1pgb?=
 =?us-ascii?Q?WUFLdhw0fO7ZaVKyL2Dj2I9mgp5md9Le4ZzJAbYcpKvkgjlMua3O?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03827964-eac3-4595-d306-08de4c483ebb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 10:50:31.0314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e44gggU4WgiygsBQDRWrSyRKt7mtwYTV27qwyAb82jtfBFIn7sHUK1NczmDvT7OJEMgYCcKX8GVQ+ai6ESIletYtk57MvhvNXHycy+t+im5Sc5EjAJpEIOiVMeamtKgG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15540

Replace individual devm_clk_get_enabled() calls with the clk_bulk API
and store the clock handles in the driver's private data structure.

All clocks required by the controller are now acquired and enabled using
devm_clk_bulk_get_all_enabled(), removing the need for per-SoC clock
handling and the renesas_i3c_config data.
The TCLK is accessed via a fixed index in the bulk clock array.

Simplify the code and prepare the driver for upcoming suspend/resume
support.

No functional change intended.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - Collected Biju Das tag.

v2->v3:
 - Added define for TCLK index.
 - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
 - Improved commit body.
 - Dropped unnecessary static const char * const renesas_i3c_clks[].
 - Removed the need for per-SoC clock handling and the renesas_i3c_config data.

v1->v2:
 - New patch.

 drivers/i3c/master/renesas-i3c.c | 43 ++++++++------------------------
 1 file changed, 11 insertions(+), 32 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 426a418f29b6..1b8f4be9ad67 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -198,6 +198,8 @@
 #define RENESAS_I3C_MAX_DEVS	8
 #define I2C_INIT_MSG		-1
 
+#define RENESAS_I3C_TCLK_IDX	1
+
 enum i3c_internal_state {
 	I3C_INTERNAL_STATE_DISABLED,
 	I3C_INTERNAL_STATE_CONTROLLER_IDLE,
@@ -259,7 +261,8 @@ struct renesas_i3c {
 	u8 addrs[RENESAS_I3C_MAX_DEVS];
 	struct renesas_i3c_xferqueue xferqueue;
 	void __iomem *regs;
-	struct clk *tclk;
+	struct clk_bulk_data *clks;
+	u8 num_clks;
 };
 
 struct renesas_i3c_i2c_dev_data {
@@ -272,10 +275,6 @@ struct renesas_i3c_irq_desc {
 	const char *desc;
 };
 
-struct renesas_i3c_config {
-	unsigned int has_pclkrw:1;
-};
-
 static inline void renesas_i3c_reg_update(void __iomem *reg, u32 mask, u32 val)
 {
 	u32 data = readl(reg);
@@ -489,7 +488,7 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
 
-	rate = clk_get_rate(i3c->tclk);
+	rate = clk_get_rate(i3c->clks[RENESAS_I3C_TCLK_IDX].clk);
 	if (!rate)
 		return -EINVAL;
 
@@ -1302,13 +1301,8 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 {
 	struct renesas_i3c *i3c;
 	struct reset_control *reset;
-	struct clk *clk;
-	const struct renesas_i3c_config *config = of_device_get_match_data(&pdev->dev);
 	int ret, i;
 
-	if (!config)
-		return -ENODATA;
-
 	i3c = devm_kzalloc(&pdev->dev, sizeof(*i3c), GFP_KERNEL);
 	if (!i3c)
 		return -ENOMEM;
@@ -1317,19 +1311,11 @@ static int renesas_i3c_probe(struct platform_device *pdev)
 	if (IS_ERR(i3c->regs))
 		return PTR_ERR(i3c->regs);
 
-	clk = devm_clk_get_enabled(&pdev->dev, "pclk");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
-	if (config->has_pclkrw) {
-		clk = devm_clk_get_enabled(&pdev->dev, "pclkrw");
-		if (IS_ERR(clk))
-			return PTR_ERR(clk);
-	}
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &i3c->clks);
+	if (ret < 0)
+		return ret;
 
-	i3c->tclk = devm_clk_get_enabled(&pdev->dev, "tclk");
-	if (IS_ERR(i3c->tclk))
-		return PTR_ERR(i3c->tclk);
+	i3c->num_clks = ret;
 
 	reset = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "tresetn");
 	if (IS_ERR(reset))
@@ -1374,16 +1360,9 @@ static void renesas_i3c_remove(struct platform_device *pdev)
 	i3c_master_unregister(&i3c->base);
 }
 
-static const struct renesas_i3c_config empty_i3c_config = {
-};
-
-static const struct renesas_i3c_config r9a09g047_i3c_config = {
-	.has_pclkrw = 1,
-};
-
 static const struct of_device_id renesas_i3c_of_ids[] = {
-	{ .compatible = "renesas,r9a08g045-i3c", .data = &empty_i3c_config },
-	{ .compatible = "renesas,r9a09g047-i3c", .data = &r9a09g047_i3c_config },
+	{ .compatible = "renesas,r9a08g045-i3c" },
+	{ .compatible = "renesas,r9a09g047-i3c" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, renesas_i3c_of_ids);
-- 
2.43.0


