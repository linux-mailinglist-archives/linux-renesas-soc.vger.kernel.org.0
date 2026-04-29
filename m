Return-Path: <linux-renesas-soc+bounces-31762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCFaNFw58mlopAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31762-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 19:01:16 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CC0497E28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 19:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8776A302B50D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 17:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521C940FDB6;
	Wed, 29 Apr 2026 17:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3fl2gm5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD48E40F8DA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777482025; cv=none; b=fS72gJnJuSrm56NxJoPu1M+1HtoqrSBX0gzvb9fR+zw6oy6HWEssa6o8J11nP6sdWAcVX76qCF23MVvOwC6hiDD6cEjozwQWdG8nAnThYocejofzP5zkXZZ2HUxx5MB2t6H3aqW4TdKuiklkaZwM9MJgWpXvEXyM1PX1wCuLBx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777482025; c=relaxed/simple;
	bh=+SN/B0HL5voOgs8H1z2+q5XkZCu6QjgCLQ7MpeWtcac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SjBMDOo2yZFkNLuYXfPKiEtLfufj64rO+9XmQLJVQvMjF0uz/ENSRAnnRrKVAa8tzam0uD4HSpYUr4QrLOY/nN1D5nsAEEWx+GjRHahgOqkMdruHLX7L6dcKBZ6FiutaHVQBbtDSn9iHN85Yz7HrdjbSvCeCpLe9XsqfmOZqmQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3fl2gm5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so6893745e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777482021; x=1778086821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fuDLjeXf2+QKCuCo/9df2ZiinICm/jlzSdG09cp5d58=;
        b=E3fl2gm5sYF3X6DxFMkicnZWywPsEjFJWPITZ7qQQSKqcfKMQJkzmjyVcKd2hImZ+3
         ZSAlJ7yJbcsE+27VUOK3YKO4wL76fIhOboKKy7NZFFC0iFYUw4GGfV2rfnOYGMirOgA1
         LA2SBYf+fg5hdkdLRtFgKFzTqvJEX+KTa+Md67ufG/ye9lKQ0VVJsntFEKgq/GenKwtj
         nb8Cl+6KQDMBmLHR1jJCPgApL9AeDxvRecEDJtQFC0wuqVmygNjhLKZ3p1M0w6cherCL
         ccadohMOONTpfWhnOznUTAPftG2WD27u3T3Dx9iZ6IARi0lM0gtkyMmCLzFzUNPYwadw
         XQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777482021; x=1778086821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fuDLjeXf2+QKCuCo/9df2ZiinICm/jlzSdG09cp5d58=;
        b=NW1QJzdexcqASwr+2yVFdF4tdewOIHrZnhXeZA7WvgvG4eS8VgTM3TuvjlbDqNT+VW
         jWJHdLH+tseiO08o0OIpDp0OZ5/GC90xGSwbO+1sjKFS6KVBfO0I23R6rGNRrH50UL3b
         zu0AFf60rsSg+jxnl7JT62yBAKjn1aqfuw+jAqsUIOSnbPz2E8o5ja2ABgovbnJ9ckb4
         XNdXnUfYbtNM2VgmE+7TDZQmDyXxYwpiWkLVufMSd1ocNJl2FSGuFR3CDQ5zLPGsSrU1
         ZMpsgjHxeXeXMOiBvoGX6y56QYXDch3/bGrNLaTFPqUV99P6V92qbO/FAGjFd2yzh9Af
         Gmgg==
X-Gm-Message-State: AOJu0YzrjjMYOmF5Hvf0D6LQ6Rhr7w7haohjpWgDgT4+gRO98Oi5FJRg
	ZH/S8YKmrD5uS/DhJA93oByxADkyVM9aaOWk7WtBw4yOGamaHITfW4Ty
X-Gm-Gg: AeBDiesZUB8GVlK9DcRqPsjQDsLlwugK+Q/6PV79zeYq3f/9CtYb4bHlrd7tr/oDCju
	mXuhiig/E8QtRJbzpkCxUxSAGRdUgMGS9lYIoiz9u0q+VugeRvk+KACvxA54xhtlpp4XRUNvg26
	8KthSKgFgVI+QwTTMMGaMVlRgDN3AIzjCf87qE5XtiPQKSPyy9LO9oWvTgNJP3fqEy0oRsQLA/k
	EeH9d1aBKFVG3GrttoU5SDluGTyz4ZXxGKAZs17ikGqm2vFBAKRV6yf/VpjOBBFEiADhIrpcs14
	xobkcAMAcLSFZn6RjkOEx9nJ8B3pLfL45MDZ2Lx6QskVFJbk/bzuyt1V075+kHnMXFgG7xuB9sv
	UlwjAIr/itU3r3HhdoU7n8ayYAAmBsz79xb98Wfo02L+bwe4yMx1X2Gta6YLHz7gIsWjGR4I3Y6
	Qx49mKcdFQzTuDjCsPDgUBqktK+IMzqs0Q0YcqpE/T4+MfCdwJHOv9WWJFEKt782ttdW2LZZbVD
	0Ja2/QRk7xNnMCJPts265SU9rdKR+3TkZKTP4gSwaHwgqL+
X-Received: by 2002:a05:600c:a404:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48a7bfa1982mr56450465e9.7.1777482021011;
        Wed, 29 Apr 2026 10:00:21 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:212b:3a69:4f2c:3897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm4809755e9.6.2026.04.29.10.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 10:00:20 -0700 (PDT)
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
Subject: [PATCH 2/4] drm: renesas: rz-du: Make DU reset control optional for RZ/T2H support
Date: Wed, 29 Apr 2026 18:00:10 +0100
Message-ID: <20260429170012.366537-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
X-Rspamd-Queue-Id: 70CC0497E28
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-31762-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the DU CRTC initialisation to request the reset control using
devm_reset_control_get_optional_shared(). On RZ/T2H SoCs the DU block does
not expose a reset line, and treating the reset as mandatory prevents the
driver from probing on those platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 18e2b981b691..2b772a11c7ee 100644
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


