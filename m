Return-Path: <linux-renesas-soc+bounces-30990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCn0KO4x1mnqBwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:46:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 224E83BAE1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 12:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8652630F7A64
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 10:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6B13BA22E;
	Wed,  8 Apr 2026 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AyX2CJgw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011021.outbound.protection.outlook.com [52.101.125.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725743B9DBC;
	Wed,  8 Apr 2026 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775644810; cv=fail; b=XGTrnNfF5iqBUh3ttUGzERHtVZwDxmHdUR3F4cGU+uleatWx3Qq6Au0EJSYuVMURKDxZngNxwd+HWCRcpztrSdKXzV3024kxgtKBdWUxV/2RowednBoin+DqYwUuRdbVIiL226zxkjsE1uex+aH7aSwh24sd1nZTy59PKdk596A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775644810; c=relaxed/simple;
	bh=GLnO3Roy7gIBeRafexYSOcsvppQ+maib8E1r7ndXOmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oO+cmntoNKaqocbJpXY83OTsNtMyaimMOb8QzHZtLMBh/8b+M5jEF1l7w3SghY+1qNtNdjkBhRtuF3+rdYY8gF4XxrzYkLjjtOu3LGpVTsKz0AR6gd3bSClDuRexFoZNFb6sVQlzxrDFZMLY3ATXxUCJOSDR/9QAZoYp+jXTAD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=AyX2CJgw; arc=fail smtp.client-ip=52.101.125.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALB2x6d697NM0yBldYZd86Qm6xE8eY0FA4b+lmXSejRfHcFDkRP1hq9Gu9NOkFMbHD2Yf7MWdErH18lwRW3j4Rww17ZEFd0IhH3E7TILCPku7IH69KFrGmhI9iKzHKm05DW5xdk/6+ie70odhsmrLdXlqQo0imjXIIuhjVH9Hs6pVTLT5WcUfmtTdIPfQLGVtDRNEjDfFbgiVA5Yoa4fSxKfjRYlnE3fIlv4RFxJ4DYnXuAMDAjyx2KKOWdv3cjyPpjziwcYsJWzqyQbn9Iu8xT40gRsdwxyGKmFTaNrctRA2Q4bcoi8DpV1IgT62PvKKBcPYSszxlPpqzGa/EYG3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oge5ZTIyQlhJPwd3PJ3EwUaVH6UB9aAj1wcB6c6FXQg=;
 b=OIDtV5YoSJ0fImbViJoIe5yJqV4G/RgzYcNGACS8f0cTrPxHemT+RVUcAvNX1Pj9C5Jjk0J0pQpq0eMMCs2EpK8x+hL12+DDhiH+3aKml2N1+l8TYeuKLGQobc8Gz6B9gO+XS7FPWEIoGCL4NYo+VUHOtKkZDkjvcdJVas/EMsGDPj3bbtZUSb1JnUI4hMoCIZ/b/ZNy+qaHrohdoGsBsaKv0xnNC9lG/W0iL3j7VVWh94EUx64isNADHP4SNb/DxobY99tIOOsqPy3afpegcixmdBebdbf9+wAyQVFqjKovwNDus+ys0YHSo28RKMH/NMS9bcl4fauEnwwCpgb+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oge5ZTIyQlhJPwd3PJ3EwUaVH6UB9aAj1wcB6c6FXQg=;
 b=AyX2CJgw3QMPUGYbZjTnqMz+bw1fKz5reVe1y+/q05Ys8/B5+Yqu2V+roYIBx7hs4NMIeC/CNM5HKD3/Ca7EBFp9pnj6i+9Bwnolo33ylOBr0Q7/wxvK+CsozlX9eAa4c/XRbBs0YsmA99uGGzvUCxRrI8Nu3+6P90diMWZhmfU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYVPR01MB11293.jpnprd01.prod.outlook.com (2603:1096:400:367::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 10:40:06 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9769.017; Wed, 8 Apr 2026
 10:40:06 +0000
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
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 17/21] media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
Date: Wed,  8 Apr 2026 12:37:02 +0200
Message-ID: <5aaf561a66c24639477a99d3861ca969a81673f0.1775636898.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6a2b9060-0619-473a-a5b5-08de955b3328
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 a44sGMWNASshDEY7di46h+zmZbfaKqkt+5dNNwweoV+8luOyMI0NkxLWYjRHXoezEPUwFuiq5cFAZCneujwSDVrkWN3hurwiTn+z2ZRCbAvZk6Bkv96U4+tvuQObX134dMYcIG6lQ9OO3nAN1lCdij4XGhS0nOis+fF29cIh72pEMSOcfYCK99xDGSW9NtSY5DXNxvCMNFpvn60EqPhf6M3WyNMaizg/XQTvnSUTfw/AewVt7jfMOX5owjZ4qiRV6ybAv5hd1UNImkr3D6XRvgYiwzz4rIXfUli+DYpsSBUUGygHzCLhtmUwz/e7E7L5HgGxOKwaY3D0t63BYTJeQXu6dOY1MPl3MTBywKtpc2/CT5CPxRjKqxkgtwZQ9Ix5Ogj1pyvmfXmX8O3em8QLfuu3s0stmUtZiuuAT5xy+kSGSu7sM7RQtr7ap1PuPMEylWIMUHLp+AqQUEJJ0T3gYSLVy1yPZWPR30cgDyT+hiugjDtXYQDBkG+rJza7r6q172poQByraADqe7mkB2Psay3fUpvVbIYdQsNCsRZ2835RSk6gtjq/xM5ARM05xbU03EG7+nyJHwAS5LnFx2YKPwL/uN1Tk5NiTdz7CdGK1kWwSq8ZyZsOr1debPdlx0fRKVdgVOyViy0cdAIPgB+esl23jkmkgfylfX3KHrBF7mWj0ZDasQJgNanY5whXpFPLKvhDYKG1xN12wRA1p9k96E06s4YnWbH/yB/6i46fr2r7l0RGuZwHSOpJAks5ic+RYLpqPHrSfsq8c0rVrIj5yyHU6th13OMeDNU2IVbnd10=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?AGrk7jyuyn5LVVjciFoIeOZ5xcv08sLeHJy1+b/z1a+lr9pEN5c8klbUMpXk?=
 =?us-ascii?Q?OjjDesJWEGkuHrV4PES5hI8FPLw55gl+U7DOaxsRw9STWeQjVyuTwixeRnck?=
 =?us-ascii?Q?IExcNle2NLh85pZsMSLxSZn3fdHpCcrOMk8rSWVzRc1tu2AgptOsVS7DnC6g?=
 =?us-ascii?Q?a7zo/4ZWJYAM6uMYRJCAJElay2aQ/2luYROGDBhn2PcEW7rwZfToS1goWSP7?=
 =?us-ascii?Q?RXOdy54rLv3d83JTdyBNAsChDOggBA4W9J6+Sr+cQe303Rz2XrVq3jXaZGCG?=
 =?us-ascii?Q?eNlMO11w3oJ3uucWOaHiTx0kYCEI9F7dMKObRQf7FLBXm2je9aaNCYikEuLQ?=
 =?us-ascii?Q?Rz6LhsPBTFip9JBRFNH1CEGQV7v1xJfMlMVjjH7iWFH7B0WJ8KGODZAUs66d?=
 =?us-ascii?Q?BcW1aZP6EBBWSBHKfYoGihHjlv650avSrnjQN0a2KT1F+iEWx1Tm8RvaGvYR?=
 =?us-ascii?Q?t9uuEMrVjJ/cS21oz7n1N48rtd8lgPLb3kPffPuGZDSKJwnhQ9+K3ITMKV3c?=
 =?us-ascii?Q?IEnyJJK31CteuFdnGDJh6fzDdGK27hF9ZIdoIC5aKvCwYPOBwBGRzltawPrl?=
 =?us-ascii?Q?+4Em0kJej4JZiqknkj31Agl0m74/PxpZTx2luzSLz3jZMGtDcQEhJ6U0OjHi?=
 =?us-ascii?Q?0dCDEDrhFvCVtODRkf6knT5G2Qa7ztzDOoFSbj1jZkrfXnb/sb7/KonITk2v?=
 =?us-ascii?Q?nBkM/rEfkEZJ5CIrMGVKnL1+WmfWFlCBTgANgt3j7sKPI3AEM/J6PPkcACjx?=
 =?us-ascii?Q?LKQ35QW5rydvb/uJXrqm6ZNRHGEXtrKiH2moJSQCMVC7PO67uR1+FjODU8dc?=
 =?us-ascii?Q?Hgw7WYfHsdzPmqYFpKn4kX2Cf0L0Ks3ktvIbYqWjhV7efBozuurrJMGWAYkD?=
 =?us-ascii?Q?KXEodmhX14YCjSzNCjRgAkcyWosqc2qm0HOAFoRVlCvMCjN65zS+ANIR27iq?=
 =?us-ascii?Q?aSU/2qcPvNAezElWS2KzV/f74aNuz692wOjkJ7kPRjdi9pkv0R+/fyFXekm0?=
 =?us-ascii?Q?SAnSyYKSNP7w6J3F8fZRrEc19Eu9jsBGnbZRrhiOPZ8I3RiKyv0h/ubzXXCJ?=
 =?us-ascii?Q?l72jYL5YuhkVOGMZoQgDvZw4YXs6DGBGxWrZtXpa5OGh1KBaUYdziBRCxUkJ?=
 =?us-ascii?Q?xnaYGVWARi6gKwphVuSwt+Ws5Vadwrr1QbI1y0aeplOa1z3Qke5fhorQXsEF?=
 =?us-ascii?Q?tFDIuLOzk6I7bs2hBtqnu2Bd4Ntbj8SQk5Lr2UtkG2t43zk93ZxiLPnRSDDr?=
 =?us-ascii?Q?jXA1tE84cP3//6d1fxzW615bMkwze4nxKFYywxZyJdwr4EC6xV4+UID12sdJ?=
 =?us-ascii?Q?TmUSHdcnvws8QWpNK0FMBCMNJb26v5cL7bhzJ5YZfT3wux8zxNqWY3EfOU/N?=
 =?us-ascii?Q?RIw6vvnQDlVsrBqFrScVQYjvh9XdpTlavfABi3MnCAZdwSqmx7PovsGVbf2V?=
 =?us-ascii?Q?WvrCoBiWUNjMnxUKi02EJcZz/dvCrIbQdneI1dhSSm/rjnZVDVICcQh5WilE?=
 =?us-ascii?Q?8t/lNIx3YpYcYfxR9zF6W3kWxNKuSuoy/7UnrZ2hISLEnytKcrQ6ANf3dcr7?=
 =?us-ascii?Q?5BWwy2UZzzvEuUxdwfQwS/aPP9zhyL5ej0ggjE0S4QM7h9+tNmJM2gRJTAlm?=
 =?us-ascii?Q?13bz5wxVPZTRtKk5Wk4LcmglzU6iU/Q/EZrNJEDFO1AvW/vJlZOZAAJkrGva?=
 =?us-ascii?Q?tIvjDz1aSQ8a83p/nolZY1BJ+dulaSOfS+c3PHUdnPiXMmin1ok9N+Te+6zH?=
 =?us-ascii?Q?9K29iHDkSbG3bw/Pg7efiLh4HJ00z8DK7/m3fmlqBRrmHcmcuqzf?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2b9060-0619-473a-a5b5-08de955b3328
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 10:40:06.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yaLfLaZJWVjMQQorRZvAcytqJ3ddZA2UMGUZoctaeAwFQeNgnQbZx3nJHF8wvdQv92O3S00NLkS/CLBBCdaKOTjhvfuftiGfmBLVOzdI+BjFHp11mRNVMl3jR7mhSJlS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11293
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
	RCPT_COUNT_TWELVE(0.00)[25];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30990-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org,oss.qualcomm.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,glider.be:email,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:dkim,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 224E83BAE1B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The FCPVD block on the RZ/G3E SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,fcpv` will be used as a
fallback compatible string on the RZ/G3E SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
 - Collected tags.

 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index b5eff6fec8a9..f7e486e90e43 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -30,6 +30,7 @@ properties:
               - renesas,r9a07g043u-fcpvd # RZ/G2UL
               - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
               - renesas,r9a07g054-fcpvd # RZ/V2L
+              - renesas,r9a09g047-fcpvd # RZ/G3E
               - renesas,r9a09g056-fcpvd # RZ/V2N
               - renesas,r9a09g057-fcpvd # RZ/V2H(P)
           - const: renesas,fcpv         # Generic FCP for VSP fallback
@@ -77,6 +78,7 @@ allOf:
               - renesas,r9a07g043u-fcpvd
               - renesas,r9a07g044-fcpvd
               - renesas,r9a07g054-fcpvd
+              - renesas,r9a09g047-fcpvd
               - renesas,r9a09g056-fcpvd
               - renesas,r9a09g057-fcpvd
     then:
-- 
2.43.0


