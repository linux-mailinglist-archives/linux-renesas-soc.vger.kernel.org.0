Return-Path: <linux-renesas-soc+bounces-24169-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 845A5C366CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0834034F48C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01390337BB2;
	Wed,  5 Nov 2025 15:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ihaegy3r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011039.outbound.protection.outlook.com [40.107.74.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7D3338599;
	Wed,  5 Nov 2025 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357322; cv=fail; b=nvQKQRqFmwyPKhl0ArAj2Epc93vLxXhXQ30EaSeZOMgYW838VnY0PnDrgRviKDsuAf883BAS5HXjSv+xuS4aGfywrwGI0v+MdL+9mB6JPyto64uN/K5K1lIXMggxjD9s6fMeRStFmAki9y3j424gfH7CEMPshY7TVedIYXv+Xao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357322; c=relaxed/simple;
	bh=hU4iOcRObAm1Qfw13298Nky2RBWk3/Kbce8pSM3IAWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lg3cChJm14Q7Zwsc2bMczVVsICdDVNBvE6IUj1g9BXIgKPy5XgYzrErv8YZuGsw6pCztkXTeVvJJWX62tsynWpHmypWnC6A5FyNveTgaj3EQ+pFFW0/PnvpSD0inYdJUOA5U+S79O6WZksbBtyRS2X/UsQ8UNgZgE6++YAd6W/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ihaegy3r; arc=fail smtp.client-ip=40.107.74.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RI3otMIfYHiw/x0BF24In85HyHQ4KGly5ahg71USt+IdMMYNmzsUB+JWu7+d3RcGZvnBZTvN0BBdByjAy4gYLfMtXOImW1LfEl9s4w1oivHkn0gWpOwR0zxYdnjW317ErcgE9y5SPotUzkp1AUVSCwuoZvLcg+d6EJKH7YAd9VNQl4nVCSIZami9CHd2QbqaFmVBB0x1XquFkNEd6Ivj4NiJ/AkFVpS1zxoGM8JFC+1wn2ZrVFcWV0HzfF7+AgX+ffgO09mA1vefaOpBHQ+0+3jNdmHy1GLtrO8yL14uDO644ipG1L9/dVeYcQyfEGg1JmCqDO7qmD24g6j9dgcOmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pM0MAohpoB3tmqqy+skUqgfYorSq6a5xURf4XNPIJPA=;
 b=t+fImivk0a+bEwknP1Fc6ob2mlLfB/mbbUZ2ukcCtwgngBK7QechKagHu4q5M32OBsDtNlus2hnkm6TF40A4a3OTs7yWEQn+OkX04sA4JhiScLfc2q95pI+t+xz17jb+AqkvcEMxe9a50DIOyFUtK13txhTu73QiRlztVgETJSYBKO3isFlpJbg5o6h755NDzDAOlRlXDwLZh7VYVyU2eA2wCSfgmQwR75TzmHCu0wCI8BYSCN5QHpZyJD7HCIQlJ4d/EudeO4G81/pHC6qGMTvhvfmSEQVcal3Z7MRro9tbFnHg9AE8aM3Yc4WxqMNhZRskOqhmVxqlZYG36MClig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM0MAohpoB3tmqqy+skUqgfYorSq6a5xURf4XNPIJPA=;
 b=Ihaegy3rjuE98IWh/5+Vci6Ep7gLWpQpQSnec9m2GJdtt2OZSC8wYYlqPYYG382EgN+OVCa2S7UcTFkAUxpmwgtseGww5tH/BZyfZ9jedK+TYiVJ/6uiLOGFYA2PSv+8oZjaudkwbL/Wt9OYWisnrRmqabgAvFqswlH3peouoLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 15:41:58 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:41:58 +0000
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
Subject: [PATCH v2 16/21] arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal regulator node
Date: Wed,  5 Nov 2025 16:39:12 +0100
Message-ID: <c872162a7f3a3f70b69b4fa9c70837642bea06e9.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: 38f4a504-0031-4d75-7467-08de1c81db08
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nQElRpsjXnpgcqpZdGPS4j38KhJuTPx5GMAi8isAffoJ6B8aFT59ynQWSES9?=
 =?us-ascii?Q?3ntMrUJtBvbFGyEKOxrVdSFYN9o3HvxRI7qNxwDXH4zqBrfKHV3bO3noT0j2?=
 =?us-ascii?Q?5Uo/i8WIIKZE3G3cF/VneE5vqWOCgwqPegVRINJBJVwKcpIUFK0ht3gAnib0?=
 =?us-ascii?Q?t4MyceHQtuvjra3Om/fiNJuRgKRW9uld+MhgxLK8IE/caU11i3U7irImDfaI?=
 =?us-ascii?Q?/AoIr7r8jwOMkPSESl4n8Srxk/yVe94PWF+rcLRiWf/31DentlQvL87zGqQk?=
 =?us-ascii?Q?8oQEc1MUsuZP0pqDvSiEc33kfkN+dtHo3vnK/yvTNC4zk4QdhXTn0WWYQx8o?=
 =?us-ascii?Q?O9nETzgZX5QzZ5VckZt0z4i54hmAVP8xZrCQlgLyj1aa+uUGWgSBgyGJmfaw?=
 =?us-ascii?Q?fbQDVKci3mzdfzfbPA6JYGoON+PgYmwjV4DJG1ryKbM9NmQ4HyQsFkqsp/30?=
 =?us-ascii?Q?oXXawIc6NQOaKg1AEA7MV9HsU+JD+cTW08yKBIpTw9QuZhYppW5MTZcaSkj1?=
 =?us-ascii?Q?BHpdj6zZMBSq8/RIPYVKXmF8XccJaBlDjW4THL4P8/r0jhbSlXqgIDHztSqy?=
 =?us-ascii?Q?GnOyuaIbF8XXJvfJyJ9f1qRcurkg5f15glKuDOa5FitYard7LmhrMt/4FZaK?=
 =?us-ascii?Q?XG+/0SY7b7zLlEWj/NyiLb7GhvLsgsdEVx45TN2h3FBWECe5IkLFZb6EDAG7?=
 =?us-ascii?Q?aNMqQ5Z4W7wSrqL94SNy58B0Fxtb++iVYo4zIuRwbb88bQad6Hfh8KtfDBy2?=
 =?us-ascii?Q?qELGDutbSJqmFn6uyV4WlWr6mCZ3nsi+hfzvYBPYbYp8Q2aAam+bjbyYVDKV?=
 =?us-ascii?Q?flyzn/OrYY4DtW5hMV2WUzDoPtsFU9mOLW4vGX1TTecVuv4t1iA/hiP8R9KW?=
 =?us-ascii?Q?4aNIbqimn4gDwgBPMRmARl1xz3y89dzis2xNjAv+yeSeJOclE8H7tIipcXKk?=
 =?us-ascii?Q?96Ub2w42NI2i798epiZGy8LSge4WEc/gIGodIu/TWFAlMOxNodP/jMlqJezF?=
 =?us-ascii?Q?+XEkR6UnzkCyWZYciQGCUcGmSueLmRCCKuJW7abLWHPRSCgZe4TKrfVKPiHQ?=
 =?us-ascii?Q?o28HtXK2dNbtHGE0uKFZ4qsFSvON1k6KqMCbNpGNIoAa+lyyUntjQpNtK2GB?=
 =?us-ascii?Q?h1kLztb0xcES1Z9B8zUjyhVFaTE/DEJfoU/HBGNfT0eiRNaVWPaKBzoPqp5U?=
 =?us-ascii?Q?jZ04njjNQl53bAQ64mwyChsUrlp0x96Be2iYJ+pMgeLGNgPGbt1XjQU0vsCx?=
 =?us-ascii?Q?Vbd3qrWHOPL3sN7uqbxFquWihRJzrCyIb6eztnzmfZ/FBxuMaEKQhyqQipH8?=
 =?us-ascii?Q?zKKEAt/TctUk4rL8inEgRz9zCAp0ievwFWuD6VfjJNvoecNPMYtAddf1qMzX?=
 =?us-ascii?Q?TQ0krd39WZNn/DduDujSdYa4ipunAB1oe8zQW6jiGW6POonIwgLPXUet+uX6?=
 =?us-ascii?Q?tn6JH8JKPKA6HXAmn7L/tEMTDwDdfkQNUqxCGoeLN2sPg44SUhE7lXu+vUMH?=
 =?us-ascii?Q?5d637vORoKFsv0PyM41D2cHt8loju41qlwpf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nlLqKQOcqTN21aH76hEUAfPXefPS63vFqleK9x7JVUvzwUaYYPGOO/F0SJ/1?=
 =?us-ascii?Q?ifWhLQ+92lQdr6iNGMFTmoZ1HlAwNS0SJ95BymqWyakmQYYMxQVY6hZt9dQk?=
 =?us-ascii?Q?5au8Nqi9iyhhF4+09tFNRkoW3rPxqZoa/YSozmgXy1Ytz94JsYV83+d9hgcL?=
 =?us-ascii?Q?LfceBmu5+OjEqUGtqOfX4zTG5LcwjzjKENhyj4M1oxe31lqzyTMOwHvntU7A?=
 =?us-ascii?Q?2tCNO2lFovQrFj5t9fpkF3k5I29ZCWSguz2VtZ6xf1ma6FDknhA3yL2YcGbs?=
 =?us-ascii?Q?7AxjTcj4T3XKLhOQ0x4rp3k4+FAOe6FX99pzhUenUJPCcpa/WETuydXM1qB0?=
 =?us-ascii?Q?t3aE3LOa2pIs2j4NYhfGMD9ay7GFrpBK6WwExsZUfMqVMl2wZ9OCxgMQthcP?=
 =?us-ascii?Q?mzcPNIAMuVra0tGnBXmqg7DTmqJQCaNFSgB8td/83wE8/wKnwQOUYemDE6sP?=
 =?us-ascii?Q?1FAQjRkQiU1JIVSGMRa7dKsmThFLdYhW2bVO6fyBs8LDUFKl8l0LOxxtEbEp?=
 =?us-ascii?Q?1XiLVtG7vtSbCmU/uH6eNn/DJXz/R/bLr+B9fKASgfmlMLA0zjna/i7ZImYB?=
 =?us-ascii?Q?mW0R0jM2K0znoqENhboy6s9hCoKoaRGmbPY93ctTUFAqXbVL/8s+kv/AR49W?=
 =?us-ascii?Q?MF+v96vRV92vRTXJZ8koS3+Ydvit7utdiThtWme/lvElNqKkM2VHzp0Jk+VH?=
 =?us-ascii?Q?7i4svnjgqRp/ax/VSpvi7H4NNWKYJiZc6stj2pGrnhFNvSB3vu7qvaK/Vc9i?=
 =?us-ascii?Q?+tzPSgNiVnD+JKaHEM4H1xiDvdMmgPUdaDIFLJDLsV1cfGTGpJO5mrprYDNn?=
 =?us-ascii?Q?vvHoELQwoFPn68WecHqudsgpdeBgMkwH1OMLWleRMoi2wjoUN7ifTlgv1gQj?=
 =?us-ascii?Q?DwZq+oWnfcQA4K4/6iG90qwrSZ8XfLxEOopk+R8RdTZSUsQ91zrHE9KDyJyc?=
 =?us-ascii?Q?NvXb6EXjd5AI2pLOV4Y4RdicboGwj1Nj4zYpikWNTItEulPWuzEUZ32FdCGF?=
 =?us-ascii?Q?8SryIQfvOjS6rKpVjxWGTRfopyrIROkbWqtyQfTAswXyzGT59pKyNIoXon4j?=
 =?us-ascii?Q?UqSTzSixvTG9cw1SYoUt/DR2HalJTXafAgE7DvJekOZnTFboNby/vDyoZZbr?=
 =?us-ascii?Q?8Jy7kKtD1eGUeU6YmEmYPkD+Ddj695ody5wlPTmIZKz/TwZvOQFECpNLQHJ5?=
 =?us-ascii?Q?hb1ZXecqVpykm/KgDYfjY21SZhw4bYiH/wSZyOfNGHrzq8a/GdX9/FsEabrM?=
 =?us-ascii?Q?xBQJBxm8sFmVFRCgQNAZ3XjIQ8anatnHpsZH6BYTujP/wdatWCFcnqXxh4hO?=
 =?us-ascii?Q?X5P1N0m7veBBUY3I3I78L7xgpYL3MVY+r6Yo3/mqMLcf/k/ptm9yBWjbZ+ax?=
 =?us-ascii?Q?FbEvpiBPyU7tQ5ipIJeYb57SXiWoy8ZueMFQJFaam56njaaunQpRFXLybGcG?=
 =?us-ascii?Q?isxo2va9pMCQoML1wC08alQTgRftzamNeIthe5YGkBpiyATPcbJqtE04hRhu?=
 =?us-ascii?Q?g90zb3wXY6T4qIvuq8/pKvMt1Dp2kYQgSQuNV6/eg700+IEQOzi2KWa73UbC?=
 =?us-ascii?Q?znuJG/vFOAAL5VC/KvIkAy5Mgf6pAOxacjQR4i/WMj9Bd3/0yrjhgiNYYjPC?=
 =?us-ascii?Q?IrawXvkVtrUm+S6ihN0Y4Ro=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f4a504-0031-4d75-7467-08de1c81db08
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:41:58.8380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Abs+dtZ9yc7qmX106oEiL2xoXPN9Hq6APy7qoRXsLO7bQIUAjtEFdgKBpr91jANn1wPKAHuGzh2YUDCZvPuyEPFLicSZJdWhb433WHfALFNUSdI9ZwpqtEgZP9DKWP9q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

USB2.0 PHY of the RZ/V2N SoC can drive VBUS line via the VBOUT bit of
the VBCTRL register.

Add VBUS regulator nodes (usb2_phy0_vbus_otg) under the usb2_phy0
node to describe this hw functionality.

This enables proper management of VBUS for USB2.0 OTG devices and ensures
compliance with hardware requirements.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index fd2b72caeceb..c22721de7c23 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -665,6 +665,11 @@ usb2_phy0: usb-phy@15800200 {
 			power-domains = <&cpg>;
 			mux-states = <&usb20phyrst 1>;
 			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+				status = "disabled";
+			};
 		};
 
 		hsusb: usb@15820000 {
-- 
2.43.0


