Return-Path: <linux-renesas-soc+bounces-25246-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C6DC8E1F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:52:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71A8E3B0A3F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A949932E15A;
	Thu, 27 Nov 2025 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FH9ZB8Oj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5391432E699;
	Thu, 27 Nov 2025 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244225; cv=fail; b=WCoslsUzAbTxMnw15It2BHn7NHQIBRzWLeTULKXZzzjKdzPzH1YlyVYOlsGfoic2drI8GsdI7ivabpwJ7Vc4DHoaV/fKZk71D0f6i9clIbR93n/ZFVw8ptbdCbW+k78LaDyubh0OwlheX4/ADiTiO2fRpeL0MSw6bYJt5ny07/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244225; c=relaxed/simple;
	bh=zyigrCzZbB6+xwbZmlGYmnWW9kuz7W3O1pLj8cvPmYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T+JTk7FFBZVqcjZNW5RCILkglsx0CkFC4ubsMWI1DFXnGjpuXgGVD0+gksyXuPDYYJOMrBJaszd6MC13YuDC6Zegw3MOsUP7R/adm0v/dA7t+CsFb1BALlhqfeON/oWmBZOp/VVxNv3tqWiItTVByCrkeKnb2vcvl99Q4X8k/ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FH9ZB8Oj; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nK2Fpzn3WOPVA2tlvOUvf4bFAO/zpyGxZUe9FhURQQmcneA1fh96SutjzkOlmYedOe9iMdS7sa6Z4ov5/1aIJnUDORAphYaPn/QMP3hBn1kx7Wi6aecVTExYzSRK3tRbDXE60//gnE/OCaZqzxnu91e7oVnI2MLeiRQj6oKxI+HOaxmNAn+MN/cZySCQeBgJnNMHjtCtbWXnMqi5jYDuyUbfNJodnUiXVztq5Nb4KyUdLTA/pfAL9wyFXQxUM6qjWtHGfsox3R+KcIaEFMd1+uQu8OtGm1WiEc7Un/6+VBy7xbgG83SIngQDxnz3keKNMJruDyZT+mnAFvDWLMKaDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHa/I+6s2NgvIC48O+i19YTKVXyQ6M0mp80PRjKRBvw=;
 b=K1h0iqzsfOIx74sIfmy5H9BxGKvMgkLy/3S/qLbazpOnbrfp7259zysuOhrf37YKW0d4JbtgZVmtWshjOqf2BH1sqM1on0U0aBmTDdD7jG6QgmLKCF8on8SOcySyJZEQ+I4IyrGY06tQX49cQlOrQIlI7lRAki1OF9HBXyKTramQlvbpOHaG8XGYBkn+Pr8Z8ut8YEPKd03E8sgjpmJnqR/7/oSW2HSVHirtGURlPSIgLDE/cNhwOt/N+/eEWlApCsWDaPCynGJOS00g3XZJDQMFxXxaj8NHjXPcClStP2qgvGw87oOqQfLNK1v92SxX9p5M23oB8gBZ/sZLdk6ymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHa/I+6s2NgvIC48O+i19YTKVXyQ6M0mp80PRjKRBvw=;
 b=FH9ZB8OjdfOabQ8mkc6Icopd5yTCMEORE7tHK2CKQEXhlBdXJoEsZYMJ5YUgSJi8LsYC6rRxDumjtVhS75bmr/xA2d9bLqXP8InmC6U3vZLPwJnPoN1VJZnoZ+ZSzDq+YZrQE4VS7p53/8l+LRlTZcL7N0BDjGVAfmlf4CUZb4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9632.jpnprd01.prod.outlook.com (2603:1096:604:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 11:50:20 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:50:20 +0000
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
Subject: [PATCH v5 06/22] mux: Add driver for Renesas RZ/V2H USB VBENCTL VBUS_SEL mux
Date: Thu, 27 Nov 2025 12:48:33 +0100
Message-ID: <754a710cf394b8493a0f155723f46d8b926e39fd.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: df0ecd65-c2f8-4777-50b2-08de2dab23f8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8M4phpEUSjYjdBeO5R1qE8uC1koaktHsvH2K2CFQFkm9wgyMYPaOPli6rs3T?=
 =?us-ascii?Q?6t6z6GNTBt7Sk1FJ4nafp6jW7lCabOsD54WF2RmjJ29KQPUG/wEqoprukKXr?=
 =?us-ascii?Q?rldUSzjP72NOAqsDkrZU30GCUTDWjfDUDrygnuos8PzOVomvkevRdSgEQThU?=
 =?us-ascii?Q?Nks9HiJ7Lpx/j2eNBA3CFxNqxXOHJu28v61HDqCjltUIQSRdzEcLntMFpToJ?=
 =?us-ascii?Q?Kgq0nzW11S/MGBR2nu1mwSjTXd6uMndNC44cXmwvHothR30rcrysKzpMEULj?=
 =?us-ascii?Q?nEeDwa2Ef8YHYfYiFqr25klGmpg+4xZT2pYunY9Jkp/YmJgxJeQ/1VTWXwpt?=
 =?us-ascii?Q?NIlHw6X1z928zrxO2X2l46sqERxG/0dRlRUbFqgzmG+iSyYDgYtQzP7BZLIT?=
 =?us-ascii?Q?GlNDybSeKNHtZwBAHpDpjXc/jKxx3AzfwYCm/s6Ptiqvyfpv8jfQ8rLtrROG?=
 =?us-ascii?Q?VTDCl/QZOWwF5h4Xeh9HM8pTNcQj8KaK2LrXbvJD9mG8Tx/jaO4F/8su3qRt?=
 =?us-ascii?Q?CB3p/A12zDtGl5DEDHZOK4nEruY6X4fEu5QjVo7fK97KMYq4fK/U6HbYMqXU?=
 =?us-ascii?Q?dr/EYm/Xh65JZ8q4Rqa0Au4GWmoPC2dEWQFCx+R4JRGGjxF8axq2QLyrjRDx?=
 =?us-ascii?Q?Utqp1wi+0TaqiqpE5doxyhpflRPigJg15WTbX1I/vC0zPvw15XL2DnQBVpPk?=
 =?us-ascii?Q?BCGuEUt72JW7m6tbcScBaWnpyd3SeKGRS7gQP+XWqcAGfxRHteadFJX6IzCN?=
 =?us-ascii?Q?3x2HoBUAWc6Yft9AESUCDzBT2qIIw80m/9jQXVOYzLeyiE+7aRMC8eR5YmrZ?=
 =?us-ascii?Q?eLyIFM/2DsVC5CnmSYXPdRRiAXMrqWQtZQcSThEQ/vK/AV9fhtDVMZ9zAQfX?=
 =?us-ascii?Q?/kNh+gW6WZ3qYUn4qqGTSRD3DvQc4arNKjJ5pYjnZC+z7jrPK8TT14ZoXPR8?=
 =?us-ascii?Q?Y/2qs5lpeatEAeTxedBS8kFbQ4fe2F8u4jC0IhV/8/W6OcCH/tHY1RQASZfJ?=
 =?us-ascii?Q?7Lj08MfvylqY8CHMyV6p6rCgwrwJIAU9AtpBjyz92EsbqiJ/+YaKXXdpMpb0?=
 =?us-ascii?Q?8gazi/9jM+uGtP/vrZhtfJYLfnE6oVSzNgcyv0bo0ipH1qxU5QG5h3UUYkqW?=
 =?us-ascii?Q?NLLr0+iCyE0D0a7ctXwieVKTSWoIGUbiVom48rpN8nLCGrDRipgQnFsD2KMj?=
 =?us-ascii?Q?RwbkTFUWBmofYDLBQZEppFYT0t98q9qwq6Pjq9KAlL/WOm9FOHeCzfJoTgjT?=
 =?us-ascii?Q?6EvR465OZFOd4EfkCWTxysS/LcO7xkvJjCaAcTJajEoOYgzenD3FBB/xI/7H?=
 =?us-ascii?Q?ChZWkJhp1CUWWF8bHAuZ2flSQbsPAT8+jCLxQ/VOBDtSVTfb77ROZlrP8jpx?=
 =?us-ascii?Q?LX1XUciHJxj4i/oQLJHRgDg3BbnTBWa8bPA9gEJ5BlhmdV4tGyKfs+hKk6Sn?=
 =?us-ascii?Q?fpDD9Hl9QIUOieS3Rg8A8Dghbbji+n+aZJI/aKrqDTiR17SSkwWkWJu4xgEy?=
 =?us-ascii?Q?1qOrPIwK4t2DKY+lU4IuL+d+2lZ4IZsMABKD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/DJ32MV/RIYcOFt/LgzbqgfcYisXY4HUwKRIQJwCT8/TvV8sLW2oU0q657gA?=
 =?us-ascii?Q?24BX5tJDaf7u/laqcXj0TvKTTFBVLDLx5inBPMe5c2b4ssTy9LQeIxUW7q80?=
 =?us-ascii?Q?4FFU2Ec92pigQ0q3mKI9tophYjVXru8BXs2fjfMdFl/EZc3qlRbFk2RjJDHp?=
 =?us-ascii?Q?8ClBvtWH07nSMYf0CH6qXlzJs1FmUtFBnpmn+fT9G2mkpaCf79tzLh307jJb?=
 =?us-ascii?Q?aiBc4rxMWK2CQ2lp59RrW1snssQjyAw08vAACaAUNfKxft4HgbIwlV+pFXxQ?=
 =?us-ascii?Q?/yhfzw3FuwRxFCT1ML3LcTA+MRn/5LBtH9lhSnx4p2tA6HAE+mqWNzZRXDec?=
 =?us-ascii?Q?4DMyYC42j2NeqxZptskYEfBooPntrVdH7++HrVQPU9e64G8ZPx4X7sqwXNZZ?=
 =?us-ascii?Q?myUg9y2XlPyRetkOheoDoC1lEGLGkmtZUhkR6QECBAgY4Wrdvzu/PxTMebXc?=
 =?us-ascii?Q?z7eiS79ON88onVyfoWhKiEkCUKEjywVDNmkJA0p2lw/Y229YjqOKIkaGe0hO?=
 =?us-ascii?Q?DAHhiFxwF4JgLA/o51J0GQcxA02a06CB+b9DhNnKL+UCzjyeQV/KYx6J/p4K?=
 =?us-ascii?Q?6Tm2fyC9fX22LL50IMs5cQg85vAlB0dXE2YDmX5PMwP3Suef/7RJaIVahCKF?=
 =?us-ascii?Q?a6MXEcM0jgiAG51mAH9Ir4gftrKzYpDGyEANyALAx3afb+R4ckqgC6e8HMIm?=
 =?us-ascii?Q?c773WwZB9hYuk2Vx9auBAzeEDdWwHtrboWQQuNKlLaDJzYheG7saUV4oENEg?=
 =?us-ascii?Q?th5V5iNNiPv9ppGzAXtou8GzW2YunpcWA2JJPJgzs5TNl+2Rh5nY138IEfVU?=
 =?us-ascii?Q?ukYOVhYco3637QalFZy79jcT9xm3DUS6NekyQsoHR5TAeikiAzFJ4YHi5KTp?=
 =?us-ascii?Q?5VtR2dtTiUAGQvoK7lrBvih2vCIbsim+61jEG9RptiS84zlzvZOrHmFzMXyM?=
 =?us-ascii?Q?t9O5Aq3QpJGgohtAA80UjRd2tVKYFk540OFTO67ohVSSeWS+R5pkIn8OVhEm?=
 =?us-ascii?Q?ZsfpobuYYRh7L3uWAeZXiNN+4QV7vviz0bZckzVg0dOSlHVyN8JKeAR3Xud8?=
 =?us-ascii?Q?UmoDR2vfSV+GxOeebc3KjesYFMTCZovkq58xoz2jY4CGnfscrrkYVnEQIQDV?=
 =?us-ascii?Q?8lTW0vFMIcZ5mFmT1QHkDZzAHQ2NOluJhqs8NRcuHmi9Egot05SozsTgOZW0?=
 =?us-ascii?Q?8H1TFJR6JWh2fXKhOzA8PGShWtJFt9KKU/bD2qQvfVJdXN1plr+nHkPNCWhe?=
 =?us-ascii?Q?sjge2wLOIlRmmTFpumDHfkj2CWjxsOOon2iCgXZTP8ZLdc2aQ2lu6wHe8KmP?=
 =?us-ascii?Q?Djk04D7EMfSN2EbBFsJHcYsAKdJwz6sEQ4Dpu2P1c50JqARRTw7Q9YCt85Dp?=
 =?us-ascii?Q?MGW+rcTh9VDIpL00rj0Blhw6c+2OtC/RiE4ac5sEzxRJe9Nxj/jqamVGMqgT?=
 =?us-ascii?Q?E8WFRAu5y591Ni3mrtAvVzE6NP6MHcP17wYhl6GBZ69965IsMdyZLxOUjpK3?=
 =?us-ascii?Q?wHtNuZwltrSL+gUAz0WofZpvdWBtwBvT3XVC8OqCUDAR4MQqI99Hl0dPF/tK?=
 =?us-ascii?Q?L/YJf3iAgdvrd9gXZKncXswJ9hztzcFVyjeqlZdXsrY52pxY2XnEKNW/pVJ9?=
 =?us-ascii?Q?scWxv5ACXlI+5XVQhdSqX/o=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df0ecd65-c2f8-4777-50b2-08de2dab23f8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:50:20.2578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zxF7hnIau6xMwHd6jnolffF+9Rijrf5+KNuyi9GcokGAjtz+EnnTxZhy8dYgF0TLswuWy9/AtoSZLSmkr2SCALpNwd4UGQ5wFGN/cxotYJyA2n37EG3GG2BpIJwi8lq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9632

As per the RZ/V2H(P) HW manual, VBUSEN can be controlled by the VBUS_SEL
bit of the VBENCTL Control Register. This register is mapped in the
reset framework. The reset driver expose this register as mux-controller
and instantiates this driver. The consumer will use the mux API to
control the VBUS_SEL bit.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - Changed file name to rzv2h-usb-vbenctl.c and Fixed
   Makefile, Kconfig, function names accordingly.
 - Changed driver .name to "vbenctl" and fix auxiliary_device_id name.
 - Updated commit msg.

v3->v4:
 - Removed mux_chip->dev.of_node not needed.

v2->v3:
 - Added mux_chip->dev.of_node = dev->of_node->child as the mux-controller
   is an internal node.
 - Fixed auxiliary_device_id name.
 - Get rdev using from platform_data.
 - Drop struct auxiliary_device adev from reset_rzv2h_usb2phy_adev
   as it is needed.
 - Drop to_reset_rzv2h_usb2phy_adev() as it is not needed.

v1->v2:
 - New patch

 drivers/mux/Kconfig                       | 11 +++
 drivers/mux/Makefile                      |  2 +
 drivers/mux/rzv2h-usb-vbenctl.c           | 97 +++++++++++++++++++++++
 include/linux/reset/reset_rzv2h_usb2phy.h | 11 +++
 4 files changed, 121 insertions(+)
 create mode 100644 drivers/mux/rzv2h-usb-vbenctl.c
 create mode 100644 include/linux/reset/reset_rzv2h_usb2phy.h

diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
index c68132e38138..3692f3e466a9 100644
--- a/drivers/mux/Kconfig
+++ b/drivers/mux/Kconfig
@@ -59,4 +59,15 @@ config MUX_MMIO
 	  To compile the driver as a module, choose M here: the module will
 	  be called mux-mmio.
 
+config MUX_RZV2H_USB_VBENCTL
+	tristate "Renesas RZ/V2H USB VBENCTL VBUS_SEL mux driver"
+	depends on RESET_RZV2H_USB2PHY || COMPILE_TEST
+	depends on OF
+	select REGMAP_MMIO
+	select AUXILIARY_BUS
+	default RESET_RZV2H_USB2PHY
+	help
+	  Support for USB VBENCTL VBUS_SEL mux implemented on Renesas
+	  RZ/V2H SoCs.
+
 endmenu
diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
index 6e9fa47daf56..3bd9b3846835 100644
--- a/drivers/mux/Makefile
+++ b/drivers/mux/Makefile
@@ -8,9 +8,11 @@ mux-adg792a-objs		:= adg792a.o
 mux-adgs1408-objs		:= adgs1408.o
 mux-gpio-objs			:= gpio.o
 mux-mmio-objs			:= mmio.o
+mux-rzv2h-usb-vbenctl-objs	:= rzv2h-usb-vbenctl.o
 
 obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
 obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
 obj-$(CONFIG_MUX_ADGS1408)	+= mux-adgs1408.o
 obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
 obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
+obj-$(CONFIG_MUX_RZV2H_USB_VBENCTL)	+= mux-rzv2h-usb-vbenctl.o
diff --git a/drivers/mux/rzv2h-usb-vbenctl.c b/drivers/mux/rzv2h-usb-vbenctl.c
new file mode 100644
index 000000000000..f15d648bd4d6
--- /dev/null
+++ b/drivers/mux/rzv2h-usb-vbenctl.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/V2H(P) USB VBENCTL VBUS_SEL mux driver
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/mux/driver.h>
+#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/reset/reset_rzv2h_usb2phy.h>
+
+#define RZV2H_VBENCTL		0xf0c
+
+struct mux_rzv2h_usb_vbenctl_priv {
+	struct regmap_field *field;
+};
+
+static int mux_rzv2h_usb_vbenctl_set(struct mux_control *mux, int state)
+{
+	struct mux_rzv2h_usb_vbenctl_priv *priv = mux_chip_priv(mux->chip);
+
+	return regmap_field_write(priv->field, state);
+}
+
+static const struct mux_control_ops mux_rzv2h_usb_vbenctl_ops = {
+	.set = mux_rzv2h_usb_vbenctl_set,
+};
+
+static const struct regmap_config rzv2h_usb_vbenctl_regconf = {
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = RZV2H_VBENCTL,
+};
+
+static int mux_rzv2h_usb_vbenctl_probe(struct auxiliary_device *adev,
+				       const struct auxiliary_device_id *id)
+{
+	struct reset_rzv2h_usb2phy_adev *rdev = adev->dev.platform_data;
+	struct mux_rzv2h_usb_vbenctl_priv *priv;
+	struct device *dev = &adev->dev;
+	struct mux_chip *mux_chip;
+	struct regmap *regmap;
+	struct reg_field reg_field = {
+		.reg = RZV2H_VBENCTL,
+		.lsb = 0,
+		.msb = 0,
+	};
+	int ret;
+
+	regmap = devm_regmap_init_mmio(dev, rdev->base, &rzv2h_usb_vbenctl_regconf);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*priv));
+	if (IS_ERR(mux_chip))
+		return PTR_ERR(mux_chip);
+
+	priv = mux_chip_priv(mux_chip);
+
+	priv->field = devm_regmap_field_alloc(dev, regmap, reg_field);
+	if (IS_ERR(priv->field))
+		return PTR_ERR(priv->field);
+
+	mux_chip->ops = &mux_rzv2h_usb_vbenctl_ops;
+	mux_chip->mux[0].states = 2;
+	mux_chip->mux[0].idle_state = MUX_IDLE_AS_IS;
+
+	ret = devm_mux_chip_register(dev, mux_chip);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "Failed to register mux chip\n");
+
+	return 0;
+}
+
+static const struct auxiliary_device_id mux_rzv2h_usb_vbenctl_ids[] = {
+	{ .name = "rzv2h_usb2phy_reset.vbenctl" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, mux_rzv2h_usb_vbenctl_ids);
+
+static struct auxiliary_driver mux_rzv2h_usb_vbenctl_driver = {
+	.name		= "vbenctl",
+	.probe		= mux_rzv2h_usb_vbenctl_probe,
+	.id_table	= mux_rzv2h_usb_vbenctl_ids,
+};
+module_auxiliary_driver(mux_rzv2h_usb_vbenctl_driver);
+
+MODULE_DESCRIPTION("RZ/V2H USB VBENCTL VBUS_SEL mux driver");
+MODULE_AUTHOR("Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/reset/reset_rzv2h_usb2phy.h b/include/linux/reset/reset_rzv2h_usb2phy.h
new file mode 100644
index 000000000000..06247080a66c
--- /dev/null
+++ b/include/linux/reset/reset_rzv2h_usb2phy.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _RESET_RZV2H_USB2PHY_H
+#define _RESET_RZV2H_USB2PHY_H
+
+#include <linux/auxiliary_bus.h>
+
+struct reset_rzv2h_usb2phy_adev {
+	void __iomem *base;
+};
+
+#endif
-- 
2.43.0


