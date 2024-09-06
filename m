Return-Path: <linux-renesas-soc+bounces-8775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D551096EA91
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 599A91F2204F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B7215B55D;
	Fri,  6 Sep 2024 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="nirKRPoG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010012.outbound.protection.outlook.com [52.101.128.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64ED615B12D;
	Fri,  6 Sep 2024 06:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604118; cv=fail; b=f+/+bGDavG0YJzLvzdnxUMmVJwHxd2YCVM9GYEwOcv9zH/wOkfDZnnPYKFqHjhoEj4SnaGXkcku/F75DEMznjijU5QhhjnQIyqNMZKKL3mZWXstqQZ9tTQbMU6EE3u1pUrs34ygGy+cY1vXe8X9HkyAZOe0s+3ajSeFWIPb45o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604118; c=relaxed/simple;
	bh=Gb1cMubfab+esZE2lUZ8pmnTHC5wWT80/mJF+02OPjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IiZaXCkcPkrMrY9ALzmPvkuea/6shtQTWFpStrAhSVMiol1K/yWPV5eXizpr58e841D4CsGyYrZ3217tM2uA9RYLMAmw3UOam6Fdoq8ybHcMO2FbdG8WT8jqRFs0Ae/PxlbUG2n2nNfe5Q/3c5lBZVg06as9QkAvPMORUxotk6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=nirKRPoG; arc=fail smtp.client-ip=52.101.128.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhw5SEVQFbg9bd4raq8qb4YW6THlfQr+N3pqwiDjDcQ+3DuTRXCCq1sjdv3JPwWxDR1oWbkm1jRrZJDWYGSSHnWLEZVaYzLIstQrzDSaoMdppHAWS/knUX8cW7Wo6KZK3HqQT6qu/xJ5cFigHzqGE/0Ee82ueX0GKvtpl01Diuv33UYCVTuJdq/yTr19uHnnua0o2S4Kz8zmpsZeyqy7jyfinfkavJyYVCaQVLW8U3nb8cbmXG6GJs3qk8YajnDOVG5Mio+/UCFDLFRCLDkJD9taSYvQC0XLLbrMA7Q462QJL94JW5ra5UH2twhqpoB6HCjryCKV65mwt4VfK8SerA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKDiGhY0qi6Zhw5yz3X3KRvVupBpI62BiZwruuZTFwI=;
 b=P2mHsl6taHhnNAGKQme3e5byKrsj6B7F9DfOQzKIBLTeAQzHJL4/cSuAGpFf4VXfy3YR5qzZMwBhLUXX0FdS+M/QKIKV5cX0hUqHActBw3RIEGLK78H/VD2wO0NlJs9pQ9NCb+ykeIHyr/pbtn7QU5RIjZMKWlQxdIe7A2+PRciKUj121ra3t76evtx5hnFtp0guWhxoisAVB6Ujiqqns5NeYSb4+s+cYxa49jfwZDPOLCWo7hecyBYw/AoOr8X+/QbG5R353Il7Q06Y7cLaSKaa+DYUj0Mo5DE+bAVKbd52/Xtkg3jz4bGdNL2R8Vzb90IrWJhqNTZp1DCGXfcPIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKDiGhY0qi6Zhw5yz3X3KRvVupBpI62BiZwruuZTFwI=;
 b=nirKRPoGuYviayoduQYiDLpnKGrPznxrgFpoijZYfxPNEID62l9Wt+wGi67is3VbnkZScRCraU7tXnqAaZK9LbDkBMsotV+OJ81+pL+yR739cVmenh/4eipTLMaZ0PiNMzaWhr+NfIUgavJvxJXOA3JDYjhmHv71ZMVlWA/CMC4mFK02HKiw2FAwXZaQ0gXW5QS0xsN0Yt+BJ1MX5NY+KhZV0cL0UA7kdr+mX5syo0LTPGiABT4VmeDAW2TUPvWYwEZEmwCG6voBthdyWUYguAM7aXmBF4YL2adm8teB9pTlBNZXimi6/yMv28sZRsi2tnqHIS2fV8rhh+UyRtq1UQ==
Received: from PU1PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::19) by JH0PR04MB7250.apcprd04.prod.outlook.com
 (2603:1096:990:3e::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 06:28:30 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::f7) by PU1PR01CA0007.outlook.office365.com
 (2603:1096:803:15::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:29 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:29
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v15 20/32] ARM: dts: aspeed: yosemite4: support medusa board adc sensors
Date: Fri,  6 Sep 2024 14:26:46 +0800
Message-Id: <20240906062701.37088-21-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
References: <20240906062701.37088-1-Delphine_CC_Chiu@wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|JH0PR04MB7250:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 42980c3d-c9b9-4794-56c3-08dcce3d1f5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MvAUnz0175n/MDUDiE1yjneZulwIxdLDvHcf5SoVhDcN2xQIDFHuP5GtJsTk?=
 =?us-ascii?Q?52IKv84yOD1vrCXpJHMvzIq1ZCX1PLdtnal2IdGuG/azSFjkuffvouACG64f?=
 =?us-ascii?Q?LobydKYPkisENdqotGESgbXghjtCL0/ahGaazy7Nnzx4fjcXtw4m1Ua5lWte?=
 =?us-ascii?Q?4XZ28wSMJ9hVsa7JPAWRihbsM/4oeZw45nd+4+rHMRIMmF7OqY+LUP6c+ef9?=
 =?us-ascii?Q?KqqSUWfzwz7wzVReK18rFcKJgrx6pSPhwQpYXKEuOc6G3D/lkmQSG8kiJ9Gs?=
 =?us-ascii?Q?/dHXYsHGAqQw4LfiV4u8mG856yPHl6mJhLnzMztx+3g6yEvtHIm6J49pxs5T?=
 =?us-ascii?Q?1JuFuUTWNyIUG8/xhwJVwG+ruXKjTp0PnkqIhTtCG/1n6R7t0EPVNDjJpdhN?=
 =?us-ascii?Q?caa9dALaKLZumABqw5ULNCNN2Mx6j8HQZVyc4pc4Nif23WYTEbB4bSh+N9t6?=
 =?us-ascii?Q?GXl7Jg0LHvLhtV7RYodD/KWO0ouiFcSDuyihLrMm0Il6VVpQqO9dDpQY2uQ5?=
 =?us-ascii?Q?1d7Bsbn6kpCIN/vxMHIRdXBxTonvJr5Qb9GsYUKCjR3SMNeqIIabIOb2fanX?=
 =?us-ascii?Q?wymD4OOyFbOiKImAyqV2keuTf1aoF6EwGevublquFYwsOUBRDfo7mo+GnYWH?=
 =?us-ascii?Q?y9nPzi6wNslhMf63yhvMonD9CVsN9Owg4HPMD9yTvQtYo2raH0/bFInH8q6T?=
 =?us-ascii?Q?peiTTb2YhcFfOrQgyOFNq69ZbI49gBooxPYMxGjuVmLmY1dn9TNyt42uzGbt?=
 =?us-ascii?Q?oZfIDYHXHKoGfPQLitXeXJMOC2sAr1HFpcz8Is/jX4xhiedF/9YTWEyNFOp9?=
 =?us-ascii?Q?e6NLGa4yvQDuZcy1mO10pJZE0Yhmf9O2xRv13uQeKtGMi0e+8xfIWOO6P/uI?=
 =?us-ascii?Q?ZsxLEfzCCmgTicjOvJ4dq+OjXGHJik0a0e4cZNSv6VTobF94XmAxkcogpa2s?=
 =?us-ascii?Q?6tFosut3D39qLGrc129BnlW2VJJmEm84AKfjSutbXltUQ4dCDoHcye+MYKiT?=
 =?us-ascii?Q?NrRo2z+NeW17m9ZaKlbAgMloPZn+Pi4Lx7kfBWIdE+rt1F2XQiwOuOkkXPK6?=
 =?us-ascii?Q?7OeDoWOE0cH/O1dbXB/WXxDOJ5Y62SAKtM+PzkVhxfNATai0rngz7WE+B7in?=
 =?us-ascii?Q?EZNzmGwnTPG5MFRuM65QmuWj0gm9gE8N5+rGN0cyWhbZE94PQGZXwEEz9HtN?=
 =?us-ascii?Q?goFJieSGFyz7xGsijtLxNmUEQSwOQ4x+b50P+MiYbfOtoIAjIYuUG2mV0dBZ?=
 =?us-ascii?Q?s0a/NqraWvONbb53u8LRmdsN7gGoA/oNm3evxky5hbn3NtKk3Y8+isMFJlsy?=
 =?us-ascii?Q?04jOK7uU8SQG6ff3E6AFnki0l4GsQaW+uURFnvYP+7OBD5VWfEhHB6e+CIyO?=
 =?us-ascii?Q?VbGH7Rygl7CW0MRMBJfSVq/1MfLFj2QUod2Vz/i25s+kH+6wg9xtryww/8i9?=
 =?us-ascii?Q?ZEmrJjIylCdxqnEGhrq3A4HchRfxilxM?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:29.1624
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42980c3d-c9b9-4794-56c3-08dcce3d1f5f
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7250

Add ina233/ina28 support for medusa board adc sensors

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-yosemite4.dts    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 98eeee49b082..49500db53a13 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -915,6 +915,19 @@ power-sensor@40 {
 		reg = <0x40>;
 	};
 
+	power-sensor@41 {
+			compatible = "ti,ina233";
+			resistor-calibration = /bits/ 16 <0x0a00>;
+			current-lsb= /bits/ 16 <0x0001>;
+			reg = <0x41>;
+	};
+
+	power-sensor@44 {
+			compatible = "ti,ina238";
+			shunt-resistor = <1000>;
+			reg = <0x44>;
+	};
+
 	temperature-sensor@48 {
 		compatible = "ti,tmp75";
 		reg = <0x48>;
-- 
2.25.1


