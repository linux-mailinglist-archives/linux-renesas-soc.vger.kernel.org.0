Return-Path: <linux-renesas-soc+bounces-27379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCFhGZ3cdGks+gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 15:52:13 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAA67DECD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 15:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A08E33036070
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Jan 2026 14:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268113254B5;
	Sat, 24 Jan 2026 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="hs6dqvzQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020114.outbound.protection.outlook.com [52.101.228.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9ED318B99;
	Sat, 24 Jan 2026 14:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769266228; cv=fail; b=gnFPEiuIn7z/iMPsgeW3Vc2JuaZJeD6kMMF8UDMIfWljzMp+GHZsKwwDdBmaNJy4yLihCp1q1sTfLMiEuRewZt960FJzyWbU0ParPL2XM9dKfy9WuSmrB2TpRAhoJYItLgR/+pAGByaW9SIpJCPMhd8iO+nuwkZEl0t5Jrzw4Qk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769266228; c=relaxed/simple;
	bh=eCCRoFPLuluLEqPvN5ZKW8GSM3jf+xIzMWfKZriYU8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XX/NqZc4bgMwWysUScVqqH4GVj1bXw8ySdFxhgGPQ/iDucX8Sk+N8D9wmTcPDelAdUIHwuPoh7vgwLwcJkPhJzjVK9+BNLVvmitzOO5wACqIxa08cS5bixsVVd4eakdYLbQzbbUgg27hwCUG3b4uDMw3xIv03Zdt2SAdbIN1WII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=hs6dqvzQ; arc=fail smtp.client-ip=52.101.228.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMo4i5u49+G3t4Aqb4ftdMLiWQzEA13EZsfhs7t2C92clbeYTN0IGhMmNbHJcus78ZcRTIFh+Yfs3T33HvOfRX0+JMbdJNxXb4X7Y5r3Ilsoy+yJNYidCt/8Of/Mr0ugbyaZj/SGj6lVpcx6gCbV36h6RELkbTBfamiOYJ1Vt2olNI3NFFHaMM6qVd/a9DHmk4sDM2cIy3YTGFRoiLzvfy9Uv809VDnQe+GF5UiymTqawCj2rIV/13xXkdlcm5Ox0o6G3SI6IsMHjoaK185DK8gNmj5HX+EdQBR8LS1TYsNcyvtkGPMdsuTVwWHFDYd5/4V8oTeGLjIhV27TaC8/hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzHmLHiHl09zdrtEBoESDXjnN4gnabBijgeRkh4Eo0Q=;
 b=RLkY0S5NckIrR/9WJ9dYMKPYLIms59t7PGlFje9uXLmctPtARFQXXOSKau/iDJ8JfgV/IG0bSENmEwUfjjhNwSkd/HPAGKfyJvKLRwPkOC5vPmGf7E72Ea+oxwLabH8gJ2LTEzw+7AT0/LeUCg9FtZVlpNiWnLKxeXeWCeDMpvSfOxtZE2O5Vo5Bm+NLKefWWb/9rQEuzn6RwDCnEuido8UGF+2CprKP+PoGvG4lJB5ouJjqfjvNISyJ/XSDqg5LyVSg03QstIujUSSg18jCZVczGCA0treE1kG7I7YqiDQsrvizWwWWoLR2y9qMCpb2oLdaUVcr2fZH9V8j9reIDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vzHmLHiHl09zdrtEBoESDXjnN4gnabBijgeRkh4Eo0Q=;
 b=hs6dqvzQH7/ufVPBXgpUkYR2PynTVpT+EFN/UDxYJuFvdRRNzbXa2WZbcC8HVN38Qu/aJaFImK4Duer9MI2jwhvilrOsTEyH9QfnusC1auKQ1Z8Ymm6sLLyP2Fk7Rh/ZyJ9FKJz9nXvWiQJI3oGyBwo2rNOy7n1n/TrvO1q+6Yk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYYP286MB4692.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:19c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Sat, 24 Jan
 2026 14:50:20 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%5]) with mapi id 15.20.9542.010; Sat, 24 Jan 2026
 14:50:20 +0000
From: Koichiro Den <den@valinux.co.jp>
To: jingoohan1@gmail.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	cassel@kernel.org,
	Frank.Li@nxp.com
Cc: vigneshr@ti.com,
	s-vadapalli@ti.com,
	hongxing.zhu@nxp.com,
	l.stach@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	roy.zang@nxp.com,
	jesper.nilsson@axis.com,
	heiko@sntech.de,
	srikanth.thokala@intel.com,
	marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	christian.bruel@foss.st.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	kishon@kernel.org,
	jirislaby@kernel.org,
	rongqianfeng@vivo.com,
	18255117159@163.com,
	shawn.lin@rock-chips.com,
	nicolas.frattaroli@collabora.com,
	linux.amoon@gmail.com,
	vidyas@nvidia.com,
	shuah@kernel.org,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v10 5/8] Documentation: PCI: endpoint: Clarify pci_epc_set_bar() usage
Date: Sat, 24 Jan 2026 23:50:09 +0900
Message-ID: <20260124145012.2794108-6-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260124145012.2794108-1-den@valinux.co.jp>
References: <20260124145012.2794108-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0051.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::12) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYYP286MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: 70290d38-5b3f-4a24-a272-08de5b57e595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SgXOns9ZjoM1KH4Opl0tz5zGjwbFS0fpipu/EX1FnHYV50bEMKiCSzcALdIR?=
 =?us-ascii?Q?n2hNCsDYSJ8bVG4rZcNNahu267HKad+QG8adxbvf6qIW43s3FNiyY1ZqDBJd?=
 =?us-ascii?Q?YgYvkEwupJdqARjQufbhKRKLp0gl0bZ4HZHs6Xq3pS7tVWNPim+dyIbmgoKS?=
 =?us-ascii?Q?t6rxArW1hgVyw0KKIVSFbwX7ci8cjfRiJNOG/cJu4VtgPJRfFaq8QSBg35ps?=
 =?us-ascii?Q?grhJNahcmOsd9/I6A4afL5v1MULQPFn+X5Z2JkQITBiA2NyjSDFY05cCzzkG?=
 =?us-ascii?Q?iya6915mZOpK+1AyeMNgxd13XZ3ZhSo41lzurUh80nMEcWPKGPGyWRzoJw+C?=
 =?us-ascii?Q?IMskEbWadnk7NSllJ3hye2Y2zUDENtnz7nimidsPwMGYrlVhh/OIY5HPf9iq?=
 =?us-ascii?Q?mwQ+hTBopCninoW7mYVskdphexExBXMTTWfSAAAGCukYZyVtlyg4J8rhzziL?=
 =?us-ascii?Q?Xo5ZrCJ1qH04++DrIVbrSJJ/w5/s1pfvyxwFqzT6s+GQGq6G7q/PebnkdvoP?=
 =?us-ascii?Q?0IenWFIxTi+sh6AzU7hlYMBjnNs1zhgil7nAEijzJGUUdJPdvRb348MtV7r3?=
 =?us-ascii?Q?zed1oPEKCkFzToJyS2RmeROiUdSMrZFFgAwoLvd1Jx3S0wbm6r0V1fhVcFLl?=
 =?us-ascii?Q?vz2gqw50lKvdBz+sXQiTLNTS2GU6AROOm1JAk7EmNDcq0hMn41QJRTdNbdoK?=
 =?us-ascii?Q?Yheo+dXz2PmS8dtegatknXA1tnvPrXbpB+XW/+EWccLjgwlmJpM4iX+xl83q?=
 =?us-ascii?Q?/GM7OABKVV6d04IrdQZbqBlGsmSDZlYoWtd72mOPJQg6jxt12bA0LBCfi42N?=
 =?us-ascii?Q?rKCUj/bPEAYC12i38HquALlE5WTVQ5l5WcXCNdaQ1LXC9yI7kAWOhwVGFoLk?=
 =?us-ascii?Q?zALLrx2BWcNGMo9ZFuuvIa4Svr9PtEM5pLSXtpljeU32e+tKTUuD9uk4W/D7?=
 =?us-ascii?Q?aQlT184mvX8fDnezPAJtuoz3Rk3g8HwQARIzdeMp2UA+gwrx2nFoHPiOTJR8?=
 =?us-ascii?Q?Qhpg83oae4i5UfCvN6qjqdSMht+wGv90hWg5OHqck621emhUyDhl0wJZNycs?=
 =?us-ascii?Q?ff8j9dTE2RtPrzD5Vzt3/w5SD3nBK3y2ZXNxKg2UKBAgwktCXK0yKWoqLsS+?=
 =?us-ascii?Q?n6BwtvQ1ahbx43Uly3UpRt5a+Fd5H2d8x/l8vrsyJZWc1MAtr68+kJi/5JQG?=
 =?us-ascii?Q?IVFGr2Wccr2DjD82+ld6dsf2kUzbphr6oqGol2C+en6cH0TEnXPl3XYUZUy0?=
 =?us-ascii?Q?mUpC2Xbz/+7n6BnTnO0nHsSKtWAX5rvc7/bba96MsczKd9w8g51gRAXXgTCs?=
 =?us-ascii?Q?Yw2Gnjljo4Q7FX+Auj4q5ONMxGtIk/8tdR5AWf9JadAj2X8QweKySAACcHjz?=
 =?us-ascii?Q?Fzf2j22UBBPOL4l/4vEUAjRMxBjsS8o0ZxccLS/LG/mTBJEVvRY+XQmJ6ru/?=
 =?us-ascii?Q?rz6gS8pxjNUt0X088bQysrpiENdjE2SIT9F8rvgLjOBW9tH6Ge8mZGD/3sRI?=
 =?us-ascii?Q?jkZwITaA7WvqBlDKM6SwwbLLWXM6MeyIEu+spQcYUTkxDS40H3p1szKI6Nmd?=
 =?us-ascii?Q?fBMOffsvaK7BXrnoVro=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(10070799003)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9jDK2FJv/rXZN1cvlJZL8XFz08qOMIWZms4TffDAHVXVcLseDTpNk1QwAE1B?=
 =?us-ascii?Q?3KUghYAy2yjduQMKkX3iSKma5MWQP39dwNbrmHLZ0OGny4i4UfUyf5uLMveL?=
 =?us-ascii?Q?nioKzH9U0LbOOa6zsECMGn4AL5IBA6tWgrQ4t+691WnjzvlYpxCGcx9uPcbW?=
 =?us-ascii?Q?4vVzv3RFjurYWCv68taTndtj6PIIU/XalfuvMNiqvBbgz4rMy3ofSdnNcCiU?=
 =?us-ascii?Q?uS7MyzrfIKWnCWRkRYxlbP4pVsN4M7ob4+od58E35HxKSKwridr22ge7Idoa?=
 =?us-ascii?Q?b2vZQKFYwe3tATVMOHptaxJRAInXyJKYfibR35pfx/XFZ3SyHSbCwbZI5KJx?=
 =?us-ascii?Q?reHeZGUhGyHu6pb42xcsQxgPjtrRgjME07Az/V3B+ZdItVGzZwLvp9etw/Ud?=
 =?us-ascii?Q?rXH1Pkgy9qBU4qEuzrA1clSOFxwXM2AOqAk7FWVrxmlsd9S9wBbclpf8shhQ?=
 =?us-ascii?Q?zGQKafcdVAMTXqkq7J12C/oEm9PGuPOyo3Kpo2R58mTi9Dh2EmpcsXoJ3OHV?=
 =?us-ascii?Q?OwwMjik1efXMRjntlcX1+v+/rnmoXh7lJED6T069P+6O/kApSEs63QDN0CA5?=
 =?us-ascii?Q?n8eH9jwhaMgTHTHT+LiDb6xo+cTpK7Gqfmbntq3XhKwn34FU8Z1B0r6dgP+u?=
 =?us-ascii?Q?GP4nAccEQmhyLDcKIvIG4IhPFAxHyUf5tLGdga0o0McBBCJdT5ZrJwDcoXbW?=
 =?us-ascii?Q?iWRkYZ7Cp5lXrvZu90STacfVCPDDz+IkcezlObF3tw7CayIGwKN5zXwiYxnA?=
 =?us-ascii?Q?1kdoB7L9vQU8JG2OWuAO6VlOHCzwgm49gPoE4ZoQusKU6gcpoRK/j8S+2b++?=
 =?us-ascii?Q?4Zg4EA5oBVGld59bvkI4q8Eopg/ID1xNTTC5qOOtl4z2DDuyF6mkwdVwUNfv?=
 =?us-ascii?Q?zvH7ZHKoRYA6nxer4kaM2R4oOVMBemFLdlqRiZ4nC+7463dIODdURLSSIfGC?=
 =?us-ascii?Q?7ZUJGfGuDDpHjdilqOkkrVaQKTm4lo4+mYDNhcdihrLSJeY9F09oe7p1ocM0?=
 =?us-ascii?Q?vSNeur/vS6wUFsMQ2j8lwyBLfbI0ynTqUd1+9refSpLcxFN6F8gGxibldWlr?=
 =?us-ascii?Q?zkVCQrxZjKzbjuV1AwFah/ZsB+BwQIeHQ26CONvQcUMVTI7y7CQ26GGqPpZC?=
 =?us-ascii?Q?EXwzc9HylC4P8dS+uFT39UuOH7f7+6lWFrKiCRHCt9VqjFLENmTZo2NDxqce?=
 =?us-ascii?Q?aWnkJvCz/HT2ctCNKeJJnZpO5Nz3FkZY9bqze9lJQKSyNiqWq6k4gzNb2otr?=
 =?us-ascii?Q?vsqFpajqBVsGkk6t7EHD/wbeWI83GvFbJ2ZXDj3h4XoipAEUvLrJndbHLRo9?=
 =?us-ascii?Q?q+4g/Z0hNi6nSbvD01sMNF3UUwRVKF2FTuyYQG6HNUPxZbP76FTZAMRu8Yai?=
 =?us-ascii?Q?NvWsDPOwT4YoQyYKYilVkMslXSx9c5BCOV1SMVbLDgP7Wx76+iIaaDMCmN0u?=
 =?us-ascii?Q?xD3hhNzZ9OU54DOe3GS8E3QLpqY3x0eIYq882iTyu+U5ByqUa4NxwKst4OZx?=
 =?us-ascii?Q?p/jkZMOOkItdlNo48Sl19+JY/lr37U0WD99L1nt0mCAWD1zAMs0sHwD5ShYT?=
 =?us-ascii?Q?Ey6sGg1c3UDIMVx6GqicPVqmcGGpi5f8YqVUJqOq+9oj3LPtxZUvJwtRWbvo?=
 =?us-ascii?Q?77bpewWMJcqL8GNMEShfedUWgJcKcsnkvoT1Uu/ljytMleb3zzyCjdNjBzn3?=
 =?us-ascii?Q?/ZKfnC3ySipcXPHE8meuDOldG4zJrgKWUnynC/rlqeHfBg/uvZu07JxKOppB?=
 =?us-ascii?Q?yNapIYiFXr+kiT+5ckz+E6qrJGh20LR7THPX0YJJ8+jEi9KbTIqN?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 70290d38-5b3f-4a24-a272-08de5b57e595
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 14:50:20.5678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Swawd/VRqLNxxCg8zpLw1hjAPR8zf0F40ivMYvbtBdoP5xOJIZcA1Sm3LST094hV7g7aRNQDZDI2mRl4hhkeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB4692
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[valinux.co.jp,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[valinux.co.jp:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27379-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com,nxp.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,nxp.com,pengutronix.de,kernel.org,gmail.com,axis.com,sntech.de,intel.com,renesas.com,glider.be,foss.st.com,nvidia.com,socionext.com,vivo.com,163.com,rock-chips.com,collabora.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[valinux.co.jp:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[den@valinux.co.jp,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[55];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_NONE(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,valinux.co.jp:dkim,valinux.co.jp:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: 0EAA67DECD
X-Rspamd-Action: no action

The current documentation implies that pci_epc_set_bar() is only used
before the host enumerates the endpoint.

In practice, some Endpoint Controllers support calling pci_epc_set_bar()
multiple times for the same BAR (without clearing it) in order to update
inbound address translations after the host has programmed the BAR base
address, which some Endpoint Functions such as vNTB already rely on.
Add document text for that.

Also document the expected call flow for BAR subrange mapping
(pci_epf_bar.num_submap / pci_epf_bar.submap), which may require a
second pci_epc_set_bar() call after the host has programmed the BAR base
address.

Reviewed-by: Niklas Cassel <cassel@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
 Documentation/PCI/endpoint/pci-endpoint.rst | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/PCI/endpoint/pci-endpoint.rst b/Documentation/PCI/endpoint/pci-endpoint.rst
index 0741c8cbd74e..4697377adeae 100644
--- a/Documentation/PCI/endpoint/pci-endpoint.rst
+++ b/Documentation/PCI/endpoint/pci-endpoint.rst
@@ -95,6 +95,30 @@ by the PCI endpoint function driver.
    Register space of the function driver is usually configured
    using this API.
 
+   Some endpoint controllers also support calling pci_epc_set_bar() again
+   for the same BAR (without calling pci_epc_clear_bar()) to update inbound
+   address translations after the host has programmed the BAR base address.
+   Endpoint function drivers can check this capability via the
+   dynamic_inbound_mapping EPC feature bit.
+
+   When pci_epf_bar.num_submap is non-zero, the endpoint function driver is
+   requesting BAR subrange mapping using pci_epf_bar.submap. This requires
+   the EPC to advertise support via the subrange_mapping EPC feature bit.
+
+   When an EPF driver wants to make use of the inbound subrange mapping
+   feature, it requires that the BAR base address has been programmed by
+   the host during enumeration. Thus, it needs to call pci_epc_set_bar()
+   twice for the same BAR (requires dynamic_inbound_mapping): first with
+   num_submap set to zero and configuring the BAR size, then after the PCIe
+   link is up and the host enumerates the endpoint and programs the BAR
+   base address, again with num_submap set to non-zero value.
+
+   Note that when making use of the inbound subrange mapping feature, the
+   EPF driver must not call pci_epc_clear_bar() between the two
+   pci_epc_set_bar() calls, because clearing the BAR can clear/disable the
+   BAR register or BAR decode on the endpoint while the host still expects
+   the assigned BAR address to remain valid.
+
 * pci_epc_clear_bar()
 
    The PCI endpoint function driver should use pci_epc_clear_bar() to reset
-- 
2.51.0


