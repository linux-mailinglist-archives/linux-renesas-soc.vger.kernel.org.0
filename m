Return-Path: <linux-renesas-soc+bounces-27724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHrENiz5fGmGPgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27724-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 19:32:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEFFBDC29
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 19:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3175300291F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A339137FF71;
	Fri, 30 Jan 2026 18:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="U3ZfYiQW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010001.outbound.protection.outlook.com [52.101.229.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD76037FF4B;
	Fri, 30 Jan 2026 18:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769797928; cv=fail; b=mxGwkQ7yZYCGql16CCW1dj5XO0l+TAjCTtLqOBMeMuEQbUpcbbyfAW+Xp5DnHzaOWNCw8A4VWq9f3sYFxJ/EEHPZBR4k3LskAKV7a8JE37uPpqLWYs52K6VPnYpRhtqZybVD6Tvh0qHyGuzqavu3hVvmYzgXkGZXgpTHVBMIBI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769797928; c=relaxed/simple;
	bh=W7pvWN9kN8GqFvfrAgdJJ9cQdzSXBvEiuFj6OSymTOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uxm6cOTIExYws1aQg1mxbgZsP/v2SmprN9x82KanSryNOHLiMRxc8hGYBubKruF22//+8CgBMD9omneIQJbFGYfik383gOj/1wvOSDoLtQ/IZcNknXIDiBPRovSvTSzf9yQ7YPWe6DMWrJ8yWYq5N08h1t4JLGMZGNdH0IcdGu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=U3ZfYiQW; arc=fail smtp.client-ip=52.101.229.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsOEsYoAuvF62AjZcOKOhARLx3K8qwKo1UW0Oo5o5HOnzk237QjdQKKS01fqYjGk/wjm2F7a+KURMYHIphKMo4creiLO/buKvkGynJLE9T3/YVnB1dK98HwM5EGAjhGMsBbQqrfXX05CXdADde/ivqN85Wz4SxkPVSv7T/hTq2Xu3FkFZGEHJ9nN0BD0mfdzqI1aT0YE3BZetfOkUkYr1VtlwhnRUMNXbFtBn0UVYtU6wbbHUIpd1yExbt77VscOYONY/Baf6fc3accGb6AToux/IIUJWDyQeorZ16pAuxKGsQIVrzCJPBdN9KU0RsoHOR0Q3Ju+w847g7km3gKrrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4omlugT3mgINLChYxeEwfkQww/3VGEgam0uXftpoIo8=;
 b=LTlgsxitMvqb7K+6tU3qjPpotBfhCGOATkHwVH6iwLnS5KU6vPFmICUSReFqLJFUcuRqH5NmSLQ5c1cKbEcGXCJbgO8u+zwTk5Rg9osBTS1uOLn46qdWgCRL1fGOvCtSH10qDpn8yziz39V3EGp0AHibCcUXAHMzPNvL47ym3U4QvY0DKjaJNIHSLtea3XbYpmiQ5mFzbk96ZA5pN/7twv5u2H+1H8ynuyHJxyhpar7Z0gpXFyiYImr7pXZ2TZ2DMb3S+FtnwnCvf7I0YzFrB8qqOWUYoijBih/V/TZ4a0eQfLcuheeNWerGidPUhZgD9vkanQndtzG1kxWHAuYXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4omlugT3mgINLChYxeEwfkQww/3VGEgam0uXftpoIo8=;
 b=U3ZfYiQWuW+W+QoQsYLwbfRiFr1VOkmBqccdsHVPY2eluifLwqIJ4s4IZxanO5LEYYnGFKvRk4+cYeVig5nSKHs8bz5H32dznMUkPdWcYADjWnoAwsZsGgM8aqiNU7uopEwMmq5mAhwkpc13E5jt3es1CCfYI76FtR5IE7Z2wjI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:32:04 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:32:04 +0000
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
Subject: [PATCH v3 11/20] drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
Date: Fri, 30 Jan 2026 19:30:03 +0100
Message-ID: <827c26e7b75d19fd701318d56f1b8a0a550d88fb.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2965c8ad-7c20-42a4-17be-08de602ddd94
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?WsCiGZN0WNCwDEbqMQV04Jmp9PD+elIEOL39fvpiuJQHsE8bUuSQmsP0vdQ9?=
 =?us-ascii?Q?IeJGSKYXDg8/6TrEwyylXI1xvn/i6aJjvB3exUcXadMgSOjuFQk8beIxlFY0?=
 =?us-ascii?Q?wWmRzk1SF8Q+nxfwUkX/Z2qXQ6Ao3KEc+9xVV2/F3SnMuxKSlWfN6pjvEG+p?=
 =?us-ascii?Q?rVwfFoomersd5sOPirG7aw3vo8hsUX594nQaCcIh8RGgXQvYu2fk9zswbET1?=
 =?us-ascii?Q?Y9xy31P0j33bQlgF7T6j3RUcDpriKNWZ4gIBKCVsRaJPQTTLfElmEoCRpbxg?=
 =?us-ascii?Q?UkeXPqALZRf/vgqHwPfS4t1iV8Wmj+xhaHxDP4VEVdZFeNtloIKQ0Mysiryu?=
 =?us-ascii?Q?zBKtV7oOVdxL8gn2J1XRDCv/NbVjjKHlk6OLMUU3qv86cKKYsr8GTJLv2vFo?=
 =?us-ascii?Q?LjuDwVyVXLtGlchoPY2X3KDI66ilSsy3doabnzRz8+L/QQT1Fkvang5iR3Wh?=
 =?us-ascii?Q?tDrUXe6RSStR+aIQ1bjH08WO8zKgxvhtUVT7yAqcps8bK5jMBUqUThgBJYo2?=
 =?us-ascii?Q?63BhJs9mNWKO/SIqOAPKm/FB5DJ4AnIReJQiFibwMoUhn04+vY8OWLqncAXz?=
 =?us-ascii?Q?8/UfMA3Ls3aqcYWlHxrXJDWrUrwh4zF/i5uKN2Po6lwBb+oAVmsiO1P7Ynpf?=
 =?us-ascii?Q?EvNCGdR5WlI9kdlRfN0k8pjf4eeydlLcMixoUWW15zYB+kSDLKIJrXkQ0ZaW?=
 =?us-ascii?Q?gTBoQMgXlKBaKYacXK8vs8Dv6RtHWWcsnjOsF6uFnd7kpVZjdu0MKdSJGNZB?=
 =?us-ascii?Q?4ZRCO54ukMLG5zBGNuu9QnsRSCg72+FMLXxAtYg9aUAsE6R5EDek/6IEjEdH?=
 =?us-ascii?Q?iHx7osqiis1mZrHBFy8lnLQJXV0ooSSkKZdgxvQE58k0UByEBP5XQyCq1pZn?=
 =?us-ascii?Q?liXB1aDbTyrIgFEeah3K52KoyFs+Ub9SAdFfvgwtccwmKGO67rfHrlZX0224?=
 =?us-ascii?Q?cKVjK2xx1LNQoBVaR34QKIrWo+e0wnULaHlrCYfE1qKXAscV7FRMvGSlBsEu?=
 =?us-ascii?Q?3+p9/nqg8Lde8ekXVbUTwr1cqghenXBQuU3ux/rEUxA1BaKDsTi0l49uG6sp?=
 =?us-ascii?Q?Fvi/YH3coiZcwpR4BijOBl18Z8hihzgLYXyM6SCgsqbbULW8VHOh8Ax/Uosc?=
 =?us-ascii?Q?yJShUCZBX0Y/VMHjAIv7HSyquOWOCNJ5zZxpagMUPHiK9+VD5QNGsHBYszTC?=
 =?us-ascii?Q?KiX60ybmMi2iXJSCoRvCDvqE00TpryWyx06YjWHGgv7y3pCRcfXzCHxQvPXs?=
 =?us-ascii?Q?hgbs4VKMKcerjRzi+qjK8I3qRvbtTdHG5rcQuIpflq3WhMZXvHA/KQ/Okmc1?=
 =?us-ascii?Q?22IOFd5PuRlJUg8OwcNgDMVVhe64/vYHL8PMQ6V+KVj7J9EOrgO/6yqnRoqC?=
 =?us-ascii?Q?ys0KBfbLlnP9CUoVwkLvY70AOsf6tCDNleaN05LEsouy1mWNLPJhcqOiZQy9?=
 =?us-ascii?Q?nM5cpUwXz6/+nTEQ+1siK5CxnGa9bMuSumPr4LzlNMP/0QpqOTSkyNGNCEU2?=
 =?us-ascii?Q?1yRFQNUlKwGCnDM8amSl3bKVxcyZ+7nq71RqhAlK5pawq/lO3QWf+GWVut20?=
 =?us-ascii?Q?1Sp245x8xmCIefvY93EeYKLfN2drQ+FBzZppWKyn4lBqM6Cm4YGN0zT5Hi+5?=
 =?us-ascii?Q?09SFQ2HCPHSWq3uvRZFyVVo=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?cUQjMUYZALPv89m557qHfqKuIMeQ/ntA0GVEMyQFBN1b9FT+NpCKZW5KFE0m?=
 =?us-ascii?Q?6r0J8PSnm9sS5WQwzQLnu3L/S5VCdojXvuwUcd+bPYMbWCzbpInGILCMN/vN?=
 =?us-ascii?Q?0++miUpbnjoCa/Qej937F21qpOoNI5eJxzAdSudEZM1Z+cPoWuvDHkG1IAnD?=
 =?us-ascii?Q?7yNsxHcjBrTH8IvWohbRzTfI8AreeXYh5zYM/mtTtRY0uocpYNZLjrCiiBsl?=
 =?us-ascii?Q?CD0IJhieDFW2qMzbnzTzVuwQiVYjZqGSe0ezI4sC6a78yyWK9ftq2kX6RISE?=
 =?us-ascii?Q?A+rB7oLqsIEPiKfv6SsiMbIu2/a0GDde2zNdTrE4pIkepPloaazQ+rJ7cyD4?=
 =?us-ascii?Q?LN+1vxTmo+jFyVtIPIfijVPWKXZRz7/+MiIU2POYtiM5jw1UODT2hoxxRB9z?=
 =?us-ascii?Q?VQn18w4slU7IhZOqPhMaUfXFhIyx8zgZFlxLNqFEjpx6KUmTTodHY/wGfrOu?=
 =?us-ascii?Q?i/Z97NkBbqMHaii4/dT/zi16A9xydziJ9hq+uktwpoIOF5AEx+Q7dVDCtsAr?=
 =?us-ascii?Q?+NKOK6e10tR1heM2XwtzVBC2lSBvmydH9v6JYAQwwtfgJ4C9k9jfJ5L4ZIQT?=
 =?us-ascii?Q?WibzJnWj2oPt/k6ndFeBwTIAyvEzEC8ruCNHxO16jgP9TmMeyqWFoU+LrM5c?=
 =?us-ascii?Q?eB60EMnPJl2RFaNCnIGntM0SLJKSMXTO50h1pAKzRrn2TTLxq1U/HD+VxQ+s?=
 =?us-ascii?Q?R/FZIM4lLKa+Q7QBvQ59tdw1aR+pbj13DaM5jjMmFhpgi+Z0nV56uB2u88HF?=
 =?us-ascii?Q?hjTEWcm9PZm6aiSjjUcqOQkJwz/lqtt2rF5IO1kwden+Pc0xUuYiQu8WwdIl?=
 =?us-ascii?Q?aOK7eN5tFT4ZYEJOWY+1df02F4Ol5PxPHRWcfRWn0s+HcynBQ3smYzVUYyaG?=
 =?us-ascii?Q?L2KbznDwPuf41HKZSuvjDmxM0q0T8T3i5cdungYUGgKYJ7v0/oTCFEuCEUkM?=
 =?us-ascii?Q?grzExh75gGbfi7g1od2a8DBJv1U52xD0dDPnmb5NNQrUDJZT8Cqfo0bOao7j?=
 =?us-ascii?Q?iPLSu99eL7mPOrVjvZS+zbfoz2HjSBvmiOIYBlABPRQr+v0dnbfIgK4zOC47?=
 =?us-ascii?Q?wf5Lyu0CSmWxJ8cr4eljZYQ2zw178n7W+HNzd+c4DQXnM1odvmn9eOW8ZBWy?=
 =?us-ascii?Q?oZoCBd1xlgRU/OQUxLMbSIOnoqGOfsnU5FYAjSD+tvbgnOK8ovecncvadumw?=
 =?us-ascii?Q?Dzrnfsvk6o25UpBRBZXUasrS0G/UrPm4RoIJX2qY0YyITedRRV0QOuHpFAu5?=
 =?us-ascii?Q?rGgw7Wm+MywsStkVsPyfPTxMj436M3AG9Dt1oUs7UV+OIJftvLvyeSP+aTff?=
 =?us-ascii?Q?cXj4unrkpmK0C8VcxH7/MNfMOo17F5XJ09jB+7t92lHwSpO7mcEAdap/5x/W?=
 =?us-ascii?Q?jmYg6xqnhpg28yB0A9LrkKll2WsgH8Fb6pcJe4rXMBBbH5X2BQ6X4zRy0nNa?=
 =?us-ascii?Q?lH4QXBSRj4n9SvmEKTF/7mXgd47Be9DyltaW37nQCj7D9vBal8hNfN44Kw8a?=
 =?us-ascii?Q?C55mzwoS9yJcjcrwkVyE2/UG/SU7glgvG6N5vSZHWDTiZTheinZ+eLZXUGFR?=
 =?us-ascii?Q?kHo+kK3OjZVAhj9rlZgw9x5ogQxyhc4e5cXRqO24plq+YIWHZBCjbQjoljff?=
 =?us-ascii?Q?HKF38f8PLjIxyWQb6aPKB9x0dH5lyfOg5j1XHWctUFroyVMobznptRv7BiUI?=
 =?us-ascii?Q?DETaYJF3C9/0cIAk/zVrQABbDcWJ7CcqDhhCCJwrrOuc+vkN3Y2t8pKQu00t?=
 =?us-ascii?Q?V9ZKOWlabIZwtWJ4nBcFP9nnAqTHj1yTaB3lShsxy62bCTaCftWx?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2965c8ad-7c20-42a4-17be-08de602ddd94
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:32:04.3328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XYvv3ev5F22NQMiOiTW2vPMBIqBwjIpv+WIceL1DNdkpg3nejWWgs5yelNQvTIQiR7LswZ+CYD6AR3ILr5I6RCiFeSpuk63aMc/b2OvtN2X5NacOdizcBXoNuAcyK1Ca
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
	TAGGED_FROM(0.00)[bounces-27724-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 4CEFFBDC29
X-Rspamd-Action: no action

Add `out_port` field to the `rzg2l_mipi_dsi_hw_info` structure to store
the DSI output port index. RZ/G2L and RZ/V2H(P) use port 1 for DSI
output, while RZ/G3E uses port 2.

Update `rzg2l_mipi_dsi_host_attach()` and `rzg2l_mipi_dsi_probe()` to
use this `out_port` from the OF data, facilitating future support for
RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes.

v2->v3:
 - No changes.

 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index f74a0aa85ba8..8ea8594afee8 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -58,6 +58,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 link_reg_offset;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	int out_port;
 	u8 features;
 };
 
@@ -1153,7 +1154,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->mode_flags = device->mode_flags;
 
 	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
-						  1, 0);
+						  dsi->info->out_port, 0);
 	if (IS_ERR(dsi->next_bridge)) {
 		ret = PTR_ERR(dsi->next_bridge);
 		dev_err(dsi->dev, "failed to get next bridge: %d\n", ret);
@@ -1394,7 +1395,9 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	dsi->info = of_device_get_match_data(&pdev->dev);
 
-	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
+	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node,
+					     dsi->info->out_port,
+					     0, 1, 4);
 	if (ret < 0)
 		return dev_err_probe(dsi->dev, ret,
 				     "missing or invalid data-lanes property\n");
@@ -1508,6 +1511,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
 	.link_reg_offset = 0,
 	.min_dclk = 5440,
 	.max_dclk = 187500,
+	.out_port = 1,
 	.features = RZ_MIPI_DSI_FEATURE_16BPP,
 };
 
@@ -1518,6 +1522,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.link_reg_offset = 0x10000,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
+	.out_port = 1,
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-- 
2.43.0


