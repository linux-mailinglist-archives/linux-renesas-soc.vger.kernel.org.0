Return-Path: <linux-renesas-soc+bounces-8784-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F19296EAAD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2EE61F2344E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B6C166308;
	Fri,  6 Sep 2024 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="kq0mkvgS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2046.outbound.protection.outlook.com [40.107.117.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D01148856;
	Fri,  6 Sep 2024 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604155; cv=fail; b=mT2CIQg9K/UvK3cqdIACHs+jO+60HLS0avQ1vNcIPX8bimfMS/0wN/mEgHWpcM/vP1dnw06lePGXE4gYLlN8DF0d0QJbvlSig+Zb2Q6RfC0koJc0WuswBXGK2bCA6uJ4K5HrlTWpvZtBtMyTZ2WhAJYv6MYh1fvvarrLvhR13zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604155; c=relaxed/simple;
	bh=cS/9YApVsf8gaHDPQckZ73C8KOJ6xtxMgWUJvm6ZD9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QiBwOiT2e+FojL4CTWYxWQ2eQ0PNCDg+1n12p6W2tihmjgp1wVfXPjG5JkRytThoZ6U9PiZBM9XwwY+1vJLBZNIafSv8PwYwC9xGPe7Ak26RJXYtMS3oDoZJmm2lxi/4vXSrov8IVhmNUJyk36za1CX5h012b3Q5yerT4l9av/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=kq0mkvgS; arc=fail smtp.client-ip=40.107.117.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bo7xuqwznk8AReALj4yEhcWJAkmsQWgtcbJq/KNr60oks/su73sizWtpEl+i84asXVsYV9YRLa41SSgebV5MWT52hjWPAMRkJNtH7Rc7lVvL18vToveHvEUWFLVWkIKON23ZmF1N4AHeMtqnhg1ZXw8Jzkqj7wmk/oriXgw4VbZgEUy0YWjU0w3MyyPnb83vc1WUIZZkM1q3OVjQM8WQtHhrT5XYB3b6IS4DmUQHoCARjXsIAE5aNeD50mGFWvimAIX00A4d/Orko/x4wEX/sojlcNFjgzQilRS+Q/ZXJTNRD6jHQzRrZusLWV0p1dvVggvMNbGfKRb471te7YqzPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJty/Sn8NpSzsj8QpXuqGnw99pNMtTMnmTt569eZCKk=;
 b=Wgheg9YLTBJICpXQAWbs8/AWLfy9MMR/iy/kdxqi4+kagekD2qyYNXEMkt0eKHvnfKxzJzHv2fJjmGX+36LANVW4+UHqKMP+j0rbidQhCAcMclwPE9rsvoELmpdr5QSygkmA7oT1mcm9Jjo21Tzr6XsZ0yOGL5EUUup2Ex9WP+zTiKMSx5PvtkQlNtM0vBQ2QW8xqQ4FZfVuxwfbXlBU5HSlP6BDfkR/wxXLma9uq3ZLcjdWGB+fVupbguMHST2eiZa2ifK6IMOIMAM7TvY+HSOYNNenUYgjbOEEU8ixhP5rS5RtQayu/SsD0h9fS6pKGzWdZoyL/8qpjte3UOBnYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJty/Sn8NpSzsj8QpXuqGnw99pNMtTMnmTt569eZCKk=;
 b=kq0mkvgSkWoaNQWMHUg4T2HrvDVnGbyBKxxKfg4oKsbYdgZUTubwQCtzc4Vb8gySTzPUPL6r948X0Bk3a7r4PJW5kld8rQG7avPZop/3nC1+isbfJ6/msRlKjhXBnDFsXFlpAErazG3yo3Y23BrprI4yx2j4W2N2DNRucyPRQI004fynuG7qYV8/skWNH1IZqzRtw71psqEDmuEr+QuZ7Dx8XScQXnmqKIVeVxzkK2kIMAmZ9JXVcy5sO3SHVuA0q0Ssra0uBVv4yrKVBEAIFLLgDYnOadCMNEhrLaY+yR8YS/Bt2x/Rx9tyI0TeHMZgqoyAQWjEQUBxetPcOxlRUw==
Received: from PU1PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::29) by JH0PR04MB7621.apcprd04.prod.outlook.com
 (2603:1096:990:5f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 06:29:07 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::c5) by PU1PR01CA0017.outlook.office365.com
 (2603:1096:803:15::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:29:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:29:07
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Ian-I-Chien <Ian_Chien@wiwynn.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v15 29/32] ARM: dts: aspeed: yosemitet4: add RTQ6056 support on 11 (0x41).
Date: Fri,  6 Sep 2024 14:26:55 +0800
Message-Id: <20240906062701.37088-30-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|JH0PR04MB7621:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b3fb4b3a-03bf-4db9-0b86-08dcce3d3608
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sxsDx6HQXq4s6TaRUCPoE3E1pY/gj4k1Lsb7yyUmOTpn6eec8WyzM7/+6dxy?=
 =?us-ascii?Q?2wn0+jbS2K6dZl4TwI4uQDma28WRX90DGeXZu1y++L9qFas6GWG57J01QjWj?=
 =?us-ascii?Q?CwthCprrs4IG6BcuzfcnkgfEjtyy0BJ2+9t7GHyTlvBXb/zabwcJcZdDFvdq?=
 =?us-ascii?Q?jv177ZYTN01xQvpETmkZ6kje/vxv7K/5UjOZcjEIWvENOb5MsAnH2UBrj3/M?=
 =?us-ascii?Q?BTZOGCwK+qwp2VxM2SXqZi+sXGMvfe+XoKQ04eePKDR60GXUTuk86u17xNkT?=
 =?us-ascii?Q?AjxSyPHPinm4XB1+7lL7KGCXaS60N4AYRTPcc8L0Jr393tCFFpk0dWu5knfL?=
 =?us-ascii?Q?qCZ0eDsi8smzvedzcxo/tnLG5cMaRvjkbGvRwE/hpX6y2XsQ+smR4Su3hLjT?=
 =?us-ascii?Q?zt3EWxR5jIbqisG1O5Qyn8P3ph/Y8a52rpvhjTh7GTUyQw5LU80rJbs6DGS+?=
 =?us-ascii?Q?VAbNC4BQPXrZOdfJBaXPbeUgvRoiDUeNvQqFc/uWhRQOKFTbA4xbVSmtJ0iX?=
 =?us-ascii?Q?LNpyQ5f/PKXKZ/JvvHcx4dM08UFK+D6+cbgEC4WZCWhZvpDuJptkkyGipzZ4?=
 =?us-ascii?Q?ifx4YVCOt8LzSQydrwK4zpDHTVY0Kxoc/3DUrRWWP1gFyKEFNp0RSlY0Tr7E?=
 =?us-ascii?Q?AeqOKKATOfnSHsmQ8NADPMqyagH+OlSvHzEMo3opDza1aKVIiQwj3ChGdFmL?=
 =?us-ascii?Q?Cmci5rTsq2ZYkeL2nopHjMJIBXB+WlzlTaxj6an0mVJUMmmXOXqmhzkOPG3a?=
 =?us-ascii?Q?lpgAQUu9WxoAAQHkYbOzk6b8kqHION9ZqAPxalz+YgeApJCTrUQqdN0g0eJB?=
 =?us-ascii?Q?Vv79RRY137fCn/xPpXj4Vb2cg0UXMoUnZ1dsXqqA43ILKObxmXUh0S/qAvhi?=
 =?us-ascii?Q?nYGcSUHKiFoCwz0hE89+FTpHznExlD8iH6qW6ld2eTffWCWj6obpw8gx9XIG?=
 =?us-ascii?Q?/Jyy+NIqsnh2x+kbnyzSkEF3CLUdPbgVGhpeQzArtj/K6a8RHAD83yz//D5c?=
 =?us-ascii?Q?1hX4mOG9QRqkC9lrnEoTEGoVO0iws8JvDCkOX6WeBSHoSP+AkYZsQ03iqw0d?=
 =?us-ascii?Q?Y2/wlfjAGkwoAIHiZKFDRp4pSY0KUZvRKMMX7RDar3xBancKcRZBZfxfd9dK?=
 =?us-ascii?Q?a5wSjjQD1RgCNfFPheP0K4td3O6GdAHvxoQkdva0ii0CjmzS0GAHsCu66G/q?=
 =?us-ascii?Q?4g0AgLzh7zXFPNjfShwIn5E7PLzN/yP5tEojX/pucLcjkscqx2zByI8rSC6O?=
 =?us-ascii?Q?cm40dtfZnn0oOKVCLhDFq/zDRONQ1xWy2V7BPZDvhhUZVF3zMAdUj3xWwG4Y?=
 =?us-ascii?Q?oZQ615uIp+8Pe0lX5GsCD8yCU9tNYD4OFE18L2ldcMrWzrCIqRMwJp2QEhsD?=
 =?us-ascii?Q?lGY13qu060V8nA55jhquTwE0edDz/VTKiuvs3oZD3DHJMotd8tr1K84a1YPm?=
 =?us-ascii?Q?ZSG+7b/RLtbEhe3OBnqXU0Ukn+E+b9yg?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:29:07.1779
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fb4b3a-03bf-4db9-0b86-08dcce3d3608
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7621

From: Ian-I-Chien <Ian_Chien@wiwynn.com>

---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 4090725160f9..d056f6d5ff6e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1081,7 +1081,7 @@ power-sensor@40 {
 	};
 
 	power-sensor@41 {
-		compatible = "ti,ina233";
+		compatible = "ti,ina233", "richtek,rtq6056";
 		resistor-calibration = /bits/ 16 <0x0a00>;
 		current-lsb= /bits/ 16 <0x0001>;
 		reg = <0x41>;
-- 
2.25.1


