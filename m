Return-Path: <linux-renesas-soc+bounces-8785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 955F796EAB2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CA882815F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0A3166F2B;
	Fri,  6 Sep 2024 06:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="lfp5Sslv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2047.outbound.protection.outlook.com [40.107.117.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D0F166F0E;
	Fri,  6 Sep 2024 06:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604157; cv=fail; b=VfmzXuplO7mkBzfKEAdB635SgSwvqUGEX+8I4Z1RLYczU8C+UDzVK1Pxk3VQ3bY5ZOOeOYrx2kNKQueNMNfAnFgZ4Y+PegF2o4uJriK43NgDh/u+cJ28CKq8qdM3JzOoyEzxauigSlRbuH5ksdzy0jE86JFAYVUM2qE+eucDITg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604157; c=relaxed/simple;
	bh=6o0meM2zNcpMtarswQL5GyEDXjCselUBBs+G9XtXtac=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HM3IwgklGasyS7T8rO0Vn7iURyYtTXh/38mSPSFfrJo+jtpPEeS5fq71ObooQ5QHctSfoX1eJC9QG3xcMmOGYy0IM4AnIzXCO0lK4EbhDnSNJ3ibklqnQQysggVOvlt2accPfgpbooC7E95ktfWS+p2iYg+DffWMdmg7wt+UsHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=lfp5Sslv; arc=fail smtp.client-ip=40.107.117.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eKrf32pQFjiqn2/5NwsQSTNH8uuI03R/m4IDS+w69tJ67DbVlOIdL4MqVN1EeTs3K/uShlh90G7ssFVa6ZLNlCColAUykonivzP/wOhwU+wg/QkRw/7jtaTozGV0oj9WmqMVsuJijGy/8ZwevtHKkip0u927Tfvc6NTnDSLLoRaJ4ryymmNkIIx3lvlltthX4ISusvgOdE7IWWd6JtbVrz3RZBM7r023FnJ46LlqzyXVLDqxrlYS/f+Bu/Qp2qCepNpptENAU/uFCpIVCjYBJl3/EzXqKFKg7BTPMHwx3vQmSIYMTPs8UCmenI/DdXK5FN5fcUfRqaqlafQ8b4S0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjaARKguKay68g4+E5ltB5cy1A5x8bWHGkhbabGTogc=;
 b=V8QNzsmChplRnWFn2cfgIBhllREPV0bXnHupdeJUjEF+Iwv8sGjSESeCVDHDJ5RQuIp1uSXaDzmuykVNTNc+jTS0tfc5kPNRPEPxm3TWC5xHO40nFfJRubvsBJ2GKPZlLtDCDHdCSScl30dBjDJWsuyfQl62O0uGyPB7EIN8NrbgzkBR8rduae9P+7iZhElnR9sUCjQMsnIS9gH3fnuiYrPF0wGaieT4yY68t8Vmle67J6QjTHONoMR6vF58JnJ13wYbo+r+c/2U4jdvCh0gIXQ/b7TX1mMGpKqMg1D9jM8JJz6E2JvxVEkjryziUBrPGm3Eg7W8em4h+Xco/urBwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjaARKguKay68g4+E5ltB5cy1A5x8bWHGkhbabGTogc=;
 b=lfp5SslvRuyI7VEqwy2QfjWpgUd/CI1lSr31vcZyO/dI7z1JPnt3qfuxqu9zlBB3QbheUvJk1sTUyh3np5UzOvUtYLoTm6PidxoyD9K31qTXuH+KdLFRNYL/Xg12TsDmrAvCEkZKbwKPLVT91Cu00/WRssh6+oOf02/SRcjeiK0H8btXfBtMjBy8jxdDM70m5BssjsXpw2MPRH8lutVCEhEgQC43nTVme5lbRBXDVgKmg7wplon4IB7DmF5Z1yLjTAn0dFMT8Um6tfKd72kZqZHWsoEfEelq2AMBeNsMvPPQyuMxtWzN3krIzg7az85RlcE6TT8hoDyA5bQpib1VPg==
Received: from PU1PR01CA0004.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::16) by TYZPR04MB7073.apcprd04.prod.outlook.com
 (2603:1096:400:452::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Fri, 6 Sep
 2024 06:29:12 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::4a) by PU1PR01CA0004.outlook.office365.com
 (2603:1096:803:15::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:29:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:29:11
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
Subject: [PATCH v15 30/32] ARM: dts: aspeed: yosemite4: add SQ52205 support
Date: Fri,  6 Sep 2024 14:26:56 +0800
Message-Id: <20240906062701.37088-31-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYZPR04MB7073:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8d242480-cd7f-400c-c48c-08dcce3d38aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?APZBPNqEZvrpWoGjmSzO0uR7kQVagb5C+0G3nsab8S62ujuv0OfrWIOEJJFi?=
 =?us-ascii?Q?XJp5dtONlYXaHfGiTbDvgwfsN21hwD/Jfl/EzhvZ1zeD5+YDgcTX7SIRr/js?=
 =?us-ascii?Q?PYi2YalDXKdAPzE7rrHoM8MZyNNpM0T1PkQtInUbAj/fAoAQlVYyeifXuyKj?=
 =?us-ascii?Q?VSMRaWDgTUAWnO8tTGkszcC/dDme+Tb/DGksZo+stUN6X3wBTFf7zr9pEC9E?=
 =?us-ascii?Q?j162AMYFpXHjSDaEh6wNoxV4sXXFho+o/9M3816OuQ2YX80ghCy8w6D+a6s+?=
 =?us-ascii?Q?srR9wDOrcRTKh56gzE/fcxSUVsD3AUN0nca5uzby27uGgSPSkmKbPxF5xIs3?=
 =?us-ascii?Q?UUHuz+Kv6zb8daQeCIAxsQtPc5/PKv+Tcm+Q0+of6hhlnoj2T82Gu1poS6OO?=
 =?us-ascii?Q?zPf+CR5iONn341m2+hp6gYJoL1J30fZOY3cTeyV0U5biRjarou+NIaUWygSi?=
 =?us-ascii?Q?dURu6pcbXUUBXLOJRaKT4gYcCo+zZuY9piQdHEak1POJ+NM9YwJjt1QF8wM+?=
 =?us-ascii?Q?X+F7rx22+odkTChnOrLy0CVG6VN3yiW6votShtGt/nvtUsZpRL5L/JRQYSlG?=
 =?us-ascii?Q?MGtUOo6JYLUj7g2NAgklTKh3u6A5ullqOZk4N2E9ajGSxIjk91DC2quu6dl5?=
 =?us-ascii?Q?zjTRChM4UvCACZG3GtkklfyFKSvJ1aB7yHVjtmPD9wPeWS/natr08w3cP0xh?=
 =?us-ascii?Q?bBDv9LU0r1UGP6jgziMM5Kjvf5mi8dp5Y8W3MehYpVonGB1QJj6BdS4z9VVJ?=
 =?us-ascii?Q?B/wb1mofiQ6ycTT//6Wahx9R3bFb7xS0My0sjssg/PbE1+Bfhei6Xiye6TIL?=
 =?us-ascii?Q?mcfnVJ7mDzF2HEl3eHTWzip3AA/XJN8LMwMZISuy+GFjPyw2qNGttxpuE93Y?=
 =?us-ascii?Q?+r1LS9eGc0D10xI32jtQ2gu300g/VZWtBv2yKrbbsSZtIi8+6WwJXuZhWlaT?=
 =?us-ascii?Q?CcUouGR2FTZ7ZYLqOkcgtPPH+Q70GuCt82mZ+t/UTK0bK4bshXNmVHydLQz0?=
 =?us-ascii?Q?Sj0bfRR3/5BEdMEZlSl/oQX3pK50AhjJejW7fC+q1ZzNpmjygoe5Zuxkoqz6?=
 =?us-ascii?Q?GbjePaeQiWNanqkwn1WKkRlF/e2WyFiTQFVaHQlhh72Yh+sKfawDb5e3KlJn?=
 =?us-ascii?Q?oGIwziufFH4WuqSl8DRDDs75RSB5bEm2KK6IVTuzURtbN14S0IOObOdMBshy?=
 =?us-ascii?Q?cwW3sDISQFPHag3iaW/gYTjjCHXYJwhoQeE0eigY0TqcJaW9o3aiEjwBUH52?=
 =?us-ascii?Q?4Vr8R6bTZolYFbT/CU6VLIQBO32BtUOAeKaf2Wt7VQQI1b/oOLabUaRk4dxA?=
 =?us-ascii?Q?f+Bn5ySeXPw9zfng3NeKK1q/d/0W1NZKcERfXZMeg+SRWZ99N06tCl93cZRz?=
 =?us-ascii?Q?waFJtmOjHuqt8DIsEM0xKtB+GnVFQ8C++33a51mwDifgOdP9ZQDdLJPulkkA?=
 =?us-ascii?Q?lHPD6o5lxM0Fcfk4/N/vg87dv9WX8mPQ?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:29:11.5997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d242480-cd7f-400c-c48c-08dcce3d38aa
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7073

Add SQ52205 in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index d056f6d5ff6e..04aa428f94b7 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1245,35 +1245,35 @@ adc@37 {
 	};
 
 	power-sensor@40 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x40>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@41 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x41>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@42 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x42>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@43 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x43>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
 	};
 
 	power-sensor@44 {
-		compatible = "ti,ina233", "richtek,rtq6056";
+		compatible = "ti,ina233", "richtek,rtq6056", "silergy,sq52205";
 		reg = <0x44>;
 		resistor-calibration = /bits/ 16 <0x0400>;
 		current-lsb= /bits/ 16 <0x0001>;
-- 
2.25.1


