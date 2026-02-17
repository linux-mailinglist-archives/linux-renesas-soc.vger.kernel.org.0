Return-Path: <linux-renesas-soc+bounces-28294-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFFXGp3olGmjIgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28294-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 23:15:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FF115162A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 23:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17BCC300D369
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Feb 2026 22:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734BE30C36C;
	Tue, 17 Feb 2026 22:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iWYzV4xV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8E13074B1;
	Tue, 17 Feb 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771366553; cv=fail; b=s7NcjgbkIYdTD9CrpECZF/MkbJMWf7cPGm1zBsn9kjtLrd6d3FLNrqPxTYZ8mjWxPp0wgx/dSvVJbfger8SLUHqfWtCtvEJfqGt56Eft0dsHGtdWdUARDsIIljT5675FpLBp7i7TpVAU3IgkXbdeXSSCzBxrzzxV4tiXjEFOC0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771366553; c=relaxed/simple;
	bh=QjzhUlzYIvyJlofeVaomWXrxEZID4mUkeiiN2OJAnqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=exp1sQK2p4C8mGCPbM6RBRLhsksoNFuiZaDLybnffP29kNxzw/PiyUUHo06BIGRUz86hNOoyd3JuChiXtiZ8QjVy9UBrwen7vfumKFaRkAyKaEQzQcxUeItr/almDhZDcWFZkqngFyy34WUe7+Ef0Ny+er7hbRiRD01KIQV5WuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iWYzV4xV; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHltufQaHSKB3i0zRP/PIth9ocriqE4dsp02Y7+91GZkLlMR3K5Dd84L659QqGy2cRMfXCPfJHGHSEXFn9R81DD8BNLxuHr7p+J3lkRsxebj3WiXZaywiMrym30pT43kU5gg+pUrCdlboGDj/xv06SXPDC/FzZPVxyfHgy0naoyCr6H4n5qupzodKE745KXk1abQeYlMBqelW8Z75RCfJeH61nl1guEiINbF6QseCxWwVYKyMsiNuMpFooZmC5eu0OWtqpvi6EKEwUXaN0RmqDjvPlq4RWq3mjCKRbITFWNmoKyBLgCMoANQIGx3319AKEwpYCU2NX+Skj5DNVVt6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WfAxABNh1J7bgqDs3Kgm67ofN59xpXLD9TkCAiaSCY=;
 b=RjCtFv5/ksWpsdveqHvGWZb3sBMfASgcUa5gpnCd1HVom3wjJM25Bw7UslSMhqhqvfyGgCAynW+Ki0I9P83REIiSGj03PORZEfk0tvbGFMN7HvIzb5q1IVeAU/TxBy+QMjASdBrgsHGl+FyBwqFAOnR8NZGVRbh7KTlAdiEgfGGPmHMadOXh4rKIM5sOjKcGWrig5dl9eAv7tD1CBHyYVLU/TSgccJQr0LGIP0w071aJn23b3uEOr11MLrlCZtUy3y1PZOOoOoKpY5KC/E6S4LXJCVelGtD7QEAA2PsRt9gLvC6GrB0DPzNgRCQSwOHXiEg807phmEL1Xc+ixBCg1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+WfAxABNh1J7bgqDs3Kgm67ofN59xpXLD9TkCAiaSCY=;
 b=iWYzV4xVHsWPe9c7vU/Z8qjVzXj7gKSNkVFOrsDw2iaLgVXAlYSNRatC+A+JszYw2QgIvhjOzOk1nDUM2a9DXE3kZDH3yemjOd1co6Bq3bsooc0B7jTQDxbOpG5HTTvRd+/++oLM96YSKM30I7huM42GGlokmaiqvpXc9H+uy1sNYTIsiPcazJ1PXO2w75NhnhuodFkAUI2bAJ00l6zmpRnKte7WmvWiyJ08tCaBXK+GjmUvtZOZwHaVGPt6Sa1IDi65eiiJLBhHbe7Y4bKkzoD1MGvLcBLZHnGk3gXFzNKQlPDu92yH8L8mDbmHnk0qYmGBs48C3rDD8/1BlNs4Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS4PR04MB9575.eurprd04.prod.outlook.com (2603:10a6:20b:4fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 22:15:47 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 22:15:47 +0000
Date: Tue, 17 Feb 2026 17:15:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Damien Le Moal <dlemoal@kernel.org>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 5/9] PCI: dwc: Replace BAR_RESERVED with BAR_DISABLED in
 glue drivers
Message-ID: <aZToh35w7GYrOmgc@lizhi-Precision-Tower-5810>
References: <20260217212707.2450423-11-cassel@kernel.org>
 <20260217212707.2450423-16-cassel@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217212707.2450423-16-cassel@kernel.org>
X-ClientProxiedBy: BY5PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS4PR04MB9575:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fb6f8ce-4d74-4e83-48e0-08de6e7219dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?da26UUv5yGdsBJGjfmyLCciuSdTM4bXCJnC2xO2Pb2oFxlIhYHfMLCL9R8/W?=
 =?us-ascii?Q?8PrNufz37YhrV3LvnWQd9hFOxkHfEgBwbbQfkbKVo+wWWmnjaAVmW+wF66eQ?=
 =?us-ascii?Q?rT8HreLs3nK+XZQEPoUxjYQZty/5KYxtX3oZRahGSDCUg/7LWwO7T97ew/XG?=
 =?us-ascii?Q?tq400a+Xp/olqUfdKqVAyyYJS9GkoFyE23nyIUPy9KhYL/+PONYYs7biSU/M?=
 =?us-ascii?Q?N0cWUXhiP5WqI0Kz2sweaqx9L0EYyWP4UZ27SiNVgaZr1kVRFECG/qO2caJK?=
 =?us-ascii?Q?aWPvqsbCC5jKmSm9177LNUnarXXjB3EJ7tmcig9GVOucCvXt+RUKrbKTTkCx?=
 =?us-ascii?Q?rWH6IhxYnudI0ZS6S1ijUg3lMtSEQqJPtLv4PViW1tq/23Z71Jc3f0DbS63+?=
 =?us-ascii?Q?DLRF0hcoAP0vkuhpwQHNzbixk9pOlcIYaW5UbhH80D/49GyemtX+X0aj/aL8?=
 =?us-ascii?Q?o96br1t8bTKELhb+qcnLP0Ag3+tETGaaypZ23Q+Nuf4vaa1W1LhrGctJa+z+?=
 =?us-ascii?Q?TXRg/C7oWUP7g0tabAX9RKpV8wA98XRsDOB5AyUJ0rJ8mWen4A41TU965Mfg?=
 =?us-ascii?Q?9d1T/gyWxq0RCTyLGCnn9TryW5HbjbGc3bj3nKYqNq7eP3w3FXLKvHN6dz4g?=
 =?us-ascii?Q?xBFS7vRlNT+Z1VLWhl3dqHBXxwTP+ph1gbwn3M86mUY0Z+xBmbtFu2SPC3wm?=
 =?us-ascii?Q?NwbtReUxh14nsuO1DIICOwvkbdqXDAoUgVnWB9VHrpi3lkZLYtyLqn6lRpbU?=
 =?us-ascii?Q?1cr7ecpUZRfI6CdQY5oeCkKDtLVKCsGJRRhTD0Z8my/Ot2XeMZzGA9pCSb5g?=
 =?us-ascii?Q?2qhKSwy2/c6WFKAP9/b5NH+MjRBg19Be2+QDApnYCdk9h0UwWV/ElbdUGuxq?=
 =?us-ascii?Q?UlENmZAjNiMC2vjaYUUrKCPZEa634nG+SrcEZSwL7O4h1snOc+/88fnzHoFU?=
 =?us-ascii?Q?9wmzLV72y1saJCObhs+LLGizRB0KBzhOMVU9g+gjPNZ5P8WVQ6tIYPfredeM?=
 =?us-ascii?Q?0whynK4Q42suZ2e3h9eLIsvLJEgMrqH5VH0jt8htwgyW6+HLMN03EYSywApj?=
 =?us-ascii?Q?aiPsvv+akLf/sd33r6dxiGpVu4KmAALKXxtxmglvnYMhdnu5Xq7t3GQFaLue?=
 =?us-ascii?Q?YKSkrs443wJfq91LNenG9mWyb8ck28tMBymEgW4NHOwKwcPnfCm8iz5VZ7Tv?=
 =?us-ascii?Q?u7A0GXaCrnyQj1GdIiktIW9mUgLhzQQSV7Uk1x/D0zszNmeOJ6QgmiEWUkYN?=
 =?us-ascii?Q?PBnX8o7xwQtHr1CApIvMJqlTKsOgtAbkVllOahRELbKEuKKDZCqyJyXKpKzZ?=
 =?us-ascii?Q?rlsbOc0FcellLs3ErFEIha3no/oKXOGJvg/xkshzjgJCyE2otQ3n4VY2GYrP?=
 =?us-ascii?Q?yxasCwyCfLyaQ/MgxblMmwYEqG2OKKBFtH+8BNuc6I/ZYKUWxNLTG23pkMjS?=
 =?us-ascii?Q?DaHP6/TXx7dcCvwu1oYwh9iAOlZwZdnu6ncfWGhUKKNzRqCbwmlc1AeT2p+A?=
 =?us-ascii?Q?fsg6md4ebagiaif9HpMqKLxS29RxkDQCZ25rVXTRwVZcUcahHUHrVO9m/AGD?=
 =?us-ascii?Q?1I40gxTnsYCUcBs1LP1a3RA+LevbrKVkJKyh2pdCPAYFqpt6aMQSMZSkMCn+?=
 =?us-ascii?Q?pAjrpsRrMDPMGjLGQf+/1x8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U1/TIIHSioCd/LJ3IMPi3Enr8kvgfcz1plKDIWBymrW84gjHZPFrPJDt1WEc?=
 =?us-ascii?Q?6MMjUG8j0MnlMrysFrV27skdURMC+jOSBWY51la3epKTw7jHiGj7W4hAuFBH?=
 =?us-ascii?Q?JrYZ1K/vH0LYBDghtlGeEEANYrGghGfp12DpkcsB0BHQmhzn33CyddpkV7GE?=
 =?us-ascii?Q?8drad0bG/K0hzE5lsqJRDRbSrca4qfP6Wc96UUDJsqA1Yt3gNA83OfIfT6S8?=
 =?us-ascii?Q?6vX8lGL/JPggtRQMIDjgcvhxEA8weINpQYyux4d28USxAozebioen4bjjemD?=
 =?us-ascii?Q?6VF6uZQvm9q66iqQIk3rZwnGibU+uoUisrV8DzfECng71mOqb5EFJjjpOFUo?=
 =?us-ascii?Q?CpPgESmNPR8dHndCI8tHqMzpSrYCanBxZ9XEyRMz5HSAKAfNTociV/JKirmA?=
 =?us-ascii?Q?tp/Zpy50YVq9WAqCwCcUS/lMMD1aMQxiHSrrNjp3oTRPQoAYm7amIfM3KJ1Y?=
 =?us-ascii?Q?Lsl7ClSBaiRSZP500S4rxBhnd6TTsQ8dZnycIe4xrKvOiE7aqVMdVFqKvHGA?=
 =?us-ascii?Q?0Ljvaj61RbQkKn96h7hd8hOMARsouCjYdQHB3iCaBgoZsQMcpdIFtgcylSmU?=
 =?us-ascii?Q?XE9D43bahTysfVBceZpaPNTtbprDAqM7WnH8U3Fa773YCK+Jt0aAu7Yu4qHs?=
 =?us-ascii?Q?VJbu14EXrayQK/u7+H9sdOTmJ4sfRvkJk7nzF7qCYZxUenqFWEX5WNOdmuw0?=
 =?us-ascii?Q?u+7Aa4eQM347BzjAFrR73Pk3yS6ZtEhLJEGhcqRaNIPLJrLmqG5zglarbacW?=
 =?us-ascii?Q?6qFGWStHgSnTvSTTbcE1Xn0DVRx0XmsQQq0iV4UEV2UW0Vgwfu5n3IQegsVm?=
 =?us-ascii?Q?edQzYqTQAcd0OA/ujigZ141lj7dHaXbrjJLa0gRehVNtngJOmuYlHl3KTU8z?=
 =?us-ascii?Q?9uU+CsNRo9WP/UWWdw7QSLRIXuuCyVIsN0qWWtZnlfMG0aR6OoHKyXZcctxB?=
 =?us-ascii?Q?atwByRbdAiC0eT5Ouzu667+LcgiA9wd2XcePew+IUd9k8b1+tPt9x4LVSKA9?=
 =?us-ascii?Q?an0sdBWKGVRY2QxKfDB6x8M2a5QzpE811MuAfkDvWTL1VWFcX3u7QdAicW/V?=
 =?us-ascii?Q?Qkfb12ZJXXH8NgW+DVDRVsj+B5+BykLBYr9q4ni8f/yW/hqnFAMBOvlzNwgq?=
 =?us-ascii?Q?p2z2rLb0FIpP5Jn1oQtp7aPUwUhYhI5jHFqsH8q7qcBHB6BsnkYI9k2on2gT?=
 =?us-ascii?Q?BKIB3dt8a8qAKupPrdDCDHQ5qidE6G9kjlYvLft+E/hS8EeOgnfzn6125hnj?=
 =?us-ascii?Q?VUY++pYdCkC420VIX2fR9qDBubdp87KTGFUuTJgu3BslAHGm/YZ3fo4ojb0n?=
 =?us-ascii?Q?ml++ZlvOM14NTcT/EuxRaoHZoDm2EaI79ZNi5A7UMTybDobBW8q0G5kJZLbW?=
 =?us-ascii?Q?n5mfc+y6WSjXt8iNfrsOYExjl3uUyk4qlqB/kjHc06NL+/WRMxztaBvQmU73?=
 =?us-ascii?Q?kMgYyyk8hOHsf/F8rP2JMDxToka4TAaupo0PqU5ubX0H8csmjFSdXkxu1qZt?=
 =?us-ascii?Q?wIwrZ3D/gyCwXs6w1mGh7uu+YO/Y2LH7myz5gCkXcFA15cFTneB3HPQZ9vq6?=
 =?us-ascii?Q?eB+8LTA/rTi4CrSyGvflr5ibhq3sBDuqKqdD4ezjujKIDAbgF4q6pZA+dcPR?=
 =?us-ascii?Q?IEOT1j81Eqz2PTwj+Lev6DMZz4R0rdrNnCbMuUv5/NbLV7SgAuINEXx/aJdt?=
 =?us-ascii?Q?Q14+Xc4FeabhJukOjw6/QMptqzS9PdksrIQq3LUkzVbPt7Sj+Ise9Ezo0mtW?=
 =?us-ascii?Q?bvP5SURXxA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fb6f8ce-4d74-4e83-48e0-08de6e7219dc
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 22:15:47.5677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxNi7LfP06wIoA7tTGa8bJdQo1wDTxSA5zsxPHn1DyU3sXq5Xpqi/W4deiCnl31afILzrCOfYoPICmUOu4yAjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9575
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28294-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[nxp.com,pengutronix.de,kernel.org,google.com,gmail.com,renesas.com,glider.be,nvidia.com,socionext.com,valinux.co.jp,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim]
X-Rspamd-Queue-Id: 09FF115162A
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 10:27:11PM +0100, Niklas Cassel wrote:
> Most DWC based EPC glue drivers that have BARs marked as BAR_RESERVED in
> epc_features also call dw_pcie_ep_reset_bar() for these reserved BARs in
> ep->ops->init().
>
> An EPF driver will be able to get/enable BARs that have been disabled/reset
> unless they are marked as BAR_RESERVED (see pci_epc_get_next_free_bar()).
>
> Thus all EPC drivers that have a BAR marked as BAR_RESERVED in epc_features
> AND call dw_pcie_ep_reset_bar() should really be marked as BAR_DISABLED.
>
> BARs that are marked as BAR_RESERVED in epc_features but for which
> dw_pcie_ep_reset_bar() is not called in ep->ops->init() are still kept as
> BAR_RESERVED.

combine the same condition together to make easy to read. like

"For BAR_RESERVED bars, change to BAR_DISABLED if call dw_pcie_ep_reset_bar().
and keep as BAR_RESERVED if not dw_pcie_ep_reset_bar() in ep-ops-init()"

Frank

>
> No EPC drivers outside drivers/pci/controllers/dwc mark their BARs as
> BAR_RESERVED, so there is nothing to do in non-DWC based EPC drivers.
>
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c         | 12 ++++++------
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c   |  6 +++---
>  drivers/pci/controller/dwc/pcie-tegra194.c    |  8 ++++----
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c |  4 ++--
>  4 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index a5b8d0b71677..ec1e3557ca53 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1433,19 +1433,19 @@ static int imx_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  static const struct pci_epc_features imx8m_pcie_epc_features = {
>  	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_DISABLED, },
> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
>  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = SZ_256, },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	.align = SZ_64K,
>  };
>
>  static const struct pci_epc_features imx8q_pcie_epc_features = {
>  	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_DISABLED, },
> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	.align = SZ_64K,
>  };
>
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index a6912e85e4dd..9dd05bac22b9 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -422,10 +422,10 @@ static int rcar_gen4_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  static const struct pci_epc_features rcar_gen4_pcie_epc_features = {
>  	DWC_EPC_COMMON_FEATURES,
>  	.msi_capable = true,
> -	.bar[BAR_1] = { .type = BAR_RESERVED, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> +	.bar[BAR_1] = { .type = BAR_DISABLED, },
> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
>  	.bar[BAR_4] = { .type = BAR_FIXED, .fixed_size = 256 },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	.align = SZ_1M,
>  };
>
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 31aa9a494dbc..9f9453e8cd23 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1994,10 +1994,10 @@ static const struct pci_epc_features tegra_pcie_epc_features = {
>  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
>  			.only_64bit = true, },
>  	.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
> -	.bar[BAR_2] = { .type = BAR_RESERVED, },
> -	.bar[BAR_3] = { .type = BAR_RESERVED, },
> -	.bar[BAR_4] = { .type = BAR_RESERVED, },
> -	.bar[BAR_5] = { .type = BAR_RESERVED, },
> +	.bar[BAR_2] = { .type = BAR_DISABLED, },
> +	.bar[BAR_3] = { .type = BAR_DISABLED, },
> +	.bar[BAR_4] = { .type = BAR_DISABLED, },
> +	.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	.align = SZ_64K,
>  };
>
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index f873a1659592..5bde3ee682b5 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -429,8 +429,8 @@ static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
>  		.bar[BAR_1] = { .type = BAR_64BIT_UPPER, },
>  		.bar[BAR_2] = { .only_64bit = true, },
>  		.bar[BAR_3] = { .type = BAR_64BIT_UPPER, },
> -		.bar[BAR_4] = { .type = BAR_RESERVED, },
> -		.bar[BAR_5] = { .type = BAR_RESERVED, },
> +		.bar[BAR_4] = { .type = BAR_DISABLED, },
> +		.bar[BAR_5] = { .type = BAR_DISABLED, },
>  	},
>  };
>
> --
> 2.53.0
>

