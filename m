Return-Path: <linux-renesas-soc+bounces-6667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3AD913F7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 02:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02F2D2821EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 00:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0009A621;
	Mon, 24 Jun 2024 00:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="StVey6MD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2070.outbound.protection.outlook.com [40.107.114.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EF4804
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 00:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719188194; cv=fail; b=Lc8PfYpe9vNyqGPtCxfZVtMYgo7lllWUreEFog0nyjETUAUpQ38NKDVF2J1CvrSsai4OsJW8x5OrII0juW8SHWgg/kx7fHZfauaU/BzdgNvpcYpBgvTetHk73WVIqy2MVvqOXYu8osDCTp8bBKEA/wPJ5Hiq34iviQINNLg61+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719188194; c=relaxed/simple;
	bh=6xrKBkSCADA3sTi/sSAjbyoPIqPVWrvAUkYSn482PoI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FdteD+J+VJYaD6bOWMy1eH9AeSxsomyDLaqKNVvIbdoseM5A5INEGPStloQF6d8b2B04XDE5JA5JA8zUrYBr5kEVocev7JPTUY494o+oEjFU3+zEGdqKCIOJan3IYlrTs/Dod9IAgHgstnKjIC1PjkgUuE/X6/sQW6aB5nBFyME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=StVey6MD; arc=fail smtp.client-ip=40.107.114.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7cnk7/LMW/jm5Z2Abbb5Fs17F/VEnRnaBJAAWbh+tkD0Jrb1kHW9+M32+HMbRj28+M3eRafu7AnQtasAqrY29i/FosUPP8Dx1TVqhOcQi4EaQSgkm4NVMKZsYAMaNn3YKRs+yEehnJsnVTFMGxrVi0nMpMXqvALJK+Gy/6U+gM8+Z732pnqPBAfFZeoEdtTlzkTRnG/jEe28HZOgCqYRCVLLDlCbK4q4xe408D5W0oJHIhmBI/NE7AFwuVtUCGGq1G7V0RzOH5ePLjtszjmoWflGKGAvDv5c2bCysoyCihyZ8D1ydkwvmsbE138doa4lyaa15IDNMAX/0YMX2fDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0YRh3wQvl4hc/66iGBZ52cXN6dfefUFKibCwMdJ7eQ=;
 b=M2yIpydNJ9iBu6BN1+cYeWN3KQLohXC9VJi4gq6KdWbDTf66yaBWUoj7fY3c7U8DLylVWWEt/KRYlq3NYnlo1o67iHjtmO0h7o96a9zZTweCMTpnBf+5rORFIj1P6cSxEOtEtyzy0mOYN36I5dgg1Ch3cph2NDZzDVfLfrRug3uaahNF4z0FAALNdxBofxrsfiGA+V6Yccl9S6O/eH1S4jj26+5zZMC6JhTPOLJh7vLkRtn9mC2mnkXJdw0mfVOBcg7PUAB1v1KycwO02j2VZRQPb9g5ZbSbSNPe5f7HTmg+DeW7dQxd94/Q6L5XdAhKSmtobfzbfgAQallhbONfag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0YRh3wQvl4hc/66iGBZ52cXN6dfefUFKibCwMdJ7eQ=;
 b=StVey6MDdBSONAHbQs1mKsvNpSv0jXPVvUIURmWqO65xTdlhPtVujdFnXo14yOxkwR7/XD2Qb9DCV4FZ6jlpsBLsuv++6tYDm87SuNSCcIgKCoGm6pFVW3jLFz9XAut9gLFXJ8aEzt20mn1n+HAKxZXU8xrMRKhDtIMFgk0BswU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB12050.jpnprd01.prod.outlook.com
 (2603:1096:400:405::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 00:16:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 00:16:30 +0000
Message-ID: <87ed8nkxeq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/6] arm64: dts: renesas: r8a779h0: R-Car Sound support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Jun 2024 00:16:30 +0000
X-ClientProxiedBy: TY2PR02CA0072.apcprd02.prod.outlook.com
 (2603:1096:404:e2::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB12050:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6d9015-9090-4bbd-93b9-08dc93e2e575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|366013|1800799021|52116011|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NaL+cR8X557iKAvCIOCh89c0iaeoFeShnHl4daq2IOJcC28lIyvv5Fo1DlaS?=
 =?us-ascii?Q?0owtFzN/tsgAsHY6/aJju5YI1fOzg7EjXW4T5iMoSG1PaXLK72wyXeHqrWil?=
 =?us-ascii?Q?3ml5ahZs1Y5B0GgPMDyQYKvaVkQsDGBvHr3PIZF1Uwq1sFvuAM6giHwHIDUE?=
 =?us-ascii?Q?blZU5mrx2sVa2XteH5OtZmOHcHGtzuTtB+HNsMKPKeCODaPGcsbEgFr2TxO/?=
 =?us-ascii?Q?wG51S/Nna3sJOlEJzV3kNEIL4vrTyORJHKNdYGb9A7VnG22hUWG3DC1rcwH6?=
 =?us-ascii?Q?j58X0osfXebKQC1nh1JyxzP2tedSc8j6ausPCIcx2ctOBJpZLbakrwTZQ0xd?=
 =?us-ascii?Q?VFsMQ+lxh90FLqR4XnhfIBExy5XHYqxBRi+Gt6zU2kwMEokr7VyVz2j1m8NJ?=
 =?us-ascii?Q?sE6eE/b82EhVsd5rVKmENxHQ0TdQ6+wfNIJHeE5cfrpae2zfAY0MNk5VRG3R?=
 =?us-ascii?Q?kYtw1z8gpyWvXep73/VrIxV+tfk1JNy2rLR8pxz6oJQec1sojdKcL6WVXe/x?=
 =?us-ascii?Q?3/E4S0+jQYDtIcHEFCbRcPdnqlt/VDdVw/4jhxUQcX1eYZXZCnGuXy4GFAQX?=
 =?us-ascii?Q?Zajuk0T+BsOK8f67YRyCGiGSD5oKerllTxuEipLWt2CGqBCVgqJ4kv98L/MU?=
 =?us-ascii?Q?Mn1EvT0fGwRSYNfqMDciYAWgR7Mmq83R7i+Faw07ShepRVDMCVDwmCZYWkqB?=
 =?us-ascii?Q?k3MYhYC0ELzrvSiS/5KZY/FL04lXKo7Ag43BOO9k1Zei0bjX0GYgM5/viwCE?=
 =?us-ascii?Q?CkYxR3yWRjQ2be3498GOvKu+iEIYngJcqULfNxIJj0WZkN9i2rjCp6AEoZ5g?=
 =?us-ascii?Q?+H+SphDvKnC3kewmsaTjFc32e8SKP0vf+z8pyj6ROj7cmyHZ/SPv32De5BcW?=
 =?us-ascii?Q?RtQvSS/N2YuVxmXbiCyOf9a1dCZ2pfREl6cJkecNHw4PpyPzH6GB2AdxwK80?=
 =?us-ascii?Q?hFpZJiq94qi72gFhM/GTMH6ygexnnzKbFoL9i34l9SCHoBjYCnnyhg81fsDX?=
 =?us-ascii?Q?xnTrBR3QKmycBfc9NTOtkhhaca+dRK4IlAoLNdzuIPyRQVukPiqkfptfGGUl?=
 =?us-ascii?Q?ZThcnSZPg++xKEZgP/DwdlbD9ByrFosuuF0CR6XM4epfPbXigrCxU4IiF7Pe?=
 =?us-ascii?Q?lCzWTXUb2XcU5S55VsrL2JOQ8KYf+VTIBbAgL9/u6U7YI562qSOyO5Ijtp8m?=
 =?us-ascii?Q?VholxarBV0GX2zB4wRSFLCHguSEVB999dE5b7BIzBh2extu+hBkHWIteD5lZ?=
 =?us-ascii?Q?kxT1Ojwa0RyTBforJWdFKe5szqv8r2KezwrlqVCEFOCByUZsJldzOsFwTACU?=
 =?us-ascii?Q?AlA+r2ESxP0nLkOV88x78NCyFRqs4LprTgHUVAHuN+XoP/sKLj77/JJDx62i?=
 =?us-ascii?Q?nKonaA4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021)(52116011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?10bv7jh0aHqrObg9TH1r9aYXB0Crrmt4th/QoTFdutSQ5IqGIX5n6l6CJ3yN?=
 =?us-ascii?Q?0jTJ6bB/IpafcULqn/4A/++lTRKmXmWQC6hrechbxkpL0sVLS2wkXHDaySYA?=
 =?us-ascii?Q?zVcwir4ctV9Bd/XbtXyBicT/4Q+9RHFsUGuhFMIt3BUfWd2et+DFcr6XGTTh?=
 =?us-ascii?Q?p+rOlcc/YJ86iBqpEfPC8UU1XcKmZtaqbYJ3Xx4sftwARclP6kH6l+EM+m54?=
 =?us-ascii?Q?ehjV2Fec6ZCHqq3pSwnvNLkLtq4u1lD7DuIFG5STCPOPvXIuyx3B9SLH1B0z?=
 =?us-ascii?Q?xg3VAXRlcjiTwLsev5XBC/pA9VU/l0uLxBjtWiVSnqKL7Y3uXwuhPRXr+9EC?=
 =?us-ascii?Q?h4UHCgSMaBKR9lhDSNJhIiJ2lkJfNJ7nE4cra8fS1lljmE9lClasv4j3XNe4?=
 =?us-ascii?Q?nt2bdjAVd+rBfWo1ghLK/ADNmLg14zUD92b6wRCWO3mWFPb6lgBfQ5T8W6XZ?=
 =?us-ascii?Q?eiiZaWGcLuQjHbemrZDaY1MgSeOuoPvu/reooShuUK9XVVPQWJ5muQaULVrh?=
 =?us-ascii?Q?DmXG1LZOEc41k6ERYgngn595jJtNCKUIxnOUond15Uz46iCqoEQSf3nOHlNq?=
 =?us-ascii?Q?aIMooD4iwoXrfBzaRrR5FMqBRGB93QBvCbsrF09kylTuk68vITnOcVSKVm1e?=
 =?us-ascii?Q?VVDs4nHUpHoH4+qjrArxE1M+FMax75n3rV4jgPf16u0SKYB19WuNAoxHFBh2?=
 =?us-ascii?Q?8RoD+1x8KopFoqdEUB2pR+QqsFBoBNjcbVWUvn0lAlZhKNi5ResUYmjI1FFc?=
 =?us-ascii?Q?zeYf2wVgxNNA1NV6Imvo5GhtI9jVKjXVJxsy9nc7iXRaOJCHlBpUmBdWBI3k?=
 =?us-ascii?Q?kNoTF9kwNR2+SkfiLZ5cADaSEJlG3yif0j4AZ0PuvIVTFnmjUW8o7SodEcSX?=
 =?us-ascii?Q?iuhTMFxTuUgdlnOZ0SkBUGU8Rycx+aJMcwIuw9WafexcajhvxrQ1GuQ2kaum?=
 =?us-ascii?Q?8FwkJA4sHTbL4Vah0Ig/UcUYSQBVcHxnfJvg6OXLblQP/cAbiRq+t1n2ql6y?=
 =?us-ascii?Q?xk7lhCFP9NIkabBnCLLYKvNS1AcMINON7xjeDZBo+mWrifm1z3uk68z61Jc2?=
 =?us-ascii?Q?da4QSIuOwoc/KPJewoodEf8wL7wqK+MSVa8UbgvtVLmdbyVM0TbRJX5rwjWe?=
 =?us-ascii?Q?x225KTkt9Z5cZrOO2lfuIBblZ8O7OQ/H431YZopHrYz9WMHg43gc9vnWP36B?=
 =?us-ascii?Q?R7syrijpQZCnymg1erm+zZhqhS1mmJ85l2oOkTwRtPz/mBSzhxoJ0uHzsCcE?=
 =?us-ascii?Q?fzfe4xbw5ULTIJbD+Id5Rqq4beXg13a9at1em9pbFLKuaesF7/sKHjva0hax?=
 =?us-ascii?Q?W5G/nHnINF8p2944zEoRfSrQsk8hEPGvSHxvtuHNMkJD2wvYBVBUyTHABdEf?=
 =?us-ascii?Q?P2tmyrpxEr+Ct4S3zDVQ9J3/2VPN/azScSINNVAiLF1puecQL9QO3OogFJJE?=
 =?us-ascii?Q?yvLHMNMCzqEwIy476kg+3Zx+HYpbWzWuzS55MPB63v0MlT9g97awh2PkLwwZ?=
 =?us-ascii?Q?GWyAgBYQDA4KSS0QpjsKXDi6lRgEde4LBMfKf4d5Z6Vpcd8UYYIRCrGlbdw3?=
 =?us-ascii?Q?TBq2k0VO2nCNiHQXrlm9LdMv7Ycc5TsczgtaI+b8TAAOb6WA43RtckkmtORh?=
 =?us-ascii?Q?YQrFVFzb9sHhLQSGPAhwE8w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6d9015-9090-4bbd-93b9-08dc93e2e575
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 00:16:30.2275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nWYrmoB8wM52hWfRUsOnZgD7w+RHcjtdaLGWkvrG/HY5iIecymIsK2YAJRi3nkCm2Hnyt2cb/9tmuiBrEEjzm5UG+pQ0Pwilpez7SNNzwu7YRk5RpDy5+y5pTZh2ZL9l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12050

Add sound support for R-Car V4M.

Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 68 +++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 400169fe4a1a6..d3c8093bc0d9e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -14,6 +14,13 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	/* External Audio clock - to be overridden by boards that provide it */
+	audio_clkin: audio_clkin {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	cluster0_opp: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -1464,6 +1471,67 @@ dmac2: dma-controller@e7351000 {
 				 <&ipmmu_ds0 22>, <&ipmmu_ds0 23>;
 		};
 
+		rcar_sound: sound@ec400000 {
+			compatible =  "renesas,rcar_sound-r8a779h0", "renesas,rcar_sound-gen4";
+			reg =	<0 0xec400000 0 0x40000>, /* SSI_SDMC */
+				<0 0xec540000 0 0x1000>,  /* SSIU */
+				<0 0xec541000 0 0x050>,   /* SSI */
+				<0 0xec5a0000 0 0x020>;   /* ADG */
+			reg-names = "sdmc", "ssiu", "ssi", "adg";
+			clocks = <&cpg CPG_MOD 2926>, <&cpg CPG_MOD 2927>, <&audio_clkin>;
+			clock-names = "ssiu.0", "ssi.0", "clkin";
+			/* #clock-cells is fixed */
+			#clock-cells = <0>;
+			/* #sound-dai-cells is fixed */
+			#sound-dai-cells = <0>;
+
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 2926>, <&cpg 2927>;
+			reset-names = "ssiu.0", "ssi.0";
+			status = "disabled";
+
+			rcar_sound,ssiu {
+				ssiu00: ssiu-0 {
+					dmas = <&dmac1 0x6e>, <&dmac1 0x6f>;
+					dma-names = "tx", "rx";
+				};
+				ssiu01: ssiu-1 {
+					dmas = <&dmac1 0x6c>, <&dmac1 0x6d>;
+					dma-names = "tx", "rx";
+				};
+				ssiu02: ssiu-2 {
+					dmas = <&dmac1 0x6a>, <&dmac1 0x6b>;
+					dma-names = "tx", "rx";
+				};
+				ssiu03: ssiu-3 {
+					dmas = <&dmac1 0x68>, <&dmac1 0x69>;
+					dma-names = "tx", "rx";
+				};
+				ssiu04: ssiu-4 {
+					dmas = <&dmac1 0x66>, <&dmac1 0x67>;
+					dma-names = "tx", "rx";
+				};
+				ssiu05: ssiu-5 {
+					dmas = <&dmac1 0x64>, <&dmac1 0x65>;
+					dma-names = "tx", "rx";
+				};
+				ssiu06: ssiu-6 {
+					dmas = <&dmac1 0x62>, <&dmac1 0x63>;
+					dma-names = "tx", "rx";
+				};
+				ssiu07: ssiu-7 {
+					dmas = <&dmac1 0x60>, <&dmac1 0x61>;
+					dma-names = "tx", "rx";
+				};
+			};
+
+			rcar_sound,ssi {
+				ssi0: ssi-0 {
+					interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>;
+				};
+			};
+		};
+
 		mmc0: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a779h0",
 				     "renesas,rcar-gen4-sdhi";
-- 
2.43.0


