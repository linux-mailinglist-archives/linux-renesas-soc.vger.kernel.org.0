Return-Path: <linux-renesas-soc+bounces-14941-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62356A741B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 01:12:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 453891897778
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 00:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC41FE552;
	Fri, 28 Mar 2025 00:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mZLltgJB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011007.outbound.protection.outlook.com [40.107.74.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2A8B676;
	Fri, 28 Mar 2025 00:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743120673; cv=fail; b=T1pUuNqpNCVTaaOJIxcfmEx/Y5GftELcIrtf7A+p0JdECVqCeCNyPTEzlL7oCsLHBaMv8w3hdl2ZFMyViPpVoB0XNmRZ9EQbR0m24llbjmrEdN5vD2yEj4CyvRQJwaZcQVx7Aneo15FTJqLbqSzkX72bcOj8Votle/OC2RyjVto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743120673; c=relaxed/simple;
	bh=J47/J3yuJyL99frgNBnbMpg5ela9O0uLIdo6TkWdCF4=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=lB67ptMpSK8Phd4nnr31cCzEX979zYOQ1Envb8cYWFhFIJTAJmPGFrgfBxFqg9PhQ2J3oq51CQCBQ7w4tyiwjCchreTJc2Kq8yvmPiZtS27u7YZsFycdn0D1qUGPMy9zsu0IhRRs4kIlUDffT3ZMkespLZ1ByVd+6FQvLvrEwPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mZLltgJB; arc=fail smtp.client-ip=40.107.74.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJUnaeH6vEl9Ad7OxWZKtbFcKc/FU/DScI/KhMiNkgf3jMNtpVXrTNxNkuYDptFyNnUSOnKP1JpRk4ImaXKyTs02MuzaGeIDeqoreH1QYrvHpaLRMqp17iv20ONyrD7JvlFDC9LHF7j+F6Sptlejh7HMMHusoicUysKBcz9GOkM6Qct3PZedXx9lH+EcLWZtANARW03g+oIAnRfLWwwADwL1MD4Q4YtLIGFYDBcbAwOO3uRX2eqmXZeWpEAAuFiYmioQoaoIQIGcUXZykIwzWNjy2hQFBgau534a7WOXiIjb7sk4B+vcjoluBJqYs46/z2DkpUKS82pIae1WnrNt5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MilMolGqxGaOXlaiH8mwc6a9tS0zdPuMxJ1odwjj8lM=;
 b=VMyAP1waaY5O4bPpn1x0TejvC2vPKbMXp3UUmL47YFLPUi7WeuV5WujqKRp4lVsrA814+Rzj2nvOIJ6D0qBWQ9XJbnlmZg+lEiLpHm7BHQ0w43xKuVL9/+qpLemfshKVacfTUqJdFQGtqTZ30QBalvqNzBIkNNVO1IRrhcHZqH5P2pOtFvv8x5iKIB64mrENulzOJemFzPucpK1NOjQIHui2Hvyf/tm2byFCvjTIhORNcro6f709Rudg2OdXNInFKkgFh3a7ngU1yIrgM5raWQkfR1hWPXsmex8GA6zA6sdUsJv6pGpond7AhtV+bO3a0yTC5wKZ6FLTOAQ/FITbRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MilMolGqxGaOXlaiH8mwc6a9tS0zdPuMxJ1odwjj8lM=;
 b=mZLltgJByU78EuXPEEeez8QDqQNGGZCAHpkAtAAjyNLTrKq8ilw87jJmMcJJRX+1Pa35Uyt1cHFkp7cg4PiS84o5DERDGsPOL3EAxdsfV/T2r3ovOB/+zk9T1zgO1ydXQZq2dbrMnk8hIVwxI+PFqx99RZgWBLNOp4dMgzlOJ8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12789.jpnprd01.prod.outlook.com
 (2603:1096:405:1b8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 00:11:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 00:11:08 +0000
Message-ID: <871pui10bo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 2/3] usb: renesas_usbhs: Fix typo in comment
In-Reply-To: <20250327120737.230041-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
	<20250327120737.230041-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 28 Mar 2025 00:11:07 +0000
X-ClientProxiedBy: TYCPR01CA0199.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12789:EE_
X-MS-Office365-Filtering-Correlation-Id: f920fe1f-2509-4387-2589-08dd6d8d09e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AiegKGTLMJbA3avQT3LVQIzUG47wY4Vs4dvqwgMytkngSs/C/DFbc7LqdTsZ?=
 =?us-ascii?Q?jgRrhVCzDLas3cJDgzbe/JKMpR5zMprxz+FEjA9R0b6ntMYbel2ueYH2tRcv?=
 =?us-ascii?Q?TVpUFrp1fodZc0EhuaUp5e4kCvOXnN0ewHuVBlGQBSWJuv7fNvnDIioRo/QD?=
 =?us-ascii?Q?G/JDp5P9YIzwUuaRGuy0uZ94BmaJxIIDjZaPALypNgy4wrEZarC3b0TPLENT?=
 =?us-ascii?Q?cHo3zZFxTuNT+uzf9PS73PTZITSLQzbB0yvJ/yNlxre5smHM6WjJawc6ld9s?=
 =?us-ascii?Q?58iplaUJVrtu31EXtdpg9a2r6wtgs7D48/BUvZTAhCdfT6KMRILYsIf+W3vZ?=
 =?us-ascii?Q?c82XoYdT5WoVZLvCwNjpqjVW72jv77DbcTKJ3A5YjqkKctgqHsOh5xaVHdIK?=
 =?us-ascii?Q?TeLyUx+h3VDoXPfbDU3fpXgR8QKLDJTHkP8i5IQWii50sHykpku/+mtGWVcC?=
 =?us-ascii?Q?VyT04LgANR8zYkYol6TIJRpYKzFPxx/rTmbLWTjw1E0N9cxyFinvbBlxInIt?=
 =?us-ascii?Q?jf8lfzgw95J+ZhEcEl8Ay2BkBVSOo3i1QLqFpdaqbQ6ngm8e17/vxZDpJLYk?=
 =?us-ascii?Q?K6Od9ZnnLyiYP0j+87uhZho/SypG2UhJN/0dTK02N2j21rCc7hNkdQdlzKNe?=
 =?us-ascii?Q?LQOQGlunbVRONHANzsIxn2dsUNKwi4batYUs7MiFVDBETQSg6kXc/eLRD/Rb?=
 =?us-ascii?Q?ej/Zh7MJHUAyDM3PK+D86vmyna2c1Yv33ZspsPlBTbkCTC9U/iE9e/O9os7s?=
 =?us-ascii?Q?YbDIX2QfDLbim2ne/L5CB+Ph2pyelgJkxlbT1roEtDIbgCpd5Exam1m5N4k8?=
 =?us-ascii?Q?B95um2RcXg1gg2cjHfBBt81PCaU0rgENdxcqt918w2DAbdhqT3W/kooX63/O?=
 =?us-ascii?Q?Fk/Y4WgLJDIkdh4s+D+xqt8YUhiBrlLgMKqFWTw1bsR1OI3qwy7LzePS0gm9?=
 =?us-ascii?Q?nsICiWto7Otdd/aQJEFkVskr81FHLNjTP0/KFzmTSdpXQOLWd46GOWTGY1+z?=
 =?us-ascii?Q?jRb052ph5xPAsrfYisaf0Gp9f4Ruoi2iiTsV8DpjveXT7Syp1CIp16/4UzGt?=
 =?us-ascii?Q?Z6kzm+L+wMKW1LUAotspobSfQGtcpgoRuw3RJPMCOvrg/HI3ITJJjKw2YDIg?=
 =?us-ascii?Q?s9yBULZStBJhp9IY6VG00evTSp/oObOORdGRBxzQO2IjWR9FNzFJnNMOeJjN?=
 =?us-ascii?Q?Oitaei5oiJVMpElcCAXUJitx+iBq2HpHlKPz47xpLQj+oLtiL78JTp/9u5vo?=
 =?us-ascii?Q?DduWqqulhZshqALvzbnC4WueSDEbOSMRK9tyJml4OQdi9gv/4BQKHizFvgn+?=
 =?us-ascii?Q?tpW9U9vxvT+iF5vXZKyBCyIVs07GV0z5AqiQ1tGEiRgDW7LRk1IHhQMuuCFC?=
 =?us-ascii?Q?nUOG2XkP8rH3CIl+AP6XzwVX0NqHKyawKNYWDz/W0nT7J8sbNS+1L88tXG09?=
 =?us-ascii?Q?dOwueGspxm0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iPMmjsrIAO6s+Pt/u3b4XbSEm+4ZJfKiBUdFPW/ReaDsDEQW3zN54P5568ls?=
 =?us-ascii?Q?iMDuhBqRdlGZOXZbIWjsO2Y+dtiZM4EPqN2nBrYqbKL+PdusR2m9FAJidVVh?=
 =?us-ascii?Q?CJzZbVo+sAV/PeZcOmZzDtMaMh/+ldol+AOvQG31EEV7JhNlpU/BEq+SDURa?=
 =?us-ascii?Q?Lk1Jq0JeW4XehU0lwCRsNtA/t6I1qOXJ8BR0NWSQxL80PvjfQMplDMwEay5M?=
 =?us-ascii?Q?RNZyn/+BH4CepPWuKxHVQ1pKXS6xMLbllPET7S3iVVkBCha8FJh7BR7yiCUO?=
 =?us-ascii?Q?heCZDEvGp0SeOEfoTUduX6hIsdxsmiqBKKfJ8kKM1RI01IrgJ535gnjE8PWh?=
 =?us-ascii?Q?h8CbECTrU4r5d8UdqV6P5ODeUFnqQ3z4FARW/PUIAAefKVXsJHDUTvQ3j3JG?=
 =?us-ascii?Q?u6JxxXG3veVTY0nwRDw4NNmSEklr0GFKDP9yR7rIU2LyWVivkH/FIzzRAYNX?=
 =?us-ascii?Q?Ft2gfppcQmci10io2lY9rGBs1zYG0a+Gsh0sbDIZtli6TTmHaRZvjR+t6da9?=
 =?us-ascii?Q?0TpRO1H3lqhMYvo6hsdzYNERTBl4J60pc1mhLQLyyPSVTzl9QWc4c5ls41aE?=
 =?us-ascii?Q?Z0vISrgquwESc8XT+PPKjsJBmq9Nr0datw45yzrUOrmpuXqfZKbQ7pqEBdUO?=
 =?us-ascii?Q?XwjLsVe07OmtRXnQt4E2BzHZXr3By1EyimSfsrn0ycphFhgba0jatu+XCS41?=
 =?us-ascii?Q?HqTenLHHqAAgnZ5rPJRx+i6cIZZXfSpeNjN/x1BztL+ClVt1Xf2dvvUrRkjF?=
 =?us-ascii?Q?SxVrAqt2W2vn3Vlu3jNDiKtzttN2h7Yt+qFWPJ3ReJBQCMB1VE7SpPZeVDCI?=
 =?us-ascii?Q?kLYnCQRiW2cuHpUnt9eicLzI3yKXjHPqkLfWAIVrQpkLsV7sI3N/FC4TiJF/?=
 =?us-ascii?Q?AwUtN3XQkZYEZ3ekxMfu3v/cpZS7rL/mTbPBsUo1Bo+c8U9oheV9p7mr+2dQ?=
 =?us-ascii?Q?F/R30z0RwbR+aAfS5MxT08hIN61wYt/eySjp+kQ5+hDnW7wAExI3nBChPDh+?=
 =?us-ascii?Q?+RkZNxzjNAc2TMk/2QFZLBFX5uD1PO6sxoIP7vRd4Bq1pFk4ztUQllpQy4Ae?=
 =?us-ascii?Q?eMWw16BXEu92knevppUNNh+hmRTfXLbOZ5PtEJTmV++hddGyBOMzc45tDejn?=
 =?us-ascii?Q?asr7DZDHDAO51j3LfIKNo0E0Ax/jngaKhl3kOSrn7i4ptlSmNxOBV1Ssledr?=
 =?us-ascii?Q?fy16cdh/dRmoLnGsejUbVL1iEDVpguJ+TO6Gjvm5x0dSLxA065hbq9pPyqfb?=
 =?us-ascii?Q?hubjiFAHOhx7bMENNEXQ3T/L7ZTITRFLX9suBBd0SHm+kmfUsX3SiOxzGLUa?=
 =?us-ascii?Q?qF1T99muB1/IIUOV1812VJdF7pO97N4G6Tc4PS2Ay7+0pJ9Tm1jL8H0cTnRC?=
 =?us-ascii?Q?7/XfcnnyDPY92L+1Nf7mWBsdIyxY0eAaeHCZylIUKR9YHWg7wIPd1avnXWOG?=
 =?us-ascii?Q?GGozGPYWXRhseb6hkv/HScnoOppa730JX7Iq/hVNE4RcyQSIwIprHibJGtYk?=
 =?us-ascii?Q?qWIoOtoSM2MKQ+zXe4bkW79Q8kQ0A7D/SkhO6cfHTmJDZR6MqzhHP+N6vbqZ?=
 =?us-ascii?Q?aWfxkhtbmnl0DIsf+ykY/DOZlCoH9nAi7sqNDhvESKPBb3pHflLrBpqZSA7H?=
 =?us-ascii?Q?hFM3hujFXNjh4d5RoPoqFb0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f920fe1f-2509-4387-2589-08dd6d8d09e1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 00:11:08.1306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQQOcLyQveS/kKkXCqkshLx5Reg69rvZADcL79B0E4K75N7ongFUv+60jpArZz9wJZefjP4/LaCX2mR6YS79Co9GRKw4IVqYTt18n9SxpEQobosx0IA1722KYeCOgNLA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12789


Hi Prabhakar

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Fix a typo in the comment by correcting "deviece" to "device"
> for clarity and readability.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto

