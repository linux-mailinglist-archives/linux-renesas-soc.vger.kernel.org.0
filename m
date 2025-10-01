Return-Path: <linux-renesas-soc+bounces-22549-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0069ABB1D68
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C6437B075B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14766312815;
	Wed,  1 Oct 2025 21:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AJcBMiKv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010005.outbound.protection.outlook.com [52.101.229.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B21313287;
	Wed,  1 Oct 2025 21:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354147; cv=fail; b=rrFxaQy4QouzOHVnoxhsYFJl4N8fyAGvWJidz8QncCXut2A5oJ0IC9aB7mJMS/kRJJMhLy2//8MkJ8YQSj9+XZr46DgYcdglXyBfXi4hmaiixpvUgSl6c+4x0T7d6tl8Zl8T1nAEd3iY9paSws/p5UDIJ9oRDlGRB7LZ6MYfnAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354147; c=relaxed/simple;
	bh=ZXzi5x7pNhsX8UAemeHzPBzGvYsGbxO2QKzz759Izh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=os6Ue3QOJQkLYb99Np66XriVKljlXff6j5XNjYqnoxQ1bdmp0/jidyGfZXndRPWsUBvrT5Or+NN9Miv6jm/jSFWHNyWgg6k9rXIEAhoQwva7LsvVsb4VFKAve1dMEQY7SKXnf9KrAds8GkyOW89WIASzMhi/YsiCXdSVUkVMMsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AJcBMiKv; arc=fail smtp.client-ip=52.101.229.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7q+V8/163V8BdVCUsgMBTHmyviTDmRKgwS5IbXdZOwev0QUiL02MWHunjr2hLMU8DoIbC2MTifN3XpRLSwZrLomSejFStpgGGSs7uyUWdexILa38CStnXgBCRX4oK6dSCz3xup4Y4N6Jubht+JeHZzM3W+QoVZu4ir6/X2Mm5No/1//kAZhY/setI0RBrST4yIB2I2+cjRty9v0IIvNCj3fyngRjla2y0wFEVCsoGUakfpCMyOyws/ZMBMDRzhdBqjyQCA9tyF12FQdP/aY/ogPHV4e2zXzis8skZK+ptR0Xgkis68sP0ALMzTc2m05qy/Fd8OT7BfqZadF0bYsWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cO53aMnkgQD5feh6jXxCt1jLw2YGIAz7f52/c8etKSc=;
 b=iAJLJGogUX/garY+LPocdacMU0BsIRXnKlGzcLZ6mpaHiJEYjtL/hGvXJ2c8MATAcDZMWmnLybWdvJpPBiekrv5BxvSUG3v3SCP1OUZ7hM1LQl1M99pucSXX120c8RstXZwJx+jQkeuaxPrhSKOrm2a2cFOzenNczYH6J8HOouGrULBLWZ9uWfFKyVJ42DA5+G2FayNSWt0vligxDGSSa204HIz+1ibKclCmyzieh3522KrWl0lDXxnJS/rJureDz2zYpBqO8x5pepbjBe2KRmAjzA0mzB7lgXljhqtrZwgeScxVBI0w/2uMj5AcMzasRgBCVzwkuULjBkoWg0kGuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cO53aMnkgQD5feh6jXxCt1jLw2YGIAz7f52/c8etKSc=;
 b=AJcBMiKvLxr+iQd1MAsloGUcukQ+58v0+iX9nCWaf4i+rblmG9DrwwpqfxEHWVN5a8uQU0vQt3yxWwiTvUJSdsqVXMXs4V9VDgKcBcF5mPrIVZFabzqHYDmaY9eoJL9T+4AKbk4+eLv7ue+OmAJ62mdGCVhPVJFCo9XLLSBfJgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:29:02 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:29:02 +0000
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
Subject: [PATCH 13/18] arm64: dts: renesas: r9a09g056: Add USB2.0 PHY VBUS internal regulator node
Date: Wed,  1 Oct 2025 23:26:57 +0200
Message-ID: <20251001212709.579080-14-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b83625-3b7d-4606-106a-08de01318a93
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?083IqIecFlJR8AmnKSbhtC8U6m23Wt/qvu/mq8NsNhzfOkDrgivwRgRx+uJF?=
 =?us-ascii?Q?p/HnVrRLUAp43GtHaOe5Dl6XkqRt4vPTSph3P1s/qOqJHoNBCsHvuYzQxy69?=
 =?us-ascii?Q?jKk/oGRHmDWUSxzOOdCTVWWcx/ioZDsQwwOUtMzCiGUBvZpdZSFPh5NGILGw?=
 =?us-ascii?Q?+uyPUZbagMyv0zdM5AgTBdrP/pGQ8Kc/CD/GIiGGiIbeqsBuivv5x5GW0IHS?=
 =?us-ascii?Q?gZcBR7uJm7yLXyOpa5m56IyewMgDypwIw0EW11ImJO8RdKfwTsJGOhYsdVI5?=
 =?us-ascii?Q?CL3suX+8cltv81XMWyFKFzyNf2KzNazE7LKBAufC4Adk7vtcAchICrWV+JXw?=
 =?us-ascii?Q?UecMKxuu5Ug6Zet4ano7/voYDEJl3V1vssMpSa5Fj/GeiUuXYS5mNSCdEJhE?=
 =?us-ascii?Q?JqiuFb1ce9BdMxIDg9Eg3J5bqVilkAhWG2By+rCner1wodvGi46+5NnUuLgO?=
 =?us-ascii?Q?5SjFuMt5oifw4xbVPjtEOwr9bl8sYtcivA8tngKCSYbWDAgekv9lGweyo5So?=
 =?us-ascii?Q?9ymzKoMLmPH5dnccITg0WwpLl49tafv9qeiT6+8XJZJzuR9du6anZdLtHCnn?=
 =?us-ascii?Q?6lT+ktqMV2kK5TkbUKb6TEzUZtm24u8FPem6/N4Ao8cIcVP7U/DoioKphMSD?=
 =?us-ascii?Q?nRFHgc9VplGdQPChSVMMUjTLjHA2I9DcmbVWzl7YfKemPzns2ns5GEExkJHK?=
 =?us-ascii?Q?o1QuBBUJHCtl4GdMD5dF6Qe7Wk5GmrPTLYO1tUkTjKuhbX98AbNdvgF25ufe?=
 =?us-ascii?Q?Er9ePy1kSmidBCjFUD1yZug+5gEtz1fLo/71onn+kCj+D29pW7ByVWPsNYJI?=
 =?us-ascii?Q?p/9xzx//0s+wFPbjaf47LuhGkwlT25yPws8Q5XgRb0clCOp+zoQLF21RaDNO?=
 =?us-ascii?Q?3Ghg/v1Kl54nrZR5Jkss0W2OqudI0qy6hV+m900JYuZA99bhFVD3MTdDOe5E?=
 =?us-ascii?Q?EWsbMc9f4/YCn0J3QoR14Swpf5rWpknnpFuIXdCbyYrF6htoMAh9MGhI/UcY?=
 =?us-ascii?Q?x4wiaV/BOzDGj1+U3HClReegkmYNdDjkQyQXJt8BfksTv6pKaSR8MKHM6w+u?=
 =?us-ascii?Q?uQ2c8g4AdGaABEnuN0Og1NSmriOa8NnMf8bLlFE8xyRH9GFVr5JjR/10BgSW?=
 =?us-ascii?Q?9hYjoP/5JDXVEDodt2/3D2ulChrXqP9iT0i5G1Ns38cWrOYJmVrBolCFTckz?=
 =?us-ascii?Q?vt9GLUkRyKtdTwg7ZAixrTbAJaPz+Z49FSMsiWy7tpfez/zl9sKKv6mML3Hl?=
 =?us-ascii?Q?/hWUSCNbEraqnHAdVQlxINPvIDsvHft7eMkWx4yHhzemV6owPwkpaZJ2cXDc?=
 =?us-ascii?Q?wF7oTpllednY49DzMRMvERPRB3zL7VZ/6fsSpWa3bUqFqyPvRE+ONNqC1Z57?=
 =?us-ascii?Q?jfr3JoGwWt67Ehk5Rkq3AUynQA4j2iFOHVv43DoCyo/EasPvSzkKe4S6jM/L?=
 =?us-ascii?Q?z/Zkqd93OItxIAf8oBYJxb0SJ9bLQ/IlYJxPeopI/JunsjLNVVeaeh0nlvi2?=
 =?us-ascii?Q?GvK3QeT+jwCGbKceaAT4iSfIrvmVPronaw/D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uPKKPW6T2UA3nhwk+782ssve69kUjCmNM4r6w1Rw1pZcb+/JrOoMEZ99612u?=
 =?us-ascii?Q?IeA1ljpStR4cfHx2SnyfIudrrOR76Q0uWm6NUHqCFTxx/g4SC+aC17rf6ytd?=
 =?us-ascii?Q?J0tUw6yjUrFXC6fylGjdITbY6T3zIHJBgPTXXGinGopcKdcMVOJLeLY4lUwI?=
 =?us-ascii?Q?lnm29T+vxYnI9XJIruWYY36ScMJvKtzxXbiNLWJGr9WV2C3YbcBfd1mnml7X?=
 =?us-ascii?Q?pC06tLqx227p4vzJfn/OwC/wXUXSySITmj2WctGqJSEuOj0tbRR2wBP8tFyP?=
 =?us-ascii?Q?3d43Mw45GzsskK9fm+BEPuOHYrstHxa6HxJHRA7qASNfiVLaPe1eRYzHaik4?=
 =?us-ascii?Q?L67Y7ihME3UytYUNbLqry2pE7nnTesyWXXU1rhOKUNGWDycp0j7p/YtDMWVi?=
 =?us-ascii?Q?YbPnb07FQz1CRPV07jjt5CodDVh2uYdapSbDPy0ovAoeqC0dfAvkFFp7h/Uq?=
 =?us-ascii?Q?RQe7KuHzOFsBLprXZSrRbx+3tNjx6hBJWqB7+Lt8ULpzqOPLQ0Yg2uIkbxNa?=
 =?us-ascii?Q?4xQhjUe8F+ilDhzI46NdRu826BGCHp2A5J+j55kQLTqY8OyZjHO21A+ZhAly?=
 =?us-ascii?Q?AwNkx+9g8ERNi49n4TI8NeoI6bNVMQiGTqUJ6rO7nem4mhkT/SeGVKQ6kKfB?=
 =?us-ascii?Q?bSEWEsOYen8wc0/HtKvcZ5eQlKHA0l346EO60FFq/NqkSDHvY3i1tyzp0uMW?=
 =?us-ascii?Q?pPoM64XU/J0WBmqCVRWcUADUIrGfAmHppHMYwn1Rt0r3SuA5G/YR/6ciR1O+?=
 =?us-ascii?Q?IAJvGucVjK5p7mVDAdcdcqZTegxBBQLxyfedmntD9F2sTekJ1MxyU1t67T9/?=
 =?us-ascii?Q?MIn/DejfNa6IxXXnagfJht52KdrBmuFBZcf4hvDbGwKZBNpAUDssTbg19UGy?=
 =?us-ascii?Q?etff26hAv6brQ9tYjPUL6wlTtJGVNQDlyiEp18a+YQJ6FL5kQaQrLFDyfzaq?=
 =?us-ascii?Q?7TbdiSOJ0a4xekXyZxNVBFJAnfto3ylX89R8I7RnWPHFPCEd1KsD5qcPnNdj?=
 =?us-ascii?Q?bg/Y6CbWeh+rQsWuQGETX6FZE/sE+YUDObFt48PmCj1wG7ATqHV5w5FfrB7p?=
 =?us-ascii?Q?dBQMYjbtctaQSDeNgCf2mo++c7mSXMB333AgLMHs+I+az2cOjvkHxyWpiI81?=
 =?us-ascii?Q?2PravzCK8CtB64Y2foLxV7LPIbm0sWZIdP+5FUJS0oNiZLu8ASiTjUQMJx21?=
 =?us-ascii?Q?8l7CcqsVAD4g1uTunx2WQ9Ks0prseWZjOSooYk/VI8nEBWQlOdQ0eYu4XaOs?=
 =?us-ascii?Q?IkhzoUBWocvvYeq9pia+Dwx4B1ykWYtgwNf0XrNiRGimVBpdPxWiyaigM1mw?=
 =?us-ascii?Q?+WN20COXstWD5S3fNIX0BVSFsQeRtIVbUNFdtIg3vYXm6M92w+SZfrUkB+4f?=
 =?us-ascii?Q?uP1WX38vb6ux8TgFQg42v2V2rWhL+NEcKKM+BjR5W2ucM3t3AHb2SDsVrjvZ?=
 =?us-ascii?Q?QLMqtZsRlzgYu0eGlZgjsd4RotjA6FHE6J1OZ7vSk6ieaTWj/rmHlW8Hiw8d?=
 =?us-ascii?Q?XzcoS6eRhLydgF6AGlLcs4WUPSJ1N0SefPzxG6swQZYAjjNCxUw/TQTDvt3a?=
 =?us-ascii?Q?5hqg7wdMtxncBTUUkkdQYcOmJqG+GtScV4oVaYjuGXS+AUDwNUj2ER1hKIYZ?=
 =?us-ascii?Q?zWIOVPy6W4V+gl4a95IafRs=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b83625-3b7d-4606-106a-08de01318a93
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:29:02.7463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsteVuDJ2T4ELBCKElhS2G+WHH089Cxn030cHNaSSrRKQgnCIHbfyIMNEBw6UlyhbTR6Q2r3FHh0Ust2p2rib0uNKwRTjFcY8Fftcs3gZGaFHf0w5hSAVwweokug1i3/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332

USB2.0 PHY of the RZ/V2N SoC can drive VBUS line via the VBOUT bit of
the VBCTRL register.

Add VBUS regulator nodes (usb2_phy0_vbus_otg) under the usb2_phy0
node to describe this hw functionality.

This enables proper management of VBUS for USB2.0 OTG devices and ensures
compliance with hardware requirements.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 887110878906..1cd489e3df52 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -659,6 +659,12 @@ usb2_phy0: usb-phy@15800200 {
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
 
 		hsusb: usb@15820000 {
-- 
2.43.0


