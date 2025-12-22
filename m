Return-Path: <linux-renesas-soc+bounces-25998-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4459BCD6411
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:54:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CF9330AF59E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376FD331A4D;
	Mon, 22 Dec 2025 13:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CEGVau2O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011044.outbound.protection.outlook.com [52.101.125.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C59F331230;
	Mon, 22 Dec 2025 13:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766411144; cv=fail; b=bII6vcysK0IrrDYzlDkjHpdQMgQui4DHiQOpTNwC15D060yLZF3b3pK0YBrWStHYfAp9TDAaqDJR1Q8mS3SBtrXsOoAa3lwkdB0sTs3jlRDeSuKoPArHKH/bIz8qaor/UuJi/fQaCJyR7f1SVamsTGMp+QfegMsYbLbNkO4+TSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766411144; c=relaxed/simple;
	bh=Ec9UWwkg13KKBZf9AlCZek/BRhqRhWxgqNFmBDEuaFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LFL30UYVHIiDceUHFBvlAm9/b2vU2DXJLzO9KXesehxRSxyelHI5eO277NveFh0fbUqTZ8ZcdNcgtQP5oyTkME9W+ycU2dZSvFO9QghJfRzcBElQF4+gZu2L4+z+eOiytGedOCl6HSEswvTKRiXywEEdJ5FDPO4klNnu3tZZie8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CEGVau2O; arc=fail smtp.client-ip=52.101.125.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VL3qECx9o2vLde93Y9RKAYpAaNrI3GFdhOc9G0mQ4F2DOOann6aBB0z7lcT6IiR6HHxPDIBs7pJkPOylz3BTIU0Z3oSlxPQl5+fnFnRTuFkUEYXSqBYzlaUnefajCKbyXa9BsKae1aXgd51diRcRXJwVcMBWErEVKjKDqfPDCAFb5FGbsLg+a0iE36tpBMALF0NRVGbOMez3s9crL/JZgMNqAMhLNPGYygfkepYFucp3owvcKqSRzknV1KAlm7NKaBozk/djfT+BKurtlDtkKcoNdyqQhjOGbOWXd8Tkrw4sZ9aQkt+oTJzqYkqR50O1qnvWa/3Kcy2vV7fv+k99Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sud3Czv69y4Xk23HVit1xXdSDQ5oRDs4f+aFQKS0J8=;
 b=TkclX9bPFFXRVD93BlPSqO2Gj6jVhnO0YI/wQTB2vcmM88qYfG9+nh14n1mJ2iPJP1TGTD2IRellgV816CJSxFpDOyxLrx/uFZ20CLSYP/N7Nvae018MWVDlS+xvZ+iO2i3YndOh2OggB2v82mc/CTawricu89Mjc4ardMIHTfJkwq89fvbIzkLhTi57A/4nsZ8rCEeuGz/rzVUWOeK88wuhEMajGzgYsFqcGNx9wHhsbwBfP4nwgAPzimXZh7IPE6+njzCGE4lJndfePQoI385fl+91hOu2wA1dnvLXfDY7y4rHrYgdUyk+W6mA+gmwowOblB5F3l5/zBmMWkg/Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sud3Czv69y4Xk23HVit1xXdSDQ5oRDs4f+aFQKS0J8=;
 b=CEGVau2O9B3ZBFuQV1hO3wtMHp/aSHbbBneqvSK8qBclv+vrBD8V5KaFnzZaI4RyXu6YG3XRHc8njyDfuqN/TPfiIATnuqw8M3rKq1ViJfjFjbpeG0MGh8Saj5ReAuuC1QvArquZp0RJ7jp8LG6zWHkObdSerrE7WmS8QTqGp0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OS9PR01MB14304.jpnprd01.prod.outlook.com (2603:1096:604:362::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 13:45:39 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 13:45:39 +0000
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
Subject: [PATCH v6 10/14] phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
Date: Mon, 22 Dec 2025 14:43:44 +0100
Message-ID: <2d94c9876b965bdf7cd74cdbbc0c54689e122798.1766405010.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 087b70a2-2fbe-4339-0de8-08de41606434
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hzEKz4Nr3attszfdLBu0SB6/16A1rhcD80XU7ZsPjThynlBdaa3ormx/wk1O?=
 =?us-ascii?Q?klaAoJO0/a+c/IHXhsrwTlxz0WNmlYfwivm1nDpSVTbhXc7gsgvEpm5g5htg?=
 =?us-ascii?Q?H9VLrdGLHYhn3E6XS/OqfoXQOJlKZGJQhqDmu/0/9Oayr0X9TprAcFAIYsIG?=
 =?us-ascii?Q?SjCmNfT1orQZNChvyBlbP/b5pm0wUJiluqC31iUKvMX+CuWllXNEL0lXY9Qn?=
 =?us-ascii?Q?wuuEihZn7deDkLb4nl9njWUDlz8jAKPtd/ehQ+Ca6aLcd5T388UsmMB4wBkv?=
 =?us-ascii?Q?ovjrHSt8p9h9qnr7F0RZ+Wc+dIZEWVDS3ljl7p/wYW4klfAM3l2m8CMZM4qw?=
 =?us-ascii?Q?xE4uZgojuck2HmFrOxlp6a/yPO9s/Mm+YUm6AH60iExayfEdkmorRtz3ZNyi?=
 =?us-ascii?Q?Lc7iiLzkgUbSq8hVPOTDoLF8w0QSD472fVier7zhz1uVtfYs3gBsSXI4HE/J?=
 =?us-ascii?Q?5+T1nd5dyJA5jGVgSmZ38g2MijIaS+4FiNe9ESiSCsb/Dvt92fcNaCGT2TuK?=
 =?us-ascii?Q?/EWwaoXfzCFv+k6116dRGoiF5x7Y3DpUz4GmJWSBOiBgRUTnBLEA64liNUXm?=
 =?us-ascii?Q?yhuoG2Lc38y8ELVfZTswv7XR8hDsIy3OnyqlsEgnLxqO9UEWhrcqsnUfNn+P?=
 =?us-ascii?Q?5iFZcUOkSIBqbFv1y3SNDpnM//r1dZM8HHDOuwMKuxeu3R72yvMNrpnwDkXL?=
 =?us-ascii?Q?w4NPvViQlV5AYMZES+7rcFdnvHu/PJbp2zXQCWwvqVT0BBHQI12ZlZstR1BA?=
 =?us-ascii?Q?BC37V6OcHktC0bmzsGSYnpsYmwEi6PWceOTnvZu43kxjh2VeSWPE65bj8yP3?=
 =?us-ascii?Q?fHDqaqA+Aaw8dUWpKDdZTWKC6jpiXaxzRd+8tdZHUdljckG4JaAxWSLaR7YM?=
 =?us-ascii?Q?wNnY3eDNmtIu/UhVwMCg0bk0AnCUzn4sUC7QeV0koySNeoIGSHNkKmJ4ofUi?=
 =?us-ascii?Q?LATHIsxSSlQdklNFPqULyAr5+9Ze7sgrnJVBMyOM0P0AmC4RBb8OT/JFckRZ?=
 =?us-ascii?Q?6OrWD+aZxk+lyrXDX9Ifs9Go2T1SFpnUEJYDQYBtikPMyFDYBoAaCQOkhbKE?=
 =?us-ascii?Q?vVYiypCQPX2MpFZVc6i8+HkuEiAAY1m7fMmxG4eU43TMEBF2gC04r6TYTWVv?=
 =?us-ascii?Q?O7XzIBv0PReorJqy2ZU9BBHY8X7hUYkEEzCM/BdsKTkf6ZkpsvKweseDyVbi?=
 =?us-ascii?Q?vRAcfkJvoA4KRl1DLrlGTecUv5iqe0VvgFJ53MoYi2gU1hp+7zma2JqWaLcg?=
 =?us-ascii?Q?s3w4qNfxCtr7vxHs3te0na80Etj0sc0wLBq8KDJOnrpkvGR4ckx0ny4VPj1b?=
 =?us-ascii?Q?f2YLRK0Jb5rFUNlZREsML4M1EwRFXUra6wDgvdbVXVC/0MQ3220Q9QgSpgIL?=
 =?us-ascii?Q?M05FspTe/JY+FlV24EuX8qMgTzZ6x29G3lB4zQksYU/lHgMgDYhSEC9UQ6vB?=
 =?us-ascii?Q?YRqSgsuq27eeqwSvll/7KK2MRsSt6hNa0wQTQeDMrfspgLRZJNT/WGrNZixC?=
 =?us-ascii?Q?7+6qZwH/o/pHhotkKgrKVlSUn9+joeddE7Wx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3CxsO68JsJitRdaKJL/rIF6BdKoxm7Wk3YCExBpwH1ifaxh15xpQvhDdENiX?=
 =?us-ascii?Q?kOyPwk3BSO+2LpsdaZshLyMJjwxbBwrBmnfkX17VBsdYEvVcanoB9P5rMGAs?=
 =?us-ascii?Q?XRcDoy7b+pIeZX1u6W2vz1Z1k643436zti78AMhSMApFHgq9bKfeJu93PyQy?=
 =?us-ascii?Q?bfI5Jrc59RMnvVF7nMqJQwiNvf/BTZwnXhSHfGDy3dPoiVad5fXk8EFdbuf/?=
 =?us-ascii?Q?1YND7h9ykZC6h8NB78RiSzgyIQU8rF5EhY/+marUsbw/XQoktjXWEbYEaIk2?=
 =?us-ascii?Q?GLijFFitGDvX9iKGp/AutgcNyWXqdRut/t20HdxQa4jYEaL8Gzpz41Y6jECy?=
 =?us-ascii?Q?8N+CsVSxd6UHZIkoxmnAHUXo4BcTGMSVuDcardmrJquqG0OyQe76L/L6pOgV?=
 =?us-ascii?Q?xkMWpc8OATuUL7PVan5rMY6lXt23q3pFFpkoByjTiupHJuVfItCjXxhg+4Ht?=
 =?us-ascii?Q?FufkK9/Q29/CRVZPKLJdzZAKvdKl0+jYfZvrMDVZ3hBdS24mAT/SM+mfLryP?=
 =?us-ascii?Q?7MNED7+6VsiHHzLTy/cGRmE+bvdCsEWCqGUyVqfF7GKjdrNWMX6VYJ8tCTIS?=
 =?us-ascii?Q?TseUYPxmI47UJHo9+qS2lhk1PfAWbOSef6lXpuNVg0AjZ8J4azKK6ny0OUvK?=
 =?us-ascii?Q?cMFO/lSgtH3FdOeoKD68nbkQZxvzanRhCTKdSvFTPZLjdaGg0PNrDwk2wI6C?=
 =?us-ascii?Q?Okqyp3dCYbvG9gFVnUuV/U2M6LMRzZVFWsQeDHmmC8ANq0NhQx0aChKssCMy?=
 =?us-ascii?Q?uwMhBPdmVisYi2T2xCouZq9OXlzk7O10YRVxtUAGp7xidcdwsPigiy5ngFbj?=
 =?us-ascii?Q?LWxAFFW/BohN57cW5o7N/AbNLp1TB1mMi51BxklOsxI2JRUCMZOM9XPFfsmw?=
 =?us-ascii?Q?FbtMFEmtp8uxDSzmGWKy9KxYgiXejU4YJgTjx/H52a9p7tB0kQ/ZavWoeVNM?=
 =?us-ascii?Q?AIRHP7/Z+sdqBhkYV0QgkWSOyGtVcsAZS/lIlaiqDNbF5NWzgeb1AhPENDGP?=
 =?us-ascii?Q?jpfRFkdhnVkFwi3gPhDn8mpnYmSqtm2plBhlThVIlMUfesD1s7E2ADk5eGu4?=
 =?us-ascii?Q?dy1BKuCD3jW8vBCiJVN4j2NRUAhUB4ubdF00Xm5d9VTerFVwZaiWgMr7sJo3?=
 =?us-ascii?Q?K557Etz6LUtAToxH/wMRoKTGF7TjS+zmlLe/tEH5yGFYyqmOg8+naSND8e+3?=
 =?us-ascii?Q?fkFicXmRkEtVL/n3xyyzV4w5GYb+ccnBgTdEc4wEznyd28sEBJP4SuBY9kC7?=
 =?us-ascii?Q?x4gglKgtNqLs+0RGD5uxrlaJ5UoDsOm03QXxrTp4MRbIXqVWDtB164IDWj2O?=
 =?us-ascii?Q?CKgMwXxmMVwDe5kAmyik6rTiKOcGoTLV7bi1yhspSbbUd1NajRqn+TQUF8Kw?=
 =?us-ascii?Q?G17sJdctkXt4Sa7fOfhAg1eeZEiMPMtvdEZQV0iyb430e2BdHosO5xY1ayNl?=
 =?us-ascii?Q?ogKGIn303yUWwNYyx1VtRwimgpkvPZL8rtPS+EwHovNbBmaMzBJvQbye188Q?=
 =?us-ascii?Q?/jeMCM0UOaIa4R64EmhlCMM/Y5AOD9W4FldU6RSu8p0FnDfwp4K3qpZSRiy/?=
 =?us-ascii?Q?gAY/osIcnkhSJutPwDtdsSsdY458Yr+hkQGmAtKQ0giKRZIIXHo5zOaQRwCA?=
 =?us-ascii?Q?O4oRDMOGY1/iVAYHJ/f7bZoMhruOmTx0xLQ1DozkQBfOV7vqo14zfVjmuMM2?=
 =?us-ascii?Q?lrrAvYiORutBtGnV5g3M+hxMZvGJAtNrreon+VeNViSuEza8jChdg7V/s4nD?=
 =?us-ascii?Q?IwqYqqFAgzwHqumKN1Yg6iS2yH7p4CMA9tRkk9s4E6jDQpxZqOmU?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087b70a2-2fbe-4339-0de8-08de41606434
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 13:45:39.0307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4oS5qA06fcDHz50GggMIBk09OCO3QlEEx1pAPoa4nE4kFK8wS6TX0HVXvG4dKKO23FBSzdptNRLj2Wlqfn5ESg7ucRoaF6q6TKZPYUPe4G3twgwcjy2xQeKjgmX92Itf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14304

Refactor the VBUS control logic into a new helper function to improve
code clarity and reduce duplication. This makes it easier to handle
different VBUS control register cases and aids future maintenance.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v5->v6:
 - No changes

v4->v5:
 - No changes

v3->v4:
 - No changes

v2->v3:
 - No changes

v1->v2:
 - No changes

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 34 +++++++++++++++---------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 582de10d5beb..4c7a46f1f16b 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -204,28 +204,38 @@ static void rcar_gen3_set_linectrl(struct rcar_gen3_chan *ch, int dp, int dm)
 	writel(val, usb2_base + USB2_LINECTRL1);
 }
 
-static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
+static void rcar_gen3_phy_usb2_set_vbus(struct rcar_gen3_chan *ch,
+					u32 vbus_ctrl_reg,
+					u32 vbus_ctrl_val,
+					bool enable)
 {
 	void __iomem *usb2_base = ch->base;
-	u32 vbus_ctrl_reg = USB2_ADPCTRL;
-	u32 vbus_ctrl_val = USB2_ADPCTRL_DRVVBUS;
 	u32 val;
 
+	val = readl(usb2_base + vbus_ctrl_reg);
+	if (enable)
+		val |= vbus_ctrl_val;
+	else
+		val &= ~vbus_ctrl_val;
+	writel(val, usb2_base + vbus_ctrl_reg);
+
+	dev_vdbg(ch->dev, "%s: reg=0x%08x, val=%08x, enable=%d\n",
+		 __func__, vbus_ctrl_reg, val, enable);
+}
+
+static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
+{
 	if (ch->phy_data->no_adp_ctrl || ch->phy_data->vblvl_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
 
-		vbus_ctrl_reg = USB2_VBCTRL;
-		vbus_ctrl_val = USB2_VBCTRL_VBOUT;
+		rcar_gen3_phy_usb2_set_vbus(ch, USB2_VBCTRL,
+					    USB2_VBCTRL_VBOUT, vbus);
+		return;
 	}
 
-	val = readl(usb2_base + vbus_ctrl_reg);
-	if (vbus)
-		val |= vbus_ctrl_val;
-	else
-		val &= ~vbus_ctrl_val;
-	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
-	writel(val, usb2_base + vbus_ctrl_reg);
+	rcar_gen3_phy_usb2_set_vbus(ch, USB2_ADPCTRL,
+				    USB2_ADPCTRL_DRVVBUS, vbus);
 }
 
 static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
-- 
2.43.0


