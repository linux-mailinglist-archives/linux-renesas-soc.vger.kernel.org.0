Return-Path: <linux-renesas-soc+bounces-17945-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 836DEAD129A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Jun 2025 16:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0435A169F8A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Jun 2025 14:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC5924DCE6;
	Sun,  8 Jun 2025 14:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fhj8xEOy";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZdguGhY1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C576B24EA9D
	for <linux-renesas-soc@vger.kernel.org>; Sun,  8 Jun 2025 14:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749392883; cv=none; b=HgRtGahe5/mxgnddQW7ZdMoeCCibWN3qo6u0bO9xAEDiKAgo3ow1Fz76pTjBTvjFGVteZUmW4GWEEmc6P2NSI65qeJ++ZEky2nssy8mgWe3si/ug5VpRav5NvsfjtA4jMHOm4E+20ylK82yq83Dx0UL50to2MsMRXVxMYzQvE24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749392883; c=relaxed/simple;
	bh=0VyCSfXIxYI/+3ACHlZCnpJhdAWYMesWf63X4F7Hv5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghUx7loCJ91csOO696JrUMD27sjloSPH+KcQcXM9RjozyNcJzTqRiyP3rwlMDTdCHa9RyLmud5i85cmfi+Bh/gqgYENPBGVeuNVTwE1HfU5FuwhV2RQwikTGicXeZO06N/yqubodKZwp7nLJosBuZxkjgcJ2mntRKmHQdwhKzyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fhj8xEOy; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZdguGhY1; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bFcpj5Cr5z9sR8;
	Sun,  8 Jun 2025 16:27:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749392877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9WGMKmeZ7uwuiZQUk9mOsxyTgNCnRjemppawLl5SYQ=;
	b=fhj8xEOyOLjdNmTbRVW6FI3KEFSIYGmeNP8sNiWlaFZbN/mRt41kWNWii29Ez+GLEJM3Up
	zqnVyXiW66oJb8rD9evk1LDOg6+pY6yWDbYSbNZ/hZeBrR/2C60cXxOcKDHUWWKdkMrsx9
	Q4X2BSYfUdP0Ts8mwXm0YlFuWYhm6MgfITO62gL6V8T0IFl6HJh9wMs7CGnYeaTVBExJ8k
	aMzsfMZlBh2mxu3v/iqfYhDKmO6ftUyPATDLXGR2fykg8JcaQxp5Ae09AXzE5bQHAX1MUC
	bY2TFwAWgkkR7IBBmVUxZFflna0Wnv1ziamnGGXol8G4I39xUE+zNmkCramOww==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749392875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I9WGMKmeZ7uwuiZQUk9mOsxyTgNCnRjemppawLl5SYQ=;
	b=ZdguGhY1ywlltEhlgtmRiASC+XBe2TbA6BCrzGmLoSNOBe6/mGJqZoORq1Qw+ZKnulUQkc
	QVpkxNjC0gmhcbDqFhgW1XGvUnxXCTU0P1tjJjgwrVenQUFjZyNYWvL6v8lvrSsvx23MK/
	G8YxM6XrkqUugvtxOwNHSrlg9eVK62aYQsxRLGQ+NgvzgAKl1+k+ksFvFFeBgJSEIxvEQo
	jsdlmzvuOoBLdPpIKk5WS/k8ioNY/at+MHCpxHdsiWUTFCAoVp+vigHyz3nxXwGO+gnoy5
	Cn2oIg/woN+q2YRMKPsAWPVBQvbOGVLeH2mcuVsCbULrIfV7aEb2/JCwMlWTgg==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
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
Subject: [PATCH 2/4] drm/rcar-du: dsi: Remove fixed PPI lane count setup
Date: Sun,  8 Jun 2025 16:24:48 +0200
Message-ID: <20250608142636.54033-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
References: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fw4w18fk8k79jxohxer6sc6ayydxazd3
X-MBO-RS-ID: 9697cff4300d79e2cd1

The R-Car DSI host is capable of operating in 1..4 DSI lane mode.
Remove hard-coded 4-lane configuration from PPI register settings
and instead configure the PPI lane count according to lane count
information already obtained by this driver instance.

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
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      | 2 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 5 +----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 7ab8be46c7f6..373bd0040a46 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -576,7 +576,7 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
 	udelay(10);
 	rcar_mipi_dsi_clr(dsi, CLOCKSET1, CLOCKSET1_UPDATEPLL);
 
-	ppisetr = PPISETR_DLEN_3 | PPISETR_CLEN;
+	ppisetr = ((BIT(dsi->lanes) - 1) & PPISETR_DLEN_MASK) | PPISETR_CLEN;
 	rcar_mipi_dsi_write(dsi, PPISETR, ppisetr);
 
 	rcar_mipi_dsi_set(dsi, PHYSETUP, PHYSETUP_SHUTDOWNZ);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index b3e57217ae63..cefa7e92b5b8 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -80,10 +80,7 @@
  * PHY-Protocol Interface (PPI) Registers
  */
 #define PPISETR				0x700
-#define PPISETR_DLEN_0			(0x1 << 0)
-#define PPISETR_DLEN_1			(0x3 << 0)
-#define PPISETR_DLEN_2			(0x7 << 0)
-#define PPISETR_DLEN_3			(0xf << 0)
+#define PPISETR_DLEN_MASK		(0xf << 0)
 #define PPISETR_CLEN			BIT(8)
 
 #define PPICLCR				0x710
-- 
2.47.2


