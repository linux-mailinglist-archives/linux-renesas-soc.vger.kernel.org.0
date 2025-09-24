Return-Path: <linux-renesas-soc+bounces-22276-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDE5B982FE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3636419C8A5E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9135C230BDB;
	Wed, 24 Sep 2025 04:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TIYXfXLo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011053.outbound.protection.outlook.com [52.101.125.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E45922D7A9;
	Wed, 24 Sep 2025 04:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758687525; cv=fail; b=FJxzXp5ED8Uj8F6nGUEeK+TMfktI5949F/JRoqvWYYGyXjYubeGplm8uzHyosU9Ra4wd9tM7cSSRIyXgIcHZXv6upmL3lKM3eUpLy3sYUulBBGiwbJfghWgZsdHHriSnL4cPrwPUvC39Lxv5p9MYLtVeaAlT9sU+q2lzJt636Bo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758687525; c=relaxed/simple;
	bh=k03kZ0n5pQ4HiSwzjBpBJL8E2Te6xVuguWNCBPP8Zf0=;
	h=Message-ID:In-Reply-To:References:To:From:Subject:Content-Type:
	 Date:MIME-Version; b=Xf20tLemI4JAHj9S2kUwSS9j3GoWnPvfGTvhLvjljAjidQEaZazR4DmfOVGhxqyv14FEWWbReukvVuZOEacON/HovSy6rDlDFHSyTryYvwEdh8k6x7moXuDnFnC1LIq0lgNpsy/J+bL76SrIEQykIOIV6xyEYbcbJp0rvavtBkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TIYXfXLo; arc=fail smtp.client-ip=52.101.125.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0MbxSE5/DS38NXAeupsevLk56iBfrYNOiZez9/+mpQCfMlT9D5di8JmtQo7JsFWKVkz8GDdA4PUUWtd5ADvaQxca5ew5FC6uJ7IORXj98PP4UeoFIwqjRIhbO1slhMPJWRDXJYdf9T5SIfGHJ1TM4rSOF+RsW5pMcGhVfnXSSZtWzDCA8uW2TQlQO9lMzGXKyjqMLBCu8xUPXHUrRHDk6ttAmKTA91kjO51im0LuAx5vRAHwIb7VSfbtU7AVOWvfSMwSUkwTIf/GGjSq2yLzI+VcAUnyWCQWkrOAdPmirsAoSPZNgzNjWPjt+vwAj/SsQHmENdvauYN+ZER0Jk2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIY74JuJcDCi7+4XNUjrtm53CF/aKN5VKDZSn/sekkw=;
 b=HNybaQtMRPZTNZuiAe6YPOdaSo6dWnaic7C4DTwZiGJcypiWPWFPaXeZblTs/bCS+oBTWnmAzRpWdcrOrgVSK+hpntHngLd/msG3oWQHblBTxd7DOCAaHG0UNB1+uPIw73Zdo/WZgcAxzxZ9+P5ljLhJMR6XjYBiaGUV7oG5cpF+J5xczvw2vbubMMxc8oQfaigMkFLJvzu4ojF38/T9cmSAQfC/U5K1Lngjsk5c8BjlP6b8zX7arejH+1m6A0E6QSmWofcpKiGrkxaEPpQvHBobLuvzV480FH1YB2S0dDaY2s5TqmWVIcyD3BZ4Ob0I64j0QjOVXRLxIfYe3OSnag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIY74JuJcDCi7+4XNUjrtm53CF/aKN5VKDZSn/sekkw=;
 b=TIYXfXLotP0rrijvEhe5kN4MY6fuPC22S2xYlF7rVGjsTrBTt5UTSMc93pZAJdTzgQSH8rhQ9KLDTELHx39GThOVWsoJa9XmFSZ1ZTX2r4AEigThvturQk5G5HfMT4mRURgJ0wlxMlD6+Ux05fdhzoGXS2AbvkayOSfmalkaqBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB13055.jpnprd01.prod.outlook.com
 (2603:1096:405:1c6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:18:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:18:41 +0000
Message-ID: <87ecrwa3fj.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h5wsa3h5.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5wsa3h5.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 2/2] arm64: dts: renesas: R8A78000: Add initial Ironhide support
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:18:41 +0000
X-ClientProxiedBy: TYCP286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB13055:EE_
X-MS-Office365-Filtering-Correlation-Id: 8830a2ae-1931-40eb-655c-08ddfb217183
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WBIbcUDJdXFEBaCa2233xe6VcmhoHldvX2Mu1opu9pwv25BzJXh43LllQxq2?=
 =?us-ascii?Q?lWraXcbaWQyJqRsDZwNLveBrF34WGIGhGeaxH110Xso0HU5KFeNWzn0uVsuS?=
 =?us-ascii?Q?csldxjoWc3YPIr7lilUDsAbf4jjCj/jTmhVMivIUWuPl7Vma1tO9hWdj6pZJ?=
 =?us-ascii?Q?7+PSOQcxvbeRq5RhHFfB+N/WF0w2nsVc3fgziwD7NlHvJq0AZ+tHxvqjNhpB?=
 =?us-ascii?Q?gcE4PwOZKMBPEMoP5tABAVxE1038WHowqj6W7YDrBDHbPqAW4HuiiTD9PdOi?=
 =?us-ascii?Q?iDllB5j/uEHe9uexkLkVoGkuBcahocybrgfSLZFTrW1MAKe1vhgHxf5au+ov?=
 =?us-ascii?Q?7aKVG4WynqpxWRGvBei9R7OGSo1bO6B9/XPYNNdbpNvM8FlvsAaMZC2dOsQe?=
 =?us-ascii?Q?9M5jTVNXa34S4hrvqAkotHaXT0/zTh/fvpJDhpi+efuDpthG9mRIxwlc65ZZ?=
 =?us-ascii?Q?N+lSnGTFSMh1Hdy1iVY83A7IiRIoVQ2XH9IDsGIS04nASbUeHfG/X7Z/GL3Q?=
 =?us-ascii?Q?lsGXFCwp96Lsut9dlnZbRKr74zW+AY6CLzV2w/VcQKDHxtjYuiwqSjtK57y6?=
 =?us-ascii?Q?1Cb97V18eOQiwICKIjVGLSQzAyPwPab65FgjZ7erpBcQW+CKfI3o4HpS5R1q?=
 =?us-ascii?Q?EBdZ9m/lU8Ij4ugY9l0xJ+t6Qm8aDJb2Bs4l1nnP1AYWQTHbHNj8h+59rVS9?=
 =?us-ascii?Q?iJHycL7btY1bEX4ciLv6huxqogieyvtP0OwgyHebcEvfY3To58lSmQJZSm3P?=
 =?us-ascii?Q?8WkgBq8rW+7cTskEhT/QoWDH/FtywkJTUwzSsu1RWAcQTC33/BZuCqo8PoSN?=
 =?us-ascii?Q?IA6F1j1PnjDQa7aPMFekfCxkMB/0spk1dENHdXI9ZTrfxz/O84RERp9uGzEP?=
 =?us-ascii?Q?UIt97KdjMSKiBz4Lnrp/wVA4URkLNso5tUN54+bp6h4ESieYgQRU7SqTOEGt?=
 =?us-ascii?Q?DqcK/ab3WEs9J1nwhJ3KOWcT2OEzTDpa6pTl1gcsu9frBl19B2STxVazf+RI?=
 =?us-ascii?Q?HTqlCo6sD2gYbWQ4UOyvU1onUrBQvMxfMBT7PDgVyu9LbFyVPwmVhYkt/ArU?=
 =?us-ascii?Q?2xU5yiqK/zFaYagEwtq9xbJFH13fz+PQ+3BqojmnMp0iTzAp8waAv0A3weVy?=
 =?us-ascii?Q?2qFnZU0bZRUfF8TVTCQU14L+PaP1F5d2Oswb88ptq0/H/8MPrPEy09WqRgz+?=
 =?us-ascii?Q?WMs1aWelB/cCYMTe0qe+Ds0eOAwOxBNqtjUdgkCJJYw1d4Q3K0Zu4g14Zd7J?=
 =?us-ascii?Q?AkW42ROjwIgUFFeLwxiQi/xPodJQ7GKZQK1k3fDg4TpZSDYsGWYHhf0ecQXR?=
 =?us-ascii?Q?OIqaIoESbMi5oECbwe1OrThPD7pcDQFI81lMdXUvs8Fb5wqtbRIvsBNCCc83?=
 =?us-ascii?Q?R2h7+nhpEDd4ULC28kJ4o5P3eRim95MACdF+6GHPYaFrO2rNgoVGMToOCj4C?=
 =?us-ascii?Q?9/M08U4xc0DmtOfOzE8TKLA/H81BEjr8xfdu4SnjU41PturdM8v9i8z19Apf?=
 =?us-ascii?Q?5bDrPuUWC3WRuTM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oI6Ju0Olcv1tixcyLV7Vt/YrzaeVdk6PKOTKXkIaHpgTjokK15251Q5/Vrul?=
 =?us-ascii?Q?qkVB+ssGeCGapc1jH0LXiyqv91GX7QIKRy0zVL3QLz9ZspWT3AjZazU2wtml?=
 =?us-ascii?Q?X6/etDsnhKly4MvTyR3XPcPmPMuuckIwwTaeTbKVb7y9kiWdwdlVcTjD0nB1?=
 =?us-ascii?Q?DYrHkCITmWWeh3gVlxooyiQBdmx0ZHXsx5+H+JoALSqnNeovx/Kl+AYwi5Dg?=
 =?us-ascii?Q?qFTROvO5b3RmWta9esGCo55hY0u+SWwvCcoF5HyAIP9BEJMdiuFv9H1n+Hi6?=
 =?us-ascii?Q?nh+5/zcmqKlufDVCoKubGjojicvXFuVtdvZxXTqk897tFORafO1ZcB1bCedJ?=
 =?us-ascii?Q?AEEnisO2b3DsGiCCWkLQqybqyw6OENehaOJALVQnqdJFotTvXPjrE60DuNBu?=
 =?us-ascii?Q?Jz7Fdj7XfTUPMYO4RCLBMlJt1bMlb5WzYtff/4gGWDPzJ0xvb+QoaIIw4Lz0?=
 =?us-ascii?Q?Lv03EcJa1P3ZwH0Tpim0/hNhW7HfB2CrGJABNXskdiLbdOg/sIibVg4bvgzk?=
 =?us-ascii?Q?6/3vVVo7o3Z3KQcTU0tiL0mVatIL6m1LSJAneSihW9VW7ZhxUDAx2xg7Pox5?=
 =?us-ascii?Q?8HylMBn8RS+e3LJaBOyscGtEIvHmpOyPbLaLLnWii4KblZNsXMDm+jSRWkhC?=
 =?us-ascii?Q?eHW/FRYew23fKCYNGDcM6EOhjECRwJqGPrpIvIDdJxeup5XhflyfS8SnbphX?=
 =?us-ascii?Q?nvwJmgTVO5Qfj6m2zu7/xG77o5HhEb7rERkddDMg2wynu3l1ASViprIRYqb4?=
 =?us-ascii?Q?q0WU7msvqPvfDjy4WVv+aWES/klnEF/QavRegyZK2IrcLat7sv3sxXl8EATA?=
 =?us-ascii?Q?jh+s3lVcsmMLQkGT9r/OMzCaDkZ05nyji/cUxgGuTJMe1WXX1jgz6Glyr/le?=
 =?us-ascii?Q?X976ttnH8nGPB9ZLedB72BHZXpSP5I6VXDufCAmf3VIfn91pzT+6vY7h1FfV?=
 =?us-ascii?Q?ndbc+jQZnIb1K5+RS5n0jle5orOq4Ewelr/wVk7D2vLivC5LG9A7Ge3r8c90?=
 =?us-ascii?Q?hJHki8EbdGMAHPdKAGmha7cCJirQ/ffmMAPu3KWGJImOlZ2+9V5QxGjubhEV?=
 =?us-ascii?Q?Rf6eZ0K09lN3bKf9jm4fEMeSCu3d4QYO7FrHK6G1rV1dUSeLwxWuIykhEH8E?=
 =?us-ascii?Q?ZxPqcWtb1AuHfVT/8Pw4JN9zgOefQ2NFRMHaNL9ugOxgQAvWPDi9j7gXvzzG?=
 =?us-ascii?Q?F7ip3AgJX9OxIRTVX9BEI3uT07xZ6xBpFBpcAApzCvXkTKz40ggVAT/E6dXQ?=
 =?us-ascii?Q?GiEFNa/cTdkWNRnuCYILUuDdTvKis1KKzTqtB9/xv+HRaxxO8c4HJLZUiEep?=
 =?us-ascii?Q?8txDwk5u0WC/dnwNbXUD7kwOGE/qp1q9dizKx2LcgKf9vldo0awUguBgKfH9?=
 =?us-ascii?Q?N/E9aA3rW5jOLvR7/1vhVSah/A1OG5vL6DQ3jZl65r+rI51fTs0am14ED7db?=
 =?us-ascii?Q?ggWVYAiA2UHqU8lAB20dYhn1Bc30Aq/WKSdPijxWb+k7T53hEeQiqSBxPQpr?=
 =?us-ascii?Q?IVXz6tsHYHMmi1VCfN7F/uKjNTQEFPfFNeJguydZE+Hn8laZV5EavjJuI5H1?=
 =?us-ascii?Q?DKfQP737/TU++yDFKNhfZXjgq8IYzKrX5Wnjw4QK+6mFwD4aSXUryoBD6huQ?=
 =?us-ascii?Q?CPHoJIIIJrCeXmEkGM5rTXc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8830a2ae-1931-40eb-655c-08ddfb217183
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:18:41.4798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8eK+mr4Hi+VDpYZ2SGnUM1ZqL2QmlYUMq+Op9N3AADDZKVjArgWBJ51w7cuDvAFKJCPL5WMqi5QX48embkkyI6it2ETdhav42eT3cjySAVps+WMn4STbPHl4gRraOwwy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13055

From: Hai Pham <hai.pham.ud@renesas.com>

Add the initial support for Renesas X5H Ironhide board.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 85 +++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index ccdf7aaeca13..dde046a3f25c 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -136,6 +136,8 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
 r8a779m5-salvator-xs-panel-aa104xd12-dtbs := r8a779m5-salvator-xs.dtb salvator-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs-panel-aa104xd12.dtb
 
+dtb-$(CONFIG_ARCH_R8A78000) += r8a78000-ironhide.dtb
+
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-du-adv7513.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
new file mode 100644
index 000000000000..a721734fbd5d
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -0,0 +1,85 @@
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
+		stdout-path = "serial0:1843200n8";
+	};
+
+	memory@60600000 {
+		device_type = "memory";
+		/* first 518MiB is reserved for other purposes. */
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
+	clock-frequency = <16666600>;
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&hscif0 {
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <26000000>;
+};
-- 
2.43.0


