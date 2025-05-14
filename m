Return-Path: <linux-renesas-soc+bounces-17114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2BFAB7142
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 18:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D4D58C49BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 16:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C792820B3;
	Wed, 14 May 2025 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IS5O3Vta"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011031.outbound.protection.outlook.com [40.107.74.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F53228151A;
	Wed, 14 May 2025 16:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239916; cv=fail; b=BHLzsxgG2y/k4abAyB6xbMW/CXwwxjgGxnZuJBSk/zmGu9iZ1zpFJHx1yMgu9a/E4sT3D4t3mtfWmFyCKAOGILePrDgebDrH/i44dnYTFB0eFiL7NYubrW1usvAhfegxb/HZSnl7+2fxWcwNLcvHo1DCqpkAKVmoSt5LRERw+I0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239916; c=relaxed/simple;
	bh=/rR2PwEm9qG5Mv9K8UShw3jIHCHEfbrrNkT6mM7aewM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mK0Os9lS2ISHITCQwRrzhWMEgfcL5wV56Lq82VvgSDQzCplDYnHzLIUbWXV7e1KxgotAaxkijyOOj50WDsUYvG/kuEn9iTdOKkyu9838WFzcMkqbAAhOBHx/0fz3EgxeAvHKfC/XIRU5c1roIXZboxYqXcNF2GFK7PBToYVCAR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=IS5O3Vta; arc=fail smtp.client-ip=40.107.74.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cH6DlErMJ+PmWBtZ+q55CUXIXD39zehbEe6g0qKNrlKSfyUNBpJoiHQxJr25MphYyxifEsSu4wloPgxtADttfFJLHgjLpI0kbpOqZLmUbIFzaPDgEb4cIdy7OeYvN8ktldka6iKJkpBznGdyRa3E38oa40nVC9eR05bAQRUVesRZToXRrwskwV59twIlQX25rPa/38OPU6iwybof+sjqH5QSAFgQa7bysUrmI6L3Uesc1IEaBq58KmHud99bfj7QA/YpK2pSNxWOwsJyETnl+TogkldwRurYDhvfBWVg2ZilZzxbr35/BgOpkXUV3kP96DxmWCkN6WP8i1G1ZmN5NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ticJbjYZ9dWAgRc9g2Gk4iFF24u9Qz1GTpSE6D+fxu4=;
 b=xj1rHVW4KmEWYiUzwjwwYTAJzSvNUQ/WIK8aVNh+vm7YaWkf+55JtEOCFCgqeJvVcR67Nd00A6ZugMWwPbEN2gZPOVwcyr7B8giISM93BxYxw8+t4FKEDUlgRwaQ0VZUV/4l4rPuGbjpMd8gRBUikdoosLbgZTbzuQpG5d/21JLdaTP8E6xk+TgbJX4Jh/x+ccZjPD6x/bqbLHvUC0SqCBwDe8QBJWzIgDPmvhmlEbRKo4yQxhYixwtp/Jb5MO9vwxo1s4BPSBR2ZcGW/Ko+W1cWxftqVmVxocAp1vNu6JVHgQsVPDCkO3TzKWZtMY/Y/sTdnDDM50JWM4zGfi1ssw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ticJbjYZ9dWAgRc9g2Gk4iFF24u9Qz1GTpSE6D+fxu4=;
 b=IS5O3Vtar7V0TLHAv7AhsKbHHqY+fJZ+pYNn7nhid8DWZU194lngP19vg5uC8B9wHhh7Lts873NlBwciFDGe7hGa0DLFQYBkpR4dL+UCDpqQ/91+kBsTWCNkl0LkhkxfxikvgSP9Du/tL66PnNx2BoLvEIhhfMeyj6SBQYRjBAw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYWPR01MB10520.jpnprd01.prod.outlook.com (2603:1096:400:29f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Wed, 14 May
 2025 16:25:12 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8722.031; Wed, 14 May 2025
 16:25:12 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable CRU, CSI support
Date: Wed, 14 May 2025 18:24:20 +0200
Message-ID: <20250514162422.910114-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250514162422.910114-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::8) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYWPR01MB10520:EE_
X-MS-Office365-Filtering-Correlation-Id: cb695f87-b949-4140-609a-08dd9303e6e4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ggGKGXQDhDJDEFKFUHVOxNSbaF9xbRZIMlNieJxwDsz2tvfmBCLz6dXo1cFP?=
 =?us-ascii?Q?kh7nyIs6YT4Gmo4x25ghfEzwQLU4wb/G4glKkDw5Yh8oe59DjX95FBzj3lNk?=
 =?us-ascii?Q?SokR/Nn2b/vhMjHuInYRQPrkUoRfjCOzG5fOaOujp+0hfeKGIrG6uJhZ8kN/?=
 =?us-ascii?Q?kEudHsO1pNWOUIrcoRYKvFCqtOBAXtbyflU8ryTb8/pp7aCHoowxKlkuUet4?=
 =?us-ascii?Q?fJG0qz74HnBcqKkZldkQpSoQN8cFtsJJBlPwOO+3YEUxatj2NVymhf79QtBE?=
 =?us-ascii?Q?CSWa+s4u8+Dsz6X4vFZ6nBpKqkFh7ULs/j4J4j85i3UOyx6rZIEHW+uv+Lir?=
 =?us-ascii?Q?DB4OLlqzG+nfTNvtsVtLuwVyEvPKs/fioF9vkUoYr1C+kQbwZpHUVB0A9X/e?=
 =?us-ascii?Q?VuhDuDRiURQYhhYl9/wne1hCEwKSWVV74NgVELLq40DCjqS0yyGCMFYhg5Jm?=
 =?us-ascii?Q?SE68DtMYFzjID6vCQCtJKxD1op16P8Zlo44n3TGZk41bMjgXf4AQWJU2OZeO?=
 =?us-ascii?Q?vD8DujTg3dpjw5qUBu3765hNg07rKbiPPJEyGAvMjI3UDNNVqqFjWPKQ8i08?=
 =?us-ascii?Q?4IYrTOxPfwGLCwXCN3bgRz0eNE1SDGaURP6ZculHibBzLDFQXR0lS1+mB4V+?=
 =?us-ascii?Q?WNpayQQZWq2PeyYJoKqHN0qMv/cKGVud1iGhq6+yhnjDrZFz1FPDiIbMe9gY?=
 =?us-ascii?Q?rvaSx4m8+FCJ3rteEARJQo4tixBWWdT/19bQCD0NiCuEO+HvEQf9GUOrak+Q?=
 =?us-ascii?Q?WP5LsWQ8DJZ+oYVI07+tseD62VByExm6G7vzzjrVYAltL0qmQIrQj2PG/M+n?=
 =?us-ascii?Q?ICjbi23wFQbFufv9zP1QsP4F23C2DWTPWLIVgen4Cj52W6c5cCqptdQNCwyV?=
 =?us-ascii?Q?5UTVscd2eGOSXO0TxB4i2PldBzWHwbZzTidZC1/W2uXQDogtu8d1TYElRfjG?=
 =?us-ascii?Q?00/o87o6p/QGvsmkSJF4FVqWsZTHEYXJ5JQZ4JVsTZKP6dHdFCBC86KMzJzG?=
 =?us-ascii?Q?vgS6JTFlsaX1dcpBIJiY5xiMFEtSb2ltN0X/e205VNAcajaUbFahVtNWMyu9?=
 =?us-ascii?Q?pfgcFZzcp3QBYTZAg3czryyVSaCeuv3SZOAue9peTMPPHMy5WcXy1MdOHA2U?=
 =?us-ascii?Q?MBMR7xCwf7nXrXwZ+Rv/UeYTcswSurudGtiWKzdcpaUTDG7nI+2SCwYMZMsu?=
 =?us-ascii?Q?WHzfFs6iFerXmYDDt7tlvqFGurZtyBhyPtNJjZr2327rd6ypr5ad8egbPfLu?=
 =?us-ascii?Q?tEQu7w8KwKVNkLfWfCJs6nvj8YskvfCV52wC/sBCc6GOavpniw2QwEmxoUyw?=
 =?us-ascii?Q?Nn7ALwRoTcnq+SuV6M+jNOlfoEFjQX2SuagpImhKea9hxCQxx6kmtZuT4mru?=
 =?us-ascii?Q?tjgQRfkbyH/v2k6SYpJ/ZmlsidXgGM4SMPP7iLLn9UD9A8nfDFLrhvjVQGNC?=
 =?us-ascii?Q?Rlkba9qCD7F66D02P1aup0kX8O3U7xbbgMBkhH0HHAxV1ObvefiRwg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YOsF2l9afWl6NnTxYrUlTP5Crb/CqGCJOxnF64Li3kFbXCS3tGYMFQ1lvPqa?=
 =?us-ascii?Q?uIuTUQoNQyp4aGqDhPTNYJQtTju41W+Sldx0AHIL2VHa6tdsB3egkLAYPdxH?=
 =?us-ascii?Q?QWydnHdDYDdoB4/aFt6s87aIzEJVJTytQ9Gjl6Ziy5rc5nb9CxiFy9L48IcW?=
 =?us-ascii?Q?KHdEDY5LfvXGn+qKFOl+0pcy6BZCENN5NqrJsYGi3JZtnRZNb9e71OlBj8Zf?=
 =?us-ascii?Q?Nu2DrYzHjAi72sLJm8qUs0qJ+j4qcCMOQwAX/KeWMF48fZZItZf2Jb2EC3tM?=
 =?us-ascii?Q?DZ1Hd0RBNIO9fxwT6w30sL51/7cjzZFz6cQGl9vsX6X5cjCcuTK6e2+n4xtq?=
 =?us-ascii?Q?e6jLrwIElfd0S7BaCcYuWNijbuFmqTlRPuVXAgi5ED4dz32smvbc7kV2Ph6a?=
 =?us-ascii?Q?1BufOkI3Z1WH24DsogMSjET336qbWDyBhhBBuzY8DqVqwp0LgdMf9W4HbyX0?=
 =?us-ascii?Q?1gMU5BT+owU1lgWdtDnoS/qxnqK4CMueAcuWsESNc47XqY816fKr9weERR58?=
 =?us-ascii?Q?roz9cq/4S+6E6eUNFjS1Ir3RDvNDCCURKlQn3s/23j1qAC+CgHggBrK4gvzY?=
 =?us-ascii?Q?ETJiTIgz4o4fhhoWGrSHiZPLZ5zwbZdDPEN/KqiECWH7nmtLUR0BtyUM2nuc?=
 =?us-ascii?Q?o1h7y7WyaQ5V3xDoyeYj8hJAc1aoLEHv/BlGnQ/LU4UhgBP1PxZX4UQl+1A0?=
 =?us-ascii?Q?3wa3fTpUU2Jxqzmyle6DCqibiGsIr9iVv9oEY9MKFOuDSrKm1Wup4lNf8iiC?=
 =?us-ascii?Q?aJaAiTJvsHD7PTzOnQwKvm/L1MlMyYnrw3bN55rb+uWHDXElRyUO5OD4/KUn?=
 =?us-ascii?Q?G2o77ahsIsLT43tFzdAW5oiRRcC2GzwMBzPSVOvm0iaJc3AViFjvqKoLZQAM?=
 =?us-ascii?Q?2JB8nnWI3jYWcdDboq423X9PG7GIqe6HXw9HYwDWv5SpK0hVJVQRs+gIxSIW?=
 =?us-ascii?Q?zzlQr0fzOSLuXJGp3xV1ElXmDfwuZpS+RDckdX/Ct2H0Y7DrH3u71ygUcjk1?=
 =?us-ascii?Q?XK3IJIQv9xdXEe2WI2wg7RcssqOzm/F24ptvOMD/uIWEpKemwiuijgaqjNxk?=
 =?us-ascii?Q?Xlj3LA5+H6pRHnLYThxCipH9QkLaW5TS1pffYBVqA60aD/rWtGtxb6lKKv3L?=
 =?us-ascii?Q?W8Ct/6QuG1H2ufKP0d/evMNH6HJC5iDZ6H3WveYlR24LcxXTJnTKqeDoPiRs?=
 =?us-ascii?Q?WpyZHi4UT/2IoQzo6sG9j7Gnet7BuUNv+stbVXIkVVei/DgBwmT/Gsx1UATl?=
 =?us-ascii?Q?EtfQ449uUm5kowrTdUwDudLBC3OLS6Uj2ARnjvf8DEPWS36BA7xhd+gwPNre?=
 =?us-ascii?Q?VEKDuU/+76Evo2pjJSont0V9bpbFD0JugaZUNVouIKbYOBGlImrMQtsxWqLW?=
 =?us-ascii?Q?XE3WNIM/q4RKfZ4tkTYYxmWvsa3S+NZbAYQKUpZaAkco2mMdm3CNBymfsR5g?=
 =?us-ascii?Q?48UqlGVQJDmkpgz0FMzyEEET59rP4TwyrwFmRdTfW4xF4VgzbFHwe3n6Qthq?=
 =?us-ascii?Q?EI1+g+wju0VTT6uiaD2vQviHkuBzP7/7aP64bbfKNkiq9zrCdLje0cCJK8OT?=
 =?us-ascii?Q?CfghGqMg8Cmkp7eQzynofJ/lURrB7/Nhbs8tzEl7e+CURxc3Jcc+1KYAebCx?=
 =?us-ascii?Q?wLPb9moTid3e3KqkWcnSIJk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb695f87-b949-4140-609a-08dd9303e6e4
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 16:25:12.7754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9QRpBKWGP29haNduj/OlOTdWii4J9IVnF48x4aUnimwVUfYXUiGj9tqPJH8yYvXg26+nJRdlRQURRVccFBiyzkmP2Tt43BllvJK172WyUuRnA1ufB3kR3poY9/N6voIl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10520

Enable CRU, I2C0 and CSI on RZ/G3E SMARC EVK and tie the CSI to the
OV5645 sensor using Device Tree overlay. RZ/G3E SMARK EVK is a RZ/G2L
alike EVKs then reuse rz-smarc-cru-csi-ov5645.dtsi.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +++
 .../r9a09g047e57-smarc-cru-csi-ov5645.dtso    | 21 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index b24dddee3827..6aa779bac9f0 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -155,6 +155,9 @@ dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc-pmod1-type-3a.dtb
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc.dtb
+dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc-cru-csi-ov5645.dtbo
+r9a09g047e57-smarc-cru-csi-ov5645-dtbs := r9a09g047e57-smarc.dtb r9a09g047e57-smarc-cru-csi-ov5645.dtbo
+dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc-cru-csi-ov5645.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtso b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtso
new file mode 100644
index 000000000000..0f18f68f8120
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtso
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree overlay for the RZ/G3E SMARC EVK with OV5645 camera
+ * connected to CSI and CRU enabled.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
+
+#define OV5645_PARENT_I2C i2c0
+#include "rz-smarc-cru-csi-ov5645.dtsi"
+
+&ov5645 {
+	enable-gpios = <&pinctrl RZG3E_GPIO(D, 6) GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&pinctrl RZG3E_GPIO(D, 7) GPIO_ACTIVE_LOW>;
+};
-- 
2.43.0


