Return-Path: <linux-renesas-soc+bounces-6666-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AE7913F7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 02:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C519C1F2199C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 00:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45EC87FD;
	Mon, 24 Jun 2024 00:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VlVywl9b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2060.outbound.protection.outlook.com [40.107.114.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6CF621
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Jun 2024 00:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719188189; cv=fail; b=RMOK2KDD7WVzcvfs50yFwV30BJPrnco3UF6EGwdB8wv3+WTEYi/CBU2rcqkGpgwJcFclFt7+CRePEsKRfKrQCC8/lOePESH80Hm/KBaRS6ImxQisE1iJHgeEm52Q0/5f23IeAA+6+Mu4AUUVmTAtsvoW0+4TKGS5NhJobPrZdGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719188189; c=relaxed/simple;
	bh=9n734crskM+PeEswKQ0iUu/kMb7vngWnXfCgofF0cEE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XL9WuoL+OcD+icl8B9TzS+SK5y1amntS1VdAgu6TD8HV9FueBHHbxSowCINB7Q4qBLGRKFL7A04av/u9rtRjkds5V+hLAYvoNP++LQVrh9Y7t4h5z9FuD2W/CBRWojRYsK9Z1u9HoHxZXS6ErKpxsdcsLRKoalfx86rX5It2x3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VlVywl9b; arc=fail smtp.client-ip=40.107.114.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PPIU5AxAlw9Kvso5iHmabHjBBt27QCLi5HczHFL67QH3oi9nReWuy8F4nsMF7tNEFfOvCxt/qyQ2VPHHhfVko7o6RN8BQHfXpv6RoD1Ns6ciflDdpAF9tpguSpyK2DM7EDdlkyMpcmREZhNiGaV+9HEZ6Jtb42B4a5/9VcleVwcJAMnUN444zyklpEZ0/49YqI1xaFGGLpaUnA+AixeVOanSf1QlR8lvWCFj8UI4axWWugKVKoyva//4sNX0jN7RprRgiOJ6oWepYJLBFGU/5I6MXT7h5RuyrGMFmlkl/6tbygLBWLTa/f+wYrCSVzklHcUQc6Zg1SwHI3OsnI2tyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcYJWXrmwo1nPLuGE8LAQFKZAGK2H94O3F/vmOwANeA=;
 b=Alsq0x4SvTYsjcY48qT8lof/j8n6XhfDccCdJjO5idNMkgvxumJgbZOneV+h5NQgZKcwzwvdY63sSWWA7o2ywf0o8xM2V0CmhHd+1NgD97yqJU7vsiCVfYXsVN9U5MSqIxGFcFfZY8vC4ChcfBBIaHnO+R7+SVf85TqF4osk9KCoUM/Z+BcCn2ZqrxWPaJz31xjxuDQrXL7D5VgtqGhg2BvTiYOlu5DaIqOSM1KNPlXK/i2NII2X7OnckT8Nt+iEn4BmjltzwlKyVsukVgSi+taG49O/0ymuJPyyGw9xqFUW8na3uSRaZ9wbRRUeEq//X3+ADFUUhjOMtp9Q7OQaCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcYJWXrmwo1nPLuGE8LAQFKZAGK2H94O3F/vmOwANeA=;
 b=VlVywl9bOKTr1y4G72CG7gxqO+9qhk3MBAIqur2RCtll7+FzAFtinhuooLf94GHKXhuhn5gIaSuMopq3i3IGauGx0bmmkT4DAMBGagZfZ9EqQev4cf7cgAhHBhF5Ns1dKmvyzsJjG6DQCDzV2XKRWZ9bYd2qyybfMsosmFnW6oY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB12050.jpnprd01.prod.outlook.com
 (2603:1096:400:405::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 00:16:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 00:16:24 +0000
Message-ID: <87frt3kxew.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/6] arm64: dts: renesas: r8a779g0: tidyup sound DT settings
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Jun 2024 00:16:24 +0000
X-ClientProxiedBy: TYCPR01CA0171.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB12050:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2b4313-2e75-4967-79fb-08dc93e2e1d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|366013|1800799021|52116011|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0roVEoKwVhlSyYA0Dt3s/WYadW2W8shrl8fFEnLwCCEtyVknsnITq1auOXJQ?=
 =?us-ascii?Q?I9BZvYliuG8AaYqLYTBLLlOX5OclT4mBj1IFduI8j50x78x3FwiHs6olZAOM?=
 =?us-ascii?Q?9oWJbPtnU9k0vfZva/u02fk8RWIkEGWfylpNHKp40rVhtPOO5RSPrPe1SrT5?=
 =?us-ascii?Q?bq1TP6tT98K8cfheFD+ERYVw3nprZhdql4IXR7w4QvzVUWJJjm93oXl7IXIG?=
 =?us-ascii?Q?66CMfM56xqNd+rwOk4dyiDeDLpe/tlKSHiG1I+XWkj4twCXvrRToIAmR7gQG?=
 =?us-ascii?Q?WiJba2KUqA2IpmJQis2O5YStfuEwogxmM7g1/ZhU8FRNcgoVBecV/YfTpkdJ?=
 =?us-ascii?Q?hY5KuK6WtL+UDwhD57cBXE0R+ApnT/h2ktf6oNiP7EKEI+Guh2Vikx+n/IpN?=
 =?us-ascii?Q?qvugLOLwYBePp5I1FNxm41hDoMccxU+KrgadzmI2C3s7J0yQCHvk7ibT+sxf?=
 =?us-ascii?Q?Y1BnB+GClH8ck8rN+o8+xulJiOTido94pTU1enPjup4GP7GNGy4G7bNUdNgs?=
 =?us-ascii?Q?nAPien8F1XIwj7z2jNu+ZK9vO0m2C+0grTl/pk90onO4W6QUJAKJCuzyP9f3?=
 =?us-ascii?Q?sDC+ighmuPbDLatUYHOW+vfQc1pCJWois/IGXd8sucMcBXm6/+Iuxfyb78O/?=
 =?us-ascii?Q?keX3JlPB3GmwP9ruL1SnagPTtlM/jSQ7yTn1cn5Q1boxBzOvXGJoSq1l02K0?=
 =?us-ascii?Q?okwTlc0l3VmOPF8A8GlUKidBDVdA3UEkliFcG3ac2Cjgkok43P1I5rNTuC5P?=
 =?us-ascii?Q?AKuS5xohrzsKR+inOFhFRzYt75VumwD1Y3B/UxbfhzEA7u6leMD2ZvuyiIJb?=
 =?us-ascii?Q?99hIM7zVPz6qeyDg9ZMf2GfB+ErJn3AVCZeASvTUSKWkpPYdqF0ZVOqmORkz?=
 =?us-ascii?Q?pCxCnk4m70ot1s0ygiQM6+15pPdkUYqTw86c/fGKpmxGYO4tUwJFdhYwYLb8?=
 =?us-ascii?Q?qNdveAagtcuxSO30mCghyePT2738GAtMlU69nyqkz0uco8ls+25AB+0Lkzd0?=
 =?us-ascii?Q?jci15+SBaKhKPFwjbP7IdjCEFu5+TgroJfia8Mu+/lwZx77Fad0Jtbb00KVm?=
 =?us-ascii?Q?S2rfsrTykOSjGuX9C1bLQTpO/UIzVDv+GAs0qQNx+W1r0HlMfdEYOtuNRjPW?=
 =?us-ascii?Q?5gX8SopPxWw6TvqppmP0fM3ixF3zc8aUJKc8m1ZhpFAazQ78lbiDTy/TCXO0?=
 =?us-ascii?Q?5CqnMlff5voCs9qH4ioFcdMdezgjkOSbnCmvnWy9SCwgdsMxWeKnU5ScpLlN?=
 =?us-ascii?Q?tCxj44xgg0wfQJ/+um9IO0SSaALV8djamyZgWkGe3pgNTJLLBHcZJ+BWnPh2?=
 =?us-ascii?Q?SaE58km7uifeDSqlS4ob7cHfwLHOM6uB+nzDXeNmQvGLfiYg7vn0P9Zb4Mrm?=
 =?us-ascii?Q?mSz+q6s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021)(52116011)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PbSY4AVrRJz6qlGCJWktX2cfwXcPJDeSGhWa4NGXxrtDIgJMeHxk5UNyrObR?=
 =?us-ascii?Q?79bArLkU5yfoEKkhdsN8VvU2W+PamWR/ZAa7caXg7xMfy0WzAk6kZaj1FYjb?=
 =?us-ascii?Q?aa8zJLWRbo7sXzTn6InVIpyWK720u8n1/rjQKIL/tF5vLkrPnEMM+AfbJpYC?=
 =?us-ascii?Q?LJdBLhAdNLl7H97OznJiyRnfi3q4VByS2U5UFWwx20OSESDQW/Oq/PPTh0wd?=
 =?us-ascii?Q?sO8PNCC5zgCqLMCselwiUIpogEpVlncYmIsQQTZ4gQ3hvciEKw20KsvAXXuL?=
 =?us-ascii?Q?wTtp+juHAHE0d08OmQGzLaqrN1o6WdFQXjupnXdW6KyafLa+IcLH9H7aKRDq?=
 =?us-ascii?Q?+02nSU7iNiFn6GyX8gvavVM4ymNHJp1lGeHRGl1do3PfpHD7ZgLE78C7sWcU?=
 =?us-ascii?Q?z4QhMh3+1PtauQ1LNRvf5tokDElshUdtfyX1XSmgOlljogqVRDtL6wxPt6ze?=
 =?us-ascii?Q?emO80sYs0ups8sV6xpgo4K4zWomXlTswCCaXnBtaJwX0R3cTiEE4gp9bKoaD?=
 =?us-ascii?Q?EUj7Z8twe7Qd9Xt12kPxrcS/pfbcWvAW3GHUyUoMyqYzL5H3wNeCbSJtvyqk?=
 =?us-ascii?Q?KvB81b5FE+snduCU7WS3/UTJKva1RurVZrg+T2Q0C86QuE4SChbJXlAx8Emx?=
 =?us-ascii?Q?q5PSi7YF/HLWdamAR2ZVGOBLZrhnL6yEdn897EMOanJP2yYgCzJEWmXIEe/f?=
 =?us-ascii?Q?SQmy0rK9axnANAXO34ybHcrtX34PvjYqacCQVBqJa9PGeOjHuEqrWuZK39/k?=
 =?us-ascii?Q?1xbe1dk6+jrxmULEXLx7iAvwA6GoYRTpatOkMyLq7lDM2qpEnwvPIpzlm+2S?=
 =?us-ascii?Q?QVHd4CI3NZnKoOkUP6JiGPTjw4Llp/4uVrr/qTvLPLElpmJEqKH7j1j1Epvf?=
 =?us-ascii?Q?y6PdJ2pNXVN96so8em5Ez6b3afWdHuc3a9llwW4hsHbmTxGqa2e0ugTixnMs?=
 =?us-ascii?Q?5l9MkPQuWfV37vmWkeP+0h4yIACO6eeW4BwUVW/Xmot154RvVXY91QVL9dwI?=
 =?us-ascii?Q?VjVxaFAgIh3zf2sbYPZp3C8+UwMR4Jf4dB6yFuGWabJDwG5hvID/ZKGnv7OC?=
 =?us-ascii?Q?svhCW5JBY21gI4s34cjpsH3UPd+OXwyKcp7T3c5uabRk3X4NQXnPyMQ+7yho?=
 =?us-ascii?Q?E/pU8J6kkpDurHQLPYE5aYHLB+RY/J7fvGd/grdSvfGwvImtYsSn3E/HriJG?=
 =?us-ascii?Q?uRFQlnPxY5S8UZBk+/IavWIk5LXz4jg8vJyLQ6hHB8BR8g23cr5ZtdRLOjIP?=
 =?us-ascii?Q?h9g6bJULjWemQ4k+WZuxEjBB/2qJTWtV+stCRrv5FQKcsF4bcYrI55IUJ7zj?=
 =?us-ascii?Q?UToFxo+vqwCOU1jg7jbdy+vOn+uHvE1jZiA90L1hflRyQYYgD3NQpBpOHBF7?=
 =?us-ascii?Q?wvVx2/hM/7acdnwJJzTFGTEetT50zYRJri+lnEPztLtoX53qTsiYg5F4Jbfj?=
 =?us-ascii?Q?INv9vk8z3giA14O4Rd9MweKsWA1ehT4JSDWd9BgP7tUiXnMDgMZvm9ZEdrSZ?=
 =?us-ascii?Q?9IdSvEQaL99ndLMNXwxh2xv3aCzkGC1zQiaGzjHtbhFNnYH7kxkHnQWvnh3s?=
 =?us-ascii?Q?47c7zw4E2VYjwZiBsfc4C+gmd+chSheNl9vLhAV/kIxv9Nxw/y52trYt0kp1?=
 =?us-ascii?Q?W4OZJ8xXFlnvVxOHDmCbWPE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2b4313-2e75-4967-79fb-08dc93e2e1d8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 00:16:24.1844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b2zfz9iz3mfZsMKH+FLHlmwjoVxMjWKeCcKiJo6MXVQQzXmvPZSBK0FuHfyjTdLu40O/xeUtL+GnJaeXvfsqVbmiVR9Jpduy5S35r39pDmup+6RnLux3LgMQ/gVmW+hs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12050

R8A779G0 (V4H) supports only 1 AUDIO_CLKOUT and 1 SSI,
thus, #clock-cells / #sound-dai-cells are both fixed 0.
(#sound-dai-cells is needed for Simple-Audio-Card, not needed for
Audio-Graph-Card). This patch fixup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 .../r8a779g0-white-hawk-ard-audio-da7212.dtso   |  4 ----
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi       | 17 +++++------------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso
index e6f53377ecd90..e6cf304c77ee9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso
@@ -155,11 +155,7 @@ &rcar_sound {
 	pinctrl-0 = <&sound_clk_pins>, <&sound_pins>;
 	pinctrl-names = "default";
 
-	/* Single DAI */
-	#sound-dai-cells = <0>;
-
 	/* audio_clkout */
-	#clock-cells = <0>;
 	clock-frequency = <5644800>; /* 44.1kHz groups [(C) clock] */
 //	clock-frequency = <6144000>; /* 48  kHz groups [(C) clock] */
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index aaeebf736f3f7..6bd5161942aad 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -1723,18 +1723,6 @@ dmac1: dma-controller@e7351000 {
 		};
 
 		rcar_sound: sound@ec5a0000 {
-			/*
-			 * #sound-dai-cells is required
-			 *
-			 * Single DAI : #sound-dai-cells = <0>;	<&rcar_sound>;
-			 * Multi  DAI : #sound-dai-cells = <1>;	<&rcar_sound N>;
-			 */
-			/*
-			 * #clock-cells is required
-			 *
-			 * clkout		: #clock-cells = <0>;	<&rcar_sound>;
-			 * audio_clkout0/1/2/3	: #clock-cells = <1>;	<&rcar_sound N>;
-			 */
 			compatible = "renesas,rcar_sound-r8a779g0", "renesas,rcar_sound-gen4";
 			reg = <0 0xec5a0000 0 0x020>,
 			      <0 0xec540000 0 0x1000>,
@@ -1744,6 +1732,11 @@ rcar_sound: sound@ec5a0000 {
 
 			clocks = <&cpg CPG_MOD 2926>, <&cpg CPG_MOD 2927>, <&audio_clkin>;
 			clock-names = "ssiu.0", "ssi.0", "clkin";
+			/* #clock-cells is fixed */
+			#clock-cells = <0>;
+			/* #sound-dai-cells is fixed */
+			#sound-dai-cells = <0>;
+
 			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
 			resets = <&cpg 2926>, <&cpg 2927>;
 			reset-names = "ssiu.0", "ssi.0";
-- 
2.43.0


