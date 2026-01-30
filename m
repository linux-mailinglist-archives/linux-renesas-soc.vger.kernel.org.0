Return-Path: <linux-renesas-soc+bounces-27709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GZQMr3rfGmdPQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:34:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F99DBD496
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:34:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77F5F305C8D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 17:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A747361DA3;
	Fri, 30 Jan 2026 17:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wAftS0TG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0312533438F;
	Fri, 30 Jan 2026 17:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794109; cv=fail; b=C9mWI4la3mrMDs81omC+HiGkTZIbyqHijIy9R6rcOkjHb/1pJBsSr/9bXexlwzd0J//mfMvOTw4D1xrCP+Ddwi0Sy0nWd4eL2QqQF7R8oz3DjhPGk1Ss8AnGCI0C3xlMscC6e9OuSHOuT5JS68KNPDzi073JVQ7lamuFgZxkXK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794109; c=relaxed/simple;
	bh=vrv8x2cBvoMNAW0HfzCuJOig7GPe49vV39obPneFadU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c6sNSJZHQvd7AKQtbiYMkEP+taw5bIcN8lThJ23dcn5EZtS0fy7YpGAPHDWcfLR+KfLwa1IRwPPS0O3QVqSU4zTz5+CFDIxXtci6SpsDnCGkAQRvMCSCJN2xdU7poO2m+/0SWtTAVKDw9HRd+j+XGR/1U33o9qSmQS2UL+PAFog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wAftS0TG; arc=fail smtp.client-ip=40.107.74.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ii88VLc0pJIqTaDvrzcevjgkKjP7aMrJ1rzOWv01i4/jK4aUiAKU5Ny/LfiYZF+Q+Jq4Usfna0+wHs7nJ6ERAptqV6HLj0aXMP65EwA0IiXZmgARzJmW+KNrabuPPyKBJJ5GwN6djx0o++sTBqlzkXE15FSsjoXZxZ4ur+WJf9rs4AwoQf46pQCt7i9P38DWKvnPH41K973kmpa1hwLIzxzCFWDcLP46psP9v8JEJuLNibAD0N2k83gUcJZ2qDXelaJz5pYpCAt5iS8DOIMg3zXXGkHqk+RKDKpvcyNMphhmtjk7pE7uY5RIZ/fzdGaz2XKtoDyYYwwTI2ekZobPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dlc5d/nN9BNCdSq9V8Drn7bOgTEN+sO4eO/prX9mgH0=;
 b=elgJsWxB7UrZDUi64ohf3FwZDWEqdcW+4s74n4pHMoYf6Z9/CCVPJFUnQBgwwTTYYyI7KSvzxjh4Lw6jaZ7+UN+PZm8SjHg7LrGBv1+71MWJWIZSC5RZydI+hHvxxF17uiVqeq/WP2wxYuvCar8ON3cgAEEBVPhMAl1MoetVRPGcv8NzFV0H+cM9MwBbYymoEU2vZQJhj9tRKtl+ESD37y/hgbnilVtP355IxmiuPu+86vA+8IuQEyGMCg2UkmS2FqRFTASratRl6fiR0FBDfDO/oTtJ1caBO8pEcKLYTSfFwazqzlY3WwjMnEFsnJeYmYYph4IyeeE/FowrC3vnKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dlc5d/nN9BNCdSq9V8Drn7bOgTEN+sO4eO/prX9mgH0=;
 b=wAftS0TG68c91jUMdFnZvxQCytU8CQ1mBtaESi365MtABCleaIudYHlMOtmCOMkK68UnQyXlHkp5mSuPaHOsiN4NMMROCDYdZnURSfITUqfr2BOOVb0xmsgZuGa40Dn9w55ezQzpC2+K74Ea6mJlcWczdXZ+9dGw1nqIvjQu3t8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13818.jpnprd01.prod.outlook.com (2603:1096:405:215::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 17:28:25 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:28:25 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 18/20] arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
Date: Fri, 30 Jan 2026 18:25:15 +0100
Message-ID: <1babfbd5bd735e65991ace0b7aaa420a2678899d.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13818:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8c38e5-b002-499e-8ed6-08de6024f963
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?aDwsQhK5PY69WT6tuQGyoHAOL8q6bAYh6HMxK69pJ98PnBvRXOjTvZI9U82h?=
 =?us-ascii?Q?qIdkSyFbLmnmjntcmw0LSke2d+7mzo2KAxQn2ciG2WYC6rjYTBb85ugAK2kI?=
 =?us-ascii?Q?YabkBQH3T7I2gn5zAXpKCPlJ/r0YiLKbaNmBNLtTN8WpTPEnC9MKqlZ3zuAS?=
 =?us-ascii?Q?vKqW9SOSrZlVGFXvc1bdRGn7Jj2A+XwVbS6jpAVktIaI0J+Mmf0ovZnrdW9S?=
 =?us-ascii?Q?+W1jorMrZhHjMreBrXs7Xo1wthT5uhcQXOdqx0ES3KtE+GGa83kdWKaS77ig?=
 =?us-ascii?Q?0K6vorhhtXh0YSU9A6CiETy5LDiiqWOafHcKbmXmO+8v+G+wgIK09Wi0H475?=
 =?us-ascii?Q?/N24RgiL5j7lR8v8SPvwr0WluoQfmRk7vstUc3WE9KYBkipUsOBt9x4waoZg?=
 =?us-ascii?Q?5h9N3VZErhWBed0lr8iIMNkBUWYY5EEbXdCc+W1QlRgVJBoD5dWDIda/cS3a?=
 =?us-ascii?Q?ZAsU4e+Nq5hSX6NuigefmFzVaLGySm5ZcNpL+/mrPPOZbUR/U8ygJ/P6Eh1u?=
 =?us-ascii?Q?tBvGifBV7vmLLPB/qucvUSOhzYykHwCpx1R1I4j8Yx1FPh3m3cmLv5PF85Od?=
 =?us-ascii?Q?WKflhY4FojAKDGkyxY8+YqJBiFQKzmZHmhqOUIBo+N12DfhHmDNvAcO2TmM8?=
 =?us-ascii?Q?DfI3qBxDNzhukRyNcZlXwLnxPiWSgnW6htb5QSaKYPfx6L5aaistaMpnSJfJ?=
 =?us-ascii?Q?eTYi7IbFCSKZ4oqZl1fxMLhh312A9NI/9r+YUHrD53aaApykbFZVJeyjX9ql?=
 =?us-ascii?Q?bBtanjwmCYJ79kwkdXVbGCcT1lKzH1ts6+5KVUXmV0NzfeFUvq/Iw0ApHuEP?=
 =?us-ascii?Q?xcAwXQpLlYGUSkytBh8TrODv94dqCQPl6a2ExK9BrSRu2VOPQfuB/WpARAOo?=
 =?us-ascii?Q?61T9Nc9IHWoYraV3/yr6VXiX2WVog/XPB6fr7m7bdzovuZfW7wdVBNYVdF4Z?=
 =?us-ascii?Q?4DE+szNgb2Ei900d+FVHI0Yzs+N3gMOnif8c/DEMI3P2zXg32p1qFgcsIKUE?=
 =?us-ascii?Q?qcZ03YuAiZWelSScTJe69/Hs1D8gD/abde9aH3ho+KqYkEUtsYPGccqVDRw6?=
 =?us-ascii?Q?aH6nIunnLJ0S6iMkl8wAbXMQ4T//cGtxUbFUeYF+gGsGDC/M+XrRrzCJArFT?=
 =?us-ascii?Q?A54ua2KcXUCLF8m+u4YvoSYd9ZqEZ1H9UZqhSVbXs3wAOgHMVB+642hcPmOf?=
 =?us-ascii?Q?uRZArn5zWjx/DHsavI1yyM4+UH7lAUPKSILaLxO1aIF6+lJlyOKS7ZCcXizR?=
 =?us-ascii?Q?BmYJp7nmml6NMmBV3bPRoOSJD3ExKVaMRmsSKX1aJph6ixRKs6wD4MEpddRK?=
 =?us-ascii?Q?+ncpYqzVmS2DCBLa4N9jdJlL2v6w2ApGXc8LUsxrYSDiaiKeurHXBx4eMY7L?=
 =?us-ascii?Q?olyFfyWE/9U2gUHxHGi0pjd9QBkY0zCbe/5X1fw8HpiOAnTgyAQccN1Brpz5?=
 =?us-ascii?Q?H91VDdeOQIiixGd8D35Z/AZ9WyGOi6mM1fffnRE9Q47FUoG2iKMX9k9cvLSD?=
 =?us-ascii?Q?BTuEAxC4Wissl0rwhw+fuRbSNU3exwQSko8fDcDM13hN0yTMJ9638ezW1kAs?=
 =?us-ascii?Q?L6mNjP2fyaAcEwBDMtubdVP0jOe1/viwXZrndgeQ25UmL+WfoSdQRcJFC14L?=
 =?us-ascii?Q?Ufkyq4VdIKyuxuzLtRmNS2s=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?YWi6uTA+vxOotgRCzdLeJUzAvgu1Y2rbsOA0jxuDff8/zziHfU4RhVxRc2jC?=
 =?us-ascii?Q?SFmmuftKrudVUghNx4ZZqOglqE/fX0FarGesmuywcmyitwGNfNjB92GCTiC+?=
 =?us-ascii?Q?4x7t/uGI+/5DhbJQahFjP7faS0u509gDbr9KC1u4kCgoHW6hHkNaphhvNVwm?=
 =?us-ascii?Q?o5yT3w6LGKPv7fAhd/q5HA0JKkfooak9Q7ZoQ41yG+c7xwAgyobkOSVhWIlK?=
 =?us-ascii?Q?3gdsFixlxBDYqBLstNmeVuG5JGD91ENDGVxevuoNM5HoIsrjGak0Ibnwm3kX?=
 =?us-ascii?Q?iSFHFbNpFR65tUZ3Y7YAm3SiUuW/KO6FBJLPUm8E57hF3TeXph2dbP7q1kgq?=
 =?us-ascii?Q?fLyZL9PSC5RgeP66uNxKjNpeyWFeaSrd7T7UBMJ2OYJZHhVL18MBPnjAIpt1?=
 =?us-ascii?Q?Q5GU2nqy2l1KIL68nutP6D6t5bDnkUN6dlZicaToB6wcRYBONVcAQg70H8fl?=
 =?us-ascii?Q?dzXPWVoWkWEcAqjLphEdz7l3AQm8HCiDcry2/rMJb/CKgQOwaMF5YZt/Lbwh?=
 =?us-ascii?Q?YGqfuhGkMl7l9ssu9vh2UFaebDhVPoiaghO/mXxvCnlrLzeamXsmX5fw6SpM?=
 =?us-ascii?Q?TQpeaa8eMcpcIMZFTMXHtu5NBIsFx6lrpKWI87kZmIhD+oLXIaMJPDbox+JT?=
 =?us-ascii?Q?z4aL9vOVMbe0vCP4BTzjaXkcZxI35SDuRdLsQcwXipsmhdQf6W0FXzPtqOkG?=
 =?us-ascii?Q?6MLmpOehxVdAK9mOypgI8pirZY3vAcNgSJa/5ZRqukxQ8k1ljxaXs1tjlczg?=
 =?us-ascii?Q?vD8jK6ERIEzBRyXu1r4z/WU3swuklUpeSSjzICu5H7ewnqPwGshEsp0PcciH?=
 =?us-ascii?Q?KUhYQHgkaMyV/zHOXf3/GF3ycEQHxv5AIbcNw94nhIXk9lI/iA383COqYmBZ?=
 =?us-ascii?Q?K62UEm8Mg01D1yG0/kN4QJFdmhtbL+2SbdB48Fnaw9vdyV7ZfzhbYFY1iRgM?=
 =?us-ascii?Q?RXdj5vR10+I2p6SdMaqY2p5t50UEIGNna9xN/oiGphWKwLfGbr9MnUDhyMuR?=
 =?us-ascii?Q?m07zT8WfLWSVjwdtMc6eQr8kSQC1P8qo9SGX2Lf2ymm3rJMhB/3no92B9VGO?=
 =?us-ascii?Q?S7Be3PZh8+2qb5QRscMogu2UQrHWOJtHdUn4lLnbpRyE/LtMqT2HOPRaymEh?=
 =?us-ascii?Q?VAmhRkdQX2x6e6t+PegizzlLks6vgKBD/7WX6Yhn5dYDgpGa39EIzEoUFT8H?=
 =?us-ascii?Q?atpA8nScYYfEco62BG73+POpMh3rCiWvC0yrVzZVinEd1qUH9tJo/7MJfhq9?=
 =?us-ascii?Q?bIOsFYkYid1m9VvsNPQqBNRyXFkQp3XTnYzHrcv8L5qbSaRW0EMAPVDOS2HP?=
 =?us-ascii?Q?Vhzj6QFRmX9pf1P+5LE9qeKd5lZxbtEgTp8PKN2svBFH+JXT6UP1fxuL3Y2A?=
 =?us-ascii?Q?oqlMsW292/fLKAG3oPY1vieHnIAIJFRRvYbsF+xDAFESSaSLDTAU2tphOh8W?=
 =?us-ascii?Q?jcNAkSTZHAuKGXyPd+3JVbe4ooNlZiRfKoiUE2FXJ3N7jKKCDbvMXcPSmBA2?=
 =?us-ascii?Q?E5zu6z5kGPAsdB9AXpWd1g1vdRb19XRthXo8OImO1ogQ5lDHoXf+0UKWhRuw?=
 =?us-ascii?Q?4sEJabHFQMc/fo3vS/6FhFsf5c2QAt+5ASbhAmQFx+Iun6LCwlNLL9pPdExF?=
 =?us-ascii?Q?HjmaO75ss6+JDJJxBjaJTc64G1T2Y6ctr5f/Ht41sv9yOQdaqYN4DnG8Igfc?=
 =?us-ascii?Q?EUbc+gF8+k7pvHkfCMtfB3TosuYeTd3XtSIy652LW39Qh8hvHDQyqeWDH9AW?=
 =?us-ascii?Q?RefgBzq7MVWkkksg+826c4u+joim+psYWmdE7WnHdDe3cD71JE98?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8c38e5-b002-499e-8ed6-08de6024f963
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:28:25.3588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OH+2LlmzDyLSVGJ0Of4bTJAl3iZ/3MTcOOvuSNhSoh7dFwTnLVlGyLVhNJgZIBH+PdplJdDLmz2BqEw9MGNDYOdqopj8G/NnUd1MXDdGFlnDBUnC4JaUgqntqB3+SKoD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13818
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27709-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.251.119.0:email,164a0000:email,renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F99DBD496
X-Rspamd-Action: no action

Add vspd{0,1} nodes to RZ/G3E SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Squashed vspd0 and vspd1 patches into a single patch.
 - Collected tags.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index c90a778250d6..d4db44b6ccf7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1455,6 +1455,34 @@ fcpvd1: fcp@164a0000 {
 			resets = <&cpg 0x11e>;
 			power-domains = <&cpg>;
 		};
+
+		vspd0: vsp@16480000 {
+			compatible = "renesas,r9a09g047-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x16480000 0 0x10000>;
+			interrupts = <GIC_SPI 881 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0xdc>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		vspd1: vsp@164b0000 {
+			compatible = "renesas,r9a09g047-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x164b0000 0 0x10000>;
+			interrupts = <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0x11e>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd1>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0


