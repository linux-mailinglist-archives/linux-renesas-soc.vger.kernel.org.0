Return-Path: <linux-renesas-soc+bounces-24397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D5CC46870
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 13:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F0C218894B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CFD3112DA;
	Mon, 10 Nov 2025 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="J9YKDE70"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010022.outbound.protection.outlook.com [52.101.228.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C199A31354D;
	Mon, 10 Nov 2025 12:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762776663; cv=fail; b=V11gTGHmuGWn/hr8dfiUbgdXyVpwA59FGj9p29S3ebWUu/2v0bQ1Mc1c0emoH8dznPL7r4ao0U1klCNGDFsPhx8PVechhkSDTOcFWo0aQBOEJJ2++y7CknLLGS83RL/OqvYBLN8atdM/Px+ZB57+9utXghGcSwnwKmOB4Co4lkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762776663; c=relaxed/simple;
	bh=Pei7IAns8EyTmjVTFzhQIo4Jqm0JxOeKGwuX49pnpMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Il1wMOljl83utCFNQlqvgqxheezTvwogFLinGHYkvxZyt4a+1HxIWE/vdo497b12qsNTekA4RflkxUSJW+V9e4vqIZbtNVQNWn/BfGcD7aaUOZHxMjxIvqMKjbTFgWZJmBB7XU2sSfQQwpuA+C4Gz6mPO7ffvR21Vx5ftjNeDRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=J9YKDE70; arc=fail smtp.client-ip=52.101.228.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DDM5ZFosc6mlmPMIGjITbcBs9HSqnFfktVrANNE1sQMxuroX/vtb7m+/2VLEjZ+CUtPn1xNoY9e/Vfvhx+UD6LALlEaBz+q3Jvh0Q4dLg5p5R1Qm9sfj1hwj1jeFmDnozX0fUeySb3kwNmPwF6GKpacGkEr8je4DAC6D3QQU/mlg1myot5v++WT8SrX9OFIBw+1z7DZhEC6AktFfWze5tNB7PnSjuaYbMB4p8ODR7AF5pCK4WIZkNm1v2fAIF/4+Baqq5dITvdN9OZLdOZaRZ7+9iVE6yfeT7n7JOJcwcNmXWMeLS2Yxj4ily9rnyS48rDseac00CNuKjOHzor196A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ljBlwlTZ9IZSllgskIYnwKIeYGV7HRDq+axyPpUwsw=;
 b=ZsheYQfSUahCSqMwql2OZhamPW3BnpW96n7Pn09rZXcOUWt9depu95KtyWtV0vs8nST2Fw4Sz+OcdCdi16V9iDxqkNLCPScpwN3nrXfTlsntGEdSMr3YTKlL9GhaN7j6MxII/mcw2ZO/Hz/UnfAqNMIDlZ/rAn4oe6j6UtJrwv/VsMQSiXI7Zyv866ZQP6t+RMCVwAIjEMoKvnuzKgYGeu1MCqtQdQTmpyN6v6wpvQOCwAMmUV6cYuVTo6DNgfCFvTqFd7GImdRpXQCvhx5ghYUDICAnSc5hGqls9oZ4H5uWgp5iKdV5+O6edexSZ3Nh2Ek8KaxwvyrIdNqI3CwysA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ljBlwlTZ9IZSllgskIYnwKIeYGV7HRDq+axyPpUwsw=;
 b=J9YKDE70TXbtfmVrbmIhjLco3WEHyYe4XCkscVfR8r8KGMXWy0zylBG3mzQSfYWG/iGRpEX4or33clnjs+Gu+Sw85sHd4dKtsYj+4MOvqvKSX4Oio0qXzOUJDUU8W7Vp08UgrfogCTQpO+zvlCZbR2hm8czhTsk5J9I8EXOx4K8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11558.jpnprd01.prod.outlook.com (2603:1096:400:37e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.14; Mon, 10 Nov
 2025 12:10:59 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9320.013; Mon, 10 Nov 2025
 12:10:59 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 17/21] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2 PHY0 VBUS support
Date: Mon, 10 Nov 2025 13:08:17 +0100
Message-ID: <7883ebd601420637d4f80106263373b09a02b773.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762773720.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::15)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11558:EE_
X-MS-Office365-Filtering-Correlation-Id: ad296bf6-da72-4ffb-e0d4-08de205235a1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dxIp3wsKAwqIqTpbsg3EJIFF82zcZlTYPZkR+1bx4zEHxpI8yctrnZh1vNUi?=
 =?us-ascii?Q?TD7jYFe0sCzm6V+d71PFWEdpFKetKM3qb73ZpzXsJudFVvtVnQizJzk9/NZY?=
 =?us-ascii?Q?yeoPPuU5kUyzsAKKyx9yVGfszBF87o4S6IhqJel01DNXQvttiaxZNKdNErZy?=
 =?us-ascii?Q?OomtcpuwYpYzd3uvbbeFD8C4KHWi2XwNaO+BlUmavXRDY+RgAFnEv+eJxb0x?=
 =?us-ascii?Q?NZKN7T9OuxsvBq2Tyqp2MQxpzDYL1CoGymvNDeU5lr9w91UUbV8OEkURUFEF?=
 =?us-ascii?Q?0FHt5VzSTD2bjxzYf2oCZ9GRVkNbz+TYnGkwjN0BEypqQFH/5U5eMdVlzWDq?=
 =?us-ascii?Q?cvDwJCtKDvt3GoSGHezrWuravqgURfNszhoj4gbaby8CNZwZuoi7zL5Tqs/f?=
 =?us-ascii?Q?+8LkGkYs/68swfdmle/kRnygaqxnQ25Ewi4u1H/GWIE0s53bh7LBBVW8q7jz?=
 =?us-ascii?Q?eYtOz8Y/9RrqcicbyXuxwdphAll/bmanxK/MwQHLGqpwQlKTXIZb9UZqjr0p?=
 =?us-ascii?Q?91mrbPpYEAVkC5Vy5+dGUQnkUeE0uquR1KqK4xPBrH+7xv1WxIzfo8rptday?=
 =?us-ascii?Q?SdPVu8/6pwxvD5AN2+izN9FIWAiCwOxMSjNN0D9DQbivVxBBxCjJBmLrKQIi?=
 =?us-ascii?Q?xEDZ5QGnd5Pf92eq1jNEaAFbNM1oyVV1WEEI45270dezr+/90GJNLvrUUktw?=
 =?us-ascii?Q?4OJEj441d+rQzTazXz6H/5//dOuL5J3lPDR9oKHm+gLyzaUW/xm0htdtNvvO?=
 =?us-ascii?Q?eDUaFUixBngNL/jbn97BMp8T9iX7ovNJR/O1NB+npVqxjeYWGbuPeDjQG75V?=
 =?us-ascii?Q?TiZmmfKl61wGBytCRqSFQuboyx8n/fczYBZ0dJ749nJnBTV6y/iaSMcfYcXE?=
 =?us-ascii?Q?eYfjJQAIS4hMJPlF7AdJaJw6lzjhbgegPgE9avRJg4kLF901fvAQ7spEwPAn?=
 =?us-ascii?Q?5qEpYDfVYMxJ3mow8mD7c+t+5RxsldjX/07virA8ae9HBFaIg1LhdIfpBhO4?=
 =?us-ascii?Q?Y56Zd1coDcWWtiJQM71C3w5KNy/Jdd1Uv1q9go+b8IgLPwpQH3V6StSKMlJX?=
 =?us-ascii?Q?sZ0OmoCsUcVOu8tLvUymY26oqCZa5tMHrHld1vl/e/ELyIs3czXH2NyaVKxV?=
 =?us-ascii?Q?6E64BfVNv6ORkk3ja9Yi2IQs+g4/qX8y8+miazH6IwxNKev+wotaxnHyI3o7?=
 =?us-ascii?Q?2oH3rPoqZb2/DiRsoHqQFIgTZcZzxCE2VKEC2lfI+ca8Q5EyAdOASIdW0eln?=
 =?us-ascii?Q?1JBktIXMrcV+pDocs6/NPsAJAYKNce37S5Ri4o7Fi3RhGLHAA26qhiPJJf5F?=
 =?us-ascii?Q?c4rmlAZVhm5eoTKXD84tvHPTmmL75QDoc9ecIX6zAcZFUt5zb9owUMv/g/18?=
 =?us-ascii?Q?cJjG1ydpf9UkLXPnHywYnDr8/OqFa7KZzYm6Xo+3SE5SE8R/G9H+cDK/OTll?=
 =?us-ascii?Q?rp6WUccVHKPQDVX9Hviov8od/Yrz695jYCmJCuE50biQAEMSXQ3SNdsznsna?=
 =?us-ascii?Q?Pz9rlMT+jitWSwsfHy68H25xI2gOR319OsXt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uq8yrwVOiEg0vzHSNBjbs6u+j9aLtvEV4JLa3zFR0L1gur2SeKmpF3O6ljhS?=
 =?us-ascii?Q?mXXqrQmoQKiPuuafP1OoiwCmWXBLCy8sk9VlazDMPwULOy2ILFV0HmaTF+oV?=
 =?us-ascii?Q?K2OMQgwukBx5VAwDb0Hn0irwzY3spso6Xlk09hC6xSzQLRDZUPQV4yO/jv6F?=
 =?us-ascii?Q?poAif5qdnBvyXAdSCEzKtlpaFxQ2jQkhlil/rW0PSKQGGC9T0JAaGLKHAUIi?=
 =?us-ascii?Q?7pE4RjR1omLKokmn5ZDLon8mD9iFRLYlXLsx6J6bP48qUpotbVFyMVyo717d?=
 =?us-ascii?Q?FBzHxpH1RxpvsqddUlMJxsaNjf/5z0XNJQrBFTbwS9j8An1DYGWxa1TY/7ka?=
 =?us-ascii?Q?05qrCSmcBmIydpOvNfzmQK6syy0zAGQd5s6xpNBytM6PNeMI2bJyq53X5s7B?=
 =?us-ascii?Q?xgI/HYUjXVeLmxoj6Ns2/JDgwC1HWXKbDSP5fyBvhZTELjhR48qAo1eDRNI3?=
 =?us-ascii?Q?L7YvF1/F5thRgLImmRD4ZfptSTWoIyn3xN7cYJMXnGWtZmClHzdfj2psF+Fq?=
 =?us-ascii?Q?iQD3hKyBySYuUI13uaUwbgPrTJGryknanMBNKPbvUERrEpGx3vzgKWJeyx3/?=
 =?us-ascii?Q?tuWKcabwU9cufvaJPdshtcnzwj5KeVna2OHYpNj7aNSEWjSRYpYswnwh8LMh?=
 =?us-ascii?Q?UuXtQAHtHtPMbjhJxAXFca3r/XIb9tZ3RHyXZbW7LxG67DNKTDWe3TRYM1HT?=
 =?us-ascii?Q?d4oZAlH2LDT6CCxSw4lCVwMfjGM+9mfrUfXGJtW9g9ttWTKOkff/C43JRPRO?=
 =?us-ascii?Q?Suuvhv9dtOPR9QTSR5gHr+81Xi5tv8N1n+8m9k0n16X77VBMv0sSHcQ9ON7q?=
 =?us-ascii?Q?thC1LAiiwnP3sMWLoHZjB1GsvkjT29N5veD6GQS236Jtyt/mh2YgUhHg6r2l?=
 =?us-ascii?Q?4waj8CANobRRiebh/2CzrLCBjPhTf2rSD4Z6eI3GRhq5CmtXh/ZftglxJ8T9?=
 =?us-ascii?Q?vNJBCDOIAvP8qYo1FX0s1A3dNNlCcIw8mrTupEiafAkzx8v3Hg8PAmrU6xXj?=
 =?us-ascii?Q?4Vmymh04bMh0BQYSIEElZlo98bSLi786bmyjbqpw1bCEwgPXwnKwblOE8X0f?=
 =?us-ascii?Q?nu9SBrBvSIRHafBAeQ07iu6HMgvxDVROOzonGleCd8SW/IFzDcPK+oaujARY?=
 =?us-ascii?Q?0b8EmksF9rKDXUTh7dxfQtOCwEhEnX7i0lgNoPjXu9cRsRBbSnxp0fuxpjQG?=
 =?us-ascii?Q?oJ6BNgioXuD0UsB4ZLKz/Q1foLNkrVwVQEND9SgvvBdVgB+nuxrn522d6eIk?=
 =?us-ascii?Q?9xGK3LGAw1MWPmyBxrrTtSla6/W+NzWimOjlHh5PKyFwxRIfkRRznIKIVnp9?=
 =?us-ascii?Q?s4zI8uvJvEw2LPstsEoqXjUoHwfKM8P2BDpOqAbBR1qM6QNhctkXBpMHS7Rx?=
 =?us-ascii?Q?kcokgv2AGMfzdTN3x2O9b7/c4RZAP0vViRel1MK3H81Qbv6z0fUs8IyIpVTy?=
 =?us-ascii?Q?z8Jvcnej5W7niTbF8Otlqi1aWA2iCz/P3jNQyxIrRGA5abq3ns0bRujkLLL1?=
 =?us-ascii?Q?w/4Hw+bH92q0/4ozrOfpFWMKZtSLLIWPeXDbZk8RCahqyFsL/bADuSZYn/w7?=
 =?us-ascii?Q?2kfSBfcCy0flohz1J1Q1oa6EBPuKLkDfqgWQTDb3Yb9kBBGVLu5SdKwn63rZ?=
 =?us-ascii?Q?/DqolMDfmKn3gsaovo4Yals=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad296bf6-da72-4ffb-e0d4-08de205235a1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 12:10:59.5910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/U9wK+xauuIm9EhqZsNZ6Q1BgT1z5ue1QbaGUzdi0EuUOPafWI14u80ieBPEXYpzMQXd3Fo9Dvh5w293l3q35InDoOrqueJLv2rGWbS8AYKrID7tULPom+8h5GuWAlJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11558

Enable the vbus-supply and status properties for USB2 PHY0 and its
VBUS OTG regulator in the r9a09g056n48-rzv2n-evk device tree.

Enabling them ensures proper VBUS handling and reliable USB OTG
operation on the channel.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes

v1->v2:
 - No changes

 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 066e66b5d51a..54ed7cb2d73b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -389,6 +389,11 @@ &usb2_phy0 {
 	pinctrl-0 = <&usb20_pins>;
 	pinctrl-names = "default";
 
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy0_vbus_otg {
 	status = "okay";
 };
 
-- 
2.43.0


