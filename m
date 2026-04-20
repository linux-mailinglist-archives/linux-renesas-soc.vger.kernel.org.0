Return-Path: <linux-renesas-soc+bounces-31399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOSbC7UD5mnwqQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 12:45:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A59D4297D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 12:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D8023019633
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2026 10:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D6D39D6C3;
	Mon, 20 Apr 2026 10:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ApMkzdtg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8570739BFF9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 10:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776681823; cv=none; b=YvH3XzCvwieBdq65V9iLeA+qN6Vp1RvC4+nz8LsS9+GjTJZiWDXB//QfZv/ef6s3iXvfMH1M5N50scSoVti5jiHnxtc695Web9F9vIMwRKiZ1llTqXd3FXbNeUYaXzbD6r+2OniJ1N/qHwF026jJtPDq0n+RlRgvmAsLa6dAdWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776681823; c=relaxed/simple;
	bh=iqlknQ2GZm0BFaaUMkLXhS5LaHSl/PjXIMXOoaoJh8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DmpKCi4Ehy8aa4Crbfl6l2bodBWRUf2NBI9ettJO6VwqEkXDg1bv0VcqYx47duiI9rcj0CMuM3NDdjucLiRE0FmXi/wFszU5czmL/F2MEFD5szDJSwUPH+FMzYq4khlST/hf9f7riYQY8fPdcXjGJ4ZtHSltGZNyj/CBjYNf6SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ApMkzdtg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d734223e4so1924850f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Apr 2026 03:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776681820; x=1777286620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7heXUX6SKDIlQgTOyg6oxJS1gEDoX2bQYyBqPsQEUwE=;
        b=ApMkzdtgd6jq3/g9h9MaJtpAJGLAyIpMlHAT8/DkBPPyV8Tk8kSJRICwxHjV8R6uph
         w5RNEqjEUwNjrDsB/iUYVZxFAM3I1XZV/aRaD9P+E6p/KJxxZErzJ1E2xeQhQXQcVbnU
         Shj6QWsoq2daOAh4aFaxEQMRjV6UQGCPA4umOx7X/dTIRMt7asWa2nlsYFcBQihFVS6g
         kzdlXUA8yHaZmdqeBeeBstib+oM0VloKyWeD9lD+/38RnfSS21US6mY2ybeUrgnhGz7r
         JfcZ9oqPk9d79rMg4lKfYRzoH1S2uo+RVMCv5BzPdTnzUdmDf+VDogELWzgNKrMuOMBQ
         1Eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776681820; x=1777286620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7heXUX6SKDIlQgTOyg6oxJS1gEDoX2bQYyBqPsQEUwE=;
        b=WR+vs88Ox6Hs6B1FeGfxIYZUeTE/pqCYRXy17kxyp9rP4vp3AkD2N42uembNDymDMF
         COHr+oOn46TKqo/dYapUVLxRRExIng/gyTgT1xb8qzTYvKAzfV+u59FHwMN4X/pFlW07
         VRYoaGeC/EoJLQroOvfBgyPlfWecrdQeXfXTBXJ9TzAQGX4pH4huHIV/L0lI6q0stF9E
         rB41r5pgdsTdZPsuGSxZS8W97pI2l6GWScUj7trD3HalSrF8HlEwq465YNacOA0wJa51
         ViVOJZDPR3dNaI7V8fXv46IfFdB0MFeAxEz4vRAgRQF/IOTSOMq/D6P1y7JbBFMXH6Tf
         JnIw==
X-Forwarded-Encrypted: i=1; AFNElJ8DGkxm8siPYSQ8g1RUdlGw52Pr0UBr+Uro2jSMkoAF3n5T5Vg5D/F3MaWYHlh2ZrTOs6hn3R0uOPQIRVZ2evPb4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGeeynmFmQqkQnhuI9qVMj5qPEjnIr8V0pK0tlr1bA6CRpZBMc
	C7WnhsOPeFcgx9vwRILyuw6MVkjvhc+x5iT8S0YhXd5Q/6uEUrahbTUBEVuNAA==
X-Gm-Gg: AeBDieuDAKqqP+ZKmzhfeJnxr422gBg/trgO8dwOlKMhHn5ob1K2L0PH2qH62Qddyip
	kyK7UBhY2z1ftpJXCwKBjQxtcbaB8cg7gHt0k5LAGIO98zkycj2OS+glVe6EmFsyQV9BpQzIxJt
	gIOnuyEuUNS4EQ2eDd6kcxIsJOk27Q6OSniEM6hRGxfaUmD4jyk+OXanJY168WIcLhlVFBiVf5E
	2dhMr+PuXSvq99/j36k3n/z60rhl+jLECeq6+IB/t1bXLRo8eGH2Ys45ByP9GkZeQz89mfr/AyM
	4I6K1jyixcAQyX6uk8/AvjFx8fOZJsQl8cCXdnOHuVjfwkg2wNmhXd5+dm7uTUv+VwVltWutddK
	/Huj+cT/1FI7WNw3K8ZfPYmcRv89MF/GTcABUaFlH0dnMYbgy5KMNE3XAK5mdCh64o8huTTVJFJ
	nRtcvm4cQT7ynpOfWD2F9HSumpuEfJebjqrL8dze5/TP/eO0pJfHqRPP9JZok=
X-Received: by 2002:a05:6000:1866:b0:43c:f257:c706 with SMTP id ffacd0b85a97d-43fe4088c1cmr19857907f8f.23.1776681819918;
        Mon, 20 Apr 2026 03:43:39 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:5f3e:f914:6f8c:72c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4c221cdsm28038301f8f.0.2026.04.20.03.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:43:39 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v5 5/9] pwm: rzg2l-gpt: Add info variable to struct rzg2l_gpt_chip
Date: Mon, 20 Apr 2026 11:43:22 +0100
Message-ID: <20260420104332.153640-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
References: <20260420104332.153640-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31399-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6A59D4297D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Introduce struct rzg2l_gpt_info to capture SoC-specific hardware
differences, starting with the gtcr_tpcs field mask for the prescaler
bitfield in GTCR. This is needed because the RZ/G3E GPT has a 4-bit
prescaler field versus the 3-bit field on RZ/G2L.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Updated commit description.
v3->v4:
 * Dropped field_{get,prep} as mainline now support it.
 * Updated commit description.
 * Retained RZG2L_GTCR_TPCS bit definitons
 * Replaced gtcr_tpcs_mask->gtcr_tpcs
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 9e7a897a0b4d..af594c1ce536 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -90,9 +90,14 @@
 #define RZG2L_MAX_POEG_GROUPS	4
 #define RZG2L_LAST_POEG_GROUP	3
 
+struct rzg2l_gpt_info {
+	u32 gtcr_tpcs;
+};
+
 struct rzg2l_gpt_chip {
 	void __iomem *mmio;
 	struct mutex lock; /* lock to protect shared channel resources */
+	const struct rzg2l_gpt_info *info;
 	unsigned long rate_khz;
 	u32 period_ticks[RZG2L_MAX_HW_CHANNELS];
 	u32 channel_request_count[RZG2L_MAX_HW_CHANNELS];
@@ -346,7 +351,7 @@ static int rzg2l_gpt_read_waveform(struct pwm_chip *chip,
 
 	guard(mutex)(&rzg2l_gpt->lock);
 	if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, &gtcr)) {
-		wfhw->prescale = FIELD_GET(RZG2L_GTCR_TPCS, gtcr);
+		wfhw->prescale = field_get(rzg2l_gpt->info->gtcr_tpcs, gtcr);
 		wfhw->gtpr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch));
 		wfhw->gtccr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch));
 		if (wfhw->gtccr > wfhw->gtpr)
@@ -386,8 +391,8 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTUDDTYC(ch), RZG2L_GTUDDTYC_UP_COUNTING);
 
 		/* Select count clock */
-		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), RZG2L_GTCR_TPCS,
-				 FIELD_PREP(RZG2L_GTCR_TPCS, wfhw->prescale));
+		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), rzg2l_gpt->info->gtcr_tpcs,
+				 field_prep(rzg2l_gpt->info->gtcr_tpcs, wfhw->prescale));
 
 		/* Set period */
 		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTPR(ch), wfhw->gtpr);
@@ -527,6 +532,8 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	if (IS_ERR(rzg2l_gpt->mmio))
 		return PTR_ERR(rzg2l_gpt->mmio);
 
+	rzg2l_gpt->info = of_device_get_match_data(dev);
+
 	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert reset control\n");
@@ -573,8 +580,12 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rzg2l_gpt_info rzg2l_data = {
+	.gtcr_tpcs = RZG2L_GTCR_TPCS,
+};
+
 static const struct of_device_id rzg2l_gpt_of_table[] = {
-	{ .compatible = "renesas,rzg2l-gpt", },
+	{ .compatible = "renesas,rzg2l-gpt", .data = &rzg2l_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_gpt_of_table);
-- 
2.43.0


