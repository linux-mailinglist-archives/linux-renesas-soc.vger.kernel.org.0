Return-Path: <linux-renesas-soc+bounces-24960-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8265AC7A7B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:21:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 48D9A362FBD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1921346E55;
	Fri, 21 Nov 2025 15:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vIXcFVqT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011050.outbound.protection.outlook.com [40.107.74.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421AA2F8BCB;
	Fri, 21 Nov 2025 15:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738004; cv=fail; b=U+yTxgr6IT5FmDUUz0BZmo3admuw9+2TCsFUWAoDPR8cg6/G4NjnRdyZJgwFtAKJMq1NG9bKpZQfAi53GxmrJU9a8Z7zTG64SnODe09SqM4EpbIHmLwkfsBMGdcFlNLrqnoCcfzRsT22GZW/nTGsTmP6h93BB+XWA3C8RHMUpws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738004; c=relaxed/simple;
	bh=bKQ9B3+lcAq8t2OghvOtVq7a+bz56a5n5msAN7gsrA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kMglYTolte8i99YrTaWa3cwxs4Oub6288k30SUmBRayqKqrujF3WVahv7BUx5zNIZnFn4NYRzo9W1FLMtjZWczmoaZSStliID93pXhf0B3ufH3WTPaV/m8+JtynFC5PPAJEwPssR0irr17SJuHKKlw43iY1ijsNtoEJ3yEUwMKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vIXcFVqT; arc=fail smtp.client-ip=40.107.74.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUbcUpuieJ2Y28r+p1CeDBucPJXqzSjsbIiPW54/sR6lDP32/+oir/fyiRWKVkDOIYiJHOTuLx433NGOKM6YXyL6+s0Zen5o7hMGvgdkaoxFiQx5+O7L/Bh2u3hH7kwqBTxdnwhHZEGtOnfeZUK+gIec3XIjZNFdSc8ceSpi8o2W/9lWFAETVIivzn6NgDaHhJVul7wp3TI5x4AXKrrVB5E8TOXk6NyK6TQNMP5ysjS1RzOChSWpeAVsbYLG+UUypMnLNiAu7jWvpdjBMm9eWdmv/xpEwdEHHHNVDEOLI/J851qqDGhqdLDjsG6e199feWdPqTCHhBiPrz6CvIEXOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgL7BjrFVT7B2vOEQVLLeKN20VeSkhthY9S3Lsu4erk=;
 b=LBJAxMBtQX2EnRZTqtRRJDAizqhdYdWRiZZiX2vYXkwKlnZtzyvTCDVfnCwp/+WfGiCZRWFydix88FUjLoDBmDt+AssJjWKsXR01r2QvP7UIaNsKa3UjkjwYbsYbMK4RIFXU1L1NIqLKHLA5rR9I3jTqNR4cqije+kBC3eRqGgH6zKb/+n2yr7jq4iC2HmVpW8GUkuyiQdEXxtRfvnn5DPTr3Pv2tYEjaFwTHo/NtPGHo4rLpEI94QAnfrfWNxOmIUFouJXstS0Zh4wd1wOGu6H3qhiuLHmOOSaSZ1PBLPF518OP8v9PrzPR1agSu3QvPCpbQALv3EGd368Gvf0iQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgL7BjrFVT7B2vOEQVLLeKN20VeSkhthY9S3Lsu4erk=;
 b=vIXcFVqTp6+M7cZTLM/Yi452/QsAb2pmz1bWbZpNP5qXWf3Ww80wy7BhdijUMrZvg5mvc9Dizlgb4AMVmZf8PusMpaNanSVS9Va8d/wYGot/M9dDx2EPa3iwLMa4/VNpFx63L57dzzulJ2CxgTr6eYvw1vmjIIpRtQbkv5dHbbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:13:19 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:13:19 +0000
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
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH v4 04/22] reset: rzv2h-usb2phy: Keep PHY clock enabled for entire device lifetime
Date: Fri, 21 Nov 2025 16:11:53 +0100
Message-ID: <802e701277795faafecdb965b06a01ac09da9e49.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: 972d8108-5406-46d3-3eae-08de291080fa
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0KilWUInZiarZCD3+ioVSfTwAXkFA5gq9/LAnTKNwdd5w2aACVO2Hl8f0mQw?=
 =?us-ascii?Q?nxutUUA9PgzncvzvDGARhjJSnHGgGTTVLg8wn8kzl4L7dsedOP9lrKuisStT?=
 =?us-ascii?Q?4HyTcz2kjkfhIYx0kirzHFGLlrOW7xGDJYgs5K6MMEOyNh8rO+jJp8nCOckz?=
 =?us-ascii?Q?W1vLleDLrTG+RyqWBxIQoYaI9OU4hQFEVzoL1FwcE3GYd98MEHjX9k+MzUD5?=
 =?us-ascii?Q?Tx5IibMPk6ETQmiFKFsQ6gaqBthElMcWNggZuTJL3DDuRN8DK01fmalCnniO?=
 =?us-ascii?Q?ta/PnL7DzjDykv4lKtSShdyXxDJSSBQEOH1sU1iraex5GhInwtdiMx9iwy1D?=
 =?us-ascii?Q?2H/xd5KqNRInbkbHprPS1mpKKMdGQjZ5SEbNhrz6B2xWsavWMb+UhooITlAw?=
 =?us-ascii?Q?Z7V37W69kPe9YsakH/ETF5NE7F0OfDHnC0BmgxO/sHnyqnV+YGtbDItQn03H?=
 =?us-ascii?Q?JLzT2NNxOgGPlAoridL8FrVP7r2S5kCOgAFj5dc6q6VaqGAPpKisLOm4uMct?=
 =?us-ascii?Q?yoz0oHiLf83Ub/vnwCOd/4LDDudM1OTMtBowrVDf5K8gQY59Z32feQCrrZZW?=
 =?us-ascii?Q?JG5Yog37g/4qEfnGipDDpkkLulNMpWhWQES/WK+xBfzpFd9O/MHIkEubmwOH?=
 =?us-ascii?Q?Qi4zwv6g4yawjkOEvGYD5aG0/9OrKLkTfYickGOEN2eIeFgKEo1eR2kv9QR8?=
 =?us-ascii?Q?hHsc8qiLcPK77Tdq0RH3p3kMZst8+LDtP3t2suiLm35Ti+ESB27e7wbiPWMi?=
 =?us-ascii?Q?LYEICVjIqGbugQvY5qyw/eX1Fbd+OHouG5GcoAUQRDoAu/UdFhbOonjzSdgW?=
 =?us-ascii?Q?CKLVM1i68LEfSxyi+Zlwrg/txo2Qf/J/bzMQ+z/VwAonkHslYcZ0o0YH5VKC?=
 =?us-ascii?Q?iQbuFKpkbI53HVKM0sYuqQebmb7PSa/7VkznJz/wm2zY0WJr45m0W5cE6q0S?=
 =?us-ascii?Q?n747/JbR67Q4XK5YtLoyno5TG4X2vYHJj56oyDEnuiW6vV6fyNWdf0lWtJ7R?=
 =?us-ascii?Q?rkWQwyHkuyv8HRhmYGOGk9JG1yJyO63YCo91it4f+mfAyKQakkM4Q9//tvwY?=
 =?us-ascii?Q?RpuiC2uAsjKyzVfiEbyK8uALJDsw1oXm0p7X3cRBxoA7l1hgEkRMojvTa/fQ?=
 =?us-ascii?Q?bo3OxM1khxYH4k5/YiDzf7PVfkI6CMyW+j2NGdZ4sQ1DRX1ImqE7Enq4QLF/?=
 =?us-ascii?Q?jzRP8NFEXJCj/atzL+UJW5HqZN43nQ5aX8MPB+1c0KxqtMHg1zeA7PgvsyIW?=
 =?us-ascii?Q?EN5N1uXdngEGZoxrYom4vmmaGOPdftqg8ldeDVAAL+vOtTLMEf9lnWDQ6ice?=
 =?us-ascii?Q?DSTiFO6FxMaQpO+pQJF3oZx5Pf40mDhpusEBG5eBY9EP0XcJJ7vizOBUsNZS?=
 =?us-ascii?Q?6S3gOEnOQMXYU2TOIm9lRS5j5YbLbkLj6BV+EVi/c0HMwDuPq57zvQ5Cq9qS?=
 =?us-ascii?Q?IeLX9iCa2yOPa+FzPVTFiAWgY1IvcObDp+K3og7gSPt+rG7F5dw4QYKB1a5e?=
 =?us-ascii?Q?zIPkcZy9IGU3fVVJENgVGwSBj11CQyZnFtqI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K7tQgwX5+9nv8F5NEowOcPQ85ocMCO+w1mdhBn61vxousMsMD4YXbHNa7W+1?=
 =?us-ascii?Q?sLgNA2zk1viL1PHQKtfuALBxR/YuFEOCeVubjbUUbfmc3W7a/I67skxHqUsi?=
 =?us-ascii?Q?EkvIv4r+0BDtMsD1P8A4jpEyZ1U4QKAJWLU5bIPn2C1Rwg1MB/+8uNy3oj7g?=
 =?us-ascii?Q?S7cs/dxXSBGxc9582WU2fcqRRQZ4RpoTxoqeKa36T0wB8tbehRJIRm7oPURJ?=
 =?us-ascii?Q?q381wKzpANBL49eyHco9R0aIcJz01+y3DTqug3AYy3I8d9R4Hd2f3ND3tjJb?=
 =?us-ascii?Q?qWRPGdWkqGa+8vCExq0ffUItpUW5eONNl5InqB7LEDrA5DVnMtg9nbFFBMH3?=
 =?us-ascii?Q?IASQjnJ5MSzQ9JWO6/zo8gjeHXE3S3Tqx/NveCRolj7MzAxNv6dUF28UhsPm?=
 =?us-ascii?Q?R4a1w4FiJJu2w85a7IJorrhURioQiNFqqftboMmYtbjWoSlFjRkZnoXn/2+x?=
 =?us-ascii?Q?32/55qmo8QGmHYUB4XO1mzNX+kRt4YCFADFpsZlm/3CZVIstEYmBzcdtg5J1?=
 =?us-ascii?Q?6Srk7xexU5/zXAyDEOD2pmnxY7nld5oL7l5rRqFKpSvdt4Ky1wmZgCXihBSM?=
 =?us-ascii?Q?NivnHzq4ROlrHJOWNJUrYOoCBEjuTQ1uZPqshc3Q5NEiTvZaAy7vCA/yNbQG?=
 =?us-ascii?Q?j9n81sqxu7vCwCLLtj2zT9wHu1+fHA4/t6572SoEvMNTv6iZgLVELrl3cLpr?=
 =?us-ascii?Q?+l6gVel4fQBFFZFT5wXcUccSOtwDSlbXwSM6uQWd+4HbeYP1MW5sK8KkvuEy?=
 =?us-ascii?Q?kTUAkaFTTO/SPu6B3EBp9LClaruzGpWwTYcGxCI4M0+Oh86PK6/kl7dZjx9y?=
 =?us-ascii?Q?y4O5w67f9XRzlYfz/u7XO7XslYEYNM5bIp9dLZjIKxGwkeskmPB37FHKx723?=
 =?us-ascii?Q?80BoHgIhuUARziyxgjUMkEUV3rvQ9EHerZQU5XpdWuOXjGpIp8Vd28JU/GWn?=
 =?us-ascii?Q?Kdtc4imT+abdhUGf1ZzB6zIJiZBCsDtOUMKD/WcCMea7X66oySm+gcYw3Yi4?=
 =?us-ascii?Q?kzA8QCAKoWCfHotiYOIal+soRPR412RSzmEb2PhO2OU6aNyK2QaB8TMXWlsa?=
 =?us-ascii?Q?5IOhEi7GSfHEpqLwgAh/QjZkr+A/KOIupakB0MuOT2i1mqJ3NicAECY7SFAS?=
 =?us-ascii?Q?lwdZjZ/qsp0GBJ9J9XqJgApZxj7cbAfjqoPoEb775YzCULAnSxB3cNbxwsJ8?=
 =?us-ascii?Q?PEMxtxJmnmCa0eiYn0lumFnC/rVHzEXNokklCl0/S2BR8LYkdsH+I0q+wQVk?=
 =?us-ascii?Q?sU/tSY8eaYZaM+y/9dEYsU9x3nCUwKuD2uHQianoN7KzRexnNuLYyjK3wjdu?=
 =?us-ascii?Q?Ol6gbp2hyrDobZoD4K+UtD5IOea5FX8FOicCFoMD/I+bPYj8I+WoPN30VKhL?=
 =?us-ascii?Q?ZKILA4QShMw1z5ZW4zyTk9+MA4DeUIXB/euY1srDhtPp2gBX0hTggDaerWac?=
 =?us-ascii?Q?6WkZQfAEMW7vYNfJrY0SMTHf6DSL5QYM9th0RGQyw8aH5IXHfYZp9dSM2jK/?=
 =?us-ascii?Q?WBPYnT95sTmMCgJhDwhSaSpJCamq8ZDe6T7l69IR0rDNO5wXwFRuQi3rjmAf?=
 =?us-ascii?Q?wRFa2JhM3XK3esMI6qHBG2seTTB3t+dLDME09Thbt95lC2/pOIVwz8YPOXQO?=
 =?us-ascii?Q?du26pf2b5zxgupwV8VoxBMM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 972d8108-5406-46d3-3eae-08de291080fa
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:13:19.6714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vdiBF+MMdAjaLbzB3XnC//flNNo6iUU3eEJXugH72NOIh+Xl80+CzywKboIgy91+Iyv5Xv6DEmHk20buwrdvZ1j6I2Xqw/kn1Fv8vo+AeWlVdr8SSRVtmqpnipcQs3uu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

The driver was disabling the USB2 PHY clock immediately after register
initialization in probe() and after each reset operation. This left the
PHY unclocked even though it must remain active for USB functionality.

The behavior appeared to work only when another driver
(e.g., USB controller) had already enabled the clock, making operation
unreliable and hardware-dependent. In configurations where this driver
is the sole clock user, USB functionality would fail.

Fix this by:
- Enabling the clock once in probe() via pm_runtime_resume_and_get()
- Removing all pm_runtime_put() calls from assert/deassert/status
- Registering a devm cleanup action to release the clock at removal
- Removed rzv2h_usbphy_assert_helper() and its call in
  rzv2h_usb2phy_reset_probe()

This ensures the PHY clock remains enabled for the entire device lifetime,
preventing instability and aligning with hardware requirements.

Cc: stable@vger.kernel.org
Fixes: e3911d7f865b ("reset: Add USB2PHY port reset driver for Renesas RZ/V2H(P)")
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes.

v2->v3:
 - Added missing Cc: stable@vger.kernel.org
 - Improved commit body describing the removal of rzv2h_usbphy_assert_helper()
   from rzv2h_usb2phy_reset_probe().

v1->v2:
 - Improve commit body and commit msg
 - Added Fixes tag
 - Dropped unnecessary rzv2h_usbphy_assert_helper() function

 drivers/reset/reset-rzv2h-usb2phy.c | 64 ++++++++---------------------
 1 file changed, 18 insertions(+), 46 deletions(-)

diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index ae643575b067..5bdd39274612 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -49,9 +49,10 @@ static inline struct rzv2h_usb2phy_reset_priv
 	return container_of(rcdev, struct rzv2h_usb2phy_reset_priv, rcdev);
 }
 
-/* This function must be called only after pm_runtime_resume_and_get() has been called */
-static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
+static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
+				     unsigned long id)
 {
+	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
 
 	scoped_guard(spinlock, &priv->lock) {
@@ -60,24 +61,6 @@ static void rzv2h_usbphy_assert_helper(struct rzv2h_usb2phy_reset_priv *priv)
 	}
 
 	usleep_range(11, 20);
-}
-
-static int rzv2h_usbphy_reset_assert(struct reset_controller_dev *rcdev,
-				     unsigned long id)
-{
-	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
 
 	return 0;
 }
@@ -87,14 +70,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
 	const struct rzv2h_usb2phy_reset_of_data *data = priv->data;
-	struct device *dev = priv->dev;
-	int ret;
-
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
 
 	scoped_guard(spinlock, &priv->lock) {
 		writel(data->reset_deassert_val, priv->base + data->reset_reg);
@@ -102,8 +77,6 @@ static int rzv2h_usbphy_reset_deassert(struct reset_controller_dev *rcdev,
 		writel(data->reset_release_val, priv->base + data->reset_reg);
 	}
 
-	pm_runtime_put(dev);
-
 	return 0;
 }
 
@@ -111,20 +84,10 @@ static int rzv2h_usbphy_reset_status(struct reset_controller_dev *rcdev,
 				     unsigned long id)
 {
 	struct rzv2h_usb2phy_reset_priv *priv = rzv2h_usbphy_rcdev_to_priv(rcdev);
-	struct device *dev = priv->dev;
-	int ret;
 	u32 reg;
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret) {
-		dev_err(dev, "pm_runtime_resume_and_get failed\n");
-		return ret;
-	}
-
 	reg = readl(priv->base + priv->data->reset_reg);
 
-	pm_runtime_put(dev);
-
 	return (reg & priv->data->reset_status_bits) == priv->data->reset_status_bits;
 }
 
@@ -141,6 +104,11 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
+{
+	pm_runtime_put(data);
+}
+
 static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 {
 	const struct rzv2h_usb2phy_reset_of_data *data;
@@ -175,14 +143,14 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "pm_runtime_resume_and_get failed\n");
 
+	error = devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_pm_runtime_put,
+					 dev);
+	if (error)
+		return dev_err_probe(dev, error, "unable to register cleanup action\n");
+
 	for (unsigned int i = 0; i < data->init_val_count; i++)
 		writel(data->init_vals[i].val, priv->base + data->init_vals[i].reg);
 
-	/* keep usb2phy in asserted state */
-	rzv2h_usbphy_assert_helper(priv);
-
-	pm_runtime_put(dev);
-
 	priv->rcdev.ops = &rzv2h_usbphy_reset_ops;
 	priv->rcdev.of_reset_n_cells = 0;
 	priv->rcdev.nr_resets = 1;
@@ -190,7 +158,11 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	priv->rcdev.of_node = dev->of_node;
 	priv->rcdev.dev = dev;
 
-	return devm_reset_controller_register(dev, &priv->rcdev);
+	error = devm_reset_controller_register(dev, &priv->rcdev);
+	if (error)
+		return dev_err_probe(dev, error, "could not register reset controller\n");
+
+	return 0;
 }
 
 /*
-- 
2.43.0


