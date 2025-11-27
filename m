Return-Path: <linux-renesas-soc+bounces-25254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A60EBC8E233
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6CA234E683C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:54:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 086EB32ED20;
	Thu, 27 Nov 2025 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CaMGgdfR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011012.outbound.protection.outlook.com [52.101.125.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110E432A3C5;
	Thu, 27 Nov 2025 11:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244294; cv=fail; b=BxvhQkkkVC3qwvacx7pwdFyUO32pwfKIsCpr88kQTMKbW3WEBhOXBjzEgaga043K3PgkA0WnLTmU8RgQhFHnzHffcGsKntURe5mZnnRAp6ZyvJ3tHlwUiwEtWtoAMtRpbAI2Qn+SMnPZenO6elL7nrLyE1msNmjJPDt6TEO3QwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244294; c=relaxed/simple;
	bh=LhhHYGFptEOLjVDEzJFuR3LXmyjps/a0f9TByTNG26g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dDF3V+kOJc0RavbwmQMSd56rML4AOgrmpdTsn5em7Pxx4WZfQkxdEtGq2gzwUrgVioyMZUJtSQbNlQEKeTmsM+D1iNN3UFlRf27iI+3TZ5Sf9aiQjXSE3SqC3d9o8yCvLT1X3yQAn1cctDnjZX+iNVg+mh4hImYUD+gfdNy5ZpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CaMGgdfR; arc=fail smtp.client-ip=52.101.125.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkShnJargxZWJlONyyY5IxW8c8caSAIIFVWrS4crASlse45w9R+ayB/mM4gT4uBsUAU4f9Fa3seMpm859hxB/d2M2CiF3yc0eWehJEkP0MK1W4oaja6n3jlYLZj9XzkYR8+Y+u54TAGGv+585yAHP/7M6nA25kUTvrOwYCt0I+KK+gFJJKGQoUE8+EwgTiz6sAJl/aTGDLTMTKPiE/FyoWDTyqlXMjweHD9oTgBYh2Gbzl0HIqKXYKvSj1DJJnn7mKdiwqiLjrG9d5GII4Anc0rngYoxafr24U7CRP2lZ1O6mKTGCh7dNK9kDrli1ziBieRCvBvqDrwH9556RoMszg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utHL2oPszsuEVeYNYID2/vPPy91znRIRJGff28vmzWo=;
 b=tkK1OLajj3a/OqhKSzkMPYaFFKtWp0QFxIBKn9d2RJwij+AfyFk/bUho2C+JgtLtVgbGyMVRBHDUY1KI44hOMENSiuIqym2aISeTTvY5pbHZMktShWNo25CTY7A0JpUd9qUUsNwAajkaCRUGw+P+1Dt9ufPypRXG0nP/OGjRSQdUQIYM9YGX30j/8SpWtD1UnLOXKsB2y5h+WXoifMMguM0efmFLWEOZYDa9/uuju9+y6FmBhKpUosuxy2lCJCwqpOhZ6u7oCBKmWRetVpuZKqc11yHI2pjTaaBrzY4Ir+/At9rjyl5N4QqiXYtUqYnDh10knYQThyUfBFyMqpk05Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utHL2oPszsuEVeYNYID2/vPPy91znRIRJGff28vmzWo=;
 b=CaMGgdfRq/SSLqkSiD/P3UDQM1L1GcudjpY2Buiq7CuBcYugCpUZA4roLqgNZ1RNtcjDu3VKEow7KCyDlIFCl08n45y8TB+xZUIp625KQBDP2k7bULD7VnoU0rVLtmwfqAIJMftTtyz7tjFyDT3mQpXekp9jLvMk9zbizsFZNOA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 11:51:29 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:51:29 +0000
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
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 14/22] dt-bindings: reset: Document RZ/G3E USB2PHY reset
Date: Thu, 27 Nov 2025 12:48:41 +0100
Message-ID: <6f2ba4b376b0ed5652dac4729d9c020d2059eb70.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB15042:EE_
X-MS-Office365-Filtering-Correlation-Id: a8b047bf-82f2-4efd-261c-08de2dab4d46
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yATO0kAjckb9SCA3/bkeaeZvmwKsmIV13sR4hyYfjjYSUQfEMK56Lm3htUeA?=
 =?us-ascii?Q?qQkobcnRRCbsKrK/IrnyJL6Zb/wsygbI/ZNYNtCz9ey8tybWLVq5uu8pIPmT?=
 =?us-ascii?Q?iyPhQ73rGQax0jziPHW1dnxXJHg2W48OcyB4jHkCnfoh36Pm6GOCO2F3HYLB?=
 =?us-ascii?Q?A8nv+VA50kv9Wr5v6y2+UmMcOhb1b4sMGgZfTEUEg0qIOtVqVJTqsbT0AtOs?=
 =?us-ascii?Q?4eZCkBSC/elANciDz11/LTP0eSN0RgwcvcTSTO4rhwNxpAa5E2WvqTWP2w13?=
 =?us-ascii?Q?kfA0aEUkj/KAMwpLlpyObqBSEr9QGmixNUj++hUvu9av+inWk/1n17j+vl9P?=
 =?us-ascii?Q?eqW56rPueCoWY+EhNcStsXWfr8cI8sNfgAwnrDct02uHyODQ7yj7sXKmRQ7f?=
 =?us-ascii?Q?i7MpSJo2hfLSNP9fjjE0aEmdtUEuafXdZEt7G/Kqreh0K0203n5C7G4sZkiv?=
 =?us-ascii?Q?G4yfy+sTEdSsUa9600qRPbEQr+xSnHHSqXqflRBR5w0hPFxWPIHgFsPg4bLI?=
 =?us-ascii?Q?NjGQX9/wsiB1EnlmU2cxGlooYcz+zRi9LLKB/rGUpuuCw/k7TxU+0ANQaCJs?=
 =?us-ascii?Q?1sdxqUxZ2RJAZBU79c/vGbDwwKW9F4AURHbkTXvXTN44Up73C1Mt4thpfwWF?=
 =?us-ascii?Q?3i94lOMEBsVuKpM3aDgjTIBR5SOMwELYgASmkVY8Hn8BRF6V26wU2h25uBS3?=
 =?us-ascii?Q?QsmVOEcEEEPxWO1bGqR9A75YficAOq4y8hZdRZCkweTDRGIjSIOSzhtxLER4?=
 =?us-ascii?Q?9E87Ba34tV5y0Z8eZBYvAgwd6lzHdVdCxRMbCVOlhWHI7teiq7fjeXmvEhP+?=
 =?us-ascii?Q?4o3KwQPh5BkYBfN4gNMe3/nJf3zMBwrqk2Wn+6l2JWzuIdf4JLh6w04ICCGR?=
 =?us-ascii?Q?TJTxLzDO/tY4cjW3nGTKmT06wKmOGzSjRAtzoFXYvFl9Ddg0nTema108YnTL?=
 =?us-ascii?Q?ESlodD4DtoEgXB0DzTMH6a+3B/reZ3K0W4crnMy7CKCbguIQXuViPZMxkVqL?=
 =?us-ascii?Q?fK/hUvN5ruIB0+HGvVTeWY5tGvF4tpszuTYMg6kKZPbLcJzMZFE8VOb/aerG?=
 =?us-ascii?Q?xW3bEmwprITWMpl34ik0ppdJb+4CUP5h0hXEOwLcKYI6N1tbltO25s16v2DP?=
 =?us-ascii?Q?y1Ybdy6pIECedpQgTGSzjNF/h22RisjxBgp25uc9JCnGbR/z0mGZb4SiA69s?=
 =?us-ascii?Q?uR2UZdgEE8Ra57FlvSDAk3B1L7jeA8lUpqzgMnOhKmhluchlv188kw+haEh1?=
 =?us-ascii?Q?S9hR3RTio6B2sBOY4OZOUbtNd6XRvxIyCKzycPnukjPgumix1ISwVX5Q1fRT?=
 =?us-ascii?Q?qt6+UVUsJ2c5rG5vY0RC9txmF2zHNH9ik+9cHZs3Y7aWXIHCiLETM3z+0pmg?=
 =?us-ascii?Q?PkhnC0500RzX3bRbAs64MedmDkiTI/cskLUSAlrxJRZApxei0tsCued0GdOd?=
 =?us-ascii?Q?6E8Z+Ld1eDPuIBW3yobDwhUDKSFJ+353M0YTil5LOmZC+ExuZ2JtJ9Sa352Z?=
 =?us-ascii?Q?YtiuzBUuW9oeesctKFZ94QilF3JnT/vxu6yX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OFjH4IaDoVeubfHOKMl2cg4W+PqYwfmRTL2d8DIDq61eLJKwroNeLd+tniI2?=
 =?us-ascii?Q?7uWuTnKwMYTwAQnQtttgcLan0jDHmodlg3Mj7oXED3iRC/X0ctii+ou2nXCD?=
 =?us-ascii?Q?vhEPEsbHoq46Saq3sHpCG+SDTyD6OP+pvg5gfkktPUwemmHDgVSUG1rypTEf?=
 =?us-ascii?Q?uXh8fqiCs9/KUwZgiXjyRRN+vCnlAl8HR0YU6MJrTL3IgF3GIcIGHCbt2Myt?=
 =?us-ascii?Q?2pY6xVMaBhIWjS7NXeUyXlpfMDNlqTTvejdvz7nsNI9GJBcvMiefB/XFDFqk?=
 =?us-ascii?Q?eDLdZJkn24uFGycyEfYORIX4OOuaeGGNkTCCAML6qpKuncIULgUci2JfGlRR?=
 =?us-ascii?Q?l9aCp2hkwOBOpeMhGzTGbjAxhz7taTFDTBnWVxHpj4aUlka7z4BDKEGFl4C5?=
 =?us-ascii?Q?CUxCE2ZlV4NvFQpji8OJDSwq0b0SdLIQQJArJOlTGEzDqwgNw0fh4Zb1XW7k?=
 =?us-ascii?Q?0BumTjuFiM8+i2h7Xj4xjWiIhHDawycZByEuHjtCtpsNSgvyFh+oB1vP2AXr?=
 =?us-ascii?Q?uI1riwwv39YKi2p0wrsL287IiiUuaYGtNQt1R3IINTlN1Lue+ZIoaQNEt9Rw?=
 =?us-ascii?Q?I9elSM+LeMgQB37RCEiYj4pSYsyYascGXunGsDtifTmyXP988vDyVAn+L0sJ?=
 =?us-ascii?Q?OmnEiyeGHCYLbRLgJekhFjIIR0OrMt8Yz90NU5JBxDDGR15pzeyrsV5C4iaO?=
 =?us-ascii?Q?VOD2WbsG3KShGMdagDfLrTNYLwg/b8s4Oxu2HmX1+SPT/QpJv9Q3rjuZ37s7?=
 =?us-ascii?Q?MIHaKlrTK9nPUw08vf0rvI7HKF8jINlNuRrnyqriWz1ViegCtEizWoeZhn4e?=
 =?us-ascii?Q?LKNNR9UdwGihWjsqyCC3ROY4/WCkYqnCMLjz8q8gxSCSNb+xJLpmZgfoFI93?=
 =?us-ascii?Q?m7sTvc/g9GiB2OsUs5XP4AZDZoZ8D3HqrMzddcXSeYcwQio5iWTsEnpoGl/b?=
 =?us-ascii?Q?AixUX72yt5qD/As5or7DszV63H1ZiqtvLctD9enlTV9nA7FaunNSHcuAhDKx?=
 =?us-ascii?Q?8G9cH5hEC+c4JrERGYRqdb5UVRei6Ngm+qV+DEiMAEJvoyj701FIFyFyXeqt?=
 =?us-ascii?Q?B3DiDzKDapDzOs3/hIDvZrFfks1p/QGmcLUhWFKiGFcLiV4WntWvZnCZ9uG/?=
 =?us-ascii?Q?3OE9qn3RLTr6cdlCqxr3QJZMaqvk36QWVKRici4nok4g71TJH4DiySI9IlSw?=
 =?us-ascii?Q?sPvElOw+V3/u6wPZuVKtwb6dFoxI8td8iD6FEVEgup15fqK4Xyqwx1rzML8Y?=
 =?us-ascii?Q?I4Kgdk86WYnRd5bNcZeqnUvE9/uEpfTgrDBaG2mWmms4fFLxrJwYMj30VHH9?=
 =?us-ascii?Q?CpCnwHMfUR42yPetDhV6hzgQvRbEekAhR12Plbt2Yj/1qrETeSZClWf5RMFi?=
 =?us-ascii?Q?21qOjmuZR2ggdCYTVwnjavTEU5jHb3c2WoXzeIxSWaPagtCWZggTJT4GineY?=
 =?us-ascii?Q?7HnoBzWM4tOzLZBJQJ3+1E6ZJC/K3DuWUW5r4JhTYw3UkAXRqj/37XnLsmP4?=
 =?us-ascii?Q?JLwKzW6bZLfOJlMR2G3M9rMSI+2C7bXJ6jYvNPZ9ylCOxJhnT4V+tn7EUod5?=
 =?us-ascii?Q?OpBZ2MjxSIgHUX/HGVWEb6ig7PL/QSbiYpTD2W99uCIh2mOV/rsLGLmbrG2J?=
 =?us-ascii?Q?c6OCxwbbe95QITBA145IydA=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8b047bf-82f2-4efd-261c-08de2dab4d46
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:51:29.3404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53Qh7eYKxG8QcWxvSH4jV/ieaFyIHEcC6N933ONV3xaT/Ub7cDRyD2YRjHgfo6Rgh6flAMay6JGFz9DQYKBs7blQM+9PNOWc1qcHWOeWMUHlr6sSUeLCjQsu4AcmqMo3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

Document USB2PHY reset controller bindings for RZ/G3E ("R9A09G047") SoC.

The RZ/G3E USB2PHY reset controller is functionally identical to the one
found on the RZ/V2H(P), so no driver changes are needed. The existing
"renesas,r9a09g057-usb2phy-reset" will be used as a fallback compatible
for this IP.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index 7ed0980b9ee1..66650ef8f772 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -17,7 +17,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: renesas,r9a09g056-usb2phy-reset # RZ/V2N
+          - enum:
+              - renesas,r9a09g047-usb2phy-reset # RZ/G3E
+              - renesas,r9a09g056-usb2phy-reset # RZ/V2N
           - const: renesas,r9a09g057-usb2phy-reset
 
       - const: renesas,r9a09g057-usb2phy-reset # RZ/V2H(P)
-- 
2.43.0


