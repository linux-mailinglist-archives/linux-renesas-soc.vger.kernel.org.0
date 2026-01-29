Return-Path: <linux-renesas-soc+bounces-27620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULooBAeRe2nOGAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27620-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:55:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4CFB280F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 17:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87C5F303DACF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 16:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365CA345CA2;
	Thu, 29 Jan 2026 16:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="j2tD0Z/j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91FE23D7FB;
	Thu, 29 Jan 2026 16:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769705614; cv=fail; b=OxVQrRP4pYhBnF+sLGlXPtP9aG33fH1ZZZJaqVpfog410vYsZ4Qq/BKBY6Zc9gevMRKZozurNleFjTfJnar8NOZOEcAlDA9jKqC3smsPY5myKjVnx3Fj/MAyN4HV+hsOeKLzX8Yur9MNeWY6rfK/Zw0aHL5GYM7FWcGkzKqne8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769705614; c=relaxed/simple;
	bh=FOlJVc1HuPGcC7CpP66kTlTQ/rSuzXOc8lIFNrbXIdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gEoVUuXeMSMQjFNKtKLAbQlPKiOMnhvZeSJumI/+Ic21PUOmLQYrIj+lJhPfR/kg5Uqa2DhBsNbR2nkJ59ezrOwVdoLxErXBt8oxSdr7PGzzbBGqTdqoku4305PxWBB7cqpX5pczq/DJOHeMtP4UR5aDwjn9FdnfRtbztsj4zFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=j2tD0Z/j; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0BdlrjfHWyoJjVAx7PjhXAhWeHk+Hg72v3FCtG8BifYUXsiHYSpJO82koRLhJppe4UBp43xIRE7c+9HFro23brIWBgqHrCJjahxbv3qPDx1UYEAlicPwUA5QnjRKVtGKVeK6nlp9UdLoxHQcs8R1PEvAwfJyc2sa3CWMO9ly8px/Y8aHDVkTFqtnEjKNPZSaJW/jdRLiTpfj1NwsU7+wmqfcEE5THdjs+nZI22WlKM3ZicEe6a4GHNp0k68F/k+Sq2l64zjcFkQYRHLWieub9eX8eSc6D4Aj8dbSfX3qj2S3xnEqUkm9X2iTEEuLZY0dgiX9XWsRdJ+H83kNis/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnyICdugJe0Ra/Hl+K0Foc7khQCZbWinyePKAcSzwB8=;
 b=OTfn1n0eSgGHfZlTkcB92ZghEejM80sI3++0KK0LJm1Odldu7hkyrSy8YwE9ABd4gqgwZ09yke3UP6Ogjp8YkBcgT7vRXQcCfJywGuiQtbjyYzcTvJaRJRurxsfiZzDiZXB4RrJem8o+RDkyOKB0YqGxJ2Er83mPntkEHLYs7YZIwc90boWSBkwuAwP1jAHhlRxPGrM/jbk+m6cT+es6rfoZ/ASSyOX25xh6wLeqrJAiaU2fQaQS9Fgwy6Fu4O2fO6TeGTQBzO9Z+FCo6ddUjgzsUuLzIBT9Lg87Ilo2lB9mgwQGyZpWIaxrntFQcHc93s3JGR76FSSAaOdXRGi+BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnyICdugJe0Ra/Hl+K0Foc7khQCZbWinyePKAcSzwB8=;
 b=j2tD0Z/j3AQda3mqCTHNUK1/Y0Ivn2qwJeDutcDpCBurYyxWGPtxkeKfT1AKvH8lRs31iL9BvxwwX4DH6v04V5V4mLC5+nmI2srk0tMwmmg/nqV3NFfnZZHBzVjLAki2kUAHdx7KNl4XIxozlpvRzjXURURiprp7DVEIvlSGrc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB13517.jpnprd01.prod.outlook.com (2603:1096:604:332::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 16:53:30 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 16:53:30 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/4] dt-bindings: reset: renesas,rzv2h-usb2phy: Add '#mux-state-cells' property
Date: Thu, 29 Jan 2026 17:52:55 +0100
Message-ID: <af75145b08e24034dcf367932002079363e5dd81.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769704000.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB13517:EE_
X-MS-Office365-Filtering-Correlation-Id: 69103777-c7c3-4c5d-ee14-08de5f56ee39
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LqLYU+DyJWkua9HXSzim4PTj2OtPkafB1ZotALGLwiB2fPaDgQjWrIKfnjbH?=
 =?us-ascii?Q?Vt9ydgvmeoydcPiRmxEpjiUS0o7miBW6HcVdcoYzZHOZSH7L/6aiv5lEq/5/?=
 =?us-ascii?Q?DWVoAdHV4Q2E6tXblrhMoA7DI5zRhWkBVODygQ4psbJ/3VMgYCF23PM4RRHS?=
 =?us-ascii?Q?2UBoXWauQzJRLERqogM4L8LFEzzlWhGF1oXEhf/QerSSbmijRekhEb9xswT7?=
 =?us-ascii?Q?M+OoUnj9eKMxuM1QfeYlMXbK2+GZCCXw+M7SuQ9Ssbc3GbcuvmCCtu9Sf/ad?=
 =?us-ascii?Q?a5+YV65otcwh0DBSsL7+pYwu03/qepoOd+7zu6eCA987Mxp0xdci796IqkTH?=
 =?us-ascii?Q?+sdB7B65b9U13TOpiop2xCOdn1q41Ny0LAu7nKWA3Fdd1n6nypDMKveI89Ug?=
 =?us-ascii?Q?dbYx57iTIV1kzaqcmMpUEX/q32eKT/B3yl+GHOcO99NZ2rc3UoG/sQkDvW0B?=
 =?us-ascii?Q?gxkJ6SY4f1XdOHWpsyJowbEcA9S9aLAzlXAP3MW1mpIR0D2gvcLQIiGl2QBd?=
 =?us-ascii?Q?SNQkX6xl/k8IM7/6h9BwTfacnHKq0EnYr5oODCmG8yrN+1VYZCuvue2QULWI?=
 =?us-ascii?Q?dOO1mXpOtUWNrjCb8VnETdCNeI0ZsuxCPjgySygifdKYTkjixCw7qgjn52rb?=
 =?us-ascii?Q?9gp6NrPa2uxpRJQXXniJGdcMOsdFu7jjJN8DVj8brrs8LFgL3hAMNMIfqY4S?=
 =?us-ascii?Q?WZfnPyMzl8+rgW1RDbCGOC9EcsL+uYDAaJ+OdORM92TkAR2SHVVmjXvTGfyu?=
 =?us-ascii?Q?ulvpsuF+UULhvX/YadPE0AyYaroPGd7n6XRyzu0K/FLSr8EwwSKlyU8tuuCj?=
 =?us-ascii?Q?lqQq63u9dTvpq1yNLGHJYfBfYXuOLfjKGMv90/UpG7KoMa+5Pf0VNvgWuTxc?=
 =?us-ascii?Q?ESKB0gRFNq9eWmsPIdR3IsxQh8uWHsc8gMjH0Z+NbJ4pz5AKk7f26kR1DsSW?=
 =?us-ascii?Q?5bbYNjQJwFlpfGjLluYYlz8VipIXT5tvkWslqJe05zWG+e/va9Hav5g5wQZB?=
 =?us-ascii?Q?QM6O1tyz1QuALBxC8DWelBDgYxfcL0pXC4MsYxU2jjGCQTa5eUSE9onGZEAc?=
 =?us-ascii?Q?/MDkgi3XoZSSnWBIeX04S4LEooQDK0WTNNc6gYYChTXu5ddYu6/YQtyhvxHi?=
 =?us-ascii?Q?PKe/JuKIlzxRs8lJGBtU1bVuYQZuDcGoi83av0XTXRO4THbu/Py2Y2po9vpO?=
 =?us-ascii?Q?WA0DIkjXXomLTBB3Q0hJsa4s0YUimyRbfHSibitLW6QUWmC2jgl1ndoERhfo?=
 =?us-ascii?Q?u/q6yCRtYMDP1ssajKY0hIvL3Wp50MAxfWzStGV+W1m8mhinnNb+mKSxQHj7?=
 =?us-ascii?Q?bYMIuibI01fTDT458WMfHZVGlIaW/Be0XiILiV0s0u+yJdwqbidCB9H0rXP7?=
 =?us-ascii?Q?Dovu24W2NXHI82mIOTNlDgl3IcSaaQa6rAwI0bc9ygF994dRkLASZ/rXoiyo?=
 =?us-ascii?Q?PONT3pLnlrCve2doXXu7M3JbzRtAybpBOemSJcglKpKaFensGSfA3hZvxDtQ?=
 =?us-ascii?Q?jfcucH5D5CY8wXrqBH2WWsyPWEER+NP81rvUPBVh5dsCsKruPCd4PFKP7uad?=
 =?us-ascii?Q?f5GjU6bILNyWnevcrVRoqS7lKo2hACZfGk5HTZH00kjgFXqQUtsOOJA+qbO3?=
 =?us-ascii?Q?71eMGwzXt5jYfy0PRhgi5pY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/6Z1E4OMgQTiushP7zuIegdKto+gyBaTXKPV/vfffuA5f+GtRkayzK//M1mS?=
 =?us-ascii?Q?ZfeHF9y1mpHVcT0oV9+Kr6IxLHpTJvLDk4mac31EJ11jY5lyl5kzyDb3QUYd?=
 =?us-ascii?Q?uu+pq6NCheeydICdGs3aTQRWMgUQYz1aGd/7oi8ygZdZOT/deV7a09O2g8Y2?=
 =?us-ascii?Q?kCUDXL8z51SM61hM2xx8GlVjXdWbhSRn88LcuXHpn4Kq3aGpODo5QJj4z+lB?=
 =?us-ascii?Q?KotZlogmOu33Gww36xOdoA7gUFUNmM0qK4+GwpGgKNmU79cvxqK4XTJlH4RH?=
 =?us-ascii?Q?wcTjAmrNhZrYdtJq02d/xRQ356NvXi7eRdalSdZrtKtr28dNBrohZ75MkT5N?=
 =?us-ascii?Q?TPHJAXetjsJLkQLdiQ7dfSJ+Aoa/8E4V1metrccGgLQW/Tab0xmbAH1ebgD3?=
 =?us-ascii?Q?FgpZzzgoQxQHxhKZsoN2lCggHlAE76ROAkN+9tJx2+cTToL9clIgdHshdQbX?=
 =?us-ascii?Q?/AGlO7vxYkOQE0f0iKIi0XidSk8u0DQK6IuSlwcLuH9jE3RW8+njfjxjPr1M?=
 =?us-ascii?Q?mRN7N21QK5znjAbtlytMFNnYcrU/XrTbRYyH7VvyJMoe4s7vZdoJiM5L59io?=
 =?us-ascii?Q?BwNWFl2nNlBk5HxErGBhUA4Fm7TfAPvhxcT9mdTrrKv0/u5a6rAk5iNGZo3j?=
 =?us-ascii?Q?EXAx7l6t5mzVmipb6ur1A87C1W9yuVs/3y17fLqmnttPL5719sRwSRQH7VJK?=
 =?us-ascii?Q?wOwSK2gJSa0RvqWE0zHJDx6zLnksXTl0kg229TrFqPzKijbcvT7gxyGJkT6O?=
 =?us-ascii?Q?CMbuiUvva1N7gYhXAjTaR6tKK6PGZmF4n6PxH5FzyHLe+u4yZgDqKJ0nctN2?=
 =?us-ascii?Q?YFP12S32wdSBkLWA6ko7b9vXl7DyUpl/1lsXtBefsCDGvvOn2nBFcAJhiG5e?=
 =?us-ascii?Q?2xgQIRGhrm8B1JmBIuhKV2TKALqk2zUDBXoXfEijTFQ6Ps4c8NW8Ui4NmVRP?=
 =?us-ascii?Q?LePF7fVU2dtiroAyZTN11kr8z73KWR9o1MpwJVNLflyFJrs1x2aylHf/8NME?=
 =?us-ascii?Q?ySiY8I6ztV8RC+SE7rGsc+36BnfiKxxGOfEdZpnREqyYcNzOlHNsmxBQFrxW?=
 =?us-ascii?Q?shREtNMbZhknY4KLFUxrk3GBtz3Osj9uDxiYjpprHddHm26sEcYpF0SHgsws?=
 =?us-ascii?Q?mlrgZnkxbK0GMsj581kELR8kF3cRqQS/sNIU4HiSzGPb964IH2RSDTj1GJpx?=
 =?us-ascii?Q?s5H8MLwWnMBKNnE/7rEnTO2A3Vcu10h2kaOeF2+whEr6F1QFtfFjwEuW8td7?=
 =?us-ascii?Q?cxsVLoKKTqjtQi6gcVryCz1TkQII5RWFQR8xdmfuIqXnn4bS38jUAvfPfN2g?=
 =?us-ascii?Q?vxoWCJCDQnD3luwjWJK8OtjU0HBOwalulxBOJOhF7+uNcwrNhddJkw+IYqQZ?=
 =?us-ascii?Q?ldOwpStsB3vgZnZ2jpQpfmOL7YdHjinKWILSH6KBgr/BdIAxh6+vC0M9eyh3?=
 =?us-ascii?Q?CJDf3+X/ryKVnOrbzzBAifbOo5mcsY7GkXH2LQe5aG8GxyhvF7pMb3kL3+Xj?=
 =?us-ascii?Q?1rB6jBE711jS8RHVoI+DMGjE/a/6VNP09oK/PN55KHYu8RiH6IQUCiR5uUOP?=
 =?us-ascii?Q?R0leeKQdynCu8E/X4n4CWG2RVL3rRYMiALPXIsBRFjeZPDw2C3RAi+fvBVze?=
 =?us-ascii?Q?5MEUkibiWecLLByDWbcoFhzwyRnl6OgRNdB62oIKSyAn1Do/yizUTubNFsVT?=
 =?us-ascii?Q?bO61ZMLFXeTkMfprFgrRPkXUxg82iodpyuWeVCv6Hhs8FmDO80mVnFu6wM7A?=
 =?us-ascii?Q?VLFTPa94w0gOT5dbQ6k18FDkASpk7xZCTdAyagN1kJMfCKKmErAb?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69103777-c7c3-4c5d-ee14-08de5f56ee39
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 16:53:30.4728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3bRtlXHC6mqLEACE7vsPL6JegW6GBb/zfpgTgZQ1XefKNt4qBHtwKpLlaQMXjGjVVJ2bSjXG6EarTRB/uC/6Ag0PE3LQ862Q8DzJe/z8fpV9P8+kgSuWtqiKRWD7PC/T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13517
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27620-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,renesas.com,pengutronix.de,kernel.org,glider.be,gmail.com,oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7F4CFB280F
X-Rspamd-Action: no action

Add the '#mux-state-cells' property to support describing the USB VBUS_SEL
multiplexer as a mux-controller in the Renesas RZ/V2H(P) USB2PHY binding.

The mux-controller cannot be integrated into the parent USB2PHY node
because the VBUS source selector is part of a separate hardware block,
not the USB2PHY block itself.

This is required to properly configure USB PHY power selection on
RZ/V2H(P) and RZ/G3E SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - No changes

v5->v6:
 - Collected KKrzysztof tag

v4->v5:
 - No changes

v3->v4:
 - Switch back to v2 implementation.
 - Improve commit body.

v2->v3:
 - Manipulate mux-controller as an internal node.
 - Improved commit body.

v1->v2:
 - New patch

 .../bindings/reset/renesas,rzv2h-usb2phy-reset.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
index c1b800a10b53..7ed0980b9ee1 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzv2h-usb2phy-reset.yaml
@@ -37,6 +37,9 @@ properties:
   '#reset-cells':
     const: 0
 
+  '#mux-state-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -44,6 +47,7 @@ required:
   - resets
   - power-domains
   - '#reset-cells'
+  - '#mux-state-cells'
 
 additionalProperties: false
 
@@ -58,4 +62,5 @@ examples:
         resets = <&cpg 0xaf>;
         power-domains = <&cpg>;
         #reset-cells = <0>;
+        #mux-state-cells = <1>;
     };
-- 
2.43.0


