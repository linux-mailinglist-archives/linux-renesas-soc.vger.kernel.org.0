Return-Path: <linux-renesas-soc+bounces-21544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04949B48214
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 03:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B78A917C48C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Sep 2025 01:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C7C1A9FA8;
	Mon,  8 Sep 2025 01:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Fud/aShV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC04D1A76DE;
	Mon,  8 Sep 2025 01:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757294920; cv=none; b=Y0Toe6nFZBheBSEdvEkHC2iQRha8Avki942lqFAZjeTPNRYZOV+q2Rz38TlPzKv30VTpMxk1aV1Zrs6I8Z9C4yEt9ALZXRp+dddIzs+21EkUgFc/h9Sf477SXK2ROm+wHnmIGRRw5Vs7VJ07NBg2YKzamqLFt9fBdOaK/Y3p4Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757294920; c=relaxed/simple;
	bh=z8yAPfMmQwzHszu4Z2lL+bTxIE9wiaxWaqZHn+igdFg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AB3eopTw9rvFloWcDkl5lm/5xX5nr6neDY+cAvUICLs1nImpq7PW2ooZ4an+IWPQO+waItPrF8/G1LfKwV8pkXYmd7CdwOV0cyjdbwok54nX4lj4Odn+8ZquLdZ0lU0OLi+2BLIqNHzryAjyrOTOkVQPZrHB9EdGW/VlvZrXkos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Fud/aShV; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=b4
	78YNyQYzpAeXDsMB01qHYuIYetAOgNkJR3xyEww0I=; b=Fud/aShV2wf7OgFZN/
	NBMgK8XZrZeQv2CeKgjtdom0i66J14vQ2alQi5lLNowKvutpBcOSYSlQF9WbCa56
	VKPdy5m3yrdk8ZoRSHqwaebejf5O/ynhCQYKlSgr8JJKAcwfir8LKv57JU4c4QdG
	m+2bhKEahZn7XQu53/vbzUazE=
Received: from 163.com (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgC3Rx0rMb5oOp+uCA--.6873S2;
	Mon, 08 Sep 2025 09:28:13 +0800 (CST)
From: chenyuan_fl@163.com
To: kuninori.morimoto.gx@renesas.com,
	geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuan CHen <chenyuan@kylinos.cn>
Subject: [PATCH v2] clk: renesas: fix memory leak in cpg_mssr_reserved_init()
Date: Mon,  8 Sep 2025 02:28:10 +0100
Message-Id: <20250908012810.4767-1-chenyuan_fl@163.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <87segx256a.wl-kuninori.morimoto.gx@renesas.com>
References: <87segx256a.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgC3Rx0rMb5oOp+uCA--.6873S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrWxWr1fXFWxuFyktr1fWFg_yoW8XF43pr
	W8GryIyF1Fyw1qgFZ7CayfZr1rZas7Ka47X342k3W8Zw1kAFya9r10qayDZFykJFZ5ZFya
	gF90k3WUur4UCFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFYLkUUUUU=
X-CM-SenderInfo: xfkh05pxdqswro6rljoofrz/xtbBSQbBvWi+CmHOlgABsX

From: Yuan CHen <chenyuan@kylinos.cn>

In the current implementation, when krealloc_array() fails, the error handling path
incorrectly sets the original memory pointer to NULL before it is freed,
resulting in a memory leak during reallocation failure.

Fixes: 6aa17547649 ("clk: renesas: cpg-mssr: Ignore all clocks assigned to non-Linux system")
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


