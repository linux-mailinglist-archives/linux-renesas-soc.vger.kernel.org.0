Return-Path: <linux-renesas-soc+bounces-32368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBvLAamxAWppigEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32368-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:38:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5580F50BFEE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 12:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D84E0302173D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4934C3D9021;
	Mon, 11 May 2026 10:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="iKU5ZDVa";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="iKU5ZDVa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023108.outbound.protection.outlook.com [40.107.159.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1953D171B;
	Mon, 11 May 2026 10:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.108
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778495893; cv=fail; b=ec5neogI3gXJhU+bvIXUdHRoReu1sVWr6P8PCnB1DfYnGfjMRiulCmo2/LLN3hwq5zHkIPbOmSJ1c3ohPx2xCMYW8Ekf3nmZaMgYmJqEW8PkwKKBvN/UBYGL5mqqHhJrbycO0UK98+L58SedtjPja2mQuf1M1Agch+1FBb5Lf80=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778495893; c=relaxed/simple;
	bh=937YqgBKibs5IhVHIYnUXP5ODR7wUlOX48ce01TIyHc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TjU3zWWeb3ICeRdv/1ce9wVO8/lAiW7S/RMIxjAM+ooNq+qgXCyY5dQKjiZk61Q4rGWvJiWo4MXMJBOPobDFbnF1Awc6QHskHf1HsoK5J2G9tG+4Ub4cayffyRNykaLZUi8fvJjEjrl/zUL4wotGXzw8Xuo46Y+c1/sj5bpJ87c=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=iKU5ZDVa; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=iKU5ZDVa; arc=fail smtp.client-ip=40.107.159.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=CZ5Jol34GRCHlfgqZBURxSUopmlOklOEGnjcBKJKbOEgoCAsUlXPh4tGG+SR8MtOFC+EtIPF9twEueie4FHIow2g4z5uKQd/gpGqssdQFGxGKQ8kRTpQjWfPkssYVbNfTZQD92B3k2+A/QXqr+dB+11og2H/8Om/xeUt8BGSb/T16KmEzbVtEhiPMQuzq5hHj6mWEMR81gyKFbT0xIVGlLVBKFqthjzEid8cMtQJWcALyjvy7GeHdQOFDyYZuC8An680QX6FIlLcul5XrrjPoLCyqy38cf2YSjUenhwnDH5BTNTTdcJcLRd6yKq7pzosphBj/MOe7BdLLrV7mqs9kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+gQbXOPWlThqPpr+dQT2vdh5t54Nd7VN/ESgv3QuhE=;
 b=QAwmgZJSPh3u/AmDExI8lgjcNrUoakLsmeqRMaX49TNCB2wAidpvBC0dHo/8pepdXccqVvqX7NsiCgjDwXFN0UCvfNEl37xq/DABIwh+XhrQf3xfqeLwReuP/hGFsXGuo4QUiftxbwbWCus9vr+Yir3aDW49aMDtvEuOQgGzInotrbOcbQVTrQqWp41syF/96vBhtSU7E/81PR0aiV5Tf2Rbvq8ao2937FU+oCfiFW7Qda+4cOxbXdxuXsV1ZYKxiw4TaQEjuPXV5ztMWJMG/LbiswXm1QBC4BTb/GxMSSzLgSHvVR9y/UiyRAEZweP0FKASGKCgO9f29pVq98Fd3g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+gQbXOPWlThqPpr+dQT2vdh5t54Nd7VN/ESgv3QuhE=;
 b=iKU5ZDVaRT2R0xott3cMxBmha98UMBmxAl1GHrZWFZ5psCfSxBcyf1SaB6Laxtz0LbP7fvzuVePf2jntLzuO3+0pQRINA+J8JPKjOWtkFOisIG1At6CLZIQ29J9gqBvplqouHexdpcortXjW8tIa67/QP9lIbVTCdan1DY/yakkWprRVXGcHO7F6uMCrlAvb4qDEJrO37zGE/UZduu+vwU7M6kD4ixltrefzR//bqAGddWEs/Hj/P94ulYp9pLvfUlIeM3XA894w1aZsdfRKTn5AAIK8nyqGBAT4xmZj57fGg+r/o1gVvFU+oT660oyOHQQ/nEoMv++d6G0QiY0LWg==
Received: from CWLP265CA0442.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1b7::15)
 by GV1PR04MB10352.eurprd04.prod.outlook.com (2603:10a6:150:1c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 10:38:04 +0000
Received: from AMS1EPF0000008D.eurprd05.prod.outlook.com
 (2603:10a6:400:1b7:cafe::54) by CWLP265CA0442.outlook.office365.com
 (2603:10a6:400:1b7::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 10:38:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000008D.mail.protection.outlook.com (10.167.242.84) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Mon, 11 May 2026 10:38:03 +0000
Received: from emails-2575400-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 402F67FD4C;
	Mon, 11 May 2026 10:38:03 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Mon May 11 10:37:56 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DumxIpNknC/cHNTf1F4/5pQyfbK75zv6Ii/IeIGvRgCZJfW3E3lXGhnxOL18RfFQxHPdpu4r8yJyojlDaVErpZToXhAIkVFCGZmG9C2UTDs0q6mEbnP1fsVlk4UyZURPTbArsxCbQOJPGbU5n7Op0Z7WejBqA2frudAHBQcgMmj0qrYtEpeb4pQe2BSPsDvbAPAOfj6wzf+boq0tx7OKU8yEyGFTgp00Ug6gGEOHuJMXoHtE/fAdjXSmC5Fjae2UEoPlXROaTKzwX9Hr0ULBad+b743KCZUBKRLtWYqnU3kgQyHMtEuVSMTUqVXJ96FK1YFSZF+IeK8itaZ9fKeOVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+gQbXOPWlThqPpr+dQT2vdh5t54Nd7VN/ESgv3QuhE=;
 b=K2OXuS0wINxuiTjELlbAoQ5h+ZCggVJ1d4DSnjRGZYyTL6vpGbZ+TwUZ9zBd8gb6xPGO5DBjyFnaDH3B/q/Oy7w64wxc0MrwM1b3hyL3S0CPfv/KkwsnJGea1Sc867p+53FoBVxtz3kKn71WveD9n2rbKVO6iNQbcNAo6l21Wu8bsv2IRVZ3W8CPZLteH3C3wlYC1Q1u7mVsQ91WbNXJQfrlNOxXFhmw/3OvFgZpwRQb6ovjFriQrtLlpFWRI3WJ65PPjdbKAIu+DMpNHjpROrM/8wcLAn8ASpSuRYqxbGSToifxcIUasBmH4EdSH2rA8ReBkHYwV13E7CyH2nYeWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+gQbXOPWlThqPpr+dQT2vdh5t54Nd7VN/ESgv3QuhE=;
 b=iKU5ZDVaRT2R0xott3cMxBmha98UMBmxAl1GHrZWFZ5psCfSxBcyf1SaB6Laxtz0LbP7fvzuVePf2jntLzuO3+0pQRINA+J8JPKjOWtkFOisIG1At6CLZIQ29J9gqBvplqouHexdpcortXjW8tIa67/QP9lIbVTCdan1DY/yakkWprRVXGcHO7F6uMCrlAvb4qDEJrO37zGE/UZduu+vwU7M6kD4ixltrefzR//bqAGddWEs/Hj/P94ulYp9pLvfUlIeM3XA894w1aZsdfRKTn5AAIK8nyqGBAT4xmZj57fGg+r/o1gVvFU+oT660oyOHQQ/nEoMv++d6G0QiY0LWg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by PA1PR04MB10357.eurprd04.prod.outlook.com
 (2603:10a6:102:452::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 10:37:53 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 10:37:53 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 11 May 2026 12:37:47 +0200
Subject: [PATCH v2 1/4] dt-bindings: soc: renesas: Add various SolidRun
 RZ/G2 based boards
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rzg2-sr-boards-v2-1-82aebbd27891@solid-run.com>
References: <20260511-rzg2-sr-boards-v2-0-82aebbd27891@solid-run.com>
In-Reply-To: <20260511-rzg2-sr-boards-v2-0-82aebbd27891@solid-run.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jon Nettleton <jon@solid-run.com>, 
 Mikhail Anikin <mikhail.anikin@solid-run.com>, 
 Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR3P281CA0156.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::17) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|PA1PR04MB10357:EE_|AMS1EPF0000008D:EE_|GV1PR04MB10352:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c25d01-a514-4b08-9934-08deaf496179
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info-Original:
 77xUjJa26UUpkiAVdPTQiONy08Ur5LG3xQgkrhu29O1OKzvS+o5exug1+OwQYlBVMbU+wTKXJdvCAd3X8OtiKncM6mW9Z5eGd71av3ivSwif9BtsjCvA5UFQB53HTUl58MeaYaxuvSecwk1gyyl88ohlPDtlIDmgHCiC9fpM6eKk4/WXzDA079HubZ57oMawDjUIIedGM/TAq3M1mQxdpBjvj+T+BOof6DHVinwPx4LVoR9+Fv7O1U6j2Bpqil/NHLcn9WCXMcvh5VtmkSszWZh1yMyFTYtFq1/NsjMMLDfbOqFgYP8jxLqICSe/cZukZnB2KR1sopVZXK4bblcM8Jk25P4LFGddMgY/msJ1fkRZEWgXD7jwLu/Eke0WTWvM7ro28e9GBCIhzdJmaEFciqx0Nz8pRPlWsRuZiE2bQpgg+JrUzUKIcWAAt5JMm3J4j+uRDm22bbxPmfV6vLtdxOETO7bKwckV6O3kxviMUioNBhD9vouZEQSciKJXQu1X7uEvGcd9a7RXsi7ddUga3nDfVp7IXoD2L0XsccL4w28+YfIR1lsg0wYBHMPd6lY1QTWzzq2IPO/0nwj3t/ErqnO9zRyEYm6mzR22y2IhOEJyjkMxSb8ptpsHEyr7Dw70QUNnQewTahJEuifBpCOR/ofsjHpASQ7b8HHSXsJwel6RAK91tMAjw3fqy+3tfY6mGwLGMIf1A1ap5qQsDMTWEp0pTEadIjIyX+rocTGaQfupkZ7XrMx7D3t0sKiRHG73
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 nKb0zSvPuttl/b0PfqLLjO2e1k5c6Y/9aFuS/ZXcBkKEHtEjSCJ0B2k+TajlZk/kD4M0J+uo1X2uQjlw5ynQ/R8ci9QEXPuWwemPmTQ1sJvz8Orgsledf/FLH7xwqgaggHIeJWvcxLf5IG2fKW1qkwS//2HwWuZdEohnGS1GSM9U84auuid8n+I3w06Fv1v+ExvV8w8zrvRNY7kpfMLfKDjvX/yljeG06PBgE1HPRMS4YCSc4fnxJ/KjBgMUmzLKeVicb1e7SEOseoWSOeU6G5TXY+g23X0Wv1fv9+vEp0l42pZAUdSzg7gfv50R/zfjKQpc/IyxKKS+tBH/8CsXoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10357
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 746129a61d304c77a5064642d9d457ed:solidrun,office365_emails,sent,inline:5e585910611d2837dda89d7e66cbf95e
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	930da054-5a7d-4766-5e1c-08deaf495b85
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|36860700016|82310400026|35042699022|376014|13003099007|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CZTxnxksJeq/uc/L3SAqD27uv4hpcnK+paUO5mwx4Tz8lLvblO9YxSNHSB+/YkDj9Kab1BbtXEiIBaZ4iTkBDn0KGkc0b6DRtZLmtXdJmP1ZU7RuwQIh2/y9AQF+bMhnjHxHpG8HIZ5KS+yiKYpO5O/3REzrGdTDzAyN6Rfjyj9k3KrGrt1xjEk0AELepZeGYA54WagZz+jo1FmQvBArib0ftWdG+N0u1QSB1BZUUPF6m2C65vc8W6bLiCfMZtUYwOaRArvrJorYAnxlLSYTosjljTnY/Q4ynlBcME2Oj8/5eya/wiEeo67fS0sxyJ3gm7rf2LtvJcVQiVLYg/37JJWUeOj67k8uiVr4ymm4GmBhbzj5zlSIn5Tk4eYH1MFtwhTDE1emdK4FPanoYjaAzAjtqmeb3ni0tfWmYI6Z/3K7XX0/l6ugL8gx43ZeA+CRIHxgyX0YTK8u9L3V7MQXU2cZZYvEdOL62O0X+PLsp8DFMmsdvNLWlxERSyru717eeIMwiBpy9FXZ4tB8aNP/er61y29P+IwGbkdiRryqiHwFpL1U31HOcC06QXzMQYTQQt24WXe6DlFkyCqa+KeseMcd5WN+yh1kdEWOCLpbSDn5wUBqm1PEFJJWjiG6Fjw4V5+iBqj5Ozgy7Gnpjb4cNstWvqvut1QX7Uc4GAWv0FaG9EuoOnmLIXK2lL/1S6uIzOOqsWlVIs9n1QocusRwiWRoIcY7R97R5pQGzSa8ajI=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(36860700016)(82310400026)(35042699022)(376014)(13003099007)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rzaHgPrcIKrRP9ZSBbtu8K236O5hYX5vfl/RoQs7Bc9pQ9Z3/Q30EyIZgTlAxYh8hTgbwPhovEXobNc1vxFmjehYa9fr+Y5A7gaDGp7g/mAXBWUd2+fV9D4uBDrwYFTuDLf+KmiLKThLeI0e6w8qQyVEeRZvuvplFFTV/AR5G4h2lpgZpTZqDPM51vDiedJrFbO3pa1KV9jx88NCIJ3yW59O/twduZgnq73GzAfOU9Lnt+BRVChsmeBEMRMPg5IbVMWchS6qHvA0DGaC6RHEgLzseQFiRANNiIF22QnlI4btP9hVs3MStwtLX6Xm1di0CIAsaI5wYtKH97t3l0A+p2AGxjzTPn7jY67oTS/8fiNYEMv5gZ6xug/ScgiocPgRUl50ztYTXjmhFRCsHmb7puTjSFnz5MebdYEx/xP/FjnJtwZf4Mg2MHvzO7cMjBan
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 10:38:03.4995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c25d01-a514-4b08-9934-08deaf496179
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000008D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10352
X-Rspamd-Queue-Id: 5580F50BFEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=3];
	DMARC_POLICY_ALLOW(-0.50)[solid-run.com,reject];
	R_DKIM_ALLOW(-0.20)[solid-run.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32368-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[solid-run.com:email,solid-run.com:mid,solid-run.com:url,solid-run.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[josua@solid-run.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[solid-run.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

Add bindings for various SolidRun boards and System on Module built
around Renesas RZ/G2 family of SoCs:

- RZ/G2L SoM [1]
- RZ/V2L SoM [2]
  (shares PCB with G2L and has very similar programming model)
- RZ/G2LC SoM [3]
- RZ/G2UL SoM [4]
  (shares PCB with G2LC but programming model differs largely)
- HummingBoard IIoT [5] (RZ/G2L, RZ/V2L, RZ/G2LC)
- HummingBoard Pro [6] (RZ/G2L, RZ/V2L)
- HummingBoard Base (Ripple) [7] (RZ/G2L, RZ/V2L, RZ/G2LC, RZ/G2UL)

[1] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2l-som/
[2] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-v2l-som/
[3] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2lc-som/
[4] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/rz-g2ul-som/
[5] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-iot-sbc/
[6] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2l-sbc/
[7] https://www.solid-run.com/embedded-industrial-iot/renesas-rz-family/hummingboard-rz-series-sbcs/hummingboard-rz-g2lc-base/

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../devicetree/bindings/soc/renesas/renesas.yaml   | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 5c22c51b1533d..889d4c5e8cd1b 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -502,6 +502,14 @@ properties:
               - renesas,r9a07g043u12 # RZ/G2UL Type-2
           - const: renesas,r9a07g043
 
+      - description: SolidRun RZ/G2UL based boards
+        items:
+          - enum:
+              - solidrun,rzg2ul-hummingboard-ripple # SolidRun RZ/G2UL HummingBoard Ripple
+          - const: solidrun,rzg2ul-sr-som
+          - const: renesas,r9a07g043u12 # RZ/G2UL Type-2
+          - const: renesas,r9a07g043
+
       - description: RZ/G2{L,LC} (R9A07G044)
         items:
           - enum:
@@ -513,6 +521,25 @@ properties:
               - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
           - const: renesas,r9a07g044
 
+      - description: SolidRun RZ/G2L based boards
+        items:
+          - enum:
+              - solidrun,rzg2l-hummingboard-iiot   # SolidRun RZ/G2L HummingBoard IIoT
+              - solidrun,rzg2l-hummingboard-pro    # SolidRun RZ/G2L HummingBoard Pro
+              - solidrun,rzg2l-hummingboard-ripple # SolidRun RZ/G2L HummingBoard Ripple
+          - const: solidrun,rzg2l-sr-som
+          - const: renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
+          - const: renesas,r9a07g044
+
+      - description: SolidRun RZ/G2LC based boards
+        items:
+          - enum:
+              - solidrun,rzg2lc-hummingboard-iiot   # SolidRun RZ/G2LC HummingBoard IIoT
+              - solidrun,rzg2lc-hummingboard-ripple # SolidRun RZ/G2LC HummingBoard Ripple
+          - const: solidrun,rzg2lc-sr-som
+          - const: renesas,r9a07g044c2 # Dual Cortex-A55 RZ/G2LC
+          - const: renesas,r9a07g044
+
       - items:
           - enum:
               # MYIR Remi Pi SBC (MYB-YG2LX-REMI)
@@ -529,6 +556,16 @@ properties:
               - renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
           - const: renesas,r9a07g054
 
+      - description: SolidRun RZ/V2L based boards
+        items:
+          - enum:
+              - solidrun,rzv2l-hummingboard-iiot   # SolidRun RZ/V2L HummingBoard IIoT
+              - solidrun,rzv2l-hummingboard-pro    # SolidRun RZ/V2L HummingBoard Pro
+              - solidrun,rzv2l-hummingboard-ripple # SolidRun RZ/V2L HummingBoard Ripple
+          - const: solidrun,rzv2l-sr-som
+          - const: renesas,r9a07g054l2 # Dual Cortex-A55 RZ/V2L
+          - const: renesas,r9a07g054
+
       - description: RZ/G3S (R9A08G045)
         items:
           - enum:

-- 
2.51.0


