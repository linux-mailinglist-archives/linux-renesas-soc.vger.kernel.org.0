Return-Path: <linux-renesas-soc+bounces-31301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJSCAhWK32mgVAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:52:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C5B40486E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 14:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BFA030D2241
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2026 12:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B5F37FF62;
	Wed, 15 Apr 2026 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8JP4Crh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AA737CD4D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 12:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257274; cv=none; b=P0RnzP7Hv2yCYzIjdszHqo6m0ax/A0zd61C11CREw6+e9RWqxY5ZE/U5zk8fab6JwDikJI2xIB5rPUzFWet9XMnn35/thk81inpXMUbQ0QjCKx8ZzNpO6FrFwmakxPEW7/yD9iZcSaDCwO57ijI8cluEV00GEgpMivUPLbpksDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257274; c=relaxed/simple;
	bh=VrxoqvGX10M5GqXKNwdjsk+j6NY1VCHWKELaVq71FgE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m2oYFrZ/52eUEKbUwvO4S30BNvxQ3bd9/cjhr9Htc7RDkFOewPbaKdxfmccxmjp3S6PVSggvmw0CoaeggXPtBXqSjkne1rR0+YXAIV+Kp3fnEgD4+f+r2AZFOwXeBafnVn1wlTpQPHl5YNKdZpQvaef9azpeW0JIxXfm+KBfON0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8JP4Crh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso63584695e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Apr 2026 05:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776257270; x=1776862070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUAknHQ/4HWX3+aWhalXddRaQ+nerMHWsE1Hn2z0ZCs=;
        b=H8JP4Crh47kdWEkINTS/yTfgV5lj5sPjiXjeSr+rkONi0JD+zLtbadPDNDM1clbwIs
         f8x2/Wjgc0IlTh+cc7xUtmS3Or+3Ev1acfz76WbLLLw3SQtL5aX7OCCe04gfVvqYEEQ3
         5tdkzuI6OwE5Go9jmgUm95x/gY2ouizoIS621h65amcIw1NMmHEOlli9weTpBns82JLf
         oZ5g4hUpiYsQP0kyliUor9Y9MxWPkgfb1zQFRyv6hjpWZWfjInndEdOLPiK0jKhMOoyU
         o1UFR5s8drFQU5EtyQnsTlOHc3z+d0Z2PPDrkuxi3y93q2bOLtaadhqpy02ia+Q3pm2D
         G1Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776257270; x=1776862070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GUAknHQ/4HWX3+aWhalXddRaQ+nerMHWsE1Hn2z0ZCs=;
        b=BCFvB90swLsYhWCkrHQJfywSJllIIBaZVG7JOBaa5p1ZogOyZ/eYpb7OFHMVb+Wjs3
         ESyrOoF0JUW0V5b43jdke9w1dc11ZdHCH7L4Ej9NjlqgsZ8BQWY6dBuAa2Fx7HYAjnB+
         lbDA8bLyQR3hlthl/AEqTGwutP88xpiIIkdVhqzhomAy/T3l1gy30J0bth1Q8SP3bJcW
         79NsBOrpEDGxOK9vEeRRJ33TboQiv7I1KkF+SsN+M/FOjJx1gbtSvIjNFI1cKJuIV33p
         AmGRgud9jBqNt5Ow/1U2wQl9RKgM7JHp594MCcDgTkDI0vRRftOX/4VM3nwOW9In4iRI
         mJ/A==
X-Forwarded-Encrypted: i=1; AFNElJ8EFEYHpfX0n7kiRGrM1pR6S3tSbZE/f15DR11vr0AMWFWpJQeIJIOqZGkkBt4tyuWyPEP501q/5hBYnRpVnEyI0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbKfwqpmstGozcsKTt5wA5Qei2g6UKcjffy8Crm3UHRn9j+GiC
	4o6mNdZ4nFhBihm8ava8HdmC68jiy14kUDtRoROdebahA71bSmTmdLjZ
X-Gm-Gg: AeBDievALtWk9zGh7QeVkHmWTq2WFNeKF9E3xYstIEBE+v50UWyS7ffPf/R5Te5SmLj
	LxTBvshk9glzvoh4PlMVYKkMjIwIiHt4apMpAiOVEdsejGDCu3hS343wU29ZFTGCBFqFPAuU4in
	ua1Vi4znl2OgTygVRsB915tTnBDy9eMSRNipyd3NxQiQd6yX54Rx1VauUgyoF4D3VwyqA5XIasT
	e1KUasIL2N592j3cfnBODVdTFmQKcwmY/3aTUOqeLlI8f4fw2/fisSbNSBeglyMXwRTJWMKURv3
	XjLo6EFkJ6Y3gcS0tSF6efDX+P1tiWzixW9EjyGaBAATYnIG5z+f91JhKjWnshVVyGa4E42idb2
	1x1scVHXjD4SDadMHWhNnXGA6OqCqoQSpnoZGqJQ2LYdt/YSd/eSzBTv8kz88RhLRdy5t6AsMy5
	CKFHp+MGEvG16D2dw0xMA7xeWOrROtYmfmzu0RKA==
X-Received: by 2002:a05:600c:5303:b0:488:b196:d249 with SMTP id 5b1f17b1804b1-488d67bf74fmr291654215e9.5.1776257269879;
        Wed, 15 Apr 2026 05:47:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:41d0:406:c100::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead356616sm5123319f8f.13.2026.04.15.05.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:47:49 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
X-Google-Original-From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [PATCH v5 13/14] ASoC: rsnd: Support unprefixed DT node names for RZ/G3E
Date: Wed, 15 Apr 2026 12:47:30 +0000
Message-Id: <20260415124731.3684773-14-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
References: <20260415124731.3684773-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31301-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,perex.cz,suse.com,glider.be,gmail.com,pengutronix.de,tuxon.dev,bp.renesas.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[renesas.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johnmadieu@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.981];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60C5B40486E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The RZ/G3E device tree binding uses standard unprefixed node names
('ssi', 'ssiu', 'src', 'dvc', 'mix', 'ctu', 'dai') instead of the
legacy 'rcar_sound,' prefixed names used by R-Car bindings.

Convert rsnd_parse_of_node() from a macro into a function that tries
the legacy prefixed name first, then falls back to the unprefixed
name by stripping the "rcar_sound," prefix. This makes the driver
work transparently with both old and new bindings.

While at it, update the of_node_name_eq() calls in core.c which compare
against RSND_NODE_DAI directly (bypassing rsnd_parse_of_node()),
and fix the related comments in ssiu.c, ssi.c, and dma.c that
reference hardcoded "rcar_sound,ssiu" / "rcar_sound,ssi" names.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v5: New patch.

 sound/soc/renesas/rcar/core.c | 27 +++++++++++++++++++++++++--
 sound/soc/renesas/rcar/dma.c  |  8 ++++----
 sound/soc/renesas/rcar/rsnd.h |  4 ++--
 sound/soc/renesas/rcar/ssi.c  |  8 ++++----
 sound/soc/renesas/rcar/ssiu.c |  8 ++++----
 5 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
index cb31af8a34d4..93cacac1c98a 100644
--- a/sound/soc/renesas/rcar/core.c
+++ b/sound/soc/renesas/rcar/core.c
@@ -1235,6 +1235,27 @@ int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name
 	return i;
 }
 
+struct device_node *rsnd_parse_of_node(struct rsnd_priv *priv, const char *name)
+{
+	struct device_node *np = rsnd_priv_to_dev(priv)->of_node;
+	struct device_node *node;
+	const char *unprefixed;
+
+	node = of_get_child_by_name(np, name);
+	if (node)
+		return node;
+
+	/*
+	 * RZ/G3E binding uses unprefixed node names (e.g. "ssi" instead
+	 * of "rcar_sound,ssi"). Try stripping the "rcar_sound," prefix.
+	 */
+	unprefixed = strchr(name, ',');
+	if (unprefixed)
+		node = of_get_child_by_name(np, unprefixed + 1);
+
+	return node;
+}
+
 static struct device_node*
 	rsnd_pick_endpoint_node_for_ports(struct device_node *e_ports,
 					  struct device_node *e_port)
@@ -1273,7 +1294,8 @@ static int rsnd_dai_of_node(struct rsnd_priv *priv, int *is_graph)
 	of_node_put(node);
 
 	for_each_child_of_node_scoped(np, node) {
-		if (!of_node_name_eq(node, RSND_NODE_DAI))
+		if (!of_node_name_eq(node, RSND_NODE_DAI) &&
+		    !of_node_name_eq(node, "dai"))
 			continue;
 
 		priv->component_dais[i] = of_get_child_count(node);
@@ -1525,7 +1547,8 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
 		}
 	} else {
 		for_each_child_of_node_scoped(np, node) {
-			if (!of_node_name_eq(node, RSND_NODE_DAI))
+			if (!of_node_name_eq(node, RSND_NODE_DAI) &&
+			    !of_node_name_eq(node, "dai"))
 				continue;
 
 			for_each_child_of_node_scoped(node, dai_np) {
diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
index 71dfa23018a5..39f43e935cde 100644
--- a/sound/soc/renesas/rcar/dma.c
+++ b/sound/soc/renesas/rcar/dma.c
@@ -794,11 +794,11 @@ static void rsnd_dma_of_path(struct rsnd_mod *this,
 	int nr, i, idx;
 
 	/*
-	 * It should use "rcar_sound,ssiu" on DT.
-	 * But, we need to keep compatibility for old version.
+	 * It should use "rcar_sound,ssiu" (R-Car) or "ssiu" (RZ/G3E) on DT.
+	 * We need to keep compatibility for old version.
 	 *
-	 * If it has "rcar_sound.ssiu", it will be used.
-	 * If not, "rcar_sound.ssi" will be used.
+	 * If it has "rcar_sound.ssiu" or "ssiu", it will be used.
+	 * If not, "rcar_sound.ssi" or "ssi" will be used.
 	 * see
 	 *	rsnd_ssiu_dma_req()
 	 *	rsnd_ssi_dma_req()
diff --git a/sound/soc/renesas/rcar/rsnd.h b/sound/soc/renesas/rcar/rsnd.h
index 70e395d3c6ef..0d2436beb718 100644
--- a/sound/soc/renesas/rcar/rsnd.h
+++ b/sound/soc/renesas/rcar/rsnd.h
@@ -482,8 +482,8 @@ int rsnd_runtime_is_tdm_split(struct rsnd_dai_stream *io);
 /*
  * DT
  */
-#define rsnd_parse_of_node(priv, node)					\
-	of_get_child_by_name(rsnd_priv_to_dev(priv)->of_node, node)
+struct device_node *rsnd_parse_of_node(struct rsnd_priv *priv, const char *name);
+
 #define RSND_NODE_DAI	"rcar_sound,dai"
 #define RSND_NODE_SSI	"rcar_sound,ssi"
 #define RSND_NODE_SSIU	"rcar_sound,ssiu"
diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index c65435551283..c00c6f9f5c9d 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -1010,11 +1010,11 @@ static struct dma_chan *rsnd_ssi_dma_req(struct rsnd_dai_stream *io,
 	char *name;
 
 	/*
-	 * It should use "rcar_sound,ssiu" on DT.
-	 * But, we need to keep compatibility for old version.
+	 * It should use "rcar_sound,ssiu" (R-Car) or "ssiu" (RZ/G3E) on DT.
+	 * We need to keep compatibility for old version.
 	 *
-	 * If it has "rcar_sound.ssiu", it will be used.
-	 * If not, "rcar_sound.ssi" will be used.
+	 * If it has "rcar_sound.ssiu" or "ssiu", it will be used.
+	 * If not, "rcar_sound.ssi" or "ssi" will be used.
 	 * see
 	 *	rsnd_ssiu_dma_req()
 	 *	rsnd_dma_of_path()
diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
index f483389868d2..8fb0ec5dc791 100644
--- a/sound/soc/renesas/rcar/ssiu.c
+++ b/sound/soc/renesas/rcar/ssiu.c
@@ -401,11 +401,11 @@ static struct dma_chan *rsnd_ssiu_dma_req(struct rsnd_dai_stream *io,
 	char *name;
 
 	/*
-	 * It should use "rcar_sound,ssiu" on DT.
-	 * But, we need to keep compatibility for old version.
+	 * It should use "rcar_sound,ssiu" (R-Car) or "ssiu" (RZ/G3E) on DT.
+	 * We need to keep compatibility for old versions.
 	 *
-	 * If it has "rcar_sound.ssiu", it will be used.
-	 * If not, "rcar_sound.ssi" will be used.
+	 * If it has "rcar_sound.ssiu" or "ssiu", it will be used.
+	 * If not, "rcar_sound.ssi" or "ssi" will be used.
 	 * see
 	 *	rsnd_ssi_dma_req()
 	 *	rsnd_dma_of_path()
-- 
2.25.1


