Return-Path: <linux-renesas-soc+bounces-27769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIr7CbOTgGmk/gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 13:08:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D02CC2F7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 13:08:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 840993033895
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Feb 2026 11:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5653644CE;
	Mon,  2 Feb 2026 11:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="T4XXtouR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011055.outbound.protection.outlook.com [52.101.125.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4549736402F;
	Mon,  2 Feb 2026 11:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770033594; cv=fail; b=JzR1jhxdgwlGPpx4lSL2BMpbeem4O6D6wH4uorksiNGn4a4MGKauk4LBJ5XmR3CmWM7AJMX6mL9lujA2STWXQUCbB/rLFiQJDSgzAHlFTPbv2GqH5qGMfzHHdLlJ+nDrjNxWFfq3SXm1ZvK4P+nc0zt88PO6UAcpGHBif7hZ2jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770033594; c=relaxed/simple;
	bh=p/Jr5tO0JMmm41FSRb51niOR4u58x5/iGas7r07mUDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qKo/pBlfDaspIS0P13mp+dFpFyZbOdR29Eqnlr4zTeU2mwKaXFzWlgh5SiGoXEg5vQeIpXkEQXxI7JKIujzU36N18jlxtaGHkX9ej0eGOqQmFIxMwNbfOspXgVdNdlzj4X2iqzZchwM1+z0KTl89nkaF7vaKVvtVFTbJr9Hss5o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=T4XXtouR; arc=fail smtp.client-ip=52.101.125.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oosBuxKJm8C3EPLsHZKS5z3q6MrrnOnkyLAsCmhCrzyZ6B8ymScQtydwji8Uq2oeHUu2M08ZW40l49n+Mc2LuRWZJhkZsQK6IUW45JnbDFgGHQOu6ic2a2mpRvJggsce43hlWB5u1Wt4Wck4B6+0H/yuXi15yyGPbYgGi34Hm/vQTCuAsFrt2+uqN7lheIWiLMd3KTarQxhYvY/RzbCTScA3i+N32kGO6T2HjJVImYBFMnnzI+ilOAMg71JZOFUK6r4V7NaCq3FGYU8fuVkwCfQDajN0lHjfYEPcrZfqdEERwSrfZCwomMrHwHxKXWFSAxO34vn78ul1VsctyxDAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0k17mhuTXPWmC6q6Bhra1RkPwqU7e1vUo89OOq7s74=;
 b=Cge3VKEF0BGXLdw03rnBoa6b++RwO3rXGvsxl1VF6Wr1m+SpSSGjdHnZndqjF8RmS5wWRPNyolQn8vt3VViClK/nqWyjS3Iv6/AEXT8QmszHtAa2zYMvOwb/n5hOhdiLCUPrBmdxAbl09ESFHqLoeGqRk/MkAsKczcrSUKYLeKdwk8ZXQJQkw6tfw3SzEZV9AgtHIkB4YUta0qQSgix9DAXUSgiSSwXfSitAhB9RJZYHNickieRJT/Lz9SLVfvSjpw0xvboGepBZ5v/QHVJY1d6Ts/cK8Lw/Q3ivUU2OHbTxCmdCXyXRJPrxofxM3tSVT/TikT2fuQ0aBrH+IGo2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0k17mhuTXPWmC6q6Bhra1RkPwqU7e1vUo89OOq7s74=;
 b=T4XXtouRGJCFRBIYa3LgELCk7x2XhvF3+UCWHD6rqHsO1MdhssyE0KiiNrdXOWndkPalm7yjGdV3QoJArwIEjB2L/VXBdEN0y1MntPVCPg9yVJW2IdLtN65WWE1R0XpZanQdtOrwpisAj9XUbRR0CuGfgPZWOinT8vBg8uiaP5o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 11:59:48 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:59:48 +0000
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
Subject: [PATCH v4 09/20] dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
Date: Mon,  2 Feb 2026 12:57:40 +0100
Message-ID: <4986c5a3c5cda9e754ed1f9f7121b32e9bf4499f.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6af5a5bc-0385-418c-e37e-08de62529066
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?jIC/u9RuspQpYAH8tQOOtZbGmCuwRVuXMQYt0VV4Lt9Sa6G2MrZS/S2uvrNa?=
 =?us-ascii?Q?quMckBJQRaSa8bHa5aT6w152KHG6uxJJPS6WQUxeoSliuY5M60DD1TFsSwpj?=
 =?us-ascii?Q?4khpBwMhuXc4bma9EoPpwUS4E9nYxQHAEFIS9qiANsqB0PTnumo38Z9LeoFr?=
 =?us-ascii?Q?w5ZhSqOOBMgod9hIueTjdgTeBtVVi2Dar2HSBX8CYt0LmCveOyBArdh8eJeH?=
 =?us-ascii?Q?2ooTq/bC5jutxZr7lRkqfaN+yCLyhCpaBeiMW6lC5Trjqs2pVjty3OM/FJHv?=
 =?us-ascii?Q?3YqYvvEuXSTD/Zx5Lrfaa+pOdQ813y2USM7KOOIp3SjJ2BjNfFf5MnLfCxyi?=
 =?us-ascii?Q?PjqaZAFYoPhqLsBKk6b3UhlU4oVh/5av23myti7QWFwOLKrypGb8puuslGaT?=
 =?us-ascii?Q?SK5UoNBFK1OxJdfmZ4D/SGIYKQiWB2SAap4MDZk6SUhOTimb0BQnaQIfVIbz?=
 =?us-ascii?Q?1Wrxf7Yb9AbWEi2FVt0Tud5VDZj4cklrx5rY+CeoMiPe7aVXlK11aPbtaUiV?=
 =?us-ascii?Q?nHy5c931UorJeKQWSuUiv/0wsjqLmUunxBzaFlvZPV0ymufCBMZqIJocC8d/?=
 =?us-ascii?Q?+z6X3MVP8VMYRbblanPxowyZqQWTBBregLXEYgSCJy9DPqApSa1kD777S/fj?=
 =?us-ascii?Q?CaUXvAiStpcnpYr1wf/SgAg3tiKjRsE30DrjYfqHT5ME2TUFDKWqAwHFiwgR?=
 =?us-ascii?Q?Ju+i1kQfhL4WfSFgtRi0Rj1fnxSSBX3txFVW6jQ249hEse2JiUvs5scNyzOO?=
 =?us-ascii?Q?vyySLt628zcCUFPZEzlZfySlhlG1VT5yD0wznW19UdgAjr+DFFioRhTZM2sh?=
 =?us-ascii?Q?ziEy8eZiSl9i5BRboI2Z5O9zL3kCjmPAjwdQoKodilPIaz97iuoptiu30j5W?=
 =?us-ascii?Q?D4eyyaLrWZPvkDWrrDreH7rwKCBK7j0HrsQ+BEReRD85EoWKWOAXb4x1+sYm?=
 =?us-ascii?Q?cSSOsIgAhNo0RIFuPz9pDFUd0+xXVLYACuyZrZA9ThrGNL+JnjWpkPtL66+i?=
 =?us-ascii?Q?MiGVnHyUfyYs0UEgDLv/+BI4dWY9KAbzmWMsHnnq7sRFSm3ynABUG9LFNVJe?=
 =?us-ascii?Q?Yob6QwwvHV8vm+3Ky0PMn02FCuWxfOQI3IVxg48S/eFWuS8IxAAGfPrWPSl4?=
 =?us-ascii?Q?eAN27yC4vBB0a4e42rQt6WvkawaEamlAZjtbWbk0WBbcQ3/HAKse/akn4Z1D?=
 =?us-ascii?Q?ai6MhaCVWNckJyw8WyU8f/NzKe9vhmKUeuWbU+KTJ2c8jhctZqULGt+lVXFY?=
 =?us-ascii?Q?riaRg3o1CJvj9yeqHALXxF7jqq1hE+iFopIXcH/NiEWPgqu42KsN9NwNRVXa?=
 =?us-ascii?Q?P+lhJYde43G83RwI0/cGdyHja9rqvbZDD0flINkSkw+DhIpcVQiFMRa9QURm?=
 =?us-ascii?Q?vTa64vNXOzFLWtuJP87hmble+S7xRmsmDjTivvKvyQnubFNcZ4zxuTRWJan5?=
 =?us-ascii?Q?dL1TsHUPjOiZpZzIdo32aTIa4uVpFs0ltmNPWGnbEfMzxNTd6XcLtEK9D2+6?=
 =?us-ascii?Q?IOUz0Vr3FGpNa46w3PIEy5fvscRw/P4ezp9lnHX9TXCBy4BKUyeYMueYd+GE?=
 =?us-ascii?Q?if8mPs0VRF85xjH/Bh6KVyXRdw3XsAc5xEZ4S2VGBfAnQ/1UffY0od7iJ5Ng?=
 =?us-ascii?Q?3w=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?vGrb7padlJuhb6gP2v+CoNGQJcxgbFb+/UWYePCqTCJj2mabjq1ydiFINqUo?=
 =?us-ascii?Q?NNNz+bTaFtQvh7x2KDCqSf6lu9lnuBpcPLbGiYwmKHY0ebJBVe3MvYAivYer?=
 =?us-ascii?Q?Bn95Ofm8rMShhnRBc542kwijM9+Neo+Af3cx+Q5FXdE0TzmQc2HeHhYfJiwZ?=
 =?us-ascii?Q?vMXNi6JoaZLDCDtu3cc4HIUMB1muELi5FvXtqFO9kvcVbq7Q79qVuQ7FO8Mo?=
 =?us-ascii?Q?Xxcei5O598CiZIHVe3yV0Q4BvFf6JbPqpS3t1mLOk2Pmpls6PBvxMJyvxYaw?=
 =?us-ascii?Q?ef0Az7i6kCWaqNi5s8gjSe1IgsFkcd9E6boRpb8faKld4leUbmO/9P3JUGUl?=
 =?us-ascii?Q?EA54nLZPENctHHlBy7wonp21WAheCLTABMnbpAnNE4g1xGK2ZZoYMQJAGaej?=
 =?us-ascii?Q?meL5mj3LNGf17Ij3rwuia/eFVNX59dZ+7MoaoNfEX28ID0wd7N8eVnkiatTS?=
 =?us-ascii?Q?iIs2hPykFgyl89gfE+g92ZJc24KGrFfbg+ecAyh4dTdC5VSrKU7v3NOw9FHh?=
 =?us-ascii?Q?rh/V7TdtJH8qAA8mA2/5hsCU+Cr0HJSIEYzXReA45oVeFbgv9RD7iEs+t8hA?=
 =?us-ascii?Q?PN2NUWAHfqLed+3zpKsN0MQ40Rdt0AqnpMu8t2giGvQjWdlWOiYDguokleiz?=
 =?us-ascii?Q?ptYAsugM3yFDGYeWKOe6N8WkzinhxLXeTNmCDQpDxGM7257zhuw0tLvUQGAu?=
 =?us-ascii?Q?xL9sn09rrHHVaUaz5RNbkk8Bebv30k2dMR4bVpaJC20+f1duevkCqB8h9DFo?=
 =?us-ascii?Q?Z3Dlp02jLDDepbXXbv78G8kFA5OJIci31EfH7nO/eoiwiQTY3sP711h/tREg?=
 =?us-ascii?Q?jadYxgd6vfTPUS7/DsWYFsV7uFDogXBscjUUqOb3BnDkagVrLZR+EBxsF5aA?=
 =?us-ascii?Q?2lsynKPXmMc6r7WsdkHvAAFsel5DbjkrOx2f8+ge7RGMhBupwXY9yxp3sVSY?=
 =?us-ascii?Q?j0TZhVIhH/kgkFM0E8rg/JYEBf8WNq3/YDgfK6+anIwXGLke9StO/pauX393?=
 =?us-ascii?Q?1H0hGYaWEF7cf/oit5LvyYcbPXaSFTHsli3xxhH+4e2wBjEvH+1D/wzfm1eC?=
 =?us-ascii?Q?qT5lEadNd2ADy7sYAY9IWdPJ/YWYfv2n6Jy+jMIlRAeDqWCqXHLZtZPZguAm?=
 =?us-ascii?Q?CY3LyVmoExN+AQ4ARLd5Bn1ViKjoPAtt6STKjwnWnAPbqr17Qra+nWI5lhi4?=
 =?us-ascii?Q?AlPmRnGaKRZBT66LTSv5J7MtIFhHbzwpb6XtrFBL7ZXZxD8dFba0rMH3Vdhz?=
 =?us-ascii?Q?S1Sw8TyTqpTnw01wOE4DpzxFC3XO+YCXHY+2mxGj5N8Dgnr1HTFQfXGqkwDu?=
 =?us-ascii?Q?I7h4iTBXjfh5sXNqr/vVhGl3ciY75XpiRVHmjjzacO+PgzM92BT3vu1oc/cK?=
 =?us-ascii?Q?ElANOXvctRSdRFaAQj9HkcxfXC6rTQbuk2rQnW5/odjVY5Bd91FGEqHs1+Lu?=
 =?us-ascii?Q?0aiw7BqPjVPg5gyT+VHLG4fQQTyvZFB5judSz62fKDG++HySR7hVivAaJTxJ?=
 =?us-ascii?Q?gQH7nn8ZxRVFW65zQT8kfYwghwawP+sNY4InBDi0eEVcTk5bIs4b+ByUz1lQ?=
 =?us-ascii?Q?jgv7TE2h35Gh2PuBy23IHyRvMQJYf248ARk8cX4dc9nKUqSwE/MbZ+T+EncS?=
 =?us-ascii?Q?X/TB/zcOeapl/OAkS+Aq3JFVZcpA3yNHww5j9AFyT+zQDUjQbVfNPgLhQ+Qu?=
 =?us-ascii?Q?7ol0PXFZJ6RXvdFYcg82J/+PKrhpITojLdW3/mAqTFmhpyWJGKKabRoEdRwp?=
 =?us-ascii?Q?CU2L514uATb1KrbTLg0WMIn/31IHJwzwOToTgOd4P82SsSH/aAzG?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af5a5bc-0385-418c-e37e-08de62529066
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:59:48.5976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCrFnbRaKk+LhviNpxIEAlTl7c3dx/hZrqVxEv1+pf9Xt6loCqIXEIDV6dThujGHm45c2fKpsZf5k09VWHRe+7Rerzk19mGDXerOhUWPTsd9zEJv93IFAiOTSVg3i/tx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6552
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27769-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,0.0.0.0:email,0.0.0.3:email,0.0.0.1:email,0.0.0.2:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 88D02CC2F7
X-Rspamd-Action: no action

The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
Processor (VSPD), and Display Unit (DU).

 - LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
 - LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.

Add new SoC-specific compatible string 'renesas,r9a09g047-du'.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Use single compatible string instead of multiple compatible strings
   for the two DU instances, leveraging a 'renesas,id' property to
   differentiate between DU0 and DU1.
 - Updated commit message accordingly.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 .../bindings/display/renesas,rzg2l-du.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 2cc66dcef870..55e3fcff7030 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
+          - renesas,r9a09g047-du # RZ/G3E
           - renesas,r9a09g057-du # RZ/V2H(P)
       - items:
           - enum:
@@ -53,6 +54,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  renesas,id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+    description: |
+      DU instance number.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
@@ -137,6 +144,53 @@ allOf:
 
           required:
             - port@0
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-du
+    then:
+      required:
+        - renesas,id
+      if:
+        properties:
+          renesas,id:
+            const: 0
+      then:
+        properties:
+          ports:
+            properties:
+              port@0:
+                description: DSI
+              port@1:
+                description: LVDS 0, Channel 0
+              port@2:
+                description: LVDS 0, Channel 1
+
+            required:
+              - port@0
+              - port@1
+              - port@2
+      else:
+        if:
+          properties:
+            renesas,id:
+              const: 1
+        then:
+          properties:
+            ports:
+              properties:
+                port@0:
+                  description: DSI
+                port@1:
+                  description: LVDS 1, Channel 0
+                port@3:
+                  description: DPAD
+
+              required:
+                - port@0
+                - port@1
+                - port@3
 
 examples:
   # RZ/G2L DU
-- 
2.43.0


