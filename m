Return-Path: <linux-renesas-soc+bounces-14446-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64815A6458F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 09:33:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A90C716C7F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Mar 2025 08:33:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4E82206B5;
	Mon, 17 Mar 2025 08:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="skKWL6sj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3D821E096;
	Mon, 17 Mar 2025 08:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742200372; cv=fail; b=R0cFmbnS5z7LELoryZipnrtDsZVgF6TxValrxkhwnO7tAjOPHVJrOs1QvFYmWahuKP3kQSwr1tqyua1nkdV+a829WdVBl9yPUcU9b6TLXLn+YjAX3oCi+//I0jh2Va7mVWHZyn4f3wSJDS3b/2ppoi/s+kdNlsuagdVhx2ES/BM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742200372; c=relaxed/simple;
	bh=fxvPJxwd6qH3fxHppK1mlSmuDoL7RdL1vxusc2lrGDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c6V71NvW6SmLqYYSferFXMLtoZ5BVzOmTM+Bs5e/5q+8ccv9oE4gYM4xacFGtEr115LP90vdvsQGg7hBugTux4Z3ofQISDHWmKY7Eo+L7Xt9pJUoJeU6MowwZ0pIYvyTQh2m9E+TwbkwUF2MERkJhVIeZlbAjW7OPq82Z1irX4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=skKWL6sj; arc=fail smtp.client-ip=52.101.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHEPBqMuiSP3OCjfU5vVNsKdfOBvhw38mSuWt1k4W/CUAtUl/8sSLi6aiXZn2rgZCom6P4xl1VeSLdd6IZLAlD/gJI0CNOpCLqiUltUVwleWnRM+Lmeim3P5gLNmTB6T76NgccadvpPYN3oMZrobaiotks6Z8F5jbExnHK/F2MpBibqUoYn2sOriFHKYF0lmAj//GCrPfA0H0PSLe4KB2DaQdNz2X05pkBVMCTY3tux9/wM1myx0s5GaeVqyxvJr2rgr2yaaWj0ywcsGLlubxVoJ7ZpZD3kra/hz9B/6qITOkHfi8aNT3R/xBDw08o7cxHZPeW+AkV+LDH0rKRF0wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sb+962K+ArtREXkqAkChxxnIcHwg8vBg1r5m9G0+PWU=;
 b=pcqC4dS57c86TBok8ZNYCD/XJVAHs+XNoFOyYF5KL5Zmhkt+1w6R+vP8P6Vncz/KOOceDK5PsTRqMH0tAcvhZVL1eX4zjkKTYgIt1V6MDPSPh4cjhb/6FEgSh/Dz9eFjY6ClJZe8iHeoRkDiGiE5y7sTxEtupBpMrjATx7vq1iaHQtlWXIv+KCXYgIAuzQOOKfucOyJq5e78OmJ3R5iAusz/yLmnzWgVK4deTwpSqqnM8xjbFyKcTlUHBiNGtSMIiAdBvN7nJvcH1oRfmTGtIjAXMF1EajoJQaMR5nzYgaNw554vYeYKuYgJ7Tsqn4QqeIpOFCTBaOoKtHsFv4msZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sb+962K+ArtREXkqAkChxxnIcHwg8vBg1r5m9G0+PWU=;
 b=skKWL6sjnWBCwcObWbPYNzifzSO7Q/4vwNFhX8QPvhUjy1UolcPGU4W67egRzqehhSS2nxME82Vtb58VG2ydgMi5KhZu9SXzICp8+fWicNixk2k4IxwIHWGCPa/3+mjwMB6rDDyZHCCLWD0MWZ/hSWC5bq91CPEPkPaW1YerFqo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS7PR01MB15407.jpnprd01.prod.outlook.com (2603:1096:604:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 08:32:48 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 08:32:48 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Pavel Machek <pavel@denx.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: clock: renesas: Fix description section
Date: Mon, 17 Mar 2025 09:32:09 +0100
Message-ID: <20250317083213.371614-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250317083213.371614-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250317083213.371614-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS7PR01MB15407:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d2b02ed-49fc-4c49-67ed-08dd652e4c1b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B6VB4C+ygfwk0KS7BsaAGpG7GdIqvAklrkVQQe60KVNRteNktkuGaC/ja9qj?=
 =?us-ascii?Q?lJsEs94G1A9h6BjAiLkzYTJ6EzrB3GVxv4LqdCirAPsTJ3Vjq+CCOwvuXRGs?=
 =?us-ascii?Q?sCskRdao/l32UsE3pyyHo9ObcH2W/bXmfu5T8vkmqjC2CyqTptEb2yq30JPI?=
 =?us-ascii?Q?hsftf5hmAba6R+CI6jt+hrjIhrHrcqxSSsD5KjkaR4K/BUM+QH614tlwOqef?=
 =?us-ascii?Q?c8VpiBO5tb6TDbK8UPbOgU5cxOzTjGQpJyMjAG9J8T+m+vuYBhQXyxwS9X9W?=
 =?us-ascii?Q?HlILsyRRFrfvHtRpMDj+Aq8uJ+xiZrPoJAE5y+Fv5Fci5HSjrQBeTenKa2Dz?=
 =?us-ascii?Q?c2IPHwJTAEt2+/CHVAS+cMQo+FzJx+q5lfo0/vjE6blO5DIiBwMHL6IVpFFo?=
 =?us-ascii?Q?JSl0ZK/7XT0x43IWGHE0/vgtxOt7SraXgfiMNX52n86FANPrOxI1Q8+kivlL?=
 =?us-ascii?Q?o/REogLNqPpXuU0VWQGUQNj04nXkE227YaNk6TcXeMwjXZzsF6GZidrUP+Y5?=
 =?us-ascii?Q?V8cWO7+GHRQn7ELYvssapFe1aE7EWVaufLphfUHNmXeTx/KzmQCSv4Gl4h4m?=
 =?us-ascii?Q?ViNflfgYu+Lbnu4crT0oanLe74xC7mvZmVHe7vLE2WXXPeh8O2+zR2aQd+bH?=
 =?us-ascii?Q?I84vg764CmF3RMuTyWYvFzllJYfbAcQ7guBZ6Ff0+VLhLDMhtiqpAIN8ZBbL?=
 =?us-ascii?Q?O4GiEZAiZdx7WVn77F7gqenz3HtfnL+iPWPJ8lVfQNYEyNtrIvMCSFGteev5?=
 =?us-ascii?Q?mGRHYaO8oViCbFzp+on+DzPXCxk7vC0qzUzM0YhLCmqWm3p5aZZxjLm5Q58z?=
 =?us-ascii?Q?rR+eZp8pdWsJD0VeaKFiJbfdIzRgCaGT4Onef+A8IbK2tqEROL+CVFzd5tjv?=
 =?us-ascii?Q?DZ1y6q2ZL9jvJKBEPa3muldOw8F87H74W5mQzetFYtqm4fv021hGIVRUj1Xr?=
 =?us-ascii?Q?o1AgpiO6JSXr6x0RpWGYbMJdMPFNGy6tY4IFnkk2TuI8BuQd+nGAqROiP2oS?=
 =?us-ascii?Q?7jp2otRGkeJqj+pxu3qsW1RDYTuqmFiPz0PsT2y4TpdW9CJMHJG+LCRl+Qy/?=
 =?us-ascii?Q?Asxs70mB+JchvT1UetVUmGVWJyZILgWT2e3Gr30dzDDH6s4O2S9rUK98iHI2?=
 =?us-ascii?Q?PqgPhGgtbX44vqVKbGkfhp3LipEPkLS5GSXvASymaljbB3nRj//zpCYdcNsi?=
 =?us-ascii?Q?zhWyf4Bo/R7uTOt7XxaGd9obbKbvNUwDjEbR26ggsrphE98Id+anJY8Ghpwm?=
 =?us-ascii?Q?pZFS2qy/7pFfK/3SY31HiCxtyygkCvjmJamdTbL+pIjrd9dDBmwtL3mi5geu?=
 =?us-ascii?Q?hlPzrR8fW8okZQXBG6lg1DkKMRfEJ2L0MRPkFrdkC13DlyiiScFbFJRUmKDA?=
 =?us-ascii?Q?KNHwBqggxIY027NvupiyWE6Wwv+5r/zerp4k9tpDxBOllDkgjcPtf1c6yPLv?=
 =?us-ascii?Q?DAE15BtAMRAnbwDbnhNJ8dix4ASoYB2k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UJaj+G5W4nC3HG325cAvgM0sVYFcsrDzF0orNl/03cSfCFb9d30UzBJPU4fD?=
 =?us-ascii?Q?4qvvNutOaRDL/kjnBHfmKrD6HjRQ6I/vSIxQ/1BQQctMSDGGX7A0qpc2vMlI?=
 =?us-ascii?Q?nv7qRL/NCHYxcCvbIDp3VCFAbaJK6ANccNXERCgiMVEVYOQzG638FjOsqqnh?=
 =?us-ascii?Q?G0ZtMcvBA7LCWlTpC4mtzF9t6AZolcKHK7ZcBdb8jioTjrbuFNBqke5i82+I?=
 =?us-ascii?Q?2d7JnYlysAQXlr2F8Yd5H6iwedGrZ1JrYtE0aCAEY3rvp4L5SrrEjCJHrMnn?=
 =?us-ascii?Q?QCKYwizgr6Vr+IFwgNlmYBQZJJCl181XlX1xDeFc99uGkDS4AaI00yTxa6lt?=
 =?us-ascii?Q?nt3mqRT3HjV9pRuSh9++sgH4NmS0jL11a5IbzRPDPXkebDKm2zmJnY4fRwwG?=
 =?us-ascii?Q?g+F98r2cAnCb0nraoakU50cjtFi3Bj6Ffv9P6Mb//uqXDK+s/HiOG0AiQl0g?=
 =?us-ascii?Q?b5MNddih3sRo1o3JclOJCi/jbEYazqsq7pgkQroZS6sgtVxmXzgqQUVwsn8U?=
 =?us-ascii?Q?5IEz5ryyR2mkI8jk9BlhJ39VAnb2KYNq4YtCIKFMzPhv2DcJQ8XEOscIzpXU?=
 =?us-ascii?Q?y4U0CKkWvJWdy+Cv+aNShISNWsLAWJ3DLepEN5KU/BtmnqmtnMs2VVkwoCmF?=
 =?us-ascii?Q?Ps09IU+3M38SGaYj7yZKf1VJYFmE2iqNQ+sHqcLQdbFrGJM1EImaLePoPKhW?=
 =?us-ascii?Q?cwQzchoqW71GLC/SAFrcs0my2Wk1nZ7D45hQHG48Ufgp0HF0eCweb8YrffZt?=
 =?us-ascii?Q?V2Xb0klNJTyJhNKiwTnG0pRYbKbVoYk0ROvm/Ljah2fxBP74/B47nIxTjj2A?=
 =?us-ascii?Q?wEknrM5C33le4aipgG4NGG/4HmGsgnjBg7QY+NH69LXyPzw79XQ78W2Xmgyu?=
 =?us-ascii?Q?J2aUNXIguDuCv0eSCDu+QVr+WXk2PG6OlmAPpL/mIs/SEF+3rUyT3IGFDm9K?=
 =?us-ascii?Q?SFvJQhy20HbTJcc1bSR5qeuxt72s/sTSsUrTOBtUlFxbaeP8xScmp5/QXBi2?=
 =?us-ascii?Q?8fm4LxnD+D6GQXZP2ccIVMxCQ5H8m1u+2Qf451HQf07vRwpGzh76LgTXgBxf?=
 =?us-ascii?Q?335cdTGVR+5KBZdUw1xe6ajEeOiyD09swGqAwZEweKHuInse8z4qQhUvAtKX?=
 =?us-ascii?Q?mBoPhq04LJ4QLDvjLyWq0mR4grYD841JRnLPSkm9BxppZAk0pstFvanSJY1c?=
 =?us-ascii?Q?MKE5rJFdBKeS7c31+hQTRlixHnGe11UCWgAucDB9yLwU+W4AJYEKP+pwkn1F?=
 =?us-ascii?Q?kBlyIyPaYSJ6+fPFvAp/wsOaX1lqln7iuEEAzL91v2rdTOz+f2GaZ0efMj3c?=
 =?us-ascii?Q?Wkb4LnfoneujuJuVtOSJKCwBakTARU8V7hE1iVdWJNhHeQOMjwSbY4MQTkMu?=
 =?us-ascii?Q?KnGx+6ncubBRoJ5R8MDZcdAJnA1TGYzC85hGgr3NMj49He7Xo0Mk2JIv7F9W?=
 =?us-ascii?Q?saW7mqceq8Zj0f0CC0uHM9Vk4evnOczYUty/Exk16MRFdSaRcAraYEu9OEld?=
 =?us-ascii?Q?7uoZAp8oCdwfP/h+V45BQgDOwkIrtZrA1LyHY9/JBCWTZzEROM2VohVPmmzd?=
 =?us-ascii?Q?aAHKEbeTkoMJZDAwusEf4GBCIW+Rw9JdY3C9H2bpsqmJPmNAMn/GVw6wxV3H?=
 =?us-ascii?Q?zEUW3jZ+TbMK8aWpSEQLxAo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2b02ed-49fc-4c49-67ed-08dd652e4c1b
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 08:32:48.0899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xls4XsS6sfHG1XVHQ+1qBNzcPOF2Parpqk8SSQqDLjf127bX4Yy7bZ64hNMWchaeQfMui79Aqh4rroHIQ5ao5/7UZpqJkKzSFq6gH9Y40X8vXqJxF1Slx+8KIqL5r53F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15407

Remove not needed "and" into description section.

Reported-by: Pavel Machek <pavel@denx.de>
Closes: https://lore.kernel.org/cip-dev/Z9P%2F51qOlq2B46FK@duo.ucw.cz/
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
index c3fe76abd549..511692b7f84d 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -12,7 +12,7 @@ maintainers:
 description:
   On Renesas RZ/{G3E,V2H(P)} SoCs, the CPG (Clock Pulse Generator) handles
   generation and control of clock signals for the IP modules, generation and
-  control of resets, and control over booting, low power consumption and power
+  control of resets, control over booting, low power consumption and power
   supply domains.
 
 properties:
-- 
2.43.0


