Return-Path: <linux-renesas-soc+bounces-24386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 02068C467CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7BDEF348530
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F37F31195A;
	Mon, 10 Nov 2025 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QEyufRCY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011054.outbound.protection.outlook.com [40.107.74.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF1330F537;
	Mon, 10 Nov 2025 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776585; cv=fail; b=S+cxO2FMOasquGmnN1tDAiFAMjGY9aD1G1xgI4ss91wHZ3UCcHOwoNFjVB6F9158mQhaJQGggHXBBkxlKR56KBffYHlxJ5h2ryngyf5r23tK/xIcwUg/iSEFZ3kAI1x95GbEXwBt/Err+SYHqcKP8XREc/uGDfrNdWcZq+2ud94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776585; c=relaxed/simple;
	bh=0GZVc5tLsTzztwKPV3j4qjQ2NWUJqEWMXeOrlKfAY+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FofTsvxseGgJdAu9By/XPhxO+FVc15JbsbBaF+2N3wYPvzc1iPPerkKQlvAw5VBCDp0zwWi3WsZSn6LJDwF9Msst5jAOoeA4D+YWQF1iYaDn/NQYanl/CPIWuxs7a6BQkoRBu4Na9f64/meiuydqdTQDTu3JGAVAGb8sn5bDpRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QEyufRCY; arc=fail smtp.client-ip=40.107.74.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPA2o4/rCkSknEikDjQbQ8HOGUrLe9Es7xyy0b2RAFwtyBnC0Se82mwFdTUjQZKXa6LtiC1VUwgD+NFwA2jOklRs7tdo5HliU7mJTHrJnp4jSH6HY9XEbE3JxfDt0kSF2JnOag1R33gMcaHrV+vRgCzMcm8lzV/pX4leOqhYvOfPA+yCmAk043VlbusI7Ldp0vxn5q040SVJZkrjRkHrOVs4/6a9WzZ1+1x6DUWDxYDSvabavCkiO8tm9aA5EHIgrZ80m3IZoAph/2Bx5s3iUNEDVUzUKFXqespHbLwkp8KMomSpTs/cXkVE8vs3SGRjNzew8oiQa+YQg/mPXRXwWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXqpbm2eenTGsczj54OToLO13rKgdrXv5lFGSexSkXk=;
 b=wLXjRC2sAfdCWFq+SJ90zR8XQcnhoPxpKN7rLWPONnp4mda7EBCTlbdh5Qf2tFcqE/AX2wB4zaZxHRoIwyokyZ9Z5CC7ScPsRwlJ6/2lnnxuB139dZ2UREiUxFICrG3gCN0OUJu31U9z61NroRvEWQdVZVhSqcmTQ5NXLlmamvNWWmnl5de3n45uqZP5t6rslkR6/U26hsaxisuHKilWHYIGoCX/358TLRlUi9dvnLuCIOFCBRaDMRa6y4Ka74aK+nBsAjmBHnJZVKd7MOmebPbfQykZDgG7yL+oW4QmP3QqfTOoLvYpqIx6/jRXLDtRngbeffha3el1rTfH0Xvg9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXqpbm2eenTGsczj54OToLO13rKgdrXv5lFGSexSkXk=;
 b=QEyufRCYmL6n1dTFB/GXNpJ5upOiAvh/KZl4X0Or8KYpYYtBkUQoCIucak0jZ0l+bIShmv4KLWY1xvP27pEdf4SjVA6PSCnPRIP8h8DcwuCvt4qvjO0Gl39aahfQJYIyxJXMRkhwpEXXJe+fVKNU7GMQ4xFAk8OCo84pHLzG7os=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8436.jpnprd01.prod.outlook.com (2603:1096:604:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:09:40 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:09:40 +0000
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
Subject: [PATCH v3 06/21] reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
Date: Mon, 10 Nov 2025 13:08:06 +0100
Message-ID: <8413cf8bdf868db11c4e37d8aa9c5558d6753032.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: feabcfed-077e-4a4a-d515-08de20520667
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yV6smeT6b4pFJesNpzsBgXqQ89OXIJw30pKL/chnKU+ox8EdYJVzye/rOHsa?=
 =?us-ascii?Q?nbm2RuGjNZkVKRsQPMO2qHAFiBEsGViBrH4nzBuz20K2ZcO/AESA4yi67MZ9?=
 =?us-ascii?Q?phhSY+HSTliRREHF/+byrJMrds7VI0GYUiAHIb2EWHco7EdlKAT/OGk95Vde?=
 =?us-ascii?Q?KRDgUuhOV0PJKcegb6h6UcDVRfzm6P3VUrSqCbYVloXF/70ii2SvuNYZyaNT?=
 =?us-ascii?Q?j88G04eDJNWzJYSI7+1sFiC1/1GKR43oAlvlra7/sofpoaixCr89TqfASouZ?=
 =?us-ascii?Q?mnTStvzefOlVHsH6uO4TiaLfWuRTR45wAPZFu3SylYQiFPh+BJHXKzOME2f8?=
 =?us-ascii?Q?hOJXsYf6mt48VFv0LRD2b/z3yb+kapUTfmatLasWL4yFmls3+tkD2argpssT?=
 =?us-ascii?Q?bKrU+qPNSezZAcM7MJbhpXZ1xZ7Crba26R0v3wa1MZavBByxyHc9++iSccgk?=
 =?us-ascii?Q?gwL1BzvMkYCsmwmFgJwmZDft9wwM5eVCZaVUk/08wAQEKU2KAEECk0f15Umh?=
 =?us-ascii?Q?E0E7bmpITQ19MrKI1Wl2kWy3xWA2QY/LxInZLLzwIiRUsae+ujv0rMKAtYGh?=
 =?us-ascii?Q?FxKbdUQ/hX4t5K9tH8ZDtI4+MIQO/0fu37eFiSGAjxtKL4XSYiIpW5Jz5dyg?=
 =?us-ascii?Q?XMZHvZMw2UsToqSIUXsILOuXCxGZsMPaWaoSmg+stWNtvmJH5Kq9ihg49g9Y?=
 =?us-ascii?Q?fmASQgkmO9OVjnVjGrdDWitsM2jT7/QtEGD2n2CBgij4i9Otjw6lpA/n9adx?=
 =?us-ascii?Q?WEZSjkMCrryATSgf2LQcc0nK6EuIwWWSDqTRlVyqDR5r7tmuHE583tEt7VWb?=
 =?us-ascii?Q?i7vYytcVXGqb7rfaU84cS6GmtnBOmn+ajiADsPqJuCjnpvwFb+URkGDXrL7T?=
 =?us-ascii?Q?Zu2kPpN5ME9ExOk/DwOXx7DpCWNne4EYTBZPAL4YhAC7pihmqhT8HW2HL/s6?=
 =?us-ascii?Q?B2YB7DQ0H3Yro4uJv61CCtNZZSRARGCUhPANsCKS8tJgM2qvFFEwZQJemco7?=
 =?us-ascii?Q?cU+CiN+BFfTOvBPOzR8Zq+Twka2YJ7JDFEQovY1l3vHeneIWz5GnBQdvR+yz?=
 =?us-ascii?Q?Ns3FbQkQdoXukqqSqwmUnWCwkxZx9lMWTkq8v2CSgkjoAxlMHeyBXYvWvLoG?=
 =?us-ascii?Q?PJDNltsvO5alkJVcJHyKNZUlamq0h2BiPovGFgsIBCfa0YIOzOcz+4vKkCdJ?=
 =?us-ascii?Q?6hv0+FRb2daD2AQjHdO+vCj4axnuTlMQR1I9+CAd38Y50+6WRgYU1X0EYRXi?=
 =?us-ascii?Q?cZ7qit58Jk5OiSaHidsg/HOYKNcjC74qMigrmJD7r2Yh7Y7uxF7ehLzN8DNe?=
 =?us-ascii?Q?vs9saA0jeoaMGN5YNtz7Ejg6x68VDOvvRvPnevIeQ4OxKBnQSHHf+wWf9N6G?=
 =?us-ascii?Q?YX+0j6wMwFXn11eZJLZG2OEQyvoaV7DTzNcPPvyxWCIBhCr2VBsdR5lmL+d6?=
 =?us-ascii?Q?8gIJQsU8ngVg7xctP0n9yZIvN7z6DN7Uky6OuzQmog8Cwcx+dzYSC3jVofIn?=
 =?us-ascii?Q?wAe1eLJjZLGsaiLDx3NPn113gUZsH2gfc9Xr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Asz+wGehN0iPce+03VhjrwUQeBnZ32DqTnfgJNIBfoA3zfUM9J+QFW96Tf/l?=
 =?us-ascii?Q?SrP0uq067ho7TxcIXB3rF+d9pAGkoC2+5srKqE7BznfSg2OOZv8wjbDaTXXO?=
 =?us-ascii?Q?+D9kkQ6OrNW2YBIQ+NyVI3+6u7Y8KEAU/mPf7GYxr2FLEs3UDUCFhMv/Tzxu?=
 =?us-ascii?Q?uBpb2rhiggyoym3iNVKCcynb8GAXAh3/mRRd+tHPC64t0mpj66NZ4hMVyejG?=
 =?us-ascii?Q?s0sPVB+iJDzIPUTSWorCjm206hr5QhQajYZVtkWAQIYUFkE2wniUMMaQf/Wo?=
 =?us-ascii?Q?NMjK/j1QzRpDtfaBSlFvyzyvckYc+BP9G6pGB2U27dIX26pkpTryfWGqELWy?=
 =?us-ascii?Q?mZ+n9eMF0HWNLd9iZvlCO/lzoGw7SjQO7QaHw3r2FUhWmX7V7wYomaf3dHn0?=
 =?us-ascii?Q?8WS5u7PMU00h/eNxweT19fky3Mee+m99M6LfzqfDl1S4sDlcpTYxYYclWZz4?=
 =?us-ascii?Q?3EJWiBMVveOevSz4j/jLKPvfcwrys0BN5Rrg9xFmIpv8lc9EOgsJngWYRVT/?=
 =?us-ascii?Q?u7MtSukZuWuD3B1iGJ3IS1ip3lO5foSXK2mPsibKR05Uxw69i96yJfTSkizi?=
 =?us-ascii?Q?qMTUSku3wskKL/WNERLaohHRNagAfPFe9+fEh3Qt0x8ZH2dysEGCTjTYXvdi?=
 =?us-ascii?Q?v1expI8qsNqBfSTVrRIDuCqSwZWXcxQCBlguDaiH/HiXR3D46Hgns/NAN4SL?=
 =?us-ascii?Q?U1EUC0ZAtrejQmWLrhquc7O3Uc9sp1SjiYzuTRsl2VNyqfopvvDnbSqCRMu8?=
 =?us-ascii?Q?gNkRkOF2lcUpXWr6QqQGxQoZIhGdcfFdSqmrwGwaav9dvXpiKLJiO61URAak?=
 =?us-ascii?Q?9CAGQ9GgT5DEcIdaVw8c2T3TSLUHAm4eqiJ9E3v6iX4fVgw2RrRKD7JW7QRW?=
 =?us-ascii?Q?YFGj8wagT19mYugeKmr5FwnWzOnpaSi1saH6jlfWCnN9zoTXsul27DJD2uRv?=
 =?us-ascii?Q?STwOQL4jRugly5BOzy5CdOCzjD1n18rBnqdGwOxKyl86d103SO6apCNVJlkJ?=
 =?us-ascii?Q?VdsM/HDohGvPOO5IkRaF0Ge3kS34xLrdH1yVexCDNmgn3JqPxPb5FQ/hY9kf?=
 =?us-ascii?Q?ITI8N5QAjxqHM/+z/us6qQZMPyMfrTz0LUdYradkdw+ARSwQKVOkaY93Psif?=
 =?us-ascii?Q?fLpyM8BRDNSPuBh/x1ynSAdaDpzXQLvhaAGQ/NLLgxHg4/y5khv/yulo0oic?=
 =?us-ascii?Q?qZkn021Mg70CMrP8ilNfppQSO4paoTb+4sklH54YUxVuKLIUsoFA9qsYB5Pq?=
 =?us-ascii?Q?KQy6db/H1ubfJt5/0CHaTUWmkfrny7zT+WlGQ42ZwlLqSaXpHP74yLWw8Q4l?=
 =?us-ascii?Q?z8otI4GzVSGsNZwfuOQRpEUQ/27TMjka+LQs8H+UtVn0AmsVjt2YEsz16rP8?=
 =?us-ascii?Q?7j8xioMBblpXUFYc611oHeZCM5G8c8yxBATWofzVvhcjabbHzvSHLV2KhOl2?=
 =?us-ascii?Q?hFHRshFOjU3tkTy6iWVR45CPhbXhcxq4qnx9W8NO+WNbFfWHpI+dMg9YRvQQ?=
 =?us-ascii?Q?Dz9K63vnofzVRD7eeKtGX6W/QTxAiHqxC/VEBSoYiwwtxN7WQBtg9JumRiz3?=
 =?us-ascii?Q?v5t8ng9rSe3RRrmvjjEY8BY3XQaokGs+RMmJg1cN8LIpOlSNer3gwYWDRZM+?=
 =?us-ascii?Q?UOaX5kUvhjVhQ4y0FODhxPk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feabcfed-077e-4a4a-d515-08de20520667
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:09:40.5203
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h9E7+G37QVBI+/HWS7A0Q935Q/iIsFYXStIoGOd8hGIUcsHprHEthK2NhLAdM4h1MKF0HCCIsbWoPL07bfCYVAkfiFdgLoAcYCXLC0KAaxZY9ZH95vPP1lCRbCe9t7Zh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8436

The RZ/V2H USB2 PHY requires control of the VBUS selection line
(VBENCTL) through a mux controller described in the device tree as
"mux-controller". This change adds support for registering
vbus-sel-mux auxiliary driver during probe.

This enables proper management of USB2.0 VBUS source selection on
platforms using the RZ/V2H SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - Use __devm_auxiliary_device_create() to create the auxiliary device.

v1->v2:
 - New patch

 drivers/reset/Kconfig               |  1 +
 drivers/reset/reset-rzv2h-usb2phy.c | 44 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index e1ae624661f3..f54e216ca7f6 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -255,6 +255,7 @@ config RESET_RZG2L_USBPHY_CTRL
 config RESET_RZV2H_USB2PHY
 	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select AUXILIARY_BUS
 	help
 	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
 	  (and similar SoCs).
diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index 5bdd39274612..873191f30448 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -5,8 +5,10 @@
  * Copyright (C) 2025 Renesas Electronics Corporation
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
+#include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -14,6 +16,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
+#include <linux/reset/reset_rzv2h_usb2phy.h>
+
+static DEFINE_IDA(auxiliary_ids);
 
 struct rzv2h_usb2phy_regval {
 	u16 reg;
@@ -104,6 +109,41 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_ida_free(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	ida_free(&auxiliary_ids, adev->id);
+}
+
+static int rzv2h_usb2phy_reset_mux_register(struct device *dev,
+					    void __iomem *base,
+					    const char *mux_name)
+{
+	struct reset_rzv2h_usb2phy_adev *rdev;
+	struct auxiliary_device *adev;
+	int id;
+
+	rdev = devm_kzalloc(dev, sizeof(*rdev), GFP_KERNEL);
+	if (!rdev)
+		return -ENOMEM;
+
+	rdev->base = base;
+
+	id = ida_alloc(&auxiliary_ids, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	adev = __devm_auxiliary_device_create(dev, dev->driver->name,
+					      mux_name, rdev, id);
+	if (!adev) {
+		ida_free(&auxiliary_ids, id);
+		return -ENOMEM;
+	}
+
+	return devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_ida_free, adev);
+}
+
 static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
 {
 	pm_runtime_put(data);
@@ -162,6 +202,10 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "could not register reset controller\n");
 
+	error = rzv2h_usb2phy_reset_mux_register(dev, priv->base, "vbus-sel-mux");
+	if (error)
+		return dev_err_probe(dev, error, "could not register aux mux\n");
+
 	return 0;
 }
 
-- 
2.43.0


