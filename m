Return-Path: <linux-renesas-soc+bounces-22259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64725B97E2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 02:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25102169A0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 00:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBE218B0A;
	Wed, 24 Sep 2025 00:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XbCTFrTY";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="b5DBDYEd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494402AD00
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 00:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758673839; cv=none; b=gAe+UB2RHeSYAjOhT0eY9tvCH67nDJA0Y5mMkErbXIhOyoiEjDdCthkTIE+kVUDPY4lUCYbStzWHqNm70HQkeLIqNZhhEgjmFU7RbTIc03nvLG3v+Nh9VCUEyorXZSuNanG1579fQ4U9XksLHclSj0AXXFVjg0GYP6qKvVKHjVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758673839; c=relaxed/simple;
	bh=XNH6UaicSKwrsNXnbl38xKyEiMHNZUqsUlHjoyaVB0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mdmar7vygfxyTHn0mhUcNJHuvcy9DGRFmsQ5vpwo0pbu5zPQ1DTTR3DxVVTg93JeAt3yOiDSiRIwWMT8O4+GeamPfvaHpAn3u2xcdtaAiPlXpAhKGHygS5NXhccaeky+rWfCNFvWuE1DiUyo4L+q7InM7GTdvvDDOYLcuzJSc2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XbCTFrTY; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=b5DBDYEd; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cWd6h31D3z9tdl;
	Wed, 24 Sep 2025 02:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1wVQTm9d+LpkqqYagWR1M5LwoiWlixUoZ3nFtTQaI4E=;
	b=XbCTFrTYBsdMgcV6NHzb/nz/suhAGNWLExEjLEkej/XZJnLXmiwwrUHwElOmpAznoULzuc
	Q+Ovkaht+s307zhV7HBGm6za8oaOygugrnAMp1TyM7smC970OmwCE1oo2QF67qTbBVzY41
	G7P9VSxzE2NThNQSs86mNNSeC8qZm32Z2B81SY4wmzEBkDhzzrQvugu637BJzj6WkNRNng
	WWoyYfwXMTLwYs2GnaPwv59WgDoGa5j9pzuCH7Iym3L9uZxy2DktBTZo18vVgbTJQ56n/e
	T0GYv6kV0DbyhHN3UZ9BII6aUQheGxqh7ZH0HCeTFxjBtbx85/IkzqFrkUvlug==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=b5DBDYEd;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758673834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1wVQTm9d+LpkqqYagWR1M5LwoiWlixUoZ3nFtTQaI4E=;
	b=b5DBDYEdxmBnHeOckZoFutx6GU8hp/+qfpBmf85G6urL0TQnZOVvParga+Cml2kdcfVB9S
	xZWrgsGLNqcLEm5dqzOen3QEF06uF9BtxFUBetA1l9IAzZFsxu+EVc/M9VNkCy/OpbcKC4
	XZ2k02sPArXCX1A1ecSrD+0/FIh+AUg36SfruJUli9TV5Vay28Fq0ZNcQfRM0F6f8AgpJI
	FBFy3GpIyxEbGpTe9nUfZjIA7Azjnb8o5Ag7chwQpKrnooCLkUpvY22GSDs8amcIyLUdmv
	xR1iv6/0vSfvAgbmx+BhyaVdtIwE8m5obzW2d3FfU6neg4ZIcrmimqPRSU0/Zw==
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
Subject: [PATCH v2 05/10] drm/rcar-du: dsi: Clean up CLOCKSET1 CLKINSEL macros
Date: Wed, 24 Sep 2025 02:28:22 +0200
Message-ID: <20250924003003.91039-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
References: <20250924003003.91039-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 693d3aa84d7ce7d35bc
X-MBO-RS-META: gcdpucynd86reaeqnoyenkntbbmopobg
X-Rspamd-Queue-Id: 4cWd6h31D3z9tdl

Introduce CLOCKSET1_CLKINSEL_MASK macro and remove bitshift from
values to make this bitfield usable with FIELD_PREP(). There are
no users of this bitfield, hence no updates to the DSI driver.

Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
consisten with the current style. Conversion to BIT() and GENMASK()
macros is done at the very end of this series in the last two patches.

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
NOTE: No functional change expected, this is a preparatory patch which
partly removes macros which evaluate to zeroes from rcar_mipi_dsi_regs.h .
The other patches in this series proceed with that job, piece by piece,
to make it all reviewable.
---
V2: Move FIELD_PREP() back into rcar_mipi_dsi_regs.h
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
index 00cf8e2351675..850f8e214a964 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
@@ -269,9 +269,10 @@
 #define CLOCKSET1			0x101c
 #define CLOCKSET1_LOCK_PHY		(1 << 17)
 #define CLOCKSET1_CLKSEL		(1 << 8)
-#define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
-#define CLOCKSET1_CLKINSEL_DIG		(1 << 2)
-#define CLOCKSET1_CLKINSEL_DU		(1 << 3)
+#define CLOCKSET1_CLKINSEL_MASK		(3 << 2)
+#define CLOCKSET1_CLKINSEL_EXTAL	FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 0)
+#define CLOCKSET1_CLKINSEL_DIG		FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 1)
+#define CLOCKSET1_CLKINSEL_DU		FIELD_PREP(CLOCKSET1_CLKINSEL_MASK, 2)
 #define CLOCKSET1_SHADOW_CLEAR		(1 << 1)
 #define CLOCKSET1_UPDATEPLL		(1 << 0)
 
-- 
2.51.0


