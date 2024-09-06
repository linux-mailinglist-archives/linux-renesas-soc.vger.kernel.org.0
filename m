Return-Path: <linux-renesas-soc+bounces-8787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AED96EAB9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74ED01F22D56
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F9516A396;
	Fri,  6 Sep 2024 06:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="ewQjFmna"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2051.outbound.protection.outlook.com [40.107.255.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C589168C26;
	Fri,  6 Sep 2024 06:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604166; cv=fail; b=sQnH/xFP6Zim4S/c+APWNx70TmZWwPOOqMf48jkrW4Lq0w/rM5yTocSR8CEMdkqayvMMGyAHMtNdVRUI9zsdujihLnGFjSntQGe114HVHRzz11HPm7pWL2o0c3pgzSfhG+gLNivXgvGiDlsk1y5fYS/ZM2zDt7nCql4GEidUTPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604166; c=relaxed/simple;
	bh=dxf66hJZtVAq9+IaBejsonKuKVgRZ8FP7RlIV8a+PWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HEG61tFwxh7fBe3dqkBuQ4nlIOSpJ9PskMJDntRc5LkKd2+UFcFxz45un66RK3RwOj5Wq/HX+hNOvOCCPElEsVbZd2wSpBRRufgJwGYxd6BKSgjlg/VrcZUAoOmKco1I2pIgz/FnMvSlv93QWX3wW4g3lUziM/kKfABWx9NCpUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=ewQjFmna; arc=fail smtp.client-ip=40.107.255.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hl5vAWqjHzw1dVhDho2QbagPN3gjc7YNXNVEbl1pKSJopV27uTHtNVVHdlah9HQaG1T62BdPkcg2XcLrSqj9pDFH/ZPeVyIoy27X/bC1dnZJ3uq5E3ZHFUq2mQidtvRJHgbcZCwTW/UUdm9qLVi5abSk1JJOAMOWyv4CfBiIrPHekvuqNzoKOpZBqcGSjRvwWhl+ounkz0g05lLgq9CXpBYe7IrSjsd0tG84ZAhab5PEQBqKO0Bx30k5rW6Hgz6GUi2DXlW+M23VFLBgbHH9V6il/Lv+LMLE0Fdrs+ZDEKlvY8pKhbA0NGTjL5F3RuCKTrAZCZj8KOnc1T1Jg1aaFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRQ1AkavuHhhgkpR/yb8EqtcoBHiVYJxKw0ThDWy90c=;
 b=oquGHAuyVdqkMT01ehcDtN3iiQICzg6HnEImvm5RS3rqWX2TxyYJ6cua9o7YHHgQCOkr827oY5nG5S8j592L8VgSlwCSt8oV1285gONTTZQwHOjlqXqmBNnv6+DvcipqVSkZ4B1gUhsc/woTe9He5NtQNcAhhT0gVLLirtfH5IKG+fndiVKYxMLzxObDqKKDxR6Vw1Q9Wo89R5/FXMrxbofI21olyK3VJ7maTUuOxETjr025yj2ic902jdurzu3ur+Iq3KbAplXOdJ7m6iO4oPW3rGzrQwhT9TwVWWU21hU+dR8QZJS8GJB2FQoiwvrHqPCSfakUipz4HiB2K7gJLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRQ1AkavuHhhgkpR/yb8EqtcoBHiVYJxKw0ThDWy90c=;
 b=ewQjFmnakC0T1ivcd5+5CAH/W6Xp/U+eJcx19xToPyDU4NX9gjiWlNsg4R0OrgceKy9OEUT93EW9Fz+Q/6UrNGNI4u2YzQf6tSggoRz5I+jzGS0rzwqI4DErr79AkyPVaadY2pAqdmT1uQQjDr3v9xV6UcEtm+RFLz6jaeLc478cS1525b33LoMt2/7ubEx6FMEcYPOcwkQP9pEr2EljfUpZS2GfuwwdI4m0ds7InRy1bCKPfd3nSXYVCylXT5YvuGHkjdnuuAovKxd7no7jvvrEAYG6ODzW9OCLDW1UXndgNl8U/9c/RpDO7gxsSmDVDilkg2cVwEPiJosN2f8u7w==
Received: from PU1PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::13) by TY0PR04MB5609.apcprd04.prod.outlook.com
 (2603:1096:400:1af::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 06:29:20 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::4e) by PU1PR01CA0001.outlook.office365.com
 (2603:1096:803:15::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:29:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:29:19
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v15 32/32] ARM: dts: aspeed: yosemite4: add ISL28022 support on 11
Date: Fri,  6 Sep 2024 14:26:58 +0800
Message-Id: <20240906062701.37088-33-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3aab2023-3178-4f9b-c597-08dcce3d3d7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BhZGCVcxXVEn4Xh4Px77MQch/sfXbkMzGCr6Cl+9Dh5aZrfOynU+xFfG2Ihr?=
 =?us-ascii?Q?kKg73mFeVrBwZyhVXQCrnVqxaRZZq2o6JdQpOYWdw0jpMzz/oA+Qza40Qq4n?=
 =?us-ascii?Q?miPWJtX3xJXAkqytAD/RVm9I0FimHqtHfZ3rtssosh7GZ0HyF7tsBFYNCQyb?=
 =?us-ascii?Q?/WdYACBQk+yQlp1iaXVv4MiPvpYyn3kS4FMWkFLSdD96XxHMiptVC5LOkQio?=
 =?us-ascii?Q?dasojpm3Q7X79coqobOrAqWmgAxpnOEiYWoFwyQUTZ3ZS5LNzOCEuVdB5uDt?=
 =?us-ascii?Q?Ctd7tHQMrfdqRRJaGmzsp/8OkY9a7WHdr8Wu9Oqixb5z/5dC0bW/0WLJpmA0?=
 =?us-ascii?Q?SIhQC7yjsmT/Pco0OxSa/rEYCsNp+yYbmeRpaZkX9ypT+1Ll9sQ+i+gpsJgR?=
 =?us-ascii?Q?1QEq4GlCwyw3AIYRFO/kkcOobpB7DVCzEiscntjlVmSNCvu5KvqWhMCNtCKv?=
 =?us-ascii?Q?ITbzNzpIABOkEVeboQNSHVqwS2OJz7JNfKiyZqIpCtAI3dFBkPPKD8dyAUfP?=
 =?us-ascii?Q?28Vw7DA90SpiqBolUsomMotPvTb9CZWholCNHIAZl95voPSQruU2Vlr+bbQu?=
 =?us-ascii?Q?5H2jfxQ8CVt0Q/i9ZuFCjkJSJE5OPkY4P7n/Tfo5n7jJzqKfVkuRFefoeM9H?=
 =?us-ascii?Q?DS60DtS/ANwR/ESNZCQ6kcRur2dRAAc2Z6GRHSDIqa20i+x2IYgigvnasxCh?=
 =?us-ascii?Q?wRxkfZloKDo8hy+MkiUbR5Pg1j94nKXn0bNdVr2QPJepbrWQ9/N8iGXumXij?=
 =?us-ascii?Q?9Tuoqr2/vNLvEMOwuS4RIRtyjWaVi7pTcO7vmbRfcYjbldcBjMKEEK9aNVcl?=
 =?us-ascii?Q?r5tJSUscZNyEp03ewS+l9T1LXgvrJ/zZQUl14U+dau36XTZBC6tQvmu0MACv?=
 =?us-ascii?Q?v4HV/O4Lvr4hhV9YW5+IFbU8wD8wPqnGKeiauiREoaN3WTF/WBzIrG0z77B/?=
 =?us-ascii?Q?mB7W199lkO18Zbm3Ya+hnXLX7MG3SxfdNs6sNUSchFlg9AHhSC9zP1ScY+zs?=
 =?us-ascii?Q?yrVyy6YMB2hBzG60ffp8K07oOsW1csyKmJk5xffo+x/Pf96pAjJb/cXi6I1U?=
 =?us-ascii?Q?qgPgFQanG5eh3YNpysx3Tg0O7yUjnDVRN+20UNMWrGhI3zDRjpAOx4Ek3o4L?=
 =?us-ascii?Q?coJVlp3Bj3DaL7o8LhyOa5lGT4GdjR3iL6mbMAyXypBHMzilPT505cfn2OHe?=
 =?us-ascii?Q?KTYepaJZVsJHqwbm9NI/+YdeoEcZQ1bruipa0+mhs1jO0tMkAKw/W33wdajq?=
 =?us-ascii?Q?yMjsBTZ3G8qnzKxCn5eDmr+Sb1Yr6U+7SeUT86pL3sVrHKBT7MYW4lvMhMvU?=
 =?us-ascii?Q?yfIa0LBZy8HX39+GNQpRPb8qZQgPsvq2mduLE2NkVaw+DvnEFzyqFgPNvGyf?=
 =?us-ascii?Q?p+HIywp/BUi3XlFlBJIAiu2h4Iz4xWPOXJoAXgmP0wzsG/jjBse8bHVKz5mn?=
 =?us-ascii?Q?4ITmRPssqxIDOs1G8dCA7jply5+ZOIin?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:29:19.6622
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aab2023-3178-4f9b-c597-08dcce3d3d7d
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB5609

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index 0341b61aa1f1..e0cdda701c24 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1088,7 +1088,7 @@ power-sensor@41 {
 	};
 
 	power-sensor@44 {
-		compatible = "ti,ina238";
+		compatible = "ti,ina238", "renesas,isl28022";
 		shunt-resistor = <1000>;
 		reg = <0x44>;
 	};
-- 
2.25.1


