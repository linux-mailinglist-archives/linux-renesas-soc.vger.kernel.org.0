Return-Path: <linux-renesas-soc+bounces-25258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A168C8E275
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:57:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C8AB13429E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40868331A5A;
	Thu, 27 Nov 2025 11:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HFs7gEGQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010023.outbound.protection.outlook.com [52.101.229.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563D23314D4;
	Thu, 27 Nov 2025 11:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244328; cv=fail; b=BbydPYNnAjHzdM1A4UbyB4kvyVK+MWxxQI8zS+3Y6C+qdJJ5/wePl7/4rrEQU6VLaOW/ElDYi6OM7iSDfXNVW8srg49vttY0BiGYkPO6U53FZCnAX8nH9cQ/s7PnFZRVJfLPd6z+Y6flvlNUliDeu/Q3i/Solj82UKY6dOKL/Pc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244328; c=relaxed/simple;
	bh=lKb3/V4uc1545FQoB6GAHm09t4//R1FdkLCYEM7dVzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BEKv9YF6jiZMC/pXYGr9WIHXcYnTGSOTN3fmSXRZheBNwpNRZ2skl8EX3nbdkqpRXVc2HfY1PkMWDp9Zz7QpkPcCYjAG9rkOAP95SXMKb68JiuO0WnOCJhilwYv3nJUB2CLVHlmgnW4R0gYWp5XCfPYTAfRe+63z2L5g3Y2ObW4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=HFs7gEGQ; arc=fail smtp.client-ip=52.101.229.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNJzQECuzytPYlg6j/WmpBkcRJahCj4ZO5a9C1ndiB326gTrhBV/hszoZjXGNPlZ3p8z0skfI5+VVgRK5yanf9c6LYhOwt0QrPyaNx4DPDH61E8AwmG7yhlVDeSYuNfnGdR/Zqexx2jrCZhovI9vzehzy91suSruH4CFYG4gR85pgl0JRduK23d/0GNL1K29ksjREtYMbEtLDLFj+F96hGmniST1JYndzlbc4jl2/xwZBRgdE7vdmqiyO6gjYOVPqW1WSMTk2t0xRISrj5+3xd6OylZveb3qYqmLHpZszqbT4+IxGHrMiaTr11sqaacghqQCQ+JUCJpWV4apkcjcfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsKczcVuP6zlDvJTWjbLSHduDQC5yZpad5jOBH3xvFc=;
 b=tgocQzJGnUI5zpeEyfnoNf6s3BLRsgA3HlriXrrsW3L3ZUE9DSRvitpPCPRQVc5+Gos8D2RgpzfU8I8MSAKGWv9YFjgrNEciPZp2s/6XeZOczKw7o0KNa0Xs0OCF0ruUv91WgkyjMtM7YEZxlnQU/02aNLEIowPrDuEUaDuiueidRo66+sBe1ZODRc6GKAfPkK4Jz3PS4IvCZvLXEaT/HSXUKcdU6IEsxKcm4ARsilz1e/n6uRlu/UzBtLMu2Al1h3OKSjQjxYErs8Qt4BSUDqosZSbLppOymOIdgu+SFRB6TXxMHxIY9/TXq5vv6EqOvfYt1pni3X8RRQmTHb4cRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsKczcVuP6zlDvJTWjbLSHduDQC5yZpad5jOBH3xvFc=;
 b=HFs7gEGQkmuydXWrruekrmzdpPIEkUZtsEapqSHTl1M/gMF7bhFmHFj9nU39v7L8MfsYCeW7tdGL+eV0X3D2c+DB6vM95wLTNKPM49WHghjjdzZ6zC8TIr75jqB3oBI6Bg79nzsWu/FUgjuxooTjBgJdphDi85uHsQuknPDyPM4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 11:52:04 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:52:03 +0000
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
Subject: [PATCH v5 18/22] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2 PHY0 VBUS support
Date: Thu, 27 Nov 2025 12:48:45 +0100
Message-ID: <754650ddb849166458d0f34e03d3aab839a3008c.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 32cbcac8-4a56-49fd-763d-08de2dab61bb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W0e8q1LmapDj2CgQKIWzAszJE+p4D5Wlt3wjv/rv0cp5qKMo87CeNASoUBfq?=
 =?us-ascii?Q?nKrnD00eW3InWBIrhBsxopVoYFlblfRnUm5teIAKgC7UF87dyvUYN6fU7CKZ?=
 =?us-ascii?Q?MLCKRv4IFwBMJFt1j0aHci8Ftx2gfyQI1fUwP1V0q41oanIdCJZ9iKqSrZNH?=
 =?us-ascii?Q?c6O11z3o3xYISabRhTiq67Wqq55nKAXLnkQMfVi4gQa5zK58l/4Nyr7e4RF2?=
 =?us-ascii?Q?00G2r2KrlzHDtr7/43ruytGrGx0P19BrYMr14568Ii7r0c4+4A6aSXCkpZT6?=
 =?us-ascii?Q?vsX1Ak/dW+SnGbVEvSD8wW1kxVQ//oWLbsGxJJvyRv1kvd20J3qJ2CXnw5AQ?=
 =?us-ascii?Q?VJBT09tNQw4aFJ7CHym8W4240zo7aVGHVvebKa6B5KysP5yT0pDH36jOIUar?=
 =?us-ascii?Q?7rmYTPltPRGcHsZhiZzRFB7Pv9Ok3RM5n5EZRGhU5UgRHQlY/x2Q+KZz3HAD?=
 =?us-ascii?Q?7peqDHI7dUinfFC/fQXNYv1wU2QTFGm0/us4S9MT7CY5TmHWC6cOWvX/qAqE?=
 =?us-ascii?Q?Ra+h+pvA5G+oA2Xs0I7nGq/hP5I4c3nxSLJHJjldegQ7Y504qZt15pGWCcJP?=
 =?us-ascii?Q?Osw8aPryK4NJpECLGcNacdLSVTaWPBgJ6R52zQezjm9PW4Rl5owHM2Xd0TPS?=
 =?us-ascii?Q?Bd2Bvxr3gtsVrSVV8N9kSWZxVzX7LmY6uVhORX1xu4fQypXSP9s2f3NZrVrh?=
 =?us-ascii?Q?Ku0aTfiX48s72O7ujPQVw6A0d8IQHoQQnkNszPiPXz+hD5EnUfuWaMBNtd4H?=
 =?us-ascii?Q?5qF5FKazryodCIwhEIVjEOtJGRo9aFB6sctZvFBXW9Oaf4jt6raGthXyFIVN?=
 =?us-ascii?Q?wFVm27LYz2HvOhTnDdFoni2w+VSuxHdcelZOgyryB0HYpQSVtWdJbRWHLHtj?=
 =?us-ascii?Q?IqR+XXsLfCTpEOZO6DumRWav/rhHjJqgx7I5a44HVp3DpaXU2C0vDgjuGf/E?=
 =?us-ascii?Q?akc5qgbPxs8k0ocZBPo1Xl4L7lqnrHhY2wI5VDNVGG5mPi/gzNtyK5b4uI1C?=
 =?us-ascii?Q?y3iErdfRL/jhV5OO1xMRoFN4A3ieGG//GjRZhgeOkH1U9Os+6EEub4wd2SBP?=
 =?us-ascii?Q?LxOd3MnyxWlpJriUdtybPn4E7xx/0nanh/+i+B4M6Wvpu914qL/TjxsVpo8H?=
 =?us-ascii?Q?ZyLbwK0CrM6FCO/JByQK0FkjviohS2/8JAGKJQVyUs4v+yTrhuYcAuxskFDl?=
 =?us-ascii?Q?b0oScQ1ksCpsfAmjeEMulErZZXiCR3zwg0Rtt+B2wPwCgrWKYh8L6GMLx8cD?=
 =?us-ascii?Q?D6BxGKhxjaQV0OkbF2O5l3Pu2SumypLUGVqlLy7PJE1PCf5XzO29gXwWPEo2?=
 =?us-ascii?Q?m5zwxARSvaUgd2+pLltBlDJca1egN+uvTXJfJxi9Qj1Y2+uHGkNtL7TzYc9P?=
 =?us-ascii?Q?hJ0jWiaSkCnXykPg/QRrc0+hFBu6kVfE3nn+778314xY3pe/eeVSuE0VZzps?=
 =?us-ascii?Q?svIGrtLcPdBf4nQObVBzOXXOY/Xw7jUegDi7IZGKGuzr6m0I803d0dmWGaAH?=
 =?us-ascii?Q?F91j1UEfFDl4I+AjhBNVvryC2CpRXNwwT3zY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QSfJBPEO1IBZ4aJSjXC39oVCuSYGMlxTIVpBFTBciEXT+Bkk1v55iKT7TciF?=
 =?us-ascii?Q?tbBFnEvLksii0hNqw3OCKNvp9i7N093loqY45RaUVys10BG/7dP0nqwB39bA?=
 =?us-ascii?Q?XVe3NhR4kQadjD0prcmCJ6L8nPPPryPipyOEgl8huWsIZDcg/7K8qy5NcmGl?=
 =?us-ascii?Q?A5poBGAXWgISEuS7vCWKdXN5yfKMiK7GsUDdqqZNTYHxqLfA+1oxwvMDRuWG?=
 =?us-ascii?Q?h7Zph3K7mUhX7r+XhhNuEYRp4954TqdevdVthm0zv3K5thJMyQhtgfLv/Dka?=
 =?us-ascii?Q?eM3bMqiKkjtpj3uZsMYO2+i4OW+GRuDhZ0gv0lKvA/umJyPR+/LBSnnmkv1h?=
 =?us-ascii?Q?i7nn+zK2G8pPzoqIXu0ntoLMT7/6xyT/P3Vzq/2ARoYmYTQHmX5cXBOrycq1?=
 =?us-ascii?Q?7h30LL3NQhJr48aq2QMoKVkJ001Zk4aKej9wqS2LjNXO09I3tPl1A7+yndb7?=
 =?us-ascii?Q?zo+/s0sNLRFExEihmoiU96mG+ZJT3+7im9SY0bG9X8EfZ55D5z7l6wAMOf7f?=
 =?us-ascii?Q?bx/tADIB4UeQTobWFDkOLqtg9oRSFOTouzvyT3Kwt+H45jOlow/Ge67lvYB0?=
 =?us-ascii?Q?Mi+FUfohCNZ2l3T4NdgneRTjjbd1hzZXXp9Fm6vhP5fkpSWS36SZz3k0M7yM?=
 =?us-ascii?Q?WISc8jhT211aBQ1wcOvozy57xdX5b+8HUVGbgh5mF7MD4GsaN7pcFsVkM/tq?=
 =?us-ascii?Q?LzSxZ2MAw82qqAqDewk4pObLcg5ZMN9YZk74QUduTQnCr02XXrzX8BaY4VR0?=
 =?us-ascii?Q?kqYd8I5rdz+R3GtTsRT/ig2xDSP6FQ66dn4KN2xA2x8LxdxHRR/OcF5NeLXP?=
 =?us-ascii?Q?q6LblPgBsi4u0cryHHLgFGw1Aw1txymdZ467fF/ch8pXqQAroiMWgmiNQe5i?=
 =?us-ascii?Q?2dyrYEaPYpYAmGHXV9tpYiOY2/E9cTNEMsZWqJiI3PuLrk+zIpBGm6wAuZ4L?=
 =?us-ascii?Q?ZwxjzgmkkIdUTEnb2z9hzIiatBm4vwqJ+wbSllZXoSZk2rhOmdzTrx1khBbn?=
 =?us-ascii?Q?M1HTYHO86i1mBwmIWrgEdi0FQZ//G4etp1sSxPtVItIg81+EYUcFjgc26qhW?=
 =?us-ascii?Q?En2fz7P776MPd3p0/fmYIoHoHN3GZbEaHI2C3rlm3Q0lk/LVZO2EN+vegNpg?=
 =?us-ascii?Q?cRrUIMBUkVmknc7IxC9S7HFKCksr5it3Vqrahx9EIfrU+hBaA9GX9+M5L7T1?=
 =?us-ascii?Q?YO35mc7A6s6v253BpKYW2Q8ha1Z2hqjyqj0hb3M24ukG7Hrjz/K+mHqn2GxH?=
 =?us-ascii?Q?/vZiBErjEknSlPuWEREHbETLOWY+FjnKJiGVwLG+xrIiayvrSrt7h0myJDzw?=
 =?us-ascii?Q?s/Tf7PwDEUpiAiWPN3dlGfvGmCZfkxtXXjYOfBBF9NnQBHWpukcrVSKzIOTV?=
 =?us-ascii?Q?iqEVU/g4pm2n3/y3in8DYF2DxA5q5RM2O86O56AbjMNwncpx4VKfvYJGHt1l?=
 =?us-ascii?Q?icT6zyhx360VQoB0Tr1s0OtJFOWVsGhmUxrJUyWWuFwNc2D8dnaXDAJeHo12?=
 =?us-ascii?Q?WkHc/3j3s29It2q3rgdzY/acL2kIgTDr5UIwQ/sNEjwNlpg5nZi9hkp5hAYb?=
 =?us-ascii?Q?m2//fPLtMH62w1zsAdcVAZXRoG+Ke+k9Oo9ZfVl0YnI2m86SzCkAnB1POklg?=
 =?us-ascii?Q?KJ1ZKf+N/eveXPS8VojMkW0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32cbcac8-4a56-49fd-763d-08de2dab61bb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:52:03.8928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bFtcfMDdbUIjEnHFXszT3bLDzp3+rv5EuQ/963Ni1k/MArQBHPfI4Uw/rDJ7/8xSqdIx+jcryKchjAFhdT5K/PYH1/ssTC20bHikCJ5I3pwgs10ObFlcKw5TEXJpPYnv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042

Enable the vbus-supply and status properties for USB2 PHY0 and its
VBUS OTG regulator in the r9a09g056n48-rzv2n-evk device tree.

Enabling them ensures proper VBUS handling and reliable USB OTG
operation on the channel.

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

 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 066e66b5d51a..54ed7cb2d73b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -389,6 +389,11 @@ &usb2_phy0 {
 	pinctrl-0 = <&usb20_pins>;
 	pinctrl-names = "default";
 
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy0_vbus_otg {
 	status = "okay";
 };
 
-- 
2.43.0


