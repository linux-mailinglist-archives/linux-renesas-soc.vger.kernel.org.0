Return-Path: <linux-renesas-soc+bounces-30985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBU2Gmkx1mlZBwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30985-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:43:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C95D3BACF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B685430522C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F5A3B47F7;
	Wed,  8 Apr 2026 10:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UanaMhDJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517D73B2FE3;
	Wed,  8 Apr 2026 10:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644771; cv=fail; b=SGlmglVYh3/x79iRITkNEftu/8b/YGXQbxc38o5oLap/WFIQdcmCMLu/1Lq803sHsLjoWWVURNGJ0KzNBO2H2sW2t7iiT0cRDkUrVzZSl2s9AA+ndRUpNIYHHqPToSgDX3+guzI9RvoCUW7Yy2jNO5UFvP2y3np0YVKeEKdM+ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644771; c=relaxed/simple;
	bh=xDhsY9RYa8dOIO45N8RsLFes6kdoYl5N/ktk8nEluVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pzxsjnip64vsTPOTfHYYnD86HiYIkGifAFWLUT9i4p4ce+9BQJq5PoCPrJy7KfTxB2ZbQwsAuCBJXPD62L/sAzKUdVehi+kpQn6GApx5yWNrmE7EW/564mxFDockJY7Dqaa6WAHRPbm/+SiS2+QKGHWS/qmc6Te1kC5tGWgqcJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UanaMhDJ; arc=fail smtp.client-ip=40.107.74.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dDpHcW5tN+QjMEV8GsKvI4SSAhmuP/pFKY7JfzBSKBa0rky10gOYpO07r3d+Wx5cdGebH2UR6RW0T7BqS63ceEAQ5Pj/jN8v9ZleUQ0DUHoem/y9rTm6Dy7Ok0Bj5IgIc9QJYsuT0hESz3Onr+HEGidAwxyhUP6kxeMJhMPSuX99IbC1Wlnhd/xuBoKtQ2K23nj/37iJ6kNOAet0aNXoWTcGn/AOY0VWcIztzoInEPC4C/3X8r50WFtl3u6Tfg4QT96fn3o0gQbS/x3P2/5nqq9si4CiZeNbNDaggZjWfnY029kdBgo30lJrzrym6mipz0eVTyJgLfe0qMAWLEkg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNAc0gPQjoahvCdpD5ze6DQq7KTcjPF7sE0oP7A3XBA=;
 b=fgnLVTN+Y80mwMPVWgh1j0AZfw7Tb3GUHfxrVg9mM518k0jhd8YSgpI+mfpNROaq54pzIZ/QfmbkH918l85LrUD6G7rCZa7HrCdJSi67NiFrYxjkMWXRGW4Vz7RmhL68q2IBtKwrHHL/DmBEDWVUImbruqeRdTVhg6IO5PuYF3zJlOL9MZxQH7wkNncHzsu/YB9Iud8o9UmzdIFpKmjzx3bC+gHKJgnfxpHktSB5pLts1pf1fU5OKcflnZggVz5rDWYWDDDJ6AuMapkc7A2Gcl+YaYjc7FGWI/eF5nASBrBc8EptFR/H2Obp+1ktEHb6TkqYvwY7rwTGDeXEDVECeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNAc0gPQjoahvCdpD5ze6DQq7KTcjPF7sE0oP7A3XBA=;
 b=UanaMhDJAdOluMk2+pVghVmSGN0St4ppQTqVWBkdZWvhy+LM7NfNGnbtgrGyIc+Mq9bkaMioziyGsov0Q2nS80fsUUYrxY3O/8SIHZDMcr8RXSM3KYtWWIh1hUM6OPsj8PWKRivrH52u19nFIfvn9y9Z9mBpKVqMCBfviNZJT3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYVPR01MB11293.jpnprd01.prod.outlook.com (2603:1096:400:367::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 10:39:25 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:39:25 +0000
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
Subject: [PATCH v6 12/21] drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
Date: Wed,  8 Apr 2026 12:36:57 +0200
Message-ID: <d4d1d75183944f17d392256d9123523a6bd1a3c0.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2293e441-a4df-44cb-3266-08de955b1a95
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 fX0J2aRwDrBwmDEpTNx6eyaRnNGXnaNHFOcvVeWoqEUJYrRBsaZb++xUglRIlTHq3s2cWFRQ1E/xH8oNrcVfGgSf4QEhRfwkPfRTf5KBRSvkU23cTZFx6h9Hy8D+RsApmI+2Ms1c/sAw/3/RuU8Wiv0JhANs8LpOiX7yqF6nvuoWjhmLgFZ82nJyoNk3C0AQ3ZWS1Q6U6IuOsDnNLqE1eO4txsUGsFmymByajoWI0xxe/Yp4GWbo23hHHU8XdQmXJfaWBqcktwzajjSi8Ndd7X71QWfQGbNY2pHUlyJsOWEFB1DKiLdBJBdP8e9BHxSa5D/0EuSnZplDCjsIzta3vPi4c3ds8ba1yt5Vd08toRLECHFZQFyoTgKqz+fnAMbq/y1bNwQqnsgC3E/1uLETuaM16YhOijPl7wLuH15xAi3UjMupCUxafFYBNnwzcnns+2MGCWZBtvtdGcZby24Oh2baZ1q5yeTqKHPtAF6mADSJg93ukgnc9V7B1BAkswRWWPo5y87aUjtFhRt7WlOirMXj9bXcTrrH8+psP69fu55uHp+eLDnUJLCLzxfHhoXIuDjMBMI3AMmXFRydDdH7rFkgsiYDAgG0rcCuZk2GE8pTzAHaERWj9sOonnsBuPJwXM4CaQ8GhV3k1yqI3V4eG/fKvs2MUUCdfA3W30bG4Nnd9813bPX0fw3nD3Z1Gy4MclabvNcOO6yRc0odtDEp08LXEwoTjXsiMxW+5bW0lcJRkVXyknKn22E0DnLzlYjWsAlb/MQvm8ui0n/Q1nZG4KjfxXEGFApD0QhN8jf+C2o=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?uo0Hs8/xyOkjZVCx3+C2XiZ0jN+3dbyiEKoGV1Dzdl1g5LDkVbnjOq8e+uuc?=
 =?us-ascii?Q?NyB2bua4QKeAbkDqoDWdFok6DFpd7kll/erN9PgiuGKpDM2aOv/fl7JaVM5F?=
 =?us-ascii?Q?Owl9fjLCeHxuoUdorBsxFvKSKmC/6h/tjYooAS6x9ZwcYItQiYebsz5ID1xN?=
 =?us-ascii?Q?pDUI/l4sdIJ3C9e+xxTzxZed2Zl9sK7d2wIvb03owxHaTeg31z8rC4Yzp+mu?=
 =?us-ascii?Q?OoXvPrQaI5eky9WP45SXISFD4m4hG2JtPBnL20h4QjNdMDQoRSHUo/W31Q/G?=
 =?us-ascii?Q?Irp0OMrtkOPhbzrWAxDMs1RGs+DiDQsxBJV/AGf3WeXa4IjNUVCaqJhnxR7e?=
 =?us-ascii?Q?7DDTLFSoFySYBTI2BWDHww+8a2AFpQk15Uxrh4sfNN2F/lPbbzTCIGGQg+wj?=
 =?us-ascii?Q?wHbWL2lTN+0Snyki63x8TPdKYKwQ+CWvKLr8GCN2k88LaTig3GgvV25RctBu?=
 =?us-ascii?Q?QtpbsvrKYJeqN/NP4raOXSjYAIo8SxKkAn/+5i/B/2nFgb/pI+fTuvnsv1L8?=
 =?us-ascii?Q?cO8H4swF6UQBN1Y44Jobco9hKiQw1ECYGslkMbBel8cfqcRX1LlTC5dyIhhi?=
 =?us-ascii?Q?egpz/q0btXeOY+rjDBliLUmULxfccj1c4hMjZ4tBE3smO3/Sg3tQeEEESRtS?=
 =?us-ascii?Q?hRWR9vXmGw1XN9YuaZz1KHVso/+bdIxn79wnyoRnG4zwUazTiitYsh1iddaw?=
 =?us-ascii?Q?Ey8PyNVCvTSaEYFjFKNeKxdjEfviEenVZ+Ska4yZNLLMLrY36BWNo81rXyJx?=
 =?us-ascii?Q?HohVZW1QMU9dFi8/AA2z8Y/KCkmnHjPxzm7rTjfT/dglyAXDGxIZlI1sTeEO?=
 =?us-ascii?Q?BlQXnfsR85PevZEnVSkIteitVgMIxAs34MtRm+nbe86uV41Tv1ceI80kiBBp?=
 =?us-ascii?Q?+RVekVOFfsnxqpoeYjUVQFC23j2cc0gN7L3Bew/lHShllpfLJttWuSRmKcIA?=
 =?us-ascii?Q?99DIYIOuUFCq+9FOpxIXK//Cn4peDcrxnoqae1XU4Ix7mOskDORADt1n/Dh1?=
 =?us-ascii?Q?ID/nQsUtdQamCQKaGSj19SgHc6wtpSG7zBmTdzJ3lfravI81Gxr/fGAl+Qzk?=
 =?us-ascii?Q?U+zYmzoe9+61GKsyZw1bW967oWHHLKmL/d64NOQDkuAJo71e+vxwyBiWUTUb?=
 =?us-ascii?Q?wLwuy4TqQSKc9GWn9A6zGeYyrc7GVnBOQWULu5e6q1YbFec6srJdj7P5IKM1?=
 =?us-ascii?Q?VMOBL05yp/ZzSg4A6kn8D77791LjwBe8JvqdWYMkF5M7NMZvMOvK7A0DkEC+?=
 =?us-ascii?Q?e168BchWtJqnTzY2L4i13IW2kz9bXLNTMEfOvGQnRWe21CoZ4gaKSE5YviPC?=
 =?us-ascii?Q?+tBj2FktnKNs8m8+dWqO04kdjwrleb+Oz+ahXZeouB16UsY8g+XfXOb6UUbK?=
 =?us-ascii?Q?+4Ow2LW+NhA3e5BOsAp8oJoGnI2sxV2UXpdJDvJuU6HmRa0AN7b+PwyPfzBf?=
 =?us-ascii?Q?2NkdlkuHtBhlX6g9hQCchiDeSqcwvj0Kj0siQyHB73vRTvAMLDR/F36q0UNC?=
 =?us-ascii?Q?drIQXoYV4IOsJsA3EghAVfs6ME/qB42HMzFWkDwSn4Hs4CUWGkCFcAtvxzOf?=
 =?us-ascii?Q?7WQQSUa2kUlzHRx7wCHHX2T9JXMMV8oZMG2JLUX2Eue/4/oKmBUNrJzxLAUu?=
 =?us-ascii?Q?dmjFH1crM/AaG0g+VAGYv1bVC70rpxdgOuAHB2Qgw4a6RSwxfSTdDBxAc6Nf?=
 =?us-ascii?Q?ge+o1MqlTe4ltXzYRv5AxedjWlFXOOTk83KC50B8A5ABmJ7mlOeQAMJZaM0V?=
 =?us-ascii?Q?Agmk9/BF5A1x/rKPfJUdw6aufgM2RLHqh6sJJeMGwWK5DzfHUzBN?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2293e441-a4df-44cb-3266-08de955b1a95
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:39:25.7438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chcor1iMSPHQhdk3ozBOEmFedcN8zK/pyQY+egibxoUgUjMUi2X+11IEWJ3nxBvmcpTveujIOze15jP7JN59qTaiiWFsAuMYRpiGP6gopXe8nmwEtVlboa0uBqtgLruD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11293
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30985-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 6C95D3BACF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add `out_port` field to the `rzg2l_mipi_dsi_hw_info` structure to store
the DSI output port index. RZ/G2L and RZ/V2H(P) use port 1 for DSI
output, while RZ/G3E uses port 2.

Update `rzg2l_mipi_dsi_host_attach()` and `rzg2l_mipi_dsi_probe()` to
use this `out_port` from the OF data, facilitating future support for
RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes.

v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - No changes.

 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 715872130780..be6dbf19a24e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -58,6 +58,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 link_reg_offset;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	u8 out_port;
 	u8 features;
 };
 
@@ -1158,7 +1159,7 @@ static int rzg2l_mipi_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->mode_flags = device->mode_flags;
 
 	dsi->next_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
-						  1, 0);
+						  dsi->info->out_port, 0);
 	if (IS_ERR(dsi->next_bridge)) {
 		ret = PTR_ERR(dsi->next_bridge);
 		dev_err(dsi->dev, "failed to get next bridge: %d\n", ret);
@@ -1411,7 +1412,9 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 
 	dsi->info = of_device_get_match_data(&pdev->dev);
 
-	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
+	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node,
+					     dsi->info->out_port,
+					     0, 1, 4);
 	if (ret < 0)
 		return dev_err_probe(dsi->dev, ret,
 				     "missing or invalid data-lanes property\n");
@@ -1525,6 +1528,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzv2h_mipi_dsi_info = {
 	.link_reg_offset = 0,
 	.min_dclk = 5440,
 	.max_dclk = 187500,
+	.out_port = 1,
 	.features = RZ_MIPI_DSI_FEATURE_16BPP,
 };
 
@@ -1535,6 +1539,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 	.link_reg_offset = 0x10000,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
+	.out_port = 1,
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-- 
2.43.0


