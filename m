Return-Path: <linux-renesas-soc+bounces-8760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C13596EA52
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E49F0285CE3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29A0153573;
	Fri,  6 Sep 2024 06:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="j3r6ucsn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010036.outbound.protection.outlook.com [52.101.128.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B48A14F9E7;
	Fri,  6 Sep 2024 06:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604060; cv=fail; b=ae+Td+XHAsrHITz2YKNIamfgatbvql0+wBe/eZf26NerPzJ5bKRhg4ZwgvRnJdDUmsIAOfQO8R4mSUippFbFjh8ptEB85vwNPi27/Lm85KqmXiiqQ13A3Ci0jj3GWVeRFm+1t196IUU4dA52lHlwKablykW1eH7gr9EGltWoSyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604060; c=relaxed/simple;
	bh=Wbkb7AWPjYhKrtGbgOzA/rhSvxJ8PegMzEHm5IEuWnM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f9/tGRKGlxBom4XP9qxVlZm7MlQhNhVZODKXORmuk94F6Bed3l9LR8vYuvRuOj02rLlVbuI7kb3++rnNx4r3AJZl+ZM1Ht62bYr4zIKNrb6urzEjoxGHu3a10/6NZxwM6br2jgs13NUNv4YofGoMjIIJ2pHRpAccIhcXz1J9RRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=j3r6ucsn; arc=fail smtp.client-ip=52.101.128.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gw1brxkLgh53ly7p5xauv0njon06uFlQEbxcW7YW7bx02eJlFvu9w5BjqEV50cneBh5PBmBSI2LBQd1BG64dn/r+hxVp5FT7L7DjO9+9RxYjN2KB9201BtWkRlN1oi1RSLKBpW1gPPna9rSdu8+JeOORR7JAH3wgeHkjxOGi9pl4dwjSAQItWmCzXQ11/DNi0oM8T3+uGCxnisWjHoHjH+Ma9IjAOEOgCgLDNZ4cf2TgfHjMcal/bieJKA0GUjtn9HTZ4bRXOBJUE7p7xyUDYXV4Nljt0TRDLsxw/v+ffIppl2nnFoX8U9RHw7vwWqT/fhU7rMxYEfpDA21UtZVtfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0cbZAgnLmtnZUJUsofCz9gNyd7yXSZFoo6OAwbZAno=;
 b=MT8DF24OGjL048rFVdXEGZdMrchBw7xNW1j26H0XEitJuro2a1wrUSgE9k73SbzCt2T5ORXxFD9IEDTikcL2O2XFUbAHFCq0nS3jiIuCKqpBkff6iRA4wGF2mQb12cRywSz6zHJOeL+yF1nqFkdwoXWHIZ+BCAvkPOwm0Y74h4plCgtQAgkeGMeC2pf8j+jcICrCw1zI8rAdwz0RjT3xMNNp6XUmZYUzTn6jYgBc/h0H5CVrOUkuLtfqjokEaE8dr/bM71tc6jOgI6nHpH1e6f4kEcAKsUajermulv8vq83rIKCQyEfjsKPQz+UVnjd7XmS++keW/E2382nVEDO3cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0cbZAgnLmtnZUJUsofCz9gNyd7yXSZFoo6OAwbZAno=;
 b=j3r6ucsnXTYwNxPuesYdhY52VHw7vJiCKE3ID5xi5HWFKBoMTiFwlMAKSW5prcw8SAfkS7ST7e+9bPMbNiZpgoXCYPITGp6IA2KU8wBWSu/4KQtaPlcdjdkHSOQuo9A6Ks2/yzUeU0mlBszLTqNaX/7NttjGYJCWVgJw00PU2Tdg7bKGxfEctSNw8cEPGsf5lOV52jS7cR6w2UGjZex0OMVAEJjCQ+Rp9cd8E7PPu3bnls17S27Spwnj5Vmg0upuxSVFl14IadjuecHFfiJn+n2W6VcSFUXmLqcjaHRO32rQPN1gTrWF0S+JOoD2gP3S5vVWgHllM1LZAV+rMrVPqg==
Received: from PU1PR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::17) by KL1PR04MB6696.apcprd04.prod.outlook.com
 (2603:1096:820:db::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 06:27:30 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::f4) by PU1PR01CA0005.outlook.office365.com
 (2603:1096:803:15::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:30
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
Subject: [PATCH v15 06/32] ARM: dts: aspeed: yosemite4: Revise power sensor adm1281 for schematic change
Date: Fri,  6 Sep 2024 14:26:32 +0800
Message-Id: <20240906062701.37088-7-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|KL1PR04MB6696:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 00f26c98-f790-4120-c2ff-08dcce3cfc28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l9hCMKQiWLEsQeUIs3CvzIa+CGiSCs+SuxhMcFQooJ3RNtbHat4hu++URMeg?=
 =?us-ascii?Q?IXzq9vBFrXKz4QHEBLdp7GXUDGg15Quzku51wqw4ydevpQBpFiV6ViXQSptq?=
 =?us-ascii?Q?g+MZTU4zf6XUGbH5r8DseTH5WnHVtrcOgJCZ7+/ELbCueAc33HQrKoLYFLBl?=
 =?us-ascii?Q?BgBXGAjq7sBhjGl1i5dmGmSdEa5NIG9vrI/+2jB+g4w48Xxgzd0vorfnIWH4?=
 =?us-ascii?Q?koSbvikh2pYHO773xbjv02iT6mfmEm+DszgpastRI+SIjzloi15QBQ95eSyT?=
 =?us-ascii?Q?YCxg5DWRiC57Tl/iE5NAuAD0nU2dRbF36iwHbJ7ziRu+gWCWul2Gg/0WDexf?=
 =?us-ascii?Q?j7dVdiH74uG+Pj9u8KwJL50uG3/RKOCseZpdJoGu2sOl080Ch6VUpl2/2bpx?=
 =?us-ascii?Q?Pj6raxRNm7Aoi+EUVBqTo4MwXRaFvtcGltS/ec3kblz/ttn0hKV9Fv43GuWi?=
 =?us-ascii?Q?rxOjYV1DedOMsbDUcrcXO3srBLrNvqBRmTy/5qO3bjfJp62lCCKvx8rV/vu0?=
 =?us-ascii?Q?KH+9bGQy09c4wxtNfOdW0Yep8X6omNoIuDBNSD+3q2AXkjeNvmSJkedkQggI?=
 =?us-ascii?Q?a/VwdvClBeMR7MCV0SN1FIPSt/BLy1K536qQDJmUm1KCl9ThsBkfm4evdDDe?=
 =?us-ascii?Q?b7E57R4kwJbqGKnsEyh707luyaDMLxr5ClVymDXgP1zsxZYqT9qMJqWLQaJI?=
 =?us-ascii?Q?Q/QurYW4SWV+nKlwLt+3ItJDIWmDPNaFboUWxwa2N2LiFKCTgcoYXOo9Ziwp?=
 =?us-ascii?Q?xB5a4DlyMsivoJK0eAZ2gh6LsfiGfTVn9PmP2DMHXn9tTfch/30Wr09h4ayB?=
 =?us-ascii?Q?ExgLdSiNkneaHBuZh+ZyaSwSucqJEp51FALzpEpSkbmFLosDa5gqy4TcSOVZ?=
 =?us-ascii?Q?jAzPnGc1s1teqKPPG0h0KNFLc7dozDhFm/c6AFZjdpr6h8HmXhf7W03t0sGD?=
 =?us-ascii?Q?T8awUv/UFtCwcPh8o7WA1USAiiv9FGur3SMm6vmgk70JMo4zuVZ05yAeRLfQ?=
 =?us-ascii?Q?AKrsuTllw8v9HIfdTvA87N0StzWw21SExmReD84pM97oq7QItLVGAQx+0faS?=
 =?us-ascii?Q?cjO8mTEPfiPACtbOXFZE9b0JNu4VHHvmmam2aMZDHOuoCF4dW073LbKJSqUA?=
 =?us-ascii?Q?xBUQ8Olxug3GF5hVNdnNMT1KyVSYV7Md3cltY8zi1VFhoC54bk0EfvWikzx+?=
 =?us-ascii?Q?XRZUobYLl3OYX3q4LhKPtNlhYltFAcGPRM9W4A0+IoeLRR68vgQJYoR6r5tZ?=
 =?us-ascii?Q?tR3hmCcp2mcSCizmyGROZk6P/Za76yP1RtOUsm5XWH8AEGH7tKfqVYXQ28Sk?=
 =?us-ascii?Q?9o1plOcM9bGqBtJeX72lrBA5EuGYPtyl0ZjWF0kMLITfHmTPv5p2GYkoFcAb?=
 =?us-ascii?Q?oHEEchpM7M+1b+uvvKBknVmrGOxRplPdAFukazqB3p00LQ35TIyt1+PDalOh?=
 =?us-ascii?Q?plwxEQrD1AdJEfwfgtHuBzL8qe3wo4uO?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:30.0532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f26c98-f790-4120-c2ff-08dcce3cfc28
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB6696

Revise power sensor adm1281 for yosemite4 schematic change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index e5354efbb903..7b79fcd77c8c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -176,8 +176,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -193,8 +194,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -210,8 +212,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -227,8 +230,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -244,8 +248,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -261,8 +266,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -278,8 +284,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
@@ -295,8 +302,9 @@ mctp@10 {
 	};
 
 	power-sensor@40 {
-		compatible = "adi,adm1278";
+		compatible = "adi,adm1281";
 		reg = <0x40>;
+		shunt-resistor-micro-ohms = <500>;
 	};
 };
 
-- 
2.25.1


