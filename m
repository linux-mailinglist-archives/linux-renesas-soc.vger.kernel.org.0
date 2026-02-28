Return-Path: <linux-renesas-soc+bounces-28591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D9sJJFOomk/1wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28591-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:10:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4371BFDEE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB56B3069012
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 02:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6CD2FE57B;
	Sat, 28 Feb 2026 02:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DGdfWdyf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010021.outbound.protection.outlook.com [52.101.69.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B9A17A2E8;
	Sat, 28 Feb 2026 02:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772244620; cv=fail; b=K2pgArHiZhV/H2SfJP8SPG+0VfC+ytBFRDhI0dOBTNqWftD95bBk7CbFKDVbE74sizEIIbdbweTfzDTN7nePMiC8GLTYuf7s3fZfDt4U4sKEhbqqISd+rqv3Jwmaqgkdc7WbG+OAj/2PJdylRtiPfzBc8J3xoZG5Zk/RPMTsdD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772244620; c=relaxed/simple;
	bh=MZgeu9D6rdkczdKq0Fkx90MVCgDBehEDpVPPUPTmQ3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=d+w3ji9kuHUvlFIT20jak0uP7vPstbopfu6GmmyWngsN92BxDH5VdggfiZxeinJqB9dfE2rmvKmGUK9QFQ8A8xeK+INPrroPBWeaXKD0bO/90JDPRv9CUwJBlh+/dX/RCYn/KbfanQVSAZ3EoPfaXerfM4M+OD4LtUHLOhaAPfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DGdfWdyf; arc=fail smtp.client-ip=52.101.69.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6slZuojyVWCR0ckKlGgfYCYPcHmahxkxdgYYUuowXxzEx9TAA/o4PNnSnEuLqIGs1B4y6UddMA0GPZ96phGrlDzEqhfd7xyLkwKcalCVMRU0rXHqpnID/Q3+WmATPC1YIQoq8kF/CukzKhjZPqj3t9GFUC5NG0hs177lg5BQyuubsnx28Pld0xg6mS38gMRzGfUIgY1W+Vrvhi4T4EYMD3bTgS/+nc+ECdz1IgANLGghb/M4eXkaYceTYZl0e+6sNfTQb9dDE38tK8zWTsVHA75I9TP0cRFQlSbRwLNI09ufXsPlOPkVKCrrX2hakBbPlEpoRwIxt3+iwyXNT+LPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZgeu9D6rdkczdKq0Fkx90MVCgDBehEDpVPPUPTmQ3Y=;
 b=sxqxuT4WIu2mCdPKEl61Zbz9CmP6uG4updOg0VpfIN4wWROIWvicMZSb4PBaPYLjlupHPRL5zlyK3ouFVA2UxRfyzjECIJS+3CU67CY8IML8kypjh5eLYt2FapwZOY15qGh1bHSGbMD4DNxoQj7HYU+7Ooh+ts5hS2cOB8fIcLLJ2zzzb2GaIg2LUuVlqPoS41Qc8z2LYD13ueF+UwvlRjgToMPx6utYvIx4qKL+K+QEjLt8tL7i4+RDKx0Pq8uXLd6/YIJNcQ6l/d0kY92PDLQfYf5C8X2BngLgf+Skp4HYKZXZgnHOEyoC6f9+GcWHgURH7x8HSaPwPyI8cx8vZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZgeu9D6rdkczdKq0Fkx90MVCgDBehEDpVPPUPTmQ3Y=;
 b=DGdfWdyfX+KWBdZxPQ6Fd3IcuTQDCJ3MzYA2H5HS6DamHnCsnSg87s3OqObICsbo7M5hcUz7HYPjf1UTMKw8Du2cEihl5cQ/REOZeJcPuKMCWWvHnSt4POw550pHeEJkhFreAePBUigq6ZGV4AYHjrJzSd7ovphWzFq0RCWE25vbi2hbqgGmDhnM7grrE9zbedBzHDrKAC6vKQe8h7jcFxTjYCJU8x2LrCL4Sg8VDpkT0nARrEr1SSwcmrIYPi1eQvioFhPJoUS/CYd/FrwPBwjzpU7t9DclbPGbMibfEvFKACQBgE3HsuBIql5wv6AobRW+lAFHcS/IBNTB0YeW4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB9PR04MB8185.eurprd04.prod.outlook.com (2603:10a6:10:240::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Sat, 28 Feb
 2026 02:10:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 02:10:16 +0000
Date: Sat, 28 Feb 2026 10:12:09 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 04/11] clk: scmi: Use new simplified per-clock rate
 properties
Message-ID: <aaJO+f6vkdX2Id/w@shlinux89>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-5-cristian.marussi@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227153225.2778358-5-cristian.marussi@arm.com>
X-ClientProxiedBy: MA5P287CA0078.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DB9PR04MB8185:EE_
X-MS-Office365-Filtering-Correlation-Id: a09523be-633a-40ec-4a1e-08de766e82b8
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|19092799006|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	lZhdwAzn+Y4zu45X4O9cMhsaLNLrV/6we/ZauA7mu/uCCJA2wbj2Kvik3wDeI5Z3aFvZBiPVluogooUO+B+FVfQAqTSYmleuFWNwejU2Ecrc7aLI+vBdIBB/raJflDehEA080FNQEZ4FQ6IcJz8wRhJLv4t7bolECz26BreyOy6fgIHs4fP2+3FRJSNz06f5UlMdhDzuVhBJOmvKCqyfQj+8nTMZ/ul5WkJNzj5Zd/W3zsYsyPCbNFlj5dsJH8xQuwTPgspXJpxkGDLFKKPC2Qw/sAxV/vs/TVZvoEV62eNiN+I2jggXOu1A40kInMaLvHe1bINmBA9Z254YO1Dc1QWKLGL1i7qXukbmTx+bgXh0VyXvSlZ5MBUxADIjufrnxRxQ4TawNToIQUbMmhHARmtqR24M6VUg8mNE37wrQyuz4YLs06DyZGh+/bxklyTBGOoA6sJoMbZC6abq7r1TNrIy2Axw+gB/RsgEP1E40NiroviHZMe8M6M7zckJj9tvRM4E/zEvaOY090dsPgupFkz3xx5tczpFKDUgH2v/dR7SVqlTmhi0DUFBuyTnwqUTY4/m6azifaSvvuMlF1dYzqTs+lef5ViGAIpUoLA/7BOBGuvRzEUORSWiQZTSB5P250rYbIswSK6bj5xyAf7w7F6ABetTfOOc8pcaJG4sQ0JiI9mLQJmE+wJALpwYFQ5YgtNwslp7vbd8nZ50+bOMdnsrHXqDvFbgmPiV9bYm1mdzDNl5drpxMS/k6B6YzEroW7yYjOMu4423fPFWPKmtEdqFOHXKg3QZSaayjwR9Mvc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(19092799006)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tZ979J/Q9mBHKkXY/jpJbXeS5G7t8QNmNeRZaNFq+5AW+4W6h9R6X6Vnvy7H?=
 =?us-ascii?Q?bKVdo9svIR0Zw7PMNeIEW/UylUFho1aiWYokhbmMulFAVR5qA2VTYMWKBxfs?=
 =?us-ascii?Q?mG7QCAmqE/vga42N/jd3tyJclmqY0GMJDCqxRgIFNoVQObXoG0B/XW58vXG0?=
 =?us-ascii?Q?TRUehCmHvhUnPJlZKH8ZcCW4bd7HcT4r0la4zplWRbDi8aGcWqC+5APND7tN?=
 =?us-ascii?Q?00IKVh/0LRYYtGvHXhKT0JO0lziQd6S0Sojep+2+vYC3WgPufBfq7ADvJjEt?=
 =?us-ascii?Q?dcCaXN5qvVXmI7RpJfaBe6U+/b1OQ5l0yyuRlJiQlQAM4REsNAYX2GMGWgoP?=
 =?us-ascii?Q?cpFrMS1Rtnfi8I74PzYUNjRdDF45huKMwWJ1p/wKhQ8hcd7IpD2qNnl69QeE?=
 =?us-ascii?Q?/Gh/QSPCoVOBxdLuSm8Ml5ZS6+MVF1xGbpKtr5KYvrnJz4z6QJRo3BhIjZNz?=
 =?us-ascii?Q?qWRCzfbYbIDkioNJzVpa9G7983/VSQNKvrf+yzdYTaxnqz8kTAa0HDi9th/Y?=
 =?us-ascii?Q?vn0TSr/EYZI0MtVUMNm0VZFpTcg1nB7f9IOeZ6QGoPvvjdpNe9MQ1RFGQ0xy?=
 =?us-ascii?Q?UCeR83bLfMerOlEKwvlmUimnzZu8LLrkvoGAAVWXVtbuTwrqOAvqYI9LZiRX?=
 =?us-ascii?Q?J1hQgYP5SYZt2YI55JOqRbp+CT/HMAOwn/TsnxmPoitKNb3Prxr5az610sHo?=
 =?us-ascii?Q?zncOluGgqLX8HePyj0GN2bKUUDiLOButQzh2TfPzTFfBExBXLjZq332TnF/3?=
 =?us-ascii?Q?NEdAFymgKweOrkq0oVaa5Qy5FD67HsvDo8IOjvQUl0ZGnms3y7XpDirPr/rI?=
 =?us-ascii?Q?O77QYminfro166ltGTu2gaxpxeHlw+Tler02NPhPTTb3D8AeORxxRyatlpii?=
 =?us-ascii?Q?KbVgXDSG8HW7UGzr6T0ocIDb0nNGf6MEkVU+YcH9nQBR3l2Pb+BpHFw2vwVr?=
 =?us-ascii?Q?cvcZxIYnaGgsEktXpk29cQlulb6gsNOP0lHrm9EzHlZhH0me4dmkv3IJqJ11?=
 =?us-ascii?Q?fppwk6T1v6FlbR5bpS6XwuoYW6L0P6k2KCrRdcGC0aQDpzaRBgvMdDCJW2Qb?=
 =?us-ascii?Q?/lRYLJsQNh12QjF3uJbQfexqqI1ueSRebYQMuKoiL79AZ7+uMkP4Qs+NOgDx?=
 =?us-ascii?Q?+4NJBYzKbd7s8plS6WVCY4YVzvRbkL01odYdRDJf2FuY42bMoaKctqsEycsZ?=
 =?us-ascii?Q?yt+vZmIOCGZ78USvaILAk0LOR0yf7RcyliK0Z+3lctaUGhNqEsFN7ToubEbU?=
 =?us-ascii?Q?2hBhXMSlxrmfmITSv5z/hqGTtHmvUOY1znbxFhr7ND5ELtTrcGj49kmzHWFZ?=
 =?us-ascii?Q?pZfzVZ+nTV6i3zktTsv0ffWGDtXY8SrUOspnhyU7Rg1Cg4cDg9hkAh01kgwF?=
 =?us-ascii?Q?MIqK1z3kh5bZ/jhC8dx304V/dEr6M2NubThEGLcH/NvDP9+qILLvhRFzksBm?=
 =?us-ascii?Q?haviZNtWgK9AF44gvIazzbfXbBzrLwMe+dgC521H8k8g8eFDlUiZqxW8L5u1?=
 =?us-ascii?Q?XVS2nECtjzoUMGRrQGFH0ZkUTQH2qBJCHs0NmTM3fn1a0AZe/dQEblw0rb1V?=
 =?us-ascii?Q?Wy9yrRxy3K2b/qROgdlXEZJxAUINiz9RMLqXfoEBiterRADMUDvfto7Vxzu5?=
 =?us-ascii?Q?+TKHsNtuK0nbpWq89cU6e8l6w1OoghiY0xT7bGciOBrj28PPQtL/cKzcDQYz?=
 =?us-ascii?Q?Ub06w6CJONczAgXUPgnSprinzhYlaxL9xvqs/EJqaVJPLLGGGfvrps/PjQac?=
 =?us-ascii?Q?YV8I5NQQVA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a09523be-633a-40ec-4a1e-08de766e82b8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 02:10:15.9655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CE7T7lZIh6VtEX7BMHtJW4BfASiVuB6Nz03Kzwlpk0PXB8A1SOeT1dYL1qedYAdXCsheNBzSun+esNUfvytDYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8185
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28591-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com,baylibre.com,kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,arm.com:email,baylibre.com:email,nxp.com:email]
X-Rspamd-Queue-Id: 3F4371BFDEE
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 03:32:18PM +0000, Cristian Marussi wrote:
>Use the new min_rate and max_rate unified properties that provide the
>proper values without having to consider the clock type.
>
>Cc: Michael Turquette <mturquette@baylibre.com>
>Cc: Stephen Boyd <sboyd@kernel.org>
>Cc: linux-clk@vger.kernel.org
>Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>

