Return-Path: <linux-renesas-soc+bounces-27707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDXcFKPrfGmdPQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27707-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:34:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B342BD477
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:34:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A80430B97DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 17:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61DBA3612E1;
	Fri, 30 Jan 2026 17:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KKTOU104"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A2D3612DD;
	Fri, 30 Jan 2026 17:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794095; cv=fail; b=grzjjesZYE4xuhe2JVOLYiMn0gFYBTwFPlFfhm0hfU+E/F0pjiRP3mrizywfOUzYkzDrtwMYVMm1wUuwtpyX7B7RjtNIWDpxPXDdhcjOQkOH4xG4poeAW07QYTRJBgxDgv8lSKRpUVMQ7ZPyq3NIMBEGExvFQLfeCdcU06/Dh24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794095; c=relaxed/simple;
	bh=pNHir1G1ncUAjvh7Id4vH7HX5eKYWFXcXnaDekWFz4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=esYS7U+n7duwGaIWfbd+k5vpLWVChuhFj3MTo+txQTX55Nf+uQZpwQwBJU4dULu8+taaQfp1hYRNTHp1OW7aPGYafW+kf8QNf0t/wqBvhOOPfYgAnRhqeLlguRjvUkduyyHVZ/uc3T06VXXlW0uXKq9Cvt/mH+NwtN2xLLAz3mQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KKTOU104; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1x72uKo50TMEdYK1wG1WgxOXY5YXUUpf11uV8ZB/BBszAZpRg1nJHyj/MYQCobuTmnd034+z/kqMD7IuZkq7zI09hasmmR0+4Tkk3buJoVKIIJBuQokobHeL5yxKao/zIRLh3ZuHElfdZF0jPGSW+k0PzeskConcvlnrljJyCFnoV40MRHNRG6L2wKFSfwxxnX1cVji/xtuBFust9MdeeNnak2569lseWpXc0QkOTEF2GMbFF0pdh3r4jx1A2sLIP/nADtPaxpubt52H8dDmW/eP4nJM8tL66Wm+eDpMgslkCP25iHIW1Qk0r3b1QS2TeD44iHz3KF+2gntz03Q/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J45Fr3xGwGH4YHe39TdIvzUxyZn2JTFmnQmzzG2rveM=;
 b=Fe0BKa4DziyrKbGehIuX+IHdJF5hWZ4EsF8Bfmk7Xh4Q/UsUfRdIMnUdh+O34kv6AsO7to34aIAFERQJHThPUIqJ3Bl7dEy2A7JaorKQI4faDg0bq81sB37X/lJaJir1SlhoUQUyqfpEk+NsWYNvL0trlUlUzes9rgRy5kv8v94Iw2f/DOfqrzdIEgzbvRrxXejJOznKGg9OUifwL05zA3hblHqjFndnElw1U8Ydz/KmFJ9709qiLLRvtf8sPKltnRa0V89CfKOg5yxPUdwUm2rjRAk4jAKcZ6gF/lPxKazWcdXM4TMOYh+lBJWFkAle/V/3azhRoz1doB50ne/Ztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J45Fr3xGwGH4YHe39TdIvzUxyZn2JTFmnQmzzG2rveM=;
 b=KKTOU104rwqK8jgmdWxJm1hCySAiftYtObFnV+PSy43uwHb2swCHj7NEPYj8lqiC3QDzLPcX4OjPP2uA1ACU/oHz4reKyky0JVmCnewrmYttlegOmupR9tx8qznxIh0yCqMYdAeuxZl1PzK4WCJTkBOgHkP4N8B835m/cwB174I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13818.jpnprd01.prod.outlook.com (2603:1096:405:215::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 17:28:09 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:28:09 +0000
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
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 16/20] media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
Date: Fri, 30 Jan 2026 18:25:13 +0100
Message-ID: <84b608fd5cfb04c8fa05d244ac724c9479e8db51.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13818:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a44662-6b6f-41fe-c2b0-08de6024f009
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?xqhmtBIXb+onBL9hmLJMc/iAxw/dJVVpaazRynqWeFQ27yt4xzcX4QAOxrbC?=
 =?us-ascii?Q?SzQtAs9oN+MCpnV7yg71zID65++JRIjMlKmFo6moIPsfpFlnkJFc0J6K6745?=
 =?us-ascii?Q?UfdP8QaqROEiFh62CCxlgI9rsLucucZUb/pmOTmfEPgQyHPHp1fcOuIORHBX?=
 =?us-ascii?Q?IZ1v6yuOWRciOtqXz6wKGJQC3VdxXVyl+6LW+IuftjjuDRpqzmwx0WQ4PujV?=
 =?us-ascii?Q?8+FjnYojZuRQxJPLR8phK7+fEOWQnr2mhh8hBbQhpKeZZRIvUGUx6KINOAt+?=
 =?us-ascii?Q?RwM122Z5iDlCdJ87BpnD4M/zeIuRSzLuaUnrxW/HflRlKHxTZED6VggCf5H6?=
 =?us-ascii?Q?D0sg04+NrCZmIQn+A0rZOarsdKs1qTmpERyPvMjg3NUf0X0IpLjEmEEjILJx?=
 =?us-ascii?Q?cBOy9bCkmKcdsOalAGRebMpeCJsJFmH/+ItcZdj8wX4bP3pgAMjEpmDGT8p8?=
 =?us-ascii?Q?hvHkHnpn2l+utrqVk4np7xWIZt6GXcQoLcX1Mv6kRrff7MHDuLELf8RJNU/h?=
 =?us-ascii?Q?yEiM+nYNhKj9LO3baCQ6Yptzu9UTB2QaOXr2fmePkhHcS1LLSloP2qChybKp?=
 =?us-ascii?Q?OexIskgrC7y8LFftGTgy2yl7saBGg22Kl9irdYHw6F1SJ+kkU7gjU/ZQnp37?=
 =?us-ascii?Q?QZ0NT5gTSuuYZR3OO4MV7Icr6q32pU/nmHnILMiywOwgW8F8yNQo8RjbgfXo?=
 =?us-ascii?Q?wOH60OsK3rogYDt68GawGPdeluob962Mi9WzHrXw3sEe5+eAg1/Ly9Kvot+d?=
 =?us-ascii?Q?X50h8+GO2nc8fWKsLriVjWEDntlOk4eMO+D0b+MBhPHuJhsVXLHTdEy58ihE?=
 =?us-ascii?Q?6TAvcVfO+xuMZHNt7QQfLL6UgEAFLB857jL+voPCK8kzhO94DL/Hm2TH1vPg?=
 =?us-ascii?Q?zXHDw37vg1K+3FIg1qVdQ6uk9J20oPY2NSYCDeSBDu82qf3BGDF1NUQKLayb?=
 =?us-ascii?Q?jU4tbotDK1VRVHn6LZa8HFphYDJnOwgSnZxpvZyTlevsjVN3fiXT7feu2SgH?=
 =?us-ascii?Q?/diF2qFVKTgbUWlOr1j6qR102RwJ+hG/uRamktviTCcc89axYAZxrW9l/Z2l?=
 =?us-ascii?Q?l2qlEiXPmz1fWvOTxJkmx7PzEBtqYuJO/x/OANFzzSkGnwLpbTGKztrisDBO?=
 =?us-ascii?Q?v59oiOLKJYO/7bvGsJ8cVXUpx+Ys0SW8m4EyQTR/eEhLRLv7tvT2IEx3JUi1?=
 =?us-ascii?Q?vHWHUozDo9EMvJAq311Q3c2wEhSGnl9FTf7N4a7qcKvBb9x0liL4lqeDZy/Z?=
 =?us-ascii?Q?QDH6ZUbtgF8AuCAL6eXVEysd3FDbqgo1kns9oNndQU+9VTuVIEns1xuLcqb9?=
 =?us-ascii?Q?jsLBcQFEo2sM4sgu4u2kYFn8CZxhv6CSptLqWBr9yJcsQSpBFKq4+3WD1Exl?=
 =?us-ascii?Q?+gVFPctjQHKMKKN0pdZuR35DkBan/u4jcctZgZjTr6MAgxQiZ1GLD93Yzyfl?=
 =?us-ascii?Q?rm3ef1lO/DrdHDEMD2RFyqe/Cpt6hmJlS/0vibJDXcdNTicBn5hz+iMCtJGa?=
 =?us-ascii?Q?FcTWRrcCQe90lsTwohV7OFC/j4/FMnzl1qpVH9FU/WWwN0RqZMAr8PU/da4B?=
 =?us-ascii?Q?VKDradSHaqZcs4PKSEsrXePHkeU8MnqsDUn8Ur78kvZaNHC5be/Cti6dJ2Nz?=
 =?us-ascii?Q?uzSy4p5HEszRL3jvn5W9UsE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?pWiAVoRRR4ymbfd8BM/qxS0Xtzihwg+gD9Jjz8iln7bFx24mo4M3IJziaw+E?=
 =?us-ascii?Q?IJHR9pFhh5nuYKZsOn2A1hrOGDbMJxKU4eNRSIWwUMP+U2esZpWbFm7Fg7oO?=
 =?us-ascii?Q?9FfhoaLyOgvXDpFYaXyntXjdhBNKS5ULFC2O6CJWf7Zx8FkjL+FU/NpevUj5?=
 =?us-ascii?Q?YKfXuSoT7gOLZA8RLuMkOq8vQ2vEoNKrOIRr8z5Gfo4HnRxB8x2LycgXtqP5?=
 =?us-ascii?Q?UaMNYrOYFD/d8/6YTZsn4pGzsjiraURrpu/3sXO3tEM0X/3ZDoJG/FcoIjDT?=
 =?us-ascii?Q?kPEwUODApQ9zMwo6KDcVeqLa3WMcxgSf3rTne1dv2dNzk6xBt1gVaXcUsXuJ?=
 =?us-ascii?Q?HG3PdEPsmTTtOudewkR2dp3X3WYf2VjD5fGj4I6G4lVukgUIgytTEl6geowx?=
 =?us-ascii?Q?sgWJxABJqIFsSfF4Qu4/tq7XNHZHW272OqkSN7DMOHV0H6p2bZwkkxT8U8KC?=
 =?us-ascii?Q?rESjgJeOP4VwQyY53wbB75fOFIEKsI2OkgbZCNejq0JPptUia7AcAgzFCOAC?=
 =?us-ascii?Q?TmL3OtUxOidNdMbME3rKVDucFezxV8tlpuNzzYX6k9PBwK6u58JbrjHygDtG?=
 =?us-ascii?Q?c5dfGUpOarCrb6rFd7C4LcTXWdHtfnO6GHM2EFk5HfQ8OUDr5FntyNv5Ao22?=
 =?us-ascii?Q?a84qBnumuCMXWpyF2B5DhTySiuRM+92k+ss6rbJvFdclSKZQSmVIFfve1yB/?=
 =?us-ascii?Q?4sEu47vkNkcC/X9iAqBPrCVSgqiZVNBaS5r5wOSg92Jy9UnDwK7J6wOv/HMw?=
 =?us-ascii?Q?eoezWuyiXBuuRLQxgY5vahRq3qy5GKohkV1GuLUE1pZh/LtZejYQY+XfVDUa?=
 =?us-ascii?Q?H/0AOQRcSZDUHi5z73GzvPSDGJsigWyqC2tLP99X3tlDjHFcAH37yYUzA57D?=
 =?us-ascii?Q?d5ZVT/MlNuhxw5xJwc0igpkOqtbaCDbsRj939mCd8XYbGyxor8Q6brmHV//K?=
 =?us-ascii?Q?TZcnrYzlrZjdm3ohs0mXipgh8azcQgjGs6rHcQ2UxDpLhvyd/ZDIGXUMkdBz?=
 =?us-ascii?Q?4z/VdOyEj6kafTuO33y2Z1Da3TaJ3DK+WGyLTI8IT+5PrHKvyjcQhWCCFnuo?=
 =?us-ascii?Q?NzYKPhmkLVaYe6Lv2ZVApwAQZKiY0K5bdjYgRvTYrueH1puRYvyMTG2M0Or2?=
 =?us-ascii?Q?LS5ZASPU6Y8/badXQOsmLQ9XkQn1L7DFRDo5qlJHbvoEgEUJP5dWPaS/FOem?=
 =?us-ascii?Q?FsOMJ7LaAxuwMKvfjROai+lU7J7FeLthJfeq5R0WDVVAnpTXeQhXydtO+44K?=
 =?us-ascii?Q?NWkHcUPjUU3KKMPqWnsSBax9CO9MkpGr5xO8OFSScBG7zzoE25sT2Kv1czLU?=
 =?us-ascii?Q?8v33QyO576bSV1uWSHdHDQ5eMC/SUYzlzOsL420O5SccGBHaeqSRPTuhMkmQ?=
 =?us-ascii?Q?C65FNmlwXJEEImKqLRezo448q2rIRXZEP1Uw8VLbFef2APVUBwzuhLUNP0PB?=
 =?us-ascii?Q?f8105YHrCIOnfbal4jjBzGt/kkPuD84d4FT1idx0OrUXajFyIm04lS7XwKmV?=
 =?us-ascii?Q?v4KmsLGg+j8VtejXhmuWsL8juo7/C+NJAjbufq9vVA0v8HGUmHZcjLhoVd6S?=
 =?us-ascii?Q?xZvorjdJsWGoWP/TEG8wlQXWXa2TjXz8GQcCbjiUNI1d3n5VYuI+zO+aJJOl?=
 =?us-ascii?Q?64XXaBb4mpO94834XYS4p7cwyZwXlXlEjq1hzIWoMT39dc6Tt4Lt+CePyhvK?=
 =?us-ascii?Q?hkmrjX+3XhMdkDy1JWrPLr3gwKngropsmnKmu5c9XjJwR+FnvMgNAgG5+f/+?=
 =?us-ascii?Q?zNqMP01uxiX1L7wP86NOXjcnpKuA+iOuJ8856m+iw8GNWV6bLGVw?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a44662-6b6f-41fe-c2b0-08de6024f009
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:28:09.6348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQv5mZY47S7wPcMZzDQHXWZ5k35h1BF813uk3RcmrL4QuqnIbLrSyuTQNGnVX6nnVjfhKjHhQpfJqMD66yeD7XHTT63xDsc+kf4y0yTf/Hk/F9Vb1RhCBKJnCip/A+79
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13818
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27707-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org,oss.qualcomm.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,glider.be:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 8B342BD477
X-Rspamd-Action: no action

The FCPVD block on the RZ/G3E SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,fcpv` will be used as a
fallback compatible string on the RZ/G3E SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected tags.

 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index b5eff6fec8a9..f7e486e90e43 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -30,6 +30,7 @@ properties:
               - renesas,r9a07g043u-fcpvd # RZ/G2UL
               - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
               - renesas,r9a07g054-fcpvd # RZ/V2L
+              - renesas,r9a09g047-fcpvd # RZ/G3E
               - renesas,r9a09g056-fcpvd # RZ/V2N
               - renesas,r9a09g057-fcpvd # RZ/V2H(P)
           - const: renesas,fcpv         # Generic FCP for VSP fallback
@@ -77,6 +78,7 @@ allOf:
               - renesas,r9a07g043u-fcpvd
               - renesas,r9a07g044-fcpvd
               - renesas,r9a07g054-fcpvd
+              - renesas,r9a09g047-fcpvd
               - renesas,r9a09g056-fcpvd
               - renesas,r9a09g057-fcpvd
     then:
-- 
2.43.0


