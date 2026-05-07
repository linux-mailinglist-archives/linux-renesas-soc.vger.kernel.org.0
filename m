Return-Path: <linux-renesas-soc+bounces-32218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KXeFctm/GmpPgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:17:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1413E4E69DE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB8423012337
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 10:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55BCF3E6DC5;
	Thu,  7 May 2026 10:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CcNLggR/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F238E35C19B;
	Thu,  7 May 2026 10:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149063; cv=fail; b=WrV2kgw8X4AUvZuhwdNboFr3mWBh35vmY/GSiwSuL7pIINpqsbz9CiRuQmrL1+xZ0Lak5djG2nsKMbTFZoStkg6bVSiVr1EZfDwAeOFi7mwFLQM5dc4aMiCmeZ5wCY+8Wk59cHv96Z3xoucmIk+pxGJasoLjEDKvdDjZiWtBKcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149063; c=relaxed/simple;
	bh=tqRk8cfwmIvXmHu8D3w5cGdX7j9spnuajH0Hp2z7z+4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YhBoEOth6smgceWm8qbigQAWJlT0zI477WHPx32CrycIcLO+P80i1W+zsF2wX3eT+AQy6tWN5WhKoaRzCBWnCkS5QvtQyXuoAMv30yNHRM8WE+pDI4o2jcVVY02Z/K6G7N8A/U7WoaVe8d5EXI8phLD5kQYYgp/KffBrofKKd5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CcNLggR/; arc=fail smtp.client-ip=52.101.229.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fu21/zq6UGuH+isfkwQ9gLBhRtX5pZyCGJWmzQI79MmA1GN8LnDIjy3kwV67lnsLChTUjjNBmm5YmCuJFr81+22vPTsVi38ZgK8xJe3+UuUZJP7TP6m1UA/CVkirI4KYZ9wEnTivpVgA9iI08GXgpK/vpMfdmhHh/TlAnm5CH9LD8f8nI5U/5ewpttwKZLvT8+iO3gaWxTen2yqvegZjkBuuqCpI0iDRINPdk/g8Aa3t4IvCMoKRJZG5GacN6p2sSDITi1NdNfVoZN31rptfdV/NDElP4spFUzYpJL/D/9vfZVXMTKZFhNcJqv7i/IVderd7w/OFRrKjXHPOBIkvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lx49h5TwBXoOHOAMjD9HzxGP6s8BJUu3DW2Bjom57X0=;
 b=P729W1zTP0slnlAGZNUQayj0CIrk4uh7g+1IV4tOomqgw9sHP2ybs4IyO+wGwIc9vxHekiwSSS+Q8RUYAW88YiklK/r4YYOPqOf0eXHnQ5mRk2rrWAedAtV5qVU7rYvfTSUwttPpOBcrAnYLpzoDpjHzfpwZbCTcV6jNtvOUfJlSSJlfgv8Z5NIeS4awKY8XLu9pERuNF+YmLEZTd0Se7hYpVMM2tP/KHvKOhI5HUlRivaxzFxsP2RO1+tC2TSAuWPKX16+TmoxFekFnvIACmUpIb2xey5afQJbvorts96uIU0UomW+VASt0iSkwR5oS6obb2E8t9pUQbSZz+ND/wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx49h5TwBXoOHOAMjD9HzxGP6s8BJUu3DW2Bjom57X0=;
 b=CcNLggR/xG2FFlQD0vxot0lKYQKYFx3nKPvKm2MFY2SvaMSi+ySwbdQwp7SmfJlnX/YMK6QTuPlkkGs2ESM32+UgNkNLEGWdairNtlNH0CK0108xjRwpCEmZxlfz7oxF0tFwdHxOhxyWZuLi8BrQk7eqjuBZTcqTHVIShDQ3P7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSRPR01MB11490.jpnprd01.prod.outlook.com (2603:1096:604:22d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 7 May
 2026 10:17:38 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9891.016; Thu, 7 May 2026
 10:17:38 +0000
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
Subject: [PATCH v7 0/4] drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
Date: Thu,  7 May 2026 12:17:01 +0200
Message-ID: <cover.1778148715.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-Office365-Filtering-Correlation-Id: e70ddff1-976f-45b7-3abf-08deac21dd3b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014|3023799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 I96ShH0qrBIwhY+h+kzAxMJABV03t6qxWFhxi0tnaEZUssRFqiUMFiIK1b9OgPmoQKCnvxA5+XqVyj7JrO5WuIUm+l4yHbXgGszoL7lfEmCFaBC9UCIZuq+Hhv9DMCBVEjDYzPHQ4pV4o2TAsSXFij7uts+Z3MnPX/lQ4Rqhu9+C5wtayR96afKgrVMeWw5vI1MlAboQIkLONX61DThPVV0scvE3jpFOVzf3MrW4v00l2zzZRxokoL1XvxakrOHd4Jl4Bg865+AKCdg6DElO2GAqpzgq7XMd8xMpKWr6wl45/yFxB8PBbLBbjsvbJk+2tKbhCiG7/Gs89v/+YU49U9FugkLp0DK6TTAk1nVA33h+RATKIMpB6WyDZtsCv3deT8uF6N4WTtAwkZclDwXZ1hpL/+zhKniETRZi08rvq688ycp4TyG4/31nb592UHNLLcx+GT6h8VGSYYZaHVvg3M60UzFgNXVHHmdi1hImYlcqNV66JadM9Tjki6TpLvVdR8DvCMy6TsOgBsDL/3U5dD3knPn8cASV8iy2BE3bhBKu2yxjv+m2GgnQKLxOFvlwbjcSMIdVrOPEHRhD3oHuTXQtxxA320V337nDH86Yu3rcLhgRKMRs5qT+5YdJISHUEtLn2pEjJ4Yn0gNaU7b5jmVTWP5RJbs8765cKknq2UfkPD8sMytExo7cXzlMRg2SovlhZKna/b4qW6mTbxGFKywS+HlrXigcU/nFRVE00uOzGQRshfpNMWau+xHf9rvp
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014)(3023799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?aCG5maKrcycsgNiNtNUMfNyBvoYYxeYsuEzRcNSkFYPoRYca9sD6d2Z1Vbrx?=
 =?us-ascii?Q?SeZSQJ7BgoB0xJTqfCpNmWABnmVawR15LhkS8wS6JAJ1+y6mBH3+cN9u/OR5?=
 =?us-ascii?Q?EvgM6i5PxMWkmThW50xbLNP45QSTDSbarsDrkAjNwLsUpcVPuXDYPbDVaimb?=
 =?us-ascii?Q?nXkNJbxzoLHBCePBZTEBwYgaB2ISK3GVe+lIYUi+suyJjVKPkOy9PHY2Jxvk?=
 =?us-ascii?Q?7N2tOTHFCWVT2I9tx+RubXozCb0J0ZKGGuYAYgcOTjDFURtM9WC+HcQbRlyn?=
 =?us-ascii?Q?J/mpuKLtxrOXSMKGSqn5UknCmIRRSnNX2IOHS1T0p/nSyJlQ96YabIFrAOXG?=
 =?us-ascii?Q?BgmOv3z6JsTUlbgkP/5D2fbitYhqt34rX6ThOPQCdzjPY1riUPafjy5RTmV/?=
 =?us-ascii?Q?ei/IMRERwN5pHO5qhGcYcRNEQVTYKxn1wPvehfvd9voLhFeDTZxycThoVWd8?=
 =?us-ascii?Q?2Xa3A13GKNeosYiVd34HJePj1Qz7fy4Wf4pd2zCPzVNB0Def3bXAj1fpDgrs?=
 =?us-ascii?Q?8bQ2vMuViW690b+3el1H//prtxc+oUwZ2AUKrHUmKdOpjbO+bVTGwAtXHH2+?=
 =?us-ascii?Q?pwz/Wmux0En3l2+40rRPF71xsKR2X81JfLqLoNbaYqcq+pdlvEmhq0MKw6j0?=
 =?us-ascii?Q?O4m8oaAshVrl1wDnGwOton+6WTtOPhHFN+EVstyQlCM923GpY+ManW2hoHbJ?=
 =?us-ascii?Q?8qLoBy8jJz9NKNbo8pp6XzacbdKcr/m5yLXtToU/0IoSPmSvao/DnNR6yFZZ?=
 =?us-ascii?Q?m14ftjQVAKHgBOkb3oDkhcjawa+nACpNEQJ+sx3Ugh41koIZbt6IRO1ACofE?=
 =?us-ascii?Q?qp7Yeyd1kMvSYyxBwRt7UhzN0+h0oA3ePNTSNJMVWikbRq8VvFfr2lP1tu9O?=
 =?us-ascii?Q?2xl3A0f5LL9LrF3mWTF7Z62rNWplNQN98a4KaKGGa5SCSYsYqcyEatzJhzY5?=
 =?us-ascii?Q?7FiTwmAOEvcvAmVOtXUVUCVoQd3D43ybgrFNMenXbi/1sfVIqUf2FZQJMDXS?=
 =?us-ascii?Q?+00lFr4tLyU/1K66cOortflHUefFYtbBTdd6GoMiVa5nC22or1/qS0SB71RU?=
 =?us-ascii?Q?a2ye1a7eW5EUtn/AqRvhT1CnG1XQfuwTY7nmdbCW2kYdf8wkWjcBV4IMfyZB?=
 =?us-ascii?Q?AWIcCtNSzVb4R1HGn11BkZxfm5Ql1QV0QO838qVPWUXt+a6xYcKwoZVPzGLU?=
 =?us-ascii?Q?DEIESDhE2CyCnPwe/Yo4YYMgTsnBRrds+QpIc9xg73w0x4/u99WihRKE60tZ?=
 =?us-ascii?Q?X2/4MJVq8ysK+RO2Zdty22aP669p/Cv+UtlUDjJQREK2DXg9QzpiaVBJC3zA?=
 =?us-ascii?Q?BlxpNWQLiCJ4On6pX3rqnHhjSrgnvSbGWTbFkNM5++CyPdKbT1e1Pn4aVDxt?=
 =?us-ascii?Q?KZ3ZheNnAX7WFjL76G9zGVC+BI3a9wR6wGVmLCEsK1hg6KQY4rre+rsKdN/J?=
 =?us-ascii?Q?bpP4Id/6/LdGA6jz/VfDckQeoO6wrSag87wX/X7HRp+GGgORW4DK5uqzYZPK?=
 =?us-ascii?Q?pxZLvN6meG2jKGPzj8rPo2vTsEv/nm/1mBqcAIqpO4TatbW60rkZ92/7wZbn?=
 =?us-ascii?Q?V3zHQx595T7ayaIQZ5ayykxKJm8efpLfbA4VBK/gunlqYFgwXyzIHlsOcoza?=
 =?us-ascii?Q?/kKCmaGL60AtVUk3GkbD6xr2EvggsFWrFSUqYkqkryiuFSjFRaaD7ZggOho/?=
 =?us-ascii?Q?sXzGcC7iwTerVyJCDalkKYMoYQwd1wXSuCUAZUYUE7GMJbiF3uzGRxmzuWoo?=
 =?us-ascii?Q?sTZIS+8S6Q/VSoJYYXzL7WCpFk8tIjBAzvzeGjWYI2qw7JbnyL2p?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e70ddff1-976f-45b7-3abf-08deac21dd3b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 10:17:38.1211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7RkdKY6fNPxor0fTFLozIVXHWcx2hTxkVvKj8jndpgDddtGC9qSa5I1PRQPUjzjxk5a4YMsgI/gVcQlcIpP5KHSOCI/U1qTsY8hy4ca6/aYCDO76E3/ct8GiiLA2YJf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11490
X-Rspamd-Queue-Id: 1413E4E69DE
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
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32218-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Dear All,

This patch series adds support for the DSI IP found on the Renesas RZ/G3E SoC.
This apply on top of [1] + [2].

[1] https://lore.kernel.org/all/20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[2] https://lore.kernel.org/all/cover.1778141145.git.tommaso.merciai.xr@bp.renesas.com/

Thanks & Regards,
Tommaso

v6->v7:
 - Rebased on top of next-20260605
 - Split the original series into smaller chunks for easy review and easy
   merging. The original series is available here:
   http://lore.kernel.org/all/cover.1775636898.git.tommaso.merciai.xr@bp.renesas.com/
 - PATCH 2/4: Collected Laurent Pinchart tag
 - PATCH 3/4: Reworked commit without static clock selection based on DT,
   instead clock selection can be done at runtime based on the CRTC output
   routing, this reflects better the HW behavior and allows more flexible
   configurations.
 - PATCH 4/4: Added missing const to rzg3e_mipi_dsi_info struct

Tommaso Merciai (4):
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
  drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
  drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E

 .../bindings/display/bridge/renesas,dsi.yaml  | 144 +++++++++++++-----
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    |  78 ++++++++--
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   3 +
 3 files changed, 181 insertions(+), 44 deletions(-)

-- 
2.54.0


