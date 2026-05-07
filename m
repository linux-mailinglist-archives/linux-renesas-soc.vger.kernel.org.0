Return-Path: <linux-renesas-soc+bounces-32197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEvIAr1e/Gm7OwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32197-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:43:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE524E6317
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD0D0308EE22
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4305F3BA23A;
	Thu,  7 May 2026 09:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UCWfRQ64"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010062.outbound.protection.outlook.com [52.101.229.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A1E392C56;
	Thu,  7 May 2026 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145785; cv=fail; b=Mna6SPr4OJJo43jRBKKARwK/tOXoM/baHTVkzkTLx+f1TDn6gBoQWFSrJ0FuguMgo2hrVURkPTVQDKdK8sdbAkiAJdo4AtDX61GK72o9A8PAqgFk3RzCPwAFgpM3gZGK35Ux7K3R/Lr0WTy3ZhnCPAAmxKkRsddYCW6/ld4owJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145785; c=relaxed/simple;
	bh=z/FB2Hdc/X0hosikeqfhM3wc03hPt7idj+xz0nBMqYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b6gcko0iaTh5e02S+0hmhCsCzKaiCjuRzkqYwU5//CDMklE/kn2tMOaFLPRSvvHKYCmzMBJVw+j1rmCdAkFVD83g2VKLNH5wwYkL3FibTFdMtQAdRgcscVW7FsZiY2DPmffuwnEpNaZ9ym2KmyT9Zrk2fYip+zd4YeHvNN8fDE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UCWfRQ64; arc=fail smtp.client-ip=52.101.229.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GamD9nYHk7mst4LRxCY/YJvQBaPuwtsBWC7Se5WkomzJfLEQ+dTTEDCNyZ8fz2VcvLb382z3su3kbUVQyQno/W6geSsexcDiv6AYL0IP/ZhNbxKgpoXyPf93QRCYbdN8rzKlTnipZgf5qdBhzA7aIxq3vnNMln4Xr09apZJsz9GlR9LwFKdizq47n37C7v/e8ezN/Yv5cNZHJ9oMz0Shb243cO7hEFVKnevCr1urT0PLEu5eZqIXjbF/69c65XEnDms6wpm0oaZkBPMAYswr2OZP8M8BSnX7jhBUax15KRhlmJ/I13K4+KEAUHucpGd2CZ8hsCACpmPdHiVC44xxFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7nHQ3hQ4UhoYeUf2LWjTWiiCImDSxqCZQ5Ej0Fmy2k=;
 b=nH4IuJoxudtM/oEAM+wNbcMB1YNHYt0C+aPND3IJrNq7CgJlji7jpas+1qqj06TQQxSP/fUB8Xu3f0FsjHhqftEwc743RgjVrwqbsvK/BcyCY+LWN7GDQLpGa5NqNKbFBth979RDQOM1Yp5X3mIeLWJ07rZFRUut7HZsV28bd30sFrpr6DsRk8jODlUTU9Pcoajziw8OjRrKCj/PUDZFkghpN6etmgrU6um3RIU2EA66eGdVB2pCopVAHZxh9WccVL/xqdZJIHksUtYhSJ5W2FyRe+kjyUlfC2DbG3lsxtNzBhaERxG/nibdVLla8/0nk3Z6xjEhxmc+zYgnobduMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7nHQ3hQ4UhoYeUf2LWjTWiiCImDSxqCZQ5Ej0Fmy2k=;
 b=UCWfRQ64zKUlHDTjai5YdnGvkctMW/yaRZOdvYt3+d9er9dQCz7mZo/ypHXaBPPRQ5QBSnall6EO4WuoR5/m9oILZa3KODdcBQwY5I3ae05EVdexkRlMjtRCgQ+IE744kih0jZ0wJcIEXYlO54xdC1K9kVn+e3TcWTGx6aJz/fc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB16094.jpnprd01.prod.outlook.com (2603:1096:405:2e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:23:00 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 09:23:00 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 06/13] drm: renesas: rz-du: crtc: Parameterize rzg2l_du_crtc_create() with hw/sw index
Date: Thu,  7 May 2026 11:21:34 +0200
Message-ID: <8836b4fa94c068c3d2b6758c76ec3815844d2019.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0143.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::6) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB16094:EE_
X-MS-Office365-Filtering-Correlation-Id: abb69d78-f5d5-4a96-6439-08deac1a3b99
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
 ng6ZViq+RMZdjtyOeRkJbjfIvoAFmt6+k9ySxlD323BLGUHv6V2IxJuKlTkCXvyAO5lag3Cxyq0IyRXPXdDd9ivfJ6NxmCej06vRHoSbV7P9Ix2lQ6MrM3RANiTLPzMSghMgIL4dppZkJRUS3eoat1bTe2V4f5cYwQCbNp0sRJ753eXPR2xkY8fMe3rCHaPvxLg8gZdEt8296iLH1JEAfjc9pON58Q08pOKmaZUgInqAGxsuiuRJWc7f9lJV9Z3hKUXCOgf6J0IoH6+uTgR/BRXEokyCB8VW6dCkjr9cPFPWqmdBpOCIJ04DAgXfTrkdTZrjNevAJ2ZXKOHJOODH35FEIlE3mbEg4dl3jskkZd+y0fbhEkftSBav7QitXTFyXj5ra9ApyrjnBtGYXaxJ47pulo9DTvCNCFuGqMV0YUB2c5tzKpOr3w0SGD8Zs+cySPBk/3Np9kL/HH7/jYNvN/0jK3NdZ3XHCm621NSbzlvVJDqHecskKTE+ths5LWPJ0jcrM94o3Rwnj0IAQAVgY9SdN1rl9sxY3WQQBrkTNwz+RvsECUuGkgyKno9PoFnHLFyEFFy4qYWGNil61IkEBti0bn8kCqYm7g+xbEihMt3YND+Mx5MsfQ2XNrXzqz3NpQ+B3TSTw9Ewxlc20DH5fJKNWzxe7s33X5XLjzQFQFmFM49W0I/S5hiwtARqlIJIo/aJBygUVNAy42Fn+YnlRtzdlUkI2LYgA9oLgpuR52+Ed+pemv4Z/+jPtjWKI3P+
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?H0i1kMprXAMZa7rnaIEKDVAYT6SnFtn9psgx9ekQz9hgzahqI0YD2Pph/VDa?=
 =?us-ascii?Q?8pBvmVc6VR0xyhqp/ZjyKK+nGn4bmF25dApbOydou6R/CUMjS1NVxbcNcsfe?=
 =?us-ascii?Q?oaicJAEAgk2eS2ZVnsRHKkaaopkrflIWHzE/NVkjEDdnnmZ6ZpgnUkahJTOt?=
 =?us-ascii?Q?jp9KGBGa4lvk5s4sEK+7YITAeXbrTzrMPLAwLjlruNVp+Dp670C4jLDP2F81?=
 =?us-ascii?Q?x32S8MGPjUY49qTReokEAOB3oS4G8Mj87rMsEtc92NNoJkm4YvQczas+TqHj?=
 =?us-ascii?Q?4MfOx0id2J0r7qw3jjlnYooIkzL1sDiUI80/D9mN5g/Zz7/bDmG5C4jMyxJ1?=
 =?us-ascii?Q?gQB/n93NKoMdfvWPjUUrGxzbTST7R7Sb/k+QP0rlIjGh2AvwTZby5nwm4mJ+?=
 =?us-ascii?Q?UiionsqOaVfcpgL6KK6ho+lBw7x3qKOyksEOL5nUj9JnkajzgxxnvifQC62N?=
 =?us-ascii?Q?JzyiJNuYDf918+yTBPgmbfFmcdy7FNjoLOJq7JY8/uHY1OqQ2Elf0DTkQWiX?=
 =?us-ascii?Q?NZ2OttQPOBBcMUfNovs08XEln4FCSkRXFvOhTKCAikCMsKVZL5KMGkKnBWxT?=
 =?us-ascii?Q?w8gLq/QMAu3d4I3xyddmgahPvc3ZIGo1aMK7omxf4c1dVnfO/y+FSgp31ZBt?=
 =?us-ascii?Q?rsAyzivg8fvK2f6BTzc3xmIQHim3ZJKmg6V8Gf1qtqPGqpk+A1W63zfeBxH8?=
 =?us-ascii?Q?oGlvtsXULm2nB5V6KvbLbFnkCHQUAi9+mjlk0070mbx8bEevxiITfGTbvKSF?=
 =?us-ascii?Q?jGSq5KAIgd/1H/eFMtu97a29oSB8dbg/NvBm3MsZK5DY9joMW7XEjcyRWTkf?=
 =?us-ascii?Q?b1xz2jhD/CeekqrzWJX4RsYb4DU2rtF5IyyhmXyTb85RpS1IzKO7p5AkADYX?=
 =?us-ascii?Q?ODaQprbct6pwPnUmhOqZju4KUjtyb4ZAChYaJFn5H/A3+m42vK5nJezsrV2y?=
 =?us-ascii?Q?tiUUvBwFh4nSfcnXexRbVwEKzhVyDYRqu7wL/AIvfU4NhgEepEYapTR7LzPb?=
 =?us-ascii?Q?OnIsEyv3ecy+bfZRqfiLbqwdrQIjmYc5Ioyjj0ha4NWBtyumP1ADOTsw8uMR?=
 =?us-ascii?Q?XpPP4oBiVIjMuwNuXLGHne3vu/+x5fjYRE18oFiEpdoBxuW8L+wYYUxB84fn?=
 =?us-ascii?Q?G8Y5fP3Oxntq4fwQwt/xy+eTSvCWFbMM7Iuls0lUi4A+aTs3us7HHIHrGEZN?=
 =?us-ascii?Q?v+s73TOZQDgCOqtGx5zj7Jyr2Tn+FSGCB0PFW+ROKW8MiN15P1vazL88rJgy?=
 =?us-ascii?Q?Zn5rsAixmOGF5nhz3Qxua4ES4iFLYFv9LYipuhoXIGDFwAdpGUfcwrJJsqOx?=
 =?us-ascii?Q?qJP97cADt4cNNg4wISIflCnwXbhvDW/mPI0EO3tDtz3P4d3BD3BDmryQOha3?=
 =?us-ascii?Q?l1yixVAyEQrsMqYFCuuHxeuUp158NFCNTVZTRU91N40yItecvDsMsy5tWVkk?=
 =?us-ascii?Q?7GzonSKgqcmkusvN0SfcFgUyYgBH9KpTFGCJLQTek1L5IuVCh+XNx1XuMJjv?=
 =?us-ascii?Q?Ylw6EJVK+VtO3LKkAwO1d3TGXtj8lZAfGLv04Ar/J81oA/3WGLS2Q666W7sT?=
 =?us-ascii?Q?blITLTaCy5q+tjOZJaNY/3ZoZ2/7rQAS0erYWjVuyPrDSi22mfB8WL3WPc1w?=
 =?us-ascii?Q?Xr9tGQ+0JPrwdL+pwcPXwah8rlY7X7P+qg2QgP+pCmFCh4KGkGeTIVMTy1yW?=
 =?us-ascii?Q?SZg3S8f1nX1znStM6s6nj7Cnzf85kk7kT1MZz1m3KSOelk/r2fues9+Jy10m?=
 =?us-ascii?Q?bhuqjduvJNjtVCn704xuJyLT7bD3FbbLJICfjKC4GJACLgCJ4w0Z?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb69d78-f5d5-4a96-6439-08deac1a3b99
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:23:00.5518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xsFUpzPMKFVSTWFJwLB4a3BLK0fczrfiig+czaluEGPbSJzZFgz+i14taYf3hwnOQFpWCbEXMfvIcc4NnT52HJkomn8jC+6UbLK3WDcWldfLSfNpHvgZB7xXheMUyVZG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16094
X-Rspamd-Queue-Id: 7AE524E6317
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32197-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,ideasonboard.com,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Action: no action

Extend rzg2l_du_crtc_create() with software index (swindex) and
hardware index (hwindex) parameters to support creating CRTCs for
multiple DU instances. Use swindex to select the CRTC entry in the
device array, hwindex to fetch per-channel MMIO, reset, and clocks.
Store hwindex in the CRTC structure for later use.

No functional change for existing platforms the sole caller passes
swindex=0, hwindex=0.

This is a preparatory step towards supporting the two DU instances
available on RZ/G3E.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - New patch.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 31 +++++++++++--------
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |  5 ++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  2 +-
 3 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 622044f994e8..3e8b6cca6d57 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -388,45 +388,50 @@ static struct clk *rzg2l_du_crtc_clk_get(struct device *dev, const char *name,
 	return devm_clk_get(dev, hw_index == 0 ? name : buf);
 }
 
-int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu)
+int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu, unsigned int swindex,
+			 unsigned int hwindex)
 {
 	struct platform_device *pdev = to_platform_device(rcdu->dev);
-	struct rzg2l_du_crtc *rcrtc = &rcdu->crtcs[0];
+	struct rzg2l_du_crtc *rcrtc = &rcdu->crtcs[swindex];
 	struct drm_crtc *crtc = &rcrtc->crtc;
 	struct drm_plane *primary;
 	int ret;
 
+	rcrtc->hw_index = hwindex;
+	rcrtc->dev = rcdu;
+
 	/* I/O resources */
-	rcrtc->mmio = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(rcrtc->mmio))
+	rcrtc->mmio = devm_platform_ioremap_resource(pdev, hwindex);
+	if (IS_ERR(rcrtc->mmio)) {
+		dev_err(rcdu->dev, "failed to map MMIO for DU%u\n", hwindex);
 		return PTR_ERR(rcrtc->mmio);
+	}
 
-	rcrtc->rstc = devm_reset_control_get_optional_shared(rcdu->dev, NULL);
+	rcrtc->rstc = devm_reset_control_get_optional_shared_by_index(rcdu->dev, hwindex);
 	if (IS_ERR(rcrtc->rstc)) {
-		dev_err(rcdu->dev, "can't get cpg reset\n");
+		dev_err(rcdu->dev, "can't get cpg reset for DU%u\n", hwindex);
 		return PTR_ERR(rcrtc->rstc);
 	}
 
-	rcrtc->rzg2l_clocks.aclk = rzg2l_du_crtc_clk_get(rcdu->dev, "aclk", 0);
+	rcrtc->rzg2l_clocks.aclk = rzg2l_du_crtc_clk_get(rcdu->dev, "aclk", hwindex);
 	if (IS_ERR(rcrtc->rzg2l_clocks.aclk)) {
-		dev_err(rcdu->dev, "no axi clock for DU\n");
+		dev_err(rcdu->dev, "no axi clock for DU%u\n", hwindex);
 		return PTR_ERR(rcrtc->rzg2l_clocks.aclk);
 	}
 
-	rcrtc->rzg2l_clocks.pclk = rzg2l_du_crtc_clk_get(rcdu->dev, "pclk", 0);
+	rcrtc->rzg2l_clocks.pclk = rzg2l_du_crtc_clk_get(rcdu->dev, "pclk", hwindex);
 	if (IS_ERR(rcrtc->rzg2l_clocks.pclk)) {
-		dev_err(rcdu->dev, "no peripheral clock for DU\n");
+		dev_err(rcdu->dev, "no peripheral clock for DU%u\n", hwindex);
 		return PTR_ERR(rcrtc->rzg2l_clocks.pclk);
 	}
 
-	rcrtc->rzg2l_clocks.dclk = rzg2l_du_crtc_clk_get(rcdu->dev, "vclk", 0);
+	rcrtc->rzg2l_clocks.dclk = rzg2l_du_crtc_clk_get(rcdu->dev, "vclk", hwindex);
 	if (IS_ERR(rcrtc->rzg2l_clocks.dclk)) {
-		dev_err(rcdu->dev, "no video clock for DU\n");
+		dev_err(rcdu->dev, "no video clock for DU%u\n", hwindex);
 		return PTR_ERR(rcrtc->rzg2l_clocks.dclk);
 	}
 
 	init_waitqueue_head(&rcrtc->flip_wait);
-	rcrtc->dev = rcdu;
 
 	primary = rzg2l_du_vsp_get_drm_plane(rcrtc, rcrtc->vsp_pipe);
 	if (IS_ERR(primary))
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
index 9b2deb3c589a..1c4f82a1a701 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h
@@ -30,6 +30,7 @@ struct rzg2l_du_format_info;
  * @crtc: base DRM CRTC
  * @dev: the DU device
  * @mmio: base address of the DU hardware registers for this CRTC
+ * @hw_index: hardware DU index
  * @initialized: whether the CRTC has been initialized and clocks enabled
  * @vblank_enable: whether vblank events are enabled on this CRTC
  * @event: event to post when the pending page flip completes
@@ -44,6 +45,7 @@ struct rzg2l_du_crtc {
 
 	struct rzg2l_du_device *dev;
 	void __iomem *mmio;
+	unsigned int hw_index;
 	bool initialized;
 
 	bool vblank_enable;
@@ -84,7 +86,8 @@ static inline struct rzg2l_du_crtc_state *to_rzg2l_crtc_state(struct drm_crtc_st
 	return container_of(s, struct rzg2l_du_crtc_state, state);
 }
 
-int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu);
+int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu, unsigned int swindex,
+			 unsigned int hwindex);
 
 void rzg2l_du_crtc_finish_page_flip(struct rzg2l_du_crtc *rcrtc);
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 87f171145a23..7cbdf146788e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -440,7 +440,7 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
 		return ret;
 
 	/* Create the CRTCs. */
-	ret = rzg2l_du_crtc_create(rcdu);
+	ret = rzg2l_du_crtc_create(rcdu, 0, 0);
 	if (ret < 0)
 		return ret;
 
-- 
2.54.0


