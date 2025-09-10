Return-Path: <linux-renesas-soc+bounces-21684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7FFB50AA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 04:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848FE1C60D27
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 02:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02DF61D5178;
	Wed, 10 Sep 2025 02:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="etx11bea"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26A1192B90;
	Wed, 10 Sep 2025 02:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757469714; cv=fail; b=RLOKXjIUu2l+tX7FGtCjW5dt9Z+hJLKEpcjimeiTlmx4VhHL52aX+43NtG6Wy9Ges79N86JjiS0WF6cApouDLL/HqBozgOsV3VgkQioG7xp0+LuWU0I7CP7Bttd5lFoSQzzvE9nW/hkjOW4//R3wnp7YR2fxjhtkT5TnK7danfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757469714; c=relaxed/simple;
	bh=SDeAd8PKh9icIBOS8U4HEf2/nT4EcR4Ou9Jc8gtpQQw=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=APKEPGtvD1GmYsTNY7oJDc3KANopBId93V3280hfwaNKuL9QB0xp0i6SQ7NAFjt/E2z3IMZ+NWoiAnsuP7d0JOAQsMPDhsGh5NZy/g0o09oxhqk+NuPT6xZR4DZwEBaDA2ZUHvRctYNus91bdzu2nedsbmOT+NxSXK3B3tPUA3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=etx11bea; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJROPJuop/piIROQlCgJGsKJ+SUKUCGC7Jno5K3umy/5pnAoxII/JPuEBNonSXZSxEhF2laTK+H42oSS45Rj35M0k1NesIu/Eod1giufKqOTAWRmEyK/ysjrDtFNrTD0S1mAHi7K5KV+7yrWpe1SXKW8H1aNJ5FCileYJ5mkZXXqZoXUuD2MzyMUyCFyjWI4OZPCsAWoRvbzVPpZBncpeeBPAwFSzCBMZ4g5f2xTP+QglXTX2UhCF/bSeqnah2RpknUuHwGy7xk+069G/bLTdnCTeaM5792LQS+2+nTDy5qhwOeSuVjzDIs29zZj2NH/4OLiDqUn5ipOxqz2hetQ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyKMHG4JZTaYfyxRKo+I0ULjND5sYCN9PJALlA9ZglM=;
 b=bw21g3CiFxXwyjFtdIeFDHFGpU1XYeunnIp5oVSdJzEvBFOME84J3Q0JaWNqw5w+TsKIHGrwd57DUFyUZMF3uXMy6CMgtZfDWuWyvj3mMXcOm2MK56DmuNJRXD+kC9v/3DZvLgC76iCrBZKCaTGmF9UMjUqqQhV6OXvu7uoBrc5uyf/N4jp+riDsGokdlmfpN0X06dqtmy0wLyPgSzFIVP874dEyxFDxvMv+aAQNu8FouFVnRJG952h5ly44B1bXWdPlFilEWt+6nlCVErncRYMQ15+PXGWScruQInPkLVR/fMYQg8SGvK+IjlS4BDa8ypTKEg80fAo01p7eFcLz/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyKMHG4JZTaYfyxRKo+I0ULjND5sYCN9PJALlA9ZglM=;
 b=etx11beaJaAk/fzgW2XaCS0GQUJIe3reTDuMHvMnUwV+xEQKc1mcjDuSWtH+GLQP7Vd0Sn5VyENKRPtSrN9YqsyfJlDVX2LbPa4mv3sDVhAaGvblI9gnMjqQgZNmSMBxYbYIg6N//5RpiV12t/FLd11gRwqj2IIRz9WVWftlLt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8282.jpnprd01.prod.outlook.com
 (2603:1096:400:165::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 02:01:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 02:01:48 +0000
Message-ID: <87jz27vzec.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 3/4] arm64: dts: renesas: Add R8A78000 X5H DTs
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
Date: Wed, 10 Sep 2025 02:01:47 +0000
X-ClientProxiedBy: TYCP286CA0284.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: b2192add-eb72-46b3-ef6b-08ddf00e003f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cBZ8DddfWN6eZg4jYVm8s0hbtPHra7b/4PrXP0G579wpM+bmZMmW4MyJoC1W?=
 =?us-ascii?Q?wFL2o4cy6QD5vMxmL1A+I5Rc0vJKDmuoTBB8KhNV6kXDm0UPMpwqsa/eQL4T?=
 =?us-ascii?Q?7+Q9zbx4EfrWRdxcwQsms0wd6oOK/F4A9Z+7v7RyYujVxC2Oc8t65iosOpEf?=
 =?us-ascii?Q?JUwhiNBfLWgFyiY/8lqYG09kHtlBi2ZlPyvvGOT7T9Yy3HiqkhnETgEyFcJU?=
 =?us-ascii?Q?kkFQTbfP7rJY1SAwzS1+lAWzdKMhYQIuI6sxyCG19IjD3ZV6h1Aqtvmbjv7F?=
 =?us-ascii?Q?1z/DCbgcPQD1W+1khwdnwmCbHVRcxoLq9Z0fxd84Twy/g/TDjZIPLvAc/qcQ?=
 =?us-ascii?Q?urE58Z8nfaQbY2Wa0S+OZ2P0pQpALZ95OlOlZo+kIgZel+funDNi+SFfEQsk?=
 =?us-ascii?Q?W6LVhzDvR89AyLNjZx54BoDuCWSyQ7VnU/jdDPTTZWKQGKMu0URJfs0EcOxl?=
 =?us-ascii?Q?auUl3ZzxpMJv2/GCCxTLiRZ5wMbLq5eXpWroaCSi3ESehufU84krAyhW3dmX?=
 =?us-ascii?Q?5vYygvvBdFhcTMtoeUvuMGRRzxK+JJgD7tH97dwEfdqt3hGJWVJaotBBt8Z5?=
 =?us-ascii?Q?oXYO2atJ8ZWK/BfnEm1g5LUMpAmBJNxhQqvLz2DzPgRVNyMCW3BWxx9k9z+t?=
 =?us-ascii?Q?9FMa/GPckFps66JbY3TpKoTTyE7s9KDcvzPo9AnP3VyWQmQoxM01r/gWJrNj?=
 =?us-ascii?Q?IPB3jveu+1ciyjqdo7SCY4gLKtGOyAQCFlFLivYE5r0EMFVEcUzwUcI84uSk?=
 =?us-ascii?Q?fS8/rNlpZPCq0StClJJoZA/aWps8u3W4uPysoW/PhASwgWR0SKPG0DGW/LDM?=
 =?us-ascii?Q?nCXR/CKmczrEjQS9QEMzPeBedqaG0Gy9d75vkr55+CqzwthNXrIQxA2vIzeb?=
 =?us-ascii?Q?gIu0ZdzFRCUVLVY6RPYc21c4tCrrZKtoN3Q2/yGa0xCDqFo2KSk0WBR5Z8Q9?=
 =?us-ascii?Q?jKPDtnlI6HSAUkHvKxs8826wRBheKNApUBrYovVMyxGPkddDoDcc1z0qy+Iy?=
 =?us-ascii?Q?POuwk+JUuNn1nk6WGDCo7V65JH6vBNZGDFSbGQ6Qt+wW1h9EgqlIXPDEvR06?=
 =?us-ascii?Q?ALYccJJKKAqJ2HsB8deXxRuVV2dWas0/rWwLNbE42TJuoVksI50rqEeHjUbG?=
 =?us-ascii?Q?YiBRPhCDsvaQKJNbebS5UBjrhQ2ZWkWuBeKiUaHa44t7+wyMpIp0FFbrQb9g?=
 =?us-ascii?Q?F6r0WXubTsKYgIb8smrhUxK7KR9l4Xml2NQOvAbCmHqZ35MsX/eQEB8kOKyu?=
 =?us-ascii?Q?4atgKZXHCD35DiI3DMv66C5Q0aIIMhJzsIWQjiuX9Jc/BdCwbDFGm8FEz3Ni?=
 =?us-ascii?Q?+bXDWMYqN+h9jTdrFh9T4NKA818BWZbnvaZyHbTTk3KyOtRuicTuI5QaxmFc?=
 =?us-ascii?Q?iaPK2H+tPLxN4iI9tlTTCLs1pb7TB//HNrWpvldrcG1geOEtgDTfNlegR9DC?=
 =?us-ascii?Q?nvUIOxJq1CIkVYg9R691hPHIhz0bL845tmhr6dOL2wD1e9t6/x0Xuw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Kx3XDepJHYLnq2cD4SboxvKaNWyMjhC/21DTXr1AhN1C2HumhO5Q6Wev1kAh?=
 =?us-ascii?Q?AnMsmvwqWSLmuo0uP+52U05gXJP5bON+jCByHxGRmnbfwZ4I5+I4sh8nAQfp?=
 =?us-ascii?Q?1JQc3tDmwbX9hCViRYEhAKTz7ZMVqE+IvXD7mNy+S2tYDAC6qHAmG7xv0MFS?=
 =?us-ascii?Q?pa3guqAcu4hbYbu53a8s8e6dGHK1ghH809sSOCZX5SN9VJ1+nvnTyPty2Q0T?=
 =?us-ascii?Q?X82Oi92cMvGXOmEku9+u6YZdCQFo/RyD2dy6Yz1HB10jCiE7FaC7gsNeqJ0D?=
 =?us-ascii?Q?GcljEg51RzIPUJ0I4tXxk53IXffAxS2FkzQFJuU4eSCdHmGqXSfar6bniKf0?=
 =?us-ascii?Q?MA8tiAtrpSopU56vYAalYYBqXkCZ+GVbKW5/b8dEEeIUZECVXqk2EacknXi9?=
 =?us-ascii?Q?DXmafEIca6Gecm5OgqZOFUWEYXFOS0OAVj9gPemGq2Sn+r0vBT289z5lUlUZ?=
 =?us-ascii?Q?20z9+1z0Vg/M71sWpuTnd5o2bImEI6rtKcubyMDAwZ5iVpmjtDKQ+rDdDYeQ?=
 =?us-ascii?Q?TDpqkAbBH4A61lWZKfbQ5AGGFql4wzUaUzOTPIfqtS9CplsIPh4+eOhX/Jus?=
 =?us-ascii?Q?gN0tuntjgfKyqU/+ubl/R9/FmkigHljemnUD5HDokBKYqEE7a1LOK6QJ7sLz?=
 =?us-ascii?Q?8N4AC4rcUurCIi4oHbuTOdsoC0gkYVdm/GjOCJI83GGZc06wBBfuJcmo53k5?=
 =?us-ascii?Q?n2KUzsfEsCTSL9oCYGeH6uZhSqZcCBAGG4Jw+zN7z2X9uTpiE3GRdtX+/HI0?=
 =?us-ascii?Q?6Qy9jNtHYgQjLmWJBBA7/syb11IKWGZLlhOB4Cs/jHvsIK8Y4OThy8sbdLAe?=
 =?us-ascii?Q?Nx8Hx/ZYmv4JBQmSZXHmsDtieG5GKhKxhOnCK2RjZgTPqFsEPzhLiM/CRfi6?=
 =?us-ascii?Q?s0qlDSHNuopLsx+zWL9uPShQnuJo/KaMA1ds1FUWrQae3DA8IllsMBJPY2cj?=
 =?us-ascii?Q?ChoKpIqzJj6Zmw9jwk1Y3+7mv9ewJKbMcpdF84knyF9wxURxJO6zBRa4Uh8w?=
 =?us-ascii?Q?fJKtCUAl++WKxoAQYGLdDompmpWS0UrEwf51h5Wb3OAdMbxew+j/cU/BxItS?=
 =?us-ascii?Q?UukvC5FrJBBNdbyeh8j/PS4fdxVQrLM7SnBJ88KbnobYWeULoQA+RSN5o/fh?=
 =?us-ascii?Q?y/rDNfb/uZTQDEY6OQfDrFnXDPMNr10BWfiZGj2WM2PYFsL1RA+8oJOJtUhH?=
 =?us-ascii?Q?efkcqNbeOLJpzhwvkNTlAxcDGmlZgFY/sj+cxfWiNRkAURS7hb53T2CXcWti?=
 =?us-ascii?Q?o+bJfUfBaBF0DLE1bJ6AO32FuSr1Al9aS6uYHRzyA9gDQTKDGQ4EHqP8uJrF?=
 =?us-ascii?Q?3c4CUx0E2ZOQI7lTaiE21I+cu2jro1rGpKlNlaT/ASJM6v0OsIc5bnvKjSdh?=
 =?us-ascii?Q?FeEsgP5wroiXYNUseob3LsuA3oTiETfY8UE4xgDGvgT9/6SKmO+ycuYMhSZJ?=
 =?us-ascii?Q?H0PVUUbTWMNHU/sT+DbeFvCFOCAqez5Mdggu0/bsKl6v6IGCcg7YXgbiNXKv?=
 =?us-ascii?Q?snwCq+u6zcyM2/9YR7WoXuYziyd5lIJ47Gj4NforIVrlApm7qKtewLtOyiaZ?=
 =?us-ascii?Q?Hti5HeOqmDbEeuEAkFw1Wbqc6eyWs11S3fmipKQxhadr2GcA8OEyK1CaStQ5?=
 =?us-ascii?Q?qZAGkwswZ7pQ14Di6rQ3h08=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2192add-eb72-46b3-ef6b-08ddf00e003f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 02:01:48.2181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJRyP6hfNUHaAOw/Hp1YL1HVsaDCj8Q9eSNGMaCE972APWWOPje0gW4tYfmMHAD4je5rpPYjzGeuBsQXgS8SCVdiAHuoZhoXA07N/CAnBez2lRU1B3R8Xp7AT8heCM2C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8282

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
 arch/arm64/boot/dts/renesas/r8a78000.dtsi | 1063 +++++++++++++++++++++
 1 file changed, 1063 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
new file mode 100644
index 000000000000..165c4e9fcf3b
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
@@ -0,0 +1,1063 @@
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
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x0>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_0>;
+			enable-method = "psci";
+
+			L1_CA720_0: controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_0>;
+			};
+
+			L2_CA720_0: controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_0>;
+			};
+		};
+
+		a720_1: cpu@100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_1>;
+			enable-method = "psci";
+
+			L1_CA720_1: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_1>;
+			};
+
+			L2_CA720_1: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_0>;
+			};
+		};
+
+		a720_2: cpu@200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_2>;
+			enable-method = "psci";
+
+			L1_CA720_2: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_2>;
+			};
+
+			L2_CA720_2: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_0>;
+			};
+		};
+
+		a720_3: cpu@300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_3>;
+			enable-method = "psci";
+
+			L1_CA720_3: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_3>;
+			};
+
+			L2_CA720_3: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_0>;
+			};
+		};
+
+		a720_4: cpu@10000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x10000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_4>;
+			enable-method = "psci";
+
+			L1_CA720_4: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_4>;
+			};
+
+			L2_CA720_4: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_1>;
+			};
+		};
+
+		a720_5: cpu@10100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x10100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_5>;
+			enable-method = "psci";
+
+			L1_CA720_5: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_5>;
+			};
+
+			L2_CA720_5: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_1>;
+			};
+		};
+
+		a720_6: cpu@10200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x10200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_6>;
+			enable-method = "psci";
+
+			L1_CA720_6: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_6>;
+			};
+
+			L2_CA720_6: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_1>;
+			};
+		};
+
+		a720_7: cpu@10300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x10300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_7>;
+			enable-method = "psci";
+
+			L1_CA720_7: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_7>;
+			};
+
+			L2_CA720_7: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_1>;
+			};
+		};
+
+		a720_8: cpu@20000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x20000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_8>;
+			enable-method = "psci";
+
+			L1_CA720_8: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_8>;
+			};
+
+			L2_CA720_8: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_2>;
+			};
+		};
+
+		a720_9: cpu@20100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x20100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_9>;
+			enable-method = "psci";
+
+			L1_CA720_9: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_9>;
+			};
+
+			L2_CA720_9: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_2>;
+			};
+		};
+
+		a720_10: cpu@20200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x20200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_10>;
+			enable-method = "psci";
+
+			L1_CA720_10: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_10>;
+			};
+
+			L2_CA720_10: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_2>;
+			};
+		};
+
+		a720_11: cpu@20300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x20300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_11>;
+			enable-method = "psci";
+
+			L1_CA720_11: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_11>;
+			};
+
+			L2_CA720_11: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_2>;
+			};
+		};
+
+		a720_12: cpu@30000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x30000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_12>;
+			enable-method = "psci";
+
+			L1_CA720_12: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_12>;
+			};
+
+			L2_CA720_12: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_3>;
+			};
+		};
+
+		a720_13: cpu@30100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x30100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_13>;
+			enable-method = "psci";
+
+			L1_CA720_13: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_13>;
+			};
+
+			L2_CA720_13: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_3>;
+			};
+		};
+
+		a720_14: cpu@30200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x30200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_14>;
+			enable-method = "psci";
+
+			L1_CA720_14: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_14>;
+			};
+
+			L2_CA720_14: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_3>;
+			};
+		};
+
+		a720_15: cpu@30300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x30300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_15>;
+			enable-method = "psci";
+
+			L1_CA720_15: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_15>;
+			};
+
+			L2_CA720_15: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_3>;
+			};
+		};
+
+		a720_16: cpu@40000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x40000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_16>;
+			enable-method = "psci";
+
+			L1_CA720_16: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_16>;
+			};
+
+			L2_CA720_16: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_4>;
+			};
+		};
+
+		a720_17: cpu@40100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x40100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_17>;
+			enable-method = "psci";
+
+			L1_CA720_17: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_17>;
+			};
+
+			L2_CA720_17: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_4>;
+			};
+		};
+
+		a720_18: cpu@40200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x40200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_18>;
+			enable-method = "psci";
+
+			L1_CA720_18: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_18>;
+			};
+
+			L2_CA720_18: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_4>;
+			};
+		};
+
+		a720_19: cpu@40300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x40300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_19>;
+			enable-method = "psci";
+
+			L1_CA720_19: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_19>;
+			};
+
+			L2_CA720_19: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_4>;
+			};
+		};
+
+		a720_20: cpu@50000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x50000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_20>;
+			enable-method = "psci";
+
+			L1_CA720_20: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_20>;
+			};
+
+			L2_CA720_20: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_5>;
+			};
+		};
+
+		a720_21: cpu@50100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x50100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_21>;
+			enable-method = "psci";
+
+			L1_CA720_21: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_21>;
+			};
+
+			L2_CA720_21: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_5>;
+			};
+		};
+
+		a720_22: cpu@50200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x50200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_22>;
+			enable-method = "psci";
+
+			L1_CA720_22: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_22>;
+			};
+
+			L2_CA720_22: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_5>;
+			};
+		};
+
+		a720_23: cpu@50300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x50300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_23>;
+			enable-method = "psci";
+
+			L1_CA720_23: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_23>;
+			};
+
+			L2_CA720_23: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_5>;
+			};
+		};
+
+		a720_24: cpu@60000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x60000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_24>;
+			enable-method = "psci";
+
+			L1_CA720_24: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_24>;
+			};
+
+			L2_CA720_24: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_6>;
+			};
+		};
+
+		a720_25: cpu@60100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x60100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_25>;
+			enable-method = "psci";
+
+			L1_CA720_25: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_25>;
+			};
+
+			L2_CA720_25: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_6>;
+			};
+		};
+
+		a720_26: cpu@60200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x60200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_26>;
+			enable-method = "psci";
+
+			L1_CA720_26: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_26>;
+			};
+
+			L2_CA720_26: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_6>;
+			};
+		};
+
+		a720_27: cpu@60300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x60300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_27>;
+			enable-method = "psci";
+
+			L1_CA720_27: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_27>;
+			};
+
+			L2_CA720_27: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_6>;
+			};
+		};
+
+		a720_28: cpu@70000 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x70000>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_28>;
+			enable-method = "psci";
+
+			L1_CA720_28: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_28>;
+			};
+
+			L2_CA720_28: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_7>;
+			};
+		};
+
+		a720_29: cpu@70100 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x70100>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_29>;
+			enable-method = "psci";
+
+			L1_CA720_29: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_29>;
+			};
+
+			L2_CA720_29: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_7>;
+			};
+		};
+
+		a720_30: cpu@70200 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x70200>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_30>;
+			enable-method = "psci";
+
+			L1_CA720_30: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_30>;
+			};
+
+			L2_CA720_30: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_7>;
+			};
+		};
+
+		a720_31: cpu@70300 {
+			compatible = "arm,cortex-a720";
+			reg = <0x0 0x70300>;
+			device_type = "cpu";
+			next-level-cache = <&L1_CA720_31>;
+			enable-method = "psci";
+
+			L1_CA720_31: cache-controller-0 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <1>;
+				next-level-cache = <&L2_CA720_31>;
+			};
+
+			L2_CA720_31: cache-controller-1 {
+				compatible = "cache";
+				cache-unified;
+				cache-level = <2>;
+				next-level-cache = <&L3_CA720_7>;
+			};
+		};
+
+		L3_CA720_0: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_1: cache-controller-1 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_2: cache-controller-2 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_3: cache-controller-3 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_4: cache-controller-4 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_5: cache-controller-5 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_6: cache-controller-6 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+
+		L3_CA720_7: cache-controller-7 {
+			compatible = "cache";
+			cache-unified;
+			cache-level = <3>;
+		};
+	};
+
+	extal_clk: clock-extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* clock-frequency must be set on board */
+	};
+
+	extalr_clk: clock-extalr {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* clock-frequency must be set on board */
+	};
+
+	/*
+	 * In the early phase, there is no clock control support,
+	 * so assume that the clocks are enabled by default.
+	 * Therefore, dummy clocks are used.
+	 */
+	dummy_clk_sgasyncd4: dummy-clk-sgasyncd4 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <266660000>;
+	};
+
+	/* External SCIF clock - to be overridden by boards that provide it */
+	scif_clk: clock-scif {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* clock-frequency must be set on board */
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		prr: chipid@189e0044 {
+			compatible = "renesas,prr";
+			reg = <0 0x189e0044 0 4>;
+		};
+
+		/* The Arm GIC-700AE - View 1 */
+		gic: interrupt-controller@39000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			redistributor-stride = <0x0 0x40000>;
+			#redistributor-regions = <32>;
+			reg = <0 0x39000000 0 0x20000>, // GICD
+			      <0 0x39080000 0 0x40000>, // GICR Core0
+			      <0 0x390C0000 0 0x40000>, // GICR Core1
+			      <0 0x39100000 0 0x40000>, // GICR Core2
+			      <0 0x39140000 0 0x40000>, // GICR Core3
+			      <0 0x39180000 0 0x40000>, // GICR Core4
+			      <0 0x391C0000 0 0x40000>, // GICR Core5
+			      <0 0x39200000 0 0x40000>, // GICR Core6
+			      <0 0x39240000 0 0x40000>, // GICR Core7
+			      <0 0x39280000 0 0x40000>, // GICR Core8
+			      <0 0x392C0000 0 0x40000>, // GICR Core9
+			      <0 0x39300000 0 0x40000>, // GICR Core10
+			      <0 0x39340000 0 0x40000>, // GICR Core11
+			      <0 0x39380000 0 0x40000>, // GICR Core12
+			      <0 0x393C0000 0 0x40000>, // GICR Core13
+			      <0 0x39400000 0 0x40000>, // GICR Core14
+			      <0 0x39440000 0 0x40000>, // GICR Core15
+			      <0 0x39480000 0 0x40000>, // GICR Core16
+			      <0 0x394C0000 0 0x40000>, // GICR Core17
+			      <0 0x39500000 0 0x40000>, // GICR Core18
+			      <0 0x39540000 0 0x40000>, // GICR Core19
+			      <0 0x39580000 0 0x40000>, // GICR Core20
+			      <0 0x395C0000 0 0x40000>, // GICR Core21
+			      <0 0x39600000 0 0x40000>, // GICR Core22
+			      <0 0x39640000 0 0x40000>, // GICR Core23
+			      <0 0x39680000 0 0x40000>, // GICR Core24
+			      <0 0x396C0000 0 0x40000>, // GICR Core25
+			      <0 0x39700000 0 0x40000>, // GICR Core26
+			      <0 0x39740000 0 0x40000>, // GICR Core27
+			      <0 0x39780000 0 0x40000>, // GICR Core28
+			      <0 0x397C0000 0 0x40000>, // GICR Core29
+			      <0 0x39800000 0 0x40000>, // GICR Core30
+			      <0 0x39840000 0 0x40000>; // GICR Core31
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		scif0: serial@c0700000 {
+			compatible = "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc0700000 0 0x40>;
+			interrupts = <GIC_SPI 4074 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif1: serial@c0704000 {
+			compatible = "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc0704000 0 0x40>;
+			interrupts = <GIC_SPI 4075 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif3: serial@c0708000 {
+			compatible = "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc0708000 0 0x40>;
+			interrupts = <GIC_SPI 4076 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		scif4: serial@c070c000 {
+			compatible = "renesas,rcar-gen5-scif", "renesas,scif";
+			reg = <0 0xc070c000 0 0x40>;
+			interrupts = <GIC_SPI 4077 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif0: serial@c0710000 {
+			compatible = "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc0710000 0 0x60>;
+			interrupts = <GIC_SPI 4078 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif1: serial@c0714000 {
+			compatible = "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc0714000 0 0x60>;
+			interrupts = <GIC_SPI 4079 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif2: serial@c0718000 {
+			compatible = "renesas,rcar-gen5-hscif", "renesas,hscif";
+			reg = <0 0xc0718000 0 0x60>;
+			interrupts = <GIC_SPI 4080 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&dummy_clk_sgasyncd4>, <&dummy_clk_sgasyncd4>, <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			status = "disabled";
+		};
+
+		hscif3: serial@c071c000 {
+			compatible = "renesas,rcar-gen5-hscif", "renesas,hscif";
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
+		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
+				  "hyp-virt";
+	};
+};
-- 
2.43.0


