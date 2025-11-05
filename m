Return-Path: <linux-renesas-soc+bounces-24167-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D48AC366B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:44:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 01F8834F3CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531CC32F74C;
	Wed,  5 Nov 2025 15:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="VtY+CGAU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010018.outbound.protection.outlook.com [52.101.228.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F5E315790;
	Wed,  5 Nov 2025 15:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357309; cv=fail; b=HJiDgl/DyBe30VBNIw5mkEgqoncpJOkeSoJFs+x8++RY0SjXi04G87lvbKbM/AHqxOJUCRqX7/RDKTGEhWCS3KlUqukSVaHoNLRoUOu5l2ORsV1L5hoshNmE5AH0nDV8dcatxZv4fwae6Zgr7ARIQBDqUscLvrPz8os3T938d+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357309; c=relaxed/simple;
	bh=TXYZ3J9Ue+xXjnGqhzvrl7mOiTsjoMIupAYJ+yGSAyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sI9Drm0zb4WfaM/rELQ3eRCH4dihiFn6O9X39d3zpAnmiyXseU0L9gPWfy/GG5sOQeXPTo8iRvfHdBbOtbF4Vnr791IF3ISOI6lZ5aRTOgF06apZ8m/oAN7ETO0COE+mVW8SD3wkt93CVBgKlQberxrTcswDSa9Vo3ECS6caX70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=VtY+CGAU; arc=fail smtp.client-ip=52.101.228.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGIR0xbKZXM/iL6c0y8F7zShqgWTGXeLe01hhXDzmbG2g2bpTR3EyG64LckrrQQqAgV4XFAgMP7JZJHitZO7B1vKsepco3QoI8uKr6TKNtY7kzwt1P23uFAqJBfDzZTMLVOBfOATBRvR0/pYpQXMfpo/NzsdXK20YuDh16hV5z54esDsBo7QmB1JF+UW5NBl3sfhqWQimEzJ7NFEm8jy4pR5CGMrZD/AYeQTKsWHHaPla8a4wECyBAOMUWFz849HDhrmsrDzLRUJwNcr6iadEjDp5JTR/Z5qCb6ilcqNV5iCv9aNUWjbM9esVsy6QmHQSlhu7q9fDJLN6y8wxzj6Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDpmGVlMqL8O080IXcDkPjN0w/zXtYmU5P+Vg1H7tzg=;
 b=yUoPFwOuGWkfaf9hlRglIKOPHRRJbV9cyrAmcHRcw37N97sKNRtKz7kmQsMTByhruBadMZrqAAjQ4RimyAuvQgM5VM2PWvu4Wb4pOTObOrc/B19/FPGA83ym3c2v0P8RnJTv8J1XW8Xr1zJ3lMgRLaHjg+coL+J0wcvHvth5cr7o9K5Cjo9RMWR6KoupF4kvpWcpoAVt8Dd8dk9H+pJUsPtR/mpZMpEmRu+gXrkc7Ns6rCIdFAEpNKkd0N9+/yZg5X5N0XGE1rEFBU7jg5HPzom9M3OJ5x1og38BFXssVHkD797UU0wKsoz/SsRrPg9gX06mUv8BpUKP1PRJNEGXng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDpmGVlMqL8O080IXcDkPjN0w/zXtYmU5P+Vg1H7tzg=;
 b=VtY+CGAUlVAgsjG4EV33j4Ed+ZmeTNawXG2a+YgFqtDPLyJqYUHNc2ybMyYhmifCrA1HdhSLM3xtsB6/NRNxyd2lk4ZMr+v++ln6LD/4QszvgK9lPQymvk+B8XZ0uuNYEzOm06bHwqYXWyDY11L6y2CPz09gwhhn9ti1DhuMTSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 15:41:44 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:41:43 +0000
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
Subject: [PATCH v2 14/21] arm64: dts: renesas: r9a09g057: Add USB2.0 VBUS_SEL mux-controller support
Date: Wed,  5 Nov 2025 16:39:10 +0100
Message-ID: <08ca312e2f2f13a8b9267b0bdb93f3ac484d9365.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: d0104ded-1caa-45d8-6721-08de1c81d22d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ru0hp9wRiOMXk6dndoAO02ipT3qZwvi1S0MeZzBIby92aH8+zEumIQV8EPUV?=
 =?us-ascii?Q?kIOAd1Xtpin2MVO1DI7LnRrvkILZ+b/bCkOoO1DNgc85WBhDvFdqOTeGlvwS?=
 =?us-ascii?Q?fDIzL87tmA+pplWCBxrm6X9GwLJjUJFcQoAguczcsNgrSQ2rV6nfqEqnqWlo?=
 =?us-ascii?Q?3RTKoIO48XLwPaWc4rLwpP0zQkLuuMTzBa43u9tl8bK+HdJySJWHJkyVSXfR?=
 =?us-ascii?Q?hSPnTTr/rFgzfiRzH0IZTFAR4rKOFiqp0ZK2AoBYcWoaUfIugN8rnrTWatyg?=
 =?us-ascii?Q?EOvif0uSSdAzLZQ170i1LhZo+uOkK7kjVet68nXYAirOxGwh8TKqJBhXEvdS?=
 =?us-ascii?Q?vFBItU3POflIvvemAQN6wKZRk9FKYHlQWVUCbcixija5T3/pg71GuTHSGS8R?=
 =?us-ascii?Q?3TRmQ8Cxb/stislzxchKJYPAiyvs09P9mFI/R2gjCT1bNKH6F6b/BjFt6hpL?=
 =?us-ascii?Q?zdDeZNswp/V2wLnsZok01E4GZFU7z4VGqc2X7EiTKI5FHKtFcO37muPh6kVb?=
 =?us-ascii?Q?TLIiTEhwxNmkQNjt6VrT7nNV6+G9C0JkbP1rl3leIEVrwpaipN3fh225G2Zd?=
 =?us-ascii?Q?95ssfHqocOkI0GzrYjPdvAenUbL+TilJnC5GuvvJLPrh9vydB+U8Kw+LPiIe?=
 =?us-ascii?Q?fv9mGay1lBo0JS9Uh8vsCCb3LItLwI1dyvsDwXr0hY4hyboy1uz+Bq4ruKW4?=
 =?us-ascii?Q?dlOXjse8vf5AeU8PzEEVIi/BbdAWZHNo9ew9771GFnQNkV4Sg43YPvB5/RnZ?=
 =?us-ascii?Q?NweaSyFxLGDJb5UEcocFFFjgfYlqq4WhrLo1lcNzf53yiScrN9ZIMt1Z4n7s?=
 =?us-ascii?Q?AQmF2VvLvQxEO+te9Z8EKtStAZm/KmOTGiYnblIPjHW7Id9m4m81A8Cq6SKr?=
 =?us-ascii?Q?X785VCCS34y1qCqBjDdFaF9N0bhwLLVw0BCKF+yayeFqjkdeysfeULY2T3WZ?=
 =?us-ascii?Q?1CD2gHxbDtLkPj0/nb3zgj/4L/xTLQNPAu5gLkJCgAsfvZyN4LAW0JZ0xlt6?=
 =?us-ascii?Q?IorAvu8E/GNw2vFRhIWulXZK4RmhiN3b5VX//iGmFJ8pFuHlVO2VXZhaFnku?=
 =?us-ascii?Q?2yVZHp+v4oPDNx+P1G0DWsv4Wb1gbXA1yfzTSt0ScI8wv973N2czDEdXmO9+?=
 =?us-ascii?Q?P3RFAcncMokI7BQH6drc80522CouO49BGLWiFtwkZ3KymBzV7D6kHEJf+MEf?=
 =?us-ascii?Q?hTMv+QZJ6mDvSLCSiVnCHGPrc+IHj7Rz3n0C3IWY2X7Ci+IJFhA1L72pUQjW?=
 =?us-ascii?Q?FDU07Ss+GrG5x3I6VMrTsriwEgfNU1yLhhU5N19ycnaCn+Et1Tr3DEuktqau?=
 =?us-ascii?Q?NFOeJGnA0guAkHMyu9wydpvzRZlZG4KEyG33wP5QBkxsGLm5md1ZTe9LFobO?=
 =?us-ascii?Q?ugngyVrTJ8Z5ZaqQWfK6i69oy26/QNm7cJ+zLBrcHj3HHMB51vSVREf9dPYd?=
 =?us-ascii?Q?ifoB4CFY7rjbAgwf7S7FMuPWBBt6bDy/rolgMxR15HZUVETRFElupqJSTuQC?=
 =?us-ascii?Q?O+L1TJmSOnKsiz6+RGmqu+d7hPJY8yz6+G/W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MIfzpEdwgK7I03Vw/RJsgi0LmFV/w8mL2D+oNu4xWS+sqWtzdenVCFSaQLPE?=
 =?us-ascii?Q?0vvxtNQnHq4/KcYHxL7LBehX91DGdriSz2ddOl7Aj6a+QbaURAqkJ94iNmc8?=
 =?us-ascii?Q?mNQpY2V/nL4mbxEmhXY7mINugFjwcZu055TmQt50AiEUmppqTRytQMeq8JHz?=
 =?us-ascii?Q?UCqe4RuDG8I/OhBai8rIjraRwknJKQpCMAl369bQNCLmcq//cDHfyi0S3wD4?=
 =?us-ascii?Q?d05s/IRx+DRJ47lffuxN/cgDoqvMW2rDU9S5CxnUZzuw4oX+z+/0xHTQbseY?=
 =?us-ascii?Q?yu+J0bmpFYHManHiHD7fqvykBPnZLcTLqXlghB3xk+oFH/E5bDOgimcYttT/?=
 =?us-ascii?Q?LOrdF8eJA7kR5X3sbipWSFfoSP8M7wE6S0hBdEz00fvQd9hkf2j8eWHq/Nb0?=
 =?us-ascii?Q?0q0j4+IpRhoExnVavfXpSXAXcC36OI06gSl6uFaQlwdkyc7DyQBlEM0RZquj?=
 =?us-ascii?Q?aQWHsGSx4Sin/C5Zu7FwpBc+O4YH0aD+B1lNSDW49MVpWjtah3WNy8ZD5a9P?=
 =?us-ascii?Q?5R4eRpMLrst2r7R4vJomsJybLczV83Te8Oinv3veq7iHZI6diYpMNpCIV5w/?=
 =?us-ascii?Q?yVmN5mzjVcx713D6gqDnQz7qsEoBrsRQJ95zKECFHyugbf/9ASe3feYLWvOt?=
 =?us-ascii?Q?fkiZcWbWqmaiVNmKBxcvYamFP0Y/UgQ8ENmjLMLU//sxP2VYkfumJjfdYfRP?=
 =?us-ascii?Q?MBEldPoBnYOakKGuMvobSJzRf96ZEywJw+17OH9QyHMjYe38+KT6GHrqBVPb?=
 =?us-ascii?Q?tBGglGiEgWuouLYfo0vzFEufq7/K3T6/JNREXAsJuPZPpUyI9vN6lGeHc0r5?=
 =?us-ascii?Q?+1/T5yatiPCOwQli2StShx8h0Z2sSEoz+vWVJfIhoGFextlGcnAZ2YIefRc3?=
 =?us-ascii?Q?l1Wq//87EVs6plSOoQcQPSiwvZ8YWJg8xR0YtdPU/NFU0vE98F+C2DE3uwQb?=
 =?us-ascii?Q?ezCh9g0kS/zpiSdXT4vPP1BpSm3vEukdqPqo2ZwEqAU6j9ipmcVRoThGbNjk?=
 =?us-ascii?Q?WKh7HdVIdhR3HGmfU4ywFirUjlGxbHRcoNIzO1Tny0u5YuldJAozsCKnPXyj?=
 =?us-ascii?Q?qrtgT+AcVwmC1Eea9dnsFA5lLQzWVROHkWzwRPfTnEyLPn1Kv6jUhFMqbalY?=
 =?us-ascii?Q?//3eBCz8waY7aFiXC/nL7JYTuJzPiKoty/x/mESyWM0Y5c0bp46X33Vy2C65?=
 =?us-ascii?Q?9m5afVHCtZhM5LsvK6vmljRV+IFKNvWH/8L+fzOMWr0rsizVGTYHjO6UDbGG?=
 =?us-ascii?Q?uiinZ5DNFG9NsQQwC3Iul7417aQ+s8ax9DSL2kq8ho+m0Dj3DBZpqr1K5VF0?=
 =?us-ascii?Q?uVPm9xUpmIQJisEjZgd2dx+igJLFizrWV/Wde345ukkpoj/NDFyV5Idf1hb7?=
 =?us-ascii?Q?xoFhaqeFZXZ+7Zx8R/2C5nsxdwLJBkxZhxR4sFpzc+K0BLPZldPUErC2+tUd?=
 =?us-ascii?Q?PjsA/7YvuRBkcYr0pbqF+o0q2NwyKWdPO04zRUzk6Dq3ed8N6pWaQ90Nl6QP?=
 =?us-ascii?Q?aqorQMz+PYhxwj9lPIiUeYqTOdIOZC9+icruEGco/zdO2nT/cxzoDfAXCONM?=
 =?us-ascii?Q?lPYWY8uRr55r3A+URJGYibwoWJRaPDnDQetqBf7uAxPat2HBa7oVEYswhglk?=
 =?us-ascii?Q?UKXWgMxd24yi1IgGTANUeVg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0104ded-1caa-45d8-6721-08de1c81d22d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:41:43.9102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9rF6v1C4v6fPv0GgbNmXFJFgDqX8STsGcoBe885IpaiGvXF/f1HzDxDLRLNfhQyMBZN8reFVRlMIWwN0Zi2+U1eCWnx0R/cpV6jD6kSZXwFw/1u+MLNJirbMI/YoVva
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

Enable control of USB2.0 VBUSEN via the VBUS_SEL bit in the VBENCTL
register. According to the RZ/V2H(P) SoC hardware manual, OTG channels
require VBUS_SEL set, while HOST-only channels require it cleared.

Add #mux-state-cells = <1>; to the usb20phyrst and usb21phyrst reset
nodes to expose them as mux controllers.

Set the required mux-states in usb2_phy0 (OTG: state 1) and usb2_phy1
(HOST: state 0) nodes.

This enables proper VBUSEN management for OTG and HOST-only USB2.0
channels.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 40b15f1db930..b94a06b6f83e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -989,6 +989,7 @@ usb2_phy0: usb-phy@15800200 {
 			resets = <&usb20phyrst>;
 			#phy-cells = <1>;
 			power-domains = <&cpg>;
+			mux-states = <&usb20phyrst 1>;
 			status = "disabled";
 		};
 
@@ -1002,6 +1003,7 @@ usb2_phy1: usb-phy@15810200 {
 			resets = <&usb21phyrst>;
 			#phy-cells = <1>;
 			power-domains = <&cpg>;
+			mux-states = <&usb21phyrst 0>;
 			status = "disabled";
 		};
 
@@ -1029,6 +1031,7 @@ usb20phyrst: usb20phy-reset@15830000 {
 			resets = <&cpg 0xaf>;
 			power-domains = <&cpg>;
 			#reset-cells = <0>;
+			#mux-state-cells = <1>;
 			status = "disabled";
 		};
 
@@ -1039,6 +1042,7 @@ usb21phyrst: usb21phy-reset@15840000 {
 			resets = <&cpg 0xaf>;
 			power-domains = <&cpg>;
 			#reset-cells = <0>;
+			#mux-state-cells = <1>;
 			status = "disabled";
 		};
 
-- 
2.43.0


