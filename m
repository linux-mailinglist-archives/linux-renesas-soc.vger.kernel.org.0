Return-Path: <linux-renesas-soc+bounces-25995-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBD7CD63AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6B5A307481E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F07B328B49;
	Mon, 22 Dec 2025 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="jgXS7rVZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011025.outbound.protection.outlook.com [52.101.125.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6246E328B42;
	Mon, 22 Dec 2025 13:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411119; cv=fail; b=dJ5CzBWYNHDBR71fMsvgfVTY8huN2plBBLRZvDWxwOM+uwqYha0qhhmwTApu0KIdyTD+CkxNW/4dWwE7W3PkFv8Szj6nwlQqSl8T4ua3DZ/rS6OwsjIw8ZR2YSmD6hW8tb5F6gk8QeAXNSrKgzYTbN2j9bwO6Zvy6ox3jeP/54A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411119; c=relaxed/simple;
	bh=cULLo/n6HyKNIW9mT4VfXhr5COQiYgS2JpDu9r+ARfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eCrIek6Nsoo78qG8paJ7Ljo9cl5c2tGyaxlIikaSvTe4g6Q/pvLMB/9pkWTAzU1l5mPyfnMU+SOUoy4ouU1vtQ4frPbSCaCmih8IHpI87o0nc64AnccPSDKuerReopZiAh0aP39cjdaXdZrmhkzE8xx5torX2RE6YZF068SWU8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=jgXS7rVZ; arc=fail smtp.client-ip=52.101.125.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W5kI2ThhH0NzRifPB4zTQ+gWV4xr6YeHzz3ws6VVwUMZq0UHob2axV4T5gSOIVf8q3Ac5tg5wNmA+QZJvaR/uMkjOqwwh8LIkHxKUhRa1IH3tJGzaifL9645hCNNxkGQlTKg8Dg4hFfk3x1yad0QJILHVMc3634fHP2sGX2D6O2KwOrK+tMWpYhg2WRWkv/NzRl2VpZcO1q2r11DDutIYjI58ft5tZQPuIUxpbUFn2CZ+/nmNt2rPQIJctB2BWcPAgcXDuqBK06GWD9WEA7MIuUE3vgmqnNhd9KHeEHVNhHGXYyfnRXfBuTY/LRsOO2A9rJNpZ/JQpZcCmbBQpDUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56Kb5mWavGcV9SHOMMOkok013xf60b0lnfHHTGxEPGY=;
 b=YC1h5v0PFD6+orDaM1Pwn3Rs5c3NUAIjA5C1NvZaifVOdMe4A3KaMuru3hPmD8RICMLnF9zgeosD6RkGQ0PqPQqAxAZJO6xem9TYzI9btaikRNpdbW0PGl//nhagHrPfsoOrXmdU9u7mLGdwFXC/cVLHab0wrOM0UvidyxY3cD6dQwh6j1S6bI03DttPdeRusz6xflol2zBKMmrid4YkJcLcw7/aNWO70si/hRDyMTRzWjItqCjDqX5Z5xVF4vVdXhUEWm5ievSR19hQB5+cICBzraoM3CNDEOfMPA3GBnGT11xn1QAYJIe87vzuIUJWE1GGeTRs3Rx+VDYZYojVlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=56Kb5mWavGcV9SHOMMOkok013xf60b0lnfHHTGxEPGY=;
 b=jgXS7rVZIgiojBUO43WhfuUZ3sD095WRSQPtRPCD/gg9eJLyY/0kAviW89T4Zsu6Gq1fzeg2whM6s1hjiQrjYImB2HBIKr+VeNuAYeVt80YS9p13wM//as11XBQI0KZLBnGNDO8ZlCUsD4oaIKAwd73b6lnlvaJuU1DM8zjxeXM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:45:15 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:45:15 +0000
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Georgi Djakov <djakov@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 07/14] dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
Date: Mon, 22 Dec 2025 14:43:41 +0100
Message-ID: <aaa8044283eb736817afd43d4fba3aa93b50b1dd.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB14304:EE_
X-MS-Office365-Filtering-Correlation-Id: 23086c57-1e66-460f-c9d2-08de41605613
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SOfHxCbiiRcpwgNsLlDko8L/e5nwdFI17N4hvLtPnwYPSziOKQxAj2rT+VLs?=
 =?us-ascii?Q?PR29Yh3FpG9j4jA2qkVgodxLAe7bbWrojvAnHlAezSjLUWlwqp0JbXapTe68?=
 =?us-ascii?Q?rOpidoVphfUFcPsa44vxFoc7Lo0gY8LwklocD2iru72MLIArHwQsz7EXmx0F?=
 =?us-ascii?Q?nm8gr5FJVop/DWlWgeR4SzqpTQqz8svBzuyTDHuLf4rinEaXmvXX6Salae6e?=
 =?us-ascii?Q?up2cLOhthbqHU3Y8R9EWixI2eFvVpdhqUveePyy0Hxi5thk2AtiEKV9/24cT?=
 =?us-ascii?Q?monK3A3uZsRBmAtKYBT9f2yIVdWPQcIXadcHlC523JauSON/i7aqg4FOlThj?=
 =?us-ascii?Q?BCUTILSh4kvJOcLt26iAN2yQiDZgTim+yuN6KIRDnS2m0SbDOea4B6iZ0NEt?=
 =?us-ascii?Q?XowbHIQo/mB8Ffb6h1ho1ElKGLTgkspiZr92imQIdcnManfBicKDW1LmfOgN?=
 =?us-ascii?Q?UjBt51JIYzQtFxFuhP+2QgCdOP0p0R/uSlB0j8hqXxBVGMzPhpfK1tUuP8jm?=
 =?us-ascii?Q?AXjgBXCRXeF2M/s6qpD9SwoXlkyhLgiDj2C420s41H6mDHG34d9OrcaJW1WX?=
 =?us-ascii?Q?TOAsDd8xP87MkngkH3K+ZEwWE8FT6zVJb4ZIzIOLVkqDw3qXpQcRNaBQzYIA?=
 =?us-ascii?Q?DPgySB/7v239CFrIL9vG30TzPUPujhwcYWvMp3o8v7ruGI9+q99Y0iiOsWMd?=
 =?us-ascii?Q?W0Hx8+A+evS9sLIFUENAMnE8f3ER6M7X3Z9XT657xJDzfw3yVLq5myXzy6BF?=
 =?us-ascii?Q?GC5P9JqbGPtxH0zbGk7F/JXl7oNFGSf+S2w7nh/U4A18jwMF/KNvSLO++X2o?=
 =?us-ascii?Q?d1agW9rb2LmrYH54Y3EFjz5KfVcb1qgKsM6dnU+yZb970ABGsUBlD7voweDz?=
 =?us-ascii?Q?8ZUTMyXFqd8Av74E/V0lB1tKZEC3Qg+dJ0rz25z7F8sKSc6xT/1YL0LyB+Hl?=
 =?us-ascii?Q?8GL8XxGtrEoGQEA8Pmpx4jMD+NrdxPaAORWuiw3A1Mmmm+/hAZ6UOS/VwVz1?=
 =?us-ascii?Q?rfrjQk0ymigmuiKyocrulay+tQEeeQ92NwiRvDOR8y+jIEM50xtlPVy7YAHI?=
 =?us-ascii?Q?OdVkPezDxsnE0gbSOv7kZjVnoaL03aGnU6rqIH+odm+c2dGMEiW5SQdMX94c?=
 =?us-ascii?Q?JBQTsvNcHT0K5+pnQSozi2+WouTtN79P4EsCRNN7J5I4r+twCSKGkpGAe2Q9?=
 =?us-ascii?Q?R/tNTJc0hnvOY8wLs8YfY0/IvhSeRScZsjgrcExzAhvmHK2s/C38NLb+UHzb?=
 =?us-ascii?Q?eUHI8AT5eHGn0inDE5dUVta771TKUZXrHr6K0xIZJjNYCTd1IKAWLxDQkwos?=
 =?us-ascii?Q?UMWU0wIAUbb6Xr6v1sa0ZZjAgTmufILAD0lagZmaHPZ56mxmwfLZ30EfhwrK?=
 =?us-ascii?Q?Yi1/IWmfn+RB3UHCS13qZjcbCFU9ow4T66lVpLOlCZvMRV5k2FiFG4cPk/ef?=
 =?us-ascii?Q?hv6l9NDvMdjZ9OnOHNaC1i3TSB4GgVNreLVOZk+GboewWYEzA7oRccqr6PwU?=
 =?us-ascii?Q?9e6ik5OXUQTAdpDGdPt6NfV6K8yr65GcVDle?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OclQfOBYQ6kyiW0gaVgrSs7sksKOaeseT2PlsE6Go8EhwepEL/6d/NLj/c82?=
 =?us-ascii?Q?wHyoEDDxOGpXQGnl63z0AbykCSRAJVlL81FhI8tv0r7TqKJcFF5xxHqjHc1/?=
 =?us-ascii?Q?BPvKVZ3hcd9GG/J65swxZFHGtxxipU530+PTJJpVjTdIxEvRXHFTM+VRWwxa?=
 =?us-ascii?Q?QNPE30nQM4ZtLAc531TY2ibF4uXRIJV+j8UtTP3mFe1JvaLgli4SUgaTpXgS?=
 =?us-ascii?Q?Vda2de9ttIta34BPu8tmxQVeCy7v6mWedOoxtCu2bkOj4n3+J65b23jiCOZR?=
 =?us-ascii?Q?MJgUid8Srm0gP9wzcz15EIwhr05f/4TTxIdiFzZMs/bSA3Dxporq4DFx9lZL?=
 =?us-ascii?Q?LM+IeV0nFXL0uCpGmwCcL8hY6r0fRKp8mn+cf6TKVgbugDY2XT5qW4n12SbG?=
 =?us-ascii?Q?eOWUkP0DU89OU585yZX8eQpzoGE3+AhVNLBZhKAs1OS+wVWkNfxQ8Q6kxikZ?=
 =?us-ascii?Q?ictHQzBLD9fBIUumLwXJyer9yNu1r8XM6PxfNk84qbP8aDMJ8wISLBjE1D35?=
 =?us-ascii?Q?t+jKz7CJPuG+upwEtJhmZQUxs9qaqTkwa6t3GdapiFtdZSoO1kwtTZTuV97u?=
 =?us-ascii?Q?3gTOAzZnkv51havfaXKi9yEo0lcEHyOtXl27AoK1Kal4jy0CsP+0/23SxWxU?=
 =?us-ascii?Q?ctuU3rKJ/DEOMlVX0WwBRLLMdqQaAFo/mc1JrlSlgAOfm+AEvUltqQYVDPfk?=
 =?us-ascii?Q?ghfG7WOsotaKN8D5vZfQFSp9OhlHnfzCXxhIJan7hF5dk9AxyvuM3fbBf+l9?=
 =?us-ascii?Q?sftrFnDL52RNirXCdjPZTqNT6UKqoYCm7lMREyt5kvMhxCF7Qr/MDSbn736D?=
 =?us-ascii?Q?nGlQrb60k/jf5V9h0+QRdyipvKh2hGNC3y1t6yDxHVFdrFgtfOXC924sITJs?=
 =?us-ascii?Q?ZeUzdCx25i2y/xhRanrfU+5m6nyG3HBsOWikInzqvguuVVknNwG3iF9EFWsh?=
 =?us-ascii?Q?BilWT6tJ30i54/D/pX6fK25cXrZahi+EnJdCbFfq8SKbjlhCH6B2eeu1JQv/?=
 =?us-ascii?Q?xDqeUmQ3mZQiV2nBAmIC0dySeUmOptpjDxkOXLxrH1pF2YljqRrCHdeTGvo2?=
 =?us-ascii?Q?bpFmdrUWnm5kqwGIqU3zf5VE9JUyHcMjnueeTM4BiYEoeuIMG0/rAl5Uv7Na?=
 =?us-ascii?Q?36EA/55gnlueyxyd3VX6rA8IUst9M9Lqmz5ShEY6OWG4ktvnGLSHS+Y29gqg?=
 =?us-ascii?Q?q9mfAG0w/+6Nb8oXHSdLQ+Wfyug37JFITQ6up9UHzYOPCiQ+v45S6GNcBwrE?=
 =?us-ascii?Q?s7hDu+jITMSsL40vK35JThkO0Ne7AVwLZc0H8rJLcxwuo/2PsGpChzdD5+k/?=
 =?us-ascii?Q?7BqfKtFo+Zvg4ic01V9jqJKOdXHHQxjTvz42AWaqy8NPfe6omZK1BHzNcGQx?=
 =?us-ascii?Q?gMWhAeHP0p+W5z18h0NH3O5JvpXnAXjrcMIp49cgzPVjw4mC+tIb8V8hBiGW?=
 =?us-ascii?Q?cwHy6IZx6bd4b+If1/AW+QgRCFCpJHcRpGhnnMdtN9Se6bS7irTgnQFxSqpz?=
 =?us-ascii?Q?CN2C/z9wXHY+gwyj6OpLplkSsaqgZgaqBoS4hFrmG5sACBFTICZEC4UdAq+7?=
 =?us-ascii?Q?JexHQR1ZaIGyniXPYpd2AQb51k9Tw91yEkghmn7nc598Q1QdPLlI1eg10w1k?=
 =?us-ascii?Q?9cH/9wD/Cf9SJsiBexnobtuG/BbqPtqbum/PZfcWNibbd2atQ5Gy2aVMXZjk?=
 =?us-ascii?Q?trq+BSS6h/yiYYsYbLiF3b6x3gezUqkF1eDIx6U/59KbIvdvDK87n8rD4Ci9?=
 =?us-ascii?Q?RIKgKHXj54fqSIF9mGFMtUSX/CHhhi5coM30vg1Y5HG/idNvLkwO?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23086c57-1e66-460f-c9d2-08de41605613
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:45:15.1092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /eIQd8v11EGhrK68+bPqC4EnfzU0CkNghGnudFHraf37cPmbaDg+2pxCiEHOJ+oPbmVH5wP2F8M1w3vUhBjvyCUbzgiNojbCO4+EXrHnNnIhAdli03sMPnPZLpE+GrvY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

Document the 'vbus-regulator' child node in the Renesas USB2 PHY binding
to describe the internal USB VBUS regulator.

Require this regulator node on OTG channels to accurately represent
hardware dependencies in the device tree.

Documenting this regulator allows device trees to model the VBUS power
requirements of these SoCs properly.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes.

v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 2bbec8702a1e..2cd0efa75f81 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -89,6 +89,12 @@ properties:
       Phandle to a regulator that provides power to the VBUS. This regulator
       will be managed during the PHY power on/off sequence.
 
+  vbus-regulator:
+    $ref: /schemas/regulator/regulator.yaml#
+    description: USB VBUS internal regulator
+    type: object
+    unevaluatedProperties: false
+
   renesas,no-otg-pins:
     $ref: /schemas/types.yaml#/definitions/flag
     description: |
-- 
2.43.0


