Return-Path: <linux-renesas-soc+bounces-27841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L6rHoT9gWk7NQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:52:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E09DA275
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AC963039634
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 13:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534D539E6D2;
	Tue,  3 Feb 2026 13:51:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12BA638E11F;
	Tue,  3 Feb 2026 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126714; cv=none; b=ssdDxXeMndqb7i+wDrYaQiKy0nySWplWy5UYWB4n/v2D/2l80glT41oi+YuJKuOqMrmjQWgYFyDrJPn3hOmFOYyUpbYuhLiuv1FVzyQNE7vbUSTSX659JdIPvcHSgvkp6oi3oLjnZuv8Brt47lrN/knAKt5CWzjRePyLnUFn3gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126714; c=relaxed/simple;
	bh=Ywcjcbu100tGXpUlxb+o6J4x3FEK3msJ3h+zUoxPbfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vh4d0ChdQwpJ8DSQCuR6AJT1jyrFhYzQlEyUdehFs4iSsxpIBZPPh8I/2kfCFg7YQCj0kZH7D+WZMttFhkxl7BsjjS20vupBHl7EDAEjnKC6cvItcOD9sRMGLy9Tp4jVdHlEggsgUy+shNHYs//OWiB8UVklieOJtfg6v7I6dLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: ESbQLoKWQhKqVPTuKw55xg==
X-CSE-MsgGUID: H7IGw9c8QaKSEMHdcYzV9Q==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Feb 2026 22:51:49 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.5])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id CCE73421BAE7;
	Tue,  3 Feb 2026 22:51:45 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	biju.das.jz@bp.renesas.com,
	fabrizio.castro.jz@renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 1/8] clk: versaclock3: Fix NULL pointer dereference in error path
Date: Tue,  3 Feb 2026 13:51:32 +0000
Message-ID: <20260203135139.28151-2-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203135139.28151-1-ovidiu.panait.rb@renesas.com>
References: <20260203135139.28151-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27841-lists,linux-renesas-soc=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 37E09DA275
X-Rspamd-Action: no action

If devm_clk_hw_register() fails, the driver logs an error using
hw.init->name. However, the clock core sets hw->init to NULL in
__clk_register() immediately after registration, regardless of
success or failure. This leads to a NULL pointer dereference.

To fix this, save the clock name before registration and use the
saved pointer in the error message. While at it, improve the error
message to make it more clear.

Fixes: 6e9aff555db7 ("clk: Add support for versa3 clock driver")
Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v3 changes: New patch.

 drivers/clk/clk-versaclock3.c | 36 +++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 27b6cf70f3ae..6dcf3d94db7b 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -1031,19 +1031,23 @@ static int vc3_probe(struct i2c_client *client)
 	/* Register pfd muxes */
 	for (i = 0; i < ARRAY_SIZE(clk_pfd_mux); i++) {
 		clk_pfd_mux[i].regmap = regmap;
+		name = clk_pfd_mux[i].hw.init->name;
 		ret = devm_clk_hw_register(dev, &clk_pfd_mux[i].hw);
 		if (ret)
-			return dev_err_probe(dev, ret, "%s failed\n",
-					     clk_pfd_mux[i].hw.init->name);
+			return dev_err_probe(dev, ret,
+					     "failed to register clock %s\n",
+					     name);
 	}
 
 	/* Register pfd's */
 	for (i = 0; i < ARRAY_SIZE(clk_pfd); i++) {
 		clk_pfd[i].regmap = regmap;
+		name = clk_pfd[i].hw.init->name;
 		ret = devm_clk_hw_register(dev, &clk_pfd[i].hw);
 		if (ret)
-			return dev_err_probe(dev, ret, "%s failed\n",
-					     clk_pfd[i].hw.init->name);
+			return dev_err_probe(dev, ret,
+					     "failed to register clock %s\n",
+					     name);
 	}
 
 	data = i2c_get_match_data(client);
@@ -1056,28 +1060,34 @@ static int vc3_probe(struct i2c_client *client)
 
 			pll_data->vco = data->pll2_vco;
 		}
+		name = clk_pll[i].hw.init->name;
 		ret = devm_clk_hw_register(dev, &clk_pll[i].hw);
 		if (ret)
-			return dev_err_probe(dev, ret, "%s failed\n",
-					     clk_pll[i].hw.init->name);
+			return dev_err_probe(dev, ret,
+					     "failed to register clock %s\n",
+					     name);
 	}
 
 	/* Register divider muxes */
 	for (i = 0; i < ARRAY_SIZE(clk_div_mux); i++) {
 		clk_div_mux[i].regmap = regmap;
+		name = clk_div_mux[i].hw.init->name;
 		ret = devm_clk_hw_register(dev, &clk_div_mux[i].hw);
 		if (ret)
-			return dev_err_probe(dev, ret, "%s failed\n",
-					     clk_div_mux[i].hw.init->name);
+			return dev_err_probe(dev, ret,
+					     "failed to register clock %s\n",
+					     name);
 	}
 
 	/* Register dividers */
 	for (i = 0; i < ARRAY_SIZE(clk_div); i++) {
 		clk_div[i].regmap = regmap;
+		name = clk_div[i].hw.init->name;
 		ret = devm_clk_hw_register(dev, &clk_div[i].hw);
 		if (ret)
-			return dev_err_probe(dev, ret, "%s failed\n",
-					     clk_div[i].hw.init->name);
+			return dev_err_probe(dev, ret,
+					     "failed to register clock %s\n",
+					     name);
 	}
 
 	/* Register clk muxes */
@@ -1088,10 +1098,12 @@ static int vc3_probe(struct i2c_client *client)
 
 			clk_data->bitmsk = data->se2_clk_sel_msk;
 		}
+		name = clk_mux[i].hw.init->name;
 		ret = devm_clk_hw_register(dev, &clk_mux[i].hw);
 		if (ret)
-			return dev_err_probe(dev, ret, "%s failed\n",
-					     clk_mux[i].hw.init->name);
+			return dev_err_probe(dev, ret,
+					     "failed to register clock %s\n",
+					     name);
 	}
 
 	/* Register clk outputs */
-- 
2.51.0


