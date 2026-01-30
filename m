Return-Path: <linux-renesas-soc+bounces-27702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDj5L13qfGlTPQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:29:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 677B5BD226
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35BE5304121A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 17:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EBF36BCF9;
	Fri, 30 Jan 2026 17:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fcMIBO1T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010011.outbound.protection.outlook.com [52.101.229.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310C5364E86;
	Fri, 30 Jan 2026 17:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794053; cv=fail; b=pYVAnxFdiZd+qNp+mmSK1wbvTW/pN9p7NzXioGPnhIojBZplVCpD0Jb5ltS7XZeXrEZzkLXumxZpSunyPM2+sW4IF1FAkzMLUMMZfttnK2Z3WW6bHdzexQd0DvlNRvIAjaOhuzjpKPoXG3lvE9PzbDsNpb5PSE5YcbrJrxmB9Zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794053; c=relaxed/simple;
	bh=VRoEmN8QeDTRVRVbAuvSFpH+t8WMNZyUYWKvDji7kNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dk82LagGGI4Vkn8wKgBCq7blhXnKfFF0BEsJCpDY1AVMx3gX3lqdD9+WRV1i8JPWWA+0rDtn17LKUFvSohV2BntfKMxIhce8yECS2m5Ar3yE9TxuGYfwiivyW70azldaYXbcQl4NOasUGU1H08bJMdErMF1PO/2pn+lk3KxJ224=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fcMIBO1T; arc=fail smtp.client-ip=52.101.229.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mje6eAjy4CaVfprpY1+T6BOY3BBIrgKxbkDSgjAYTj2KSSrwRBhcbxRHZCFyaYFwoyG4BksJ7p93fZC+wWSyAsXvwEl+ZBQhgo6Bcze7WxiIHOctJi8XMZnWluQ2xGoBavStk73Kk4wHH//XfH7F+IsJMdHqio9C9cSwY72SucX5HusjoGh0HWy7JaXd7bF4s7qSNxFyVh/RXPL1XeOCoLvMehKjFpsi9SKhxkmschXh5X6hXDlaJcexrxny4Mhmen/VUZiEIrcIvyxgR45AKMqROjBcPSrl+bbT9eXkDVtE4vmJiqIePSiel5lOkYYsgc9XAFV3HkDokTRIVK54pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QeEo+9Z3447+i5FL0LhMXSJl4EtKM5eN7QNh/2/4xkw=;
 b=EFvR+IzNCvnPm7iU0LXwbIBF8P06MshZdS0NVbZGmrAcgLfz21I0UzH5KsNf9IdlLtkuyJ5IKR3D9FF1SSXy0A169aYAvk2IexM9kCS+gWynPkwI81A9Qmc+B7MfzlOKvpfqdnCZdelFwLzwQ5vmbcavfcZUXmUBd7yznvUHWRICySlaC5bHvDSS8EqlOPjCSazjd0yuvH3UaghxqiTJwOGAwlzOBDthFuVj8zAN070wa+Ad1UF8Cbd3VKdhUFA7P7ERcETtSKMBL8ETFupURfrAV4gkgWo85IZfsiUI82kAB+nRb93rwjIHpFQm0P6ZeAKvGmBfkxm1mi4gf1V8xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QeEo+9Z3447+i5FL0LhMXSJl4EtKM5eN7QNh/2/4xkw=;
 b=fcMIBO1TlO+HGv+7U9jXa/qVDJvav6wV3z38UOUbNoW9J3r+jbhY9QXJ/5gBoKDN470/vACTCeARZOOp9MVST4V0eN5s7el9uwND/Xd00QNdJrvqqdzRCpFbXVvnp3hjYXVEXiK0GyX+sXqtLcLIUumoPgpDnaVDFuJcIszDY5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:27:29 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:27:29 +0000
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
	linux-clk@vger.kernel.org
Subject: [PATCH v2 11/20] drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
Date: Fri, 30 Jan 2026 18:25:08 +0100
Message-ID: <22adba9116e8bbe3005cb451ed0e35c43bb1354d.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB10351:EE_
X-MS-Office365-Filtering-Correlation-Id: 03dcea36-4cce-45e5-02d5-08de6024d7e0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?hzVfTCYa/Pi+x7swM4pjb4o6yVqxrTyH6nl3PyU9cjCNPQQ1JCK3Ba5GrYSR?=
 =?us-ascii?Q?x4lAdEKQkcVgK1jqaBvnv7Mkc2Y2NYhr+730+bjE9sxTAR4kAUmLf21TxBuL?=
 =?us-ascii?Q?4bdzxd04cqqIMPqrEOefD/0b5nmz0HWmDl0C6BR1xR5l/slp/ndgp1aqDgwc?=
 =?us-ascii?Q?fPpuh2TcdNFq5a8W8UnhEhRStH4QOTDUp+rDGsr6Jp/yBh4wQZmzMq/1TGJi?=
 =?us-ascii?Q?gHCuw9Cgt7k5XoKW3uj8foVXLiUZWwwuzTFyYysq9A09fwX/eGBf3vGkUAgT?=
 =?us-ascii?Q?dSbp8ucdVNxYNAQkP5WjjQIAawN99t7veEDAN36ICeFiIclb4+wZpqdi9x4i?=
 =?us-ascii?Q?B4yWi5FOInJK14l42QvxTdxP6/a/xJHTLHLdfSHA2XYrYanCsmINj8H2Yxan?=
 =?us-ascii?Q?6FWG9tiF3RloiuqGpZ7AloDADNrdeqrjSRy+SJxv86m9ZXBQYG4xxfH7VzRG?=
 =?us-ascii?Q?OApauugvbWYBXUHm3dUS4KIMSv3Nczcpc2vvBQS1lhTdA8FQGLdRQp7OaMR2?=
 =?us-ascii?Q?ibk5U7WVpCMxoolcUi3/uwU5a2dvnMX+BA+yIDhz5G9ctS28UKtOpgcSu7hX?=
 =?us-ascii?Q?ePIyeYbp1AtMpAFYyQV6rbONlx0WuCFxvjhOXHND9gXRi9/79Xe8pMkfXp7f?=
 =?us-ascii?Q?H9Nv4h6WMLCcSkkIUCjuNEgGpTxovLoVlhTgBDxSZGvdvriX+ax30oj32uKl?=
 =?us-ascii?Q?sgyiLLf8kIFxplBUiWnvfLsW5/XCb8e3t+XB40VFfgM7/YIkw4LTag/3Ajez?=
 =?us-ascii?Q?bM8wQINuH8PfQVgZxQyBXRfCoFZ82LurrhhqO4r0p9GqWmfDohNob1pWB/5A?=
 =?us-ascii?Q?JuJKT3HZZjJdoykg1Fgs/zpxfnUcfzPFH48OHKt/pDwnUC/RgMgMk2i45ofR?=
 =?us-ascii?Q?ASQwYyIt/wEY3rjBU9PYCcsWJpJXXqLz/mgZ/DE6AtEVSaM3OvfI/HhYHQWe?=
 =?us-ascii?Q?T5Ab/eNnH+qRZhk6rCKMef049QyB8g/4FAa/9HSkEwM71yoqvRTc1E2fIK2o?=
 =?us-ascii?Q?+g1MSFqvo7KttSjRoITKlJLrGYhnKRoOpjxugHIYKm41NO18rJxo8mAnGGIQ?=
 =?us-ascii?Q?6sVA8DIYKVpjE8WevhqQSjrUR6YAIYjiWg+/qK/2ZLHLXG4t3BkprP10qi7F?=
 =?us-ascii?Q?5FO8ptlKR1I4J3UNIYHtKrJhAP/lhTOt3KewVb9TG/WXhubibaGGwU24wmsv?=
 =?us-ascii?Q?QU/tOXRdaLIrMg1dbVyh0ZfjBpk0HmhBQS+ST1VwpH2BnvWbEh3mDvUDqEHj?=
 =?us-ascii?Q?79HV4WjVUMIgB8jxZWWZJLVrZVwsMGpdvMAuETG38GfWzwRUajUxMjaE/Qkj?=
 =?us-ascii?Q?7LPgQxHN3eHb3IPf3R4WYsPHxihJ/gwF634PTK1CanZQGq0HDp2RAND/DN3r?=
 =?us-ascii?Q?NbtcYq/vuRtVfMyMOlqs61xw46dVRzbCbGjq6hxgRPGSxABk9Pix+UuZYkXT?=
 =?us-ascii?Q?B7FRJUvHZKnrOAVn0eAfyuIHR8qRsRrZK7u47esV2kKRUDRLEvP6ifqlexGu?=
 =?us-ascii?Q?VVzhggjDmIFO2Fx5Bxte/a1v9c+SjuNQpx5t1V+24RDdHj3yAYGSlhkRU3Va?=
 =?us-ascii?Q?hyhwMdrLhSe209GGrLnUuC1bPK6N2/aZ8U2BIr5TtI3k04h2TNeR5NnAj6t2?=
 =?us-ascii?Q?l8QW+alTuRDHR2pL2LB4UfI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VgFJ45hnPhWyyabl/rpulJpxWU4kV3tNte4nreit5BhKLXsvKHDbLPYFLgEp?=
 =?us-ascii?Q?rR701Y18+hh2uVdBnEAfssvHVS2Yd27tHdzQNhtV9dhofg2S5PB6Ddr3N0tl?=
 =?us-ascii?Q?moc1COpLrrwHSn53dECXkAivsZnGYThCSNufa1NuY5GZM9kqeE6OBAlUttN4?=
 =?us-ascii?Q?hrdCJJT5dqoG+7GKosopCSY41O1JCn4D7bUyLiv9IFRjMGRFSrke9QLiifmt?=
 =?us-ascii?Q?UkQdjPnqxJMuaMMl4vne+8cvdu58MPEDhk/evaLb8iPxOLVVj/2aRi/StGnn?=
 =?us-ascii?Q?Shnb+iGurILWJrR20DfyNsRnhamvKyd3gXlWd4YTWtf8/L4XkOVPcnlC3pSE?=
 =?us-ascii?Q?2CSTVe3Z5NnxESvm7MGovdJOjl1NxuqyZdeb1btbe8BD+N0T0lp9cubwIiu0?=
 =?us-ascii?Q?DSkEUp0eWZ2Vc3UhKUlpXSTrXu+aVqQRWJ1yh2vMLPc/jOkEw6mw1XtuNV8u?=
 =?us-ascii?Q?qzwx4HQPcBYJ1rHt0bwXL9hoP2AcWW7HgorflWyfZ4HoIq3r+ByKtXvedZ15?=
 =?us-ascii?Q?vF3TjswbWzE3qVto+g4YpfJOVkwv6hxLm0uJ3dGHb9b5l3Z6dV7UxsOMnmVI?=
 =?us-ascii?Q?ReupwwgCxS3qj/kSDnpO7vlBzXemrC5f3H2PFHXLbqXrqKKoA8Ie7npmos9w?=
 =?us-ascii?Q?zg7ugla/qUkqgn4Z7lb+oBKyG70VHgzkywM6neTcbyFl8tpqYm1iwmLSGHUt?=
 =?us-ascii?Q?mScoCZAjdK+UZNb2fcQgdoSqns4cyTlzm/1p5v6sJR5FjJntbYQiFvHDOuUW?=
 =?us-ascii?Q?P42oqoHGniT9ya7tZFQDOzjouKcm56Pt96ETqx1etAi1NiVaz2LWgFm7vviL?=
 =?us-ascii?Q?HDAITm4ruz4konFzKx6Z3UZp//9kvRMYE7LkE/PjGmndTPS0aRSNyRYj7im+?=
 =?us-ascii?Q?qE0tP27CGrYboEE6nric9J7lnv1r19gDyvr7yZXFnyO2V4pLfsu+D+w6Egt7?=
 =?us-ascii?Q?H0N8a/ADIviHNQgU+EsT9SagV423/M+I+dv9Lj2ilKsKN8MBlBKzKx1keW9t?=
 =?us-ascii?Q?8ghomMEe99q6G0hUklyNezoxFwJAe2O+GOhpiBAqMQwsvYhlDH4yLC+1tNGu?=
 =?us-ascii?Q?+R7Nz97Jl6H2TDfnBV90l/BMzK5jFmgh7Vg28UGBo0sWWNXTYhi7LNmmc1Dy?=
 =?us-ascii?Q?ZKbtelECl11FScIl2vGzTtAJNqNjdxpx9IMDL2PeUgg1uB7/C5WkBWHRn27x?=
 =?us-ascii?Q?LeNPGQMzpzyUlxROpa0qeL7VlIk0ccmIwBXajLyCfJNco+KKT3aOtPeoNqrX?=
 =?us-ascii?Q?09/xR+ai/9wO26mTITeGmKevLuBuLLuAL4P1/CMzecZFwj54XuaFwiA1dDZU?=
 =?us-ascii?Q?j5ATf1ZniaDnmNzPb083dCbefrNSn1y5Ye2UOBLsuUNoH4QV+pnmRSD3bGqv?=
 =?us-ascii?Q?qXzoYGQoRTprjoaXRzwfMXDRkQr1t1MzC3pEPmozSAyuKDBRXQ+MGECbcJTn?=
 =?us-ascii?Q?UP5/FiLqIHfuf5thLvOpGt2H9ziyYsaHUrQIM49QdXTRyOwSMLkCf1jgNt0C?=
 =?us-ascii?Q?u6A3/Nkz+zO/tmlkp0+9yp3m7LJgoLQvOLZjiJUEBcW0BprVUdejmCD6ND3p?=
 =?us-ascii?Q?71j5VjRIcrv4gBv9Idd5V3YNXnX4xyOTWvlAMduTsop2hsMAWI2HtpPXEF+8?=
 =?us-ascii?Q?gPUs1taFLz7B9R4W6i/h0eUnbebiOPYUoDcQV5p59pSn+vtcDaXtQROHZozd?=
 =?us-ascii?Q?v1P029iH+IKdtg+XSRVtt6dHcsG0L2uUoNK4IFXJ2181pw00SjU/b1QTuvK6?=
 =?us-ascii?Q?0l1ptc3HolkJOC8mAld5uX7PIVls7Rol+NibJCNylpiDXnzjnJFz?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03dcea36-4cce-45e5-02d5-08de6024d7e0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:27:29.3344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MRGyoc4ez5ai3fQfyPlaGdAZU5lUccxo70Ni2edGiTWANzpuQsGrgNyqlOQszPxbXkQlkmgfFA3nKGVB7OQSWvc+ISZbQV2sN0CXL7EJylm021GzrTSoW30WYnFB3s12
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10351
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27702-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 677B5BD226
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


