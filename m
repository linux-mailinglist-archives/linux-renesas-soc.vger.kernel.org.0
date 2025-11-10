Return-Path: <linux-renesas-soc+bounces-24385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5B6C46826
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6ED84204E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27DE310779;
	Mon, 10 Nov 2025 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="TRk790q6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F26D30E85F;
	Mon, 10 Nov 2025 12:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776578; cv=fail; b=nRdbG+zF0TL2pa0zXJhvRS3OvIY1z6aYaEE2Jyc6p40gpLtYNQhwCIZ0qhuyGVGlKxaikLQG5U1/DUL5n7oVVu1xlDVY+gKmay2QxbKlreucDfG5F6XjOilJdg2wrr9kKFwz75HBg3wyYjWXkLySS1xdWfb+zRcGOMweh1HI7F4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776578; c=relaxed/simple;
	bh=z9UZRXZSRNkPv0+7cpXb5zOuhzfR/B3awohlOfsXJGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ul4OOjE5qlcD0xOk32b+eXibNKMvzdheC0tuscYxk942JyQo4tPYlj2fr3ASZiQaJiLM5QdAUGurAfre9EQKed5m7nzkamg2rAJ9eq16Ak1u/LaaNhBl6Jfne/so70CKpJjT+q79sXa09B5jv2SqJL4hbohatZbFSSmmlSehQpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=TRk790q6; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D94VQ+iT+DYGNMdTZfJ1+NPKQyfIzhdceKZea7uUSBkrkHAkQoq81z0UsLwwehrmqvxq8F4RYM4GFhlVBdcxtLsrat+Yv6qirJef/17ltgKNlyRzHqg/232p5JDwWfzIPsJvzNpIeW0LOoh07Y0MWsmQFV6S6GTNGiHhDqnmimtznrY8UnESLLS0xQf27uCuKznqWZVbvzIYQcW0tw1ovnipv0TOi7Seyc8wkNdGMVcZRkXKswM1VROZib1RSYVfHTjqgbIITSGDxDsn+IgZmHMfI5HNOxViaEEjG7lH6Af69IPv24rx/Rp0u/djnNDuN/kAO6QEzL4Nk/iVJUhyiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4jdN68WBdjYOudOrgH8ByaAQXWKCRt4G1dRcMWQkdk=;
 b=gnPVOSERwz5Mggd9qgU7qpY2APHFXJHfZlKan+fz6fe986bgC1PMhpR45sNCX6HZDlAoRx17M6uLp0JKtrlDb/PZylJdvz18qBQfGNd9VnOZD4BJHAtZM2h3j5/5GDPTZd+cU8j2MDsa9pUiybLnDbR2iCvixZYrsscFZ/Tzqg2DRfeFXwnzjvvcxsbhfIjMwA5fk35JgbN2SKAZZGzMqbBiTEopCnpdlH4+9wwzI2v4Uo+iftNK6UY65xtcRYaro26iaPcg3IK8NmiLAMl9o1BI96qzoRI/zFvaEn6duYqKqYRa8vQBsvLFM+bSRA3L2CKxsF7Jw1hB0tlozdQe3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4jdN68WBdjYOudOrgH8ByaAQXWKCRt4G1dRcMWQkdk=;
 b=TRk790q6Pxy/cD5EPUTDw1b1MckRjFpA0DveWylRO/36nAGKYqjA+e+lVea3tXYni/IplLBuVcVGKEa5v/q7dBRlU7On1up5XIVE0GaVXFFoBo2bZHM/rmtufipiK+HZpaThVye7lsePse2Yxiwc1puVHTgNHumB/g/gBIqcgfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8436.jpnprd01.prod.outlook.com (2603:1096:604:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:09:33 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:09:33 +0000
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
Subject: [PATCH v3 05/21] mux: Add driver for Renesas RZ/V2H USB VBUS_SEL mux
Date: Mon, 10 Nov 2025 13:08:05 +0100
Message-ID: <910c79a99a7c7b016bfb84349b9e728fa64be6bb.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ec6da8-c6ea-42c6-eaa6-08de20520236
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eQ9sXJ0W4sPh/3UhsO2+X15A8mU4wOzPEp+SL1p6FHMivcbzPTIo7oJ1boaZ?=
 =?us-ascii?Q?FWnI1osZ3xMI4z3d2rqNcj4RxAt9UM+KOJSx8i1i7CMd1IxTKzdtuW+0GfvG?=
 =?us-ascii?Q?bva0rP/vy8dgGtjWeQvdaKXATCFqVElz9L6k2nTb0p0SAr4yKOGm94A8jt9J?=
 =?us-ascii?Q?R4ooLoAwiPbuZyxEiGWXtXCDaBS0xz2fcoy2TWHhnlIX71SrwaBUHSvSl7J5?=
 =?us-ascii?Q?qKmBc6Z65AYhydiJmj+RCIwPWggDGw88eo1uzNJkpE2MpETHRt/Ss+CCSPpT?=
 =?us-ascii?Q?fBDqLuzCDiN0lGOoIbKcUIfAM+nnBscYpOe52oCJw0s0+PmfCCTEDW8xMhXO?=
 =?us-ascii?Q?JA9IewP3Go53FMDBvj4K1A6J0VC/x2YrJiDRAQI85H9+R0/rF47TrlLuQJ3v?=
 =?us-ascii?Q?BpkNWt381oszFpjw1qAGFJ36jzUg9REjryfNeSTcW1zzODJxVXDVFxUGoZVm?=
 =?us-ascii?Q?LIGFbyoZHxoCWR0fRM7UdCcQ2hGID0s/rP/HuSjBuR/5INQ/sFvaJ4lvUjd6?=
 =?us-ascii?Q?wD4q2oP50ul2ZplTtbnNZYzDaO/t85qkVpS9rnqeCLwXOenJGOXWqlNn16Qi?=
 =?us-ascii?Q?TkU+qyKIPzPvh/6JIOuKLJNiCsddRmExA0xkIb3vDyvGs+nQxPvqvfvQwNnY?=
 =?us-ascii?Q?0/0p4ErzElBob+LDnsVs9KtDuXgnWkwlr3z3ayHxAUBpX5e19WF8mu6rRq4/?=
 =?us-ascii?Q?FT4G6Tu6nqo8BI1+nuQh358pQEEIJZiQHiVJtnDMNL+nfw6/uorFqvVoP1tn?=
 =?us-ascii?Q?G/rvC4/p+sppR5dzuMFqxvW1J6EZ/NakJRhlzUZBGhahFI6QfNrvjL+Bqjn7?=
 =?us-ascii?Q?OoycRD7Ijc1w0MZ5Ai3zZFRMbRJJGYzvUMFu8k23r2E1lD8upSyeo0ijlipu?=
 =?us-ascii?Q?KzklF1iGhr8elfENmWm1+bngOESGby5TZ26A5uL2Np2dni53QHOhKAZoHa2E?=
 =?us-ascii?Q?Cbyf9LN/3LkhOyfRkFaQGoZr7Z37/i5q3FgxA8BMbeTqb72rD+jQSFV3FoMp?=
 =?us-ascii?Q?FxPFCy3xodbIjHmVIAxNnDha8iO8feImWWzEvW2nKjABgfaltCpUyXwvnHn0?=
 =?us-ascii?Q?xuscaOMoCFuVreYFpSkBkmxZvHDoAQFlvXr4NYDWEGC850Rg+IsM0lr/BebB?=
 =?us-ascii?Q?9rkRoKUoy5e0gui3Tcd4aFzk2YXPNqjWGe5kOXWulr1JzGv9BURMxAyAe0U6?=
 =?us-ascii?Q?/pGjkfpWU/xRpM29cHe/8+OcIF/Iemx2MmlNmhzVtq48eaNKFqKk54gWazNc?=
 =?us-ascii?Q?x1oK6PiGbUke0mhx3FqgIhiVaX0wszgen6E49wGoiEAMxKq9twFDm8+rIlXs?=
 =?us-ascii?Q?l64ddRxTDsx8f7bMysQre4FpufuUF9M4IGUC54CdGoz4yYnf1oXBxvZX7Zcu?=
 =?us-ascii?Q?0tiRkhhAnCysCthqRBn25JaeskR09o2CV+FTbOeUhkr2xlazArzalugKUjdb?=
 =?us-ascii?Q?6IMK+RNhm5GO8qVGCJx3sOh6cQuPXKVv8tjp/n3hDvM21U64E6ZOufxPoWmp?=
 =?us-ascii?Q?MbGX1f6qX0xdSqHmEqeuzsCYidMRcBT0xzxG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?44rrDYNzB/ub2rh2GdcUGozhQNSYIU/yr9QTzp0AGXPRKmWvXyotAtjoX8Vq?=
 =?us-ascii?Q?jaOMfkHCZeWxY8nPXO23gJT8Nm9biayYjWXgUaURLl9s9VyUzU/d1owgWJ/A?=
 =?us-ascii?Q?Gk3sMFSRsJyBrySm0N4q391klROfwxwU7f09Uzi2f36/tOVZjfY2nVgUL+8x?=
 =?us-ascii?Q?rb5wQ/Um17YUFK5pfmjD40/cwcLPZc3ttwhNdQyMWk6CmrAa857WorpPnXXQ?=
 =?us-ascii?Q?C8hXJ7Ttl5oOub2kCdAbkkrD0m54HvrLOswNLPnna+U64EXvD2qPfzk4sLtO?=
 =?us-ascii?Q?cwy4yV5TzMVvCLAr52MCJgO6rrjuJkyJizlwP4kIZZYIrOpPhTjRP7R2sWD5?=
 =?us-ascii?Q?4LgWFh46q5Lz2OhrkeCy+EUNeOBbTLGyHAv4EFR3Z+YFOlTCgWR4qkLsMA3E?=
 =?us-ascii?Q?znRTfX9bY7Ay9HkAvFgDAfJDjCkK1AQCl0xlrWymoduKLeiD9cAZFBWWtCmL?=
 =?us-ascii?Q?WAYxiL7Gbg+XC7zBFbu8x+o87yUftHmSluDYp/Al6h2aP1pLE8UpAfCeFiOi?=
 =?us-ascii?Q?Kw52Sh3OXNZfB/V5o+k7leB32flfmljdRWnByNAIr6OW2QysgR/t8xIjlVhi?=
 =?us-ascii?Q?T8lukzH46AD+SMN24Je6TQPKPVoiBg43WS9gaWSkxUt6GfnzCLVuLH279wiC?=
 =?us-ascii?Q?tgtX1gLhrx92tfW693Bart6PSP3BEdWMaLgxB7XeZC85H0Dz6WskDw56dUA4?=
 =?us-ascii?Q?xoEz4LjYxxbEd4q3IkVtkPxhJz1Ab1Czbr1xLpUmB+2k+C+cATAOjBTOpHNL?=
 =?us-ascii?Q?oMb7LBVYaI9VznLGsL+FfGbMST8C/vIcYBPNhamVX9Wud70h/5hT0ds4leHv?=
 =?us-ascii?Q?aB8OSNfcEsOie0Mz6s6n7e18LqwJoEOrnsCmQFzXpTBUi8MHWP9lQzGpfi5v?=
 =?us-ascii?Q?Tb7+cHk8HBEaB20p0ano17Z43Ao1wEHYtct16e6GvOU1bF2wNcjopzA+OJRF?=
 =?us-ascii?Q?hFaxhdBhRYY3nyR7rI8LJJ+fHZzrUeLSkNc39pT0KU6/FyqbhHn9ej8SGEJy?=
 =?us-ascii?Q?XFxFSiFzClwGMCbk4ZkLO/t6J4BG5Htp/5liDlDRyhl/vz6jNhuYw3y5ei9R?=
 =?us-ascii?Q?lCeT7fKmehxajMyKqYD3VmJvG9lIiVFHlWYx5TKDJjAI870yHqmHodwHpmgn?=
 =?us-ascii?Q?7VfoHyDYs+Sz1kyCxteHtw16qqRtfNkaT4toaum+r5+ZE1B6ZSCfCnf/sBK6?=
 =?us-ascii?Q?sWSXwD7mBXrqbFmC6jiFM4xF4JQipsrEcxBO4eVPU9EK3oMNKot81ApYqEzt?=
 =?us-ascii?Q?sHH7R9hlM7mPoB5U7/V+qrTqQDJ37GJTeRI3gW0UVthe0I2kZq63PyWih29Y?=
 =?us-ascii?Q?XqC2MBjaOIXivffyagBn+OqYPwG4LVdgbqZAXoOvm2++FUYs4Fld1jV5h1kC?=
 =?us-ascii?Q?h07EEF88KBnfRCY+PAC1GUKVJUZkP/psnVK9igxUhyabiRzIhssW7yCAkVw6?=
 =?us-ascii?Q?2P5Zbt8upp+/m6fGXfOBqWO2p2u9jBqDNsUBe+9hvk0pNZXAmQ6gYdLW7rxS?=
 =?us-ascii?Q?TB0k4iin4gj7djSXCEXYiqiGYnlwN2fFRCh71+kz78YqcWHyqY+RugEmbHAK?=
 =?us-ascii?Q?r/dFztmnT0u3A7BUGK1wv4Gnw5yMiOvFu73aEvZpCeaQCfza9SmvlwDcv5Cv?=
 =?us-ascii?Q?lkUC+i1kLCG6mYg6G4I3He8=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ec6da8-c6ea-42c6-eaa6-08de20520236
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:09:33.3140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9eJgcHJbEbxWz7V48QyFdt5Hq7mSGAZJ6Dlc8etZkwWfIvu3glI5y2bo04xenLi3LbDqoHFAqh209TK54+T0x9vzua0UulHyq0ze/Uul0Gch7HqW4GE97cENi7cpC7tH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8436

As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
bit of the VBENCTL Control Register. This register is mapped in the
reset framework. The reset driver expose this register as mux-controller
and instantiates this driver. The consumer will use the mux API to
control the VBUS_SEL bit.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
   is an internal node.
 - Fixed auxiliary_device_id name.
 - Get rdev using from platform_data.
 - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
   as it is needed.
 - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.

v1->v2:
 - New patch

 drivers/mux/Kconfig                       | 10 +++
 drivers/mux/Makefile                      |  2 +
 drivers/mux/rzv2h-usb-vbus.c              | 98 +++++++++++++++++++++++
 include/linux/reset/reset_rzv2h_usb2phy.h | 11 +++
 4 files changed, 121 insertions(+)
 create mode 100644 drivers/mux/rzv2h-usb-vbus.c
 create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index c68132e38138..604f625544ed 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -59,4 +59,14 @@ config MUX_MMIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-mmio.
 
+config MUX_RZV2H_VBENCTL
+	tristate "Renesas RZ/V2H USB VBUS mux driver"
+	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
+	depends on OF
+	select REGMAP_MMIO
+	select AUXILIARY_BUS
+	default RESET_RZV2H_USB2PHY
+	help
+	  Support for VBUS mux implemented on Renesas RZ/V2H SoCs.
+
 endmenu
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index 6e9fa47daf56..9421660399af 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
 mux-adgs1408-objs		:= adgs1408.o
 mux-gpio-objs			:= gpio.o
 mux-mmio-objs			:= mmio.o
+mux-rzv2h-usb-vbus-objs		:= rzv2h-usb-vbus.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
+obj-$(CONFIG_MUX_RZV2H_VBENCTL)	+= mux-rzv2h-usb-vbus.o
diff --git a/drivers/mux/rzv2h-usb-vbus.c b/drivers/mux/rzv2h-usb-vbus.c
new file mode 100644
index 000000000000..c71a4a8831ec
--- /dev/null
+++ b/drivers/mux/rzv2h-usb-vbus.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) USB2 VBUS_SEL mux driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mux/driver.h>
+#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/reset/reset_rzv2h_usb2phy.h>
+
+#define RZV2H_VBENCTL		0xf0c
+
+struct mux_rzv2h_usb_vbus_priv {
+	struct regmap_field *field;
+};
+
+static int mux_rzv2h_usb_vbus_set(struct mux_control *mux, int state)
+{
+	struct mux_rzv2h_usb_vbus_priv *priv = mux_chip_priv(mux->chip);
+
+	return regmap_field_write(priv->field, state);
+}
+
+static const struct mux_control_ops mux_rzv2h_usb_vbus_ops = {
+	.set = mux_rzv2h_usb_vbus_set,
+};
+
+static const struct regmap_config rzv2h_usb_vbus_regconf = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = RZV2H_VBENCTL,
+};
+
+static int mux_rzv2h_usb_vbus_probe(struct auxiliary_device *adev,
+				    const struct auxiliary_device_id *id)
+{
+	struct reset_rzv2h_usb2phy_adev *rdev = adev->dev.platform_data;
+	struct mux_rzv2h_usb_vbus_priv *priv;
+	struct device *dev = &adev->dev;
+	struct mux_chip *mux_chip;
+	struct regmap *regmap;
+	struct reg_field reg_field = {
+		.reg = RZV2H_VBENCTL,
+		.lsb = 0,
+		.msb = 0,
+	};
+	int ret;
+
+	regmap = devm_regmap_init_mmio(dev, rdev->base, &rzv2h_usb_vbus_regconf);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	priv = mux_chip_priv(mux_chip);
+
+	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
+	if (IS_ERR(priv->field))
+		return PTR_ERR(priv->field);
+
+	mux_chip->dev.of_node = dev->of_node->child;
+	mux_chip->ops = &mux_rzv2h_usb_vbus_ops;
+	mux_chip->mux[0].states = 2;
+	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id mux_rzv2h_usb_vbus_ids[] = {
+	{ .name = "rzv2h_usb2phy_reset.vbus-sel-mux" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbus_ids);
+
+static struct auxiliary_driver mux_rzv2h_usb_vbus_driver = {
+	.name		= "vbus-sel-mux",
+	.probe		= mux_rzv2h_usb_vbus_probe,
+	.id_table	= mux_rzv2h_usb_vbus_ids,
+};
+module_auxiliary_driver(mux_rzv2h_usb_vbus_driver);
+
+MODULE_DESCRIPTION("RZ/V2H USB VBUS_SEL mux driver");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/reset/reset_rzv2h_usb2phy.h b/include/linux/reset/reset_rzv2h_usb2phy.h
new file mode 100644
index 000000000000..06247080a66c
--- /dev/null
+++ b/include/linux/reset/reset_rzv2h_usb2phy.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _RESET_RZV2H_USB2PHY_H
+#define _RESET_RZV2H_USB2PHY_H
+
+#include <linux/auxiliary_bus.h>
+
+struct reset_rzv2h_usb2phy_adev {
+	void __iomem *base;
+};
+
+#endif
-- 
2.43.0


