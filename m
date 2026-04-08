Return-Path: <linux-renesas-soc+bounces-30975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJIjEUgw1ml6BwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:39:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A67A73BAAC8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C72F9300BD9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C1D37DE8E;
	Wed,  8 Apr 2026 10:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="K82qMUrL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011034.outbound.protection.outlook.com [40.107.74.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB732D9EDC;
	Wed,  8 Apr 2026 10:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644688; cv=fail; b=Mn09ESrxETCFCCOyw3/rlhSL2cAPKZPB9FMzJqrPKLXh8EcCOm4PplvvvqZibmKrJkOVWCW1LBruEWX0lQKxnMabtCBS37+b0Hz+vuKvZQH8gKNtr/Pi8CUujC/ZJfubpkVZgGz7Yhp2TiuImZZcjxkExxJdOhMw4SeL0jqRx/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644688; c=relaxed/simple;
	bh=hwaQIrKM6K0Yo74S5/dudyLfbFAetIUi4VSXOM7dPMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fzE1BjLlQcsSUC5ePohU7No89bc4vPQWGeI5E3jH59yIIN//OhwBj37rF+7F+iiiMoWZTuf8CUl3SxpiMH1Q70DREDTlVufNFX9+T2gbjFhWU+BcC+AmvfutEcia+P4bazfiVT2GeVGoUyWoyC3Hg27b3I1dQzGn4DCnDX5TJ9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=K82qMUrL; arc=fail smtp.client-ip=40.107.74.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xfbpk7jIt9KHFAvtCoKdYc7HX0nj6Y67jAX+wK+NgXn6TqRCHQoTF0oflJSet3FC5ngKXclcdxYQufD4K4V8E2RRgYJfraStKB3pUr+A+WRC17gCjlCwMfxPMH8Yg9J453YbwhH1A/7Xcbf7T0mE9M9WG7E9u1Ymnox+ZF+zubGrNWbkDRWK3aIyJs4XArSFEQlqLYvJPEt8ENeDRuzH3JvbrJRmgtFpbBGI7vXy53jPa1RhuJ2yQnmQXL5s5Brgutj7w3sst+sXjOwuWyXyOs6p9rtRXif+H/N3bdwHrM+asROZPdAx9vXYX9O/f3X4IR3vM2GmdKylfecJmQp3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PraYTOgh86srqYKDCG7HtcsiLJf3woRTINaB4Ps4fas=;
 b=TEXJAprQQHoViMbLF7un6HWw+Q8igv/NLoHo9kMPLK3AtpEkH7kkh5jzXuG1IdTt1qQ5cZkWzgXPswfJNBSVE8WI8kjPE0CweZ8SkMx110UhL/6Q7DsXvaxiHg26IMilPZpI7eVIt0aoDREuh9cxgGMzMy2lABeyQW+FVdEbvfw3seS3p82rlXUlDTpm+kkVcL9wVTzznbWItiOqdJGNW5PPTCyNEbhfVX17QbEoP8hdOArLftFSsThUDeG92qx5+vPyCGt2eGmCb428VtmO+sEb7p7hJGLkurLEXYGYLSkflrIJT/X08A74jDA1MNENQYBSfKw4rljjZMqg/eRR9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PraYTOgh86srqYKDCG7HtcsiLJf3woRTINaB4Ps4fas=;
 b=K82qMUrLqHz/WDB5rpebhi71p3fx7QFUWr7DfW9qIVDIzNjtV8W56ACl3dc0Pu7YnAhcQC7/AM2+T09Db1oUWDOpGoWxmnJ5eUvkcjCZh391SiOi4dMxQ6TAni9ZL9sFV3wr3Q0qpEnqgg/6Dx0ZIHfub5CjexignSxNN58uoQk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB13668.jpnprd01.prod.outlook.com (2603:1096:604:35d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Wed, 8 Apr
 2026 10:38:04 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:38:04 +0000
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
Subject: [PATCH v6 02/21] clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
Date: Wed,  8 Apr 2026 12:36:47 +0200
Message-ID: <dcb0cab96e2ff3e23eafac061b2952c74622d1f8.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2a69dbbd-f90b-4c89-4bff-08de955aea0a
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|376014|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 O1/eLD2/HLwIz/c+M100Ld8qol75fugLcnr2mlyJH8tzHd196+zxxgBuBWPvFDyTRbCJh504yRLARLw6Ch+g0NR+X/7jwN1T72B8dcVTVpDrKBer/agB4xjVV7tdTsiaKviLEXvYXaTAsfPtDRwNFETkIx53iW1khnnSsFdB/BxkhQcjDrCh8FwX+/SIqVrwH69vHGc2EXrs7fOojTWKJ4CSpfOTfbdMtTDwXjIe55C0G4Mj2v4BoLrKxAjBxgv841ZATS6NrsjY8zaBxKWLY/G2jejnpFiAthtHd2IQzPPXYmC4gKXeJ2opz1b6TBAyHVYWjt0fyf1e418yNKz19NqYrGc6/xTLSzsPYH4O04paenqUvDg7u8I0Bm3oHppMKPr/EHW1lFsR2hXE2840ttlUgeW9qqf2GsBIXHMhFUPh45VIU2n/tbawmRWmHWZzWOZqMcY2OE4m9rQTReuIC1mfxqairxOyn6BcajdMQg4o5BEpiaME6Qf/6T4AxfsijjFI1Zm/oGMmWoYKPKAY1COKVbb7gbhx784D3NB2jVNVJsPUzcRKEAJMWl9OueXY9GG1CzpLy6opNzXRQQ3J/Rt/dJ4z0UCppA8XmfMVjCAXmSHWNRGPVrOll3+fYbbn92IeR8bU9JPjHDfj2xUiMsH+egkNOnwh9C8cFvXIAIPPUYjsyk1Fw05CwLF9PCj+Fm9DmSXcJiwpqhGpSbABLjppZc/75gFTmxHpiD6l2FfQOCr9f2vuD4ptHF8ozoRzTggmBuOHg5zHG9Gv7uTWPp8NhM2eQ2vm0sWha1Q1O5I=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(376014)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?mrRExvwBvZmmGHIbKMtCrVMNPyP91LfDrlec6QXZLmVoSvxvErx9Mo6dssIi?=
 =?us-ascii?Q?SQl3UHKIO3R7S1MmhMVz7IVwc+9M0LjdV4vzLIzptcLS8WdgXe7jRYyqnY/u?=
 =?us-ascii?Q?BahzGxZGGsKw1L3mKcjU5NQHU5lizGqhzbQavFLRhVvc49GIYUMdHsySij//?=
 =?us-ascii?Q?2f1LcfBpOUj1qYLZXnxJ+TilFwCFuCCFuqE9AFxO8dIb8/dJmTM7d2RSDSHL?=
 =?us-ascii?Q?A1lTFrukwRBX5HGS4afLVU3NQrYrPmY2AcR0yMyJ8y663HZ5a6/E4/GV8cpM?=
 =?us-ascii?Q?CVI+U/OG+eEZSzG4fAttfi/+11i9KZO1t58VTkNGGPyeVJghzpwoH4kUh94i?=
 =?us-ascii?Q?OWH0u77VK8hANeBBGQdDV/igukPCho9bTYZJ+wkgA/ekblOQHk95/KyCvgw1?=
 =?us-ascii?Q?oCF6UFjRBatdpjeWFApe/+pzw7aj5xykcQ2JeumQk18jXK/FiJsqX4aZOr5s?=
 =?us-ascii?Q?lGuQdxYHWzzZ9IxKDNM8rNuxjOt1/GaBmqbx2NpzMsmFM7wRdr4aQe8ks2wU?=
 =?us-ascii?Q?ot0Lw1XjxqoZw6eT+aoSkXYrBwz5HBObbEESFAujr0bJrNVjRCMSJgGNLlq2?=
 =?us-ascii?Q?JOOR7Xjw7FrZr3erczjDPAd5gN67QHIt5miKKULSmG4MMrxqyDaZ2GdixBUC?=
 =?us-ascii?Q?TVFZoPw0qpz1kaghMlONaPv4T1BuB9wWNrX0N4k37yVAnPZ/MlliLl6ysYNO?=
 =?us-ascii?Q?xCZ6Aubd5bdBAlx9qkAaRgXv23GA+fKAUHDQCmlpB7W5SsvgJvAoUecle2LT?=
 =?us-ascii?Q?oyEu2QZ7bpxfz/IlHYID7g4vPl1WyS8dSryDFjPquKRLkpfwlln/GjahiI79?=
 =?us-ascii?Q?GR+16Lvme8shv9sv+Wci/ufrMnStlq3lpdYuU8At03dSp1W9Ce07zRUEFa34?=
 =?us-ascii?Q?/wm7G3t661GxcCFCQtvAkXzbvgE3EjhONzKCmRg5xl7cky/jBJTj0J5M1ZgW?=
 =?us-ascii?Q?cLZlE5WtAxlWvu4Zw+Zc97QWpHNaCNwcmQ67T83By434UAYRFzMSfHIgtgfs?=
 =?us-ascii?Q?f0BL3tb90YPog/sHifeqO1DMXcM7hypqTe9IGKwBVvyysX6RqfPQcZcH9KaU?=
 =?us-ascii?Q?cjMD2nIlmLlE6MsrI3sOc59mZIdA4ZoyXHxN7IB4HKLY6UL0R7vgZvr69SWH?=
 =?us-ascii?Q?8FKDHZrX7ld7GmB8HEVKPJrJEQkNo58e7BeLCSDgJaSnmtB6Lf7tSADAj4Cu?=
 =?us-ascii?Q?S/nU5Og5vpLW5z40WycSzAKSF4P7ZQ/2hSeYeXh3/NkhCbFmYZJeeX8WaVGo?=
 =?us-ascii?Q?3pYC8kkogIu8FiU5aAgCc7K+6sfR4am495n0xo3/imZ9ViPSfEnSagsEVSxs?=
 =?us-ascii?Q?vK6xOApcRePJ7sYG+Ly1ltD3SdQbQjzFnetteTYFNUuZ+2XNPYmIWRYxrR1u?=
 =?us-ascii?Q?Bp9thf7f5MoP4isdgjUAo5yq00AjbpreO+9WdXWuVtPm4/kOuQDzGXZDRg3n?=
 =?us-ascii?Q?3WI70wqf/J54Sq+8P4MJL6Gi280D1XBUroGKRvlx+GdvtQPXVpQnx/SAPgkq?=
 =?us-ascii?Q?2Esv9HyO5BkfTGcr/0vbY0f0T4paGXNq2KJNSeCoMTROTqn8lU+YjBQAWcZt?=
 =?us-ascii?Q?VC+w5ES02o3FRH3RPltEibCs23DY/aLKUQ955IObkTSvYt1+iIXiL3rNL1Lj?=
 =?us-ascii?Q?vfHSA/6ZRYZ7OjoK6Y4ZC2JZ5+Igy0odZGThZqa5ND4xXm2Sm8eC/91M5INL?=
 =?us-ascii?Q?uW3GRExmoq7sYJoak2caFauCZYqM/TqJesc/VyCw0sikMRlZgCZ0+VW3+ChN?=
 =?us-ascii?Q?6jyUsQp55n0zlSpuQ93+49Tb9SyHz7E/QF/7WZjAuzzbXTQtMJYl?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a69dbbd-f90b-4c89-4bff-08de955aea0a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:38:04.3804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sa3dNW780NyTfX7CSaL1DpljwU3hFWdJ+JP8RgipyW4KYrxoy2SZj23yDJa9Bamfcc752vZB7l7NUFYzJKq8dWL2xgHKfyhvZZbt+QREE8nf/sD8Kn6CxGd0SjWb+FZ+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13668
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
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30975-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: A67A73BAAC8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add CLK_PLLETH_LPCLK clock support.

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

 drivers/clk/renesas/r9a09g047-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index e59ac4a05a7f..41464a6e9b5d 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -64,6 +64,8 @@ enum clk_ids {
 	CLK_PLLDTY_DIV16,
 	CLK_PLLVDO_CRU0,
 	CLK_PLLVDO_GPU,
+	CLK_PLLETH_DIV4_LPCLK,
+	CLK_PLLETH_LPCLK,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -107,6 +109,14 @@ static const struct clk_div_table dtable_2_100[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_16_128[] = {
+	{0, 16},
+	{1, 32},
+	{2, 64},
+	{3, 128},
+	{0, 0},
+};
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -171,6 +181,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
 	DEF_DDIV(".pllvdo_gpu", CLK_PLLVDO_GPU, CLK_PLLVDO, CDDIV3_DIVCTL1, dtable_2_64),
 
+	DEF_FIXED(".plleth_div4_lpclk", CLK_PLLETH_DIV4_LPCLK, CLK_PLLETH, 1, 4),
+	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
+		  CSDIV0_DIVCTL2, dtable_16_128),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_DDIV("ca55_0_coreclk0", R9A09G047_CA55_0_CORECLK0, CLK_PLLCA55,
-- 
2.43.0


