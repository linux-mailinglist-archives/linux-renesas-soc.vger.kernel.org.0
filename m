Return-Path: <linux-renesas-soc+bounces-29945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO6cHTkrvGn4twIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 17:58:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 114292CF3E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 17:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A46AF32FA8B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 16:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29F313EF0D1;
	Thu, 19 Mar 2026 16:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctTNyC5f"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212C63EE1DB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 16:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773938925; cv=none; b=i20qtKutm3dliqix4YLNGQnrOYqWekdt8FKCCAZ0P4hMQDKuCDqYTckKrtOj4SN51EnJBHn5HKY4+kOpUaO1ntQhwZtSYseNgUDi7vHZnqMSzmJvPofEQ5nHbaPTaADNp1MriJaQu0ck4ma94C6D0G2NG/GVTEizAYNGTYW6Ep4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773938925; c=relaxed/simple;
	bh=XEJxQY//7wzu4fXR+NaCWC3y47kwc0sWGgmZJ+SFGSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQw8dRVF34Aq543aGHqor3k2dZoqgVYFNlyHRp6ZcOy9eUoMexmimcJgFChTQaCS/4bKBLSx3+siYD+PAdBnkTi+hHCC3oUU5lSguiWNoZRhQrLA1zh+Y487/uDog87s2yTJ1egtfiwvhlWHbMULsjq8EDwuTwFM0gpst2wrbg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ctTNyC5f; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-486fd27754bso4357505e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 09:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773938918; x=1774543718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XyX5oy0M7FEG2yDPl7UIzv4+eTNG+m8Qc/og46NTtc=;
        b=ctTNyC5f031mM+ck55ZHEsMtSYBYgwhOEzeHSLnaGxIKTnZs33pdP0npxkjcTFMX47
         7cTBQMxNvkdZfpNk6+Euj7gewzCUdEIUjhSQotKKrsIdX6jWucqgnbFEMYCQGHDHY2bV
         S3QTvgdVEM9vaqYVZ7LeLznsQoZuAleVIwXb5KE7KJDy62z7l8FX3zXuAEWIzTGMnSY8
         TsbMUrrTsbbHGNNLdrV+I9xXpuDuf3/ESRx6ViPyxYNis1I90PS+B/nfS6OxP3msWoMl
         O4c3dmGLzGdcViWGG8p3etSkvoRS06bwfCWGhojRcZmsEK0Y8LXSp9CIupDEKSHYEijQ
         /sJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773938918; x=1774543718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3XyX5oy0M7FEG2yDPl7UIzv4+eTNG+m8Qc/og46NTtc=;
        b=E5C2Jqg1dy+GafM2pdpHYQVIc0zhsynEANfoPCeEHi6RySJAq0vgw9af6XkYm8Z+QC
         GhLQPnTY5WS0dbuNWDJizV60zKWLVWT38Xho+EpOzg/anIZN4lBUQLFjKHbDv+m+6Ugx
         DCnfsNUoy/yvG0l222jhSZEWm6cRZZtEo4kJZoIJnu4aG1+nLt02KmJ55MfTaujC7qd5
         wq0/MbHzH0xbU/IxjI84dUBTtsZMfcjB2TLCpiBIXzybaKVFa5OQNVJ3SuKXdVC7IHKT
         yhV47Px2WUeDdT8ZgyL5AVYL+bWw3QNH+xWHPPhagNjdzx6eFNth/UGCrVnIyWpEXGN6
         dSfg==
X-Forwarded-Encrypted: i=1; AJvYcCU+9u/+hMGajRzF8EDYBm7rVxTqcWzW8Lv/UpZNSdJg4/3e0WSkZ+nZdKbEYhD69gFGbx1YAJ4inRDHwhASB6bAsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwBExw/zazJxe5+bzwz4jJWU2kFSdUWeUsI5jwfEKOFcQsRojD
	TYhjn7iQHQ3EfkYkdiVILS7tp/6B5CCBfp/uyVNFL+scylmSGjaWTz9p
X-Gm-Gg: ATEYQzxS9nXayHzs9aSnYicDExUSnhf7d9UbGhDPFhywcUcBrcg2LUZ6qqmvuRqvr55
	J2Og50zlPIGa6ADQOIxMAf8SwIDMuvWPR/u1t6c9ohNmUYW1wz3iDtcxqJk3WvAPtbtvQk5/MwA
	4kjtx2yXpbkEFcWuHd7VrZ7yHd6t3TIYu1l6R/6gzI/hhKuLS5gLPQgNQ7+1lB+CB/15fbLdyP+
	jyupSs7+Wtfb7Bh018P7OeUjqClbbt0vt6N1XPbPpHIPCnc8y81rVTOo2e1Tmp3DJtCWS+GcIqe
	tZl7CrdAOdIycTTzvJjACFoa5HjfsGixgm+9B5ezBa3uY+c1MPG31Tx+X1eUIcgW/esJv24aGc0
	XuwTVIVk3AwJVmX6Trf7D90vpfwUOfdUixK/UGh+7Bkd2aFp3cr2nkGX+g3u2T+zwwaZcIR76vI
	bXSNCzk6heOWYreUMDPgw30kiOhEF28Zs=
X-Received: by 2002:a05:600c:4fcb:b0:485:3f38:3de3 with SMTP id 5b1f17b1804b1-486f44384d4mr134219545e9.3.1773938917496;
        Thu, 19 Mar 2026 09:48:37 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:8326:7b31:bf82:d2d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm5238505e9.0.2026.03.19.09.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:48:37 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Hugo Villeneuve <hugo@hugovil.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 3/4] drm: renesas: rzg2l_mipi_dsi: Fix deassert of CMN_RSTB signal
Date: Thu, 19 Mar 2026 16:48:27 +0000
Message-ID: <20260319164833.409126-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319164833.409126-1-biju.das.jz@bp.renesas.com>
References: <20260319164833.409126-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29945-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[renesas.com,hugovil.com,ideasonboard.com,ravnborg.org,lists.freedesktop.org,vger.kernel.org,glider.be,bp.renesas.com,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.843];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 114292CF3E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G2L hardware manual (Rev. 1.50, May 2025), Section 34.4.2.1,
requires deasserting the CMN_RSTB signal after setting the Link
registers. Move the reset_control_deassert() call from
rzg2l_mipi_dsi_dphy_init() to rzg2l_mipi_dsi_startup(), placing it
after the Link register writes. This reset signal is optional for
RZ/V2H SoCs, so add a NULL check. Drop the unused ret variable from
rzg2l_mipi_dsi_dphy_init().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit header and description
 * Moved the code from rzg2l_mipi_dsi_dphy_init() to rzg2l_mipi_dsi_startup()
 * Moved the check before calling reset_control_deassert(), so that it will be
   skipped for RZ/V2H SoC
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index d2da247abf05..5020be0f72ac 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -484,7 +484,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	u32 dphytim1;
 	u32 dphytim2;
 	u32 dphytim3;
-	int ret;
 
 	/* All DSI global operation timings are set with recommended setting */
 	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
@@ -524,12 +523,6 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
 	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM2, dphytim2);
 	rzg2l_mipi_dsi_phy_write(dsi, DSIDPHYTIM3, dphytim3);
 
-	ret = reset_control_deassert(dsi->rstc);
-	if (ret < 0)
-		return ret;
-
-	udelay(1);
-
 	return 0;
 }
 
@@ -809,6 +802,14 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	FIELD_MODIFY(DSISETR_MRPSZ, &dsisetr, RZG2L_DCS_BUF_SIZE);
 	rzg2l_mipi_dsi_link_write(dsi, DSISETR, dsisetr);
 
+	if (dsi->rstc) {
+		ret = reset_control_deassert(dsi->rstc);
+		if (ret < 0)
+			goto err_phy;
+
+		udelay(1);
+	}
+
 	return 0;
 
 err_phy:
-- 
2.43.0


