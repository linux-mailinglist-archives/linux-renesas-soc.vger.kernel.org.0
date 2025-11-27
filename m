Return-Path: <linux-renesas-soc+bounces-25247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DDAC8E1FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B9A13AF1DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E35332E6AE;
	Thu, 27 Nov 2025 11:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="WqBYvwTc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011048.outbound.protection.outlook.com [52.101.125.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DEF32F74B;
	Thu, 27 Nov 2025 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244233; cv=fail; b=D0yCXbqEES7ftHacsfN8cev8niMB/XTeRtH4a/M5lEh4nivx9ZLgW2Uva6FbYPa9nbxDUnT9BuqxVeE6LwlLUWSt1+kg12gXpH75gER8G6uxcPRNmS7f5p3l8GrY/EcnFkQdOwoIEW65jkh5vhDnrBuzUGS76dMsFrsZZ1jRDVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244233; c=relaxed/simple;
	bh=bbNT8STsze6SawXI1n81Bq1OAqcPErkY8mBXYL634pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ai/il9Vmy8tv9jHF3apS+B8MmgYtwFY2rAuve/TpCfWu1Dk+9QI2wRUDUZxwP4TB7UcKj+Cl7Eeze7Apqti7aAdEmXmldpSgFyI+YazQd0kEpgv3XJMZQgJwPUFVgyw5jIWpJ+RmGW4kgvVuAjIBsGlZ81snWXYM7m3D3xRQWXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=WqBYvwTc; arc=fail smtp.client-ip=52.101.125.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oa88wCTHh9ufQbeXCylPBGwzdgaqyVkTin7lvdJIeQMKAdaOBaYsKdZ66x3Jss7y9+fB2bHpP5EdMfDml5eI4yvj/xOJWHwqJadfRbSyexkqMjgQVQxIjIXhGNdDmbD7VJowggwGPuH0yPBLRV+QPihnY0mCEx183QXybrkC1waBgzcSif8/TFrIveGEX9yttpZhbWNOO/cCaQdTYjVgrcq9i9jDgkMs2TyJ6wCmhwcTrEWzyR4l6J92YgOXP8bcQXO/3qb9NwzH2UaEWZ5K0jG6txZ7TJsSABWjSL8a/KhAQuWsqbzez8+5VZPG6RDjL3XhqcQbmuFRARwsLCFKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mf/HJidrywQ4GGlhYtB/mtxogjsQ0Z5JH+Hhh+BHcBs=;
 b=zQcWd35JKrRSBES+pjs0u3x5qf9rvPlkyUFat97ASsS5r+kxLA8on18IuNJOH00GKHP79NZ30+RUmQH5AwOR3hfOWxnA20jOTN/lI9Q/M7W6sYsmqcxN8pXliWUUzRM7w2AdRMLW1vnm/e9Jm0BmtLd+2yoQrss3Q+6rf7GhF3onSAf2/kuMIHWWq01QzAYjDNi4OlvbVLee05vOOfgcvEhDp8TvL6rnn3vMygngo3M0Bj4341/1Dgxm1E99RpvBoHc+BK+Kt3YvjXYHYXk4rmtshk2ccF1Dba9RC3xkK6z1YHejfWib+Y2XU7y4X6zIAc7Q4uaLV76oU8QfXAG6Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mf/HJidrywQ4GGlhYtB/mtxogjsQ0Z5JH+Hhh+BHcBs=;
 b=WqBYvwTci8cZnfveUwlM7sj7RZ2kercotSTdo2dQm0pdtiaOaUky9NpFQaWD/JSaAUQ2j5BuvA/jDtAv0ISmJmvzZJLP61g3EBjZVOvNjSYIwIoFK6ej2zjDuTw6lyx9V8H8xM/xZMtI3PKNmtWqD8xmApeMIqn+i2MeO4+L5F8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9632.jpnprd01.prod.outlook.com (2603:1096:604:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 11:50:28 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:50:28 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 07/22] reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
Date: Thu, 27 Nov 2025 12:48:34 +0100
Message-ID: <67741663acfeabee6b0b2b5de14a8a0bf1a31ff0.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd752d1-60cf-4d03-2448-08de2dab2917
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UE66kTMk7c5mGYn2CTyYlb9HTvLCOGyhfmo+D4ilpEmlseSbCVpGeHkGmlmA?=
 =?us-ascii?Q?DXbgBk2ylbFoeetw0aFSz43cI8FdCJi2vsWMB/CRppp6eltzlMGcP8bTDEvR?=
 =?us-ascii?Q?X67F6+3/s8lOqIVmMwa0oU9Shw+WqD/pYU8LE8Fd0pXL0vyLUnlp9JwD0yZn?=
 =?us-ascii?Q?reCe+ec3ZwKHHSzIHvwLy0l3g5YZZqhepLweXWm/k3gkMThPCkdmB8fGZp0L?=
 =?us-ascii?Q?F4JPnT5vfNcovpVbrWB8VfXZ5WXiTkO7zfSia0dtB8CwiVHHG53VdypuCbR4?=
 =?us-ascii?Q?hwASgzOeywbPjeB+IR3fNzBdsbbYd7giy5oEcjy8MUim7CO3CNt6KBvA5i16?=
 =?us-ascii?Q?e0T74VZqQXXy0J/iL0aH0MmrscnYr4rqZRFx3EMnG2SsxLA8XPg3rrWA9J96?=
 =?us-ascii?Q?AplXVk7YWKZxB88C9ctBK96Tsu3oUKflGWs/gpwOBweNS7ILxtfbDsgDYOMR?=
 =?us-ascii?Q?X8+pjjC5r5qouvcAbHfd6aA25mEZW36gANd1/SeF8zJMLqKqB06h8JmQrS3p?=
 =?us-ascii?Q?CDzJZNtw7HkF1Fd1viwVkLgJOaEzNxPg3M7z9A1aiWPgUUZJ0/2vMqw7LMG8?=
 =?us-ascii?Q?KgHNYtQ16HHU0FyJIIq/dcLHaVaIgKYmji3j1o+snpunpb1ILjmu9GXKXrFx?=
 =?us-ascii?Q?HETxaQ8lqVrWTsYlcaHw3M8lKGxTlqe52QGZSVb2Sgxmyx6jl+pK8u36Ej9w?=
 =?us-ascii?Q?WhH4afMdfHsPzI9CqpsWvjJneeu5bEaajHPjRTvMuUykumM1aFYYA7c/pG6/?=
 =?us-ascii?Q?7Zw8pDC95UuMOKvLQ6nYqo2Opf3kO4x3f7zCIzGmlNgZj1CcJPjz1aW/JNNT?=
 =?us-ascii?Q?Yg5xGbqPmbT1YUhYlLVmcTIGSRVqn9BAZGLn/2MDWccrTU2cSIiyqLEEaG+B?=
 =?us-ascii?Q?eGhOIedcH3GDRNmxdvSI/xhEJl+tC8ksQPdC/zzLVpLlSoerAuM4t80jcar5?=
 =?us-ascii?Q?ZNDLRk5kQloH7oxOVhtbZkum2CpM8yI6rPVs3ockPq7ssnsCiRMdQsjzatbA?=
 =?us-ascii?Q?uTJfBDnfkmdkyqp8pEcQMcSQmThiZowKLqlRJojV42Us6JncJo7HYa2aSncv?=
 =?us-ascii?Q?wXAsNC5jJQB1DtyhcT0OlkfPYpZUh18ytaktnHVYzhh5vfbCwM0p7VcrMgeu?=
 =?us-ascii?Q?A4EHaNnLfvCtm3mufcl+jzrgYWrxCbX/QeYfn1UNmhHyQmrTOrOImEuvzCkK?=
 =?us-ascii?Q?T0Z4JFPimWsrjGfPAKPf5atIn6r4l2iQNshMGUeiYkPwiXYCvm1TZ3m3HP5a?=
 =?us-ascii?Q?osQ15g4UuMiHENgZeS0LPkoJ+BenPAYacF6p6EEp9oXeqghAwJmSzA8P3aYU?=
 =?us-ascii?Q?3ibgWWMlGRvtHY6WKgknuO6sQm0+yr2mL0KWHpyQNtSHVKTbybzcZ3UjMqRj?=
 =?us-ascii?Q?2TeQ6cHlmySiaXMrJsizkqBAydMgBecEVRY8a98ALKk42cKi9pFx4HowkhPG?=
 =?us-ascii?Q?pqer+Vcm4aBhzFLWzzdwSqH+VTlEJt+xYxG1NlBs8RsgffskCBV0oYWJqiNu?=
 =?us-ascii?Q?0Oiv5b1e9XzkiXglA8QDDVJny1CD5YPgrWkJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W8l8oXFl8X8K8U9VqfbNURChNqi0uJXguav5T2wFDg8GUacgPAKvvvo7kgh2?=
 =?us-ascii?Q?5tdRl4QxvQC35vxZxcO8xl19ekdWj5o7poJzt0bluB1P93cuHOs4qC4i80am?=
 =?us-ascii?Q?Yw9c+zs52/vQclA3n/elBqJsEc6Oy4OZ9tZaco0e8jgOE+w+wvOCX8eoIBsM?=
 =?us-ascii?Q?t7YWRRMlH4lBZN1ocEno3N1fS/BsTwKb3E0JBtV8XFOPoW6V+MhxCpt6NgdR?=
 =?us-ascii?Q?Oe7nH25xls+qGo0hdZmi6aW8wQXDCE874DUjH+xfTuXpTD3U9IJ6XZ2u60Go?=
 =?us-ascii?Q?zIZ6n3qq96c18J0HJbdrHP7qumrE9f/VVbqIn0gu6susTifGVHeMyb1T7dV0?=
 =?us-ascii?Q?I2v0Ayio4MzNP/Tl4vtnqmeGen4iHEA71ZbUJOrDBtHaom8S7AQCmXTht07h?=
 =?us-ascii?Q?218NVm+h39TP1b5c4j9WSXSRmtbN3ZYWZjQRBHe86R5TnTZa2CAbv8mBP1NW?=
 =?us-ascii?Q?sgDYf/PRdDHWoHPM6CYBLZJ/RNtCdiQxMOeHgNN2x1miUbNj0iXPyxvQyG8a?=
 =?us-ascii?Q?IqRTJ1Ay7nVL3pAU/yCggLwjDAC32iUIVkmkhdH5YSseMNK72Jg68sr8BJLa?=
 =?us-ascii?Q?7rS42zyDwy5yuLNetkKs30SJ0IiYzNtQD+YLjqcSRNZRFp9+53KZKCFu2d7B?=
 =?us-ascii?Q?wNvDEXCgUMQIcDDMUmgv09xOQSNRTP9i6L0Z5rZ3uBBGCrryTYzAtg+30tH+?=
 =?us-ascii?Q?xSGAxUS9K9vzNyJIow7vsFq2v0/RhdlR1Je6cMTu9cy5ansc9piYj3oHqZUg?=
 =?us-ascii?Q?NS8d5w4AcTcMn4C/mBm+iovBHE7IpotxVrQNSWYMZtCedZxiTsy1QOnDX/uc?=
 =?us-ascii?Q?ia1hYfZWOp6KaPW+OUOUDr5KPasHP7uPDkhIlGCbOurhfkku4MpYmrQGodce?=
 =?us-ascii?Q?8LUJsxYcnpRoB7nqC3iUm6WYXQyQm+0Gh62A2P94zNWcNEtn+F8tXoRrXANj?=
 =?us-ascii?Q?jD/pH8WdeDJpzaUouMxwzanP/BN2G2bp9KniA/Zob9VpYDaw09Ilzl/d23Jj?=
 =?us-ascii?Q?UjBITdSINk5keXt0PERO6MeExF8C9CyJqY/bJz73UpQlvnM5evDOh3T7Mlv3?=
 =?us-ascii?Q?Gss7CXoAKK7pyDOLP9ZkpCFx/GTYIgfUQq9sH6c97hTMWFR6zqUKmKOVcegX?=
 =?us-ascii?Q?TpreuGZbC1OEyZ8125feB0F7yyPI86inkbEG5rXEBq7yv3wPAak04/iRwGY3?=
 =?us-ascii?Q?HMFypeeyqeOIZF5Inx4ba3ABwIA8LaEiyP2gqA9sfWSz6pYlgwfPVKHAedTe?=
 =?us-ascii?Q?byQJ3fJBzU2dC91EmSQP0C/THQVDPad9ik3jcaUJT7B6A8P/rB+l/LhQW540?=
 =?us-ascii?Q?C5iuKjvmStwPlFPppPD00N4mvZInV4pLuOqozXzWOvjPOrSR9ktQjaBz8IQO?=
 =?us-ascii?Q?yR3WrnRUmWZ+iVm8i3d6DGfd5x7VNkubHydQa+euLOR7DUEmPfS4l5BNjspl?=
 =?us-ascii?Q?mDFLeKdIZXmLucWwFo/skaLdbFFC/d7lF9c/xGUq+bh5GbA+qtg3ACG30Q29?=
 =?us-ascii?Q?PLls19EY7u0kEs2JbWJDV1Mgbe5HxzUtCX+mKu1hr1KdnbRJiOMaDKhMps/P?=
 =?us-ascii?Q?4kLKRBjQgFJNR/1Wkpjga03sQsXW1q5E4VZh7rmNR9k4JSz7hNPzXqx57q2k?=
 =?us-ascii?Q?NiBi/GTyDWFIIDFenAA99zA=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd752d1-60cf-4d03-2448-08de2dab2917
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:50:28.6385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkR/SCnXYGRmPfMQaWCvXBYMazG/fsziTruc4qVhEa36B/EFuQ29CcNcqzUt9jzbh5qzP2n/HswtKMIWdWoAVlMiSozBGn99sfNsXOTFe+v/pUXJJMiv4yIfajmj2DOG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9632

The RZ/V2H USB2 PHY requires control of the VBUS selection line
(VBENCTL) through a mux controller described in the device tree as
"mux-controller". This change adds support for registering the
rzv2h-usb-vbenctl auxiliary driver during probe.

This enables proper management of USB2.0 VBUS source selection on
platforms using the RZ/V2H SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - Update mux_name to "vbenctl" to match the driver name.
 - Updated commit message.

v3->v4:
 - No changes.

v2->v3:
 - Use __devm_auxiliary_device_create() to create the auxiliary device.

v1->v2:
 - New patch

 drivers/reset/Kconfig               |  1 +
 drivers/reset/reset-rzv2h-usb2phy.c | 44 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 6e5d6deffa7d..d86a4a0766b2 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -257,6 +257,7 @@ config RESET_RZG2L_USBPHY_CTRL
 config RESET_RZV2H_USB2PHY
 	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select AUXILIARY_BUS
 	help
 	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
 	  (and similar SoCs).
diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index 5bdd39274612..15447a4f091f 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -5,8 +5,10 @@
  * Copyright (C) 2025 Renesas Electronics Corporation
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
+#include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -14,6 +16,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
+#include <linux/reset/reset_rzv2h_usb2phy.h>
+
+static DEFINE_IDA(auxiliary_ids);
 
 struct rzv2h_usb2phy_regval {
 	u16 reg;
@@ -104,6 +109,41 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_ida_free(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	ida_free(&auxiliary_ids, adev->id);
+}
+
+static int rzv2h_usb2phy_reset_mux_register(struct device *dev,
+					    void __iomem *base,
+					    const char *mux_name)
+{
+	struct reset_rzv2h_usb2phy_adev *rdev;
+	struct auxiliary_device *adev;
+	int id;
+
+	rdev = devm_kzalloc(dev, sizeof(*rdev), GFP_KERNEL);
+	if (!rdev)
+		return -ENOMEM;
+
+	rdev->base = base;
+
+	id = ida_alloc(&auxiliary_ids, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	adev = __devm_auxiliary_device_create(dev, dev->driver->name,
+					      mux_name, rdev, id);
+	if (!adev) {
+		ida_free(&auxiliary_ids, id);
+		return -ENOMEM;
+	}
+
+	return devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_ida_free, adev);
+}
+
 static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
 {
 	pm_runtime_put(data);
@@ -162,6 +202,10 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "could not register reset controller\n");
 
+	error = rzv2h_usb2phy_reset_mux_register(dev, priv->base, "vbenctl");
+	if (error)
+		return dev_err_probe(dev, error, "could not register aux mux\n");
+
 	return 0;
 }
 
-- 
2.43.0


