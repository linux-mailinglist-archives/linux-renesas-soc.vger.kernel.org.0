Return-Path: <linux-renesas-soc+bounces-25262-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 40164C8E29E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 822AC3491C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8209A3328F3;
	Thu, 27 Nov 2025 11:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dg2QFIcb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010034.outbound.protection.outlook.com [52.101.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641BD332916;
	Thu, 27 Nov 2025 11:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244362; cv=fail; b=MG/kLHcowYYaYdAb9EyBCmYfSLOS9hSC9DZ8Y21PaE7CzCIF+yVE3TvKNi2TAGG57vO7EK/a9xCR717zuER7xZ+DLAw60vSSVyq/UOpsGsh0CpFeDrclhH2yhy+b9uk/BvkUib94V1XEajQoeHnO0zNsTO18iawQclzQ+VAL+bU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244362; c=relaxed/simple;
	bh=+od22LJrZwWCqBNFfph7ULH2UHDWiPCnsUovmryWUgY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d30dWI6LGpBKbfcacazfq9pOWNQb58bkOhOotWEfJeTR4yRL76TuczFSSOmXD1dKMeOyJhisHTTfiv45abTiWsgcTNIg/N+YxzFdSRVC2s8jioYlkdmEP/UkJw4Y3HoNfwIOHOZxGbmTUooMZr7n+Z4z0J+vT+8xFzwzmtp2icc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dg2QFIcb; arc=fail smtp.client-ip=52.101.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M56bEEVEjD9B/oBGNhZ3qaA1pq7n9PqkHeS7x5+LgymnMkoNVGASrLVZ4ViAWMJulXNWF9uD0C7THVe0Tg2Fd9r8eaEJ0ys9O0QkV0qwS4qfRUBozyBSyYysv7H5TwSFnoX2IPuHRzivRxeFPP1ZNLFuC4YBc8NUSXiX1+TskbgroW9lfnddeHtk5yIJMh9Rd10ijvNZNqKK76iYsgqwDVkxA2nTEgYVQHZhlFOcwEMd9s78LtvPeGSr2AbCE6CuKYXRwZ4R8OcX+QCOJdO3t/8nydpXW/5ugN6MEpNx6+YwF///xEB0q8XjaLQS9MLATF/yVIsQyqZUuqiMyDHUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ngziHRMonBqtmUDmZOWVWsWnrF1q8TAt73ga8BMjTo=;
 b=tWqafqmPEgslCPXDf8+p5WcXb8acpN6qx4IDORQVuxqPMWUWPl3F45G24wdT3PYPCYYU0lHiSG+zAOyFrzZvL5ZNJ1mw3cFa5kCZDsnxrTGnx5s2NXp6IDV9enHCTdlSIw2Iz8Z12CRRL9+RwznpYNdCf3rVD6xvkzt+I5J+Neg344CygpYK+Y1QbzCxmHtQ8gGT3vnH6mtEppkd1YmELOm7IzgYM5sLsbT+GyPikY4viCKg/tJJZKEUtCiG3Ru+tGK9bGw097CHJTTycfYvB655VVcebCsmhnYGs3dNjD++kl/NiuAteTKbIqY6ApMG9J5QCm+g5f99jLoEbzQzRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ngziHRMonBqtmUDmZOWVWsWnrF1q8TAt73ga8BMjTo=;
 b=dg2QFIcbnkFnjkkC58WSGoYPfqo76DRDUWZ+j+2XQvR0UsSn8dhR33SOSEC+r2ECUDEN3WJhGvOeNDBSyYnC1Q8GYtxV4OFve5EWEr898/TzkykaFsVHJLwKwR6Sr3V7fIpTvSfsQiW2+uFmAvZJeuSvz/xoY3biTqpavEWfj4Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 11:52:38 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:52:38 +0000
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
Subject: [PATCH v5 22/22] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
Date: Thu, 27 Nov 2025 12:48:49 +0100
Message-ID: <cff727e8a845a4a6e332a43257d7b2694ded48a5.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: f2b99532-9c56-48e2-e25f-08de2dab7601
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qoPIyy1Zc+ZnAEX4we8egAghJHK5eCF6V2A+AovGVaAFDn+la1n9rPLcsUjG?=
 =?us-ascii?Q?lM99y0DT34ZJdTr4fDQktMOhpkZT1c0wR5mtKFul8zzfTEWRla8fugR8tpH9?=
 =?us-ascii?Q?nah4T0Omu5mT5i4BuDRYMPLPglXI9yRCdy4YlHsR3XblZ1rtthpUqoinqvVs?=
 =?us-ascii?Q?lGYlYjDSt2DICXhc33kP7XJ0pOZEErJNka2X2dKYuol/x7M3ZGoyupR4P7w2?=
 =?us-ascii?Q?1PjUIyuYz8tKmP7Bhk4J6dKAr5ypoGoBGkbf9ZzpilipW56OjeWH96vurGik?=
 =?us-ascii?Q?zZbd3WGABPiSy6VnJdXccdEa1MI9EBvUwVmozUrwgSH3TmwGvc5+qeZ6zhxA?=
 =?us-ascii?Q?icT0eh1nkL0UJw6gmBrOBeE1Kl396mIf5kLdOqClYMnKxw2WOFxXPa32UUI0?=
 =?us-ascii?Q?wpX2kBWAlH3SERPDJWiRiGdpyjL8H2de+eRQKmsIvPgiVeFsaJaHVs6aQ+6h?=
 =?us-ascii?Q?7y1n3KwsfrhInw5WhUQIDEr3kzpGQGoVUWkhSkuQNqACSsAM1aMWUll+EzIq?=
 =?us-ascii?Q?bx2f24zvihdABsN8g5vvLQuqkZD8zDmIKhikPNdelkiUUi1CHvitcPdrC3WV?=
 =?us-ascii?Q?HlOJ6RxUBM4Ay94fOsQo1kzJC6o8r9v0EwGGb1pxyjG+3V8ERso9Wv8yrykA?=
 =?us-ascii?Q?ErWzZ3z8LjgBaIzaEsmWyoZMNuOhFSH7PP13kpBvoCKn+bX0EKqkUWETPKlo?=
 =?us-ascii?Q?DdRKpVww7qg9XL2DeapArZ6+9XBtT1t8g7Cvhq2qsfnlVM22iV7/Iq5jOA1N?=
 =?us-ascii?Q?JipmppL5PoGbWebmQf6CnpU0TGrfdB9a/ObVEZWvtFPmFMXbf+Yl9YX5YLvU?=
 =?us-ascii?Q?MRwXBjAmMF4dM2I+rogfDnjiYaeO0mWv8GhOsj1ae3kOIbiRGIgln5zF3NgU?=
 =?us-ascii?Q?Ac1hSjbLkeRrCv1mmw/bfuFT86ROMPHgCkWSTHISgn0LcUdoc0speWdSiI5D?=
 =?us-ascii?Q?c1+05c7jvBTZwoUwjGhqDopSsUaCEjQT5cuvvnHydpS2IGnEpKw3p/dchT2t?=
 =?us-ascii?Q?8udDQq3vPtKRM7SPehH6fJiPm0/thJhciquK81/aLnv9eqHY2PoAJvWdsNw6?=
 =?us-ascii?Q?NS139AtGIi6OqAMkriaqrGNl2m/hDrAQySMMpvEqNRMDuAfHgUaIuW2YpGAH?=
 =?us-ascii?Q?x3UqMW+z9mX6b5izpDibYiuuEj3717TlRrCG1+Ld93xw4RxSng5gp0NalrwT?=
 =?us-ascii?Q?DU0pvGQ/3SunGtDhlLTW2br6QwUzAMz6RORQaiYDFThDJjYqFque6xzzf4jt?=
 =?us-ascii?Q?H+32OrJe2DValtR+iq3BL3XHVIjWneMw26An5zDM4hP8lsel8fOy7SuLltL6?=
 =?us-ascii?Q?MKsYgcrmT2Nsz2OYaPH6jIy7vnJ1+tP8opZaTvdCPSGoXuRXEDtWpiRgbBCB?=
 =?us-ascii?Q?ZuGmNBnoZWQjmIF6VBOTJBcjczwJ0Zc6GJeDRTHxfHd+9W/i+0a9D9i9LL3g?=
 =?us-ascii?Q?mOr5rjJEWdiHVbDQFpqPshOMlOCm4elR7cDlBkT/YsH0JmXQr5zdwfIlwUzE?=
 =?us-ascii?Q?F8Fi1+mK1Q5tPeg5SU04K8xSY0rHeBJVsXPT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZA3u0TPYBoosrt0MwKmnwKxMFPY9Y4y/3AczuTuuUc1IfhK+ohkGdJycS7kD?=
 =?us-ascii?Q?ygu6pICzsMuKKG/Aw1WJD9x3AoBR/MdAx7ip/efmXXLukL8lmDh5eikPyKfy?=
 =?us-ascii?Q?5GXVWoWU/jnUxQJP7ohErCFGS6fFIa5Tdjgi1vEpgctOTagonOfh2vIaN7HN?=
 =?us-ascii?Q?8qwXGQ9I6HWZAdR0v/Tkg39iiRS1gIb5+3yyqc245Tg7i8+0wVh0wP7d9xRM?=
 =?us-ascii?Q?QCn1vrAoKTcbMmhAQ44RJUBQGURmD+S+i3QUw4/98e0XYlk4iy53XQ4FC2E2?=
 =?us-ascii?Q?rtsrP2j+v+XnNrI0rzWQBjHDNV/xexcmDwKAiDE5YoQAcNLD1NH0t9u4hDBU?=
 =?us-ascii?Q?MBq3/EpumPTjU1DDaYZEZMbATTu3I5141+siD94xeabU7pG4tZbIvuf3i+hC?=
 =?us-ascii?Q?mT+p7jYQa/EykZKHc8knrznsXvYXcA8LjPxnvS+FUheyHQ1tPgBU7szgtYlq?=
 =?us-ascii?Q?s+jtFa1zYFmIOv1YGW7HIIVCeriGRsHaQ+0UmYtG2iOI95bNkJXSV6e6i78s?=
 =?us-ascii?Q?uKgNV9uF76VfAcm6fjMkksh6i6GPuBgMdhfESSUei43H3Ojuoq30faB1J/1i?=
 =?us-ascii?Q?OViMT3pq6ovrb1dM7lVnmuelIXY3v7l/j+zSR1bUQxbA4HBTAZTJAMdfYKAF?=
 =?us-ascii?Q?8KKaUEUy2YcI+20kSR+UBs9mfPS+2BALNIDweQ1MHP6h9GSBkttG/wY4M5pz?=
 =?us-ascii?Q?15qCZTYuVF7wj8KzWsAGW6kk/xMWLlrYwrkV6Qr3a76eu1Db37L2fXqVI+OH?=
 =?us-ascii?Q?6WwlYtZXNei+1fArnVpUgxQmY8ZK/66qB5BTaszEcV6bkeGs6af/gjUeoc3M?=
 =?us-ascii?Q?f4J8yUpUVfI2eEmrdLjVwptrHnHQyYAdgwRC+O8nj9LYCP2cbBeINJqKzoEh?=
 =?us-ascii?Q?1kW97LdkDPjpEbhp6Q8X7DuqwmAw0YOj4kC3SSCA7thLIWSbQMNU/r3pz1QM?=
 =?us-ascii?Q?f3b1IY+veIFk4Lv/15XksRmxFahi9SNmXMap02Clu76ERhQXn5VRtFkxHXZv?=
 =?us-ascii?Q?aVGr52dp9NfGsxint22S3QqfuXR0ebzTvbkjni0HXmT/eWviy9Q+o5FAYrdr?=
 =?us-ascii?Q?tDb0oG+I9C5giwiiKENUnu/N+jj9jCZdFLj9C8rR0a/HLVqRS5H2/CJH3vAY?=
 =?us-ascii?Q?Nf51HcmOi6JuHQOoC0s/QGB8ujCt7PFaCS3zHLj1Dq7ZyAA8dCrC2j3N42OQ?=
 =?us-ascii?Q?AhzKgFnNjyW7S1gO9LjL/BqeiY8cgM8lfKwlJ4LZWQbcjOTOzKIjwpK5MNGT?=
 =?us-ascii?Q?QRnzcMPNR6+qemdCx6ZqdCw29E1TSBbnHBOdgVocrRElPD+4aupW/s0+UpjT?=
 =?us-ascii?Q?PTquKQdCz2o0cZ8+GMfHTj6CxlRQwHpGEnL8/co+3LX2l7qz5t+J1bhSIOxt?=
 =?us-ascii?Q?aIt2CexG7t4bA9+gWev4oF9E8g8FMeJEH2IzgoEUsoCZVPtVE1JYrUOgeEJ/?=
 =?us-ascii?Q?BY9M5p9lNW7cLE6FsdvI7NX/M47FXKQnrRHCIyNki05urBnO1eVpzvhHcteU?=
 =?us-ascii?Q?dk2xvu7Nq4kFyN6BMbpRyAcAgOtTcSChTZSELciuX2bwE5fdcYwwDSeDx2mb?=
 =?us-ascii?Q?Omf73M4fW/1ixSjc1PxITD0cQPU+F4bwwCkwqQtNjRrGLgQfKsH0y3UrQHHX?=
 =?us-ascii?Q?tJQ9TC8MQjHu8e03HYOVDk0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2b99532-9c56-48e2-e25f-08de2dab7601
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:52:37.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sOcTBgE6E9filFm6MSKiFiNF96MfcTQUVZBcTK6SuYPN0wwdabWmXlVl2Pmy65KY5l0BJc0H6lNlNzEJj/OE1mkqO0vPeexECVdbOygWlQs0ifmvIrRalFalFf9YZswB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

Enable USB2.0 support on the RZ/G3E EVK board, USB1B_1A_HOST and
USB5_4_HOST connectors support only host operation and USB0_OTG
supports host/peripheral operation.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes

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


