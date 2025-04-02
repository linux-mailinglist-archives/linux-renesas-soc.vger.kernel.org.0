Return-Path: <linux-renesas-soc+bounces-15325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E6DA78F8B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 15:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 060B8189396E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Apr 2025 13:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 610A423A99C;
	Wed,  2 Apr 2025 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SxbD5HdK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5490C238D50;
	Wed,  2 Apr 2025 13:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743599586; cv=fail; b=W9+wN/ZpcVLNElbJU5pTFVZWguRE1id4zmdwbKHtPMTZTnwFHjV/NnewAYqCRq/DwKfT/oXCC1qy6SWEhJT50gT3P28adwey2jFJeZ0AmprKV7NTmdkpTRWms7HRQ50PAw9Aij9Y+g9Ul5M37S5fnEzwO/ZTyX4oIMbqAghIP2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743599586; c=relaxed/simple;
	bh=xbSshMmrHwqCo5uinBbQ+lY6qmXFQADS1SIZAYR9yPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n+17f3mGA1UQFWss4IKtfvZm+omBQVTfzP1NFYG1Mq1WcH+aUl+wlseRSeyHgLBbTMULBVCP3w9lKOlZO8+/udP3Ubj855C7rr+/1WBNVNVxOyyBENhgAahCU5+335bv9wthVjuYXEqgwy47Og8zZpa8pzX8HDT75qHQoy3ccA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SxbD5HdK; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nmqGORjkQr6R43n450whRzytbAwQfNih0GsdaiSgkfVBsqdtk7UJG9DL9DPSsSDOtcHZeZuc1wSZRb8gtz+57lWeaTRMGCniR8GQPgnLzG0VxBeKsBu0Ke2pagHbLt/IyUzW+/7jQuIjnSou+IB0QrFHG53yJ8609LvcrVyWT3Ed0IE2gK2qgtdQ/KGEt54DP7pfQuNG9b0ZRmZVMKYD5ZuWLz7Nl72+4ytXQPn19YZzTxY9nuU9RB35eAoUrFwa9zCTHXvVU9jIA7+EUZQM21TYgrtKlj4sZDmu5Vq45ELUefIATWuj6DxixYzwJqv2kKF9YEKR1obOnaVKb4Bdyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYqaMYuN1qWnXErvNGvZmgedS+bCw7O2pHkAykqTTfQ=;
 b=L6iF3yUW40aAaEBbRFYHvni6eK3Nlsmk1O5IznOme6xptbYCHkh3I2nrYlDbGAeM8tUb3X+3uUd9Dikk3mZf8JfA0p5hZ2WalRVQVUQLY699gUHTSBa7gE+rQ4ng9Ct326WnH2ujiMAg8VK/NIBn9fUbAKZjtEiEAUY1euBMQefL0+0rN6yL06HapTvkp8xlr2qbF52orVTEey/Bk7NKvhgyyPgOZXuQilYfC0zSoNitjrH5H3nUE3eBfOCOWJwflxWCVCHVK7GyuNtd+m4hRxr+4WlN9vVGgAz084GEZHVyVlpWsz9cSCukKmLlkDfpfPQiuXXqX9CBzzj8btDASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYqaMYuN1qWnXErvNGvZmgedS+bCw7O2pHkAykqTTfQ=;
 b=SxbD5HdK9junF4lpNa8AFDXi/bO3cFfh+ercBvTl5wJvS6AOIINhOxpGkzzaWyGV2my9H+FRcosKFTGroXY3dJJCUMWFcjsC2ow4CXgvkY1cnuI4bDEz6c4Z4F3CjJJmfO5w3sONVTK5cDnaVnk7riWNTGK53Xg3J5RedAtCmLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6688.jpnprd01.prod.outlook.com (2603:1096:400:9d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 13:12:57 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 13:12:57 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: renesas: rzg3e-smarc-som: Enable Mali-G52
Date: Wed,  2 Apr 2025 15:11:41 +0200
Message-ID: <20250402131142.1270701-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250402131142.1270701-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0173.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::16) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6688:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d564715-9d2a-4a11-c152-08dd71e815c6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?deBhYtsAZnwyAb6vvjSVp97MwYLcUV63SUPMXNcKwSYw5cUXLMvPnH24ZMzh?=
 =?us-ascii?Q?lUKVZh2L0D3PiDGjpaIkucUE9xYjb2JOiFOjF0rsJjfigVHKfUlU3pqCs4rl?=
 =?us-ascii?Q?Pwn5IeKxj2M6uy7ZIOICeI+SYBKCp5bU35nBBu/VSTRIk6PSCkyM7YcvIdSI?=
 =?us-ascii?Q?u+RBT6CwfkT2YCmg9HFYXLD/8+RlaH/PHPhShWzKTkYNnGydymjv3sO2h5/y?=
 =?us-ascii?Q?prEjOX1xSqcZ++PVlqFC/xGy/mX6cNHtu2so7Kwtdho4LqypQvvs0+gWb07O?=
 =?us-ascii?Q?SpmmaOBQFfdTSMWS7p5tesYZCDTUZ+oIvwWB1elkGvhAzJa1HFXC6OaoHZhZ?=
 =?us-ascii?Q?ioOflj35oC9wNBc26AH+QaZUuF9Va9xHPPYLHM2soAZ9Dz9eTC6X1CI8WnF8?=
 =?us-ascii?Q?ZWErpXND/bMEzdw9D6k4qU6T675yqk6rNUSYovqvQQd/yOczjj22tk8HDePJ?=
 =?us-ascii?Q?NaeC5yFa0fmXKy6Sr8wc39yiDjfwc6IyU+Ia6elXmuxARc3JTh1DQY3tnShS?=
 =?us-ascii?Q?9K/RUpnRmnY8qqs/Ctb7h7jWOluThtNz6AL32njos8dQos7hlAK2sh10BFKz?=
 =?us-ascii?Q?iUU60o5RuAqnmxIVX+OAMUZtEONAEVRRHna+zkdN2jIXb6RS4ximCQTXEEM0?=
 =?us-ascii?Q?rXhruV3NbwbaWuQy1eSLChh8VOE52BB5fsXRy/z0BXEOWWq+r0Fn/SFWYSsX?=
 =?us-ascii?Q?I8lgIp+Gl7/ctnjFPQpsAJwDn0Okc6MCiK3BK0NCGW8DodiBNsCxHdAUcaiB?=
 =?us-ascii?Q?xBrd9roDdAhzqigc42fnpTwvRuX8PN9yK8d0ybK5ub82bZKMGWvjypM8VLhW?=
 =?us-ascii?Q?2380ZcEx11KtrrhM2vwvKN2SVSm7SNd9fnYE0/MreMivLGLDAC2fOQBrE/xJ?=
 =?us-ascii?Q?/spppHMzaAakG0oRuhFA+t0t9WrW9Cqdw89olXOWGj0koAtDOLdsKig+1OpT?=
 =?us-ascii?Q?Qb46mZ5oEpZWIdGvLDVZcMdDHy9B6al01h513WsvkeYaleglJxVbLk+crLZL?=
 =?us-ascii?Q?jnN71i17I6KMEoCxzPwcyAHKOlsWzKIJpVJ+dh604bcT+Ah1fZ26vEvHBejJ?=
 =?us-ascii?Q?5eURf5sHkTHYQquCeVdB4QbZDgAIpyGHVOXAeoXpOuN2QrglxXiypg4TC086?=
 =?us-ascii?Q?pT604aj4IdiFGChND4KY/QaQ0JnkGznuzdsyT/5qdg/JQxdJLXYQD5sTsC/U?=
 =?us-ascii?Q?yPNr6/9djg+ZRzUWIvnjgQEUPO/P8pK32vh+8IE2B5cnMhtZX09yJbfENiK1?=
 =?us-ascii?Q?eAdPDBkrxam0yIJoFxaFpC7mYt0rntvY/6bzDBWhPSU556YE+dwUvFDRD7Tj?=
 =?us-ascii?Q?qGuUoG9i1t3+52ZKvZVEFKqBg5ma9ElfKzn0MdYI09SkOfxpG4h6vbgVrt89?=
 =?us-ascii?Q?85eK2Fj+blpdwLWLOz9GubRFNLgtnDLskvuOfoVS9bSc4G1QggwVSEsDvVAm?=
 =?us-ascii?Q?u/RfW00RbXkSd8U8OMt9wsxG/7gPi1BU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QyHHL6IzlNqXJxBFaxkQpqjhdPnwj6jv/lHqm11rxT4e5kY69KFHtsDVQVrI?=
 =?us-ascii?Q?//z/sB8D8xl6o4fvRH3wPbTjIA9vWIS9tRKcxdZ9RGoFblw81GWpsazYQZc/?=
 =?us-ascii?Q?xyoPYWRMhLjzFoYaP2P3mecrguN1zRBCqXoYyvEDlYX1EtzhBMiuADtZ9AOQ?=
 =?us-ascii?Q?IBp0Hr0TgI4CEZq0mkf+yqgAC+dR1u57xMq32aoEP9e4IEUEtQjG6tEfP2aX?=
 =?us-ascii?Q?8oNBhxg113GIQ1zP32orQ4Z/VML/zBSUUem5zXys3sIgkGClIof+y55HIMNw?=
 =?us-ascii?Q?H6v4pwQxUNNbo0vA3TDB2xpxou92E7jso0PP0HMZohOrOIfqaw+01dWRnmc/?=
 =?us-ascii?Q?Qf2EgMxkrAkGtWwG2iE+zO6NFNBKln0BsVB9Gyf49XtJ7CdaEm4JB8EDEEl3?=
 =?us-ascii?Q?VqOG9UsiHv5YGVcTEnr5nuZWDhTcEFAVvZH/1YSsVrjKNkwkUM/KOeaF+3+A?=
 =?us-ascii?Q?ju+gpvydnD9Aa6GVxjrmGN3NSx3MlAFp4qZxbSVjhqZDLNIXJrO/U1HZ1JV2?=
 =?us-ascii?Q?ya1vjYQiDXZyyJ9TI8ijj8ZSdYUvRgJi7gMd63HvxjdKvPUhqloR0hweny70?=
 =?us-ascii?Q?565td43kvTyW88FR2kUQ1L2u9KoC1aOjpdDfKwj/OoTqoSbtHgRsk1KIRh/7?=
 =?us-ascii?Q?Xg5gq33wGal74LpxKUGC6ElueimgHleUU3fa27IC4hoMeRtp8t4i62erqYmk?=
 =?us-ascii?Q?mO3wWvsPWeGEWkgiFwVrvGdxp0CpEakRdFArddeqbhX65eF9JtNNUdfRvp6q?=
 =?us-ascii?Q?vReO8xFBAZ2tuTYV1nU8znjsEgcPoDJrEltmHK+ucZsJoOZb1glhgqQmIeo6?=
 =?us-ascii?Q?3SZJ5Ey9xn/hhBTPwCUzbVjkB3MwM4hygApHwHgyTfThLxvvDaRZsAGUhf18?=
 =?us-ascii?Q?8PvBcl96V5ydnFd6fKxRI0GQpWQHot+MItSI/Jc/nr+Qt3lqxNvRJ7fdCfqS?=
 =?us-ascii?Q?N6a1tNOEsvO9KAzz1KgB46FSEvj43NuL4jHCj0zc0aIg8iaX44t8MzhDq4Mr?=
 =?us-ascii?Q?qqwXgUFiTBlLRoHM/hH2vbpONOT1AfXNbnPp2JwY8iJW0vSQ/x8dc7bZEptr?=
 =?us-ascii?Q?MINaVtXFn48SOxW36XeUzZ3XH351FYO3rASANpiV1xOZ5SzfCc3edgdkT7Nk?=
 =?us-ascii?Q?tcjnMu0Z3ULVsZ1z2Z2lcOeJsJPe6tLsxMh5tNC0CfuJ3kI8TkHU8ro8Bdma?=
 =?us-ascii?Q?k5t58Gf3J1gnn45gikqPKS5VI6Wrmnk77zB5A3qwMxarWFNHKxTw1ZdLUN5/?=
 =?us-ascii?Q?VkDCNLvP2xCiQWjESnEIz2WWWbJGgApLNtAdenUNLPu+LhA+IWQHj81kPHYO?=
 =?us-ascii?Q?xwqcOHT97DaD2UUUwBG3Ewoz3jbrlrZM2jeasz+hwbmpXiinBRlKoZKaPHSO?=
 =?us-ascii?Q?CPKtcjaZBMs9IADKFDNIyEn+LAG7RXqcRsuSlBSGKrR87R6Lj69QOKFsePYd?=
 =?us-ascii?Q?blUqLoD2s7fCm2/yLfhpKefPzrAJZd8vn1a7hcemXyA+qN9Bd5G7adkoCB+l?=
 =?us-ascii?Q?r1u6dIN1c7IK7hPbZniODjOTsMHuPXVu3n8q13rI1Zq1e/a/48w5Lj8egmn7?=
 =?us-ascii?Q?ENlGUOkfqcygv/O0qW8VycYhgz81wSeVeREUy0wlnPYJXOP/5Lt7jNVX+kDy?=
 =?us-ascii?Q?6xaGtPgmjH1fkQmO51iDsmM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d564715-9d2a-4a11-c152-08dd71e815c6
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 13:12:57.2499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t74jR9ddMzBucMvnmqWkWq2WVfXCBZTtJlomzINZazxz85JoAazaHFk35m9bXlzH81T0eT4YyrEsgkR93Gmov4uzgLVI9BPTsSMQ711aRdpdRQICCNwuh5vR9/Ct5yNs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6688

Enable Mali-G52 (GPU) node on RZ/G3E SMARC SoM board.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 72b42a81bcf34..5c4596dea2160 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -45,6 +45,16 @@ reg_3p3v: regulator-3p3v {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	reg_vdd0p8v_others: regulator-vdd0p8v-others {
+		compatible = "regulator-fixed";
+
+		regulator-name = "fixed-0.8V";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &audio_extal_clk {
@@ -123,6 +133,11 @@ sd2-pwen {
 	};
 };
 
+&gpu {
+	status = "okay";
+	mali-supply = <&reg_vdd0p8v_others>;
+};
+
 &qextal_clk {
 	clock-frequency = <24000000>;
 };
-- 
2.43.0


