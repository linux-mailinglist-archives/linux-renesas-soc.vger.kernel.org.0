Return-Path: <linux-renesas-soc+bounces-7014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0904924CA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 02:13:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5601F284342
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 00:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C87376;
	Wed,  3 Jul 2024 00:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZKNssvR8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011018.outbound.protection.outlook.com [52.101.125.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E51391
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jul 2024 00:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719965633; cv=fail; b=S7aT8EW+nntwvXivx99Rnm64Ay80nuArQtQus649vfcnZkm+gVle5CuHKk0+spTkHNdWpRi1umt+gOqA9L9zDtpN7/7Uw1/oTZltg/bJygUOvZK32fzRfemYOPEK5NU44kS6/dp50v4yEf5dTJ6eiWHjUTY3YLBWzzJdUENCjJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719965633; c=relaxed/simple;
	bh=uhaEDykTIdjN/C56vKPnbkfZU2jg6wS9Dyxvevwk9wg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Efvnqs8bbLVOrDnWUa/mzcfYDpZ0AvSixWPjBQ+/UdLP/FApw7aINeL6m9VwhFNrXOFEtXk2Cvyrjn3nGQPkd0dl8zHOumU0WBP/uf5XDWWnsHBb2FbFAAqv4STdONVRg+Ts8Vcw19qL5dOw1+IL08qHMTNToP3hhyaIJkZPFNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZKNssvR8; arc=fail smtp.client-ip=52.101.125.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJo+6Ab2gZgmy3kChIOWaY6erJcMq7Ii3DnMmormv0y8HRlYnkafO7uwzmrlQCV/FaDjRX1Wt4Vlc0vvsqWviemrDj9u0SVgp/Wv/8I7H5nvkuBrvcd29r5vtcwkluQiI3ixD9VRL4XtpDXa5dGXzSSpe3oirXXNG5MVaGyeQw5cbDx00EO+tlD3i+VOZfsdYr/eItgrePkJK/mJtnnkhu61gPmygXZAFF1RTpZNwnRmuGpV+6Su7+sfDJ/r6tmEnC7Syn4FURlCODMX2mVk8XKbH+5oAn7iZliVSo37BqEYqIvbTsXO8dKXa7SmCXPAETX5X8ZrfvEXiZuvunFpbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUHnTphEP9a728iN2fTaYGXQPCaQyzn0qlm4QBH1cDA=;
 b=Y54i4FxbslHd41cTvNrZUDRtm09dYmgG3dOAyTteCVbhRMxFQwcpUcB6X4LOkyOorEllvGZ4T5D/ew82El2Iij70WW89lKs3W1Nfv/6ET9S5hhe5duIu5DWE8mq2cBfjH+Vb9A6r7CI4yw070y7eJmb2DoSeayx4rTvoxZFV0xmxzCDOQTZjQqbwtL0XoL0XJ4AyfuOvDvk5Tasl/8VOig9vCu7Q3NLpzXXXS51vxg/j4393xA8lKiZFWfxJxhHssN8sbv5QU2ZkAUkUqZ/9YkW0fJ40aGXvhzMXmipTvoIHhtj4GSsg/uUU/tYZaZnfBOYvIjzPqjOwrnfHnhc2hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUHnTphEP9a728iN2fTaYGXQPCaQyzn0qlm4QBH1cDA=;
 b=ZKNssvR8YkY/WEEdhXGSPxu5z5kJgFURZiP+spm2mVfOKIbAD+i5OVCOKEHeUys0z0gS+DsJPB4C7CZ7CNOKG2KaNrC6tJqa0qp4S+eiehG6xlyLl69sGIKQw/FGzr7T0WNHbkuJkDjXRQX9dxG8Q+bHATG1FN2zH9QsPyhYFRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6179.jpnprd01.prod.outlook.com
 (2603:1096:604:ce::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 00:13:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 00:13:48 +0000
Message-ID: <87bk3fbadf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/3] arm64: defconfig: Enable AK4619 codec support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <87ed8bbae7.wl-kuninori.morimoto.gx@renesas.com>
References: <87ed8bbae7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 3 Jul 2024 00:13:48 +0000
X-ClientProxiedBy: TYCP286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: 61ecaeb0-7621-4adc-1a9c-08dc9af502da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?utLI5wEycaWDRQT33HyeUfE1JprL2unzOdIEi++zP2f5KLK5qnmjM511dB3r?=
 =?us-ascii?Q?7NJzMMS3aBDPu6BYwrUFKitmAe7OJd888KFF7xPjl0dg5LD8LTDsicZQ5eu5?=
 =?us-ascii?Q?l+KqwYdjL6eEjOaleXHZUdwGJBPU8Tj9BV8jrImnbOMV79NdmeYy6imNJkx0?=
 =?us-ascii?Q?0CZbytDIdpTKcfMXwpdy/XXmlZY3/9V8GtJdUAGazB76DJLLcwrqDAmGbU2c?=
 =?us-ascii?Q?7Yt2NwiQm9cRD94MXJ14CbZztLxkzAy/Xoxr2SIqaAIfbz0YlrfQEj+uTAXq?=
 =?us-ascii?Q?zRNm3xXv94sxMECo8JfIhtZecMgvzdyBBaboAQAlE6AVzPNxnAFLjNWMSOZ4?=
 =?us-ascii?Q?KYjYPqAjYeicqC7xNg+8RUtItxSN5wQsx4EtX0ExZ7I6C8nghiisZwA01+nU?=
 =?us-ascii?Q?JxIUd452Xf9R53IBsPRRBFGvnb/qG+qhLi/9OqVwV27bsr/rb2tHUPKrD6CJ?=
 =?us-ascii?Q?NgJUyFtEqeNKoGjWPxrrfPLiAm8nJP+Z20gNP4s1f20Z9Al4e3CUCDAW3Qbz?=
 =?us-ascii?Q?Ad5A3fpmXGJwF3uXIWMTcbYrhtL3cG5mCl83iJ5PwuVpo448yaamIhoZtaO/?=
 =?us-ascii?Q?JFNYpfRz/k4t5Ieyk6z0UFcwGSK1trOG0Q+/VpLduGrMckK3YUvAGC0/4aPF?=
 =?us-ascii?Q?ki07POhbqvefjZDOmBFD2+teGe3O/om7PiJX6UqQOMRsBvkp6vPPYfni0XbN?=
 =?us-ascii?Q?rotNni3jm9n+67t2zrw+wm1k8imGU2vWBv72wbDWJAQhWR7tlRvw2Rnpjk3n?=
 =?us-ascii?Q?ml8Ip4LaPYRixwFbo5ayUZf+UcKrZ06WLBCLSuaGSlTwRhiPtX3N4yBXU0t/?=
 =?us-ascii?Q?gWPc9jG3TAYdLBZbAMkX1TtIfR8DFzOHc7Petpls/bg8OI+l2BXNH6jMmBA1?=
 =?us-ascii?Q?zqYcwkfAiNpaqEhxBBy4RTUnrKEuKCMNwpY4lN3U1ftv7KgB26fLfHp5THQL?=
 =?us-ascii?Q?q1UcXDgGsezeChG7T8+RWtPpEexpG9MM2U5zMDHumm0pmtpY2n5INKfYOFAT?=
 =?us-ascii?Q?OhqL44SMGVKPhxyYRLQC9dWE8gLquXTGjyWbcgmJ99t1dMN1BDUboJnSH1IX?=
 =?us-ascii?Q?jvJhmkJKYTeSlJek6zw5Gxenj6ng7SCubwxkdJYJt0xM56QvdIO2raMJFsJK?=
 =?us-ascii?Q?x7InDh9sDx59W/oz0PuPnNzlGD3li651CpzzH9Qgys8V9+p3BhnaJp5DQVe7?=
 =?us-ascii?Q?GKPWujn5PZaC1Um3L2GBRCVtedUgXuai4ffm3g8GVTK5eY5JDbnLISLQJyCV?=
 =?us-ascii?Q?PnSSIqVvyLay1g/7dBWY9+lAsBQRwj74NSqIx3MrsaWdeMlAkXtsXO/yVyKP?=
 =?us-ascii?Q?CYR1+qno1yHvUsPlGlVSNGjG6btGyyoxinumOAo3CeEBfMTeOGK1FVE4Rzvj?=
 =?us-ascii?Q?YtOLLh2xZfMmy0t106bMYO6GerJVOHFNmVPU+vSDPScysOITog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cd5h7mpFYyT/JwUo22LhwPNhlKGOUKuaiz2mszFFjzNUXHihE71jaRX5Sqjx?=
 =?us-ascii?Q?j3hNR58Gys0NbzptDZsW8G6GNq05InPuvdEEvpLoD2Fd6ZQGLa3PRmiV2Bd/?=
 =?us-ascii?Q?e+GDZAkCsNlVypHJw3/KqO283NamGS2mU9/Y8ZDGbMz5Uquds7hLuTWQEqGR?=
 =?us-ascii?Q?eJ0uoX6zDn5Fepka+KjFzMLWeeTDXJGP2FbiIPmW0ykwmOzUEjyEVt0g0lkG?=
 =?us-ascii?Q?YNh8LIC28ynZsI5JS0QOkBWxJvsi0QVBfGKyzdazlu+zEdDoytjZAkbjhEmq?=
 =?us-ascii?Q?PWdsIQI0dvKkdJyQ2V3useQR4cZuxHf6qW0K8j3zBfu7dUQr+eHpuHdyVhgo?=
 =?us-ascii?Q?TZHU2xlS3u3B4IlDE9Bp7RRCBABwKtEOXedLb7vZgGTRfhubWK7MBJGKXyHu?=
 =?us-ascii?Q?iUqLR6WbUnAq0PnZ3B8EcqfQrNsdRXkoaqNVbZEvkxcmp7SYRGbTEb9GLbzs?=
 =?us-ascii?Q?vZS5tFjs6s/okolaLXOD0WPrZwvxF9OMJRjKD1p9q5/aFtNth3BXpQyfdD4i?=
 =?us-ascii?Q?GW3zAdjsfmWfAaVxO3i7iYepVID48c1yk2pYxhAeDf4q5Bwu2QUvbtop7puv?=
 =?us-ascii?Q?fx1TPa4YCz7iJ44cYHot67gAK1bPrh52Ir5J4PdlZ48+RPhGZ5Zl5de4DlM7?=
 =?us-ascii?Q?DK1ddGOjxzomVwPlkZXV5ZwusAVz/UWnBZPRr+VV5zqkSSwN/MLvYVqA0pYe?=
 =?us-ascii?Q?PVu/VG2z1I7yDWZ1VL+avY73ZO/1mIMzvbjWjOg4e7OcrhuTOuAHuO4pULvr?=
 =?us-ascii?Q?lYlJbt+tYtsLBetVRVOuic4ac5ZpdAx/DlDlozYjIN/k/lGIkyR8cdyvqNjg?=
 =?us-ascii?Q?/0V0wgoa+Z6u4APIyHjLLpVPGjSUpGaV+PJcqpuvyGYtc1FUFS3P3HTn9D+I?=
 =?us-ascii?Q?udyCsOSe3ZSD4MsgUFt5O3cNcINppi2/qWqT+JgR13ySnlJ5slyxqjp3WCKs?=
 =?us-ascii?Q?DofR2qY0sjFSvSGiUQY/nn9mLZZo2/tIqZ4VADNtnyAyyBc+V7o3aiSFI1q2?=
 =?us-ascii?Q?bP29cON3kVBBIxxC8UgxO9FzNVVD03OFfQJAATQmmIPGDfZYWC9GBiogbCea?=
 =?us-ascii?Q?gdNHqpa5SNGknm+v/FWupgGZhXNUsMG1PbzmyrXrK8mxpGxfi8f1SPDcD0vG?=
 =?us-ascii?Q?jJmDdYOb49Mg0JMzv/5nrKCVN6U8HOAuBAdNMG4sh6cCGoDenf1y5aNodluw?=
 =?us-ascii?Q?+yo2Aip2UfckdwQPz9A6eB0Qm4Rd2oMnZ2NolZ3H/ezLFPZEJZQiXqRisfjp?=
 =?us-ascii?Q?cpSZP4sWl0P43hOkj3DY+73tAYWACP5PzrZtVrYYfdgMQENplPrAxCVvUbSS?=
 =?us-ascii?Q?ReHzO14ZevSjAugqmlgdf6G+xXz/tStBVL1wYHXN9WXCFOaDHCinD5x6dO79?=
 =?us-ascii?Q?mejUTGHzQ5DsULAnO3lWE1ElZEju11uEXlkSbN6brAD/+osyyAn/IE5z8Y8w?=
 =?us-ascii?Q?6ipu4Pr0T9m5KwTE3IABKwXfHHpYiOO0TYjcKkgvhORYSENXtExEpulOf/Vg?=
 =?us-ascii?Q?g3YbrMx7gOQSdNcYqMOOgwEHnb6hDxgXwZRIpFQf2uFSgRAcDSKfG+V+ybjd?=
 =?us-ascii?Q?FVfpJURhaawfApfwJUP8xLgN9magN56ytrXIPmi4dQlNXzV0bz3ZpUDPgeLt?=
 =?us-ascii?Q?x7a7XoE2NRrutT6eCIVtOuU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61ecaeb0-7621-4adc-1a9c-08dc9af502da
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 00:13:48.6203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVc6VzTLQ+MYf6szl/bC1hsLLAlfbb+RPc8O6rk4+aiWWahKd2voRLxSmeelO2IilthJOOOdTJ9EUtO/4f5zOjZMQOcv7wjvdaIjZ8bnfyIPoINnVvPnNrdmvFILM60t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6179

This patch enables AK4619 codec support

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 66d779547f0f..e8b47b07a921 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -998,6 +998,7 @@ CONFIG_SND_SOC_TEGRA_AUDIO_GRAPH_CARD=m
 CONFIG_SND_SOC_DAVINCI_MCASP=m
 CONFIG_SND_SOC_J721E_EVM=m
 CONFIG_SND_SOC_AK4613=m
+CONFIG_SND_SOC_AK4619=m
 CONFIG_SND_SOC_DA7213=m
 CONFIG_SND_SOC_ES7134=m
 CONFIG_SND_SOC_ES7241=m
-- 
2.43.0


