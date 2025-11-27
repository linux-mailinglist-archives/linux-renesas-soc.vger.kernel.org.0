Return-Path: <linux-renesas-soc+bounces-25256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBE0C8E257
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9C7FD342935
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEC032E6BD;
	Thu, 27 Nov 2025 11:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UrSvBbuR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287BB32E6A8;
	Thu, 27 Nov 2025 11:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244312; cv=fail; b=nk2tP301e/i0Lv9NVKMEGhCq0jS7LhlQsDgnib1ImMbFnrErrm4iQFIz9ZUe/PSkzoO761WiJqVc6kfED6HR5lEWfe+cucYj7jezQN6nkKqefTL12eIadlxJO0svcfKdg8O0bbvFnnLjOBoj5D/lqPahaHaXkoopE12gfImWpZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244312; c=relaxed/simple;
	bh=idGuIW/xczXYV6Fb4LBVayaVes+5fTrgW9sqa1xFXi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mtbVm9m8fsIFYu4Cxf2KSxB2w8tLlYbQS2WF/Q+rbxzJeuK7pqXH5m67ttKSK23p0AOccay0FdWE+4qF/y9gp7WxmR/VbjTk0Tf42o+KAUUl3Ofeht4BE6JSZnYHnw9QQrehxlvG1Hk+KwC6SNtdptvwwC2m5JyOD+reFMbx1Y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UrSvBbuR; arc=fail smtp.client-ip=40.107.74.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKRIf9vnk2vkL7JbfitdEqDRW5FrtXuhDvxwHNCwA2ho46UpdQWTgACNynP9VcfVAQenvErMQd3P9Y+/o8LJWbLUBun1oYZSaHBMSoHY3Ed0C0M+RgKHD+X1iZMj06ec2lTcqR81scMOQpF4yc3ga6VIKSyyROP7i/z+x1paC7QqXMTcavPgsSVafbN9Q2wWGwv9RS/PWmigAIdeigwv1KWBrbgH+EbndupQavenq3yeSkmA24vIQD4/q9Y0Jb4Olx1p66wXz8lyo/71oilhQ6hGujcmrhh+BRn01LiV2qF/q8LyIAlkoG9eeA78Y1lXzAz6Iqgk2KzPaIBUlsML3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WHWQTMIrrvBoIbUyznLBNqJOjd5PjBq1CgECJrS+LE=;
 b=SudDqz11aENIOtVcGqaO0pmroX9SlYu4tAldmibkAJV5b86xmylx3UgmwN1AUAdR7eVIpaUwWMMl9YyxKl2lrYuO1KoF0HpQ4FPr8bdKgFf+ifV9BgGrB8/vwR5mcU1iSG/mhXjqBsmYeuJcXEt6i+0imV6CLZp9ZluaKu0Y0aGttjFyQtAS2x4THRejVGYHgggjqJHY7eFjOy/zUwTEa0mIh2Ceh3ZsvCQ5c727XZyYQVMLz/lbeqFfrQ3zkEazupiKhYAMpSHO8WPHPxByNT8Uqsfr2EqLHQBc+EOtv08LNDfNATjlesO25QEEY4L7i8skfYW3C2IBziD8yWcd0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WHWQTMIrrvBoIbUyznLBNqJOjd5PjBq1CgECJrS+LE=;
 b=UrSvBbuRtiNvBlVwz6GXr8u3CDT2Xm2Kjwlxpskv5XWTpFYdunTY6M1SPUv0gwg0TZRTcBfB4eihJLuCFBvDE8rpiboFuMSDxIC7tXVldcb0sP4JuduDCvtZFCiSKkZWAvbOJSE+byrHpIi7LEMwKFXF7gfWCBGm6XakH6lmUM0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 11:51:46 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:51:46 +0000
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
Subject: [PATCH v5 16/22] arm64: dts: renesas: r9a09g056: Add USB2.0 VBUS_SEL mux-controller support
Date: Thu, 27 Nov 2025 12:48:43 +0100
Message-ID: <c63d0a62d439a78e9ccc0b4176b84bbc32629a8e.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7e950267-2016-4fe9-6b52-08de2dab576d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ul983PDG1WGkzfI7d4g7FeuMlYdFWcvZu0TPFyEYi32yZryeffXkQ3Z4C52H?=
 =?us-ascii?Q?nzR6+jkbw7+EkyJh/b9WiaqHoQqI1lxSD8PRVltRCQLLFo0l79BrLHbQzFoT?=
 =?us-ascii?Q?7UqGultOeB67SMAbDg7cTFxnCd+j9O33nB7azRJuDGL5w8Mr3iNPvG0etszV?=
 =?us-ascii?Q?0VBpWipYcrebPewdJ2GjALrpTUhBQznjZIvDdDWQocxSc6FQOuBv1cV77iU+?=
 =?us-ascii?Q?/0QVUUmcH5cL/YKDz6h+jw5+ZnXOvQEgepOCI5kwsO1wI693M/BR8/8u5QcM?=
 =?us-ascii?Q?AvpnJvcLmwFGAFyEipl9GCpu7k60wdCPHIjlynyHW4LyMxfm/J7fGUyTSJcX?=
 =?us-ascii?Q?UNSBwTLu7fEF3WwdIX/FU9O4XIdgdXB4pMwrHst9j5MWNwFCg6jqLw7yb6YA?=
 =?us-ascii?Q?Y8boaiMQ4tOrjnejoVruKV3A2XTI+I/lN6/Y4cinTCeEssoK/bw65bT8K3G1?=
 =?us-ascii?Q?0hCX31SWDDB+jzhW+fyzvqGwc5a0aZxYS8tCHp+JDiDOgbtK/j5/9Syify0f?=
 =?us-ascii?Q?EQ12S+VWHne4l4ATsAhg6tA4EyIIEm7i+jJRuqPr30OsmKJSoUhaT/ZG0oev?=
 =?us-ascii?Q?zTQz3wLNxSKFxSqvx2hMBb8RBec1bfZpPX1o+CjFyi4svl0HJ6psTedq9nkG?=
 =?us-ascii?Q?y7YRODjGDOBMjV0i8dGu8EfgNAh88RR8swOxFQFVf/gAToKWpcuySNML7Zzt?=
 =?us-ascii?Q?fppSijX81MqzJ4sDmad32OdvzLwWe1x8kOtyN2UCRBPtju2D7rTh2CaMqZqv?=
 =?us-ascii?Q?7gl7KRohAz5kolGwwj7kjkawZOGt85BhHqucBU//Gv++IdI4ldKETOx9CgWR?=
 =?us-ascii?Q?hdc0BbP3r1MpUayAWub6iffaidVUyZPKZWI6LfdaKKdF4+xrYU80xal8mvCN?=
 =?us-ascii?Q?t8kZqXhj3MlsoS4ZDV00pDCFjwK0+Jy8hpwNo5TfDioEL8d6stUHMdm7fggz?=
 =?us-ascii?Q?3fCqReHYi3HKVYRKxVWzlY5ncJd03xHCfhOeH86d0slghPWiZqg7Cu/s40Rq?=
 =?us-ascii?Q?SEsLtQsbF6e5r8zhTfQJMQXlybY0WJgAmG2Seb9SyZLzcAKD6jeLcy6l8lFb?=
 =?us-ascii?Q?4bIcoAYLwxaMx4SqoTw5+Nw5oLK5Wa99wde3EQd9b9i2pFJfh3ZBAdm2J+EH?=
 =?us-ascii?Q?oVib8ECzOvAhmvlFSo7ohYsHpCxOS6adlMM4jnrsbYNXkdP5X2dk6Kq5k7Wd?=
 =?us-ascii?Q?wFYDuol4jiiuYW2v47gJk6iUnnD564uEASuLyfi29mRtUkPuw/tu3kR8CXE5?=
 =?us-ascii?Q?9bmuVhGHBTKCoHR9gQMpaWdQtSPodnQOec0ULpMU6c+EfLh0Dq6CnUpCIFrH?=
 =?us-ascii?Q?d+dHtE/AtdkeTfqlqkHDZ2KvMQ/sWPnrduafNRJ/Wji/cu4yOmE0e7qnBaTw?=
 =?us-ascii?Q?uDgo4ZofXhvIMcmWG7a8LgWll7JWDB4/mE2UCBacvljjGdaei3QOKcQDw3f4?=
 =?us-ascii?Q?qsmtPGE2SF/7429QQ37Iw8i+ZGAHmsU/k8b8y5qYEmAlVrF2p+ggNe6XAcCY?=
 =?us-ascii?Q?/fhboC81zkiSyaFaPbRYeqXAx1yXs5PjZDVk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ge92CEF6JJA4sakrc4o89MvTaRdLR6KxlulkQnaaYqaJ0j4dsN6tzvEB0StB?=
 =?us-ascii?Q?4jThuKmHLmJZBImjSCRblgTjnnSf/8nnNUbNk6gPFMgvKTDYgbdYPMRjsXQm?=
 =?us-ascii?Q?jwXRZq+rjuFeJk3g95g7s/MatClxW4CSbYBkVqC2gKmT5SAN8sSfwR8ZpkTp?=
 =?us-ascii?Q?XAOzyQ5N28Da2oN86DBNzVU4qJU4AiwPFn+itHi5e0snGxpaEw7skLEFZu8T?=
 =?us-ascii?Q?gZpNfQaOf2k8YMSBUpyM1jnfUWi45JK84VdVhSzeYuk7zlvXSE3pmryIUk2x?=
 =?us-ascii?Q?jTl31NwxSTsBxeOXN+skiV1gYp9T864GhkuNIsw1bznCu5YJl8ovTg//+5SZ?=
 =?us-ascii?Q?44VKpe+NpAh6cql6cV6AkV8SwwyKhAcLCMzlCWN4lYnD+dXBNTK+VQfOY1Zv?=
 =?us-ascii?Q?ouhS61ikE5p3exfdn2i51RjkxEUkKE07qv5r0Tfrpmu2Jm2p/644f5/VLebD?=
 =?us-ascii?Q?nLPe5v/hAZwngKDahG8W9X5z2yML5g4uOds0VRPoCQTYsAh8a4pBvLxkutE9?=
 =?us-ascii?Q?JMQKsUBjvveKoImfO6JKYZ2jQXWP+5KTEHqcAkgBpTXz1YS3BCtzLlwFV7+V?=
 =?us-ascii?Q?oVDoQBxtqQZ7PCR1sgsetQbf7I5XYhveCcz+BXC47AB2lF/Qcd+pKqecxggz?=
 =?us-ascii?Q?Wr1UjXz+Pdqa3SDp5mF1TaYs3tFGG42Y6Fv7RzJYAglmJ17vR4Dyvgow7BNH?=
 =?us-ascii?Q?BlBf+8dDi5z7ctwnMzJDqmIKoJhgaGvVDWDfdkWwnU6IpgSVxnuHyQawvNsW?=
 =?us-ascii?Q?fOgVDwCsM5X8Abr76l8C1km/aGc2cNcmd2sROkHv4IGx9mBj0aVUG/7lA4Pb?=
 =?us-ascii?Q?M4wwrNkRzGlfwUMHJKnDYfuJVOP3w1O/+5ggqh1Wyrhkcxq2vW4mtnKacsVe?=
 =?us-ascii?Q?a9kxJbMOMAwCQEOpmb6ZyxqdLbKc7GKzb4qv95nFIlAbeLnsP1FzjEp6JCOg?=
 =?us-ascii?Q?kgmTrXUHiUOo+43TZw4cYVEbT4Llb1On6lFAT2zEZUa4qeg87H9ZyJELYyfz?=
 =?us-ascii?Q?OSF8QDU7wfV+09AfW0d25wmTJbDcoHnAvTf9LQpZzkUFxF0POWsMBmeieZZt?=
 =?us-ascii?Q?R54sc3JanFi6BjUTKnmYaNUS5CXs4/vzixcuLiLl1qscC3R9j2C39d8Yz3cX?=
 =?us-ascii?Q?cBvPp4lPQXQoQP4tOU5Pq7eTSXiM8yDHeZRc5qVw0VFlEFsfeqwmf83zH0OC?=
 =?us-ascii?Q?ijYxATUyTdVU9bN0Evup+/0606m/W/iqJGuoe4XD+zMrluEJviiwixSlPK3K?=
 =?us-ascii?Q?AAOD8t+Iicrgskk28vQ04LR43Sil9tBdkiTbxqXAY573kqsExL+grzV2eRc3?=
 =?us-ascii?Q?7M7xomMPePvEqVdx0Fk39528dCAGzPLKf2rG0v8AxcWFpzPgVdCZDT0FaJbG?=
 =?us-ascii?Q?wCJ+jDgdIqkN0+Hy+veiv65aTK1WDtOnyAvrSHmGIfb7HjPfoJHzpNMGV/mn?=
 =?us-ascii?Q?A+RoxfCKCg/F5q34kkb2QCaHKjxyg4Ira4qq+Taw6ZrqcgeXEv1p5L5DpU9w?=
 =?us-ascii?Q?occLa9fFz1VpzuBCF/yY5imCa4BCuJb/dlBJvT+C8J9nD6PuajqcappKmUAz?=
 =?us-ascii?Q?JR8eddUe+n2qpgCEc353isAqV9BwAhXNy7DPk8rs6k+gmuC7xn/cwELocauU?=
 =?us-ascii?Q?0ioY4KkSiPeS//BkPw7JnKU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e950267-2016-4fe9-6b52-08de2dab576d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:51:46.6616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsD1PJAA4DvOE1yT7CpOjxIKT2b9jvMIl1SEXR13d1IpZYL7WY8mL/ZRK8fnHhFpOoYw1XEMlBo1noi6zNsKvn01hlk/lBJQ8fsEBC67xr1Ht7jdXql88fXYZ1sbjECH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

Enable control of USB2.0 VBUSEN via the VBUS_SEL bit in the VBENCTL
register. According to the RZ/V2N SoC hardware manual, OTG channel
require VBUS_SEL set.

Add `#mux-state-cells` to the usb20phyrst reset node to expose
them as mux controllers.

Set the required mux-states in usb2_phy0 (OTG: state 1) node.

This enables proper VBUSEN management for OTG channel.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - Switch back to v2 implementation.
 - Improve commit body.

v2->v3:
 - No changes

v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 8781c2fa7313..fd2b72caeceb 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -663,6 +663,7 @@ usb2_phy0: usb-phy@15800200 {
 			resets = <&usb20phyrst>;
 			#phy-cells = <1>;
 			power-domains = <&cpg>;
+			mux-states = <&usb20phyrst 1>;
 			status = "disabled";
 		};
 
@@ -691,6 +692,7 @@ usb20phyrst: usb20phy-reset@15830000 {
 			resets = <&cpg 0xaf>;
 			power-domains = <&cpg>;
 			#reset-cells = <0>;
+			#mux-state-cells = <1>;
 			status = "disabled";
 		};
 
-- 
2.43.0


