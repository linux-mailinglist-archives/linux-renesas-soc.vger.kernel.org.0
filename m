Return-Path: <linux-renesas-soc+bounces-8771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B6996EA81
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:31:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BB2E1F242CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5206815958A;
	Fri,  6 Sep 2024 06:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="j9lNB8GM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2047.outbound.protection.outlook.com [40.107.117.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9D014265F;
	Fri,  6 Sep 2024 06:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604105; cv=fail; b=k50ejbOLL67KuFmEMNXJrMDLL3JxDxoPw9RGXyKw7M+Z9NG62zlb+36Gl1pxlABBt2vdNJhiyr9pyyxDvLM6OkLUpM8AlZ2wfdHw99iWLsUV5/nJeCvEyQfuPsNPKRJ7JouMkBOM2CA1nDhkIzYbxdLL1IXDZVd7MFjEd0iTgq8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604105; c=relaxed/simple;
	bh=IjUBTAVCU5Y6ChjiBa/OvcgHFZFxyyiZfGefmSk6xyg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HKOSbNYIs/3CnDA5m8PN/n8aZBXur+hABlXdKsO1FRGtzg3swCAR+1NE/5H4CD9vNC+DRwi7WHXnrnK900TmmIbcVNeLRIwNffz+U7AdWnwctexww7tKU0huWYqoqPGPl1XCqceY+D6KFhzUMC05dRIRKAfuo3lqNoXJQwWWuVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=j9lNB8GM; arc=fail smtp.client-ip=40.107.117.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoqFt6D2LPNL64QE67ZEda8uucpMsgf0rx1eQv7IpT/w/phmJiy0SS+DNVRyiEvkF091PFxrxScyTUm8cHD3M723+mIosl9JKbzmKhvdMgjWzPKJg+1Z32DF4EulNOaN/hvSTNd5rA3fyUUTbYXUKyH55IMHoHNtGJQ4EL9vmpJPlv1KHEujC4KJDJZ9XGOyXFGWpXQY3EMdWC1D5G44aQhE2wLA+TukbFRNEXaJnowvXr23aHjVOjljlyzKf5Fa2QsWCeqMFA5ngGEmCoCRu2dC1d/VJLxBwnB6WM6FCsbdWJ/xJj7e/9WQCCP1yFrPk23Asoc5k92DelBD/jH/Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hgFXoaC/5DtSawXO9Z49kR8+2OHTKZslFpSvIDp6jkY=;
 b=whcey1IvXuMhWMJYBCxM7f+pO/dgeFH3v3eCDgXCA5NO65o9FRljbRpzchXsbGMnYAISU5BZEJJUUn/mrbfhdRvJWDwnzl0kCmo+T18i6pX960kPQkd1IiTvFNVdnNaJofA0LbJX/7di2u4903Os2x1kC0rvPSfoGKeW/dk/UzIjEvFPRQ+kWAEEBGD64MpBg5c0boXprTBLrywcQcbv9pARA4m3oI1xZZnYc3xwuAr3Ka0MGmHKaBNJ97nwE/h76WfTYZaIh9iV32aPzJipBZPHLH/DRcbxdA6snfyUj4NXtTHmvPYbqbTPUAYSLa6eu6r83QNj4mKSxQvqlN1r/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hgFXoaC/5DtSawXO9Z49kR8+2OHTKZslFpSvIDp6jkY=;
 b=j9lNB8GMT/dZGtNRig5Yjjb9EJy3At/k+iAInv3rBn381op7OJ6eegNT/9fR8xRGUa11LP2f/ymmBuh8giDRcnS13m2ewDB47jPNJ7VvaJAwrzGrqDmfVW3TfZqCJpsc+vb0m5UAPLWYEHUW9/MqcjuP+I55k/3nJiZE66Hp0eJhI3Um1vbvfBWKvZSSbBh5oxj3FVQzuYy6fbTYn3FjaJ4vc46KJg0CySV3NLRHrqVC3fN7GmodNyKqfBe2pcR+Tr1JTpa+wM49I6akyCkeohs4i4K5PVMAxJOMmxdtJ20S00NfI799U0OvTNVIQXK+YDalXgWKEzj9FOdonLzDuw==
Received: from PU1PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::28) by JH0PR04MB7914.apcprd04.prod.outlook.com
 (2603:1096:990:9f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 06:28:16 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::be) by PU1PR01CA0016.outlook.office365.com
 (2603:1096:803:15::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:15
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
Subject: [PATCH v15 17/32] ARM: dts: aspeed: yosemite4: Revise mx31790 fan tach config
Date: Fri,  6 Sep 2024 14:26:43 +0800
Message-Id: <20240906062701.37088-18-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|JH0PR04MB7914:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: dab33e4e-c3bf-432e-1aa7-08dcce3d1745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nqfb/z1GkNBo9aTuHxL7lkro8MO3f+Umo8OFD+QoJ0rvQNh9NFE/knwUhGq6?=
 =?us-ascii?Q?Wn+xo/WqNp8lJFjAJi9aVZSjY8HEP5MCAitdrQE42+PWzinrc4kN1AdMrzZ0?=
 =?us-ascii?Q?g3Ouhl9xrEuGn8YbfClX+13kyR/Lu1y9XcqJe6ZlZxGMgwpq8mBkyodQsfTw?=
 =?us-ascii?Q?VdXfZJBAe/QQPLEH1h4sRWANDSTrpVtt5xY6wHK9B5Ab8CgxnXXgG4djQx0N?=
 =?us-ascii?Q?SdnJZ8d4JS3+tmNW4FyPfOdeZM8LiMG9hEIbNe5extCR+p0X+wouTILN/D2e?=
 =?us-ascii?Q?d5mqdbV5g+KEqjXwRLD2QLWu7+rfC18k6eg97n0+nnt4WQOCSZFn2qbKQn33?=
 =?us-ascii?Q?Q8q+22BmBZz7b+vP1wo54UfuFmjyCe9lGumqMUltzwDgV7sl9UTf/rvCZL6u?=
 =?us-ascii?Q?kDAr4B0mtZzfEl/MysIwZ98P/1J2cm5DaAtDOKBjkyVLqFkwYFXTjEHn1ySB?=
 =?us-ascii?Q?pv0yca4UK4QbFHW8wf1gpkak1ux7w+PZQ0y15hu4ZAOfG2l9ajgLwnH6Sgkm?=
 =?us-ascii?Q?FSnR9GAGTyNHyleNNhx/hM0zH5cE9ygr17plMKDSSlrPBtHc+jw/fEiTGigb?=
 =?us-ascii?Q?hLxFxqmK8xmSFpIy7ovmBBzowO7MkTiZLE8fBgRRc9P1U6iFkw2r3fimksvA?=
 =?us-ascii?Q?/j5d48w7IE+PPpySZrV5XL8eNnm8z4Np1wvxe0zvHCncmSDM7JMDXrJygNl1?=
 =?us-ascii?Q?Mht3ETKN9FrS8ISbWwpXsJdlOoTGwbVMUL2WkrntIjgZIniHjix0j3n37VQX?=
 =?us-ascii?Q?S4Dnd3u6nTIHGpIEKWPETxAL/61BOkmf0GqbRUUFxzw8vDlRJ1rBy1IjRnvJ?=
 =?us-ascii?Q?cHw3gqk2doGaMAJ+tA56mqZbXnRDkLm/Ihqf8BGgZQLpjPXMJFLOnUTyRIoB?=
 =?us-ascii?Q?grYEZ6O0s6H4tr8iJ88XRuL2lI+6YB+wSaQGEI4bYrDbKNBkjVKrxxJtRRBa?=
 =?us-ascii?Q?RPhEZSUE1pzgROHZPsVC9EdC9ma9R/L3Im5q//06ysBys06E79NWAFTqXJKb?=
 =?us-ascii?Q?ZoXutrjOzqbk+xXBQJSKP36fnWxkd36sjIDf4mskW49KFq/xSHyT3l2Pv1bw?=
 =?us-ascii?Q?M9ZX7fg3gUCcn2dS4oks6WGyzabeErlrhRLQCoAFJGtqnq0N0CvfmTlejqCv?=
 =?us-ascii?Q?kbYUSoaqZWZabRBL7Hs7+ZYT80pZCKmnv38KjEhoBWhUzJhi3ZdItNuyLadB?=
 =?us-ascii?Q?sBb6MUQkjL6gNWG0NXvkgkyktavsP/zZsaUhEmtfR+XPBxAJXa8ceOTe4Mdd?=
 =?us-ascii?Q?7UqoOlTWe+MEtvCt52xnh26O5Frt4ANqScYmDZaFKhS3gl2MHoblkne7pQJR?=
 =?us-ascii?Q?r9bZz/RgvP43LsQlYpytUbtleJgdG0C4GcrFeLx/RFwOVtCGXL/gPooWcwJI?=
 =?us-ascii?Q?xj2zGEIy4Uk5QjmsJ6l5Pf7l4HJj5xnMLqvQDcbtMc7yLNkVqUoBv1BQBuRO?=
 =?us-ascii?Q?nCTRtHMUnC4P8XxTWIVkMAOxFTCnHphH?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:15.5686
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dab33e4e-c3bf-432e-1aa7-08dcce3d1745
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR04MB7914

Revise fan tach config for max31790 driver change

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../aspeed/aspeed-bmc-facebook-yosemite4.dts  | 48 +++++++++++++++++--
 1 file changed, 44 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 60743f9829a5..b46a0b9940e2 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1103,8 +1103,18 @@ adc@1f {
 
 			pwm@20{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			gpio@22{
@@ -1116,8 +1126,18 @@ gpio@22{
 
 			pwm@2f{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			adc@33 {
@@ -1153,8 +1173,18 @@ adc@1f {
 
 			pwm@20{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x20>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			gpio@22{
@@ -1166,8 +1196,18 @@ gpio@22{
 
 			pwm@2f{
 				compatible = "maxim,max31790";
-				pwm-as-tach = <4 5>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x2f>;
+				channel@4 {
+					reg = <4>;
+					sensor-type = "TACH";
+				};
+
+				channel@5 {
+					reg = <5>;
+					sensor-type = "TACH";
+				};
 			};
 
 			adc@33 {
-- 
2.25.1


