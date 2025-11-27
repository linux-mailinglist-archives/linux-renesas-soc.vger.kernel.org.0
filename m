Return-Path: <linux-renesas-soc+bounces-25245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E32C8E1DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FAC23B12E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CD4632E68F;
	Thu, 27 Nov 2025 11:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gg8EwxFH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011039.outbound.protection.outlook.com [52.101.125.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA8232E159;
	Thu, 27 Nov 2025 11:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244216; cv=fail; b=IiR1UQojQknENuBpmZeJDWl+ctFdRohEsPtL9YuvhK1RB0GNv2jz2/FviILXaVVaTwQT6Nzr8rJZWvyVMCebCD6A/qyBGj0l5mho0R1klHYYRULrX1Fw1h+Nie/7s38v1f+nTTahMeGHOhT6bOnAFaKY1Gu2gU1aCaCdrFgZ0sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244216; c=relaxed/simple;
	bh=RQHHoFBhk/0sdj5cB9LszeOkcnT6z0jh8QE84YfIqMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gntcVwfYbYBuK7HvfwqnQw1T63Mf97PWQ6dheIeXk3w2/Kxv5oGv5fkBfAVe9Bc+SSd+Xo6PNlUY/Zlzlx5SLNh7tOXuK04OchLT+0VhTvL5les1lZsacufFjRsk9Nya8ozvipKlHkrBPHKfByO43mR/G0Su1Sxj7qiCoE0b2oU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gg8EwxFH; arc=fail smtp.client-ip=52.101.125.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCFZsV0Hcbe4FAm3MiChVgBiRA7/GC5jk0W6iarlgJbWEchyYP4lGf9LqjE7j3y9U7+HGg7V7XwJDjWksi8MqrtQ+b+QiGOqU7K1kBa47Ihknb2c/II0lyxlMwrlFOYzyJQ/VSzfalwp9D9cPZMlFJMEAojpqeXdfcLMFsRJVAx0FtJVkCq59uaydvfJtSLvRiqd2ZNrtP89muzcpBknwM3IWrGGP1XRPpngV91c0Q54ACi14lBzhTiy+/5yXNPX+ykZxA1JESpilJ1EOSn9PYkRq/JBpH+c/JysrY2XsmVs7qVPx84iwisQ9rDLBG93udItQ8XSvb334I64ntuftg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2mvQPW8Q+tsV4Mm4nHhxq9M6RX+sG53v388AKK2mSY=;
 b=H/jZBr1YXMllb3awLGeS0Kz5nYQ4yUd8vxlQ96tyf7iU5iE3TBl99rX7we9WCH8sLlfSkJDxWvxEOq1Sb4m33zk9tip6FAiUw2npaIhdpsuR3+wlw6yLSy19E2CouRfvGGkuhS7Glzp6Oj4FF0NBUNVPn/8jqzx18SCYRYAAppi30Zyq9E/FwTY8Fqge8NxWyRhCZQfpZufdegJAYGxMvlTR++DCQi9cbMZJMH0a77D/PXZg3SPTo0bRYkUHskMcad8GO4odpMQHxoXRnEDMcMWirqi06zJih3wkeg2ke6eDi0DKeNJmQia6DI/Tk9yOtsURBOnT43PlepmRsinOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2mvQPW8Q+tsV4Mm4nHhxq9M6RX+sG53v388AKK2mSY=;
 b=gg8EwxFH67DpOHQsVT/y5hP9lLQ0IhrkwLaP57hbPjOY2hfI80e7lB9Kz5Ziqg10D01BYCCQD2i5kWhW12ETy/ohR+EJWXYAi6m0BXrBYoYDvY05ygVQvfNuRSJenCqgofzSxg2PNYPOuxwYtZasyLJZg3taworNgIToHUXTd8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9632.jpnprd01.prod.outlook.com (2603:1096:604:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 11:50:11 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:50:11 +0000
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
Subject: [PATCH v5 05/22] dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property
Date: Thu, 27 Nov 2025 12:48:32 +0100
Message-ID: <9848482be3655a9351a13cdbf815db6b556201d0.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 05715eb7-2f5b-42a9-1567-08de2dab1ee4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?o7X+mFhLwoiQI+wCf7tmQ84Wmmm7o2yvEHMmcoNX8JToq/QFuyEM5yx65Z8O?=
 =?us-ascii?Q?v+KbZecx+fbby2KPDGWx1fgxZAEJ/7r5Fby6HJGxKzxIwGoKxd4VKaXJ8Hy6?=
 =?us-ascii?Q?hJ52wr45Ii2bmOxjRCO/imS5hQKVpyI9TRePbJobqymEbRM/DoQZ6WYOtzno?=
 =?us-ascii?Q?hih6THIJd24DVU2JhgDRFXt4K6Y8Pft3NGO8FyRxLEVe1C386UcTt+4oobEH?=
 =?us-ascii?Q?MTplwGzoIu9JNWtnrgIxEri8xOx5gYB03f8Ko+5B8wiFt9d4zenaEkHdXRWg?=
 =?us-ascii?Q?juq9xB2YdasWfE2lIEHSdaIQO9yAGRqLTYwINKeUX6eqM91mNvBvcLUTJk++?=
 =?us-ascii?Q?PFcF7F1vxGxAawLvjRZ37KiPO1c4f8GuPqFa7t/ebhodjMAHGfXqPNq+njs7?=
 =?us-ascii?Q?R6dHIyb3csNuDVFcxzNIVaa1T6eUwv8epenfNgBafaIFYhXWM7yU3jD2ctal?=
 =?us-ascii?Q?cVPYTL56VVjfO7PbLdBxeU3ULvsuBDl1+rj3o3Aa2zA4kH4GPOJyJ0DjpTi8?=
 =?us-ascii?Q?8rbupmla1aH0XYle+nWI+10SGfnfg03LJnCNsZGSpQMkbXXlJqdnWkgLqSHG?=
 =?us-ascii?Q?jTIbdSkCMZ4RXo9PHzQ3tkuMHPZ0D/cPT8SocQGs4W+2n8hzFX+yNoc7rnD4?=
 =?us-ascii?Q?rLVyKQKKkVJ0HK4IJxVt+Ip2MPuYTtTX5UbzlPVfUzyQDVFOIorjDeMMN7Pi?=
 =?us-ascii?Q?K+FGhlswq/gIfQD0luAn+DA101f/HLeezeMyjINgEkkOJx4oXeswPN/SRqCE?=
 =?us-ascii?Q?ZptUZcgz8OLAjPme2HhkEzEkQcfxPlDaKi7qo9rYHnESqtKdX+Y9FzD0k5zm?=
 =?us-ascii?Q?dI8eHRLsHmUIb9urHIdZySMijq3aVA43MZuFB8TRkEFhsek3P5Jp01ohSZ2Q?=
 =?us-ascii?Q?l44tppN8eKZsW/+2wdT9H2Atxq5yLqg+hxJFRScm+CzpAFWmFOWuaarhDmva?=
 =?us-ascii?Q?lo6Kv3SEkhrsgOoRRbeArcEejAe3WblMaXHZTkc2Co7Qq9KjRoi4kAbhyPl6?=
 =?us-ascii?Q?qO/aWKeouJDuA4aCtJm18diwbEPuJiWoceRgNninmnyjzB/LHog3LHw/Dyp4?=
 =?us-ascii?Q?RIpVqDTtJ9htuBpoxPFw+Xz/NlOdvRQhRJHjLdl3MoxvzGh0HbngzYy+y+Iz?=
 =?us-ascii?Q?36Zh1TIkMHreP4w3eLcfcE+ubaCp+9nzbrl5OHcI10yrs15yUxIlfVSXQzrb?=
 =?us-ascii?Q?VK9hPNEWL/lP5WyPS2SsSGvmmYM06YtxFT7RkjbIiQ68RNJ8utxlc/b95a3G?=
 =?us-ascii?Q?sEHjQCUxZIjHXyORbAzIfvGzFLbKSfwAjvXiL/Xg1yljaH5euRnptQLIRLdc?=
 =?us-ascii?Q?YsLU6k7aFuzzrBYdxGD0Tl1E/4uMAvird7lP84r1HzjCvYUAAj8P5c3/29/7?=
 =?us-ascii?Q?MOC0gK8C7rF5MXURTmMcuJ4h2Z0i4WTZia6cGztj7/IJ+I2es17j6cvtqOij?=
 =?us-ascii?Q?wattfrgMStuv42SHJeA60Scbk4/yMkZKxoFcwRt2ow0uwdak5YM70yoXNdwO?=
 =?us-ascii?Q?mbEv8iAZZRdG4S9Lmh8pdh8YhTKatjOCEW5G?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nryHH0cQuBLWR9+M1I/BILR3RndSp4I07/e3BJEHaXtzGBpct8pWEFLR3iWN?=
 =?us-ascii?Q?pxseA0jGg36OK05ZmCg40o1K4nUkUQ1MJqhAeaDdVW/+viB/gIb/7YvDhBgE?=
 =?us-ascii?Q?moBsr/07i9ap2u3e0OYrBjH4SJdciVokXXnfubsFXlHAhdqMQ3Msi7lWm7lc?=
 =?us-ascii?Q?Dxn+dqz0fsJyESWM12mszg5seKPlbaWrRi2XzCrGqLllU6P+HVvnwGAwlIdO?=
 =?us-ascii?Q?+pIDnPo2WgEyaogzky24GGQ/FDgShApRXJniMSHiCeRX+7Z1nd8K4u4PgF1K?=
 =?us-ascii?Q?rwVzbC/IxHbL5hMu7snHvz7DEI8Qx/kgydoOey2Z+pLJYR2M43a75A7WCZi7?=
 =?us-ascii?Q?XRm8t3d5BNkI2oI6rNt3/Hv7n6scmkBKV8RXoWZhkQDYnDgy2hZWZV/HhXoH?=
 =?us-ascii?Q?lcS8D0TABczeNwEa6MyZs1JTrYXYA55uXcFTL5v5+PaN119GyVmsbmBpbcm1?=
 =?us-ascii?Q?+d+SSgYI1WWu0KczpUSoao+f8CwLaGH259I2lxVoH5CTCWg3bQ5TEkuOlofP?=
 =?us-ascii?Q?soqgjyN10m2s2CfTkRuKmbLydpzVBNWbEJcAvgid4st2T2Xsi5Ycswwt70w2?=
 =?us-ascii?Q?0CCrxpfbCAm7IGHPMtYBtZRfAcc4St9U31o/WGUdLLiqaWCvqRgfUSo6OSYv?=
 =?us-ascii?Q?LOyITfk4UR3gRFMHg/dWTNFOBzq6b0LA3pfCrAqxpuBe8gICmULhY1ePCbu5?=
 =?us-ascii?Q?uWBKBKLSGmYWbg3CxBU28SxySZfgdhPBA9kzK5BNVGW2+u5EW0u9evpVKBFV?=
 =?us-ascii?Q?NzFVdXfWkg2CbdNnJoSDUfTQGkQNf05CCsGeXRsXd5ca/3Aj9BNgUMvHCIii?=
 =?us-ascii?Q?QBHMJrec8rZv9U9nW++AXkpBmriBIeFqe9yvJQWctc4GWwQFSUl8J8G7SW+M?=
 =?us-ascii?Q?4IHeRkhQrV/qhjH7YpVNkq55CTLHs6fnEYQH8SLM/BzXGV/PJwyWUuLG/Lbj?=
 =?us-ascii?Q?FmzTOM+XHfYFLlbF9YyajP48tbwP5gIolOYHsGr/j/foIR2RM0+7QhMSLQ5d?=
 =?us-ascii?Q?U5v2epnp/ofRsuSOagoob+8YIds43k6oKgQeY8xe246mwLW565XwKmBXU0Dt?=
 =?us-ascii?Q?sLVoZlOd6jtYt+UB0yQzBOIGyhAFd13//W1nRfyx8ZTL4hfN78cygDzTetFO?=
 =?us-ascii?Q?1ddaCUFp3W1hfjPDhS3nB/K2gzkszK5PUjSF0zOu/vwJCyjVChVhasC9QIX2?=
 =?us-ascii?Q?aY0SDl5i7xVyF6GJFGJHJtbUaNdMvmuOJmpCuXBQNul9jNTW5FE9aNEotWtd?=
 =?us-ascii?Q?55+lA3OQ3OqTD/2uWRQZimp0ZFgFwPhmKO69aDzFFroaLD5B4ot3qw6Xl2ql?=
 =?us-ascii?Q?accOfbHolhD/o3e+nSHnv4EmXZKoB7D6O6KLo2JFJ9CwVOW16KvjSU2LB1uT?=
 =?us-ascii?Q?qaWlZkl9B2BT2dB6efTRBYsueFY7bEd9Zh7FzeuJMRH2WiL77PWJRrNZDVTP?=
 =?us-ascii?Q?Kkn7R5QoWnH8FnK5ODx/X03q7LXtYmH2E9CoBFajB0erX5bHBnzQSTY5akN1?=
 =?us-ascii?Q?/jsXEQ6jsD9EfeP4kfgmlN9D2DI4Y4j8QRVuk4ifEgOdQoIYj+uL+rlpL4ZT?=
 =?us-ascii?Q?5u0ju2em6Vh9Zd0w5IzkCfShxa5HusWNXQqvisc+6nEDnps4BPr2rUWrdR/z?=
 =?us-ascii?Q?UyNEi8MYOIbpSfkTqeqJQMk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05715eb7-2f5b-42a9-1567-08de2dab1ee4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:50:11.7552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hc8BDWPSIAiADb5Yzvm5yuiB0qeS4BA5rNuFiD/Lqh+DiVL3PAgENCPzYASRVw4TbwgWTiU0LB7KdF26UVO35G5HkbRfXIl5PyBcAzIFXe3NTuan6I3fNKMunRYqPx1U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9632

Add the '#mux-state-cells' property to support describing the USB VBUS_SEL
multiplexer as a mux-controller in the Renesas RZ/V2H(P) USB2PHY binding.

The mux-controller cannot be integrated into the parent USB2PHY node
because the VBUS source selector is part of a separate hardware block,
not the USB2PHY block itself.

This is required to properly configure USB PHY power selection on
RZ/V2H(P) and RZ/G3E SoCs.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes

v3->v4:
 - Switch back to v2 implementation.
 - Improve commit body.

v2->v3:
 - Manipulate mux-controller as an internal node.
 - Improved commit body.

v1->v2:
 - New patch

 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index c1b800a10b53..7ed0980b9ee1 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -37,6 +37,9 @@ properties:
   '#reset-cells':
     const: 0
 
+  '#mux-state-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -44,6 +47,7 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
+  - '#mux-state-cells'
 
 additionalProperties: false
 
@@ -58,4 +62,5 @@ examples:
         resets = <&cpg 0xaf>;
         power-domains = <&cpg>;
         #reset-cells = <0>;
+        #mux-state-cells = <1>;
     };
-- 
2.43.0


