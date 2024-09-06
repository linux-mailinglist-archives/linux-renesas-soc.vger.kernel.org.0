Return-Path: <linux-renesas-soc+bounces-8779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAB796EAA0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4278FB247D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D86815F3F3;
	Fri,  6 Sep 2024 06:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="ksb6Kt1j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010044.outbound.protection.outlook.com [52.101.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC3315EFA1;
	Fri,  6 Sep 2024 06:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604134; cv=fail; b=YF2//ZUSQJstlt7XzTgD2G3ZpuxoPSyJmtkN/KZzaAGoztikP61YVKTgYQ/qQCMZnrmCH5wwyyAJciDUxnjRjCoxH1eHpwUR5Ds0aEgYv+ee1MHRyFSbB2q00aQC2SuKPCB+O2DiyKyIOWZAFKRqPKTc6+mkXCE2pHZhMVTAauU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604134; c=relaxed/simple;
	bh=javoh9yV7WrDdF6nED6Caxxup6WdbdzzX/IVbBhNWOw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RR3hFKJDQPjMnS4FF9O2ZfgFQTktMPT3ow2RRXww/FEb1wlazzp2gchOuA8lz17L5YKQLqoTnijgXeNnizmwTj+WdqbsbPN63n/H+Xr3UWteUsi4aRBEQwzzZW5L1JTeJka5K7LNyLaBxj9LqG9la1m5EhYg3vfM92KCszgwEvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=ksb6Kt1j; arc=fail smtp.client-ip=52.101.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQe0gl1tux6ENYcA7lftH9qHCyIbkAky5lsRVbbh6nIrj1XnARzw0EM6VzMr83EowPAXMZ29SNoW3iwSW4dkNnhplqf83JopP+RhVRAw0t9dIGXng+WDCvkK3KNNEBSq6DyiXKtDUzOaY+gE5UUq3nPK2oSgqfpR+7cf/Qq1q/bYmztViuahJr0F38SzwOMFgcxkGZGQsZkTzfTIIYQImW4X9RQXyt8xYJHj4a4ZJMxWQu/wvtztuOpCCE6bs2o3J2sP986G0rgv6HzAlhXC3XZUzfqWvHLzI0sXLkXC5P5x7cppgdmT0XMRQVW8n5MaCdIQDICLYYP11sSzxC5tzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CE8IuzdQZjntYqD6nUPQnwn7C+BubHdv/yTEbKi/B1Q=;
 b=PvxCOFCWheLihD+irnmzkKQHR7b/Zn0R385S1K7v1Jbs7U6XFWYHs6am6AdhWAFs7YgT6Zw7JsVz0BEECrDjyFfV6wW8FoUIap2yBVdXGR6KAfnRZBNE/qHwkUGfDb28uu9X6v1fNXXPYz2Ax316c7LMfiybgRjHNyHQOrcxHogb5CKPO3WROJ1FIZPz1gkVallWxhHCZ7DQXviOjiOFNx44ARrhsZDUrNUGu5qLTKCtIpIZMoefdIrPRaktctNHzMfdv6N47a9f4Q8Vub5/YzrB0Wp1A1xic/N/DK3N0u5dALjWy4uwhX0WTdeuLxLUtybbrTxE9XyC6+zHsHJc4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE8IuzdQZjntYqD6nUPQnwn7C+BubHdv/yTEbKi/B1Q=;
 b=ksb6Kt1jgX0O4RqQSrG8XZ7kBSZ3z7PR8qH/2Aa+hmr8wTnGunzlYw5EmK/ie/w42GqfPa9W7Bfq7+HYit8mAf8capVZo/Y+0epXQU2TPltfYIDbhTfkeAWOAt4tfQ3+3SPhqU3ZJuUbBTDChrAqNUpLoeXR/bQXiINnuR30DMO49X66ic3UtkK1nHH8Rx36rgxaej5L6b+w92qJjVe6a+rQ1i6nWj/GYHqSyUJAx8QQspikF7jQFeqk7y+13EcU4QtPYSXUELQRVEXmNrmwZut609co75KyqkVbJZsROg+67TTwsry+Lnrm3Lou3PHZGEZHp1WJfa0971PNaf8NsA==
Received: from PU1PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::28) by TY0PR04MB5768.apcprd04.prod.outlook.com
 (2603:1096:400:205::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 06:28:46 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::81) by PU1PR01CA0016.outlook.office365.com
 (2603:1096:803:15::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:45
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
Subject: [PATCH v15 24/32] ARM: dts: aspeed: yosemite4: add XDP710
Date: Fri,  6 Sep 2024 14:26:50 +0800
Message-Id: <20240906062701.37088-25-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TY0PR04MB5768:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8379bdc6-5833-4279-437a-08dcce3d2930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cZzuqxWRXxL7dFenqZKAdflxH+iyOIXd2DD+rfiBurNz/JVqvIiXxQdI3SrT?=
 =?us-ascii?Q?EDeGp+mUolBwUmu05/b6oa0hUHCh2V+iPtfxJoOZXweCIaEBbYAObYY/wu3J?=
 =?us-ascii?Q?pCkq328uZ0SmsZpmdtHB8shzQsKYeiGj4zD0w8PJGP+nJLEk8GIiPrcz8KEz?=
 =?us-ascii?Q?U5ssmZgSiBHjERgMRE1oDIktm+HSAxKdClCNhU0BznX9A1YWoLKSgJfxL8tW?=
 =?us-ascii?Q?VHohaG6bQem/KksoY0+QpVXKw2TTewglOp/NefoV4jQk9RoHmQgHTngzRdJO?=
 =?us-ascii?Q?owWF7WAkcJ4FLqLix4EJhJPmKxPOp6R5+SI7Mfr6agOW1UyLGC4pyc8oHIpP?=
 =?us-ascii?Q?1YCdCsRgZBDaZ5K/DwEgh45JqfNPUR0PNzt55RKH3dIrf/iqwVl4rNqfMZkl?=
 =?us-ascii?Q?Hf1KcAqKf8TRJuedCQeKw+Sv53/jhkUcc9qExzYQXt3QB7PcOohAiE9ggvx4?=
 =?us-ascii?Q?IWosYGpOWU51kwZRYFtjYXDqmsPoSJpYMFQWVcF+b/ZDG+bBnBF/Pu+Sfh3l?=
 =?us-ascii?Q?87k/3MOns/Ag0inqOb0W7mVftkL/tYNYWv9H8aUvrbJmeAkU4aQBwZeHl8lb?=
 =?us-ascii?Q?4uPXwZas60AJ1UpfPFzYP04p7vBJGCXENGUgf249HiDEex5PX9tE5am4p7t6?=
 =?us-ascii?Q?9ZVNYQkm0AEBuGj4sELHKJTp5eA4ABMqgON9af/8PkirPGrnzLWXOc8lEnOb?=
 =?us-ascii?Q?I/AjtqqNc2IIyI/c41lhDOEZuoScTDoD1KJa2T6jlhqb6wnRseB9z6SCmQQi?=
 =?us-ascii?Q?Q/GrAZIuRVlv0vnYXbVix/6OPXSa0LNk8lOFDwOnIjnDtBDVzGNEBd0L7fED?=
 =?us-ascii?Q?cmB3AazVaw0ZV7D25vYi0EeiY0wD+AU1MvfMhGQuM7eksx0ucCoeFdr1ESVL?=
 =?us-ascii?Q?4LSHdAvG+wYMTMxh8/EeFcAK2OJlMUG4ExOaLUdlfTWyInutMfDCEuVVFnqL?=
 =?us-ascii?Q?fLVzTwBt47TGOSXdyVZo0Sg3P/lJEOHRBqUjHXeJcpWNZ9/Bukqnr9hgdyCq?=
 =?us-ascii?Q?OyiPZJ0AJyEsOmUh90s4tJf/bfMNWMQigmR9R1taYJH77VGG1CeK7SSd+sds?=
 =?us-ascii?Q?HBoHwlcddNtm19TQLb8RlUzWeMbbvtjDzyifAPQgL6sP4lZFS1uPebk9n3rS?=
 =?us-ascii?Q?TChsmJBHPgXux0XkI4FHzBXGGAiYnPzWkOLtZNu+EWA/dQ0mBzljXfpU/jMl?=
 =?us-ascii?Q?5l3D+5cVvXeV3S5LRQ+j6vA35Zpet87L9SCWGpkRgaw5x4ZGY8du5/h19Iov?=
 =?us-ascii?Q?nmxl1Td1F1H1xOedwpBzG1HSAf6Pm9ipR2mq65UK5GsDzvSqOP8obflGgFnF?=
 =?us-ascii?Q?ZhZxXo8yK0iAHO1ulFk45Bsv5K+PW3Eurf0drGRIUjuUzcPttOS5XsBw5Iyp?=
 =?us-ascii?Q?TqVThMEsC6MiMnMkpChQtJ7dvpnh9Sr0Oe2gCqhiBaM1fHk0HI3ZHF9jlikc?=
 =?us-ascii?Q?tQSZPb/MfsPsEre6NsERtuyIADJjIh/i?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:45.5842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8379bdc6-5833-4279-437a-08dcce3d2930
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5768

Add XDP710 in yosemite4 DTS.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 2f4e9c5edd5a..f73719b3c2f1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -978,11 +978,21 @@ power-sensor@10 {
 		reg = <0x10>;
 	};
 
+	power-sensor@11 {
+		compatible = "infineon,xdp710";
+		reg = <0x11>;
+	};
+
 	power-sensor@12 {
 		compatible = "adi,adm1272";
 		reg = <0x12>;
 	};
 
+	power-sensor@13 {
+		compatible = "infineon,xdp710";
+		reg = <0x13>;
+	};
+
 	gpio@20 {
 		compatible = "nxp,pca9555";
 		pinctrl-names = "default";
-- 
2.25.1


