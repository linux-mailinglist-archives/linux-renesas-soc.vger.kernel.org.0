Return-Path: <linux-renesas-soc+bounces-8765-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC94696EA6F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 268F9B23F63
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A539157476;
	Fri,  6 Sep 2024 06:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="TVJv2A3q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2077.outbound.protection.outlook.com [40.107.255.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CDD14A609;
	Fri,  6 Sep 2024 06:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604078; cv=fail; b=jjgKHrcYorzW9+MDdSSHm+tl5slgCte0bBjPQlGFPmK0GZjDqIU8X1N5ES0itLdwSmhh66w6bBSYIBgoSDMwPKnnqu3dzdOCXyH5+RnMT6btz7m0SD+QQz9MzAuON9aws6FGe869zlHpSGB9wyLDND3Kg7zTjsbfMWvYYIQ/iC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604078; c=relaxed/simple;
	bh=yAhriQXECovPY4CY9G/URMvwVnjt/mWrgCqZ0IcJHTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sEvndAumnX4hbWI6bzLoIINfLFuITA0pvXzXjrhsscEb5YPdD9SNlB1cgMfr2g3QaUqAcu8pu8RJUO3uAvCgGol0+MrcotuIYGZ7Ae+iu5bQf9k0R6UyOPQxy8zyX01Tbf6/Fj+atIaGZ+vP7CXI4UobaDtxqB1T32hYK8KfLyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=TVJv2A3q; arc=fail smtp.client-ip=40.107.255.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmziqAHsa4hhck4gjw45I3w7z3RAI7M1aTF9APbMaVFHXUxEY5wUImMpthqkOCBp/EP2ycH2Bioyrv3tVhwZAABMnFcs8BEbIS3a6OMSZXSsKsKFUUXrVmsbRv5R7JX09MZMEaWSiz0UBA3i+ewI/Fp3Zx8BsvOWzQfaQKmhVka9Y7yi1u5VGpgx3M4LduDkIymIgqJBEIZeJP+bEnIRlYiEhIvLpw9zKDsKKb5AO+P+V1juoj5paOwLYxh0gNfLRPe2hLr5z+0hWOzRsU2/Xi7MsJIyGXohvIXC7+dOb7IaWKVjRksSPHfFHYC1wirj1y1BztxuI33+e4DiKqMeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1Mo5JFgxGn5H6HKsVEDEaSyXk72X/JC48fJnaRvMS8=;
 b=X13LVfjH0MrWD4ctYplGvtKEbN2CeYZd7/NHe4Z/R9Qv8jYpvhiX22nxYuu+uPnD0GCFoT2ETul/KT/vbxHxPhs7kbWaweNcnM6Wp9SegUXqnplHKLJBH3n2fEvnfAJETocjcbfakYbw4EqtSAkFyS2EuH7cU0GUU+ZbZ8AeIuK0btVcKh6b0mshHJDpu2G05h6pgi/rqUGN9L/3RrzRR7ZvCyWEE+AW/8LuXSXCj5O1mV6bvw3PO4mEIeu6my4Sb8HGc2wbdNgWzpzaZzxEVVn/880EjRX/ctlN4g6gHpejSQ5t+ViJbP00IziUDP0qSK84rpcmf9gCvwlCqvkkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1Mo5JFgxGn5H6HKsVEDEaSyXk72X/JC48fJnaRvMS8=;
 b=TVJv2A3qtnh9IY0f444wdQEAcEZyppHZ+CBqPc8NPwdHkkgYEZ9ajVANv3bcz0XfZUQEIbWo1JlRkSbfWlnxmroLpTmDZl47/I9sQmGhcpMBbB80iHXcxDAv1bx74JadfN4nKZXplNrZUEUj0jMgfWt1nYJIkTSF/JOPKOS1VGaOFLs0oINpUfpi+/nVSkHpkvEK0X6IhqHXifiRwdmOqRcniYBmotDFYLuUCTXkw4dr4LgimnWI7jEr2qKbmoVrtCzgqJucElqZ3wTCd1ZerFOqmCFUtF2aoBB1y/6cL5SjA+ySyHFTl7KprwVR7p17BHiqNBVb8vhIqwiikdDrxA==
Received: from PU1PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::13) by TY0PR04MB5609.apcprd04.prod.outlook.com
 (2603:1096:400:1af::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 06:27:51 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::14) by PU1PR01CA0001.outlook.office365.com
 (2603:1096:803:15::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:50
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
Subject: [PATCH v15 11/32] ARM: dts: aspeed: yosemite4: Add eeprom for yosemite4 use
Date: Fri,  6 Sep 2024 14:26:37 +0800
Message-Id: <20240906062701.37088-12-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TY0PR04MB5609:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fed00f33-209f-46c5-7c93-08dcce3d0890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DArAu8nlgeQKERwMttYbh1slyWQZhXoJ/0Gzvu4qiZgdxDcr/ov/pQYb3VqL?=
 =?us-ascii?Q?xMcRuU2/LenKjTUrawXE9h6WwiRDipqUBTjBDsyxyijlqHej/VRRl12f/s1O?=
 =?us-ascii?Q?AYVBv3lfyjxSay7yJj3ud9G7YDWyr7GAO7h7EpIT6cfbyvROaIyT3w5YNGVR?=
 =?us-ascii?Q?tEiTyYMBsezWei932tV3c3xaC3a0uyl69xjP/9Lbhzzq+iA3gWo7G4iuJ44Q?=
 =?us-ascii?Q?vKrjyax9mTjp4/zKJCj+TvCJPQd1cgQGvY4PfsKZOn3jd7VwIn/jAv8w3DM4?=
 =?us-ascii?Q?VMS1AnfLShi7wnCz1PzDoAb6k+TH5j67y/9KPuC/zBz0BaaWhS939fyN9KcV?=
 =?us-ascii?Q?QkptUa4f2tCppUjCbmkUbwDk9tXd2TKtseKxKeRSQaqaCwoSSikrv+1y1WlK?=
 =?us-ascii?Q?cKHEA4d5fIdHMFyVQPmVCGVJWC+85JVulPbXncLxffqROCISDUEFejQQS8xT?=
 =?us-ascii?Q?Wn1adBBsRIV8SQtz9sXpOgMxMSNZA6ziQlTvUosF8aAruu1vZ/XWIMro5mmO?=
 =?us-ascii?Q?rkFPpJuqo++G9ZEf7sbxpWe0mI3IBvPilpQh5JlfQNTVgguDLfT8/oqZAjag?=
 =?us-ascii?Q?Sw1jaEADi965KqT6RxBYA3bzthVupWfnA3TC3VtuJUdAVWAP85hVZE44jA6O?=
 =?us-ascii?Q?XxC6QefHA781tDQm6vbPUhGC5hkr8D2kvo42qmKRuoaopxrbjsPYSBk/Nh9a?=
 =?us-ascii?Q?I3naTtEEMEUCGsid+j2IQoFTjcfSs/sNGXuG1crdbPjCnUVAMFMFLBU3EQz4?=
 =?us-ascii?Q?uANXZ3sPrYQOTT55R2RKBPG3Be393DwdymZXHB5STNb/rg0BbaUGc2lz1C7a?=
 =?us-ascii?Q?AFiRpmfBqVCcFzvsep7OU0rhUzQqN8R4X+ub+BEeZBJkeLcrcSgTya/LvhfQ?=
 =?us-ascii?Q?1WnPekGmPaloz3DE2utK/fGThlxtrwbh3xvqdrU46cDvf0tcnsqHs2dbIqJm?=
 =?us-ascii?Q?aF7pei8RPYg/uqRlUe8qo63ixuybDkHTVP+8+b39B1CrqTVzm9Yop/PWFCtQ?=
 =?us-ascii?Q?lGB5RyWDzzD9yIN+CAbt1wPLP4j/zp9MD4HiglJFN0LZwUaPcMKv54mk++w0?=
 =?us-ascii?Q?B7SmrMIITEmRfKpJffOrKgdtbDdmPRPSspQDVx0iCXaYGQlVyxobUsIaggPe?=
 =?us-ascii?Q?S3IRamdwbRLYQQLranhFoohBwwT+1JvzOtMQ1rkvTLBjMmpeqXPl0GdWWH4P?=
 =?us-ascii?Q?KJwZHRAIx5bv4F9DWA6BK1c83J1KHvqEo4m4tY/RVDO1qc3DZvpWtj86xl7N?=
 =?us-ascii?Q?V2eHQX06kU08nPn34G2kUcZk0oIEgbNWdh7ERCMb18ZLMjjzqBdKNaEfDlHR?=
 =?us-ascii?Q?ZAnVHRPeCfl34JCxYLKPqTlNy68cPhXm31Uq/B8FLwP/yGpxczItzq5jJR2r?=
 =?us-ascii?Q?609/ugEpm3Xx+w8lFoxgddyg9jEhlgxHehhgVzyZoqaeftDEeUnKphvK2TCl?=
 =?us-ascii?Q?PQE8MxxBx09wRpSLx2htLacutRuNZEUY?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:50.8812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fed00f33-209f-46c5-7c93-08dcce3d0890
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5609

Add eeprom for yosemite4 use

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 139a09de24cf..e83cb51ac19d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -932,7 +932,7 @@ temperature-sensor@4b {
 	};
 
 	eeprom@54 {
-		compatible = "atmel,24c256";
+		compatible = "atmel,24c128";
 		reg = <0x54>;
 	};
 
@@ -971,6 +971,11 @@ eeprom@50 {
 		reg = <0x50>;
 	};
 
+	eeprom@54 {
+		compatible = "atmel,24c64";
+		reg = <0x54>;
+	};
+
 	rtc@6f {
 		compatible = "nuvoton,nct3018y";
 		reg = <0x6f>;
-- 
2.25.1


