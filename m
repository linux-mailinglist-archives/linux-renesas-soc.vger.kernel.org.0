Return-Path: <linux-renesas-soc+bounces-22551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F90BBB1D7A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:31:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 380C5188765E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E967313D42;
	Wed,  1 Oct 2025 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="F2ivKGT/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010071.outbound.protection.outlook.com [52.101.229.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E583126B8;
	Wed,  1 Oct 2025 21:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354158; cv=fail; b=ONNciaRNXD7YR1gA3gOBhQKHoSsaMK1DyASZIeZ+lYjLK3Shh9NINxjStrc9anX2k99Rpi8Oiuph3pAqINGPX0JViGzn+z+tXGjGpblCF92gBkklICeEGZ7XpeHrKC3e5iNGae2mZUcz6zExoViPDe22oroGbpvG6Z85rK9hnGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354158; c=relaxed/simple;
	bh=e7J2ycupG21vdcxwRZ6p0DJ9P50iMEHQlT9CXpT8vOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KtDhcXJq+RYpLftk4ApEAtxWb15h3dxTgiLVtrfZFCIriGwiFZCktNtdHrmkJaNVQm19CsEYEflFFZo/G0VvCLtZDpRKyQQdgj5h7dyGeLK2O+otwYAz17dGE6xa/avODIgkvUzzkM/ub3AMLZvVhe7g3+58vJAXCZbvNbNPPlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=F2ivKGT/; arc=fail smtp.client-ip=52.101.229.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RS4s9dbTOkxQ1piavjcvhAUyKyHIfYFPHqQVaZRnUFVNpXLkbGFgJVc/2qgZlb0I+anYSbyt5TUHLb0cpeezi/gfXvJZni2Z4x9mhslqODyMGAv0TUu9sTA2EykZzT9KCe6LmkniNBNLPS9p9VnxMuVRTBVI+5Z98caVvKPHKOfqEaVt9ehGu7cjelSkZULsa/VLD4ekwJ80Q2QJQnoRqM7Y/kxCnR1Nlcro1sKAtn0HRU+Mu1MacYZ/IdwCAyMrUygWF4JQgmD3Wru7CIWmU6C59UAB7sYd9QDihtcBNYs+2Lmlj2TWIJqfapN6BHVXTCOSBqDF5d+vQSqrQiv+/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGWr9RPqJZXcFBCG+KopARg/41QtAMGlSuS4911ViX4=;
 b=yGts8TOEBeXAOdjFV3DpPlh6MUzmgpCMfzOX/ogzL6u6DMjdHzuDGRK94pvUEL+dl6NCtQJ61oSE3C+DbkASTaF4+Y9Qtd98wE3fmlkwqGLRnf9jGniT6cxBTaa2C7Guo/zFE8dEjoDIGpYUb4kDb7AvRSYLujeGAePlH+yg/SduNwljGgNyQpPgLvp/0qFd2PbTwcqge/iaj6cHMIjkDWbhz4h+3fLPRdpQB+r9LYnJ+bhHBnebFFuka3V9fPVDlMQLkuCzMrmnxbwV3fRPiQd5hzvwet2e254KqiBxqDFYhunywINm93MwUFZ+VVnUp8xPPY+Fb9itss+FLgpqLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGWr9RPqJZXcFBCG+KopARg/41QtAMGlSuS4911ViX4=;
 b=F2ivKGT/o44qcqWjGRRnpD6B4zm9URj0eKfLeV7frLkR2oDBsUy8bwHgCrVn3sfpSxq2SWr8dt81lXdKfWOUx+lrAzIyHdNN4Xtth8jIFHRtmFoObAkD81cmZds3RfsG51Ql0UKhb/WKaXLAGgKQJkk/zuNOObsIrO/kuNl8Zu0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB13012.jpnprd01.prod.outlook.com (2603:1096:405:1dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Wed, 1 Oct
 2025 21:29:14 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:29:14 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 15/18] arm64: dts: renesas: r9a09g057: Add USB2.0 PHY VBUS internal regulator node
Date: Wed,  1 Oct 2025 23:26:59 +0200
Message-ID: <20251001212709.579080-16-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB13012:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5ffff7-35de-4f7e-6f64-08de013191b7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9LtcaZW454w9YuuN4yp2xlt3SKG8/B0YI6IBsRBbZagAAtHHYCRLFCKIwUG7?=
 =?us-ascii?Q?qDIk844VHRgb8pGsPxxLP5YfWtpzm536P/jIzldgz5fLMmUR5Vch9dvpRAuH?=
 =?us-ascii?Q?p9biC+1spShNMT6v7h2QDhsUJ9CF0QEY9u6WVpRUpdTvaJE4A8TgW+I/Abcl?=
 =?us-ascii?Q?GTZe+k1JnXJz33YLUMLhncrjOJ1F122yLfbhEkG5O73CEwciWebPsnRMZGw2?=
 =?us-ascii?Q?CJX7kpkQAEuXG+9+Px2DINpeZ7YhLU4OfTLq4PkHpW79K9SO+bNtXJ1R4fmG?=
 =?us-ascii?Q?SFM4bq8LZt2jFdoLhhUwfgWO33KRdCmVxSJlk+Cc1F+z5WfDqgRORQIpU4xP?=
 =?us-ascii?Q?K1s3sO1DpZd1+YtmZMe+dL7DAAkagc4gBWXly7ZijKEPIUV2oVFj9khbneh5?=
 =?us-ascii?Q?wDFGlX1OBJhwN9LeYmSXgOOmjefBwIs7A33N7yWdS5x9BDHgoMJVVxx8eC3d?=
 =?us-ascii?Q?VDAvVgVLORALArqf1tqbMmxCRElWr7G8xBkcp2+HpF8aounQDwJmTUzyZWSP?=
 =?us-ascii?Q?GWfmRqHmTuD+xXHM2nVNx7AdyzouW257DMG+VopKDiIwbfy6vs9++bQD0Iun?=
 =?us-ascii?Q?DhZkjmIVjiI3ClIyo7u68jD3bimrbcRGr038fpxDhj/EbifcqIqnrRBGJ3lu?=
 =?us-ascii?Q?2knBQaiuaLVVieN68NH0tc9T3QeFilrV4/Z8FfbtEpaJ0VQbIPTaCSrl3SLC?=
 =?us-ascii?Q?6vNGclc6NgUIJBxrxF9Klggl3HBXgvQHe1OXKzDTAIsm8lU+um/j2n68evU2?=
 =?us-ascii?Q?lkpCWTQvQ7UatoGfQqck1TXTEU6iqeufqEwWmC4hNva+grxd7RdLyUB9Qk0n?=
 =?us-ascii?Q?UQ1VUTJ+QYAKeo0/PZ2DFib9J6ZR587/cQZBGc3RrBceLoOZppC4vowspsrZ?=
 =?us-ascii?Q?7sWxs5Piju6DZOVbz9oFlYBHwgxKGbET/Wk+bHDaD5OlxzhHblHj6aK5QfN5?=
 =?us-ascii?Q?eOozvBXVsfRYV5ZbgIvGhJLQk3Lbo5+huVgsbyyCFYG/wmz+ghuSFs/LKWC5?=
 =?us-ascii?Q?sZwxcARWgDRNiDDx5RkmaKRzr5BX8w+G1MkrwcRaFgIC3L8ITyxcSCWkfzfu?=
 =?us-ascii?Q?ezfMEfoU07RgKLMVITM960RXNQRXRTyUQZXLEAOs8wXGYebHkxcT89YDeNEn?=
 =?us-ascii?Q?G5a3ZmgR5bzsCKPwlNvCbNoDOgDr3lIDUZw6QUcxJthimmRpZ9sCIqWppmCs?=
 =?us-ascii?Q?mOS8/WEQowPyIbf6BDEByjPcAsZH7lOCELGJo/+eiQ/I5QS1hm1xBJcuwmZ+?=
 =?us-ascii?Q?yO1FTMKizh+zfTbkeBenQuCj+2uiY+FmDKdcXT+dFh3mJO1qtgn4VYVdEe2z?=
 =?us-ascii?Q?Q8fYZHsEWiwtowzs+0lJh+NwKBBHwzf2vYjQ2LmSuc5Gyax5Q/NWPnVBP8X0?=
 =?us-ascii?Q?ogxGQP/YovmZwYu7aHVTjGfQYPVklsdA/AsQVAxkpJyoGJ94bRoSG3CIGeWR?=
 =?us-ascii?Q?9nlbQMedb5giwugbFdAVfVEfumZ2JNQ357nwGDEUIKM6CLlEmJ5ReEYm6uXN?=
 =?us-ascii?Q?txV2KKzUnsE46O+W0bfJfOyhiCwUjHBp8Kal?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x2zpkAHRRhqvSoX+6QyZDqsDXsUzmWodsclWUKhApWTnYXp/HXuA5IAJEjZS?=
 =?us-ascii?Q?/jb4CYf/IWaf+JjOyEL44h0GX6l92lvUf1KzMS+skRahdSrql3uiaHz27ev3?=
 =?us-ascii?Q?jYlmsavXTu9CoN6vJumycSsOSX5BgkpH7DTjQh/II4io2XbVcQcWWWz3jppV?=
 =?us-ascii?Q?c7byOn+RqnJdrQ1j6PQaa0LIUAN3+dO9PlrHmmwQTJF2UCYetwoEe0tF5KSR?=
 =?us-ascii?Q?R3xl7djX/zG0VKy9e69IXClBcZK5wUwVFPiMPFaC7AniBNWXLA7/7JoS473L?=
 =?us-ascii?Q?JSupmSE1VELXjfk1uXyyAcMQ011k25HTnvfNBRc+fupcQ1bphTcWN7NtP8yi?=
 =?us-ascii?Q?1B6RjQmdEdcADjaWtINAINRdvbEqbS4Z1PjH3XzxyFFWi7rbZ1ptn1vDooEz?=
 =?us-ascii?Q?d+TLuFjg7AYgG6th/ZKmBxJfg6Ws7jlST9AmojC9SVw/V7mC+lq5rv1ZhQ5b?=
 =?us-ascii?Q?voJWbPml9fI+w7P+c4USbeGKHbysiIvnSurWgdI+KhQeAnktFw9BpNd5xa+c?=
 =?us-ascii?Q?WpaocZTrcEeBTfW7P0vda+ZeNQyn+uFOQz0/1UrxqmsPcj6pJVpV9OpKthwZ?=
 =?us-ascii?Q?YZ7bVibwzLEl97JqO9DKxXQv/3SewhAiFPS6WHkpvqjkIfp8FsQhWxHjL2ND?=
 =?us-ascii?Q?1yie2QHEG02x33wLvfu/eN2nJEDwPiIlSDDa0luTvv7j0D0jCE2GnBI4/QKD?=
 =?us-ascii?Q?6wZboAZy7+lbbFzVIOU8uo1co5reNKVwYMSRU1+FmMDutp7d+CYqYHmH14qj?=
 =?us-ascii?Q?JJPfMX907Ybk0kHTHeKJmXN1dZrs7+EWbJpm0S2BhlSNEmWxBy9z9T4tamnf?=
 =?us-ascii?Q?Fih33TZhBvqAhkK3WBRSl67jFkUiFUGIqjPAWLebud4uRBAqVSs+NWJAU5D2?=
 =?us-ascii?Q?ScoMSUbpg5fZ6Omjc4KRAIjzvq3VRUZ38FuMOC3MDe/KXGJWuE8nmw5c/yVu?=
 =?us-ascii?Q?RW0gzYWgVONPLNt2RfCiJ+JVvnMa0nUb/gkUsJ5SCyYNpsCvanDAckp2Js3c?=
 =?us-ascii?Q?Hz24iQ/F639cGBhXtho0j6SbWFzQU4PizICvDPQ3rArmnA2M7p4d3xxzIvez?=
 =?us-ascii?Q?llL4GUzRnjQSitfxUa7OQAUeobRW20RexGo+IJdPSimJ/T5C+Iya9agj3Byn?=
 =?us-ascii?Q?f14ieY4K3lWz3nnC10MKZ6MW64zxK1Z7nazahO5xuk58RtDqBKlqrBcBnqa9?=
 =?us-ascii?Q?Eg8y1xWn6fArRADTLQxYNB2dBL2RJg30Gh0c+cSgtovS6USyc+qrENs7Rvjx?=
 =?us-ascii?Q?0vk2d4Ix5fm24LQBnl2En72Ng0db8GHcRUiOsdQf9aUWG9RhzAgzaHU/eqxL?=
 =?us-ascii?Q?4UXydmVzfbi7PNHnRPonIZ+2SKwQ+3hEQ19mlTxZWxrT+Snh4O8F5hnWfv8A?=
 =?us-ascii?Q?6Siy2fCevc7fUOUsMfi31yaA0lIX15+HDHApO6U9yY3fH2KSWRyZOg/qCtHs?=
 =?us-ascii?Q?aavlcqBzGOh+8qxOlZ08Vn3778txVN1xpYYHvn8XO3gJ/S/ESuqNucBfXgcN?=
 =?us-ascii?Q?FQRHhSEJ/KvAC5mCtYIs3bABQ2+Q61SmhR2eraB5uNJWk35i3aluGY2VzCUi?=
 =?us-ascii?Q?3MtJo5+B22GWuietd7ZGe5GjU+76FmFuc3ky6kzwjdNAHjI6HAbUWMQtL+4J?=
 =?us-ascii?Q?UjBFo9mDRiZXMrRMNcUIiyg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5ffff7-35de-4f7e-6f64-08de013191b7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:29:14.6797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+o6QeT+zBNuK1SUyLVppDxefVOBT0YGej3dVkDn6SKAYCH1qKGGPBGjpGCnDRhws6Jn5a0il2HP0YP/5mDh4Yx87a3E7xOeqfM/HS7bQkiG0e/3KA2bYigEHZtvzoRW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13012

USB2.0 PHY of the RZ/V2H(P) SoC can drive VBUS line via the VBOUT bit of
the VBCTRL register.

Add VBUS regulator nodes (usb2_phy0_vbus_otg) under the usb2_phy0
nodes to describe this hw functionality.

This enables proper management of VBUS for USB2.0 OTG devices and ensures
compliance with hardware requirements.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 630f7a98df38..73b7d6cc2db0 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -985,6 +985,12 @@ usb2_phy0: usb-phy@15800200 {
 			#phy-cells = <1>;
 			power-domains = <&cpg>;
 			status = "disabled";
+
+			usb2_phy0_vbus_otg: vbus-regulator {
+				regulator-name = "USB2PHY0-VBUS-OTG";
+				regulator-boot-on;
+				status = "disabled";
+			};
 		};
 
 		usb2_phy1: usb-phy@15810200 {
-- 
2.43.0


