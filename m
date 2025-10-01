Return-Path: <linux-renesas-soc+bounces-22538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C675BB1CF0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08E291C337F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BD1311C2D;
	Wed,  1 Oct 2025 21:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="qBGvep8U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011059.outbound.protection.outlook.com [40.107.74.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEFC311C1E;
	Wed,  1 Oct 2025 21:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354082; cv=fail; b=R2eFk8eSlxj08/JeAGU0od/fQkVrkSckTgYl4JEB09gx+9ExX1eX4AyIqSFrvfRG+/3tFrUI/AXO3QcfVzFNKMbPHtlPstPAxhPlqTWhrBimNMgRLR23tFPpVJMWsnmrU2XaGGl3YhA5dbk5XAqHCVDzavMO1zqJrGU/DgNwTX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354082; c=relaxed/simple;
	bh=s92+XjxOUrTpcSdBCL2xoFWb8PF3mzs3ZhBgDXRA1sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XOEnhXpZCCA4/Zmq/Wv3eXeU+3F4rOS3KmbBePpU3u0tNOmxDdxPe/MUreM9oCP1K8rRBzVJ4ZqmHzCsBgEcOUK4d/wmzmeX1Kqi2SGZvm+CvrhyTd/et6zB8wyeaGIS6+tDYZTr/4IY3Y1qHRRNDdhHbMI4uC+koEGsQzFsOUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=qBGvep8U; arc=fail smtp.client-ip=40.107.74.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/oe5eXMPGyR4kQcIN61KC9zvL5TXkWeg5aXGZGYRUTnnD4F0RXPEABD8hBn8jrhHLdwiC8ApjmzAcQo0Y6aZs3X5eURh3POazq0RHxXQZy4AWNfDgmQ9ogVL5cM1tYNyotmz4gbAuHrueVwFPIPKf9M3kBnvZHCZJBUxxumEzziaRqpY08AJC6k8MhAjssmlNYeOQa1aO6lK/Z2FnBCDhWzo2UgpWjbL9KJa3v8izj3iloAWK6w0hqWesFW5bh3yFTF23m0G1D0m+F/dMyxIhDvAbqK3PYrjHm1EpAz1OCvh5pgH3Mkcw8b9HdTLcVy0VGRYc3w7u8CWfGMqAqbCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ewehQeKbgA8OA5J0YG82M3MEjSKGoSItw6i7C8MFPk=;
 b=uA22jfvphxbZ0dtp2MlZ2RieO+Fw7rxSRwooblVr2Xabr3HZiB1oLaaPB7y9izQBKAfZ/tePMwWAn9ZpcPqYbXWl/9Tm3JmEoaNN7BeDiY9J4dLX5k44aZ9NMZLfb1u3Fq4gqXPIOINiVq4fPZ2dykVld5M8/q9jUgdZ8fMtvrekGOa7UrZzVXD6/ElQiO1jHPotvX8GTY2hDOpY5HlQOIsa34Ke/o1WFt9fELfd29PvIDaK3X6aEaz+Ky0R9VZQAN1SUI6/ytWF1QOxPgA1KqRPZyBOU+0Wvl/qpP6AZLV3otA5kDeoTpKAPHWWtVxcOqnx0M/5oIf8uLeZfbxaVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ewehQeKbgA8OA5J0YG82M3MEjSKGoSItw6i7C8MFPk=;
 b=qBGvep8UVtX0tDyGlrXTqaUDgqqbA+O6Br8Cekftun2Mb6j8dGa8ILeYQZtqIN75yE9XHthOwQfzjc6sj3xbivM1FYLU6eB9F/v1xiytDzVPMMZkV9Hej4rHqomantl6WSmulp1bauscedbAdWw+3UlPTYG92BLqXtGCjpQqfL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYWPR01MB8332.jpnprd01.prod.outlook.com (2603:1096:400:161::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 21:27:57 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:27:56 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/18] phy: renesas: rcar-gen3-usb2: Factor out VBUS control logic
Date: Wed,  1 Oct 2025 23:26:46 +0200
Message-ID: <20251001212709.579080-3-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYWPR01MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 72aa9380-5fcf-4a74-7dc2-08de0131635f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zQAwK777NZZOpIXiKVMAXcYRP8fsHD79Nh4NZRTv1AMAyo/ZX+Ac9zD+lPb5?=
 =?us-ascii?Q?l+h2S5n8OsBZrJDdjIqWlZ1Q8dBgWoDeSC6p3K7lAE7HIPo8B5F4ummHWLhC?=
 =?us-ascii?Q?e/VntjxrNq0HBpzDNLj6cCuN6qtAy9DCwl8PNw3gVBtuN8EiDG3p793Kb3Je?=
 =?us-ascii?Q?HvvrCu03YZhS8+rmadRW4GMAQpe7GFmFNunKbL+hjGn51eZj/fJL1EDFaEHm?=
 =?us-ascii?Q?tk+d/FqE5O9NARZC4J/y2JLIOp9j22hjsBM8mTYCM+Zv3anW3WEW7horT3z+?=
 =?us-ascii?Q?+yEbgW1WRgkOCCnmols4D1/gl0XOIM7P7SKp0V/jlxx6uYyN9AVgzW8UQgmw?=
 =?us-ascii?Q?j/zLRO9xDPCPeAMmtRt+oWoFgvT9Wbc2jUenrnD9PI32ROwq2X5hYw/MPwZc?=
 =?us-ascii?Q?A6KEA7fQ7aBgX+MiWrM241pjbdjLddbFyaaCCFzGErccOjV363HCVoYunlAl?=
 =?us-ascii?Q?YcJONAA1UOnOGXBaCWEpBpTScUgEF0HUiHIBOeidUaFO4rmxEMGAOYKeb7wK?=
 =?us-ascii?Q?qo7Oy9bY62STD6QyIo29r0DwcFhMWdTdvTgFOViO+YXh/lqwA1+07399KUJg?=
 =?us-ascii?Q?KMxM34vw4U++T4LMDtrNWZF7/LpkSuNHMl6bfOkFr64pRYNnY9AzfVIzBYJH?=
 =?us-ascii?Q?TuwY9UrhtEUMg3M/sT7gvyQA/lJ9GfxoTC+HNKiA2Jk5NG/tx26eAOf2ZRWF?=
 =?us-ascii?Q?phcs1UvGF0dZrSe5dxDMlOjazG1208W1vawbsknfytI8L7jLPbxQ6Qv/wxFK?=
 =?us-ascii?Q?+H8415PyuoK4fyRjLViQh4ER3EjKll8/QK5kKk2skh0i8NwVQ7q+t1mvLnh2?=
 =?us-ascii?Q?wF9BaK2GskDKZglXY6fPXH6gxdpIa2wf9999TnW0M696NEWl5wYoTFoA3/B0?=
 =?us-ascii?Q?85OXJz1ZZ4h2kBLlwi6f5pnJ69/ZF3mFYCGOc9y0oNEQE9ouurxolZiRhVMg?=
 =?us-ascii?Q?29dTygMfFQhRQ0xrC8uEcxbnuO/4zzY5j6XYDY6GvL3l38l7+V/fdJQG22rs?=
 =?us-ascii?Q?VBeQ0E/OE9H4S8pWFZtaWwo8xIUNO1M2VUxlqim785/wff9v3U4PQuQRb/TN?=
 =?us-ascii?Q?KN1P+yZRTCVD2ClBuo35yk2LqNT7K3qUsHGIeG67VJ/rgJ2S67s9miHAt/V1?=
 =?us-ascii?Q?Ukli92MNRxWI2du85gXizKGKCbVBggzdMraHFBP8ERYWGeCd3jjZOR49+hw2?=
 =?us-ascii?Q?t0oBMujoPyAvfvhjVQwYzU8C8jBTpsNNDujLOSSX3DWzJx0inY+YEbMiYO/k?=
 =?us-ascii?Q?Onxmv4BWMYyLGrhwmg7cFhOOsMnsdIxs/jWugkBZgpcwrAd4ZVQjHG3gb/lu?=
 =?us-ascii?Q?lYO+ZtLyhMk+klQpXpW8Nf+wBTQWjYNAk47MPA1n7A+ln1IvaXxODJrwXLph?=
 =?us-ascii?Q?aVZDmHFttPoud/60AI8W5C6JcNuyeDqpSc3damRxIDih15SVQzwcU8CIocyh?=
 =?us-ascii?Q?cxHbextBIUeWz4mfeqG/Y7f41+CNY0tbB0sWpJi32V806vr4aCh7qBFvZBhJ?=
 =?us-ascii?Q?9WJMyzYFxxVuaiKZVKq5VWa5IvgTyw7El4lw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?phJUm+f3n4+6adAlfSy87MXKhTJfwoEU3L3XlRnuPb3MtvCqcvGzgI1C6Lww?=
 =?us-ascii?Q?PplTZbBaJQutRpmmk/bWDCPmIgsdJSLKOmLj3Ia2Gc3yqeCqPSy+une4LKdO?=
 =?us-ascii?Q?FkpS7JBOOFmK2yRFsXj6zueLW+89QhO8rxSdJYuy0V8CistvrMirWZhXJbtL?=
 =?us-ascii?Q?CojH/RgJhRHMI2W+tx6SUKufIiFELC2wn8KiYgLKOpxFsWMu2IuxcvGjMiys?=
 =?us-ascii?Q?2WLzNhSaYlftdjvE2c3tbUN1/yKUzdun4fmyU+2AVKC1xJHmo62QNDIWRrVd?=
 =?us-ascii?Q?CVPZwh0Js9ZnkL6rtcMI8PIN9u4zQM+0/yRK2DN4aBA+D8RKGSAUqWk0YIZJ?=
 =?us-ascii?Q?SzZ7tXW5KNAgQtc4N3MmvMeW1hlEflTgWcoNA08OR9t5eeMdiKFOwIOx0cqS?=
 =?us-ascii?Q?SyaIDZL8eMeFsLCTpQLyT3129RzycPA80P+Uf3N4nmhzkQNjylIhqqN+h7ZF?=
 =?us-ascii?Q?rd3SsYnMyEUtl+80pFQv9Di0dwDqkupJZOKqtWK+rft/+MHL4kV2oV9tp2VT?=
 =?us-ascii?Q?uX5W1oyK+Y5v+jl8u+rcycMMyc5BuIn7+NhW3C6YViH46qqwk7o4FkCK/BrJ?=
 =?us-ascii?Q?ZuaTw/5SFduVaA2HN3sn+XG4dvnbSyAnXZaxkQsNuYlo27Fddhge1ySKiOnO?=
 =?us-ascii?Q?bpLXiop6Dmv2h1WXdJLo9RWo+8HANZ4OTwPYIx1h60QIyfLBHOnsZtp+yFv7?=
 =?us-ascii?Q?9PWEByY9fueHd8IdXJvx9tYMkA6yD+POlF9Vl3ta0fzgXzb7cDz5EDPvVN0e?=
 =?us-ascii?Q?FHZWEckX9bjVHXK3T8GLLRKsOTgTWOZFlPD7JUYUQcFLBlfUFs6jLCtOZwTT?=
 =?us-ascii?Q?9WE5hDT9jRj8+0cULVClYtZRQFjzRlfDumIKLW4CxolYaOF/VIJXNh9nS+Ji?=
 =?us-ascii?Q?/xwNDwkV5ZGN7enxWXR4NaUff/LEn8O4efeZe/pSovdtNGZaqzPu0kt7LSqF?=
 =?us-ascii?Q?gNBnm9F6j7ZGfc2J7nHR1nA1fwCRR7dG8G7R6sUaGoIzCGcmgJqthBlL7fng?=
 =?us-ascii?Q?pG+AE1tDgKtisgTlaY3npJR5HTGFmXV0JmcHjuZhUIWvaaoCFLLCx/uNng45?=
 =?us-ascii?Q?16ybZaW7s8JkAjoKAN4WjgFFpCotOGeAZhG+dZ+sNwe+nSb38DZSdhPbhn8+?=
 =?us-ascii?Q?bGZ4NniGCbbkKkBex+QS++0fHUDqE8OC7Q3ieVLombTMdIOAFuNUUIrZvo8l?=
 =?us-ascii?Q?dsB08VrMDwqm8yGutdlfeCPq1Q8IBjisPuB5MFdFj5Wef/sVDJ9oWL1mnqXl?=
 =?us-ascii?Q?Wl5LQDK7/iUyI3pJlvmqdc38UCe2awFM5Sch42pClMqnVjzyCqLVi/QVi/as?=
 =?us-ascii?Q?PFQ8N/fadb8dn+5oglVZ9uH6nmEyc9TJZPld/WDeCPrkSgEecE1XZ61jLa8G?=
 =?us-ascii?Q?+1nr7HQfUDF0sNHs6wTowyNonJxx9UUbSMMrSFgztrjrTsaZnfwcSayiuHjI?=
 =?us-ascii?Q?SG+sD+uDn5MGqgzMeSGZ8AIPL0gDcHlFGjE5YyuVGWlumUXuBnOvqJtHhpv9?=
 =?us-ascii?Q?Fp5R/XQTJwaIpUQEBZAHiEofkAyzAyDdPoXygl6L1wl0bniXU1e5kwEqXivL?=
 =?us-ascii?Q?pDhDLOSQ7wAPlQ0Bgc0OPJ6z1XxkYRXpjvwjPqZ/TQtz24p9ctq4RxUHuuTF?=
 =?us-ascii?Q?9Z2jDtRPL35IzGHhg64zjHQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72aa9380-5fcf-4a74-7dc2-08de0131635f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:27:56.9347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6MGd85x+s8zavlP6SfWBlvWLarNB5rm/WboxSa/V0Qd/hypfM4fw2k3SfWbiC4X+mXK9twXJZtn+YjLFa/267fyHJkoKn7XyoII1dOjENhh3P8iNUsfCTTwJjik5lA3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8332

Refactor the VBUS control logic into a new helper function to improve
code clarity and reduce duplication. This makes it easier to handle
different VBUS control register cases and aids future maintenance.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 34 +++++++++++++++---------
 1 file changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 38b49ceb5ff3..f6026b3b95e3 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -203,28 +203,38 @@ static void rcar_gen3_set_linectrl(struct rcar_gen3_chan *ch, int dp, int dm)
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


