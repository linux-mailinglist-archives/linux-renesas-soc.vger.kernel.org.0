Return-Path: <linux-renesas-soc+bounces-20473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6045CB254FB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 23:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A4F71C833EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 21:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070812BE63A;
	Wed, 13 Aug 2025 21:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jyjkGtO3";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BhYFMZlw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7952FD7B1;
	Wed, 13 Aug 2025 21:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755119344; cv=none; b=gN+GCN1z2DO7mx9uR6V7R0ZfJVCoNNek+h7zlifFp21VomgfbcLc80zsM0Advg39zTNyp8kSxdwJElNmtq2ib+bASmZmeYb+FrzH3OvUaiAjuXgRAE1vV4V8P696ZJ34z9ucymqSjc/rTpOhsWXpMBY7cSjuyvzx5+Uo9CbD4g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755119344; c=relaxed/simple;
	bh=6/sHLc1vM08xncqo1L/xlJbUp5X1X9Xa+RNO/272Iw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KiDAdAKKmdIl7TfRCfzgcjKY3pm2DbZ15yDJltZel5ame8fDYEvubHTVI808LREFzpRzSISvJ2FocrFROkvgr3jJPxUSujUe0GG3e2NxkDHL2FppdZPAS38e3ykE8OVDWGo0tVj0HMxvVbDdq0BuxDAwEDv66XQd4SOOUW2hch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jyjkGtO3; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BhYFMZlw; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4c2Lb10xYjz9t8m;
	Wed, 13 Aug 2025 23:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755119341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EUfrWGCGD4p5G0KOP57f8prhWUk222Vzv6EEzQPIn98=;
	b=jyjkGtO3FMlWDQKquRRK5TnEz3Z9++QSMio3Wet5zLpoNfjVR3qqMHTW6pG43fV7oulnJ6
	0aIZc81/LetFpdk+iIU47X87SorE6wrSN6gJHmnrUFMtTuQ2vmesx9wkd4dd1RQAK/efAB
	2xXsqqhzxSqzQ9nMqA+fNs4KQZ9tjqtpOMn80ghZOEd18/btrIKf64pRhmKLgqCZqZzC6Z
	6sD6vQw3B/+kg6jhYi2RdIeyqMFgqtIjA9FDWZkLBWSiEKTqPa/t7qEEE97mFcWwLzvxp2
	CPVyIvSZeIPSP8InMAomWonKqD26XqfLvaZ3C1RB6QdY10qpT48Lp2vJMs40Vw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=BhYFMZlw;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755119339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EUfrWGCGD4p5G0KOP57f8prhWUk222Vzv6EEzQPIn98=;
	b=BhYFMZlwFUakbr6RRMkT93qtuJ6N+EPpwqEIbBlMtxX+oW+8bGq2sOH4ckS+vyfoTeCucI
	lr3nHsYfY7n0Zjj7yeQDC+5GKF1s+FzuhS4uWgmwTT9z9SJS4TLC4EGBF5PnO7s/RWuLXs
	nil0jYFsdEfrlA7yY/j0CMVQw+PjIHrN100KSLecQCF+c9uHUcS73uQEVqdZcN+so2dsyt
	j0T3zMPS7UL3U4+VU8vCYCjcVzHKCpY+R2wIKk/MYc9TNS9gaAQblEmu/nahaJStdw69kY
	wqI3C5H7+xAu+SLk4lmPufGk/NrrQG6OYn3XFudyuTKR5PeNKmtUGaOweUReEw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	stable@vger.kernel.org,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] drm/rcar-du: dsi: Fix 1/2/3 lane support
Date: Wed, 13 Aug 2025 23:08:13 +0200
Message-ID: <20250813210840.97621-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d02abf8b371a1b8450d
X-MBO-RS-META: 1y5d7be7378ug8qyj8gn47c1ghc9t7x5
X-Rspamd-Queue-Id: 4c2Lb10xYjz9t8m

Remove fixed PPI lane count setup. The R-Car DSI host is capable
of operating in 1..4 DSI lane mode. Remove the hard-coded 4-lane
configuration from PPI register settings and instead configure
the PPI lane count according to lane count information already
obtained by this driver instance.

Configure TXSETR register to match PPI lane count. The R-Car V4H
Reference Manual R19UH0186EJ0121 Rev.1.21 section 67.2.2.3 Tx Set
Register (TXSETR), field LANECNT description indicates that the
TXSETR register LANECNT bitfield lane count must be configured
such, that it matches lane count configuration in PPISETR register
DLEN bitfield. Make sure the LANECNT and DLEN bitfields are
configured to match.

Fixes: 155358310f01 ("drm: rcar-du: Add R-Car DSI driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Split this out of a series, update commit message, combine from
      drm/rcar-du: dsi: Remove fixed PPI lane count setup
      drm/rcar-du: dsi: Configure TXSETR register to match PPI lane count
    - add Fixes tag, CC stable
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 5 ++++-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 8 ++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 1af4c73f7a88..952c3efb74da 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -576,7 +576,10 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	udelay(10);
 	rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
 
-	ppisetr = PPISETR_DLEN_3 | PPISETR_CLEN;
+	rcar_mipi_dsi_clr(dsi, TXSETR, TXSETR_LANECNT_MASK);
+	rcar_mipi_dsi_set(dsi, TXSETR, dsi->lanes - 1);
+
+	ppisetr = ((BIT(dsi->lanes) - 1) & PPISETR_DLEN_MASK) | PPISETR_CLEN;
 	rcar_mipi_dsi_write(dsi, PPISETR, ppisetr);
 
 	rcar_mipi_dsi_set(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index a6b276f1d6ee..a54c7eb4113b 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -12,6 +12,9 @@
 #define LINKSR_LPBUSY			(1 << 1)
 #define LINKSR_HSBUSY			(1 << 0)
 
+#define TXSETR				0x100
+#define TXSETR_LANECNT_MASK		(0x3 << 0)
+
 /*
  * Video Mode Register
  */
@@ -80,10 +83,7 @@
  * PHY-Protocol Interface (PPI) Registers
  */
 #define PPISETR				0x700
-#define PPISETR_DLEN_0			(0x1 << 0)
-#define PPISETR_DLEN_1			(0x3 << 0)
-#define PPISETR_DLEN_2			(0x7 << 0)
-#define PPISETR_DLEN_3			(0xf << 0)
+#define PPISETR_DLEN_MASK		(0xf << 0)
 #define PPISETR_CLEN			(1 << 8)
 
 #define PPICLCR				0x710
-- 
2.47.2


