Return-Path: <linux-renesas-soc+bounces-24400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AA5C468DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CFB93BE6C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D529314B83;
	Mon, 10 Nov 2025 12:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rikabCxK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F91F314A9F;
	Mon, 10 Nov 2025 12:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776685; cv=fail; b=kLdrYgAGdpj49kL5Wpije7WWBZklgkIF3t5sq+XSGqat66mcAmJd4F3Zlp1HKXORI6xuxeELnfu8ch54Hut3rNCbIUrPTMjPkNn74bBOxw7EnsoqWqtIlRgeL8gSSHY7e51uXoIxgfyJC8xS/y/jR3/G7CDkF9TaGR9QWtOeyio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776685; c=relaxed/simple;
	bh=/s4lKbbFBnEKTtVgViaFVobreZ/rFK1XGjbtXqq8hKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eh9m+bln/D3oR8NV5mPfUJds2t9/fU1Sqom1NA/y0J1jQKP63FTPYWS0Yz9w5aNh+c5WO6GHeinWKO+rkBjKQ9x8ZX3HLNWNb7YmnUaJZmjGQX+/lonp62+TOLBsAFuESenDDJdRPOa+pjO5wtwGNZqvbrCMzO1zt2KjeFsRzGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=rikabCxK; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvB7PcIPjrhRr1tcZS7+Kgpxk5ngv/+azQGRppKc+/nh5+gvRNYyZ8igk4FVrzE5iu53B7xZCi3skoQ86pzjv+nGO54AkebSfPMle8lHHWTgeY6bYL+c2z9MYMfmOFogyzm2X4dHPXjspd+khvqEGxdVbT6/9p4eCYuRGv95HSIAdcAy8JfXRmSQmRYm6t9MH9VilKk6gXa0S4yOstao1M30+ResnKQzGGyIzaKhqSL822JQcfJ/41ODBFA7YCXFi+Rrjr5q24I8XYhh8/1PullU5FWJi//qvUd5XRIBf4FztYZte7xnTaYYktOd5++gGYDlJ/x89/ytQWFdFTS+xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+w/d4fhMdSnoopZ3mrjW/f3Sdrwz3dkz7Pmq4NzD8w=;
 b=w59wd7+PEHkksgfaOBihVh18JB3OQV52Uz15awfSSPWJX10iOmBm49iNH8NzDNiN504HbxzR//k7FQwygI3pRnbkPfmJ9thSopV0Qo6GLA7tdYrL9WKDNr5sEH13Sa69uF2/DbxQR4ytG04MOd/2uFIYZSkQ1gxVmdPHHzeTtww8MPSnVwrmMGbl+mivlCOF7DS8nue6vWcMl0jVDGg8svr/0PGWX2bdTcjMmwOqq2tRyIOy58fABzBwPPsdQxf/sE+nFzXvG4+UOzIuOpnBFoqzyqOjRHAviK9Jz/y036RnlgO8bFtOjhuptspNW5PuYbA20iR4zcDNPm3xQQsbrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+w/d4fhMdSnoopZ3mrjW/f3Sdrwz3dkz7Pmq4NzD8w=;
 b=rikabCxKjiwKe6R5BaR+BylzFlR44U6Ey4Xqe8PjwFWRT6LJOW0DHRW3mwaqw6XpgtsJhG19ZEAtBjZH+ZS80krrn5VFvavJLggDncPwNUeTLa+l7WCkVt1M92rvX3yobCpk4lpqA8A1eq2Lm0u3wI3sA3vkltuFD+hz4DoRR/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11558.jpnprd01.prod.outlook.com (2603:1096:400:37e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:11:20 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:11:20 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 20/21] arm64: dts: renesas: r9a09g047: Add USB2.0 support
Date: Mon, 10 Nov 2025 13:08:20 +0100
Message-ID: <e276db7e8ef085913cdc3f5c0633a6e945068213.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::15)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11558:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b797806-df49-4887-a71a-08de20524240
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MpASx6L4y6ISK2SWO6WAhWkJyRZaofYVYGBFsBNELz26e6xXFg0ydp7esfF3?=
 =?us-ascii?Q?XzFpel/fopfnvx5amwgLmLiEudrs7thztEnK4zmvjvsJGEwUJgtdNYQzCMLV?=
 =?us-ascii?Q?UpMQZbUvi77eeF5Fapb4oy/V0H6UhBOtrO7VsFcig9XfwSpQKocO2ASy8E2v?=
 =?us-ascii?Q?AgBh+OXp+AjpsJfz8fF0Nx3MP8mEQd/reng0Sdwwid3Qv6G5Fe/9EWwpgNA3?=
 =?us-ascii?Q?pctSaCaKAnR4obf5z6ru+lW1l8VRasFO3IVXUBGd2L9Ogw8ADYSNoSUoINag?=
 =?us-ascii?Q?acVqzfrGZr+GDYWZpOuGaNTLIncE5Nydo3eMSCSqBNVG7Wy4tUefpjuwV87V?=
 =?us-ascii?Q?Rbui0cHS7XGQhVuXadvRcg1m+S8W+siD2EAgcbpFN2cczJvj2teUxqXDe92+?=
 =?us-ascii?Q?q50AkBmhVvz4e9BhnjHsY3yYWTqlgejLCIBNvvsd6gg2HuWGd8K+a1FD5PAE?=
 =?us-ascii?Q?oqD7dqis1wWbXCQ6CmwyzWB7qWUU9OGFfBJnM6doYWEGioabV6khoyXY6Kyy?=
 =?us-ascii?Q?fVZHiW8QIY1W0m3tgf3jBvnI4sWMqsr8ApGD5zaaxh/0K72J6xdPke0OGgwm?=
 =?us-ascii?Q?+BUT6G0VpAgMwF4yzfowrD8DMreBi/oPNq73QmBn3dEAZrXsKP2eFq7FD+0l?=
 =?us-ascii?Q?YJEC4zYPEuoNkHkwhiUTV86OEOeXkVEZjv6TFEMyU/XjZpC+MnE4zwDm2L8e?=
 =?us-ascii?Q?qhR1dX4jtLtkW0DPOJCe30BaUUNfctjVZ+gwIaOAbSliKE1J6ZKa5X6xaYqM?=
 =?us-ascii?Q?B5UxhyqBYKZhdyOLCHZ3KIKG85AOHksEf81RT5XDifsD2iGyTW4oUBkXrHfH?=
 =?us-ascii?Q?HhcS5/7Jt2y5dmXIv5eAL+ydJ38Dmvs81k7OEJow5L1/ssiDc18zpbbGMgFJ?=
 =?us-ascii?Q?rk6F2kUQK0ugYYjTBkp5Jpyegyi/BssO+1ztbk6giQDnTwG4JrtbKCdkPsCC?=
 =?us-ascii?Q?14J6746atZ2aVDhzO7wwGK1BkTI3tu4hjy583NEghZgwnWh9nvz+QSAE6Xg8?=
 =?us-ascii?Q?IUC8LC7JjgTREiQMgarwsIOJs/L7jOjDLcJ4oq1DK1qpmJ6h9wuW3KYW7jNp?=
 =?us-ascii?Q?stVUwSVoRvdnrOXu5cUj9HuHDlxYgnixGeVQzGAUo7U5N8qkXp9HMWpsYfXt?=
 =?us-ascii?Q?kWwtakS9HS1jYFsVHu4RZgCvNaFRTyyynWmxzjLoZEelEn3QRlWCTz49PPdK?=
 =?us-ascii?Q?IFOvAWl85YekZCwwHCzXZZx8k5HvlwnzUDiPtFvdFjKLlXHT0foHWisMzkGB?=
 =?us-ascii?Q?J0OhPp+7uO8ahJscBvN93LzwT9/CQIzaJzGIpbM51SkT+mdaDTWo4fo49yM4?=
 =?us-ascii?Q?V2xfuRZdsgXzzKQ6URyivDSZ5gaCuc6bYkb0mvb9Ou54WdHQ2oRDMRugVf8j?=
 =?us-ascii?Q?f62+2YM7+PFBAQA/lb+H0SXhWrKKG0Q995e9twmd3j5NofuO2j4OW9upIXFf?=
 =?us-ascii?Q?M/wttRgpFjkDf4AlFk4LfAu18V3RWsZl594/sJMpIG5ZWpFVrYjl8EiPsA6z?=
 =?us-ascii?Q?VT50hskCRmd0/zkzhHU4aLnFQnKBDvaPfvYV?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uaz/lk1gZIsgXqhOiUvcSKSltJAGCaOlXg4Qn6fTzOo6AtwloDyCM9O9QOeo?=
 =?us-ascii?Q?xggQey80eb9ZLpOjcvN7AOVJiLN5u6MCB2jA6WwpuNxDtsDgJys0skwvPOwS?=
 =?us-ascii?Q?8ConiABlrZs55WFjO25LxhEZHQjAhQxa54TAxw5IN4Z22AflvAkYHF6f49XZ?=
 =?us-ascii?Q?bPRuKF5WZiYFkGE2BeAe4pMFcH6h6Jnd9Q09/dFXE9Ni2iRJ1x0BYY2d5qFa?=
 =?us-ascii?Q?ECE2ngd06rjcvOi0uwIfL2A/UWj5LZXEu4pazIn1vGFyISiZDNwM9EuZ1z7/?=
 =?us-ascii?Q?KDfgFEU4WvvW7hlKzn9M07sccqcvJHZ2aPcW6yDa5DcOsy85ycX8dHsmBl2e?=
 =?us-ascii?Q?CWHgEKRZFPpzY0b3dOJHh2c2uWCfMAQwxVRFt6uqGtBQ0C7jyOPT/83j3vE8?=
 =?us-ascii?Q?kYI1eP0GQ0G/y0eO+fE8gnffCrveIJ4oWlbo2LtKonnna9GmSRDQ8clD1aIU?=
 =?us-ascii?Q?9WB3HRecl/tpzG1gGhD3g1mwNxrLu7vOEtgO2twfMvsL/fIOTLHBkY43bzp6?=
 =?us-ascii?Q?WD4oLvv45q16z2w7nXYdqfU10ZL8UNOWuX+Rk3gfRxWx3JTXfob/uBlhi0BB?=
 =?us-ascii?Q?RiOBmg3gXupwfEI6tpDBNI740+f5WJYZrj/Osn+cK3XHW0AzFotJ3ElZmyGz?=
 =?us-ascii?Q?SBp41tobqVeu9y5/G+IBJdvHlmvkduF3gcea2l4J4ucCK22jVh7ts8T6xqKm?=
 =?us-ascii?Q?UofP5rmar+ae62lRIlgPeoxH7nr0L8uVsv8/XfjeUO1UF7/mJTYrrGqHLRHe?=
 =?us-ascii?Q?wmiGnkVbJWVCnYTKOy2M3f7GTrGV86hFfUhxnina19HGZZqbHl/9ykS5dxsa?=
 =?us-ascii?Q?8CNSYsd0WiO9I4byd1MpMpdvj4bhL8lt3nafMCrdPXcXiqYipF/flOpmcYdF?=
 =?us-ascii?Q?BmmgfLQ2/jxrSohXl+nAbRpl+v9xh2O46gCAoAPxCRtyC583pdaScEA0YrdK?=
 =?us-ascii?Q?JOwtHZr2MngTt8uDYVpj8fYiXSmLgnA5MBiSfQlu5eGhJjJe8+RoVXquIWX5?=
 =?us-ascii?Q?d2xUevNxgUd01esByxXX0mAuB0CIJeKeWIgVLWFkVVoRWLv9hQ2LwVYEXFt/?=
 =?us-ascii?Q?45IznyjtTq9+c12M33RlIfzG78r1xAycFtb3xbRRvwWZIOSZwcUCUsq4yz0x?=
 =?us-ascii?Q?K0TQKMPdLkRC8eNL4SUvv3YwH//8hMu+D1pGBPVM9Pjwde2pgtayIAkNF+w8?=
 =?us-ascii?Q?aLL9t0pFS+N1CF7lsHIsprG8EbeWZJZIIIX2uYVsUhalHMp2I+/QcQmpku3d?=
 =?us-ascii?Q?ShvQ0sKh6XeyUSVjZ223QIcGXltLRu4rB2cPzzOnfdfb90BYiUG9VvswqOpo?=
 =?us-ascii?Q?2pN1IrMAJTP3Op2oyxKK3Y94YPSmJuhSJ4Ear3528aAcG6BKYeAgj397KxQE?=
 =?us-ascii?Q?JItRMyFZg6yQCIuASzmFwW1uB4tAXLJ5GEPgwVTccv3Tf72NNfBfxomWtX5o?=
 =?us-ascii?Q?swUs++W6u73i6Mrx7XKU/zzKaE1qJA3pvvtGiiJsf1A5chsmkvY+X/0QYXwA?=
 =?us-ascii?Q?FB6fNiWpkM5A+D5CIZgQWiJUBtOby1NMN7Cb2jS+0p/OFttdN+WslEZY6S6i?=
 =?us-ascii?Q?0zUSzM4QM+E8B5lU26e9I2OWO/+QB/J97Ern39NvsRXFl8Hu/rI+k9V6gMI+?=
 =?us-ascii?Q?jj6AjoIKt+wE093Bw1ONHr8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b797806-df49-4887-a71a-08de20524240
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:11:20.7046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RB1Je/i5VWdRCI0kcuKuKJh7Edtn2x2QX5m/x1Uv0xo2ys3L5pt/2o/K4zpKFncWzDNcC7wko8areuGad8vPP/hhn/8w4sQTi9O+D+wL8t933pBrqnR5GYmPWSFc+UW8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11558

The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
and 1x channel with host interface.

Add the ECHI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
in R9A09G047 SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - Manipulate the mux controller as an internal node.

v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index 7a469de3bb62..a35b0f4e2d81 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -853,6 +853,137 @@ gic: interrupt-controller@14900000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		ohci0: usb@15800000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15800000 0 0x100>;
+			interrupts = <GIC_SPI 742 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@15810000 {
+			compatible = "generic-ohci";
+			reg = <0 0x15810000 0 0x100>;
+			interrupts = <GIC_SPI 747 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@15800100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15800100 0 0x100>;
+			interrupts = <GIC_SPI 743 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb6>;
+			resets = <&usb20phyrst>, <&cpg 0xac>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@15810100 {
+			compatible = "generic-ehci";
+			reg = <0 0x15810100 0 0x100>;
+			interrupts = <GIC_SPI 748 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>, <&cpg CPG_MOD 0xb7>;
+			resets = <&usb21phyrst>, <&cpg 0xad>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@15800200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15800200 0 0x700>;
+			interrupts = <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE0>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb20phyrst>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			mux-states = <&usb20phyrst_mux 1>;
+			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+				status = "disabled";
+			};
+		};
+
+		usb2_phy1: usb-phy@15810200 {
+			compatible = "renesas,usb2-phy-r9a09g047",
+				     "renesas,usb2-phy-r9a09g057";
+			reg = <0 0x15810200 0 0x700>;
+			interrupts = <GIC_SPI 750 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb4>,
+				 <&cpg CPG_CORE R9A09G047_USB2_0_CLK_CORE1>;
+			clock-names = "fck", "usb_x1";
+			resets = <&usb21phyrst>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			mux-states = <&usb21phyrst_mux 0>;
+			status = "disabled";
+		};
+
+		hsusb: usb@15820000 {
+			compatible = "renesas,usbhs-r9a09g047",
+				     "renesas,rzg2l-usbhs";
+			reg = <0 0x15820000 0 0x10000>;
+			interrupts = <GIC_SPI 751 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 753 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 754 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xb3>, <&cpg CPG_MOD 0xb5>;
+			resets = <&usb20phyrst>, <&cpg 0xae>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb20phyrst: reset-controller@15830000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15830000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb6>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			status = "disabled";
+
+			usb20phyrst_mux: mux-controller {
+				#mux-state-cells = <1>;
+			};
+		};
+
+		usb21phyrst: reset-controller@15840000 {
+			compatible = "renesas,r9a09g047-usb2phy-reset",
+				     "renesas,r9a09g057-usb2phy-reset";
+			reg = <0 0x15840000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xb7>;
+			resets = <&cpg 0xaf>;
+			power-domains = <&cpg>;
+			#reset-cells = <0>;
+			status = "disabled";
+
+			usb21phyrst_mux: mux-controller {
+				#mux-state-cells = <1>;
+			};
+		};
+
 		sdhi0: mmc@15c00000  {
 			compatible = "renesas,sdhi-r9a09g047", "renesas,sdhi-r9a09g057";
 			reg = <0x0 0x15c00000 0 0x10000>;
-- 
2.43.0


