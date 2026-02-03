Return-Path: <linux-renesas-soc+bounces-27845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJagNrb9gWk7NQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27845-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:52:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3E7DA2BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9DEF7304538B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 13:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DB43A0EA8;
	Tue,  3 Feb 2026 13:52:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F163A0B2A;
	Tue,  3 Feb 2026 13:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126730; cv=none; b=DK5zocQNmIhVeD49QcOfa1IDm0ZOVXVDe0UOOhNo7F1Y5vRmC2zVSbpNmeIA6+5gLIdx7JzlQi5JTG1Y2W+mPZQXdIQAX4szmbZbxBIX9u2mhGa4n6a4t0t5zj8NnNN6DylbTN2ejOm0GIFfF5zvOOjVdiiN8baj7B6GsqHNRWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126730; c=relaxed/simple;
	bh=NnSUoYFWCPnoIcvtGsBTgKAld6nMfxWpWmkopbxmozg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BZRUclHzhdglcA0HfP3eJ5f28Ynx7NOKk9nIy5VavlF6uowGO7wN5LZMuBDZoYAUgHGA8YswbYIjWVDJzcleFZjeVVXXdZSgaVE3/9pnyVUpWeTL74WZQ5LukF27ExqjhiNUdJag3o6SoUyNp2LAcjJ1ixHkwiZ+BKkkZjlEwug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: Gtdtrt3qR7abFRBMveIRgg==
X-CSE-MsgGUID: ifXr6rA2TPeIgxJqxtku0A==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Feb 2026 22:52:08 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.5])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 82BCD421BAF7;
	Tue,  3 Feb 2026 22:52:04 +0900 (JST)
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
Subject: [PATCH v3 5/8] clk: versaclock3: Prefix clock names with DT node name
Date: Tue,  3 Feb 2026 13:51:36 +0000
Message-ID: <20260203135139.28151-6-ovidiu.panait.rb@renesas.com>
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
	TAGGED_FROM(0.00)[bounces-27845-lists,linux-renesas-soc=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:mid,renesas.com:email,init.name:url]
X-Rspamd-Queue-Id: 7F3E7DA2BF
X-Rspamd-Action: no action

Similar to commit f491276a5168 ("clk: vc5: Allow Versaclock driver to
support multiple instances"), prefix clock names with the device tree
node name to allow multiple VersaClock3 devices to be registered
simultaneously.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v3 changes: New patch.

 drivers/clk/clk-versaclock3.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index eb61a2c0b49b..56285c9a48ce 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -1137,6 +1137,7 @@ static int vc3_register_clk(struct vc3_device_data *vc3,
 	struct device *dev = &vc3->client->dev;
 	struct clk_parent_data *pd;
 	struct clk_init_data init;
+	const char *name;
 	int ret;
 
 	if (!hw_data->data)
@@ -1147,7 +1148,15 @@ static int vc3_register_clk(struct vc3_device_data *vc3,
 	if (!pd)
 		return -ENOMEM;
 
+	name = kasprintf(GFP_KERNEL, "%pOFn.%s", dev->of_node,
+			 template->hw.init->name);
+	if (!name) {
+		kfree(pd);
+		return -ENOMEM;
+	}
+
 	init = *template->hw.init;
+	init.name = name;
 	init.parent_data = pd;
 	init.num_parents = hw_data->parent_info->num_parents;
 
@@ -1157,6 +1166,7 @@ static int vc3_register_clk(struct vc3_device_data *vc3,
 	ret = devm_clk_hw_register(dev, &hw_data->hw);
 
 	kfree(pd);
+	kfree(name);
 
 	return ret;
 }
@@ -1321,6 +1331,10 @@ static int vc3_probe(struct i2c_client *client)
 			return dev_err_probe(dev, -EINVAL, "invalid clk output %d\n", i);
 		}
 
+		name = kasprintf(GFP_KERNEL, "%pOFn.%s", dev->of_node, name);
+		if (!name)
+			return -ENOMEM;
+
 		if (i == VC3_REF)
 			vc3->clk_out[i] = devm_clk_hw_register_fixed_factor_index(dev,
 				name, 0, CLK_SET_RATE_PARENT, 1, 1);
@@ -1328,6 +1342,8 @@ static int vc3_probe(struct i2c_client *client)
 			vc3->clk_out[i] = devm_clk_hw_register_fixed_factor_parent_hw(dev,
 				name, &vc3->clk_mux[i - 1].hw, CLK_SET_RATE_PARENT, 1, 1);
 
+		kfree(name);
+
 		if (IS_ERR(vc3->clk_out[i]))
 			return PTR_ERR(vc3->clk_out[i]);
 	}
-- 
2.51.0


