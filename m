Return-Path: <linux-renesas-soc+bounces-8772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BD396EA84
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73B991F21CF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D159314265F;
	Fri,  6 Sep 2024 06:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="hfYx2Iu6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2084.outbound.protection.outlook.com [40.107.117.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3208815A868;
	Fri,  6 Sep 2024 06:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604110; cv=fail; b=sELz0T40agPwafl7uq07rDo0kFcHQ1C89LjbAr08mtOopFAC9404OkNk9FUX0o9RXk/p11SoZb8TenOBSZEv2rwl7te9KC7E7qdlohyvBdS8YjzYrV9naLZIzfEB8sRYHlU3++lkF6QEfcjNXC3U26Ic5E/OH8osMoOUaijtGOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604110; c=relaxed/simple;
	bh=1cxP5pczgJ7valwzodgjXvVTCSFyJVT8lUAovr6nm6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QJhU7lTVLXGFCrUsSwY5VmVE4W+jHS5Vfnft4xmWmq16G/zFUX6icnTM6ZhxfnCaBE1SLlux4Vyzh9WXiL8ru1TOiu/kB9hLj8FC9dzMR+LVmY/stqTD/7afs2jrpKv2QjRExLTDMF6eNyn8TKXtj5G95tQdcNUI6tNolzGJuLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=hfYx2Iu6; arc=fail smtp.client-ip=40.107.117.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hklUF7Mt5AnWPXyu8Uzq8C6Bi0i/MeuH/7I5eZnIZV7xVL2fYjwLOWKWSf+FokqPdYyM4tohP7K8y4a9y8cMGHb+2b1dlo9Z+KUOiKM6AZgcIgg31Zqx5SU0NYBMkJLHVL6LFtNBF3DtAV1pmJVfQgtwQOEfMBFITcbyxSJWKxaShbi0XR/C2rp/Cz18oVOBTiRa7dPycgbi9LhUUz3B1UT9P3W6eBn/LdYNep3FSjCdaKo7HDde+ltHPHz7lUm3kd5UH3Bm/r8h+uJIANB5KEyzY3z66Yt1UOCwHolE9MZngASAHbHtgzVH0Z1pzZgU3ir31DUVuuiy9K9H2dIEQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deWOYRp1IarhLB5qRFgI0h1ErIRC5JkaB/gNs5HJuG4=;
 b=vc03eVxcLeE7rSzKEhw7M8sw4Ez05Y5WL6IvRh0fOR2DQ2tBEa9G8p+AkpMBdWBchjoBUWDbkcTvF8KGLOvGsbYVVa1PhADOzwRNoueydLKMmlLNeyNfi2URBxJgUW9Ln+3Cn9CkZD432+NaZ6tfzn3LL1GlD1Rr/i9KkGkktxWf7Qw4yfHGk8BiEcIneFpGcLkRf8Mvh1r8q2qvsxCj96VO1rsg/LbAZbTRAGjQsP/A9AFdAsXNL3c5XG5pXtzdfZDuWCRaUV9iTQCl7JGpbGGcBaECxUI0mYlpfFummBdCLcB4hMoc9+7Wiy24tyHgYiyLHZ18rn8CGo9TnCjPbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deWOYRp1IarhLB5qRFgI0h1ErIRC5JkaB/gNs5HJuG4=;
 b=hfYx2Iu61D/Xzhul65PiAPZ7RKgxdcGkiXBwiuAwnIy5uoO4CbP+mGEVZHcJdzCqQ6LC5ylDd17wLLtauyj5zlQcJI51V7jxtBEg0aIWOupUfU39HHw2+pveZu74aFgmTBn34/qkknPDwV5FV6uUbQIUBoUS60eVqYQ1S8i4UZK1iRed6Oo+P7RvJqB0JABCFR0fF2GNwPyXttfgcfVlk0ohbzFb5ObDpn6THM8x1Yenv9jqGaH9rrUTFK7qXaSepLsjr+Ru4PQUwoso4c6kL9nw1qjT+XqDwW0A6hwc9U+e6zlurwQGdJYydJHr4FZrQm3i2gavbpnGjl7RIU/Psw==
Received: from PU1PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::20) by KL1PR0401MB6514.apcprd04.prod.outlook.com
 (2603:1096:820:bb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 06:28:21 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::e7) by PU1PR01CA0008.outlook.office365.com
 (2603:1096:803:15::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:20
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
Subject: [PATCH v15 18/32] ARM: dts: aspeed: yosemite4: add mctp config for NIC
Date: Fri,  6 Sep 2024 14:26:44 +0800
Message-Id: <20240906062701.37088-19-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|KL1PR0401MB6514:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3e5ccd55-0355-4890-f7e4-08dcce3d1a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DeP/Zd8KJcl3qrTkbRk9CFGTylnKSqxf2uh4RGw9zBDnkhd5reRB64mjcmvc?=
 =?us-ascii?Q?DMac9tKpURmObVWua50laWafnx+Rm5LUX3E59J7ll2eusSi+9LsRUJjBVOS3?=
 =?us-ascii?Q?cQgjqb5WoI1uG1POR7xyfzzuKdR9U6A+dhEXgh3cZtxNk0NZ0HDZ1S+aDCVQ?=
 =?us-ascii?Q?fW4ubFRVra3L+/qT6sI/HuQ78Q/utXxqDAiAwqY/KbjqUd78goR4CwlG65H/?=
 =?us-ascii?Q?+73S7haNl7cOxDUtouQoWuYyOlsWmjKfjOBjGC9H0uDT1Ej1IKtB02cFP1IL?=
 =?us-ascii?Q?GtcnmHHR1RRtwZM26l2KPg47wVa6wR94KrSJlDFuICUUIqMaTaXQGV1ZSq5U?=
 =?us-ascii?Q?FjgxO6TtfR1nWao0mxqJmyTTbO5ufCWfRlz/QwctbDnUybc7/gBYIOkP+6F7?=
 =?us-ascii?Q?Gyq9Rohbpat69MDHTY7cMuBG4ODdD/6HFtm2kNAtDDp3FE2RANC/Hyf+ot4N?=
 =?us-ascii?Q?fdMVwalfnolIs/shy+oJ3Z35ljltGkTCbPmjXCcqrt6mbX00wqGiBihruJBi?=
 =?us-ascii?Q?qOjdgypD1r42GXC9dbGMlNuILZcMsemt10T4ghE9PfeRPDF9obeI1U++m7cW?=
 =?us-ascii?Q?sEkb1jpMymFhuMrgiZF/IOkHXJikZffjyKag4hbEkXvle6weQ5t3h0GiIR8b?=
 =?us-ascii?Q?3joVsqutv5UkdskKsVYr/wESdA7MC5GSa2DUzQntAgrvE42XSkhnDzigcg1z?=
 =?us-ascii?Q?sQpc4leWtA8sNpiHSq3MNsBgsXnsU+J+UlpgOH5MvN/GTQ6wVgdf71esGbF7?=
 =?us-ascii?Q?T0gaf3AjKBPmbpXLz/Pq8RUygb/nrqcp9uXhHq/HX45G0iRs51Xdb44M6wF9?=
 =?us-ascii?Q?5a/IOu508m5ObMzys1M1h8/B2yvf7QE572dgoMRZB9rxwlzZ2VNsyuNRYA4D?=
 =?us-ascii?Q?Q9lcWbMToRz61aYKYBzlzByFp7VAWTZ92gXMcgbD7fZ/Nf0LHO7shuE3k9I1?=
 =?us-ascii?Q?YOqKK8ToMnVKW2mT+40BAVbXrvCP9vcAb4tEPhfgcoDxoQk7h3xBpuF43nKk?=
 =?us-ascii?Q?8lYhX8qZrFdmOMtc0wCbhJE9IPlMPKquqOJzhk02bSXZgVrkvVo2qE9rJRrj?=
 =?us-ascii?Q?eJmJAzcsYGAd//kq7tcT1q/vPDPzptC+bN/xFGTBWfVRhHrqKcWpB32gw+N2?=
 =?us-ascii?Q?jV3M6kU7Ka9PlOUVuTFVTDYusj5k3fHbl4HZhy0Ui+FyGkYlz9yJxWFqez3I?=
 =?us-ascii?Q?DKWL5X/nO3pH4JaCyhlJ9pb4fMwIZq3mX7didmiDu8tNEztgavtT+pU3HURQ?=
 =?us-ascii?Q?MAM4dthWi4MKAXshXUXpgDG5i5LECQw7HFfNHwSUqzgYpTvyldGwGnvLTPKi?=
 =?us-ascii?Q?9caLPeYXY3bvM2qX8WpZqThgFy2P9mKJ9BEV20MqhK605qiCeWacNvRTisQ4?=
 =?us-ascii?Q?eUfan60lXJcsmO94pGIk9NbvN5UtTUJeROMpdmoOUqrQygSpSlfaHiBb/FmF?=
 =?us-ascii?Q?ju/fn98EYXjmG/jk0OeBdKE5kBh/0sO2?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:20.4280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5ccd55-0355-4890-f7e4-08dcce3d1a2c
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6514

add mctp config for NIC

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index b46a0b9940e2..7b8a2384d99d 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1281,40 +1281,64 @@ imux24: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux25: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux26: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 
 		imux27: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;
+			mctp-controller;
 			temperature-sensor@1f {
 				compatible = "ti,tmp421";
 				reg = <0x1f>;
 			};
+
+			temperature-sensor@3c {
+				compatible = "smsc,emc1403";
+				reg = <0x3c>;
+			};
 		};
 	};
 };
-- 
2.25.1


