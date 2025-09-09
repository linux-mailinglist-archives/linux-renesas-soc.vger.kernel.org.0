Return-Path: <linux-renesas-soc+bounces-21595-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB369B49ED2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 03:45:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4D7E1892A8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 01:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FE2230D14;
	Tue,  9 Sep 2025 01:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="oX6PrEvo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077BA3FB1B;
	Tue,  9 Sep 2025 01:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757382319; cv=fail; b=AoRyRekwt2a1M+9D2JegISiS4P7yxsuIocQtn7pZmH9wVzbmrwR+iAJwgQYqNSQ9leaRoamjvTOvTAGOkVK8dPYHq29LAmWhMbIl3RWWL+KGSDrGhvwG93Y+vYFzymcemQYkr9nXMGQuPJjEOHJBCPEgfWTJEN21cf0etvYq+yU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757382319; c=relaxed/simple;
	bh=bA5nDg3uc8X6I8oR7ZhTbzyktrSYSc0g4Thgv1qQf5s=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=X/BpaJBa9LJmus5xlW8J0TBTYvBsZ+3NzAy0Z6T2JIIg1BWJXMHHSLBaynwfWq3N7Qw6kAC5Fd7Na166X+WqMVqiI4W3ofZkplaBmdygdcFH3EwQN6lBSFhC3R6ftXiSpKqEGhkoWlJsIYGUmYb2TRp2B4RTpFpRVRqKpiUBhQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=oX6PrEvo; arc=fail smtp.client-ip=52.101.228.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qy3ZhiBCy8coyEAqYiu+6hL9YB5SC398tv3S42B8ClrF/F8uFj+D8Hze5JCD5LSllMbtq70Ewt8TJA+J4ZyGZ/92YYWi5dhSqoCPahwyKQrS1SUfPSyVsi4JDQdZVAUOwWnP0oB+bEjTR9eBpI872MHNo/EJOyn4akYR5iCnkMZen29TRbkfXm7i3T6PvbHE+Zh+mcq7q6Jlhy4aykBJ4R7ykuYg2FpuEchqbfALNTZmHPNHRUCJF1ISrGfZguhVFYlw/wzmmNBgyBszH4Fm92Ab2Kdt3GNjXc6w3LKD3W1DUIvLz3NmC6QkCYFyjYqZ8LnqXt698GJb8VlilpAzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/KgQkKQZuHYk1WTO0mCtv9Dk+Nle5go7i6UrLLDVfs=;
 b=ZF0nemLgBMZSW4+2po/WrWUDsCo9ykASuBZ3HUh3oeRF4vvC8JbuvnSfSkqtcwswFfGy+aGrXggF2UIcIDdNHphFUsISJelfDYwHNNHbq09JQ7c8ZncnSkhWmfKoHTZgd/6XtkJFr0BHHYQ7KJfRDX1/vxqZdZ9btFPPVV+vchDExIIG87Xeeftdekl1UAC0Q5KnGNOvrQM/etqVLcBV5UWu2m/17q+1OfcyNFQhw9fELTrFjdQrYov+7CckXYKZzRI8dcCIEFk2D7N3xp1ray2mYIORHtfk2hdgWSRCEh9XFxHNyU1G7ReevfA2ehGAc6wNa0Tqm6KkxlAClt3bfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/KgQkKQZuHYk1WTO0mCtv9Dk+Nle5go7i6UrLLDVfs=;
 b=oX6PrEvoSXG4IIMXI7Hq3z90jsHRPRptSY653A+F89FfxItNXywJyLBWCTipl2/1BKJozjqCiRT1GSJiAASkwkIsceo+i0bvxMkzDT9lTLC2jG/aSgRMclo16cLxpYMJ6iKQFLzbV8PNM0W+BtQUVtdoO9laH/7u8YzAB7kd4ng=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB11404.jpnprd01.prod.outlook.com
 (2603:1096:604:23c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 01:45:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 01:45:15 +0000
Message-ID: <87o6rk9z6c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] arm64: renesas: Add R8A78000 Ironhide board code
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
In-Reply-To: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
References: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Sep 2025 01:45:15 +0000
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB11404:EE_
X-MS-Office365-Filtering-Correlation-Id: 609b9fbb-274e-4f48-593e-08ddef42865a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k7D6N4BD9bUVNpdGbz3IR9aXy4f5Sh4LIOSvagJqkOIYSTrv4XTfyo8cr352?=
 =?us-ascii?Q?tjXh5c3DEmOQ8PT8nsRy+Rj54Y93E8o6tnerDGpf5NapwVFSMdIJyXiwUqSH?=
 =?us-ascii?Q?ZswDDSSyvPG9s54z8UWlkfRc27F5AH6plSPfWfv1IrtJdHf6docS8iPURuFX?=
 =?us-ascii?Q?dSu4RpYvuMUqWA3kyKZtI7tg439P8jDRPXtLAWrknop7nRjvIbCh14Tusov2?=
 =?us-ascii?Q?A3vN1JPpYF7/XkAe5Z5s6ti0zMloOcvXiF2nR3exxXSwuJRBbkvSx/lAUf4Z?=
 =?us-ascii?Q?ZiLFLVQSoSBHyGI4pFvnxA7Zu2C3zt4p2mj+dJUzL8fXHabhIdusnV3anyfe?=
 =?us-ascii?Q?A26SnD/kCUkHGUkyhFMeeP86kws57gdVchPQRsnzIwxmJN6vwPlaUrCKPfSk?=
 =?us-ascii?Q?3D0kNIQzU4IOW6RnlSTRJzQ7Djz/SzJjvlWj8LfBZ4S8Ek2vOgQUN/9YHo4k?=
 =?us-ascii?Q?EO3nLXnGVDBfIYwHJn73hd38y1Sp/2MkXlKsvay86zFsnKfCI0Pyhlx7B3lL?=
 =?us-ascii?Q?E5HWELQsj2QwYefnIRUZIpkHNr94XtMegmjvS5BF0zIIJTwyp9RtNXeybb2z?=
 =?us-ascii?Q?9+TtKLpVlFBK1PXpRdX6Uzu0zvqM9vUXIjaCY2VAOvll82/Ctykrhc3DXIA4?=
 =?us-ascii?Q?YgFStEudG/FOOf4cJ1nnGSnlsZv6e5bzo96pheTl0SxVOqOXz0CTf/BvzGaq?=
 =?us-ascii?Q?u1sg/VRmwULCzoYgek50ogTkDVkWcsPemlr6ailbao9u7Uror27B8MO3EPog?=
 =?us-ascii?Q?w19i24SVfNksF+OP5ZakPlvwBfsFSGRD6Ws+wmxK/QOh4+Md7vVOftL3pz92?=
 =?us-ascii?Q?e50LsfeiNcXI2N71dgxIspnQyTefnbH5T3OXpH+Igvbusc/+VLJQcz8juyzq?=
 =?us-ascii?Q?j6pKfvC14YVrpr98QdJ8kjoxFJqgHaBTGU4F7f/uhtCIKeMVJZidMIakV6on?=
 =?us-ascii?Q?Cxq0+prt/Pk4OAp/P+Ob/9uIA1x9mCGl2cwrEgYBu7Ux1SKQ31k8dBh8Ensb?=
 =?us-ascii?Q?6pF1dkwaDXNdvBvkovshMbRAFvn8aBPuVfX4jTzAY9YPOdYwa+/etSks0o7d?=
 =?us-ascii?Q?llpCSJvnkic/DHdYk4eKD5SxmR3RoiyN/IOA9BozWja7lUUkMIAZ/AVV2ABN?=
 =?us-ascii?Q?lQcPGoDdQpTBTl6ig/TTbQmUkmK7OUH8NiUWlB82Re5i1/7BfUgoJBReBG/2?=
 =?us-ascii?Q?F+fiKWsubhr65q4SqrIVd8ag0M+zDLs2qLIZj9wS+2GJB0uGccOaheMa3pal?=
 =?us-ascii?Q?K1MZIwukLU7bUBN0miP94Bi1x4QO31FJ2/ApTzF0TMrCKl+XNS1VbNO2mIBg?=
 =?us-ascii?Q?//LXgalB9G/zZp6KnJdOBshVFiF5E8I9tohukmSqa0G9zZKoT0CKH79QEQQq?=
 =?us-ascii?Q?5JNeObYBKQxTrQV0md4sSVYgNM9h5rtXXQxgVj+OvJ4GtuA1Lfrn6oGrFaFb?=
 =?us-ascii?Q?XZ5B4UZpHmPnhJu1nDgx4ERb6GhwNqOk6XQecHOi/LpbMIzGFuyVqBKjrvHd?=
 =?us-ascii?Q?wxI0+CAoPikrGwI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?17Ty2Hw6VqhLGuiM+Zo7+yAdnDewnBe10OP+fdGfaG1mEQKmrMK5fpSKwHIj?=
 =?us-ascii?Q?MxAWHdwA4d0ja59ESAK9OblF0UZ+pxlwRxoVQshrhpWSfvqoIWd3oBdl9jGy?=
 =?us-ascii?Q?KfwEY8QPrHlMHXm0WL1CyKUIMfid9XrKXqbsvjJwLqiUKTB7fHayE6IrPFGP?=
 =?us-ascii?Q?1soYaF9KkhJXK0qowGiZu2X4TKcpo/f2UEhvspoMuKzdGXxs8+Nf2oSONV/K?=
 =?us-ascii?Q?bWXl5B7pX2B5o7likssE0f6i5PjUEyAPCxSBVUzVW6efL7rAl8H+xlrn2J4H?=
 =?us-ascii?Q?FpwEyfWAs8IMOeaYXSjNRanTl6c27G+fsFU1PmpGYxFvr5Pjs4I3dS90Uw6s?=
 =?us-ascii?Q?aTNWPosj07uEH5T1xPk9HEHCr/WIbdnUyhfMOi/KjRwK0JfZFXWh5hI4Cv1s?=
 =?us-ascii?Q?wpE0NcbmZIA4PMI2Nxnc6qC2+nPihqnQpx3Z/9ZqlBtBAOAOD3vprKmbGy9A?=
 =?us-ascii?Q?3eStGDjnJOkZ7X7AN3A0UAN+kLBI8mpmnafbs/VAfNTDgAfLyZnOM4HWN9Rp?=
 =?us-ascii?Q?tiR7FvdPsmfv1RSRARxlIw/dWvjqAdW3NTkdjCkOUzSsK7L2VOYmSWdLC65F?=
 =?us-ascii?Q?8bg92xQVoetwVWm3QU06MAtuyH7dfCN1YWGSNwbW5rs+YJ76spGWF6zGRlKk?=
 =?us-ascii?Q?qZbr6qM/Hm9X3ZX+59cUA0+lvhg+3d/fC8Zd6N5DwBWqspwf4768U8LLyvF1?=
 =?us-ascii?Q?oViOaYLTUSo8Rcx5uAOETPSeBYA1QVmYqGJX3TnXr+n0/wGx73SSMjYt58wr?=
 =?us-ascii?Q?AEr1Q2Tm9Ja38jNzUVoJ8e3Q9ueJNlaTdnyUqvA3MPDtsO4BoEPy1ZbS/iGC?=
 =?us-ascii?Q?6iFlVSBJw9RjFL88VVb0f/zjVurkFempS54TvUFoe6iUwyocBwzpFxlqELCz?=
 =?us-ascii?Q?/75U7cvgayg1sY+FEuHgpULqkCnNLiSS8J1u8dGiMeZsoS0S45Hmg1wiMhfI?=
 =?us-ascii?Q?whW32hVb/1pg/9GUQ5A4J2ssXY2BfkcyAy5nCUUFpKekSC7wWTXarM821thY?=
 =?us-ascii?Q?ijsm9/RjSIqw0nhV+26jAcSiqzwZ6PzyA2MUvNwD7fJ1S051mw2HUJDr7R6V?=
 =?us-ascii?Q?lcm4zP7hVmdJR6MBGX9h45JOII7H1eZkSv0Q/eGmu9YA4q4FS51ADvWvvpOQ?=
 =?us-ascii?Q?o2/IUp2e6W3S2llp1ggFlDPOXXc+gRVsieXxlTiJDUg8xflwzo9LIdyIW2sF?=
 =?us-ascii?Q?Pwz7s3idjgX+tzmqY30OrAQLainI4UEE8BO9yoE9PtUqOurmrFrC1gy3tpaN?=
 =?us-ascii?Q?gWECL7uSxunp3oC2knLhXZo8zadRMOYpYtHm1NmGlbQFxFrPIqEFxQSJGZsb?=
 =?us-ascii?Q?5R+u+4I3LSkt20RbvportRlIxRAP1v5gkHRcK0bPNorQYDrrX5h/eVivaRcm?=
 =?us-ascii?Q?PR9/DLq93RXRy94pnIAvGBJjSIRKH21TFVILZ7La5GjXJA93p3U6AMAPD/d8?=
 =?us-ascii?Q?ETCOXNqPAefZzdE0FdCdAqMebvMJ7UOmX4265hNkCD8mxmpDMh9/DnnFURNc?=
 =?us-ascii?Q?8bObdYaj7GieLZOhV7qCkaOb70ZF2ZchgTLRxIQNzuK0FV2Qpa0QpyuvoAbY?=
 =?us-ascii?Q?+9IA7Mnw7GwOjrWhm0rjueIryheKa6szYNeCbozupC4lkEpIx2OMwxnHpMJf?=
 =?us-ascii?Q?9Ati/YwUNERglXZzmuXkuAA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 609b9fbb-274e-4f48-593e-08ddef42865a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 01:45:15.9120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12DC1JX8e38cPoxWjHtA8RLfH3B0yavI2zEOow4f/zWoZWwYh+ij23ezvQpHFUzk6ddEhta3koFTs7CnHbIcxmFKQsger8hP1uJxEVA2tqZS6fEBQe8o2uzX+/r07gsD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11404

From: Hai Pham <hai.pham.ud@renesas.com>

Add the initial support for Renesas R8A7800 board code.

[Kuninori: tidyup for upstreaming]

Signed-off-by: Hai Pham <hai.pham.ud@renesas.com>
Signed-off-by: Vinh Nguyen <vinh.nguyen.xz@renesas.com>
Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Huy Bui <huy.bui.wm@renesas.com>
Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 87 +++++++++++++++++++
 2 files changed, 89 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 6093d5f6e548..8b31cc70880d 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -182,3 +182,5 @@ dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
+
+dtb-$(CONFIG_ARCH_R8A78000) += r8a78000-ironhide.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
new file mode 100644
index 000000000000..16b515c40acd
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the Ironhide board
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a78000.dtsi"
+
+/ {
+	model = "Renesas Ironhide board based on r8a78000";
+	compatible = "renesas,ironhide", "renesas,r8a78000";
+
+	aliases {
+		serial0 = &hscif0;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel rw maxcpus=1";
+		stdout-path = "serial0:1843200n8";
+	};
+
+	memory@60600000 {
+		device_type = "memory";
+		/* first 518MB is reserved for other purposes. */
+		reg = <0x0 0x60600000 0x0 0x5fa00000>;
+	};
+
+	memory@1080000000 {
+		device_type = "memory";
+		reg = <0x10 0x80000000 0x0 0x80000000>;
+	};
+
+	memory@1200000000 {
+		device_type = "memory";
+		reg = <0x12 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1400000000 {
+		device_type = "memory";
+		reg = <0x14 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1600000000 {
+		device_type = "memory";
+		reg = <0x16 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1800000000 {
+		device_type = "memory";
+		reg = <0x18 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1a00000000 {
+		device_type = "memory";
+		reg = <0x1a 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1c00000000 {
+		device_type = "memory";
+		reg = <0x1c 0x00000000 0x1 0x00000000>;
+	};
+
+	memory@1e00000000 {
+		device_type = "memory";
+		reg = <0x1e 0x00000000 0x1 0x00000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <16666666>;
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&hscif0 {
+	uart-has-rtscts;
+	/* Please use exclusively to the scif0 node */
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <26000000>;
+};
-- 
2.43.0


