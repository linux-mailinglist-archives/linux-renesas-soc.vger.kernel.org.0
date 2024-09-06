Return-Path: <linux-renesas-soc+bounces-8769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DD196EA7B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A58AD1C220BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1893A158A3D;
	Fri,  6 Sep 2024 06:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="FiKGnWuf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2073.outbound.protection.outlook.com [40.107.117.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2E9158858;
	Fri,  6 Sep 2024 06:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604093; cv=fail; b=bkDNKqiwpi2SuBJiLtu3SSm6VXv9qNL+t45dQpZtzhYfT1DnsNh+dQIVEp/rYxs5W9V5razYPUgWB2K1DXcfX/fCctWaiuCDsOIxQNt9WT+YcHFWQx/cCIc80WAnTHytZ5L4tR2boNg/VtVmPajlwsvoe2B+x6S8xkVfBaR0lz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604093; c=relaxed/simple;
	bh=jW0gVemZ4cl5PWpH2fNOD4IT7gRDiRPR9A8KhbqEULc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j/xBHr7pxIH7kej+HyI0NplN8a4mKd3B/d3/wfoPaL0C9MJEDQmao25mFHJYrXXYot7g/n5Bp8ObCBcxBOD8VA6I+FYpzrBcOoTKBKPaasIcsTLlgjkHVMidk4ZkfRlAPbJnzRYIPaxnFFl6NcTKXxnqdPNHZj4TLLEwv7mbHN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=FiKGnWuf; arc=fail smtp.client-ip=40.107.117.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cix8UveVajzTZlCo1iSrlvdPcy+EYFls3aeZ2K1NCguFoSkwl7DkegP8kbKsJwKp43vChj6qlrjitusTPnl0781fWyZ3T8D18rqvnKuim64VIJTyzYETLznDc/htArWVuVWBrsaGdwZx9uH22Ywl6i7a3YVFGnDbDRFxJyVOUbgq1jlKkqGS1oBUist2Kf90XAG0NH1mjRr8iVWDH5HtTykfF5qUkn2T8G9JEOHK4fflVdVudrLDRCNI/FO4A69XJk6NqR1voC/vvAJLPQMT06RzUzDu6zVr9OxAxPvVD4eVty6jD6PUxOQEiPJO5CnialaGAcRwua8g20HXq4pu7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vP7PVLwcCxjPpagISxynxIAExRDCx7daqT/H5FzbdV8=;
 b=u1lRzu5OfG/Edld5DD+Vv/R+P0SZGTR6fusOO80EAQGaazWZ9B3pZOCV2xlyuynqoZs2b4h3Rt1ZL6RmxQgbRxXM29jmXy765wYyaeR8JYtLH7w+Lf63rz9mKBDAWtyw9bsn9/M4GsBRy2pK5TxMrspzogQ3/wdsEq0vvJKj9W454w/v9uNTjWXSpDnAWXgQtvktGhL6CNqhygorRJMFuzmbdTC9h1/RUO9pSwDWfyC36+F/jBMPozslJpw0cwNkmBRVOPP8n91/g+raMKeJAB/vLPGn302iugzwVoA7FJ0UdT1fI7bNnxsIJsBH9hAAZZyQ8Y9ZWwC6ELEl8oYzkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vP7PVLwcCxjPpagISxynxIAExRDCx7daqT/H5FzbdV8=;
 b=FiKGnWuf8ni/mbkGFu8/8NN+4kWrgm44sT0/Q7ZRWUFPRsjCpxmJU5EOAeXLMRw5bdDs9KSlc9vlelegM/iNy3jZ19C5XVfykCYVsJ86ZcVyzNMDMJX9DQPyNUdJ9Swz5OphE48P3Ib/dluHQPd9IiZ9HlqtYuCjrsk/SJxS/GwGp5VbsIHS7QKEUIWM6Ig3/f4NbH0MTtS6+hYDdN5IAfj8N2PvEbCWvg2GeGXYvqjN8JmSWL537nvBl3TOHKMC518jzQAvOvLO6hSFUX8Wj3HRyZ4Zbck+DCCHZrVM88P0u3VwbOXWKYVg0ICufxtpd0BWeack13H0bSLyh3TM8Q==
Received: from PU1PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::34) by TYZPR04MB7845.apcprd04.prod.outlook.com
 (2603:1096:405:ac::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 06:28:07 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::4d) by PU1PR01CA0022.outlook.office365.com
 (2603:1096:803:15::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:28:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:28:07
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
Subject: [PATCH v15 15/32] ARM: dts: aspeed: yosemite4: Remove idle state setting for yosemite4 NIC connection
Date: Fri,  6 Sep 2024 14:26:41 +0800
Message-Id: <20240906062701.37088-16-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|TYZPR04MB7845:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 37c05bc4-fc65-4ac5-7d46-08dcce3d1255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gxPj+l2Z7K1Q/zE5CO004kNmsYyFvmnkKLyBmbf7jEm+gfXq8yy+B8JtfP1L?=
 =?us-ascii?Q?pqRKcMRxDynagqrJu0S35I0nQHUv15gupCtsQ08kEJ6wxPW1uypvHT8SJfy0?=
 =?us-ascii?Q?DbZWoqCszHhhbwM3A3IkQBnsy6elHUlZphK7CR6lBZnUm02S9mYjfruHuw1b?=
 =?us-ascii?Q?V2/C/La8yj6EihKmsmtgF/mRbblgOVQZ9turCsu6xQBK7wWn81F+gLcyEkoW?=
 =?us-ascii?Q?18MS5mEFjYSh9kpw54rvdOGRuZma+bE44TfgUE8cdeKN3fkr1pepGi0yT6Zx?=
 =?us-ascii?Q?f+eZBo9BpkPdCYuQjJ2z9qsYk8z0BqCfCxMvpBkIRce0CZxTazO8lyyuRR+Y?=
 =?us-ascii?Q?SYhUua0Q4k4FBoFEKElEgM/9zRhesRLk+9REufCDZFLEHqVtFV+Esd1fBksD?=
 =?us-ascii?Q?CDaQErh36PSCWrWLXuWQrtJDeJcY45iKrD+AeOOFA9JYWiZi4Dr6oeukjiTc?=
 =?us-ascii?Q?6deqLt7c5sqSBM4KoSNjYX2hQB4D+BwsKDw5j+UEjUN+OFJhZ+e6mtq1k29Q?=
 =?us-ascii?Q?srl3LU6uHiyC9uwsnDLz8CbtIHn9DXOZUUeuHzWLCJRrEKALV5K77QY+qpr9?=
 =?us-ascii?Q?uLthkTwkT2X4PLUfRRlqzk2rf0CmThqp5OFV/HNDh9OBf2FCF8pTouK5np8E?=
 =?us-ascii?Q?G57lwc7lUrQ/Kge/jAeE07qZ+c+7uHCJ+aELNeQ5JvdmzpOwREwOKEnTL0hT?=
 =?us-ascii?Q?aoDorPzkRnKjO7Kh4fMkLiyBrqqk3Skr6nYlT7/aDskvsdhps0MbIyh5/Cq2?=
 =?us-ascii?Q?tTKnwa/doaVeiKTfE1Nd9JwljgN8aDyUc6Tq5mQRB1RQ4Z4RyfJCRZUjvrtb?=
 =?us-ascii?Q?dgZPRvzfu26Wx5nfZ7wuIOs/ifWCKW7qeo66lnDo4ZTvKfbrSN8RE7Du89no?=
 =?us-ascii?Q?3oCI3v7ncMIC28oeKHkLOKK4uU2UTkPhPvy5BrcL/WrBqkHF9+wSBuIqKjZV?=
 =?us-ascii?Q?eLqaoMb6d82j3h+eFq8JIi43N8ya3rP5kkQIhY4MRU2K2Y9dLEv/d04AttCC?=
 =?us-ascii?Q?74KaNxsYi+rM0F0Q26WPaOQFnGVg4q2dpzNolrgKRMwXe4fS2XWTRAbp2kP5?=
 =?us-ascii?Q?1xZ1TMKCD8u0nc+bgh1Eudvv53vz5L7Zi9XXR6xv6l0pxK1/SKmt+a0I3jYB?=
 =?us-ascii?Q?q+uxp/j8V8+fyVTIAiYnMQkvTl9eqaHPjGJoJEk3wJXp/9U2BXCZyQTqNPb5?=
 =?us-ascii?Q?h/ShXGvSvpQmQgJJmOocTM0mxkcWR0fOchqxCz3TQ28pT4gRPrBiBmMQm1dM?=
 =?us-ascii?Q?gFlfgNoOcUiFhW1QvYsorpDDBQGas28q0vTYeu3M4/FuJJGItT+5tWd8w+5q?=
 =?us-ascii?Q?mKNIYrn6hELt1kIl9uJmlBAKFPfR3fOBzTVRFaC6/ylRLvCakqdQhd164/mL?=
 =?us-ascii?Q?unJpnJvMzF252pfuSCPDD7Sr+AMWqxMVdUr3/nwSyCp/gyWBPWoesk0wcKCM?=
 =?us-ascii?Q?3GeIfoCs8FPZzjf13dwr22gyJEEz2YMl?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:28:07.2562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c05bc4-fc65-4ac5-7d46-08dcce3d1255
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB7845

Remove idle state setting for yosemite4 NIC connection

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index df389b506b4b..c0497a1aa93e 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -1235,7 +1235,6 @@ mctp@10 {
 
 	i2c-mux@72 {
 		compatible = "nxp,pca9544";
-		i2c-mux-idle-disconnect;
 		reg = <0x72>;
 
 		imux24: i2c@0 {
-- 
2.25.1


