Return-Path: <linux-renesas-soc+bounces-21417-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CECB44B63
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 03:58:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 337617B7A87
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 01:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF622045B7;
	Fri,  5 Sep 2025 01:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="mhyC1qL+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9931AA7A6;
	Fri,  5 Sep 2025 01:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757037486; cv=none; b=dsgy339W18oC4MZ9Tbl6nUpeyxnxw+7wEnE484xEFHEOB+zW2NQAZs9C8ljSpp+ZrZDbUzFjrzW0EqzoHPdvhmNt5NSZzuzBRl0ogKE/Mv8q1zEFSzTw4ALjSY/qslL8V6mHWvaOmtKqWHYi5M8v6AntNTHPvELNd1kTSZTXlxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757037486; c=relaxed/simple;
	bh=ejwGYqInl4YF0y1GjFOwNRf1/xCmmV+ARbgYrXW0njM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rCWtOmKRzl9+l0z01cnu0s9Ws/jYzDsNBCMBx5imJM8asptQh46ciXnthkGX5kEHO6xzDNHgUg2zr1a0z+6P8R8zFBaTavHv4INlbcB9b8ayAO5JsO4SG0OwA0ncpDDUamKut6k0b1Sst/eF6jZdZDQRJmcdHwOrRkkJC8Z8S1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=mhyC1qL+; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=/P
	5SilX0dEje4PYdQtLtT+L26nPZeuPJzid50auEwKo=; b=mhyC1qL+cDvACwq5Tb
	UugJy9Ev6HkAKr5S3nm1zBb08C3mf7wt5rvYJQyr+hw0A/taZeTvb6nGCMim3GNX
	Bdp34p2GelWcok91HfHKIUe/0A9o+gqo/wSc0a90haMt3BUjrj5mzSlebLXU/vBi
	taSaK9+l/5I/MLIZpLF/bRD/k=
Received: from 163.com (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnsWCSQ7poon9KGg--.51314S2;
	Fri, 05 Sep 2025 09:57:40 +0800 (CST)
From: chenyuan_fl@163.com
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	kuninori.morimoto.gx@renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuan CHen <chenyuan@kylinos.cn>
Subject: [PATCH] clk: renesas: fix memory leak in cpg_mssr_reserved_init()
Date: Fri,  5 Sep 2025 02:57:35 +0100
Message-Id: <20250905015735.10347-1-chenyuan_fl@163.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnsWCSQ7poon9KGg--.51314S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ur4UKF1xtF1fGrWUur48JFb_yoW8XrW7pr
	W8GryIyF1Yyw1qgFZ7CayfZr1rZas7Ga47W342k3W8Zw1kAFya9r10qayqyFykJFZ5ZFya
	gas0k3W8ur4UCFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFYLkUUUUU=
X-CM-SenderInfo: xfkh05pxdqswro6rljoofrz/1tbiJxi-vWi6OVrhlgAAs7

From: Yuan CHen <chenyuan@kylinos.cn>

In the current implementation, when krealloc_array() fails, the original memory
pointer is incorrectly set to NULL after kfree(), resulting in a memory leak
during reallocation failure.

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


