Return-Path: <linux-renesas-soc+bounces-15324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9641A78F87
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 15:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D023B189388C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 13:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06ABF23BD05;
	Wed,  2 Apr 2025 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="m5OpG0HB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB610238D50;
	Wed,  2 Apr 2025 13:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743599576; cv=fail; b=fatGYCuz2Utw7gN1EYy77Co0nC5J5zCuwosVUrhlKeWmKskm7j5jQQXAtV6xRs2QHZWg3l+da63Rn2vOo0kOVjzPbLuEAhauHvfmA7+rJDAfcv7X9YCaVBL5498dN3tvmf2Q1hidfm8/KE/Efqj8d68YXvQo06Jy38jxkJRAHkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743599576; c=relaxed/simple;
	bh=+H2rJvDEPRjGFGER5Y66S9/ORdQCVtsSi8XTrjI9Pok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KeXCsmi3gAmHwwZBtqIu1usQC20oBREAJrfo9akA2xuKaT7F9l0bPpJlArmzzgW6c2dV4fEGhoGbf8OBnxdzEDJohfvcJZqWy3w+pJm1wHL7XMnowMip7E1/o8MDfS6Xu6RxgCG/alwKF3fOHOwmjKa6YrH4VYlgymH5LagGtSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=m5OpG0HB; arc=fail smtp.client-ip=52.101.228.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8hogVgxc/hdJbi9oPHs1AvHt0fWfhxP9UhxjP/SdtGeE8o5Ob+Iab8WhDsGjGujQTE6kkWyiYE/83Z1qPLoDfK23ng9xaYUeHyDvQNxlnOoDXmvq+yMuCAOA3q7PZ5zPnN6yzZd54K0/W4kEEUZzbjS31s2k8LTIDZ3m9KSHk9q5HVENNllpTLJeBmMP8TWahOQG/QVUCUB9iGoyga3cY4fhhFevrtl09ccKbjkJNWv+RkdQG84/FxhZpvQ3+quWzVDI1gOCcdcnB9+t9L+Uj7ZMTgna3H936j1B58vdEAespbtZ7BHjlchC334f521Z8u21bQKiOSaIH3P7/UG3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rflzgQxs+9T1XWWtSMV/JB4emc6qCPjBWYVqPVO7e9Q=;
 b=KAc7mR0fq1MRRiCTVf9/uS2hJjdRwFP76Z1FURXU6IeC56AnjKoz8N/UOn/xe+LpBv+YuWarndSYCuENcEtkqAlVIAof+42LmFsQQpYJfO0AHQCy7tSB5BirdUgDGkSYioBdHlVOyDTk3mi9vhznjEejLqVUMbAaQ0iQLt4JC2JLBWPhjq0RTs7iorwJtYHQSK5KX9DuSQRiaGu3JrEn+8f17WVmcfbrY8R/QxRPGWvqTfMHIF9Kk2AaldL4yG1w0NFN77U0gG/KxnlxRKfq5tS54F8YR06K0zcWkTFC4qADQGgT+DHxofOcFINv0uBe37tM9hKA8/T2HhbLlv7eIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rflzgQxs+9T1XWWtSMV/JB4emc6qCPjBWYVqPVO7e9Q=;
 b=m5OpG0HBiNxK72KlDPcQcxr7LPTrY4fgqdRkKleWXjF7t3kHlEwRcksmikdckE6VFmb9bkBrOcSyrl/PYQc+UyjitZD3L5lY6dU+riWg+gJwe7yWM9/7l5pHV3bm1FV8+Qox4XuYKYTSWz0WAo6IIenB8/GmTI7x15V6x5HJJC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6688.jpnprd01.prod.outlook.com (2603:1096:400:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 13:12:47 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 13:12:47 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: renesas: r9a09g047: Add Mali-G52 GPU node
Date: Wed,  2 Apr 2025 15:11:40 +0200
Message-ID: <20250402131142.1270701-4-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: c2377a56-9f96-4937-246f-08dd71e8101f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?c4RXCDNHC0bQzCb6j7BhXejngtuYoMsEUcv747+HC8Fe+bqmtxzIKG8GX9k7?=
 =?us-ascii?Q?QPo0y4ydNFhiccEFEZzpp5QtG5Mgo790ioUFBBvzNBxA3ss/BSbs7ncL810V?=
 =?us-ascii?Q?8UixTlp+L3jXjwJLGaieG/ylmXXBigox0bZlyWMr0fEsdLS72hy2GfXvZLKK?=
 =?us-ascii?Q?K0sH2UexaCTDzAj4VQr1nArfE9qU1RNGyI2UaRlr8Y8P36heeFIb4gxV7gE6?=
 =?us-ascii?Q?NstImLsFywJ1ZI2J+1iDOQihTAbfZLKi1QiexN1JNEL/2PrOYCN9ufH6edIJ?=
 =?us-ascii?Q?cF5nYM4/CcK/SDZymq1IJO4bK/USfuPGP7G1GqFKkClkQCNfjZNsG/d+JGsg?=
 =?us-ascii?Q?B/j2UG4WREbIueyg0fMY4v5OG7bnDJScLX0E4DP9tMmhAjqGafqWdf622Tbi?=
 =?us-ascii?Q?AI77u2t/ON6mRsGJ2TtaO6ztBC+0LfjDvQbIE0DtUVo0/OGt9ysyqYc/Py9f?=
 =?us-ascii?Q?J2P81yEuZhhPb4Wqh3FoAaA9gERDUY7/grNlsFJFOJNfVy2fS5Xu9YyJO+s8?=
 =?us-ascii?Q?fhtNXcFjftDQJ9dPm8uzF4o/n2p4hy1B7CYcWUVpL6qat6tcgdjtFLfD/4Ga?=
 =?us-ascii?Q?SkBp0TiJrfKLmesgo6wOYi6BUNPT+VfMiPnYWBfcLBp1yl++tyJNynG1h8Ka?=
 =?us-ascii?Q?IeYu5M+9zbvb9hEn9XsxMCu+l/MpnQp6osyWy9yyXRSEu+KRtMNQl5aApeeV?=
 =?us-ascii?Q?wDI6Gv60he/wphmR9xPZRGtXOASkNB9wtBKGVWxT1rGnfRSd0b4ciWOlCEtu?=
 =?us-ascii?Q?JJ/BEDLsQkbEQPZotLkBW8Tkn6AAL3SXySzUnFAu8e5+wXFcsyseG4BnGgdW?=
 =?us-ascii?Q?OU2YfEg11Au4PeLjAyQDimPQx2yhoIvATJrrShaeLwLJ1M/mVCGbP6fX+5YO?=
 =?us-ascii?Q?dOciuEzJK2XdaJGx0ecEsu3YFg1pLLXtO3w+qfkEz0WmiQn5ekWNh7WahLIp?=
 =?us-ascii?Q?vgWfAqy28QI/G1oho3rRzlIJ2Gn90I71o/09hHk0AUEAAzqEzAyrmr1+667m?=
 =?us-ascii?Q?+JpwiEuF8at+hZLKv8Hz/AHAbMpsJXbMKzzAOegXAzf06McOohmijlKhu/Zj?=
 =?us-ascii?Q?svf7PjkRS8dG3rK6eNlGarKjl4okp5Hi7xJ4gm7i/AFNITZedKLIO4PDJO+9?=
 =?us-ascii?Q?a2+wFX+e2xK4Nzj2GW6qiYsja0sTthgS2Qd6ioJWdagTmlp9LLP2bzBZRHOV?=
 =?us-ascii?Q?Q4IResof2eiQt2X0feTmU2KSZechI5hxXWf4cR7YMbiBWw4Yaat+5CvU68J8?=
 =?us-ascii?Q?36hhjb1LlfGGTRIsLD/0TY9XlnSYSvfhA1tV4dc+7g6oTzBzSKCMH412K140?=
 =?us-ascii?Q?X2KLd8siGCuEP3HSynVr+QN3JcvL8TnKZwOul34eB32u/TgvzSTR5gFp8poh?=
 =?us-ascii?Q?JGsfTtm9jXlk5a6czNuIQZP/FSuWrm/6MJxFLFVOradT1jgVe/4unu/Jve/L?=
 =?us-ascii?Q?FLuQlIjO6sZkvG1q6HQ8mEqgOtDPjH/3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IX8vSHWDwxfjV83Ay3caiG+Y/hWl+g4t0Kibw1RJVH3X1KhQVKgmMWE1odP0?=
 =?us-ascii?Q?YlLbCf3r33E60BWYBXHeGZ6DXN53uGT0DQLZXIVcZmnf7i1s2GBkK9f2AG8Y?=
 =?us-ascii?Q?3QtJRwVr3QqBeF8MwJSsw8OicUi0p8xk5z6XrqPpPdfDspHxJM2rthB3dIcU?=
 =?us-ascii?Q?Q7dg38Q6dZl1dwO3Yy1iUxYtnv2AI2jdQ0htBtPA1vjASly34lCBDHvvu4Rb?=
 =?us-ascii?Q?/WSc00dZ1QzOwW2bul3Xapf2jx7O6bt2//Ey6SpVBbkCTfjxZBLDRiv6tVMV?=
 =?us-ascii?Q?EaSCgdk/+fBK1drycpJJAl6/OJzCZ8fBO3MT+KifSYYm08KB2eNz04Z8Q5e/?=
 =?us-ascii?Q?FOW7TpWEgVSKbTuvxpc57U3X+4TdTRfp8TnGwV9PGreDx/7QBN8oUevk17Cx?=
 =?us-ascii?Q?AnCfHA5RLTae+KtI+gy85x1PaUqfCHJxYOhrP2A6ePqzze6OX7OHDYNBhY+Q?=
 =?us-ascii?Q?eoU4IHTEtp0m1l7mOBScz+NqJdVrYGEx61cmiW5hYlrz1r/VB52IZtlT47M4?=
 =?us-ascii?Q?QGbruLhORGL38f0ontXcU60CYmfQfF1t9AZ7mGpTer5AncSO/RD0uIYBr40q?=
 =?us-ascii?Q?A/qjZ8ztwuKyO0wQa7WJ9TOuN2oRRZC1eD5QylKViC7xdvNS/ndHYVVjmrNz?=
 =?us-ascii?Q?KUoHeP4vfdvL1OkESE7nvxn1yy982Us3a1UC4cYRM1+QWFGwV8g7QoMHNZuT?=
 =?us-ascii?Q?HfMd562RbwLvdpX4WOEpbrUWvtPK65cABJu7LSPyolsJF6vEWQ27+U3megyW?=
 =?us-ascii?Q?jdKG8X2r2IZAqdKBnX+T5loTP5qAxx0wWLpC6S4cwMPOF8P8rdMmeqrChVhv?=
 =?us-ascii?Q?9qqKF2szZhbW/TsyeuiWZDvJR8I/L49Hia+2KWt8cVGSNnAlTDl6yxRLu641?=
 =?us-ascii?Q?oYFr6dqHtpGQnizcZfkgELpyQpUvjEUJQ5cDVFBfqULynPIzfPqRdCKibUHX?=
 =?us-ascii?Q?HodrHDVwM8qA3KbBdaLVdk61X1lhJdhopQpc+K1toeu+RMk9+6dyyszGNfSq?=
 =?us-ascii?Q?6T9c5J7Zi75hEMGefhWUIXjnhTFCTRAln+IKSWY26rR9J8TgADIPwpUpIiUK?=
 =?us-ascii?Q?Uj36XWLtOpTXJmedlimSW1nbnOfD5lEE48OPLIyDlkQCyNtlLIKxTSu01sjL?=
 =?us-ascii?Q?sAdrL8lYm9eUgkYujZ3vTuY38zRz+atyKFWkitpi1Qj44CAoJ9cV+rTa4MbR?=
 =?us-ascii?Q?ynYS3RupB8LcjUMaXOKgUsUVdeNDheyKZMSzoHH9BYpNYnfcxZ+nH6zvhbTs?=
 =?us-ascii?Q?YEyfFGX94KWiQEkzkscec+WlHyUl5GcqsfUoddQ1NX0berqamtgLDjq2UTkP?=
 =?us-ascii?Q?HrDD1zRj+Tk4cqeZYclWBQZnN7zNuVYKL/428I28keO8WvXFh9kCC09ZMPua?=
 =?us-ascii?Q?vinybIh6xyCVlG23VDBFvMkmipvYbZCvBNoCGpBR7pku5NOkaTELJi9KmRF5?=
 =?us-ascii?Q?cIc2C6ycax7rwaxa++a4OQseH7r0UH/6Cr73jWgiTp/fP4UDB56kadSR086y?=
 =?us-ascii?Q?TytHGwN3mACmH2Hx6FwkkoBzMl0rJrQJf967DWuzSkBi/MGvpYloCd+bM1HW?=
 =?us-ascii?Q?Gzm2hslCwq8qD0jqAduDo9Vf/KL5PGCiIz02ePwDeHy1kc1POn0WOOlRMaUR?=
 =?us-ascii?Q?c2Ua8zXtlJz3UcVGsvx1PHU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2377a56-9f96-4937-246f-08dd71e8101f
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 13:12:47.6872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oBPB99OkAGJ/RX5z/HsBvg8rUNKNgblI0LAVrGaXM9rXw485e0SYJQxBo2bsu9j3zYySE61iGoEfrxhazQkxG3pgNprOjUqBV55HZiyCouI+eMdzlDhlzd+4AxssqVhU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6688

Add Mali-G52 GPU node to SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 4bc0b77f721ab..9ab83e949c0ea 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -105,6 +105,35 @@ L3_CA55: cache-controller-0 {
 		};
 	};
 
+	gpu_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-630000000 {
+			opp-hz = /bits/ 64 <630000000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-315000000 {
+			opp-hz = /bits/ 64 <315000000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-157500000 {
+			opp-hz = /bits/ 64 <157500000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-78750000 {
+			opp-hz = /bits/ 64 <78750000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-19687500 {
+			opp-hz = /bits/ 64 <19687500>;
+			opp-microvolt = <800000>;
+		};
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
@@ -491,6 +520,26 @@ i2c8: i2c@11c01000 {
 			status = "disabled";
 		};
 
+		gpu: gpu@14850000 {
+			compatible = "renesas,r9a09g047-mali",
+				     "arm,mali-bifrost";
+			reg = <0x0 0x14850000 0x0 0x10000>;
+			interrupts = <GIC_SPI 884 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 885 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 883 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 886 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu", "event";
+			clocks = <&cpg CPG_MOD 0xf0>,
+				 <&cpg CPG_MOD 0xf1>,
+				 <&cpg CPG_MOD 0xf2>;
+			clock-names = "gpu", "bus", "bus_ace";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xdd>, <&cpg 0xde>, <&cpg 0xdf>;
+			reset-names = "rst", "axi_rst", "ace_rst";
+			operating-points-v2 = <&gpu_opp_table>;
+			status = "disabled";
+		};
+
 		gic: interrupt-controller@14900000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x14900000 0 0x20000>,
-- 
2.43.0


