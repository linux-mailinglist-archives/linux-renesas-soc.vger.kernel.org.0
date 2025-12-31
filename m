Return-Path: <linux-renesas-soc+bounces-26217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54305CEB852
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 09:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7DBBF300C771
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 08:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02FCE31280B;
	Wed, 31 Dec 2025 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YR+Am+L0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010019.outbound.protection.outlook.com [52.101.229.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B47F312822;
	Wed, 31 Dec 2025 08:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767169419; cv=fail; b=GVet477yUkRwLk1uF2no5Novsb1arSZ/YbsKR9E74hLxJ74pOBljtO54p75oLIidfO3fVBmyYuq7L2dctdietXMJ9zEqhWn6JkG/YzT2Kldkln1QsHEiFI0m7Ky0Qn/wkCXryqNgezrFeBeqIrAuW1S9+vNOyuz7N22a7T5HL44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767169419; c=relaxed/simple;
	bh=2jZP7GRLNxGadV4e/RWLKIkNgSCyZkoMnjv73SBvjwo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cq/Y95rbp2mHWiXxnfSv1XG9xKChN90y2+d6C7jJbVKXAtscgvjBi0bvmtpiP0n3DGZdEJ+5ziN5YjS7ZL5P6D1+KdDZG/2Y3IRTHJaYSyxDxq5Dsw9yv+sYtg2zubxplO1GWquyYYsDX67sWleFiKC3G8NjEhyIBe8wO3YCtOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YR+Am+L0; arc=fail smtp.client-ip=52.101.229.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=meI8RpbjkhqPBVR7xW5JHqelszn73shhPDeL8QIbotxkfWjHcSQEpKY2vm6vQAjX6c9Vq2OFfnFqmPVCcXPEpt7r6F45OPxvfHsxD4M1lmamkU3PzBjFGRV+47Xv+wn2YijJhyQurMbKb/Fot3mEdgHZDCp+q3g6mfTLrh6OvPKQUaddzbcsz0JSh38ISQIXFxMRwcsWflCezqJN2eFuH/5TX4IqG2ZTg8eFxFtNsWsz0P3NGEHT449Umoi/uaUPXxYiG02hn5rbYzVdrJL/16yhyDa8Z3M0vvI8EbvRmKAGZBqI1KsnntG0ByfQ2Wz8Z5ODhDsPRlBdMga+jgbCuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/Oh06Z8gHqhi/LdPnSoPgo15aMMy+BuHFrSYY+p7PQ=;
 b=UJWGlfyIpHNKPiOTpwtwavCOcWymXuK/J5VkPupveniSuCe3Gqv3pvoIzz4cinTz6r0FyWbXg00wsbRb/rn3Xb4cR1BpPw7k53H+LYYhd+MjWIVLeNdpr3FBxt6dJd/wEhbEQVnW4/e71pmVZfRiI+8yn6GtsbZ7X1k3nW3jEkZGHu79vgjKloFsowdl2mCc8f/ACstJ8VZfi71bjBvo3wXQi6IwVHhpre6ya1r1pkn2QEp48gi9YAryAFaouyTyEj7om98ednV6slnTFPqo3Vi8xM3TIaXt69PgLqKwZbYkOoYh8ptgpXTyHc9wmL2MS1UyHVor06Pk1U0IMi5HQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/Oh06Z8gHqhi/LdPnSoPgo15aMMy+BuHFrSYY+p7PQ=;
 b=YR+Am+L0E9LWs8a18uJm9NxGsFu7Dsb4VDiL1RSFt12aJip/rdoDMNPq2eDiy4G2e7f5a2n6hTfQ2V2gBRVCuGSEluBSngrT3Ss05ilNTHepQkLv5jPbAF7sNm6iFWFjUfZbpgTV9FX8rDEi1hDIJS2vwuNyggulyVY/g7QGaC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB11751.jpnprd01.prod.outlook.com (2603:1096:400:403::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 08:23:28 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 08:23:28 +0000
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
Subject: [PATCH v3 0/4] i3c: renesas: Add suspend/resume support
Date: Wed, 31 Dec 2025 09:22:57 +0100
Message-ID: <cover.1767168766.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB11751:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b1d419c-8d67-41ec-4409-08de4845dffe
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uxS2vrzw/IRc9psuAMs7PJVII0jQmaXKoU8Q2bBl3u4+b3FOQPZ80HLiWFmt?=
 =?us-ascii?Q?W1A459wHxjaTarYgPETbxgZMTFx+lBjU6zhUKzda1r67c6wyZ21EkRSNGvB/?=
 =?us-ascii?Q?FHT3FUb4hSwcC842a1jdU2vRT31gow5pDExjimGSKE+jovIjGGXsmJNNUJLp?=
 =?us-ascii?Q?mKj7+0l1oonFsc2pI2N55CNSeJVBpWyP7R31xCQv2eKIR7vJxZ8n56N0ka6N?=
 =?us-ascii?Q?MPmkaDRBaLGpAE5zjdRicEbI05vXESXH2H/dTinVGEnmfD+Nt7yXx8hDR8Wd?=
 =?us-ascii?Q?CX7Lk9xuUaJfAqyTKFP44I3dk+Qv1AT8j7CNqVO/jSzl3qXXpeMxDvuhyg5S?=
 =?us-ascii?Q?QzSJTiNjwfgCfmMcAd657SyFAFGpredqtZqdmbuQPsEmWDuj9j6XbpfDzBU0?=
 =?us-ascii?Q?J1fzcnayn+VPOi40dKfy6Cx808gwiub7A5KgpjvWjUfyIP+B7qp7oKg3ctCQ?=
 =?us-ascii?Q?g1Sne+Dou4XSsozTWu7fDSGP+DWxVJY3esIdwNUGqKH2aMODX3c4Ok0kEmRg?=
 =?us-ascii?Q?iwcDfIQ8dc4maIUu/BTGRp6MqknT5Th3ZoWoZwL0cr62x8+waoDMzGSC91A2?=
 =?us-ascii?Q?tvHo219DBlEOASYPTpCYEaFiZuZEhtcZiEH1L25Uz1+4/3BGSQ/+VpBycCnE?=
 =?us-ascii?Q?x7oYeTvqvenp2UId6Qh2xXC0HSzQtFCZTNyAeTzFsyUGDeZe0UZe7q+0eNYy?=
 =?us-ascii?Q?53z5liKx6xL/cnUR8+ZiGJ0rqNdMzelUpLGk1+FSgj5mztvOMlkmaijXQknM?=
 =?us-ascii?Q?8euEomnoOD1zZJ+REXqTHuSM2OvRdMPAxlV4A2xz9vfsYCV4vYuiO1SWSLVH?=
 =?us-ascii?Q?0PcWgGTAjI1qB91mfCbCWQsZ63pnDVUlAqg32nSyPF+Timeuh/+yE4Z+Vd+T?=
 =?us-ascii?Q?b5kWsBpO+zZWNuvI4eDlI3hrNBmYxcNv3+2TxAmwfani11TAYrsVpgagsvim?=
 =?us-ascii?Q?ad1lFjY0xPau/M+stcOzy8k17TOUSEmsCvEkg8n5HQ4wMheS+5uB6VSKl/jB?=
 =?us-ascii?Q?se6Bi1SPifyzHKlKYVjW+puGF0KLx5QysdQfowCTCekYKfx31PAt6vuDgkE3?=
 =?us-ascii?Q?5R9a+0HnG0stmczXXRiIqmD/Qytjzm1jC5mM7o1S1Ntt2nVG090xONMJS0VH?=
 =?us-ascii?Q?Qx1VBQYeuQYVDRZ2i3iMbpVNlCsfsy0u3QWzPF8BLLs7sP42QoPr6/ah2UE/?=
 =?us-ascii?Q?vnRE9fgKs46N4CLcJtLP7Hz3CgBBbj4kHAP7VXfqzzOYDP22RlkJpU9varfm?=
 =?us-ascii?Q?JadS19p76aRgZaqBmZb6h2KAY7DGgqCU98/KMhJccW/2p/vsM/qCUWpZ4HGB?=
 =?us-ascii?Q?T7KTJEFIUcdxS4ibTK2kX7SNpvlhs4Xuk4DT4HsUfyJk/VsIMj1snbShTTZO?=
 =?us-ascii?Q?/fRTqt1e4fFabAMjSEfZSoxt23V0bKb0vsRiweRZ8iiRKg8024Wv30/7bC0A?=
 =?us-ascii?Q?27/mqJ4fbMSfW8KBUnLdiWf+Ec5gye8XUNmPtGWVwxN4DhiO4QSFDvF8iAUu?=
 =?us-ascii?Q?vqL1wJWzaxoyz6ZjrPhinQI4h3I3p07IqqlH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7gX8G6s0lvNGUdzUs2/YMtbE+tWdVEpoLRtodslI3UUl7Sc3URb0r2gX+WZp?=
 =?us-ascii?Q?4kycF0DtVT9BKfx70Fu+qSPi9I4nsmF5+rRGHq8/Q6iMn+utz2fX8neDRFrN?=
 =?us-ascii?Q?/Dq2wrr59/r/1jRqgiK+lrLVn7k5754gKosrloAa1DJ5y4oxBA3+l/GYT76z?=
 =?us-ascii?Q?hA6kzb7U/CCyLXXRORk/wyf3elgClCzzkzMY7bGrKATcEvK8p2pXwkdna+Hw?=
 =?us-ascii?Q?en5Ke15EDWmG+WLd4ydvuMmus8aRWF3KpF80u6EEPt/Cmjb6G8IdFNswRFCE?=
 =?us-ascii?Q?ClPAcmFYqlKMXaet10ujPITeRVEZZMJ+6uxLu6bsFZ5JKYC6RtIDx5vVhZMJ?=
 =?us-ascii?Q?c+k6gkC0CzfZYZvBlYW3nwWXXjqC8Yc8YOsIfZhnl+2myrxB8R4mRg2O9s4M?=
 =?us-ascii?Q?ZraDKa+lWYcR0HDAzDwKW0HHm0NPcXo8FVYg+Y6/Db8W809DToA6D5R+YW1b?=
 =?us-ascii?Q?I4XUx/PTsJEi86u3jRN/BIj6UXyYIu+nfof/InPBI123jaz1Qrt3oNvC7BFV?=
 =?us-ascii?Q?wTozQUfFyCyQtAW4NqqRnQFdpSuufjB0HG25cRer0GGuzwstuFVzCInzMp0e?=
 =?us-ascii?Q?+E1dGO8p8KJddttHS+CBr0Lw2Ls1BrgzXQEQ4NFhwmarjdBxRXR3Ry9CoIPP?=
 =?us-ascii?Q?JpggdtbWzFA+YtGKlh8RNRyz/7g0QnM8QChXdVkaJ0vx2/b3c9IfnlAKFTAK?=
 =?us-ascii?Q?CQB0yE5n5uCpZY1Mo2EiDHmqb3soLfMMN8ZDv1QLNb1Zcma7QxnXuN04dvzC?=
 =?us-ascii?Q?PQDnlDsNigRnXdbgd6+iII2QbDdeaWic9/WbznTbiWCSM9R/GZtj6EO1iPpK?=
 =?us-ascii?Q?Qv+DTkcWJOL/xEnoMogTmj9uU8Eapo77XoEHrKK/4zeZKZRPhMITnC9ScPgL?=
 =?us-ascii?Q?5FjTqEzwdGF6YZWETevNfGQVfLuiq7Z1d1/mqolBw+kaPAZGMphthxRBkTLg?=
 =?us-ascii?Q?Bz7skRznWW6A3b/ZfUtg9nEcLvaX8cXG6bld2OOag4MA5nT6vkaeto8/lACc?=
 =?us-ascii?Q?O2xhZza8fQvTbs6npzvg1gK5wdbaaT/ZylbvszA3UlNJTuVFeTtwCgTP9qlE?=
 =?us-ascii?Q?X5xC0vD669pvbXxB92lzbJub3GBrdfzbw2+oHrFwJ9i9UnQIEk+heHTT++wT?=
 =?us-ascii?Q?DgyMgBG0Vo9SE2HStUtHKohJbknOpnOJJYK7Fa7Y0tNB9l4E0ElYF7wmEN7O?=
 =?us-ascii?Q?CDh7gGqEoPLYVqqMncqS9VyiiRQPAVgPaBkdlPO2wyhZYuADEMSRy5Y3um/D?=
 =?us-ascii?Q?xZtCh7s+/BNrO4R2NP1j6eN17W+lF0NEukRhvt3AKrgN8/hdx0UerPYKS2uE?=
 =?us-ascii?Q?uli98VMGTvcxo7yYatUu+ZK8/+RaAaZXTgO0vDyteLD7zC+2YT+UdnSWzGyi?=
 =?us-ascii?Q?FGMddjEQygufVf9rXIepDdqmbSVrosKKC7NTSJWNdsy1d3Ek/fMqRZjGXsHF?=
 =?us-ascii?Q?SAuK6LTHqGxVZT9gFUO+5yf/Fbtu3izoPcysypbarU4fbih8eX20oJnqSBhs?=
 =?us-ascii?Q?FeUaf0TuWB6G0PSUuUJjJO3RxoWTFLHHS/73CnBjfF/TRgJ5wrGvaYvJ06fv?=
 =?us-ascii?Q?1sVturzpX2WfVQivEXYrYKRild2QlUEjtmqfJ7Bni1ICJMm//LDRn4XW4Ipy?=
 =?us-ascii?Q?QCaHfhcA+u4Mn+oO9AlFv1tPuswUfHgxmrFsxDSOzysc48/JR2i0DyxsDbcL?=
 =?us-ascii?Q?vTh/BSNwWQUUvVBBkNw7M4HTKpIyDiQcjfIw2XpTRyD2JWd5roVwBESC6UUt?=
 =?us-ascii?Q?KTLYSHkj+k50eBAe/9UByF9rIWzSq5VRhoy34feFQtg1R01XFRkw?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1d419c-8d67-41ec-4409-08de4845dffe
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 08:23:28.6619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ckxbzu9ZbFU9T+mrWmGi6RxtlO6IizqlUgeTDsuy5K2mSqYzOypRzEM9ArDwpf5plk403rzd7annWMHqHp+fIhoADNzWhmRrZoX3c72zZKcCddC6wj+UZaOvYE1EC94c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11751

Dear All,
This series adds suspend/resume support to the Renesas I3C controller driver.

Thanks & Regards,
Tommaso

v2->v3:
 - PATCH 1/4:
     - Added define for TCLK index.
     - Use devm_clk_bulk_get_all_enabled() into renesas_i3c_probe().
     - Improved commit body.
     - Dropped unnecessary static const char * const renesas_i3c_clks[].
     - Removed the need for per-SoC clock handling and the renesas_i3c_config data.
 - PATCH 2/4:
     - Collected FLi tag.
     - Improved commit body.
 - PATCH 3/4:
     - Collected FLi tag.
     - Improved commit body.
 - PATCH 4/4:
     Fixed error path into renesas_i3c_resume_noirq() and
     renesas_i3c_suspend_noirq() function.

v1->v2:
 - Split patches into smaller chunks.
 - Use clock bulk API.
 - Update patch 4/4 accordingly.

Tommaso Merciai (4):
  i3c: renesas: Switch to clk_bulk API and store clocks in private data
  i3c: renesas: Store clock rate and reset controls in struct
    renesas_i3c
  i3c: renesas: Factor out hardware initialization to separate function
  i3c: renesas: Add suspend/resume support

 drivers/i3c/master/renesas-i3c.c | 256 ++++++++++++++++++++-----------
 1 file changed, 168 insertions(+), 88 deletions(-)

-- 
2.43.0


