Return-Path: <linux-renesas-soc+bounces-31763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJAMMUY58mlGpAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31763-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 19:00:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9556497E06
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 19:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 00D133009E3E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 17:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D30A40F8D7;
	Wed, 29 Apr 2026 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJNmMTCI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA09035AC0C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 17:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482026; cv=none; b=IV+vGkUQaYL2yG9SdbUyjgGl2dKbH4QyJOkpRj1OipDc1kf7G3HAVdFm0fhAy9+X2nXzLzJFZ17VwsG9PP7KE3onJCK7m/AIr+dasDcIojTK6XGQVYo2CYqDsEpepTrvbwyU+eQag4QS+2ad/5WISlXzEjN3d9HxG67ypl0r2/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482026; c=relaxed/simple;
	bh=yIk8w/6ovoyQObDFMXFGLfwUhPrGI/MFA3yvbYHUlog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVLUA20hQ/kvsV3q8iwN71058NJgN7txYeJaM+mWAZ9iDx8MLsOFtvCs4Lg13hXP0pGfCxqF6hCYsUQzwJFz4B72YXyhJbi18ZZcrnyUMkGWEJqFbwRHmerbduikPjRMPgQ55JfLpTKLynjWOjESgWt6PBgLUEOzWYqQG8kUSrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJNmMTCI; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso3260645e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777482022; x=1778086822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPI/IWDY5AjEaKDZ824ZagzMhOb02JbM6Y93TiTFTTk=;
        b=rJNmMTCIlWFV5KcjKIIohZ8/u6WLS+TaRYXxSSnjwbs3SHWxIH53L0V2QGBizffXeQ
         RemIvA++QaxGcUd9zpSvFLQqhwzf68rb/V77T1eWS3mgDb7c/nmEcFiZXKUA93e7IF1w
         BVq4ANyd8BLzqth38YhpxAZVRCOgFUdw0rZoeqysjDjO5AjMGeNu4x9vUq1mCZyRH/Ie
         olMqbYkep7Wx6uQBoxZREiXhLazUboFs/+9Vf30XvNxk5KjZznhOdVW40XW4s2ER3siE
         VkKHTOHA2VZH3icPbUq9U9sBZfkFPN/YfPejJRylP+k83qf6NorY1/niWyhl381H/9zs
         QwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482022; x=1778086822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OPI/IWDY5AjEaKDZ824ZagzMhOb02JbM6Y93TiTFTTk=;
        b=ctHfuQy5JxR7P92qHj8NHzy5VfLppz1Ch6O3Hdcp7kBH2rtT5LA6rz+GBepNHtx49R
         XNRrYV6llgsax+VGEaqOZQTKUPkehiZEnv4OfkCBrc4v+Ot4SGkUX6FN/+5uWbx7Xr59
         xo3L1VyFi/WLIwKulPItfZiaAa/LRXPoj5HsLN8YqdkGZOS1+n/iQHXwOO+LOq4x2HzP
         pe37A0fhfwhJZ2J1Ff4ZR/VJBnmpYeekCV0ue+sW8V3T9gMBK9s91d52omohLVPDZ9GV
         NVx+EdqEcIfnYb6eFstg3TnS3taiHWiy/F1Qj/xF/Ow58MHG8Gl5+kBFOkP0G/Sk66dW
         TkhA==
X-Gm-Message-State: AOJu0Yy/mn3Tleu8TBiCu8QnThL58+gNZ4V7IU2MwdwF5VX45xcnBGDc
	/O6XSymkfCv33aq7tKuwexXmaQaPY2rprsMcJEKvn85F83/qzURdpdwm
X-Gm-Gg: AeBDievoG7lJqGZ4GJqLZ3R5W3jb/MfK+iYfr7XeXf8jfArt9DU9pG8h06RqpHrGA8L
	7HlbLlSP2HKMW9HXkBN3QEXll07iNUsymnxi1Es/ASKiwP5Dq8K+FmzuofgHJTlySy5KTZjJ+AV
	XREUGg0t87nubGWx10Q6FaaaGgShXhJ9oy1Zit+R2ZPh1nUJrd0R1pKJWrmYuuqQNwHLuqRLBa4
	9WRKPQobZ6CE5uKvq69wHNx8WbBqdaGntd8pNnVJRUbp5U/hs2tlzKtmf7ElPEAiG8hK/pLkZBo
	5PBEQ/KbCIPme7WMSPPnqya0yYuDNi/ync7BfbY0944A0khL+mRdPpD1PSyBK/R+9wma9NnG4dT
	TtFOYns0SeiMiRct3+7cxlgRAjV8j3saVhdt96E22ifNrQyoa5VczaupC2vKmVCO7d4a/3hReg6
	h7ybBKP5vylFJrRN7A+C8rD5Z9NjvLgRMmQ+H2C0dzbxV9HRl/MvwT99Tc9gSjapmkUIMW9rVYy
	gcXX70G9EOgLm22U9vccizVGlOXr7K7+CnYTs/PyEIM4unn
X-Received: by 2002:a05:600c:b90:b0:489:1e8a:90b4 with SMTP id 5b1f17b1804b1-48a7b53ca8fmr80064815e9.21.1777482021927;
        Wed, 29 Apr 2026 10:00:21 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:212b:3a69:4f2c:3897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm4809755e9.6.2026.04.29.10.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:00:21 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] drm: renesas: rz-du: Move mode_valid logic to per-SoC clock limits
Date: Wed, 29 Apr 2026 18:00:11 +0100
Message-ID: <20260429170012.366537-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260429170012.366537-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D9556497E06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31763-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,pengutronix.de,glider.be,ideasonboard.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move pixel clock validation from a fixed encoder check to per SoC
constraints stored in rzg2l_du_device_info.

Pixel clock limits differ across SoCs in the RZ DU family and cannot be
expressed by a single shared rule. For example, RZ/G2UL (R9A07G043U)
limits the DPAD0 pixel clock to 83.5 MHz, while other SoCs such as
RZ/T2H require a wider operating range.

Add mode_clock_min and mode_clock_max fields to rzg2l_du_device_info to
describe the supported pixel clock range for each SoC. Update
rzg2l_du_encoder_mode_valid() to return MODE_CLOCK_LOW when the pixel
clock falls below mode_clock_min and MODE_CLOCK_HIGH when it exceeds
mode_clock_max.

Set the pixel clock limits for RZ/G2UL(R9A07G043U) to 20.875MHz minimum
and 83.5MHz maximum.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 2 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 6 +++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h | 2 ++
 4 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 0fef33a5a089..3b7162c6e1f4 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -35,6 +35,8 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g043u_info = {
 			.port = 0,
 		},
 	},
+	.mode_clock_min = 20875,
+	.mode_clock_max = 83500,
 };
 
 static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 58806c2a8f2b..885558eb9547 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -44,10 +44,14 @@ struct rzg2l_du_output_routing {
  * struct rzg2l_du_device_info - DU model-specific information
  * @channels_mask: bit mask of available DU channels
  * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
+ * @mode_clock_min: minimum pixel clock in kHz
+ * @mode_clock_max: maximum pixel clock in kHz
  */
 struct rzg2l_du_device_info {
 	unsigned int channels_mask;
 	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
+	u32 mode_clock_min;
+	u32 mode_clock_max;
 };
 
 #define RZG2L_DU_MAX_CRTCS		1
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
index d53068733c66..ad02efec1c23 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -50,8 +50,11 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct rzg2l_du_encoder *renc = to_rzg2l_encoder(encoder);
+	const struct rzg2l_du_device_info *info = renc->info;
 
-	if (renc->output == RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83500)
+	if (info->mode_clock_min && mode->clock < info->mode_clock_min)
+		return MODE_CLOCK_LOW;
+	if (info->mode_clock_max && mode->clock > info->mode_clock_max)
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
@@ -107,6 +110,7 @@ int rzg2l_du_encoder_init(struct rzg2l_du_device  *rcdu,
 	if (IS_ERR(renc))
 		return PTR_ERR(renc);
 
+	renc->info = rcdu->info;
 	renc->output = output;
 	drm_encoder_helper_add(&renc->base, &rzg2l_du_encoder_helper_funcs);
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
index 3e430c1f6132..39a1d178b856 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.h
@@ -14,10 +14,12 @@
 #include <linux/container_of.h>
 
 struct rzg2l_du_device;
+struct rzg2l_du_device_info;
 
 struct rzg2l_du_encoder {
 	struct drm_encoder base;
 	enum rzg2l_du_output output;
+	const struct rzg2l_du_device_info *info;
 };
 
 static inline struct rzg2l_du_encoder *to_rzg2l_encoder(struct drm_encoder *e)
-- 
2.54.0


