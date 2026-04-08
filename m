Return-Path: <linux-renesas-soc+bounces-30976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G0TH3Aw1ml6BwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:39:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF43BAB28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E62783001B52
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D763037FF43;
	Wed,  8 Apr 2026 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="SH+Ik9Na"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010047.outbound.protection.outlook.com [52.101.228.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDDE2D9EDC;
	Wed,  8 Apr 2026 10:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644696; cv=fail; b=FmAwl7Vf0vB4o9bRJJgoiBR7krHRmqKJ2hGdlPlBSCpfsNmWxjdqdtf0un/mZjSpR9YBn3mLXNcmAfmqlAYRUN+4jqCA0Oki5sPqpnoEnBkffV1bx3gPjtpNFJwSAoeFFS7FEe4rlYSYFKes8dc2IIt8BiZ4ESsmkRC27ZyfA9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644696; c=relaxed/simple;
	bh=bPijvbLV27R/e1uiqlby/+aBejJMaQkVuy4nD9f4sEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WTkU9MuI2Vi/wTTC5a0YmUvDIaU9ANhJYTHd8gVegxExrzLK+lfAvFuw5paj/taAEGKHmdPMid/OhCZsZEgsG9ikcjZUzqskplN/V3uzpf8Wlx5aVMCfHEPfbT3FhXLgJf4iQ4JGffrbWNds2xtP1V9a+9THg+bauhec/fDYTgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=SH+Ik9Na; arc=fail smtp.client-ip=52.101.228.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RtR/0aQ/qr7NFu/5JtFgB9Cjqzkjrneix+An88sv5taGhWSQP8H3kgqytv7G3uKtTsPn54NJSodo3lshWDRXcB7b1bJ0iovPC0uugnZoQ0rxqPLzRGcXx2ZkJm7dV3zLB5wIUxoTLlPWZu4hSfn1zkfR/FiMyny38JDiTqSD2wvytV6grsswLk19maSNmdosN2pZ5LfGjFTVcSqkZuC01V5/nWgiOAE55ezQr8JnmKDqlkXlFMTGFNl1oN48yH0x9q7ljm5wQtbdmfwHcu5cK335b1FlWQn1AqGWvHWHPyG8eoxpsb3PkbxmhzrfD9B6DJ4MOw8jTdVdIKtgEgr1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XWTesAOHkALC7ROaeIeNQz8xB+YtUDOOm1eGygT5Fc=;
 b=l0020dEIjtqkZ0qhAzuikDJK2mljTpF0NM8waMPvdgW7vnbuW2X4msWm0g06wwxCLYGRzJvGXle4PYVeVW9asvf+y7sh5Kl8rdS5Si5lyyPKUV4vcTnRozvx5rxfLRq0Rb1N/LAivlAcEAyjcRf5aCld9wGsyMcx0fXBEDgfMnN9BSwPJhnpANxozPi9UXoNTXoSPvxgcqFQRJTOe2gxjoTPGnn+Nox2MUNAhKSV7FnQ8Pd2M7nHYtKP1YL6cP02kVmRaftTCOe42ii0zeK96ehTK9f1TbNmzxTmmGYZxEtq3I0dqx2FTAZsWKyL4YJLAmeipaWO4kAZ7rXEk6WEKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XWTesAOHkALC7ROaeIeNQz8xB+YtUDOOm1eGygT5Fc=;
 b=SH+Ik9NapPBUVMicYWDXMeaL3M17dkHd5GXr58ESgvN+rHJo4oH4CUuNxfXN8KRsV8eHsBtNGwKLhW78owpThBeNNnVZHpwwdpvk4SUMoJqrYbgl46UyGAkcyzXkhvNxfjbuq0NR1rtLdwfak3ar3eRbvyfQiHsjj8u/f1RC2ws=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB13668.jpnprd01.prod.outlook.com (2603:1096:604:35d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 10:38:12 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:38:12 +0000
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
Subject: [PATCH v6 03/21] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
Date: Wed,  8 Apr 2026 12:36:48 +0200
Message-ID: <d26ec5349b0eb7ddb7d244fc53d1111a8530328f.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB13668:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e2585fe-e385-4e17-9ca9-08de955aef17
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 K8Do/XOgDgffQ1cxtlNOZPLcKZjY7C8DalzvooUW8vDUIplS8nMkBuH2R3S8472npcdtiYfoSGbxcGC96aqBgqbmeG4E2GfMswIHuB+p4x9flicpRtX97dHFsPEGz1cETrvJrx+994cBGrTmijcZt9V2P45wA6+k/0yT4BbaUi0DTDFxlFzExG7U1fn+8eShmW4Ckd4SoU6fKtapOfysrzvisw3fdzBiC9KDbU3zcq2Bv+SNTDyaLh6Ep3bNiIllLRByRZHhDwSwOTYHwvuLK+6H7xT8+fIwOtRIsr0ADKnb4IdX5GYBnBmTnF7b5tqcBpb1L1clKzXUZTPPW8r2B19fhifbcv8kCU10Cs3MWNYtPeuqFI17C7BfvaAjgjSoAh9BBmlVNieoCsE7NuBC7yXCb6XJlDp8RGuQ2wBTuXKduWUyngaeuNwmKbsUkd3DqPWmg4/p6ghEz9gUtvKNtxtpDd3qcJOTfyWIVDWXsLookFsumibIEzMXWp/LAsJtSw3GAg/iOS6NTcR8AISM1XlNxZnvbigdC2V05Y7Z+kKYd77di7lBkQBt6pfhQSAf5ILzEo2ZfvqX+RuISXxg/ootE97nXAuIQNm0lCvuxL/3vWS3wZnXMRrL4MjRfJn8dv77PYi/L+z4TTYpCB3HptwN9CZf4pgn5xc65PovSsFaiVvLMh+cAMSM9eCLMn+SSXSAnjhrbimPidxRGrMeT144wP7NgDpV4SnnTkR0YdnqMp5iKnsfICFAAf/M8yNgBr95CqWIFl/u1ptAbqySSgwaN2QV47LB8TgxNjzuyFo=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?LNQfPHki4veHtcyfvpUvTsLGsUCQdgUNJBH8F6rKKHlgelptlILbBPI/Efq3?=
 =?us-ascii?Q?9okGqcBEST7tAEoregUHeaUP9eiug2ysjfM8X4ZlqM1cgAdpiHLTK8AXfB96?=
 =?us-ascii?Q?ONa189ONv+bMn5idRDlN/Ks8MOlnahPDGFHEf/8Xy07jdje4jsqd8YKLHqgh?=
 =?us-ascii?Q?hPK1HRPdXFLfm/EZ4jMpseynP/wPTRb1wyEIQ+MVXgfloGQULF+wpKpsv6Pf?=
 =?us-ascii?Q?v3cmM2ovEN8lNC6J/DqFdZdW6FnbbCcTa5m6OxeoTRfZPufkouwT0U5Kco2g?=
 =?us-ascii?Q?xnxTx8o/wZjLQRlvpU57xju99CCYhWMkqgZXUm1Q4nrla5lsYsphVeYajoke?=
 =?us-ascii?Q?sZ2Pzbs6xXLU+QPPR3sqo06p41L/bKpDnJ330GlfeRwFtTLL9aHEcAcaa6vW?=
 =?us-ascii?Q?5nY0GBkyouHoaDU7UoHWjJaJRjla9ne9RR0jrEWo7PT8eqL15hKUPMRevdzF?=
 =?us-ascii?Q?/IRe6SEhdqSa74+2Zv53QkSvIkAS2FmSUP+2GeFno91y702RAqPOtBz1ufHF?=
 =?us-ascii?Q?TpfAIq7B8tPh60PfGah2Lp4ANeqRueLdPu6e1pwobmWsrQuiSJO1X8tVUr3O?=
 =?us-ascii?Q?NxVd4SbEHiM9fSbirwQpNXUJnvS7sanCaMzkjO1mk7aCQOalZgYZgJhqv/dk?=
 =?us-ascii?Q?liAIy8RlIT44Of815a53Wz6D9TNRBePIQTdFU6JOvwBL+dGkzzZtJQXusgab?=
 =?us-ascii?Q?a9SZZmFbQXbnmLgabGYaa5kdiCiyR9IZ+RJpLX8SVNandAWtxx4IUnuYaM4M?=
 =?us-ascii?Q?V7XCIjSLI+2ayohBylCIjB7CiF+G9kWmASQCll0x3JH7u9yYvI9xMyBJ/eAY?=
 =?us-ascii?Q?AdZ+N8uXequEKk8uoxEqSn7i0oDz2oJk65tOmZxMJ2V93IhYJETZ1196HQ55?=
 =?us-ascii?Q?dobT29wb5Twng2CtL6qOx2dqQJGAF0nAk97gDxBnfu0PHlCCqZLvepawQXQg?=
 =?us-ascii?Q?Yy4ac0s9IQgANv786OoYPltWrkLeNv9kw8NJpGMhS2tdWn8K6Tpgw2m7WFbu?=
 =?us-ascii?Q?XGxgNbNtyIwdJdIBrQ053ucOOU2lWpI+WnM44wisoqCk+gzEuwVp4SZZbQ+6?=
 =?us-ascii?Q?/SBgVYO9sq/PaoeiqyVpN+Vxufq340mv/facKyAMN9kOAoDAGSq6Qgfy89XT?=
 =?us-ascii?Q?VynCrKWs+I8N6qe1ZlgRj1h6ybPwvIvFySbhaumKQk5JIcMabU9fv+WRTqfM?=
 =?us-ascii?Q?Dl0cbwRUX5Xfh7v9NYBCtptBHzxMN2KRPfL/ggI+Du6LGCjsAGA+YAGBO8fm?=
 =?us-ascii?Q?3Nf2qkHllfzdiLIDzjtl5OuEf2AuRJt6Co7ChME7PKbrXqZha69mSvftaFK+?=
 =?us-ascii?Q?MLXhUTOdu0EP++G2TSKyXm00Adw2WVuHgooMLeHrbgQxwZzdRpNRMJPtNy6H?=
 =?us-ascii?Q?K60YE+3l3TbeEYKT3Cr7fUhjjI2QVtItcT1ead9WA+YO38m/6xjgIW8J3twE?=
 =?us-ascii?Q?DlR6vE9TXQiwgeg0VZeEfWvcIp+hTd03rkpm0CuiHsLrobjY7vrwmzTD3QGO?=
 =?us-ascii?Q?XYTCksZkOxfpHtVKqtEbPP18Qx/KugpXMA2WXCrWfi9FdaSWX+JCDlzxu7+I?=
 =?us-ascii?Q?buW8i0gIz1++QjryJCqmBoNQu/J3bKs17Je4alobL2bhkdYBVdo39KZR+zbc?=
 =?us-ascii?Q?P818Xer6D+b/JzynHebHUrHn5SRZYNMMFCgMQqvFl/n1/yHNJx0gcu5a/X7o?=
 =?us-ascii?Q?INk6/eaRmc2Jh8qSADBs7t5BHyz7psWo50xjFmCiLVDj47c7tmrgSjg5qt1H?=
 =?us-ascii?Q?GQXy8GDxwrtCKM6HHLrP5R3eSUke/NAdJhQsKnmQvbRad/KA07fs?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e2585fe-e385-4e17-9ca9-08de955aef17
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:38:12.7565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bYoYOJynFXxXbX7+PrvmPnx3n0FuFTqYx0m5pPlLG+eXOAOAhUVo6ZEKi9TrS9iUqvSj5gh2cQM/cxVxmhM5StIY3UTkiotmqG7+2WJiwsyqOejcQ/yvYKTuRgYLitw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13668
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30976-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: F2AF43BAB28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the PLLDSI{0,1} clocks in the r9a09g047 CPG driver.

Introduce CLK_PLLDSI{0,1} also, introduce the
rzg3e_cpg_pll_dsi{0,1}_limits structures to describe the frequency
constraints specific to the RZ/G3E SoC.

On Renesas RZ/G3E:

 - PLLDSI0 maximum output frequency: 1218 MHz
 - PLLDSI1 maximum output frequency: 609 MHz

These limits are enforced through the newly added
RZG3E_CPG_PLL_DSI{0,1}_LIMITS().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No chages.

v4->v5:
 - No chages.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Collected GUytterhoeven tag.

 drivers/clk/renesas/r9a09g047-cpg.c | 11 +++++++++++
 include/linux/clk/renesas.h         | 20 ++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 41464a6e9b5d..87d5924f7e79 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -30,6 +31,8 @@ enum clk_ids {
 	CLK_PLLCA55,
 	CLK_PLLVDO,
 	CLK_PLLETH,
+	CLK_PLLDSI0,
+	CLK_PLLDSI1,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV3,
@@ -117,6 +120,12 @@ static const struct clk_div_table dtable_16_128[] = {
 	{0, 0},
 };
 
+RZG3E_CPG_PLL_DSI0_LIMITS(rzg3e_cpg_pll_dsi0_limits);
+RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
+
+#define PLLDSI0		PLL_PACK_LIMITS(0xc0, 1, 0, &rzg3e_cpg_pll_dsi0_limits)
+#define PLLDSI1		PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -138,6 +147,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
+	DEF_PLLDSI(".plldsi0", CLK_PLLDSI0, CLK_QEXTAL, PLLDSI0),
+	DEF_PLLDSI(".plldsi1", CLK_PLLDSI1, CLK_QEXTAL, PLLDSI1),
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index c360df9fa735..0949400f44de 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -164,6 +164,26 @@ struct rzv2h_pll_div_pars {
 		.k = { .min = -32768, .max = 32767 },			\
 	}								\
 
+#define RZG3E_CPG_PLL_DSI0_LIMITS(name)					\
+	static const struct rzv2h_pll_limits (name) = {			\
+		.fout = { .min = 25 * MEGA, .max = 1218 * MEGA },	\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+	}								\
+
+#define RZG3E_CPG_PLL_DSI1_LIMITS(name)					\
+	static const struct rzv2h_pll_limits (name) = {			\
+		.fout = { .min = 25 * MEGA, .max = 609 * MEGA },	\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+	}								\
+
 #ifdef CONFIG_CLK_RZV2H
 bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 			struct rzv2h_pll_pars *pars, u64 freq_millihz);
-- 
2.43.0


