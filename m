Return-Path: <linux-renesas-soc+bounces-21685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 417D1B50AA7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 04:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD0AB17D330
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 02:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B461E226D02;
	Wed, 10 Sep 2025 02:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q03XQCvm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010071.outbound.protection.outlook.com [52.101.228.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44EE192B90;
	Wed, 10 Sep 2025 02:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757469718; cv=fail; b=bnOC5h3exMQsNF73HaxxhmoK2EOLgoahSmkKTEvvRJl8VN2tQ6GkoiYZGeDEOCHiCdeQz2DEU78mmEPVbNGomLcPq4ruYQgcEbqhfFfHTcEevN1qFzhjLiW+7FP0OvD1nxJuxafVtgE+1vxr+4PCjWnMZ4sKpHlb4K1c1qQxf00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757469718; c=relaxed/simple;
	bh=jMOhEbAqc/A9SliUWfWkQosWSWUkTlOwN66g6ihofSI=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Mr0mLEImhrVCtOqgukappgdxztFJs20EqM6GIVIxStQty0LXDdIjE/CPPXZqmwaXn5XpOhVnq7gqm335LZ7j/C0+0r0WciO8FYiZRwo9eaEQJeOrSfAJqTS62MBtEDTiOBZQEQhvrNRLpHFN0wjRnhM8GX5PAbLB4QzCPmrxceg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q03XQCvm; arc=fail smtp.client-ip=52.101.228.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h4LNRgVAx/LgeRyEpcX0TdAirJb/Sm08E1EMS6dAIBofdJOUSm7rt0f3FgS9/NNn+N25mNCqIGbHZBRl8C3RYWJJX9xgIb6yZPfepR0uTc9Gx9/BRPzGxVRXo9bcSpNf+X6OrVzmtp92n+j+5cOYxEO5JknHEt91RZPvyZmiy8eAYWq+z8uhIRJ7vtT/msp8ZF2/zgeEVExsevX3flGOagk9jZM+IoO98c0CcyxXqs2QpMnMWGCE9HNHjM79b7zfQwXjY8HpqmMjoGXqgDBhjeJjdIip/cN2Osb5JQbWnF7PY/kVFEC9z7GrtED/Tqs3BLfBnk5ieE1Jt2sI4IQRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGqiK2gDF0IuxXDtDMWBSPLJrxDEMtfWdP4BdQ6QU5E=;
 b=ybIi0ZSiFtPDjRYsCTYVQURfUeIMQ9O+fu7ruY6wLSI8bkMQ21qCJEMrLWj+mw1J8MQkzixvwYibiQIg6rsxjRB4eTcvjP+LEIpaLLU9kOdCm/mBUH56tzQV5N7SjLhJMrk8I3YT6fm3ZovFZ1Lihgkp7375uJ/S/jHFkmx53wPngtD7dMs25FC6OJqRI+EcCOSi+CUbrA2rDXNqMkaFoY8jMQzpdiMF2pMRa1t0vOyWANU0aOFgG6HZ+M2pKQ0dNW+8B4oaRpU5EWrOm1v0KXNxKCD8hGUJio+fTQsLps0M8Ip8D2AVCmybDP4cXJ+rx+O1jUAfFh0Xiu9XNb2XKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MGqiK2gDF0IuxXDtDMWBSPLJrxDEMtfWdP4BdQ6QU5E=;
 b=Q03XQCvmgPqlOOsMgX6HArxuvtTkAWqZQnMCY10zYKvbk27NT7s4NL5wFMeem7otG3ONxPu3BgoRrGQxAGyqARi8xCXGE15jvdYJtTaVXS9Nq/gRvJw1KOkT73eP+GTQ8yBRbkYHxkx/V+sNALHC5WFj7sHXpbnHILQzkbBaRZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB8121.jpnprd01.prod.outlook.com
 (2603:1096:604:167::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 02:01:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 02:01:53 +0000
Message-ID: <87ikhrvze7.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 4/4] arm64: renesas: Add R8A78000 Ironhide board code
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
In-Reply-To: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Sep 2025 02:01:52 +0000
X-ClientProxiedBy: TYWPR01CA0005.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e66765-30fc-418a-a275-08ddf00e0339
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cIcDysN4tXH6cdjerff8abJi+dx6ZDKvVj56PUufycw3gdp3wfkmw2dBYJhN?=
 =?us-ascii?Q?pb84nZk3SCXZzrOTWhrzUAN0upeh0KyPKJP4pCGwJxCYjE8+JheQukMq7FD3?=
 =?us-ascii?Q?TmMtFKo2k3QudwQlMHwhedCALbTZN+bvWKnW3pzkymD8a1sPe16IMTQOzLaq?=
 =?us-ascii?Q?EQr+wGBj4grTCUE5q6qIX6BWWbSidHaw6BdQezv8xk4QgK/UrZTyVQpLHkrC?=
 =?us-ascii?Q?pMYUJImd/mJM4lM8CErRZRv/7zWv8sBtX5yt21r1oyrbheZxLVD98K+npFPs?=
 =?us-ascii?Q?wr/9rrhvX/uhk9GMDe5IBcv4vzOan9fSTgLDUCuFT4yJN8HZa4IGe/9xsWAu?=
 =?us-ascii?Q?GJMg+K8XfGrxBLCJCqNfvI8V3z8x/5mKIMPoym4fCDDtajtd52UDbUm4OOyP?=
 =?us-ascii?Q?FwZH9z4xdOJjLrxXGZcWbeD8/VhjySaqCYyVk6AlyIhFWL6PolkoG++DxCXQ?=
 =?us-ascii?Q?DmBGVBdNznt2DJsEI2ycePCRwarW5ISKfTzBYZ8yfJGsBUzLPc+WNpo87hLK?=
 =?us-ascii?Q?VVN6n9/JPh6nzflvaufxJroG7FJNWOxesk44JwcnxKiEN6sgUaDcAwJlR7Uw?=
 =?us-ascii?Q?lwpZqxHG9rYO0xz1JK46gCx2SSlFURlXEILheMPWZFYaXHaZc7LRbRrJJZfX?=
 =?us-ascii?Q?Fd4cHeiaBU0wZoW1yQ5bmeF1zqyDpI8GbJ9zA/fyJCue2rkYt1DDAy99DOb6?=
 =?us-ascii?Q?jqZ5i7MwIHdvI+4pqqsJ4EeCBwTBgFrqh+dzVd8Uz8S3UAIueigL+XEdER6q?=
 =?us-ascii?Q?5F34nDvgNn/5LKk0Em3eU41D0nb74p/LIf9m7A8klpQF5Up/OhY9RQ+gN2rT?=
 =?us-ascii?Q?DcF0CdERHQQeIWtFPt++ppAUeARwXacK69Ybr+ZxYczZeUUjoGHt8lZ2uoBP?=
 =?us-ascii?Q?Jq/LvdzfWVjWY8yohFiGL1osbkeWHI1YJ1bjIzr8NsM4/m28rYgxZOFg9Jum?=
 =?us-ascii?Q?rAYVAkG6VSXiAdhIMN3WcU4J5NtN+RjpHl5jO2cg03v6HTL3/zC+i3dox5SZ?=
 =?us-ascii?Q?R4RFSqSa2ClY6oJGGQ704r+jKsLl6LowVSiehAbZVyLLKxCZKD0vGm41GO2Q?=
 =?us-ascii?Q?TeZo1o0PlHIr5YP6u7V0cKXQL4/9ImN8K4ei/bVgPBlkq+c3fZHWEErC2SHJ?=
 =?us-ascii?Q?khcEr6kikUOrJcZmqDHOHWFI35CBcB5N14lNYDBEeQIre79SvSxiBl4+gCUC?=
 =?us-ascii?Q?hFVa48nz+kRv3ugic5YAqoNkWO5d493ibD9DULJ98AvCRNbwAR8S8yof+EIC?=
 =?us-ascii?Q?PcHECluDk/PBOhnCOvcTdswOrM/nXIPDbwvZkVOth28MSEzGgNf3olAVhxpV?=
 =?us-ascii?Q?BdoniDuIgXJw4hzcO/BCY1R66d7YyXhA6ghia2et3NPKY52pSPLFkcIC0mji?=
 =?us-ascii?Q?tC9WD9NT6AbuyY+goYAwIFm6xNVatHPlChCCyl3TmFdl4UGfksy42irLBypd?=
 =?us-ascii?Q?RxdyXdTcv93u4rqjXvTHPin8vOISghx5QR6MD6l2H9orpzcTffb/Pr4Mgr7V?=
 =?us-ascii?Q?7XKvFI6tHnIBBm0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VEleMIlfMQsAWDLDn+z10ZP+u1M6MCqrsHDpmCSAriotodITg5xKvsuo/g6o?=
 =?us-ascii?Q?Y5p63dX2asIvsfS0p5ufTIHWwyhBfWlr4HnmTC1oZ/ohMfQVUdk+D+UzBu+I?=
 =?us-ascii?Q?tMzCFfWsQh6o9KN2o8EZP/Fw+zORcpiEH4PnPUVqv7woNSWgyCFc6fqjbWfd?=
 =?us-ascii?Q?5+G/vr79gc8lPmw4qwQ/ae6/kCx8mb+cqVS85fpxjqlcGOEMzwZ1FLojMDhh?=
 =?us-ascii?Q?6ekwCpmvZddxTADMKh2Pbmo09Imk61IHlHOiEg90+f8/Oqgv4bTL9Dqv9+1o?=
 =?us-ascii?Q?GX+hvptvCaYDssyJEX89kyMwpGplKqwErf53Srf1OToQ1fIM7WqVKV4eP+D0?=
 =?us-ascii?Q?lIQCBn0rGbiqcqN/JkYyodQ5auzsZ+l+drYpx9D32S/d8uqA07LcmWU+ii3s?=
 =?us-ascii?Q?tIbU6Fx5e1213QaJpxZG+0t52OeIiETFVfEYUP010rel4z34J6MGTRfUP+I6?=
 =?us-ascii?Q?5pSnQnfqlzH3lOYErYptlfUXLyXOmd10Gegq7BtS0i411LiQ6TkZMIGTNCsj?=
 =?us-ascii?Q?TVP0efG6g8V5V38RbElWNBx82d3hOHkyd66m0s2P+yvMYzcm8DS6mSRUO7+d?=
 =?us-ascii?Q?QOykpoagknxMcK9jcGSJJQN0kgSXeHvUFGyCHp71OFqo8oA8KehbYK8pROMs?=
 =?us-ascii?Q?15pvR4cgAzAugulmO0f+uJ8KS5+Ee9D0BSoVaoFcyFK8NSJmnsF69BkbyVzM?=
 =?us-ascii?Q?OQs1AD7/VxYepLeJdRsbjTUTkB85DtbuYuF+qGOKQrp7WnV99JjZ1vnuBb2b?=
 =?us-ascii?Q?6WpoBeXBTFf73JA3uPD7SdpkQV8tX612jYpxCR/e4zUJzU77BALU4FsW9tuI?=
 =?us-ascii?Q?q+ZCoVWm/krazu77TEUR3uWgpaR4AG+vMerTrpw9Tz3Nq8dTEiK8OItPTXNh?=
 =?us-ascii?Q?F0xrI7UtxQ/PlUgXl/RU70m8g98XL6oeDLoXSCbmtm5ZeO/eTZqt3x8N5K22?=
 =?us-ascii?Q?xd2yqhJ2ZdjMnyqCUzHVxpygZ4nti+fGnpPO7bHXe1rZGOKHIZEe1H5lfCfh?=
 =?us-ascii?Q?SRd9e+ycmBusmbA1PSYyV0MH4T+OBdMgZ2gNNSsQWNso2aog01BVRAmccL83?=
 =?us-ascii?Q?0hOQ4rKPK3QAbmVqKDS46ISrSQxiUv7VkGdEqSwfEMhaOFVe88LYLpBECcAs?=
 =?us-ascii?Q?8y0QlLkxTMhbPheDgw5Tqv0VBrBAY9X/FTjaUSPL5l3d+UdOT36/4NWCmruW?=
 =?us-ascii?Q?VC4s0rfB5tt8nwlfqiHyWSS5zgBNyFJDlI3rlpEPb+Ef2Z6TxQX38o0cYQ9W?=
 =?us-ascii?Q?kB8YwRpkPtwwRBERfHg8SLY8waGOUATbSgFwWEhbxGEhrIIE9N+xW+fsZBHd?=
 =?us-ascii?Q?kLU0U88JezeG14y3oHFjjZFiHiX5K+bnOe6+Dz1blMhcKsAjYqnXvxybMm47?=
 =?us-ascii?Q?XOvpGItc/vjx+QlpV1QeNrA9DcDrp0s74/+PRQcoRitVukN7LRf1iP6cYjDz?=
 =?us-ascii?Q?ThBO/jrNPVy3NHZLv5WOJ/sMLriPP+fN2PrCggI6HKEGDzgKaqwXGiRuVP6U?=
 =?us-ascii?Q?yWJMXl2EMs3G+KwxXDsE/Pk2ZmWRQM1iMZ7sJmurekj4kki2cHWTgHTDGqZM?=
 =?us-ascii?Q?mFQqUnCJl3RTYT4LpEdgY9HboZr1sql6Laa6zA4PJ1GOO4PiMsg5qSrjKLY8?=
 =?us-ascii?Q?PtKP0nDJBzjv4r44nbvNMds=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e66765-30fc-418a-a275-08ddf00e0339
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 02:01:53.2301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +OFiunIXeZApjuOxIyPczYIEW21DBFtnOlTfP3R4PWSmGFlof9ewCLLhu8lJgyRgee4HyDu8HpEbiZ5vhmI4+hN8jN30O8zzJCM64Zkpy+T83RQMateBvrUOB+65ha9W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8121

From: Hai Pham <hai.pham.ud@renesas.com>

Add the initial support for Renesas R8A7800 board code.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 87 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 6093d5f6e548..8b31cc70880d 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -182,3 +182,5 @@ dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
+
+dtb-$(CONFIG_ARCH_R8A78000) += r8a78000-ironhide.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
new file mode 100644
index 000000000000..de820a84172a
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the Ironhide board
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a78000.dtsi"
+
+/ {
+	model = "Renesas Ironhide board based on r8a78000";
+	compatible = "renesas,ironhide", "renesas,r8a78000";
+
+	aliases {
+		serial0 = &hscif0;
+	};
+
+	chosen {
+		bootargs = "maxcpus=1"; /* FIXME */
+		stdout-path = "serial0:1843200n8";
+	};
+
+	memory@60600000 {
+		device_type = "memory";
+		/* first 518MB is reserved for other purposes. */
+		reg = <0x0 0x60600000 0x0 0x5fa00000>;
+	};
+
+	memory@1080000000 {
+		device_type = "memory";
+		reg = <0x10 0x80000000 0x0 0x80000000>;
+	};
+
+	memory@1200000000 {
+		device_type = "memory";
+		reg = <0x12 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1400000000 {
+		device_type = "memory";
+		reg = <0x14 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1600000000 {
+		device_type = "memory";
+		reg = <0x16 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1800000000 {
+		device_type = "memory";
+		reg = <0x18 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1a00000000 {
+		device_type = "memory";
+		reg = <0x1a 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1c00000000 {
+		device_type = "memory";
+		reg = <0x1c 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1e00000000 {
+		device_type = "memory";
+		reg = <0x1e 0x00000000 0x1 0x00000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <16666666>;
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&hscif0 {
+	uart-has-rtscts;
+	/* Please use exclusively to the scif0 node */
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <26000000>;
+};
-- 
2.43.0


