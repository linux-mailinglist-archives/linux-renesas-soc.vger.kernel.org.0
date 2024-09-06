Return-Path: <linux-renesas-soc+bounces-8755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D83D396EA2D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 08:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 913DE280E00
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 06:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6570214375A;
	Fri,  6 Sep 2024 06:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="VJl+Yc4D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2069.outbound.protection.outlook.com [40.107.215.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C537C13C8E8;
	Fri,  6 Sep 2024 06:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725604038; cv=fail; b=lY4baKKzcYELC3Hm1vuoyPQ5fUZh4eWToK0K94KDAM2kLD2KaZ2eqOZtvNNhDmz9Z5tNwZhqnscFbzdQi7RQfWSDpq0t8WhyojK/hwddGyEnvT/6nrrRrEUwXIUl4LszaqjrLtbXMWELtsNN0bGTt3JSFDSBISqIGTPz5s0YH6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725604038; c=relaxed/simple;
	bh=73ACY2H/XC8HiFGPQdCgZZUhtUWvlcJspY0j/8nbnW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rMlMc0Y1tas8KWunwEJAZu9OZr9FapABeTCgDRaJZj9e8zkHGEnB7vhw4LfmSoHN58YOePCXoxqXEFq5mJgesoCB0tfUl3KnWS4DiXMAqSV+EoCnbEq/Fv/pryJUBWqGO8D6KYjUmk7bjHVoigghVqm7qKSMEEKzI934u961VCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=VJl+Yc4D; arc=fail smtp.client-ip=40.107.215.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UE6wMvf3AHSXEOJ1CmzW11bCF7V1XeZl8pWeAzgQOsCrRgpzTun1ZhHDMM4lFPMhuJPp9DZxYR1MS1b//m5u0KpTRgIRQi66+Nsn3uQNMLpKle8zaC/7UT+Q3Ne2/RL6KnpkE4BQsUo/6bzSVN2Yg2rsUSbop+GhYxMCZ4MaV63CkqvBdmu/bfjdtuHAAlg7Fjf98aGfPDqsOqgBK14aaFBG7cjU93LXQ3GU7M74Aa/9zamP0wljGJO4Lu0ZZXAV7IqmE1gZDkGWYqPhxmuP7WgoOne4V5/BRZrB+3xQvdsWkfzO32peulbKV8IycVQPDULem1Kkk9LijPosg6VXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WmNKl6yn93kcqul1yKpNviuiMr4uSmPfzjmHAX59pcs=;
 b=K4ZBj+PUWOPtaw/LmW52aaeYdTAjRXHXpr8WgghvIDj2CiD/5IuHjecWpAWvuzBm1djvb2FK9QpdJYb53cQauiw7RQC+MMLaIbunrtWOaR4dCZLfHV4rrYmeMIcHG+trZ9YuJ+ZEkwKjtje7jJ8nmf4SbnB8W5sUM6eGw/NroSHUaE1PxVWLGMWx6c/C16IHZOeoNyqeju8SkVEN5uWG5VZ+xlxVdNwyNAhbEgeIuzprriaENoqN1sR+hlhqhCuVra2nbWCKRisTpjRvhRhKeCB3f5sofv8sc65coVFgDVrOqKIWJs9ArI+qy7ARxRI9ksMQ+BaKica3krJSk4dlAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WmNKl6yn93kcqul1yKpNviuiMr4uSmPfzjmHAX59pcs=;
 b=VJl+Yc4DrjMnZGcHz/7/55gY59BHiFtV4zIiuKgBs7jvGNEcm9UzntXNYjvEnRmkxkF8pBMHnZim2lNbkvj7aI2sy0ixXi4K5rcFvJsk50tUfmY39jCHhxyy0NApQEet7vw+eC3SfMA9t95y3vl/DqoGNXhp+8o/SI+k6fCF4A3j9LAaK/LY6j3DvIfmM11zSCs4EH2njIBfg4TgYJ/vA5uiBGlygwiPtPtX214xgsJcGIkq0dtSo/uq6NJ6Jo9UOilMQ7HbrL/vXZ9j0l6EJoOcqbyzz/VF46hIwWuwLqlXr/wn+YXS/4sfM2K0DCmK59saexX/biiMS92nmLO2aw==
Received: from PU1PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::25) by KL1PR0401MB6564.apcprd04.prod.outlook.com
 (2603:1096:820:b3::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.26; Fri, 6 Sep
 2024 06:27:12 +0000
Received: from HK2PEPF00006FB4.apcprd02.prod.outlook.com
 (2603:1096:803:15:cafe::72) by PU1PR01CA0013.outlook.office365.com
 (2603:1096:803:15::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17 via Frontend
 Transport; Fri, 6 Sep 2024 06:27:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK2PEPF00006FB4.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server id 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 06:27:11
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
Subject: [PATCH v15 02/32] ARM: dts: aspeed: yosemite4: Enable adc15
Date: Fri,  6 Sep 2024 14:26:28 +0800
Message-Id: <20240906062701.37088-3-Delphine_CC_Chiu@wiwynn.com>
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
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB4:EE_|KL1PR0401MB6564:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5a4be723-db00-4922-8127-08dcce3cf13e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4Xn4azJgIgIqrGQlHcV0zhSzvN15IrXI8Jrcd1xl4g/VjJL0DWUBvIqrxDrk?=
 =?us-ascii?Q?iyj7CBiVgZJ/vL4kpSBiVv/IC5xbhBY9lJVah38yA4Q2jwX+wL7n5ndVmjKz?=
 =?us-ascii?Q?1uJ7EyR6vmKWSi8NjvdtokL/+MGT+2TgSneuydNsj6P/oIRHfZ/oK+QsboC4?=
 =?us-ascii?Q?yyA9q1SFMSt59E1VqpIr9l5+oPItwsq1ey6LePMRGfwfwcFnlZv52DQapay2?=
 =?us-ascii?Q?+8HMHcnwMls6h+Mm0Vn97mEzU7241LoAezrwxQ19hiVRQ60R8IEZniJpm1UN?=
 =?us-ascii?Q?2cZ3BI0Xf39IqISW3fNyPEyldZX1KqTg83f3+1mOfSQCB4gozbdn3JizOXxs?=
 =?us-ascii?Q?VibY+oJL7BfocK+tad2A0V4ngOB+5sqVgv1rk/MDqaTuHsbUQl+qdbnQ5Fsk?=
 =?us-ascii?Q?TlJHOfPSJyfboRh21SdCRDtraBRzepSjb4V3br1MEgJqeEstkYBo1c4NAhX2?=
 =?us-ascii?Q?oiPPLleMMtICzp1j9hIjU26j/SfLM2bgovj3l8/mSFk7l7OnyrN5k1qN8ou3?=
 =?us-ascii?Q?l3zIt6IiY7oo2AfBLnZGXpVn8l9LDeRXqkosOasOOs07ia4bKDuMnitVcWEx?=
 =?us-ascii?Q?s8OtIDqSzwhInlWlRwFXl+r6gz8BM+Trxf8Qvr/dbApcYcmq0gRvOVDTt+3F?=
 =?us-ascii?Q?Lh3BRQrBjXz58JSyQkM2nCPAjElrSGK+sITiryFyGJUlOshw6C+lLqQZFCfs?=
 =?us-ascii?Q?IdNb5Gf8veeGfSSS0R6IbQw049ByISUWDK9QBDo+zv6JhfaEt9qgX+PJpTcO?=
 =?us-ascii?Q?sfQLXn2dZCEpxHUwjZ88BP0hQW2HCLs/UDITc1GfiEGKXI/pdz7qxqfzvMLV?=
 =?us-ascii?Q?N0blNo7++m60CtBuIjT3H2nCET1j2UVRcom+O6J4cCCL4bAO8WGrZYun9t9C?=
 =?us-ascii?Q?pGIzBfz04g/gZhpzPiRQTSUaBmXHeA4uh9gZn5A5phh83a3c39dfJNvrUy+/?=
 =?us-ascii?Q?eOvYzLn/SjxIF1JrVc1XFy00Z5p3TkUzeSSfKxhV617qP6H9GFRpqgK4ydrK?=
 =?us-ascii?Q?oIOwgEWFwKZG+2cQUZuoMmjJ8Rgb3MPVD5Ige8H0bIDsmnnWCG5XdUVFnKSR?=
 =?us-ascii?Q?D9ea/efBxKrKcDOpvuOlStnDVKabBAfjTyMU6INBgb2uYfmjycB7Pk57yaFr?=
 =?us-ascii?Q?u/Z7S8W1ok0NxSwks0JQc3YfScSeOq0h3OQlL2rSgtF63rcws83genf6BI94?=
 =?us-ascii?Q?dYB9gVWu1e1o37FoXDLVQv6ziij3pYh7aZFPXT8yLsRnQlvlD3GT7KuwQu1U?=
 =?us-ascii?Q?yOigM6BbPajc7Br/IDwYFJYKws+3vjFneUvSdK8ElaExlEI8FYvkS+/GFNzr?=
 =?us-ascii?Q?Y/SiPH+QsK4PbnA4aumQxOc+ye54ZGjeTIoTR/emb//tB0K2fR1pqKbazGZ0?=
 =?us-ascii?Q?r3NFcLS269mF2uM9HFu+ZOM0qA/WaGeyRqaPjTTkm4xgANRN7kiiFPSnu57d?=
 =?us-ascii?Q?INynBSfIykg=3D?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 06:27:11.6938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4be723-db00-4922-8127-08dcce3cf13e
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK2PEPF00006FB4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB6564

Enable Yosemite 4 adc15 config

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
index ce206e2c461b..0d659ee2bc19 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dts
@@ -51,7 +51,7 @@ iio-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
 				<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
-				<&adc1 0>, <&adc1 1>;
+				<&adc1 0>, <&adc1 1>, <&adc1 7>;
 	};
 };
 
@@ -925,10 +925,10 @@ &pinctrl_adc4_default &pinctrl_adc5_default
 
 &adc1 {
 	status = "okay";
-	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>;
+	pinctrl-0 = <&pinctrl_adc8_default &pinctrl_adc9_default>
+			&pinctrl_adc15_default>;
 };
 
-
 &ehci0 {
 	status = "okay";
 };
-- 
2.25.1


