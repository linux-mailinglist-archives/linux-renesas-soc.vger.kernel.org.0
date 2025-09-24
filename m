Return-Path: <linux-renesas-soc+bounces-22275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC26B982F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D4FE19C894B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E622145329;
	Wed, 24 Sep 2025 04:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="WoHSVhN+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EC0F9C0;
	Wed, 24 Sep 2025 04:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758687522; cv=fail; b=DxwCbCHrJaEsAQ3jzRdXQaz5wxMnvSU5Pq0F1VQ+GPc/3gTuIi3pf05r1FK6IvF2+T81p/HBzXLp2e4V13PxjtG2i4uNXp68E41RrXIiDhnIs13iyuwyWUmnAswU2z8cIM8DMRVAlpQ64iSnW5ofd9VqhNVYjGVcP28i1iha0xc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758687522; c=relaxed/simple;
	bh=srF/ZKZifkCVbYjYYmzFtlJFY1Etn3Z8+WFuqb7DXyI=;
	h=Message-ID:In-Reply-To:References:To:From:Subject:Content-Type:
	 Date:MIME-Version; b=bijL7eB/A0KFAGe48aP8oU3FyW/8SfYPYZt1lgTEqbD+03a8dgc+ZHQ3rU9MF8LGKcs6mc6UugLSn1g19fD1ANogHwDCgpbMQjb2HUt0HDRFY1ttJb5ka/gxoQvMWlR4EdYGIMH720j6zbhtWtjT4rBt/sssOwr4hql+LOLJo+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=WoHSVhN+; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCl45xus8JEeqN5DzJDBwDiD6x2WMsYVgDp7IUlBBPzlL3UWKwTdWoTLAIOiiQ052D11MsPbDke7DGLhdihdrZLwQgsQSlrKTyaaVi0xARFnJKcg5tcsp6tigEtmUAxBPZzhiCVz1FmVx5q7VvML3BD3fvx3KUTVHq1YWDYhzgS3CVJnnphimb/8PLyOzhYgsQQBgMCUEGpKeeoZw3uKNdRzwj9arDlpelWl2h1L59UfyA2GK45qXNiFAzUPZDOPrKn6wUiNXdGU5wyR1PVX0f7XHpsYYw4isTHBIGFrgsbnCiEl3m4SrVo/zaXBD5ckYdH/Eenn4gfuYwdQYYDBpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ox4AO5tvnzYxFW3repoY4DGpHX6Kr6bOt+ns6TjfCLk=;
 b=ZbPabMXl2Hnl4Cb8ZHsZ3aEO93WixCDrISheH9il3Bo61ewQ3VjRbkgRY6Dkribp/sMJXzddJA/ObuyK9oZGrXv903m0OmhepzGCsjDV0YNWt+UZGI+LfuRfom1qRQKSiaV7jmoTNSZNPivu8XEEmfLcwVD7f48h6OdBBHQIqZW11IiDN1U2E7lr2TSWGlYMHIN0VbimS9khYsuoSfjkfHv00WYfi/BNGtCdY+Hbov/YYaxdT3B+YiJ+lAq5+JblI86PJBlI53fnbd2mPfLcSLclcXrYzlqRmUoC2jAsWc0glIXaavm4Ke1QKQSRgpsU0m0uh3MXyroZV63TuvQ1ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox4AO5tvnzYxFW3repoY4DGpHX6Kr6bOt+ns6TjfCLk=;
 b=WoHSVhN+fAxhsk8ruO9juCm3A2NaAtAMGGaTgr5IyChl29r3aiPrRNfva+lMhcMEpPScaIUPW6vE/vWxIQEEg+GyFREY5Z8bqf2PRYwaGEXCbPKx3LRhI2Yy1w1VQPvHkWvtkNu/NiRSJXB6vERilKU0LjrepaCn9OKbFsqE7Co=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB13055.jpnprd01.prod.outlook.com
 (2603:1096:405:1c6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:18:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:18:36 +0000
Message-ID: <87frcca3fn.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h5wsa3h5.wl-kuninori.morimoto.gx@renesas.com>
References: <87h5wsa3h5.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 1/2] arm64: dts: renesas: Add R8A78000 X5H DTs
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:18:36 +0000
X-ClientProxiedBy: TYCP286CA0188.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB13055:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b932c4a-50ac-4c15-632e-08ddfb216eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?03DSMAYhotGXluJsS2CSRg46JIX39eknClpC4J9EulmQKxW1qk7lT3bBHPta?=
 =?us-ascii?Q?zanJEuEXI6ShDa0C+XsJsjGxjCWOEfjkHJsAGnMABoP5Zno89Iup/g2Tv7hY?=
 =?us-ascii?Q?HE55jKZjowV6OQi14IZXQceeYDCPSb9Me/jeWwjlmlwZyP/QISX8A31ykrlv?=
 =?us-ascii?Q?j1sXrSLU/dQwnh7+Lmw+Mtkk0G+e0mlRCyGYR2Vi0o9VQ2h2HrReMWn81paE?=
 =?us-ascii?Q?OfBEjLBZZkOrGMpGPf8X9H0kVn3n5alW8uDVxGdvj/fD1IC3jC8MCzDgtiJ3?=
 =?us-ascii?Q?tbl9s3HYwUTwe/sUvtZshhoKucELsOlui0JKBDZNKdmHbBTVspjMEjLAhSLu?=
 =?us-ascii?Q?CbyDEPOLd1DHOlsXh1vrLRlZmQ7E0QfPUpsLHagCQHck6NAqj7VPanLerqfm?=
 =?us-ascii?Q?qk7VzzgLG4aY07j9fIo5SfeaXX4R67YcuKAs3Zu0Vv3yBQwlWJNQ5Vq5SL0S?=
 =?us-ascii?Q?MNgVg3SOfuszBtziB7zeMZraRdDUZIWxB7IpxkOJPAcelIhFFSOOJUX9IYoa?=
 =?us-ascii?Q?G4+7qWnZ0EaLiYslfPXYCaoKKm62pNC+PcNN0MaF9sEaFyEJXTfbiQZ2qgaV?=
 =?us-ascii?Q?06QgFTW3ahWVE2kuOtY390JlztKyhIMRO4qOzGO8hSQw9aLRoncy6uJXE74Z?=
 =?us-ascii?Q?lxU7MXl+jDYpk5PPiuWQ5WZjk7EDOPZxwC9fjjGdkSStrBAg8YZ6vts5LtJp?=
 =?us-ascii?Q?Te6r8Iw9Lm44zMp6q5wprzZZuOZ5QjHcOyk+DZuPzGd7uaJ/UDa8a5Ik1mUf?=
 =?us-ascii?Q?xmCHLZ4ucTC4UgkcqwRBjyPpoEm11RjhboiTnKkYk4/zpjCytIHb+w1zkSoj?=
 =?us-ascii?Q?+5cdx5jdsWQwkX1t+m1Ke0vOQwfiJDXzT4jvs1fMDqGzH/7D98u+4p+N8Efe?=
 =?us-ascii?Q?/dKJkfMbPOymXRTI4jAJBPmYafZaT42Yj5tbq4tZHBCtAMC5T4oOLykxjy0J?=
 =?us-ascii?Q?bJFfiTSqqUWmgxBtCyMtbEnJoHClXsTuk/155h6EU+fZeD+k6mQiACuIyknj?=
 =?us-ascii?Q?5+5U7tPjkdook79v035BDR3RhHDDYjTMGhNxeU77ldOXfA8b+Z3DJsMx9isK?=
 =?us-ascii?Q?FQ4FpG4G0weTZCJOgpU47B07yVnNY9INEUv7t8YXo3F+H3oE5GlPki9sljIe?=
 =?us-ascii?Q?iCx6b1YJk2zIoZlbClJsa/trcb0jkXp7xvylGtobBQeWjbOYoavX2wuGRXC9?=
 =?us-ascii?Q?6UCdrQVomDDLRCk7Ly0R6YDKDj7RWgnO2tCZZ9SbO5s6bYIVgX1hrXGOC7RT?=
 =?us-ascii?Q?vA8WRm33roO4qUSesyzo9w7TKe/nXEoU/UZ0DZFx5Bdx83G7QEocpBaKK9om?=
 =?us-ascii?Q?vmUtW38LVJTQD8DrfQCzNOizY+ZzegiW2w3RV+wZylMtLt6rgXxlWoBdQtXv?=
 =?us-ascii?Q?elSekotucUHLFs/Qokrbnf+MqjCY/x732BeV6NMkxR0MLNTeXxh+YHd3BrUA?=
 =?us-ascii?Q?taGX6IU/6tlZ8g2Gd+OGZqWeiAlnlDaCe0TctJGeRWLk4uTsTIrg751u8Vpc?=
 =?us-ascii?Q?L0i4PlS9mqNqeS4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KUZlsidHqc4FUF3t3xBdd3fPResXjAOmGWwwcvcsCX7by0zvp3w5abAZFqnx?=
 =?us-ascii?Q?6RZopaz6E99izGyE+nFopdhOnFGXzQaBmcMdKmltG01k0oARzskQH7HXTxtS?=
 =?us-ascii?Q?QHbBDpjslo2tmJa0F+PKihCdDWawznv/Fu3xB6+0mInm6g+3UefA44Rry0SH?=
 =?us-ascii?Q?MOVZRZFeh+q4X9kQ4q8htPhIuKZheYXcImnpfSfWRlRCrCQ+5WyO0HuBxW6G?=
 =?us-ascii?Q?k3NA3qiTcekHxUMdBYrIhMdBRsnqM+uxlySs4Kutm6zMu89yrFVUg1uAmPCl?=
 =?us-ascii?Q?Cp3C0uKAZw3Sz3LPZrIk3HTftBJQG1WRSl1UYmbzpntWFILBebzjjNUBXChO?=
 =?us-ascii?Q?L3hkjGGafjkT6nlGYsL6yyEdH9r4dKK45lt7KlnjRPB8142D+SUhwrCFHTVC?=
 =?us-ascii?Q?M0r5Srkm3dKx9QaX8cGsV2jMlYv0tDzGlGrABdwOhsv/5IGtj0rvj6aMbOUO?=
 =?us-ascii?Q?oDD3y4WkcYnEyLgemjcM1J4glRySAs7qRgwe+TrRVuoKRJmHwpI15x7Znpm+?=
 =?us-ascii?Q?36FHlMplq5g6pBedQkh1hI9VNMcgnAIGLnIiMNy2jgHYiZhAqAGTQHf+uE7+?=
 =?us-ascii?Q?Gm5LDq18j4BWLykTQHcjcQCXBrKHx1mIi4TFWj55B1cUXh0i7V0/D7qqxg9Z?=
 =?us-ascii?Q?Oa5+3nJVfbUabaQPHGYMfLEY/RKRA/xTlN0/8gR1qRVvr7WVuQczppN5wqE0?=
 =?us-ascii?Q?eS7zrkOKbGve5C6/WtrCDx0vMRV/BFsMrA6uNEtbqyoswzqmlz+9BLTM4RlP?=
 =?us-ascii?Q?5ajZgwRCeojgNIIXChKH9NYR5sLddDTu/4TJUzaSEt4IpzSqJz1lq30IARxW?=
 =?us-ascii?Q?3fT2SVgPnEPklZz/tr7W3mfqPstZSCmHdiPCisOTIzwYdexij3gTuWWMQ6hh?=
 =?us-ascii?Q?rdhSgLmJsoJGBFAsRAHVqewOW0yA6gLHiJ/WlvwNX9y6536Gfmtvcjrl099r?=
 =?us-ascii?Q?n1/Q7Npvw69LbvjpfvNnPoU2A8aJlDLQFs1nVnR+UDfZ/V/NvV0D7yVSP/A6?=
 =?us-ascii?Q?0oBdWjKUwe5vwlD18sjSbX2JsOgnMFfjo534wrtp+xqib7CdTiSCAO4FgGAi?=
 =?us-ascii?Q?vck7Jr2yj3Hr89qlrlRiDWRZDooUEjrXbzjvnGdgOk18+N4kb4p+EwUvTciL?=
 =?us-ascii?Q?g5JjrMt/EHjUv0w+IoDiu/K+O+fJ+YDK+dEZrUQbiCCj7/7pFfnoI/1yS1RQ?=
 =?us-ascii?Q?BZlllDAw/Vdlv+WzfTSmSBjfCe769GY7L7jvjZJiE0qCbWd3YQAj/hYyDAYI?=
 =?us-ascii?Q?S4sfhkXyjGJ8zqlOxGDYb8WyMbaOYPgJE3cI+5Y2fXYgnE9f8v2AOPjBkP0T?=
 =?us-ascii?Q?K8vPgvMIX7lnmL8VtWmB+M+qXsmeZLzitHGCJNVD3vKOMrBT+7u9GqlVVH5y?=
 =?us-ascii?Q?3sztPFRcI3A5lfyLusBzkGACCRGSpEcY3RbTWsJIt8M1wi342Iw/KyMcuz0s?=
 =?us-ascii?Q?HVM9bYdgqyOHmP3KwSOs9I0vMQidPaopjdzIONRjJnnK44bASeEX2H573PVF?=
 =?us-ascii?Q?i/NusMkVioFFBEEX0fe0tLFU1O7TZRtGZrWNCm6qIzfh0E5OQ9wslE8hEAwT?=
 =?us-ascii?Q?ry3M3wnespp8YCA+EbBUZ8H6VdAWrQ3DyIHMdKdmGDKwnyBoYOcipYXAMqGi?=
 =?us-ascii?Q?Nx+yJCwMQA1cKMCu/dbL8g4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b932c4a-50ac-4c15-632e-08ddfb216eb9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:18:36.8111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vDWOOjn9tdi+WDsVVV7jXbMc/NnJXKtkLReReB1bRrb2Q0PjCgucuyzfT5LPF7n7tcB+uAYDeevSWAbJXMggtkavR24vddLv4yzYeA3TX+w8sJKktqa9QebtPIVGl3M9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13055

From: Hai Pham <hai.pham.ud@renesas.com>

Add initial DT support for R8A78000 (R-Car X5H) SoC.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Signed-off-by: Minh Le <minh.le.aj@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 787 ++++++++++++++++++++++
 1 file changed, 787 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
new file mode 100644
index 000000000000..4c97298fa763
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -0,0 +1,787 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car X5H (R8A78000) SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "renesas,r8a78000";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&a720_0>;
+				};
+				core1 {
+					cpu = <&a720_1>;
+				};
+				core2 {
+					cpu = <&a720_2>;
+				};
+				core3 {
+					cpu = <&a720_3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&a720_4>;
+				};
+				core1 {
+					cpu = <&a720_5>;
+				};
+				core2 {
+					cpu = <&a720_6>;
+				};
+				core3 {
+					cpu = <&a720_7>;
+				};
+			};
+
+			cluster2 {
+				core0 {
+					cpu = <&a720_8>;
+				};
+				core1 {
+					cpu = <&a720_9>;
+				};
+				core2 {
+					cpu = <&a720_10>;
+				};
+				core3 {
+					cpu = <&a720_11>;
+				};
+			};
+
+			cluster3 {
+				core0 {
+					cpu = <&a720_12>;
+				};
+				core1 {
+					cpu = <&a720_13>;
+				};
+				core2 {
+					cpu = <&a720_14>;
+				};
+				core3 {
+					cpu = <&a720_15>;
+				};
+			};
+
+			cluster4 {
+				core0 {
+					cpu = <&a720_16>;
+				};
+				core1 {
+					cpu = <&a720_17>;
+				};
+				core2 {
+					cpu = <&a720_18>;
+				};
+				core3 {
+					cpu = <&a720_19>;
+				};
+			};
+
+			cluster5 {
+				core0 {
+					cpu = <&a720_20>;
+				};
+				core1 {
+					cpu = <&a720_21>;
+				};
+				core2 {
+					cpu = <&a720_22>;
+				};
+				core3 {
+					cpu = <&a720_23>;
+				};
+			};
+
+			cluster6 {
+				core0 {
+					cpu = <&a720_24>;
+				};
+				core1 {
+					cpu = <&a720_25>;
+				};
+				core2 {
+					cpu = <&a720_26>;
+				};
+				core3 {
+					cpu = <&a720_27>;
+				};
+			};
+
+			cluster7 {
+				core0 {
+					cpu = <&a720_28>;
+				};
+				core1 {
+					cpu = <&a720_29>;
+				};
+				core2 {
+					cpu = <&a720_30>;
+				};
+				core3 {
+					cpu = <&a720_31>;
+				};
+			};
+		};
+
+		a720_0: cpu@0 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x0>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_0>;
+		};
+
+		a720_1: cpu@100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_1>;
+		};
+
+		a720_2: cpu@200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_2>;
+		};
+
+		a720_3: cpu@300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_3>;
+		};
+
+		a720_4: cpu@10000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x10000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_4>;
+		};
+
+		a720_5: cpu@10100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x10100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_5>;
+		};
+
+		a720_6: cpu@10200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x10200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_6>;
+		};
+
+		a720_7: cpu@10300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x10300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_7>;
+		};
+
+		a720_8: cpu@20000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x20000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_8>;
+		};
+
+		a720_9: cpu@20100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x20100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_9>;
+		};
+
+		a720_10: cpu@20200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x20200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_10>;
+		};
+
+		a720_11: cpu@20300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x20300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_11>;
+		};
+
+		a720_12: cpu@30000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x30000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_12>;
+		};
+
+		a720_13: cpu@30100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x30100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_13>;
+		};
+
+		a720_14: cpu@30200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x30200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_14>;
+		};
+
+		a720_15: cpu@30300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x30300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_15>;
+		};
+
+		a720_16: cpu@40000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x40000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_16>;
+		};
+
+		a720_17: cpu@40100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x40100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_17>;
+		};
+
+		a720_18: cpu@40200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x40200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_18>;
+		};
+
+		a720_19: cpu@40300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x40300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_19>;
+		};
+
+		a720_20: cpu@50000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x50000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_20>;
+		};
+
+		a720_21: cpu@50100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x50100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_21>;
+		};
+
+		a720_22: cpu@50200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x50200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_22>;
+		};
+
+		a720_23: cpu@50300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x50300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_23>;
+		};
+
+		a720_24: cpu@60000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x60000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_24>;
+		};
+
+		a720_25: cpu@60100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x60100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_25>;
+		};
+
+		a720_26: cpu@60200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x60200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_26>;
+		};
+
+		a720_27: cpu@60300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x60300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_27>;
+		};
+
+		a720_28: cpu@70000 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x70000>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_28>;
+		};
+
+		a720_29: cpu@70100 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x70100>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_29>;
+		};
+
+		a720_30: cpu@70200 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x70200>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_30>;
+		};
+
+		a720_31: cpu@70300 {
+			compatible = "arm,cortex-a720ae";
+			reg = <0x0 0x70300>;
+			device_type = "cpu";
+			next-level-cache = <&L2_CA720_31>;
+		};
+
+		L2_CA720_0: cache-controller-200 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_0>;
+		};
+
+		L2_CA720_1: cache-controller-201 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_0>;
+		};
+
+		L2_CA720_2: cache-controller-202 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_0>;
+		};
+
+		L2_CA720_3: cache-controller-203 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_0>;
+		};
+
+		L2_CA720_4: cache-controller-204 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_1>;
+		};
+
+		L2_CA720_5: cache-controller-205 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_1>;
+		};
+
+		L2_CA720_6: cache-controller-206 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_1>;
+		};
+
+		L2_CA720_7: cache-controller-207 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_1>;
+		};
+
+		L2_CA720_8: cache-controller-208 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_2>;
+		};
+
+		L2_CA720_9: cache-controller-209 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_2>;
+		};
+
+		L2_CA720_10: cache-controller-210 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_2>;
+		};
+
+		L2_CA720_11: cache-controller-211 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_2>;
+		};
+
+		L2_CA720_12: cache-controller-212 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_3>;
+		};
+
+		L2_CA720_13: cache-controller-213 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_3>;
+		};
+
+		L2_CA720_14: cache-controller-214 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_3>;
+		};
+
+		L2_CA720_15: cache-controller-215 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_3>;
+		};
+
+		L2_CA720_16: cache-controller-216 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_4>;
+		};
+
+		L2_CA720_17: cache-controller-217 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_4>;
+		};
+
+		L2_CA720_18: cache-controller-218 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_4>;
+		};
+
+		L2_CA720_19: cache-controller-219 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_4>;
+		};
+
+		L2_CA720_20: cache-controller-220 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_5>;
+		};
+
+		L2_CA720_21: cache-controller-221 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_5>;
+		};
+
+		L2_CA720_22: cache-controller-222 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_5>;
+		};
+
+		L2_CA720_23: cache-controller-223 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_5>;
+		};
+
+		L2_CA720_24: cache-controller-224 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_6>;
+		};
+
+		L2_CA720_25: cache-controller-225 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_6>;
+		};
+
+		L2_CA720_26: cache-controller-226 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_6>;
+		};
+
+		L2_CA720_27: cache-controller-227 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_6>;
+		};
+
+		L2_CA720_28: cache-controller-228 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_7>;
+		};
+
+		L2_CA720_29: cache-controller-229 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_7>;
+		};
+
+		L2_CA720_30: cache-controller-230 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_7>;
+		};
+
+		L2_CA720_31: cache-controller-231 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <2>;
+			next-level-cache = <&L3_CA720_7>;
+		};
+
+		L3_CA720_0: cache-controller-30 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_1: cache-controller-31 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_2: cache-controller-32 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_3: cache-controller-33 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_4: cache-controller-34 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_5: cache-controller-35 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_6: cache-controller-36 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_7: cache-controller-37 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+	};
+
+	/*
+	 * In the early phase, there is no clock control support,
+	 * so assume that the clocks are enabled by default.
+	 * Therefore, dummy clocks are used.
+	 */
+	dummy_clk_sgasyncd16: dummy-clk-sgasyncd16 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <66666000>;
+	};
+
+	dummy_clk_sgasyncd4: dummy-clk-sgasyncd4 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <266660000>;
+	};
+
+	extal_clk: extal-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* clock-frequency must be set on board */
+	};
+
+	extalr_clk: extalr-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* clock-frequency must be set on board */
+	};
+
+	/* External SCIF clock - to be overridden by boards that provide it */
+	scif_clk: scif-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>; /* optional */
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		prr: chipid@189e0044 {
+			compatible = "renesas,prr";
+			reg = <0 0x189e0044 0 4>;
+		};
+
+		/* Application Processors manage View-1 of a GIC-720AE */
+		gic: interrupt-controller@39000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0 0x39000000 0 0x10000>,
+			      <0 0x39080000 0 0x800000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		scif0: serial@c0700000 {
+			compatible = "renesas,scif-r8a78000",
+				     "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc0700000 0 0x40>;
+			interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif1: serial@c0704000 {
+			compatible = "renesas,scif-r8a78000",
+				     "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc0704000 0 0x40>;
+			interrupts = <GIC_SPI 4075 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif3: serial@c0708000 {
+			compatible = "renesas,scif-r8a78000",
+				     "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc0708000 0 0x40>;
+			interrupts = <GIC_SPI 4076 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif4: serial@c070c000 {
+			compatible = "renesas,scif-r8a78000",
+				     "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc070c000 0 0x40>;
+			interrupts = <GIC_SPI 4077 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd16>, <&dummy_clk_sgasyncd16>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif0: serial@c0710000 {
+			compatible = "renesas,hscif-r8a78000",
+				     "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc0710000 0 0x60>;
+			interrupts = <GIC_SPI 4078 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif1: serial@c0714000 {
+			compatible = "renesas,hscif-r8a78000",
+				     "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc0714000 0 0x60>;
+			interrupts = <GIC_SPI 4079 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif2: serial@c0718000 {
+			compatible = "renesas,hscif-r8a78000",
+				     "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc0718000 0 0x60>;
+			interrupts = <GIC_SPI 4080 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif3: serial@c071c000 {
+			compatible = "renesas,hscif-r8a78000",
+				     "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc071c000 0 0x60>;
+			interrupts = <GIC_SPI 4081 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
+	};
+};
-- 
2.43.0


