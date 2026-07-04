Return-Path: <linux-renesas-soc+bounces-34694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ++r6CFnUSGpKuQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:37:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3FE7074A4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:37:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=HWLFsU4u;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34694-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DD00303E4E2
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 09:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA503A71B6;
	Sat,  4 Jul 2026 09:34:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C690B3A7D91
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157683; cv=none; b=vCO4KtF3j5v9wzUcD/SkVkKyohRn2XOI2WOLnmQo91we+zp46wNV8UFSnQMw7P/85iuHNSCbBCjqNk8y/Cg8WyoFZQyC1IHeWOE/oNJiON8VRWc+IwCIG84b3+VN6enHzH/+Fp4zWNZEW+WhuUlBwI5GACu4ijuAVy4MLtO8EB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157683; c=relaxed/simple;
	bh=INRbN/8w1SssboBohoUBHq8fejcG/cD0KDf/9S7KnwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3JEnGzVr00qXxhG9MdzvdgMv+Ro49XjpTv1sJdBeeu/8nHcLJGG1zA4C+CI1ObOCAldZ7rwVCZjHWkgTRfa/9fV2q68rbFFYgA5fFp6sbEpgy58tQcwXFKh5Jw2UAt6eby/HqLuBNGKxY8ZdLCOrefEKDFHdQtezxGJFdzeVUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWLFsU4u; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b7612475so12134455e9.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157680; x=1783762480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lk8KeGaS2vzt489ufFaIFCKPfsezxcRXdkgdO6L6HpI=;
        b=HWLFsU4uBtrPOfFF9a2abUqNoHYsE/n3hA0Ez2gQQAwAgIygJHpuDqoY+5+4aai73z
         k17Fi29xwplAhcFMyjuWyovGj/Ir7ytZ5KiSXagr3LCAkr70ioTGHMQ5a60VRtxCx2jg
         SxbqH1EPi0NTylacDbRPt/vZkgdB5aLuSxE253vMKMkDUsS9LDn7W/8KbpSaMpZleABs
         gyeSGw9eAC8L10Sqbkxc0PllBTR06V/ONxokfBsrI1t02796d9G5FLIepDHRnWaEm0ZF
         cRSCl/0TN60kGDjsb9D9gWPrDIkEq/+QcM7v8Kn+WONF1aaefpUY89Efl9JYMP0KscxI
         /Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157680; x=1783762480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lk8KeGaS2vzt489ufFaIFCKPfsezxcRXdkgdO6L6HpI=;
        b=TL8uxJ4CXZFsgPUzx0Khk3MUJ51/fCJHOUwyLYWhKE61kTVwWFLtFGE5ACIQkTfPxK
         uZA2FTdaIGC1CWFkaz+7gcN/yWtxnb/K7HEzZ8yMq7XCX+Dh64vNo1rClazjXWWUbgVp
         jYRRnEv8iHD9Qo015ZHg2rAp+jclmF/qIQYfgSTKzLXuBvDZNXvPiTqTqcg7LHOp0Thf
         C4mq2Nu+VRouMCiipHhfLK87FxD/wdIORHRBcyARG3W0HmgAHHkP7qGt1Q4tgF9fsK+q
         p5ax9BWlm/xZme53DY5oQaGBONDRn4oi1J6qGOP/OJ9JklvZ5WX8SWt3/bQrNrvcI24y
         fY9A==
X-Forwarded-Encrypted: i=1; AFNElJ+UXjxSC/qTiL66uQQN2stjZ1BkjmRuhQyhwVQgd5hBf2cT3PZlxsv4was7pYFAlHGIJ1CO5FLcxzauRkpejgzsYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGWEVbE5X3dbiyZr9rrBSaPtThtKB7W04e/23zTM9l1VwxM45y
	YmNJ9OLdZSjqibWLc4CkC+vfooILnBCIRPeaw76SBaFbnUdSmyb7lewn
X-Gm-Gg: AfdE7cmG2lJVWlloghFjD5G930/d6r9kwvVsGd0gmVWEwKJN+jACxE0AKnlM0g6SvCK
	d7HI23UU4Pkg8hqLe8F69vGiXlj//31G4Z6GZciz3wvQbd0zbD5UhkvGSuNKudToxFgaVy44eI+
	Weat6CRLg7PvcmD8+fyFs9QEqMTNpkSoiR4376Kp8WBR+4tDM7a5HYsenUw/MS9iSDi2RYgSiYP
	ddFG3tpXhe+YL+9Q5pyRrbwhJpiccCfqxppx0IRb0xt5cG61ncnHQdQESUoI5ka322lwUZpLR0f
	CIllxNjzIQwxvKXanSrCVwO0su5XPAblqqyO9tghk2PcDWHzgdCQjIJfBIQ+olx7MsC7sLhA3rj
	B9RrIROSnWI9gwhQF9raTx90SyjWNPkblq540MarZJANWtDTNn3I3Xq1QZpTpi1/8WWoxV5rfxi
	NIt5B0/R4z1BU4zNJzGe+8
X-Received: by 2002:a05:600c:6098:b0:493:ba69:4d67 with SMTP id 5b1f17b1804b1-493d11d6759mr30325455e9.12.1783157680272;
        Sat, 04 Jul 2026 02:34:40 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 08/16] drm: renesas: rz-du: Add RZ/G3L (R9A08G046) DU support
Date: Sat,  4 Jul 2026 10:34:18 +0100
Message-ID: <20260704093433.273672-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_TO(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34694-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:dri-devel@lists.freedesktop.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,bp.renesas.com,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F3FE7074A4

From: Biju Das <biju.das.jz@bp.renesas.com>

Add Display Unit support for the Renesas RZ/G3L SoC (R9A08G046). It is
similar to the one found on RZ/G2L, but has LVDS support.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 22 ++++++++++++++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  |  4 ++++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c  |  4 ++++
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.h  |  1 +
 4 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 3d13f61d3c97..a8d841421a0b 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -55,6 +55,24 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	.mode_clock_max = 83500,
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a08g046_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 1,
+		},
+		[RZG2L_DU_OUTPUT_LVDS0] = {
+			.possible_outputs = BIT(0),
+			.port = 2,
+		},
+	},
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	.channels_mask = BIT(0),
 	.routes = {
@@ -81,6 +99,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g077_info = {
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a08g046-du", .data = &rzg2l_du_r9a08g046_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ .compatible = "renesas,r9a09g077-du", .data = &rzg2l_du_r9a09g077_info },
 	{ /* sentinel */ }
@@ -92,7 +111,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
 {
 	static const char * const names[] = {
 		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
-		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
+		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0",
+		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0"
 	};
 
 	if (output >= ARRAY_SIZE(names))
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index baf076d69cda..0b86c5a01210 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -21,10 +21,12 @@ struct device;
 struct drm_property;
 
 #define RZG2L_DU_FEATURE_DPIO_OE	BIT(0)	/* Has DPIO output enable control */
+#define RZG2L_DU_FEATURE_SMUX2_DSI_CLK	BIT(1)	/* Per output mux */
 
 enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
 	RZG2L_DU_OUTPUT_DPAD0,
+	RZG2L_DU_OUTPUT_LVDS0,
 	RZG2L_DU_OUTPUT_MAX,
 };
 
@@ -61,6 +63,7 @@ struct rzg2l_du_device_info {
 #define RZG2L_DU_MAX_CRTCS		1
 #define RZG2L_DU_MAX_VSPS		1
 #define RZG2L_DU_MAX_DSI		1
+#define RZG2L_DU_MAX_LVDS		1
 
 struct rzg2l_du_device {
 	struct device *dev;
@@ -74,6 +77,7 @@ struct rzg2l_du_device {
 	unsigned int num_crtcs;
 
 	struct rzg2l_du_vsp vsps[RZG2L_DU_MAX_VSPS];
+	struct drm_bridge *lvds[RZG2L_DU_MAX_LVDS];
 };
 
 static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index f50d166b764f..7315d437c2ea 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -105,6 +105,9 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 			return -EPROBE_DEFER;
 	}
 
+	if (output == RZG2L_DU_OUTPUT_LVDS0)
+		rcdu->lvds[output - RZG2L_DU_OUTPUT_LVDS0] = bridge;
+
 	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %s\n",
 		enc_node, rzg2l_du_output_name(output));
 
@@ -115,6 +118,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 		return PTR_ERR(renc);
 
 	renc->output = output;
+	renc->rcdu = rcdu;
 	drm_encoder_helper_add(&renc->base, &rzg2l_du_encoder_helper_funcs);
 
 	/* Attach the bridge to the encoder. */
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
index 3e430c1f6132..8b048ca508be 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
@@ -17,6 +17,7 @@ struct rzg2l_du_device;
 
 struct rzg2l_du_encoder {
 	struct drm_encoder base;
+	struct rzg2l_du_device *rcdu;
 	enum rzg2l_du_output output;
 };
 
-- 
2.43.0


