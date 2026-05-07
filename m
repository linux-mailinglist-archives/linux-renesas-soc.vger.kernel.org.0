Return-Path: <linux-renesas-soc+bounces-32198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FkqEK1e/Gm7OwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:43:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F40424E62FE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 432BD3028F70
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099A6372690;
	Thu,  7 May 2026 09:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="mhmKMedy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010027.outbound.protection.outlook.com [52.101.228.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DC03254A2;
	Thu,  7 May 2026 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145792; cv=fail; b=pyUJDmw4sxPy/9i4X9t6pNBmr0U0R04N/S5MBZXaHHYQ/9ouSXWSGrYgJdzFeSf1Sj0ANL/bNvUzYVy/L3u89hbeFhrn4XhhlhsH4CW1ZxR8zMEtZNS7b2ZIxOXJ42g6AkX6gwjGMdbgV5kNkZK9Uu3yHseRnQFeoeV98kbkRaY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145792; c=relaxed/simple;
	bh=QolUDL5gL64A7wSHcuME4EhECbgsUP+eyzqk1hjflvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MX94trFyeQblYfr7TdEvTutNUcoeiTXad54g7ZMxt2Q6epH8hF+x+fob5YKuCBLypn7coLOVgabjA0rDNJgu2OlbN7hQGane0FlkM374SHaP6vnh+4+litTJDnA5+1gjt1hfDIlTxTXGt72JxMnYzuBRo7yGOdZuEf1uQnaBOgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=mhmKMedy; arc=fail smtp.client-ip=52.101.228.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iaCGc60/gjbOquHDh3FvCNTZdseNNPdiUcdmGvwCRUqu4w6RjNSyIU63WKMJsa7QH4YmGj0Pw7gZXA76aOqyRGeD4it6JB9p0jxXxJPJvH6L5lAW6yllYAVTPVcmALv2KKeSC4duSK1mIAdIvdQqyntRqxensyUKHfTKyCUjQ/SyMkWLz9AD1BNY6abjMR24Wu1m9Ncw8Omo7MSV0QbD5EemEquQemAVc6UDzXXREarU76FFD0TjP8joq+Vw6iSyMEZGDwGU/urEdN0X6OstaUZ4BggltiBbtbXYyhSHOiCGSMa0qxYoYEKcgVA3hhz+3nG9REpZcsgCNcXuSoVFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=03oyK7yJ6k8WEksA0LD77Etg3z5omUVlxh9fvqUQ4+s=;
 b=bWqy3hYrMUjrTMIe4Sz6ZibXzaV5K65s+gleJBNiunbepsjqih3cLx88I1+P027bsvDq6Wl6k2mwah7PKjox/e0hyBz58gk6vxWl27Ox+XLBXaCdnA1NF8ERIejI7IZLLwUfWtXfvi4lvAAe1YQMPBDvOqvZ3do5m5BGOnG6xCKqW9tQTkuoJEPy87K9x0ajj47JWS7EK5z4MKb/xqqY7BW8jd9czBLf/CeCd6+xmToMeIwfa4Zl+w7ohUZnFEsUPDMBxP5Yv+TTdlZZBAAG8GPXhTJF+TBGmA+B/5YZ32j7g2mkdXqHbsY97mtl9uyQPFOAsrRQZjVuyPy+Z9yyTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=03oyK7yJ6k8WEksA0LD77Etg3z5omUVlxh9fvqUQ4+s=;
 b=mhmKMedy/ZRzlqChlgUb9DJYcNjlNyZ87gH+CNhCnxyFAyc9vrXluNFbwsJFL4N+AyoTd5xvaxUPgbLdFTFWYJaOOez6y+3TiQjpqbRlE/+QGHcsy3hfkDRuQL3QosMWWjVUBuwUE8MwB/Bx9yfP10B9d2VRIdbEc9MBsskGP7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB16094.jpnprd01.prod.outlook.com (2603:1096:405:2e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:23:09 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 09:23:07 +0000
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
Subject: [PATCH v7 07/13] drm: renesas: rz-du: kms: Enable multi CRTC creation
Date: Thu,  7 May 2026 11:21:35 +0200
Message-ID: <877754bc31ecb9e431624258ce278dfaa56357b6.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 040bc751-3bfc-4717-3e63-08deac1a3fe7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
 C6fBrqe87YkTCuPSkQUuuhik3L3wGCHK80cdYAuRZz9IhzObU2sq20/FWjeg1x/LsUpR6HNTE39LHedAmcfjts16OH/0oABZbhtP+CIW+ULrLehDYiekjQmQPysUHD/aaz7wyeJVcRBbccWQowifR5pBtCR59UjtDdY5op5S1NcYKkLVws+bGxXMBP/llD28eqoQ7AsXxgg7nxqjkk1BQVeDXo1hFv5HPK3F1BPqSwq7fHzWHVhubcj2ffxiBtmRJ/mm3gZea1+RDPyQLsPuTRcCSqrk5zLEtspM9axSZ5PjWtCzd85Vprx9KlCRmyemdXyOan5ceKhuOX62x/lsDXCPovVLqmDJ5NOvUb35WJ7m5KwPyo+bh2Vrl6YJoMm4eUxH0D1r5zcgs/SoDcy7CvuOZI+XXxk5VoOxDQwFCB4CwLjzh5lCIlnHxZ351c0jvx8wbdmX7/uCRiTa+2MGDME7USScShOmfBXsdcA7YHcP58PEW1qU0N2xUOMuh2PH7if0d1jHbwsIQ+YupGjIvWaurPKLfPEDn5cQm5Jc4fzjSc8zmHZNFF3w3wv2JTElKonbAxPdMt1dVg7f8KfrBN+ddrLBdyeQaRt0LAgf+AQrpl0oMnvTwTqH93Yolf2bJXrE+nA9B3O1nd7lBCCqRMrtpX038CnKHxGbk3LxzcPtKlLUXgBRC8witsv7m5zWS9L+cYZ6DxSK1dBpjUjX428VT1KrDi6vFbNc//EsTH+ZDVJfKSrkBG2RxoVAaBWO
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?tS+dmBOGXJdd5HW27fyaoLoIZXsmMrEeQ+M2gz+sjWEgcOXDsLZo96zmn/Ns?=
 =?us-ascii?Q?OLSWy1ZA5ybxd9Phe0Rl1n8Fp2i6CQupZviyvofjCQYKRtxgaO1mHaTDQMIi?=
 =?us-ascii?Q?xiK6bKjhsAry8LF7Gb9rO375oOBuJMzVDZFm+atfKCgMfLjb9z4Fb5M6f7ft?=
 =?us-ascii?Q?iLbFi6P7apsvfv4diqoEgzJYwupfMGP4Lctv9vWg5b2XR3XdCi4pP2JZ9nNc?=
 =?us-ascii?Q?SnCQz4S0oBkn2lct9DtrAITNa/lA6QDjV88RR8qmw86Y3PVPbpgY0s7RGgAC?=
 =?us-ascii?Q?NDB9ecewVJZ9zgZbhXmqYfrJck5GLDbT68nPQOWuI21dnBRp4VjikgGaYsCr?=
 =?us-ascii?Q?M1QSks2IcaSo8N6YBQyohx65WIsmcd681zNPrT1p4cih9cWPHNBuvwRQoxts?=
 =?us-ascii?Q?J+/PoPTr5xrfGNw7UglUNGyc6UltOG1Y/V2LaFYMwqnsEWcLDPwX8eajE8fw?=
 =?us-ascii?Q?aeVloWNYCjYQqgOCe9RLOTjJ2jVR0ZsPkwdiMpj8iF3EYG3ZNIzNSISopllK?=
 =?us-ascii?Q?s9HA7MNAVSDDYSFH5ifwZlhi15+n5W2qE+fq2/QLf4pj+fnLFWVW0NS5F1C8?=
 =?us-ascii?Q?664hjkXgkZPtx1rpaZbIUVM0F0y1JVGZeRj995ttbVlmVMQWfkpR2CbRhZOk?=
 =?us-ascii?Q?KATJHmCN+wPYcTuEXrJNjL+p8HX23QIrDkO4Phdm7qMq2rUEZC16jvNtHhMd?=
 =?us-ascii?Q?P2X74aa8ttZ9FZ7nPHJ1xD2qDrcDO8NbFWgUmI3xdIhap1VFjKCMKokL9lR0?=
 =?us-ascii?Q?5mWBetxSh5zFMWpQoRLVd9zdsqlHAj77RztC88rziyp1TFF8seQDc7uR42D0?=
 =?us-ascii?Q?BQD37seB+Ol3vISfQlhPXHP7O9pBDsivdsIquEDkAy1Jrzcq65/lFAPkfTnT?=
 =?us-ascii?Q?0vmNw0tI4inuxPcMDR7DaqPcBt4ozU3NuctESEGDIY2RpyHgsenCQAO8w1hL?=
 =?us-ascii?Q?3JkhJDEZsPNeAiFKwSlhDcFIFGHuG5ePDSKjfOmtTr7NuuORcHmFxrED06zo?=
 =?us-ascii?Q?hGXufeN6QQvAHii4o/RSXGAgG/a8VoFUoJfGTgArDhEZ1IpSotRYvWgvf2Gm?=
 =?us-ascii?Q?5ZT44qRJC+CcMCRSl+ZPvFmdM+P1A5F2viTOi3a7tkw0mvWhahvkLCNGJ0jG?=
 =?us-ascii?Q?+rV4xKb7AR3T+QgTI+W1uNfk+8pvsZQGqAlhfwK7xPqz9uGvieiTqNOTlX9d?=
 =?us-ascii?Q?t0yYS+HK8xziCZjfrKEeK9h6ZLlEo0ylZxMRKIzP9gOThFouS0cJZVcnCOas?=
 =?us-ascii?Q?6pfo23hNASRyJo1tpkt5YArSYCJG7gBVCBgW0396JyNTh6T0W9hSpimULvCA?=
 =?us-ascii?Q?F73Uq912Tn6w9V+VxXLEg0j5eKz4dIxVGbb9PbqaKHdtTqSMbYeg+UXEVm48?=
 =?us-ascii?Q?WtJWsdtQ1wVDRNJCr8/ioP/jPLCLSfYmQ2lpDK4N6CmZDReaLnnXntwzbzba?=
 =?us-ascii?Q?kxzYN7r8cqzeOOgcXDCqYUgSp5ylUYWTdPKu8WmnlyTS8HaVdlzX2zDPcVXe?=
 =?us-ascii?Q?EDwx2thMTwgV3U+zqa50KaV8JHg2hGRWKqKUx11ato/W48vrgLRiFip0Vy1q?=
 =?us-ascii?Q?u1o0nh4P9mYddDSsLVbsD3xHsdkR8IXg4GHyb9kqfI62f4AFhee1bLqeecuC?=
 =?us-ascii?Q?QIAg2FviSuIF1+warcKDfPjDfGs5FcKL81DJr9HpLvewhj60IbeCatTmAMF0?=
 =?us-ascii?Q?yiFu1rhsXU4nNeSvXl0r9mU7HVbdzJt4JSFwwTOHiIPUzQv07O5swEPjD/i4?=
 =?us-ascii?Q?gScr7tDlOFK3lsa2SjdAc7xqtRpVbRM29K7+zTthXW07rc5L1C3y?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 040bc751-3bfc-4717-3e63-08deac1a3fe7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:23:07.7823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Z71pOFAMBa23jO/SLugE5ynE2WxNA50TjcWE1B7LomsTeAKFT4w5TCj5nHLl59dljRsiG2NQPq+YLEJXQ6REelJtQwQRUE2zZxcfcf9WangnPKQSGevyHCT7fJKZUFW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB16094
X-Rspamd-Queue-Id: F40424E62FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32198-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Action: no action

Replace the hardcoded rzg2l_du_crtc_create(rcdu, 0, 0) call with a
loop over channels_mask using for_each_set_bit(), passing the correct
software and hardware indices to each invocation.

Iterate the registered CRTCs by their hardware index when building
encoder possible_crtcs masks, so that the DRM software CRTC index
correctly maps to the hardware channel.

No functional changes intended.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - New patch.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c | 28 ++++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
index 7cbdf146788e..fc5ce8c7eea0 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c
@@ -404,7 +404,10 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
 {
 	struct drm_device *dev = &rcdu->ddev;
 	struct drm_encoder *encoder;
+	unsigned long channels_mask;
 	unsigned int num_encoders;
+	unsigned int swindex = 0;
+	unsigned int hwindex;
 	int ret;
 
 	ret = drmm_mode_config_init(dev);
@@ -424,7 +427,8 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
 	dev->mode_config.max_width = 1920;
 	dev->mode_config.max_height = 1920;
 
-	rcdu->num_crtcs = hweight8(rcdu->info->channels_mask);
+	channels_mask = rcdu->info->channels_mask;
+	rcdu->num_crtcs = hweight8(channels_mask);
 
 	/*
 	 * Initialize vertical blanking interrupts handling. Start with vblank
@@ -440,9 +444,11 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
 		return ret;
 
 	/* Create the CRTCs. */
-	ret = rzg2l_du_crtc_create(rcdu, 0, 0);
-	if (ret < 0)
-		return ret;
+	for_each_set_bit(hwindex, &channels_mask, RZG2L_DU_MAX_CRTCS) {
+		ret = rzg2l_du_crtc_create(rcdu, swindex++, hwindex);
+		if (ret < 0)
+			return ret;
+	}
 
 	/* Initialize the encoders. */
 	ret = rzg2l_du_encoders_init(rcdu);
@@ -461,13 +467,25 @@ int rzg2l_du_modeset_init(struct rzg2l_du_device *rcdu)
 	 * Set the possible CRTCs and possible clones. There's always at least
 	 * one way for all encoders to clone each other, set all bits in the
 	 * possible clones field.
+	 *
+	 * route->possible_outputs uses hardware channel indices, but DRM
+	 * possible_crtcs uses the CRTC registration order. Convert by
+	 * mapping each set bit in possible_outputs through the hw_index
+	 * stored in each CRTC.
 	 */
 	list_for_each_entry(encoder, &dev->mode_config.encoder_list, head) {
 		struct rzg2l_du_encoder *renc = to_rzg2l_encoder(encoder);
 		const struct rzg2l_du_output_routing *route =
 			&rcdu->info->routes[renc->output];
+		unsigned int possible_crtcs = 0;
+		unsigned int i;
+
+		for (i = 0; i < rcdu->num_crtcs; i++) {
+			if (route->possible_outputs & BIT(rcdu->crtcs[i].hw_index))
+				possible_crtcs |= BIT(i);
+		}
 
-		encoder->possible_crtcs = route->possible_outputs;
+		encoder->possible_crtcs = possible_crtcs;
 		encoder->possible_clones = (1 << num_encoders) - 1;
 	}
 
-- 
2.54.0


