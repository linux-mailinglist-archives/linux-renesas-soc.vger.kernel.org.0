Return-Path: <linux-renesas-soc+bounces-7015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E12B3924CAC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 02:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 970DC284A04
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2024 00:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F0D1854;
	Wed,  3 Jul 2024 00:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="K8R7/jW3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011030.outbound.protection.outlook.com [52.101.125.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E627439B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jul 2024 00:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719965639; cv=fail; b=nTWdUZ8ZMJFGqmj2IR+PQ4qayggxzCFbwuFLuh712dkVRSDAJTOaO5E6NuL3S5LSao3yPkB8ZU0WY9jrPByYsX6I6iRqX7NztOrIVzKGtpO1CA2BIgF8MXH5Rg+mXAgOTpW8kTUw7K+9iHuyBFQENasOBY+Ni/UptsJuHU/DCo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719965639; c=relaxed/simple;
	bh=WaKHz3P7Urn2ZAJz7tU5ChV0g/+gqi3t0vfQ70rc8po=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=brCLCQok61JzH0BJmvGI44eThv7Xuf/JxhMb61eXJJJDL3DUQMBnY0tIL8Dd8YcpsidvO1ZIxZvC0zq3xX1XPC6D5In+IXNsBVzyNG7LvSQGQTSpb0LbYjMf4rDuBF96gLwnj8JzQiBatOHcCAj9zhAthtaVahiCKFz3AUcVIfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=K8R7/jW3; arc=fail smtp.client-ip=52.101.125.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqHmAm7hP99XxZ8BVTBINRqmXdTxj9ZbU/3Gk0E94UZ3BNnex3l0dzPPE6HCmaStM0QQHDJHzg8Ai82vWHvTVH3Tv2icHYFbSEfaaPLIRzFBRyr0ltgsRdm64BbiocyvcESV8YvHRlV7l4YaFcBLuHbj6q6wrT1r4gS9KJent05+LSF5vGzlxKviXxfDfoWDBtlxOuEXCA00CChaIwb2ihGZrrT+UGtnqMPQD7awyxWqP5VfU5Kl9Xff5ZMAmVsFv5lg7md63zwHZdybFYzA4Xry/7qc+niZvy2orXNeD7Ju0ZCO1017qIqHsJ5IM1PRxpAZQdOLW6F2g8pVk6yetA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFa9w74NLR7myPC0uWJf6Nz5ZSPOL7bB0T+ACEbfK00=;
 b=WqXGXYgfpqkgtk3ezdys50U1KU6tJaUwEQboHLRYJkAX3d8KANV997RBIJRTM+Uri++ugsGOfO3gx9ql0dOla8GE2w9I7omPnSsjBO2Bgdsa+8OJoLKqNYXz1iDWQrFYdEohILgab3ndwFKQE58P0s3Kdo/Pbgi/r3m1Y9fRnC58ALooBjLuG72CQ7ksifnei9KgBwg/CtcxVJhraEy47ry1Y/0E3dTcjzGI6RLG1MVWdL//YT4NnfIxOJ5KDfUOsYDr8cJkhp+zqnQpXAgVPyNUQ5kArSo4m8sd0cPxS4s5+JQ4s3FgV370ZguyDBn5Xo82ByKJDVQMSwowYZlJ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFa9w74NLR7myPC0uWJf6Nz5ZSPOL7bB0T+ACEbfK00=;
 b=K8R7/jW3aLD7UhqXHJ/NN7eshyGw7TGVKGvDN+/0tv5S6s4ktH1SiHyJqLfKTjgwjGwCusIUQdExUPMUrspA0fmLOXhOvbLBzp03Mt/iVwe2nv+h1y0EcwUdXHSwadjqgm4iraj/y/uGtI6AYHid6yjgfxzi37qiaPSxDSIw1s0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6179.jpnprd01.prod.outlook.com
 (2603:1096:604:ce::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 00:13:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Wed, 3 Jul 2024
 00:13:54 +0000
Message-ID: <87a5izbad9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] arm64: renesas: defconfig: Enable AK4619/Simple_MUX
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <87ed8bbae7.wl-kuninori.morimoto.gx@renesas.com>
References: <87ed8bbae7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 3 Jul 2024 00:13:54 +0000
X-ClientProxiedBy: TYCP286CA0016.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6179:EE_
X-MS-Office365-Filtering-Correlation-Id: cc28f332-1c2f-4cfe-d635-08dc9af50674
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2I9KWwgVabJMPfd6rvgneUvnHtHk0q5pnTi4tWhjez7uBBpixN2GsZEtXCiC?=
 =?us-ascii?Q?Znhqhg2pkSDZWY50giXetAfLr/loZE5gpmyyucUGAFrq4rl43VA1prsmokXX?=
 =?us-ascii?Q?em35NSPTJrZajhuluT8b+lgVJ2VB2DYIHiyGHJVKgvEdOUI8DGGXGLubLnHu?=
 =?us-ascii?Q?BjDLg8RyqRUnp0vNnwG8fThCKt6zPmWdcMWLh1D/jt1GqqeSt+f/zgnqs0XW?=
 =?us-ascii?Q?Gq5uZFMD1Cv51D1ScHKSpj/pzic+qtPWTWmQZ0U7Hu+EJWFCdA1J5iRNCwwx?=
 =?us-ascii?Q?s1znWzKzqohbjERp0ItpStpNhcLaTz/4szWANU0Wz2iBVzWPnMEGtmVp/W8l?=
 =?us-ascii?Q?0tTZj3b3rPgmENtCXl8RJg6J8D8KgHB1gqo3Xbzewus2sV43E40RLVsN00yG?=
 =?us-ascii?Q?5iEdeAymVYo/Af0hklk2GLJXi8vuTXv+N/jOjKQjIAMyG8Fc4oo9ME9AhxO7?=
 =?us-ascii?Q?25M1kpHbKwbDcBP5IsKF8HbzM+SMJFb8k+GzK5elHuPwOX9Iy0SjfvbUUkw2?=
 =?us-ascii?Q?6D0LwOCv+wPWo3C3wkkr6N0JZ564ZlLBCwLjcIBdANmRXA2d10NGWZorsXCS?=
 =?us-ascii?Q?QFafgWbpLJg6jKHjO/wLvphPB9o7SGsWmlXb5iYl6dERCzOZlbkVj2InxzpE?=
 =?us-ascii?Q?05W1SCirToj+0vFf1GEr+q+SUNPYT/mb1vM/KI26btvF88+Ujob5S3ngUANU?=
 =?us-ascii?Q?V265j/HtiV8eB/Fi3MfZeOQD4x2LoF5i1prUIzX/7Gl/G94e+9yb1MtDvNRg?=
 =?us-ascii?Q?4b8yLbEBAzZeWM0TWzXyZlFv9Tvl1EZC57NdXWE/jx6dYNLBpkBbqxDdgEVf?=
 =?us-ascii?Q?rSdt+ZwudGl8btUvgJMjEfIHyIAI9iAWYQ5X9KEkZInPcfHy4ZUGS045BFHp?=
 =?us-ascii?Q?5D4zy121G8zEfu4/nn+30wrw4jtF1hbbgVBkahbizxk8+JMMAfNcmJ/8BkFo?=
 =?us-ascii?Q?fdQjGZBxqU6gWkGjmHRXAjYy6ALP6NDcwqijsd7XfRb5MhvR6vY2HXlKLl1C?=
 =?us-ascii?Q?64Ze7VadQOaWUqb1caKamh2ByXCJnXdejqrxpPVrBPh2QAMkRmAQlhW+8qv7?=
 =?us-ascii?Q?MEoGzg93x2VL1LzMJB+lcCoIZHbozS77ESzy06XXQaRUgdS183NYYHPeUDJX?=
 =?us-ascii?Q?aoaQkMWkhwPbvsJsxDOF1Baa9MJ9489G2DoZBhb5L3HkrLvpF0/aunonMRGm?=
 =?us-ascii?Q?m9FP2NZ/jvQ3AtaCqps5vRTeabw7Hca/WyR6gXuV+uY/YQ0fCQwQ18SCa930?=
 =?us-ascii?Q?xkfyXa5JNebaWQYJmoXP2KXgnOZj9TlIocLWUR/3wrCu72Sf6uM7ZrEmxbo/?=
 =?us-ascii?Q?z14Vy84UX+kqHIZoemyJb8FFnDW4/sAo9nBVgrM5cNxnwKKqLzWNzPOQ4+ua?=
 =?us-ascii?Q?XJF3iwHfRtoQwwtv9Gx0LB7NHF19mriMsZHXIufCnJYZXU1khg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AB3yTNcSUhuX3MYOYWk+dRmdqGrHHNMQBHel2zPKAzFQGGCG31vV4rCz4y4u?=
 =?us-ascii?Q?drbhliFLCdAI6PIPaUbUm0msoATXFd5TGjU/9L6YYDwVkyMuFUp42487LaR2?=
 =?us-ascii?Q?AKB2E0nqO3c8BBR5pR22Ji0OKVkhru6Gw1ZsYcGe31pO7luE7OzVjDXSzF21?=
 =?us-ascii?Q?Y8pkIZQ05XvuXBfbB1wrgF/W3knoF5ywgqLnjvthBS1tb1yWs3teLLyGFaml?=
 =?us-ascii?Q?hL/0c1+zIJ6RjMzQIteFXIrtUXn0zq2aMZlwMLMyLG1VvRYiPNQ3lALdTFeu?=
 =?us-ascii?Q?/cgLu10BrOJVVd9V36+eI091Ne2pzWxZSAtY8ifww8sO0aT8d+b4obkEMvM7?=
 =?us-ascii?Q?yAm2S8jQ1BdVHoAUHjVW9UN4FMIEFHoN4LYpX9gSNywxvDu3hkUtbh43FRed?=
 =?us-ascii?Q?7iOXMa+FvysQ/1r59j0zuMRykg0p2Mc8f99aCe/HKzu/RBdZDSayxIOk8iZR?=
 =?us-ascii?Q?3TK87sO7HYejbjfB5GaEHghKVUOlOYopcZ5A65QXTVg45CBzRYJe20LrltkV?=
 =?us-ascii?Q?LrIx1ardG+893etK7/2WkH1HEgQ6O4PC0kASaF5zsFfhqTTQzNcrZv1Kp6a8?=
 =?us-ascii?Q?L2Gr5TDJIfQhd63Lp15S3MfE2r4VsLEsKASqmxmPd1vpHpeSj8nwtY+sx9KQ?=
 =?us-ascii?Q?hFJw01OGeKjcagV9XZbTZD/e41QK17HLDfo22le/f2osaFPrhgZ53P6CrX6W?=
 =?us-ascii?Q?rk8RQcwvhh7GzvL0+GHIpORhfQKGtx2C3R0VqKLcmhdGz9biNx5oE1s8vybe?=
 =?us-ascii?Q?BFDeKxLCLzHZbdiTsjtF9/bBe16Zk3ia9rCdUPXVBEMwH214GOEaJVR4ZZnH?=
 =?us-ascii?Q?hpRCnKRy9bNeqRWSD4W4CDAxMHO/2BGa+DQSII6zyO4ngdWkZpFiToJ/1Wlv?=
 =?us-ascii?Q?K+imJGJEgHdWdSvzAklmIi5iPUG9ZQKLgP5wSMvWHaMgwwTvwQ7ozYBsVjeg?=
 =?us-ascii?Q?UGYAiARZGRqwNfFBe+aVEGsICPSbuTd0gSrURVP5gOrjKajhJg77LxShKRi0?=
 =?us-ascii?Q?eqB673QT2ZyGxnd+GXUBvWqUfOLdrtM6tfeyN3HGZWzxVyMRoBUZFqWaJ94R?=
 =?us-ascii?Q?x1pQIPhZnpcTlipSPKzM5TQ50EziIw5qhT44lPEq1nPEsxXraXhNRgczoq7z?=
 =?us-ascii?Q?CsWsBvq+5LZtEmbp7fqGcM3hZ/Gh2dwRuvZ2+jm+GiY7ywV2hplJFgw5ulXX?=
 =?us-ascii?Q?Ito79bc6xu6NheOXUAIztB89iJlYTLHddUrmGg9HPZgJv25HD7dAfyfwkn/A?=
 =?us-ascii?Q?c2gV4luqq/tUm/WrNM9XI/xuiIQxEkjiexLhqR0ctWlgiUx7pe35tctRk/n7?=
 =?us-ascii?Q?6wnG+r2i5RhudHeI3iPeLs+WxRjzmP8Awcfsp4h8OHurCIAmZ9trSCxlYzjv?=
 =?us-ascii?Q?lp5iCqrST1bia+0GNFzf+HRPmF7xYLmIyWyXcu82NSzDMM0RaxFF9w+fU7i7?=
 =?us-ascii?Q?rkem31gY9eyV0iS96TFGzV+H2YdfKcu1Iwrp9Myo/1nixqAQAY1FS2kVYJs7?=
 =?us-ascii?Q?vrk5i6amDwxdNAiFmnc+kcf+roEzQVgpTQuXGKXPMV5NybKv6kZDCHFdqYc8?=
 =?us-ascii?Q?9ZjkNHsONAKZLWUhwkgMax2oCVhrZmFBr4leBp5Zd0I/q+fnz4zuy+trzHPs?=
 =?us-ascii?Q?1Vfs0yho45swftUFlAdFgi0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc28f332-1c2f-4cfe-d635-08dc9af50674
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 00:13:54.6925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/ilHhH+kvY3XWplc+leEJ40E3TYJSnbTPntOY1sIVbsvQoVjGfLHJDVgL4iKRI1oxwldkBzEYyiY6xs2UjIqr/GVUJp9JLP1lxDnKwl+OyW1TUmQPazTxHrsF4/HFnk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6179

This patch enables AK4619/Simple_MUX codec which is needed for
V4M GrayHawk Sound.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index d0bc1a04c3a8..7f36fe041fb0 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -304,8 +304,10 @@ CONFIG_SND_SOC=y
 CONFIG_SND_SOC_RCAR=y
 CONFIG_SND_SOC_RZ=y
 CONFIG_SND_SOC_AK4613=y
+CONFIG_SND_SOC_AK4619=y
 CONFIG_SND_SOC_DA7213=y
 CONFIG_SND_SOC_PCM3168A_I2C=y
+CONFIG_SND_SOC_SIMPLE_MUX=y
 CONFIG_SND_SOC_WM8978=y
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_SND_AUDIO_GRAPH_CARD=y
-- 
2.43.0


