Return-Path: <linux-renesas-soc+bounces-32282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELyOO2rG/Wn2iwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32282-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 13:18:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D2C4F5975
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 13:18:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93930303BB86
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 11:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689C0397E73;
	Fri,  8 May 2026 11:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITVf5MUF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561ED39447C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778239076; cv=none; b=QuxIqBtN0CW0t4kJlBidgmYwX/SJKAVYymk2G8gNOuT/QR2+4bzVskGxEqNS6gKdzxk2JhagyxdYHjyEikLEXiIOGaLJgds7LxvwzvtnB89Iv4LSiYVH5QH7A9kQOUgFhkPZrZHtUBR3kd/A8y40UB8FO1kH0HfE2xXAS0OoC9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778239076; c=relaxed/simple;
	bh=C7OdMfskX1yrAh3+I7YrVhMxB61DSFtW1LvR/WZMIrs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HL6JapyBqKPGDlAAd/ygdqEjctF+wW9dBONAGPyfiMGHz9xA66D+x8pVmJPTqMJjIiUSrmATZiIG0qffq6JMtsM1EZgNG7eSrh8aHLK0vd0Lmn359jbUvKP0gxP+jxYltq1bMWpgYWZN3LYLtmz+DnEA3ouP5MPtGNxCXzZrqDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITVf5MUF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso1096140f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 04:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778239071; x=1778843871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39w49gZKpFRzhgKjJD0rTXzt/7rwWxh4HEQyrYnkNBo=;
        b=ITVf5MUFk40pa11mzI8mybuavlrncSTBVb+JMrRh9ybkpSXDKzIJhJpZ4pkP0b8vqy
         rbt+duMoCMr4Z1xrYmcCKcLMV18jsJa2C/cRHFsIDfIN+lwtOoyZfRYuRqqHpOtGBBQm
         nlSFJlYK5T50Z0HMY9ldQglgLLH/fd+td6DnWtmJduqOazNHl5nFk5jo2+K3XYTJQfKp
         EqcrGo75KO264I9OQWwchX0pFrIi5sd7p3na8T3mm9pK7PG7X7P5M8Bhg1R6+BvAfPj9
         V+PV3JqwtE6dSEv1Ahf+R6npYO3n+T20dekyW/MmX28/NVgh29mL6WdMxmCzJ42EhqEb
         4vWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778239071; x=1778843871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=39w49gZKpFRzhgKjJD0rTXzt/7rwWxh4HEQyrYnkNBo=;
        b=pifPB0voLptb1gH3CKTEj7/Dbqxgx9/bRLUWEYipRvmYwSCc/LYl/GApPJnNS9jx+w
         kGdHHVdXnvjfKFKxEjKPspjAWvfONCBRBEzbH3Z4mdolBMt4bIz5TGLWZ4YsT3CgQy25
         XDBPDM3wzLA9bTKWzY88SaIDeyg4Zi1fhqps3h0yXtDfpAhw1aDfRyoeFRCsJwK91zOS
         2Npz453WH9gyqfoxvmqSw/10QCev/cHjJfrUA7SxxgQwrIDkW7l/ii9xCA9jx4gYFhVH
         i7I0oNGVrCXBqC+NQ1CRGXAuQH1JO8GerkQi8ghoOPRRAMxSU0GUjn9WRoEaLxmXhS81
         89ZA==
X-Forwarded-Encrypted: i=1; AFNElJ8xiNrtAUiW+isCqUcVFJrx84aGBePMLLXwPysGc1vsSGonFYDAGrqgP4BQi0fM/flnkeEnZv4tge8uayq7dWLqlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YziVCmO3UvWSGcI0FWQn1O+vVV6ZJTBKV1yZK2F6mRnjC9DhM3e
	XerWtJcM3TFfwiAfipap9KkAdcFTDEGjC97G3tgGSez2pxLMGyI4+UPr
X-Gm-Gg: Acq92OGTD9vzLxhMGIT6oJ0TTCD3FFH7as6+ow53JEIlOkfzVkPGOM44dZAINDkxeEl
	/nwSIl9u5OxgN6sskahh0SM1YVrWkwnkUVAS/F3i7UyfQBa/JfpuQFRQurTnc6VP3PQ/k5f0lPs
	BHgIatljLg4eWAkheh6VkVtp+u74fj4dq2uSk741pwzG0HQTkl7FuB4h0b/QLg2rxFrvpz3QFvV
	7j3F7XL8MOZJgHmMAFI/8apoMH4fZWj9EO1n8NxA3fApdZqGaV85Bqy2Mi7NlW233sm56YEi3Rg
	SM8JyyOssjBO5w1cKVWXm3FkJyiWV8mDD6Yj4rNpytOgZu0VvosV36z1gr6fe5/iMRv/BYSffd3
	KH68WFvBNcuaoOWaqKwbY68nEmxMJh/OfZ+JPbajHNHqMLaq73cCL+GKTq+8BlOlBFdFlECSSgj
	bI1HpS3woc7Unjl/38UlZYOf0TWskhuwwCo+JNjxXhdt/lp73dCtFiYepg0XAvifwsn39A+TQLx
	urD5N5S7yOT4WxwCVkNYsK4c7e7ubDHOaKJmOkwwlD6Ze78
X-Received: by 2002:a05:6000:40c7:b0:448:7420:9ada with SMTP id ffacd0b85a97d-4515b0570fcmr17977390f8f.9.1778239070587;
        Fri, 08 May 2026 04:17:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:74ae:919a:e57c:bd9c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454916df968sm3535563f8f.25.2026.05.08.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:17:50 -0700 (PDT)
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
Subject: [PATCH v2 2/4] drm: renesas: rz-du: Make DU reset control optional for RZ/T2H support
Date: Fri,  8 May 2026 12:17:42 +0100
Message-ID: <20260508111744.771659-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
X-Rspamd-Queue-Id: A8D2C4F5975
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
	TAGGED_FROM(0.00)[bounces-32282-lists,linux-renesas-soc=lfdr.de];
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

Update the DU CRTC initialisation to request the reset control using
devm_reset_control_get_optional_shared(). On RZ/T2H SoCs the DU block does
not expose a reset line, and treating the reset as mandatory prevents the
driver from probing on those platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v1->v2:
- Added Reviewed-by tag from Laurent Pinchart.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 26b95153ce88..48065f4952a3 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -380,7 +380,7 @@ int rzg2l_du_crtc_create(struct rzg2l_du_device *rcdu)
 	struct drm_plane *primary;
 	int ret;
 
-	rcrtc->rstc = devm_reset_control_get_shared(rcdu->dev, NULL);
+	rcrtc->rstc = devm_reset_control_get_optional_shared(rcdu->dev, NULL);
 	if (IS_ERR(rcrtc->rstc)) {
 		dev_err(rcdu->dev, "can't get cpg reset\n");
 		return PTR_ERR(rcrtc->rstc);
-- 
2.54.0


