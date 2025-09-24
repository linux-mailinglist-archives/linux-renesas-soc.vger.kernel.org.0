Return-Path: <linux-renesas-soc+bounces-22274-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA791B982EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 06:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BC272E6096
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 04:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90BD622F75B;
	Wed, 24 Sep 2025 04:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YkoNropY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B4B231856;
	Wed, 24 Sep 2025 04:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758687471; cv=fail; b=CdlvZPkmnuiV1U6UMlaeyaOU8vvxR+29KA74qKIcmYOmOFAgUvRP3dX2sPvtM8DruSO5VGintOBW9mNI/4c4M4OI7aIgckj/zlWCnA+tjvp6yjZIxi0u23dOYYvQdfxqU3bgnsh0ZgcMk9cmKrrMPw90ZdbpXQHyUsajh0qqD04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758687471; c=relaxed/simple;
	bh=+IZb4MZZZ+w96x+vJr2L18dFoUudQ4koBIBjY74zx1k=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=deBjWckU5l6cw3f1cjGX4/YNpsdQWxZG71E9K/IQqIVMSnIDtvRqcpnvYfncjW7K1wb3tOnosbp5J6o0BHmpDULkE9gv9ntAhnie9ei8MdKk0bbporEIBY0vx4YvoWMdk6QpIcCnCKr6bHq77pzABnF5KUqRzquCcVAd6w5/nCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YkoNropY; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EhvXnQRC9eV5yL0HUbmzWqPzAsG7IZkaXqOBewDF/jpeVPHECBciJz3q8GmwNNe0y1izbHDsa5Gyd/ninn8pNKe+eCShBFKKfWK2a6501P/bzEle/z/0x5s5eBHJMd7O4pqxL/D/nYC6xTHpyQq/bjTNl7h5IyMTg+vsKM8lsd+wgWqjGDQDOE1Y9ltcvr7FjNMgzfoqpC7GTJMtmr8ht3ug3ryHUwuotR+/c8D1ABopocSP8NamTPZd7w6a+MqimPM2Kc2x4wp5xxRb7Zf0Mmt747vjxzc6acGAdXseih3W5bPvYDTRPKvoorUEIenLir1msfAdLEY4O7rCaH3DHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/93UXATV5jogDXK9EQqVhnlxSAwhXSydkjHCcznkRGA=;
 b=nPKnsCq9FVFXdFAD61Xomc8S5QWPbTxM8VfbM1TqISrZipXLKBqwGmftmqGoCu/poh/3DJ13SHEJ0LkKZLLLuS9V1ZHZIxnUsrxp1kCanPBP6nPTeV7CrjpOq2LR6yu2jD7YhLgaB4AnW6siJXPYhYa9pnwC0AVgRecmXYKfOOHuQWHwH120S41g2C0GoeojqQlCWftnkQwfho5qnLmOrC4w13ZeptKiMq55AtuyJpJ+aUo0Y4YvcmP4jTc7atS45RgYO4a470OVS3XGz+afi/XSqm/owOJZErIk0EDwhpR8B50HLyCbjuXXiSqXcvQ6Fbm5UVyuLDuNPXXMhqB2oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/93UXATV5jogDXK9EQqVhnlxSAwhXSydkjHCcznkRGA=;
 b=YkoNropYFjSdKeAhyQO/KWYqK2lBK4BIUVpyQQhhpl5JfTziF0wzg5E7+9ZSKQP1m4JFzDFXLD13MtpJCI+yaNQ1PPT6m9qOFTslCnKf5mBkhA80IDlY4K5fYAyzlVjmjdl4mWUAve1EIAvzaD9extxf/dMQo58i9CNCDWelBPA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB13055.jpnprd01.prod.outlook.com
 (2603:1096:405:1c6::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 04:17:43 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:17:43 +0000
Message-ID: <87h5wsa3h5.wl-kuninori.morimoto.gx@renesas.com>
To: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v6 0/2] arm64: add R8A78000 support
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Sep 2025 04:17:43 +0000
X-ClientProxiedBy: TYCPR01CA0186.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB13055:EE_
X-MS-Office365-Filtering-Correlation-Id: e41c4aac-b926-466e-ece9-08ddfb214ecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G+byybWRvJCM7ONn5bhZB0969pg93z89LUFQyUluxf+PwPEOT+hBztD1j3Bd?=
 =?us-ascii?Q?85SoUc5/A53TRDmpHFA0tX4I8p3U7SHVo9TXqq7BJ/viCGYNonrJabC9XLdT?=
 =?us-ascii?Q?ewmsVd+EWRgOuBEXLuBTUV0MhARQbvz3k7dTOM08kekUQLpymgGa3jzdc/IN?=
 =?us-ascii?Q?+AobywTyTftjk8TxHLSStGRIGDYQ5iKfE2d9w7lU7lEaslgsd5wq0YV58A36?=
 =?us-ascii?Q?U3F3vdfHhoCENhda9ASfj7sjfNuLUfn79r5abivT8zT37aY7QweEP4Y2IfYb?=
 =?us-ascii?Q?c3F1mgCN/qUvTVI8NyF6XAZOGNNlBqVALgdOlsNBFludTHwHRDEbAQ7AgcHi?=
 =?us-ascii?Q?iN852xexH+9pFTR+x9nWFqVzpsB8y1AofaF92X78/gNccaTtv/pM24SQwDx7?=
 =?us-ascii?Q?cFZH4KvHXIRcMwdqNqS1rvdNeYhlcqJge/nFGHPkV6/PvjgplFfrVUd5Dm0v?=
 =?us-ascii?Q?nQ2cN9yUFwu6tCCeoQXA//ZextDg0xqQnti5xLsLfcVXiOwp/pCOWzJYKpCk?=
 =?us-ascii?Q?4nMfLkZTrJHW6GMjrMcrv+merxnlIEEPbVkT6VKJZQ5UTHAsAu5Mc4ey1l4m?=
 =?us-ascii?Q?skBUpJORREx05J2HaBuWiT4OXk1c3Mg0p2fH5ROl0BRI8MRhEqm/nsxM/S65?=
 =?us-ascii?Q?xgRRcnkIk24oj8wvw++dVfNEiCzuqjIgJG+BWB9PayafEHYb2ayxBNeUAGXC?=
 =?us-ascii?Q?08mI4ZV1MLc6C/BHx6+cwGqH+svubzqj/smh6J6QRYW8KxprK9T7PktQM01W?=
 =?us-ascii?Q?yciW89UKV2J/jw12KeLRU0MPH5TGnCSrSLirpwfqn7H+fqfHUm5TmsltV9n3?=
 =?us-ascii?Q?7EU6Bg9uXepfH3OMU6k6FfQldeWg8emqsPQuHwYaf0PUTPcnedx4Jw0dCXQ9?=
 =?us-ascii?Q?HPKXbUpscgPiVyuXRSCGqcE2NCaiM37I8NuYxKcRSRBXrj2C1nfdxKpGgoUG?=
 =?us-ascii?Q?W4NgN5OQjMF54C0reijbxsnlP1tdFnTYWbYSFrnk5c81BlkMIs9QjScs4ZI2?=
 =?us-ascii?Q?hwGCVwSlMdX1jvkxukTt4bJNadP1ePAz85BCIePtdIGQa0YbNPrrDMk4N6FJ?=
 =?us-ascii?Q?z51DXUIbU8ArdmP2AGVmek0AWj/myGAxkuFl2KWv/JJTRCLMsUOFctszdPna?=
 =?us-ascii?Q?bldSJYcFknOTCExhiKU/UB7LQc6Kg36asZVaObuQYcCf74RbpwJW3IpaeT5l?=
 =?us-ascii?Q?vvG2hDnd696bCcAfvLsZdZTfTnC/6klqi8kOB3HKlJ8dq7Y6DnceJAmNZjde?=
 =?us-ascii?Q?BdmyCedgVxADsnY0cwhdZAenX0fD8SFHp4enCKl8X1NZBcnQoXeAZiR2hjPr?=
 =?us-ascii?Q?xtAHF3bB2lo/yQLMmTL7jeg2xRntSYVwfvkKecsomXzCCFtpbuaFyxD0nLvS?=
 =?us-ascii?Q?dOeUwwIszhyaP4PkZA4EOfOUi5CwtIM9dJFU0sm79tFGYVw2mcYFSV0P3Gnm?=
 =?us-ascii?Q?xhTtUlIkANv5eBYc5QaLDIpMbQlI/WXp/aXe29IILhe9ced2MbrR+1YybRLG?=
 =?us-ascii?Q?1aUthcMH61H4BxQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g6rrDXs2ss5h+fdTQLnIwLQJQTJUgXjb82dSFdCM9ytOyv0AFfjVHymMj7at?=
 =?us-ascii?Q?1bYH7xp93iiXMiEMygx9kNuZVOtuR7jIc6oO7GkwOULiMRZDyU2Whd82ufuQ?=
 =?us-ascii?Q?CzsZOn4tkbyH+Kvs9OX6nMENek1+Hqfi+/bkc2ynE3AaFDhG/agUe9FyxMsK?=
 =?us-ascii?Q?R+/Jf2/rBYD2CtNc8PtLcE8sO+QmPMt5RrzGnC8SFbF9pYZdHZ7qCD+2JRE1?=
 =?us-ascii?Q?BKxRucnd5sQfQmZwbpo9X5qQdLlNUl80t/qS2WCRa/jNsJc0MOnkXBlTpLS/?=
 =?us-ascii?Q?aYhVjQPpBvxRfKF1SoHtCbAMwV/MuT7OukSTXRqsqEIjODHst7oLPsl5S5PF?=
 =?us-ascii?Q?XeXQoR/pPlHtL6QhAE9GlwwBYk2heqf4APVXiURGmmtw85Os/KUQk6yfDS+R?=
 =?us-ascii?Q?N7USxl3aaocrGodCXg4qlHNBMdSVJEN09LFsRTV5JSjgBdhTat9FDSHyttZc?=
 =?us-ascii?Q?9ZTBC7SHS9R2mYvOarJoeoPQa0FNTZ4sfFLUPlzKAMboOr2eKBV8wktX9s8Y?=
 =?us-ascii?Q?769OT/q6LorsNyFI8sAn/oUKFMCJ8W1Mj5Xx+Y17KGrvqgg8C8xjLC00oYfz?=
 =?us-ascii?Q?lTCKFi+6WYzBqSFgeHJVSwHDtGmM7mZMFKSXOVmHGcZSHuZ4Aw0boKg1qxv9?=
 =?us-ascii?Q?tYK1ayGN0MrjaX8MVqK7QJdh4mw2Dz8xWhmIm1KkcvIZzQxBlXKwFZvTWf6V?=
 =?us-ascii?Q?ymf70PGQyAO3EwtGy5Z6NybMzyvszgJ4GZe4j82ykTcHdJKIyiLMHoi/zqA3?=
 =?us-ascii?Q?BHmHnMsei5KXfaWlJtmcRplDVyRsqnmkn3/hxH1a2ETzfmMw8PwWwHAaVaGo?=
 =?us-ascii?Q?oQx2aN1+G7W0nOAPHKCp8U8HqaAtHMjmsv0vfD/EYNQzolWJ1XJD5llUue1K?=
 =?us-ascii?Q?vLy3qC+VAEr/0VECLP2px5kq/WhrGKEo3BrFdsfXuQs+pkxHiCZFf8CIPv+H?=
 =?us-ascii?Q?Lx+74YPI6RB6VKzaFXSv0OUI6rsQiPj9YaQAmLrWUkbKp8b6lH5kpBrKtKB1?=
 =?us-ascii?Q?6FZC0830SLtioPuCRI253j80TGRK2B2xvGbtgaEaEQjaEPS0f6gWhVK2UrRi?=
 =?us-ascii?Q?c40Ls7p6FmRyWxYb43YYEu6Lw1TeSHI/LYnFwdGraguS8sHOwYCvY128Mu6n?=
 =?us-ascii?Q?Qt3BlDaxoeioDQKKBl0PGUveOH6zGDInY9U0X9R+XYFtajGT+DsOY6pMNBWG?=
 =?us-ascii?Q?62deK4dtZ2LJeJXStoM0R8c+sRq7sm6Yg9WVINd0L1n/5wCYT8XFESNrw/Cq?=
 =?us-ascii?Q?TIomwLHhTNLNBAbvzFL7er+2nAWgM7yi/Zkf4iW0X53HZENCiH6LKAEHkUvv?=
 =?us-ascii?Q?4Rysr11iobV6Ty9f3G3s9f0twaIveuBnbNZXxVLSi+V6bw6I1qKrKQ0rw0f0?=
 =?us-ascii?Q?b9ikcLRncDGdR/MQ76EcRZrQaHDO1vgzk3DXpspkR81KtURDEVcjvtmsbtqf?=
 =?us-ascii?Q?UidQY4Sk6b/RvAAlOEr3l04gGpr//5mH0om/dvb8NgheNx9Ugn1Q5sxx670y?=
 =?us-ascii?Q?EWEMWzS3il3AiDPHREMQjWWVfTpGAu4AeijoAYsXwtLJQrRvJentPYDQq/2k?=
 =?us-ascii?Q?3dkyV1XmfVzliI9zlh6EawM27Wh+jLRkf9H7UW12ULfNMWTLiGejjn9UzKAu?=
 =?us-ascii?Q?SSlMXevdVsRqBimvkZzw+EY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e41c4aac-b926-466e-ece9-08ddfb214ecc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:17:43.2637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blaorHgJQEfvMfzSNMa612GC5nc+1eZpJ9LaLJrGP7+VLqYMWdOvSpasj9Y/N3nkUD41M1pGmoNHjz3r7/M92gMIIkY3a00JfFy03y5eFZTW9YB/rEljpAnC+tJ1M1+E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13055


Hi Geert

This is v6 of R8A78000 support for Renesas.

This patch-set adds R8A78000 and Ironhide board support.
It is based on SDK v4.28.0 or later. It will be released at end of Oct.

Link: https://lore.kernel.org/r/87ms6snut0.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87ecs5abp9.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87tt13i0lh.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87o6rjvzf4.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com

v5 -> v6
	- dt-binding patch which was added on v5 was removed
	- arm64 patch which will add Cortex-A725AE was separated
	- alphabetical ordered [1/2]
	- tidyup GICD size [1/2]
	- tidyup line length of scif compatible [1/2]
	- tidyup gic comment [1/2]
	- drop maxcpus comment from git-log which is no longer needed [2/2]
	- add Geert's Reviewed-by [2/2]

v4 -> v5
	- Add new dt-binding patch to remove "resets" and "power-domain" [1/7][2/7]
	 - I'm not sure this is acceptable, especially [2/7]. These are optional patch.
	- A725AE -> A720AE in git-log [3/7][4/7][5/7]
	- move "interrupt-parent = <&gic>" one level up [6/7]
	- move back timer out of soc [6/7]
	- move L2_CA720_x to out of cpu@xx node [6/7]
	- rename L2/L3 cache-controller-xxx node name [6/7]
	- add "cache-unified" on L2 cache [6/7]
	- add "renesas,rcar-gen5-scif" for {h}scif nodes [6/7]
	- remove bootargs = "maxcpus=1" [7/7]

v3 -> v4
	- Don't include already applied patches
	- separate Cortex-A725AE patch into tools/ID/errata [1/5][2/5][3/5]
	- fixup gic reg [4/5]
	- move timer node into soc [4/5]

v2 -> v3
	- Add Reviewed-by from Geert [1/6]
	- Add cortex-a720ae patches [3/6][4/6]
	- Drop enable-method = "pcsi" [5/6]
	- Tidyup node name controller -> cache-controller [5/6]
	- Remove cache-unified from L2 [5/6]
	- add dummy-clk-sgasyncd16 for scif [5/6]
	- re-add clock-frequency on scif_clk [5/6]
	- Tidyup GIC comments [5/6]
	- Tidyup GIC regs [5/6]
	- use "renesas,scif-r8a78000" instead of "renesas,rcar-gen5-scif" [5/6]
	- Tidyup Subject [6/6]
	- Tidyup Makefile position [6/6]
	- Add explanation why it needs "maxcpus=1" [6/6]
	- 518MB -> 518MiB on memory [6/6]
	- 16666666 -> 16666600 on extal_clk [6/6]
	- Drop comment from hscif0 [6/6]

v1 -> v2
	- Add Krzysztof's Acked-by on [1/4]
	- Tidyup "cache" properties on [3/4]
	- Add "clock-" prefix on fixed-clock [3/4]
	- remove un-needed clock-frequency [3/4]
	- use "-" instead of "_" on dummy-clk-sgasyncd4 [3/4]
	- use "0" instead of "0x0" for gic [3/4]
	- cleanup "bootargs" [4/4]


Hai Pham (2):
  arm64: dts: renesas: Add R8A78000 X5H DTs
  arm64: dts: renesas: R8A78000: Add initial Ironhide support

 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../boot/dts/renesas/r8a78000-ironhide.dts    |  85 ++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi     | 787 ++++++++++++++++++
 3 files changed, 874 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi

-- 
2.43.0


