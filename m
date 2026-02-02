Return-Path: <linux-renesas-soc+bounces-27762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGCDL4SRgGlA/gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 12:59:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7DCCBFAE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 12:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4113630160D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Feb 2026 11:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E518436402F;
	Mon,  2 Feb 2026 11:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vvrXyuFC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF98363C57;
	Mon,  2 Feb 2026 11:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770033535; cv=fail; b=no2skdOEYbdADfVOUBSPW3yPnpvayh5a4PUgXHP39ixs2WmLukrjpEh10VA+AmF1AabwKAglyhf9PM8cb76tbeimKN5x8OiKvD6rrOeIQ6TDyP+a8Pog1C5PeqXBqp0xE9d5Kvo5YD9TxkAI7QdpssxjN0aYEs3pN0e1c5sf02U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770033535; c=relaxed/simple;
	bh=eUm08InxDFJcImtFEKauvzV93TAvUb3uh9qN2BLLgRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pv755lCkN+iMVGi0lkI6yODTxMcgiFrnN6gDPxhMQVf6ECWpT2jOq3nctH7EW0iMEPzHXX6yyq7XEBhnkPpJK7CEUohWFb1v8SPFod9uxyY7TqJwLrPbNVsxMOWffXZmxGqh3Z6XfLx/9ffz+LK+vcEKVo3XWCzTBAT+2Qf7M98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vvrXyuFC; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=azkB1diE0ZFKzD0uWo22Za5nTIXYwrhLupMdDca3Bxgymt7Z313vdy1seaL0iKhI67nJ2b54Pz4auMvNE2PqM/rUHy45U/GZUKdGTybGpK0F8zPIiWbYwWLNINOlVm2z+PWro5kAUkbPolWsukpgPQr9SprTZtPtDYTRyQRck+Ld3erBQpC5FHudFrjdKhj5BBl9qrvtQPJxxMV/S3dNL3b1LuoVKDTNV/Pg0Y0Ij5y7Sa/3DFlru2+soQ68x4/uWqXK4o4YHJ/G5OzARnkjwVpDs1C8E0QfUUyO1zpaMxPM3TECVbierrOIctVm7JvpPO7YJMxnkzeRR5XsekxKPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGOLbdqh2lR0gfspXy4OTzggQ3ACi0Nkvo06c8rdCvA=;
 b=QRrGOAXpLsg0WCJAlliBm2KaRTz3xPuR6FIGfWMFESGY4PAZAAQPzSpAhrBVp7TgAMw/w/awsv2FyWRFp++si2yYKlD0EKTtIKIjpA26WGZKe3choG0CcQKffhb7x3MN2dPcCkYUWzC9tjkoUe0HDeD5gcBODrPiUeH3oJih9aLfjkV3LwuSdB33nnXpHmYgMmyapp9NW3GQO1nD5yS+TQseJUsGYjdvlOmLwZshYSKbd2Xm7PeJ36/GC/dTidGx/r/jotTs3iMmTx5MZht/BfSH9X+DguHl43h2NPrKSTsDi8Dpm8YqZvsTVpuuKcwHhMAiWAUqLBlphPpqFxD9Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGOLbdqh2lR0gfspXy4OTzggQ3ACi0Nkvo06c8rdCvA=;
 b=vvrXyuFCuoW8RKuvnyWgI0gfa62/SnL0rWd94zq8dQ4CIPO4fm9A2CLb8fp+QUPcgkBHm/j4OmNLCb6xpTRI5arv6Ee2I+GazcpGMjL+COiqkBktLeNqgDnPpt11Q+ELeqDh7OWC8SNSh+wRMcokSKjRLI1AwBlwGXQsAy2Pg9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 11:58:52 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:58:51 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 02/20] clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
Date: Mon,  2 Feb 2026 12:57:33 +0100
Message-ID: <9c67237edf82faf9dfeb55883dab15b5faf1fa38.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 400fd4a2-258a-49b3-5751-08de62526e9e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?EqJ6ArlZ/qP+DUXCS5UChtpNQSExk3ejlL8v637qFYw6kQLWyjywJ9RpPNn7?=
 =?us-ascii?Q?M7p0OU8RHzKmfvfOwl55cfstwk1lSDcLrHBgXF88ySnQQwzL/o3m4tUt2SU+?=
 =?us-ascii?Q?Yle30X+DN3tXwdwGkLaABwEOUzNhBwHTBbtH1FxOA4LDfxX0txALuVmIcmCK?=
 =?us-ascii?Q?rasqERcBOM4mqQMIgBChIZ+lzcshg7NDdSRrGBNZi/l9zsrrQT1EFPnaYVud?=
 =?us-ascii?Q?syrDRa2+hs4M1p2k5nZnfU4rbuPFQpzpcc5zUeZPV4uWwDnORpUWb6hOQIg/?=
 =?us-ascii?Q?wDx24CmM+NEXEv01epx4JIPs0VaXml8xe6SSNb2CZS3caiCBmkWCcUR//R2p?=
 =?us-ascii?Q?PDFmLL1DDYFOTv/YOCP21gIenFvqkAhTgq4RKMftcaaS/bE1Kuk+la0syLqa?=
 =?us-ascii?Q?tSF6I2L1qxrJYekPwWiLLGkoGeLU6Oujkjz9Gvy3oW8d08xcblxw5WYTNmT6?=
 =?us-ascii?Q?Zf2+a+LCPNx6Z5I7/tf3XH+8zAUPHVgNBdPpa/RaAKnVj0Z/1Xh2r6XXgU/q?=
 =?us-ascii?Q?q0x0U3MKgdXFh28xNdLfoy9X/RkJDzBDuQHpKKpcVmSTb7p7IcyEzhQEPiV4?=
 =?us-ascii?Q?C1Re9+cY+bXwv+6zusQjLAv9XoYY6UBVvrdg9QkxSeKb2iBmPU8KaedRdsj8?=
 =?us-ascii?Q?xaLnfXi8aCJesTfRhMPXrhfaXOHOBYeKDhnbAwFhQeeqVHot4M9pZtbwjvSw?=
 =?us-ascii?Q?NDgB+XPDQo/ZifLlDXgqx4fjRKNZWCiqU1lh9NfcqFIk7yjluPT7ZEaFNOBu?=
 =?us-ascii?Q?ARlx5mpAAUKPHIPX1Q6f5KjiDNEmAzXXvlpwLA/Uh0AHojmOLgtQyBk0kQj/?=
 =?us-ascii?Q?Jks1q7WqrYJPQsvBY251XquYX1Lbls3t90diiDr/jEZqa5xcMKrYSQeWqphL?=
 =?us-ascii?Q?tg6+0u9JA17TeCy24R2hdm6+akYafxN0LWbYiNB4V1Qjs6NzGkRyeXNGeMtW?=
 =?us-ascii?Q?AV2mUhuWgWcobHjuQ07FhTq3dSXPqqO11qPxPB4t4p7T03UzDsDCGpbLqdZN?=
 =?us-ascii?Q?dKTm0QGEuzsoy/8Ac9nh4yZmTrFzpNFR9vYsdIEs/02aFAkFbE5OSrp2YbTm?=
 =?us-ascii?Q?sCrsdlLKor2qnygJvY0nbL4evb0CnAGGpLqsOYiT3iWCkjoCZ/QguJfQH/RL?=
 =?us-ascii?Q?v1dJ3NG9wN/N3eBiWm0w/00m0ssDKq6OXP5DgyO9iNb6jh++RKswQqAPZ9pC?=
 =?us-ascii?Q?k0tLddUsO4EjQp1sA34ev6YR9rjT/IYmUiaVKf8gHFkrr9F8UNl2jO6NbHYG?=
 =?us-ascii?Q?1hdUZONZD58+0FKyU5q5Shj+kFJjMLty9neKBn374RzqWueBiAP6O6R0r8y+?=
 =?us-ascii?Q?ZdchicHPMu2Dn17A0pJZVPScnCuzSebe9ZpQJ4jiLjOOqPlEKPqjQ82Ge1Zn?=
 =?us-ascii?Q?EW9jFR9JkLFoYX6KGY0GKaCjFiEiVR8WnOZbpjuXf6CazdFW+AdOY4M+7juw?=
 =?us-ascii?Q?tQfVKxFESePBmKOVwOsKso6dlGD7fsr2H6TMoKCbeqqmONFEKB/jUTB8wqpt?=
 =?us-ascii?Q?fUeUBv8pyU3wsWCP4ZfBDydSDXwquE52HoXDyDDtoAM6/uvtWfB7rRXL6kuK?=
 =?us-ascii?Q?c+aiZvwu3ZUIDl4G0adr4xfC4PB5Nx7wi8aujbvz32Xz8ccUG+oJDU4ehmf3?=
 =?us-ascii?Q?e0TWrZWIGvxlo2+E9n5MsOE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?TM9oSmKdzmAytUUaSpHbvEa95V7CK69nnbpGnoy1Or3GajQ137CIfJ0C80We?=
 =?us-ascii?Q?MHJdX9jVqs3OrYjbjzkdymlMCf2SaJDlF2Oo5zOtIPgSp7kYNnhdpwQwG7CG?=
 =?us-ascii?Q?jzo3H3gRIxDnqGAOex/9C3PPOEAIGfSMVzq/I1oGtAsH+XCzWmwB74biwV1G?=
 =?us-ascii?Q?5gZBP9chQTt5xMPK9D2DI0XtvFEhuR74KW9Qvd87szSuBN5cgRf7fcsciErz?=
 =?us-ascii?Q?mJkVhd8fgypxBJjC2Hizz+xa8I4nIiqTivkqHMntfp3xQd5cYx546FjqJ/z9?=
 =?us-ascii?Q?1r8rEqbvxmRp86eITqW/UizI5Rh1Y93nLLwxm7H97LR7Fcb66NRI0NgRczvP?=
 =?us-ascii?Q?Me4shPOzdZSCBsdYEQPSaOiezXVYJqln74oVxUSGOrqW97uto1f924RZqFd+?=
 =?us-ascii?Q?LZDOs4/8Je8OvmVmXj0z7lX2wffU2zi0tF7coaXnyL/kkq2PhLRqF3MTm6lN?=
 =?us-ascii?Q?1p3YTK/4M5NRabkLRTX/5QHt7RMhKApy8Mz3FaLfGX0UtBQ3/kZ5ee1ZcgLX?=
 =?us-ascii?Q?dyAp8K0anKzzcsB8tnsI4EunTjdmOnuA0RrKB5gXGydKiWdHSKzqvpPBuSGa?=
 =?us-ascii?Q?lHRPs/9Fx3dbCnnrhCakW0VUhuboypBQvSkLFF3URk7tt/tngnoy2USRg/Dk?=
 =?us-ascii?Q?xdCwHb1j6AaqFCY5r6YI1gRbaPjxWAcW+HRAVrolKU0Wdg1ymV9jIy1QSXX3?=
 =?us-ascii?Q?am7h1Vl6ZSuCDEskg2P/IU3BJkUaQMuz4gjpMTbDx5NZgstvLrQKXCAv9mBZ?=
 =?us-ascii?Q?euh/YjLD/q9e7qAl+Wz14I95aizEjGkxfSTJMBcja/bmdttMQmxNu9wYgTMD?=
 =?us-ascii?Q?hMlicq/fEIM9HS4q2VJmp24m9li2WyyUvm5wmAZgA4au0VKtWuii217lRGDL?=
 =?us-ascii?Q?P3KS+zszR03c4cKB9uiPnnxYU4xB823GJrsvodSeEwGhF5BGqRDYw1zrnYyh?=
 =?us-ascii?Q?Y2CyS0HMQjAwsHdmqHp1JwtBAlwUXv8NqlbsKws7OqRzEFBMFlinuj/se6WG?=
 =?us-ascii?Q?7bFn9waT24Hods2dQUV+B6iGLJLyoG2ouWlhfYmszBTWI2Br0vobjEedfEUi?=
 =?us-ascii?Q?LZ3il6xrjKxH0CclVxAzGZ7e8QVa3HSArecchCM6iReUKfPjxGmqJMz3ZtNG?=
 =?us-ascii?Q?Le8Vesv/nwyl3PGXt9A7+sbI6c2WaE45AMJWzhPMd5Ftdev7WlywawqGUIcx?=
 =?us-ascii?Q?vGslmSvYHm/WjHHDYjh2EeWAPhWrKakWbJhy6r3m30GjpDLkeDuG8G6dTm21?=
 =?us-ascii?Q?an9YSEyvAqJu+YOs3UxjScAwmCN0+UPPW4tlDOcn+uLm1EqUZcotcgeXyXB+?=
 =?us-ascii?Q?uQYMH2/PbGDuSGa7N68ICRIFWw5LbE0/Aiqw3OQ0KEk8wBkXiPbeoKi1U4s8?=
 =?us-ascii?Q?LosmKQa8zZHKwpHH1QTGDypXxalIMXxNnPFyllQkm4+Vjva3aSFK/ThYPrJL?=
 =?us-ascii?Q?U6KtUIy7y0yi3yeRz6l7lfmF2/noPxzgfS9FCUhoJjFo4nkoKteKRP7z4d3r?=
 =?us-ascii?Q?xd2Fw61+WWFFlmjv/unuCNf81fbKn2uHaZ0wBqMC2DXq0+MA7EDm6HXVssRX?=
 =?us-ascii?Q?twly8oKIZKTYfwBHE0tEH016vmWOFwiw6kZDs2/KuVmHR7oo4lI2AdgoRT4x?=
 =?us-ascii?Q?mMJ12BrrXkgwR8UIosw5FA7T+grle9jEzfL0ZAZGbI5EI5t27sujFHCz237q?=
 =?us-ascii?Q?bcOSWNGCLfIq4+/tL4zgsEu2+zKbjap9uQYYThNIOP+A4YGrsYiHWojyCIfu?=
 =?us-ascii?Q?er+Tkl2/3NqxF1uXObIBt3+PjefO6TB0YCZIuCslQBDhSPInIZlx?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400fd4a2-258a-49b3-5751-08de62526e9e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:58:51.9478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SaR4zqWx51KcCKnsv+DyjQYCBM2npv7QK6zHZE5nQJWr2MeHdSu55PyEF/zxnvJlyOC0GtVNuhGeagPHHQtVcXosaxW768Xw8kJEr/oKz4fsZmnZJwOgW1H85n8ugP4O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6552
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27762-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,renesas.com:email]
X-Rspamd-Queue-Id: 5C7DCCBFAE
X-Rspamd-Action: no action

Add CLK_PLLETH_LPCLK clock support.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 drivers/clk/renesas/r9a09g047-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 1e9896742a06..a73d12d4964a 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -64,6 +64,8 @@ enum clk_ids {
 	CLK_PLLDTY_DIV16,
 	CLK_PLLVDO_CRU0,
 	CLK_PLLVDO_GPU,
+	CLK_PLLETH_DIV4_LPCLK,
+	CLK_PLLETH_LPCLK,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -107,6 +109,14 @@ static const struct clk_div_table dtable_2_100[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_16_128[] = {
+	{0, 16},
+	{1, 32},
+	{2, 64},
+	{3, 128},
+	{0, 0},
+};
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -171,6 +181,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
 	DEF_DDIV(".pllvdo_gpu", CLK_PLLVDO_GPU, CLK_PLLVDO, CDDIV3_DIVCTL1, dtable_2_64),
 
+	DEF_FIXED(".plleth_div4_lpclk", CLK_PLLETH_DIV4_LPCLK, CLK_PLLETH, 1, 4),
+	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
+		  CSDIV0_DIVCTL2, dtable_16_128),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_DDIV("ca55_0_coreclk0", R9A09G047_CA55_0_CORECLK0, CLK_PLLCA55,
-- 
2.43.0


