Return-Path: <linux-renesas-soc+bounces-32192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +McoMPpZ/GnMOQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:23:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 682D64E5C0F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 11:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 71102301C80F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 09:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27FB3C13E0;
	Thu,  7 May 2026 09:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="NXpThsJc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495F637189B;
	Thu,  7 May 2026 09:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778145752; cv=fail; b=n6MkYJG7cTgWnQsQJC16+qUsBihDfso0x3AqPz7IjJNONzzUKVps/ypqSxzIg0qyqKE/AyJXZuF6VIVrQf6tPQle6MejCqq/WiQKPw7nU0rlQ9Fjom5pB5DpcU4aEKyMGHqcp1Q5m+2jylQ4aaGJEqXzH2ErRKhYcL4YxlPoItY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778145752; c=relaxed/simple;
	bh=7NIMqF+yQrZjtv3uajZVrQLFdoGXUS58/MmBKJPBZhI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ffzspTTIbSI5tCWYQlrtexxlYd1OzaRwgocR68zy6tkLKXXIGyo5a/5OnL3nTWgWTLn5Rx3B3AvtTGJOe13F6ebk/EcQ3cFRZYmXREuISNOJLNsTseb/DsUV3eE1E97/DdxxMZgvNi8ETz1EeDqBz+qWQ2mdN7eYAoAiPWQgoTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=NXpThsJc; arc=fail smtp.client-ip=52.101.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GyC//ksDYDH//tQIFe1Ysm5jJbMjqvruM8vHXvrEFsZboUsUbUJP8ET49eq2PxLwbFro+MT3HvLGQewlqwH0lh3Mjh/G+suwaWzPax71b+kjD+7Mo5k6DbJLmFa9cwjPOil62HD/Gk74sK0m+mV9FZAHbEUXmne7xSYoJA/paVSnxVn1Fp5FcL+M3TMooBpSAN7N5lejbYciBDMfdHuaNAvGySr9OThgQsTbXhhLhi0RSLMDBVKKsOsesgSVQKMtcQNgXMhuDGOCXtZWogXD3P52qE0/6vBCtH2v8iPpbrUyxRXxoWwPuL9afxyphbhYk07LHdpxUMZRfIJl/e7kIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVEXUbAcLd/wgp5EAPQHD9zb3xmGBIzlXvH7wmWbl7I=;
 b=No44NFysjkiZtM4WKka8DaKd3twegiy1aB2w5tBCnl55OTmxNj5RWzfVkhMPsY3q3KUkl+A34ScIQBn8dR8qH+j08m7VSyt9vOfWo4OiXsr571E79E6YQCCukUs5NtShWXmkwA09N443zHJadjTDxTPa+rnzPIuZYwVDjhEVIEegWm33woH+kcCdlspb0nj68ntjbCvirNqr8MHCQypZw/jsK80zzPJ8zPEK/rGgBy/NFIOYbnAJgzigWZdkIFVECHkZYnmdZ9OCdKHbXT0EKL1wIss2MZ0YVvbDx3EcQpzKMWdFRZgxS2UDXcBZjIa0wb9rzep+ZBV7tiB9Ul7saQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVEXUbAcLd/wgp5EAPQHD9zb3xmGBIzlXvH7wmWbl7I=;
 b=NXpThsJcOOfirw5TZPC5U12cjVoMMC0dPJrQMD38lNUB6r75j7U/O26sO5YurA/xlu2X/H1Q3jyiDQHmBBGLgVHO1ilsWM9KVFcdzqcYHMZNveGPLcDvm1Rqc1OCJQQAcnigd7u0Oyq9Qck8wa+yutwDmTwTJHVau5a9zjNOckY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB13787.jpnprd01.prod.outlook.com (2603:1096:405:1fc::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 09:22:24 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 09:22:16 +0000
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
Subject: [PATCH v7 00/13] drm: renesas: rz-du: Add RZ/G3E support
Date: Thu,  7 May 2026 11:21:28 +0200
Message-ID: <cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB13787:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b37796-f2d6-47e8-6029-08deac1a210b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|3023799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 G4+eI88OF/4sNwPlCgTMG1sDny3oVFS/D6bvibkBc6MfUjLyJFgg3gcJN8meaD3wA38lSWuhm2sCqD0MwUoXLCTvKNhq8Bewr34lkPK83mMCVKJWmrc+t2FQS6pnkXoIYGIeSpvFAD+qTmQBF8E2+6enJ77z2y1MrRAXn4SAfq+q9i4cuebiYr63hvkSXniQNU3S0TQmoD1wYU39PR6ff74njdlhPxqvYh9YVmZu/hma73TrwSNWv9S4/+r363YcSAgqQkFLlzksiLdg86ffSNCfD3xXDkpaWR7TFkWLhcAQM0WFyJjS8g1rkDVgutmWKt8mvM7C5IWVrMTuMsLNbJTeB8AyC6YU5Lq+hoJXe+YnC95j/lmYwmtMMl9618FxYEU/RbpO0MN6sPb3xop3vv6agxa8s2GVM3KIEHaHUDvJQ4hRdRcXTgGY8UAqHAhC5zMkx0CYBmbEH2Vrp1PeSS5CEEklrXsttajcBlBZvJn/H3Znk3crLFCyTsyRrfpClwvr1d9zjhhZMNeFIwRDJ3kjGzRL1zTgRJzTGyOSnEDQckO9XDFL71IrKsrA3krOMm2qox0G6lmeimb4a/PqC5aNzebqCHIt746RQQnaUKC0r5rYIlAqWjul+zQrd63rzkmyDD0dhNye+GVr5nxErfzf0dZrG6FauEfN8AXk7a/RJousGkDpx16j99PIqYfkCeGXUxrrrR3CyujsfpTqBh+9lHUKAoeXuX1vLcmJ67Eb+DadIv+SmRYzooNRAXk9
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(3023799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?XUDgyf75/srM+jj6gZmlfaeT+ftQr1CwwXQusV6Fv57PicY3fj0+MNFLktFL?=
 =?us-ascii?Q?+5uo2ihKXrptYqyZ5msZPeAMiQWCWdAvoWZT7KpULsWZ/5ffx3NmMoo4oYMZ?=
 =?us-ascii?Q?D1DojvkcPieVI6PNFxbDtr47lUQ/tlCDgq1K5AqZ8wmJ6ILtoNX1re2iaIX4?=
 =?us-ascii?Q?YahtPGOJLML7kobJI+EzNjpvXD+8YcRhrj/59qmV9PreGN24WzMl6Vm+BeZk?=
 =?us-ascii?Q?9f/LuuOySjxdUJwG8pwxjEGB+GnVl8BG+EKcRxI79Pkx7npAusrpduJIaNlk?=
 =?us-ascii?Q?Vcu3KHxu7r/5o2YjJjSROj4HgsH0bjXcASD4UMY6qkG68ISo/MHPaIO3b7ZX?=
 =?us-ascii?Q?acC6HYlpJTTFAXxrEjGqO1w7KJyZIGA2wv/8kNqN6814XDbfx3ykaWK+GH+C?=
 =?us-ascii?Q?XEWQpt4AeXVRydHft67sELuDdnIszGNXHFkC3MHXTSAV/Wrlp3qe5qaqy9qS?=
 =?us-ascii?Q?vqr9rBhzBsXeVdEI8M49CuoBU481DYkSKDSI/0+truuHcpsW3p5nBZ8OIaV1?=
 =?us-ascii?Q?CjEnEIRDexTltWnOo9FtYZqzEsFH3h0OVdweV6LtcKENrOxx+6RTIcLYM57F?=
 =?us-ascii?Q?thDI7K1Ro+1mpoOmOYYM44xrDVMnR1fheL6BVtUM/XudYozVsTheIBGF9KMr?=
 =?us-ascii?Q?CrzGQb5yc7ViLCzqmmuYmL+daOtxbnUL8rZfShNS6UVooAXGS5kbhhCt1udX?=
 =?us-ascii?Q?dzUrLakMAARZIQUIqaTMrnBRWbevxtSnYrCF7tWcAP8cm8ai5w1h+GguPBL5?=
 =?us-ascii?Q?VNi17UY8T+7E2YxNjFcMDpWTrV8GoQX6YlJTbchPpcTa/CuqOJ7Ur0Xqg6kF?=
 =?us-ascii?Q?tEw4y9yTKvxHdLETEBtijYqWkPvL3cC0QMwsQrkKJipvVJz/oBOodkLZOtLy?=
 =?us-ascii?Q?kxIHFIUpULzS1Z9WoiBpZmtBXoQeF/tp1orIDYOFhMUlfbnmLSNQjgvAOoG0?=
 =?us-ascii?Q?pTBZMdomqdJlLWixLtqWzFCIqrgnF8StC+od/V6nkW6oW6RNLdgAUzPkJdXn?=
 =?us-ascii?Q?F7h5CYrfB9Sezw5azzEbKAGrQrLiUnhsBWR91yOBvhbNVy569QySy8nNevKe?=
 =?us-ascii?Q?lV9NGJFAtf9xJtM1pUUmvWPH6RUj5TfeoaELYGUBiqSwydGrwm+Te5GBQr1p?=
 =?us-ascii?Q?TpIUr0pC8TFETfRcRYVBKrtsAemRr4br28kXsIPtc2q1GBgVxxT9OtJT5tDk?=
 =?us-ascii?Q?feP5ZM40NNKiZAx8514qV/3PQs5iBraC1Pzs0BRzdiOyJ+0m2aWdHYJYQ2QG?=
 =?us-ascii?Q?534MliNeDoadiQfpHJ+gX+WUiWTlxNlKEOl0EXMzYuiD5pRQThnlB3ld9ZoR?=
 =?us-ascii?Q?qX0jDNsIiOAYKu8Gavlq+OQhLtuPTssbs0vW9HV3UraxMfyvYlU2aIt+HWTE?=
 =?us-ascii?Q?pWLyWQNxsJ0cOPTcepjfjIca+RzL0RrOYe9zWuLVxM2rtc5drRnhz6DANQqm?=
 =?us-ascii?Q?9E8qBIem19FFr9JG80FqIYn+iiT1021FoL8AppsoXse3wPuut2Ib8CnCIl2a?=
 =?us-ascii?Q?qLWLxMi2qlIr3EB4srEK9pmAIa9GMGQwjSDObsmc2qhTaeGZxYPwDjx4IiaZ?=
 =?us-ascii?Q?SvpAxbCjx5Ntko/Fb78b6bv1M7keS3NtQP693VrrJtWoyFCcdBf3pkrVLSzd?=
 =?us-ascii?Q?/Fi/i9v63RoWGHleGaCWVlOt86Xh40c9x2iEnWgR3BaieUGODjMZz73sDUnn?=
 =?us-ascii?Q?2L7EwzQmUri0KRZJJ8Kyijc45P7jYT9bCKQ2wg+LuFZ8i7ovdvb06Pn8HUqh?=
 =?us-ascii?Q?JU+smuwNZrXNKywTLw9jR7qWm/wJzgstyBoBKSjNde1SAe2+PAc6?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b37796-f2d6-47e8-6029-08deac1a210b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 09:22:16.1387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mtSG8+1+dJHx7ZbplRZKoEY4pSY5RHHVA/adhSZRotZPDXP6AH504y3TqNrYFNbx6tJbR0lxNqnmjsqi3kJ9JcEo98ujVYWOrkE6Wk7+CAdbrl2kjDImFh7pO3C2Os2e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13787
X-Rspamd-Queue-Id: 682D64E5C0F
X-Rspamd-Server: lfdr
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
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,ideasonboard.com,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32192-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.995];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Action: no action

Dear All,

This patch series adds DU/DRM support for the 2 Display Units (DUs) interface
found on the Renesas RZ/G3E SoC.

RZ/G3E SoC has 2 LCD controller (LCDC0 and LCDC1), both are composed
of Frame Compression Processor (FCPVD), Video Signal Processor (VSPD),
and Display Unit (DU).

LCDC0 is connected to LVDS (single or dual channel) and DSI.
LCDC1 is connected to LVDS (single ch), DSI, and GPIO (Parallel I/F).

This apply on top of [1]

[1] https://lore.kernel.org/all/20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Thanks & Regards,
Tommaso

v6->v7:
 - Rebased on top of next-20260605
 - Splitted the original series into smaller chunks for easy review and easy
   merging. The original series is available here:
   http://lore.kernel.org/all/cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com/
 - PATCH 01/13: Collected LPinchart tag. Removed wrong fixes tag.
 - PATCH 02/13: Rebased on top of [1]. Use single DRM device aggregating
   both DU instances (1 DU dt node), modelling single port for each DU0,
   DU1 and multiple endpoints for outputs.
 - PATCH 12/13: Removed feature flag usage, rebased on top of T2H/N2H LCDC series [1]
   Reworked commit body as now outputs routing is based on endpoint id
   instead of port number. Fixed rzg2l_du_r9a09g047_info instead of
   rzg2l_du_r9a09g047_du_info.
   Added bump of RZG2L_DU_MAX_CRTCS and RZG2L_DU_MAX_VSPS to 2.


Tommaso Merciai (13):
  dt-bindings: display: renesas,rzg2l-du: Refuse port@1 for RZ/G2UL
  dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
  drm: renesas: rz-du: Move mmio from rzg2l_du_device to rzg2l_du_crtc
  drm: renesas: rz-du: crtc: Introduce rzg2l_du_crtc_clk_get()
  reset: Add devm_reset_control_get_optional_shared_by_index()
  drm: renesas: rz-du: crtc: Parameterize rzg2l_du_crtc_create() with
    hw/sw index
  drm: renesas: rz-du: kms: Enable multi CRTC creation
  drm: renesas: rz-du: Add endpoint-based output routing
  drm: renesas: rz-du: Narrow active channels to DT-connected outputs
  drm: renesas: rz-du: Skip disabled endpoint nodes in encoder init
  drm: renesas: rz-du: Add multi-VSP instance support in plane selection
  drm: renesas: rz-du: Add RZ/G3E support
  drm: renesas: rz-du: Update output routing comment to reflect all
    supported outputs

 .../bindings/display/renesas,rzg2l-du.yaml    | 135 +++++++++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 109 ++++++++++---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.h |   7 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  33 +++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  21 ++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  | 144 +++++++++++++++---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c  |   3 +-
 include/linux/reset.h                         |  18 +++
 8 files changed, 410 insertions(+), 60 deletions(-)

-- 
2.54.0


