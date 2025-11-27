Return-Path: <linux-renesas-soc+bounces-25251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5232C8E203
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:52:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ACDC84E6807
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2E832ED35;
	Thu, 27 Nov 2025 11:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IqDUdIdf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011030.outbound.protection.outlook.com [40.107.74.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CD532E143;
	Thu, 27 Nov 2025 11:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244269; cv=fail; b=YAkocKDYA2U8oTmh/fOtUNh0xDGSbQjVCGoDWAJcZxsYtqwTpK5bQKXs3aefsDvWC/nE1fWd8l73HenbztqKCA2KPiwGAx46fOeJUHAot5Vukbnt+ZG35qsuz6xjgbYEYLmJ/xhhmqM9cv6FiWV0bBNprDn40gg4LaZGPO/sME0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244269; c=relaxed/simple;
	bh=9HWiMWEhhmHkr/FYVEWSqlUa1rz3KWRRXqixQV85PxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rPFT8rCB3PmjUcSYSLZBfuVDRyt9i3WJGO+UWcfi36LCbsxrRv2XTmwigV2wia9M/G3OurMkPkSO9jYFzKNw7jedrJBnF0sX4cx176YBA0O/UCkggcw+rkI0ewcWshdGTKNCgpST8pDXrF2F5aLxNJ9Y9Ske2SQx56548yN4YCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IqDUdIdf; arc=fail smtp.client-ip=40.107.74.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olQbXCEtg0O4Ed66/f9Dwyk4TRGJZCEuU+lu3FY7QVrcsuTqFzyqO2wgklD+PNeWi5cIi2Kg391rrodlseHVa69F6vg2bha/kc7VlW/eOQdz46djC422L85jP3n0Fj4vb3feR2sWrn7XehsUk8eSwCJU9rwrXyRUag1JMNDnIsfhydukZDc7hokiYIyMWrKM8kde4vhYurvJ3nJnTaOvyta9A0TG10q+uAentq0noBrJEqOrfW7gm/IHqRQo/f9raFFul2tV8W6jFAK4lJgV0FpfIBIBj0BGOH+wtzkr1d9pUvHPNEU5aurJbD048cQXXXHzODgzZYgc0KM0+Yucmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JRuEi976COE/9cImTCHFxqfbvXj9PTkg5ri4vGKIZWw=;
 b=iUyr/Qoc0Azfm6xc2tTWWUc9OtGVt1/1Duf6OASn6hFkWxUb5BpJNaF0K6XuMFEUT0EIELpE1IZ7zRMIJRViRtzta1ZOM0OJBQ0NgnzVpf9sgXh0duI6XONgqAX2BnqNFmqblbwFc4uZCigTlV4empNaQCiDp9jyiDQr01F6ltz0LNZgvWZKVmCrk/mkeMAKXuRsUxGkcLlhOMLGVlzQoWxdpICHaZdRXmTNKClCQ7sb3xs7+uXfRMoO5cq7LcLsQdahLLvlX6g/n0nkUB1d5n25GqJK+mJ7U41yw9CrnMUJCdc5TsfRLiueQlGGAQLOIh1ldcCw/dLrhLrLwPaADw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JRuEi976COE/9cImTCHFxqfbvXj9PTkg5ri4vGKIZWw=;
 b=IqDUdIdfUiq3/+ObroPCOi8tWgXNV9XZzGIsYF34Vu4f09zHWkbhX0HteEac3kxALxiOPA+ipbttuSI40s9KVduNJvv0lP/PiszIvEYO4s5fuoggAnZibstrPTiVuCEIvFmfjr6qm6fBs04SPeZIqeWA1b+wTN8pkE01TPqHG0w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 11:51:03 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:51:03 +0000
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
	Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 11/22] phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management
Date: Thu, 27 Nov 2025 12:48:38 +0100
Message-ID: <d21e85a5d39af88808372760dde8a5ab31266f88.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB15042:EE_
X-MS-Office365-Filtering-Correlation-Id: 129e9427-3a0f-4083-0488-08de2dab3d9c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kKf+/DLrw+hs2XX/8BYKwJdhFn0tckupHnkcEkuYIXi7RlyjTPnaOovUhfV8?=
 =?us-ascii?Q?FHCFZqMmOlwimDoRJc4eoQUwyb/t/WfgqzWhC+VJj7cGoAAUrGz3uiGnb8Uo?=
 =?us-ascii?Q?NaIXFnpOtDRCnXVzYPAkpxqGhYoNCS+cLb3qqblqaxegwN+9tlYUpUgs1Q27?=
 =?us-ascii?Q?6Ol134+/gQrdCJiwa3+JWNDsnizKNWqKIDuFKra8Z2mhNAXZ/vB5+rS0UlXt?=
 =?us-ascii?Q?T7vd8pM80IlXqhdElwxHF7ZiOt+uLZJVRnttWs5BimaSNBKl2c4zQv05dGwX?=
 =?us-ascii?Q?TERvIa/mKBa8dG5LuO9vSaER95Og4YxCey0y3yh8fEgI7xoeJM+edkE2zVUL?=
 =?us-ascii?Q?HEJNkl8/RsjqdC0+0JKNxe9LacInC4HsZ5ELfG5ttBPu3Xm9i41BoqJ21TUP?=
 =?us-ascii?Q?AFX6c4rkov6dWn9zYkCcwdSWwGiULuE5O5gm5KPG+n1HcJ+tGKi1JAGicAI0?=
 =?us-ascii?Q?LBYuyeLw9Zw7GinQPbnf4BWMZYatxawAQU1occfjC440su8QbgA6vyGMp00M?=
 =?us-ascii?Q?OqEgK/p4u6/nuzJqUnT9XaHriHSG0JfiSMJutYTchT9IMSmmj1t76wjDdun8?=
 =?us-ascii?Q?byDlmHCUvb7T1z+Att6ouBo1YC6pH98H7zbSUbINO02uMNibg3vkewzuDS/0?=
 =?us-ascii?Q?Mb+jrpV3iqcyyQC2tVUXxWC5W+d9PZ216uzFccAcS3X1PafDGN+ecKjgPo4J?=
 =?us-ascii?Q?c0Z5eA+gRtTEx+XQJQ9RycE8w+jDQmy+C1ke9O2UWIAG98Eu4pYt2fv245tI?=
 =?us-ascii?Q?VzFHyv89Z8ypX+nvxZUcblt1L2K+s5Efg2iKSbAZYpYBsPjTc87/UIt1BM2V?=
 =?us-ascii?Q?7AVXaATwKDHiL64RXxCIvmcYiXvlTy6Nk03R2cMLDHYvbxv0fDeQcbdEEPYf?=
 =?us-ascii?Q?sXwLMdTJirPLp80lL/WLcISUCyZIeUa6eOR1yh5vrCmJXMYxUS53G08TjNGh?=
 =?us-ascii?Q?NJOWG/S0ju+JLod+kT/oCxtzNtAUXLkGTG3V5sw5OHkKUHohL8c7nUAvuTiv?=
 =?us-ascii?Q?7qli9/o4V0QebORPu/PyskqMind7LT5cBnj72wtp041HTCUgojGciLFZRiFQ?=
 =?us-ascii?Q?KNNrzuMerY3a2ZPWZE6EMlV9l2wqQtXaCVPceJK2bLnYyBQDZrRWJl37x0ix?=
 =?us-ascii?Q?0rtl5ufhSMF0DWwrgErNJBF+YhPxOTZja37NjNa26FOAfADaAkYcc9O32qn6?=
 =?us-ascii?Q?9WW5C8MybbavldbXlDj1lDrK5Gfz9FeUbpjUcKFCscEhTBqN+j86TW3eba+C?=
 =?us-ascii?Q?Qv566ki0E3tncRX4tVK0m7vCIuXap7j8OZN22lxME3aAEs2UQpA6HfbVDPSJ?=
 =?us-ascii?Q?2WU8fGePiGw3Jx4ZnLsu+8Y6RBIoUQZE0dLI8CroIa2VwajGxpRofJLbr7za?=
 =?us-ascii?Q?g/HQ+0VSb5jp19gOqnDpUWPfePDzf2O0ZBsrX5a8CHLNYW7OhNGJgmRlkXxQ?=
 =?us-ascii?Q?Hnjri6iHLuv5LKd/1M5zewHcxRGCEWfABANhY7p5ZVD9Bc+VyqhDLd+UcwQC?=
 =?us-ascii?Q?JiO5W5/6ANeCXJjzyL/JodnLmUeYln0nuQ2y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TCPiaAp9qBRKf9ze+3mg10vyPBpZ1oxIlsqz8y98sSTs2EA5ZjSERNr7mIJ/?=
 =?us-ascii?Q?NPt7lXiB6jkUSI4YNP6J765EvYXjhWHPkrtKJ8cBUd4+oPD14QZdy7urxVRt?=
 =?us-ascii?Q?MYwVUzdN5T7zoAwx2IkhQJOBLSytn62cYfr2cvBBpSNm3i9MuCsEyoCtex+H?=
 =?us-ascii?Q?gw/9UfBOSBuy+UVBlse77pynDUoqLQLqdCi5Ma5GziWZOXZOwj9xF3Dr1cdx?=
 =?us-ascii?Q?G9CRxiyQKs3rieAoB6dcQ0Xv/xAnwQEK7heLR6aAplT6t6Te/Xm64JBV+3yq?=
 =?us-ascii?Q?0MKA5hcDQXUz63ioHKRXLxec3MGzan4d87MCi2h8N+2AzB6+g1kCNIuk6hKV?=
 =?us-ascii?Q?terk6Mu92S+jpCbTGZi0HK2VJCJ5jsiiudvEnibrCaXlJPgV3ZCi8rAxHJ4K?=
 =?us-ascii?Q?FsaQcydHcz2VlE07WbiIdT2UcVeMLuIpy230SxxnlvjVusbzWPBwnQh21UR4?=
 =?us-ascii?Q?hoNlS3/AA37RyTVzLIXkMcl4VGZOPY0ueRkbzFgtS9fhTZTr6nxQZkXkwnT1?=
 =?us-ascii?Q?CjZ4GEysnnxdrWBYphXszr36usIcZufmsNB1oCZ7UG6jihu8MxJ3k/qNIvOg?=
 =?us-ascii?Q?6m9qmunCHCmw/zBL2o3it1XiT+vwdizffGlJBMO0cSJTq0NS3DHa0ilVW3Gb?=
 =?us-ascii?Q?SjVt9VADHMoF3t1SMoj3cJfMPikH8KxuhZ1btd0xISI+wMxfht9ZIFHfYA7o?=
 =?us-ascii?Q?ra7HWouDqw7BIumJ03HkjRdSGttEYsN8sU023+hX+bqZpNxgjrPuMdNO6s3b?=
 =?us-ascii?Q?xpzGq2X2l47qVSJQaudubp0E5+GBILaxvTTJtAOyKqVCsVkZKQ7WETORG6Lw?=
 =?us-ascii?Q?Nqg0Y0Q9/7F5db4kJMgnRraIkOyClu8j7q2b+Ph9EJPVvblCXyLxDYu1fLa+?=
 =?us-ascii?Q?W/a9qRDuYgQqiso/8mMlhc++yNr2DjY4p9anmJOEuTKSwopM4gvk98+FHD5K?=
 =?us-ascii?Q?7UbvmLimFUa0Ff9P4Di19XPh6K2TDyz2txEC4QFylkckvOUdZGau7KdlsTjv?=
 =?us-ascii?Q?FPWnlX3atp7+bw4ZnK+NwcglRFz/I8GvMqxYvw+IzTI8Z56PSFX4c7pDpBU+?=
 =?us-ascii?Q?7MV8o9pSaULRk5RgoHZzA8rcj+wZuaCjAYntKBPCqo94rfRLlnxkQ9EGP9jE?=
 =?us-ascii?Q?9HUntTJBhX72lAnejqCKUMzBOVH3TQDVLvfNqBI0zepnHp28i/c+roHfAo2x?=
 =?us-ascii?Q?VkJVLyU33BRKhYIJc8zxuFTC0BjwKQX+Yj4jC9OKAawaiirViPbKmjPHQVSK?=
 =?us-ascii?Q?T+2VaPIr5RSzLhQyACxcQqrYaZ4/Fvmxxgvkk1olSFnbqUoBv8jU+k4UQggw?=
 =?us-ascii?Q?ivvR6P1e9HYPAh6PK7u4v9nu82unTjIUJ0M1kx6HWq7t2W0NxEg4R5gAxt2D?=
 =?us-ascii?Q?rM2yoiZlFx0zJCr/fgc0oQeGswrkgZBjM1tfzBS4Ooxv2afe3oD4WlW04tLe?=
 =?us-ascii?Q?ytP5j/tdnqKeQ1y4T4q6FiUtLit/d+VRDzcPgKY7ub2+CnvUbkDahsshIiYS?=
 =?us-ascii?Q?Uiwz56TmmwxYukYxJs8F1awmEFYHIUNbpa+pdCA3IGVpYO0AwJsppxWKxkvS?=
 =?us-ascii?Q?jINcV43WEU1bxlI2KVQGT05OYPDeO//q7NHm0rMMDMCLpzfMOa3AbK6goleq?=
 =?us-ascii?Q?T+Ekmyi8NG/f8ErkVtbeKzk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 129e9427-3a0f-4083-0488-08de2dab3d9c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:51:03.0363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vl9jgxT6/Jmx+HLLYqRifeYaaFglwwy9vF7Ack6dR3UplSEzPOkDC0eAOFfEUYVezeofNZItd3bZTc5e5H69AqjJGC5WjVMJuYTPoBjdXfIGZvU4jNzuk4CQI32aHRx4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

Add support for selecting the phyrst mux-state using the Linux mux
subsystem in the R-Car Gen3 USB2 PHY driver. This ensures correct hardware
initialization and integration with systems utilizing the mux-state device
tree property.

A temporary wrapper for optional muxes is introduced until native support
is available in the multiplexer subsystem.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - Fixed if statement for mux_state error check.

v3->v4:
 - Added missing select MULTIPLEXER into Kconfig.

v2->v3:
 - No changes

v1->v2:
 - New patch

 drivers/phy/renesas/Kconfig              |  1 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 32 ++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
index 16211072098e..d217c630b2fd 100644
--- a/drivers/phy/renesas/Kconfig
+++ b/drivers/phy/renesas/Kconfig
@@ -30,6 +30,7 @@ config PHY_RCAR_GEN3_USB2
 	depends on EXTCON || !EXTCON # if EXTCON=m, this cannot be built-in
 	depends on USB_SUPPORT
 	select GENERIC_PHY
+	select MULTIPLEXER
 	select USB_COMMON
 	help
 	  Support for USB 2.0 PHY found on Renesas R-Car generation 3 SoCs.
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index d2c03a846b58..cfc2a8d9028d 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/mux/consumer.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -938,11 +939,27 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
 }
 
+/* Temporary wrapper until the multiplexer subsystem supports optional muxes */
+static inline struct mux_state *
+devm_mux_state_get_optional(struct device *dev, const char *mux_name)
+{
+	if (!of_property_present(dev->of_node, "mux-states"))
+		return NULL;
+
+	return devm_mux_state_get(dev, mux_name);
+}
+
+static void rcar_gen3_phy_mux_state_deselect(void *data)
+{
+	mux_state_deselect(data);
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rcar_gen3_chan *channel;
 	struct phy_provider *provider;
+	struct mux_state *mux_state;
 	int ret = 0, i, irq;
 
 	if (!dev->of_node) {
@@ -1019,6 +1036,21 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
+	mux_state = devm_mux_state_get_optional(dev, NULL);
+	if (IS_ERR(mux_state))
+		return PTR_ERR(mux_state);
+	if (mux_state) {
+		ret = mux_state_select(mux_state);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to select USB mux\n");
+
+		ret = devm_add_action_or_reset(dev, rcar_gen3_phy_mux_state_deselect,
+					       mux_state);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to register USB mux state deselect\n");
+	}
+
 	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel) {
 		ret = rcar_gen3_phy_usb2_vbus_regulator_register(channel);
 		if (ret)
-- 
2.43.0


