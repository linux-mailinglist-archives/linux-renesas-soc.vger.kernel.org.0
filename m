Return-Path: <linux-renesas-soc+bounces-13657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4F1A43DB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 12:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21A69189AFC2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Feb 2025 11:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBBF267734;
	Tue, 25 Feb 2025 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gSkFXMIA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8241991BB;
	Tue, 25 Feb 2025 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740483070; cv=fail; b=o5OeLHY+iGl9yloxbUofy9qwepxi01PxnM3E9IiwIwftdc93viyMsDrz6BMZZmcHv+kdrczFufKav110Zsu5dOrZFfrnfRmopEDVrEoiJzS7NQKx5U1tVDmWSdgtT8OMKO0CaUbaG725hei/btXMt+qIIeMcGuEYWstTfDcoXnw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740483070; c=relaxed/simple;
	bh=tX8yMZxLBnIeKciKvgrEXOuNaNgjH7szKmEru3quPuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jLe9XbmWi1eAXR3kuLnfVpIwo0Mw83Jnw95zORgBTZTnVMxCiaCV/SDhNuiwe1Fhp6816q1cRCeakKJALU2CG1vB7MLEGVwqRcAry7ty3BfKSmqJWjE5N0LCZvxZXcM1W9KMZopa45fQpXWY4Zlmt5m8Hm2NXegrfYCX3CJIOmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gSkFXMIA; arc=fail smtp.client-ip=52.101.229.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jHsoNCLb1LLLkJ+M1htwJETu3ywXRGiV6qYXY6XrxKQcK11W5quH7sp9vJUJEugQTVkQXggMx4YY+haCmc1rWkm4ehQz5N/sGuTOS9mpbEy+DKWDx3S0M2FVWlmXER2UtsKwaPCWzgct83tDwiRJ9x2G3YA34Aqn7MYHhS17X5/qve+Xpq10Ab+jGJFXLHyxfF3/gTo8ayftLdlsqRPMK/YRoYvwGt47rgSSxTn9hRsdJtgA/tY0xM4duQPmDQUEZuogLthbGWsR1hu16MB0KTWHxBYQsVdxzJSOEgd2C6eyjr4ERQISzPvz/Bjp/nVLULPrXNtJEWNT1YXz4YhJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3S9srsUhLtR3DvC9gl+KpCK2OaYdvKyOWkXsjUaRZ0Y=;
 b=S6Na7xMHpV6b5gItoku/FfZbp8FYLHjR0xhqgzMPgETY2PXJOvPkCVoaxyxtizl94e3erhQ3/r9rmuHSIgPbiYQkLzvNhSSvgnJS97FnnznkfqW2qYre/l/Z23Y5L0WqYYyTG2lwzJFuvLTZNT0+9BpdOT11G6X7T9otFWvBiR/deP4tEhdoLx6cYuHjTtGQRz7vjvjKj/gYbgwOPc8Bp99PqZntcmlybjvEYNipevsBvjcDOS62dHcqqzkwSrSkiTZ2y7Krkj2jOOsUx74LrC7Cm6hWzWRwox/6D3lCf4YUIvtaQCYqkputQedAcy1V3KcFah8Pmx9jSXC5XkVlwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3S9srsUhLtR3DvC9gl+KpCK2OaYdvKyOWkXsjUaRZ0Y=;
 b=gSkFXMIA2u/2N/xjc8E3d79R6BS3jbMurUm2uWIerYbzXQploiUtKL0M3kTsWHuqWHoBhRuIkRNfyO/ln2Q1fWwBZCGABrx//4HqR/kVFnw170cWIrKBDsVvi4HzYPZDIoKJpo6SatIjQjxKwgDZc+5EtxPySzIjQGvIQkuHXzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS7PR01MB13813.jpnprd01.prod.outlook.com (2603:1096:604:36a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 11:31:04 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.020; Tue, 25 Feb 2025
 11:31:04 +0000
Date: Tue, 25 Feb 2025 12:30:46 +0100
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 18/18] media: rzg2l-cru: Add support for RZ/G3E SoC
Message-ID: <Z72pzFvAwgSG2tl3@tom-desktop>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-19-tommaso.merciai.xr@bp.renesas.com>
 <20250223203230.GE15344@pendragon.ideasonboard.com>
 <Z72hBohGQaLGwt5P@tom-desktop>
 <20250225112335.GD7352@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225112335.GD7352@pendragon.ideasonboard.com>
X-ClientProxiedBy: FR0P281CA0199.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::7) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS7PR01MB13813:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b33ff03-474e-47a6-9102-08dd558fe349
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?b9Zrp4mPHwrVl0Wut+U3vAHEd4xOahB1nYATHrtCoCWZQT68WXh2gMyLHlYU?=
 =?us-ascii?Q?tATzkHnyUpT2qYMPVB2ht8aKCiQrATrur+D5mOc2Weduk/Af12+6ai0VaKJX?=
 =?us-ascii?Q?88tl+IEb9/7lQF7pTK79mVwFE5xLbUsO1+5pdhhGwwe2qam35nxkdFFURpvr?=
 =?us-ascii?Q?K0QYvdYta5tae4E89s29121Q1HtXF6+I9FxODQVPAqV6Xi54M4fyYK4gA6tN?=
 =?us-ascii?Q?o33RhAyppX6WVWXKKCHUX8cBKJFmmUpa8aqQ3Xe4AGVwrntEX4l1EkhOVoRO?=
 =?us-ascii?Q?6t8/afA6VYXL1VTt/GINjhz+6vIg7FasNvcNQf73p5mrZ1/F6D2bImM0Tbac?=
 =?us-ascii?Q?qJmDZTdu/PKC5kMsfRis8C8IC2Scefm+RTphURyCMGxl2KoFs9agBbwfg+BR?=
 =?us-ascii?Q?LNXBuXv/fvAtxXTSwq2XuvHCHzPhp13U5pWiDY+mVriV7Gqk9DK1vPHiLP3y?=
 =?us-ascii?Q?1z6IxSK/8NnCKZ2nvC/NpFck9xLXnZALVDCrwfFGlioiKxuiUxwz/8z2N5G8?=
 =?us-ascii?Q?HrNPFuTy8/9ZfIH61LLXg4zjEGMtgc67wQUbdZLKq94DdeHRBwr6J4RwoEfY?=
 =?us-ascii?Q?R8FCLYNV6cwIKFvk/Dgh88uqc5siUsJd7pcLhoF8GfRHAVtVMes0VGulaX8E?=
 =?us-ascii?Q?LbtDZ0yfSMzEfSUnXnIRQSrxIzb4zqmd/VXiTkj41YTTmCpvKNARKAVlRf2c?=
 =?us-ascii?Q?hBCssCLO8SNl6vQ24mFMSQQNIHc9breGIOi8nY6JUKuQwVCDB4D4d3xXFLgg?=
 =?us-ascii?Q?bf+WDxFb/wi9qhYxNPVsoNLtnZbAbvONx+OlLH+sI29rMJGS3P0rspqohm+j?=
 =?us-ascii?Q?YC5/Ky4yVujBqYuGQJGtTfaqICb5thJQykuzR65xKv8SBS5kgcx+lK9hx4nu?=
 =?us-ascii?Q?+zRmqs3SoEuyU9v1q6qLo69QB1bYiTr+zb8bptdVYDZ537XY/Kf34tULPiGs?=
 =?us-ascii?Q?r1Ml7b3NURHp1wcGYhhraz4/T5Wem/UBjCkWBB2BlPdWFxLYkGAizXn71ScY?=
 =?us-ascii?Q?qVe7D2kGAc0acwxGjVgLR8fEIhWF4uN6sD+PTS5mA2VA11Xd+1uAQQZhh4Hh?=
 =?us-ascii?Q?dbaECgIiYibwIRBTo2ljpael4IW2HMtLYP9n/yfDVFjGGmvJocnO98I7w/yL?=
 =?us-ascii?Q?qYWeFBCswYub71EvpGiX/z4hYuTyGPU2lWLkMEU1XgYkgw2jVDot8247sna8?=
 =?us-ascii?Q?sFyDDrodNqoxsYJAin6PvgXyHDQ/qrXTLsvPX1rmzkdzzYuxD2ppeVr5LYdZ?=
 =?us-ascii?Q?aJa9sfCcurjZes4Gm0QxB4u6tvX/yfgQDUIZs13HI+6P10NCeuRHPYxSVmGZ?=
 =?us-ascii?Q?OtC9dtvPjgfClZai5U/LYOXFHRJRWc5rL17cpIQjebkM+v5KhHFuYO1enXhJ?=
 =?us-ascii?Q?2GxkF5kPlKzKvkXgjRamjA1XnyTf9l0/dRbfm/ibFHuetuFEjjGEQWh3xZwA?=
 =?us-ascii?Q?VJtgdTf7OfA98i+7PYDIBEGbgm3TbSHk?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?KCXyHtSwEdB8T0EDdsn0OS8Wl9T0XctdaHhcso1w5EBJ1l4bCBIf6yA7lVlu?=
 =?us-ascii?Q?IHDdTeP+5ouCxhZQVunTeWVEiUA6Ol4NV9ZWJxMThMJb2Bg8N5e29fGER5l3?=
 =?us-ascii?Q?64e/jOdNxLlYkrxFCWOrACF9EK7FQc3Z6xeLglCwRSMUY8V0EBEUrfS/H2ud?=
 =?us-ascii?Q?BrTbYLosBZ7XU2jN86iBPApBQ+Ob9olBU2/PUi5zK+MI9KS6RFQ4Iiu92CzQ?=
 =?us-ascii?Q?xJZLnzeumbTj2nth8OgoOq4PcAKwXVev6V2OsTFXXZVY38ie2ud3QnhpmKmT?=
 =?us-ascii?Q?2M46GktpSYgGApSSQgrxPUxFTpJGl2sX0O1GQsHH+3vRcl7mPflvR4kaG8eh?=
 =?us-ascii?Q?1ubGZbBxvbUz3VtJVHUZC8suAs0E9SZeIUWUowGi74WJb9Y4hDhVjz3QPh53?=
 =?us-ascii?Q?cj4Ky9NdvQEO0ew+2z7gItpBDi+WLFFBxDkLZTaAtyxh4PGf59BMLvf0OI/H?=
 =?us-ascii?Q?JNFZqru7vbKcnsq/GvPK/Ip+52ggLnCOrj7zXOMgWYZtnJmlTpW8ygvNmjNh?=
 =?us-ascii?Q?aQ+umpaD2E+Xv8ITgmTlgNYNESqXwNtBYoQgHVpEMiPX41gbi9gSSGM1bTDe?=
 =?us-ascii?Q?J6EpNhdsYxqEDfSpeobzECMcwYijLg73VMypLHRNtLgQZsoeWqZEAMfe7asN?=
 =?us-ascii?Q?v7kPciExNQKj2M4V79Teughxg9pg+1BCnohjsgg97NTHtB+wpxzSw12l1cY2?=
 =?us-ascii?Q?nwWOFPYIvSGvI13MDIkRW89erjPhs5+LnnjBLUJnUGCQOq/nyS6tTENjxmxi?=
 =?us-ascii?Q?hZ/32uGhML+fra6uBAwnB0XiGVPAtmt9Bqg5zGT2dlpmVJzwPrKF6L8Uh10V?=
 =?us-ascii?Q?u7ZCQhRzi4TOC4EYPWOjrqLQsIhrPl94xejB50zEnvmg0noJ1ayk9eUqe0ll?=
 =?us-ascii?Q?sJl/CdWIXOJ9HKptHPIbdkM5YD4RM3HT9FWXzo0Dh22ZB8xBVJj+PWg/kzw4?=
 =?us-ascii?Q?SrpRCf3xV5n/UfDe7khCszvzhjbL4xat1jfhuf3h6XasRF+cI574vJ5FPVei?=
 =?us-ascii?Q?98fyoZaM5YKpjlXLsNDuj1OgwxVI3vumjUmO8bqe8EVgg/R069PYiOda1yVX?=
 =?us-ascii?Q?oZTFDwsI9H0VgNjih4qDuGZqxYdch/dpWLQczQruwQ7b5fQ1QwNRWEN2wsj7?=
 =?us-ascii?Q?LfkCZZCiqxC2Z7Gbn5YcIIS79861KUgXMGLjBLR06LwRMB1icKC4hdLneLyp?=
 =?us-ascii?Q?XgNGnjtFJ2s3MABNDsxGgTLEKXboUxI8l7OVKtU13GXf4FVexVtRchv9COcu?=
 =?us-ascii?Q?WNJXYT9yUZ7v806jyUdSyrAUEHGBrrpVjQ8wtxbwq/M555THwfPjO2PilDBG?=
 =?us-ascii?Q?wcfNg4sMfY2WBTgK+C/hDZQtgzeIFqzZJR2d3DOgtzrxTr01HsAnLaZBixlT?=
 =?us-ascii?Q?FNiBIW9g2/gubT3vJh3l7L+5PE2NJFFAbvictPy/Gu2ywFNk4mod98wtnGUu?=
 =?us-ascii?Q?GAuSarM6NzwyInjFvWKj5TqBgI2YT8XrCa6XGOIlgJ8MmneAAPZBXau450Iw?=
 =?us-ascii?Q?PNkSWqDuRH9/wdgyWqhWFofgq/efsAUuqGHmrr5jjW6NBmHRZ64hz+TrVjLb?=
 =?us-ascii?Q?F0HJzlsvA+JC/kU49Ei72t9O2Zj0kffhrMn0Y27zONDyLJFprpkkmVL6hYGc?=
 =?us-ascii?Q?6xAqK02Q0TdzFCQn1NKfl7o=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b33ff03-474e-47a6-9102-08dd558fe349
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 11:31:04.2450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93H4pmfL2gbbudP9+61r9onVUavnkNSS+9TTX33IzyBOCPNNQ6bS7ehTyLSCKRyrTwMzKpRD48eGt190XzxVC11vfdLljO+xoFl6kRVin1FCf5bvGJMIUju6IwA2fksF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13813

On Tue, Feb 25, 2025 at 01:23:35PM +0200, Laurent Pinchart wrote:
> On Tue, Feb 25, 2025 at 11:52:54AM +0100, Tommaso Merciai wrote:
> > Hi Laurent,
> > 
> > Thanks for your review.
> > Back on some previous comments.
> > 
> > On Sun, Feb 23, 2025 at 10:32:30PM +0200, Laurent Pinchart wrote:
> > > Hi Tommaso,
> > > 
> > > Thank you for the patch.
> > > 
> > > On Fri, Feb 21, 2025 at 04:55:32PM +0100, Tommaso Merciai wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > 
> > > > The CRU block on the Renesas RZ/G3E SoC is similar to the one found on
> > > > the Renesas RZ/G2L SoC, with the following differences:
> > > > 
> > > > - Additional registers rzg3e_cru_regs.
> > > > - A different irq handler rzg3e_cru_irq.
> > > > - A different rzg3e_cru_csi2_setup.
> > > > - A different max input width.
> > > > 
> > > > Introduce rzg3e_cru_info struct to handle differences between RZ/G2L
> > > > and RZ/G3E and related RZ/G3E functions:
> > > > 
> > > >  - rzg3e_cru_enable_interrupts()
> > > >  - rzg3e_cru_enable_interrupts()
> > > >  - rz3e_fifo_empty()
> > > >  - rzg3e_cru_csi2_setup()
> > > >  - rzg3e_cru_get_current_slot()
> > > > 
> > > > Add then support for the RZ/G3E SoC CRU block with the new compatible
> > > > string "renesas,r9a09g047-cru".
> > > > 
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> > > > ---
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  63 +++++++
> > > >  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  25 +++
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  18 ++
> > > >  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 178 +++++++++++++++++-
> > > >  4 files changed, 282 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > index 3ae0cd83af16..075a3aa8af29 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> > > > @@ -290,6 +290,13 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
> > > >  		return ret;
> > > >  
> > > >  	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
> > > > +	cru->mem_banks = devm_kmalloc_array(dev, cru->num_buf,
> > > > +					    sizeof(struct rzg2l_cru_mem_bank),
> > > > +					    GFP_KERNEL);
> > > > +	if (!cru->mem_banks)
> > > > +		return dev_err_probe(dev, -ENOMEM,
> > > > +				     "Failed to init mem banks\n");
> > > > +
> > > >  	pm_suspend_ignore_children(dev, true);
> > > >  	ret = devm_pm_runtime_enable(dev);
> > > >  	if (ret)
> > > > @@ -321,6 +328,58 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
> > > >  	rzg2l_cru_dma_unregister(cru);
> > > >  }
> > > >  
> > > > +static const u16 rzg3e_cru_regs[] = {
> > > > +	[CRUnCTRL] = 0x0,
> > > > +	[CRUnIE] = 0x4,
> > > > +	[CRUnIE2] = 0x8,
> > > > +	[CRUnINTS] = 0xc,
> > > > +	[CRUnINTS2] = 0x10,
> > > > +	[CRUnRST] = 0x18,
> > > > +	[AMnMB1ADDRL] = 0x40,
> > > > +	[AMnMB1ADDRH] = 0x44,
> > > > +	[AMnMB2ADDRL] = 0x48,
> > > > +	[AMnMB2ADDRH] = 0x4c,
> > > > +	[AMnMB3ADDRL] = 0x50,
> > > > +	[AMnMB3ADDRH] = 0x54,
> > > > +	[AMnMB4ADDRL] = 0x58,
> > > > +	[AMnMB4ADDRH] = 0x5c,
> > > > +	[AMnMB5ADDRL] = 0x60,
> > > > +	[AMnMB5ADDRH] = 0x64,
> > > > +	[AMnMB6ADDRL] = 0x68,
> > > > +	[AMnMB6ADDRH] = 0x6c,
> > > > +	[AMnMB7ADDRL] = 0x70,
> > > > +	[AMnMB7ADDRH] = 0x74,
> > > > +	[AMnMB8ADDRL] = 0x78,
> > > > +	[AMnMB8ADDRH] = 0x7c,
> > > > +	[AMnMBVALID] = 0x88,
> > > > +	[AMnMADRSL] = 0x8c,
> > > > +	[AMnMADRSH] = 0x90,
> > > > +	[AMnAXIATTR] = 0xec,
> > > > +	[AMnFIFOPNTR] = 0xf8,
> > > > +	[AMnAXISTP] = 0x110,
> > > > +	[AMnAXISTPACK] = 0x114,
> > > > +	[AMnIS] = 0x128,
> > > > +	[ICnEN] = 0x1f0,
> > > > +	[ICnSVCNUM] = 0x1f8,
> > > > +	[ICnSVC] = 0x1fc,
> > > > +	[ICnIPMC_C0] = 0x200,
> > > > +	[ICnMS] = 0x2d8,
> > > > +	[ICnDMR] = 0x304,
> > > > +};
> > > > +
> > > > +static const struct rzg2l_cru_info rzg3e_cru_info = {
> > > > +	.max_width = 4095,
> > > > +	.max_height = 4095,
> > > > +	.image_conv = ICnIPMC_C0,
> > > > +	.stride = 128,
> > > > +	.regs = rzg3e_cru_regs,
> > > > +	.irq_handler = rzg3e_cru_irq,
> > > > +	.enable_interrupts = rzg3e_cru_enable_interrupts,
> > > > +	.disable_interrupts = rzg3e_cru_disable_interrupts,
> > > > +	.fifo_empty = rz3e_fifo_empty,
> > > > +	.csi_setup = rzg3e_cru_csi2_setup,
> > > > +};
> > > > +
> > > >  static const u16 rzg2l_cru_regs[] = {
> > > >  	[CRUnCTRL] = 0x0,
> > > >  	[CRUnIE] = 0x4,
> > > > @@ -367,6 +426,10 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
> > > >  };
> > > >  
> > > >  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> > > > +	{
> > > > +		.compatible = "renesas,r9a09g047-cru",
> > > > +		.data = &rzg3e_cru_info,
> > > > +	},
> > > >  	{
> > > >  		.compatible = "renesas,rzg2l-cru",
> > > >  		.data = &rzgl2_cru_info,
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > index 82920db7134e..1646d1e2953c 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> > > > @@ -14,8 +14,13 @@
> > > >  
> > > >  #define CRUnIE_EFE			BIT(17)
> > > >  
> > > > +#define CRUnIE2_FSxE(x)			BIT(((x) * 3))
> > > > +#define CRUnIE2_FExE(x)			BIT(((x) * 3) + 1)
> > > > +
> > > >  #define CRUnINTS_SFS			BIT(16)
> > > >  
> > > > +#define CRUnINTS2_FSxS(x)		BIT(((x) * 3))
> > > > +
> > > >  #define CRUnRST_VRESETN			BIT(0)
> > > >  
> > > >  /* Memory Bank Base Address (Lower) Register for CRU Image Data */
> > > > @@ -32,7 +37,14 @@
> > > >  #define AMnAXIATTR_AXILEN		(0xf)
> > > >  
> > > >  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
> > > > +#define AMnFIFOPNTR_FIFOWPNTR_B0	AMnFIFOPNTR_FIFOWPNTR
> > > > +#define AMnFIFOPNTR_FIFOWPNTR_B1	GENMASK(15, 8)
> > > >  #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
> > > > +#define AMnFIFOPNTR_FIFORPNTR_B0	AMnFIFOPNTR_FIFORPNTR_Y
> > > > +#define AMnFIFOPNTR_FIFORPNTR_B1	GENMASK(31, 24)
> > > > +
> > > > +#define AMnIS_IS_MASK			GENMASK(14, 7)
> > > > +#define AMnIS_IS(x)			((x) << 7)
> > > >  
> > > >  #define AMnAXISTP_AXI_STOP		BIT(0)
> > > >  
> > > > @@ -40,6 +52,11 @@
> > > >  
> > > >  #define ICnEN_ICEN			BIT(0)
> > > >  
> > > > +#define ICnSVC_SVC0(x)			(x)
> > > > +#define ICnSVC_SVC1(x)			((x) << 4)
> > > > +#define ICnSVC_SVC2(x)			((x) << 8)
> > > > +#define ICnSVC_SVC3(x)			((x) << 12)
> > > > +
> > > >  #define ICnMC_CSCTHR			BIT(5)
> > > >  #define ICnMC_INF(x)			((x) << 16)
> > > >  #define ICnMC_VCSEL(x)			((x) << 22)
> > > > @@ -52,7 +69,9 @@
> > > >  enum rzg2l_cru_common_regs {
> > > >  	CRUnCTRL,	/* CRU Control */
> > > >  	CRUnIE,		/* CRU Interrupt Enable */
> > > > +	CRUnIE2,	/* CRU Interrupt Enable(2) */
> > > >  	CRUnINTS,	/* CRU Interrupt Status */
> > > > +	CRUnINTS2,	/* CRU Interrupt Status(2) */
> > > >  	CRUnRST, 	/* CRU Reset */
> > > >  	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
> > > >  	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
> > > > @@ -72,12 +91,18 @@ enum rzg2l_cru_common_regs {
> > > >  	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
> > > >  	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
> > > >  	AMnMBS,		/* Memory Bank Status for CRU Image Data */
> > > > +	AMnMADRSL,	/* VD Memory Address Lower Status Register */
> > > > +	AMnMADRSH,	/* VD Memory Address Higher Status Register */
> > > >  	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
> > > >  	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
> > > >  	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
> > > >  	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
> > > > +	AMnIS,		/* Image Stride Setting Register */
> > > >  	ICnEN,		/* CRU Image Processing Enable */
> > > > +	ICnSVCNUM,	/* CRU SVC Number Register */
> > > > +	ICnSVC,		/* CRU VC Select Register */
> > > >  	ICnMC,		/* CRU Image Processing Main Control */
> > > > +	ICnIPMC_C0,	/* CRU Image Converter Main Control 0 */
> > > >  	ICnMS,		/* CRU Module Status */
> > > >  	ICnDMR,		/* CRU Data Output Mode */
> > > >  };
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > index ccaba5220f1c..3301379c132c 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> > > > @@ -84,6 +84,7 @@ struct rzg2l_cru_info {
> > > >  	unsigned int max_width;
> > > >  	unsigned int max_height;
> > > >  	u16 image_conv;
> > > > +	u16 stride;
> > > >  	const u16 *regs;
> > > >  	irqreturn_t (*irq_handler)(int irq, void *data);
> > > >  	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
> > > > @@ -94,6 +95,11 @@ struct rzg2l_cru_info {
> > > >  			  u8 csi_vc);
> > > >  };
> > > >  
> > > > +struct rzg2l_cru_mem_bank {
> > > > +	dma_addr_t addrl;
> > > > +	dma_addr_t addrh;
> > > > +};
> > > > +
> > > >  /**
> > > >   * struct rzg2l_cru_dev - Renesas CRU device structure
> > > >   * @dev:		(OF) device
> > > > @@ -108,6 +114,8 @@ struct rzg2l_cru_info {
> > > >   * @vdev:		V4L2 video device associated with CRU
> > > >   * @v4l2_dev:		V4L2 device
> > > >   * @num_buf:		Holds the current number of buffers enabled
> > > > + * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
> > > > + * @mem_banks:		Memory addresses where current video data is written.
> > > >   * @notifier:		V4L2 asynchronous subdevs notifier
> > > >   *
> > > >   * @ip:			Image processing subdev info
> > > > @@ -144,6 +152,9 @@ struct rzg2l_cru_dev {
> > > >  	struct v4l2_device v4l2_dev;
> > > >  	u8 num_buf;
> > > >  
> > > > +	u8 svc_channel;
> > > > +	struct rzg2l_cru_mem_bank *mem_banks;
> > > > +
> > > >  	struct v4l2_async_notifier notifier;
> > > >  
> > > >  	struct rzg2l_cru_ip ip;
> > > > @@ -175,6 +186,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
> > > >  int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
> > > >  void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
> > > >  irqreturn_t rzg2l_cru_irq(int irq, void *data);
> > > > +irqreturn_t rzg3e_cru_irq(int irq, void *data);
> > > >  
> > > >  const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
> > > >  
> > > > @@ -188,10 +200,16 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
> > > >  
> > > >  void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
> > > >  void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
> > > > +void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
> > > > +void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
> > > >  
> > > >  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
> > > > +bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru);
> > > >  void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> > > >  			  const struct rzg2l_cru_ip_format *ip_fmt,
> > > >  			  u8 csi_vc);
> > > > +void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> > > > +			  const struct rzg2l_cru_ip_format *ip_fmt,
> > > > +			  u8 csi_vc);
> > > >  
> > > >  #endif
> > > > diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > index 637c9c9f9ba8..efd70c13704e 100644
> > > > --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> > > > @@ -138,6 +138,9 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
> > > >  	/* Currently, we just use the buffer in 32 bits address */
> > > 
> > > Should this be fixed ?
> > 
> > This feature support is in the pipeline and we shall start looking into once the
> > initial support for RZ/G3E and RZ/V2H gets in.
> > 
> > > 
> > > >  	rzg2l_cru_write(cru, AMnMBxADDRL(AMnMB1ADDRL, slot), addr);
> > > >  	rzg2l_cru_write(cru, AMnMBxADDRH(AMnMB1ADDRH, slot), 0);
> > > > +
> > > > +	cru->mem_banks[slot].addrl = lower_32_bits(addr);
> > > > +	cru->mem_banks[slot].addrh = upper_32_bits(addr);
> > > 
> > > Here you stplit the dma_addr_t in two fields, storing the low and high
> > > parts separately (but still in dma_addr_t variables), and below you
> > > recombine those two fields to recreate the full address. That doesn't
> > > seem needed.
> > > 
> > > >  }
> > > >  
> > > >  /*
> > > > @@ -176,7 +179,7 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
> > > >  	rzg2l_cru_set_slot_addr(cru, slot, phys_addr);
> > > >  }
> > > >  
> > > > -static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > > > +static int rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > > >  {
> > > >  	unsigned int slot;
> > > >  	u32 amnaxiattr;
> > > > @@ -190,10 +193,45 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
> > > >  	for (slot = 0; slot < cru->num_buf; slot++)
> > > >  		rzg2l_cru_fill_hw_slot(cru, slot);
> > > >  
> > > > +	if (cru->info->stride) {
> > > 
> > > I'd name this field stride_align or something similar.
> > > 
> > > > +		u32 stride = cru->format.bytesperline;
> > > > +		u32 amnis;
> > > > +
> > > > +		if (stride % cru->info->stride) {
> > > > +			dev_err(cru->dev,
> > > > +				"Bytesperline must be multiple of %u bytes\n",
> > > > +				cru->info->stride);
> > > > +			return -EINVAL;
> > > > +		}
> > > 
> > > This needs to be caught at set format time, and the stride must be
> > > adjusted then.
> > > 
> > > > +		stride = stride / cru->info->stride;
> > > 
> > > 		stride /= cru->info->stride;
> > > 
> > > > +		amnis = rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
> > > > +		rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
> > > > +	}
> > > > +
> > > >  	/* Set AXI burst max length to recommended setting */
> > > >  	amnaxiattr = rzg2l_cru_read(cru, AMnAXIATTR) & ~AMnAXIATTR_AXILEN_MASK;
> > > >  	amnaxiattr |= AMnAXIATTR_AXILEN;
> > > >  	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> > > > +			  const struct rzg2l_cru_ip_format *ip_fmt,
> > > > +			  u8 csi_vc)
> > > > +{
> > > > +	const struct rzg2l_cru_info *info = cru->info;
> > > > +	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
> > > > +
> > > > +	icnmc |= (rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK);
> > > > +
> > > > +	/* Set virtual channel CSI2 */
> > > > +	icnmc |= ICnMC_VCSEL(csi_vc);
> > > > +
> > > > +	rzg2l_cru_write(cru, ICnSVCNUM, cru->svc_channel);
> > > 
> > > As far as I can tell, csi_vc and cru->svc_channel hold the same value.
> > > You can drop ths svc_channel field.
> > > 
> > > > +	rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
> > > > +			ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> > > > +	rzg2l_cru_write(cru, info->image_conv, icnmc);
> > > >  }
> > > >  
> > > >  void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> > > > @@ -244,6 +282,19 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
> > > >  	return 0;
> > > >  }
> > > >  
> > > > +bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru)
> > > > +{
> > > > +	u32 amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
> > > > +
> > > > +	if ((((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B1) >> 24) ==
> > > > +	     ((amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B1) >> 8)) &&
> > > > +	    (((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B0) >> 16) ==
> > > > +	     (amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B0)))
> > > > +		return true;
> > > > +
> > > > +	return false;
> > > > +}
> > > > +
> > > >  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
> > > >  {
> > > >  	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
> > > > @@ -355,6 +406,20 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
> > > >  	return fd.entry[0].bus.csi2.vc;
> > > >  }
> > > >  
> > > > +void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
> > > > +{
> > > > +	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FSxE(cru->svc_channel));
> > > > +	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FExE(cru->svc_channel));
> > > > +}
> > > > +
> > > > +void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
> > > > +{
> > > > +	rzg2l_cru_write(cru, CRUnIE, 0);
> > > > +	rzg2l_cru_write(cru, CRUnIE2, 0);
> > > > +	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
> > > > +	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
> > > > +}
> > > > +
> > > >  void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
> > > >  {
> > > >  	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
> > > > @@ -377,6 +442,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> > > >  	if (ret < 0)
> > > >  		return ret;
> > > >  	csi_vc = ret;
> > > > +	cru->svc_channel = csi_vc;
> > > >  
> > > >  	spin_lock_irqsave(&cru->qlock, flags);
> > > >  
> > > > @@ -390,7 +456,11 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
> > > >  	cru->info->disable_interrupts(cru);
> > > >  
> > > >  	/* Initialize the AXI master */
> > > > -	rzg2l_cru_initialize_axi(cru);
> > > > +	ret = rzg2l_cru_initialize_axi(cru);
> > > > +	if (ret) {
> > > > +		spin_unlock_irqrestore(&cru->qlock, flags);
> > > > +		return ret;
> > > > +	}
> > > 
> > > This will go away once you remove the error check from
> > > rzg2l_cru_initialize_axi(), which should then remain a void function.
> > > 
> > > There's another function returning an error here,
> > > rzg2l_cru_initialize_image_conv(). I think it can also become void (in a
> > > separate patch).
> > > 
> > > >  
> > > >  	/* Initialize image convert */
> > > >  	ret = rzg2l_cru_initialize_image_conv(cru, fmt, csi_vc);
> > > > @@ -555,6 +625,110 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
> > > >  	return IRQ_RETVAL(handled);
> > > >  }
> > > >  
> > > > +static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
> > > > +{
> > > > +	dma_addr_t amnmadrs;
> > > > +	unsigned int slot;
> > > > +
> > > > +	amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
> > > > +	amnmadrs |= ((dma_addr_t)rzg2l_cru_read(cru, AMnMADRSH) << 32);
> > > 
> > > What if the two registers are read on a frame boundary ?
> > 
> > The reference manual says:
> > 
> > AMnMADRSL:
> >  Note: When this register is read, AMnMADRSH of the higher-order address also latches the
> >  address.
> >  Note: Be sure to read AMnMADRSH after AMnMADRSL has been read.
> > 
> > AMnMADRSH:
> >  Note: When the AMnMADRSL register is read, the higher address AMnMADRSH also latches the
> >  address.
> >  Note: Be sure to lead AMnMADRSH after AMnMADRSL lead.
> > 
> > Then I think we are safe from this perspective.
> 
> Sounds good. Please mention this in a comment, to ensure nobody tries to
> swap the reads at some point in the future.

Will do, thanks.

> 
> > > > +
> > > > +	for (slot = 0; slot < cru->num_buf; slot++) {
> > > > +		dma_addr_t buf_addr;
> > > > +
> > > > +		buf_addr = cru->mem_banks[slot].addrh << 32 |
> > > > +			cru->mem_banks[slot].addrl;
> > > > +
> > > > +		/* Ensure amnmadrs is within this buffer range */
> > > > +		if (amnmadrs >= buf_addr &&
> > > > +		    amnmadrs < buf_addr + cru->format.sizeimage) {
> > > > +			return slot;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
> > > > +	return -EINVAL;
> > > > +}
> > > > +
> > > > +irqreturn_t rzg3e_cru_irq(int irq, void *data)
> > > > +{
> > > > +	struct rzg2l_cru_dev *cru = data;
> > > > +	unsigned int handled = 0;
> > > > +	unsigned long flags;
> > > > +	unsigned int slot;
> > > > +	u32 irq_status;
> > > > +
> > > > +	spin_lock_irqsave(&cru->qlock, flags);
> > > > +	irq_status = rzg2l_cru_read(cru, CRUnINTS2);
> > > > +	if (!(irq_status))
> > > > +		goto done;
> > > > +
> > > > +	dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
> > > > +
> > > > +	handled = 1;
> > > > +
> > > > +	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
> > > > +
> > > > +	/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
> > > > +	if (cru->state == RZG2L_CRU_DMA_STOPPED) {
> > > > +		dev_dbg(cru->dev, "IRQ while state stopped\n");
> > > > +		goto done;
> > > > +	}
> > > > +
> > > > +	if (cru->state == RZG2L_CRU_DMA_STOPPING) {
> > > > +		if (irq_status & CRUnINTS2_FSxS(0) ||
> > > > +		    irq_status & CRUnINTS2_FSxS(1) ||
> > > > +		    irq_status & CRUnINTS2_FSxS(2) ||
> > > > +		    irq_status & CRUnINTS2_FSxS(3))
> > > > +			dev_dbg(cru->dev, "IRQ while state stopping\n");
> > > > +		goto done;
> > > > +	}
> > > > +
> > > > +	slot = rzg3e_cru_get_current_slot(cru);
> > > > +	if (slot < 0)
> > > > +		goto done;
> > > > +
> > > > +	dev_dbg(cru->dev, "Current written slot: %d\n", slot);
> > > > +
> > > > +	cru->mem_banks[slot].addrl = 0;
> > > > +	cru->mem_banks[slot].addrh = 0;
> > > > +
> > > > +	/*
> > > > +	 * To hand buffers back in a known order to userspace start
> > > > +	 * to capture first from slot 0.
> > > > +	 */
> > > > +	if (cru->state == RZG2L_CRU_DMA_STARTING) {
> > > > +		if (slot != 0) {
> > > > +			dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
> > > > +			goto done;
> > > > +		}
> > > > +		dev_dbg(cru->dev, "Capture start synced!\n");
> > > > +		cru->state = RZG2L_CRU_DMA_RUNNING;
> > > > +	}
> > > > +
> > > > +	/* Capture frame */
> > > > +	if (cru->queue_buf[slot]) {
> > > > +		cru->queue_buf[slot]->field = cru->format.field;
> > > > +		cru->queue_buf[slot]->sequence = cru->sequence;
> > > > +		cru->queue_buf[slot]->vb2_buf.timestamp = ktime_get_ns();
> > > > +		vb2_buffer_done(&cru->queue_buf[slot]->vb2_buf,
> > > > +				VB2_BUF_STATE_DONE);
> > > > +		cru->queue_buf[slot] = NULL;
> > > > +	} else {
> > > > +		/* Scratch buffer was used, dropping frame. */
> > > > +		dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
> > > > +	}
> > > > +
> > > > +	cru->sequence++;
> > > > +
> > > > +	/* Prepare for next frame */
> > > > +	rzg2l_cru_fill_hw_slot(cru, slot);
> > > > +
> > > > +done:
> > > > +	spin_unlock_irqrestore(&cru->qlock, flags);
> > > > +	return IRQ_RETVAL(handled);
> > > > +}
> > > > +
> > > >  static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
> > > >  {
> > > >  	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
> 
> -- 
> Regards,
> 
> Laurent Pinchart

