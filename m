Return-Path: <linux-renesas-soc+bounces-17112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC94AB7143
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 18:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E486F4A7C7E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 16:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7483D27E7F0;
	Wed, 14 May 2025 16:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ilPRi0TT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011047.outbound.protection.outlook.com [52.101.125.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB0627B4FF;
	Wed, 14 May 2025 16:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239906; cv=fail; b=jAD2z6oU+8B2aoaAdREhz2VgCRbU1O0y/u04cwsR0dOLacQYYp2YXl7NAmRH8/lz2bFfWh7Te8fdvw282xV8VpBNIW5zvVBwrmgzjxMSzYQwpBec1WcXSv81PUUCd5jckMO1/1Tz59Jw2cR8fdFrCdccIA1wAnRQj9uAU034BxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239906; c=relaxed/simple;
	bh=RUo30c1sup4XYyOy6eOtj4xGsl/MWd32pC3YzREQo1c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h2o+aG+vG4FO+u7Toxcu64M9DfeYUJgC3x9ja6EJ2UZxRFCUzULsQRBvnn+pjcmpdAaWKDqqNX8s5TVjyTjVq9LDhigp4NYU5H6uuVEfFhb2mHLAQ9WqXRGlKKRe19IOqW/VD5une6EchBIuOzi8NF2hKQaxZSAPqxln3Y4Md6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ilPRi0TT; arc=fail smtp.client-ip=52.101.125.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MlBejVBGYyA8dPRGmXcF4YlpUkE1pdsD19wgcMjuXHeh6KI2z4tQPd1Z5p7CTUH5Fx8HkepnbNBJTM/6Gz4xtKUwSLCKaMPCUKyGoyQPH5R9btR8NGz0OqTSyvI0wk+T1h2kQNykHWntfdUWVYircTc+l+HCr34VeEJXU0ULQmSMwDNwR9xBtNWnRrIuDiW2+SQDbKbE9XPgDkb7H4z4Xf9SDtO9DOw7fqd3/wN/k18GSZGdbZAHfHG9jc4civCY8xMtslpSus40SO20BY6vTUMa50pdG+HxKQBUdlA4/ohKfoED0rXZmnz4KmvxVHzPrTOvrGV8J4H7btBA2vhUxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ziw2Gz0QRUP8wZojAGFY0YsNNifSoZyYAv1u3g96rKE=;
 b=dSurtiKsg9HNvDwYSzubgdJRYZV9+QvYOYsFwQ6XhB8zvaf7j/ODEH+Hi+CSMIA6Ho+e6vyI8RME0b0V3bbHDnoAkFOd1yav088FnoCY6HCmQkcSEyJV3+0JHmR5qxSWJu8wZPI3c0evBZRwKN0aeIxxyBRRMXhnTFZMB1V4DQ6wrNdX+f8JbqeaOj78I/M3+ps1LrjuRz1QtNEzoC2EpLPyew02EhHbC6Rwk5nU0T5rMfNb8xPJ0qrdogGu1V9dJvBc9D25aGnLUMMNSSERSY6obEaVQxGR1tpHdrw87pw0Yp0InZzZc7NPPcZk4Wz/4qqK1dY7pztwlzKja11VlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziw2Gz0QRUP8wZojAGFY0YsNNifSoZyYAv1u3g96rKE=;
 b=ilPRi0TTkQd0WKnP/G8is6uP0XEKVL0IpSEr9xLTpasbI1fR1leSsUIFDdWJhgMLtpUdD42rTwdfuidyK9BrfRfiCJjiEF1Ok1Ot/RlxPlWYcb1BiuGdA+4LyMYBzWtJyXyWeHyBEjnE2z+GCUh4f0YNHKuSoxSlM5R/cK/bjbw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYWPR01MB10520.jpnprd01.prod.outlook.com (2603:1096:400:29f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 14 May
 2025 16:25:02 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8722.031; Wed, 14 May 2025
 16:25:02 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: renesas: r9a09g047e57-smarc: Add I2C0 pincontrol
Date: Wed, 14 May 2025 18:24:18 +0200
Message-ID: <20250514162422.910114-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::8) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYWPR01MB10520:EE_
X-MS-Office365-Filtering-Correlation-Id: d14d0c43-30ac-4cfb-1006-08dd9303e0b7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oZo/eCB9QUdTrPJqiz3x9aUfXwNhh+f84N0sQYhadGpB+RwCqaL0tOtzxXk5?=
 =?us-ascii?Q?jDFuOwTVom4HTvGi0VHXW4TUpJ3zkLgob425akUYqfzYObwuzZQ+tkZlHkVo?=
 =?us-ascii?Q?SgEGBWvVCq8OvjyGh8p9A6aIKv9HcDUHunQUsPNiAZsIyFCxZdhA+7wPlliu?=
 =?us-ascii?Q?V9tJH5HbJV+J5QirIjeGNNOdhVCp4dsRGPhqxmQhuur+wrIgLP4DUt3oHEeN?=
 =?us-ascii?Q?3WOOHNpYNobyRSSam/dozgL5Df9qJpmaKby9QW+gbC89S2b5xwmttr5z+8uY?=
 =?us-ascii?Q?B0o7Z7MNBdeTHZ3W/fkjavqWKfz2iAGZ1rTW/9bnA6x8u2ET+VRIAHuxCRqC?=
 =?us-ascii?Q?kgNfGuQfZnUFnKksFyu4YZWDcHzP8zKNz1PjKlK8sHaerLjrzSnUdptNOEXJ?=
 =?us-ascii?Q?k2C9XnIT86A6/IPe9+n7bUjyYlr9dyrkrHpk/4vWenhOcgoX5zeCvitwaGye?=
 =?us-ascii?Q?7scWjmLzuUTI+4zqRUrmgH+1pPGjtwZ4FO4AEOIT3/vduHVElo3TR4RYCjmy?=
 =?us-ascii?Q?fZZkq0JYFJOUJycUZy0Ovs5KmfGIjCnzsdkK7UTsSyLMGnUwzIO0hIPRoGMQ?=
 =?us-ascii?Q?XpjdWA9RcPCeY9TsbiFcX8Xu8zD8jIS7YZkVzrSd+mTCPEkdQUkhYYGfXOei?=
 =?us-ascii?Q?LCp2rZMsDStSdfgY360trwlQfcY8znkgPUkv6agA+b4bHE+fH39yeCC7PiOK?=
 =?us-ascii?Q?4sGk8o9AuakPN/LGubDH54KKQI1TABTWw8yBJIfsii200VqacleGdIrrS1Rj?=
 =?us-ascii?Q?lqBKKenQKl+iqbxvEUmQ5oBL1zpnviZeIM6EtrkPI8RYXUyYOosuHM6KI96j?=
 =?us-ascii?Q?xx0d663rQceqRQy2IeMKdJNbvyDV9odXsr4acEqmfgatm93GIsj0fihb2JCb?=
 =?us-ascii?Q?r+lB+UMMpYTJtWrG19aljPgn8WLafNyAhT/Pibd9nOT84elHfhD4Vd8nWnkT?=
 =?us-ascii?Q?VYBpVOQQQokFIMDsAgGyELpYuj3ZmK7A+p6NAfa3ZWfShISJ80KhxecOnU/n?=
 =?us-ascii?Q?2jz/ipO5tmuOdI6UQs7tFtH4YkbuhCkEQ+FhIPUtXO1m4BqcGOnIvcL4i4z7?=
 =?us-ascii?Q?3fK8c7IXXnQHVRW+Ci5oxtfaL+fWMMXrcKUScGqFWuiuFlvDfg3JAigOMHHn?=
 =?us-ascii?Q?6/R413dYBb4vPG5gpLZmYtEwdT9F8t9kAmI/6Xfzv7TAPJ3sV13ycIST5x6r?=
 =?us-ascii?Q?HlDq+8f9KADVQ39uFmmCAXFaY79wz4QOcVb3TOQ+YzNTOGK4yzO2EaCNV/l2?=
 =?us-ascii?Q?d/HDdE63bFQF87EfQZtdiFtH1DvPPcbC3dQfCAMr32bWTEqaqjljARf1Rdbf?=
 =?us-ascii?Q?nn4v2omn0foOMdyKa3Sqm8vArMNzzkjTewrvw7Pf1XxInfBQTbPDSAwMPaHd?=
 =?us-ascii?Q?asGGMfhnE7yyfU5dyKnGu5vkOU2b5sa0lZA1/Sd0qf/w5m5N8AUDoU/TZ/0X?=
 =?us-ascii?Q?yuza2AKysBAs3jC6uI9veXeEvhkCNYgmj7zqycWZbbzkOtP7oXDa6A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rts/dDwkC9QlqMcSzASIAUbTXw2dni55Fdio2eqgcMsz/+8ozM9PMRZXMn59?=
 =?us-ascii?Q?QbOOs0fN0zJib22iFga8KLIqMGVWQG6/d8gpU2aZAtrz13stvVXFFfNer4mL?=
 =?us-ascii?Q?sISPdNClaT0XI7C1oivylfTiThIlDvMVR+4SYrRoWvIxBC9Plcz2mDIXRrMS?=
 =?us-ascii?Q?42/en9OEqnIWBDUs/ELk9sAjUQoiZB6lmu1OMUQRLKPeNPxvNmq65pd8lumQ?=
 =?us-ascii?Q?2rT0o/amDd9YDjYHCwYoykclKRMHClQGkNvojbzF8Z+5z2UZyjtsjjekX+0G?=
 =?us-ascii?Q?vfoYRkay24tIIRjg5P6AvUcJpLwZsEVulvZBmvFqckCl/RyduQgpyZBR+v7e?=
 =?us-ascii?Q?e1bkvIH//2R1vX1ZkegdVHs8/9et7RA9ytY0bCYguv3JTteeqdmyAdrqqe+l?=
 =?us-ascii?Q?NYGCdYPOv7FNjYxPcMfXigKPYz79t1Ls3GrMlEZqh2ZDKuPBBqfR+cygP1Ve?=
 =?us-ascii?Q?uDU/fR9BnR2yQJOU8uAiBohXBcaHQmVPqjxNE7g/xZVTkpBBVR4CiM5F5wj7?=
 =?us-ascii?Q?r9m6sIgAtuv3DV0vpbLp2sCzn5A22uKiSlht7WsVgMHJMstN5alQrwJaJqy7?=
 =?us-ascii?Q?LsArU7E8SJPsAKm8m1VKOsAYQWpD1VY5i+Gid6sSH0kaysVzok++D6vn4aXy?=
 =?us-ascii?Q?zWCO5dUBben4nFX4+fJ5rsOvstR009gSk0GEbQuWyFXQFCprmqIyoUZVnnEB?=
 =?us-ascii?Q?cEsu86TjeAm0vt/h6bsSftzqxpXqMbcoFLXEsiNWHnA6eNGPgcB4kaoQOGbX?=
 =?us-ascii?Q?f+RrnHgwFhr0HSZ2dsSwb7us2Q0E2cefuDlW+0rbzSlCsJmvSlRFv1CDl1oT?=
 =?us-ascii?Q?pKYWkuxgfEE9mbfg58fjDeIlQurQjwdxO7tuOcDtDwzwhCw312pdqYalEQfv?=
 =?us-ascii?Q?HvhbucJEpCbs9R6TF5yVPT3D0MiLuvYK18JnNxMh6nAl4gdl6O9spr9orvkQ?=
 =?us-ascii?Q?aiLqnPXUWIFWmkod479zqp7UTq1Ob4TeGdegWLGnYDBsl3ZAxw/mZzuawdLW?=
 =?us-ascii?Q?msI6m2kFj8hO9FukNR2oUPlBSyItRZTbLNpdik8/FJPXQWYoVy8aWqk+Ohy9?=
 =?us-ascii?Q?Umyv5nfDhKvlB0Sj/O6YP6b3rT+ce+yyYYSUHa8K7YzrOKEbxOOTSambx7Bn?=
 =?us-ascii?Q?Phs8jnXnGb9QFfebRxHg16/gYEHMnftvvBXMqrEK8yZnIK1Fx6RfIkehyAQZ?=
 =?us-ascii?Q?GDUZjvLvUZKE3EX426Db7OeaGGAAKdVdDwFP1wpLsNj7eHPJpEppQJPux67v?=
 =?us-ascii?Q?f0wZfCv14F/LUI1o6H2mkRZDWA31kwQDaQMg9lO7mAkT3uiQS49J8WzEVXh1?=
 =?us-ascii?Q?EYpAixCQ72Hu71VNOrfTQ1yWPfvYkTxuDtyAfcDy8lcojLyhiOYjzwaVscDK?=
 =?us-ascii?Q?sF8tV60TuBOuQuG5MPMXxXT/eozYGyDz0VQ/msUUJI4FRxcW+ijCEhPnCiB6?=
 =?us-ascii?Q?SSlB8YgvLDp3knmaOPCnfkKrmY9EEKRAhjB92ZU85do1NVoiA3zh/ehniQXB?=
 =?us-ascii?Q?4DXvUhqYQ513thws0CGxn4gXkzXi4CIiS7iBdmyxdALnoI5k8sJLgODoTEpb?=
 =?us-ascii?Q?K6oCGPeifA2E5tkiQKZ6HQFrHcpjRUSnDZh+7yTb+bLLJcMuAob26u2hZ0Tq?=
 =?us-ascii?Q?Or6WJkjHsF89ZEW6YAsy9oU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d14d0c43-30ac-4cfb-1006-08dd9303e0b7
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 16:25:02.4546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTJoZZNGOGzbTIzAY0yXFdZfhcvjKCLpGka/C094oM1NVHMnar8y/bENAl/Bz//ZjoqWgdOm9SZpDLZOVfeMOsCmLs7W/V/K2C254tVNuSOMzOL25w4sFHVYM+sPAGT3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10520

Add device node for I2C0 pincontrol.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 1f5e61a73c35..2454a9743df2 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -74,6 +74,11 @@ &can_transceiver1 {
 };
 #endif
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+};
+
 &pinctrl {
 	canfd_pins: canfd {
 		can1_pins: can1 {
@@ -87,6 +92,11 @@ can4_pins: can4 {
 		};
 	};
 
+	i2c0_pins: i2c0 {
+		pinmux = <RZG3E_PORT_PINMUX(D, 4, 4)>, /* SCL0 */
+			 <RZG3E_PORT_PINMUX(D, 5, 4)>; /* SDA0 */
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
-- 
2.43.0


