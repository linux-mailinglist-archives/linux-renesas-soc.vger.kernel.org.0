Return-Path: <linux-renesas-soc+bounces-30778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ABSMriazmnfowYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:35:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9C938BF35
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB2C53073FBE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 16:26:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1E43F54AE;
	Thu,  2 Apr 2026 16:26:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9923F0AB0;
	Thu,  2 Apr 2026 16:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147178; cv=none; b=WScIhWW8+mmEZ5rKw/FBHEZKTvvsEe+/n+Vqbg+njSvC1G+4ODUq4MiyhlK09x3pisqgrRU5L+aWcoqocZdzj4n6KPB0oQt180gdINH7aXxV35QsUeoLSkA4V29i3R8SDO8/aypt5Nh1IwvwR/1A6Y8v5znUxUPyqe6xRevS4Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147178; c=relaxed/simple;
	bh=jybpBL0C3UTwg19W79ip5i/N9B/YhKEN2YkEI5P8cDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dfTl+6zDLEHEJD8WadK45V2OETZ1S4ZCJK+Ye+w3iF/HnPjJ7YXeN/UHC1wwFmKrvHJvj2F6NEh8ASFXKGkNmPDETkzbudwTBthyE9d1EPhOkREUqN+MJxgAvIrAef5/nYmC8mbVq7/9tgiB8YSM88JFhnfm0NjFiMmAqXw8mZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 1KTr8n+4QAqgZRYgIdoNdQ==
X-CSE-MsgGUID: POPK5Q6JSUaLEnmEShtfew==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Apr 2026 01:26:16 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 31736401911D;
	Fri,  3 Apr 2026 01:26:10 +0900 (JST)
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
Subject: [PATCh v3 12/14] ASoC: rsnd: Add rsnd_adg_mod_get() for PM support
Date: Thu,  2 Apr 2026 18:24:34 +0200
Message-ID: <20260402162436.12059-13-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
References: <20260402162436.12059-1-john.madieu.xa@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-30778-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.910];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 4B9C938BF35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add rsnd_adg_mod_get() to retrieve the ADG module handle.

This is preparation for system suspend/resume support, where the PM
callbacks need to access the ADG module to manage its clock and reset
state. Other modules (SSI, SRC, CTU, MIX, DVC) already have their
getters exported.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes
v2: Moved export part into a new patch (the next one)

 sound/soc/renesas/rcar/adg.c  | 10 ++++++++++
 sound/soc/renesas/rcar/rsnd.h |  1 +
 2 files changed, 11 insertions(+)

diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
index 131a60689f6d..d73f29bc9de7 100644
--- a/sound/soc/renesas/rcar/adg.c
+++ b/sound/soc/renesas/rcar/adg.c
@@ -906,6 +906,16 @@ int rsnd_adg_probe(struct rsnd_priv *priv)
 	return 0;
 }
 
+struct rsnd_mod *rsnd_adg_mod_get(struct rsnd_priv *priv)
+{
+	struct rsnd_adg *adg = rsnd_priv_to_adg(priv);
+
+	if (!adg)
+		return NULL;
+
+	return rsnd_mod_get(adg);
+}
+
 void rsnd_adg_remove(struct rsnd_priv *priv)
 {
 	struct device *dev = rsnd_priv_to_dev(priv);
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 8700b39b535e..3860e1c4943f 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -618,6 +618,7 @@ int rsnd_adg_set_cmd_timsel_gen2(struct rsnd_mod *cmd_mod,
 #define rsnd_adg_clk_disable(priv)	rsnd_adg_clk_control(priv, 0)
 int rsnd_adg_clk_control(struct rsnd_priv *priv, int enable);
 void rsnd_adg_clk_dbg_info(struct rsnd_priv *priv, struct seq_file *m);
+struct rsnd_mod *rsnd_adg_mod_get(struct rsnd_priv *priv);
 
 /*
  *	R-Car sound priv
-- 
2.25.1


