Return-Path: <linux-renesas-soc+bounces-22285-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEE0B98338
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:30:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 720C52E5C29
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213CB3C01;
	Wed, 24 Sep 2025 04:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="pBZLuX1g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390E028F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688253; cv=fail; b=Dn8uHsCOhTm6lbxYMiz/EHjjFN8QvNAu7NqxlbHar0P4b1BsGZv88PU4qkU+zpHsDuUMUbsEG/3qrPbiYzrnPNNiQ6IxvKLubiZdk8f5cw7l7uJh2z6UyXh0cpz0gX8JggBQy5tEQ3KCXwh8e87hxF08c+eQqzlVGH2TeSapCwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688253; c=relaxed/simple;
	bh=5n2oR/Bx+q01EWgtt6Jz5Z16HUirEJs7/vRU19rHWyE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=b49UHGlKxSmK6ByblNOhOBsLNTrKw6jELmPVaKbKmNu9WHSv5wDOdpWHlkoB2ZKQtcwPwcckWNR2TLvHhw0zHJcZsAxTzePlioe6X2eHkbgO4yNGCkYHCgrxSpsTT0uLkj6qocT/cWWsvzueRrpeA2+lHKNyHym2ZBXmMT+JFH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=pBZLuX1g; arc=fail smtp.client-ip=52.101.229.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEblUBvEobWo334TeOe1HnTTUzv4kFYxXFw0ohFlS521Bjt07nEK2s8w0gUtca6ctAlzgSv0c2hYsvjLbTLy6eh7950dqIjhbVyIUUSKk+X21TUyPamWnSUsHIUDZ/teOfzeA9SMLWSuwyOS7MDZHpb3m7xEH7nfwaiBqGkZ1c9szZ6CHJ8tCiD1oqOqBbvH3cP5fzrEUyefFAhdRVoMpD+mRYZrw5rkPfHgzf+m7QBZ/JwFjD1PUXxmzHYQfvehJWg3NwVljqSs1fsl836giBbJYqnvo+LqlJL+tNCLF4B2MFfR9guVwXAGUAQnZLTqburD379HzAw4Vy2ZnHudLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mec3PVLvVIV3iFrsiNM96KFH2VxU80K+E9RKXCBVltk=;
 b=Ygn3J8rJKzYhKRo8hMwea6STAlowcmkqgaYD1A+EFFvtseBlHon4vBFfgRCR+XeliU130XdCwyR5uaykobDs1MpFo0UIcCYRo0ekyLbrUvqt4kfZ0LioKLS1rpmeOp+U2kOTKoHRbDSVWOfSkA1rF84zjJOqnWJvaQT1J/r7Cu5YLo8FTOwD2wWDOltlnpu3Bk+vP47jNNs3tmuyjfzJySnoc8iL76FdlmyFSNCnocRk+uc7zCep53FUSauDpd5WNocv4Cix4jdXLzXr/NTB2MewO6bb+rcWlOrmkwv30VI3ps/QBZfY09mDLyk54kzY4xU/mugmAliLjmFiko85Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mec3PVLvVIV3iFrsiNM96KFH2VxU80K+E9RKXCBVltk=;
 b=pBZLuX1gnOErmZlSAZMBjJ623usvhBFIy8tLsSkVkncrlLkh2tJmIRZNydP5/Ma1RLvcM1g8y2/XJWIjpj2zCz1yIm7L2OBipgaHlOhus+cAOSVIWrv2huuDywqHI6nlSu3nkYFiDbQ89aXOv9GkvcE0y9KUWNWHNlxKIlMdh1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:30:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:30:49 +0000
Message-ID: <871pnwa2vb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/26] arm64: dts: renesas: r8a77965: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:30:49 +0000
X-ClientProxiedBy: TYCP301CA0018.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 7236a386-a7f7-443d-d74e-08ddfb232343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?94ANGOnGVwSoR79t6T7OQQalZweiNUUMDg8ERNeYDNL+vFa9S6OPOBhXRrWq?=
 =?us-ascii?Q?6YfJkV80JVDLxnCJfiRk+5w5q+FAFK6Hcz0+1TxM4Gfh6YJThiBGLJRFM0PP?=
 =?us-ascii?Q?vfj/ghUBynn0xYbj1W1fnFA/rVLvHaFZFnh+O/AYATI9XDodfCFKvikRR11i?=
 =?us-ascii?Q?E8BiYElhx2PEeitmiOEG7Fxd3h5X6qcXQ9hSonkSrYMdbBLxluoUP+aCijy9?=
 =?us-ascii?Q?iQP5wJies37NNkXjjrWxmBuVit/zDIQOvr3X1usczd9KGJm5Td5VHu2n0jzn?=
 =?us-ascii?Q?3IlEowgb516uz4UCeiGIbUQ47K4YIMFw5DB8KD+WM4Ien409xPal2lbVaOmN?=
 =?us-ascii?Q?QOP5hf/9LniDqt/VsAcXsV9yhwoJwwEWFi5Ac6jGcRBm2gfL+sJSK8BF3eT9?=
 =?us-ascii?Q?1rVvTQ9HO/pZSKUHuwiuoB5BR7cdtlc5dW5CZyIMxdTtPCngesYrqma+XNV8?=
 =?us-ascii?Q?sfnrQQv9d51nmNv7Wv1YYTZoF7OTmvWKLzNAWZQJY5stMqOVATnkmDmg1A3m?=
 =?us-ascii?Q?oMAo+OhG5MyDvC9Bx9zYmrU0w7VNuQwsOcDdX9Ft9pAP8DEzAE5F0Ea8WMr7?=
 =?us-ascii?Q?QZ9gAu6XzcodkAXLtDyBBWzPH0PN7D1ID2B+bdv9pzmbl32/Eh/BzoWGgV12?=
 =?us-ascii?Q?UGbSIbKXli2QcjM6wwjEnI5ZXfAF/1w9Fbagbr1A5CnZ2xk9VwOUGCgeX4jc?=
 =?us-ascii?Q?s+a5vOC8JZEXKSfMBvU1GZhUCNpr25xapcC42nWNAa1YVwRJFEwXJ2OZoFDB?=
 =?us-ascii?Q?fpUTPxwZNccuYvOPAOXESOf/XKpIUg64zQUDULwtXsP1UNyCZhH2jaIWWway?=
 =?us-ascii?Q?DMEr59bx1cBcDFgC8fb5W1UUkDDPVyqnUfU07D0hb3c46rzmjGPEWUmIe3Cg?=
 =?us-ascii?Q?fxIVG55mudzfHEt2eKuwFssrsxWvCcEpsMX/PFPwGKh4sj7onVy7NJ2Rj4c4?=
 =?us-ascii?Q?d6gG8ptae+ZmlbzEMTeWMNTsonAHUFQrbLL2gR5mfG12CC21xjzCyFXFqTmu?=
 =?us-ascii?Q?bXZZQzLZCqEC59Iqo9yMoYhXFZ7AHh1joVoODT9cWx2AKpZzkt+lwYjurw1H?=
 =?us-ascii?Q?JhBtgTEJUnc+/osfOMU0ila+0E90c3cpooD/cfx6bAcz9IP3YyitcjugCh4N?=
 =?us-ascii?Q?ZF1x+G1golG1RWDEKwX1cM1Cctm1m5M3gvx3cIwM9NVAe5iRsH5V8z6001cS?=
 =?us-ascii?Q?sqFoYOvtBvpvQZ7PEoNrLYF2JWeJObAGXKKgJ3jfhWot/UfpX/aQbd+vT3+K?=
 =?us-ascii?Q?CYIK1WT62hQLP4gIYPrBNhsIkJOf0gyueDmC+EVN2z6JJB3Lr/yizxsCh/4e?=
 =?us-ascii?Q?2Ivan1x7TG7dPhTSQRnFEPS//YOdChEDqyfc5cj0fu/o9jSEM/+5PSZe0SGY?=
 =?us-ascii?Q?bKmf9SQKigbNyL+MlWsqX8JPEyt2Kq4cFCJ5h3Ygn8pxbQQvFsUT3dLjWFeV?=
 =?us-ascii?Q?b4+l/6MtkLTBU4Rq1XORI6MLM1Nk3Jfk1kyOm9mDAXkACLk80h5yuwtLj/7H?=
 =?us-ascii?Q?KdX/RDkbNY942GY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?46du26At4Tg8dVehpimz/uanJsvp3yr4EbbYOLEGZWY+HqxYiXiGhsuCGPUS?=
 =?us-ascii?Q?9wFVa6BUBdvDzwM6135+MmU+iPodjFgi5SYCanrg97h6EfFuFs1qWIm+UqVM?=
 =?us-ascii?Q?EY0hSeY6R+2bjBXsuNhLZV/0rsmFCj8flL34iyBFNNx/FG4A56rlahnEIHsF?=
 =?us-ascii?Q?9QKgeY/MjKkBChGaKjtAP8VTL2zPwZyqlBQS6JDGVZrCBeBO7orszgRne+eM?=
 =?us-ascii?Q?TGZSncKWa3b53fM5OKn1BecUYzrabbNYmUgqjbW1OAUkfR8s/zuinxh+9s8c?=
 =?us-ascii?Q?HkP15D/43Jbbg0gjYsLtT+4dMobJm6bU0lwSH3+DCeHsrD1iMziG29Ssl6uS?=
 =?us-ascii?Q?5puEFMjQ1++xloBdWWWm2N/deMgc0vshD/mE7De9FccJGNWbUV3ED0MP6ZsU?=
 =?us-ascii?Q?eQXwSH4z8vf3ddoFs+7IZ2jR6oqrGRAjss6bafk24tvLGvVJ5bQu2XLdjSgu?=
 =?us-ascii?Q?LtGHWklnmyfbR2z/6MMXAA3Z2HdnSAe+b3/lEcGBtmIwd0IZYSP/c2w8OWD4?=
 =?us-ascii?Q?QduJwsNXVrFoD9Lubbv3Xh3kO5kz/1StJNY1k/BC/P130CYeohbQdDYpW6gV?=
 =?us-ascii?Q?jnNdC4Eau2ZlbBck8AM9r+UDcYdOUVzlJkD9k+qt/thGIOZrdhiYGcDh3cKZ?=
 =?us-ascii?Q?ZhO9eDjSBnhzvzYU+e0TyQhvVJohCPgfn4Z/1DbbTtt/sb3PbNajyz6BXMEX?=
 =?us-ascii?Q?xM4qgCKBAlxuqqt4ZmmtnV0uaPowYtxRisbrOdbJStg0I6AMipKgHkbWC00S?=
 =?us-ascii?Q?/zndqmJ2R1qiYU6HNvWEk/WOmTWjGKaFmzrJL6vuo0wy46Xj0qLSvR8h+Ljx?=
 =?us-ascii?Q?2PfDTZrPVkLkWMQZk398qR8OF0c355v3tDi6DfG4owJHnKkO2ycXVpWbHA98?=
 =?us-ascii?Q?5zdm+c5EMUrWb/PGAvzUdePCPoEgKhsxvaM7ZDKXr95J01WOyW5R8KTjJFhf?=
 =?us-ascii?Q?05WgHkTC9nCl8JHjvZQVcTpnQTSa7Ud/hXCNKscE9RUJXjB7FToNdUWryyQx?=
 =?us-ascii?Q?MLiUMYLEJdT3IR3JNS73N2NKM76KDIGmfZ52FNinkV4lBa2jg1o1+ghuGEdj?=
 =?us-ascii?Q?NrfXLa9Y9JtJrp+eO5CkWtnbu6AuguZTV5zGyjkvUZ2TOZToAE3uUiap/3cT?=
 =?us-ascii?Q?2NCXdZpjmIMohPWVg3GMZhQZ8cIDXG/sF7ivvpl36XdA5JfRjspj0aqiLACF?=
 =?us-ascii?Q?O6ZvtT4w8a2QxDcRtbZ36YKkGxSFWbjPBbsYyWmPIeqp8nRniSj2TUQ6oHPm?=
 =?us-ascii?Q?jHWxDj13G+lIMd1jZlDtzzv2td4NZKiT9rqABsBQkDvsFBHrH0ylQV7jBQux?=
 =?us-ascii?Q?hkkYNST5y5BFerpmcbHm/eltEevvzc+2pEm5f8Sy0uLkMzQ93AZ/DL+dnn2P?=
 =?us-ascii?Q?8RWyKZbEs4U4PDqjIqFKqf78/ll02+DvvJ1bHy+FshUGYpE70OBiMiJ3+fhV?=
 =?us-ascii?Q?EtGm5wlX+kK/K6UDyoHTQlo6OVzGfR5IHaf21qyKD0lFEqrRZx/rarJdJ2v6?=
 =?us-ascii?Q?RDX+ofXTldtBIPGSMqXa95MACZRiUivMBzFUj+lowwnK+LTkjhsD27h9V1/X?=
 =?us-ascii?Q?Mcas8aKlhFaTlv/p33Qn498L+u4oA6KAoqik0JiTuTq4imCSHW0KAWtJbrsk?=
 =?us-ascii?Q?FSTS/u5IbRUnPaPgrEuzww8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7236a386-a7f7-443d-d74e-08ddfb232343
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:30:49.1524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FO0vw2Jqi8Di/aotToknzg2/nwI9wEU/Q9/Jf49AjPKijQXI+drKHeU2eSq/s80aGgo4xazdLahCfFx5DBsUEyDLhVj4wqNPALf2RR90jZ/qRn2zRXgPfjMvVc4KPir
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 353a77187089..be5b103b5092 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -18,6 +18,7 @@ / {
 	compatible = "renesas,r8a77965";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/*
 	 * The external audio clocks are configured as 0 Hz fixed frequency
@@ -163,8 +164,8 @@ pcie_bus_clk: pcie_bus {
 
 	pmu_a57 {
 		compatible = "arm,cortex-a57-pmu";
-		interrupts-extended = <&gic GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
-				      <&gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-affinity = <&a57_0>,
 				     <&a57_1>;
 	};
@@ -183,7 +184,6 @@ scif_clk: scif {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -2903,10 +2903,10 @@ map0 {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys";
 	};
 
-- 
2.43.0


