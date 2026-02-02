Return-Path: <linux-renesas-soc+bounces-27775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEIzFv2SgGmQ/gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 13:05:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8647CC1EA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 13:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E6C7302867B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Feb 2026 12:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1702364E9D;
	Mon,  2 Feb 2026 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="l7ZynPO3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ACC362154;
	Mon,  2 Feb 2026 12:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770033641; cv=fail; b=S075HbYB4wGvkGLBlIEUD2WsawS2CYpJr+BHS6kuD1YAfjT7bVWU8NlyPqgA54/RwHBqfQaWLAj37nLkwHLKhrkbvbvOuzbu6812soQUixFY/Zc/4gT6TXtX0U9s6ESnUzjl7sdV/u2Ed0PzEw7uOYoW/YjJJBOv5qTmycbYt1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770033641; c=relaxed/simple;
	bh=2uX7lDfh5qRJW8dzMIbeTic3wLUtbnECvAwsaxGNfVw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uR0zaB7ujKgMHm5h/f31wYodpu+AQleX1n5T6wKFnmOHfBvBzQehVhbTzodEVl1E4iC8D++xDCH3MjlK3YSJEc1//CuIpvkp7zTMIGMteoHl/bMvZI/aZlyUHB3Y51BxzWut3+2PqUtsDRMLxjR58iVRycq5vukFm67YsyemYBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=l7ZynPO3; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvuJBCoku1W/BHpLf2+Z5UeNt2k0rU2Zn+I3GZS78erGiqzUnER+9Qa+RqFcsrSUB4G+SY+ix47Gcq29My6Etz5eTMKC5L/Q+b+XzuTYBJsv+aKkU7+xVEDYO9zlhSxrWQGC3/MW9ptdPgLHL8jdVxFoJPuLniidqHEj+47xJBkCZtuSKDj+A312Tinq+QqQ61XVk0tAJe5IrAk0povDmyHFIuPkGfjVfxLkCJJK0dJlA466NlsjK/crdgG6MI3flKN/GdSiDKqBxy0NPxvetxS5E5itUNfbXK5eZXrpaKIe9ThvXmkIgtv4eH4YvNhHIjvPUAZEvi/6pfLj+Drwaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzsZAM6qcR/NSACSQxdl8kOdSbV5n81TWpSCSAhls/Q=;
 b=JJ24PciOX1zL5+KaCkPn2ab/xAQrv8nYFiH5D6M+nuocA3X0N6QNxteoLVG6fknwV82xFyqBRclcwASJepUhfZBJsrjx3cgrdXUNB0J86BpLCRz7ZFH/W0ImqAw/zmerylFkeUwEalHuIU9ixl9UUpDLW2PVRJF/ZYgXJacxl75ikw9uXK0U4NG2BAn2lOjiIfaQsswC7fxzTF2ourPqSYHHqGvjeLNMBrY53WnsskEOs4jII8eafspmli0bulfpeEKOya0VbXs5RJffMfNe9aXmxWllCjodOGlGfQs+da6AxdV8Yj4RAcInLDpXwso6L9XDPSAGr7Cd1ldh+ng1fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzsZAM6qcR/NSACSQxdl8kOdSbV5n81TWpSCSAhls/Q=;
 b=l7ZynPO3ZbZI1XV13dEVPlIAWCkfMMlWe0E4JZebbc5PY/hz+D7KBd5Y+u0XApyAhmC5yYJTbQMnyv+6O7P8iGkBVAVXz8BQTAKacDVQqMetOqxNTfPnWgit7Sc2O9L3sVUaJ2AUwjQwYQnAtjzci7ussevuFRoV22LfYGjpQz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8632.jpnprd01.prod.outlook.com (2603:1096:604:16c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 12:00:37 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 12:00:37 +0000
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 15/20] media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
Date: Mon,  2 Feb 2026 12:57:46 +0100
Message-ID: <2107d0720c4d2ee87ec71612aea43b35032f3be8.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8632:EE_
X-MS-Office365-Filtering-Correlation-Id: bd366c9d-c460-4206-1a7a-08de6252ada0
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?VFUcGMPBdM33c9pAZiCJGpzEHo3uetPHhoUAMW+7apVNQ23QLxpB2WdxygyV?=
 =?us-ascii?Q?WJZjoGwcgqAQTv4lgJ0leVMxFlQCmO92mZpMDR1EY81LSxYI9qKLfAMfbn1Q?=
 =?us-ascii?Q?jEneved/xxg9WtVzC5vE7F6iUBWoXirzzgJN3wg2FNSyLs/kb/WqA9EGNjcU?=
 =?us-ascii?Q?0m8+f6T/ZmJlb4autfQfw2c8V/JTgXNJdyLSAwRAogQXqR01mjPnhf03NJnw?=
 =?us-ascii?Q?CKg8lpIDEr1kon5PRdB3iv9rqYo5LhsqsnfNd6SeHpvvCMD5peBhpQVTHw9v?=
 =?us-ascii?Q?g+uSKRJRpwODUiXMO+FVEnwqYSb1sbmuCx+IO+goO1frRLuIQot1MpAfQ5VP?=
 =?us-ascii?Q?KMlHkZQYKNND6msExQcHz3+PJtWN46aChaeR4FfeHEbqLT1WfPV4DxBPZsn3?=
 =?us-ascii?Q?X6nBIv+hk75aIqHvODF4zpLtPA8t3N/sCedJviRrKqFNHjRhvPPI2q62wQSD?=
 =?us-ascii?Q?9JP+iPPWNWGEVriOx2JDsyI7t5+7TtbiuKY/IQ1Jxb4l8IvFQ8hAH/CYzwlj?=
 =?us-ascii?Q?LyPYlLwxyqwf8k0P2JdTDVRiISQCi3CJARaksJaXwveIduhe9B/ZV2IezWmt?=
 =?us-ascii?Q?wYaNECNoVbIdKED+qxgO5xeaoZtTQ56uXIADwtz5CyyGAuESieQ1qgq6+GWi?=
 =?us-ascii?Q?sriHyzsHMZnrX14o69qzZXcVZm7fh6Y2AllKQtTvYfH7rv246NX+ARq6tHOV?=
 =?us-ascii?Q?GZKjGhdXfuDR5s2o8DapjyzCp7Q4NSoBNCQ8MjyIOSLySBlLSI1swEzZY7CP?=
 =?us-ascii?Q?sbLGzi6n/aOA2arrxA56wK0sJve7DQjJzsNpzGZQ4AIOTBG3+L/4FOk9T/B+?=
 =?us-ascii?Q?dQdiSC7OOHeq7thcabSecDHPRSfYI33H3nz8R2lUYiG0H0wrj2d8xjYK5MW3?=
 =?us-ascii?Q?Z7NeS9vguwtl0cIGHe5S6wkwVXS4N5Hpa71UOeayUALrKkbm7YiOu5UxhVeY?=
 =?us-ascii?Q?R7kgTNUb1rWoy45PQ1Y7dsd5bn13SJR9eiUzPxKM9fINKHF1DWjtqYRDrLT0?=
 =?us-ascii?Q?PkVayB7XvU0eXpamKYUP0q8ZfYRNic5gKlNIweLYpNjWCxm6FunnEU+UcF5z?=
 =?us-ascii?Q?3X1z95e0TQ0Tk1GSBMMNyT5eKSo++bsi00IRL/ptud6KdocmzMDZ4ZBfI4KY?=
 =?us-ascii?Q?6eTWkT6gKPmTl2G39CeqpFFT3+POesLaTOyq0tWpimpGXz91Yu/hPhEe/1bi?=
 =?us-ascii?Q?MMmeoVcB3H8QAntktD+KWuARb9G1NaxYk5t1bkadR8OlMZ7u6ezVCOA/NXtO?=
 =?us-ascii?Q?4DYZKYhHfeZPUxjopObagSvrlERH3HTP7HOuNIsAo1PRzjRQ+6NfxSiaYG53?=
 =?us-ascii?Q?hkgqbR+SYx3Lrpb7333MR3gc89H8nn+KPbeQsKGcAF9jFMs1m8Y/oNaNgK99?=
 =?us-ascii?Q?BEpE/GoB2HmB8GkEFPuThFGEwUHdsG7qdchRLCZKogITD3qw7eRPuReIVDt+?=
 =?us-ascii?Q?dj2ld+BcGYoVJMeTvZREjUe3hfuJQ4RxNFZVR2w7+X2X8FjPzwmvzqsuAl8a?=
 =?us-ascii?Q?V12kR70b4SeepJq5OuDTJjJ0XJZBw+oka9NrseCcVlOSP1Q3UwmvViB/zon9?=
 =?us-ascii?Q?818CfvtIlbs8RAW8L+QWW0qEuin3nOjHCb8KyuSWcFwEuWLFS8u5aNedcArh?=
 =?us-ascii?Q?yNTC1YDeyz1SNqnRZ1aEr94=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?gckK4KqRHmhA7EpagjDe5QsXHAwq7FPCTUIbKCCLbWoIWvUzTC8BoE/5kEWg?=
 =?us-ascii?Q?cAYYQli0TYqFv72ECdm5WW/xOKwDMw9pQSE9WZzpgdbLiaDFEbMsXU9D7Hw0?=
 =?us-ascii?Q?Stj2tvFFa5+R3xAiGn/MejG4x9+Vnj4HDQ2oINwW0zZC83HwzVsIFjA7XU0O?=
 =?us-ascii?Q?WnltEB1Gox9waoGr2T+s4jvLmdMeCNEoXXnwk/Q4j3ECHJrq5jWmvXc2Tm7s?=
 =?us-ascii?Q?DiWWjueiZWKjYRs1q7+aIByDOYWx2JiHp9Zsrq08TYjFnFAG34aaT19ifmKW?=
 =?us-ascii?Q?sw4RGGwx2vjZxnkdRzHRTPpw04cfDlysOOfNszYq5VkpT+2JcJq7JJzpeGsy?=
 =?us-ascii?Q?hmMOulyfKyHpTik8c9ULvfLLOIkLxea9os4+w7NcKa6jaQ9sN/TzEvFQiAon?=
 =?us-ascii?Q?9XZmqZG906+8rxD2GV60jD7lXbNL6iWxOjfxfKEvDA0eHcYGB3k5g27ao3XF?=
 =?us-ascii?Q?7xKcAb1PuEKs2WlyZWSI0ZBHX/3fX/hroCZMtto624iecTQ1uMPBrLZ2guSp?=
 =?us-ascii?Q?rCg8n/YiJ4ZL7Nz9G7ulvIrB8W1f2fpG80wvIGPYl28GPd0zmieAPHYB+VKv?=
 =?us-ascii?Q?hKo9W1YIiAZn3NqHEXyRKeNjZLSmhHe/kxz7v2IT42NwxRGPewtUGEnFpw4+?=
 =?us-ascii?Q?EU9pgsa53RTScqOix+Ll4wteMFg2E5KeQNUd1Xa2XP8xFhQW2VefKErAKKiL?=
 =?us-ascii?Q?LJ9eXJHq8VkaW01zuuU4era+ZWwQVAjtAC2Q5KI/mSvWBEzvSOJy9dMgbfne?=
 =?us-ascii?Q?mLIHKRuxzQ93bfyYKSeu0hZNQfj+jZdyfdNfT26ypPPosSpVDcJnMNC/h5Su?=
 =?us-ascii?Q?UV+Axar29MGf1CVm3oFlUPUs1fGWYFpo/RzTUnk/3J91mC0y3AAGqT/Grz6m?=
 =?us-ascii?Q?IA1E1nVVQPmZrVx8WPgZW2Hd0TAjiGySLqKt8ncaSl9XkUZv+33z1/iAG3CX?=
 =?us-ascii?Q?0y/qlEDYhTKEaB0AzSL1kFPGCm68yl35F0WUPY2pnx99sJPy18unm1e2msPL?=
 =?us-ascii?Q?+M2oOQntbvJfy0ZDMsNAYnswMNqLI3Wf5SIf8zngjxSaM4uSXa1zcwpqLvXs?=
 =?us-ascii?Q?3VZzb8LIyY5IwPLwqPSfztS3DDA8rWDmHRidqurjO8W29YTrjjILdYulFNX5?=
 =?us-ascii?Q?joNNl5J4aoxl6PVlckSe3V1CNlD5k/AJTRgE36wkeqfGgzAG3PEyXBXZ9EK5?=
 =?us-ascii?Q?Tu4fMtxfxPAIqE/HmRGxHbriI/8velU2lcEfvvGYFc9v7M9p9dmxBjIKRghT?=
 =?us-ascii?Q?GVzWg3QOrckn5mSOIm9+ai6IlzQI3tqvI0Nc4Xa/IBpBHZSBCPw1BwUXmnVq?=
 =?us-ascii?Q?6oU6l32ADFciNCUYg2+aIBbznECL9cl9jVPzFF3aCtvLjYghFAauZMHb132+?=
 =?us-ascii?Q?bK45FmLq++l6VBoPdXZ8HkbRRQLJLsYTEl3NscgOmhevVabLzqag5ayMrSXw?=
 =?us-ascii?Q?L3J7b25KKoUAi/tI+AFA0ZY7cZdgkTwaI8ax13XNa5x8cvHtEcMgghjCDvkV?=
 =?us-ascii?Q?osThv1qH4ijuoNbhIdjXpCo+e3dSKwaMp/cXSMY4uBTpGZrJFYLbUzvON4b/?=
 =?us-ascii?Q?TiwOrS8xgAKWHQonqq4lHl5KtDxkXRtVAg/jok3o30BzVJ9KkZQg7N4VtG6g?=
 =?us-ascii?Q?Kc27e+ZKKhBD+7YsNQTbMojuY8r3ezfDKGi8iJlpzcKs667vUyaqPSy+Y/CH?=
 =?us-ascii?Q?furC3pHmNOoEh86hjFtgxhcUQOF+kDBvD+66j8NGEXy9zoVKtMWltonJcheR?=
 =?us-ascii?Q?H/gXa7fSkcDxP/ECq4SQBNmJbXTxZfwSZPEn3Tl/AGvhZzq2Sdfj?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd366c9d-c460-4206-1a7a-08de6252ada0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 12:00:37.6677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9w/FiWL+fR9ap+c7CVRJfBQyyLmZoPviyG5NGzxiN5b7fJKZHdaDZIxIkc8tFLV+87q7tjyNv85HQ/4lsI03tqdxXln+dZ5cRKRx6dQEuTJFK/CjKXErGpkoDbGOyEb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8632
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
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27775-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org,oss.qualcomm.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,glider.be:email,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: C8647CC1EA
X-Rspamd-Action: no action

The VSPD block on the RZ/G3E SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
as a fallback compatible string on the RZ/G3E SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected tags.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 07a97dd87a5b..62bff3ce3eaa 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - renesas,r9a07g043u-vsp2   # RZ/G2UL
               - renesas,r9a07g054-vsp2    # RZ/V2L
+              - renesas,r9a09g047-vsp2    # RZ/G3E
               - renesas,r9a09g056-vsp2    # RZ/V2N
               - renesas,r9a09g057-vsp2    # RZ/V2H(P)
           - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
-- 
2.43.0


