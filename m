Return-Path: <linux-renesas-soc+bounces-32495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKU/Fw1EA2pV2QEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 17:15:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C22EA5236BF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 17:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8283730363A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2026 14:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23C43C37B3;
	Tue, 12 May 2026 14:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlotbEV5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C9F3BFAD9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 14:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596908; cv=none; b=snYTMxEaXpvh8JeEyojrrV34+Zk/1Z4kIlYnTJ/iqQ0lQLDZQ8JxHSHpPmzl/0hbcWBVldKGlxppdA1hC3SeRQpXHjPSgz9umHWvXsriIEFNrFI/H5LvDfaxXHCyArXutHXKY8tHhky7LTJnC9AeKAMrpnb8eZJMvC4KXZ6chsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596908; c=relaxed/simple;
	bh=1lqMGNoPERN45B9lFH9DjhU6xRbSqUuKRwNjquWzcus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VeWfZn8rvR0QrJIFDdmi+QuByjb1w326e6yHuEtA1CBdKQ2W66IqOaOvW3eX9T7wGY51aHLjK6JgINEVBX5eu5jeR08n/Sx7maVQuuWWvfA3NLlC+62oMbiYsliLhvB0FgxbKoAcQwO8tJwNoNwCyZ4drk5muLviOSO1XmkLrmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlotbEV5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-453903ee4adso4898228f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2026 07:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778596905; x=1779201705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXd9Im5JkcfNXeD9xdaj2wvZlrhVhMEcCS8MB51Wmes=;
        b=MlotbEV5HVPDrR3OUdyU/kRvPydNl6S7yAkXdTzbE7VIEw5wwxqb6aJ+/KFLTNtumT
         oIgOkfiZfYKx5xq/BibAQPxd4VjRDC1dVn8EIIQHYaapUUnq4KqgmSD8kxQfSTlB/mi5
         NMJc42vU0hLjGcCFuUAWiD2IteF9AtRh7vbHYFGU6Ig4TB6+5ul+tb3YT7SEU4dL2Jcq
         6CsnY0Gf5HF80D790anhWJ3Dw5+cBXceUH9765FoyHUqL/+wxscM5ZVr30KP5cs9BPUA
         w5eF0g1RFYArlvZ0YTViZ7BsnUa1Mbu5xl6/LyFFQu+s3t+C7vR9fP8f0xjHWFvcLqYh
         9NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596905; x=1779201705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hXd9Im5JkcfNXeD9xdaj2wvZlrhVhMEcCS8MB51Wmes=;
        b=e8QpoZBBzya5NXt3U11PDDEyBbbn8kJgennVXE5S7sAL7ZxSs8zEI+Hc2R9eDnmuTI
         5iuUya0nrLMkBBo1cEcnnADo1lcQvC7wlFPsRpWimR69pfVWa3OTiqR8xubigGfhVYvz
         wkEvqaDESefcwIvbEZILLDy71DHdHoLJ/ApAeAMs1t7DzWcBTJ3nVl8qn4BbvjBSr31I
         F4os9orvQ/akNhNfcmjiAHwiFuFjCHm542dyp/pVHDaf6NHZ+OCOnaFFbQQzGM/h7JbN
         sL7TdyF7qTSFydbZNLiryjzUMgUkN2t2Md6oZx0u7nbMAs28be946o60Rcxzx4Uhdo/O
         mjaA==
X-Forwarded-Encrypted: i=1; AFNElJ8JN2MUrjNr04GNQzpm9ZX5Z9br/C2Ifbo3uCTPSL5JchBh0r1rcZSqL6AiR6bKKHrBrugMVi9m95RFMvDeh+73Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtUT4sJYudkrRWl2DmL1a92fti1qj5zVaXbuTGQLLUYGo7msSO
	HajDUNOLxzMNo2vZXwE4sCPiQQZs5iTfZIBJkAWTw6GH0tEjcPH5kYfuwy60xGVe
X-Gm-Gg: Acq92OFdWZrJpHlwtnjCBFRdmIRywMfteUyS/qNGsrM2FPUQwJxixPzWl4GAmHtZm1O
	gFT7zlihdICOQ26U2DzR2Z4j+6rTe+VpnWGQ8EbQMVJdm6Tj5ZnZXAQ6p4j1EgG7O6UCAZ6miU2
	GlH0tHUiWEZzxLlc0GC5KV1sqIrE1dRHpKXRRnVFIxdnkuPOw1vi+CztwBZZPIL9I7E1NAAnX+6
	bpGoFSQTuyJz5+cLXnnskeEOYjr9YwOZGybDHQ8lqVU3j6PZgDFYFe/fxO+9osjCrAbT75bKMFL
	bByiwB5DlBWnNJE3J59cMflneMaa0jz2UJSjIAHr03BcFan6/oFpSNtNmwvZcI4Cuu2/xGMSv9D
	F+W5x11Z4j98bPtZfYhzifGf2dZsMsIyod6x64+atd2aYqSAYTQjloYkodT4Ak56agRAOuYmA+T
	qdjf51FEQjgI+47A4vn74aeYcJ9aiRFdRRuRIoYCLpv/lpvkDDdkkLjpQqMeuSE4OXbzwaHe02L
	gvZjOzmQVT1tbBjW3399utej3X4IRfVKTs=
X-Received: by 2002:a05:6000:40de:b0:43b:3b80:6776 with SMTP id ffacd0b85a97d-456a44fc269mr20806748f8f.30.1778596903537;
        Tue, 12 May 2026 07:41:43 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:77f5:545a:798:321])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491cab9c2sm34978713f8f.31.2026.05.12.07.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:41:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 5/5] drm: renesas: rz-du: Add support for RZ/T2H SoC
Date: Tue, 12 May 2026 15:41:04 +0100
Message-ID: <20260512144104.761531-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260512144104.761531-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: C22EA5236BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32495-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,ideasonboard.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,pengutronix.de,glider.be];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:mid,ideasonboard.com:email]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H (R9A09G077) SoC includes a DU with a DPI interface,
supporting resolutions up to WXGA with two RPFs for layer blending.
Unlike earlier RZ/G2L SoCs, RZ/T2H requires explicit assertion of a
DPI output-enable signal (DU_MCR0_DPI_EN) during CRTC startup.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v2->v3:
- Moved clock limits from device_info to output_routing to allow
  per-output constraints.

v1->v2:
- Added Reviewed-by tag from Laurent Pinchart.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c |  7 ++++++-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 14 ++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 10 ++++++++++
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 48065f4952a3..d0f01aa642a7 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -28,6 +28,7 @@
 #include "rzg2l_du_vsp.h"
 
 #define DU_MCR0			0x00
+#define DU_MCR0_DPI_EN		BIT(0)
 #define DU_MCR0_DI_EN		BIT(8)
 
 #define DU_DITR0		0x10
@@ -217,8 +218,12 @@ static void rzg2l_du_crtc_put(struct rzg2l_du_crtc *rcrtc)
 static void rzg2l_du_start_stop(struct rzg2l_du_crtc *rcrtc, bool start)
 {
 	struct rzg2l_du_device *rcdu = rcrtc->dev;
+	u32 val = DU_MCR0_DI_EN;
 
-	writel(start ? DU_MCR0_DI_EN : 0, rcdu->mmio + DU_MCR0);
+	if (start && rzg2l_du_has(rcdu, RZG2L_DU_FEATURE_DPIO_OE))
+		val |= DU_MCR0_DPI_EN;
+
+	writel(start ? val : 0, rcdu->mmio + DU_MCR0);
 }
 
 static void rzg2l_du_crtc_start(struct rzg2l_du_crtc *rcrtc)
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index d1bc205eb5f8..0d4021429577 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -65,10 +65,24 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	},
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g077_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+			.mode_clock_min = 5000,
+			.mode_clock_max = 100000,
+		},
+	},
+	.features = RZG2L_DU_FEATURE_DPIO_OE,
+};
+
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
+	{ .compatible = "renesas,r9a09g077-du", .data = &rzg2l_du_r9a09g077_info },
 	{ /* sentinel */ }
 };
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 307ae70dd382..2cb2d1895979 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -20,6 +20,8 @@
 struct device;
 struct drm_property;
 
+#define RZG2L_DU_FEATURE_DPIO_OE	BIT(0)	/* Has DPIO output enable control */
+
 enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
 	RZG2L_DU_OUTPUT_DPAD0,
@@ -48,10 +50,12 @@ struct rzg2l_du_output_routing {
  * struct rzg2l_du_device_info - DU model-specific information
  * @channels_mask: bit mask of available DU channels
  * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
+ * @features: device features (RZG2L_DU_FEATURE_*)
  */
 struct rzg2l_du_device_info {
 	unsigned int channels_mask;
 	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
+	unsigned int features;
 };
 
 #define RZG2L_DU_MAX_CRTCS		1
@@ -77,6 +81,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
 	return container_of(dev, struct rzg2l_du_device, ddev);
 }
 
+static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
+				unsigned int feature)
+{
+	return rcdu->info->features & feature;
+}
+
 const char *rzg2l_du_output_name(enum rzg2l_du_output output);
 
 #endif /* __RZG2L_DU_DRV_H__ */
-- 
2.54.0


