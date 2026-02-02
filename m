Return-Path: <linux-renesas-soc+bounces-27778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP5xOVqTgGmQ/gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 13:06:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32711CC272
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 13:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21DD530E1FD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Feb 2026 12:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851563659E9;
	Mon,  2 Feb 2026 12:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="e9kTx/Uy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058FD364E98;
	Mon,  2 Feb 2026 12:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770033665; cv=fail; b=nGFX+Pd82T8q6LppCLfMe8+nd5US+U5CxmD/3u8e/sftUgtbzQc9i0JVrIgKLXV0CbwxCHlt88qYMd53wu36rCvNElj0P6N1BVWjYvYha7hKqpGu/oIzF4luPCdh93hfdjRDcFUX/oE9rqHAiR52bYaZ2OuDstKnmVKu6gvZhD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770033665; c=relaxed/simple;
	bh=uUlCUr+tFb11R5AIrrwfb13Nkfw8EVAH3DG4KDr6RKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oGtsdSOo52HB+n/Jgl1mz/Q+/a6IjVvViwzZqWEk9ELII3hd8h2HXtJA+wLrfzNZhVi2RhHyZIE7cOQ3++r8gNAp+2QTnVkIVKdNc9ePMSNftWOQ+/4NtbYS61pBd+kApqGpYNoiRy3qS4FPvMyST0lTHon4QQGuurdI60O6Dow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=e9kTx/Uy; arc=fail smtp.client-ip=52.101.228.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jL6XPLaUHIDTQsGdf5SEFCzgiS+bAIqO7lydB2OU8vnhFZar8D3WjEI+aoDO4qZK6Ex1q1lk8exIRtx8Lj7bv303QGqDSGsBs76NJzABIFVqpS19QF46rtqWTIAJC62Y7Y+y6XEv9un2ko1YeNxe/NOaMrq79k+qktszkf/9fU5sgsfKaiW4j31qYgXtDEBNwFkynFwstDYA7RmggSABRpOMJSnJfE3L/pPinOYoWRazEVFl/f5YzXU/3feSDB6LuTrndJvbnatubFljN9YYTNJ4TyOpjCXjOmkGIaXxp063pqcPu8vt0qCJyxPhoc+HmnhLANyl5NqZmTfmz25pdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASLhNnh/oAYyFW7GTHRmLwJnbqRa/ZxjMAvE6MNhycY=;
 b=wWDCKWFIb7DsGIFNJ4bo0SL0Kv3vtPaZ+iZdmnZgq94d7z991OhJ/E/GEJVmMwGlNvenHyiBLrlkwj1yRcfkR0DTmlL6dGL0+rapm4PnKJ9yBHrTDx8MIehPYieAeuCfStddCQ94yU4vHp/OUEfAhXUZjkVdfxccdfqmeTOPg+YxEMAf7C7rGDdcBxuiZb3B/nX81xUG2ZQHAYzubLA/i7PFlBIfXNRabmJbmtIbBJJZCvUIKik0UJfQXCOTiD3o3fqPy16pUkbLDBIUH0+E20URJpo7+ClcEPifAF8Ij3HjJ3Y46CXmTiZFDzyy4ln0L7+whyDc4KuJKWaG31VhHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASLhNnh/oAYyFW7GTHRmLwJnbqRa/ZxjMAvE6MNhycY=;
 b=e9kTx/UymgRwR3yBJ3pS8Pr3dr8fCsOZbyWetRyGHPI/eoXUb+8HJCEfct510VlfGaPxru0sL36syfjMZ7LCQ9xs0uGNortFhDpzF82/ZJFPzCnBP46EM6syIg6iabghLK6age6wcdNL6KqTZZUfFMaQi1FpyzWkjkElH5UePAY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8632.jpnprd01.prod.outlook.com (2603:1096:604:16c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 12:01:01 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 12:01:01 +0000
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
Subject: [PATCH v4 18/20] arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
Date: Mon,  2 Feb 2026 12:57:49 +0100
Message-ID: <ebb0015b9877a4050b5fd7bd0be19ec4209e29e4.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8632:EE_
X-MS-Office365-Filtering-Correlation-Id: de804612-6849-4a08-6a7c-08de6252bc17
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?dZAIAKiPJSq8eYunKxYg32I4vUiigmXrdzIXYLdmd5YjoTMJzVIUvMCVJKgD?=
 =?us-ascii?Q?33wz3x5SGE5heliQrZ4TVjJn2ALirYk9ZbIdVEXC5WwPOGyE13iIZpfDvR5q?=
 =?us-ascii?Q?JkkNfHaNSQhra34Kls7WuijQtYw8Y21FrbfKmVXuVR7EsKeRGuNpKNgnVIFy?=
 =?us-ascii?Q?rcH5ywg5RmDQ6ZOufyADyjt+bQMS1c5UlBOE0ug0FRA1zJy+2yuwkqDD/ASL?=
 =?us-ascii?Q?Whyi+dkopZ2CVD5Sacdp0blcmD6lJ99r5fQTRojw/F7lUhoDDBqXZV6JnfAW?=
 =?us-ascii?Q?AIq5mdEv2UMkvWygZFMe09oFU2YZJqeOcie6geo9mJO7ecNQyYNshhABzl+r?=
 =?us-ascii?Q?z4xBv0KgFtrb2SzZPbaq91kI0fVd+WvjuBEEly+yVGeIIcnilQWxn8jme4Hg?=
 =?us-ascii?Q?8tt0hQBqwA7KkL4u7fiQhN8cojrPrGw/rESGMSP2Ucrv3x1+BJdD+MUfSF+A?=
 =?us-ascii?Q?TNGdiYmhUDMiodeXrZaJ3Jbuv/9+n93h9+Xd01I8tShoYbn08ee37qmruDzS?=
 =?us-ascii?Q?UepQlu0XezV3r85/T65b1M5TjqAy2Es3T/o2CizEu//Uzw1aAUKM/5oNEwJf?=
 =?us-ascii?Q?bdyU95rgwOiLWHUxW4XI+lqgT3crNb+1oKE5yjNNPCAkCbo2smf92lChVvVs?=
 =?us-ascii?Q?eAnsFvxSwDDcibH54VHb0wUVa+0bGEg7mSjuSWXUXNYH7nmNfoCF3zmJ5zTB?=
 =?us-ascii?Q?z0fQjM9h+HgBnbNMnLhH8r6LabhLRsGFde2QAQqAHAGFyaKBBzElsUQnYjcI?=
 =?us-ascii?Q?vexGOlt8t8Qkm4Ms/VzQB1FCysrr+ZOXv6S0mnmP3WO0oFQi8IKawzyIQPzY?=
 =?us-ascii?Q?4HQg+pCWidZDnhrEXZ/6f3mQvBYrpiS6MeyxL70eUFhC+6+I3o+imiw/Lhlb?=
 =?us-ascii?Q?Oymy0lY4Ej5rqBnUYlzSta3RNc5ekViOJrQZslvZW/QitF+3NwdHWrsbqaps?=
 =?us-ascii?Q?DN5sZehbqz56bisubejMHTjXHl1fmDAcx5tSOXENo7Q2cQ4vDrWWe0UQPKfT?=
 =?us-ascii?Q?PQmMcdUnJ+dE+O56elEgBDd3hTTKwGdaLDM1Z1SYsd8Qu2CSnhZAoIigcTn/?=
 =?us-ascii?Q?8GLT3NNlb7iE8z8d8834405NKj4ODX9VH6aQuguuSmOfZR2N5uqQOTsOjjn/?=
 =?us-ascii?Q?aJL7836lt9ZRQsTvB1tqEVNSNGM3F4QM23cxyjyJRFALHsSGbPqQm1hD50Ie?=
 =?us-ascii?Q?5Hg8OjzxSBBBnRI3FRVUvkmxB9HSzAGwGQFlO8IN++RrstkmCPHoDmmW7cnw?=
 =?us-ascii?Q?gbHkh3Vw/NAGvb4HpNdydXcKQcAfX3HTlsmIhPvm1OJIjuCBlSV60Z4biSTm?=
 =?us-ascii?Q?zA5rVUaicAHviN8WDHm974z9+Xwn/jej4LVXGjyOuKSU62sO4oL4cg5M0k6x?=
 =?us-ascii?Q?ZAeQYlE4wE1xLNFdrAsqGfjk5S9/GHbbdAEOOqzYOghiPDCzg3Uvd37AlQvT?=
 =?us-ascii?Q?3nFHAyb2kzgrEj1Ksi1sToUcGfUlvttSNh3fq+yh+71CFrW29uZTH+gfkA/w?=
 =?us-ascii?Q?1nX2aUU0/as39hIjBCfjSlfK23f5LXKCTY54DvZlq5nDaDewltmRD5kIhriz?=
 =?us-ascii?Q?98c66uEdlmVdsx1v8ae3zUF9uxTe+RT/gRZrhR3AXCF/iCA1SyXlHqfEW55x?=
 =?us-ascii?Q?dCxvgnRQbCRjNBKvSIjJ5/E=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5uVd6L+rtlZpMQtEMx+DmJWyanMqL9hqfR6AS3N9V/HBX9vEf87ArbZGrgzg?=
 =?us-ascii?Q?dhjJhho6pMVRyMUITkoEsfdDR2DCnZK8GEfX4nQqNI7yl7jIYZY7scdORfIv?=
 =?us-ascii?Q?TUk5nw5LAkt3Ow++zqz0H6OTwqE5+mBo1Llddj+OdkMzksR5RexcGEMIx5nl?=
 =?us-ascii?Q?9z5gYaynjFYIYHEc7GeOggBF0U9mRHlUEIBMK6q93INy5GbL6pwwseUuy9+p?=
 =?us-ascii?Q?Wr6GE4ww8Cg0fXavJO/ND6YXQNKffTtYTChIgqpuvAV6h0dy40FgRL+/GVRv?=
 =?us-ascii?Q?TF75rb4nq9UNnXRlszrO/jiodl0dYvhdQA+AJZjJlAidaU85D3naO9AuMfPn?=
 =?us-ascii?Q?+/bOYZ7stlP9ZE5/ieBEucE/mALujoHISnp9e8TQ1aocKoHqJlD/GXfgBYCE?=
 =?us-ascii?Q?X5Mz+/RqbAy768PpIj5Nh2C3s6GobCF/n3Eo/jTLOaFPklh9a7BqkRGOh4HJ?=
 =?us-ascii?Q?udtPSiyJ/aUvriGpWMKxN7TC//kvv2AGifv4voImar1Sm3JIz/mCctIa7RbG?=
 =?us-ascii?Q?Z0f0DRVtFmTu2KGPhG7iymHLJCmX39wrk1fPWNtWBXe8panP7iO1dCw0z/HF?=
 =?us-ascii?Q?tf8+n5TIgnWBU9IL+7j3xoND7qazeJ38Hf4EXJuXJhN9Nw5m2SF82LqE5qiz?=
 =?us-ascii?Q?SmVax1AU7ZjS8v7ecbD/mPMeLGLvyBhC0iaaIAa1PN7kbzh/3lCKmiJ3G2Kx?=
 =?us-ascii?Q?A2dP4VKbYnuWHvK7iUvIvG1Yw6vnq2TSEpFkg+Jr+SFWs8w3INXEnSOohBUz?=
 =?us-ascii?Q?JVu8ptQIPRa95BpEEL/U3/cl4l/0dAraB5T0M44RQg0oaZkA7hYcnJoFyOoS?=
 =?us-ascii?Q?lZWgt+bjP5WwnfFv7aPrhkCg27dDZdssdR9V/Tb35TFbI4uQDJcCizUh+Jmv?=
 =?us-ascii?Q?4p12skWlJDm4QwYCqcGMzouRxZCoPdMhJKOC8Jr1XFPW+s69NnmL3bSQmYuO?=
 =?us-ascii?Q?BiGBJIa876FPiFEDIN+CxA59PN2/u2lBddp1xkGmogURa86l/jmJnpL5nZpA?=
 =?us-ascii?Q?q0dIPhH0x2lCDB8y2dzqoE0XsNQi14uCK7WWYXB+4JEWx0SPqH0AyIAVM7ji?=
 =?us-ascii?Q?nIs3mea6WVl6AAqErpcpivCTso0YnR6rwkr/UASqY/X8qvD2JoGI1+5IodBc?=
 =?us-ascii?Q?rKhkEqn8hdIqKMIHIiqTZQwaie14TUkA9TbfnwHYSfACb8VGoK8TDAgshR0m?=
 =?us-ascii?Q?4eGtewD5E8nf7AzpuZ0fAIUrzd/zxq4wewzPspoMvnEL4ciWQBvtmwc404eJ?=
 =?us-ascii?Q?FhOZaBaR7gaECc/VQfFfX8P0/D3Cv8oNS6SpD417vwKHhIOXUi7b8QvX2JYY?=
 =?us-ascii?Q?amWEl5M8mySMA633N8HLU9/r6C8B1hmWrXcyHxeBfvxibxKx9aGqDsaHj7oC?=
 =?us-ascii?Q?gLgmIPEKCuJd0M7gMqzE4bmWKt8RGvfXNjHb2BAOGN5tO57fYZUMx2IWAYOT?=
 =?us-ascii?Q?LmeDRkGD+L1btmfv5El3P6xDqnfSvY1FKI/HK6E8lHMkOG7/Msc2BaJWEUPQ?=
 =?us-ascii?Q?quKcdUD8c9qpvzTr+J7q6UQ2nizTk/vkZhdcJiQv2KblQYZZwQ4zSDBz/YXi?=
 =?us-ascii?Q?fk3msEb+L99PomqPGN/1H4PXsDk6oPurFs5pjHe6gjC+bh4zuTHhgaj+A+3v?=
 =?us-ascii?Q?gMAdSMLMIh5Qs8tsyU36bijRDDnFvfL4lQMC4OvngZzYwlCmREkUfDiOV3iP?=
 =?us-ascii?Q?6HOLsYopT18CPtV04VFDEp0dkJcck28BwSnXONl0Qyct/onGEGZHMcfXD7y3?=
 =?us-ascii?Q?rTAZJURWtcVH8pc+3/Es8jQxwXFWuQVtZ1b0wp/AzAmp5NL8/h6s?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de804612-6849-4a08-6a7c-08de6252bc17
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 12:01:01.6500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7dt1MQXJQnCouSf/bUDtOaoAYo+G4TRUdeaPNcVSedPg0cauw7LvzkNSHlARNI4ilN5qV9CwC00rem3h6xofUTtgPIL2HQtdz6gF3AJtXMdZAOZxj5WgZgGqr983OTpg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8632
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
	TAGGED_FROM(0.00)[bounces-27778-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,0.251.119.0:email,164a0000:email,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,164b0000:email]
X-Rspamd-Queue-Id: 32711CC272
X-Rspamd-Action: no action

Add vspd{0,1} nodes to RZ/G3E SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Squashed vspd0 and vspd1 patches into a single patch.
 - Collected tags.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index c90a778250d6..d4db44b6ccf7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1455,6 +1455,34 @@ fcpvd1: fcp@164a0000 {
 			resets = <&cpg 0x11e>;
 			power-domains = <&cpg>;
 		};
+
+		vspd0: vsp@16480000 {
+			compatible = "renesas,r9a09g047-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x16480000 0 0x10000>;
+			interrupts = <GIC_SPI 881 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0xdc>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		vspd1: vsp@164b0000 {
+			compatible = "renesas,r9a09g047-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x164b0000 0 0x10000>;
+			interrupts = <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0x11e>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd1>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0


