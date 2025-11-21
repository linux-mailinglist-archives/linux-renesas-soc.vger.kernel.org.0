Return-Path: <linux-renesas-soc+bounces-24979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B74C7A81F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 331913A3F35
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94595357A36;
	Fri, 21 Nov 2025 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LRDJLmxi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BEA2D8399;
	Fri, 21 Nov 2025 15:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738165; cv=fail; b=mGNvF5p+LS0OPMSE2sj8VdJiooxPpG8+hZzK4tak9MUBNmQwIb6LOq4+U7ID+V5e9c1MakVCZMghA0hIccPkEjGbkMIzhruELqFGxl4fo3Qv/dcUe4JWqyWb2URL9sDzmFHoeEQzuNRCBhEaU8V63ngL1EWYfgEw9ogxbmjyXEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738165; c=relaxed/simple;
	bh=QOv01BhSW8oZO9VZy0V5WDGicgexCts1xspONrSxN10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nw07vhYuOLjdAKPAAsirmw9e1t9c9hIFQAlqAORxEI3lyJUijhy2yg+x2CYXmkgqsIvK30r1yyuSksJP1igtfTWXdzVxz6Zgd/Iss2p4vXtHZ7r3ltT5+IdknUx9RstP9DoduMqPqUgTEf1Phtk4ucgCRZ3LrGGG5ucC9Y3iQ0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LRDJLmxi; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Avbdq8nyE6faDOVA8cWV7wqkaCOJvRBTRPC3WM/ylPVp2L2mO4yWbJYoFz4xAvAOK9MEiHZaF5lOiQoytLdxPMkbMwwlfVdHAFf2jjwlNY5wCe+P4MZoBpWLFPREa9ydHQs+onaf2fEVIbvU+WuaAAe7gRYnpTCxkbAtVcSVXOb4dDutFDjJRF1hgxzRYKINR1T/Ck3Hwjue1dT5fe961KX77haInfTyhHkR/4lU9wQjSz7SftssSETFz8O1HRy+rg19AH4+0Ae1rC+7labWSBF2TQIsOMYTTzbLleOgQDUPwShqEqSlghFz5YCybLGY/EHiBnWOL3ss8mLM9mR82A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiDnYrQ5oVzKEUPcUCVgf27w4QBQEQHk5HzEcaUOpg0=;
 b=xUVMtlxRGQUnsNHlBEBrSAj1hE1l+AiGW1xvyfD2C0cUWNdl6IIRPhh9uotyGE3JKgjC2RmWn5AXxddM1D5Qg8zHcjsg+1TeVDw2Znwwb2V++pGE9H5INh63fT7vfG8OpssNbNVWJo0Fgnmyq2nq4RqgCQj8iBqED5U97Pu6RDHQN1g7YH9ZgurJDv2hnCKg7JSHU5tBbqTzsFOz+X/ii+ZOtv4hgVL39XoWkt3ElTSpWnsgd1b8FgVd1LB1IVYF/pdUZr61AFNadgtEEdvClD4UJ9DV/PgKqiIue/UDNFxNJKcjuny97tBcQvhjArrpJ6gLMdz40pizLLgUawcA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiDnYrQ5oVzKEUPcUCVgf27w4QBQEQHk5HzEcaUOpg0=;
 b=LRDJLmxiGMLy0vCkTZAgMf6Dt1ZnmO1o4jzT2zXzi4J/Cyn4xCgiu5e4nT2Ld6gDW/dV4UxxBjrceFGvP+sV5rGIyKQJbNaI0c6y3mKHfA0qD9QEdy9EuJ5ajzsYVSKzxcFQix+4PSzfNa83+Vv8m1NNvoaVpQT/xujWdvwYv6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB15857.jpnprd01.prod.outlook.com (2603:1096:604:3cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:15:59 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:15:59 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 22/22] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
Date: Fri, 21 Nov 2025 16:12:11 +0100
Message-ID: <e5ec9d55e49a08771dd33c87d6cdc1944779b6d9.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB15857:EE_
X-MS-Office365-Filtering-Correlation-Id: 9628c249-fe57-47ed-d217-08de2910e01a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Apa+vYPOBVy3DcRis3TqxJp6pukAsbN5iZ2Xbx6HSW4Ld0F1fCQUSA7KCsjX?=
 =?us-ascii?Q?mNBGRqMhG1xdlVRetEOV8p7bZ4+Chf4Cf7+Q0oO3S3kUJSGX5nfSKtTxGOYr?=
 =?us-ascii?Q?EtM+S8PQxpeuZiiX+ZdTZgI4YPprcb0dbHT7EIaz3uV/zDCmhCQRjCYmcrgf?=
 =?us-ascii?Q?mnLXgQ3EPfX4GV+jXNUC1zJHeZtoFjztdiuDQk/MpB9+wvcilO1rn2P4t/yY?=
 =?us-ascii?Q?HFo7PIFDFHaTXZ9u1To+zS/RLvFAcalhd0LMVa9ENk6cDVWVJ2LLXCUpENOo?=
 =?us-ascii?Q?z/VnWUjkcNjPgATP9Td9wc+YUHwcmPcf3Op8MvNfizOg0JSDV6BXG+cZsqA+?=
 =?us-ascii?Q?66A/Yso0rMaQzHh/3aWw4cbLnqEuDFT4Kp3vr23mfuwGH28SV7B9kuI7znhv?=
 =?us-ascii?Q?HFp4XMwCbU+HFgJ4U5af6CsiD4A0HyKKK3ok0GrOQhTbZTzf4Ctm6nk2EZY9?=
 =?us-ascii?Q?1vUry0T5l1z1eRgWtehi1VEEhtcUBAfaEmHdunYdUpICqtRAzKKQNqRVWbWx?=
 =?us-ascii?Q?JT8cWkdzZE1jPdVkQVW1t0gmYeujR7QmSjWwBHLh/RD5r/bELOmbOlgiCE8E?=
 =?us-ascii?Q?BZc3Edqqy7ZPf89sFjm9152yuULvOBNVKN1IKeAuy9wVLfClYihf68953Uqb?=
 =?us-ascii?Q?+4JLviOotYqzGvJWVZPY6xsmVXJ/biKjvZfwgO0nnxkR3iQcs9fQtlU7NniY?=
 =?us-ascii?Q?AngwJZya/q/kBBQa/2kcGrdBYmhC3BubZeDYDyc8PhCahYqHEeOit+znZL6K?=
 =?us-ascii?Q?r/6CAPkhv2QFlSgRPy5WqjTmegzO/q1k8A75I+Aoz0hxZo6IfH572Hb5dL1H?=
 =?us-ascii?Q?nvofQr5D3FrjHxv662yj/AKzJgzPk7GV0f4oDlHoUYBJ81QTvknq1OApou6j?=
 =?us-ascii?Q?nVna+am+/ywHBCa3CRzzMG95vw+ZMMEvxTmvFvUdi1Nm7HBIcmlYxUbvMgq/?=
 =?us-ascii?Q?v+EcYQsSXXWeq1pjODJBsVWpyv3UYEOodD3tBy674WBkTR2cV080DIWjuxBH?=
 =?us-ascii?Q?DikQHfcm/FeKVSAMQjjBle3yb/8oELxNuoBFYgihXaes2/fL/EsSjKW8HIyT?=
 =?us-ascii?Q?0MDEedApjiG4JlIqjQkvrtrp6x03X/hX77X3ftnncOK16Fibpax8SzGOA4iU?=
 =?us-ascii?Q?UuIPffipzrCfkEIMwnl8u+wGV5h1JraLbxpYK0evjBv+486yVXKrNNBgsdmx?=
 =?us-ascii?Q?TOy+JO0eYi5yjfefQdvELkEcUSmP2c/YppxZ5HekVE65uxKdNZIP1oSM+wSm?=
 =?us-ascii?Q?K+AYtnNQ256w0wvvP7Y5nEXeh/dSzrl858t4RC7e7/VfqJXiqKGWASe6S9a4?=
 =?us-ascii?Q?r7yrhd5Y024F2u5F0pD7gGtKjGNU4oq4ghH9Vu6H5j+Ust5h14LnIpJZSSXX?=
 =?us-ascii?Q?hfS9rwAaGZ/kDe28ySAxL+f5pq/M8myhrsgJreeiDv9Zhj8ou6+UcwzXc54w?=
 =?us-ascii?Q?QzrvdzhLFggfpCWp2wT0tNmrh12zFCyqVy5CdH9XjuY652g+OCr0d5T+bwdZ?=
 =?us-ascii?Q?IPHmGv+T1RTo1iMHU9oHrb2JHcn+NOr5F3e2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z1v4pyaHxH2Kc1k0kFqnDGqjij7cii9y4b1APG5cCc4FRx7LAm0Gfmvaw+nz?=
 =?us-ascii?Q?8IPUD/ZBCuTgSOoX0bsdMmLtWDQYPLFwK5G7kd5lGvrRe+vy4z0sMvun8nzv?=
 =?us-ascii?Q?TKCC/uXJpQf4Cd3Dm/T3NfIH1py899E6MQNMhYSaev1Ygs1AsEL9n8da6BC+?=
 =?us-ascii?Q?HnMJ9S9xH239uevCxrs6VrAPrimfTG6Rl8BomN3/TxifrVw24NBCB1mNSVRU?=
 =?us-ascii?Q?WXD/oC3XANRVRFKl4XegXZ1Obh7ycxBgmS19lt4pvkr/naBSWdhvFKxIq+YK?=
 =?us-ascii?Q?5lXPM5UFhXCbbIdqkNGlAkLNCkWSb9+YSl4IZHVX3OxTDXCVR2rhdAi6aRUl?=
 =?us-ascii?Q?VAKXOr7t/v2aCLqm68F9DVvWWLKqGRvjKokcC59eEWadLr4wJVg2eqep0XwE?=
 =?us-ascii?Q?Bub98P3XnxoWIuYfDVbx6DdFkPgS5YduuWNi8zrDp+INFR/ICIW2otqvzkMc?=
 =?us-ascii?Q?VUVzUx5ZIThP9w5xLkUvN0G2FhlrE9ZUwsBJv8qJobid4pkRCFEXGmA8Bwe9?=
 =?us-ascii?Q?FtCqx1337vSU0pvuOhFTxOuydb4Oj4KLi0pLXCxOy1ymTiwqN5vnwuiMIzsx?=
 =?us-ascii?Q?L04gvDeavYKboxzJYMJtCWcjvfbv3L9ZarRtZNXPo0W5kB0Q8pOqBgJQ/7Lx?=
 =?us-ascii?Q?L7iM+hvKb1ccSooNhflMcKe/jZL72iQsVubwy094cqqVfsDpjCIC6rUDTTZS?=
 =?us-ascii?Q?+ku6wiI/Sewd80MCR3y2boPRDy5B9qRkdD4BqiyBzqZpEwHzQFKAM+aWsD7o?=
 =?us-ascii?Q?9DFJNec1EwxC3agj+lywAlNPqRszQt0qybxBVuUKRiWt6DoU26uh2iC0YnHB?=
 =?us-ascii?Q?t8UN5yyJhzFA5hW9gxesNs19QIeQJ5d5d2HHLkVjw1kiqTwxTKFG40GRrGc9?=
 =?us-ascii?Q?2J3SOlpmXSujGYzbOR1mt0W5rjOjRfiKbpGwzm6uKWNRlyaPaBksJ//XTf6h?=
 =?us-ascii?Q?/dJSnkVZ7kV5LjUI/Ooo3r9xThmKokNy+d/20WMCmcIVDIRAuWk6qsc8iPwr?=
 =?us-ascii?Q?PQpgg5LraE5gomGd4NTdZvXOySdrcSYH7JLJfLrh1Ar3SiMfRo8g0jKpRYw4?=
 =?us-ascii?Q?fNokac7bvO+O9atoTmhKt4BCs3UDCTb/+2BbqJBjgCMF8KibVPW2vmVIGQPa?=
 =?us-ascii?Q?TvwncTJY6UYS3GskFP3KTA25dZYAF/EZaL8dlIbgqwyWfSmjz2sQq8UHkYZv?=
 =?us-ascii?Q?mHlz0RktYMvHdznrjhRYcA/RcEQGX6ifgYfwWmiSKdrwc2jUz0YJG3EvAljn?=
 =?us-ascii?Q?r2kQ/XXNIHtB2z5Hc+FWUUCcGPJJpjim2JKOLUuH2ksEs6kdXxjHm/z4I2jG?=
 =?us-ascii?Q?zsIpLaYyCrwBYDpgWNpkUnq5WBr0fdJdfjeJywO+hgWkPF8CstzH1AHzruxx?=
 =?us-ascii?Q?VabFigYd/4eUFTxqxFYaVu0eQfqcvlnR6b5onmap7Qa4cO//MkT8VRS1gbKw?=
 =?us-ascii?Q?wVoUved58V09MHDjQEzBTCnll9OSUEA91DxiJEICAN4+auSXpWgYc9LF//qw?=
 =?us-ascii?Q?Nl1yUwIBQ4WbXlb0SCB5Z/wjzDDwx8h0bdhyzaGiB/9ot06aa3CFWsZkX3RZ?=
 =?us-ascii?Q?oNOVSmHvDxL8R8lqvvicdcXTlsPkkbOIaVSA8lRoaV3fXBuCaAoNPoUJiyBQ?=
 =?us-ascii?Q?M9wN+KmBGRQLSqbWBySI3lE=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9628c249-fe57-47ed-d217-08de2910e01a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:15:59.2437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5+NBRt4+emVX9eJPThb64e2JiF0s5lgW3qOPj/SkJsLm6WIXIHp/RmCMPUbQbKWN2jaanPrgXwQz1rx8pFeda5fAMrWUvmhp0TTtnYk9eWPwwg6ZnUIxRXGF2b9OfiiH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15857

Enable USB2.0 support on the RZ/G3E EVK board, USB1B_1A_HOST and
USB5_4_HOST connectors support only host operation and USB0_OTG
supports host/peripheral operation.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - No changes

 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 49 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 23 +++++++++
 2 files changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 08e814c03fa8..ca19e8628c80 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -164,6 +164,28 @@ sd1-data {
 				 <RZG3E_PORT_PINMUX(G, 5, 1)>; /* SD1DAT3 */
 		};
 	};
+
+	usb20_pins: usb20 {
+		ovc {
+			pinmux =  <RZG3E_PORT_PINMUX(0, 0, 12)>; /* OVC */
+			bias-pull-up;
+		};
+
+		vbus {
+			pinmux = <RZG3E_PORT_PINMUX(0, 1, 12)>; /* VBUS */
+		};
+	};
+
+	usb21_pins: usb21 {
+		ovc {
+			pinmux = <RZG3E_PORT_PINMUX(G, 6, 12)>; /* OVC */
+			bias-pull-up;
+		};
+
+		vbus {
+			pinmux = <RZG3E_PORT_PINMUX(K, 3, 12)>; /* VBUS */
+		};
+	};
 };
 
 &scif0 {
@@ -179,3 +201,30 @@ &sdhi1 {
 	vmmc-supply = <&reg_3p3v>;
 	vqmmc-supply = <&vqmmc_sd1_pvdd>;
 };
+
+&usb20phyrst {
+	status = "okay";
+};
+
+&usb21phyrst {
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb20_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy0_vbus_otg {
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb21_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index 58561da3007a..2daf437abb82 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -90,11 +90,34 @@ &canfd {
 	status = "okay";
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&hsusb {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
 &scif0 {
 	status = "okay";
 };
-- 
2.43.0


