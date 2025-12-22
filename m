Return-Path: <linux-renesas-soc+bounces-25994-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6051ACD63A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 382E530A5164
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2629238C15;
	Mon, 22 Dec 2025 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="P9OaiE16"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010051.outbound.protection.outlook.com [52.101.229.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE54723EAB6;
	Mon, 22 Dec 2025 13:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411112; cv=fail; b=UTkxf+p5GhtJk3y/OnbIq02fV1NqidUMDx8PhbzvW1XSt9fONFCK+myWLY3fM6FdbOnk8WqyMexECH8UA3VBENoFSMfugBa4SC7qyJ77OiNlhIx+PcaQVtFq8+uT82xIyaf7ZQxUFqzzUFlniaQsZByAkYnywCPOaIi1o/v9u70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411112; c=relaxed/simple;
	bh=kK2QK9Z3RNwrM02s226LbvKT3w4xv7TL/inS30Hsu5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ctCgJcd1XjpAJOkl5VdmBcKaZiIzTgXOMZSR4Nc1RgOVvlXyHkebnlr+wlVYe4Nh2tgkUW3zTDa41yP5v2YNK7Z2riHL/03Ks9Il3wn0Ui++el1ObIZJg00MVc76eVuKpyYj+dasA7bIiPGZcyCVdFGZEb0ox07yfjcghkhkXuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=P9OaiE16; arc=fail smtp.client-ip=52.101.229.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bT8ELhuQedWvvqc4OmTxbJx8MlpOnO0JACyhqz5qnZoXzIK9GA7eiOnuVo/L+JDCWM0H8wCLEk8IMade2CANDFC/4eFMDWo+NNG/lpRM+MeJD85prTOeTdlSzffBdmXeO4Gm/tJe43Siy5KVqghp/QIbxcwb6aiZ2dSZhnvbYFab7N3cEmBLwoKA3d6OUM3RuRu/26kWlIsr7JmxFpZiQX+miOSjjWRHgFJGGi69NG2gZ5C/Yc3XTzQ6Snv27pR4S0IGKIScBQrmH+SaD9ex4qyxdu3ZdATiYUKpIrV8SKCgUMQrVeG2ziFBulp4Qj+o+2CeJr4IvpsNCMA0c7O4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvfcu6JTLrQJ0v6UOjqmroIpxkh9D9S4zTFRC1wE+Ok=;
 b=skDwhe8zV3oLg7btftOECFg71xqC1XMrN7O1T2z4U8sjN063XR/raMmWjHJmkgPta/T49n5JkovlxuOaebU9ieuLNxpgNPK7kT0qOY9rMkdl/TMbx9bgPWTfznTliV+70GWJ5ERX71cRq56eD4i4HhXo9NcunosHnbfOpm/qCI6TyLK2z1ZT2ArrZXTWkoFK+QcMtIiQ09lVDQIoQFWy02aMOHKHMBlZW21TzV9d6qtMfp2Jo1V1XI/rgm/2h7d0uQWKe2WlRS4dVSMRsJPzgA4QfBeb9IKubLpJFBEUQsf0bar2sZjeiR/ndv90jC3yXzSFn859a3Z1HJPr0LLWgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvfcu6JTLrQJ0v6UOjqmroIpxkh9D9S4zTFRC1wE+Ok=;
 b=P9OaiE16eD187eP8DhBXErT0cCUbFoIujIsw+lytCKy7bdL1a0LseBHNCAcpXFoGlgwF5L78BjxSfeE2J5ahWv+/6mb+3tfZqD6H9GpOCoYC7JF2ZVzTO5Alo/0peZTJFYQqJh862aNnD0Ugkctnn2WAETjPFbNAEX8j9WZqemk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:45:07 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:45:07 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Peter Rosin <peda@axentia.se>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Georgi Djakov <djakov@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 06/14] reset: rzv2h-usb2phy: Add support for VBUS mux controller registration
Date: Mon, 22 Dec 2025 14:43:40 +0100
Message-ID: <b8f8b6096b0daacf92285096c2571cfedce062cb.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0324.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::14) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS9PR01MB14304:EE_
X-MS-Office365-Filtering-Correlation-Id: 05843e94-15ef-4544-5f55-08de41605167
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MZB2guqMU1O40gt3bCpo2uEBIZ06IIUqDPfKAbDqN+4slBuZBCMBPuo6LIRV?=
 =?us-ascii?Q?LSicDDTyE3qBfx0faZqBUGFQLs4C1v1jo3I2yOl524yvXdKpSaQ9Lzg+Sn6U?=
 =?us-ascii?Q?T/6cPJwOik5PevLBQzrZyrxfgIAzjESwLkNvJWyp6q3LbvafT86++SzMLz9l?=
 =?us-ascii?Q?SdY/wfCNIIjJTjr9ntqQrV1ygsg9PwD+eZQhKDs8tw6LlQk6/r5qWGBVdHK8?=
 =?us-ascii?Q?quD2UzRJN8HKbdA/sdTstMCpJ04FcfaZKbf7aqd8zTJboEWmEtnhC6aVvUMb?=
 =?us-ascii?Q?29ysFcNTes282IqmNl9aZuwmHMapL46xPSa98tRx4D502iJcAr+RQy62un8R?=
 =?us-ascii?Q?0wDqCvF56THCPc7unnDgB68qB2hnp44wijFnkwaAB3KHCw77E4BoCodFKVk/?=
 =?us-ascii?Q?HUAoHGZxvFRsnia7a+ss9DzZTkDyRDwejJbN/+si8sypcCWreEd/mDK7kjOU?=
 =?us-ascii?Q?E4mA8NlyNF2FU1p5HWQbNzcqoCqjdcXXWo1eYf/NUP03erWKkwOB/IsZibqM?=
 =?us-ascii?Q?J0cjqlgaxnqC4TEFhCB4Tsn+IKDwTK03UUsk7gG/2ex4HNlMf4msZZPETJ5q?=
 =?us-ascii?Q?qMJeRwvwQJzZcKsOicSHhKT9rMwimHnZ97nv4TkPpL0b1CiRphh1PWqkb40A?=
 =?us-ascii?Q?15Dyw1KE+AhahE3ejrR8W8Nek7RERolNPZobet9nls87bODaBsHuRn1UNFiv?=
 =?us-ascii?Q?sbMPnxdF2tJDslOrFkTr4GFnEPEO5gJeS7wDkwzOAfsae6yDV1hfNcicSBPB?=
 =?us-ascii?Q?jM6pt6s+JGuSLxk7NcrDLExeReVXet1T26oheCRXHBKkpkQlzNRHb6uAPVxP?=
 =?us-ascii?Q?RT89y1E84akcyj+hxliRjQYyxEFy+gGaJCko0DeVPQxj5YQMuU+z1kbIZRXE?=
 =?us-ascii?Q?UjlS0+3zj8fgTzQp4th1gywNkPNgQr6uJLAKmAghBbM3q+PUFwvLQh9rtDbo?=
 =?us-ascii?Q?lZjIVsY4lShwre4c8flCKwJQ2qvo2OIvZqVWJjkWdERjWtpOoz7wkZnnh1lV?=
 =?us-ascii?Q?tz3NkZgb3bGnwFOR+1ic4msxTm1D5JMJOWkTkqu9GF1ILVXFlMF/uYe9oWte?=
 =?us-ascii?Q?kaXwSDw5gptrkpa79So5sec4D8Idf09ZkoUCHsXH5CqBZ6/Iflf9kDjtyF/p?=
 =?us-ascii?Q?+tm6/1G4BOptoC9hmrg1Y8FxNgXfEb4pnbxfKyiBkgaKCG1fWVG6KyUlYLXV?=
 =?us-ascii?Q?cBfdAc9XVNkhBH5PpB0Ko+V9Ir+hiPY1EKLcUy+ukXKAeLOvH7WEUC8v7CTk?=
 =?us-ascii?Q?5yXKZYiG8sxr5unKnj7TSpDO6td5H7jSTTI6jAXIydVuEa9kB7ZI0j+bvNIa?=
 =?us-ascii?Q?JIS8yxR1FC87OAVVPdpL/gC05sHubYs1/rCjJQ15opdJsqHL5E1W8W8s0kOq?=
 =?us-ascii?Q?961ktLwRbwcfBjAlt+28vQ+HtFpheSn3M6lDqedq2VvJa2XGHmNszfLxljA5?=
 =?us-ascii?Q?ZEB5qYVcASEbtnOjTP8AjpGTkCtGfliqq7XVtWId87KEVjsGNpYv2fV5ALOS?=
 =?us-ascii?Q?Z7roC8XjrInQOsS212x5dJQzaaShHERMJcrT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FG5P2wyPUBFILNgIzGW6LD1vtu+doKp+mZ32iN9HrK6aoqVJuGFllN+W0TTl?=
 =?us-ascii?Q?6SybXRHWUFkxHV53l56T8e2gieUwe5nR/DWLK8rihpMl5gZe06m/Pwir7xpe?=
 =?us-ascii?Q?Y281DjyVwy/mPHwI09HCzPowVAE4RsSdp7XTfnj6slABX8DQFEqDnHUK80or?=
 =?us-ascii?Q?L/U+R88UuEaHTi+9l86NLKjmQf/OADtL5B4ccx7bSjhNixVE/+i7ee9+nchK?=
 =?us-ascii?Q?U6CJHUcCK2tvHIaMTjcDAoS0CErWDajaaN3wlL4iUTX/zZghwiNy+aqfYziW?=
 =?us-ascii?Q?3kIgkB5xSADuFkjpsw43Nxq/vQEOrvSAoh/zc7aJFKAnXxgaiSY5vu29hiDc?=
 =?us-ascii?Q?Vxcec9NEzr0dhveqTkx+ReK2Qk83z1KH4Llxir9SV72MM3PwX/qTCiR8/aEh?=
 =?us-ascii?Q?sYcsUUFEGu7itpsIK7K6y9cZCWPWD0IsJHFPp3ivTU2eJLqry5aoB/jBM42B?=
 =?us-ascii?Q?9gGH9zxxDG4PQmO084zoJ9HKGvQHVfu6x9kdroVP2ylF8MzLRKa9c4CMAD5E?=
 =?us-ascii?Q?GaLeXMfN8ELWH8Zd1lzZoeoByF2CGhOrdY80HjBMgyAADRDuTe8MSmr2PtCj?=
 =?us-ascii?Q?27LrauhcKq3/sOQT4Y9Ox0OrVUJsRzvdCV/nBHvJE9o8qxs27Uv3dCovTNFC?=
 =?us-ascii?Q?sPa4IEHgKoqRuDH16uLzQrrsPl/Xj0o9Ji4GFsnodnBm84XsrXbxLsh5rToL?=
 =?us-ascii?Q?vSjuVkoscMpDipKeu/XQJXaETvUA1oEDcUQbS649wmwUXJyh5wc9hY2wC4+A?=
 =?us-ascii?Q?DM7P3iQ52UocynQsHFNq0tPzAebPRPTiWXW3Y11mSRcgBQ90dS+XrPWV6h0i?=
 =?us-ascii?Q?2fJ/DkDqF4Qt9ybPysjxpiVQCRSmPZKdbEVGnz3WRFeMAeM/F1MCacsp/IUw?=
 =?us-ascii?Q?+ma7N1MXCeJUVpbWfT+2aIFSzCj9YxhkXN04cPCePf4Tc/uQ15uoSnrqtwDP?=
 =?us-ascii?Q?io/79N5QcGUEfDWBhKMspt9Y/7cVdcouCsyBIziJ2r8/T5vF3hLJjLD68jWj?=
 =?us-ascii?Q?MRsVHNwHJpdMctBQHwwoOmPPy4RRZvVbC+4hkCleTF98usnTAqdjhnPOEVf7?=
 =?us-ascii?Q?8ErMsfkJm7HE1BUSVqTUgVBaim1xzNgUhv3wdCMPUTlZXjxJEhV2Boea/dny?=
 =?us-ascii?Q?lp1cnAjHv7LwqMycT14d6fAKEmQb7tyapWtOgD3sYlAcGkMNZfPLzx+nVGgI?=
 =?us-ascii?Q?WD/r6TnDJWi0VwlX554zyeb7RQd6TU/rqi0E1KfRy2bVYMsF2LIN070jlmDE?=
 =?us-ascii?Q?YCW2yVcBj3CZCxvPohKLLOXzEqATziLCWaVxq+7TRvXGWbUflBp3EB5Exu8S?=
 =?us-ascii?Q?0HRpHYWNiHcMKP6ZO0RpGfkPS5OD8P8mtS9yvIflscMmVfCwmy3ug6CC0rc3?=
 =?us-ascii?Q?5B8zdoJ+tQadUqo04GwO4E4aiF5+Cpg0bjZA0WoiTt2HXVvywId2/5NVCN3I?=
 =?us-ascii?Q?5DO/b0lBO5aqmN7p5SKRPlKnKIRJyjqtpf11ZYtjvItJ1Ut2x3IEOND0YRFc?=
 =?us-ascii?Q?MATdfvygVoqSLdiuafAaW506l2+pWFMOeitqR601LkFxqhCOpjdOBxwDQmkJ?=
 =?us-ascii?Q?OGL/1hMacJyJBhW28HWS6hiUfqpsIuKs/5cKJQphvRuPFzeCt46IiapFO1nx?=
 =?us-ascii?Q?xQBgWB+uhkycpoHy/rubcJkcjCopN097Xuba1t/1eV0hoGOWmoE8JWh1lzfM?=
 =?us-ascii?Q?nf9vQM7CoG/2uovk0shqzN3CxrKltWmSrYIZRCANbokhCRdoDRTuubLXdeO8?=
 =?us-ascii?Q?NuzPd7iHDXRI1mbmN1l5Rcrg/tDxKYWsxh2KkWaK9ayAlcLQTDTg?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05843e94-15ef-4544-5f55-08de41605167
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:45:07.2691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MixpZNj1nRkZKau/FloKzJeThLWsa4no+dnlwHIevCT5cExRlQVtoct03Rr9o5W2R+jkUE8gUboLv2nblj3k0ee2JpqdWfmNo0p0Mpe2r/bJ6kLIf/7YIo6LHVmoG9YR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

The RZ/V2H USB2 PHY requires control of the VBUS selection line
(VBENCTL) through a mux controller described in the device tree as
"mux-controller". This change adds support for registering the
rzv2h-usb-vbenctl auxiliary driver during probe.

This enables proper management of USB2.0 VBUS source selection on
platforms using the RZ/V2H SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes

v4->v5:
 - Update mux_name to "vbenctl" to match the driver name.
 - Updated commit message.

v3->v4:
 - No changes.

v2->v3:
 - Use __devm_auxiliary_device_create() to create the auxiliary device.

v1->v2:
 - New patch

 drivers/reset/Kconfig               |  1 +
 drivers/reset/reset-rzv2h-usb2phy.c | 44 +++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 6e5d6deffa7d..d86a4a0766b2 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -257,6 +257,7 @@ config RESET_RZG2L_USBPHY_CTRL
 config RESET_RZV2H_USB2PHY
 	tristate "Renesas RZ/V2H(P) (and similar SoCs) USB2PHY Reset driver"
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select AUXILIARY_BUS
 	help
 	  Support for USB2PHY Port reset Control found on the RZ/V2H(P) SoC
 	  (and similar SoCs).
diff --git a/drivers/reset/reset-rzv2h-usb2phy.c b/drivers/reset/reset-rzv2h-usb2phy.c
index 5bdd39274612..15447a4f091f 100644
--- a/drivers/reset/reset-rzv2h-usb2phy.c
+++ b/drivers/reset/reset-rzv2h-usb2phy.c
@@ -5,8 +5,10 @@
  * Copyright (C) 2025 Renesas Electronics Corporation
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
+#include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -14,6 +16,9 @@
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
+#include <linux/reset/reset_rzv2h_usb2phy.h>
+
+static DEFINE_IDA(auxiliary_ids);
 
 struct rzv2h_usb2phy_regval {
 	u16 reg;
@@ -104,6 +109,41 @@ static int rzv2h_usb2phy_reset_of_xlate(struct reset_controller_dev *rcdev,
 	return 0;
 }
 
+static void rzv2h_usb2phy_reset_ida_free(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	ida_free(&auxiliary_ids, adev->id);
+}
+
+static int rzv2h_usb2phy_reset_mux_register(struct device *dev,
+					    void __iomem *base,
+					    const char *mux_name)
+{
+	struct reset_rzv2h_usb2phy_adev *rdev;
+	struct auxiliary_device *adev;
+	int id;
+
+	rdev = devm_kzalloc(dev, sizeof(*rdev), GFP_KERNEL);
+	if (!rdev)
+		return -ENOMEM;
+
+	rdev->base = base;
+
+	id = ida_alloc(&auxiliary_ids, GFP_KERNEL);
+	if (id < 0)
+		return id;
+
+	adev = __devm_auxiliary_device_create(dev, dev->driver->name,
+					      mux_name, rdev, id);
+	if (!adev) {
+		ida_free(&auxiliary_ids, id);
+		return -ENOMEM;
+	}
+
+	return devm_add_action_or_reset(dev, rzv2h_usb2phy_reset_ida_free, adev);
+}
+
 static void rzv2h_usb2phy_reset_pm_runtime_put(void *data)
 {
 	pm_runtime_put(data);
@@ -162,6 +202,10 @@ static int rzv2h_usb2phy_reset_probe(struct platform_device *pdev)
 	if (error)
 		return dev_err_probe(dev, error, "could not register reset controller\n");
 
+	error = rzv2h_usb2phy_reset_mux_register(dev, priv->base, "vbenctl");
+	if (error)
+		return dev_err_probe(dev, error, "could not register aux mux\n");
+
 	return 0;
 }
 
-- 
2.43.0


