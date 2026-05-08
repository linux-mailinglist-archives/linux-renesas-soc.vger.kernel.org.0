Return-Path: <linux-renesas-soc+bounces-32283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBt6DHHG/WkpigAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 13:18:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A73844F5993
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 13:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13E983036E8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 11:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874AC39478D;
	Fri,  8 May 2026 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuLr2mqE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA02395D9F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 11:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239077; cv=none; b=ryXJg7AghZf3UlCWKGVWsBBq1LiFnp2p7t9MRZhPCg+DKsGAupX9y8LwpdAbmh0Pq8UTZhPc9SUg6vRe+YmCt9iFs8mc/iWfdipvyCk8XGEduN9tGoIipHOfhRVdW1WLOMI1NAbrc4Y5X3FY7Mf4SZPesBFRD1CqZns/dIVdwrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239077; c=relaxed/simple;
	bh=+TSTHFtFLuuB6HazSo0/aJnEWaGHqLHJYHChrI/1coE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kr2gJXNewyJeE57FahyopMbesTCf3HbfaYDGMQoIoSAq31ztp3uLOkMunWU9650gf7NuvST7BvQp3cz9JL9vIXc5IKu0yOrUT1ng7y2AGzzkMsRNrVVyQq85pacJZaiziTnl3Q0Ux1GEhxLver6pBS/h2oY14zBRc/SXY7FlbJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuLr2mqE; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d64313c39so1456989f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 04:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778239072; x=1778843872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPP4JL0RAe1XpX/h7T3lnNJ3/faSIVf5jmqwVJovOao=;
        b=TuLr2mqEK5CMwdN9VxUdr7QC2X8UiW0YDiE694TysVE5MOSfn+4KL35gbMZqNmj9rb
         xU8rAVo31irnv4H1Ob/68w2i8V9KpW1fAsuMnv2cyRPMhxpBmSVaDTcBLa0MdEGIyqZl
         fg66dmCz3CHHjzF57aXATYKg2u+5tw3gWqx5p6GGA7PoTE5ei0xfYHYbyzZseXRaDJdV
         Sx51t0z5cj3ZPwbPZOaCJH9fM2Po/KmP5IaG7o5gnJy6l0BSWqiNf/HmbKk5Y8IiTujH
         SE3kjrRX+gS9IU5+8kKY7oyQVdO4Ysvkl9LTnbrZGe661BVKh1eLEd6qA8K9fZ/eiK9o
         cIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239072; x=1778843872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yPP4JL0RAe1XpX/h7T3lnNJ3/faSIVf5jmqwVJovOao=;
        b=rrTzEHGIo0RiZvVhDWVBnuf8jvUdXfBSK2gXT9XAIbGNf6OdaGR10vRDJqX1VqStYf
         w1Htwag4FLkGAeT60ZRC77FfLGjdvSN48cqeqTPx8BZUO4lpH+fcVms3azTuc7eyyqFd
         KY++UMDnBMSZLHwdg8LRtdfWR1WQ/QCnkU6IZ3hdKYm6KnEC83YuP7iLeRq8g2RmaKGk
         53MQuAjSTQXfc9BZIrl2mwfCPHUTibOH++UTDYxwvDbXxEkaePbD1rZ5pv8kqp07Un4v
         3x+2FpUpSxPM3tTvSZnlbGOwta5gdiidwlx0d1pkPovffZXyUaLPz0PfjqR6PRKfQX9i
         pxIg==
X-Forwarded-Encrypted: i=1; AFNElJ+xF23jVYKCsWvxi7QDgAww9DgVnr8TRug9VJtlt7YVHz9+XCHU2PQlnxZnCYpnpz/jUzZcbCvyxBmhvjoDxGvY/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSoSKv9Gro9r31OUdAuoEsqLDoQHyZUSblISrWSk4MbvuaC0Ka
	9/9iCVjs2bNszrHeP7ay/YMrDlnNLL4QkpXzGmyyOS/pOmGrJS6jwD1a
X-Gm-Gg: Acq92OE53X5tHX6fN/NQzsB87n0n9lc4GdRACZvujbAYCawh7zvutiKgdgYz16nCZgC
	XOfZSS2APn3cea/74/PmsBQ156IWhZz2ahpepIA10S4fJPMbWNu8QvHPMDlppKy1lfrwByFsXtX
	YR6G7efqgT8UrUEoZdQ7tlr+LZqPFjIB8Y2NjPaNuFSgLAxwgjaAdjTvGNXAwz8Axf09uqqZoek
	/pBXFouIE3yhb8nrWka+p/2p/kuDjEJKbXiJHjZrCXA4rL1CxzhRxYYvgDhjrsiTE1dozFNXSAP
	VqxrI9iGXAdzKZeqYGS+wN7n0vPAV/Gpelk7YvLsv5MMu7msYj5ogj73ZxZcM9kyfzc1bNfG/E7
	F+FqnImD+heJiHpvh0McbzJGPWhmGPjWmby3iXJw633QA9Al7VlILLpd6Nas5UrClC/TAb9B7Uy
	S2FMEGl12jTOGaC5VYgiNPTgzgwo5fc1VQ2UBxMMiQ3L8b+cFFDlnOy0CCsikEK9Q9e7OcSkTSE
	QMYOBr5NvQE0Do8B8eizgdt7ohT1i1RlFcglw==
X-Received: by 2002:a05:6000:1868:b0:44f:da54:da6c with SMTP id ffacd0b85a97d-4515ce1c84emr20981373f8f.26.1778239071736;
        Fri, 08 May 2026 04:17:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:74ae:919a:e57c:bd9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454916df968sm3535563f8f.25.2026.05.08.04.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:17:51 -0700 (PDT)
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
Subject: [PATCH v2 3/4] drm: renesas: rz-du: Move mode_valid logic to per-SoC clock limits
Date: Fri,  8 May 2026 12:17:43 +0100
Message-ID: <20260508111744.771659-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508111744.771659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260508111744.771659-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A73844F5993
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32283-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Action: no action

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
v1->v2:
- Dropped storing info pointer in struct rzg2l_du_encoder as it's not needed.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c     | 2 ++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h     | 4 ++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c | 6 +++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

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
index 0e567b57a408..5c672549bc84 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c
@@ -50,8 +50,12 @@ rzg2l_du_encoder_mode_valid(struct drm_encoder *encoder,
 			    const struct drm_display_mode *mode)
 {
 	struct rzg2l_du_encoder *renc = to_rzg2l_encoder(encoder);
+	struct rzg2l_du_device *rcdu = to_rzg2l_du_device(renc->base.dev);
+	const struct rzg2l_du_device_info *info = rcdu->info;
 
-	if (renc->output == RZG2L_DU_OUTPUT_DPAD0 && mode->clock > 83500)
+	if (info->mode_clock_min && mode->clock < info->mode_clock_min)
+		return MODE_CLOCK_LOW;
+	if (info->mode_clock_max && mode->clock > info->mode_clock_max)
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
-- 
2.54.0


