Return-Path: <linux-renesas-soc+bounces-17111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C696AB7135
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 18:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C2471B670B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 16:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2591D27B4EE;
	Wed, 14 May 2025 16:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="W0d/Zvsp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0FD253933;
	Wed, 14 May 2025 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239904; cv=fail; b=SHAwUOh53Fclp8ZEzBp0xhG4Odgr3zueZH+004KH+obBxerU6qTVHgbLXxfaQBtSdHXKWOJM+UcG+lm/L99AyMbfOU/VNAcjEFScGzCAyx33BKjzJ6zn1V7K1nYr5n880H2JrD5ZBT3jrwqjEyW0qrRJLyTF7U3VH3OVJ7I/Pqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239904; c=relaxed/simple;
	bh=nK3yf60YtwNWQ4Ebak9UkmIgqhJbWybjnUA42lPlbE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a8KT3Mpu+VYoIwuUjpxBGs/49ZWK6wG4dv0VCkfyn79KjcL0R72nk6tMOPDhONHHteiF7M1twwmYBGFPv4RVB1mSwCVfUSfa3bUKyHxDLcvrnYlnUcju4CaH3tijEtlwZtkjy+eCzpKLM5BRBEeOcDD3tb6tivAiE9ydyoCNw+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=W0d/Zvsp; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbe99IRk3OooXQYMtMgUcR+Zpq1XpL4vCW65X6gAyO8zC2TCvjwNIL4PztRDSs115RguedCrzM+6s2iTL0vrpeutwOswZr03vu+GRsiSnQDiTQwJkRwZReW4MI7NWyEAevVpeK8f4m0R9FNUGyXrLzGiAhshB2wh7EVImDhT0YDPeaagxo+Ttk5y1QFEmuzJXEhAQBG58te4XNsnAmTAwlfxJ9wC4woNjxhniZlad9t7WuaItCzbXulqRDTPGjzEkKBsXPrDuQ8haHm69O9NIbgM1/+VOeBiMatcJImEmjb4bGNFeDZTpxtulb1BgGgyClWFk6alYMe/pXDQG0ritQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzCUrmRJ1cyCHKmvHgI3EhkGCDz2hkpxsg8psrULNhg=;
 b=pcBqHhXnIAt6FDHJPlp9t/aBXtdBjhzKSxpMzBj32SPqbCT0G/l56iVi/YObC+NBOFFKvDjmzvbUqGzw8bNBBKex8IDjjw+ApX4tlvW7lz+KdHrIU+myKGNTtgtzW6LDGWDH/TBGn8jD7xEnl40No3yycqymKpCJBc2Cf40D+TpRNy0esHp6zBjMIGKsYbj+kpoWRlRX5BOzPqLeNnSEpa9fM6B/rK8vPv1J2FeH+bekZJJTI6BcdoHL5sBiLwr9KYesp+RcNiEp8fxz/V0noYrRIg/5aj4IGiv5h8rtuWlp/8Ug7vxRy5YEJ/vxW1NRXmPOb1Mpt8Sronoa5qyVRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzCUrmRJ1cyCHKmvHgI3EhkGCDz2hkpxsg8psrULNhg=;
 b=W0d/ZvspNQTN8MxoH3V79X2hT0l7vj7vbuxmcEH6nRIiM6P/E2fKrXYCdRF6UH1FxWV54Iv2R9TvQwDKn+Elfnq0HgQGQqnnmJhCqMSR9yFdC7Fpq7LsVsV6lYm/sifa+Rqsleq7wloNXFKQeuWYSu+8VwZVG2bxQBRY5Us0Y5Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYWPR01MB10520.jpnprd01.prod.outlook.com (2603:1096:400:29f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 14 May
 2025 16:24:57 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8722.031; Wed, 14 May 2025
 16:24:57 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] arm64: dts: renesas: r9a09g047: Add CRU, CSI2 nodes
Date: Wed, 14 May 2025 18:24:17 +0200
Message-ID: <20250514162422.910114-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::8) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYWPR01MB10520:EE_
X-MS-Office365-Filtering-Correlation-Id: 6555e4f1-d008-4b08-728c-08dd9303ddd3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CUatOEKeJRmv1+zWYkyD2DWLkuj0BLJqgVzeWRJmapg4QPqwkqIHaTwRIJEg?=
 =?us-ascii?Q?SAshAsdHoqeH2KjgT+n7qXortlIb50fQI/0Xnf5u0ejQsXC59rgaSOn8sErI?=
 =?us-ascii?Q?N4KK+TMb03tB3RO6EKccR8KNl4g98b3A40ZVlbrfxHcx2OldD/3xJkW928ij?=
 =?us-ascii?Q?T34UO8YBARsooSzyWIQI7PNvq48cMotRYPbqWobL9baU5fiUohGgHolYGbjL?=
 =?us-ascii?Q?2CvtxX2w2lGjSbmFO1lzG0C09YbGbPeycorAmG8qZSsrCeZz31DytvKgWajL?=
 =?us-ascii?Q?RivXjECkyogLJFBtZW6lVY6ecOxMgBJXvejCRkOwBRKbPplhPaBdysabwGIp?=
 =?us-ascii?Q?HH7NJIqry118veD4XLkZXm1iyAT5Icp+OI6QqTuynv8mjBZ//UWq0RYYmcZ5?=
 =?us-ascii?Q?wNWC/noXvOFcttP+el8u8jnmsTctwk+GOtWUG2KzdgrAQguCNLiF3T9DLezq?=
 =?us-ascii?Q?qSgmZeDwVNWmIbBbkS/P+zAs+SJxI4hWgGwLw/6pg3sZ7i9+3/CvUbsBnibM?=
 =?us-ascii?Q?tJI49RC72mFVjxH/nCmXLrtE9z5EZJSf6iCOw1I09Gf6QZegPv53N5bw2CgL?=
 =?us-ascii?Q?PbXTKPMeOOPgr8ADy8quAwvWYFo8Fyrf8w1bv8Ge28F5r9F0GmrTrMLeVNiM?=
 =?us-ascii?Q?c6CIRxSxs/Bde1bVUbi18Uv1+SuueTLvfDAi0wONu7WlgRkCOd2FueUgAAjp?=
 =?us-ascii?Q?8TkIa0Pg9sX5N1KQja/PiMP6M9FYIfFO9aZ1pZSxLigw9WxIhy5Ec+0ISyfR?=
 =?us-ascii?Q?BuzcECTlILUTV4ZDY490hEhzDrm0oNUF3hZxuGjWnhoeJ0KcPHSpFjZAuN7y?=
 =?us-ascii?Q?7QcR+vRHWgk76OMPX7KSr1qY2BDl++3ZdjfhPF6HQLISWZex07C2FiQsZolD?=
 =?us-ascii?Q?yIXNGDAqVsMN4AZe2YqgdnGSZ/mdHGQIsWamYHHgIamVkzzkZyrX/+eVhqWm?=
 =?us-ascii?Q?5fRcY3EFFUR5jLocp1PxRh5O3l5AZDidbdAuuRZvEIgsgIj7vMFcxD7OYFhw?=
 =?us-ascii?Q?dyv8raXJteXK/lBe1SKjAvrbJSNS8gocIjTRuywP5MySwzK1EHYLrZIF25E7?=
 =?us-ascii?Q?eCKCM5Elq9Y8ARDT6xnz+6mlfRQYHWOXorZMk9QXvwKJvQKSGemTy5FWYgyV?=
 =?us-ascii?Q?eQzigKu6RdBzWo2ydcWzbHMY780O1e8owcH9YGxCL43uNdEjhWuyDo1sMgoq?=
 =?us-ascii?Q?lLylxBGT/tlscDA8pZ44wJ9G9M+VJ+PDx1ijPl0EtC8xe4u39uARzNh21kTt?=
 =?us-ascii?Q?5VBt+AgWKBlmC/RbBrnx6qE4rSWRhRptrRyonYz07ediYOkmgyiNY2Dkfznh?=
 =?us-ascii?Q?Q8fKjeO+HrTTRGlExBjmSnT+yMKoV/XFYgQ9NCSjdiG6mlm+QHJTDHTtU7Xw?=
 =?us-ascii?Q?l+JivmMtY+76YuyoyBCODrlTQq5WZLKK9h+viy3zM5lPyTbpphf8Az2fRpyQ?=
 =?us-ascii?Q?D5oc2UmA67SCGmm2Q4RPP+hEJT5bYB3RfOs4TJ5GCWE6Xy48Vo86wg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FVh0pjwjYiVvIocj/bZSz8qMvaxhApCq/sypsYC3kJa4n+XAMQZQaHKWavo8?=
 =?us-ascii?Q?gDVc7+fdll0iRBu2rexUWqkeLbptj8aO/FAMWQXGHYTKrWHbv021txMWDtIx?=
 =?us-ascii?Q?zruiuLM4HlrC2mxmrSA/KF+BjzBi1gxwIEDBIEQ45M44tGVN+j2AeAtWxlsg?=
 =?us-ascii?Q?97DBXd88nD8nobPSqAzSE6sW/ZPrypbdd9AyO/hatXzsNzmhmW2zw4OWi7vO?=
 =?us-ascii?Q?lKAaooF5m3AKgo4ug2RbCNfk6l9yYGcBswAyzMAhwcwN+/LgsYu2xRq4FNXh?=
 =?us-ascii?Q?Lzn+Ee9bHD005MG4arkOHbLeL2ZM1Qzb+EN86TJcjIVPnkUd++hgvPNnVwSN?=
 =?us-ascii?Q?bOwasdllqbUUdh++d9J7IiZMyHqCbDIKKPUzc2OSFzTY+zuA8MCdpcisfPMK?=
 =?us-ascii?Q?Ftb5nVGArg4Kns6ABne7EbjAPOySKyAVpVA7SICcrQQF7IGyc9RvnYIW/3O3?=
 =?us-ascii?Q?FVRtz/3mtGDvloetLYMPfK3FbO537eDR+8Q9HfmhAADzWcIg5g6Q1yd5uAYO?=
 =?us-ascii?Q?nqpC7v/FMCL1uQF4Ir5Z+SPIwYDubMdPw2075wZYhVl/YvplcSFyiFdwys9a?=
 =?us-ascii?Q?YESgewvQF+PidYqJ87REoiy2ApDNm8lEJE5HZEP3v/5ukVkZcDexn0K6P6bF?=
 =?us-ascii?Q?fZtPtjavAycdmcibNZYwXlBaIVM8Yu4Xu4UNOIZG8MS7zPuxeCBMpe1goown?=
 =?us-ascii?Q?L6MT0kgjCfuW+qN0rH1MOGpi8iB/0xlPnH/5wlEfOU3xsF7u2ZjsipM4Xg5c?=
 =?us-ascii?Q?unR1B/rkG+d2qCYfS+oewKu5t8yh5uhm2iRnUCDNASSYyjzeh6+fVMKkgwi+?=
 =?us-ascii?Q?lptlE3bBwrOvde+MFvC7vMmmASJ9URAWQFLxVJe3WCXlSxOE9ZQMie4VTjKy?=
 =?us-ascii?Q?dtPSfbq8gz/KsnH60iCchhzG6EPFXAdsZKkuBwwSeVFRT67RQL0+9Zj1A+Mp?=
 =?us-ascii?Q?1grV0IYLzUgbaNAQFU2Ltwk3ZJ3ReKx6nogC4LtkxA7lF6MG5NA1n6R7kXSi?=
 =?us-ascii?Q?VpthZCB8rtsVxTLxvWXcMhx92+63JGhtML6lS9NpLKzocSLxkqqwhRQYxm5F?=
 =?us-ascii?Q?CJri2O2KBkCxHJX1PD7T740IakFRyBoTsIoc/+qQ7qDLbqdsqZ2fnm1C/4vc?=
 =?us-ascii?Q?6rYRPoL3Rtv8TfFLGLXxNlZ9A1cIZvHuQ0uyPXEPSD6pAHcpGjAntCr7u8GB?=
 =?us-ascii?Q?H137XRqydFC0Rz7Mgl8NGGQrYkYlRx+WKIWD/MmBzaLPuBLT4xvei/yt70nD?=
 =?us-ascii?Q?AKZcaVh0aog4EqC5XJ9XByNAP7sXxMxdTsAEGA7MPPxL51GylHoSkfaHoiTS?=
 =?us-ascii?Q?FZCOFu5onA8bU1LtBKx4HjzpVS1y+IBiPXPg5ClhTWuRv6gIdrkiIsVcytud?=
 =?us-ascii?Q?uo4xx5HGY6RGAQszoK6TH0FENgjZHmMvkJ5Mjd0L3CU+iWKXVonjmZ+0VEqg?=
 =?us-ascii?Q?9T+4bi5Gs4hMnGcoXbmWp22B1l7dlf26LifVGMnQ/eIoBA7VkJ5IAnle1FpG?=
 =?us-ascii?Q?56pz3UlVemaM01aus4JHggtnp3aydg+gTV35fhT36jagMfRRYPU5E5K936HE?=
 =?us-ascii?Q?uMR45FJ9ufhVmr8xH+OS0zPBOY6ZyRkNL/GVVRmvzI1MjzTAMDdGm5nIa/Nm?=
 =?us-ascii?Q?aetXECmCH8lhE6c/AyJgxhM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6555e4f1-d008-4b08-728c-08dd9303ddd3
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 16:24:57.5713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGjZpZ4iDi6jEF4Ee3599soJDxdBklaQApsfdfMPAnOmmc6xaQ2tVKuMFMjPPcfMfKFpC0VUbvh890iGNn6zmH00r4CtcfDwRN5QVl3il8HUAQdL0bIZL4Ws25wut9si
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10520

Add CRU, CSI2 nodes to RZ/RZG3E SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 876f70fed433..7e72d28f0c93 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -669,6 +669,75 @@ sdhi2_vqmmc: vqmmc-regulator {
 				status = "disabled";
 			};
 		};
+
+		cru: video@16000000 {
+			compatible = "renesas,r9a09g047-cru";
+			reg = <0 0x16000000 0 0x400>;
+			clocks = <&cpg CPG_MOD 0xd3>,
+				 <&cpg CPG_MOD 0xd4>,
+				 <&cpg CPG_MOD 0xd2>;
+			clock-names = "video", "apb", "axi";
+			interrupts = <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 839 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 840 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 841 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "image_conv", "axi_mst_err",
+					  "vd_addr_wend", "sd_addr_wend",
+					  "vsd_addr_wend";
+			resets = <&cpg 0xc5>, <&cpg 0xc6>;
+			reset-names = "presetn", "aresetn";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <1>;
+					crucsi2: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&csi2cru>;
+					};
+				};
+			};
+		};
+
+		csi2: csi2@16000400 {
+			compatible = "renesas,r9a09g047-csi2", "renesas,r9a09g057-csi2";
+			reg = <0 0x16000400 0 0xc00>;
+			interrupts = <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xd3>, <&cpg CPG_MOD 0xd4>;
+			clock-names = "video", "apb";
+			resets = <&cpg 0xc5>, <&cpg 0xc7>;
+			reset-names = "presetn", "cmn-rstb";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					csi2cru: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&crucsi2>;
+					};
+				};
+			};
+		};
 	};
 
 	timer {
-- 
2.43.0


