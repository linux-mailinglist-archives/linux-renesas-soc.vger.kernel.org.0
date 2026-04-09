Return-Path: <linux-renesas-soc+bounces-31061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOqPK5Vs12myNggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:08:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E383C8368
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Apr 2026 11:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6513F302416A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2026 09:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EC33A873A;
	Thu,  9 Apr 2026 09:04:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673E3314D21;
	Thu,  9 Apr 2026 09:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725463; cv=none; b=SZ5Gn1DDtyLoubiC4mINoW9/F1gKeStOMhJ75zatMVId5whBpl4km87CLmrAMQV6fHsQwoeFXIZzCGUAk07NJ/4kuLboXxPqCLp3oX+jXF4Y3uJ4PPGjTCUO7FbGzxWRMF39sYV+DYHQFTiGYI+wx6ep8umQznjkNFeS3UKhkwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725463; c=relaxed/simple;
	bh=TaUG1/A+NpWcNgPVkV1kteUWKJQFCJL+3IETzQCtzP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mvuT8r+oUTgXjbOxam6vfYTNo7q0X5mnv9gvwVZ3+UtCd9n5D/8knMGzli9+TAzUZf5JZLa8PApSMt4z8vag9OcPTHnpH+3weL5b50RSyeUmEp7pRM9coE8kg6ATEpbFw77IAocIebKnrZdGVERjtAQyC7bBEp2tFvV3P+kq60U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: bN7kFeHzQAWKsFRYxvhJ8g==
X-CSE-MsgGUID: NNMHWTa/QxOlaF6Jy0gsjg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Apr 2026 18:04:21 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.218])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id F01414015FC2;
	Thu,  9 Apr 2026 18:04:14 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v4 05/12] ASoC: rsnd: Add audmacpp clock and reset support for RZ/G3E
Date: Thu,  9 Apr 2026 11:02:54 +0200
Message-ID: <20260409090302.2243305-6-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409090302.2243305-1-john.madieu.xa@bp.renesas.com>
References: <20260409090302.2243305-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31061-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.175];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 14E383C8368
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/G3E requires additional audmapp clock and reset lines for
Audio DMA-PP operation.

Add global audmacpp clock/reset management in rsnd_dma_probe()
using optional APIs to remain transparent to other platforms.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:
 
v4:
 - Move audmapp_clk and audmapp_rstc from struct rsnd_priv into
   struct rsnd_dma_ctrl
v3: No changes
v2: No changes

 sound/soc/renesas/rcar/dma.c  | 17 +++++++++++++++++
 sound/soc/renesas/rcar/rsnd.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 68c859897e68..feab42e3202d 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -47,6 +47,9 @@ struct rsnd_dma_ctrl {
 	phys_addr_t ppres;
 	int dmaen_num;
 	int dmapp_num;
+	/* RZ/G3E: Audio DMAC peri-peri clock and reset */
+	struct clk *audmapp_clk;
+	struct reset_control *audmapp_rstc;
 };
 
 #define rsnd_priv_to_dmac(p)	((struct rsnd_dma_ctrl *)(p)->dma)
@@ -864,6 +867,20 @@ int rsnd_dma_probe(struct rsnd_priv *priv)
 	if (rsnd_is_gen4(priv))
 		goto audmapp_end;
 
+	/* for RZ/G3E */
+	dmac->audmapp_rstc =
+		devm_reset_control_get_optional_exclusive_deasserted(dev, "audmapp");
+	if (IS_ERR(dmac->audmapp_rstc)) {
+		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_rstc),
+				     "failed to get audmapp reset\n");
+	}
+
+	dmac->audmapp_clk = devm_clk_get_optional_enabled(dev, "audmapp");
+	if (IS_ERR(dmac->audmapp_clk)) {
+		return dev_err_probe(dev, PTR_ERR(dmac->audmapp_clk),
+				     "failed to get audmapp clock\n");
+	}
+
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "audmapp");
 	if (!res) {
 		dev_err(dev, "lack of audmapp in DT\n");
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 7b50e0456cca..28ed90ffe0ab 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -623,6 +623,7 @@ void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m);
 struct rsnd_priv {
 
 	struct platform_device *pdev;
+
 	spinlock_t lock;
 	unsigned long flags;
 
-- 
2.25.1


