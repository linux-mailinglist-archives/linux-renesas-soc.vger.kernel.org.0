Return-Path: <linux-renesas-soc+bounces-27725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GI2pBjX5fGmGPgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 19:32:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8A5BDC51
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 19:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 52D153002915
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF06337FF5D;
	Fri, 30 Jan 2026 18:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oduSj2AQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB6B37FF4B;
	Fri, 30 Jan 2026 18:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769797935; cv=fail; b=ZwDmkwVXuhpU6RKK03oPwcgC2aCJH1TK4+6KXSOkggvGF1uAU6DnOmPNKMtO9tUyKhqXWxuXsR9CYksKXVb4tgQrChhY5+iBImWou+GvKTgMnROzARfD5FeoRoyNVCzX4RYVl4/nUuNKB52oij5RMDaP40I85427anZbnTRx5MU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769797935; c=relaxed/simple;
	bh=DPSYqVBcBHGGKsxHg5ZUVkowzr4v1JKBzRHtNAqL9ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ljzI2Ln/gdNbM4A+OEN8St/E6KAMQQUwVFaM5cf4hSlSXzcRRV8E+z2AlW7tD8LA6BK2QGJI2Q0zy8yxSoezmWrbMs1EPQ5cmLKgKawUYT3U7Y9i+cSGCz2DmL/btQUd31e86GNr9AkYiTZCzQk/KdW823p/VidxOSjUm1wKFOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oduSj2AQ; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oc/DaauZPnRPrceXsCJQtYg3RlQwSfwsWxixcNZbLRohJNPXmZCuWGGYnwPLsVgzZ97ULZDO8THmbM8Vw/qDCbPQ/lgf625Cu+09PE1quf4eloFXM4cPJmN9TXBecn76l5edaTRgwYNKagti9BUdwyy8RHKfUXrRPbSpOyBxdSDWUT8hqAtUKsiaN2wbQU8NZqZ3/6Es6w+fnUd5LzNlv/S3NuKpUjcPQGy65zaizRbQbWPxgmAqCdfoYypl0W570AJlD/VzApThdlmUB2/YRk9oqXAq+RithzPNk70M3n/wbx4sEFshdq9/4g2dc5vlJ794F+V0FoIv0sc+eIELtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IUbC3ir6woP2DP9QmvtljKYj+98/1j54O6+HsT0UgI8=;
 b=oFCdC+1B/WwPkL956TGk6eTp29spmqRosk4Qhfd2BxtzQF4F28FmR4SmAL6+zS9ugAnltj5sBNpNQp0rZmoY2Wpecl9A8ZgWGH+bQj7UcHbZ0gdmu/a8p5s2zV1FFgE36ILzRsOEKRnzXprB79GPG6dQ+qYbvrxFo7Qlwmxt2RtH2eipP6ahshZ1+CBLXfruSgJFwHaTi5ICv0Sr6OMZkauztHZufuM6hQnvgi+JtScBUg/d1l8m3dejPBFI4/5+mlL8nnQlmyOM0gnQ5FWWylrSs880hKdvr5Xnf1VKhiSVJHFAwNz8qT9M0K9LW9YgFNTlFWSyvzrXCmRb6OhACQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUbC3ir6woP2DP9QmvtljKYj+98/1j54O6+HsT0UgI8=;
 b=oduSj2AQovS5dN8AwZFn5L87z2KXovkXWjxMPGSuiV9+ZHz6Zi8iMTjsMv8NNmvAazx3R3m4Te66ylHgMJ4Wdkd/idxO98qq4ndCIbG17DFujC7D4TN/qGbvmJhuFwbZEN/8licR3DqYa3cWqeaM8xiARVcWTwiImY/dSrehVEQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:32:11 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:32:11 +0000
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
Subject: [PATCH v3 12/20] drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
Date: Fri, 30 Jan 2026 19:30:04 +0100
Message-ID: <f3b562042b80528cea0257ebd3a0e7f47bcbc87b.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB15715:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d1c12a-265b-4f05-6ab5-08de602de225
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?g9/lYCh5TTHqqO74Tm5qc4rp9mh0X5NQ6Qt2a2uGrPDykuv+q6IVgC624qfU?=
 =?us-ascii?Q?PV59I3Y8Ig2M7oCwIDgEuw1ZnyUqccXCEknuhbdCM/VMNZ/aVzl9xZWen/OM?=
 =?us-ascii?Q?j1ZPj7sb8TAt6KV4Ing0+RpFgAoacTP0i8tro3GWLjR/RlPIQ9+rLrOrmKwq?=
 =?us-ascii?Q?euLZRViRbEpBwbanVWCSH8eCW2bGlDtaoV3j95Jg3ErPMEH5NV7l0z1pAZk9?=
 =?us-ascii?Q?TmrK5+X38StinP1U9juUMg2RnQVDBHw/St76WSaXYuJhHDDK9VMOm2hzHLBC?=
 =?us-ascii?Q?JKIXIGdCZ2C+yMkB2jeUOamWuYyHj1SAst87NmE4q8odH2FR622nna4NN9oi?=
 =?us-ascii?Q?mXLfPMJr59LL/jtPcMxPsnlLuQytVWpiRYwFKphrO274W7PybmeLqfimPylQ?=
 =?us-ascii?Q?RIylSY2wBn2ST09Bl80XG9BR/aDlE23ZLDX3+YWjVByJwJA+MW4NHM2AvsOp?=
 =?us-ascii?Q?ES5/HVUVEWmoLV0eQ6+n2A5/TCr1rTCJsj2V+TrBc1+InRavYNRmPJpW1Y6G?=
 =?us-ascii?Q?45RPgKSL5ja6EaJid9AurJqnevkKuW5bqgoXiwSi+jKZmntiZas4yAep+p2b?=
 =?us-ascii?Q?EAxYRfacjpDYDWn8k1Dn4cO64m3VYV/MgjXNfsxeTlQmKsGQ9E9Bmo0pC7Px?=
 =?us-ascii?Q?knCcpD4FbIt/qHw83URApNAto5SvOSAAANnS6Ll6EUdqiv37CxrYfVeJD6Bg?=
 =?us-ascii?Q?7QA+/mycgYv3jrQWmZcpnvxs5l0TajRjkytuFGmAr3TtOtmxY7pCesbsHIxN?=
 =?us-ascii?Q?KLZ1TEM6XGIohiTLBMOhgjKIUDkjgIPTFgQBaR8IyIklFssFz2KF7Nk1SL1B?=
 =?us-ascii?Q?D8iYK726DGa7CqTMGdWfUnRfHV/3CUbnMVO6danSAb20a4s+vYdAOVgdEW+1?=
 =?us-ascii?Q?PYcXGtJ6ogaBxQDJWI+e5YJRJL5fwQqCy/Rpx7JgLqCIFvOKSCfziHRJ6Sba?=
 =?us-ascii?Q?yzKUFadP4bbDh3TkyaswksA9eJyUjtR9XfJTTwhg9wir6gS6mSeaEXouCPob?=
 =?us-ascii?Q?JoBq2RRmQNYUWCzjN8LwAtE5HbqEs52E2VPY5+b37lUWq1Q0tHvK0CSYd53U?=
 =?us-ascii?Q?2Q9aAiOQEdHPSOyYBdZO6x2RiX02Rlh3GuDnYmQ+TFI/okUNYg4+Cddw4Za4?=
 =?us-ascii?Q?EKI3B5PN6swk0jQPbtHNL1Bof+J1qtMrgC0l/ageOM2FBZ0onvc9u4eA//vu?=
 =?us-ascii?Q?onWeItzs+xddUMfurd+7095LbxAh2NtzMYizv/CUDTlzJG3xWEpS3fM1FGbQ?=
 =?us-ascii?Q?1LqSj4jOfgpLL9G/NduVlmsUITG0FB1vPEgJHAlZihvC/o1jgMkPsb/kbJWs?=
 =?us-ascii?Q?g7pp1YrXlk1wQWCeDvZnWprS4pBhD5eS/hUbQ5sqjYU0vFPwy5i7GQifswyO?=
 =?us-ascii?Q?npJmzaTrYzJA3mwJCydfUti4sNRQTGhFzYsec4HX5XjAeElY/LarwB5ZQLdX?=
 =?us-ascii?Q?+FrAxRDF5SBgAJgP7kHXdfBp3d824WzVfAWZNWOUO0bqjFi/1oW7SC0dOChH?=
 =?us-ascii?Q?nJzNsIGmlhArWj/G47OYmHZ+5l0nupC4IZqPUgzCjG1ALsLM922drn0upEXS?=
 =?us-ascii?Q?y5p35jxyxFjGOwv9CdACG1AzANxQxZP0dhq2Y+qZVIaULt5N8FEqdVLMqlnn?=
 =?us-ascii?Q?uYzuIcUt0bvkmn1DuCp3sw0=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?mRNmqrGEhj+SNKiO4Q0mRJqAYiN6kJGF3N49pcRU39d4QoWoz042rnE8eod9?=
 =?us-ascii?Q?vhbV+r2mEqAGPXtWjbngkZ89r8vTf9ZHFs8g8gT+kxtJ61af9pQfAu4xsnJ/?=
 =?us-ascii?Q?dbZWujd3n33lzCZD19b70Y7BRl5KOWFIs26Auna4m7YeuWPwZNqm58+2qft3?=
 =?us-ascii?Q?v8nb8AQNVrC8R2BxXkAV+Pn+JmpGfHFSBPQjIgCRmmKK6wyLv/rLZg23un1Y?=
 =?us-ascii?Q?We6k0OwlTY9CNwXO78I3mrV82GwX5Qka7nHULoe2d3YfJCl3TY3kd6AfgAYK?=
 =?us-ascii?Q?SLMnQVdTAGrqYmWnIjXyVzzk0E0Z/9u84T4ql4ybtgBQohXSQ9eG+5OUEPQW?=
 =?us-ascii?Q?sN/4rPQM5Zu3amwR/y+Z3svt9yS4GByD2zEUJqIq/6+ZIvEwJZ9l1xjkVKpa?=
 =?us-ascii?Q?6ZSUAhisaFbwohDCZ3T4OSyATQyB7t106bxBKu94E09MfGsFCqrw8f0J5VxS?=
 =?us-ascii?Q?KuddsuI+w5erFsomZyuUvNLNqAZZctB3oxLhlblpn7yXc4/DvKYm4phevyF+?=
 =?us-ascii?Q?qDecWlypPmSZLAOWJONQxgYF67BpwfMbdKsCEM6Db6rF7nMvlG1MhOjXdvpP?=
 =?us-ascii?Q?wo9rO6o2EQHNGEfN0R0ifKj83V2F51ibEZPNdq4bGY56ty5HWonwiu49/Zrm?=
 =?us-ascii?Q?TJCsiG1xxBKx78vwdft3iT0wSJzwMH46+PkmUh90gME5Y5AkEKwlI2cp5nUm?=
 =?us-ascii?Q?3jYFP2XU4VxYKEjWX4O7ZXdrDa2iZOTPt7CiXf8vg97/aRJhY2YkAaLEx3dV?=
 =?us-ascii?Q?z4FYif9PhWuEhruAVnuy0DNgZZuTMYbY+wX7m4HjJRh21hlWzOKKbX+9GgD8?=
 =?us-ascii?Q?1Bpa7OIi5+8q66dx5NRR8+3vvDGmOYQJQB7zsM5CbmrihRFcqKLQNvR2wW6P?=
 =?us-ascii?Q?ExwBnOaJlnK4/bX/tJekjwN12GZy+EeP2K/pPBtg8osWzhxp34QiMkHsljwz?=
 =?us-ascii?Q?/ymSuTNEnoPzQyGlSNinrlbn8K20yOoGflKCClWDWLgI9IIDlvM28fJ4JS5V?=
 =?us-ascii?Q?JKu5pxDiSS/+NdQwWU57iBkPJO7MkGcvpt21SnWTw/Y1FUa87XXH+c2K3Xe2?=
 =?us-ascii?Q?+weMhaT9OidiC13q50PVs7FSgCurlVVJq70+NDYFf3gJ3FR3NkkmcZhq0CUH?=
 =?us-ascii?Q?IKYsGD+8rtX7KyiJNZvn7lOYm8LmmlRwIT2Is/zEkGYG+VQQnCO+OCpCfWPB?=
 =?us-ascii?Q?bBr9U6r5Y88DbFbYZ+jBeaEA0aN6VtlZaeaWqMA4qXTBCiFXmJtEcyBywU/b?=
 =?us-ascii?Q?NG89BqUkhuCr41KkezC7U47WrUV1uPyOKduwKZeGnQ4tLQ4OQVQAofmif6kd?=
 =?us-ascii?Q?HGRwkuFeQrcRxK2i0BmreCr4+wy5/gOOxth4wo6KzJUfmFB+dAC4HXV0PgGL?=
 =?us-ascii?Q?7JrCnQYcevduoqXi+MdslYoUNmOQLn+FAVcdlxrA1BaqIWjrNl7mhdOxIfmB?=
 =?us-ascii?Q?tIJIb4n7ql045TVkxII0oSqYkAjj4UzDFMNJQaafoetATYlCbxfFPwZZYRr+?=
 =?us-ascii?Q?GBFb2kWMBU8+zdKJNHhiHo5ShY484kxILMby9ZzvPMxLR6AXQbc5oimCzwSO?=
 =?us-ascii?Q?znWM4TXzLvVFU80phWvGT5N19rbQfUBzLzz1yEvS5+zSlcbVi9xJBQatSYil?=
 =?us-ascii?Q?8k2jM3ZNTXi7EtLnx1b10GfF5EweJj3Y4mlgp2LgcaJH2zBIRvI8T8DezXLt?=
 =?us-ascii?Q?GAkzu/6dyIirK6HweFgeA8IruIXnLQkwDv/WKb1CiGG9519R56oL/ntIHn2t?=
 =?us-ascii?Q?vSwQ2ZEk9TpP1GCDYiuBCqwTQ00lNLqpf3NxcWGKfAKr/eCoNc7Z?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d1c12a-265b-4f05-6ab5-08de602de225
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:32:11.7813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXm8hZzJ6o8Y8ZLKrMApEFeCSst/XzCMVxJMVAMDmvvQi2NNfofYQYecPAXWtQ/OhMq1fFUsQTz5rd4xTnPn5wjBzklMEB7DiAcgCF5oabzBIAfwTB/NChWXhffCkPtb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15715
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27725-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: 5B8A5BDC51
X-Rspamd-Action: no action

The MIPI DSI ip found in the RZ/G3E SoC select the video input clock
based on the DU instance actually connected using the GPO0R register.

Add this feature to the driver using `RZ_MIPI_DSI_FEATURE_GPO0R`, update
the code accordingly to manage the vclk selection with the introduction
of `rzg2l_mipi_dsi_get_input_port()`.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes.

v2->v3:
 - No changes.

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 63 +++++++++++++++++--
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  3 +
 2 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 8ea8594afee8..35de1a964dc0 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -37,7 +37,9 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 
 #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
 
+#define RZ_MIPI_DSI_MAX_INPUT	2
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+#define RZ_MIPI_DSI_FEATURE_GPO0R	BIT(1)
 
 struct rzg2l_mipi_dsi;
 
@@ -81,13 +83,14 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 
-	struct clk *vclk;
+	struct clk *vclk[RZ_MIPI_DSI_MAX_INPUT];
 	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 	unsigned long mode_flags;
+	u8 vclk_idx;
 
 	struct rzv2h_dsi_mode_calc mode_calc;
 
@@ -552,8 +555,8 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	unsigned long vclk_rate;
 	unsigned int bpp;
 
-	clk_set_rate(dsi->vclk, mode_freq * KILO);
-	vclk_rate = clk_get_rate(dsi->vclk);
+	clk_set_rate(dsi->vclk[dsi->vclk_idx], mode_freq * KILO);
+	vclk_rate = clk_get_rate(dsi->vclk[dsi->vclk_idx]);
 	if (vclk_rate != mode_freq * KILO)
 		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
 			mode_freq * KILO, vclk_rate);
@@ -764,6 +767,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	if (ret < 0)
 		goto err_phy;
 
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R)
+		rzg2l_mipi_dsi_link_write(dsi, GPO0R, dsi->vclk_idx);
+
+	dev_dbg(dsi->dev, "selected du%d input channel\n", dsi->vclk_idx);
+
 	/* Enable Data lanes and Clock lanes */
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
@@ -1006,6 +1014,37 @@ static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi)
 	return ret;
 }
 
+static int rzg2l_mipi_dsi_get_input_port(struct rzg2l_mipi_dsi *dsi)
+{
+	struct device_node *np = dsi->dev->of_node;
+	struct device_node *remote_ep, *ep_node;
+	struct of_endpoint ep;
+	bool ep_enabled;
+	int in_port;
+
+	/* DSI can have only one port enabled */
+	for_each_endpoint_of_node(np, ep_node) {
+		of_graph_parse_endpoint(ep_node, &ep);
+		if (ep.port >= RZ_MIPI_DSI_MAX_INPUT)
+			break;
+
+		remote_ep = of_graph_get_remote_endpoint(ep_node);
+		ep_enabled = of_device_is_available(remote_ep);
+		of_node_put(remote_ep);
+
+		if (ep_enabled) {
+			in_port = ep.port;
+			break;
+		}
+	}
+
+	if (!ep_enabled)
+		return -EINVAL;
+
+	dev_dbg(dsi->dev, "input port@%d\n", in_port);
+	return in_port;
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge
  */
@@ -1408,9 +1447,21 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->mmio))
 		return PTR_ERR(dsi->mmio);
 
-	dsi->vclk = devm_clk_get(dsi->dev, "vclk");
-	if (IS_ERR(dsi->vclk))
-		return PTR_ERR(dsi->vclk);
+	dsi->vclk[0] = devm_clk_get(dsi->dev, "vclk");
+		if (IS_ERR(dsi->vclk[0]))
+			return PTR_ERR(dsi->vclk[0]);
+
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R) {
+		dsi->vclk[1] = devm_clk_get(dsi->dev, "vclk2");
+		if (IS_ERR(dsi->vclk[1]))
+			return PTR_ERR(dsi->vclk[1]);
+
+		ret = rzg2l_mipi_dsi_get_input_port(dsi);
+		if (ret < 0)
+			return dev_err_probe(dsi->dev, -EINVAL,
+					     "No available input port\n");
+		dsi->vclk_idx = ret;
+	}
 
 	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
 	if (IS_ERR(dsi->lpclk))
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 2bef20566648..cee2e0bc5dc5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -83,6 +83,9 @@
 #define LINKSR_SQCHRUN1			BIT(4)
 #define LINKSR_SQCHRUN0			BIT(0)
 
+/* RZ/G3E General Purpose Output 0 Register */
+#define GPO0R				0xc0
+
 /* Tx Set Register */
 #define TXSETR				0x100
 #define TXSETR_NUMLANECAP		(0x3 << 16)
-- 
2.43.0


