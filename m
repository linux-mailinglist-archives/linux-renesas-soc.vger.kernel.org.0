Return-Path: <linux-renesas-soc+bounces-24964-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58083C7A77D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C85D53A28E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A0034252C;
	Fri, 21 Nov 2025 15:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LLy8lkcT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01BF34C81B;
	Fri, 21 Nov 2025 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763738044; cv=fail; b=siy7kKS40QxqBdi7GsE2H/4TSkGiKApF9BhDxw9UMGgFJWuT44ibXooBA8YnYOuAMknzKRt2AG8eqLp500fYZhbaqMIeoDQ+saD5yxbqTB02ctnb3scg84xSgfjZ7OYcBcO+sQUZzum2Qv3euTkNs26In7Tzrel4FkkMlsSjEJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763738044; c=relaxed/simple;
	bh=O4OXledpki4Yj6fchiig+gD0FBmiHTWx/WS6VAzmyN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WZXgFtxL+JLGQd0vorDRYydxt3PqYcPTEMO6xb0fmpsAwp5Kv5fcuJC7yuE1DIV92pbzvUHVq23psl+c7rWaa1X2r27dOVpPFuTG2b0xw7La29iwI8it9FeuH+UQbizOEbbasUdgbDkR6YLeDE/5oF9B1J3ztHB8C1uHI5y8k3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LLy8lkcT; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7ltSGhgboPtd4Ge/AusSBIeaJ9AKVqjjawM87YWwnEwCuSiUG/LCZR6JZu2JcHx5eKcutxozn/DGpU0ZCiNpKrBqmZhadvowvE7J1Cc80RnkuxUBUnhVj2zFFJx0YqDsFP2FWu9Q6lmH5spUEpwRR/hSN4fhdbBRkO/bhyy/SVloaeVC2wGlRfyIOrBbxOc3O+sAwzcRrFbkXtjj4EIAgmdIiFAxkEiub4JZpoinHbq8Rys8oRSptXPTmz3pux0G1+PwAJXny6SJ5fThvftnq2Q3dgiFFDlf+9Y2oqPS2jCl3AZLoBGNiLN78axsSGLjwu3xaaiUM1H555TIUhZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvTQdT540Jxc4+6xlrTFof2lMvHbMDWf+/J4oAbkzD8=;
 b=YwiYOw8AmqgMxNDub8Zkq304Q7aWFsrc4/fn4nA589Clml/d2wFrGNQ0Qm8APc15UNbC4uAoObuGwxyK5gz2+0mWnlDDbHkUHwp0kq1RpOcr+N5xt6+Q8F2ZBZWKiusrHRWl5RZyksKJp1gncsWiwrlcQel6QMGhbyJ5gKUND8jcMTVArLlvAU2ieN+P60I8SDS4t73qIVanrJlnKI2DTPGuznw+Lq7+BF72wKEwyI11gDBtIwlXFb3LqFDyo8jC1bPMyZVzSFnae3r1xFPOIdzf+hQQ6Xwt1TkIr7VsvhkJ3/mZAwNJY00O7EC0k0HA/Klu8y2tS4rltXGkUYrzvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvTQdT540Jxc4+6xlrTFof2lMvHbMDWf+/J4oAbkzD8=;
 b=LLy8lkcTXqZoxIlY2dZcRFPlI6fcB50xW3RSUTfBtRz+Hoe9IDMZEAX4wARMWHYawCBYRqZBGhGPG5mqqVPYpf7kGBALjtX5Agy/Dok+ThsfHBXhpPn7VdwJplSNIIunmP7hvCr3NcacRy/XFhZguYkyFFbJPLipS7z6DgdPrsM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS7PR01MB16954.jpnprd01.prod.outlook.com (2603:1096:604:41e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 15:13:55 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 15:13:55 +0000
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
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 08/22] dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
Date: Fri, 21 Nov 2025 16:11:57 +0100
Message-ID: <1d67e91c94b1be34f9862180888f845e9bc4fa51.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1763737324.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OS7PR01MB16954:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a74c29d-4b84-4e30-8d00-08de2910965c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q75xUtu4vcgsd1yhQ6sdntEzToOoMlstxfHBtiS+zyQssaAPafGXia88aFSY?=
 =?us-ascii?Q?3pSqgfdfzEzIFI3BozshcY0tiCWBymAXIx1rByotAJq3gwGoC3lk0GR/Tn6v?=
 =?us-ascii?Q?MWUzmVsKhAtr4L3D+rCSA9hIH/cUqAoE7WRMSxy0kd4xVw4MXtnQdLz2RY2v?=
 =?us-ascii?Q?n1ZQtzK4hwE9IDHw9ru6QUs90chq/beS3uewbYpH6t3ZBF8yPufPJJKBr+Sr?=
 =?us-ascii?Q?4Ed/ZgssC6k0mPZ5BdUlbZc7txu8EWnAKb2EjLp3OS+tTfY/vpOJRtH5zvUf?=
 =?us-ascii?Q?ACNg3nqlCo6ilvbwo4GVUCJNFZi+a8l6ioRw+cVbuxCeGpBdFCmiojkRlvQu?=
 =?us-ascii?Q?MzSlGWTTWce/g70Zp2oMDwnhK2U6zwIFTY6/R+eHbu+HMz0kT9zfBC5wAKca?=
 =?us-ascii?Q?vhNQe362D6B9N4yBS8MA1teQLiss6CEbqq/2LXlrSQ/cbZORczZIcNrJKWEp?=
 =?us-ascii?Q?ymhT5ayp7MIxlqe4i9gsUdxeRfY0XMYT4nQNxSmv6fR+3ewrxpq508wRhc/Z?=
 =?us-ascii?Q?qZORkZsz8hKjBCy8d2MCU+J6LOWR4QGZOUOx43NJus4+M6aq3D9hXUWQcbhE?=
 =?us-ascii?Q?QUDfUl3EPj9RZHLFx6DRl7LQ73ahJt0vuJYQ8xp+jUgrIJIES2oi4q0BdhpQ?=
 =?us-ascii?Q?qpH4rXLb22tN3GoswbDiazTpxAG/uLx2QbSDQQ5LuOp26bxRBP3SgrvitdrM?=
 =?us-ascii?Q?2+xEuEHrxHzltd0fY6qhW5aJgS+UEKRtXD3U5xhQG4YIrgArSHrUUDnaTWud?=
 =?us-ascii?Q?wvpLGLmjkNRXkkZYhm+euDkxLusD4NeLbPWjo2eYZL/OIQGK2LEFKTImYaLS?=
 =?us-ascii?Q?FCpdApJItIMU8Ds1tBvs/C0LE9mAabwzVYDn/jzGVoQvf+NfdRWnyWXfWqJR?=
 =?us-ascii?Q?Op2p1+vbQog35gNDv4AVd9M+4c9YOyn3+iAVz9439X9gSfq1l1V567fPA1VT?=
 =?us-ascii?Q?t4a0YmXGBSmTs1DNaX1vSDQWDiicYkuBGHXeF3lBogpg/KxhrB2LXtM1ozy3?=
 =?us-ascii?Q?uMDnulgTXeKN4w6oA2dCaTFw96+vL/E/vq2mCLcE4502rbqcNYKI96G6pQJn?=
 =?us-ascii?Q?DKSSSqStuLaOKDatlPPnAkPo5UT0FHcqVSIy9Z5ARxje436W5X/qLGOIXwhs?=
 =?us-ascii?Q?BiUihxbrWdSwp9jSI/EOl7wgw8WmH6c8PKQBkMI5rbDQKNLpT7xPvvNSuZpY?=
 =?us-ascii?Q?jb95UfdhjXVhgtZEXQ7cHyuhJvN0vYT7zNEGKN1VNyviMZ5i6WicVrSakILL?=
 =?us-ascii?Q?CPWCuIawT8v/RytYvYe2Dwp5A1Qioyyiz0cmkF3lNeA5FEDsXHB2vd6Ni2pT?=
 =?us-ascii?Q?LFIRUFWnGl9dQdmauzfnIR5a/2hFEM0MX7O9v7P1KIeyR6IyAvfZ819mtsuq?=
 =?us-ascii?Q?BBvOPE3FjqndcIHxNv//tLf+tuYZfNuI5VB1NLRw6TXe7kzFbB83SKJX5lHa?=
 =?us-ascii?Q?EK7GQNLAl/nEJZZ2UN3HznWOChd3RIw8qtdMhyPct7VNpM/kC4k7hf9c3/VO?=
 =?us-ascii?Q?gKjzSuxEdDKqV6z5nP5NTxr3kH8TEcj9gn8b?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ahasEbtinhksx466/UU1lsRRdI/alSlaLSe4txrCizNY5WTk3Gz1/oq7MOSO?=
 =?us-ascii?Q?GPNWEvTIi7bFflr9uzbIHqLSrDNv3ry5L0gCDZR6ZnL6wopJlxZFwxk74tuI?=
 =?us-ascii?Q?5DAQM5nWujeFUz5VL5X0KzkU7nXaSGPnneWZiUbALaHZZ7f1sqgFaa/W2q69?=
 =?us-ascii?Q?nVgDJJgaitp9WjDpVWlvkwVtIroi7d2aE2gQxZCpv/uh2ViNo0EU3eGz1Fpi?=
 =?us-ascii?Q?rBnr4+L8r9SHR5pLM5FE1tQz/W0tR/iymRffPzFUkVMrkCOnp9io2cn1SkRR?=
 =?us-ascii?Q?hjyHqPoYYJ0NZY51J7u0Y5gjiySJfB3ZWDtfDO05bhPkWTgIq5m0xw4SkOCp?=
 =?us-ascii?Q?KQbd8feh0dEovZAUCyVAt4fwgAyNFmWHHApVTqI6VVym/68eCxOVEEM7pnHL?=
 =?us-ascii?Q?mYiR67vPsj4OeGv4L/eRkLlwJJAU2LKvoEPo+57k36iPVn6aTNn5Is1hK1cQ?=
 =?us-ascii?Q?lXlspUylC7dWPdrg49fRNqFjv7dKksnbtFw6y1v/jeSn0rfXqUvdCYkEz3zL?=
 =?us-ascii?Q?XfrY5CRwc6w351HArV0AZ5Pal7LlP/0rPO8eCRomKuUPnbloajNPMBBBsHu6?=
 =?us-ascii?Q?gmtAJ420nMD7fI5wsyGrj2KADeTSg8N4chHeRVxkzkZVeiAvdWdJc5Qs0mHa?=
 =?us-ascii?Q?uxWEBDfEsB5QDTvRto7ZR77eOPmfbawE+UqR5kO0M11HlQeSUiNCu8IvR8Rf?=
 =?us-ascii?Q?qfobbEZuJkJ0KIcloSKt2gKMBnRVfOhs9wEXmI3788soECgItmkHAnIvyN97?=
 =?us-ascii?Q?MrctRQS7CPf3aOsu+EggjYXqBERZ0GjgP46z5eNXUIDV//JvDsdAXKrK1Q4G?=
 =?us-ascii?Q?lSjqRfhhgnVaxU4QnPVUI0HEUHc0QjVaAu8RCPpbvWPtNUu81COQn2bR4p1F?=
 =?us-ascii?Q?VlWUDwXFlpibtTeraxEV0cCINrPLQ2XZ12FPc+eEHhxSzojXIRJvKY7lQrdd?=
 =?us-ascii?Q?GgdjsCCb86v1PAiy5g1GNnzr4Mwg+6ypuURs57IUpwlkeCUuc5l73gHF5j4n?=
 =?us-ascii?Q?DbtuQr55g3MaKj7s1Q7VZYktU1o+Ac3F3I217ZhWGMKdAKKDLgOZUxVd1bGV?=
 =?us-ascii?Q?shlySngLcwRrVHSQEhymQjtd9Amd0s9ka7wXUIG80qUgGn7BrOUqijeVr/e9?=
 =?us-ascii?Q?lfidnsDvT8Hx4caFNoTMJemk5lGNtLBLFWK98FWHirxhDiSU6ULbyBEnV87s?=
 =?us-ascii?Q?F55Z7mzabnxgT9NH5h1TgTkPbAnVt+YmrSrCY/vOSTcQQg9pKOd1mRdc0U5E?=
 =?us-ascii?Q?ijtjUCmMs0BxdKkOXVzHkS8l3jqDBKAPUwnAV62rAkF5uIGkGiMY5D/GSDxr?=
 =?us-ascii?Q?70OjL0+NZ3lEYoG+0CpHgPTp4sPoIRnXjWG5bUXZLdD5bnO/jfCJpcd8zuCj?=
 =?us-ascii?Q?/4KIdLq4nsK0RSCf65o22rkvM/IbtLR0IFChK0cA4MI0N6122BwPbXY9X2xv?=
 =?us-ascii?Q?pTGmtDbpBJxeGmC9EWj+6NUO1yeK6KYuaKPwqVMtYkhwpoZInAiJ5iSbtEE1?=
 =?us-ascii?Q?/X2KXdzPqXq7dPA3o0hDnvBgSDotxCgxOW3kf0+P3q/CP48I9mzgfbangXno?=
 =?us-ascii?Q?3YsXrBwn7L1o177K0Rka4wmBuarZCdSI6v2Sznnr6SOAj4Rb3tbINKR2f2jY?=
 =?us-ascii?Q?VJ/kCFOV67zICV2rnehsz9Y=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a74c29d-4b84-4e30-8d00-08de2910965c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 15:13:55.2819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: he5HmmEsmkHRFHlRS/GiV1IU4y+W2ZrcSPdflYf4M9KY289CahIWTb6CGA9gSh6UPvkgdxyQFZCIS9izWUQ7cu2EQ42yhHXsh1eww1QNN2c9/sx75dJnIw+SQxc00cSp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB16954

Document the 'vbus-regulator' child node in the Renesas USB2 PHY binding
to describe the internal USB VBUS regulator.

Require this regulator node on OTG channels to accurately represent
hardware dependencies in the device tree.

Documenting this regulator allows device trees to model the VBUS power
requirements of these SoCs properly.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - Collected CDooley tag

 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 2bbec8702a1e..2cd0efa75f81 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -89,6 +89,12 @@ properties:
       Phandle to a regulator that provides power to the VBUS. This regulator
       will be managed during the PHY power on/off sequence.
 
+  vbus-regulator:
+    $ref: /schemas/regulator/regulator.yaml#
+    description: USB VBUS internal regulator
+    type: object
+    unevaluatedProperties: false
+
   renesas,no-otg-pins:
     $ref: /schemas/types.yaml#/definitions/flag
     description: |
-- 
2.43.0


