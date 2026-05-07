Return-Path: <linux-renesas-soc+bounces-32221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CkZNwRn/GmpPgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:18:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB884E6A7C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B4843018596
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 10:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AD33E6DE8;
	Thu,  7 May 2026 10:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YP7szIf0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010018.outbound.protection.outlook.com [52.101.229.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892B13E6DD7;
	Thu,  7 May 2026 10:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149091; cv=fail; b=XmOZRLBWhRnIiWZn014FA8uWmotjCSd6kgAW5/2QxedSZG5gO4nZLTE75rZliXBaZym6wH3sW0trvUOW0oqd1YtqG3BizvRvMiXPA38Yuar8EbXaR4cbCf+aXwOasDlrXrrogOEwfA6FPCwsbUrQ2iuay3ccJCJdhcRJWn+IkL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149091; c=relaxed/simple;
	bh=IQM1X6yBmc0f69Bvv5G9bHsxSOpKLT1z3JWk8UYdvjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KF0icOtrcY5DRAOagO+LjUFqi6q62Gm0SVEM1jolVVmxuKtr1L1VxjoifpcGqS+EXRDlral61PxHj1N4f6XfbOXD88q5wwiSTTmsGvzcTmiY7GQwusbmkMhJthhttO3V/s7K1u0uUvVCwonFSGaJhz7vx1M4PXTDzy7iUPyrCkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YP7szIf0; arc=fail smtp.client-ip=52.101.229.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3rUiwpOBoXrgj+R4TkcLA91r9oR7CgpjRCMIAnDX/iXmLHsx552j1p4354quXTAdAe44Hqdc9MkF4wRoSJfpQIXkVSiQkYSaKh+LVc6Ux17qSBCFJIiNbYcLp9cfzRDVBHGnzIx3iLWFcQd8ih74QDqXiuD0xksfYH3ppUG+AhCi3N5rmbbt10Ts4xT4i5nUmcJ5bDlmK3sQxq1nM48dxgl9eiqjOk3lT1aDCiB6kil6kRIVkYIgfN9uKs4dj+lieHIQf36yVJ3ZypXwpqkRjHdUjAXyzXw38dXslTPU165bXZ2tBSHXcEwMa4DJNy47sESxVYRza9H3UvytxxHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/baHxHF+rpPb7VmEmJ+VBLR7CQJeYqN0ewcGZ9m8QJs=;
 b=xLdtPrTuIw9g5PTuBuLWIez3BF5Y4lqzU5EFiOhcwEGL9zxNA6sz8Pm742OaLEzdYia+VwxUeLHfaiNI7mocVNG4rrtnMztcIFOBqmiyIkXIwKggl5533yyMBfjJRr95Ga+p5XeDJcZ2gOcRcSUuFPjUXzfmEcPZWpGZ9AO4LmWZbOykPocEJRWsNprNa+Hxhslyaxwy5N77Z/eDCFY9AyEUXSC1s+vpjFYDbg7Dpfn/quywyjVVV+45onmHU3bNIUCmMzhukmR6hwCF1QtZ64EzZtbHDp9Veg1jSUO0gine0/2ktPk5q7OJALLtFX8RQafZmmlgAoBNooCY6CqDoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/baHxHF+rpPb7VmEmJ+VBLR7CQJeYqN0ewcGZ9m8QJs=;
 b=YP7szIf0J6TYaRMVExVVy4OOwo/srZQC5Od0lUDVQj7U2hBOq92rrIy3mDBFrByIVtfFdTbGTSC8ZYt3Ulv0uCszzMrqTh7mJ8Ygq39o1yz59KmIaEFXeWp6F9JzRqoQeFfDcB4dqEsFhczTo+oO4OPgaoPBzaYoUTIFA1shNvE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSRPR01MB11490.jpnprd01.prod.outlook.com (2603:1096:604:22d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 10:18:06 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 10:18:06 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	geert@linux-m68k.org,
	laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/4] drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
Date: Thu,  7 May 2026 12:17:04 +0200
Message-ID: <a0f17f14d0c7e0267ea3290fb8976e40f4c8aeda.1778148715.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1778148715.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1778148715.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSRPR01MB11490:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d7ffa5-a359-42b1-d319-08deac21ee0e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 bB/l36f9qdiPv5TlPBp7rjtwPpGbjr1orYV72FebJ7fwGoMaM1WfMbKqtj8EBjAYX+LAhhMMJe2QA9Fg5azQ0ICDu6+dMbfdcroCD/wAW1ZGKKVUtXNPkXUXPFOhK80Eb3gR64alLR7cYUJIyCTdTr26iB34tS/PnPotU7w4UbIh2VdYnR9cQ7ZAVLtUof+IiGyG/AMehObKXP6/yp1UKeQyheEa4hpJCeZsXqSPBNcyZbyu0X91iyeYbEYxpdsRwh4RP2QbnDpkQebXz+GAKpZXgQ0TnQqdgLsaXIMmu5DTjawhXp0VvotWvoSuw+HuUZ4m10DtgTTWwxipB34PmoS2HIy+9NtmnEQWXr4/w9HabTK6tOcuOrA1WtnjbulrUXAPomIsJ9oMiFlq68ZZYebwndiT8nx2KGBKwbPbqMMxWpkWR/264T2YJl9ywKdPK7UGx5ZtlntRPAi6D1HfGwgKABcwPGwldNfGosYi0rV3ANPJ8dthhGaK/kgT2OGPy6FfQkWvlOsD1rWnCNIks1+M70HFTzEZ3NYeCLJO96hxdDC/JlJFTIYNK61RqONhT/1h6tHPAfEPObedlGIXipMwMl6nPBFlrRYuBAudl05SeopT1Kmy71eMo+kO6of0xQs0uUeJZij1ycNyLbjfox7/2Qe88yzfXivTm9gU4E/I3jwhv/+1kdN6s/eB1N4Ogf6/BBWTXehQTz1CO1aphISce9SlqTd0UJ2Og0AproHu0Zv4FwQEWhqdTgR364dh
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014)(3023799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?/HP6b7ua9eQmIOVarSxaqHmL3vib0hEclN7k1oT0wY+QdOhVgaJI9aYJPCxm?=
 =?us-ascii?Q?kVcJL8e5fWCch4jrotzpgFV3xm2a8FTfAQQmpbczXbZpLUNBrt065/XxT6wJ?=
 =?us-ascii?Q?LnJidToeyREkOMX2oaD14vod4ggNQWnYdS7pVgoevCcZWuUlhCiY+fxBy0xQ?=
 =?us-ascii?Q?vqSD69wou9zYiURW9sAlr0t7ZPQfJtIwC7GAd9wYTCHPTYH870/e0QYK0rPN?=
 =?us-ascii?Q?NpfYEJkAkUMGYKBKO+kTaUOLJ9ZwXA8AFIoe2xOKbOMZL5AhBDffma+Qi+xa?=
 =?us-ascii?Q?0PKTqMG9xADcuJ2c0ZW77Ct7UYI/L6lFhUYWtk8WsvT0FjxVQ1TvaNC3VAt4?=
 =?us-ascii?Q?szDAbQdMTidMiUNA6mDKKGnHXjo6Y55M1K18mw12bUIriapkoGQn5+e8DG98?=
 =?us-ascii?Q?RWZhRyoWIfZ2+mWCSsYy/x/PeHnwXkZFGJSUmQMKN7DfboB9rgjwITf8OaUd?=
 =?us-ascii?Q?/m9igDslrtAXxTtbYIz7OcCp8OEZYwPOPejQbBFM0k+PJGwXulwlp2bF7QOp?=
 =?us-ascii?Q?fNLLWqyyredWea6DYm1CM0zUMx4xhUGXpPdI9pLrr5+DufWFc4tTMu92dvkO?=
 =?us-ascii?Q?CItUXL4MJAJmqjEKh+zr5uoUmy6M4Ea7tnQ21Gk/pCfvNJ4qSok6VCz3i7Vw?=
 =?us-ascii?Q?OFR8jgqoRFk3AWC0q3r55+o3l9Ed+0uGlzjrA2+z7Ls7pIly/CjLiA+KN6c4?=
 =?us-ascii?Q?vTmgZlozkvd49aD3QWhJlkbTbuBfKVMbWs9G3kJ+jQc5rMDKFP8JzZzt36mL?=
 =?us-ascii?Q?OmTz0kX+euGwgwCO+jTvH7sA/ZXvxNt9zTsaRLgqrHWorMbYtLq4N849d6Pc?=
 =?us-ascii?Q?eZgUPodGIYj1NPgEbTUCF9auZArL/9nzEodzytftxPCVZkpZNFuavlYdwt3G?=
 =?us-ascii?Q?Afic7u/CYiu8iVBkQ5CeeI4ePZPReTQ02ZRjv1vI4iOwEWos8AH8xbx0QP6j?=
 =?us-ascii?Q?7W/N+2CQpTingr0ycHw6P6FRVANzgWmbPa3Lw2Awk+4YUtD+j4gUt3vfbqEQ?=
 =?us-ascii?Q?T1KH3I0CkD6pfCtXaFbc9BVmyFY1Jmo9G1z/yv15vzSHsO7kgHs7E0BrYYAD?=
 =?us-ascii?Q?sXSuRtolSg5J10v3mMFT0qlA0LN0jMgRQ3EODCw8mtQEN3iCN/TQ+8bRhdC4?=
 =?us-ascii?Q?w/vAMfqbg5Iz8pBIMLiiGY7ZNSNi7BBnZe4CzwjKaaotYDYJ5waXe189soek?=
 =?us-ascii?Q?eRy4g55H/Xw//vJ3xRWTiSZMcp/NAQUNQL9MhjZOkltnLVk/c7o4SmM3v4df?=
 =?us-ascii?Q?yaHCo9y2HaBteTtvTpsMtYwllCjrdeHSIIwaFYyy3wbNaWiT0rQ7ArX2U7rt?=
 =?us-ascii?Q?N6Akwtbo6epcgSwRjcceJYXqxK55PSzWTAzIxl6aLL1XRaZJ6p+uV0ah46AT?=
 =?us-ascii?Q?NgbpJDThZEyIR4mrQ9fQ5AUAXAAoYTk/A+3VWom+6F9taqyJWz7XGfodySN5?=
 =?us-ascii?Q?qeeKWDopFwnprA8pVPuzxg4qW55nZBATFdm3aeLdCAspsgFhR74M4xW96y5x?=
 =?us-ascii?Q?9I6FMtY1ZLqKT14Dke4ioPe0ZnU+PFa6kLWKyRp+6g8NJU7UXdlkoU0Jd8zd?=
 =?us-ascii?Q?4m4zMAPKDQ7FsDQvIynbHWL1GsqO3X3rIID1NWmfNuS+8oEHprQ6FqDxO54y?=
 =?us-ascii?Q?4vvT6tQVbR0vGPpg3nefJtHCG6FgR4QYJCSGSQXrZIGnIMQ1rVZ+a+LT2L7T?=
 =?us-ascii?Q?LpPsxvubmM4huZCXfunGp0gOqDxQW7ZLr5zPH8j/fSCeg6NJdLZBM8Bi0BQ+?=
 =?us-ascii?Q?w7GQiy/ULSiktx8I+RtiF7xw3cEF+oKB25f12qwTZ/KV+fPGfgDv?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d7ffa5-a359-42b1-d319-08deac21ee0e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:18:06.5266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szvBdFHEG6qvtwxicauP5YeRXYgVwQHiIOb0aLLVQXm5GnNjoWKq2JkeUZNBvnagulSCJ03dz8iS5eix6YDTI8msaFuYTLea23EN8nbkq0xYpz7ItvYFaq7blkZ3gfEN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11490
X-Rspamd-Queue-Id: 5BB884E6A7C
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
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32221-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,ffwll.ch,linux.intel.com,suse.de,glider.be,lists.freedesktop.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The MIPI DSI ip found in the RZ/G3E SoC select the video input clock
based on the DU instance actually connected using the GPO0R register.

Add this feature to the driver using `RZ_MIPI_DSI_FEATURE_GPO0R`, update
the code accordingly to manage the vclk selection.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v6->v7:
 - Reworked commit without static clock selection based on DT, instead clock
   selection can be done at runtime based on the CRTC output routing, this
   reflects better the HW behavior and allows more flexible configurations.

v5->v6:
 - Moved rzg2l_mipi_dsi_link_write() into rzv2h_mipi_dsi_dphy_init()
   + comments from HW Manual.

v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - No changes.

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 36 +++++++++++++++----
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  3 ++
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 15ee402155de..19f8f19e538f 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -31,13 +31,16 @@
 #include <drm/drm_probe_helper.h>
 #include <video/mipi_display.h>
 
+#include "rzg2l_du_crtc.h"
 #include "rzg2l_mipi_dsi_regs.h"
 
 MODULE_IMPORT_NS("RZV2H_CPG");
 
 #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
 
+#define RZ_MIPI_DSI_MAX_INPUT	2
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+#define RZ_MIPI_DSI_FEATURE_GPO0R	BIT(1)
 
 struct rzg2l_mipi_dsi;
 
@@ -81,13 +84,14 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 
-	struct clk *vclk;
+	struct clk *vclk[RZ_MIPI_DSI_MAX_INPUT];
 	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 	unsigned long mode_flags;
+	u8 vclk_idx;
 
 	struct rzv2h_dsi_mode_calc mode_calc;
 
@@ -543,8 +547,8 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	unsigned long vclk_rate;
 	unsigned int bpp;
 
-	clk_set_rate(dsi->vclk, mode_freq * KILO);
-	vclk_rate = clk_get_rate(dsi->vclk);
+	clk_set_rate(dsi->vclk[dsi->vclk_idx], mode_freq * KILO);
+	vclk_rate = clk_get_rate(dsi->vclk[dsi->vclk_idx]);
 	if (vclk_rate != mode_freq * KILO)
 		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
 			mode_freq * KILO, vclk_rate);
@@ -687,6 +691,19 @@ static int rzv2h_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	rzg2l_mipi_dsi_phy_write(dsi, PLLCLKSET1R,
 				 FIELD_PREP(PLLCLKSET1R_PLL_K, dsi_parameters->k));
 
+	/*
+	 * From RZ/G3E HW manual (Rev.1.15) section 9.5.3 Operation,
+	 * 9.5.3.1 Power on Reset and Initial Settings for All Operations.
+	 * Figure 9.5-4 Power On/Off Sequence show that after writing to
+	 * GPO0R.VICH register we need to wait for more than 1 x tp before
+	 * writing to PLLENR.PLLEN.
+	 *
+	 * Note: GPO0R is a link register, not a PHY register. This setting
+	 * is specific to RZ/G3E.
+	 */
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R)
+		rzg2l_mipi_dsi_link_write(dsi, GPO0R, dsi->vclk_idx);
+
 	/*
 	 * From RZ/V2H HW manual (Rev.1.20) section 9.5.3 Operation,
 	 * (C) After write to D-PHY registers we need to wait for more than 1 x tp
@@ -1031,6 +1048,7 @@ static void rzg2l_mipi_dsi_atomic_pre_enable(struct drm_bridge *bridge,
 	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
 	mode = &drm_atomic_get_new_crtc_state(state, crtc)->adjusted_mode;
 
+	dsi->vclk_idx = to_rzg2l_crtc(crtc)->hw_index;
 	rzg2l_mipi_dsi_startup(dsi, mode);
 }
 
@@ -1425,9 +1443,15 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->mmio))
 		return PTR_ERR(dsi->mmio);
 
-	dsi->vclk = devm_clk_get(dsi->dev, "vclk");
-	if (IS_ERR(dsi->vclk))
-		return PTR_ERR(dsi->vclk);
+	dsi->vclk[0] = devm_clk_get(dsi->dev, "vclk");
+	if (IS_ERR(dsi->vclk[0]))
+		return PTR_ERR(dsi->vclk[0]);
+
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R) {
+		dsi->vclk[1] = devm_clk_get(dsi->dev, "vclk2");
+		if (IS_ERR(dsi->vclk[1]))
+			return PTR_ERR(dsi->vclk[1]);
+	}
 
 	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
 	if (IS_ERR(dsi->lpclk))
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 2bef20566648..cee2e0bc5dc5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -83,6 +83,9 @@
 #define LINKSR_SQCHRUN1			BIT(4)
 #define LINKSR_SQCHRUN0			BIT(0)
 
+/* RZ/G3E General Purpose Output 0 Register */
+#define GPO0R				0xc0
+
 /* Tx Set Register */
 #define TXSETR				0x100
 #define TXSETR_NUMLANECAP		(0x3 << 16)
-- 
2.54.0


