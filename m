Return-Path: <linux-renesas-soc+bounces-24390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0B1C4684F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 424451884878
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CC53126D3;
	Mon, 10 Nov 2025 12:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VGAToUaC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010022.outbound.protection.outlook.com [52.101.229.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CCD30DEB1;
	Mon, 10 Nov 2025 12:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776614; cv=fail; b=VbKFZrFoxWtXLxGX6wuiwrLI5JS3ViOKyCe4L4YpXETsgAKPCR+g91R0ej4qPOtHWzI9bA4SXRAt7o47IhvDgIdISdFGh7YGTtYVVeFSk85L0w0Em7YEc33T2NNVqtFqwbiSzSM3HBzLwf0DTFJEIQnSkvGxUtXg6Udnkv4bpKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776614; c=relaxed/simple;
	bh=oXx+wz+Kj/pYztWrRQQfmMJ/ic+aPF1Gr1DYihflqtc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K83ctAXb4Re74AB+wcniOAC1g0akzpDmaR6HUIvjV+EyPDBPjxVncrgde3OTQkHNfcuWM+a1EfBYwvreibsFLX/r16mVG/GqjtM92oN2BZeW2ePAiP+4nVfpHdn9i07cVriELUxVqTppfYpQhrv0KB4eFHwxZfSHB6A+ZU8VEUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VGAToUaC; arc=fail smtp.client-ip=52.101.229.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rrk6FaAwcM24zRGSkxKoMgsMsU6Wp3wxHJeLnrFL/7HgPUmiBQ9W96XmSOP6lCChjdKsrprU8bE64+Dgwjv/XtRiMD6c6Q1zzmauxUQo+l5eGQQuvtRQyGJHAsl1/42brxMuwFDs9Tt9le1dXSFvIaKMJptuWA9MM1KkptgqSvrmNusyblGkmWYLyxncStmomOkOPj2M342nrYLBq5udwLM7b68fTV8sR3z7Y/LgQNLJ1h9jTqhe62A+Kdo0PJAms5kHhPzYactkXLZylrfOX/c6CG54CoYHYrufbyCWJGBnOaglEKP0QbpVQNjF5Kmb7Diax53/Zfmq2DIK4CW9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0IEOmCG5NMCHfRongCMjOQIqNfkOYq8vTHp0Gb9vY0=;
 b=WUMD6WZkPGGCGUpYigzgw9nUysyEjpxxcPIi/30HcZGgZm0YiERhkoJjCiLH0gZqOTj5kdjj+k/UdYLc/e4VwHYRXT1+zu9JaH76o2yNRJHWIRbttabzX4zFLXlyWbRiTVANTGzzQnIqeI3ZtzLl4dL9bLxgUxSZuDb0qavrvvShdwwQwFpxIgxVRr5aSv6CEGAJIiICIlRRk30l4KSjJO52eKNhYm6XzioThG8LNZO6ycqz5rihnEt7Rw1AswW79guy3mmRnyqU46mnvDoFQ0OCHMS/0mztysL/j3pLSU9UoR0+RYWxlHnmbxH6O5cvExML0kKWAkXQdbzeFSLmxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s0IEOmCG5NMCHfRongCMjOQIqNfkOYq8vTHp0Gb9vY0=;
 b=VGAToUaC0jplpkEAM6cA+3/t+0Iz0D4M9Xn1k6NrqBlVdE/BwncQw/2U3CjPs7WNUUVbe1ThnpA6HXiF2ygGUpxu+2fVgE37K3Ktp2oDmPPQWF87jyN/nnF9k3Z5ZINsKgK3IgPyRM1gVFL9Nb2EATm4Uq/mJuR0cd6CRj2RuE0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8436.jpnprd01.prod.outlook.com (2603:1096:604:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:10:09 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:10:09 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/21] phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management
Date: Mon, 10 Nov 2025 13:08:10 +0100
Message-ID: <160371c0c5edae1fd3d66355f0b0afdb34de9387.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::15)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d76e84f-4999-4a9c-e948-08de205217e0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QLmbaepwmQvjMT37bmdW3quMPQOmOtEg1/I1Iiqei9ojaPZgjBKFeAJr/XG0?=
 =?us-ascii?Q?1dq9LPL/UhW7bqILEEQV1oBYa86jljkbuMVFzz2+gHLvhPW5SvaINauxji98?=
 =?us-ascii?Q?a4HXbwgVPaBgI4HgTO1EiVUT+MWpRt/SFlS+Cuk3sfKZSykqdZ2rHy379c9S?=
 =?us-ascii?Q?8Kj4/E4KtHPfTS5C+4gHxWt+2NUbIdFzSxsosrMDpvuwwnA2lXKH8RwE4tVg?=
 =?us-ascii?Q?6QFVsXQhDD6MddLPOo8sYx2TAWIrz24urQ9w5TU4VHra2re3J9jHllAKInbS?=
 =?us-ascii?Q?64U5aQ281kiZxR9CJikcSsWIRu/fLdRU9AEbaenXqGWBg/duKCduex/ldYtS?=
 =?us-ascii?Q?nIyHh3wwMydj7Q6vQ9yeQQBiw7I8Oc1nB3pbNxvg6tA0v76kcB6hBo8JIpAE?=
 =?us-ascii?Q?dXk6wn12WhW3LyMa5emw9oxJkXct0Qh85/HQoLdqm0yxx5+KbYaHPXYbaHj4?=
 =?us-ascii?Q?vOAUUPZSAwsC4hZiVwfaDF1xoqnKSUcv9WQWzLEwgQZzBza3FsseWWZ+altl?=
 =?us-ascii?Q?PBe0pAjcUUtC7ONgQ0WtSMp1JA6BggjmlAu1fYgsDrY48dqLJ4mxI0NYTrUd?=
 =?us-ascii?Q?Fcw3Ul60Vs7PhKdLhcYoXZsLqmoPti7HyDJL7fAXVX4BL4E74rj1C/D0G5MP?=
 =?us-ascii?Q?OJ/BKGVmKm1rUT06+IsXVIvPAhpK0sx+rwMsGLyDsd7Nd5Wax4WYcfDrYevw?=
 =?us-ascii?Q?9KGOCxhdAXEsCOUUj5s9CXV3u3X8JoLf+0BnSCQQTET8vlH8iKMjJuHQ+NRt?=
 =?us-ascii?Q?Yy7zYwGXvJGIf7B0NSa7z5jF8fB5IzythMHqnTaPrSF+HZgP33nZFDZly1kT?=
 =?us-ascii?Q?G8rdR22z2gBg5W/F8sQdcvuoys779oX9SEl1hkHUv6EUtxrKGzuk3I6aBe+i?=
 =?us-ascii?Q?wlOe4JVWYL685pvS7vQet2y2ANKUM7Ww4Ss0ZnGxhhz38CtdIvp433zhGgvp?=
 =?us-ascii?Q?CFIqSQVrBBIHrSxRf2QQzAnYVwE4JjWv9pOPuYOPRO08Gt/gu/+otBcqSEuX?=
 =?us-ascii?Q?N5B/5JDKCIdcdl7jtwbYRdnq2+zEii4coEtmFW+pmxvlDJndIvNsLhWOWsmU?=
 =?us-ascii?Q?eI+2A5U5su/pI9Y9L43Mmp5K4JEyaQwuB1vJPJncLtrZYDwWHdF/d7K9oyga?=
 =?us-ascii?Q?yfWR0bNWht7Z5+/Q/KWpnPys3QQyizcbZUs52C+57QbphbFpRhb6JvpWMPvd?=
 =?us-ascii?Q?nY0Lprx6z+6/bEzjDcOy9hCGWHj2Dd1AyvR3453ZbyRoi9DpdIihQH+sdATo?=
 =?us-ascii?Q?OKvW2WwSoQf4xdhzYstWJPYPqKG5IVOkzMD9pZ4BdOmvPsZ7WTqZ423hNeXA?=
 =?us-ascii?Q?fgWeDqXe/QVjNXqboxw4VCk3enb0pjNnPcZWliy+cW5AMJ3Mb3fP8MHJe1uq?=
 =?us-ascii?Q?DoaxwSt/QOOoHiW8uWsRos+gxYHZwAetJA/lUuJF85shz9NfBu7z+3jfHeGv?=
 =?us-ascii?Q?H3vMaUjPEwe+0xpELWfoUglmKRMja1bT64nvwNhf7MOkfCp9dy5KeD7uY11R?=
 =?us-ascii?Q?IMMDEcDcSudPRerHWdaXySJEFiXdSIhHvXzP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YA7f8o3NZy3v1Um5LXyBSHUHVfr71Tzc5YhSnkVowl+gZOTLEJGNMnLi7skt?=
 =?us-ascii?Q?Xq1+CIJ0OxXlXtF3Kj3o3SabaCiL40PF2RNjgF/zRhlvZkWkgt3nY/tDbUo3?=
 =?us-ascii?Q?MwGYWbHQ+nTYR5lyffJvdK4F515rsbaCOFAcBQ9I1359iPFdIaPK3f6gr3ze?=
 =?us-ascii?Q?tE4Iml0LgWp4JfVxaYEPJ6mqKSN9NhMnMh723yq/w7vhuEb9fWpBO+rKUFzO?=
 =?us-ascii?Q?rRTzK/85z01MqfXreiOr0HvriqkSgaId5xppgvsmlf0YxlqnimhF+0vQ2OJL?=
 =?us-ascii?Q?hdRRwkLJOLE0kue8anrl8AUevhzS38Hjrh/yqB4xo9wUQux6E10wfnqhTSYV?=
 =?us-ascii?Q?7qYITuxNKeR/led1xJC6tU+QqZG73cNgWOPpwH/u3QEL4U/HgKCkouiQhC3U?=
 =?us-ascii?Q?wu+UcVgCC041b8E+gz03seZdmd9YJ1dlZO8YegIDqD7IiWNdEXJkXtPpP10O?=
 =?us-ascii?Q?u94sVns/u+NXakc0hduscw3Ui0a9+Y27igIqdz3pijuvKY39Qh72r0k8dIQj?=
 =?us-ascii?Q?0Ap3B+IpmRjwnLz8WtaYhJZctTaq7qfaMLjqRtnL6EAYx5sn3NbBymEVZFw/?=
 =?us-ascii?Q?AK0xYp2s1tjA2I2wb5hr1AJ4PA8hgIQcmnOtQcw1oKGJK//qkgY/x+WsL7CA?=
 =?us-ascii?Q?sH9+EFNY3RKAQ/OWxWR0a+aqgq0E/UQ8CPQN/SKWfZejTAjaTB0Z9n9uMR1a?=
 =?us-ascii?Q?c5RdDvDjRxtss5mf2OI75Ydy6lWS3SMnxt00SEadIY7ousY/AMWqrIhXV1W/?=
 =?us-ascii?Q?WZdCRLqIfd0vyqERNKTTT6UpVbDuvxhhLRzV0lYCNohi+vtizyDvLBap1n6x?=
 =?us-ascii?Q?2qyzhGPJHt/atHgytQUspgcmgBmEH0BBclQLzKDn96IIUFfNlAGB06W6MFD4?=
 =?us-ascii?Q?gQuATnHyTEAxV7y9ecLE6WhMq1SFMv5yhEDX373Pa1Gd34e7DC/ZZGAU2JWR?=
 =?us-ascii?Q?dzFCusQzc+8RbPRWZPWFqZDXcAXYZEtJt3r3o/lT3POtmvFEYHDEf3bYzR43?=
 =?us-ascii?Q?tWWXmeWv1ecn5mRWc2qHCM8g7BI0fqDojo+6V3p+Ye/aS0SpZnnal6Kkt2rS?=
 =?us-ascii?Q?QYBYRB2TST+j9D4Vcfvieh0ncOS3mmk76+nD+XqqtQm/U2RfA6cbSb3iafVH?=
 =?us-ascii?Q?JRW/sgF93i3OrmLO5gspXLaru8PWNGv9g8yetPO11YTF4skiK/p23oKFJB0c?=
 =?us-ascii?Q?COwLwTjSNwmNg5Z3pTlyhzyqgiswgdvMaY/nPox5DnmoRGjevUmRad7jCJic?=
 =?us-ascii?Q?yTv31vlMGWdNdXXKeoMdUVK9T/69TT2JQXRPOoIosm4nSnAeunIia/EpKUvj?=
 =?us-ascii?Q?Qi3zjG2dDFnwoXyaJ8NvaWKFPQjkuHyC1chVTFkxMKy9e2vg2SD/VixQpS/C?=
 =?us-ascii?Q?3916MMQWzUiauuiI1SrSBW6zDhwtrEeflDJ4Ub6ArJIufgCUMNk2GKLAwx/P?=
 =?us-ascii?Q?WtUoWtY6Y38c1liGQE7/DKaDWhlPelphWkA26GPrEN4HHaOtcRDYFYC2yEvV?=
 =?us-ascii?Q?W/Kj9tq5WTftSm9eO2CTWFYlglv5AZIA3ZqixybPK9mZskVei6OHnCvZuopp?=
 =?us-ascii?Q?v0K6DxfWagkHEdxsJe07jzE/OR9zihnUTBt7b9B2uyiIJ11RCFrPK8tJI7Rq?=
 =?us-ascii?Q?DHoU+LB2sFQS/rftR4YslwU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d76e84f-4999-4a9c-e948-08de205217e0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:10:09.6747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IA5fjjfQsZIHFVaNV7i494mRPub7yPYz9qYCxdNKBQyr1eMc5+iIf/cvrgXnfKTA8157/gLzh52u8dN1lzueB6Iywx6+JJ+NSDPvrslCnIYws7HAuQ+NRstsdFuR+/8u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8436

Add support for selecting the phyrst mux-state using the Linux mux
subsystem in the R-Car Gen3 USB2 PHY driver. This ensures correct hardware
initialization and integration with systems utilizing the mux-state device
tree property.

A temporary wrapper for optional muxes is introduced until native support
is available in the multiplexer subsystem.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes

v1->v2:
 - New patch

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 6424fce18705..50817bffff34 100644
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
@@ -948,11 +949,27 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
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
@@ -1019,6 +1036,23 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
+	mux_state = devm_mux_state_get_optional(dev, NULL);
+	if (IS_ERR(mux_state)) {
+		if (PTR_ERR(mux_state) == -EPROBE_DEFER)
+			return PTR_ERR(mux_state);
+		mux_state = NULL;
+	} else {
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


