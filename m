Return-Path: <linux-renesas-soc+bounces-25248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BD1C8E209
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D305A3AF984
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 11:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E9432E720;
	Thu, 27 Nov 2025 11:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BiMmuNVg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B15B32BF48;
	Thu, 27 Nov 2025 11:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764244243; cv=fail; b=N6+5mHSBg2b3H78ByHy1KUVKyXC9Kml02H1fIU0uf7AcLjfzp1JzINkJ46jj2WEROn94omh5L9yVoTh2yWT3i2s+7SCKZtJsa9iH9Lrmc3iuaMcKKsdIgHEolB0SRfr78LoyRlPJrSCdHCerQGcMTQuN/oSzDCdIt1Gi5iXklp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764244243; c=relaxed/simple;
	bh=9ZUCmtDToStFMSuYhRSrD5Sf1b3t890WzC4PBxLXOGo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e8P8aGK0CjB66Ojs5eboe1mjdurcCTkrXIVIS86TZ9DrPsFvVowJhVCokg4T9IOdGnVrU/9fQkfgkR//I00QFa603f+sOsh1YNxPXrsKJbsXk9Ant/7EQ/thfEWw8ySZzzCPs+WzO0Oz549QmQpEPxzziOCy5gAUS3KhMNP4n9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BiMmuNVg; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrV0BMBqn6xnJsZUDKl9QoxlVUeRoootwoqoaIReAqf0u5QFmkMs+mI2yes3SsDap3/mFykJa4QDozkrnuI6F367HaPERXJ1wqWd/+aoKPLmcfByfGYdnVh0VQ/OAnUTnh3+1g2d0LRQjALfsZ0TESVdFVsUqBQRgfK9pedRRarLvvAQUFETXqh/R2/DrgtkhXUbLPpYBf0ap3UbBIlJ1nIKe9B+ySx44TCPuZXBYotiAAUig0XGAmavyqfw1r6AYfz11NPKe/PsPSxChYyGQf+KHd4RfcpcJkdXQnNS4w2UDeWf4dI+ZWCoWFvXgn5SqlAoVtuEIF6TuzxNcfcu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AZp1rLs5seSVegKLowMLshHSnfNezy4QZBrTrVIxZA=;
 b=TD6UTRLH2uWaWFu6scOMdM6t4/6EkZxg4OpmaH41HZP8wLTgTNbOAkdIp//dLP0G7NqwOCObjKEsh4DGrpH9ZPmDEzZngyGnDEawyypdlcCx7ptA1IT8XUBaaHU8uIbwAGwIbSAW/PIdcmdJkp7UQDt9kaL0gDocywruRsCeomJGk2j+9QtGTX6SPVmaMq4es2fmicpkQ8+mWWVG3DNH7pC6tAnjPFPsPkaRQWujI1eCm53qfwboh+CeE+JymIdMV5jyf3YuXBjZ/CM4BFJ3Z7NJzW3u2hr2kweYUI+CdHTmUgk4xjjphC2NqxPmCIbqMNIlriPQE/Qa2MBhK4IIfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AZp1rLs5seSVegKLowMLshHSnfNezy4QZBrTrVIxZA=;
 b=BiMmuNVgVKoe9SseVFTO533jLBeufk4R91Z3/mnxraGz1TGKuhGcWjBkN+/uw1hMgyO/mClMmRk2xMxjKTJhcSG4fRgIdJE9/Sl7ZocnmJ2q3wTTnTspDQuvuLNGiL4pYBX193ftuzNOhD9AJIu5WB3i7uHHEmzNaail8xtA5ac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB9632.jpnprd01.prod.outlook.com (2603:1096:604:1d7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 11:50:37 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 11:50:37 +0000
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
	Guenter Roeck <linux@roeck-us.net>,
	Mark Brown <broonie@kernel.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 08/22] dt-bindings: phy: renesas,usb2-phy: Document USB VBUS regulator
Date: Thu, 27 Nov 2025 12:48:35 +0100
Message-ID: <40bb7feff08d6564dcccf50ff51bfcd3023b5ef6.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0187.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::17) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB9632:EE_
X-MS-Office365-Filtering-Correlation-Id: dcf96b83-c78a-437d-7e5b-08de2dab2e3b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VcxozgrwhZNpGjg6cxORIuJrvFdhG9kw9vo1tTjCedsj/oXKfl0zFQTsR0IK?=
 =?us-ascii?Q?Vgvisa80/88e2CJNThoJj7Gxm1mu0Y72uIOvK3hQ1KBkUfocTXKSGlzTBrm9?=
 =?us-ascii?Q?v7C9ixHz90NReilD8IUJjXM2vYJJASytqI5D0x3IwPvoVOS1G6YZrZafsBtc?=
 =?us-ascii?Q?8nF1oBcyCfHbqXD1w/SJqrpbX7GNGM5J7AvF4PaJYTSFBPrvje37mBXY7JZV?=
 =?us-ascii?Q?uickhcR6K820jkW8L3v9dHuA6kANLSbay9EtNVwFB0g5TA2FpCKoqQGpHrlF?=
 =?us-ascii?Q?Ofr8MUEInd5ZvVkZHjGO43rzq9XcACxt0N5muDOhjghp3FqZHxoi1vB24Gzc?=
 =?us-ascii?Q?uiTjhmejyUbJpX/vmjjtwfOCj0F1MajyqJ//EQ2apZy6QI/vgH5ASibW3bIf?=
 =?us-ascii?Q?+t9bPixdfnoRA2VXkoQdkbLBlbDi3fhAzb1zkK0ZGRYFRPBkZjwuJzYlRQZA?=
 =?us-ascii?Q?r+Um8DXEdcXvSvNHgvhQQOlue+ODIVirhU9eyGgaULqjLwWpEyjntDfHrb+s?=
 =?us-ascii?Q?6qmpILts5G9TqYjDPE2gQFbEQ0L9EUqNob3idgqWYfNUP19DQvDu3Oa1fVEw?=
 =?us-ascii?Q?JPb5/RMYJ3XXCANtEduKlZaI/Y3jvKKIwbJoBUkU4PsZnKxrrQbgw6PZb/DG?=
 =?us-ascii?Q?ruNMwSMP97k8Jv/XK/zMFJXktEYOgVwK1MEfDJQjyf65YkBX2CyCXisfUHhw?=
 =?us-ascii?Q?HnqjQHziSe728y2gDDkKyDaEAw7xoldhGwkMSxVA0jhhO1uX5hxwHVd1+g45?=
 =?us-ascii?Q?dGzYR3NDHj2pUruYspJ1j3fN3FE4a7fgPmn8Am9J3TxUnis+1+aU+obSicGG?=
 =?us-ascii?Q?qW0YH/GDHCXxwKfDu4wJHnCKs5eJindzxCcE4LJyDqOdQNcewEf4hbrDFaQG?=
 =?us-ascii?Q?EypzwAXpyJRmVxXaMJLqYK+wo7dQfNLSpAa7lx7/xNHBgVeYu/9YRQgFuWq8?=
 =?us-ascii?Q?hneoU/Jm9Nk/oy6iHqaQ6KmtktNnGlh49pHp2e7XaMaxwnN2txIyVy/+uufY?=
 =?us-ascii?Q?Vik/hXGRS/WRqwn6FYrry/glakcWH/X23/qXotdXYqxnTZbEcgv2tNiC9qRY?=
 =?us-ascii?Q?xutG7T0D6H9Me++gnqWeiIVKTOA4m3QwaHXdrjIbSgPWi4pnaWJ6dOTdLLHk?=
 =?us-ascii?Q?UnOLplGqlpi7IE2RXBGuUpKw3a8pcXMcEEXLyrS1LgptK+4x4BFOQwm+ymot?=
 =?us-ascii?Q?aG5jmknG9tFY0zjR+w/87MtkjQQNYXdnHGctMKMAiI8gZnSA7Wl8YKL5P6K6?=
 =?us-ascii?Q?sIovV2wmIJEhCyXzdTy39AaI3HMXzM15j2mgetnk+SnOuZm6nCJY+ukYUI0p?=
 =?us-ascii?Q?CMkf2GR1u4Z8/HJWPIFTB8iQEgaTV6N0kgtEIx6e7ONDhy3zOAT/PDno/zse?=
 =?us-ascii?Q?J2YII8IqaWG0YrVy6hnYITNBrre1pMQMboNgJZthNT1iYHeneFschQ4MozZ2?=
 =?us-ascii?Q?OMGbMUg8s55VedztM1993sPenOP+LhqvmeV2sSfJ3fga8sOe6dqH89JsypL7?=
 =?us-ascii?Q?nOPTpeQ9TVMpsj48LrFOJMoJh03kZYyjhYcc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dHsKcYCxh1s19dp1FEOACrXqrmX+JQOkM43gJOHwLdjOZZrWEVKDSPxIPa8Y?=
 =?us-ascii?Q?9mdkONaFWljXy+N/P8BHI0RcSPBVkuxMFbwW5fCFiJ6JK4WKKtbWF/st/Tuk?=
 =?us-ascii?Q?zhyVucAOPwiFtKR8qfUHSZCdBn4XGY7E02UDke5cVoqots56ayeB1RFpuC5K?=
 =?us-ascii?Q?7+5y4Ud8tCLTLgL1ASaY9i9AbaZ5a8JMnco2WZU1GWfK8GkhI4mri298hRz1?=
 =?us-ascii?Q?MMSr0uQLaXJiWtVl5XtzQX6IoUu1ob4bX20OAHQqMPTqZeCwi6uQ1sQIzrhF?=
 =?us-ascii?Q?0f+gbJHWO+lHGyjKwnhSYSZpbGke3CGmwIzI7FkPs7BWy/PY1c66jb+GG2z/?=
 =?us-ascii?Q?Y84OmGyQVhcALgNTN1PQRkVJJU/vnWuD+K3TrxoB/AoE+FzW+EXPyqw4A3Jw?=
 =?us-ascii?Q?ssMen+YXKNqvamgFmEO9JYm7ZuYbtQccYQI0Btepl9nH1cfwAMgSg3RydHD7?=
 =?us-ascii?Q?CRJ3sUUKNuAUwvPzuB52K+DIOmL+B8P681w+TlNp+9nLdSy+Z7NbAb6U3GRe?=
 =?us-ascii?Q?GMF3MEEYadGLJ++sUz+mZF9+4xgkoWCtBqngW0UAJnL8aKrzfUt5tQifKDu+?=
 =?us-ascii?Q?o7At2dotrZ8tXWNNDZR6p3SDIydWTzKTbAkq9Q8wAAOIf85e4D9pGhmHh1Sd?=
 =?us-ascii?Q?qOaBlVMJM1Hn6ngsc9jebLdl+rQuzCZdolua0aSEswpSGtA+w6MhF8ZhTtT7?=
 =?us-ascii?Q?59MrO5HsdXXPqDycZ0lLBzV18v/j5ZsnGF7i5jN5F08FQVJJdD2VynekOITt?=
 =?us-ascii?Q?yFPq7jqUb8+m/UAFp3iAGB89JXOCDpmxdYi7Xtg++vbbNpaAgfx9dOFp24jD?=
 =?us-ascii?Q?4tb3KoUE/3roIrHHSSHWejBmr9smKl1QrJhEgXnJmlyWyR3TOjhFzXoB0nCK?=
 =?us-ascii?Q?9n5vYZIR6lYqJsOqX/6v26QDKkKmKcIgew36yIJixucOQukZ2pKqaQpiq/0K?=
 =?us-ascii?Q?Cq7yK1Jmc8Sb273IkO6Z3PMGMnlWt2/5GxQbPFJ9H4Bki1xelsK67LDHnO3R?=
 =?us-ascii?Q?lfHVP5/Nn4X0r/Ieh6513On6ZogyWPm7V44lfzXOQAhxNU/+LM0BvIxD53Ee?=
 =?us-ascii?Q?p5+6Q0pozsWCUdszL+WLMp8IzvIIt7E5x8tmsBtfNCLfEasPtoNOLDzZcDXf?=
 =?us-ascii?Q?GVa5+AXzsnK26tJc5OeYNbhr8OCIJEmmRaeiRbknMXBy0m2EBJownrlZQvF5?=
 =?us-ascii?Q?V6TO/8D5xQy1Nz5Y+92VxmeAlWiesVABezKIdOdQ/ANMLXIS+U0/714kZB/u?=
 =?us-ascii?Q?dFoUq9W+fGY/nHG1Q8xsDzGYp3XKaDP5YcYIpDi1u0PyNKvpurOcqtNINXLI?=
 =?us-ascii?Q?wzVVKTgLIKNesojIUmzxIciQOSMVytrfG+j5M2TEI34DyESGrEBlaxPcAllA?=
 =?us-ascii?Q?p9X3xyYrdycTXPvutVnMCj4txCrm+ATRathLArOYVcyuBp6Mq0DUnK50A1NS?=
 =?us-ascii?Q?cNhOGckEeyEaNWar+3yGwV8pFTBY3U+QXVz5B8qov0FPrvEyteYwzfgYTxMG?=
 =?us-ascii?Q?j7Ddo6vhM5hZ9zfuPQJMtMzndgcFWFYBIWrnYeM5pyRMZ5Zv1E8YTR1fI4+a?=
 =?us-ascii?Q?4UrxWS2hRyUfadz+rJmLcau6OFzI4HFKUW7adN7kbGGTPzIzuydpvHcjYKQb?=
 =?us-ascii?Q?Ml9sZ3uSqmuHY6jPvXG4nF4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcf96b83-c78a-437d-7e5b-08de2dab2e3b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 11:50:37.5378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: of+BZx8lt04TJWzz5Dt/eTEhK8XCn3GHxK5GkIMigWAAxLMh//N6quIs+pxo3MovHxxmzpzcfbIyJVJOXyyPzubNPXcth6vdtFbYsta3rX6GfY/TnPnxRvMBQ/ZTbGNh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9632

Document the 'vbus-regulator' child node in the Renesas USB2 PHY binding
to describe the internal USB VBUS regulator.

Require this regulator node on OTG channels to accurately represent
hardware dependencies in the device tree.

Documenting this regulator allows device trees to model the VBUS power
requirements of these SoCs properly.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes

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


