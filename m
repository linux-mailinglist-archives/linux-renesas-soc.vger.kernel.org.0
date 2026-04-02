Return-Path: <linux-renesas-soc+bounces-30779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKwHOMGazmnfowYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:35:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7913D38BF43
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91398307C482
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 16:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51FE73F20F8;
	Thu,  2 Apr 2026 16:26:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E443EFD2A;
	Thu,  2 Apr 2026 16:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147184; cv=none; b=KhhHnNem3GX88nyA4c+vdMpoAXcOOaVk6RHuaSE1yy5vTz8aPnYYmknLCs0EUzcP8LoFPimp8Jy2PQ+RxkjkAB6dNEYQ8HPlCfTJhnk+/kM835ADKs5lKqhGsqrkOExySiB1leVCYWZQRMWr1mzWNwueu/onSkG+c4oTNaBQpt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147184; c=relaxed/simple;
	bh=jb9uyIPGFq3YPf7/nUlxrA7jLYfE3LblZe9j+F12GMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ptQ9UrVMzkqYJ2+ARifIMDG56DeDMSoU/8I475NBBkhHT1MUFi2ZDbpgnyuXBPTq6MAcDCT5YKgyyupClB80ufrBVwz/NnE10IIMvZZ7MUyhlqcpN0MRJHiaSsfTjAxEfQAeOfvLnxkVd0IRCtRkDcFAG2vjjRvrCDK4jy0k144=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: LHvO1VwYTZ+dq44Ot15KFg==
X-CSE-MsgGUID: vM08R+SXTpOjDKc7TZHheQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Apr 2026 01:26:22 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 19C3A401911D;
	Fri,  3 Apr 2026 01:26:16 +0900 (JST)
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
Subject: [PATCh v3 13/14] ASoC: rsnd: Export rsnd_ssiu_mod_get() for PM support
Date: Thu,  2 Apr 2026 18:24:35 +0200
Message-ID: <20260402162436.12059-14-john.madieu.xa@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-30779-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.908];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7913D38BF43
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove the static qualifier from rsnd_ssiu_mod_get() and export it
via rsnd.h.

This is preparation for system suspend/resume support, where the PM
callbacks need to access SSIU modules to manage their clock and reset
state.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes
v2: New patch, resulting from a split of the previous one

 sound/soc/renesas/rcar/rsnd.h | 1 +
 sound/soc/renesas/rcar/ssiu.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 3860e1c4943f..ddaac350a049 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -815,6 +815,7 @@ int rsnd_ssi_is_dma_mode(struct rsnd_mod *mod);
 int __rsnd_ssi_is_pin_sharing(struct rsnd_mod *mod);
 
 #define rsnd_ssi_of_node(priv) rsnd_parse_of_node(priv, RSND_NODE_SSI)
+struct rsnd_mod *rsnd_ssiu_mod_get(struct rsnd_priv *priv, int id);
 void rsnd_parse_connect_ssi(struct rsnd_dai *rdai,
 			    struct device_node *playback,
 			    struct device_node *capture);
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index f377d9414633..1462f02c2a7f 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -434,7 +434,7 @@ static struct rsnd_mod_ops rsnd_ssiu_ops_gen2 = {
 	DEBUG_INFO
 };
 
-static struct rsnd_mod *rsnd_ssiu_mod_get(struct rsnd_priv *priv, int id)
+struct rsnd_mod *rsnd_ssiu_mod_get(struct rsnd_priv *priv, int id)
 {
 	if (WARN_ON(id < 0 || id >= rsnd_ssiu_nr(priv)))
 		id = 0;
-- 
2.25.1


