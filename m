Return-Path: <linux-renesas-soc+bounces-24396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B4039C46834
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1F761344681
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8AFF313297;
	Mon, 10 Nov 2025 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aiBp/0fJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011043.outbound.protection.outlook.com [40.107.74.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72D430CD83;
	Mon, 10 Nov 2025 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776656; cv=fail; b=FVfmJojtf8V6yPplr30tpeZ9om4AvqKhzzm5gOYCfGWrqAz7ofBB+V6UidBgcjhB8WjHHptWw9ZfvUmEGOePD3P4P1rU6Ffo+WQfcJV+vmsNQ5ak4/sgoSTGo/N1sIYe68yLU5oqNyQkTAi/BGjeuAaVVM6S9nJezM9naWI4aKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776656; c=relaxed/simple;
	bh=TkoKKNw70SX5qjWqoGqPFRMvBF1M3lsiWghrJs13bVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rOP8bAzbelnGf75Rgy5A+Q1HYne1TobezDAeTVTuzhSdgHjWAJ4fy5TUt2TmONsFjwhNzxqUzbH/f0fakve/UIQN1eZHkDL93j3cdHZzDivv7C6Qe8S9PdkBPjtWmBpVluhfSW/2yPo/kownMugVzzhSvSbZdn9sjnyTpaGu1Hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aiBp/0fJ; arc=fail smtp.client-ip=40.107.74.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vn0f0tyIXyL5P6kN2nIpAFHVmukA/3DjtgmggpR7FaItC/Zq8A6iIBzaQK497BkOxwyn3eQbwxaWdnF1SdF6O5WaICexOSspr4U0m81nEdyJw2qDCrn4NxoID+jcgMKXFVBMwTkkFrjZH53MQw50ca/XkfDonKqmBkMdJp4qTHWZwbHyV50OK22LQ42ebQ2lWJRC1kD8z7P7ziWDyO74I774cWlVxWUmw5xCoiRxzH7jssaSK7rZMtPAdxKH5mCdvBVgR41gSuY8OTGy4e5yomTL9RZortHgEOWU1+TAam65yG0r4G1ebB4T5Hf65wQzWjG3FhokMLLC8O3IvxfPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6V6Dd+QWM1tNYfHLkad2QD3TwX9AmN+M/PaAOkqb8l0=;
 b=EkT4DDKWizyYzSB6yvbXNZLZTSjmXfV7YVZD+WVZ8Q6FGbxC8IqNr/dV1Vq4dBzmsDyvtzsXrTfEkGKMuaFsbXOvQd/dnjp3as03wgl2UkMOhPGSVHIbCv3umpd8H8sL9O0BtMlR9dJ176EnVxK0cA7PauSqysb8yRGBXK0H5CNIi0gxuwvRJZWUr3HAO9nh0Qia7nOZgjhB1WFelBNf9gCviL9mnEYIanYRfZI4tbmM2PiJjXcwMdYWyAojjbIIuIKJdf/GyvgaQ7T5E79xqJg812ArKeM9+mnlRboCeC8kV1H4KIU2qFaOR19iDbK2URWpX4+Q/p4j+JYm+r1ImA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6V6Dd+QWM1tNYfHLkad2QD3TwX9AmN+M/PaAOkqb8l0=;
 b=aiBp/0fJEFihtZXNruu8eZXPkcm0IYyAcLZE4zH68/IDFLp6aDhPsQEKFxGe70siXR6OhWUOJX0pwIZV5KW6jKgLwjGf83xLYDwlTER5Dznu/S7QpKXUtTJU8lgsMmxoMKujdfsPjsL7wKctfZ4OsiZUufm/I9nQAVuQt2QieYY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11558.jpnprd01.prod.outlook.com (2603:1096:400:37e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:10:52 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:10:52 +0000
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
Subject: [PATCH v3 16/21] arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal regulator node
Date: Mon, 10 Nov 2025 13:08:16 +0100
Message-ID: <3a5a35a43d028b44a074dad4f3b2992a4308c976.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 32d600c3-06f2-4345-d5ad-08de2052316e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qbzVoFjyUBdtKVib7ruINgXt8yQ4Q8Hqag302X88xT4IAZb0qmqBh2feFp5N?=
 =?us-ascii?Q?Xv5OS3hA9NfW5V+QRa4XiFxR6AG5VPLqLivmC8Qwtu2jw62VwFL/49aJuPH/?=
 =?us-ascii?Q?8bq83tXWxdft/2CXjIZR+v7cIgNmQ0ffjeMZFVdf17Et+Ui1E76v4d+08cXw?=
 =?us-ascii?Q?vBfEo2JHygLHbXt/Tb9fP4IIspPD9db7OObSrvxLPxR7oD2R1yXCfhBccAHt?=
 =?us-ascii?Q?84n7Xovaazd0Grs5mxMC05QOhuC5GuxdzCzzaEoRvlTitUo+H0O5xgsiE7Qg?=
 =?us-ascii?Q?z4o7NyMJLy4ZQDhpSSAPpL37uGJ4yN5DOuTPg7NYg48x8pp2QLvzt1/e4Co7?=
 =?us-ascii?Q?P8D5UD3U6Bl+eEq9YjDyPdXpMmMK1zWx3NiLvN4W2R5NvxnvHB8JnxmX7yqI?=
 =?us-ascii?Q?9vLc3QvV+CjrTtlEbe8lQ1Tgh2b8kHqz+cd4SPw1KCDEgQ51oKfimKT4K0jb?=
 =?us-ascii?Q?UyQTCtSrZz/M6TT32+5/osfCQ4HSc0tqm/mDkt2774AZwchSWe375l6jNVjp?=
 =?us-ascii?Q?/oeX1CK9wwG7+GDKVeJKCNtIEhaTl6ytTSQ4Igwv8+E57lJOKJ3ngIJIA8x4?=
 =?us-ascii?Q?lAnMJg9Y6efsILO2/PknMtQ/tSm7QkWbGVvepxuOhnqXKdJNl6Pp7br1ja5e?=
 =?us-ascii?Q?gtegGWiK7g+0BDG9sbvWU0WWYbRnBEqKrliFHuJVJFYu8iSyj1r5t6WqkHy3?=
 =?us-ascii?Q?EBJ/KVWMUItgK64dxAg37stEisU+KopZe1NnnphEZi7nVj21JhcuIXRnjH3B?=
 =?us-ascii?Q?DuJAGN6+T3168IjK/mdtEORckFu6lOCiGr7UPLwlA8faqLk2WP5H+HOeHkNv?=
 =?us-ascii?Q?BxpsEkamRmFVx6KiXXiPaIY2RciEO+9a6KzuywhMSRwYHfcDYH9U540k+LVT?=
 =?us-ascii?Q?wQHtnpmLQoqU2SavY4Qmkw1fjJwIq1E4xaVRnCb966yv9kKWavZK1qCyrheu?=
 =?us-ascii?Q?WNRoh28zIY57IQ/qIlrEZHsM9bK/+Fq39LzCoz0qjcOvqXOU7VTogaOC8CYb?=
 =?us-ascii?Q?Jzxw/ArqYIfCl1dYkUcezBwkAjgCtVIifkCUHTJKOB2ffo9kyHvHNxNoGBex?=
 =?us-ascii?Q?GGDbMyy5tfvsDtch9b98S9uyM227bW/HUAHKZb3wA3l6CKINopmDgPtcG5o2?=
 =?us-ascii?Q?ExVmGacjkC6YJTmmblkULANAwKJ2+Y4OJJU7XyTrKdyypf6TvyDpEXzlP9om?=
 =?us-ascii?Q?1aHj0uqThFn1FPXYuaDC/yMTYtWv+ZtGjzLt5qAl8/hWZ7RS3eLcYXM0A3IB?=
 =?us-ascii?Q?rAIS5QgG0a6JTi+1tww/Ddm8TBXv9V1cJMiYN4d0wt/DOgYvl3bAXTziwM2x?=
 =?us-ascii?Q?OMiwsypQPyxHBwWgRzqTuhe/nKkv7u5ZsQi7Xq29jCPxKbaZ8IXUeRrsaHmJ?=
 =?us-ascii?Q?x5EYYGs4G1/shpZKkg3ZRMoeYBi/AC46vPNw9f7BB7v/AbdunNpDssxNejqb?=
 =?us-ascii?Q?ViED3Cwff9q2ntS9fJLL/k3gPpT+jzsLi7hcNMbSkaV3R//874qqwdZ0HiyI?=
 =?us-ascii?Q?FF/ETHxHTMH39EJ3NJxRYXzOa+c8HNkQkOjd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i5E/exAQN64gUITLTsP4MChDXq/U68r79kUYAaDKwMsnQeyXGJRRx2ojlVBL?=
 =?us-ascii?Q?X0yCUYAbOEtxaE70n+xssymqP12hqLChCCFiLpXFA8xv2A+PGnOljULqv4Jy?=
 =?us-ascii?Q?tBb34ZBwO43jIn8/hxUOsmGlWLT3J0jHXsdjkJIbFYktk3rn3kp4bpFw9fF5?=
 =?us-ascii?Q?/u6L81WCznJ/qROQuTyFnR5QhxbJzgdmE7QungtY6ad41C1cXy5qbOUSmSIm?=
 =?us-ascii?Q?XwfczVfALsz4lUR/KeMNuccy9eQOir4ZgEYhqiLsOorA542o7kqSeFToo7wm?=
 =?us-ascii?Q?hi+lqmtT6swFKwXVtgpu2eHGpyViU1cTWnR7c8wdFDLKYjkKUDb3d1IfXqXX?=
 =?us-ascii?Q?a8y/4tqtItmw+KUG2bV222sww6iYuyoJ83Qm3pDuxmVXGqXc9sm7IqTaPmFa?=
 =?us-ascii?Q?riYkux5ji8GHPOuXlbHZutvbF97vLxmp4T0mesXyj7uj1WkWsMpo+ItTuGvI?=
 =?us-ascii?Q?uqq4R5xhYl5Z7/+rw7I3Pzvk0mgTZls8bKMzcrvPWjpYKfhuUsHA5FBHa/rh?=
 =?us-ascii?Q?D6AJpRMErOM1UnDYk2EUPRUr6MeEqnzxQ8yVbiDcvUln6amJDeXUi1xygp6S?=
 =?us-ascii?Q?inhvdm3KT5ZpeA1GgVQYRqR1y+QcKYATKxezKNMhMgbULeiwmzgwQj3u6chn?=
 =?us-ascii?Q?NlNMjT9wNKE7uOsrWiiQygPnoO4Gsv01HbvzBm5On5mpHold/NF6pO3etj3z?=
 =?us-ascii?Q?OrCMQkfr0yshsI9l4fNjdh88rjsMC4ZXPB7oAw5qBGHa8gq63v1wuh/nq04M?=
 =?us-ascii?Q?kYtSFMTi3W9bFKvagvcUzGVnB3NZbpVZZwQI1b36VygVulGEebbQ8hxEOPVZ?=
 =?us-ascii?Q?dLSjlUJNzxVvLLBh20aWh1rfiUTbEP8hP7MT6KAjuIAFkHEFTDm5sQBj+SAG?=
 =?us-ascii?Q?tY1IAcAE+KmrjUe8wAhKOEM9PD2R4Mr9VlicPwhW3oe7B+1XVt0/aEaCljWP?=
 =?us-ascii?Q?Y6HV0G3HPh/JaMTlRdhgrzhq7Lbzjqmc64BTt0YivVqA0pI3nmTUAXBTZt5d?=
 =?us-ascii?Q?YruZwmeNr6OuLadfJJH86JAaY3SdotIe3WkivjxOpSnPZr3Os0vawU9ARg3+?=
 =?us-ascii?Q?DfU6oX6Wg6m29X3KH2hVWEq8k+SLqgvjU/T/iqUyqsCsX0WvbsSVJ79gMlHf?=
 =?us-ascii?Q?u5MkIkeqdYejro6/5x66r9cL1osK+inWqBdI6dGPaQpfFiX8YD2NRFbANQ6b?=
 =?us-ascii?Q?fwal6C9IdtKSxOMcWRhD5f/GL9Ay5Cti/6RF7XQu9ZX+V4MRA1QnTg5Yn+jW?=
 =?us-ascii?Q?Uu0A3Vt7leRsFKA7KfmWQ278yKAhH2+ns1iE5F7KxAY2U9whHWol6nJgEt2C?=
 =?us-ascii?Q?YD1Ydr3hEu9vyjbLwKHwU7W6IBw/g80R0JypWjez6xuZB55yvWwQaXHVBqOg?=
 =?us-ascii?Q?IvgVl37iBG66NcLBj48J8rCcvLDHpEu3TpAzdJYXeWinXrd23hhmCKI0JM5n?=
 =?us-ascii?Q?ViyyyOKwAtE+SKvXhzbQnqlRvKAxbbpVdpEGVE29dToBroxrY+/ty/eniKvZ?=
 =?us-ascii?Q?6hBy8Gxc+S9mJSL/n7r5jBHBZMn0jBOUKYxPBm0udtVynuKfLTEtSAIBBBTD?=
 =?us-ascii?Q?QcY79MLgjIdnk7iZyfCussGluDoWNRqNX4t3BRwfV4krlpWAv9Tlsa806gj3?=
 =?us-ascii?Q?UosiR/XtC2J7dQGW3BEw2zg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d600c3-06f2-4345-d5ad-08de2052316e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:10:52.5399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdOoXpmya0httnYD0PuV157YP0dGG5+GbHaI/dLKr87dJj7ZtHKnZUHVbpLc509QxBTbKtxQG5ASazeHAnXYU7gJyLxtCzs4hDPRh9pWahIGiHxNwOD75PwlnkZ+2As/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11558

USB2.0 PHY of the RZ/V2N SoC can drive VBUS line via the VBOUT bit of
the VBCTRL register.

Add VBUS regulator nodes (usb2_phy0_vbus_otg) under the usb2_phy0
node to describe this hw functionality.

This enables proper management of VBUS for USB2.0 OTG devices and ensures
compliance with hardware requirements.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes

v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 205fa37d04ef..89f08e27a0c3 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -665,6 +665,11 @@ usb2_phy0: usb-phy@15800200 {
 			power-domains = <&cpg>;
 			mux-states = <&usb20phyrst_mux 1>;
 			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+				status = "disabled";
+			};
 		};
 
 		hsusb: usb@15820000 {
-- 
2.43.0


