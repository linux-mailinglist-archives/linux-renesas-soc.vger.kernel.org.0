Return-Path: <linux-renesas-soc+bounces-27691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9kapB7TpfGmWPQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27691-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:26:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DCABD082
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 18:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB32A300AEC3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 17:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1B1356A07;
	Fri, 30 Jan 2026 17:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="oAtZa4Ps"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010023.outbound.protection.outlook.com [52.101.228.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A0D1DC997;
	Fri, 30 Jan 2026 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769793968; cv=fail; b=i+I8LnM7674WK3C5jKbOsmzfkG2rBKp1LZUB/Ghm37+GsQNqB2B0y80SzUhVFcVPt/A4Uq4LSih1+nRf8A+6l2hgSWUVNb/z93WoPdslXg3wLZMooQy2HH+tUecYAYR80fRSovMqSXJcDAnQeyowc7jtnFTxMIptJcNKuyzfH1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769793968; c=relaxed/simple;
	bh=4moKYSCztmPrg5e4ytfQJCYO2+r46XD3p82I8kJPyIE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FcQnWqbCRnHb37/bX3GTbTYYNAhRaqXA1qoQQJKgw+tQdxee7ewrahdl2xVUFm9HgUesLzHhTQRJDg+Z53a44KepEJmseg2pDVwfIlaIfqr1Wp2LVTRI1Ft50fgDEbPHOYpvMLuHiJTnYrdKddJlnm4QM0D0bJ/rrlQbx7OUAXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=oAtZa4Ps; arc=fail smtp.client-ip=52.101.228.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iLF8lxFMYsE1KmldL9B9EuhhyHP84A5srzYWXRmUJifJM1ogw6LAiqSCzs+OnIqkOimLiD8uPnOHTGe+LzBxLWqPQehghl8rOjajkfD5/y8q0PuyCAdVnJO7+p4DsaAUgh8lnfHC+tUdgDkfZFUSwMPwQQ3OB+SLG2TwqmMKmHerjm01VUq0TZnimHHPeRfcP/Qi8yLs1Dtg+IrliaMtHzKR/nIrEpjAQRFLNe8p2EoSODHVThV00PB1sT4xd5haKCw+yTsvpLtEwRgIuQCPhQQN/6T56mD8oBzRccaMn8JRa26OzM+10+f7UPs8cngGQvA1oy7PLHduqLxag6/04Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQagPSP1+TDWHb6BcjkaOzycuVKi9VHd4FE5KHhKMnw=;
 b=vuKJcrus2ukblA/H0/WeDhx6cRUgbeKSS5kPRb425rq5EwpsKH1aujHAiubuuxIHmZFxOhCZ8W733fBQuYSXmHK6lO4lLaJWMOVeITChNN9HtURflHPHQIKgJ66Y6i2BRMaV7uB7r90RnarnPPEiTEchh2R7BE3QPHO/Imjtv3qZSRdlIMhgJ1xG4lshlaNrHrI6ijoSY4RKRLLZ07laS6R9j/r7jx1vvnmEHwjIYD5t4FqW6GEuo63Y+2fgcfu/8aaVh37C5HEEagatqHI6S9mN0TVAOEprE/WLnOYkzkfrYdNLmLKfAg/tdHSHkERIRYWHPKgCzzlUhak5vkPl1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQagPSP1+TDWHb6BcjkaOzycuVKi9VHd4FE5KHhKMnw=;
 b=oAtZa4PsNVg4Vc6NRVY9oMCARRMpcRDXG9WRUFtP9wJio/ofewU7pLTeetYV5lCk8xWeAKlogKTU4lmnTQ8e+WHEUZI6cRmVUa8jrgItfcZDnJqRsZe+PBxQNs1HNczmD4q+cr9ZBPay6eQHqDL0d7DDxHMs/L1wmYfiSYDyvaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:26:00 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:26:00 +0000
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
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 00/20] Add support for DU and DSI on the Renesas RZ/G3E SoC
Date: Fri, 30 Jan 2026 18:24:57 +0100
Message-ID: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB10351:EE_
X-MS-Office365-Filtering-Correlation-Id: 425b96b3-d640-4efd-8887-08de6024a2f7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?FFKrJfyla9vR9m5X7mXo2vCfg66D2t8+zEuoDwSlcRp/6cpoIbQoQgeB4IAg?=
 =?us-ascii?Q?C8uWQCATkruNRvQxY2ehuCaHR1gOQ3emHuvJxM7l8BvJcMPOY1WIOOScvCTM?=
 =?us-ascii?Q?iNPVeSQW0G0ZRYHBUB72vlAofuPFAzn7+DulkQyawTUnvLzRY2wuau0Jv4yR?=
 =?us-ascii?Q?mD6/SmPBL1vM1zIddjjtbUFPwE2mOBu9pgLlo1A0glnSrtzE4zanao8q/Det?=
 =?us-ascii?Q?P6TT2G0wtawDb/0vBAe3me/u2XY4Kd2zeBmt3RRr+G4LzXDWmVLazf+12uht?=
 =?us-ascii?Q?dAEHyxADUcl2hyCgXe9jRqg0SC+gNuVQwjzxmUvRyT++JAV0Z7WsRoGlwdeb?=
 =?us-ascii?Q?HRQTwlmVyoBGuglwNI+X5aIxecs5X8QpHrFIl7TW/B9/h/bopIbAZOqcC/EM?=
 =?us-ascii?Q?7TpJ1+7RuDewAWN51zE7nWJ8WZb9BjssoTtklAUX26xpYS9ks+QGqzpOleMW?=
 =?us-ascii?Q?HpIDrr3F+L48eCf15mLIbOVJNZYYthhko9Vaqps44ALx/LprGzNljCXGj+ud?=
 =?us-ascii?Q?9hB0ldnG/GqSPQedSV5SMLQZWJn3wTDGdxhc18lzqEk8GSAwphghMxQ+UqN0?=
 =?us-ascii?Q?fu0preo/X01oIj2DMxURTJ3/A9hlrNu1ZARp6OMzojrbEdrMKU39Mjs8OTAf?=
 =?us-ascii?Q?qhXRmmPR+pth+WTXfXsfTzyjTRULtyzE/Y+JHeP1FXzRM7ONg8m9hNLQH/aG?=
 =?us-ascii?Q?Vx6YXmViYkSgc0ejf41SCv1rgd+xocS0GKc9g1I40XEUvBYyucHh6XTP9M3N?=
 =?us-ascii?Q?Wgod2ELAwwT7Nf/vyCmWs0yOcudNw0+UlOhqJ7rzF9+dDwedspllXS9IzoBl?=
 =?us-ascii?Q?5DKUmvjdwemhrGPyfExWbAXGYLbgomfyt1/Oc0QI77GEEEkKKhvx2MoiSLI0?=
 =?us-ascii?Q?5xUFkksARlzkdN8m6pCNmXBbh7sQe3Ycsh1dkn2GPwoBmYcvLbH+lfA2efKp?=
 =?us-ascii?Q?cvQizAF2BedcQ8gMzzpOFn67hvPRexUo7eJ9N8P2l8VwkKnXs2RSG6vE6MRN?=
 =?us-ascii?Q?9Y3jG6/mF2XZrqyVJ2JVAWWAiI1+WOwDeIu4067R5yW82PMdGO1aWKGqjv5z?=
 =?us-ascii?Q?StlwCBknh3x/O4tgxgBzWinCy+mCxZT5aclJVEZMkNj00lh3ApvrWhztjuBK?=
 =?us-ascii?Q?Nkhu+wdhupFHE9wJdX2s79yps6xXUrSZuz/PKppI8fH3MupZC4ae25N0fAQw?=
 =?us-ascii?Q?VNVN/xZbF8iDSacsKxoNqucvXmic6jN2dxMtlyY9sQmuN8zegLabCL+ySeYR?=
 =?us-ascii?Q?QjwviBDZq2Nm5dbF7pywGodsaFPs7QvDxfFwszmdQvVVwlczbB8ZrkM0d9Of?=
 =?us-ascii?Q?O+x2w39bgtYb4defsm+Km0QrpSpLO2lVqtbvI5X2Zq8W+zduS3pInzubLGXf?=
 =?us-ascii?Q?mAMsuVDTR+HPZVSB/GyX9ZOjNExYPNr0CIdMuRtSN/4VFzZHTmUlbLNrTlDo?=
 =?us-ascii?Q?axK92n1zRR3XEXnqB2AO4y4i38mwXrSvsW3TCXjl1Z91Zfos0nCTL2hkvqyJ?=
 =?us-ascii?Q?JI56sAKpKwOqIc7UQCH7izTj/vWqOJZIrKHFOd2oO1rcu2RDcht2ggvdjkIE?=
 =?us-ascii?Q?XOUjwJD/Uj9Si2VuiK4DrRnGoUSxvVQw0WPlyA50TxvSCE4iDZhagpjCC5bT?=
 =?us-ascii?Q?qnjeL4hh5G/268IWHW2T0BU=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?JqO/XQfNCrGQKuosCvVie8H5vNtZx0pVEZSown4AKK/Fg5QjHmqQtAJc39G0?=
 =?us-ascii?Q?X2k92jW0l62qwn2vaKdLdNV6nUFnMdrVzM/kI2IjRGZZ4npsfEPKFVfT4LUO?=
 =?us-ascii?Q?Ei8sAuWbvRtgB84cfgKFrRe5w7eaFsvZXhHZ4FKrhrrR+wpn4SgYditoF2+a?=
 =?us-ascii?Q?/NkQzVpozFpH7tG3TVFm087p384MGtqAbPBoXrzryjOJy37RRt3iwYm3Ve6B?=
 =?us-ascii?Q?8DNIVu2pm9w9U5BcEQlUV1nowFpaH3bG5v/87sXIChw40Hxisx3aU7ssZUUi?=
 =?us-ascii?Q?arILYDOPkDGfHeSenmbfip40rTWTROBMRlALvRcoT7I9HblU2BDgf8qQpTPM?=
 =?us-ascii?Q?nRxDqjkhe4BM6WHLbd2mf3zFmka17Z6/MqFL0QUDir6VuLdma6TivjLD0eZn?=
 =?us-ascii?Q?KTiRzWTRRgTxl6JCHa1OjZfCp2L0qcH0Ga3V1Nzaswa4oFVroLz5c0yFdJFB?=
 =?us-ascii?Q?D5DNg8EmDTbtvk6aKqmFB3ap61SEIDQn0IiK2ReTgGykXHpYgYJvnQV07poZ?=
 =?us-ascii?Q?cIlu+YMaUEN6tN5hT1CKrQ/ibyLYMRTaaFc4Gmydm03R52LFBVcCUm/xasko?=
 =?us-ascii?Q?dW1PXUrvxeq924Y3t6bjSeGiB6DU06OJqnnystOaTbzmUM6YEhWAZNXVmXTP?=
 =?us-ascii?Q?jUM3HxcaSqHq7r7Ppbf3ZuNejxQMAaoK6we4sVGDu99FPrygtrcvRq8OFsuu?=
 =?us-ascii?Q?mOqXnQIJ61sFKWAjjQvC4+QAVd/qIT1boT66m0yg0D3rM+xRZqROYtDBQO2I?=
 =?us-ascii?Q?jKduPcvN93vcG/9EnJT6juYhPnjFqKFLXPbCv/+C3T8E45ka988iJa+2xDYh?=
 =?us-ascii?Q?9RPXfLOIjbyVc5VK9JsHnLfU5j3sixmbIluBW664WBUlbxWuSYqGeNq8xfYk?=
 =?us-ascii?Q?RhgECrjAnwuFB8JipcfJZHxpRIa3sPACKVcNRGY4xj3b6yTfr1VzknTOvHzD?=
 =?us-ascii?Q?ulqeQ9dIv+N2h9ftW6gUk4XjuKg6t7etgQkeBNIt4b2uaqeYdRlWqHuWJZST?=
 =?us-ascii?Q?35N9BH7aekw9O0oDdoQ42VwclQpsWgJsslnSvMe/+TT+66IcLaDlQ1s57C7g?=
 =?us-ascii?Q?1OOowerYCc8LagDydWiq0oFhr9pfQwEVi4G3hfIr28wt4jV/Q3A47YS11Ygi?=
 =?us-ascii?Q?RQ0JXPEXVjJwK+sTGSKvVwHvEAtQJHL04Eizl2nQT9CyYGgLVjCxn1xG4Mbt?=
 =?us-ascii?Q?gGe3jQXoQEV1vmw5HrWcyvs0hOdy1z/yIe4U29OGpVNctXRNtf5TcjzPTL5w?=
 =?us-ascii?Q?FtMbGVJtbZX3ift7svj2Q2Ox44fs+Uh2cIuFlhJNfsjijww+IRVEiaI2o7en?=
 =?us-ascii?Q?/epyXKyXLCFNyl8aTx3ipnMnTUt92X4s3mNFhLpfGpyMeg7v3YVXd92Avxb0?=
 =?us-ascii?Q?bvkvZBZvwUvJonV13j3AyEBPVhtUfJkPrIoZ/7aNZ6ykL22igmGxNBrPB22E?=
 =?us-ascii?Q?iQMKUgiWdxjU7XqqdDo19zA/nJWh3pMns2RJeoGRkIitg8QDWjCt3sRZyQvv?=
 =?us-ascii?Q?76S6y+UsFPc7oz8CKXAHJ3wqo7noybpf/bnS5FFVpzUQAhTofPqSKl0SR9JP?=
 =?us-ascii?Q?s4eh+7Ui59emkftEILBRnCU8zvR3mlOUgwpIfE1r4yNsBGG0S+b1E0zvcVHO?=
 =?us-ascii?Q?6VSskUtf2GqVTrlKWfDotcXAVrmR6Eur+SWlpFMd8/cBPP9r+v22fRSdQ8hx?=
 =?us-ascii?Q?4J075FpqAYpS8zMNm4Cm/Y077gjtacd55pJTDD8Vp/CZkVyNFDpf4DY+JlLv?=
 =?us-ascii?Q?rRvMLVVIB8bvJL+9m6pn8cMWvaZJF3E0qXwQcDHT9PbXT/ilkmsk?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425b96b3-d640-4efd-8887-08de6024a2f7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:26:00.6575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gJS392ypz53PdPaUHrmfsPsRssgBYfhpC/LcYG6DWyNADAGdO2E35mxCbd/NFHyUJ9DKUx9HcmODzBsOW/xgfj2hdBjky2NoHulZ1PrgJd34v1hgt2qD+2eHXUXcJOG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10351
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
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27691-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 04DCABD082
X-Rspamd-Action: no action

Dear All,

This patch series adds support for the 2 Display Units (DUs) and MIPI DSI
interface found on the Renesas RZ/G3E SoC.

RZ/G3E SoC has 2 LCD controller (LCDC0 and LCDC1), both are composed
of Frame Compression Processor (FCPVD), Video Signal Processor (VSPD),
and Display Unit (DU).

LCDC0 is connected to LVDS (single or dual channel) and DSI.
LCDC1 is connected to LVDS (single ch), DSI, and GPIO (Parallel I/F).

Thanks & Regards,
Tommaso

v1->v2:
 - Rebased on top of next-20260129.
 - PATCH 1: Added rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock
   operations to allow the DRM driver to query and configure the
   appropriate clock path based on the required output duty cycle.
   Updated commit message accordingly.
 - PATCH 2-5: Collected tags.
 - PATCH 6: Moved clk_ids to match enum order.
 - PATCH 7: Collected GUytterhoeven tag. Fixed "dsi_0_vclk2" position
   to match order.
 - PATCH 8: Collected GUytterhoeven tag.
 - PATCH 9: Use single compatible string instead of multiple compatible
   strings for the two DU instances, leveraging a 'renesas,id' property
   to differentiate between DU0 and DU1. Updated commit message.
 - PATCH 10: Removed oneOf from clocks property, which is not sufficient
   to differentiate between RZ/G3E, RZ/V2H(P) and RZ/G2L. Use the already
   existing vclk instead of vclk1 for RZ/G3E DSI bindings. Updated allOf.
 - PATCH 14: Instead of using clk-provider API to select the right parent
   clock, just set the correct duty cycle based on the output. Updated
   commit message accordingly.
 - PATCH 15-16: Collected tags.
 - PATCH 17: Squashed fcpvd0 and fcpvd1 patches into a single patch.
   Collected tags.
 - PATCH 18: Squashed vspd0 and vspd1 patches into a single patch.
   Collected tags.
 - PATCH 19: Reworked DU nodes to use single compatible. Use vclk instead
   of vclk1 for DSI Node and set to the right position.
 - PATCH 20: Fixed: dsi, du and adv7535 are part of the R9A09G047E57
   SMARC SoM board then add entries in the rzg3e-smarc-som.dtsi instead
   of using the r9a09g047e57-smarc-du1-adv7535.dtsi.

Tommaso Merciai (20):
  clk: renesas: rzv2h: Add PLLDSI clk mux support
  clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_DIV7 clocks
  clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1}_CSDIV clocks
  clk: renesas: r9a09g047: Add support for SMUX2_DSI{0,1}_CLK
  clk: renesas: r9a09g047: Add support for DSI clocks and resets
  clk: renesas: r9a09g047: Add support for LCDC{0,1} clocks and resets
  dt-bindings: display: renesas,rzg2l-du: Add support for RZ/G3E SoC
  dt-bindings: display: bridge: renesas,dsi: Add support for RZ/G3E SoC
  drm: renesas: rz-du: mipi_dsi: Add out_port to OF data
  drm: renesas: rz-du: mipi_dsi: Add RZ_MIPI_DSI_FEATURE_GPO0R feature
  drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
  drm: renesas: rz-du: Add RZ/G3E support
  media: dt-bindings: media: renesas,vsp1: Document RZ/G3E
  media: dt-bindings: media: renesas,fcp: Document RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
  arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
  arm64: dts: renesas: r9a09g047: Add DU{0,1} and DSI nodes
  arm64: dts: renesas: r9a09g047e57-smarc: Enable DU1 and DSI support

 .../bindings/display/bridge/renesas,dsi.yaml  | 144 ++++++++++----
 .../bindings/display/renesas,rzg2l-du.yaml    |  54 ++++++
 .../bindings/media/renesas,fcp.yaml           |   2 +
 .../bindings/media/renesas,vsp1.yaml          |   1 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 175 +++++++++++++++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 114 +++++++++++
 drivers/clk/renesas/r9a09g047-cpg.c           |  84 +++++++++
 drivers/clk/renesas/rzv2h-cpg.c               | 178 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h               |  12 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  48 +++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  |  26 +++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  11 ++
 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 105 ++++++++++-
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |   3 +
 include/linux/clk/renesas.h                   |  20 ++
 15 files changed, 933 insertions(+), 44 deletions(-)

-- 
2.43.0


