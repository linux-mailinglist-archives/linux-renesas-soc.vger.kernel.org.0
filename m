Return-Path: <linux-renesas-soc+bounces-22292-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 627FBB9834E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DBBD4C2B1F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860103C01;
	Wed, 24 Sep 2025 04:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dpRa76/k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9422A28F4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 04:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758688288; cv=fail; b=nLyEr1D8kBpBQDp0KiCdCzqL7zic55Kez1l71Pju2ZkXnbs5rUhGqP6C1eVyBbVTxThzSXIRCr2J3lkdiP8Q+C+DXbXV5Lf4NwlOwzVfmeijgsO/HFdWRg4tyBqpqYDY8QvUlxehAKIu91cwqYBuZh5sAMiWA8XcU/4kgt1jlRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758688288; c=relaxed/simple;
	bh=nGWZao3cAuvc6GN5huBPe13dbNhlr8frzMkW0aM8XTg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lQr3PYKrLoGJn8lqjr86U4WBcuRlup0RS+2Zq1MXhDKdrYeLWcFWpmj7m/PW99IK4YIr2QaQ8X+DMd8qrQu958qTDFFtF032oqKjVdJE+qPLVThWob6vXEm80LfQDu1Hn5Fca8AamvvfJi+t9G6MP9yk3bq51c+2e+gQfVaCM6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dpRa76/k; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=soWZNzc0UyQAvz1sDvcxWIwhuEl1iJZ2qfjLAtB7LoHaPfu7pPmuk/oNfKEVYyylkPsV1eF1txNxulB3KVQIsHTybewQ7qmV/zmI1FNNz84oUwj3K+Kg26X+h/1eADigrOzXotYWkRjPhPZKqT7YNMghY8Git9hmH/J35pifP+r51cXVucdACGS2MWsPX5k11T5uAf+NgnWPaE9uMRBGDzpIckibYZLiknjr/Irz8g6OQXwcsIeXF6aklibBmTOvus5BI59BsJXkX8F97WBeoVYIVCcPsgGQL92ZOA/aMjQNF9AFqtw/HDZRrIyxuqN7WB5hCv1w5X/OBUbh/ZO4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppOtWmZELak4KazkY7XplN6yeN17eCEhNzRB3BIOnP8=;
 b=weDjyqKGeAsvWm3GQbzVWTutjHHK0hBe4u5QRmH1KuyYORmo32Mb70crB8YLNWIf+G2OwcwG8CbJD/Pis6c/iq15lhvMGhq3x07xupwc+//enyFMMEcQZD2FuLnkytCnq3omY5eE9jEY2Pj4E19faTOK5vkr7RkXVhJghC+IS8h6/Z82coJw260knlbVHPIcqwKT87fTXcBM5LnA23jhNYQhDjGjP/VWiTFgN67y1Yl9GGx7OGK5r1A8homuRcYaJkcDblcFjVmPbDLSdco1tubI3ORRc77ynuktSlS0OY1Drm629naghM0JLP40GWLD/AMaTrP3mXF7JlvZ/gUmmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppOtWmZELak4KazkY7XplN6yeN17eCEhNzRB3BIOnP8=;
 b=dpRa76/kd4/HKgrS50HNoZ05SfJL2CclYVuFi8ovEH8LQrg9014rmjzACQk8RbJ4hdNP6VpiQYWgXjXBm7/sZa/tNy9+ICbHduUzVKlQcoYZggRTPNoeAjpo1oW/OMx6fv3DOvfnfebPJ1A8xswNVu0piRbUgUFG3uFBvxmrmW4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10032.jpnprd01.prod.outlook.com
 (2603:1096:400:1e0::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:31:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:31:24 +0000
Message-ID: <87qzvw8o9v.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 15/26] arm64: dts: renesas: r8a779g0: move interrupt-parent to top node
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
In-Reply-To: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:31:24 +0000
X-ClientProxiedBy: TYCP286CA0339.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10032:EE_
X-MS-Office365-Filtering-Correlation-Id: 2244ff71-7104-4f9e-b4c7-08ddfb23385f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3SSD62XpUFIlIavs6HTDsKT0g3oqEgjzLnFQQMi1J06xfjRgwCixXUzSlbHu?=
 =?us-ascii?Q?zwTPNm84Vy46sCOoXtG+ZXLxKpRGmjBiGquQsYCqllhl7AuYvze7pwJMV0Mo?=
 =?us-ascii?Q?tZWmpuQltucVzIL3sa55HugYxx3ZASUJjC60bWbwu/NrQUB3gJrMM4lMYMvb?=
 =?us-ascii?Q?9RERPLrN9H5HfEv8Ty8e1+TrX+Yj1flv1zWl0cTM54y2kXqR/8sY6iSPurnW?=
 =?us-ascii?Q?1j6Ha4ndqhqXdytEZqZrt68Umkz6RRKcP4QCMjBiKtXQi0D1KYCFS9VhnNTq?=
 =?us-ascii?Q?AGADtG2ikEGpZOvT5tVVaH7ZdPCaOlx3rPKpa9baFZ+a6YJUAmUPMxM7t4sG?=
 =?us-ascii?Q?PyAwhXBLiOPhUu/akctImBuxWCY7sPPyUn41kinZloeNwveAuviYFHU1jpyl?=
 =?us-ascii?Q?kCazqbLGglkJr0aOPkMEMbpPas3IouXs5dNNy+rUs36LLgbbkuRrvVTvSaZf?=
 =?us-ascii?Q?t6dPJSzr8k4KOvuz9OowtxXjdTz9v7a+m8S3bXlCIzSPPLfkRj44HX8V6jm5?=
 =?us-ascii?Q?cl7T92ch3GyW2gLjaeb+ozV8suvB6BulboDS5M3UvDshBYEvDgdSRVx69p36?=
 =?us-ascii?Q?zatmWVCgWdwpBouAxJ3PD6ZPn/+TXRqs8eC1IPyVofOSmeqpyXIGtzvypGbt?=
 =?us-ascii?Q?TJjG6YHTAOazO/TSmBbBP5kOWHKg+6HFYpSOqvsltSa6myA+faKRVFYer6lr?=
 =?us-ascii?Q?JbHSV3xoTcc2ku+HFAbWO5Mog9D/8ARcI8B/kjarc1aNJjcugOmPgd+GEhay?=
 =?us-ascii?Q?UWJ8kJB+YAxqWbbffUu/bp4boRtn+pCnJqXxdfVWTYJmApzTGXOjlnao0LQw?=
 =?us-ascii?Q?gBPrMoPClzYWr+pILfWmy+6HnGsu4P5cZsqP5AVETtgBocupjXa5BqL2Lsw7?=
 =?us-ascii?Q?TheCSqj+g6Hv0YeaJGwQqOVaztlrY9Z2SZDzsJuB53XqEs33AcqVml9Nl0+Q?=
 =?us-ascii?Q?8xDBGLKVn00oY2eGp2mDF58YFxNUXKRUGMqjleDcNwB6Q/kcF6Bq8DiZVk8T?=
 =?us-ascii?Q?pyV+x4884cFl44mh5AVmZMODvhJvhtg3tNQFKehgXipQT53gPrk8lBKBBrvb?=
 =?us-ascii?Q?7JAV1THA/8vY9eiKwlVgiCQPSufMc8bk0Rn4uPLhb8ozvSRRGOiuEsvEztuN?=
 =?us-ascii?Q?sQmBtH830t7hI44UVm9hHn+j7z53vY+B2C7AsTt6ezcAT1f0HFkJiB/Ouvln?=
 =?us-ascii?Q?iwb0rRDizPRY5yQ4PXVWrNWelhllaRIj5vpfGmjMdLRGITBV0NjGwHrrU/Cx?=
 =?us-ascii?Q?7RgDA4grto4dv8583Arn8U0ekAUl9h66Wh3c/uqRNWpfOT3rwProYzJm4LwD?=
 =?us-ascii?Q?y9eUTcerN+0FpnjS6QCwpstADHlwDH/4QgD+GEgHPJ6NvW5Wt1BqKG2sqS6y?=
 =?us-ascii?Q?Aq9oXmbLZ7mPAbsUiebcZAv1XruUIP3jAyuGCy3c3ly+xsiD4iZG4YrTA9K4?=
 =?us-ascii?Q?A3QyztBQmONdP9RDIk1jlM1SMZQK7NJ1eOtEzJ/hP+4bGZFBz4e2VA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+gVbeT9l+vIf7vtM8AND1jzFFrPJioN89lmXYAmpj+nHbOkj6QXEBuyJ/FJr?=
 =?us-ascii?Q?2DYa/be/biNu/ybEHwVv7OcLTCcGOCevWyhqf0ZKweVfR1yGXlUnBdXepoGa?=
 =?us-ascii?Q?nhbl25DbLNbxbDa0Y3H2L2KD9kvU1dmy4UF+eZW2IacJiYZDRYGb1lKnsBF/?=
 =?us-ascii?Q?sz7mH+C0jBmArS0nfEGWnUn6/tOvH7iBd8YiEfIKtqkGHISLlLVMZX+5fILk?=
 =?us-ascii?Q?L+qD7gQJMRJ6KpE+BSsOJT50+rIj+GKE5cWH0fw39WCCDuR6iuuWbC53ksFc?=
 =?us-ascii?Q?EsHZ2CqVjlhrXw9HHOJLasVLXyjk6CMKN6XjeHxc/a8j5uUyRqQIYdcNqoMO?=
 =?us-ascii?Q?TwKrmR4gdPjcH8rT1tVpQaF7z2kdYW0hpiw8xiPjEzukwV0smSFMjZud3TSX?=
 =?us-ascii?Q?t/5/MyPoZS0Spg2Kr/XaqVW/JczTWVBGzgPXg/wTfRbC5RL4XlRztPzwlrzi?=
 =?us-ascii?Q?9zVSVVRwE3+GndYUHePMZF6EUQKNKDi6zY7QB+xWZRECKG4vc19gt2chCunF?=
 =?us-ascii?Q?MR1MYC0eBK7GM14cN96Zqck4P89JUNJC7AiuXuzxSz+Eacxi7XcO9+hTjpVR?=
 =?us-ascii?Q?mh0fpGt/OXpKZGBm4nnePGzk4ZrNhR6CI1GTXWSIw0esN4iqVeDH/ivUAmAw?=
 =?us-ascii?Q?bW/cbu0SLSHifW3uPnfY4+frKl8W+la1EaFqnYmdxSH+bZM1tVHsnCIAaSB+?=
 =?us-ascii?Q?gJlv4f6mrben3QeFRCcjZqJt5dkD9AQOiI9k5xHwKDp4dxb3xcq3FdXu5NqP?=
 =?us-ascii?Q?H1CZt0GpPcqXngyx53LTFJ2DBzgABmq2duWC7Lyotk+r04hmMHvQoFVuU0+K?=
 =?us-ascii?Q?9E2ReICEl/IYQZpIBkH2PQxA+0LcennQg8yN+7B7WD+V7AeyH5B8f42wEuYL?=
 =?us-ascii?Q?PXHlNgipdaJ25WT/vFaSikTVLjbDkpomCPNcqO16cE5oZpZFl9ye6s0p4p6U?=
 =?us-ascii?Q?q5YFrVXHJzQ1Fpn5Q6U/RKgwxX6/S1icG/6S2ca61fDEeKVeJELNwmxEqUMQ?=
 =?us-ascii?Q?PgCXKOY6bHNf8lVSIrLVI6wLQinU+ieWxGIm5ad4tDUNC4O17unQuphTNcNM?=
 =?us-ascii?Q?Q4FfGVOaIrMpjQyO5/wRHCZxEbPLh7IH242+mymbX53Y055DEz5LNhVaW6zo?=
 =?us-ascii?Q?YsHgdbw+hwvNKw2En3dIb1HCf+JMpuOHGWqz4Ma8NWx8bBnev880VULh6UKP?=
 =?us-ascii?Q?DGJNFiV/iIiWuqstaPL3QsDky409UEFNibS5SzgvHfMj2MgPXCcqvBLqybFI?=
 =?us-ascii?Q?jeNFtDkfBGZLRtSIHMbD+mspMc8JA/UXTrvSO8CU7QIpC4pKIqOiKyntveJi?=
 =?us-ascii?Q?CNCwPtectFj2jt6IyF5eY1oysnEZXyhyV72pwmWiBoc0YRxo9oJbfP5mS40D?=
 =?us-ascii?Q?WQmjMzi0Kx9/Isi7fJfTxg3olIKDeS5MIzjn0a4l+eF+36dbEKrbiCAx0kRP?=
 =?us-ascii?Q?N63SzuZGdyBIR2iZ7wUobu1lMsK5h6aUgoKKngcFoV33e6n9zIsA9TPSXzKf?=
 =?us-ascii?Q?amA9eveAuUc0ZihlXvx9KAppRmcPXSivr1rUC7Yf1q24X7MknpG6+A6HTyuq?=
 =?us-ascii?Q?msPRz7RuwxmDWQEmXLCT0PEjpHU6hDdV2Il+abWwOIrTX125XJe0yXUXVCDv?=
 =?us-ascii?Q?+nNWzG2aCEsN096MXd00i5M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2244ff71-7104-4f9e-b4c7-08ddfb23385f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:31:24.5902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jl4LH17WdmxB4kWAV/gEct4Hwd66/U9ooZGics9yw4umoa3BeUitxiw7bK1/hs1Rwhf0Tt6+ET0T6Q/cS8ixvL1fQwGmi3QcsrO9Y0JmqtSHGOl+ZKduikJUwLEPc71H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10032

We can move interrupt-parent = <&gic> property from soc node to top node,
and replace interrupts-extended = <&gic ...>  to interrupt = <...>

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 4fae063bf91b..2347187f08ef 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -13,6 +13,7 @@ / {
 	compatible = "renesas,r8a779g0";
 	#address-cells = <2>;
 	#size-cells = <2>;
+	interrupt-parent = <&gic>;
 
 	/* External Audio clock - to be overridden by boards that provide it */
 	audio_clkin: audio_clkin {
@@ -193,7 +194,7 @@ pcie1_clkref: pcie1-clkref {
 
 	pmu_a76 {
 		compatible = "arm,cortex-a76-pmu";
-		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
 	psci {
@@ -216,7 +217,6 @@ scif_clk2: scif2 {
 
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		bootph-all;
 
 		#address-cells = <2>;
@@ -2601,11 +2601,11 @@ sensor4_crit: sensor4-crit {
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
-				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
-				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
-				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys",
 				  "hyp-virt";
 	};
-- 
2.43.0


