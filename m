Return-Path: <linux-renesas-soc+bounces-24174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A04DC36756
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A7F6834F74B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAD8341677;
	Wed,  5 Nov 2025 15:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ImatJGBc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC11341665;
	Wed,  5 Nov 2025 15:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357359; cv=fail; b=cnleAASgxob6WMd25Xukm9I13w4E8AYcnyg3u8BsxF8M+gG8FggRkHs9qYgXHGHeLQhwnsPSu3h2Dceq5W5qnzGnLY0fSOeBYkMdebpKkHJw3bzOBQsH07wS0bUEsEIlCUxlrHWA0Oj1KTl7sBMKkgcC1p40hCG4ZsvqK+F+oUw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357359; c=relaxed/simple;
	bh=KNL83nfG2YnUzTCuuFJtmurBvmTmkrOxINkigMcQzkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WD96OcQJRplUdxvIkvaBi/cIx6nY3hDqJbtnXcbdVAmbL9xU68HJG7ujGJDatJZVdf2z80aKvq6s9MLhxj6TsiU983n4kZC8k0dA2bq8tuwEoyzrFIGuukMy1vLqjk+jmih+C05ZF6O0cyjwnBj7DjG83YpHszH4wBTvTJTBYRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ImatJGBc; arc=fail smtp.client-ip=52.101.125.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJ2OTOSYE/Y3CJP8NkkQeqOvNWGZvncBQV0BUmFge5fOrSixeCwnXEiz/p9h+Ne1hPCYFWitqoFMj50tPrfKyTN+xsL9bJCTxEFRPRzGLabwuC3jTNBdtRNOaNTwvg5pQ0qxZeOWzXpXtPJjEyaLI9sh20pOfFSr/78HWJwVvMyi09FCAQxFue2dDU6L8Hs5WYzezhD+/K/9s0VvO4seA/H6mQGBjg/8kUyz5mpTBhVIsEs7Bop7CX+m5L/NhX55h+s9wMk9qVcitYXnmIzpuJkJvTyZ89/GFOHhr/dFeBNcBZGkzZdvU380SDMoAIGpyysSAdj//EV7SQCn6O/8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IF3x2t7haZ94s22VNWdXVQRNkOvq79QACQzRZCoZr4M=;
 b=qnorNJjfOSB+M6c+lV5OUEOIaw0/SAZs3tfQ9TjH+WtCyj8JbSEG/1HOjWn543AimZV1HF0FEKtgnYzIQo8ryr2RH7TUD/eS59BXAA77/hEOhCTzscvWy7Judr1F9I9pyhtWiH0udPjKpaV31lKJ5DDffOyt/Xjfu6RCiXStORrMawCCxfhy8zognO9yCo14TQHu08tgpbmInnMMLtYeVvzJqqCJivdqcL0r/ImAJNG05aSKw5AdxUl+Ii9uYSvDPnqGlCShWaMfyh4RM7c8S+jicSINPfZ9uIXgwiU8XWM6U+LjuUCv2DMUK7vEKXjQEhzc19X2FtjWrEvnOlL7lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IF3x2t7haZ94s22VNWdXVQRNkOvq79QACQzRZCoZr4M=;
 b=ImatJGBc+oU8LVBEP/7wN4DeaU35/jGHGReDTSPWPUeZuJvdjsjhJLp5s58veatZwqpW/U+ckpJthlFtRvQAvQN6cU64E5U5fQFFqv9Jd+0Z4G2cT4pfjAoyjYbOtjC0U043QJc5P4lc4CY58JmXSdB6WUeW6d0tNNcBc+gdYDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 15:42:35 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:42:35 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 21/21] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
Date: Wed,  5 Nov 2025 16:39:17 +0100
Message-ID: <e1bca548c123549ad5b5eec879ca216242b2be11.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: c7d31448-a271-45bf-8e7a-08de1c81f117
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iPQo34WbnbjdaispHRhRPDpTm8vhE3O8Oj5Oo3icpBtvCQQBb9WpFPEITdYK?=
 =?us-ascii?Q?zg+5yjXQP8jtFAxULDBNr5SNy6Iqt6ANjF9fdTQ6x11Wy/ZWrPgrEH+bm8zP?=
 =?us-ascii?Q?2S4lmqiJKvF3oRIbMJxBtA2ThZ7GqxhETFX4r/ZFAJXiza2L8UFKjhv5TnFw?=
 =?us-ascii?Q?mkCR0AFbIR0va9qCfUz34F4tc18oT0o+9j0tO4eH4mISGjBpt8irYUczwXL6?=
 =?us-ascii?Q?WBghjotuLaX4CbGcN5zT12WR+XWS2ymb1Ln8eW57ZJ2pPvN+vDmI560aOsjO?=
 =?us-ascii?Q?NHEwkWR4sP5hVgNJ3E4dGJ/e8xVvHi89ScWkX+7SNLlIdKBr4sV7e0SLGYlx?=
 =?us-ascii?Q?OxCgGKfZy/hCgSc5ISgWXC+ccpaYVy4528M2mvSWuOp43eZwnpfmz92AqJ4U?=
 =?us-ascii?Q?ASDpBUqrJt1wqcoSL3wgNrQWrLHlYnQA+N4SxOybexeZ42m7rAB40pP94lgi?=
 =?us-ascii?Q?4eMgMrrIefyIrBm9wYGZ4tYMQK3oWaa2j1Ut10vFDybthy802YUeBsCcTBH8?=
 =?us-ascii?Q?EtP3IALeudLZw+Wu7KQzsZ8CoH89r21RZoh8EvzlWh7uwR02IsNjiRJCwSsI?=
 =?us-ascii?Q?e48cVvhBx0xu9iY0JntqW9WDSF3jYHtOoM/fqTyuRzxhAfZBWKCqnQoTcpfK?=
 =?us-ascii?Q?7GQ0Jd5KrEjavc2t2x4czU8bs08FyNMHsPtfi2XJvIB8neUeweALqASmJ2s4?=
 =?us-ascii?Q?aUjUwjKDkBrjE1RuDgVHnukyWavz4xZO986Ek6EWffjyTktO3Xch8opsHuv5?=
 =?us-ascii?Q?++2A82UU2Y47CgXAMxmTtIxyzpKe09rjABTQjHnE78W/JVSr6VK3AFDs3Hfa?=
 =?us-ascii?Q?JndrajXYrDxouNb+cQWyNPZ588fb4T/fKpQdMltrzF8RPC7fwkoy+vZ2wLUL?=
 =?us-ascii?Q?oVBiZcauK7p2RVf1e7B5v86lSQmKrzmTnyacxeKWpARNQUOY82pYjKt9J1w4?=
 =?us-ascii?Q?KM5NAIN4IQMLw6mkOyH8NzkSK40T4qihnVejeEshWxbevAcsGAOh1HnJIoJh?=
 =?us-ascii?Q?xgG6nGPZHykShbGDfdG8GvK4cPcm/0CJ9t88cwOKdM3BjDQj51tu6FevPel6?=
 =?us-ascii?Q?DHgUw7DzulNIh3x4rEPQmm+gR+C/01ZuB6SCxYr2Sea8r+Zh1znhdP4p+Jk1?=
 =?us-ascii?Q?171vPCgh/CXSI1fYVVj5WJ1sYOgWduShpk5mKll3I/MyMehJexsGZ2ASthYe?=
 =?us-ascii?Q?a9kOEQuDY2Nos+l2nu5rCTNsuLWJCAwh7rLGl1+iqMBUA8QsOqp4964GScPT?=
 =?us-ascii?Q?2CSKAU7foQldzDcbdJ+VU2rhs+kEcRpnMuzvqsaLndFKhxik/33U9tF3fqji?=
 =?us-ascii?Q?bCMlkKbbvDQDr+HWpPJVeyfY9BZK+bzrtSY6TVmJb60GcSqIU5q58evGthCV?=
 =?us-ascii?Q?0vcHD8dcUJEdmmoNdG1M2qfjjhNd7FQbrwz4VcR3ywcNLFdsdFCh0nClre7/?=
 =?us-ascii?Q?su4NXE+7b4ROPWnb/Bmh3HDSsPclXKvhLjo2TlA3Acy096ch1Oizb5JX9dp+?=
 =?us-ascii?Q?AS2j0hGsBI4aGOi+tb1LOY4q1rNTYimI7VI4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kvK9uTuDuuFBGoufH7tUy4tCrYVNG3N8kMVujsWfNbfnytvuxaR5vSvPjAvm?=
 =?us-ascii?Q?/GLgczRsWnggQK0bGNS+Kugk6/C2dBYeSkwVMGnC4+PI8BpYE44xRz8rdSgy?=
 =?us-ascii?Q?CChaxzV2GjU7oQ5XkEuwajzI2DRNtX5mS/HR9KC4nGAZICT9q0NA5zzT7oWB?=
 =?us-ascii?Q?KX+3eh2dAOEqHSLf/hcWItLy9JoTQoDPAZ9LHvJ4gXVs0oyma/4Ol7BMLbDQ?=
 =?us-ascii?Q?J5Tz9iBic62CB+sOzJziPaVLekNDm68d+EAMDEBDjZrIcc9sl1I7+A5e91nK?=
 =?us-ascii?Q?uyc5Sffmi38Y50ICTr13Mp1rQtIfe8s2nbqCBRb1qVq0OI5Qlj4pZSl82hOK?=
 =?us-ascii?Q?84LgDVMQhLnSvXZnh7RrxDoeawXvHYToHhMGybHmemadcvLF2MNVH28g04nC?=
 =?us-ascii?Q?TQhytpJoOe9+a9VcRzEzqBtDOeqYTa0Th+9yKVhJdhK874X2vvgFOqhC0DS5?=
 =?us-ascii?Q?cX5kVQvUJm+M/rSXCvwezTYKof9J/6CV6BGlOQL1urji1dzIz6EfDuiLpGWF?=
 =?us-ascii?Q?73LyjNCPrU+BiHvKqdr5uBIVD4GLV0OvGfF3Vy2oESNkCnAqV8E7f5TiuDjF?=
 =?us-ascii?Q?RfHZHJIMRh3lKie8+X5vY67Th6tL1PxrrnqrCL4DHIzeQDK9u91qdffYxPKO?=
 =?us-ascii?Q?h2Udu1OQFoSEjIHi9WYaMbg6faMIniRjwOJzoB7Csb2T+egdSGicNpNuEzjS?=
 =?us-ascii?Q?2HUOZeL38wL5qTP+APWXHC07WVmM2oq9RKHCC9sIck5yfBBb6CuwrcZ7mfQJ?=
 =?us-ascii?Q?QoxzkFO3QAL7955XiwzBpbI+4dsVFSHIqmuJZTxc1hWMYLF93hu+he1hAfVQ?=
 =?us-ascii?Q?wACwKZmdApTkuYfjbheIPpr2BNvM7xUWR+jI6WlrYgmOut9DpxLo+UJeTtzW?=
 =?us-ascii?Q?zKoG5qQm/TdX/xtUoDbgmrbz704ZEST+z/1M4l438IEB+yxhD8GNk354fwrX?=
 =?us-ascii?Q?jLbFzgpkwirEgLQqT3KfqlQYYt9ZQdwhxVQWz3zxB9hox7VBkxoqDTbfbRXp?=
 =?us-ascii?Q?C7jxJIY9cbdzF7jftM3n5yWD+LrXKLQjL1V71atEh18FZR02YbJTqPlbw2TA?=
 =?us-ascii?Q?+vyGZBV2WbvT99pJUQullNwpyus9nHUMSCFOTZbMMphUyl/RXf7QMyK7Vc9o?=
 =?us-ascii?Q?05qm+llhvgt0ogRhqR5GWxWHp7KqsbFWyKbvepdkPwXrfeYNpYhFo9jus6Su?=
 =?us-ascii?Q?CJtq2J3YT95i8GGA0NxgI+rVoasaQcQLjrnPGplKg0AdfTn8zL1Cl/amNuWN?=
 =?us-ascii?Q?lcARyaVhlbIiaV6q+iEmtq84XVAE1omUXw2iQPzK517igyA9MLiOyQHIbWfw?=
 =?us-ascii?Q?0w5K6HGryNDWs29ZkM1yK5r3MnC9q60oc9r29/z2uy14OLft2eM14bytY4yA?=
 =?us-ascii?Q?TBb6gHfDUPe302FCmFTKPPLCpXelixNlnS2TArGkkRjEVc8lX/dLfQeCbRRV?=
 =?us-ascii?Q?QuowHQ3HW8l+YVBh30as9pQkBe+uLz7ekr4aKqjvREnhREpVORTd2cbqyD71?=
 =?us-ascii?Q?lxkoTHazRZhLyszLPhrD/U1LI/nlR+ropckC7zSVdZh+Yj8khzX9SKKp61Ho?=
 =?us-ascii?Q?fepaYQKeYNGYEeE79STcV8HQhd5N8khfM47jef3leS9mOJyEJJ6OV6rCjW5Z?=
 =?us-ascii?Q?wUEQw13Cc99xD749nJjHRVI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d31448-a271-45bf-8e7a-08de1c81f117
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:42:35.7605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mKXcgRMonYLOdan7J2rQ4vWuErEYysEJIP9gbFDStCoaropyMnwyUmt8/MEBjvygRCAWBkW7s75hitIxaIvCnXAm3Bcw7BnUqd89l+Epc93z3FaLWF0S/sjFpha4jCi5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

Enable USB2.0 support on the RZ/G3E EVK board, USB1B_1A_HOST and
USB5_4_HOST connectors support only host operation and USB0_OTG
supports host/peripheral operation.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes

 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 49 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 23 +++++++++
 2 files changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 08e814c03fa8..ca19e8628c80 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -164,6 +164,28 @@ sd1-data {
 				 <RZG3E_PORT_PINMUX(G, 5, 1)>; /* SD1DAT3 */
 		};
 	};
+
+	usb20_pins: usb20 {
+		ovc {
+			pinmux =  <RZG3E_PORT_PINMUX(0, 0, 12)>; /* OVC */
+			bias-pull-up;
+		};
+
+		vbus {
+			pinmux = <RZG3E_PORT_PINMUX(0, 1, 12)>; /* VBUS */
+		};
+	};
+
+	usb21_pins: usb21 {
+		ovc {
+			pinmux = <RZG3E_PORT_PINMUX(G, 6, 12)>; /* OVC */
+			bias-pull-up;
+		};
+
+		vbus {
+			pinmux = <RZG3E_PORT_PINMUX(K, 3, 12)>; /* VBUS */
+		};
+	};
 };
 
 &scif0 {
@@ -179,3 +201,30 @@ &sdhi1 {
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
+
+&usb20phyrst {
+	status = "okay";
+};
+
+&usb21phyrst {
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb20_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy0_vbus_otg {
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb21_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index 58561da3007a..2daf437abb82 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -90,11 +90,34 @@ &canfd {
 	status = "okay";
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
 &scif0 {
 	status = "okay";
 };
-- 
2.43.0


