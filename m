Return-Path: <linux-renesas-soc+bounces-26345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C82CFD31F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 11:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FA3F3001FC6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 10:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 074623002B6;
	Wed,  7 Jan 2026 10:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="E55kdt75"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FEC2FB99D;
	Wed,  7 Jan 2026 10:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767782087; cv=fail; b=CLkeNjQrEG3ZTivuJGKJ+VDETL8fKUec9UsJXWH4g+SJwJ8PGi6ibGSyZC/3wJGXeESdv6Qf9UoQgEk97mgerIz/lx6sQlPHTuk5oOF2VVUlBykksG7VIocoTVsfeuezaNMWwhnCb8WroOCgUUm+yJLSnEZLD3UODmDy1MqDtQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767782087; c=relaxed/simple;
	bh=ugrvEly0shYw4pciFT3hN+tMz8lbqRUyKuPC58+oH/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DOo+Qo1GdUT0jhUQEAFDGFRSgbq3NojDJ7zHHeViZifzTY1ghYQWxYTXFcUkTTjApdvoR0SNam307h9Cnmhd5daGpjRnUBAdOZeiX4s6dM3tGyMp2YvtuPyFVvgBacVrDSzptUDA9fk/y86v8dFn53b/usu0IpVPcHJYikuBaVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=E55kdt75; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sdeQbnz/NpYOmmtrx+PVj45wm9dQnHYu2SWNH0g/36696Cvb2LWnmBbQhqygqpQHoPYD0o++jzKZRXJ0UO0K/1gRK1BwS2Q6ZryJc3oazf3JT6t0OcJ72WEjMlZXOuxn/2LMjVw1JXWUWDaSRpP08o5egX390N7k/LJYfqevOiOdrKdwVFfaThuAQq9E/MCIVo1JjcksAJFDyeJE0smbz2l6ZRQvs43LGLoy8XK5+CtJk2rfVkrGWpTUIVJdDgYCZRqUq9UPGl48+pFMH4efDD16VT53/ZQMSTjxbldzQSBavCmP78PcrB7FHRI899Uc/hNffaF/3RGX7rctkhbk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OHjONmFspMsQsPX4ZjhyMZ4D9rpltT/AQOVBdjfzk/g=;
 b=A8q85uCnSvVuEqtfdSsLSaoKAEEkpL10UPuz3koFwP9H7z+xK5JuYwXXoXGUkecS+1t4/j/KWkfDoUU/KkU+2udnoAUI6rb6qtNQGf9hfxwv9sg4/DQ42N9zwxARWlw+EwNScreFhIByrfxGddUCqCYtkx3dTw1pijVYLVpQWwZbuYxtKM+TJyi0tFL7K24d64rV+PdKPCpAewPTbosddN8nu2JT84caWI6v6R/q0M1nZOAMo/VjUYWOcO2M94N18wlUXPKVV9UWXEgReHkXEYwRHTA2YZYVz48XWIFBBHo7xEsPXvd6wKZ+Tqjy7N/DPkNR2dlsBdbdZI7h2AWKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OHjONmFspMsQsPX4ZjhyMZ4D9rpltT/AQOVBdjfzk/g=;
 b=E55kdt752QhyiZQwrvu7W/ddv0rHSh+DedwRkvrT7DZzg1XH60dBJEfyqodg5ff0HguF+l+vDsR5VaivTQIlNWiN95bDl2/7lWQErqvGOq7nDfd8nl84FyUmm75+7g/8JAYDENr4dYO+ON0snL6auADQ5ftQlnZUBy2fkTg3H38=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13558.jpnprd01.prod.outlook.com (2603:1096:405:18c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Wed, 7 Jan
 2026 10:34:34 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 10:34:34 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] i3c: renesas: Factor out hardware initialization to separate function
Date: Wed,  7 Jan 2026 11:33:49 +0100
Message-ID: <795327270a6ceb23e15513a2619a19ae4876cfba.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1767781092.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0368.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::15) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13558:EE_
X-MS-Office365-Filtering-Correlation-Id: 19f2aee4-871b-4e98-82d3-08de4dd85999
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EbRcLHxuAIFmnG8GtQmkas43lMwa/2t2/zEvPcWe3QGrqNSD9dmgP3n8bJL6?=
 =?us-ascii?Q?GffdjwM0/R+iKrFlXQa3UldyTa2IWFxDI6gLH41lvBhNFLKR93x2z+HzLpk2?=
 =?us-ascii?Q?gRoQCXKv0TfQh3d1g2csmm4NhMOpcT6OofH4jtAkbd2T9s5fiYr1KVcjxQ/a?=
 =?us-ascii?Q?qBOjmiNa32xYEuwe+IzmqPiUvbBio13Uy4MVA7cC60PJoSZRYLEc2yHO3Sxe?=
 =?us-ascii?Q?20RqwHDXDT2Y6Gf9vSrGeqi1ARjGtdtYzYqGJfqq+xmQ+jpj6VLvEc0yrx+h?=
 =?us-ascii?Q?MCK+bAWah0CGpUiBvAxTpfWvDgizEBW/OLgD+ot3OmTZNrfig3bmTzOu5UjO?=
 =?us-ascii?Q?lAzl48RClddZOVTcyB0ixujbtMPpGGijKNUNp/CYY5dI7Zn1l3s9YowDq6Fk?=
 =?us-ascii?Q?DFfbgU6MkWjrhNckHxzbbJDzGNUT2Ck9KCAm8GFDAjNUW7GPhynyHfehrkuI?=
 =?us-ascii?Q?FkYMojThTdlKJKS6VlFTF9m6hKTewgDPloeqG1A8hCSospdTUujnfS6YEbyP?=
 =?us-ascii?Q?cWZ3fn9hRB/NrY8o/fWx4VC+hKSvcTlEEW5CpZX97RDdUmjOA0kYFBjMbYyr?=
 =?us-ascii?Q?KhUVqOHkzi9PJZYZnGTglKDTSfA3j8JOmnpQ5dUmTPW0+PsIBNnx7aHd4Fm2?=
 =?us-ascii?Q?/22YFuIybDnr3K4AmS3HkY9P3BFrUNSR065/+gW2Y3SOoe/J6JaLfAHg0pXk?=
 =?us-ascii?Q?tvnHjl2nx80HVbuqsjRvIMbTWFdsEDYpJvCiu8Wecjny/aBfMuWChjbClHD0?=
 =?us-ascii?Q?vPVunOdrji5kQSMjAxDBW+8N6izj+JU1f2jvGBb3k0Z22xC8F5BIP4zvLRla?=
 =?us-ascii?Q?JEoSp8kIBZj81x4ijCNxIT66Qk/1Y9Ugev13AjnXVnJBoaG8Y+NZEP4wDdvf?=
 =?us-ascii?Q?ke4ym9x4QsQqw93/NDa7CBoQADWgaLQLnpy6ueJfNVQZkYzHz1WBZQljknAr?=
 =?us-ascii?Q?Y3j/LmpvLGrZk5o1Jhj7QfD9DB0WxWhVW0xOpgprIVuZqOMxuLsxJrsB6sc6?=
 =?us-ascii?Q?2MawZnbHxsudNpnGitNB4TKI4C7ppYc2t2+zLofWijgmSMfXqbHLVqVKAP/E?=
 =?us-ascii?Q?XMdGGKYFo/XGRrWP6ao71ctT0kwzT1riJ6pf6njNAyu1OURWspnBMjgKFsyr?=
 =?us-ascii?Q?qdZhnaoXx0LfgTjZR8o0ExNWnKxqJ7bb81b9tDAaN1sd3/wbCm6KWcOMxI0A?=
 =?us-ascii?Q?pypX1V2oU/Vx7DZah9p0rWIeUIBR9vWwo06/nMviGJUqbJMG2altJKZ7tdNe?=
 =?us-ascii?Q?L45qNKu5jySEYZ/vsqkhTpxcElpI+71WkukROK6Y0So8SZ7Gj8m0apgYAdzr?=
 =?us-ascii?Q?EDPCCGIZ2X8EZ+rRgnn8oScnvb2V8kPfCM+ucia1NEBvLvQc7UAmuVSWRJ8k?=
 =?us-ascii?Q?ClUK/5ZWLNgQ5HT4NBws2s1uGhR1mJ23K1naa7m9/qwvbQfm5kao8O+FdS5B?=
 =?us-ascii?Q?Kx8x9n0Q6OGd1WXPCHxPYEpSBbvC56RXnQn3+E2RqAWFRoJvODBtjfKOTAVn?=
 =?us-ascii?Q?0flOMrU+OakBNvwPOb0ppAvbt2F7g41mXjQg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NmOgQ+pVXPQZTk4TxRtM8S6iQAsLA3Et588QRLe8mNhfPsvUzpfljuZ7D3lw?=
 =?us-ascii?Q?LRmLcuZGDbZX4TwlsQ5JzJyxPcdbLzi5tW2kzOS1105J9Fe0UDLrILhvdoYV?=
 =?us-ascii?Q?o6WymGiBurOZIU/8M6HY7AE3/Y6ryQWpqdg83uu/D9PQ4hx1EDzYyZaGMDUv?=
 =?us-ascii?Q?72EQZovnr+fAUMGufMossYlIQhLnaNRRixkH3Q4TxwRBJw+VHnPwDLVSKmQi?=
 =?us-ascii?Q?BEV6MPiAMC8AzLG3GtqC3FsDEzwaiu/XfzPT1YimK7cPna7smJfJzu+2jdyr?=
 =?us-ascii?Q?f3NCUAI7AqMF9j8oLv8FZRh1iE2o8bolZUw04EbBtg/8fQdO2rjBJEatbEoG?=
 =?us-ascii?Q?Yh+EXi8TpacbrgMHTfN7gRWJJdKL8iaMFqigD1yZn6nWl7JVNS6sxPo+WExk?=
 =?us-ascii?Q?RjI8LMfU90/WV2WgeYO4XLDFunHVnCsC+fMgqibe1rybUFs0msQJ9Lqoa3Fv?=
 =?us-ascii?Q?PVTDfCylx7JPiPhKSYzShF+7msQewiVqoeqFO+WCyQF1vpym5r0hneIHv8i9?=
 =?us-ascii?Q?eBDcMJlnybwye7ypq88jXMHVQ/nE54CbeS3UJ50diTTzwTcm3/97fxbpObvm?=
 =?us-ascii?Q?xfQKCUOxte7/5TEYyqEjoZXT3K/k8C+c06GKkeHRQBMO9es+wzH/o+HLQ43P?=
 =?us-ascii?Q?2R66la8/ElFWa+HDGEZjGxH3xK46Nfi1i/9Y3ZYdzBga6mu2kNZ7gKXjDWyT?=
 =?us-ascii?Q?0jkvhGAu/RCqwK/dkRBgwjOVzLBhkk4Fx8XQbuHi8L76YJL8xKYblkQZ5Go6?=
 =?us-ascii?Q?DyffrJ73HkninnOnNMMV7yx90CDarsR2zI/E7YBKbgHRNj1zYp+37JDvGQGt?=
 =?us-ascii?Q?SeV9074CX67lFwECCLoCuulrFnJB/zlxutgs2FG08dhd+dVSGP7idjBg+3b8?=
 =?us-ascii?Q?VuUr2xfZud6RzBdROOMu/DGtlm6+yobA4/nL2h2GddBRie75Vdb0HkIpcd/B?=
 =?us-ascii?Q?uodiThKQWmkwHxAoaTZj/rfZ8tvOtsbbtSPza2b+686fT4i6JqFkvKP7UjSL?=
 =?us-ascii?Q?ROipJHndSpthM0zw0i6GB0n0YEuyBTdn4bHAp9rZl71ApCY/0mZ//Rjd7Nbe?=
 =?us-ascii?Q?5sdYcbYlYU7hNHPWmcfRyABYAVwF3rcOlQmXB/F5HxLXKZJrazbAiISEo9+s?=
 =?us-ascii?Q?+03s/7UeVueNXZ77ZHoA+M+u9NKOLM/p9vpbr0hxsLGkJQM9xW4kJGKoevt7?=
 =?us-ascii?Q?qfDKc6trwbVAg/Y4fZEoIHcEcqde5k5kxPQNwvkML3akdj8RSgnZQdmqY00/?=
 =?us-ascii?Q?xvx7vaifQzkTJK+fTyenfjKECkuWASreGbt3Vs4JpaovCPNZjAnkcyI0QLZF?=
 =?us-ascii?Q?BeL4mOlFqHMC7x57yR6OZAMjfCbDT4QOa6pOxITXi9nMaV3js5BC4JdoViic?=
 =?us-ascii?Q?Gn0ioeX5rH8HWtWsmGlt29qXw+SfR6IHfxjdeuXVO7xymYGNZa9b9JnaXUHs?=
 =?us-ascii?Q?6orAUeRAAT5dQG0mRx3kOFLH6lieiVVw0jtxn1bZyJ6wKeGduNJCSJfyD0cY?=
 =?us-ascii?Q?x3spO8McXVE/eYMBGDoM+7sMrzedzBN2wDmGC9241AaqIiJoxhEg7C+fMdpo?=
 =?us-ascii?Q?6VUCNra317Bm5UsjOkS/lt6eRFoj8jqAob3Ju1m6pX8dzWzkp1Zkazf+K64q?=
 =?us-ascii?Q?TTHIgjlxji5SVpJAl6JvSyI/mjIgqaDelMK6bgNDMZRLnW4yYOfm+RlFQsX+?=
 =?us-ascii?Q?6z09rY7SbgSZWlivS1Y1rGaYZo2zdL7R92Z3zEiZlSGMP6bab2o9xgCJ41Rt?=
 =?us-ascii?Q?d4HvTAMV2ekE82k8Ak8dgK/EFAj8Ua6cCJ1TEbHa/5gLVS+GzciC?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19f2aee4-871b-4e98-82d3-08de4dd85999
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 10:34:34.6685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vuXDx9Bmdar/VWUVwbjMH2Ng+wAcVE5hFSyp+1aAY3q3LE2aPYWpojf92+nyQAoLUJITuQR1cP8Gevgf2xKZvoy4c8sYpiHxxBpDq4vfmdXJX61mbnDR6ANYeVFKwAMY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13558

Move the hardware initialization sequence in renesas_i3c_bus_init()
into a dedicated renesas_i3c_hw_init() helper.

Simplify the code and prepare the driver for upcoming suspend/resume
support.

No functional change intended.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - Collected FLi tag.
 - Improved commit body.

v1->v2:
 - New patch

 drivers/i3c/master/renesas-i3c.c | 99 ++++++++++++++++++--------------
 1 file changed, 55 insertions(+), 44 deletions(-)

diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index c1ab4edb3ab3..008b6ee60e26 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -479,13 +479,65 @@ static int renesas_i3c_reset(struct renesas_i3c *i3c)
 				 0, 1000, false, i3c->regs, RSTCTL);
 }
 
+static void renesas_i3c_hw_init(struct renesas_i3c *i3c)
+{
+	u32 val;
+
+	/* Disable Slave Mode */
+	renesas_writel(i3c->regs, SVCTL, 0);
+
+	/* Initialize Queue/Buffer threshold */
+	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
+		       NQTHCTL_CMDQTH(1));
+
+	/* The only supported configuration is two entries*/
+	renesas_writel(i3c->regs, NTBTHCTL0, 0);
+	/* Interrupt when there is one entry in the queue */
+	renesas_writel(i3c->regs, NRQTHCTL, 0);
+
+	/* Enable all Bus/Transfer Status Flags */
+	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
+	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
+
+	/* Interrupt enable settings */
+	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
+	renesas_writel(i3c->regs, NTIE, 0);
+
+	/* Clear Status register */
+	renesas_writel(i3c->regs, NTST, 0);
+	renesas_writel(i3c->regs, INST, 0);
+	renesas_writel(i3c->regs, BST, 0);
+
+	/* Hot-Join Acknowlege setting. */
+	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
+
+	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
+		       IBINCTL_NRSIRCTL);
+
+	renesas_writel(i3c->regs, SCSTLCTL, 0);
+	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
+
+	/* Bus condition timing */
+	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
+
+	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
+
+	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS,
+			   NSEC_PER_SEC / i3c->rate);
+	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
+}
+
 static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 {
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
 	struct i3c_bus *bus = i3c_master_get_bus(m);
 	struct i3c_device_info info = {};
 	struct i2c_timings t;
-	u32 double_SBR, val;
+	u32 double_SBR;
 	int cks, pp_high_ticks, pp_low_ticks, i3c_total_ticks;
 	int od_high_ticks, od_low_ticks, i2c_total_ticks;
 	int ret;
@@ -558,49 +610,8 @@ static int renesas_i3c_bus_init(struct i3c_master_controller *m)
 
 	renesas_writel(i3c->regs, REFCKCTL, REFCKCTL_IREFCKS(cks));
 
-	/* Disable Slave Mode */
-	renesas_writel(i3c->regs, SVCTL, 0);
-
-	/* Initialize Queue/Buffer threshold */
-	renesas_writel(i3c->regs, NQTHCTL, NQTHCTL_IBIDSSZ(6) |
-					     NQTHCTL_CMDQTH(1));
-
-	/* The only supported configuration is two entries*/
-	renesas_writel(i3c->regs, NTBTHCTL0, 0);
-	/* Interrupt when there is one entry in the queue */
-	renesas_writel(i3c->regs, NRQTHCTL, 0);
-
-	/* Enable all Bus/Transfer Status Flags */
-	renesas_writel(i3c->regs, BSTE, BSTE_ALL_FLAG);
-	renesas_writel(i3c->regs, NTSTE, NTSTE_ALL_FLAG);
-
-	/* Interrupt enable settings */
-	renesas_writel(i3c->regs, BIE, BIE_NACKDIE | BIE_TENDIE);
-	renesas_writel(i3c->regs, NTIE, 0);
-
-	/* Clear Status register */
-	renesas_writel(i3c->regs, NTST, 0);
-	renesas_writel(i3c->regs, INST, 0);
-	renesas_writel(i3c->regs, BST, 0);
-
-	/* Hot-Join Acknowlege setting. */
-	renesas_set_bit(i3c->regs, BCTL, BCTL_HJACKCTL);
-
-	renesas_writel(i3c->regs, IBINCTL, IBINCTL_NRHJCTL | IBINCTL_NRMRCTL |
-					     IBINCTL_NRSIRCTL);
-
-	renesas_writel(i3c->regs, SCSTLCTL, 0);
-	renesas_set_bit(i3c->regs, SCSTRCTL, SCSTRCTL_ACKTWE);
-
-	/* Bus condition timing */
-	val = DIV_ROUND_UP(I3C_BUS_TBUF_MIXED_FM_MIN_NS, NSEC_PER_SEC / i3c->rate);
-	renesas_writel(i3c->regs, BFRECDT, BFRECDT_FRECYC(val));
-
-	val = DIV_ROUND_UP(I3C_BUS_TAVAL_MIN_NS, NSEC_PER_SEC / i3c->rate);
-	renesas_writel(i3c->regs, BAVLCDT, BAVLCDT_AVLCYC(val));
-
-	val = DIV_ROUND_UP(I3C_BUS_TIDLE_MIN_NS, NSEC_PER_SEC / i3c->rate);
-	renesas_writel(i3c->regs, BIDLCDT, BIDLCDT_IDLCYC(val));
+	/* I3C hw init*/
+	renesas_i3c_hw_init(i3c);
 
 	ret = i3c_master_get_free_addr(m, 0);
 	if (ret < 0)
-- 
2.43.0


