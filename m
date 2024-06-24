Return-Path: <linux-renesas-soc+bounces-6665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB37B913F7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 02:16:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 819952821E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 00:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6FB621;
	Mon, 24 Jun 2024 00:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Z8FJtpFe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2054.outbound.protection.outlook.com [40.107.114.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05F27FD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 00:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719188182; cv=fail; b=e9Yj2NZryHo7eOwkwoy91fv62in25Ow5pwwhiIAB4j1N3CaAxekzr2WHaJvN7bWY91I7Wozogmc1yPE6nnDewd5rqoMLLikZrm3KaPNGeSDztkWAVQKT8fNNWBxMdVTH5ZwfKyTc8iMJ/ViC/EqfZ3LZpZuZUI+x6ZdoBYzSNps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719188182; c=relaxed/simple;
	bh=97uvgqxyIoVF2kPK2PokIhjfM2BznGhxdLWTUksqLkY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=o8+qOcjm3YXsn72RE0NK0k9AnLQLXmwOHAjv8qMENVmTCPZzAXnLpPOjt+Fvw9xOCorbzNQHmXy2aRRv/WqDyAgXj4ouGuQRQImlmEiZSgn/6q1M29hGJZ3rAqJJ/lW202waoB+hY0uhzAm/y5WWUEppTqK9gVLnSdIQ2SOFtpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Z8FJtpFe; arc=fail smtp.client-ip=40.107.114.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQJ9cW4m6oXlg0HwfvqWkCEPIfGVy2zKIjWDXfwpNIYXX5gSt7ZrfFw00zDiLacws+q9WqLBoIu2/6tvSs6WGoNXyKkFbui6A2bdzjGT3GHFVhLFpIK9T3cnJMEbXtSZ/vjTn8xENLLxz8tuK5PG8vrzunl/uxc6roZ3LVKsjHaXZ0L+M/JjueN2g73OflTPxHVP1StuhdJrsZc/N/0HdiglxL2LH63mQ/MzUu7A8obacThZVZbHub55ijxcnzFYVRhdCp9YW6xfCNgSSnGaXBF8x9uQGu5uIp+z1oVIVmYY5F1gZHSVDw3cpshG78hozKdpmmlkiHJfF8jwJ7LItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVOr/DM+lhSl9CZOZgfBDbwvTAj1VXnuxpQBSyg5MqU=;
 b=KooFLAEVtcIwT7P17gW5cDzTMqUdzPkvOZTf2MJ9sZW/cMPCUZbnemLETwv3TH1cdB8tdEIS2icAd19uYrtDWno+QS7QOzX/W6etvSLC+c4FazLap1xLqevn71ZxDmU47Sl9EA5C8pdpZ0aCnArDpNxQgK7PzrJdGPPR90pD1eOM41Hkq3gZuYOK61aVjcKZcXZXHndNNgwP8kd/WGyydPBsZ9alIEbQYv4bRUyYE5YtO9gaxa5CeMwq1lukG3DO3vYEMJIZo3++XDkfMcQ9MBFuwuM1HYOmLEz5Ehmg7iSOo3GWLsl44S5yLOf2UazNAf/i/jerzNNSSsFYOEwVZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVOr/DM+lhSl9CZOZgfBDbwvTAj1VXnuxpQBSyg5MqU=;
 b=Z8FJtpFe1xJe5Py5eriZEWFqnsv0yylfEPR0ZOmsK122ZS0IOTipRDpR6dKnx93CX+arSHTX0zZ+FoY7Tbe6EwOW79MR48giI4owPnX9WhuOtEtqtivBoF5+eStusvSfb3Tf3x1timFTFNb+z4dMjUrFveQju1WBvrcoDsok0xE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB12050.jpnprd01.prod.outlook.com
 (2603:1096:400:405::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 00:16:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 00:16:17 +0000
Message-ID: <87h6djkxf2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/6] clk: renesas: r8a779h0: Add Audio clocks
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Jun 2024 00:16:17 +0000
X-ClientProxiedBy: TYCP286CA0074.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB12050:EE_
X-MS-Office365-Filtering-Correlation-Id: 7df7aa4d-6219-4a58-991a-08dc93e2ddfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|366013|1800799021|52116011|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tY4kfshwhZljP5MuobqiC0xL6lwZsZ9LjNZ6eKZFbTyaXd0WLUWWfUjgvdhN?=
 =?us-ascii?Q?xZH9YTddr0S1CJyYN0ibYKVWYsrWnOnI8XHRlFF5JSu2ce0KbEkULbynYONF?=
 =?us-ascii?Q?HMTzf/Ga2MiWjsiUFCweFLy8boepro0F7b07tRpHMeKgkywjAnKoWBFnoxpO?=
 =?us-ascii?Q?Epq2qq++XqVpd3En4DPj/Ye3ZKCbqdi7K1+kz4PQXhRa+R4Mkoo1PkgzKQ2r?=
 =?us-ascii?Q?Ji1uosCbZMXzqQXR4N09eoorp/3YYaFaoKE8E3uQG5fZApUwXtEKvt3mw0cd?=
 =?us-ascii?Q?COlaU09SL2/sooBApx5rSE+UN8+GJm+SdyB34OC2qi9IwQ/k8VOFbxnavU4S?=
 =?us-ascii?Q?DRCqW7GlfVrScicOfeaRGlkGNLpLb+A14NjX2dQOdfP4Mu14xiWAJ7JPCVr1?=
 =?us-ascii?Q?iw2tBStn2ZVZqCanhuX6DgQRn8qPQNw4BsSOzVq/QUFBLLzAbyBkcAaZQXPg?=
 =?us-ascii?Q?yYGeR6IX+L3LR7MuESqwggucG322RtbVzTksEYNgiMEoBoW8HRSs4kmQoU9y?=
 =?us-ascii?Q?5qJfXoIW4qxrRK/YchpWkJH4M+YSf/m32OE/f6zt3OtuvWpiZa1ABVwDnwt7?=
 =?us-ascii?Q?3eh+v6Sa2AnW4QD7Ckiv8PylCkQtbtOXSu0y2ewzFqyPsraOco2IFf1x3zor?=
 =?us-ascii?Q?YQEMbYMA18nBE7m5UvI9z8mqPe0Kh0G+/8iwRfam/lwdKJhdIsUjXZUpNB65?=
 =?us-ascii?Q?UoGlQx+2KXTELTLKp/Me4ifVZB0LvyFRLWuBA8KD0OYTML8VcpbYhjDd4Io5?=
 =?us-ascii?Q?TSXE6O/+Pavk5V4pwwxAinBdLofTtiRQdXQJkQsEvIiWSmZYKG2EKhoDgfOv?=
 =?us-ascii?Q?VeSpR/Fhemzcg7N/XE1n/TnPGdIqpaiHNh0h98M7kr+Q4e5de3jSpRpSYtcT?=
 =?us-ascii?Q?Iz46xqusYx1phUZN43ieEdLvsuAXBhSie6XirZVKqvgEFaSXtsCHVad7jGAp?=
 =?us-ascii?Q?KOXG4Xn6Htzhbnpngzr/1PAyfyKSW8775uCpWPKoF5NP04xi7HMSW5RG5Mjn?=
 =?us-ascii?Q?SUNXF6+MXhiE3py794mPAjGYI8uMbu6dVVkCUVqLU//8knREBlAAJv7GoLLg?=
 =?us-ascii?Q?mf+EA/HEdkfAQCTh5OD23wXnbK10zISlIYqRYJdI85vls2yn8l0zVeSZuk4E?=
 =?us-ascii?Q?0ELB3J8Pek/n/24+aEE3zxMDYoY3xQshSmkpLLg6NYxyV1x3TBCC6qbn/tDj?=
 =?us-ascii?Q?KFJoNjV0Og0OIl8PGRoD/A9Ayr6POanKFUqAqtCvjEo7vKt2p+tKdJ9Hb12H?=
 =?us-ascii?Q?latE5XYQ6y7fkvdqIijU2oEcw/4PDuMk29opXKRH4/IEFn/Dy4o7rWn0rwI9?=
 =?us-ascii?Q?PosDmkxFOfDc4wYiy1XmYKkQD+ETBr5wrCwuIccQTkc9Lyw39dacYoPChDWu?=
 =?us-ascii?Q?BjbThe4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021)(52116011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TpNJzEPRIBMpg9kW3RL1R4IssRMeMB/E3oTTogW9HXQj1g9AtcbPijNMgaF8?=
 =?us-ascii?Q?bKbhRENulEueMSNdnPvLxmt58o93fdViAcU0JICE4yPYUroGLLOXyqDKb5SI?=
 =?us-ascii?Q?bEzOQJSUFZDBx6Af15tRYy042PMt0gZgdV1eR8Sr5pbE2JXOFClmjEfRkIYr?=
 =?us-ascii?Q?kQkvgl5KZpVk36escqoNp5FQ5a3MV/gVFeUHD3LDxEYfUh48eC4ExYzCGhOp?=
 =?us-ascii?Q?2MZQWXl7yBkjq7Gl2BenQKfNDrg8MuF+UsrUyR7odMDQSK4KDIXY2rijHLSY?=
 =?us-ascii?Q?FWvMzJCyp865ek3roUeffwrgeWRYvJUIz45wP6Q1Qy72KZ5qXIEDD4ZnlWbA?=
 =?us-ascii?Q?JdHAEAQG3/FLzOPl/tjKiBZDQXmBGgxyGQZ3JS7E/3IELLYPKiFwE37+wr/o?=
 =?us-ascii?Q?CAwzixe1gxU69UUFz4NuERtjiBgfRHTW7rF3nocoEnaPnjGjSYq3oAJF3cml?=
 =?us-ascii?Q?BPzK+SCeV3aRT73eIROMH3Vk3j7GCkzMrBHFglDehybF5zj8FjjEoda5WJnO?=
 =?us-ascii?Q?gDj3AJWzHr8ANps4kB4eyq+oVE9tYJWB1ObKReDhrGM5TtfPajqf+ulGyFtD?=
 =?us-ascii?Q?LlQREJDrIOhHMe5s6zNoJNiv6ngKlgh8TYqvbrL5ZcQNhQq+v49/9/0fdGEk?=
 =?us-ascii?Q?Vn+xzzZyNjB4oNVBEM4yiVOiF6wLUXBhhWg2z8UkQh6Nyr6pOMbo3kW0T7Ln?=
 =?us-ascii?Q?s+zz9V5gHapgNjCDWUzkjGN6vRMyxBIu7xr6EMt6mH9Wr1tv8LaXV3AtHChP?=
 =?us-ascii?Q?OoRF2Z1UO2pCuVSO0J1Zay31l5f+22ytWcTeSM/aNFSZ0zRH7QHR0bA1CqsO?=
 =?us-ascii?Q?4N4FV9EsfXsU1CCKKrR2JbknDubPaAPYmgmnhrm081KXUqtPXmGOO/NsYel5?=
 =?us-ascii?Q?NBDOUDTBP2cG6eVxFFApdIg5B4vqHl9nYOtP8VG53QNMQ/xPOBGNuOTCrn3P?=
 =?us-ascii?Q?EJsw1GoIxuZr83IcLhbkT3CP37Rn2eoER0XTAN+7D0aIbK8M/MpXK0T81sbg?=
 =?us-ascii?Q?c0Mz/7wKAbIEJC20vd3/UfeKTLCGuvky3L7ZDglq4kGFb/iVV742tqx70ZmB?=
 =?us-ascii?Q?/UtEnbTk4sZZWw1JO01RDxMThg8jLTm2jDPRFiZp1vVxByMcmMuqpOkLQwmP?=
 =?us-ascii?Q?JwFYSlmHuRV2sSBmWidj1e2+01gI1+pMMXJB/aaFBZy4QMkr9BhuIB2/9YQk?=
 =?us-ascii?Q?Z6AGXeyCgqZECV54k2azq49xY4HgCYOr/I72kY4i9vyYTlZuFdFSqbYGMG34?=
 =?us-ascii?Q?dQBixTyTmhoEfaZ2X2WQ6EbCLjek9wPvypb2XE+3Ku0PRjucKyXRmWzFFvlG?=
 =?us-ascii?Q?x2WFdMmPeHETnVbkggMUsXvVJvNFix0tUbtrvUfDtMwAC4YyT+bNzZixoLo/?=
 =?us-ascii?Q?m5S5q2nBnUUHVvE5zRlR0P+rc9MF6usvUhVOTerl4+HUb+ebdt4QN1TF+vjL?=
 =?us-ascii?Q?iMIkDFjXlAQWEMPVAZkScP6d6MjGYYrh/UBk6QWzRqEAGB8fn2jGfTi+3lHl?=
 =?us-ascii?Q?2Y87sapY2WEZjLVZyrfWLrSPAntc+AuKnr0zOVVKecT0J/bHTfJ9bPh6thVH?=
 =?us-ascii?Q?Rt0GvbkHD6QAF7c4sPe3cPoatf1xOel8HWiFHUyNVrJI7HOyr9BHDo3bm//h?=
 =?us-ascii?Q?zI3EkOuubOOo4oxRak71CwI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df7aa4d-6219-4a58-991a-08dc93e2ddfe
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 00:16:17.6921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CofhweOLuWf42UKgaz8uNQpuIwC4sa6rVVCrgQ1rRl8qngh2DdSdyBOvV2K3nEBmHVYR7uMzJIafB0rL87tl32OEayWKaCqIQLKKbE6EjaVaai84kHpSZVtvSMtaRpgB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12050

Add module clocks for the Audio (SSI/SSIU) blocks on the Renesas R-Car
V4M (R8A779H0) SoC.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 5ca1b14a6d608..d9d5701f7eeac 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -233,6 +233,8 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
 	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
 	DEF_MOD("pfc2",		917,	R8A779H0_CLK_CP),
 	DEF_MOD("tsc2:tsc1",	919,	R8A779H0_CLK_CL16M),
+	DEF_MOD("ssiu",		2926,	R8A779H0_CLK_S0D6_PER),
+	DEF_MOD("ssi",		2927,	R8A779H0_CLK_S0D6_PER),
 };
 
 /*
-- 
2.43.0


