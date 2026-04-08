Return-Path: <linux-renesas-soc+bounces-30987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPBgM8Mw1mlZBwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:41:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8901E3BAC25
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:41:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9CA9F303A97D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC953B636A;
	Wed,  8 Apr 2026 10:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kkKaaDCl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611C23B38BB;
	Wed,  8 Apr 2026 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644785; cv=fail; b=em+mZ5WaOiRC2XRe4zktI7SagW4n2SnnHXpPGdeMvcHD8owaoSKVqDGFRxUOl05WLB0j3CJQOpCiawFPyA/GRSx9zrK+VysdvqzoyCtAbZWTET9dTH7vQFg/0rhCWGYVTXZMNyFbULvzGUYbD3fgVmyF8rMUUDCGyCTe9oyeNTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644785; c=relaxed/simple;
	bh=Ce6+AGNOonsAjR5rIh/k38uzAbsqC2O2IqPfcXPK7IE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=twAeO5PRxvToqEiNc/FH3pru/7+L7NnWB1eYo4n8+fAXUtq2HhM0ym06QAfztXqAC1lt41zJs4tteGSGv51YMNZ/nvb1Kqw3AA5f1wk0yWFvlMta6nobCEisbAYRkBb2NwLBO3WFaW3FM25ZA+yF1fLCNcUzc7JqS16wkajm19M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kkKaaDCl; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gtFmXFr5HTIRtKPd7tnxT7iepEgZo7ipkkWELsS1PYEUIka5oAtYKMWnhBfRQTLjJRnJ65I9//Tjo1SIHwWJ++IGRe8WRNgYBPOVPwCPDR7EuQSMqumtQPqdah6MViasdzB4kgoMdXYl3eoboVMNGZpRvnHKgrXO+fHkAwrBN6DZj2bCvRfoN4Z4BX3wlNIlajPxtzb43TWFy2vAkrN0C0dYkjqDwCzKONSZ9iTOhBgAodCDaX7/XwDRDXKtTm2m0gkm4ljynRe1J4voYpHzTuzMXqa9ROsjTW1hCAVRsQ8mcMT1inp/z8gtZViza5DmRgU2DzzVS3dXNVHdCGLUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRqdPow5UH9DHYmyPhM4BS/sC/flroNDGsM6wA8royk=;
 b=rQR0I+TitNhiSNE+R4VHOPyskdE4v/gPuCmkOSuMt93nZA+5OE14SSje+MQLv/+5YYVVaJf+DpqePYjduC7t3JA3W3QBCR60LWN4dvSKWbMEZ7ACmLn+lnmKQbRa6GIZhhH9ouqAKSppxvxnz9MGIsfsqDgoUx0e2BTxAuh+8syaGiDO7SNNoWGY2aKKExCjaKTmx6ZJMx7RmrlQBe1TB4EO0s0GCotHcPS1UpLq+T33L38fnRRk7dz9NChi8VsqZrjlI44kge9cA3Na6nvrKqCAJue5rgOD/8qOlWFayRSZWalPOXC/yseQFbUIh+ojNvtMsyEAX8OLOLJhyB6Tzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRqdPow5UH9DHYmyPhM4BS/sC/flroNDGsM6wA8royk=;
 b=kkKaaDClBhEfNj3YoQa2N33hA0h/fxNMjHWWSU/84RpE0u/57wVx5kliCgNJr8hQ4D80+PnZv4jkCTSFbv73KMkY5O6DnDFRNgBk70itlNjcGsEzm1W5vRma0Jm7MiVUVBwcbdv4pvJ4Yfm6rn9T3R7/MvhSfcLZ8pT80/NmElM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYVPR01MB11293.jpnprd01.prod.outlook.com (2603:1096:400:367::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 10:39:41 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:39:41 +0000
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
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v6 14/21] drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
Date: Wed,  8 Apr 2026 12:36:59 +0200
Message-ID: <93abddcab277b570159ba3a941e6e26f55af5d62.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::8) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYVPR01MB11293:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8c35ad-bfca-4732-2376-08de955b2454
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 CznpP5CyX4/B7KJgWyczXEv36plR4Uki826BJlrma2PcVWszmNIShsSiBWpRQt1BjkmEpYVus2P9EGqnF9rtMWLw5clqF8/VIA6mU/3trH/ft10dE4p9xKCAFPP3akunFxipEM+cmaGu2MgLiCDBI3qzj5g2r2COknWIy2xEglc8d0tfw3PH4jhhr6xPMQLqdEk3OzRYB6KipBS2WZEcVwT8PVvVlZ8gBaydvdBvBB/hCp0KYqnrOI22gBl+/2HjjA9GHe3qh8++Wn41cfnigDhzHEVvKg1Ne2PN5P2r5ntEcY1hhlZlKHJI9zUAsHefBDuxRD0qMKZswXffWlgVeUQjSAVGZ1Gb3xPbiSzIjW6oa94WruE1Wuv4ucFISu3kMr18cYWAtZOVfVgbE/UVLEJiya2Vw29ghr6Zo21u/Pkj9v8F3fPm/byh3cXxryQVNqQjf4IOuKgRM9sEq91We3txHm3BaOydL1B7Azqp/2n11LhaLA5gNNJ/sFwMFK3Ask1bXNJnPsf5anG/qLc9dfibYmJR4k6YTOHvCh5tpN/sekXolXn27WB/1FrCjk2oC2Bcxp5shbt8EdP9zGumf6KdYigg4r7ifh0BBlN5co4Ooq8bUluQBUcwxnTdc7aPgg4lZpMT3Z+Mf58pDWUA412wHNScw/lX6GUANtgtXp6Wnm4i7ReaD5MBmx19RxOzDXlsg0Fs+l2mJRfyt495MpaJ4TDmIgvsJIlpVeBpYn5vWJxbBe5rk/Qa5aJBmTamuWWaUWMQwoLtFQ4P/M0N+BG1OBAqsrhZr82eevn4wdY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?pgedbqEFrahDHinGHsdioDDe1Fj38xKdVPeHClz750xwJgwTa0xXglIrlVhm?=
 =?us-ascii?Q?INU7nHBiDUAaITi9PZfBdEmSdPMbR6y5LdEpqxTBsZCq+Yuww8TwrBtGfzbW?=
 =?us-ascii?Q?QcBAPcR1EOdeQIe7wawoCMmiXJFHUHx0JbcS2Q+Sc93OcW3irF5lmYrQpyoG?=
 =?us-ascii?Q?Sznozz3QROOGG3+wsEAZA2eyiOwCpGorN/5tN5YewqY2auPoqxcWIJbVAhS7?=
 =?us-ascii?Q?noiLG2aK6Esx+w4+GC00eXOYoOHMT7HYTf+fiytWFKfEjnClV6F27JhbEExW?=
 =?us-ascii?Q?F2d4t5TFV5YYy8WTiLdYfrJO/MPLWhxVKqKHoV5F5Vsxa5DVe4nG4/2GaHCp?=
 =?us-ascii?Q?55GPxyka+jf+XBdB8WtNUDY0q378uDLH2fTRg9QGJdNK7DrVoXPfMTEdE9qr?=
 =?us-ascii?Q?h4BbKUQKvR/tmnt1y6NDGP+6Mcyo7fPX4qbGrLTYdgaKiy5EoiUVtB4vdf2M?=
 =?us-ascii?Q?vs10SU4ckvqHsXsykBVN8KIKEZYW8g8KIo/mQfqJtjXGaFu/l+Pyi0Ly0wVy?=
 =?us-ascii?Q?KHOpu+Z9VQIRg0+qUgGpB4FIJ5D170I3qMWJt4IpPSa7ukJZ029SRErWmG0u?=
 =?us-ascii?Q?4jH2YXGD8DTIiSrxLrxw5760mz7TcAHg6J5yNAJp7y1RJNFGP3zLZyN7xo/S?=
 =?us-ascii?Q?U8Y1mC+qm0K+9c/froY5lQn9F0zIZG3oTsHZyH/4zSAVB7cMBM9q/q57tcm+?=
 =?us-ascii?Q?hkdtT4oRXVEZFGaMEvPWWZFJa/E/oCpCU+i5+LDr+AU2KZUNlY76F1g7YKxN?=
 =?us-ascii?Q?LX1Ss/XWeMT+X2Yh5ccrf4NiRmN+lcSXOothcdWNxfPYrKbWNWXVWFWwf3rb?=
 =?us-ascii?Q?FO/RtaW6vG+fdsHPMKlG9ASsiJEYYSk3Q6zUYs992rMxBvlGXf1AXfqiM7D9?=
 =?us-ascii?Q?DIhUoMF6YqUkvLOLhE5NrMqzQECGGEX3BYOiDWmpPB3lkIEpORcWlR186jLv?=
 =?us-ascii?Q?7J/FGdUEgMQSTUSIG1nAj/ydT6dZByyHYK6IGVgPUkEL2bPbcTtZUVba8GtM?=
 =?us-ascii?Q?cuh05DpLMoERVxdrzeX4RFkBe17muRv93SEYEx9OgqMl2dvz211WRet10Aj5?=
 =?us-ascii?Q?8obIlooH+NgnioBsahfR85k0myaew1JaB25fURDEvdDUIWwhiKtZd1WvFvwn?=
 =?us-ascii?Q?5ExDuFw1lp8Qir7Bnz41OLY59YZrJ7XP2YX8tRYrPlUKWMMUKrS2LQnoJ8sN?=
 =?us-ascii?Q?Hi+LjOKxgtW6jkgQ/3UgUPksazealq7cazMJKc3JWXXoyBV2EQXLj5BO1Qfq?=
 =?us-ascii?Q?PADxMeGkKaJpAsezdjJfa2/E/CgvwzA37DRhciuHEJ3njF8pJYr7Cwk1Cmbc?=
 =?us-ascii?Q?w/CrmwfQzfkhh5se/dInqYX4DbzOlW92+PKyq/tPqJk1TREFBi3/k52E4L6t?=
 =?us-ascii?Q?YCk52ZkhuhCLbM6Qe9JlwYfpJCptJeaWnB0au/T10DpSJqofEMxPfadLSIRK?=
 =?us-ascii?Q?K4ZyXtni2XiSIhd45t9LW08v+ztGylwiutB/qxJL7szkdCPXAjrEdC04UCnq?=
 =?us-ascii?Q?Y4xtVeh4yH9uCW689vAGizQBnKbUngRdy0D3UrEsce3IGS/EyQuGus+w0+Oq?=
 =?us-ascii?Q?wJTg1f/Zi8LBjtWLK265DrYBeDUVkt3WkJYYoakIT3I5X52tlJi0Aj7kwSEr?=
 =?us-ascii?Q?h0j6H8sozY7cpPH/JDvZclHU9JmZPNVtM9RivPXdnvqzku2BsaLMMaEvIp7R?=
 =?us-ascii?Q?fDXOVrWlli61mV8qkX22jQRpYl5ykxbAgzWTVKW66WtLnIfPnwotCk86upa9?=
 =?us-ascii?Q?GlmLNWp1v8yMK4J7hK06QJ4xcAGOx5RO/RUL+RnJHbpn0eiNH7nB?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8c35ad-bfca-4732-2376-08de955b2454
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:39:41.8403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXBLDgrbPvEQuuLtABPK7TN3PzAnFtWKMKBFtJ6BEVOudLyUZrANmpd2jPj8mjzSoQoBhGDOGfklq7viPApAUZOvhym99r++Pl/zpvhvVY5Gq0i6sT28uifLauXxbWIC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11293
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30987-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 8901E3BAC25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add MIPI DSI support for the Renesas RZ/G3E SoC.

RZ/V2H(P) and RZ/G3E share identical PLLDSI divider constraints from the
DSI PHY perspective, so both can reuse the existing
rzv2h_plldsi_div_limits structure. However, at the CPG level the limits
differ:

 - PLLDSI0 limits apply when vclk1 is used.
 - PLLDSI1 limits apply when vclk2 is used.

To support this introduce rzg3e_plldsis_limits for RZ/G3E SoC.

During rzv2h_dphy_mode_clk_check(), the appropriate limits are selected
dynamically based on vclk_idx, which reflects the currently selected
vclk.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - Collected BDas tag.

v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - No changes.

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 947c8e15fc4b..9950ce0c76f8 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -581,7 +581,7 @@ static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
 	mode_freq_hz = mul_u32_u32(mode_freq, KILO);
 	mode_freq_millihz = mode_freq_hz * MILLI;
 	parameters_found =
-		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[0],
+		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[dsi->vclk_idx],
 					&cpg_dsi_parameters,
 					dsi->info->cpg_plldsi.table,
 					dsi->info->cpg_plldsi.table_size,
@@ -1564,6 +1564,36 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+RZG3E_CPG_PLL_DSI0_LIMITS(rzg3e_cpg_pll_dsi0_limits);
+RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
+
+static const struct rzv2h_pll_limits *rzg3e_plldsis_limits[] = {
+	&rzg3e_cpg_pll_dsi0_limits,
+	&rzg3e_cpg_pll_dsi1_limits,
+};
+
+static const u8 rzg3e_cpg_div_table[] = {
+	2, 4, 6, 8, 10, 12, 14, 16,
+};
+
+static struct rzg2l_mipi_dsi_hw_info rzg3e_mipi_dsi_info = {
+	.dphy_init = rzv2h_mipi_dsi_dphy_init,
+	.dphy_startup_late_init = rzv2h_mipi_dsi_dphy_startup_late_init,
+	.dphy_exit = rzv2h_mipi_dsi_dphy_exit,
+	.dphy_mode_clk_check = rzv2h_dphy_mode_clk_check,
+	.dphy_conf_clks = rzv2h_dphy_conf_clks,
+	.cpg_plldsi.limits = rzg3e_plldsis_limits,
+	.cpg_plldsi.table = rzg3e_cpg_div_table,
+	.cpg_plldsi.table_size = ARRAY_SIZE(rzg3e_cpg_div_table),
+	.phy_reg_offset = 0x10000,
+	.link_reg_offset = 0,
+	.min_dclk = 5440,
+	.max_dclk = 187500,
+	.out_port = 2,
+	.features = RZ_MIPI_DSI_FEATURE_16BPP |
+		    RZ_MIPI_DSI_FEATURE_GPO0R,
+};
+
 RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
 
 static const struct rzv2h_pll_limits *rzv2h_plldsi_limits[] = {
@@ -1602,6 +1632,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a09g047-mipi-dsi", .data = &rzg3e_mipi_dsi_info, },
 	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
-- 
2.43.0


