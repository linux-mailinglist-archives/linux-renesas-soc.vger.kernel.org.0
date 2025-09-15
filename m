Return-Path: <linux-renesas-soc+bounces-21860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC431B57D0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 15:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FB5E48815F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Sep 2025 13:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5276431329A;
	Mon, 15 Sep 2025 13:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="PMwGeLgI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC942C21C7;
	Mon, 15 Sep 2025 13:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757942881; cv=none; b=iFhGeTmjAUxl9/9a08ta+j9n1IMCEDu0RoUkMhlnK4Hsxd2X0jlzDIyvCk34oLFt/KzKf77UzOSyxPTRIjQnFKibB82bdapRKiel+JqAZVBC2edc7KB+S4AmhBngk1kXJ5NOQMuFgm0dA6Zf6+1n3sjLxqWmFBKdpQRRQlRWaW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757942881; c=relaxed/simple;
	bh=7cjeGd9WRRoHU2wUcyDOxjEwH9iSehFGNRu/4dTC0vY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m2lAoikVBf0PP4K3KN5Aqc3fdcRyntiW+yc7M7R2sOT3O1AENpJygkaxZeapS1KRKi7YVPob3+uN3qT5F3o9AcveRwVKydxdiTjkEUj74hyIlzj2nIj2qZYLa/yujqMHn04K/KKiYXwikU+FJke2vLZSswJ5jbukrtIEIKW3yg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=PMwGeLgI; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:Reply-To:
	MIME-Version; bh=EoZ0cvsOVx1mpocwFsEop3+vRTWAT+XGJJ4kg9zqwOo=;
	b=PMwGeLgI790jAHZfArTQNEOVEIXQ7S1UtupllmZpC4+X5jYRbHXJJAbBUe/1qa
	ls50jcr4DoxO2JdoIRod6S0N85vjtxkRuMHyt5NAa9hexISZmNdbmBzJLLIkQzs7
	rieRnwbQVM2vPAxhvhSaksNrb/nI53C0Ydu5flIvbjcF4=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wD3H42vEMho5pS4BQ--.43673S2;
	Mon, 15 Sep 2025 21:12:17 +0800 (CST)
From: chenyuan_fl@163.com
To: kuninori.morimoto.gx@renesas.com,
	geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuan CHen <chenyuan@kylinos.cn>
Subject: [PATCH] clk: renesas: fix memory leak in cpg_mssr_reserved_init()
Date: Mon, 15 Sep 2025 14:12:14 +0100
Message-Id: <20250915131214.3160-1-chenyuan_fl@163.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <87segx256a.wl-kuninori.morimoto.gx@renesas.com>
References: <87segx256a.wl-kuninori.morimoto.gx@renesas.com>
Reply-To: <87ms751z28.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H42vEMho5pS4BQ--.43673S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw1fKr1xGr1fAF15tryDtrb_yoW8Xr17pr
	WUGa42yF15tw1v9FZrCayfZr1rZa97Kay7XFy2k3W8Z3WkAF4a9F10qaykZFykJFsYvFWY
	gF90k3WUCr4UCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFYLkUUUUU=
X-CM-SenderInfo: xfkh05pxdqswro6rljoofrz/1tbiJxPJvWjID7geFwAAse

From: Yuan CHen <chenyuan@kylinos.cn>

In case of krealloc_array() failure, current error handling just
returns from function without freeing alloced array. It cause a
memory leak. Fixup it.

Fixes: 6aa175476490 ("clk: renesas: cpg-mssr: Ignore all clocks assigned to non-Linux system")
Signed-off-by: Yuan CHen <chenyuan@kylinos.cn>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5ff6ee1f7d4b..de1cf7ba45b7 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -1082,6 +1082,7 @@ static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
 
 		of_for_each_phandle(&it, rc, node, "clocks", "#clock-cells", -1) {
 			int idx;
+			unsigned int *new_ids;
 
 			if (it.node != priv->np)
 				continue;
@@ -1092,11 +1093,13 @@ static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
 			if (args[0] != CPG_MOD)
 				continue;
 
-			ids = krealloc_array(ids, (num + 1), sizeof(*ids), GFP_KERNEL);
-			if (!ids) {
+			new_ids = krealloc_array(ids, (num + 1), sizeof(*ids), GFP_KERNEL);
+			if (!new_ids) {
 				of_node_put(it.node);
+				kfree(ids);
 				return -ENOMEM;
 			}
+			ids = new_ids;
 
 			if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 				idx = MOD_CLK_PACK_10(args[1]);	/* for DEF_MOD_STB() */
-- 
2.39.5


