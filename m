Return-Path: <linux-renesas-soc+bounces-28664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG9bFubBpWmrFgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 17:59:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3031DD620
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 17:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1BBC8309414B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 16:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F6D426EC4;
	Mon,  2 Mar 2026 16:55:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055944266A1;
	Mon,  2 Mar 2026 16:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772470514; cv=none; b=Vw7CmlxCWn6FAK5R57H8RWUDI1okVBaSD5dgVysyKjrDAkH3ia2ud6GWi29KeOUBM2NCdIu2vZlo9UTa5zoSDbLNaTDk0MpDT3pprsJw1fn1nB1HaJtV1Pnxp8gXJUsGlnRiKgeqRgoxjy64d80y7gboFf0TK8BRVRdNfQmaFOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772470514; c=relaxed/simple;
	bh=xwZpKalSiQ8Z3rW1WWaXsi4dSktNHcGfFMx3aijZt1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpJz2FL6nV0o50rWrVB/lQ/iZVUA37rtKwJQLnJA1+NrLOY6NFLmVUJFOGiFgj8fzSgaFPXaQlfaxTRPs84zuyXLY2o6TDAxCNzXFNY7r3MsnBQUyJX8aO8EZWInrzfsr4HtUsu7/Wgtrc9vgOktBzGoH+wYrDq1ZjZGn8qj5+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: NNjJxT+FSqCRnszIZ6y3dg==
X-CSE-MsgGUID: NW1Xg0gbQXqk7OkctcFQPg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Mar 2026 01:55:11 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.15])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id DD07E401A65F;
	Tue,  3 Mar 2026 01:55:06 +0900 (JST)
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
Subject: [PATCH v4 5/7] clk: versaclock3: Prefix clock names with device name
Date: Mon,  2 Mar 2026 16:54:39 +0000
Message-ID: <20260302165441.4457-6-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com>
References: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0F3031DD620
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28664-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.789];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Prefix clock names with the device name to allow multiple VersaClock3
devices to be registered simultaneously.

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v4 changes:
- Used the I2C device name instead of device tree node name to make the
  clk names globally unique.

v3 changes: New patch.

 drivers/clk/clk-versaclock3.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index eb61a2c0b49b..eb25100bb0aa 100644
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
 
+	name = kasprintf(GFP_KERNEL, "%s.%s", dev_name(dev),
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
 
+		name = kasprintf(GFP_KERNEL, "%s.%s", dev_name(dev), name);
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


