Return-Path: <linux-renesas-soc+bounces-16827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC8CAB0805
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 04:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FAB45013D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 02:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB82221DA8;
	Fri,  9 May 2025 02:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mGSPkx4B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1876F10F2
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 02:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746758564; cv=fail; b=Z59sK0Yez48uNjEgJiIQ1ubPlYu/WaQ43rk9sGIJ+igJF7y43wVv/KLNPp5+x61wwopvlgaGYQjUnQF4gefRDqZXthO5N7t8/Gr0TbSQO+2HHhdz2LMJvnRsivtjc3C9R8QT+1dvOoUSsLCVUz6DrfPUxwvOZNdiZLgH+gb5Z7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746758564; c=relaxed/simple;
	bh=ymFoNDsvbfMZ9aauO7Y8Z4l6kO7QpFsbG6kmLhhdKpE=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=hcT/W+G8LS9444e5RQ7ISOI/z2+Wf2BHTrddvE8H5kaSQIknr9YxcjVUFWxK0UA6zw6ni+yO1X05ICSDIJ2p/ziF7rJy7lSak76wCrX0pJHkqnXL3cu3MwH4BmmxRE7PG5ctW8Zgh3mZDrlfgEMLQqwoXakQyZVuQk+v2z6LiDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mGSPkx4B; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKCJrpRIpPloM3faSYie0jJmbvjd8BjtEOU41fmOvzuYZ0iraOAyw9NgtS4pd2X+bnhRL5gwi/fj6L06bziD3oDnE+I7FjhAfAhy8hLXBOYAKm2Vyw2ADDz1M5cWdYYaoIwjHRdxFFxJWWDUV27bF2wQyFBUm/5Cfk62bwLqZG9G0srAY1kjHWcqaBmqjdIm2MDfL1yzmmfY/8SZ4bFlA2semwZfvekCUl4NZRIuKLnsqTiOuxSinomA/thUtxpk/no4quVaGX2sRTIm6vg7EH9InWFaIvdYOgSMvoyzmgjPCK5yFSZJk8DYVsKIAi36TJaf7BW4xSqJP7fe+MmaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRMXVcqIGOE0OtriTW3rGbgrgGP1Yt5gqTIik1DC8pg=;
 b=Xt79jr2m/Unxoq9ls6qTT3SrLSlNoAQxywqmUXwNg2alw/jbm63snS2Goy2dGcmGJh7JNpD6AjI1T8ycPqPJgeim+/JA0ovX5zGUnG0UXbj/CLI/7Ml/w3Qz3XnFFL2NSxn75JxKFE6+bo8aGzzABOeZaLHk6I1Lb41scJ4yIlRHrMb+PWVWMB9C90Xz9yC5+8g5K/pJlgowT4XThoMMYGNk72NjwLbdpwEDSRnkQPtBc5WuL4LxuMIILwmgWMGCuuWQJ8FP62EErdOaQWpZF6Z+fU2EOCCD4VICaI4Hd/74ZiEETLufalbUnMcACP4PM6AEN7ZK7zb4/RgxsY7KCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRMXVcqIGOE0OtriTW3rGbgrgGP1Yt5gqTIik1DC8pg=;
 b=mGSPkx4BR3EECZCdccKXFDJ7lnWVvjri846GvOHjBWgwFhC1ocKZQwVCg8eUV+5+1Ktw11Ky4lg6HBRyxobrazPGpEuH9EXSUk598iGvu0vR4LNMQIcJO2XIliYfbt6Rju8QV6w3VzKPc7dMZ1lBSfi4GMmqYG94JZ5ytqKXvUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8916.jpnprd01.prod.outlook.com
 (2603:1096:400:17d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 9 May
 2025 02:42:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 02:42:38 +0000
Message-ID: <87frhepkrm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] arm64: renesas: defconfig: Enable MSIOF sound support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 9 May 2025 02:42:37 +0000
X-ClientProxiedBy: TYCP286CA0336.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d7ea23-1b9b-4fa9-c177-08dd8ea3293a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ce0ZCGkBwQZXe3NgOopv0+MZCrkDZgn/VuaBKbXIFRPWLw5KViRQf8Gfp696?=
 =?us-ascii?Q?+/NtM/aYSnnLmbLPgTtsltyg3yxSS2vjMWZ7f9zA5PJ9gURVgarxjaO1FZlz?=
 =?us-ascii?Q?zwQiaXJUBry8gMWbf6EHxndjZzbza1Fe0hYXD6gM8rM5iTIC95JwW6lHQAxE?=
 =?us-ascii?Q?HkwzU3trL2sjf2N0AE1ol+DpCa4wWUBxNy1purAfNw5ekSt4ttVdhqg78IVO?=
 =?us-ascii?Q?1oU9nlSrUZ+PzKlcZo78urfhqx+oghQqYWn85kf2FanfZzGAzfmq9Hj1uQ/x?=
 =?us-ascii?Q?pVWHCIAaC0rp0ozsbC/ZCvBYGfDKSV//c4aO3dU2uTTnef//ei6h3AbacG+2?=
 =?us-ascii?Q?LTQg7DwT6fH4mZ4Nwnr3ondDHvJ3vBkb5Rc+fDPpT2/vN+Y4Fs1LsvqSS5Nz?=
 =?us-ascii?Q?5Ilqqpzm9pVOgw6ycb91UKvvUAFqPk6Ex17VMwfRfILbKZFQ+HR8G+CNuUZr?=
 =?us-ascii?Q?066OrLb4K9NRr8oTrPiLrJ1QdPNaLFIIzPZU6sLNnGGfQkl6W84ELn9avsJ4?=
 =?us-ascii?Q?LV7tqSkbMQApC5CjE8PJarOlk8k38wAwRyAWGrQy92fZ/m1SxOu3gsGCYRts?=
 =?us-ascii?Q?LHe+AU24HJGoe9+mqKLllLVzc+cv9H5tvd4Q2pGmOFfUTqIyN80TACwepges?=
 =?us-ascii?Q?v6/m+WG847QJsDuB29wsDJ2Hhc9FtqRujZbwA9nyydiJR8OwfW62oPAaoWJo?=
 =?us-ascii?Q?zhbfQiT/r6i5lhKtDnAaU30gOOUKjGYAkPPDKAut/soFd+S608EX+tg+GzzF?=
 =?us-ascii?Q?NNWiv9AWVlFbnRzDpPur4JbLPxgmSmBWOJNnNZj3Mrkzy5REGKDcWUb30nP7?=
 =?us-ascii?Q?qUXrQVZyChlpcyhZDjQ7zDNN03It2+g53Oj5LCKmYbnWGJfzTwUxLJHdUC4C?=
 =?us-ascii?Q?kyDcvyPSWmsk/MMBivYjp9fVH6bWYiWCN4i89rDcrD95u48r3NGuHWxLcweX?=
 =?us-ascii?Q?RN9r4b0TzYVrYVm13+MvAGxQEsLRdas7f/zZKa0uA8kbgcOW3QC+GKt7DyLt?=
 =?us-ascii?Q?CibXKiDM33N9mwPKpxxTVVzKCWNckfcJ9kh88HV5+5hO3V9NQ9SOZOg9Toyl?=
 =?us-ascii?Q?FAlGRJITXYKBonQknEDvSjCYyUHn4YQ72FK+HkgohZjm+BDPJX2z1Ljz0Xc7?=
 =?us-ascii?Q?+4v3HI+PZEi1LK8q94Tsgy25R59segl5yTDUvS+q43oh28BGKspMGsSIbCXk?=
 =?us-ascii?Q?plpzWZqN5UALC9yKn16ETYneCD48kjAKfYLRkAkbApSOSJkHDULWovqxEr0U?=
 =?us-ascii?Q?vaeLRGI9VaceN5TxwRaOcHRCmOLy5wYrHUWe0YCajsToeQBz29O6c0K4YUp+?=
 =?us-ascii?Q?EbkiLh1WOApUew0YWdON8Wr+vAcRSxcd/18tpuvQa/88r/nTSXqG+RQdRYbu?=
 =?us-ascii?Q?w12ZXJVayG+r4/jCYIkcxvE08a2ZFgRg1eSDhAaGcreGnQvIkZklVtkq80Ve?=
 =?us-ascii?Q?FTOE1OvuSb0G7QB8k48BlRXzXCueLvRq6C22hs5fjklB8I6Jc4sQdw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Nq+spM0oojGttbx+W07x7VVDvpLH1GdZZtN3d/vC5xQfB5bLrv8XDa/RoQQ?=
 =?us-ascii?Q?oTVDh+YrWRP49He5WCdi1IgK7o+LiOMdYnu/DiHUWM71Sb6iD5RR/tuJW1I5?=
 =?us-ascii?Q?CAUgwGljRZswNrNR+uYTSFNpfkBX+YCvwRJ/0SJW6Wi4K0k1WZJpZYWmjN4J?=
 =?us-ascii?Q?pLQhN+nyNzHkZkH+tnVZa4TEVjr5uKWbS2DTRmCVxrg2jUATlFZZ/ZHdTZ8r?=
 =?us-ascii?Q?kpDBjXrowUfxsB2h4haTCClB/mkr9w6RkveWWzO+2C2Lxx45/RpL+I1F/Zez?=
 =?us-ascii?Q?JLG6lU6g6mPCf6QBZumz8C4Tvbf8moQzXDUdwUc4C4xHBHe48gu4UHCjfJpm?=
 =?us-ascii?Q?xA93KUL2htA4aU72BdT1KaVKARORJS6zJ5ZUs7nH/hRPgSxWvb9HABs9crqS?=
 =?us-ascii?Q?4GIT/o06jTDlIowxq/ozoc3+ciuHauE2JU3cdB9vTzkbX2ekTFMb/OjXVDsL?=
 =?us-ascii?Q?JI6Jb76y8b9FVejPNXOj+nk2n4cqszYmB4O+WNbC5wiyuYvDdl4RyvPcjtPh?=
 =?us-ascii?Q?Oy2YPrlCU14LyN7YJjhXjtJXnasS1ozgtdcGx6mWS6hGeEL6tCXk+R4IvI+p?=
 =?us-ascii?Q?t1AXRf7n1SuUOcJMZuVTApa/QpDsIv4wmcw3UttuqzYGmGeBK/0m3duE6R8C?=
 =?us-ascii?Q?JoTRH33TTcpLqG5PixCCI2ckHt+EFibZ1CODEihP6TsiCCtnhWcpaF22KMDt?=
 =?us-ascii?Q?MWwqZD+cXbwiXuP2LG7NVnenk6lhE4X4IZusdDQUHd8s1UKhroQ3PKyux7zQ?=
 =?us-ascii?Q?NCoQJ6i5GfUBCbDHEFHK+FLVyOpLtGx11skDEcOGi4gdqNSsfOo/2beZET6A?=
 =?us-ascii?Q?mhedLK0GZ0hOrJu8yUe8ry9D5Km4FFWef7lfEztN71mEGVazYehWeefe6qyf?=
 =?us-ascii?Q?8aSYDE5EO0lbcsiu6DDdbaex9OseJG4Q9rs+GVomMdl+0bf6Lp/0yTHFFehS?=
 =?us-ascii?Q?eP6HSkqUxt/gb9yCAIdlCseRV7tpiLuir1DkyXlkIfXtOea9T1LORIIXGSGp?=
 =?us-ascii?Q?oSgn1D2hsqWwBXo0SD3XkiP8WaZBi5aY5Zp26rcf86SjO0wLjOqNUrQZqlwv?=
 =?us-ascii?Q?QleL1NNYKTbfpFkMXsUlTTfzzjVsy8mDeEeVUPPct3qKZCSIjDzIeLWmxtpz?=
 =?us-ascii?Q?H4HfURO9o8py2USOnt1QMhVHdUegIcGUQgxZRYpcQN0m1q9Rgp6AsOM1jpDU?=
 =?us-ascii?Q?kWZwEsYA0VClrH4xNP4qIZ3zfK8c54duoELlg1Yu0yOKLc7s2biKVd6Zy52U?=
 =?us-ascii?Q?Oonx/c/kavhxD5eVo/mYL75lQ7BXeu6uMTy3ImCgGkQ6RWQmWUXaTQ2ttNMn?=
 =?us-ascii?Q?UNe9e6evDVKxugyA2v4C3qp+cvtFV1RjYnXIvDSmv/jokC/6UDuoczWmC4Yx?=
 =?us-ascii?Q?FVQrvnolLFOePWyNrztthyTzvzW9itDD+4M5WhTU2S/q7uRCDe/fJ80e5uSq?=
 =?us-ascii?Q?8ZV1EJDlwQvSsJSI3SqT4/cMO50ruWaFiU71d7gSps1TpH43zJVTBdOXO8f7?=
 =?us-ascii?Q?+RkwAy8r6qQmT7z/e/ChN0j9g9MtloBIKbfaAFjNpCV3ZtZ1a2n+NDV/sJRF?=
 =?us-ascii?Q?ZXSWa7idO9i9uest8zdtgblY+7YwuT4S0FsKInqJGmRSxaaQ5k8Bi7zQL35a?=
 =?us-ascii?Q?dV2SBhrfXWlJmL4lunp1GXo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d7ea23-1b9b-4fa9-c177-08dd8ea3293a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 02:42:38.0534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y02WEIslz8Rnue0Ta493lfhLcbR+IN5q3XvYwTmacCrghktoURRTZ6Ktoks7kz9upIo7vXYDhw7syJfdQEw1wfJ0Qp6TTUNM88UKBOc9h7zv/QkOXxwgjm+6PZ/HOTYh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8916

Sparrow Hawk is using MSIOF sound.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/configs/renesas_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 74f5b1341542..2ff34784aa14 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -307,6 +307,7 @@ CONFIG_SND=y
 # CONFIG_SND_USB is not set
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_RCAR=y
+CONFIG_SND_SOC_MSIOF=y
 CONFIG_SND_SOC_RZ=y
 CONFIG_SND_SOC_AK4613=y
 CONFIG_SND_SOC_AK4619=y
-- 
2.43.0


