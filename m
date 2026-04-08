Return-Path: <linux-renesas-soc+bounces-30988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOWcNtMx1mlZBwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:45:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E06813BADDA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6BF513030AF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78A23B5306;
	Wed,  8 Apr 2026 10:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nROnLIOT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011037.outbound.protection.outlook.com [52.101.125.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7373B2FFF;
	Wed,  8 Apr 2026 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644794; cv=fail; b=Fr7MAX1Ym/o/rQKznC2vLdA0Bp739SHLmV4vO6oc68yGKmcfPyS9yubsxTU+zQdIm2Yku+smxUwNBipvgidThNuUyNpeEkao4M6HWUl1Y0DykvYJqxGjNiPC8tyHNWW6pUkEKlyVCgVZMeZ7ZYS4FrqkTAWd67q8hrsccKVckvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644794; c=relaxed/simple;
	bh=wXhHq9Iy7NawL6gGgbBm++VpTR3OduZNX4dSMOd3Kzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ahevtZOLIYilwQo1oQBt1jddpC0QJHLPo61izO6uabOsFy2284PUkBm+1ZQ3gQztxmzqQ7YqJ2sAuYYu/mtctf0pjLVE64ObNS0SizTpZz23YakYFEqbL25bEBqO1PFj08950DRNnqBSTVX7GschyvUhyufol8ina0lbdnFylXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nROnLIOT; arc=fail smtp.client-ip=52.101.125.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DOP+oDlDr11vEh5W3HRyYJruljPBULs6UIAeZLLc+bRwBV1Va0jwrPGgs9HE84bxmgedJeZr65vlykmSPskeAk4lRHawD0u82ZKzsUf1pgPDFT4lM1C9dw399pGVLNmHIv/EEMhgi34DwUK53n/Xamj3YCtB+A5JAS/SKZE19qD8+l1+cfr1LQ+VvBpo8Fvt+CFoV4GVckB/buoyoDgsEiY2D1BGe2DUoipe7RU0RsAK5R3PJDcpQFPqRk3ppQrTlHKNCC9DXseP4s7jx5sOom1wok/O7hy06j123TW+6nG3mIeO+Bag27lxE6hJ2sYBNDl2gdCEVXv9M095y5usSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fFXLgmmHE67LnLfc1bSx2ts1/CcXoVYmK3in4O0cWw=;
 b=qS5j0lPKcF6lPMjHz133URwveFZE2MKf6lWobzByABmIq8lYzi6BhsredhM+JgY+0kL+IDb5GJ3Re7nWpt6kaOd0lJoF1YU7y5V9Y0W42ipnObA8WMhpRWilN3cqAo1xlJmj74rRlbiY2y0zU03Biwfk3oQNf99VoviznrLRA6/N8M6NwDkhFoODHsOy+0NjqsBHY2FTnBUzeyfiQYQIOO/KqYIDk+xRyO6x4pxuMNZLin30TEKGsambXGu9SfhiPUb7Jx/Kun/2wnLbPVhhLYMcrmnFaFc75fmFN83hjmhqOccpPDCSD1JpcL/ZMk65+HkTxHuszR/bBCu+IIBRvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fFXLgmmHE67LnLfc1bSx2ts1/CcXoVYmK3in4O0cWw=;
 b=nROnLIOTO69IH6QaFMa0TAgiv2RUBCUc0mUXf4cRcrBan82nBGQVsQjuixbQBkaGWId2QNhfpw/Om6gI0hL10wHS862/ELXyfI/v1+wjfZSX988VPZhNfkf904fSafDHru3p3bJPprfOjxxnBMZPXihAQN0Eo8vqsXnMnObvcbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYVPR01MB11293.jpnprd01.prod.outlook.com (2603:1096:400:367::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 10:39:50 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:39:50 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v6 15/21] drm: renesas: rz-du: Add RZ/G3E support
Date: Wed,  8 Apr 2026 12:37:00 +0200
Message-ID: <11313371ef0b31cb5f014e171ba0d9868eb0710d.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYVPR01MB11293:EE_
X-MS-Office365-Filtering-Correlation-Id: f391e65f-34c4-4be3-6e7b-08de955b290d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 tSZeAd4hK/tmwT7+ZlIaMVSGC5gW24oi5YGbvSUwNL3vaJLAcnotzdc5Nq66CrpHaS140TnNkiYVZwYyRcsl1iia7VxRl60hBQDr8CiSHOJVnZLLG+AbJr8FKnQKVVT9OBhpnZ+7vN1OyYhZjvMgXuUEya7T5dRqdbGcg5hwqB4CoGBBbR3bZjvfYsCxPhKxmtqgA0+7q7hpcIngaw4v8dNFL8S+8yJBgky4IkMC/52bsISnOT5hvfwo4YUzv8/Uod3mVtTw6WGJB+5eBTHCPpotDJnvawf5aWA5jE1c8dAyzcJyqGcxzZVx7UKyEk5X1kZjT0Q77Q+M5v5A6gdtbxrtHfCwHkSRx3ooX0ZHf8DwB4nZ1iGR3YKMWvZQvPNFRrz39VpJkJB91+yrEMz6W/6pK/CU+FybNbmVBn6buupo7D76s500Uk4DEus+uE5PeEFRTwmlP34PDRO61syU4s4m0frzOjMkdG5lEiDMq+lec9hUwMNMMavgJAoTF0i3Xh3ioyk+c0tZ/+3ynuIfcEudponSHf6WNcmojHNZcpEWIPvVZ60WLrP+R8dMcbjgM21fFLNQlqhwcVgSoGWlRVr/kEvbqjxP383Zgynq7aOhdTv6je9O0fRSR1Z1ymBJFN1GfcMi2neK1epFGnUosPoXAWToFcXzd734hZeCy42OCvv5AJI2PzOrL18V3PCfUQJ3ik5aJqk6WFsLSKNMURKaB+0ukKcyNLBoDzdARVO2q16Hz8blzhcu/AYcQJKhTXZ8/KOBiMAgSXVHs/wnlVvXo5QKVVIQQ5iKsmyVsiw=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?OKcy1hgriK3eakJ5WjpmMRiBNxs1nN/KL+pglWfoCS5nAsN2pZBQLSIcppJx?=
 =?us-ascii?Q?SQhm3P5gxCkVesJ5MJTNPOVbBIMazrPACVWzMVqv/kG2gyKEg3vRbDWFkaxq?=
 =?us-ascii?Q?EA0VaFV6hpJgGF7EmmH5ZimHa9QpIMQPS6Cf4FHVKSEtPchMVzlqOcrWC8U4?=
 =?us-ascii?Q?p61XAbFgJ2Qs2YoE2ylaBOne1SEeWytR+pFKhjxCj9gjaDHf7p2cTXAtALlF?=
 =?us-ascii?Q?QvgNPkTrWvZcshMUKCK8Fu6l4jRUU0aeDA/q/GdA1/nWb4bq8gkdj9Su7USN?=
 =?us-ascii?Q?6/CdzxJI0Rid09M+dwJu9xOFIMijOWh26kTcZdDYpWDDy912B+DZgPR+pb1w?=
 =?us-ascii?Q?dXNzRxMMc3SYTGVl7JM3ne2tYQGRR97By6A4IRnZhwf/Wlq6dvLZiXP/1dOd?=
 =?us-ascii?Q?tZzID5ofiVWBT07lMHQXTv/tepCWk1rfqXVWFGiBacmANa3KCWvFqhCYklh0?=
 =?us-ascii?Q?qZoUSi+ToZBURXYQ8QVzKIR0VzKr8MnHd3pIHjAmzh/VYp3hW9QX3JiUG4MH?=
 =?us-ascii?Q?y0vcnV6Xp4KeE+z+V0z2qfahCvqhFu2aV3zfMQtCe07XLAX57Ai/J+NKzOGs?=
 =?us-ascii?Q?6xMUqqepvRYMI9zDbiR0GuPqGai1Ijl2LunDb0kNJsQYVRc2wXuAXkiXAuzl?=
 =?us-ascii?Q?kH+aBeVsd0tAQwnz67hdNqFgB/PaUbpWhrDVGMwz1J4ZgUTxLUtRzKXjqOcb?=
 =?us-ascii?Q?094wIPrDTGtaueCZBBNBp80OJupcnejeubJ57XAOTVJXftEwEYjYX2STr9yG?=
 =?us-ascii?Q?57hl4h6hqdCRCnTn92wOSIyzeQJr9kzbnKPo0DAaLnIM2exXnlvOx/vQIW/p?=
 =?us-ascii?Q?ys/7DZxXhRmZBYFJynSMcgi9zf3iW6b4OHzkoCTfmmIXHhYvqVugrp84BOzb?=
 =?us-ascii?Q?LuZ8nDOylyckcNRhlzQ/3bA09DLegv3eULHCeF7MaBZOrOPkM1mx9Xvn35jm?=
 =?us-ascii?Q?838twsEQK79xmelWacnLHfvsVEdX2J6o7I+cfd2w4sZfUcalZjJUdTK8ZsY1?=
 =?us-ascii?Q?8J9ZyfOxGODhU7NHF7NAI0TBmLmzUs8n1zA7Wjx+w210jUgLuHp/4EOfeWVx?=
 =?us-ascii?Q?M4SRcC1pyQn8UaSAyvheo+bxdypEAcsbSm8DTBPx+hf1Lwuxj7q5sakUR+W8?=
 =?us-ascii?Q?LZxtQ0BwAWsH/puX9k2R3TFTY5ZGMlKzqHkI/vnayZYxEv3bTmbmMMz9bht1?=
 =?us-ascii?Q?Bcx6lpmewQpuw1vtwyTf2XbN+HF647Ngk9NkNcWqU+EDPxkDBjBx6SZnthe1?=
 =?us-ascii?Q?bIMCfOfdd7zwccGnkPUaLjwHRK/oC443H3FVkEC4xnDFajA8uHsUqThCukhU?=
 =?us-ascii?Q?J4T3h+FFquJc+wlthjgosJJGrbH9QjYJMS/pwU8rZUrIOhdNs+GHuSWuoOcX?=
 =?us-ascii?Q?CPoPEV9CZ7q3y5993SgoSyzREnZ/EfQkiwjNwv9J6wdsmoSkrSSauNBIOCEy?=
 =?us-ascii?Q?5J/GMeS0B8/oENj3d6xqS04Twybb0c/BFwzM5pQ39I/sKSrOimjNHJQoiRus?=
 =?us-ascii?Q?kmEj3AvGRCFXW4DAKQpKL64AREV70o/uvnGI3tbQQajFz7nzK/K/zD/mnQo3?=
 =?us-ascii?Q?943s9LZBN07tZ5L2RxoAbM20KNIZR+4exz4vKgJsNWjqMYP+C0Hd7rijY/RG?=
 =?us-ascii?Q?tn/jNVJTTbJskOGRmGFxgVbA6tMt+GaghJGcyerpP9jtEItz88vvcgTlJyoU?=
 =?us-ascii?Q?/jH8AZjASZYVbJUjL7HvAgezETtJJB00l9UW3WM7gVeLemcu+ep5zFyzwJG0?=
 =?us-ascii?Q?EK8bgzDZL6XxA3x/43fmZGP3osAyHzuIqpwmHYAVdwi2FKoc0o7E?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f391e65f-34c4-4be3-6e7b-08de955b290d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:39:50.0246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8kz+U5hBLEtMtJBCvDk2aWPA0rOUYlOmXm59qPqEx73PTTpcM1hgIo7LQ0Ub99bmQ0EP4b41pUG3Pj06IFCS4e7SYvkiwYgUWRWVWp/kIHBPiUS8q/bx2uAYlYlEo0U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11293
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30988-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,bp.renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: E06813BADDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
Processor (VSPD), and Display Unit (DU).

LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.

Depending on the selected output, the correct SMUX2 clock parent must be
chosen based on the requested duty cycle:

 - Index 0 for LVDS -> CDIV7_DSIx_CLK (DUTY H/L=4/3, 4/7 duty cycle)
 - Index 1 for DSI/DPAD -> CSDIV_2to16_PLLDSIx (symmetric 50% duty cycle)

To support this behavior, introduce the `RZG2L_DU_FEATURE_SMUX2_DSI_CLK`
feature flag and extend the `rzg2l_du_device_info` structure to include a
features field. Also, add a new helper function `rzg2l_du_has()` to check
for feature flags.

Add support for the RZ/G3E SoC by introducing:
 - `rzg2l_du_r9a09g047_du_info` structure
 - The `renesas,r9a09g047-du` compatible string

Additionally, introduce the missing output definitions
`RZG2L_DU_OUTPUT_LVDS{0,1}`.

Introduce `rzg2l_du_crtc_atomic_check()` helper to store the routes from
the CRTC output to the DU outputs.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - Aligned ports numbering with the bindings changes.

v4->v5:
 - Fixed RG2L_DU_FEATURE_SMUX2_DSI_CLK to RZG2L_DU_FEATURE_SMUX2_DSI_CLK,
   update commit body accordingly.
 - Added features field documentation.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Instead of using clk-provider API to select the right parent clock,
   based on the outputs. Just set the correct duty cycle based on the
   output, this reflects at CPG lvl to select the right parent.
 - Updated commit message accordingly.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 48 +++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 28 ++++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 12 +++++
 3 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 18e2b981b691..834bc6f77ec1 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -64,11 +64,32 @@
 static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc)
 {
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
+	struct rzg2l_du_crtc_state *rstate =
+		to_rzg2l_crtc_state(rcrtc->crtc.state);
 	unsigned long mode_clock = mode->clock * 1000;
 	u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
 	struct rzg2l_du_device *rcdu = rcrtc->dev;
 
 	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
+
+	if (rzg2l_du_has(rcdu, RZG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
+		struct clk *clk_parent;
+
+		clk_parent = clk_get_parent(rcrtc->rzg2l_clocks.dclk);
+
+		/*
+		 * Request appropriate duty cycle to let clock driver select
+		 * the correct parent:
+		 * - CDIV7_DSIx_CLK (LVDS path) has DUTY H/L=4/3, 4/7 duty cycle.
+		 * - CSDIV_2to16_PLLDSIx (DSI/RGB path) has symmetric 50% duty cycle.
+		 */
+		if (rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS0) ||
+		    rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS1))
+			clk_set_duty_cycle(clk_parent, 4, 7);
+		else
+			clk_set_duty_cycle(clk_parent, 1, 2);
+	}
+
 	clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
 
 	ditr0 = (DU_DITR0_DEMD_HIGH
@@ -248,6 +269,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
  * CRTC Functions
  */
 
+static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
+				      struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
+									  crtc);
+	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(crtc_state);
+	struct drm_encoder *encoder;
+
+	/* Store the routes from the CRTC output to the DU outputs. */
+	rstate->outputs = 0;
+
+	drm_for_each_encoder_mask(encoder, crtc->dev,
+				  crtc_state->encoder_mask) {
+		struct rzg2l_du_encoder *renc;
+
+		/* Skip the writeback encoder. */
+		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
+			continue;
+
+		renc = to_rzg2l_encoder(encoder);
+		rstate->outputs |= BIT(renc->output);
+	}
+
+	return 0;
+}
+
 static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
 {
@@ -296,6 +343,7 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
+	.atomic_check = rzg2l_du_crtc_atomic_check,
 	.atomic_flush = rzg2l_du_crtc_atomic_flush,
 	.atomic_enable = rzg2l_du_crtc_atomic_enable,
 	.atomic_disable = rzg2l_du_crtc_atomic_disable,
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 0fef33a5a089..b6143c1df583 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -51,6 +51,29 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du_info = {
+	.features = RZG2L_DU_FEATURE_SMUX2_DSI_CLK,
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 1,
+		},
+		[RZG2L_DU_OUTPUT_LVDS0] = {
+			.possible_outputs = BIT(0),
+			.port = 2,
+		},
+		[RZG2L_DU_OUTPUT_LVDS1] = {
+			.possible_outputs = BIT(0),
+			.port = 3,
+		},
+	},
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	.channels_mask = BIT(0),
 	.routes = {
@@ -64,6 +87,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g047-du", .data = &rzg2l_du_r9a09g047_du_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
@@ -74,7 +98,9 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
 {
 	static const char * const names[] = {
 		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
-		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
+		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0",
+		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0",
+		[RZG2L_DU_OUTPUT_LVDS1] = "LVDS1"
 	};
 
 	if (output >= ARRAY_SIZE(names))
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 58806c2a8f2b..4a4ea556ed3b 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -20,9 +20,13 @@
 struct device;
 struct drm_property;
 
+#define RZG2L_DU_FEATURE_SMUX2_DSI_CLK	BIT(0)	/* Per output mux */
+
 enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
 	RZG2L_DU_OUTPUT_DPAD0,
+	RZG2L_DU_OUTPUT_LVDS0,
+	RZG2L_DU_OUTPUT_LVDS1,
 	RZG2L_DU_OUTPUT_MAX,
 };
 
@@ -42,10 +46,12 @@ struct rzg2l_du_output_routing {
 
 /*
  * struct rzg2l_du_device_info - DU model-specific information
+ * @features: device features (RZG2L_DU_FEATURE_*)
  * @channels_mask: bit mask of available DU channels
  * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
  */
 struct rzg2l_du_device_info {
+	unsigned int features;
 	unsigned int channels_mask;
 	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
 };
@@ -73,6 +79,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
 	return container_of(dev, struct rzg2l_du_device, ddev);
 }
 
+static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
+				unsigned int feature)
+{
+	return rcdu->info->features & feature;
+}
+
 const char *rzg2l_du_output_name(enum rzg2l_du_output output);
 
 #endif /* __RZG2L_DU_DRV_H__ */
-- 
2.43.0


